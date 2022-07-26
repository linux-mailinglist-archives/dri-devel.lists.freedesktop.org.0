Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02733580AEC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6939910F1BA;
	Tue, 26 Jul 2022 06:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ED510F1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj7mFLGYP5K/ZraBuVAwcf2I4WjAs7cVz3CpAzXXFQtwx7yzAFVU7Sy8FozPg+JysQ51htwtQbQhAT3MMItbJEwDjPfRjKQY5vJ7SDXkzLVWcYlkF1Wv9JyhekWA6ErZ/Hik5nzPAe7WFsuh18dNU3xDgvrMjSOZKaiPv7sFaouzqRNwKzIpT+9DrqBnHdMiSLfjfyQUDd7k+9fQiY8m53xQq7lGDUf5XEFQ7Yfx8ANUzA31jrRG8dWSwSREuNPx2Dc0s0NByqxg/y1uIV57v27CLPQfsr6xvHXZiwJARkMwTutFGgOAknODvtGCVe9avsA1qkUl3a4nAd6eQW0cBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuRHdKr5rlFwdXuzj0kYzP45f7W/qmmxTTFm97mLaNc=;
 b=Yv/WK003dcMJU+dA7LpDsSuQp5x+8kxUmxLJLKE5MppmJXd7qHc2aAYJfrOSlWCDhEY2yvA2bwsZDC+TiMAf2SCJ9ueOE4yaUg/YgovlI/cihDf90rm8F5TwY5NQcNwmd9hBHCFia0tgliM4JHxevAY8zlkc2ZykgCP1w5LiQL09hsKXmXue9Z715sjuT3Yiyrxa7YUUiGpJu5LhioxvsZgl735qc8wvHfg0LDXJ+WrSlQn7E1sAJ80yDxnsghKIL2wZHNGD6eu0eMbaAlB3te6sjjwSv2vFdkE/RZx13BFoiKxH8RJhjKQzOZXnSWMvhbvopWTxv7TzQeyeajgiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuRHdKr5rlFwdXuzj0kYzP45f7W/qmmxTTFm97mLaNc=;
 b=lgzYj33qLCzaGs8jwMzoKVRvFys9HIc+oTmZ5nzhOnjQxOE332Nq4wJCQ+dMzIA4YmzAP/jYK3FB/Bee0HKEkxtJ7+xGL3817Rf43MbK9uUjuokto8MOZl68GDJVVKwbZYpda4bfwfQaDTSRw6lhG6LJ/FZAG6xrZX2dxUQOIyQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB2668.jpnprd01.prod.outlook.com (2603:1096:404:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Tue, 26 Jul
 2022 06:03:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 06:03:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH v4 0/2] Add RZ/G2L Display support
