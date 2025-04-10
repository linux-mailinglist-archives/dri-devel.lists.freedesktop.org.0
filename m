Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F025CA83C2D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5980F10E7B6;
	Thu, 10 Apr 2025 08:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazon11020089.outbound.protection.outlook.com [52.101.227.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDC410E7B6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:13:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIugoIrfC8stVIVm9+sMThO5BUMX7pKaKdrs/LsES0yWt+ELzvl2kcw77rcf2TE2j0MT+IxZlVsXnM+9fddKtigVszNlXdzUGGPXbdCKFb4ukvUo8OhaGCHopY0sVlOu6EDWpumJOVdOjqAB+pn2xl6jaoTEDCdeGrR1eZkR5770+tMGg7UFCPZqhQRNJKe0IMkAxcaaVqBAhwkqd8eC3If0Sr4XOkNzRyaUcelfFa5UaiAgTbio3BtjaDG8+wl1lZsqUNS0XTZcDK+pIXwV0wF889mF+4aZx7FVtI7kdOTmkQmZOxMDXkBXM6T9MnKDrMT4VuppMRbBf/TQ59+DmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxHsacE84Y5gCZ/iphJQmTC7gkW07aXFwpo2fpLd5Tg=;
 b=CoRDdi69/7suwACWhHoYOy/DMWlM4MhV4wo0jUHVh5obCYv57LPFZ7GDIVu3jeWMFtpnivOPEJ5F72uBMh8V5Sb1JrnL+/rlFuFjvODqPCifjADN06vROfkdL4Nn7QDQh0g4wnpnl1xyLmZA5/DrMXfqosA0Y9ckFTf2HTio+eJcIzKlf5fdYH8Wdh7TEdKb4Rjfqx8tcqxzJxvqOOK2jZY2FemjnwQsXR6Qyz2rZiqdeZ047ed1sG4PGcQ37WxLTEfi3Izu0wjR2GgGh2EMinIhPzZDYIkg5sCzp0J76FZsnl9Wkv4iasoGWCHGOVrW6qes6QWzUPSAX4R/0e3QRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0348.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 08:13:17 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 08:13:17 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: Need Help Enabling HDMI on Debix Model A
Thread-Topic: Need Help Enabling HDMI on Debix Model A
Thread-Index: AQHbp61bJ8rSy9+zQkebTS5KwgzRBLOYK2mAgAAM5vOAA553AIAAsMEx
Date: Thu, 10 Apr 2025 08:13:17 +0000
Message-ID: <PN3P287MB18297239252C1032A05686558BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <PN3P287MB1829E84B6B79E9C7189D7CB78BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250407130257.GD3924@pendragon.ideasonboard.com>
 <PN3P287MB1829692B4C3D5AD273CB62DE8BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250409210504.GB12162@pendragon.ideasonboard.com>
In-Reply-To: <20250409210504.GB12162@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0348:EE_
x-ms-office365-filtering-correlation-id: 4114d3c5-e2e1-4656-2f81-08dd78078c88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?HnDkkPQE2e83c3beUJLpU7iQhsynMJI4wN0KhtlOJEHWubmrVqBozi2e?=
 =?Windows-1252?Q?/3dzubU8dUzJPkl5eFeVZ5lOmi8yRasoPgo8NLpr6OLodKNkUh0ITmsg?=
 =?Windows-1252?Q?Uc67RaOh6f2Xwezz94fajd6BAicVH/cCGQdtXGsyOACF9iDDD7RZBWmf?=
 =?Windows-1252?Q?bMb6WN8jm4MNrTbk+3DR8eu+u3p0oXPmYaqHiKx/j34x1bVuNEa0tYnY?=
 =?Windows-1252?Q?qKkhQSviuHHVNyEIIuxYD7+phB03+vRLsGbV2+aOvzHtwdDHszcre0p3?=
 =?Windows-1252?Q?f30dDClla32gKGHjMlZSjyUA9OsSkcG6EfaZz51XrXHbGNVcbR7qvgWh?=
 =?Windows-1252?Q?MFM3ZseMtCgjjSbNgvbx/RmcrFAh+iJJEfRtq4mnfLjp9Kxyy/JPeJ0/?=
 =?Windows-1252?Q?aUDOHFGGV+jil0fLTYf7mcC1ruD4B1mxE1f352lbUSZE9+tW6lGcn77u?=
 =?Windows-1252?Q?8TEe+2/+6vfbMkoUqfVfwvFqk7r9w06o2JTvPW2P6zwxpsLn4ySPsuIB?=
 =?Windows-1252?Q?+jk45xzcu+PwomPGD2zFhwG6k9RG7o7bPK6hmPMRO07qmR/Zadp/hk+b?=
 =?Windows-1252?Q?YD5x58GqP9ib625fUjGB0w6HqeRr5t16+0ZHhXh2LzHZeeomb0jW/eN0?=
 =?Windows-1252?Q?zo4EtvdFFlAGlTHygk9/JRj1SJUulzE3OvRuHNe8R3T9fxjuNnPmj4Ku?=
 =?Windows-1252?Q?yxOLQFF2mWcDblIFWelLxO0TNFZST6awaLA8gnVbuXIrpQktx8LZBZbX?=
 =?Windows-1252?Q?feJOWbnjUo/ucBiGmYWLAQuag2Wa4/Rr49fvLYIFSnqd16m0ZXrrwYNy?=
 =?Windows-1252?Q?1+Q3n4nuAa/daReAgzAft7TlBaJWIQ4rWIfZl0T1KQlQU3RcpHLvoVJg?=
 =?Windows-1252?Q?QwvwtVxgxEObKY42EJXiDWt0MO/zi8Q79H7FqsLdK3Uq66OkFtZSA0A9?=
 =?Windows-1252?Q?p2unyFhbUE0KLD8mBmncb4BxdLfnmtFTsXx5GKx51NIUuf01D0q/6gzr?=
 =?Windows-1252?Q?E+FWNNOiHwb9P8GFTzASpMHXBbyqiuamMxeTQuU+5JIrJU5k2Fv+D3bD?=
 =?Windows-1252?Q?t5MIY23Dirvn8qHvfCjJrfhRpmKag3AWdYVYT1vrmh4If1F2OSWFCb81?=
 =?Windows-1252?Q?hZArOZ7u/AOiU2N1NX8DDcRZHCrQIXCzBY6JHiHqaWOiLLQgCWiZcG5t?=
 =?Windows-1252?Q?SvKT2ZOSkfntV+6Yepq0PS57r/V+CpcNVliUKtcAxZIkexp4mZQM5VyS?=
 =?Windows-1252?Q?RRTFXtQKlFJIMEj7rY3IJM7n/IX8iiu/u7mWDwxSyOYNubgPZadJTt67?=
 =?Windows-1252?Q?mLeN/E5uSKHvxR6kuh/M7nJTtdJlIDmCN6/KyhxPJBRqGdPrhzOgb9Oo?=
 =?Windows-1252?Q?+KIwRytp2hfO0XhDs/53x/1sIVqp5VfGIrtlGKRBthE/YZ95Uy3NlTFT?=
 =?Windows-1252?Q?tyf9AN5GGBq4c1Dm4o+zrboeIFGXjq0zNTZa/WZARMczfBAN3zq7PWxj?=
 =?Windows-1252?Q?RB+4B4Gri7Xz1+GQNxNRx+IWWEQiq+qxZoT05r0TEemaCgHBc1Bbu2Y6?=
 =?Windows-1252?Q?0TJdQ/wZcIzxnuUjDJhgNSaGdJ2OJJxPt/LORg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?aJo+pitKeEEYeX3fWG/V/6tL5s9NyOV9L1ib4MOZ5LBCka78r+b0IUSU?=
 =?Windows-1252?Q?BiUlM4ZtS7L2+68u5j0clL++M6BXLlAdYvXYu38yfYy9ZjhbEwyfF+3A?=
 =?Windows-1252?Q?PR2XStR7lVuz6ubtRFr4akWe0kxKa+Yrz/IEUei8UambHtxJG4NeDG1J?=
 =?Windows-1252?Q?uOe0idr9jyanFSlaRGXH8LXCJ4R0IOTHHg9LYcCx9Cti3OHVOr83w0QP?=
 =?Windows-1252?Q?qW3Ue68ullE8O8Rr0i9EJr6QN0BNfT5xwYSivCt9dqmHkTHRDbzwiTBu?=
 =?Windows-1252?Q?Ojb0j+impvotkh3GNtibCxj1r1lbqaQteprjpNCln0RsexhVHbSbvWUJ?=
 =?Windows-1252?Q?agoH5lFmMWagTsXvnxriRlmkQ7MDmsWb7mXbgE/CErtQ7Vvu4hOaBqyG?=
 =?Windows-1252?Q?kbZ3kc7wmtWm4uy4bxd/EPTZiFeLLKDYAas6zobsEX2fywMsTdGmRTW0?=
 =?Windows-1252?Q?3c8d56YL8vdK2a7DugmE86CSXy3f7LRzXgxkxHrg7/kvGycbb6/z4Jaz?=
 =?Windows-1252?Q?LUhSlwW/9UDPvtObnb6IcuEkn9Vi794Xwsbh2993/Un1mfTf1aLoVUHt?=
 =?Windows-1252?Q?ox0pN8PqYosyEpZLuBG/9v8uAs/rSt6SXSgQhJjhjyes8kXr6sMzeVUf?=
 =?Windows-1252?Q?tMLNR6ysf8nXHIykKm0com8WunbXqa8mm64Zn46YJ0SP7ceSesECStX7?=
 =?Windows-1252?Q?UeJ6y9avU1cEKHvMNUqPJA2mYxre69mf+ofsrSmgWhM0PQ5zgSQh0/AE?=
 =?Windows-1252?Q?sKEa7veeNTf99fgDu4L/BuXbPdF9u92/ozEQto6yl5qLVLvAGwilm23D?=
 =?Windows-1252?Q?vzAiKNFkhNAaLgKuO9fQJZRMd8f75kMGNX3K/AARz0AA6WrRbpJGyoKy?=
 =?Windows-1252?Q?0rvKeUV//S4mgl4RCysccKXoymGhI/J/7fBCRPLVzuKS5VTNJr/r2eur?=
 =?Windows-1252?Q?OkiGGMDOIkLna/iVCSHhZQLBjfB8gZIeQ8IYxjl+OhL6keFzVNAIMDNW?=
 =?Windows-1252?Q?a3e/76JtFm36O5l+J8hqkk+4vetcZSSCcs2WKaOa3lOc4kQe7vtYCeqS?=
 =?Windows-1252?Q?0DTZkOm0s567CG9trAwvr/T5C/FN2vnt9X4VGlskYWOV68GTnxRrWalT?=
 =?Windows-1252?Q?B5dzUUxHPSdzKRxdr7nIBLJmOZm/lQgt1QQ2OoJNJjF/kFfCW2ZoCWiv?=
 =?Windows-1252?Q?gMvrZ4zKtC2IeLbCpjwdpIwC1lFZQ/s4L1sopUSBS5ONirauToTtwn/d?=
 =?Windows-1252?Q?1eMceVsZmDGcnx+DD5ItnvK3afrCp4MCLzWBlttLK/aAt4IP+DcnKhuf?=
 =?Windows-1252?Q?5Nn7aaH6MI/CggtDS53qvzPh6p+2iBdUVP7Bt1qodbTaN7q/cdO5ukJv?=
 =?Windows-1252?Q?wEo6DSEEDith/9ORDnl7MwFtKPlsttG8+7R5JuiGLtPldHBrflZI5uO+?=
 =?Windows-1252?Q?w5sKBLyZYQf/PVozMzw0Cc9DOnVqVbag72uuqBH3+S5BpGNjIp7nnw3X?=
 =?Windows-1252?Q?SsYkAHFiaoSRjg0KVALxWZb7vsNTtWdYXsp1nvzmm3ijF844LdgVbxWK?=
 =?Windows-1252?Q?z05TCj/uIt9xWR+PVawXPJ4oB5I2RSg7fxJtZ5bFuYAIq4wSB0MgTLi7?=
 =?Windows-1252?Q?S14zu4dx3ThCN9l2eGAr4uXeLByGjnYcboVkxZlOOF9+CfPgpMSJDb09?=
 =?Windows-1252?Q?cZw2Y+q5I4hdKbsudY/ZYhInmPUkyRbMJx1slSzHkZgMo8HB9gzBPA?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4114d3c5-e2e1-4656-2f81-08dd78078c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 08:13:17.3915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ci/LU9XCwcmqeh2h5sdj3qg+1hJQUJv81Vx5QdrKDf+US3amImwXbZkmsUHU+CD7NlAuzrretjdwsgClL6lXdEAC6+9xMTTkBo5rHNTIwcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0348
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

Hi Laurent,=0A=
=0A=
> On Mon, Apr 07, 2025 at 02:06:35PM +0000, Tarang Raval wrote:=0A=
> > > On Mon, Apr 07, 2025 at 11:10:23AM +0000, Tarang Raval wrote:=0A=
> > > > Hi Laurent,=0A=
> > > >=0A=
> > > > I=92m trying to bring up HDMI on the Debix Model A board using the=
=0A=
> > > > mainline kernel, but I=92m currently facing issues.=0A=
> > > >=0A=
> > > > I saw that you tested the patch for HDMI support on this board in=
=0A=
> > > > mainline, so I am hoping you could help me figure out what might be=
=0A=
> > > > missing.=0A=
> > > >=0A=
> > > > To clarify =97 I'm using the prebuilt image provided by Debix, but =
I replaced=0A=
> > > > the kernel image and the device tree (DTS) file in the /boot direct=
ory with=0A=
> > > > ones built from the mainline kernel.=0A=
> > > >=0A=
> > > > I=92ve enabled the following configurations in the kernel:=0A=
> > > > CONFIG_DRM_DISPLAY_CONNECTOR=3Dy=0A=
> > > > CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=3Dy=0A=
> > > > CONFIG_DRM_IMX8MP_HDMI_PVI=3Dy=0A=
> > > > CONFIG_DRM_IMX_LCDIF=3Dy=0A=
> > > > CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=3Dy=0A=
> > > >=0A=
> > > > When I boot the board, I see the following HDMI/DRM related logs:=
=0A=
> > > > debix@imx8mp-debix:~$ dmesg | grep -iE "drm|hdmi"=0A=
> > > > [ =A0 =A00.121979] /soc@0/bus@32c00000/display-bridge@32fc4000: Fix=
ed dependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000=0A=
> > > > [ =A0 =A00.122164] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed depende=
ncy cycle(s) with /soc@0/bus@32c00000/display-bridge@32fc4000=0A=
> > > > [ =A0 =A00.127417] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed depende=
ncy cycle(s) with /hdmi-connector=0A=
> > > > [ =A0 =A00.127608] /hdmi-connector: Fixed dependency cycle(s) with =
/soc@0/bus@32c00000/hdmi@32fd8000=0A=
> > > > [ =A0 =A01.947962] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI T=
X controller v2.13a with HDCP (SAMSUNG HDMI TX PHY)=0A=
> > > > [ =A0 =A01.949220] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered Desi=
gnWare HDMI I2C bus driver=0A=
> > > > [ =A0 =A01.956365] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.d=
isplay-controller on minor 0=0A=
> > > > [ =A0 =A02.016601] imx-lcdif 32fc6000.display-controller: [drm] fb0=
: imx-lcdifdrmfb frame buffer device=0A=
> > > > [ =A0 =A08.380915] systemd[1]: Starting Load Kernel Module drm...=
=0A=
> > > >=0A=
> > > >=0A=
> > > > I also checked that the display's modeline is recognized under sysf=
s :=0A=
> > > >=0A=
> > > > root@imx8mp-debix:~# ls /sys/class/drm/card0-HDMI-A-1/=0A=
> > > > connector_id =A0dpms =A0 =A0 =A0 =A0 =A0modes =A0 =A0 =A0 =A0 subsy=
stem/=0A=
> > > > ddc/ =A0 =A0 =A0 =A0 =A0edid =A0 =A0 =A0 =A0 =A0power/ =A0 =A0 =A0 =
=A0uevent=0A=
> > > > device/ =A0 =A0 =A0 enabled =A0 =A0 =A0 status=0A=
> > > >=0A=
> > > > However, there is still no HDMI output on the display. Instead,=0A=
> > > > I only see a white blinking cursor on the screen.. I'm not sure=0A=
> > > > what I'm missing.=0A=
> > >=A0=0A=
> > > The white blinking cursor means the display is working from the kerne=
l=0A=
> > > point of view. What are you expecting, are you running an X server or=
=0A=
> > > Wayland compositor ?=0A=
> >=0A=
> > I'm expecting to see the Ubuntu desktop environment on the HDMI=0A=
> > display =97 just like how it appears with the original prebuilt image p=
rovided=0A=
> > by Debix. I'm running the default Ubuntu 22.04 LTS prebuilt image, and =
I only=0A=
> > replaced the Image and .dtb file=0A=
> >=0A=
> > I'm not explicitly launching an X server or Wayland compositor myself=
=0A=
> >=0A=
> > However, based on your response, I now realize that I may also need to=
=0A=
> > enable GPU support in the mainline device tree. Specifically, I believe=
 I=0A=
> > need to enable the gpu2D and gpu3D nodes to allow the graphical=0A=
> > environment to start properly and render the desktop over HDMI.=0A=
> >=0A=
> > Does that sound correct, or is there anything else I should check or=0A=
> > enable?=0A=
>=A0=0A=
> That's a plausible explanation. The 2D GPU is probably not used by the=0A=
> compositor, but a 3D GPU could be required. I'd recommend checking the=0A=
> system logs to see why the compositor (or session manager) failed to=0A=
> start.=0A=
=0A=
I reviewed the system logs for more context regarding the failure of the =
=0A=
compositor (or session manager) to start.=0A=
=0A=
Here are some relevant log entries from journalctl -b -p err:=0A=
=0A=
debix@imx8mp-debix:~$ journalctl -b -p err=0A=
Hint: You are currently not seeing messages from other users and the system=
.=0A=
      Users in groups 'adm', 'systemd-journal' can see all messages.=0A=
      Pass -q to turn off this notice.=0A=
Apr 10 06:37:29 imx8mp-debix pulseaudio[766]: GetManagedObjects() failed: o=
rg.freedesktop.systemd1.NoSuchUnit: Unit dbus-org.bluez.serv>=0A=
Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Application laun=
ched by gnome-session-binary.=0A=
Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Application laun=
ched by gnome-session-binary.=0A=
Apr 10 06:37:30 imx8mp-debix systemd[757]: Failed to start GNOME Shell on W=
ayland.=0A=
=0A=
Additionally, from journalctl -b | grep -i gnome, the following lines appea=
r to be significant:=0A=
=0A=
Apr 10 06:37:29 imx8mp-debix systemd[757]: org.gnome.Shell@x11.service: Ski=
pped due to 'exec-condition'.=0A=
Apr 10 06:37:29 imx8mp-debix systemd[757]: Started GNOME Shell on X11.=0A=
Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Running GNOME Shell (using m=
utter 42.9) as a Wayland display server=0A=
Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: g_hash_table_destroy: assert=
ion 'hash_table !=3D NULL' failed=0A=
Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to open gpu '/dev/dri=
/card0': No suitable mode setting backend found=0A=
Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Added device '/dev/dri/card1=
' (imx-lcdif) using atomic mode setting.=0A=
Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to setup: No GPUs wit=
h outputs found=0A=
=0A=
the GNOME Shell logs indicate that no GPUs with outputs were found but the =
dmesg =0A=
output suggests that the GPU is successfully probed and initialized:=0A=
=0A=
debix@imx8mp-debix:~$ dmesg | grep -i -e drm -e gpu -e galcore -e etnaviv=
=0A=
[    2.156784] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)=0A=
[    2.157294] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)=0A=
[    2.157753] etnaviv etnaviv: bound 38500000.npu (ops gpu_ops)=0A=
[    2.157852] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6204=0A=
[    2.157986] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341=0A=
[    2.158111] etnaviv-gpu 38500000.npu: model: GC8000, revision: 8002=0A=
[    2.158118] etnaviv-gpu 38500000.npu: etnaviv has been instantiated on a=
 NPU, for which the UAPI is still experimental=0A=
[    2.158905] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0=0A=
[    2.161597] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-contr=
oller on minor 1=0A=
[    2.161637] imx-lcdif 32fc6000.display-controller: [drm] Cannot find any=
 crtc or sizes=0A=
[   10.201152] systemd[1]: Starting Load Kernel Module drm...=0A=
=0A=
I have not yet identified a conclusive reason for GNOME Shell's failure to =
start.  =0A=
=0A=
However, since my primary objective was to preview the camera output =0A=
on the display, I initially suspected the issue might be related to the HDM=
I =0A=
display, as I encountered errors while using autovideosink. After your =0A=
confirmation that the display was functioning correctly, I explored alterna=
tive =0A=
video sinks and was able to successfully achieve a working preview using =
=0A=
fbdevsink.=0A=
=0A=
I may revisit the GNOME Shell issue when time permits. If you have any =0A=
suggestions or insights regarding the compositor or GPU setup failure, I=92=
d be =0A=
happy to take them into consideration.=0A=
=0A=
Best regards,=0A=
Tarang=0A=
=0A=
> > > > Could you please help me out or point me in the right direction?=0A=
> > > >=0A=
> > > > Thank you for your time.=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Laurent Pinchart=
