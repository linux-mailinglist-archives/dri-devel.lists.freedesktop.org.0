Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED71D74E9
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 12:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739726E150;
	Mon, 18 May 2020 10:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BD36E29E
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 23:36:23 +0000 (UTC)
Received: from [100.112.5.40] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-east-1.aws.symcld.net id AB/ED-40013-CE870CE5;
 Sat, 16 May 2020 23:36:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKJsWRWlGSWpSXmKPExsWSLveKRfd1xYE
 4g3en9C2ufH3P5sDocb/7OFMAYxRrZl5SfkUCa0ZP413GgkUGFZtWLmFuYPyg3cXIxSEksIxJ
 4vrv78wQzitGid+rPrNDOI1MErNuNbNCOL8ZJWa3TQYrYxRYyizx9fkKRgjnGIvEvANXoJwNj
 BLdvz6DOSwCu5klFvf/ghowi0ni5789UM5dRom7zYvYuhg5OdgENCTmz57JAmKLCLhLXG7eBm
 YLC1hJbJ4zjxUibi/RcfoO0HYOIFtP4uVpORCTRUBVYtoqIZAKXoEYiXOXdjGC2IwCYhLfT61
 hArGZBcQlbj2ZD2ZLCAhILNlznhnCFpV4+fgfK8TVixklGhvWsEMkFCXmH3wGZctKXJrfzQhh
 +0pM3LARKq4lMen3dahB2RIHLvyEiqtJLO5+xAZym4SAjMSr1RIQYTmJVb0PWSBsGYkHN7azg
 eyVEPjNJDF12UuWCYy6s5DcCmHnSfztns04C+w3QYmTM5+wQMR1JBbs/sQGYWtLLFv4mhnGPn
 PgMROy+AJG9lWMZklFmekZJbmJmTm6hgYGuoaGRrpmukZGhnqJVbrJeqXFuqmJxSW6QG55sV5
 xZW5yTopeXmrJJkZgqkopYLu7g3HH8vd6hxglOZiURHkvHtgfJ8SXlJ9SmZFYnBFfVJqTWnyI
 UYaDQ0mCd3L5gTghwaLU9NSKtMwcYNqESUtw8CiJ8K4DSfMWFyTmFmemQ6ROMVpyTHg5dxEzx
 8dVS4DkdxApxJKXn5cqJc67sQyoQQCkIaM0D24cLLVfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM
 7BqCTMWwmyliczrwRuKzCNA/0iwut6cR/IQSWJCCmpBiYVm2fXIzrev9JSO/3P9siFna+jBeR
 PaxkmZGy58exAaULLo90cPx7XPWhLCDA4b3T4pDTTjO+t9WnTzc7eX5U2I/rlzrL3hv9488rm
 f+G8H90iqrHeOWP1h62+BbZPtybf+bwwx3WF9zGj3+rT73Nv32jPUdyRvey27CZ/Po1DYo5el
 7O7TpRae3ytYGWRDvfUrlg11/+2idppz2qp/xIer/Qepu3d8k+tIiwotS/i2ObLoTuOnu84fk
 RhPqOs8/vSjS1HM36LnZSfUXp1iofbiYcv+xrv/v13b41K248fv3t0TH01vVduWTX7p+T+pYe
 CewWVDq1L51XWXMGd/TCc+02HvJb7PI/OW2Kaf5crsRRnJBpqMRcVJwIATRvQ9mgEAAA=
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-6.tower-406.messagelabs.com!1589672169!409518!1
X-Originating-IP: [103.30.234.4]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31179 invoked from network); 16 May 2020 23:36:11 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.4)
 by server-6.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2020 23:36:11 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id BD39FF46084EA62AD32A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 07:36:08 +0800 (CST)
