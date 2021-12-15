Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74432475D7A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05BC10E8C5;
	Wed, 15 Dec 2021 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (mail-eopbgr100069.outbound.protection.outlook.com [40.107.10.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6954D10E8C5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:33:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPt99P4u24/zdRCOiZCRpO0sYZbx1wq7QWHvIrI9LkKRo195fOwGCXwmWai4Ld5UPnkk62rEnbbkaWbHu7P8/Ic9Q7x/ozRcHy8+JF0kpBzm5FJRingLyBSohvycsr7vvXJjD9rhF2V7VcxBkUz96M2egLvvruXSJ4zNdEmT6nQYt0h8a/L46mmXaQtlLJsuzy4ep1INjacI50KiGRA7YxBI+Mt4A7REv/YxoGqojPMIK+aTahjOzHNtZXf4bxi6QSqgmbuLr4G8wtcQQqumYnn6Ze+a1YHCgfrsDwWFEr3EzVlumMH7bWGDB2WHwBWxoLZNM0g2Sm3vZUfTKEPjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXolO/X+UPouyEcGCR1GQrLlq42gnRQnteME776snvA=;
 b=LcjFlF/vmdpCb4R7s8kU6hYbuEq9Pcz3gBjLN9+iG932Gr5DDUUOkFOhcUhHDTG7At2beTOnYkyiQqhYYorakQgGaovB62s1nQ3Qkp/eQtmGxmVxgUBw+8wGZGayKiZ6729BU6rfSGssrr8glYtLr5djmErWGStRQ1onOurpIWXTkZ4zXKscLX4zHoF7q9vi8aZjuXK6bvq8EnyJ0QzrICUVu9S45BCCD9O2qQmZi/a5NG2PvTtU5Zylj4w/rN81r+XcloBPygVBbZQ6MIP4kQtk3a8bXsIZAXp0bbcBiV7kPFP9ixtAZ08wpYHYuTWvQ0xdxsF6anNoquTAeQ61Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phabrix.com; dmarc=pass action=none header.from=phabrix.com;
 dkim=pass header.d=phabrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phabrix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXolO/X+UPouyEcGCR1GQrLlq42gnRQnteME776snvA=;
 b=YdI9/A79Q+y7xOHnU8xPjUxIcOa42LFVfA20De5JcEr7LqXTqpV28UtgrTujNvznFJ65ytuX3ajpmIFP6McRhwXIdClZohs9V79YefvvLnOj+AeTHXC/iHok5gdyBtQWc3oLstCg9bU9mWNFKlwn0Qf3b+i7ClyV1B+opaz+1po=
Received: from CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:78::10)
 by CWXP265MB2245.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 16:33:48 +0000
Received: from CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1d94:b29b:2630:306a]) by CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1d94:b29b:2630:306a%6]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 16:33:48 +0000
From: Chris Pringle <Chris.Pringle@phabrix.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: IMX6Q DRM - Framebuffer update rate with LVDS 
Thread-Topic: IMX6Q DRM - Framebuffer update rate with LVDS 
Thread-Index: Adfx0YSqR8L4UozcQg2nKBiOnrrPTQ==
Date: Wed, 15 Dec 2021 16:33:48 +0000
Message-ID: <CWXP265MB2229746771FD019967F0BD42EB769@CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phabrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61ae0741-a25b-4c63-e6dc-08d9bfe8abfb
x-ms-traffictypediagnostic: CWXP265MB2245:EE_
x-microsoft-antispam-prvs: <CWXP265MB2245CEE62AF5AEE83136866EEB769@CWXP265MB2245.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d3+SU2mlyH9ejw4GREIbXXFontz2u0Izkh/77a326goxGq4zah5EvUAik3ysVjSVj/1ugXnm3fMTYNoOXHmHFnAkbhLrx0ge5owu3U7oj/YD0k74Owt54DgO4j3zy+/VorBzuY7foYLQdTO6BpGb1S869nVuh8k1JgokLM6tR+6taiyjOAlAlpUl/AIgOoTe60Pu5jPxuYARLkWEXb4HBrZyCWheHdy0uwLFxWYfb9HcG4dXn0zPQ9GILajTbTAduZGNFiFTS7eU0+3cLwoe8hsQAfPGuHO9wqZ6HqjVBTj/PSBq2g67IrZKsu9Vu38xSSsIkalPtevbbB++iUbE6XTgMg9MFdYNaR8DiBI4iovXxs2VZsWlmkiO4OhFY6DC/tkGoXwzjyHEItsParGykILhQXF5ESATM+fvC7K70z1liFayYdFUca1nrIqgJfLtmOGmADds7VEHmoBRKk6bVvbnXcR3mVhkrliRIE+5Xe0EJFSRp8FKEAGsTYB5c7M4HbP9HZBFEMbrpDpEVZwdahOxfed8LWkpKxa+I1Vp5wBy3xGnSf6tjcjl9bj+4YBpRs+aTVxt8PgtkYzaB2aqi2RoENRes0F1KlauGgy+gGs4mB1zrvIicdFl7BXWwAOvFRAqDfvlXyAjgCyH6T1FNcj2dgiezZxCfb7SRqdQhpwb7S22ZMz609rcSOqq2Sk7MJ7keKFHi6F3dSOlTgVfTJEJ+vSJYyfHukR1P8H90Bo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(366004)(136003)(346002)(376002)(38070700005)(8676002)(66556008)(6916009)(71200400001)(83380400001)(8936002)(33656002)(55016003)(66476007)(508600001)(76116006)(66946007)(64756008)(66446008)(9326002)(4743002)(7696005)(122000001)(26005)(6506007)(38100700002)(186003)(52536014)(316002)(9686003)(2906002)(5660300002)(86362001)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y/p1Qz2zcpBvwPNEhspXP1ciiUPcCIJkBgJkQz3uU/QZ9KoaSrwME/LARR4C?=
 =?us-ascii?Q?YFB3u8C9Irb5fuedm0PD4Jy1tXNYafPis9YYNkwsjwGBcsyuZSJLfkhY+31q?=
 =?us-ascii?Q?sC6mYqWlqfMWThpNIF3S5GUAM56gYduyUOyllPkkzvOHZYJBQ3Wmi2jcolLr?=
 =?us-ascii?Q?gUtkWbkE2lZBKkmPT6upThX50Aw727q1wBvHk3lQREKpIl0okgBm/n9ITZ6b?=
 =?us-ascii?Q?DhahBOhlQHNWB4TS5zrFZt55wLfDQ7CttU9ljZk3vVtjtJZJHyp1mi5Q/13b?=
 =?us-ascii?Q?DGX16txe8GxdbCJ64/HsKCQqcJ5M1CfGCVvK2nss/CsJxSHjm8PLgpNm1dGe?=
 =?us-ascii?Q?/ndrlVsas3P+ZkB7ZqL3LUaeuT6WjWdW3OL2d4OOOccGi/E897MoHEmtClCE?=
 =?us-ascii?Q?HbzVxXBGmRRxzR3kWb+kIcVLD0/hd/RRlUU0D9/K0oyuEoK/DBVop2qcyIDu?=
 =?us-ascii?Q?818IJwDpaHw6GvrCLDErzeUH9fqT59Cc7MsnwVfNp8Ci0pg2ek/8O269H/A7?=
 =?us-ascii?Q?QUzsd5gtj/QBfrykOR03hjQZJRUdqfeAUMBl/1owO0ADh20u3KxnVs8qnKHW?=
 =?us-ascii?Q?s+6m59b97Y2TDEpmFJWfaiPwjF+Qrmyr5mKJ5KeRCSa/u19j12h+KgMobF5H?=
 =?us-ascii?Q?p+tgksokZlTMrnZh69QLeFl+gQ5am4NNjf15/WlV1w23PVcHFCgwuUiDHmAi?=
 =?us-ascii?Q?lImBeiBcKD57uU9jeZgKM2xKxy4hxQ4gfhaguIYjyg+jETpaQMnhm051pt+N?=
 =?us-ascii?Q?OdERx7yrxGzpUg5tP3zkfIrG0M1IwoiZCWfdktsID0WNL29s7vtfhqwwDGsE?=
 =?us-ascii?Q?iplxZ3zwuUUFMy7C5TlWi20z8E4ONHY3VyiZ4qeH/8pAfHKgnAj4Xqq9H2rW?=
 =?us-ascii?Q?WT5fbN70bwOcRMDg7nTUjKka2jbt9rDMPO9JGeCqiZP655tWXEoHJvPGWXCQ?=
 =?us-ascii?Q?0WI1h3krRXeS1vPRRSbWZ5RJS7gQOzHYlMwQ2xDpCAB6T5BIUl+dpjIDyq1D?=
 =?us-ascii?Q?iAp42K2MHCRlozvVpFP9nc0Q2wV6Pdqa6Z6/cQx+jDz7y2ERz2emJcsz4ZQB?=
 =?us-ascii?Q?7/06d4ntzUUNvS6tTNDV+tzMMBuad75xDD/UwQPJJkA8JXACbPGHF2cgYOIN?=
 =?us-ascii?Q?k955+7dFNib6tg6URsYPQ4YvR9XA/Ma2JSh/dc93spFzGG3G9ivKbZjVJ2tG?=
 =?us-ascii?Q?o90sz1mQuDn2eaEEl4lklgC7AwCrvZN8Ulukshgo9HrsUDPeCR084WvgA24Q?=
 =?us-ascii?Q?2G7zUDWQSJvPFhsA82IOf1p/Y2Wfj8HCU4tUnXkN4NRUYIVlZZ5LNkNMcdsj?=
 =?us-ascii?Q?Eh7H6sHBmCUKZXi7DuHg/U1gFTK+Z20JnuMz97WaeS5A/LkvYJ2wdceblOyS?=
 =?us-ascii?Q?One5T3SL0w1w5F+QCTiIsc/GSesNK9UWFBvn7lWKtvaMMbmXM8n0JP0vKO8X?=
 =?us-ascii?Q?4BSHUw2XOYaWZpy6rHYGvIXo8bgqLumBSrMu2ZmM7fna4KjW6oVs6U9a/6X+?=
 =?us-ascii?Q?hH+RER4zAePdX6k6zPEl4KcJY7nWjR+2qCF6qjw67TVyY6METu1Xti4wDcKD?=
 =?us-ascii?Q?fqxJtb51v+Fcw7d/2fYme1BE/zEMxyYiPbqHOs3g3NbQa7TQ/wQh4ALmAba1?=
 =?us-ascii?Q?6XMoafXx76OufUhHrNlvWF0LR8HQMHbHjepl33BuKAImUshqjrhMykJISEAR?=
 =?us-ascii?Q?q0mFSA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CWXP265MB2229746771FD019967F0BD42EB769CWXP265MB2229GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: phabrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ae0741-a25b-4c63-e6dc-08d9bfe8abfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 16:33:48.7584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20a0d659-dc6e-4307-9c1e-97f93b0e3d90
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HH6r2bXlbiaPl/Zag5gk8roIaRmODvmk6zZRq9olT9z4QnyKtzozY4lg3R/wzFcS40QnXRsdxjz/Fp34AvWwPcCI2dExqDYta4RDQgKlv3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2245
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_CWXP265MB2229746771FD019967F0BD42EB769CWXP265MB2229GBRP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm looking for some advice/guidance on an issue I've run into with the IMX=
 DRM implementation with LVDS. I'm using an imx6q with an 1080p LVDS displa=
