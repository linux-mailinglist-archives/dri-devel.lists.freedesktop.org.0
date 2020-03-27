Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C413197501
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718A889F47;
	Mon, 30 Mar 2020 07:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253084.outbound.protection.outlook.com [40.92.253.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833316E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 22:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnuIYCKqoGFi9hpqABwcJzHwdDgcEOW8blS9Jf9qUGhIf35ZuO9enH012juGzX/SVXGZVqCFznxn4azZmpiChyBYYEtzcu6gOeljsCCa95orsYbCrR2B3PMK2+Zzw6ESsATpRq8FAuJh9sZAnBBirkXOqR+1r4DRG6zZFYvhQ366Rcom481A1NUZiejRQBxfwZ4H8RhuGcRSSRyC9g4IHHHulz2CIRhJqZTamOhG2Y2+NEUKYfxlO/GGhfoOggm8BxtjucNNmXVlPXQaEklvB2aNSTJOsPdki3T8JnQCS5bCaVSkD86bXBaKBWbXVq8Ahc9300UGL1t7Y6Aj+aSPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3Ldjqnjbs6R0EWXHQMhIGMMPUrYdt5hwm6ivG9y//0=;
 b=KrJ0Txy8CNyiJuAooXWvOEjfjV/byQnnJd4ZSO6dJ031jloDRzc2SbnWK/kgbXX8SyuxXAyZYoRUw0t3zaOX+WpIKbn/q3XieJiXAn4WjKxVZax1tfamcu7GQ03rkm0ZBUrys+MPCKqWF5k60naxdPZILxvJhY2NtcgANHdfrSSOL9+MUYW+z2tw5WrdgeRJNbg4O7q6d2Ubd7FrAS/OUyRXoTu+pf4g4MofwQCQUufSn3HmF7sDl6yV/7a2GaCTmAZYhLgHJZj4LAC1ibm3lXM5yYB1mhaqfKaB6Ce7sEe/HfGZebCL4xjszlE5k3eY7SO/u1/Y3Sg4zv93NsyRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PU1APC01FT008.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::45) by
 PU1APC01HT224.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::482)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.17; Fri, 27 Mar
 2020 22:33:08 +0000
Received: from SLXP216MB0878.KORP216.PROD.OUTLOOK.COM (10.152.252.52) by
 PU1APC01FT008.mail.protection.outlook.com (10.152.252.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 22:33:08 +0000
Received: from SLXP216MB0878.KORP216.PROD.OUTLOOK.COM
 ([fe80::8167:bf73:d102:a7d3]) by SLXP216MB0878.KORP216.PROD.OUTLOOK.COM
 ([fe80::8167:bf73:d102:a7d3%8]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 22:33:08 +0000
From: Quoc Kien Ly <quoc88@live.com.au>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/3] AMDGPU / RADEON / DRM Fix mapping of user pages
Thread-Topic: [PATCH v2 0/3] AMDGPU / RADEON / DRM Fix mapping of user pages
Thread-Index: AQHWBIerUkqqCBUfKUqx58uYGaqD8g==
Date: Fri, 27 Mar 2020 22:33:08 +0000
Message-ID: <SLXP216MB08783784127CEB49F312CF9F91CC0@SLXP216MB0878.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:F3017451D68B81E1A702335EEE908438350A9DB80FEE599592C97C9F786A30BB;
 UpperCasedChecksum:59C736BE0F9D5BA420A8041D4712EA4FF9C3AB167C963798858147B42F51F6E7;
 SizeAsReceived:6897; Count:42
x-tmn: [DTb9KJu+wuteM14p1UxenthuWhptiJcuGsAD7LspYwIe/+0aRArbFD48l7WeWXEPRsV9O9mWSxc=]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 7f44c08d-5f14-48e9-4c92-08d7d29ed33a
x-ms-traffictypediagnostic: PU1APC01HT224:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UTHsY2Ng1mh7hVMu8qpfv/puBhPtid9cyglX0LCl4Z3sGnabRCtWYT0sWgvVfIeXcPc225FoKCXi/UFjyiInO936qRF6DX7BEfM+/euR8MxgdqrjadWd3ltpLnnJsfUeWgVYjzHjNu4CXSvg0jQlowZGxm9mA9WiGyejHY+FOL5sMC0dnf6SKd3nCdiXfsja6tkRoIPdPpNprkNoKaDGc6SdaoCNAElZZRqkpjHrYGU=
x-ms-exchange-antispam-messagedata: efhUgDRUY5VPdOsezYAe8q1+X0uOLzfRJ9F9Im5xJwwkJYVCIcvWP2+O/4EBQiFuPB+C52GOzu/osFLtw9c1d7CY2pq3kWb6l/CGFXUaO4gvtvcP5f7eqg7DlEKn1tTZ4VTJfOswiTSKC4Wks0UUbEfC9MCK8vU/vmj8BneeUebuSNuDbhD5k+8OuVlSlslJkKE5EM87ctMV5jp4XLVqFA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f44c08d-5f14-48e9-4c92-08d7d29ed33a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 22:33:08.6253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT224
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Content-Type: multipart/mixed; boundary="===============0388764046=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0388764046==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_SLXP216MB08783784127CEB49F312CF9F91CC0SLXP216MB0878KORP_"

--_000_SLXP216MB08783784127CEB49F312CF9F91CC0SLXP216MB0878KORP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10


--_000_SLXP216MB08783784127CEB49F312CF9F91CC0SLXP216MB0878KORP_
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
span.DefaultFontHxMailStyle
	{mso-style-name:"Default Font HxMail Style";
	font-family:"Calibri",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-AU" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows 10</p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
</div>
</body>
</html>

--_000_SLXP216MB08783784127CEB49F312CF9F91CC0SLXP216MB0878KORP_--

--===============0388764046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0388764046==--