Received: from HKGWPEMAIL01.lenovo.com (10.128.3.69) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Sun, 17 May 2020 07:36:38 +0800
Received: from HKGWPEXCH02.lenovo.com (10.128.62.31) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5
 via Frontend Transport; Sun, 17 May 2020 07:36:08 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.50)
 by mail.lenovo.com (10.128.62.31) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Sun, 17 May
 2020 07:36:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUuVmrF0kO8O0eYXQqVF6v4hgfRSWhdniJQt3iO9VfkPqGAChSi4xRg6Cq0rw3VOnxjHui9mL5eWBDoiuF8idTgcBTfo9sh+1pl0lZIUq1zEIDqVj9Ks93AKPhy1BG2baZL75Dud6ALXBQ5FYQUk3VYJqZShkxJ4eOO5yRgYfRhDH8fXbOmc9D47G3At69bHLLQ0Mgfgh8qMSVzoZgOIuPk2cenmK1eOeTxqRFK+nfxp00eVwJ3fvbS+npt/Mk/x96l27UBnt16ZkzgV8HvjIS68KJrRFLPlEWAfWTLmUOJeCjmKVz0FKBXLNUWc3pGR/BZUhsPd42F7tWeM3TD/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbU27IEaPwMS8KQdw2SuX20UqlrVhjGtBjqF+VrFNOI=;
 b=EnwRgY0pofRpW67b4VusY2EqUfl1TZiPyN1Tj+DGud0rkAiSsDtpuu2hozGwsXvjBkezaNZcC4at2tRFJh91Dv/Ia92f+6eI/kTpFeThqaVgRl3un2qZTD95J/itgoXdxmGzkmR84vxof+b/4E8uO22VKyJ30SJE1L4O9mLG+0q9TYqVD7qTC6oErRs47qJcBMyAuRb9bz3P30S9zOe40B51SXO3I6u5+Z7Bl+bbu1zLzTMmxDQxYRoA0UvSxNvGgsMxUAxMMkVGAc4ae7jhs89JOCeAPx4OToBrofjir7x+rbkKLqdrqGfyJ4e08C2P2z+ZfE6oiZFsmq2pg9/Axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbU27IEaPwMS8KQdw2SuX20UqlrVhjGtBjqF+VrFNOI=;
 b=dkRTZyXXtd16+kQ3pNRwbCGcLr1uMR6dtha/FsL1ybkt1/xluZjXiklRfrnOUl20cYfy3xuZpn8W4zb/kQKqXxl6c0TrCbW5jy0leSOdJ4G7KiS875eE3xKkfg37yWltBPKqGFlbLDCg2CuWlFiKs6yRR7JtpoxGyKWjPEeFY8k=
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com (2603:1096:4:19::12) by
 SG2PR03MB5166.apcprd03.prod.outlook.com (2603:1096:4:de::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.13; Sat, 16 May 2020 23:36:05 +0000
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6]) by SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6%4]) with mapi id 15.20.3021.013; Sat, 16 May 2020
 23:36:04 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] Lenovo X13 Yoga OLED panel brightness fix
Thread-Topic: [PATCH] Lenovo X13 Yoga OLED panel brightness fix
Thread-Index: AdYr2e45YjYzW1LmQh26dGZPHqI7kA==
Date: Sat, 16 May 2020 23:36:04 +0000
Message-ID: <SG2PR03MB3324B5B8D808407B243943CABDBA0@SG2PR03MB3324.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.48.229.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3ac6828-14c9-445f-27f1-08d7f9f1e6ac
x-ms-traffictypediagnostic: SG2PR03MB5166:
x-microsoft-antispam-prvs: <SG2PR03MB51660F1E17B2326E4BE286C6BDBA0@SG2PR03MB5166.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 040513D301
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8+PchgrN50oHjTRlJZYiO74aKGEbMV7OmRsSA8tH3vDxKp/qx/MMKpCpxdbhhAI4DCyfCH8c4lqZ1icL9t4h3Kr21vsgRdVkCxCG2I7YyBgYOOJWl3FNjUAa8QUePkF7dl6kHIKZSZjMHxxaGT/DWwvHzxYmWxY1sr5UtYC77Jr/hphYXFkQNvmo97HB+EGw+7y2cCik8f5k5/sc4yw8IIEN4UU3dwUTmJTWZm/k2AX691BOKG2Dt3X5k31CQ83voS87htUl1nMZecpyJUzdF3gHsTcmjn08wHHs379Io3HOa0cs3j6U5shdy6VlmIHT0UW+ieT0+NpVDi1ixaYxZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB3324.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(366004)(136003)(39860400002)(346002)(33656002)(2906002)(66946007)(66556008)(66446008)(52536014)(6506007)(5660300002)(66476007)(86362001)(7696005)(64756008)(76116006)(71200400001)(26005)(316002)(9686003)(8936002)(9326002)(8676002)(478600001)(186003)(55016002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jIUkvS7YwV24VzoZVfLk8oaUUEKqC6tx/Dq3lz4xJIVlW911BixoQxcMd+PxQHMOuSHiifnUnJKvgGe/vYibgi/zVCRgaIhTvxHUqSYb9X1BU2aRdUSpDPdFjqji3hz9BRG50ZbXPLSjUH60N45ZZPUSRiUYOQtoCpK5bufW2BDAdxbDOQvSNj8K+qfAoORUbwIOGJJc+g1SMRw9UUIwWoZhCIG2FcBvEyhrS7fRaADoKQaRBLx1u+U7sj94o6ZT0pV4VlBkAGZmK3CPKWaxPZkj3TZOe3joQfyQiTFLLHgmm/38EG0d+3gun1hFJc9/qXBzZSeZKxlbL1UrDbKATBQgxiEGeXckdjwHo46zrW9gW4T/wCL37G76W6TItAo/zBuo1S6N+w78pay4ue25KnLYS0yTosnnBikg1sMpPySoxJi5vR3yzJT/HNJVRcjDQFXTzoG55OwB58pb7boLJ3urSAXx/0QMs7pJJlzoZqk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ac6828-14c9-445f-27f1-08d7f9f1e6ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2020 23:36:04.7891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+k7if/bJoQZ0/hQev6B7AhGSkLc1xGtu4pWROqT5RfIZC+PSNF00vwx3NAuityJqEqLhIHw/zQB++X9+Iji+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB5166
X-OriginatorOrg: lenovo.com
X-Mailman-Approved-At: Mon, 18 May 2020 10:14:39 +0000
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
Content-Type: multipart/mixed; boundary="===============0904223513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0904223513==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SG2PR03MB3324B5B8D808407B243943CABDBA0SG2PR03MB3324apcp_"

--_000_SG2PR03MB3324B5B8D808407B243943CABDBA0SG2PR03MB3324apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Patch to fix an issue controlling the brightness of the OLED panel on the L=
enovo
X13 Yoga
Please let me know any feedback or questions.

Mark Pearson
---------------------------------

Add another panel that needs the edid quirk to the list so that brightness
control works correctly. Fixes issue seen on Lenovo X13 Yoga with OLED pane=
l

Co-developed-by: jendrina@lenovo.com
Signed-off-by: jendrina@lenovo.com
Signed-off-by: Mark Pearson <mpearson@lenovo.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
drivers/gpu/drm/drm_dp_helper.c | 1 +
1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helpe=
r.c
index c6fbe6e6bc9d..41f0e797ce8c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1313,6 +1313,7 @@ static const struct edid_quirk edid_quirk_list[] =3D =
{
               { MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41), BIT(DP_QUIRK_FORCE_D=
PCD_BACKLIGHT) },
               { MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14), BIT(DP_QUIRK_FORCE_D=
PCD_BACKLIGHT) },
               { MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14), BIT(DP_QUIRK_FORCE_D=
PCD_BACKLIGHT) },
+             { MFG(0x4c, 0x83), PROD_ID(0x47, 0x41), BIT(DP_QUIRK_FORCE_DP=
CD_BACKLIGHT) },
};
 #undef MFG
