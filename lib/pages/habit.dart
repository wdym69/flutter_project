import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hp/pages/timer.dart';

class Habit extends StatelessWidget {
  const Habit({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Color col = Colors.greenAccent;
    final TextEditingController _workController = TextEditingController();
    final TextEditingController _breakController = TextEditingController();
    final TextEditingController _sessionController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text.rich(
            TextSpan(
              text: 'Start session', // text for title
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.greenAccent,
                fontFamily: 'Arial',),
            ),
          )),
        body: SingleChildScrollView(child: (Container(
          width: double.infinity,
          color: Colors.white,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(20),
          child: Column(
            children:  [
              const Text(
                "Work duration",
                style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Arial',),
              ),
              SizedBox(height: 10), // add a space between the text and the input field
              TextField(
                controller: _workController,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'Arial',),
                keyboardType: TextInputType.number,// set the keyboard type to number
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  // filled: true,
                  fillColor: Colors.black,
                  labelText: '(in minutes)',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(4.0)), borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(4.0)), borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Break duration",
                style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Arial',),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _breakController,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'Arial',),
                keyboardType: TextInputType.number,// set the keyboard type to number
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '(in minutes)',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(4.0)), borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(4.0)), borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 25),// add a space between the text and the input field
              const Text(
                "Sessions",
                style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Arial',),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sessionController,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'Arial',),
                keyboardType: TextInputType.number,// set the keyboard type to number
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  labelText: '(number of work sessions)',
                  labelStyle: TextStyle(color: Colors.black, ),
                  enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(4.0)), borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(4.0)), borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(height: 80),// add a space between the text and the input field
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: MyTimer(breakTime: _breakController.text, workTime: _workController.text, workSessions: _sessionController.text),
                      );
                    },
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.zero,
                    minimumSize: Size(150, 50),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white, width: 2.0),
                    )
                ),
                child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Arial',),
                ),
              ),

            ],

          ),
        )))));
  }
}
