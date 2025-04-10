Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2AA842D2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9034E10E97C;
	Thu, 10 Apr 2025 12:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazon11020074.outbound.protection.outlook.com [52.101.227.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7D310E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:17:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF4YVjhIPWiCErdPPAZDLuS05p9buYQp9OVfWQ4BpgtshWkhOHPjXAILksJnJd4rvL0zLUIiuqdhbHIo3l9C1Z1o7aynCLMjZbV1X+st1y3VBf81nLt1oX4b0sqklVKN8CcoNanpnVwWiY9pmSJtBekSpG7P9gap+7l6gPiWQ6WNuMOJrQc4bWPznJLIj7/xFT9WHaoSbRjyPGG5B4xOdc9+1B2B1ifwo0AVG/ikKvaSFFnX/SWK/eyMcvlouoy/A+UMl1sJq5JmjEYWOLHP6OKdTiPBGi17Xz5I3ZDkfxyKifuyOxXu/4a5Z2IXnVsJ0nJZl7YAVBQMJ/Y226DdtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUZ/l37Wz2yMdScK0WHwpEVRTffDr5UdvCQHbaWtr3E=;
 b=fFW2wwY3glKG86gPjPPRQm8kWGZTdKALI255Yk/4TUE9A23eZpf/0Fywf8kwUkb9mmjNDHNqtUXb2LLyVpVnDrugjT2syLRJ8Y1LwNEjwxwJwVWHy+AZtI/skVDrLnVW4pVOFsakEyou6uDX2NrWOSvfRh6HgTkgR+ydzfj2JUriV2U/C9rJXaF/+U0HOY0mx0wb8suTHmY2vNipYZU+PIJK/+Keu4bsJogzRtHueZJ1x+h2SLPgFmQfj25VImBNTixqyxSmQYjGI0r0PFNSxfsc1nvkyWQiDZ+iJuQG6EmFVvHw3G63J1vjSainT9lzhxpkd+wB2yOMN70jyX6UBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3581.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 12:17:40 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 12:17:40 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: Need Help Enabling HDMI on Debix Model A
Thread-Topic: Need Help Enabling HDMI on Debix Model A
Thread-Index: AQHbp61bJ8rSy9+zQkebTS5KwgzRBLOYK2mAgAAM5vOAA553AIAAsMExgAA5UQCAAAUpFYAAC6qAgAACaVk=
Date: Thu, 10 Apr 2025 12:17:39 +0000
Message-ID: <PN3P287MB18297BA6136E775CA64E9AE68BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <PN3P287MB1829E84B6B79E9C7189D7CB78BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250407130257.GD3924@pendragon.ideasonboard.com>
 <PN3P287MB1829692B4C3D5AD273CB62DE8BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250409210504.GB12162@pendragon.ideasonboard.com>
 <PN3P287MB18297239252C1032A05686558BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250410110250.GB24866@pendragon.ideasonboard.com>
 <PN3P287MB18297DA8D651F08CA323A7578BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250410120303.GA18835@pendragon.ideasonboard.com>
In-Reply-To: <20250410120303.GA18835@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3581:EE_
x-ms-office365-filtering-correlation-id: e63bc532-3c17-4400-0300-08dd7829b018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?EHNjCm4+53Tb/GB0b+4v7P1raF22mk1MIqeYa3FqPLag5VNgIi2Tg5Qw?=
 =?Windows-1252?Q?FLap7k9uyzV9Vv20wuvkyNySM0kbzlgZWNRW8ftYCb2xEoDn4Y9qjcKv?=
 =?Windows-1252?Q?YCpl9a25FvQP629BRnDgzLiYi9cTlg/86LWgaSsZa+VQR/TrygDhnVgL?=
 =?Windows-1252?Q?DETkHPekjMM/htaFnCCRAgCYUhnhJV9+dP1JFb8LHu0JaK4AS50sKv5C?=
 =?Windows-1252?Q?sqgaHfaCbTrfpuqBe8dIZ3JbixyhXQe4KfLrbwc6c1fnkbfWbpFWuU5z?=
 =?Windows-1252?Q?tDYIKo54ZjwQg+KsG79V0YYSL1zSH/qXG3oPZUlXp3w8YeS52Dt6d2CN?=
 =?Windows-1252?Q?NyUJEIYkQWoj0t22kvyeVd8XaH8YNKxhOp6pe3xq5cdWcV9ob1Q7Pw5M?=
 =?Windows-1252?Q?/lcGeIJOv2g7lJef+4Y7Rinxpg78GvsKE0wjO65S3kiN27L+XmlpRmVd?=
 =?Windows-1252?Q?u9UyWPlX01hx9TvMZPugfYSwYId1PXLlidW5MDiHP42vmsXV49H/cB3N?=
 =?Windows-1252?Q?YGmaW1gMfHu9SeWdhYmXuezmrMa3jsZDZy5z/7UnJDm2JzUbrn/5AwMl?=
 =?Windows-1252?Q?QyE5bPjL1PdFL+ISfjJx+gI5RgPw88nWHhFytkDfoJb0eMgW7KMDz+RR?=
 =?Windows-1252?Q?6IKRa5N11s0CpAO/rZr9KifGFPYPo+Ce91AuTMCVu1DOCasYjwqVyA1A?=
 =?Windows-1252?Q?+nevg7UKrKYRgN0MVdDsJVHhBWIrfJqMBpcAZLyoEOfjV36p0jg7RYBm?=
 =?Windows-1252?Q?UEEpJ0Jk3kCIOSdQjEQEpO7bjLk+BJmtYQElLy+pKs1rs9dlS6596pkL?=
 =?Windows-1252?Q?HckRcnz5hZMKmXwGum4TjFme/eQ5mWi1K1IZTedFCP34Ky2lhjtDLm6M?=
 =?Windows-1252?Q?BvcSNy2QyNKdAwtxcuwrVBZ/X5cVlasuRrJW5CY2/25XuUQmEU5s3siq?=
 =?Windows-1252?Q?wg97713ejEh2q1Pm3kLZH2A9E+tGPDXp8I/O0ZwW0t19DNgx+qxAkL5u?=
 =?Windows-1252?Q?tbO6r6Gs9QpkWKg4hEQuISM7El7wE4b9yjS4XaPwyWH5F2l/G46qV7jE?=
 =?Windows-1252?Q?VNBvACe5lxZnRAQ9rUUnoRvkVDbTRUUhj0e3f83a97KhisRFRAQy02nO?=
 =?Windows-1252?Q?HHYC3GQwXatwkNx+Mj8JQ6Rncd2nMbM0AqtlDvqG+aSh7h9GOLQnQMTX?=
 =?Windows-1252?Q?n5gxvxBy3TEnNRpfSLEdFgubpX/J59NrA29ZCHO0Ka/2bUGReUCOu+rH?=
 =?Windows-1252?Q?MXVOi/N9/n6zHWSXSogJ7idOQm0KAUOiVl9RC2XlM0PyFxCqXIRcKV2u?=
 =?Windows-1252?Q?F9l/5Me4HIJtSlod4MuKLrX0w2AKMyEVfNreALgv2ycoDgkB9l0JSdj5?=
 =?Windows-1252?Q?DmTi3owHrJT5MNoXvbiOpTHSktiuzrdmoIQS96Zx8ppJHsIjRIM0kNPv?=
 =?Windows-1252?Q?4UC9pmvwN+Qguu7lbKVSzLXsgpJzcQJM04Tx9tb9hVb3Xx0e5ZKi1l/S?=
 =?Windows-1252?Q?uy6ehwYxDlh3icrPszQOBASR7Du5WYUc3g90x+c91k1dT0oZOgatPdHN?=
 =?Windows-1252?Q?SlmzIEx9sRqNOS55VzsMLLT7rLYMvoikse+ODg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?0hEiDM5SKJnK606kwwAcLU0p4zX++o4gkvcf7iZz7NevBSLf8roW7drX?=
 =?Windows-1252?Q?cNfatI2EjbhtALUrKk63mb9/xhNBDyZFQj7KZStk6GgPpJAwD3MPkxhs?=
 =?Windows-1252?Q?Mbwvq16gxkYPoDbxcEL0iCZm6b+e7VA0XSCQzM5ysc9fohvYal34onSC?=
 =?Windows-1252?Q?Ji8RrTrxyXD5msXMY7s/vU/x+EirQKDc6x2OMI/1pmRngFtCC2XH2SPm?=
 =?Windows-1252?Q?g5Qu43gwisEG5pLMnxDvVfJv3Q700Wa81jAZNbBRP7i9LXzNtTtGD5x8?=
 =?Windows-1252?Q?qcsUeOnDs/wMNvl/b2JZsIqZlsIB2nXYFaYKtFueI2CpMTdlTiing+fY?=
 =?Windows-1252?Q?0BUaXG6MLRteFEmy6MmxEZmbjUQmofmjmz6Nsf8WSP7Qb36UV2YDy7c5?=
 =?Windows-1252?Q?QokQbCIjAgZoRW1h16SVcYE6dkhdnNItQ4X1HOufOzX7I5GVn+zZIF5+?=
 =?Windows-1252?Q?Q8jY6aIfyf1XplByO0dOggmLsgBK3TUiyqdH/iFnmiGjJAFcXx1/q9NI?=
 =?Windows-1252?Q?F8naQqQHdU9p1MQxTlDMPhMahjjYPlDOLyJRCvnqcg24PJwY/GiYTQTR?=
 =?Windows-1252?Q?OZV3KKRpyi3P4swIGeeyi1BiQ0296xLnXFJDr5OuUX3KFdqEvK5xSBcY?=
 =?Windows-1252?Q?WTefdK//Ivj6MWRHW3D2e+FMAuQe7qrWN+1xIBoN0VVtbCGxB/mojJMu?=
 =?Windows-1252?Q?EjtVPgX3+dRDjR/e3rBH0O9+Xr+kUsjulku28fRhztNaZdOeVKG8mxph?=
 =?Windows-1252?Q?HN0oP4auUH2MdwR6cI7cRtjuCN7QS9+qn0I0yJrnfoCgQYtizNZfc8l4?=
 =?Windows-1252?Q?Yf7JH5jOPRPLcMt12odel+5tA6EpkJDBWAQzKonLV5m5X/caBKRr9TXx?=
 =?Windows-1252?Q?X8cZDGTTk1Bg9/ZXd4ddkuwyYqQ79Y+KbEH+3jnmE71Vbvp4nPH6qt9I?=
 =?Windows-1252?Q?HyXHnC625Fk4wgwBcmGRSeUQKOiLFnyq1IJABnCn5Mh633RgPSq1wWZT?=
 =?Windows-1252?Q?E1MxHtZFLx+40zXIIczvCa1fFp88rEDtWU1K/KgvexkVLWWlzWW0UOdz?=
 =?Windows-1252?Q?I/ObXva4NU+aVHILKtYpB4pww/ysema5MKx6xhzeTHjwJMBzwcJ/swZV?=
 =?Windows-1252?Q?5U1lZvTVTzy6mZvyCwzPtbOfwVjA7yTE9LnQ/cOh+UILt8ZGqAuvYMNs?=
 =?Windows-1252?Q?ouCo6ZqFU+ihmMHK9MR+VVs5ersNkV97x83H0K5pQWB6X84zqyEC5ob9?=
 =?Windows-1252?Q?oftSpF9IvPgrIHHHFYGQRi0thyK/zqQWxPqc3awkOlwBxOgQErIsWNtR?=
 =?Windows-1252?Q?WZUlt4VwdvgPrqy5LTHLsWCMyik/4J6pgCDdLjLtG1IlziEhNi38iFyi?=
 =?Windows-1252?Q?AwXZErlgxnXA3fG8GWVU3DTwGVqeV/pYomjOkWjUJksAx3RUuidG9PF9?=
 =?Windows-1252?Q?96YSQVUhafYjqxTbL9Qx555NhFj7Bmhc894zsVWRfdOJ+ePAS7BarM2u?=
 =?Windows-1252?Q?eSkhDwcZ/ByA+Q0Z0w5f9cAF27O/ssU6Q8hpDqXZ+/lw6tYZUxUd/6Qc?=
 =?Windows-1252?Q?8HeXkn3mwcO8CbzuGH7B7uinoJba2BFtCJ36wFoINMivcUP2atge/qBn?=
 =?Windows-1252?Q?htCllrc5m8p0Qu94M9nSJjOSVSSw/k8qNZcYum9+++XINIcG4e0ptOU/?=
 =?Windows-1252?Q?2UTKaujmj9rlRsGgpy9Uk+CmCe6Sb5NFFugdpd7k70BGtOq6YyH2bA?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e63bc532-3c17-4400-0300-08dd7829b018
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 12:17:39.9266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+bPL1QrHKxn/hG3cYXfVnp5cBHDOrfO1MxDM+jpKuTRoemw86NviWnkJeuRSbPhYC9y4Uc3Ca2WLrUQ19N1AAjOH5RGjEE2nFBNxlwKyg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3581
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

> On Thu, Apr 10, 2025 at 11:33:08AM +0000, Tarang Raval wrote:=0A=
> > > On Thu, Apr 10, 2025 at 08:13:17AM +0000, Tarang Raval wrote:=0A=
> > > > > On Mon, Apr 07, 2025 at 02:06:35PM +0000, Tarang Raval wrote:=0A=
> > > > > > > On Mon, Apr 07, 2025 at 11:10:23AM +0000, Tarang Raval wrote:=
=0A=
> > > > > > > > Hi Laurent,=0A=
> > > > > > > >=0A=
> > > > > > > > I=92m trying to bring up HDMI on the Debix Model A board us=
ing the=0A=
> > > > > > > > mainline kernel, but I=92m currently facing issues.=0A=
> > > > > > > >=0A=
> > > > > > > > I saw that you tested the patch for HDMI support on this bo=
ard in=0A=
> > > > > > > > mainline, so I am hoping you could help me figure out what =
might be=0A=
> > > > > > > > missing.=0A=
> > > > > > > >=0A=
> > > > > > > > To clarify =97 I'm using the prebuilt image provided by Deb=
ix, but I replaced=0A=
> > > > > > > > the kernel image and the device tree (DTS) file in the /boo=
t directory with=0A=
> > > > > > > > ones built from the mainline kernel.=0A=
> > > > > > > >=0A=
> > > > > > > > I=92ve enabled the following configurations in the kernel:=
=0A=
> > > > > > > > CONFIG_DRM_DISPLAY_CONNECTOR=3Dy=0A=
> > > > > > > > CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=3Dy=0A=
> > > > > > > > CONFIG_DRM_IMX8MP_HDMI_PVI=3Dy=0A=
> > > > > > > > CONFIG_DRM_IMX_LCDIF=3Dy=0A=
> > > > > > > > CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=3Dy=0A=
> > > > > > > >=0A=
> > > > > > > > When I boot the board, I see the following HDMI/DRM related=
 logs:=0A=
> > > > > > > > debix@imx8mp-debix:~$ dmesg | grep -iE "drm|hdmi"=0A=
> > > > > > > > [    0.121979] /soc@0/bus@32c00000/display-bridge@32fc4000:=
 Fixed dependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000=0A=
> > > > > > > > [    0.122164] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dep=
endency cycle(s) with /soc@0/bus@32c00000/display-bridge@32fc4000=0A=
> > > > > > > > [    0.127417] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dep=
endency cycle(s) with /hdmi-connector=0A=
> > > > > > > > [    0.127608] /hdmi-connector: Fixed dependency cycle(s) w=
ith /soc@0/bus@32c00000/hdmi@32fd8000=0A=
> > > > > > > > [    1.947962] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HD=
MI TX controller v2.13a with HDCP (SAMSUNG HDMI TX PHY)=0A=
> > > > > > > > [    1.949220] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered =
DesignWare HDMI I2C bus driver=0A=
> > > > > > > > [    1.956365] [drm] Initialized imx-lcdif 1.0.0 for 32fc60=
00.display-controller on minor 0=0A=
> > > > > > > > [    2.016601] imx-lcdif 32fc6000.display-controller: [drm]=
 fb0: imx-lcdifdrmfb frame buffer device=0A=
> > > > > > > > [    8.380915] systemd[1]: Starting Load Kernel Module drm.=
..=0A=
> > > > > > > >=0A=
> > > > > > > >=0A=
> > > > > > > > I also checked that the display's modeline is recognized un=
der sysfs :=0A=
> > > > > > > >=0A=
> > > > > > > > root@imx8mp-debix:~# ls /sys/class/drm/card0-HDMI-A-1/=0A=
> > > > > > > > connector_id  dpms          modes         subsystem/=0A=
> > > > > > > > ddc/          edid          power/        uevent=0A=
> > > > > > > > device/       enabled       status=0A=
> > > > > > > >=0A=
> > > > > > > > However, there is still no HDMI output on the display. Inst=
ead,=0A=
> > > > > > > > I only see a white blinking cursor on the screen.. I'm not =
sure=0A=
> > > > > > > > what I'm missing.=0A=
> > > > > > > =0A=
> > > > > > > The white blinking cursor means the display is working from t=
he kernel=0A=
> > > > > > > point of view. What are you expecting, are you running an X s=
erver or=0A=
> > > > > > > Wayland compositor ?=0A=
> > > > > >=0A=
> > > > > > I'm expecting to see the Ubuntu desktop environment on the HDMI=
=0A=
> > > > > > display =97 just like how it appears with the original prebuilt=
 image provided=0A=
> > > > > > by Debix. I'm running the default Ubuntu 22.04 LTS prebuilt ima=
ge, and I only=0A=
> > > > > > replaced the Image and .dtb file=0A=
> > > > > >=0A=
> > > > > > I'm not explicitly launching an X server or Wayland compositor =
myself=0A=
> > > > > >=0A=
> > > > > > However, based on your response, I now realize that I may also =
need to=0A=
> > > > > > enable GPU support in the mainline device tree. Specifically, I=
 believe I=0A=
> > > > > > need to enable the gpu2D and gpu3D nodes to allow the graphical=
=0A=
> > > > > > environment to start properly and render the desktop over HDMI.=
=0A=
> > > > > >=0A=
> > > > > > Does that sound correct, or is there anything else I should che=
ck or=0A=
> > > > > > enable?=0A=
> > > > > =0A=
> > > > > That's a plausible explanation. The 2D GPU is probably not used b=
y the=0A=
> > > > > compositor, but a 3D GPU could be required. I'd recommend checkin=
g the=0A=
> > > > > system logs to see why the compositor (or session manager) failed=
 to=0A=
> > > > > start.=0A=
> > > >=0A=
> > > > I reviewed the system logs for more context regarding the failure o=
f the=0A=
> > > > compositor (or session manager) to start.=0A=
> > > >=0A=
> > > > Here are some relevant log entries from journalctl -b -p err:=0A=
> > > >=0A=
> > > > debix@imx8mp-debix:~$ journalctl -b -p err=0A=
> > > > Hint: You are currently not seeing messages from other users and th=
e system.=0A=
> > > >       Users in groups 'adm', 'systemd-journal' can see all messages=
.=0A=
> > > >       Pass -q to turn off this notice.=0A=
> > > > Apr 10 06:37:29 imx8mp-debix pulseaudio[766]: GetManagedObjects() f=
ailed: org.freedesktop.systemd1.NoSuchUnit: Unit dbus-org.bluez.serv>=0A=
> > > > Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Applicat=
ion launched by gnome-session-binary.=0A=
> > > > Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Applicat=
ion launched by gnome-session-binary.=0A=
> > > > Apr 10 06:37:30 imx8mp-debix systemd[757]: Failed to start GNOME Sh=
ell on Wayland.=0A=
> > > >=0A=
> > > > Additionally, from journalctl -b | grep -i gnome, the following lin=
es appear to be significant:=0A=
> > > >=0A=
> > > > Apr 10 06:37:29 imx8mp-debix systemd[757]: org.gnome.Shell@x11.serv=
ice: Skipped due to 'exec-condition'.=0A=
> > > > Apr 10 06:37:29 imx8mp-debix systemd[757]: Started GNOME Shell on X=
11.=0A=
> > > > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Running GNOME Shell =
(using mutter 42.9) as a Wayland display server=0A=
> > > > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: g_hash_table_destroy=
: assertion 'hash_table !=3D NULL' failed=0A=
> > > > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to open gpu '=
/dev/dri/card0': No suitable mode setting backend found=0A=
> > > =0A=
> > > I don't know how gnome-shell finds the GPU, if Ubuntu ships a modifie=
d=0A=
> > > version, or possibly configuration files specific to the closed-sourc=
e=0A=
> > > GPU stack shipped with the BSP kernel. It could also be that the mesa=
=0A=
> > > version they ship does not support the upstream kernel driver. You wi=
ll=0A=
> > > have to investigate all this.=0A=
> >=0A=
> > I need to verify the compatibility between the kernel GPU driver (etnav=
iv),=0A=
> > the Mesa library version, and GNOME Shell on my Ubuntu image, is that c=
orrect?=0A=
> >=0A=
> > you're suggesting that the prebuilt Ubuntu image might be expecting a=
=0A=
> > proprietary GPU driver provided by the BSP kernel is that what you mean=
t?=0A=
> =0A=
> Yes, possibly. I don't know what is shipped in that image, but I know=0A=
> it's common for board vendors to ship images with customized components.=
=0A=
=0A=
Okay, I will check =0A=
=0A=
> > > > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Added device '/dev/d=
ri/card1' (imx-lcdif) using atomic mode setting.=0A=
> > > > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to setup: No =
GPUs with outputs found=0A=
> > > >=0A=
> > > > the GNOME Shell logs indicate that no GPUs with outputs were found =
but the dmesg=0A=
> > > > output suggests that the GPU is successfully probed and initialized=
:=0A=
> > > >=0A=
> > > > debix@imx8mp-debix:~$ dmesg | grep -i -e drm -e gpu -e galcore -e e=
tnaviv=0A=
> > > > [    2.156784] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)=0A=
> > > > [    2.157294] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)=0A=
> > > > [    2.157753] etnaviv etnaviv: bound 38500000.npu (ops gpu_ops)=0A=
> > > > [    2.157852] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6=
204=0A=
> > > > [    2.157986] etnaviv-gpu 38008000.gpu: model: GC520, revision: 53=
41=0A=
> > > > [    2.158111] etnaviv-gpu 38500000.npu: model: GC8000, revision: 8=
002=0A=
> > > > [    2.158118] etnaviv-gpu 38500000.npu: etnaviv has been instantia=
ted on a NPU, for which the UAPI is still experimental=0A=
> > > > [    2.158905] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor=
 0=0A=
