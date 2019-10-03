Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01684C9BD1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 12:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6C6E101;
	Thu,  3 Oct 2019 10:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069045.outbound.protection.outlook.com [40.92.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F466E101
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 10:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpj4IDSGCSo7tIswmaXXR3cEu0AlJpH7Jkln47f8bL3/+scr4dGZKlRZ/hQUEowuISu366i2Kd/15enzxZZNHUvyEBWVAIZiQX/8hslYwzm7C1CQSi/BSTd8e4/4nsLd1dt3Mar7rqiOw9PHuyrLUU0qAcZNHX7O6DdTFpD7dlMBBwAxsFBiCGfFCIIS+lPlB1N+RhUJ3WRpdADbOIt3b8lGvKWDkQR6/RpOi31Ee64/LfP8Q6N0BcSVvh6mu5BBwccxHS+/EAKMRinAvNzVm8ilGikBn+r4Ijvbm2ehhTHQyMHjIt67JqlqsZrr1FvrDXEXTx8IBYFQDgjKg4HzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMRTf6LvvpQU/wkhZ7o+Ai3qtEQeZI+EMu1chc77VX8=;
 b=f3X4aWwD8bNWe7SFkA6FwrKc7bOiaq3KrsHJQhiij8rGmeneU7NpzFRQIstEn7V5fnL3HdZwk4pMEQnJmteREufWWvT9RWTfGMihnvcWTHUkykgE/cn4AOnU+GHrw0rpemvpUVdlrWcJ+z7hEmLsIYfC/Ilmz8ifBt/zeci1h4clt8hM3PMi3268Mnx3O3oi1xNutttb6j/ScicviORoDFbMfaaYnNbhaE2+IOACCk9Efj6+hxLojtGSzRc73gxTyJtvQObSTaZzsh4C2f6WoWRi+iwr5iKy2aE6yKf7uxzs8gXd7FUQtGAohNhwtmyYTxJBjONZDkYazlYMKsOG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR02FT027.eop-EUR02.prod.protection.outlook.com
 (10.152.10.51) by HE1EUR02HT211.eop-EUR02.prod.protection.outlook.com
 (10.152.11.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.20; Thu, 3 Oct
 2019 10:14:01 +0000
Received: from DB8PR09MB4439.eurprd09.prod.outlook.com (10.152.10.59) by
 HE1EUR02FT027.mail.protection.outlook.com (10.152.10.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 10:14:01 +0000
Received: from DB8PR09MB4439.eurprd09.prod.outlook.com
 ([fe80::3026:7d4e:9d73:1921]) by DB8PR09MB4439.eurprd09.prod.outlook.com
 ([fe80::3026:7d4e:9d73:1921%2]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 10:14:01 +0000
From: evan chime <evanchime@outlook.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Outreachy applicant - "dri-devel aka kernel GPU subsystem" Project
Thread-Topic: Outreachy applicant - "dri-devel aka kernel GPU subsystem"
 Project
Thread-Index: AQHVedFviTficpbCHk6BW6Vigh+B9qdIslap
Date: Thu, 3 Oct 2019 10:14:01 +0000
Message-ID: <DB8PR09MB44393E292B1A0A86BC6BCE43AA9F0@DB8PR09MB4439.eurprd09.prod.outlook.com>
References: <DB8PR09MB4439183999EB2427EDE5CCE1AA9F0@DB8PR09MB4439.eurprd09.prod.outlook.com>
In-Reply-To: <DB8PR09MB4439183999EB2427EDE5CCE1AA9F0@DB8PR09MB4439.eurprd09.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:63D98D3FD43FE9EE5F761D109EF746BA2B374243C25E38AACBA00242441349AC;
 UpperCasedChecksum:26F272901E60CF74ADF85FBF0A72146855A280089F669BB3C8014CEE05B524F6;
 SizeAsReceived:7002; Count:43
x-tmn: [6QbIEgNPmvafOxEOCgmeyzfM+fS6isAjibuGsoZi/vdtuNmcPXKI5ZLbA1n120HE]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: HE1EUR02HT211:
x-ms-exchange-purlcount: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FR3daqf7Z1Xktl8u+SNC95PL66zRRA1YDK/gLgeynQnVIJOQx2IYaKzOd5psUZve6JU7jz609Z+fUTSiS1OLlf1425zX6ecRLNwOM9ojEQgR4xZxxk9SkwpDC6VStxrxkRLSM3iVdeb8fPuDy3kCGG2ZW+NhiEwZNW40tH70rnwxFdDNpMk+kSKPQ1rhigDYUMub5JqVH3xz2dp7pvRwqrOUO2wz5VSzsihs57kVtbc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 409b231f-374c-48b6-dcdd-08d747ea69c0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 10:14:01.7590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMRTf6LvvpQU/wkhZ7o+Ai3qtEQeZI+EMu1chc77VX8=;
 b=fAixFsBeGne6LQNXZ0T1wGqkkdb7CntLnN2PRlG0l0ZF7t4RuWHEz3pDixKhFPPEHqprx1/GbrEo7avo4MS4lvJ5nN8iL6cgro/Qtkra/xH63g9mn9xuUwZzo9s+KhnE3Wg3hs2NCvnKSz6pVFqBgcgbjiNwjHclEiMGHWCsS5WgUpSuZseUwEfL6BEIYJaXbeeY5S8E70Ui4s/pOnGeB+FyS5bXgCKqmn4BO2Mkn9bnmhEJ3qHuVGim1CPaOQxWiNHGOhJHmQwr73tGUn9BA/m/y2KnjNbKSaI5gtBZF09nA5HWufSVKcJlcE18U/Tf8gHsia6iJguAeG2uwUX2Fg==
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
Content-Type: multipart/mixed; boundary="===============1357742989=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1357742989==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB8PR09MB44393E292B1A0A86BC6BCE43AA9F0DB8PR09MB4439eurp_"

--_000_DB8PR09MB44393E292B1A0A86BC6BCE43AA9F0DB8PR09MB4439eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Everyone

Please I have a question - I noticed in the mails here, there's a "From" an=
d "To" field - how do you achieve that.

Kind regards
Evan

Get Outlook for iOS<https://aka.ms/o0ukef>


--_000_DB8PR09MB44393E292B1A0A86BC6BCE43AA9F0DB8PR09MB4439eurp_
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
<p class=3D"MsoNormal">Hello Everyone</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please I have a question - I noticed in the mails he=
re, there's a &quot;From&quot; and &quot;To&quot; field - how do you achiev=
e that.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kind regards</p>
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB8PR09MB44393E292B1A0A86BC6BCE43AA9F0DB8PR09MB4439eurp_--

--===============1357742989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1357742989==--