y on kernel 5.10.73-rt. When running Qt applications (EGLFS) with this plat=
form, I've run into a strange issue where the framebuffer flip rate (as obs=
erved in libdrm) seems to be fixed at either ~14fps or ~28fps. This changes=
 from ~14fps to ~28fps when I increase the pixel clock rate for the display=
 above ~75.5Mhz.

Our render times are well below 35mS - usually around 28-30mS. With a pixel=
 clock of 74Mhz, the frame buffer refreshes every 70mS, blocking the app wa=
iting for the next page flip. Increasing the pixel clock to 75.5Mhz causes =
the frame buffer to flip every 35mS. Increasing the pixel clock further to =
around 140MHz makes no difference - the frame buffer still flips every 35mS=
. It appears as if the clock governing the frame buffer is not scaling with=
 the display pixel clock and is running asynchronously - I'm unclear if thi=
s is by design or if this is down to platform misconfiguration.

The pixel clock for the LVDS display is set in the DTS file and is being co=
rrectly picked up - I can see the display refresh rate reflected in the Qt =
library logs and the pixel clock rate reflected in the debug kernel logs fo=
r the imx-ipuv3 driver.

Does anyone have any thoughts on what might be causing this behaviour? I'd =
like to understand why the framebuffer refresh rate is not changing proport=
ionally with the pixel clock rate, and why the duration between flips sudde=
nly jumps from 35mS to 70mS when the pixel clock drops below ~75.5Mhz.

