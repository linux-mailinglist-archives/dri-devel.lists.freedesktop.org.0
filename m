Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51938563
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B599089A8C;
	Fri,  7 Jun 2019 07:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Thu, 06 Jun 2019 08:12:53 UTC
Received: from mx1.bachmann.info (mx1.bachmann.info [185.67.228.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB041895C4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:12:53 +0000 (UTC)
IronPort-SDR: N44m5eoQq8/vvDYwKA+6vjCWd8JXboxo+GgWh3mlzwQOoUJGvuJPjRXs4OgRoB2fGDmSRlx4ze
 3LlgkxoWPQcg==
X-IronPort-AV: E=Sophos;i="5.63,558,1557180000"; d="scan'208,217";a="234750"
Received: from atfkex01.bachmann.at (10.10.10.61) by atfkex01.bachmann.at
 (10.10.10.61) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 10:05:38 +0200
Received: from atfkex01.bachmann.at ([fe80::6079:2a3f:2cd5:6f85]) by
 atfkex01.bachmann.at ([fe80::6079:2a3f:2cd5:6f85%12]) with mapi id
 15.00.1473.003; Thu, 6 Jun 2019 10:05:37 +0200
From: MOESL.Hannes <Hannes.MOESL@bachmann.info>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: drm/imx: 'flip_done timed out' on i.MX6D+ and kernel v4.19.48
Thread-Topic: drm/imx: 'flip_done timed out' on i.MX6D+ and kernel v4.19.48
Thread-Index: AdUcOvIxGhhvURkzSZGhESfGVauyfA==
Date: Thu, 6 Jun 2019 08:05:37 +0000
Message-ID: <67694ebedbdb46ab8a0f44fbfffca9bf@atfkex01.bachmann.at>
Accept-Language: de-AT, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.11.20.62]
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============2104197966=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2104197966==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_67694ebedbdb46ab8a0f44fbfffca9bfatfkex01bachmannat_"

--_000_67694ebedbdb46ab8a0f44fbfffca9bfatfkex01bachmannat_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We observed the following error on an i.MX6D+ CPU during start of X. As a r=
esult, the screen goes blank.

-------
[ 3599.200886] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:30:=
crtc-0] flip_done timed out
[ 3610.080885] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:=
30:crtc-0] flip_done timed out
[ 3620.320849] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNE=
CTOR:45:LVDS-1] flip_done timed out
[ 3630.560864] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE=
:28:plane-0] flip_done timed out
-------

The error happens quite randomly but it can be reliably reproduced by repea=
tedly restarting X . On our system, the error occurs somewhere between 80 a=
nd 300 restarts of X.
We first observed the issue using kernel 4.14.123. Updating to 4.19.48 did =
not solve the issue unfortunately.

Cheers,
Hannes Moesl


--_000_67694ebedbdb46ab8a0f44fbfffca9bfatfkex01bachmannat_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Verdana",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Verdana&quot;,sans-serif">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We observed the following error=
 on an i.MX6D&#43; CPU during start of X. As a result, the screen goes blan=
k.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[ 3599.200886] [drm:drm_atomic_=
helper_wait_for_flip_done] *ERROR* [CRTC:30:crtc-0] flip_done timed out<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[ 3610.080885] [drm:drm_atomic_=
helper_wait_for_dependencies] *ERROR* [CRTC:30:crtc-0] flip_done timed out<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[ 3620.320849] [drm:drm_atomic_=
helper_wait_for_dependencies] *ERROR* [CONNECTOR:45:LVDS-1] flip_done timed=
 out<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[ 3630.560864] [drm:drm_atomic_=
helper_wait_for_dependencies] *ERROR* [PLANE:28:plane-0] flip_done timed ou=
t<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The error happens quite randoml=
y but it can be reliably reproduced by repeatedly restarting X . On our sys=
tem, the error occurs somewhere between 80 and 300 restarts of X.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We first observed the issue usi=
ng kernel 4.14.123. Updating to 4.19.48 did not solve the issue unfortunate=
ly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Cheers,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hannes Moesl<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_67694ebedbdb46ab8a0f44fbfffca9bfatfkex01bachmannat_--

--===============2104197966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2104197966==--