--
2.26.

--_000_SG2PR03MB3324B5B8D808407B243943CABDBA0SG2PR03MB3324apcp_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Patch to fix an issue controlling the brightness of =
the OLED panel on the Lenovo<o:p></o:p></p>
<p class=3D"MsoNormal">X13 Yoga <o:p></o:p></p>
<p class=3D"MsoNormal">Please let me know any feedback or questions.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Mark Pearson<o:p></o:p></p>
<p class=3D"MsoNormal">---------------------------------<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Add another panel that needs the edid quirk to the l=
ist so that brightness
<o:p></o:p></p>
<p class=3D"MsoNormal">control works correctly. Fixes issue seen on Lenovo =
X13 Yoga with OLED panel<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Co-developed-by: jendrina@lenovo.com<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: jendrina@lenovo.com<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Mark Pearson &lt;mpearson@lenovo.com&=
gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Reviewed-by: Lyude Paul &lt;lyude@redhat.com&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">drivers/gpu/drm/drm_dp_helper.c | 1 &#43;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">1 file changed, 1 insertion(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drive=
rs/gpu/drm/drm_dp_helper.c<o:p></o:p></p>
<p class=3D"MsoNormal">index c6fbe6e6bc9d..41f0e797ce8c 100644<o:p></o:p></=
p>
<p class=3D"MsoNormal">--- a/drivers/gpu/drm/drm_dp_helper.c<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/drivers/gpu/drm/drm_dp_helper.c<o:=
p></o:p></p>
<p class=3D"MsoNormal">@@ -1313,6 &#43;1313,7 @@ static const struct edid_q=
uirk edid_quirk_list[] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41), BI=
T(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14), BI=
T(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14), BI=
T(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; { MFG(0x4c, 0x83), PROD_ID(0x47, 0x41), BIT(DP_QU=
IRK_FORCE_DPCD_BACKLIGHT) },<o:p></o:p></p>
<p class=3D"MsoNormal">};<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;#undef MFG<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.26.<o:p></o:p></p>
</div>
</body>
</html>

--_000_SG2PR03MB3324B5B8D808407B243943CABDBA0SG2PR03MB3324apcp_--

--===============0904223513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0904223513==--
