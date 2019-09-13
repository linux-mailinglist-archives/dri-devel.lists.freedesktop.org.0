Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184ABB18D9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA3E6EE9B;
	Fri, 13 Sep 2019 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092005011.outbound.protection.outlook.com [40.92.5.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B0E6EE77
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 04:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjpHxNl1i3KmgNwH1NmCcse48hq+Qn7NobqysyvpqnZ77CZGpuwFiuT0nagEZvyIvPKCoGpjnvLH5CoLkxJPY0W6DscKKd/uGMSTshSTTA3f+0+LJOONloelGPJ2MBeC+t0i8LSdxaLodqG/a7vaE/cP8uYgXTz3b1UstK4ZILSRsmZfWqZgzF0lNsqVOWF62Fsv4RtdwJRhqLC2N6PgSU6KNVlLl9oAnjI16Mnd+6rrTZ5uXvSVPVF92Rq+v5825Y+PjAz2HiSBox1pgTqrs6q1OO13hIhkhbHb/5bMF4GcI068c12xeglhnCW1BHqDqlrVeEskO0S7m7fOtaOeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V/YPePP4vjTN4MygErA1ABeN99YtFHrT22ifFkGY/M=;
 b=nKuHOYXjKUrN9Gn99tfc/XjbxEcShdna2S+p1fZoUteJ7p5JTX6E0MZupKjELaPsWjlnVv9VM3jvtpUMlnRH0TbfQO1/HDCjT82jgQMr1Z5sM/9hObLJJvEAnS28LmA77Nz+LjDbKg1bn6eB3i7cTkEKWDoEAXPXmVX5OsiEctt1XcsHtPo9sNiiukuzkOoJ9iH1Mr43djtGe+sXhs8Xn//8QzvR8u+rEseXLSPQ5ogee2pKLjkwHQD2EuT4l+bFzYIPnTt7jZXjm05zRjMeN2WdCvpGoKhgKgMJ3sDPzb7hFcPU+sW2yjQ2XsgVWtE7kdOPw/LDAQIpEFs/vt6isA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
 (10.152.76.51) by BL2NAM02HT178.eop-nam02.prod.protection.outlook.com
 (10.152.77.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.17; Fri, 13 Sep
 2019 04:21:44 +0000
Received: from MN2PR04MB6125.namprd04.prod.outlook.com (10.152.76.56) by
 BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17 via Frontend Transport; Fri, 13 Sep 2019 04:21:44 +0000
Received: from MN2PR04MB6125.namprd04.prod.outlook.com
 ([fe80::a41f:653b:434b:4b37]) by MN2PR04MB6125.namprd04.prod.outlook.com
 ([fe80::a41f:653b:434b:4b37%6]) with mapi id 15.20.2263.021; Fri, 13 Sep 2019
 04:21:44 +0000
From: "zhangn1985@outlook.com" <zhangn1985@outlook.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: image size is wrong in EDID, how to use EDID quirks
Thread-Topic: image size is wrong in EDID, how to use EDID quirks
Thread-Index: AQHVaenWnMp448ArckebpGVPnCTYLw==
Date: Fri, 13 Sep 2019 04:21:44 +0000
Message-ID: <MN2PR04MB61259770991EDF5573603645CDB30@MN2PR04MB6125.namprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:AEBE20AE3177C1E0F8F69E8B8C2650B78E8C0080C3947A28B1D94604E505DC21;
 UpperCasedChecksum:E0439E96681D83B2723A90926E9EDD0DA0DEC4DD420C6656F8429ADAA99D33B0;
 SizeAsReceived:6570; Count:40
x-tmn: [MTcPdcoDpW3S+9//Mkdw7kVTBrvCcI7g]
x-ms-publictraffictype: Email
x-incomingheadercount: 40
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:BL2NAM02HT178; 
x-ms-traffictypediagnostic: BL2NAM02HT178:
x-microsoft-antispam-message-info: CyJfnO0gMHPeDvK4br+NIZtck7J3v9tLY3BH6R+rHxGqa2B5Xkm9r4VpOkiuQCdcYWBnrWPn5VenaYU0LwaqS0fQXJe5anghMOvWWlUEcyj4vgr5tIX+GditEbQol32tZ7/W+JCPZxqudm2QaOIRmogdUqrxhXw0V3/vQKOvT1P4J6/MT2qmYic2BVDT8p80
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a0446330-c8bb-48ea-b343-08d73801e2a6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 04:21:44.3913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT178
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V/YPePP4vjTN4MygErA1ABeN99YtFHrT22ifFkGY/M=;
 b=U4pVWaYb2yMPb6MhGf6utp45W/JDhnBcy43xcXVUwF3mF5Z/VLc0JBBwYzJ2uRizeDZcm1sEfveVMdsn+GO+pKJE7FGkJEQS3IRFLW7Ng5QrVsxdxhmCutufyPmMflZF+HojnECYVzncA+5lOzKwe2GSms4R6HIBPxlcPF69bT37g6N/LEFx3/C6wSkRyQ5qW0rspvInEXnPkrDDlSevAYxTh2J/F7OABPH2lS7oEvx0Zq4L3u7Cj837NFEw8SWbscGg9pQnaAWvMVQwyTvEkC0r2jq/hU5nL1klhNuZNLvBdicCcf+sXPeJQaKPVmcYN8iBk7khog+SVGw+NLzthg==
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
Content-Type: multipart/mixed; boundary="===============1129094938=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1129094938==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_MN2PR04MB61259770991EDF5573603645CDB30MN2PR04MB6125namp_"

--_000_MN2PR04MB61259770991EDF5573603645CDB30MN2PR04MB6125namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Dear developers

I have a Samsung 40=92 HDMI TV, which has wrong EDID.

The actaul size of this TV is 40=92 (88cm*49cm), but in EDID the size is 49=
=92 (106*63cm)

Thus makes image size is larger than screen, both in console and desktop.

In order to correct, use edid firmware is a chioce.
But I want to use edid quirk to fix the size.

Should I also change timing accordingly?

BR.
Ning.



--_000_MN2PR04MB61259770991EDF5573603645CDB30MN2PR04MB6125namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-CN">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Dear=
 developers<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">I ha=
ve a Samsung 40=92 HDMI TV, which has wrong EDID.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">The =
actaul size of this TV is 40=92 (88cm*49cm), but in EDID the size is 49=92 =
(106*63cm)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Thus=
 makes image size is larger than screen, both in console and desktop.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">In o=
rder to correct, use edid firmware is a chioce.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">But =
I want to use edid quirk to fix the size.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Shou=
ld I also change timing accordingly?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">BR.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Ning=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:SimSun"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_MN2PR04MB61259770991EDF5573603645CDB30MN2PR04MB6125namp_--

--===============1129094938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1129094938==--
