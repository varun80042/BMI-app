import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/main2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  dynamic textHeight = TextEditingController();
  dynamic textWeight = TextEditingController();
  dynamic height = 0;
  dynamic weight = 0;
  dynamic bmi = 0;
  dynamic result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        height: 628,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/c7/91/65/c791658868d3c71a46dccc8ae8238cec.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text('\n'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 25.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  border: Border.all(
                    width: 5,
                    color: Colors.white,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 8.0),
                        child: Center(
                            child: Text(
                          'Height (cm)',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Courier',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        onChanged: (text) => {},
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              (RegExp(r'^\d+\.?\d{0,2}')))
                        ],
                        controller: textHeight,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.red,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text('\n\n'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 25.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  border: Border.all(width: 5, color: Colors.white),
                ),
                child: Column(
                  children: [
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 8.0),
                        child: Center(
                          child: Text(
                            'Weight (kg)',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Courier',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: FloatingActionButton.small(
                              backgroundColor: Colors.red,
                              onPressed: () {
                                int txt = int.parse(textWeight.text) + 1;
                                textWeight.text = txt.toString();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  (RegExp(r'^\d+\.?\d{0,2}')))
                            ],
                            controller: textWeight,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.red,
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                            child: FloatingActionButton.small(
                              backgroundColor: Colors.red,
                              onPressed: () {
                                int txt = int.parse(textWeight.text) - 1;
                                textWeight.text = txt.toString();
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Text('\n\n'),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondRoute(
                                result: result,
                              )),
                    );
                    setState(() {
                      height = double.parse(
                          (double.parse(textHeight.text).toStringAsFixed(2)));
                      weight = double.parse(
                          (double.parse(textWeight.text).toStringAsFixed(2)));
                      bmi = ((weight) / (height * height) * 10000)
                          .toStringAsFixed(2);
                      result = double.parse(bmi);
                    });
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