Thread-Topic: [PATCH v4 0/2] Add RZ/G2L Display support
Thread-Index: AQHYnf80GycMyyTrHUej+1/WpT8BZq2QJZxw
Date: Tue, 26 Jul 2022 06:03:36 +0000
Message-ID: <OS0PR01MB59226CE75483AD2B96833B3786949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220722191353.544516-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220722191353.544516-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29d04aa1-0c93-4387-be82-08da6ecc948a
x-ms-traffictypediagnostic: TY2PR01MB2668:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AYhwxyfuoqRGfdGokqJFwdTSjQVaJ5AnnnW+gyP3t8gnBk18/cx/yGMcyIpnANGAoO9TegD0/jzM7H6lOxqbdUyhrCc94oIu6OMU1bX3JzFSFdJY3USjyoxP0i/C6dT0wWbnRhBXmdCLbV7eZl6w3wMFvLVAtRWsvJuzfiVikffZZpFBA15qYfiEbc8bkIGtEX5T2Ilkly1QRYt9SG4F66vgPvGqUXiagT0pfzbpxnMLnqkKbDNOunN9RwA3oHh620uCrVT6xwsJ0oKA4g14D6RVTuXsvCVQ6ZTSddqLhvoWvsq0mVNKOMZu0x74laQjpVV9x77Zmqyu1Ot9yoOqo+r3SUazYS/8Rxl67iZcs/g0YpnKeoI2iZOGcpF2qifOr+0tj4OjhLFp+Nvvd1dgQW4eYA4w0g+uuAJbzz7VyveF5qM8iojW0oTAvbrk10oIj2sjRyAQhWW+90m/Et7wCh8VO7vXZSDncrSJU03ZFbgvektGmUU1YTFncieR0CITl7bQzospx0jh946GLOuiYPr8wJ2I7/1U//ZEHDGqAOBdTUKunDcxY6Gx14t/GjyE64X/bv2L3AgrbhUvedNUogwetk/j3DBv1TDXCkJOlzrT5LVFKSgbZpPrlMjbtgKDCgUuCyfrEqQIPWL121Fsdl6HPxgEQGE/2wrN63gly2dXpYHPXSJYkyvcWC27EePYhTGsR6uzWwnjd1tDwRoRE5r+/cnbnAvtpk0q2HoM8kp0CdilsGA9DGbBWSexxPFUZZzztE7pXyjOj4NZLArDN4U96346080zpWH4Y+TYvXE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(26005)(6506007)(83380400001)(122000001)(38100700002)(186003)(71200400001)(2906002)(54906003)(41300700001)(478600001)(316002)(66446008)(64756008)(4326008)(66946007)(110136005)(55016003)(66556008)(9686003)(52536014)(8936002)(30864003)(66476007)(8676002)(38070700005)(7696005)(33656002)(5660300002)(40140700001)(86362001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6n/cYjKn2/pVcQlpaAR7U9lqS5E164+iQGBCc7vFMp87zfKdKec0tLlrS6G1?=
 =?us-ascii?Q?wgrEIZSgLuwo/psEO7fUgajHv/8PvZwoCVMiN1C4uEOlNIkqL0C5h3qN+EPa?=
 =?us-ascii?Q?fyMuJUtwXZ63fLWJKyqmaWJNodN1/Md5/BFT5I7id6XdIz+0vRKAQ9lMVBzZ?=
 =?us-ascii?Q?xmVr1B0GiXfvKIfwmP2KrL2zTtNinbScJgEZmOCAsmOpGLLpho6Hvgt3GSmK?=
 =?us-ascii?Q?TauIKE56SuVFMAuVSnntkfYbXEdmH4nN/cbQQSBAIahIkZ3Zs+LDWCVqPZEQ?=
 =?us-ascii?Q?PBbm4YWVRDDwXYTqKiJERX9s/zWgPGDErCRgakdneEfReRJzZvGMHTe8kN1J?=
 =?us-ascii?Q?kh1CZxC3di+9Ay6HoAckOqYa+PV+XoZFZainkXYtjXBk5Y4OnnERwUCzR84F?=
 =?us-ascii?Q?kTJPpXuCz4sV2cdIJPPofzDAj0F27y4dsJDKeBDe156zQSnPDCESUXGPf7xw?=
 =?us-ascii?Q?Rb5nHsOCPyh+5SlXNhwJGgWjN0axAUxP+eOcc30myyMPOjEWhAiZ7nf3ZS7Z?=
 =?us-ascii?Q?zWS51cj+uqgWAbKaJXGn2a3aDHpFy+2KO3dSFSvWWUKcvB95MNos5lVRbtmL?=
 =?us-ascii?Q?Rb+Fp/aj44wryYe74mmWyuXOt6qpNR05JzoMDB0z19V0iqRYN31ALMZ+hkfE?=
 =?us-ascii?Q?t1V3bQBUS7o6kCqaLhufrEJobU7SBhWAWheqYBwQ7CmyDgB5B3ED1qhOGp3p?=
 =?us-ascii?Q?XQ/iyOcXhGOqCygZGooqOOyfZ4+xhmjBD/H97o1DykOW6Xi8mKfHFnMznrFi?=
 =?us-ascii?Q?MDIwW94oQeScGTPoZj7fH9uT9je01mvNaxEXA/YkRq8YoWZmypux/lfBn1ac?=
 =?us-ascii?Q?mXNZmRd8tRppmvKHtlnVl55hXytIclCITEpC689wxMY9VqvL2lvJKZaADnXv?=
 =?us-ascii?Q?hOK12yjoaf4MJu6nLVZzFd3M9IimkLZk/7YCULThumuATUkOXCqrrnPUfBBl?=
 =?us-ascii?Q?OgpDG2POnVq1fIo6Ux75NWL2LqiI6hI3SFLwlh/4mKsEJez+20M9p2yu4HMG?=
 =?us-ascii?Q?2O3eO0kWK/N1QxI/0V1rEoIiVoOLEJGt8MSTQwq9a+i1q6fp24h8cz7SN0ff?=
 =?us-ascii?Q?6rU1KIcQ4zKIXh4deoJoW5mzMlPBoh0FwRZXlpmLWDwhCJppZEbAFAXg7i4Q?=
 =?us-ascii?Q?6DVWmt0pS7knQSsdv8c9RsYw4GIZOKa2AqLukgt3H0BCabLJdWDG8dSEe8+6?=
 =?us-ascii?Q?pJBwR6sk404WUgsyAVZ/xePxeZIrj+a/JuYz2ZINug9FN+L/kUxVnlPsb/h8?=
 =?us-ascii?Q?DlHy4uKU6SquduoAbHWANL/HWuBvgjAX2ByAjyHfqw+FGHJ+wLtSidMpvxGV?=
 =?us-ascii?Q?gtOztkRoPEPJ/7Ppil+nosq8cZrNQOBj4gSJUXVg4PCtyDbXY4gppffHbuVH?=
 =?us-ascii?Q?UH4gl4f5pHM8AE0o21CW9K6j6rYzfe0oiAKtwCCH3KsoHEEmzLCsvBGl/bhk?=
 =?us-ascii?Q?XqXWCpZb8Vpu8lhWOsWBMrNX3oIUDJyDYRTmFlTZDb+ypjIjX3zT0bm4uVYy?=
 =?us-ascii?Q?e6/uMzd//ZHVlJtd9uBM3KomZaNGTFv8UOmeLW8JW5pzVNKtir8g5u2zYDit?=
 =?us-ascii?Q?m/jJiqHGkT5IFmCA+0rd490SpnyMC1aNi5oA/9EePOuxm+AOnzOkFlFwwLip?=
 =?us-ascii?Q?Kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d04aa1-0c93-4387-be82-08da6ecc948a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 06:03:37.0226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXLAaGTjjGVzcRIgyzP2z14q/H0KzLkybByw4ojJnMRAg0zOxjIx2ghVsutZzxcvEXDyiACeAsNoSB9Z5yfgeW8fSsNe/nEtX4R6CsHiL1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2668
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent and all,

