Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D003B3596
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA946E852;
	Mon, 16 Sep 2019 07:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-oln040092014107.outbound.protection.outlook.com [40.92.14.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCB36F4BF
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 02:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTJZM22UL8SixCH4egp7oWDhYcQPcGBLk4yxKunl+dcckSBX3TL1FF685clPWOY7WeZ8Fmpryc1/Vr/eUogwxZSn2IFw0o/GJGg5i0n0RvLmWalsS0sZ1WnXWO0fLo+rS0+TEu9a3CabUsOhOEtn11mG8nGB5DWjKpFfoVxzJuCJJnV1B+ohwkOozCfHriiJOfdHDC9aHiBhs6UKn61U94kOZSzRv4rbhP42OjSg4eafdjhmx4fcEyI00KZvFAXsXJ7ppVIIN73JhMDl82FHSMWVUGW672OROpi38xjA6vLmNAqP4AAbL2CbCRjk2KTLnR2248uT8HNMim/BgXnk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLfIJrPTdJRJfnDejIUxXbp38gqRY6gUK8X0byeTJFM=;
 b=E+wiOl9AyuKGNKhnvfQTYH7ws9I2G6tcgw9hxjNX0QxZV6UW6C3bcKuBkwkZB3HKyebl2GnQbBqQNNXoNaSoowaqoR92oYopDJjAoXif3WI/SevNAfKRt7yIsVuk8rmbgOEGpByj5KdHPJg0bIk1o6JLxzMB3Hqxzoo3KIZ+oMAr2dM6VxoqQno1l00kltixYVbC03Xo+HzDeXyCyfFIHs65VeidvR8w2e/20bk/G3unhDxvACApC0sz8ITm/2sFQTdQHAtDz27+jAEUOqg0/aMYSeK7grJEZG81lE1uPKGOIcqmVoCcVo002StBpp70P/lWs958eH/k3oOjc69viw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM3NAM05FT064.eop-nam05.prod.protection.outlook.com
 (10.152.98.60) by DM3NAM05HT172.eop-nam05.prod.protection.outlook.com
 (10.152.99.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.10; Sat, 14 Sep
 2019 02:59:11 +0000
Received: from MN2PR04MB6125.namprd04.prod.outlook.com (10.152.98.53) by
 DM3NAM05FT064.mail.protection.outlook.com (10.152.98.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.10 via Frontend Transport; Sat, 14 Sep 2019 02:59:11 +0000
Received: from MN2PR04MB6125.namprd04.prod.outlook.com
 ([fe80::a41f:653b:434b:4b37]) by MN2PR04MB6125.namprd04.prod.outlook.com
 ([fe80::a41f:653b:434b:4b37%6]) with mapi id 15.20.2263.021; Sat, 14 Sep 2019
 02:59:11 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: Adam Jackson <ajax@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: =?gb2312?B?tPC4tDogaW1hZ2Ugc2l6ZSBpcyB3cm9uZyBpbiBFRElELCBob3cgdG8gdXNl?=
 =?gb2312?Q?_EDID_quirks?=
Thread-Topic: image size is wrong in EDID, how to use EDID quirks
Thread-Index: AQHVaenWnMp448ArckebpGVPnCTYL6cp0hSAgACqmH4=
Date: Sat, 14 Sep 2019 02:59:11 +0000
Message-ID: <MN2PR04MB61259DE54D7F5AEB0AAB6E25CDB20@MN2PR04MB6125.namprd04.prod.outlook.com>
References: <MN2PR04MB61259770991EDF5573603645CDB30@MN2PR04MB6125.namprd04.prod.outlook.com>,
 <9ec132ccb19458e369ae55b60471ffbebe401321.camel@redhat.com>
In-Reply-To: <9ec132ccb19458e369ae55b60471ffbebe401321.camel@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:AEC514C0534DCBB9E6627EFEAA95FDFCF6DE2EA9170972F0A571317FD3F0595E;
 UpperCasedChecksum:F2EA8710C990F974ABB02C905F00E55FE0F2165DD09B19B1510FAA57AB4D627C;
 SizeAsReceived:6892; Count:42
x-tmn: [ezS6l1dNqlyBVKYFyzP95bS04IndRbpk]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:DM3NAM05HT172; 
x-ms-traffictypediagnostic: DM3NAM05HT172:
x-microsoft-antispam-message-info: 0USspz4j9JRees/wKvKWGO4ws9Km5Z1UXHXLnMDQOog1e2pAFBwqNK/84gpYa+WE7cBNlqeOVbbI/SNaP8lIaDx8XBtlZkd4IxrVbumSuqmnJ+602fMiEDzfm7wuDmMmB63wMIz2BTehh3FdoD/joyBBSE+sVDd77c6vXdW0AhD/6TsvOOucv+iS3quQ05qJ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c8eb2080-e1e0-4174-5c4d-08d738bf84b4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2019 02:59:11.1776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3NAM05HT172
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLfIJrPTdJRJfnDejIUxXbp38gqRY6gUK8X0byeTJFM=;
 b=WflmMiSb+tXqCgNNUbTLo2E5lW5mEPgTlzWFrdHZGD5J+C3q+ytAcbb2+jCPoTZ1/OMmKGhS6AXBG9JUyf8wIhWcR6LgB/X8PkH38BaxZUep/PgVV283xiD7+qTwUD3KVm+6pmszb/8tqFDNYc0uShoGwdR7DhmUijsbaunE53yoD0cPaas04c0vALqHWqhVvI8kKepDNnnVBBi+kDVxFAS0hZy2m0Jom/dDYgRdU3UtDzd0MRu6qifApvrG9lmXPRx9OAaTT/eBz3ZMBrQeh/za8XchYJRRSpPyagHLFRnSE+ZP/JcjRSWsB1qiHc/fFNknrZ/AfjrMGeQSoDW/KA==
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
Content-Type: multipart/mixed; boundary="===============0036346590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0036346590==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_MN2PR04MB61259DE54D7F5AEB0AAB6E25CDB20MN2PR04MB6125namp_"

--_000_MN2PR04MB61259DE54D7F5AEB0AAB6E25CDB20MN2PR04MB6125namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmsgeW91LCBhZnRlciBhZGp1c3QgVFYgaW1hZ2Ugc2V0dGluZ3MsIHNjcmVlbiBkaXNwbGF5
IG5vcm1hbGx5Lg0KDQoNCg0KDQoNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0Kt6K8/sjLOiBBZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0LmNvbT4NCreiy83KsbzkOiBTYXR1
cmRheSwgU2VwdGVtYmVyIDE0LCAyMDE5IDEyOjQ3OjM5IEFNDQrK1bz+yMs6IHpoYW5nbjE5ODVA
b3V0bG9vay5jb20gPHpoYW5nbjE5ODVAb3V0bG9vay5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0K1vfM4jogUmU6
IGltYWdlIHNpemUgaXMgd3JvbmcgaW4gRURJRCwgaG93IHRvIHVzZSBFRElEIHF1aXJrcw0KDQpP
biBGcmksIDIwMTktMDktMTMgYXQgMDQ6MjEgKzAwMDAsIHpoYW5nbjE5ODVAb3V0bG9vay5jb20g
d3JvdGU6DQo+IERlYXIgZGV2ZWxvcGVycw0KPg0KPiBJIGhhdmUgYSBTYW1zdW5nIDQwoa8gSERN
SSBUViwgd2hpY2ggaGFzIHdyb25nIEVESUQuDQo+DQo+IFRoZSBhY3RhdWwgc2l6ZSBvZiB0aGlz
IFRWIGlzIDQwoa8gKDg4Y20qNDljbSksIGJ1dCBpbiBFRElEIHRoZSBzaXplDQo+IGlzIDQ5oa8g
KDEwNio2M2NtKQ0KPg0KPiBUaHVzIG1ha2VzIGltYWdlIHNpemUgaXMgbGFyZ2VyIHRoYW4gc2Ny
ZWVuLCBib3RoIGluIGNvbnNvbGUgYW5kDQo+IGRlc2t0b3AuDQoNClRoYXQncyBub3QgaG93IEVE
SUQgd29ya3MgaW4gTGludXguIEl0J3Mgb25seSB1c2VkIHRvIGNvbXB1dGUgdGhlIERQSQ0Kb2Yg
dGhlIHNjcmVlbiwgbm90IHRvIHNjYWxlIHRoZSBpbWFnZS4gSWYgdGhlIGltYWdlIG9uIHRoZSBU
ViBsb29rcw0KbGlrZSBpdCBleHRlbmRzIG9mZiB0aGUgZWRnZSBvZiB0aGUgVFYgeW91IG5lZWQg
dG8gZmluZCB0aGUgIm92ZXJzY2FuIg0Kc2V0dGluZyBpbiB5b3VyIFRWIGFuZCB0dXJuIGl0IG9m
Zi4NCg0KLSBhamF4DQoNCg==

--_000_MN2PR04MB61259DE54D7F5AEB0AAB6E25CDB20MN2PR04MB6125namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<style>
<!--
@font-face
	{font-family:SimSun}
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:SimSun}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian}
.x_MsoChpDefault
	{}
@page WordSection1
	{margin:72.0pt 90.0pt 72.0pt 90.0pt}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"ZH-CN" link=3D"blue" vlink=3D"#954F72">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal"><span lang=3D"EN-US">Thank you, after adjust TV im=
age settings, screen display normally.</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"EN-US">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"EN-US">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt; fo=
nt-family:SimSun">&nbsp;</span></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Adam =
Jackson &lt;ajax@redhat.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> Saturday, September 14, 2019 12:47:39 AM<b=
r>
<b>=CA=D5=BC=FE=C8=CB:</b> zhangn1985@outlook.com &lt;zhangn1985@outlook.co=
m&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&=
gt;<br>
<b>=D6=F7=CC=E2:</b> Re: image size is wrong in EDID, how to use EDID quirk=
s</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">On Fri, 2019-09-13 at 04:21 &#43;0000, zhangn1985@=
outlook.com wrote:<br>
&gt; Dear developers<br>
&gt;&nbsp; <br>
&gt; I have a Samsung 40=A1=AF HDMI TV, which has wrong EDID.<br>
&gt;&nbsp; <br>
&gt; The actaul size of this TV is 40=A1=AF (88cm*49cm), but in EDID the si=
ze<br>
&gt; is 49=A1=AF (106*63cm)<br>
&gt;&nbsp; <br>
&gt; Thus makes image size is larger than screen, both in console and<br>
&gt; desktop.<br>
<br>
That's not how EDID works in Linux. It's only used to compute the DPI<br>
of the screen, not to scale the image. If the image on the TV looks<br>
like it extends off the edge of the TV you need to find the &quot;overscan&=
quot;<br>
setting in your TV and turn it off.<br>
<br>
- ajax<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_MN2PR04MB61259DE54D7F5AEB0AAB6E25CDB20MN2PR04MB6125namp_--

--===============0036346590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0036346590==--
