Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02AC9BC6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 12:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986856E0EA;
	Thu,  3 Oct 2019 10:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069038.outbound.protection.outlook.com [40.92.69.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85C16E0EA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 10:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBjERe7xYQlyh73IQ1B5bOIsxUQcmeRVXQW34ETtyOK5Vit+8yB7ifoDD3sY4sgcp1dtG1J19UadS3nRMHAJwSWyqXmBWNhjoNXpWJXlsBxUxu0QQI32LiDaHS5wj13KuDK8Yo9PQQcUKp1yuDVRWnQ07wsQdGII9J35LmebU1U2OE2bffDM9U9wbCuuzWFYU5QMQti62M3CkwpQUtl+pj0JGdAsrNJyrKjvRsYVVCsefjaNjHGfYtiMW18vpon6+4QJ6Q1eb02SnkKaf6FQShSwd3LzQhn04VOBDNy4yRiP03mXNxOkf7mTk+AUELzWcBpRAMds4Sj/gpOyt8r3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq7L/PafIckjzNicPWNb3eWJHGPQGQ0nMqWqHylArgE=;
 b=jes5QCgSzEv/ul5sWLMqQKbwBThiGzLkfHuPNr8+mIFDgNPBf5+y+4ZJLQSGx/gjDN5zPB805K4ANL4LiOJNWhnQgU0mVh7gKMRiU9QzKPRcMRc6vvmCsLzBsKAcFk0CEh6VvviRUTOJOTxLurnQBVG43cTlk6oMIgcoArbH10ZVI/Q6z13TF0H2BDWL3uNSIVH6QnUAbkD8Tb7PnX8AEUdRf6TCLXwUYleq2ApfGwBsgviCocz5bDp3MLuc2MOiATs0XOC75aSej7dn2K8goNoK/wgpv/hOw13rmb2umX6Zzp9feoOp8P3BAipebVPXlAbh7fDelVbZf2lN18ivTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR02FT027.eop-EUR02.prod.protection.outlook.com
 (10.152.10.55) by HE1EUR02HT231.eop-EUR02.prod.protection.outlook.com
 (10.152.11.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.20; Thu, 3 Oct
 2019 10:10:54 +0000
Received: from DB8PR09MB4439.eurprd09.prod.outlook.com (10.152.10.59) by
 HE1EUR02FT027.mail.protection.outlook.com (10.152.10.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 10:10:54 +0000
Received: from DB8PR09MB4439.eurprd09.prod.outlook.com
 ([fe80::3026:7d4e:9d73:1921]) by DB8PR09MB4439.eurprd09.prod.outlook.com
 ([fe80::3026:7d4e:9d73:1921%2]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 10:10:54 +0000
From: evan chime <evanchime@outlook.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Outreachy applicant - "dri-devel aka kernel GPU subsystem" Project
Thread-Topic: Outreachy applicant - "dri-devel aka kernel GPU subsystem"
 Project
Thread-Index: AQHVedFviTficpbCHk6BW6Vigh+B9g==
Date: Thu, 3 Oct 2019 10:10:54 +0000
Message-ID: <DB8PR09MB4439183999EB2427EDE5CCE1AA9F0@DB8PR09MB4439.eurprd09.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:594BF68421B2CD673E50E74A1BDDBD3688E48ECF5B3059BD4E663108ECB893BE;
 UpperCasedChecksum:0983A84FD5122BBE7E7B5770AEECC27B0A7E3D1DE142D5B3D0F12A9499869B12;
 SizeAsReceived:6827; Count:41
x-tmn: [ZZ2JbooLUX+KKAqtC8AlGhP9ZGR69LxP6R2QhE76R+u8/Ag7+WI6T8cmZtwgdSMV]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: HE1EUR02HT231:
x-ms-exchange-purlcount: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5L8hBsC53Y4NzX1kgAFTt6WU2E/hJtioH9vX9Fss6olWVQnZiQHpm6p4Qw6RKesiwIOp/EK9cDaBOL6MUGkm6axFSD/Ab00Wu4Yg6jYaiAkyIqtpP0QjVDu3k8VrFiZHlIin6D4uqx5xwtkIOk9g71wDg3Wp2dS6Wjb+7aWIxN4sgK5dN9EBa5y9jydWtwp7oSPBtCQT9QbU2XZnJtIubBMgqYu9zuH0ySKPFmPtGm0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c6d100-2e9d-4e31-eed6-08d747e9fa1d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 10:10:54.4061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq7L/PafIckjzNicPWNb3eWJHGPQGQ0nMqWqHylArgE=;
 b=K2TLKaGKeYsOdVtikpxvMMxHZOqirqYzMKkBW02r6H3CMVTDHaqs18uikbCXPbvR+HW0racza1gj3F9NvhW56kDd/qYtsQP1b6m521S5MxslNCmV9ZLiuLXuflJ5bkHw54h+HqZSuo0Dz/7US7zujh/64/IXxKwmKPl3GZnRZBHZ/TogpcMz7MAef5TaRFea605wnBXz2HE6lLOqBQbP6piR1j4Xxuiu0gAto5MPENCBHcVnUOYqHGBFpScAnUQ1Krvaf6sWCaw3mkuuW371jo9mmy5BFyI1gEGLHz0l5zFAroVqjzvOSCulpqX+V4kbNVh1r9UoLpetyeNaMqtJPg==
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
Content-Type: multipart/mixed; boundary="===============1519310436=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1519310436==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB8PR09MB4439183999EB2427EDE5CCE1AA9F0DB8PR09MB4439eurp_"

--_000_DB8PR09MB4439183999EB2427EDE5CCE1AA9F0DB8PR09MB4439eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello everyone

Am Evan Chime, an Outreachy applicant for the December to march Outreachy i=
nternship round. Am excited to be here and will like to let you guys know t=
hat any help I receive will be highly appreciated.

Looking forward to working with you guys

Kind regards
Evan

Get Outlook for iOS<https://aka.ms/o0ukef>

--_000_DB8PR09MB4439183999EB2427EDE5CCE1AA9F0DB8PR09MB4439eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	{font-family:HelveticaNeue;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"line-height:150%">Hello everyone</p>
<p class=3D"MsoNormal" style=3D"line-height:150%"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"line-height:150%">Am Evan Chime, an Outreac=
hy applicant for the December to march Outreachy internship round. Am excit=
ed to be here and will like to let you guys know that any help I receive wi=
ll be highly appreciated.
</p>
<p class=3D"MsoNormal" style=3D"line-height:150%"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"line-height:150%">Looking forward to workin=
g with you guys</p>
<p class=3D"MsoNormal" style=3D"line-height:150%"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"line-height:150%">Kind regards</p>
<p class=3D"MsoNormal" style=3D"line-height:150%">Evan<span style=3D"font-f=
amily:&quot;HelveticaNeue&quot;,serif;color:#333333"><o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:150%"><span style=3D"font-famil=
y:&quot;HelveticaNeue&quot;,serif;color:#333333"><o:p>&nbsp;</o:p></span></=
p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:150%"><span style=3D"font-famil=
y:&quot;HelveticaNeue&quot;,serif;color:#333333">Get
<a href=3D"https://aka.ms/o0ukef">Outlook for iOS</a><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_DB8PR09MB4439183999EB2427EDE5CCE1AA9F0DB8PR09MB4439eurp_--

--===============1519310436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1519310436==--
