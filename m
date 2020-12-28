Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814B2E35BF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47C3897FD;
	Mon, 28 Dec 2020 10:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Mon, 28 Dec 2020 09:57:00 UTC
Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net
 [23.83.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388E789708
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 09:57:00 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authsender|ceo@prox.sg
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id D6E337E21C3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 09:41:55 +0000 (UTC)
Received: from nl-srv-smtpout3.hostinger.io
 (100-100-138-63.trex.outbound.svc.cluster.local [100.100.138.63])
 (Authenticated sender: hostingeremail)
 by relay.mailchannels.net (Postfix) with ESMTPA id A8A287E2192
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 09:41:54 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authsender|ceo@prox.sg
Received: from nl-srv-smtpout3.hostinger.io ([UNAVAILABLE]. [145.14.159.243])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.11); Mon, 28 Dec 2020 09:41:55 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authsender|ceo@prox.sg
X-MailChannels-Auth-Id: hostingeremail
X-Power-Dime: 62431ef670e2bdde_1609148515690_1502082654
X-MC-Loop-Signature: 1609148515690:2854138375
X-MC-Ingress-Time: 1609148515690
Received: from Mike (unknown [222.164.27.162])
 (Authenticated sender: ceo@prox.sg)
 by nl-srv-smtpout3.hostinger.io (smtp.hostinger.com) with ESMTPSA id
 7E9CE31C2C5D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=prox.sg;
 s=hostingermail-a; t=1609148512;
 bh=DkF7Wjg8ekI5Ca2NloSAqQT/y1T2Kw/qQjlWn2QaMgk=;
 h=From:To:Cc:Subject:Date;
 b=e7N7RuOgbM+bjRLN8zCQckdL2iXZrI+LRS5bgxKxIPNkjmPaGJb+fE1/XB/sbwkuZ
 XP5skBIndemBw+OAphCdziUxQZdCCKwtaivTWrODVA2W+UKXuwbHXG7d3XiJWpmMFt
 vGi4CFdD3ihUCwLYXwIEFJzIqda9hxe73ub+7U/py2DQ05P9udzHXfgeLA5YsoKomw
 mbt8tb3mDuzhDwxFOURTn30wHk09szNPyh53dewqugpkUHpAh8VMw7PFr5Sp9zhriZ
 SirVM6Kc/0H0Db+3+OQ5L7CW4hvwLvNL7qGDbfWNW5uI7rm3Cy2IGuWp8VBCbiv9Ts
 ym3vqm+dJhSSg==
From: <ceo@prox.sg>
To: <dri-devel@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>
Subject: MT9M114 camera sensor + iMX6ULL
Date: Mon, 28 Dec 2020 17:41:50 +0800
Message-ID: <007c01d6dcfd$ac1f5720$045e0560$@prox.sg>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adbc/A30t/OeBLQ3RoyzUI2kWB7xIQ==
Content-Language: en-sg
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1427657258=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multipart message in MIME format.

--===============1427657258==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_007D_01D6DD40.BA42E540"
Content-Language: en-sg

This is a multipart message in MIME format.

------=_NextPart_000_007D_01D6DD40.BA42E540
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Laurent,

Straight to the point. I have a custom iMX6ULL board (based on NXP EVK) with
MT9M114 connected via parallel CSI, everything is fine except the camera -
my engineer doesn't have relevant experience.

Would you make it alive? If yes, please propose desired level of cooperation
and estimated cost.

I have hardware ready to courier to you (USB, SD-card, Ethernet and UART
debug are available and proven work), and I also have a Ubuntu PC with
connected board at my facility ready for remote access and development. 

---
Kind regards,
Koloboff Michael
CEO


PROX SG Pte Ltd
(Reg/GST No. 200917259N)
39 Woodlands Close
#03-32 Mega@Woodlands
Singapore 737856
HP/WA.: +65 82969195
email:  <mailto:ceo@prox.sg> ceo@prox.sg

www.prox.sg

 


------=_NextPart_000_007D_01D6DD40.BA42E540
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-SG =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal>Hi Laurent,<o:p></o:p></p><p =
class=3DMsoNormal>Straight to the point. I have a custom iMX6ULL board =
(based on NXP EVK) with MT9M114 connected via parallel CSI, everything =
is fine except the camera &#8211; my engineer doesn&#8217;t have =
relevant experience.<o:p></o:p></p><p class=3DMsoNormal>Would you make =
it alive? If yes, please propose desired level of cooperation and =
estimated cost.<o:p></o:p></p><p class=3DMsoNormal>I have hardware ready =
to courier to you (USB, SD-card, Ethernet and UART debug are available =
and proven work), and I also have a Ubuntu PC with connected board at my =
facility ready for remote access and development. <o:p></o:p></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'>---<br>Kind regards,<br>Koloboff =
Michael<br>CEO<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'><br>PROX SG Pte Ltd<br>(Reg/GST No. =
200917259N)<br></span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'>39 Woodlands Close</span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'><br></span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'>#03-32 Mega@Woodlands</span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'><br>Singapore </span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'>737856</span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'><br>HP/WA.: +65 82969195<br>email: <a =
href=3D"mailto:ceo@prox.sg"><span =
style=3D'color:#0563C1'>ceo@prox.sg</span></a><o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black;mso-=
fareast-language:EN-SG'>www.prox.sg</span><span =
style=3D'mso-fareast-language:EN-SG'><o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_007D_01D6DD40.BA42E540--


--===============1427657258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1427657258==--