> > > > [    2.161597] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.displ=
ay-controller on minor 1=0A=
> > > > [    2.161637] imx-lcdif 32fc6000.display-controller: [drm] Cannot =
find any crtc or sizes=0A=
> > > =0A=
> > > This doesn't seem right. Here's the corresponding part of my boot log=
:=0A=
> > > =0A=
> > > [    3.347606] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX cont=
roller v2.13a with HDCP (SAMSUNG HDMI TX PHY)=0A=
> > > [    3.352436] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWare=
 HDMI I2C bus driver=0A=
> > > [    3.378609] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)=0A=
> > > [    3.379829] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)=0A=
> > > [    3.381695] etnaviv etnaviv: bound 38500000.npu (ops gpu_ops)=0A=
> > > [    3.382290] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 620=
4=0A=
> > > [    3.383178] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341=
=0A=
> > > [    3.383735] etnaviv-gpu 38500000.npu: model: GC8000, revision: 800=
2=0A=
> > > [    3.383753] etnaviv-gpu 38500000.npu: etnaviv has been instantiate=
d on a NPU, for which the UAPI is still experimental=0A=
> > > [    3.386818] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0=
=0A=
> > > [    3.390018] stackdepot: allocating hash table of 131072 entries vi=
a kvcalloc=0A=
> > > [    3.399113] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display=
-controller on minor 1=0A=
> > > [    3.523021] Console: switching to colour frame buffer device 180x5=
6=0A=
> > > [    3.539272] imx-lcdif 32fc6000.display-controller: [drm] fb0: imx-=
lcdifdrmfb frame buffer device=0A=
> >=0A=
> > Thank you for sharing this.=0A=
> >=0A=
> > One last question: Is this log from the mainline kernel?=0A=
> > If so, did you apply any external patches to the GPU driver to make it =
work?=0A=
> =0A=
> Yes, that was from a v6.14-rc1 kernel. I'm compiling v6.15-rc1 now. I=0A=
> haven't applied any patch to the GPU driver.=0A=
=0A=
okay=0A=
=0A=
Thank you very much for all your help.=0A=
=0A=
Best regards,=0A=
Tarang =0A=
=0A=
> > > > [   10.201152] systemd[1]: Starting Load Kernel Module drm...=0A=
> > > >=0A=
> > > > I have not yet identified a conclusive reason for GNOME Shell's fai=
lure to start.=0A=
> > > >=0A=
> > > > However, since my primary objective was to preview the camera outpu=
t=0A=
> > > > on the display, I initially suspected the issue might be related to=
 the HDMI=0A=
> > > > display, as I encountered errors while using autovideosink. After y=
our=0A=
> > > > confirmation that the display was functioning correctly, I explored=
 alternative=0A=
> > > > video sinks and was able to successfully achieve a working preview =
using=0A=
> > > > fbdevsink.=0A=
> > > >=0A=
> > > > I may revisit the GNOME Shell issue when time permits. If you have =
any=0A=
> > > > suggestions or insights regarding the compositor or GPU setup failu=
re, I=92d be=0A=
> > > > happy to take them into consideration.=0A=
> > > >=0A=
> > > > > > > > Could you please help me out or point me in the right direc=
tion?=0A=
> > > > > > > >=0A=
> > > > > > > > Thank you for your time.=0A=
> =0A=
> --=0A=
> Regards,=0A=
> =0A=
> Laurent Pinchart=
