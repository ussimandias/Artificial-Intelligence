(defrule first (initial-fact) => (printout t " " crlf) (printout t " Enter YES or NO to answer the questions" crlf) (printout t " " crlf) (printout t " LET US START" crlf) (printout t " " crlf) (printout t " Is this call by mistake?" crlf) (bind ?answer1 (read)) (assert (call-mistake ?answer1)))--********************************************************************************--(defrule call_mistake_no (call-mistake no) => (printout t " " crlf) (printout t " Is this true emergency?" crlf) (bind ?answer2 (read))(assert (true-emergency ?answer2))) --********************************************************************************--(defrule call_mistake_yes (call-mistake yes) => (printout t " " crlf) (printout t " Call is by mistake. Please disconnect the call." crlf))--********************************************************************************--(defrule true_emergency_yes (true-emergency yes) => (printout t " " crlf) (printout t " What is the name of the caller?" crlf) (bind ?answer3 (read)) (printout t " What is the exact street address or intersection of the caller?" crlf) (bind ?answer4 (read)) (printout t " What is the telephone number of the caller?" crlf) (bind ?answer20 (read)) (printout t " What kind of threat it is? Enter 1 for ‘life’ threat Enter 2 for ‘property’ damage Enter 3 for ‘fire accident’ threatEnter 4 for a ‘crime’" crlf) (bind ?answer6 (read)) (assert (threat ?answer6)))--********************************************************************************--(defrule true_emergency_no (true-emergency no) => (printout t " " crlf) (printout t " Please hold while the call is transferred to Non emergency line" crlf))--********************************************************************************--(defrule threat_life (threat 1) => (printout t " " crlf) (printout t " Are you the victim?" crlf) (bind ?answer7 (read)) (assert (victim ?answer7)))--********************************************************************************--(defrule victim_yes (victim yes) => (printout t " " crlf) (printout t "Ask the injured person what happened. Get brief description of the problem and send corresponding unit." crlf))--********************************************************************************--(defrule victim_no (victim no) => (printout t " " crlf) (printout t " Do you have physical access to the victim?" crlf)(bind ?answer8 (read)) (assert (physical_access ?answer8)))--********************************************************************************--(defrule physical_access_yes (physical_access yes) => (printout t " " crlf) (printout t " Is the victim conscious?" crlf)(bind ?answer19 (read)) (assert (victim_conscious ?answer19)))--********************************************************************************--(defrule victim_conscious_no(victim_conscious no)=> (printout t " " crlf) (printout t "Please follow the instructions.Check ABC’s and don’t move a person unless there is a life or death reason to do so. " crlf) (printout t "Airway  - do a head tilt, chin lift " crlf) (printout t "Breathing - look-listen-feel for breathing (For no more than 10 seconds) " crlf)(printout t "Circulation check for severe bleeding " crlf))--**********************************************************************--(defrule victim_conscious_yes (victim_conscious yes) => (printout t " " crlf) (printout t " Is it Severe allergic reaction?" crlf)(bind ?answer21 (read)) (assert (severe_allergy ?answer21)))--***************************************************************************--(defrule severe_allergy_yes (severe_allergy yes) => (printout t " " crlf) (printout t " For mild allergy symptoms, such as hay fever or hives, give an over-the-counter (OTC) antihistamine." crlf)(printout t " For stuffy nose, give an OTC decongestant." crlf)(printout t " For itchy, watery eyes, use OTC allergy eye drops." crlf)(printout t " For itchy allergic rash, apply cold compresses and an OTC hydrocortisone cream." crlf))--***************************************************************************--(defrule severe_allergy_no(severe_allergy no)=> (printout t " " crlf) (printout t " Is the victim chocking or can’t able to breathe?" crlf) (bind ?answer18 (read)) (assert (victim_chocking ?answer18)))--***************************************************************************--(defrule victim_chocking_yes (victim_chocking yes) => (printout t " " crlf) (printout t "Perform Heimlich maneuver on the chocking person. Please follow the following steps" crlf)(printout t "Stand behind the person, wrap your arms around the waist, and tip the person slightly forward " crlf) (printout t "Make a fist with one hand and place it slightly above the navel. " crlf) (printout t "Grasp your fist with your other hand and press forcefully into the abdomen with quick upward thrusts, using force as if you were attempting to lift the person up. " crlf) (printout t "Continue the thrusts until the foreign body is dislodged. " crlf)) --*************************************************************************--(defrule victim_chocking_no(victim_chocking no)=> (printout t " " crlf) (printout t " Is there any seizures?" crlf) (bind ?answer22 (read)) (assert (victim_seizures ?answer22)))--****************************************************************************--(defrule victim_seizures_yes (victim_seizures yes) => (printout t " " crlf) (printout t "Please follow the following instructions until the unit arrives " crlf)(printout t "Cushion head with pillow or clothing, move any objects away, loosen clothing from neck and waist " crlf))--**********************************************************************************--(defrule victim_seizures_no(victim_seizures no)=> (printout t " " crlf) (printout t " Is there any Diabetic Emergency?" crlf) (bind ?answer23 (read)) (assert (Diabetic_Emergency ?answer23)))---******************************************************************************--(defrule Diabetic_Emergency_yes (Diabetic_Emergency yes) => (printout t " " crlf)(printout t "If conscious give something to eat or drink with sugar " crlf))--*******************************************************************************--(defrule Diabetic_Emergency_no(Diabetic_Emergency no)=> (printout t " " crlf) (printout t " Is there any poisoning or allergic reaction?" crlf) (bind ?answer24 (read)) (assert (poisoning_allergy ?answer24)))--****************************************************************************--(defrule poisoning_allergy_yes (poisoning_allergy yes) => (printout t " " crlf)(printout t "Move the victim away from source of poisoning, do not induce vomiting unless directed to " crlf))--********************************************************************************--(defrule poisoning_allergy_no(poisoning_allergy no)=> (printout t " " crlf) (printout t " Is there any heat stroke?" crlf) (bind ?answer25 (read)) (assert (heat_stroke ?answer25)))--**********************************************************************************--(defrule heat_stroke_yes (heat_stroke yes) => (printout t " " crlf)(printout t "cool victim, circulate air, loosen clothing, monitor breathing and pulse. If conscious provide cool water to drink. " crlf))--**********************************************************************************--(defrule threat_property (threat 2) => (printout t " " crlf) (printout t " Enter 1 for ‘vehicle’ damage or 2 for ‘building’ damage" crlf) (bind ?answer9 (read)) (assert (threat_property ?answer9)))--*********************************************************************************--(defrule threat_property_vehicle(threat_property 1) => (printout t " " crlf) (printout t " What is the Vehicle No?" crlf) (bind ?answer13 (read))(printout t " What is the color of the vehicle?" crlf)(bind ?answer14 (read))(printout t " What kind of vehicle it is?" crlf)(bind ?answer15 (read))(printout t " How many people are there in the vehicle?" crlf)(bind ?answer16 (read)))--*********************************************************************************--(defrule threat_property_building(threat_property 2) => (printout t " " crlf) (printout t " Do you know the exact location of the building." crlf)(bind ?answer17 (read))(assert (address ?answer17)))--*********************************************************************************--(defrule address_yes(address yes) => (printout t " " crlf) (printout t " Report the following address. Exit the building quickly and safely, closing the door behind you. NEVER use the ELEVATORS – always use the stairs. send unit" crlf))--********************************************************************************--(defrule address_no(address no) => (printout t " " crlf) (printout t " Ask the following details. Get the intersection or the street address. send unit" crlf))--*******************************************************************************--(defrule threat_fire (threat 3) => (printout t " " crlf) (printout t " Does flames visible?" crlf) (bind ?answer10 (read)) (assert (flames ?answer10)))--**********************************************************************************--(defrule flames_yes(flames yes) => (printout t " " crlf) (printout t " Find out if there are any injuries and give basic first aid precautions before the unit is reached. Use cold running water to cool the burn for 20 minutes. Keep the person warm with extra clothes or a blanket on the unburnt parts of the body. " crlf))--********************************************************************************--(defrule flames_no(flames no) => (printout t " " crlf) (printout t " Obtain brief description of the situation and give basic first aid precautions while the unit is reached.Do not use water to extinguish an electric fire as it could give you a shock. Use dry powder fire extinguishers." crlf))--****************************************************************************--(defrule threat_crime (threat 4) => (printout t " " crlf) (printout t " Is there any weapons involved?" crlf) (bind ?answer11 (read)) (assert (weapon ?answer11)))--*****************************************************************************--(defrule weapon_no(weapon no) => (printout t " " crlf) (printout t " Report the following. Location of incident, describe the person or person’s clothing and physical appearance, observe the person’s direction of travel and description of vehicle. send unit" crlf))--******************************************************************************--(defrule weapon_yes(weapon yes) => (printout t " " crlf) (printout t " Are you the victim of crime?" crlf) (bind ?answer12 (read)) (assert (crime_victim ?answer12)))--*****************************************************************************--(defrule crime_victim_yes(crime_victim yes) => (printout t " " crlf) (printout t " Give following precautions and send the unit.Do not attempt to apprehend or interfere with the criminal in any way, except in the case of self-defense.Do not interfere with those causing the disturbance, nor with law enforcement authorities on the scene." crlf))