Thanks,
Chris

--_000_CWXP265MB2229746771FD019967F0BD42EB769CWXP265MB2229GBRP_
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m looking for some advice/guidance on an iss=
ue I&#8217;ve run into with the IMX DRM implementation with LVDS. I&#8217;m=
 using an imx6q with an 1080p LVDS display on kernel 5.10.73-rt. When runni=
ng Qt applications (EGLFS) with this platform, I&#8217;ve
 run into a strange issue where the framebuffer flip rate (as observed in l=
ibdrm) seems to be fixed at either ~14fps or ~28fps. This changes from ~14f=
ps to ~28fps when I increase the pixel clock rate for the display above ~75=
.5Mhz.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our render times are well below 35mS &#8211; usually=
 around 28-30mS. With a pixel clock of 74Mhz, the frame buffer refreshes ev=
ery 70mS, blocking the app waiting for the next page flip. Increasing the p=
ixel clock to 75.5Mhz causes the frame buffer
 to flip every 35mS. Increasing the pixel clock further to around 140MHz ma=
kes no difference &#8211; the frame buffer still flips every 35mS. It appea=
rs as if the clock governing the frame buffer is not scaling with the displ=
ay pixel clock and is running asynchronously
 &#8211; I&#8217;m unclear if this is by design or if this is down to platf=
orm misconfiguration.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The pixel clock for the LVDS display is set in the D=
TS file and is being correctly picked up &#8211; I can see the display refr=
esh rate reflected in the Qt library logs and the pixel clock rate reflecte=
d in the debug kernel logs for the imx-ipuv3
 driver.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does anyone have any thoughts on what might be causi=
ng this behaviour? I&#8217;d like to understand why the framebuffer refresh=
 rate is not changing proportionally with the pixel clock rate, and why the=
 duration between flips suddenly jumps from
 35mS to 70mS when the pixel clock drops below ~75.5Mhz.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<br>
Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_CWXP265MB2229746771FD019967F0BD42EB769CWXP265MB2229GBRP_--