I have prototyped the RZ/G2L DU driver with a library that shares the commo=
n code
between R-Car and RZ/G2L Du drivers.

Looks like the total patches is now more than 20.

So planning to send the same with batches of 2-3 small series in order to m=
ake
review simpler.

Cheers,
Biju

> Subject: [PATCH v4 0/2] Add RZ/G2L Display support
>=20
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
> Video signal processor (VSPD) and Display unit(DU). The output of LCDC
> is connected to Display parallel interface and MIPI link video
> interface.
>=20
> This patch series aims to add basic display support on RZ/G2L SMARC EVK
> platform. The output from DSI is connected to ADV7535.
>=20
> The DU controller is similar to R-Car as it is connected to VSPD, so
> most of code is based on R-Car with new CRTC/DRM driver specific to
> RZ/G2L
>=20
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-
> du
>  * started using same compatible for RZ/G2{L,LC}
>  * Removed rzg2l_du_group.h and struct rzg2l_du_group
>  * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
>  * Removed rzg2l_du_group_restart
>  * Updated rzg2l_du_crtc_set_display_timing
>  * Removed mode_valid callback.
>  * Updated rzg2l_du_crtc_create() parameters
>  * Updated compatible
>  * Removed RZG2L_DU_MAX_GROUPS
> V2->v3:
>  * Added new bindings for RZ/G2L DU
>  * Removed indirection and created new DRM driver based on R-Car DU
> v1->v2:
>  * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
>  * Updated commit description for bindings
>  * Removed LCDC references from bindings
>  * Changed clock name from du.0->aclk from bindings
>  * Changed reset name from du.0->du from bindings
>  * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
>  * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
>  * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
>  * Added forward declaration for struct reset_control
>=20
> [1]
>=20
> RFC->v1:
>  * Changed  minItems->maxItems for renesas,vsps.
>  * Added RZ/G2L LCDC driver with special handling for CRTC reusing
>    most of RCar DU code
>  * Fixed the comments for num_rpf from rpf's->RPFs/ and vsp->VSP.
> RFC:
> Modetest output:-
> root@smarc-rzg2l:~# modetest -M rzg2l-du
> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 40      39      none    0x00000001      0x00000001
> 42      0       Virtual 0x00000001      0x00000002
>=20
> Connectors:
> id      encoder status          name            size (mm)       modes
> encoders
> 41      40      connected       HDMI-A-1        520x320         29
> 40
>   modes:
>         index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000
> flags: phsync, nvsync; type: preferred, driver
>   #1 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
> flags: phsync, pvsync; type: driver
>   #2 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352
> flags: phsync, pvsync; type: driver
>   #3 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352
> flags: phsync, pvsync; type: driver
>   #4 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000
> flags: phsync, pvsync; type: driver
>   #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000
> flags: phsync, pvsync; type: driver
>   #6 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags:
> phsync, pvsync; type: driver
>   #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags:
> phsync, pvsync; type: driver
>   #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags:
> phsync, pvsync; type: driver
>   #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags:
> phsync, pvsync; type: driver
>   #10 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags:
> phsync, pvsync; type: driver
>   #11 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags:
> phsync, pvsync; type: driver
>   #12 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags:
> nhsync, nvsync; type: driver
>   #13 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags:
> nhsync, nvsync; type: driver
>   #14 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags:
> nhsync, nvsync; type: driver
>   #15 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags:
> phsync, pvsync; type: driver
>   #16 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags:
> phsync, pvsync; type: driver
>   #17 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags:
> phsync, pvsync; type: driver
>   #18 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags:
> phsync, pvsync; type: driver
>   #19 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync,
> nvsync; type: driver
>   #20 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync,
> nvsync; type: driver
>   #21 720x480 60.00 720 736 798 858 480 489 495 525 27027 flags: nhsync,
> nvsync; type: driver
>   #22 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags: nhsync,
> nvsync; type: driver
>   #23 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: nhsync,
> nvsync; type: driver
>   #24 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags: nhsync,
> nvsync; type: driver
>   #25 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags: nhsync,
> nvsync; type: driver
>   #26 640x480 60.00 640 656 752 800 480 490 492 525 25200 flags: nhsync,
> nvsync; type: driver
>   #27 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: nhsync,
> nvsync; type: driver
>   #28 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: nhsync,
> pvsync; type: driver
>   props:
>         1 EDID:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>                         00ffffffffffff003683832410101010
>                         1416010380342078eeb725ac5130b426
>                         105054bfef8068c0714f818001010101
>                         010101010101e83580a070381f403020
>                         250044682100001a000000ff00303031
>                         30310a20202020202020000000fc0048
>                         444d490a2020202020202020000000fd
>                         00384c1e5317000a20202020202001cf
>                         02031a71471003140513841223090707
>                         8301000065030c0010008c0ad0902040
>                         31200c40550036d431000018011d8018
>                         711c1620582c250036d43100009e011d
>                         80d0721c1620102c258036d43100009e
>                         011d00bc52d01e20b828554036d43100
>                         001ef339801871382d40582c4500c48e
>                         2100001e000000000000000000000054
>         2 DPMS:
>                 flags: enum
>                 enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
>                 value: 0
>         5 link-status:
>                 flags: enum
>                 enums: Good=3D0 Bad=3D1
>                 value: 0
>         6 non-desktop:
>                 flags: immutable range
>                 values: 0 1
>                 value: 0
>         4 TILE:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>         20 CRTC_ID:
>                 flags: object
>                 value: 39
>=20
> CRTCs:
> id      fb      pos     size
> 39      49      (0,0)   (1920x1080)
>   #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000
> flags: phsync, nvsync; type: preferred, driver
>   props:
>         22 ACTIVE:
>                 flags: range
>                 values: 0 1
>                 value: 1
>         23 MODE_ID:
>                 flags: blob
>                 blobs:
>=20
>                 value:
>                         101b02008007b007d007200800003804
>                         3a043f04570400003c00000009000000
>                         48000000313932307831303830000000
>                         00000000000000000000000000000000
>                         00000000
>         19 OUT_FENCE_PTR:
>                 flags: range
>                 values: 0 18446744073709551615
>                 value: 0
>         24 VRR_ENABLED:
>                 flags: range
>                 values: 0 1
>                 value: 0
>=20
> Planes:
> id      crtc    fb      CRTC x,y        x,y     gamma size      possible
> crtcs
> 32      39      49      0,0             0,0     0
> 0x00000001
>   formats: RGB8 AR12 XR12 AR15 XR15 RG16 BG24 RG24 BA24 BX24 AR24 XR24
> UYVY YUYV YVYU NV12 NV21 NV16 NV61 YU12 YV12 YU16 YV16 YU24 YV24
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=3D0 Primary=3D1 Cursor=3D2
>                 value: 1
>         17 FB_ID:
>                 flags: object
>                 value: 49
>         18 IN_FENCE_FD:
>                 flags: signed range
>                 values: -1 2147483647
>                 value: -1
>         20 CRTC_ID:
>                 flags: object
>                 value: 39
>         13 CRTC_X:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         14 CRTC_Y:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         15 CRTC_W:
>                 flags: range
>                 values: 0 2147483647
>                 value: 1920
>         16 CRTC_H:
>                 flags: range
>                 values: 0 2147483647
>                 value: 1080
>         9 SRC_X:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         10 SRC_Y:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         11 SRC_W:
>                 flags: range
>                 values: 0 4294967295
>                 value: 125829120
>         12 SRC_H:
>                 flags: range
>                 values: 0 4294967295
>                 value: 70778880
>         30 IN_FORMATS:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>                         01000000000000001900000018000000
>                         01000000800000005247423841523132
>                         58523132415231355852313552473136
>                         42473234524732344241323442583234
>                         41523234585232345559565959555956
>                         595659554e5631324e5632314e563136
>                         4e563631595531325956313259553136
>                         59563136595532345956323400000000
>                         ffffff01000000000000000000000000
>                         0000000000000000
>                 in_formats blob decoded:
>                          RGB8:  LINEAR
>                          AR12:  LINEAR
>                          XR12:  LINEAR
>                          AR15:  LINEAR
>                          XR15:  LINEAR
>                          RG16:  LINEAR
>                          BG24:  LINEAR
>                          RG24:  LINEAR
>                          BA24:  LINEAR
>                          BX24:  LINEAR
>                          AR24:  LINEAR
>                          XR24:  LINEAR
>                          UYVY:  LINEAR
>                          YUYV:  LINEAR
>                          YVYU:  LINEAR
>                          NV12:  LINEAR
>                          NV21:  LINEAR
>                          NV16:  LINEAR
>                          NV61:  LINEAR
>                          YU12:  LINEAR
>                          YV12:  LINEAR
>                          YU16:  LINEAR
>                          YV16:  LINEAR
>                          YU24:  LINEAR
>                          YV24:  LINEAR
>         34 zpos:
>                 flags: immutable range
>                 values: 0 0
>                 value: 0
> 35      0       0       0,0             0,0     0
> 0x00000001
>   formats: RGB8 AR12 XR12 AR15 XR15 RG16 BG24 RG24 BA24 BX24 AR24 XR24
> UYVY YUYV YVYU NV12 NV21 NV16 NV61 YU12 YV12 YU16 YV16 YU24 YV24
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=3D0 Primary=3D1 Cursor=3D2
>                 value: 0
>         17 FB_ID:
>                 flags: object
>                 value: 0
>         18 IN_FENCE_FD:
>                 flags: signed range
>                 values: -1 2147483647
>                 value: -1
>         20 CRTC_ID:
>                 flags: object
>                 value: 0
>         13 CRTC_X:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         14 CRTC_Y:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         15 CRTC_W:
>                 flags: range
>                 values: 0 2147483647
>                 value: 0
>         16 CRTC_H:
>                 flags: range
>                 values: 0 2147483647
>                 value: 0
>         9 SRC_X:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         10 SRC_Y:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         11 SRC_W:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         12 SRC_H:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         30 IN_FORMATS:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>                         01000000000000001900000018000000
>                         01000000800000005247423841523132
>                         58523132415231355852313552473136
>                         42473234524732344241323442583234
>                         41523234585232345559565959555956
>                         595659554e5631324e5632314e563136
>                         4e563631595531325956313259553136
>                         59563136595532345956323400000000
>                         ffffff01000000000000000000000000
>                         0000000000000000
>                 in_formats blob decoded:
>                          RGB8:  LINEAR
>                          AR12:  LINEAR
>                          XR12:  LINEAR
>                          AR15:  LINEAR
>                          XR15:  LINEAR
>                          RG16:  LINEAR
>                          BG24:  LINEAR
>                          RG24:  LINEAR
>                          BA24:  LINEAR
>                          BX24:  LINEAR
>                          AR24:  LINEAR
>                          XR24:  LINEAR
>                          UYVY:  LINEAR
>                          YUYV:  LINEAR
>                          YVYU:  LINEAR
>                          NV12:  LINEAR
>                          NV21:  LINEAR
>                          NV16:  LINEAR
>                          NV61:  LINEAR
>                          YU12:  LINEAR
>                          YV12:  LINEAR
>                          YU16:  LINEAR
>                          YV16:  LINEAR
>                          YU24:  LINEAR
>                          YV24:  LINEAR
>         37 alpha:
>                 flags: range
>                 values: 0 65535
>                 value: 65535
>         38 zpos:
>                 flags: range
>                 values: 1 1
>                 value: 1
>=20
> Frame buffers:
> id      size    pitch
>=20
>=20
> Biju Das (2):
>   dt-bindings: display: Document Renesas RZ/G2L DU bindings
>   drm: rcar-du: Add RZ/G2L DU Support
>=20
>  .../bindings/display/renesas,rzg2l-du.yaml    | 124 +++
>  drivers/gpu/drm/rcar-du/Kconfig               |  16 +-
>  drivers/gpu/drm/rcar-du/Makefile              |   9 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 718 +++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h       | 100 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 192 +++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_drv.h        |  99 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c    | 114 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h    |  29 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_kms.c        | 756 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_kms.h        |  43 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  67 ++
>  drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c        | 422 ++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h        |  93 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c  | 250 ++++++
> drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h  |  42 +
>  16 files changed, 3073 insertions(+), 1 deletion(-)  create mode 100644
> Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h
>=20
> --
> 2.25.1

