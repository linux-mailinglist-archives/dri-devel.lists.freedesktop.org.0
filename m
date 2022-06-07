Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF53C53FCFA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B910E153;
	Tue,  7 Jun 2022 11:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D55F10E098
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 11:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIjN4hQMcWdFckeIwys8v8/1VWlPCXTkUG+I5/teSIvVyzBzcUR7XaFRFDMoVG0cJbdAvlkr3wzRCH4ISao0+MfuxWZBfB6NFLewfdvxKYs8ww26RwgwkYJ/306EiUUR/154q0hbjWH9i4iUMXhaPLiXDoGhgxw2d1GdppGBKXVpdm2gorHQo7D1S2XFVoyhM0gibzvs++xmM1SbS7OuPukoos7EGMKb3rp1qVhiIYhMyDEDTF75Ikwl+JwoII/9X2Ptv012oPnVbq9dFbujorJdqzyPrXpDeh1yqPZUQhLstTCzeEI/PkZxztlifm3Lp1RhfGUIi+PbJjuhbwuPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15/OJlOXn92o8TLYFunIVyfZWVcRcw8V7QyvclCxEJU=;
 b=EY4q+PMLwpb7kbW9IqpRPDKt6qRF971qgFefyT5Huo7OCT61dRZXdveyaxlWAfa+caIZ1Tq4te+iCHpWz/OkaYYJ/VyUM365iimB9lAGKmGlVxmsdoIQQjCM1SGRByREANSW1QI9JsIr8r2Ckx9PtLXvSnMlni6t4ShQqnOIASonSE5fXLPCsDn1nMUCxCz4LJrnms7+Jw1N6tO8vsdP4qdiyQjEU9Vc+J/OyExNUYagd1PGLYTwz9P7X8Orj+z0l2c/fway9Y1mJIDd542THHzL+HY9qBsAShdpkasyyfan4gSuS3ZwmTV00hOThIxg9bFiFnNOi49NQ1wcK0pXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15/OJlOXn92o8TLYFunIVyfZWVcRcw8V7QyvclCxEJU=;
 b=NsbNU/6hAMX7Zvnr/uAkVRcCYGqqmHGx1aAm5v3Ahu1/9wovNrcy6ucinFkewI2tD3HgtlOKOm5vM7edN6GoDYMrHWsqVd5zYFiq4d4pWbq3BXTuUDXoght+dQaSPkkof9y0ERlQMaQ6sUYCYgQ2ixnOQG6Tty0JmUzVMWtNOH0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6213.jpnprd01.prod.outlook.com (2603:1096:604:eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 11:11:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 11:11:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 4/4] drm: rcar-du: Add RZ/G2L DU Support
Thread-Topic: [PATCH v3 4/4] drm: rcar-du: Add RZ/G2L DU Support
Thread-Index: AQHYVZ1QYj3PoBDEf0q74fQCsrLkNq1ED90g
Date: Tue, 7 Jun 2022 11:11:02 +0000
Message-ID: <OS0PR01MB59228EF8B326F267F676B78086A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220421163128.101520-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcc8512e-b16b-4963-0e38-08da48766892
x-ms-traffictypediagnostic: OSZPR01MB6213:EE_
x-microsoft-antispam-prvs: <OSZPR01MB62134588584FDDC847AFCE4E86A59@OSZPR01MB6213.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZHwXC6m0csO2PAnkmRueSr73M/BipU7hGxGSVQ0oMLL1KcwCxToOXg4nERbT7ma9k78OKutk75WsByNzDSXN07wzP7L36f4wfzRw1VurQDuP7A7oklrcVxSOoECTpc8z/hEOY9q34lqhYU7chDeXgqDQzuYnn3Tt0P/T/c0WZTQmVI1UN9TpXrNidmuknkLjuRl7DF5+rdNyAG2DkXmJ71tq1iAIvlzTYuKwD0VSgT4m8d0YTdj5k8dIpdfV9ZtFmlXy9nPqayhJGc6gJFw7ArA0lVF/WmECEEoC9ycZt3GEhp6zkMfa+SdWi2rlqz08b+npA7IbpbENzJhpHI1ivxjFW4wrD+52NKDv8YssbYuWb8yJGL/SWCNcp46HKqbL50Gd4pguZvtu+dklQP8ur8JRPmD+eqfmoGbVEPzNC1ItvPdptuJ/OInSyeu+bLwMlyJxNrfhjhGbrlwfubR8IwkTwpf8FU/AXYQcW+xOKq9z3KftZqlkX+TsvVjRetLoa8trxB55sfE+5YYctfuytT6Krh3HzaQV56rxdOQ2uKkPod+asyzCg+WZbxTmewQkLJuKWg7F3qtArvguf3iG6GKRpX9W60uoxjnHp3E27kyJa58p2gAJU2CWzcKcGAx/jg/YLixkQymCVPHhfrvnT9i+ylrYWt5anPQfT4R4WwD271LAZJ2vmWRUVSTdgE2ZDk2fKOD0mQkFl4x8ekvfSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(66946007)(6506007)(83380400001)(9686003)(76116006)(30864003)(107886003)(38100700002)(186003)(122000001)(8936002)(508600001)(26005)(52536014)(5660300002)(38070700005)(55016003)(66556008)(8676002)(4326008)(110136005)(54906003)(316002)(66476007)(2906002)(71200400001)(86362001)(33656002)(7696005)(64756008)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HI5e/VCyX1FtAd1Wibr+fz/gOuIXMn3SIHQBW0Ojsq9IFb+OKOKWYwJAhAkE?=
 =?us-ascii?Q?JGxAQEZQj62vmftDceTck8N7DdrO2KHUTQVBfF36hIu8NaQ+S+Cwi62+bvdP?=
 =?us-ascii?Q?kBYL03hhkyEk6jr991ZnIt88VlaxotUsxBtaxVZixu7huYbqZDv+EMXBGuy3?=
 =?us-ascii?Q?Qkz3+VmtSJMbcT1pTKjaLXPq8CMeKIi87DxCj1l4q8W0jz1aeic/tsqfoefJ?=
 =?us-ascii?Q?M10ylM1mVLozPgPM6YlP0N/RchI5P35fXO8LnA1ihgYXw2fc5YsqnyFwLndz?=
 =?us-ascii?Q?UCDuODROC/aJYdRuPy3PewF43h4dcqEb4DLnBZ2rZ4CWLnZXAemvyTGXMa0G?=
 =?us-ascii?Q?qFkIXis/OsbWljr+0W7zgZ93TmDWaelHTUZU7TXK7s0uokZ3C0MJbfzaf+5h?=
 =?us-ascii?Q?9MZrOziiGvMTKRtlLxnLab5jiW44/96D1OmLt1u2xrZptDBhdIkjo5KD6Ofh?=
 =?us-ascii?Q?Q6Hj7kFy2vD79BKen+Zry4IJB3Wjr2S54jTaV9TLEW0Tu4UijFo9bSD0yJK6?=
 =?us-ascii?Q?mEs0nhJn3giknowk/8J2o+ZDMAi3oSYr42ibLf9s3CDnms9sS2iDM64Tkh+m?=
 =?us-ascii?Q?kBURZxMVVF3vxwI//ckMlY/5I4qZRUUyLYDeHiZQ18OwTJr/1GAQIErR8a2q?=
 =?us-ascii?Q?qavVhb+mOpielwq6iQ/usHuZYPYonZd57ge3y7siMnO2L1qrpFE9NzNwydGy?=
 =?us-ascii?Q?nXeH5GLMbln3VkI34J9hQT75Sqr+9tzkFvV4TCubbp64fDuK355hTDSwNxs+?=
 =?us-ascii?Q?+PnsSgP8VVnufPLPECeybK+Tyjfgip6b8VqnMlhnOtNV9IywmLw/b0SIp7Dj?=
 =?us-ascii?Q?aGUGaDMOvhy04PkkwKWJaYK695je7H0QxkfkAnBm4vFLTi/MsfjmVksR3CNF?=
 =?us-ascii?Q?ekkj8IAhxHOF8qMb5x51A+Iz0HJM8anaPZuNP+JADpcOqY6ZgaffyQM0Krlv?=
 =?us-ascii?Q?dlg+LfGhyTfF7f3bXb1deBPG0S2YHuMUh4KZUJNR5WGYsXyzfTBNkYXuT/Hw?=
 =?us-ascii?Q?TAU3he3lZjeFXb1qQGmGXXrhya30FVbCn7qfo7hh5JpzC4/BNKCPOmss3a8U?=
 =?us-ascii?Q?GdKlzRrb+13bZLadS+DgBK6HaUafjehPu3C8Bf9OMVQBhYPU4KLQRbbF3sjG?=
 =?us-ascii?Q?0nKfowSZy5Aum16J76XZr+yy8gUl1EZfBPf4biFSQT4WPXDjTNjYHmu40myc?=
 =?us-ascii?Q?wJfDgHBZmbB4lKC2j58dmsWMKoT8yGp5Uss02BV1X/hW9WrGH1dllKsK8xo2?=
 =?us-ascii?Q?h68kbnt3iTj8GMNxesqHmPPSwC9lcoOJsphjV8k/FoxqehqEpjbPpwEj3XRv?=
 =?us-ascii?Q?yyOPz7Q4TQOZv9wuzPdb8abCu7cQidN53LrqsjxrBUYKldayJiDySbOcDaWG?=
 =?us-ascii?Q?BRUfiZJaCqR6V7AMBx5osVJj9pagQZdTxXT25uEFjawRH5Y8aVUAkS86Y+vA?=
 =?us-ascii?Q?ytuhx5m1GgO7abrSnJK0Tns7IYzNFnSWOct4X1sahjsQ8l6++Doic0/1YxM3?=
 =?us-ascii?Q?GB8zanBm+fHGZbBm/SlV3pQ/3apZD2cIlPlVtQ9+EC3bVGILILIfHWrOmFLW?=
 =?us-ascii?Q?dplu3IPpCnnl933Bk+c+R0jxQRndVzjtXJjIU5zuGo0dfoqO/0xUBH+z+W3m?=
 =?us-ascii?Q?xVyk/8vqJ4kJMQGwrJENoUbPlPbPj4wF0UWm17uu4MWY7MrYwPXD0xQ+vbdT?=
 =?us-ascii?Q?g443+Yd/N3TKjmI7g8tPOyRwcgZ89Ldnu9gQB1V1XY/8VIRqXdo0cU91N6eZ?=
 =?us-ascii?Q?lRoICmiMiEbPZdR9YYRGrHPIYmfszLU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc8512e-b16b-4963-0e38-08da48766892
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 11:11:02.3776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWciE2C3RszDiKv9WbTMm8OA8wOWJTQQRoRi0+BcmpRIU9ObYlhJrJN5Uwo1Hcslbinn8qj7l+f3b7FTDTBcoAb5GBb+jwxXzY9wSXt9DUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6213
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping. Are we happy with this patch?

I need to post next version based on some additions in the latest
HW manual. Before that, if there is any feedback I can incorporate
the same.

Please let me know.

Cheers,
Biju

> Subject: [PATCH v3 4/4] drm: rcar-du: Add RZ/G2L DU Support
>=20
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
>=20
> It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> along with 2 RPFs to support blending of two picture layers and
> raster operations (ROPs).
>=20
> The DU part is similar to RCar like DU is connected to VSPD, so most of
> the framework related functionality is based on RCar DU.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch after removing all the indirections and by adding
>    new DRM driver.
> ---
>  drivers/gpu/drm/rcar-du/Kconfig              |  16 +-
>  drivers/gpu/drm/rcar-du/Makefile             |   9 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c      | 745 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h      | 104 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_drv.c       | 192 +++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_drv.h       | 102 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c   | 113 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h   |  29 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_group.h     |  32 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_kms.c       | 782 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_kms.h       |  43 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_regs.h      |  64 ++
>  drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c       | 420 ++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h       |  93 +++
>  drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c | 247 ++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h |  42 +
>  16 files changed, 3032 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_group.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h
>=20
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-
> du/Kconfig
> index 3e59c7c213f5..5fb00e8dc2e7 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -11,6 +11,19 @@ config DRM_RCAR_DU
>  	  Choose this option if you have an R-Car chipset.
>  	  If M is selected the module will be called rcar-du-drm.
>=20
> +config DRM_RZG2L_DU
> +	tristate "DRM Support for RZ/G2L DU"
> +	depends on DRM && OF
> +	depends on ARM || ARM64
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Choose this option if you have an RZ/G2L chipset.
> +	  If M is selected the module will be called rzg2l-du-drm.
> +
> +
>  config DRM_RCAR_USE_CMM
>  	bool "R-Car DU Color Management Module (CMM) Support"
>  	depends on DRM_RCAR_DU
> @@ -62,8 +75,9 @@ config DRM_RZG2L_MIPI_DSI
>  config DRM_RCAR_VSP
>  	bool "R-Car DU VSP Compositor Support" if ARM
>  	default y if ARM64
> -	depends on DRM_RCAR_DU
> +	depends on DRM_RCAR_DU || DRM_RZG2L_DU
>  	depends on VIDEO_RENESAS_VSP1=3Dy || (VIDEO_RENESAS_VSP1 &&
> DRM_RCAR_DU=3Dm)
> +	depends on VIDEO_RENESAS_VSP1=3Dy || (VIDEO_RENESAS_VSP1 &&
> DRM_RZG2L_DU=3Dm)
>  	help
>  	  Enable support to expose the R-Car VSP Compositor as KMS planes.
>=20
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-
> du/Makefile
> index 14a3fa88cc0b..460ff9aeba6c 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -6,15 +6,24 @@ rcar-du-drm-y :=3D rcar_du_crtc.o \
>  		 rcar_du_kms.o \
>  		 rcar_du_plane.o \
>=20
> +rzg2l-du-drm-y :=3D rzg2l_du_crtc.o \
> +		  rzg2l_du_drv.o \
> +		  rzg2l_du_encoder.o \
> +		  rzg2l_du_kms.o \
> +
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+=3D rcar_du_vsp.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) +=3D rcar_du_writeback.o
>=20
> +rzg2l-du-drm-$(CONFIG_DRM_RCAR_VSP)	+=3D rzg2l_du_vsp.o
> +rzg2l-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) +=3D rzg2l_du_writeback.o
> +
>  obj-$(CONFIG_DRM_RCAR_CMM)		+=3D rcar_cmm.o
>  obj-$(CONFIG_DRM_RCAR_DU)		+=3D rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+=3D rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)		+=3D rcar_lvds.o
>  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+=3D rcar_mipi_dsi.o
>=20
> +obj-$(CONFIG_DRM_RZG2L_DU)		+=3D rzg2l-du-drm.o
>  obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
>=20
>  # 'remote-endpoint' is fixed up at run-time
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
> new file mode 100644
> index 000000000000..83956c2668c1
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
> @@ -0,0 +1,745 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rzg2l_du_crtc.c  --  RZ/G2L DU CRTCs
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rzg2l_du_crtc.c

Typo. Need to fix this.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/sys_soc.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "rzg2l_du_crtc.h"
> +#include "rzg2l_du_drv.h"
> +#include "rzg2l_du_encoder.h"
> +#include "rzg2l_du_kms.h"
> +#include "rzg2l_du_vsp.h"
> +#include "rzg2l_du_regs.h"
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Hardware Setup
> + */
> +
> +static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc
> *rcrtc)
> +{
> +	const struct drm_display_mode *mode =3D &rcrtc->crtc.state-
> >adjusted_mode;
> +	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> +	unsigned long mode_clock =3D mode->clock * 1000;
> +	u32 ditr0, ditr1, ditr2, ditr3, ditr4, ditr5, pbcr0;
> +	struct clk *parent_clk;
> +
> +	parent_clk =3D clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> +	clk_set_rate(parent_clk, mode_clock);
> +
> +	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> +
> +	ditr0 =3D (DU_DITR0_DEMD_HIGH
> +		 | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DU_DITR0_VSPOL :
> 0)
> +		 | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DU_DITR0_HSPOL :
> 0));
> +
> +	ditr1 =3D DU_DITR1_VSA(mode->vsync_end - mode->vsync_start)
> +		| DU_DITR1_VACTIVE(mode->vdisplay);
> +
> +	ditr2 =3D DU_DITR2_VBP(mode->vtotal - mode->vsync_end)
> +		| DU_DITR2_VFP(mode->vsync_start - mode->vdisplay);
> +
> +	ditr3 =3D DU_DITR3_HSA(mode->hsync_end - mode->hsync_start)
> +		| DU_DITR3_HACTIVE(mode->hdisplay);
> +
> +	ditr4 =3D DU_DITR4_HBP(mode->htotal - mode->hsync_end)
> +		| DU_DITR4_HFP(mode->hsync_start - mode->hdisplay);
> +
> +	ditr5 =3D DU_DITR5_VSFT(0) | DU_DITR5_HSFT(0);
> +
> +	pbcr0 =3D DU_PBCR0_PB_DEP(0x1F);
> +
> +	rzg2l_du_write(rcdu, DU_DITR0, ditr0);
> +	rzg2l_du_write(rcdu, DU_DITR1, ditr1);
> +	rzg2l_du_write(rcdu, DU_DITR2, ditr2);
> +	rzg2l_du_write(rcdu, DU_DITR3, ditr3);
> +	rzg2l_du_write(rcdu, DU_DITR4, ditr4);
> +	rzg2l_du_write(rcdu, DU_DITR5, ditr5);
> +	rzg2l_du_write(rcdu, DU_PBCR0, pbcr0);

Need to set DU_MCR1 register based on latest HW manual.

> +}
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Page Flip
> + */
> +
> +void rzg2l_du_crtc_finish_page_flip(struct rzg2l_du_crtc *rcrtc)
> +{
> +	struct drm_pending_vblank_event *event;
> +	struct drm_device *dev =3D rcrtc->crtc.dev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->event_lock, flags);
> +	event =3D rcrtc->event;
> +	rcrtc->event =3D NULL;
> +	spin_unlock_irqrestore(&dev->event_lock, flags);
> +
> +	if (!event)
> +		return;
> +
> +	spin_lock_irqsave(&dev->event_lock, flags);
> +	drm_crtc_send_vblank_event(&rcrtc->crtc, event);
> +	wake_up(&rcrtc->flip_wait);
> +	spin_unlock_irqrestore(&dev->event_lock, flags);
> +
> +	drm_crtc_vblank_put(&rcrtc->crtc);
> +}
> +
> +static bool rzg2l_du_crtc_page_flip_pending(struct rzg2l_du_crtc
> *rcrtc)
> +{
> +	struct drm_device *dev =3D rcrtc->crtc.dev;
> +	unsigned long flags;
> +	bool pending;
> +
> +	spin_lock_irqsave(&dev->event_lock, flags);
> +	pending =3D rcrtc->event;
> +	spin_unlock_irqrestore(&dev->event_lock, flags);
> +
> +	return pending;
> +}
> +
> +static void rzg2l_du_crtc_wait_page_flip(struct rzg2l_du_crtc *rcrtc)
> +{
> +	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> +
> +	if (wait_event_timeout(rcrtc->flip_wait,
> +			       !rzg2l_du_crtc_page_flip_pending(rcrtc),
> +			       msecs_to_jiffies(50)))
> +		return;
> +
> +	dev_warn(rcdu->dev, "page flip timeout\n");
> +
> +	rzg2l_du_crtc_finish_page_flip(rcrtc);
> +}
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Start/Stop and Suspend/Resume
> + */
> +
> +static void rzg2l_du_crtc_setup(struct rzg2l_du_crtc *rcrtc)
> +{
> +	/* Configure display timings and output routing */
> +	rzg2l_du_crtc_set_display_timing(rcrtc);
> +
> +	/* Enable the VSP compositor. */
> +	rzg2l_du_vsp_enable(rcrtc);
> +
> +	/* Turn vertical blanking interrupt reporting on. */
> +	drm_crtc_vblank_on(&rcrtc->crtc);
> +}
> +
> +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc)
> +{
> +	int ret;
> +
> +	/*
> +	 * Guard against double-get, as the function is called from both
> the
> +	 * .atomic_enable() and .atomic_begin() handlers.
> +	 */
> +	if (rcrtc->initialized)
> +		return 0;
> +
> +	ret =3D reset_control_deassert(rcrtc->rstc);
> +	if (ret < 0)
> +		goto error_reset;
> +
> +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
> +	if (ret < 0)
> +		goto error_reset;
> +
> +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
> +	if (ret < 0)
> +		goto error_clock;
> +
> +	rzg2l_du_crtc_setup(rcrtc);
> +	rcrtc->initialized =3D true;
> +
> +	return 0;
> +
> +error_clock:
> +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> +error_reset:
> +	reset_control_assert(rcrtc->rstc);
> +	return ret;
> +}
> +
> +static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
> +{
> +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> +	clk_disable_unprepare(rcrtc->rzg2l_clocks.dclk);
> +	reset_control_assert(rcrtc->rstc);
> +
> +	rcrtc->initialized =3D false;
> +}
> +
> +static void __rzg2l_du_group_start_stop(struct rzg2l_du_group *rgrp,
> bool start)
> +{
> +	rzg2l_du_write(rgrp->dev, DU_MCR0, start ? DU_MCR0_DI_EN : 0);
> +}
> +
> +static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> +{
> +	__rzg2l_du_group_start_stop(rcrtc->group, true);
> +}
> +
> +static void rzg2l_du_crtc_disable_planes(struct rzg2l_du_crtc *rcrtc)
> +{
> +	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> +	struct drm_crtc *crtc =3D &rcrtc->crtc;
> +
> +	/* Make sure vblank interrupts are enabled. */
> +	drm_crtc_vblank_get(crtc);
> +
> +	if (!wait_event_timeout(rcrtc->vblank_wait, rcrtc->vblank_count =3D=3D
> 0,
> +				msecs_to_jiffies(100)))
> +		dev_warn(rcdu->dev, "vertical blanking timeout\n");
> +
> +	drm_crtc_vblank_put(crtc);
> +}
> +
> +static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
> +{
> +	struct drm_crtc *crtc =3D &rcrtc->crtc;
> +
> +	/*
> +	 * Disable all planes and wait for the change to take effect. This
> is
> +	 * required as the plane enable registers are updated on vblank,
> and no
> +	 * vblank will occur once the CRTC is stopped. Disabling planes
> when
> +	 * starting the CRTC thus wouldn't be enough as it would start
> scanning
> +	 * out immediately from old frame buffers until the next vblank.
> +	 *
> +	 * This increases the CRTC stop delay, especially when multiple
> CRTCs
> +	 * are stopped in one operation as we now wait for one vblank per
> CRTC.
> +	 * Whether this can be improved needs to be researched.
> +	 */
> +	rzg2l_du_crtc_disable_planes(rcrtc);
> +
> +	/*
> +	 * Disable vertical blanking interrupt reporting. We first need to
> wait
> +	 * for page flip completion before stopping the CRTC as userspace
> +	 * expects page flips to eventually complete.
> +	 */
> +	rzg2l_du_crtc_wait_page_flip(rcrtc);
> +	drm_crtc_vblank_off(crtc);
> +
> +	/* Disable the VSP compositor. */
> +	rzg2l_du_vsp_disable(rcrtc);
> +
> +	__rzg2l_du_group_start_stop(rcrtc->group, false);
> +}
> +
> +/* --------------------------------------------------------------------
> ---------
> + * CRTC Functions
> + */
> +
> +int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
> +				       struct drm_plane_state *state,
> +				       const struct rzg2l_du_format_info
> **format)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	if (!state->crtc) {
> +		/*
> +		 * The visible field is not reset by the DRM core but only
> +		 * updated by drm_plane_helper_check_state(), set it
> manually.
> +		 */
> +		state->visible =3D false;
> +		*format =3D NULL;
> +		return 0;
> +	}
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
> +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  true, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!state->visible) {
> +		*format =3D NULL;
> +		return 0;
> +	}
> +
> +	*format =3D rzg2l_du_format_info(state->fb->format->format);
> +	if (*format =3D=3D NULL) {
> +		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
> +			state->fb->format->format);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +	struct rzg2l_du_crtc_state *rstate =3D
> to_rzg2l_crtc_state(crtc_state);
> +	struct drm_encoder *encoder;
> +
> +	/* Store the routes from the CRTC output to the DU outputs. */
> +	rstate->outputs =3D 0;
> +
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +				  crtc_state->encoder_mask) {
> +		struct rzg2l_du_encoder *renc;
> +
> +		/* Skip the writeback encoder. */
> +		if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_VIRTUAL)
> +			continue;
> +
> +		renc =3D to_rzg2l_encoder(encoder);
> +		rstate->outputs |=3D BIT(renc->output);
> +	}
> +
> +	return 0;
> +}
> +
> +static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
> +					struct drm_atomic_state *state)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	rzg2l_du_crtc_get(rcrtc);
> +
> +	rzg2l_du_crtc_start(rcrtc);
> +}
> +
> +static void rzg2l_du_crtc_atomic_disable(struct drm_crtc *crtc,
> +					 struct drm_atomic_state *state)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	rzg2l_du_crtc_stop(rcrtc);
> +	rzg2l_du_crtc_put(rcrtc);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event =3D NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static void rzg2l_du_crtc_atomic_begin(struct drm_crtc *crtc,
> +				       struct drm_atomic_state *state)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	WARN_ON(!crtc->state->enable);
> +
> +	/*
> +	 * If a mode set is in progress we can be called with the CRTC
> disabled.
> +	 * We thus need to first get and setup the CRTC in order to
> configure
> +	 * planes. We must *not* put the CRTC in .atomic_flush(), as it
> must be
> +	 * kept awake until the .atomic_enable() call that will follow.
> The get
> +	 * operation in .atomic_enable() will in that case be a no-op, and
> the
> +	 * CRTC will be put later in .atomic_disable().
> +	 *
> +	 * If a mode set is not in progress the CRTC is enabled, and the
> +	 * following get call will be a no-op. There is thus no need to
> balance
> +	 * it in .atomic_flush() either.
> +	 */
> +	rzg2l_du_crtc_get(rcrtc);
> +
> +	rzg2l_du_vsp_atomic_begin(rcrtc);
> +}
> +
> +void rzg2l_du_group_restart(struct rzg2l_du_group *rgrp)
> +{
> +	__rzg2l_du_group_start_stop(rgrp, false);
> +	__rzg2l_du_group_start_stop(rgrp, true);
> +}
> +
> +static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
> +				       struct drm_atomic_state *state)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +	struct drm_device *dev =3D rcrtc->crtc.dev;
> +	unsigned long flags;
> +
> +	if (crtc->state->event) {
> +		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> +
> +		spin_lock_irqsave(&dev->event_lock, flags);
> +		rcrtc->event =3D crtc->state->event;
> +		crtc->state->event =3D NULL;
> +		spin_unlock_irqrestore(&dev->event_lock, flags);
> +	}
> +
> +	rzg2l_du_vsp_atomic_flush(rcrtc);
> +}
> +
> +static enum drm_mode_status
> +rzg2l_du_crtc_mode_valid(struct drm_crtc *crtc,
> +			 const struct drm_display_mode *mode)
> +{
> +	unsigned int min_sync_porch;
> +	unsigned int vbp;
> +
> +	/*
> +	 * The hardware requires a minimum combined horizontal sync and
> back
> +	 * porch of 20 pixels and a minimum vertical back porch of 3
> lines.
> +	 */
> +	min_sync_porch =3D 20;
> +
> +	if (mode->htotal - mode->hsync_start < min_sync_porch)
> +		return MODE_HBLANK_NARROW;
> +
> +	vbp =3D (mode->vtotal - mode->vsync_end);
> +	if (vbp < 3)
> +		return MODE_VBLANK_NARROW;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_crtc_helper_funcs crtc_helper_funcs =3D {
> +	.atomic_check =3D rzg2l_du_crtc_atomic_check,
> +	.atomic_begin =3D rzg2l_du_crtc_atomic_begin,
> +	.atomic_flush =3D rzg2l_du_crtc_atomic_flush,
> +	.atomic_enable =3D rzg2l_du_crtc_atomic_enable,
> +	.atomic_disable =3D rzg2l_du_crtc_atomic_disable,
> +	.mode_valid =3D rzg2l_du_crtc_mode_valid,
> +};
> +
> +static void rzg2l_du_crtc_crc_init(struct rzg2l_du_crtc *rcrtc)
> +{
> +	const char **sources;
> +	unsigned int count;
> +	int i =3D -1;
> +
> +	/* Reserve 1 for "auto" source. */
> +	count =3D rcrtc->vsp->num_planes + 1;
> +
> +	sources =3D kmalloc_array(count, sizeof(*sources), GFP_KERNEL);
> +	if (!sources)
> +		return;
> +
> +	sources[0] =3D kstrdup("auto", GFP_KERNEL);
> +	if (!sources[0])
> +		goto error;
> +
> +	for (i =3D 0; i < rcrtc->vsp->num_planes; ++i) {
> +		struct drm_plane *plane =3D &rcrtc->vsp->planes[i].plane;
> +		char name[16];
> +
> +		sprintf(name, "plane%u", plane->base.id);
> +		sources[i + 1] =3D kstrdup(name, GFP_KERNEL);
> +		if (!sources[i + 1])
> +			goto error;
> +	}
> +
> +	rcrtc->sources =3D sources;
> +	rcrtc->sources_count =3D count;
> +	return;
> +
> +error:
> +	while (i >=3D 0) {
> +		kfree(sources[i]);
> +		i--;
> +	}
> +	kfree(sources);
> +}
> +
> +static void rzg2l_du_crtc_crc_cleanup(struct rzg2l_du_crtc *rcrtc)
> +{
> +	unsigned int i;
> +
> +	if (!rcrtc->sources)
> +		return;
> +
> +	for (i =3D 0; i < rcrtc->sources_count; i++)
> +		kfree(rcrtc->sources[i]);
> +	kfree(rcrtc->sources);
> +
> +	rcrtc->sources =3D NULL;
> +	rcrtc->sources_count =3D 0;
> +}
> +
> +static struct drm_crtc_state *
> +rzg2l_du_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct rzg2l_du_crtc_state *state;
> +	struct rzg2l_du_crtc_state *copy;
> +
> +	if (WARN_ON(!crtc->state))
> +		return NULL;
> +
> +	state =3D to_rzg2l_crtc_state(crtc->state);
> +	copy =3D kmemdup(state, sizeof(*state), GFP_KERNEL);
> +	if (!copy)
> +		return NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &copy->state);
> +
> +	return &copy->state;
> +}
> +
> +static void rzg2l_du_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> +					       struct drm_crtc_state *state)
> +{
> +	__drm_atomic_helper_crtc_destroy_state(state);
> +	kfree(to_rzg2l_crtc_state(state));
> +}
> +
> +static void rzg2l_du_crtc_cleanup(struct drm_crtc *crtc)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	rzg2l_du_crtc_crc_cleanup(rcrtc);
> +
> +	return drm_crtc_cleanup(crtc);
> +}
> +
> +static void rzg2l_du_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct rzg2l_du_crtc_state *state;
> +
> +	if (crtc->state) {
> +		rzg2l_du_crtc_atomic_destroy_state(crtc, crtc->state);
> +		crtc->state =3D NULL;
> +	}
> +
> +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return;
> +
> +	state->crc.source =3D VSP1_DU_CRC_NONE;
> +	state->crc.index =3D 0;
> +
> +	__drm_atomic_helper_crtc_reset(crtc, &state->state);
> +}
> +
> +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	rcrtc->vblank_enable =3D true;
> +
> +	return 0;
> +}
> +
> +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	rcrtc->vblank_enable =3D false;
> +}
> +
> +static int rzg2l_du_crtc_parse_crc_source(struct rzg2l_du_crtc *rcrtc,
> +					  const char *source_name,
> +					  enum vsp1_du_crc_source *source)
> +{
> +	unsigned int index;
> +	int ret;
> +
> +	/*
> +	 * Parse the source name. Supported values are "plane%u" to
> compute the
> +	 * CRC on an input plane (%u is the plane ID), and "auto" to
> compute the
> +	 * CRC on the composer (VSP) output.
> +	 */
> +
> +	if (!source_name) {
> +		*source =3D VSP1_DU_CRC_NONE;
> +		return 0;
> +	} else if (!strcmp(source_name, "auto")) {
> +		*source =3D VSP1_DU_CRC_OUTPUT;
> +		return 0;
> +	} else if (strstarts(source_name, "plane")) {
> +		unsigned int i;
> +
> +		*source =3D VSP1_DU_CRC_PLANE;
> +
> +		ret =3D kstrtouint(source_name + strlen("plane"), 10, &index);
> +		if (ret < 0)
> +			return ret;
> +
> +		for (i =3D 0; i < rcrtc->vsp->num_planes; ++i) {
> +			if (index =3D=3D rcrtc->vsp->planes[i].plane.base.id)
> +				return i;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rzg2l_du_crtc_verify_crc_source(struct drm_crtc *crtc,
> +					   const char *source_name,
> +					   size_t *values_cnt)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +	enum vsp1_du_crc_source source;
> +
> +	if (rzg2l_du_crtc_parse_crc_source(rcrtc, source_name, &source) <
> 0) {
> +		DRM_DEBUG_DRIVER("unknown source %s\n", source_name);
> +		return -EINVAL;
> +	}
> +
> +	*values_cnt =3D 1;
> +	return 0;
> +}
> +
> +static const char *const *
> +rzg2l_du_crtc_get_crc_sources(struct drm_crtc *crtc, size_t *count)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	*count =3D rcrtc->sources_count;
> +	return rcrtc->sources;
> +}
> +
> +static int rzg2l_du_crtc_set_crc_source(struct drm_crtc *crtc,
> +					const char *source_name)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	enum vsp1_du_crc_source source;
> +	unsigned int index;
> +	int ret;
> +
> +	ret =3D rzg2l_du_crtc_parse_crc_source(rcrtc, source_name, &source);
> +	if (ret < 0)
> +		return ret;
> +
> +	index =3D ret;
> +
> +	/* Perform an atomic commit to set the CRC source. */
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	state =3D drm_atomic_state_alloc(crtc->dev);
> +	if (!state) {
> +		ret =3D -ENOMEM;
> +		goto unlock;
> +	}
> +
> +	state->acquire_ctx =3D &ctx;
> +
> +retry:
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	if (!IS_ERR(crtc_state)) {
> +		struct rzg2l_du_crtc_state *rcrtc_state;
> +
> +		rcrtc_state =3D to_rzg2l_crtc_state(crtc_state);
> +		rcrtc_state->crc.source =3D source;
> +		rcrtc_state->crc.index =3D index;
> +
> +		ret =3D drm_atomic_commit(state);
> +	} else {
> +		ret =3D PTR_ERR(crtc_state);
> +	}
> +
> +	if (ret =3D=3D -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		drm_modeset_backoff(&ctx);
> +		goto retry;
> +	}
> +
> +	drm_atomic_state_put(state);
> +
> +unlock:
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	return ret;
> +}
> +
> +static const struct drm_crtc_funcs crtc_funcs_rzg2l =3D {
> +	.reset =3D rzg2l_du_crtc_reset,
> +	.destroy =3D rzg2l_du_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state =3D rzg2l_du_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state =3D rzg2l_du_crtc_atomic_destroy_state,
> +	.enable_vblank =3D rzg2l_du_crtc_enable_vblank,
> +	.disable_vblank =3D rzg2l_du_crtc_disable_vblank,
> +	.set_crc_source =3D rzg2l_du_crtc_set_crc_source,
> +	.verify_crc_source =3D rzg2l_du_crtc_verify_crc_source,
> +	.get_crc_sources =3D rzg2l_du_crtc_get_crc_sources,
> +};
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Initialization
> + */
> +
> +int rzg2l_du_crtc_create(struct rzg2l_du_group *rgrp, unsigned int
> swindex,
> +			 unsigned int hwindex)
> +{
> +	struct rzg2l_du_device *rcdu =3D rgrp->dev;
> +	struct rzg2l_du_crtc *rcrtc =3D &rcdu->crtcs[swindex];
> +	struct drm_crtc *crtc =3D &rcrtc->crtc;
> +	struct drm_plane *primary;
> +	int ret;
> +
> +	rcrtc->rstc =3D devm_reset_control_get_shared(rcdu->dev, NULL);
> +	if (IS_ERR(rcrtc->rstc)) {
> +		dev_err(rcdu->dev, "can't get cpg reset\n");
> +		return PTR_ERR(rcrtc->rstc);
> +	}
> +
> +	rcrtc->rzg2l_clocks.aclk =3D devm_clk_get(rcdu->dev, "aclk");
> +	if (IS_ERR(rcrtc->rzg2l_clocks.aclk)) {
> +		dev_err(rcdu->dev, "no axi clock for DU\n");
> +		return PTR_ERR(rcrtc->rzg2l_clocks.aclk);
> +	}
> +
> +	rcrtc->rzg2l_clocks.pclk =3D devm_clk_get(rcdu->dev, "pclk");
> +	if (IS_ERR(rcrtc->rzg2l_clocks.pclk)) {
> +		dev_err(rcdu->dev, "no peripheral clock for DU\n");
> +		return PTR_ERR(rcrtc->rzg2l_clocks.pclk);
> +	}
> +
> +	rcrtc->rzg2l_clocks.dclk =3D devm_clk_get(rcdu->dev, "vclk");
> +	if (IS_ERR(rcrtc->rzg2l_clocks.dclk)) {
> +		dev_err(rcdu->dev, "no video clock for DU\n");
> +		return PTR_ERR(rcrtc->rzg2l_clocks.dclk);
> +	}
> +
> +	init_waitqueue_head(&rcrtc->flip_wait);
> +	init_waitqueue_head(&rcrtc->vblank_wait);
> +	spin_lock_init(&rcrtc->vblank_lock);
> +
> +	rcrtc->dev =3D rcdu;
> +	rcrtc->group =3D rgrp;
> +	rcrtc->index =3D hwindex;
> +
> +	primary =3D &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
> +
> +	ret =3D drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
> +					&crtc_funcs_rzg2l,
> +					NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> +
> +	rzg2l_du_crtc_crc_init(rcrtc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
> new file mode 100644
> index 000000000000..0187f394155b
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
> @@ -0,0 +1,104 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l_du_crtc.h  --  RZ/G2L Display Unit CRTCs
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_crtc.h
> + */
> +
> +#ifndef __RZG2L_DU_CRTC_H__
> +#define __RZG2L_DU_CRTC_H__
> +
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/wait.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_writeback.h>
> +
> +#include <media/vsp1.h>
> +
> +struct rzg2l_du_format_info;
> +struct rzg2l_du_group;
> +struct rzg2l_du_vsp;
> +struct reset_control;
> +
> +/**
> + * struct rzg2l_du_crtc - the CRTC, representing a DU superposition
> processor
> + * @crtc: base DRM CRTC
> + * @dev: the DU device
> + * @rzg2l_clocks: the bus, main and video clock
> + * @rstc: reset controller
> + * @index: CRTC hardware index
> + * @initialized: whether the CRTC has been initialized and clocks
> enabled
> + * @vblank_enable: whether vblank events are enabled on this CRTC
> + * @event: event to post when the pending page flip completes
> + * @flip_wait: wait queue used to signal page flip completion
> + * @vblank_lock: protects vblank_wait and vblank_count
> + * @vblank_wait: wait queue used to signal vertical blanking
> + * @vblank_count: number of vertical blanking interrupts to wait for
> + * @group: CRTC group this CRTC belongs to
> + * @vsp: VSP feeding video to this CRTC
> + * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
> + * @writeback: the writeback connector
> + */
> +struct rzg2l_du_crtc {
> +	struct drm_crtc crtc;
> +
> +	struct rzg2l_du_device *dev;
> +	struct reset_control *rstc;
> +	struct {
> +		struct clk *aclk;
> +		struct clk *pclk;
> +		struct clk *dclk;
> +	} rzg2l_clocks;
> +	unsigned int index;
> +	bool initialized;
> +
> +	bool vblank_enable;
> +	struct drm_pending_vblank_event *event;
> +	wait_queue_head_t flip_wait;
> +
> +	spinlock_t vblank_lock;
> +	wait_queue_head_t vblank_wait;
> +	unsigned int vblank_count;
> +
> +	struct rzg2l_du_group *group;
> +	struct rzg2l_du_vsp *vsp;
> +	unsigned int vsp_pipe;
> +
> +	const char *const *sources;
> +	unsigned int sources_count;
> +
> +	struct drm_writeback_connector writeback;
> +};
> +
> +#define to_rzg2l_crtc(c)	container_of(c, struct rzg2l_du_crtc,
> crtc)
> +#define wb_to_rzg2l_crtc(c)	container_of(c, struct rzg2l_du_crtc,
> writeback)
> +
> +/**
> + * struct rzg2l_du_crtc_state - Driver-specific CRTC state
> + * @state: base DRM CRTC state
> + * @crc: CRC computation configuration
> + * @outputs: bitmask of the outputs (enum rzg2l_du_output) driven by
> this CRTC
> + */
> +struct rzg2l_du_crtc_state {
> +	struct drm_crtc_state state;
> +
> +	struct vsp1_du_crc_config crc;
> +	unsigned int outputs;
> +};
> +
> +#define to_rzg2l_crtc_state(s) container_of(s, struct
> rzg2l_du_crtc_state, state)
> +
> +int rzg2l_du_crtc_create(struct rzg2l_du_group *rgrp, unsigned int
> swindex,
> +			 unsigned int hwindex);
> +
> +void rzg2l_du_crtc_finish_page_flip(struct rzg2l_du_crtc *rcrtc);
> +
> +int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
> +				       struct drm_plane_state *state,
> +				       const struct rzg2l_du_format_info
> **format);
> +
> +#endif /* __RZG2L_DU_CRTC_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
> b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
> new file mode 100644
> index 000000000000..6950da3de5d3
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rzg2l_du_drv.c  --  RZ/G2L DU DRM driver
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rzg2l_du_drv.c
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/wait.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rzg2l_du_drv.h"
> +#include "rzg2l_du_kms.h"
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Device Information
> + */
> +
> +static const struct rzg2l_du_device_info rzg2l_du_r9a07g044l_info =3D {
> +	.channels_mask =3D BIT(0),
> +	.routes =3D {
> +		[RZG2L_DU_OUTPUT_DPAD0] =3D {
> +			.possible_crtcs =3D BIT(0),
> +			.port =3D 0,
> +		},
> +		[RZG2L_DU_OUTPUT_DSI0] =3D {
> +			.possible_crtcs =3D BIT(0),
> +			.port =3D 1,
> +		},
> +	},
> +	.num_rpf =3D 2,
> +};
> +
> +static const struct of_device_id rzg2l_du_of_table[] =3D {
> +	{ .compatible =3D "renesas,du-r9a07g044l", .data =3D
> &rzg2l_du_r9a07g044l_info },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, rzg2l_du_of_table);
> +
> +const char *rzg2l_du_output_name(enum rzg2l_du_output output)
> +{
> +	static const char * const names[] =3D {
> +		[RZG2L_DU_OUTPUT_DPAD0] =3D "DPAD0",
> +		[RZG2L_DU_OUTPUT_DSI0] =3D "DSI0",
> +	};
> +
> +	if (output >=3D ARRAY_SIZE(names) || !names[output])
> +		return "UNKNOWN";
> +
> +	return names[output];
> +}
> +
> +/* --------------------------------------------------------------------
> ---------
> + * DRM operations
> + */
> +
> +DEFINE_DRM_GEM_CMA_FOPS(rzg2l_du_fops);
> +
> +static const struct drm_driver rzg2l_du_driver =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.dumb_create		=3D rzg2l_du_dumb_create,
> +	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> +	.gem_prime_import_sg_table =3D rzg2l_du_gem_prime_import_sg_table,
> +	.gem_prime_mmap		=3D drm_gem_prime_mmap,
> +	.fops			=3D &rzg2l_du_fops,
> +	.name			=3D "rzg2l-du",
> +	.desc			=3D "Renesas RZ/G2L DU",
> +	.date			=3D "20220305",
> +	.major			=3D 1,
> +	.minor			=3D 0,
> +};
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Platform driver
> + */
> +
> +static int rzg2l_du_remove(struct platform_device *pdev)
> +{
> +	struct rzg2l_du_device *rcdu =3D platform_get_drvdata(pdev);
> +	struct drm_device *ddev =3D &rcdu->ddev;
> +
> +	drm_dev_unregister(ddev);
> +	drm_atomic_helper_shutdown(ddev);
> +
> +	drm_kms_helper_poll_fini(ddev);
> +
> +	return 0;
> +}
> +
> +static void rzg2l_du_shutdown(struct platform_device *pdev)
> +{
> +	struct rzg2l_du_device *rcdu =3D platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(&rcdu->ddev);
> +}
> +
> +static int rzg2l_du_probe(struct platform_device *pdev)
> +{
> +	struct rzg2l_du_device *rcdu;
> +	unsigned int mask;
> +	int ret;
> +
> +	if (drm_firmware_drivers_only())
> +		return -ENODEV;
> +
> +	/* Allocate and initialize the RZ/G2L device structure. */
> +	rcdu =3D devm_drm_dev_alloc(&pdev->dev, &rzg2l_du_driver,
> +				  struct rzg2l_du_device, ddev);
> +	if (IS_ERR(rcdu))
> +		return PTR_ERR(rcdu);
> +
> +	rcdu->dev =3D &pdev->dev;
> +	rcdu->info =3D of_device_get_match_data(rcdu->dev);
> +
> +	platform_set_drvdata(pdev, rcdu);
> +
> +	/* I/O resources */
> +	rcdu->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rcdu->mmio))
> +		return PTR_ERR(rcdu->mmio);
> +
> +	/*
> +	 * When sourcing frames from a VSP the DU doesn't perform any
> memory
> +	 * access so set the DMA coherent mask to 40 bits to accept all
> buffers.
> +	 */
> +	mask =3D 40;
> +	ret =3D dma_coerce_mask_and_coherent(&pdev->dev,
> DMA_BIT_MASK(mask));
> +	if (ret)
> +		return ret;
> +
> +	/* DRM/KMS objects */
> +	ret =3D rzg2l_du_modeset_init(rcdu);
> +	if (ret < 0) {
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"failed to initialize DRM/KMS (%d)\n", ret);
> +		goto error;
> +	}
> +
> +	/*
> +	 * Register the DRM device with the core and the connectors with
> +	 * sysfs.
> +	 */
> +	ret =3D drm_dev_register(&rcdu->ddev, 0);
> +	if (ret)
> +		goto error;
> +
> +	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
> +
> +	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> +
> +	return 0;
> +
> +error:
> +	drm_kms_helper_poll_fini(&rcdu->ddev);
> +	return ret;
> +}
> +
> +static struct platform_driver rzg2l_du_platform_driver =3D {
> +	.probe		=3D rzg2l_du_probe,
> +	.remove		=3D rzg2l_du_remove,
> +	.shutdown	=3D rzg2l_du_shutdown,
> +	.driver		=3D {
> +		.name	=3D "rzg2l-du",
> +		.of_match_table =3D rzg2l_du_of_table,
> +	},
> +};
> +
> +module_platform_driver(rzg2l_du_platform_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/G2L DU DRM Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
> new file mode 100644
> index 000000000000..7e5c9298ccaf
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l_du_drv.h  --  RZ/G2L Display Unit DRM driver
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_drv.h
> + */
> +
> +#ifndef __RZG2L_DU_DRV_H__
> +#define __RZG2L_DU_DRV_H__
> +
> +#include <linux/kernel.h>
> +#include <linux/wait.h>
> +
> +#include <drm/drm_device.h>
> +
> +#include "rzg2l_du_crtc.h"
> +#include "rzg2l_du_group.h"
> +#include "rzg2l_du_vsp.h"
> +
> +struct clk;
> +struct device;
> +struct drm_bridge;
> +struct drm_property;
> +struct rzg2l_du_device;
> +
> +enum rzg2l_du_output {
> +	RZG2L_DU_OUTPUT_DPAD0,
> +	RZG2L_DU_OUTPUT_DSI0,
> +	RZG2L_DU_OUTPUT_MAX,
> +};
> +
> +/*
> + * struct rzg2l_du_output_routing - Output routing specification
> + * @possible_crtcs: bitmask of possible CRTCs for the output
> + * @port: device tree port number corresponding to this output route
> + *
> + * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
> + * specify the valid SoC outputs, which CRTCs can drive the output, and
> the type
> + * of in-SoC encoder for the output.
> + */
> +struct rzg2l_du_output_routing {
> +	unsigned int possible_crtcs;
> +	unsigned int port;
> +};
> +
> +/*
> + * struct rzg2l_du_device_info - DU model-specific information
> + * @channels_mask: bit mask of available DU channels
> + * @routes: array of CRTC to output routes, indexed by output
> (RZG2L_DU_OUTPUT_*)
> + * @num_rpf: number of RPFs in VSP
> + */
> +struct rzg2l_du_device_info {
> +	unsigned int channels_mask;
> +	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> +	unsigned int num_rpf;
> +};
> +
> +#define RZG2L_DU_MAX_CRTCS		1
> +#define RZG2L_DU_MAX_GROUPS		1
> +#define RZG2L_DU_MAX_VSPS		1
> +
> +struct rzg2l_du_device {
> +	struct device *dev;
> +	const struct rzg2l_du_device_info *info;
> +
> +	void __iomem *mmio;
> +
> +	struct drm_device ddev;
> +
> +	struct rzg2l_du_crtc crtcs[RZG2L_DU_MAX_CRTCS];
> +	unsigned int num_crtcs;
> +
> +	struct rzg2l_du_group groups[RZG2L_DU_MAX_GROUPS];
> +	struct rzg2l_du_vsp vsps[RZG2L_DU_MAX_VSPS];
> +
> +	struct {
> +		struct drm_property *colorkey;
> +	} props;
> +
> +	unsigned int dpad0_source;
> +};
> +
> +static inline struct rzg2l_du_device *to_rzg2l_du_device(struct
> drm_device *dev)
> +{
> +	return container_of(dev, struct rzg2l_du_device, ddev);
> +}
> +
> +static inline u32 rzg2l_du_read(struct rzg2l_du_device *rcdu, u32 reg)
> +{
> +	return ioread32(rcdu->mmio + reg);
> +}
> +
> +static inline void rzg2l_du_write(struct rzg2l_du_device *rcdu, u32
> reg, u32 data)
> +{
> +	iowrite32(data, rcdu->mmio + reg);
> +}
> +
> +const char *rzg2l_du_output_name(enum rzg2l_du_output output);
> +
> +#endif /* __RZG2L_DU_DRV_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
> b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
> new file mode 100644
> index 000000000000..b3a1878629e2
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rzg2l_du_encoder.c  --  RZ/G2L Display Unit Encoder
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_encoder.c
> + */
> +
> +#include <linux/export.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_panel.h>
> +
> +#include "rzg2l_du_drv.h"
> +#include "rzg2l_du_encoder.h"
> +#include "rzg2l_du_kms.h"
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Encoder
> + */
> +
> +static unsigned int rzg2l_du_encoder_count_ports(struct device_node
> *node)
> +{
> +	struct device_node *ports;
> +	struct device_node *port;
> +	unsigned int num_ports =3D 0;
> +
> +	ports =3D of_get_child_by_name(node, "ports");
> +	if (!ports)
> +		ports =3D of_node_get(node);
> +
> +	for_each_child_of_node(ports, port) {
> +		if (of_node_name_eq(port, "port"))
> +			num_ports++;
> +	}
> +
> +	of_node_put(ports);
> +
> +	return num_ports;
> +}
> +
> +static const struct drm_encoder_funcs rzg2l_du_encoder_funcs =3D {
> +};
> +
> +int rzg2l_du_encoder_init(struct rzg2l_du_device *rcdu,
> +			  enum rzg2l_du_output output,
> +			  struct device_node *enc_node)
> +{
> +	struct rzg2l_du_encoder *renc;
> +	struct drm_connector *connector;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	/*
> +	 * Locate the DRM bridge from the DT node. For the DPAD outputs,
> if the
> +	 * DT node has a single port, assume that it describes a panel and
> +	 * create a panel bridge.
> +	 */
> +	if (output =3D=3D RZG2L_DU_OUTPUT_DPAD0 &&
> +	    rzg2l_du_encoder_count_ports(enc_node) =3D=3D 1) {
> +		struct drm_panel *panel =3D of_drm_find_panel(enc_node);
> +
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);
> +
> +		bridge =3D devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> +							 DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	} else {
> +		bridge =3D of_drm_find_bridge(enc_node);
> +		if (!bridge)
> +			return -EPROBE_DEFER;
> +	}
> +
> +	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
> +		enc_node, rzg2l_du_output_name(output));
> +
> +	renc =3D drmm_encoder_alloc(&rcdu->ddev, struct rzg2l_du_encoder,
> base,
> +				  &rzg2l_du_encoder_funcs,
> DRM_MODE_ENCODER_NONE,
> +				  NULL);
> +	if (!renc)
> +		return -ENOMEM;
> +
> +	renc->output =3D output;
> +
> +	/* Attach the bridge to the encoder. */
> +	ret =3D drm_bridge_attach(&renc->base, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(rcdu->dev,
> +			"failed to attach bridge %pOF for output %s (%d)\n",
> +			bridge->of_node, rzg2l_du_output_name(output), ret);
> +		return ret;
> +	}
> +
> +	/* Create the connector for the chain of bridges. */
> +	connector =3D drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> +	if (IS_ERR(connector)) {
> +		dev_err(rcdu->dev,
> +			"failed to created connector for output %s (%ld)\n",
> +			rzg2l_du_output_name(output), PTR_ERR(connector));
> +		return PTR_ERR(connector);
> +	}
> +
> +	return drm_connector_attach_encoder(connector, &renc->base);
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
> new file mode 100644
> index 000000000000..2e42d33d6e3e
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l_du_encoder.h  --  RZ/G2L Display Unit Encoder
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_encoder.h
> + */
> +
> +#ifndef __RZG2L_DU_ENCODER_H__
> +#define __RZG2L_DU_ENCODER_H__
> +
> +#include <drm/drm_encoder.h>
> +
> +struct rzg2l_du_device;
> +
> +struct rzg2l_du_encoder {
> +	struct drm_encoder base;
> +	enum rzg2l_du_output output;
> +};
> +
> +#define to_rzg2l_encoder(e) \
> +	container_of(e, struct rzg2l_du_encoder, base)
> +
> +int rzg2l_du_encoder_init(struct rzg2l_du_device *rcdu,
> +			  enum rzg2l_du_output output,
> +			  struct device_node *enc_node);
> +
> +#endif /* __RZG2L_DU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_group.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_group.h
> new file mode 100644
> index 000000000000..0981244c1407
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_group.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l_du_group.c  --  RZ/G2L Display Unit Planes and CRTCs Group
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_group.c
> + */
> +
> +#ifndef __RZG2L_DU_GROUP_H__
> +#define __RZG2L_DU_GROUP_H__
> +
> +#include <linux/mutex.h>
> +
> +struct rzg2l_du_device;
> +
> +/*
> + * struct rzg2l_du_group - CRTCs and planes group
> + * @dev: the DU device
> + * @index: group index
> + * @channels_mask: bitmask of populated DU channels in this group
> + * @num_crtcs: number of CRTCs in this group (1 or 2)
> + */
> +struct rzg2l_du_group {
> +	struct rzg2l_du_device *dev;
> +	unsigned int index;
> +
> +	unsigned int channels_mask;
> +	unsigned int num_crtcs;
> +};
> +
> +#endif /* __RZG2L_DU_GROUP_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
> b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
> new file mode 100644
> index 000000000000..3ba83c70dd45
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
> @@ -0,0 +1,782 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rzg2l_du_kms.c  --  RZ/G2LDisplay Unit Mode Setting
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_kms.c
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include <linux/device.h>
> +#include <linux/dma-buf.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/wait.h>
> +
> +#include "rzg2l_du_crtc.h"
> +#include "rzg2l_du_drv.h"
> +#include "rzg2l_du_encoder.h"
> +#include "rzg2l_du_kms.h"
> +#include "rzg2l_du_vsp.h"
> +#include "rzg2l_du_writeback.h"
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Format helpers
> + */
> +
> +static const struct rzg2l_du_format_info rzg2l_du_format_infos[] =3D {
> +	{
> +		.fourcc =3D DRM_FORMAT_RGB565,
> +		.v4l2 =3D V4L2_PIX_FMT_RGB565,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ARGB1555,
> +		.v4l2 =3D V4L2_PIX_FMT_ARGB555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XRGB1555,
> +		.v4l2 =3D V4L2_PIX_FMT_XRGB555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XRGB8888,
> +		.v4l2 =3D V4L2_PIX_FMT_XBGR32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ARGB8888,
> +		.v4l2 =3D V4L2_PIX_FMT_ABGR32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_UYVY,
> +		.v4l2 =3D V4L2_PIX_FMT_UYVY,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUYV,
> +		.v4l2 =3D V4L2_PIX_FMT_YUYV,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV12,
> +		.v4l2 =3D V4L2_PIX_FMT_NV12M,
> +		.bpp =3D 12,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV21,
> +		.v4l2 =3D V4L2_PIX_FMT_NV21M,
> +		.bpp =3D 12,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV16,
> +		.v4l2 =3D V4L2_PIX_FMT_NV16M,
> +		.bpp =3D 16,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGB332,
> +		.v4l2 =3D V4L2_PIX_FMT_RGB332,
> +		.bpp =3D 8,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ARGB4444,
> +		.v4l2 =3D V4L2_PIX_FMT_ARGB444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XRGB4444,
> +		.v4l2 =3D V4L2_PIX_FMT_XRGB444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGBA4444,
> +		.v4l2 =3D V4L2_PIX_FMT_RGBA444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGBX4444,
> +		.v4l2 =3D V4L2_PIX_FMT_RGBX444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ABGR4444,
> +		.v4l2 =3D V4L2_PIX_FMT_ABGR444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XBGR4444,
> +		.v4l2 =3D V4L2_PIX_FMT_XBGR444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRA4444,
> +		.v4l2 =3D V4L2_PIX_FMT_BGRA444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRX4444,
> +		.v4l2 =3D V4L2_PIX_FMT_BGRX444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGBA5551,
> +		.v4l2 =3D V4L2_PIX_FMT_RGBA555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGBX5551,
> +		.v4l2 =3D V4L2_PIX_FMT_RGBX555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ABGR1555,
> +		.v4l2 =3D V4L2_PIX_FMT_ABGR555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XBGR1555,
> +		.v4l2 =3D V4L2_PIX_FMT_XBGR555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRA5551,
> +		.v4l2 =3D V4L2_PIX_FMT_BGRA555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRX5551,
> +		.v4l2 =3D V4L2_PIX_FMT_BGRX555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGR888,
> +		.v4l2 =3D V4L2_PIX_FMT_RGB24,
> +		.bpp =3D 24,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGB888,
> +		.v4l2 =3D V4L2_PIX_FMT_BGR24,
> +		.bpp =3D 24,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGBA8888,
> +		.v4l2 =3D V4L2_PIX_FMT_BGRA32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGBX8888,
> +		.v4l2 =3D V4L2_PIX_FMT_BGRX32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ABGR8888,
> +		.v4l2 =3D V4L2_PIX_FMT_RGBA32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XBGR8888,
> +		.v4l2 =3D V4L2_PIX_FMT_RGBX32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRA8888,
> +		.v4l2 =3D V4L2_PIX_FMT_ARGB32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRX8888,
> +		.v4l2 =3D V4L2_PIX_FMT_XRGB32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVYU,
> +		.v4l2 =3D V4L2_PIX_FMT_YVYU,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV61,
> +		.v4l2 =3D V4L2_PIX_FMT_NV61M,
> +		.bpp =3D 16,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUV420,
> +		.v4l2 =3D V4L2_PIX_FMT_YUV420M,
> +		.bpp =3D 12,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVU420,
> +		.v4l2 =3D V4L2_PIX_FMT_YVU420M,
> +		.bpp =3D 12,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUV422,
> +		.v4l2 =3D V4L2_PIX_FMT_YUV422M,
> +		.bpp =3D 16,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVU422,
> +		.v4l2 =3D V4L2_PIX_FMT_YVU422M,
> +		.bpp =3D 16,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUV444,
> +		.v4l2 =3D V4L2_PIX_FMT_YUV444M,
> +		.bpp =3D 24,
> +		.planes =3D 3,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVU444,
> +		.v4l2 =3D V4L2_PIX_FMT_YVU444M,
> +		.bpp =3D 24,
> +		.planes =3D 3,
> +		.hsub =3D 1,
> +	},
> +};
> +
> +const struct rzg2l_du_format_info *rzg2l_du_format_info(u32 fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(rzg2l_du_format_infos); ++i) {
> +		if (rzg2l_du_format_infos[i].fourcc =3D=3D fourcc)
> +			return &rzg2l_du_format_infos[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Frame buffer
> + */
> +
> +static const struct drm_gem_object_funcs rzg2l_du_gem_funcs =3D {
> +	.free =3D drm_gem_cma_object_free,
> +	.print_info =3D drm_gem_cma_object_print_info,
> +	.get_sg_table =3D drm_gem_cma_object_get_sg_table,
> +	.vmap =3D drm_gem_cma_object_vmap,
> +	.mmap =3D drm_gem_cma_object_mmap,
> +	.vm_ops =3D &drm_gem_cma_vm_ops,
> +};
> +
> +struct drm_gem_object *
> +rzg2l_du_gem_prime_import_sg_table(struct drm_device *dev,
> +				   struct dma_buf_attachment *attach,
> +				   struct sg_table *sgt)
> +{
> +	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_object *gem_obj;
> +	int ret;
> +
> +	/* Create a CMA GEM buffer. */
> +	cma_obj =3D kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> +	if (!cma_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	gem_obj =3D &cma_obj->base;
> +	gem_obj->funcs =3D &rzg2l_du_gem_funcs;
> +
> +	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
> +	cma_obj->map_noncoherent =3D false;
> +
> +	ret =3D drm_gem_create_mmap_offset(gem_obj);
> +	if (ret) {
> +		drm_gem_object_release(gem_obj);
> +		kfree(cma_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	cma_obj->paddr =3D 0;
> +	cma_obj->sgt =3D sgt;
> +
> +	return gem_obj;
> +}
> +
> +int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
> +			 struct drm_mode_create_dumb *args)
> +{
> +	unsigned int min_pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> +	unsigned int align;
> +
> +	align =3D 16 * args->bpp / 8;
> +
> +	args->pitch =3D roundup(min_pitch, align);
> +
> +	return drm_gem_cma_dumb_create_internal(file, dev, args);
> +}
> +
> +static struct drm_framebuffer *
> +rzg2l_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> +		   const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	const struct rzg2l_du_format_info *format;
> +	unsigned int chroma_pitch;
> +	unsigned int max_pitch;
> +	unsigned int align;
> +	unsigned int i;
> +
> +	format =3D rzg2l_du_format_info(mode_cmd->pixel_format);
> +	if (format =3D=3D NULL) {
> +		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
> +			mode_cmd->pixel_format);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/*
> +	 * On Gen3 the memory interface is handled by the VSP that
> +	 * limits the pitch to 65535 bytes and has no alignment
> +	 * constraint.
> +	 */
> +	max_pitch =3D 65535;
> +	align =3D 1;
> +
> +	if (mode_cmd->pitches[0] & (align - 1) ||
> +	    mode_cmd->pitches[0] > max_pitch) {
> +		dev_dbg(dev->dev, "invalid pitch value %u\n",
> +			mode_cmd->pitches[0]);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/*
> +	 * Calculate the chroma plane(s) pitch using the horizontal
> subsampling
> +	 * factor. For semi-planar formats, the U and V planes are
> combined, the
> +	 * pitch must thus be doubled.
> +	 */
> +	chroma_pitch =3D mode_cmd->pitches[0] / format->hsub;
> +	if (format->planes =3D=3D 2)
> +		chroma_pitch *=3D 2;
> +
> +	for (i =3D 1; i < format->planes; ++i) {
> +		if (mode_cmd->pitches[i] !=3D chroma_pitch) {
> +			dev_dbg(dev->dev,
> +				"luma and chroma pitches are not compatible\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +
> +	return drm_gem_fb_create(dev, file_priv, mode_cmd);
> +}
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Atomic Check and Update
> + */
> +
> +static int rzg2l_du_atomic_check(struct drm_device *dev,
> +				 struct drm_atomic_state *state)
> +{
> +	return drm_atomic_helper_check(dev, state);
> +}
> +
> +static void rzg2l_du_atomic_commit_tail(struct drm_atomic_state
> *old_state)
> +{
> +	struct drm_device *dev =3D old_state->dev;
> +	struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(dev);
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
> +
> +	for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
> +		struct rzg2l_du_crtc_state *rcrtc_state =3D
> +			to_rzg2l_crtc_state(crtc_state);
> +		struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +		if (rcrtc_state->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
> +			rcdu->dpad0_source =3D rcrtc->index;
> +	}
> +
> +	/* Apply the atomic update. */
> +	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> +	drm_atomic_helper_commit_planes(dev, old_state,
> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +
> +	drm_atomic_helper_commit_hw_done(old_state);
> +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> +
> +	drm_atomic_helper_cleanup_planes(dev, old_state);
> +}
> +
> +/* --------------------------------------------------------------------
> ---------
> + * Initialization
> + */
> +
> +static const struct drm_mode_config_helper_funcs
> rzg2l_du_mode_config_helper =3D {
> +	.atomic_commit_tail =3D rzg2l_du_atomic_commit_tail,
> +};
> +
> +static const struct drm_mode_config_funcs rzg2l_du_mode_config_funcs =3D
> {
> +	.fb_create =3D rzg2l_du_fb_create,
> +	.atomic_check =3D rzg2l_du_atomic_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static int rzg2l_du_encoders_init_one(struct rzg2l_du_device *rcdu,
> +				      enum rzg2l_du_output output,
> +				      struct of_endpoint *ep)
> +{
> +	struct device_node *entity;
> +	int ret;
> +
> +	/* Locate the connected entity and initialize the encoder. */
> +	entity =3D of_graph_get_remote_port_parent(ep->local_node);
> +	if (!entity) {
> +		dev_dbg(rcdu->dev, "unconnected endpoint %pOF, skipping\n",
> +			ep->local_node);
> +		return -ENODEV;
> +	}
> +
> +	if (!of_device_is_available(entity)) {
> +		dev_dbg(rcdu->dev,
> +			"connected entity %pOF is disabled, skipping\n",
> +			entity);
> +		of_node_put(entity);
> +		return -ENODEV;
> +	}
> +
> +	ret =3D rzg2l_du_encoder_init(rcdu, output, entity);
> +	if (ret && ret !=3D -EPROBE_DEFER && ret !=3D -ENOLINK)
> +		dev_warn(rcdu->dev,
> +			 "failed to initialize encoder %pOF on output %s (%d),
> skipping\n",
> +			 entity, rzg2l_du_output_name(output), ret);
> +
> +	of_node_put(entity);
> +
> +	return ret;
> +}
> +
> +static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
> +{
> +	struct device_node *np =3D rcdu->dev->of_node;
> +	struct device_node *ep_node;
> +	unsigned int num_encoders =3D 0;
> +
> +	/*
> +	 * Iterate over the endpoints and create one encoder for each
> output
> +	 * pipeline.
> +	 */
> +	for_each_endpoint_of_node(np, ep_node) {
> +		enum rzg2l_du_output output;
> +		struct of_endpoint ep;
> +		unsigned int i;
> +		int ret;
> +
> +		ret =3D of_graph_parse_endpoint(ep_node, &ep);
> +		if (ret < 0) {
> +			of_node_put(ep_node);
> +			return ret;
> +		}
> +
> +		/* Find the output route corresponding to the port number.
> */
> +		for (i =3D 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
> +			if (rcdu->info->routes[i].possible_crtcs &&
> +			    rcdu->info->routes[i].port =3D=3D ep.port) {
> +				output =3D i;
> +				break;
> +			}
> +		}
> +
> +		if (i =3D=3D RZG2L_DU_OUTPUT_MAX) {
> +			dev_warn(rcdu->dev,
> +				 "port %u references unexisting output,
> skipping\n",
> +				 ep.port);
> +			continue;
> +		}
> +
> +		/* Process the output pipeline. */
> +		ret =3D rzg2l_du_encoders_init_one(rcdu, output, &ep);
> +		if (ret < 0) {
> +			if (ret =3D=3D -EPROBE_DEFER) {
> +				of_node_put(ep_node);
> +				return ret;
> +			}
> +
> +			continue;
> +		}
> +
> +		num_encoders++;
> +	}
> +
> +	return num_encoders;
> +}
> +
> +static int rzg2l_du_properties_init(struct rzg2l_du_device *rcdu)
> +{
> +	/*
> +	 * The color key is expressed as an RGB888 triplet stored in a 32-
> bit
> +	 * integer in XRGB8888 format. Bit 24 is used as a flag to disable
> (0)
> +	 * or enable source color keying (1).
> +	 */
> +	rcdu->props.colorkey =3D
> +		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
> +					  0, 0x01ffffff);
> +	if (rcdu->props.colorkey =3D=3D NULL)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static int rzg2l_du_vsps_init(struct rzg2l_du_device *rcdu)
> +{
> +	const struct device_node *np =3D rcdu->dev->of_node;
> +	const char *vsps_prop_name =3D "renesas,vsps";
> +	struct of_phandle_args args;
> +	struct {
> +		struct device_node *np;
> +		unsigned int crtcs_mask;
> +	} vsps[RZG2L_DU_MAX_VSPS] =3D { { NULL, }, };
> +	unsigned int vsps_count =3D 0;
> +	unsigned int cells;
> +	unsigned int i;
> +	int ret;
> +
> +	/*
> +	 * First parse the DT vsps property to populate the list of VSPs.
> Each
> +	 * entry contains a pointer to the VSP DT node and a bitmask of
> the
> +	 * connected DU CRTCs.
> +	 */
> +	ret =3D of_property_count_u32_elems(np, vsps_prop_name);
> +	if (ret < 0) {
> +		/* Backward compatibility with old DTBs. */
> +		vsps_prop_name =3D "vsps";
> +		ret =3D of_property_count_u32_elems(np, vsps_prop_name);
> +	}
> +	cells =3D ret / rcdu->num_crtcs - 1;
> +	if (cells > 1)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < rcdu->num_crtcs; ++i) {
> +		unsigned int j;
> +
> +		ret =3D of_parse_phandle_with_fixed_args(np, vsps_prop_name,
> +						       cells, i, &args);
> +		if (ret < 0)
> +			goto error;
> +
> +		/*
> +		 * Add the VSP to the list or update the corresponding
> existing
> +		 * entry if the VSP has already been added.
> +		 */
> +		for (j =3D 0; j < vsps_count; ++j) {
> +			if (vsps[j].np =3D=3D args.np)
> +				break;
> +		}
> +
> +		if (j < vsps_count)
> +			of_node_put(args.np);
> +		else
> +			vsps[vsps_count++].np =3D args.np;
> +
> +		vsps[j].crtcs_mask |=3D BIT(i);
> +
> +		/*
> +		 * Store the VSP pointer and pipe index in the CRTC. If the
> +		 * second cell of the 'renesas,vsps' specifier isn't
> present,
> +		 * default to 0 to remain compatible with older DT bindings.
> +		 */
> +		rcdu->crtcs[i].vsp =3D &rcdu->vsps[j];
> +		rcdu->crtcs[i].vsp_pipe =3D cells >=3D 1 ? args.args[0] : 0;
> +	}
> +
> +	/*
> +	 * Then initialize all the VSPs from the node pointers and CRTCs
> bitmask
> +	 * computed previously.
> +	 */
> +	for (i =3D 0; i < vsps_count; ++i) {
> +		struct rzg2l_du_vsp *vsp =3D &rcdu->vsps[i];
> +
> +		vsp->index =3D i;
> +		vsp->dev =3D rcdu;
> +
> +		ret =3D rzg2l_du_vsp_init(vsp, vsps[i].np,
> vsps[i].crtcs_mask);
> +		if (ret < 0)
> +			goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	for (i =3D 0; i < ARRAY_SIZE(vsps); ++i)
> +		of_node_put(vsps[i].np);
> +
> +	return ret;
> +}
> +
> +int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
> +{
> +	struct drm_device *dev =3D &rcdu->ddev;
> +	struct drm_encoder *encoder;
> +	unsigned int dpad0_sources;
> +	unsigned int num_encoders;
> +	unsigned int num_groups;
> +	unsigned int swindex;
> +	unsigned int hwindex;
> +	unsigned int i;
> +	int ret;
> +
> +	ret =3D drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	dev->mode_config.min_width =3D 0;
> +	dev->mode_config.min_height =3D 0;
> +	dev->mode_config.normalize_zpos =3D true;
> +	dev->mode_config.funcs =3D &rzg2l_du_mode_config_funcs;
> +	dev->mode_config.helper_private =3D &rzg2l_du_mode_config_helper;
> +
> +	/*
> +	 * The RZ/G2L DU uses the VSP1 for memory access, and is limited
> +	 * to frame sizes of 1920x1080.
> +	 */
> +	dev->mode_config.max_width =3D 1920;
> +	dev->mode_config.max_height =3D 1080;
> +
> +	rcdu->num_crtcs =3D hweight8(rcdu->info->channels_mask);
> +
> +	ret =3D rzg2l_du_properties_init(rcdu);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Initialize vertical blanking interrupts handling. Start with
> vblank
> +	 * disabled for all CRTCs.
> +	 */
> +	ret =3D drm_vblank_init(dev, rcdu->num_crtcs);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Initialize the groups. */
> +	num_groups =3D DIV_ROUND_UP(rcdu->num_crtcs, 2);
> +
> +	for (i =3D 0; i < num_groups; ++i) {
> +		struct rzg2l_du_group *rgrp =3D &rcdu->groups[i];
> +
> +		rgrp->dev =3D rcdu;
> +		rgrp->index =3D i;
> +		/* Extract the channel mask for this group only. */
> +		rgrp->channels_mask =3D (rcdu->info->channels_mask >> (2 * i))
> +				   & GENMASK(1, 0);
> +		rgrp->num_crtcs =3D hweight8(rgrp->channels_mask);
> +	}
> +
> +	/* Initialize the compositors. */
> +	ret =3D rzg2l_du_vsps_init(rcdu);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Create the CRTCs. */
> +	for (swindex =3D 0, hwindex =3D 0; swindex < rcdu->num_crtcs;
> ++hwindex) {
> +		struct rzg2l_du_group *rgrp;
> +
> +		/* Skip unpopulated DU channels. */
> +		if (!(rcdu->info->channels_mask & BIT(hwindex)))
> +			continue;
> +
> +		rgrp =3D &rcdu->groups[hwindex / 2];
> +
> +		ret =3D rzg2l_du_crtc_create(rgrp, swindex++, hwindex);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Initialize the encoders. */
> +	ret =3D rzg2l_du_encoders_init(rcdu);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret =3D=3D 0) {
> +		dev_err(rcdu->dev, "error: no encoder could be
> initialized\n");
> +		return -EINVAL;
> +	}
> +
> +	num_encoders =3D ret;
> +
> +	/*
> +	 * Set the possible CRTCs and possible clones. There's always at
> least
> +	 * one way for all encoders to clone each other, set all bits in
> the
> +	 * possible clones field.
> +	 */
> +	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
> {
> +		struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> +		const struct rzg2l_du_output_routing *route =3D
> +			&rcdu->info->routes[renc->output];
> +
> +		encoder->possible_crtcs =3D route->possible_crtcs;
> +		encoder->possible_clones =3D (1 << num_encoders) - 1;
> +	}
> +
> +	/* Create the writeback connectors. */
> +	for (i =3D 0; i < rcdu->num_crtcs; ++i) {
> +		struct rzg2l_du_crtc *rcrtc =3D &rcdu->crtcs[i];
> +
> +		ret =3D rzg2l_du_writeback_init(rcdu, rcrtc);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Initialize the default DPAD0 source to the index of the first
> DU
> +	 * channel that can be connected to DPAD0. The exact value doesn't
> +	 * matter as it should be overwritten by mode setting for the RGB
> +	 * output, but it is nonetheless required to ensure a valid
> initial
> +	 * hardware configuration on Gen3 where DU0 can't always be
> connected to
> +	 * DPAD0.
> +	 */
> +	dpad0_sources =3D rcdu->info-
> >routes[RZG2L_DU_OUTPUT_DPAD0].possible_crtcs;
> +	rcdu->dpad0_source =3D ffs(dpad0_sources) - 1;
> +
> +	drm_mode_config_reset(dev);
> +
> +	drm_kms_helper_poll_init(dev);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
> new file mode 100644
> index 000000000000..7a691d821ead
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l_du_kms.h  --  RZ/G2L Display Unit Mode Setting
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_kms.h
> + */
> +
> +#ifndef __RZG2L_DU_KMS_H__
> +#define __RZG2L_DU_KMS_H__
> +
> +#include <linux/types.h>
> +
> +struct dma_buf_attachment;
> +struct drm_file;
> +struct drm_device;
> +struct drm_gem_object;
> +struct drm_mode_create_dumb;
> +struct rzg2l_du_device;
> +struct sg_table;
> +
> +struct rzg2l_du_format_info {
> +	u32 fourcc;
> +	u32 v4l2;
> +	unsigned int bpp;
> +	unsigned int planes;
> +	unsigned int hsub;
> +};
> +
> +const struct rzg2l_du_format_info *rzg2l_du_format_info(u32 fourcc);
> +
> +int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu);
> +
> +int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
> +			 struct drm_mode_create_dumb *args);
> +
> +struct drm_gem_object *
> +rzg2l_du_gem_prime_import_sg_table(struct drm_device *dev,
> +				   struct dma_buf_attachment *attach,
> +				   struct sg_table *sgt);
> +
> +#endif /* __RZG2L_DU_KMS_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
> new file mode 100644
> index 000000000000..cc2897649cde
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * rzg2l_lcdc_regs.h  --  RZ/G2L LCDC Registers Definitions
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + */
> +
> +#ifndef __RZG2L_DU_REGS_H__
> +#define __RZG2L_DU_REGS_H__
> +
> +/* --------------------------------------------------------------------
> ---------
> + * RZ/G2L Display Registers
> + */
> +
> +#define DU_MCR0			0x00
> +#define DU_MCR0_DPI_OE		BIT(0)
> +#define DU_MCR0_DI_EN		BIT(8)
> +#define DU_MCR0_PB_CLR		BIT(16)
> +
> +#define DU_MSR0			0x04
> +#define DU_MSR0_ST_DI_BSY	BIT(8)
> +#define DU_MSR0_ST_PB_WFULL	BIT(16)
> +#define DU_MSR0_ST_PB_WINIT	BIT(18)
> +#define DU_MSR0_ST_PB_REMPTY	BIT(20)
> +#define DU_MSR0_ST_PB_RUF	BIT(21)
> +#define DU_MSR0_ST_PB_RINIT	BIT(22)
> +
> +#define DU_MSR1			0x08
> +
> +#define DU_IMR0			0x0C
> +#define DU_MSR0_IM_PB_RUF	BIT(0)
> +
> +#define DU_DITR0		0x10
> +#define DU_DITR0_DPI_CLKMD	BIT(0)
> +#define DU_DITR0_DEMD_LOW	0x0
> +#define DU_DITR0_DEMD_HIGH	(BIT(8) | BIT(9))
> +#define DU_DITR0_VSPOL		BIT(16)
> +#define DU_DITR0_HSPOL		BIT(17)
> +
> +#define DU_DITR1		0x14
> +#define DU_DITR1_VSA(x)		((x) << 0)
> +#define DU_DITR1_VACTIVE(x)	((x) << 16)
> +
> +#define DU_DITR2		0x18
> +#define DU_DITR2_VBP(x)		((x) << 0)
> +#define DU_DITR2_VFP(x)		((x) << 16)
> +
> +#define DU_DITR3		0x1C
> +#define DU_DITR3_HSA(x)		((x) << 0)
> +#define DU_DITR3_HACTIVE(x)	((x) << 16)
> +
> +#define DU_DITR4		0x20
> +#define DU_DITR4_HBP(x)		((x) << 0)
> +#define DU_DITR4_HFP(x)		((x) << 16)
> +
> +#define DU_DITR5		0x24
> +#define DU_DITR5_VSFT(x)	((x) << 0)
> +#define DU_DITR5_HSFT(x)	((x) << 16)
> +
> +#define DU_PBCR0		0x4C
> +#define DU_PBCR0_PB_DEP(x)	((x) << 0)
> +
> +#endif /* __RZG2L_DU_REGS_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
> b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
> new file mode 100644
> index 000000000000..41ef4ca3bcdc
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
> @@ -0,0 +1,420 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rzg2l_du_vsp.c  --  RZ/G2L Display Unit VSP-Based Compositor
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_vsp.c
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include <linux/bitops.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/of_platform.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +
> +#include <media/vsp1.h>
> +
> +#include "rzg2l_du_drv.h"
> +#include "rzg2l_du_kms.h"
> +#include "rzg2l_du_vsp.h"
> +#include "rzg2l_du_writeback.h"
> +
> +static void rzg2l_du_vsp_complete(void *private, unsigned int status,
> u32 crc)
> +{
> +	struct rzg2l_du_crtc *crtc =3D private;
> +
> +	if (crtc->vblank_enable)
> +		drm_crtc_handle_vblank(&crtc->crtc);
> +
> +	if (status & VSP1_DU_STATUS_COMPLETE)
> +		rzg2l_du_crtc_finish_page_flip(crtc);
> +	if (status & VSP1_DU_STATUS_WRITEBACK)
> +		rzg2l_du_writeback_complete(crtc);
> +
> +	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc);
> +}
> +
> +void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
> +{
> +	const struct drm_display_mode *mode =3D &crtc->crtc.state-
> >adjusted_mode;
> +	struct vsp1_du_lif_config cfg =3D {
> +		.width =3D mode->hdisplay,
> +		.height =3D mode->vdisplay,
> +		.interlaced =3D mode->flags & DRM_MODE_FLAG_INTERLACE,
> +		.callback =3D rzg2l_du_vsp_complete,
> +		.callback_data =3D crtc,
> +	};
> +
> +	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
> +}
> +
> +void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
> +{
> +	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
> +}
> +
> +void rzg2l_du_vsp_atomic_begin(struct rzg2l_du_crtc *crtc)
> +{
> +	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
> +}
> +
> +void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
> +{
> +	struct vsp1_du_atomic_pipe_config cfg =3D { { 0, } };
> +	struct rzg2l_du_crtc_state *state;
> +
> +	state =3D to_rzg2l_crtc_state(crtc->crtc.state);
> +	cfg.crc =3D state->crc;
> +
> +	rzg2l_du_writeback_setup(crtc, &cfg.writeback);
> +
> +	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
> +}
> +
> +static const u32 rzg2l_du_vsp_formats[] =3D {
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_ARGB4444,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_ARGB1555,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_YUYV,
> +	DRM_FORMAT_YVYU,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_YUV420,
> +	DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU444,
> +};
> +
> +static void rzg2l_du_vsp_plane_setup(struct rzg2l_du_vsp_plane *plane)
> +{
> +	struct rzg2l_du_vsp_plane_state *state =3D
> +		to_rzg2l_vsp_plane_state(plane->plane.state);
> +	struct rzg2l_du_crtc *crtc =3D to_rzg2l_crtc(state->state.crtc);
> +	struct drm_framebuffer *fb =3D plane->plane.state->fb;
> +	const struct rzg2l_du_format_info *format;
> +	struct vsp1_du_atomic_config cfg =3D {
> +		.pixelformat =3D 0,
> +		.pitch =3D fb->pitches[0],
> +		.alpha =3D state->state.alpha >> 8,
> +		.zpos =3D state->state.zpos,
> +	};
> +	unsigned int i;
> +
> +	cfg.src.left =3D state->state.src.x1 >> 16;
> +	cfg.src.top =3D state->state.src.y1 >> 16;
> +	cfg.src.width =3D drm_rect_width(&state->state.src) >> 16;
> +	cfg.src.height =3D drm_rect_height(&state->state.src) >> 16;
> +
> +	cfg.dst.left =3D state->state.dst.x1;
> +	cfg.dst.top =3D state->state.dst.y1;
> +	cfg.dst.width =3D drm_rect_width(&state->state.dst);
> +	cfg.dst.height =3D drm_rect_height(&state->state.dst);
> +
> +	for (i =3D 0; i < state->format->planes; ++i)
> +		cfg.mem[i] =3D sg_dma_address(state->sg_tables[i].sgl)
> +			   + fb->offsets[i];
> +
> +	format =3D rzg2l_du_format_info(state->format->fourcc);
> +	cfg.pixelformat =3D format->v4l2;
> +
> +	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
> +			      plane->index, &cfg);
> +}
> +
> +int rzg2l_du_vsp_map_fb(struct rzg2l_du_vsp *vsp, struct
> drm_framebuffer *fb,
> +			struct sg_table sg_tables[3])
> +{
> +	struct rzg2l_du_device *rcdu =3D vsp->dev;
> +	unsigned int i, j;
> +	int ret;
> +
> +	for (i =3D 0; i < fb->format->num_planes; ++i) {
> +		struct drm_gem_cma_object *gem =3D drm_fb_cma_get_gem_obj(fb,
> i);
> +		struct sg_table *sgt =3D &sg_tables[i];
> +
> +		if (gem->sgt) {
> +			struct scatterlist *src;
> +			struct scatterlist *dst;
> +
> +			/*
> +			 * If the GEM buffer has a scatter gather table, it
> has
> +			 * been imported from a dma-buf and has no physical
> +			 * address as it might not be physically contiguous.
> +			 * Copy the original scatter gather table to map it to
> +			 * the VSP.
> +			 */
> +			ret =3D sg_alloc_table(sgt, gem->sgt->orig_nents,
> +					     GFP_KERNEL);
> +			if (ret)
> +				goto fail;
> +
> +			src =3D gem->sgt->sgl;
> +			dst =3D sgt->sgl;
> +			for (j =3D 0; j < gem->sgt->orig_nents; ++j) {
> +				sg_set_page(dst, sg_page(src), src->length,
> +					    src->offset);
> +				src =3D sg_next(src);
> +				dst =3D sg_next(dst);
> +			}
> +		} else {
> +			ret =3D dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
> +					      gem->paddr, gem->base.size);
> +			if (ret)
> +				goto fail;
> +		}
> +
> +		ret =3D vsp1_du_map_sg(vsp->vsp, sgt);
> +		if (ret) {
> +			sg_free_table(sgt);
> +			goto fail;
> +		}
> +	}
> +
> +	return 0;
> +
> +fail:
> +	while (i--) {
> +		struct sg_table *sgt =3D &sg_tables[i];
> +
> +		vsp1_du_unmap_sg(vsp->vsp, sgt);
> +		sg_free_table(sgt);
> +	}
> +
> +	return ret;
> +}
> +
> +static int rzg2l_du_vsp_plane_prepare_fb(struct drm_plane *plane,
> +					 struct drm_plane_state *state)
> +{
> +	struct rzg2l_du_vsp_plane_state *rstate =3D
> to_rzg2l_vsp_plane_state(state);
> +	struct rzg2l_du_vsp *vsp =3D to_rzg2l_vsp_plane(plane)->vsp;
> +	int ret;
> +
> +	/*
> +	 * There's no need to prepare (and unprepare) the framebuffer when
> the
> +	 * plane is not visible, as it will not be displayed.
> +	 */
> +	if (!state->visible)
> +		return 0;
> +
> +	ret =3D rzg2l_du_vsp_map_fb(vsp, state->fb, rstate->sg_tables);
> +	if (ret < 0)
> +		return ret;
> +
> +	return drm_gem_plane_helper_prepare_fb(plane, state);
> +}
> +
> +void rzg2l_du_vsp_unmap_fb(struct rzg2l_du_vsp *vsp, struct
> drm_framebuffer *fb,
> +			   struct sg_table sg_tables[3])
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < fb->format->num_planes; ++i) {
> +		struct sg_table *sgt =3D &sg_tables[i];
> +
> +		vsp1_du_unmap_sg(vsp->vsp, sgt);
> +		sg_free_table(sgt);
> +	}
> +}
> +
> +static void rzg2l_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
> +					  struct drm_plane_state *state)
> +{
> +	struct rzg2l_du_vsp_plane_state *rstate =3D
> to_rzg2l_vsp_plane_state(state);
> +	struct rzg2l_du_vsp *vsp =3D to_rzg2l_vsp_plane(plane)->vsp;
> +
> +	if (!state->visible)
> +		return;
> +
> +	rzg2l_du_vsp_unmap_fb(vsp, state->fb, rstate->sg_tables);
> +}
> +
> +static int rzg2l_du_vsp_plane_atomic_check(struct drm_plane *plane,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state =3D
> drm_atomic_get_new_plane_state(state,
> +										 plane);
> +	struct rzg2l_du_vsp_plane_state *rstate =3D
> to_rzg2l_vsp_plane_state(new_plane_state);
> +
> +	return __rzg2l_du_crtc_plane_atomic_check(plane, new_plane_state,
> &rstate->format);
> +}
> +
> +static void rzg2l_du_vsp_plane_atomic_update(struct drm_plane *plane,
> +					     struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *old_state =3D
> drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *new_state =3D
> drm_atomic_get_new_plane_state(state, plane);
> +	struct rzg2l_du_vsp_plane *rplane =3D to_rzg2l_vsp_plane(plane);
> +	struct rzg2l_du_crtc *crtc =3D to_rzg2l_crtc(old_state->crtc);
> +
> +	if (new_state->visible)
> +		rzg2l_du_vsp_plane_setup(rplane);
> +	else if (old_state->crtc)
> +		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
> +				      rplane->index, NULL);
> +}
> +
> +static const struct drm_plane_helper_funcs
> rzg2l_du_vsp_plane_helper_funcs =3D {
> +	.prepare_fb =3D rzg2l_du_vsp_plane_prepare_fb,
> +	.cleanup_fb =3D rzg2l_du_vsp_plane_cleanup_fb,
> +	.atomic_check =3D rzg2l_du_vsp_plane_atomic_check,
> +	.atomic_update =3D rzg2l_du_vsp_plane_atomic_update,
> +};
> +
> +static struct drm_plane_state *
> +rzg2l_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct rzg2l_du_vsp_plane_state *copy;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;
> +
> +	copy =3D kzalloc(sizeof(*copy), GFP_KERNEL);
> +	if (copy =3D=3D NULL)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
> +
> +	return &copy->state;
> +}
> +
> +static void rzg2l_du_vsp_plane_atomic_destroy_state(struct drm_plane
> *plane,
> +						    struct drm_plane_state *state)
> +{
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(to_rzg2l_vsp_plane_state(state));
> +}
> +
> +static void rzg2l_du_vsp_plane_reset(struct drm_plane *plane)
> +{
> +	struct rzg2l_du_vsp_plane_state *state;
> +
> +	if (plane->state) {
> +		rzg2l_du_vsp_plane_atomic_destroy_state(plane, plane-
> >state);
> +		plane->state =3D NULL;
> +	}
> +
> +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (state =3D=3D NULL)
> +		return;
> +
> +	__drm_atomic_helper_plane_reset(plane, &state->state);
> +}
> +
> +static const struct drm_plane_funcs rzg2l_du_vsp_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.reset =3D rzg2l_du_vsp_plane_reset,
> +	.destroy =3D drm_plane_cleanup,
> +	.atomic_duplicate_state =3D
> rzg2l_du_vsp_plane_atomic_duplicate_state,
> +	.atomic_destroy_state =3D rzg2l_du_vsp_plane_atomic_destroy_state,
> +};
> +
> +static void rzg2l_du_vsp_cleanup(struct drm_device *dev, void *res)
> +{
> +	struct rzg2l_du_vsp *vsp =3D res;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < vsp->num_planes; ++i) {
> +		struct rzg2l_du_vsp_plane *plane =3D &vsp->planes[i];
> +
> +		drm_plane_cleanup(&plane->plane);
> +	}
> +
> +	kfree(vsp->planes);
> +
> +	put_device(vsp->vsp);
> +}
> +
> +int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
> +		      unsigned int crtcs)
> +{
> +	struct rzg2l_du_device *rcdu =3D vsp->dev;
> +	struct platform_device *pdev;
> +	unsigned int num_crtcs =3D hweight32(crtcs);
> +	unsigned int num_planes;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Find the VSP device and initialize it. */
> +	pdev =3D of_find_device_by_node(np);
> +	if (!pdev)
> +		return -ENXIO;
> +
> +	vsp->vsp =3D &pdev->dev;
> +
> +	ret =3D drmm_add_action_or_reset(&rcdu->ddev, rzg2l_du_vsp_cleanup,
> vsp);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D vsp1_du_init(vsp->vsp);
> +	if (ret < 0)
> +		return ret;
> +
> +	num_planes =3D rcdu->info->num_rpf;
> +
> +	vsp->planes =3D kcalloc(num_planes, sizeof(*vsp->planes),
> GFP_KERNEL);
> +	if (!vsp->planes)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_planes; ++i) {
> +		enum drm_plane_type type =3D i < num_crtcs
> +					 ? DRM_PLANE_TYPE_PRIMARY
> +					 : DRM_PLANE_TYPE_OVERLAY;
> +		struct rzg2l_du_vsp_plane *plane =3D &vsp->planes[i];
> +
> +		plane->vsp =3D vsp;
> +		plane->index =3D i;
> +
> +		ret =3D drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> +					       crtcs, &rzg2l_du_vsp_plane_funcs,
> +					       rzg2l_du_vsp_formats,
> +					       ARRAY_SIZE(rzg2l_du_vsp_formats),
> +					       NULL, type, NULL);
> +		if (ret < 0)
> +			return ret;
> +
> +		drm_plane_helper_add(&plane->plane,
> +				     &rzg2l_du_vsp_plane_helper_funcs);
> +
> +		if (type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +			drm_plane_create_zpos_immutable_property(&plane-
> >plane,
> +								 0);
> +		} else {
> +			drm_plane_create_alpha_property(&plane->plane);
> +			drm_plane_create_zpos_property(&plane->plane, 1, 1,
> +						       num_planes - 1);
> +		}
> +
> +		vsp->num_planes++;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
> new file mode 100644
> index 000000000000..639001c2d77d
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l_du_vsp.h  --  RZ/G2L Display Unit VSP-Based Compositor
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_vsp.h
> + */
> +
> +#ifndef __RZG2L_DU_VSP_H__
> +#define __RZG2L_DU_VSP_H__
> +
> +#include <drm/drm_plane.h>
> +
> +struct drm_framebuffer;
> +struct rzg2l_du_format_info;
> +struct rzg2l_du_vsp;
> +struct sg_table;
> +
> +struct rzg2l_du_vsp_plane {
> +	struct drm_plane plane;
> +	struct rzg2l_du_vsp *vsp;
> +	unsigned int index;
> +};
> +
> +struct rzg2l_du_vsp {
> +	unsigned int index;
> +	struct device *vsp;
> +	struct rzg2l_du_device *dev;
> +	struct rzg2l_du_vsp_plane *planes;
> +	unsigned int num_planes;
> +};
> +
> +static inline struct rzg2l_du_vsp_plane *to_rzg2l_vsp_plane(struct
> drm_plane *p)
> +{
> +	return container_of(p, struct rzg2l_du_vsp_plane, plane);
> +}
> +
> +/**
> + * struct rzg2l_du_vsp_plane_state - Driver-specific plane state
> + * @state: base DRM plane state
> + * @format: information about the pixel format used by the plane
> + * @sg_tables: scatter-gather tables for the frame buffer memory
> + */
> +struct rzg2l_du_vsp_plane_state {
> +	struct drm_plane_state state;
> +
> +	const struct rzg2l_du_format_info *format;
> +	struct sg_table sg_tables[3];
> +};
> +
> +static inline struct rzg2l_du_vsp_plane_state *
> +to_rzg2l_vsp_plane_state(struct drm_plane_state *state)
> +{
> +	return container_of(state, struct rzg2l_du_vsp_plane_state,
> state);
> +}
> +
> +#ifdef CONFIG_DRM_RCAR_VSP
> +int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
> +		      unsigned int crtcs);
> +void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc);
> +void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc);
> +void rzg2l_du_vsp_atomic_begin(struct rzg2l_du_crtc *crtc);
> +void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc);
> +int rzg2l_du_vsp_map_fb(struct rzg2l_du_vsp *vsp, struct
> drm_framebuffer *fb,
> +			struct sg_table sg_tables[3]);
> +void rzg2l_du_vsp_unmap_fb(struct rzg2l_du_vsp *vsp, struct
> drm_framebuffer *fb,
> +			   struct sg_table sg_tables[3]);
> +#else
> +static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp,
> +				    struct device_node *np,
> +				    unsigned int crtcs)
> +{
> +	return -ENXIO;
> +}
> +static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc) { };
> +static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc) {
> };
> +static inline void rzg2l_du_vsp_atomic_begin(struct rzg2l_du_crtc
> *crtc) { };
> +static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc
> *crtc) { };
> +static inline int rzg2l_du_vsp_map_fb(struct rzg2l_du_vsp *vsp,
> +				      struct drm_framebuffer *fb,
> +				      struct sg_table sg_tables[3])
> +{
> +	return -ENXIO;
> +}
> +static inline void rzg2l_du_vsp_unmap_fb(struct rzg2l_du_vsp *vsp,
> +					 struct drm_framebuffer *fb,
> +					 struct sg_table sg_tables[3])
> +{
> +}
> +#endif
> +
> +#endif /* __RZG2L_DU_VSP_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c
> b/drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c
> new file mode 100644
> index 000000000000..e2e68664aa9d
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rzg2l_du_writeback.c  --  RZ/G2L Display Unit Writeback Support
> + *
> + * Copyright (C) 2019 Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_writeback.c
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_writeback.h>
> +
> +#include "rzg2l_du_crtc.h"
> +#include "rzg2l_du_drv.h"
> +#include "rzg2l_du_kms.h"
> +#include "rzg2l_du_writeback.h"
> +
> +/**
> + * struct rzg2l_du_wb_conn_state - Driver-specific writeback connector
> state
> + * @state: base DRM connector state
> + * @format: format of the writeback framebuffer
> + */
> +struct rzg2l_du_wb_conn_state {
> +	struct drm_connector_state state;
> +	const struct rzg2l_du_format_info *format;
> +};
> +
> +#define to_rzg2l_wb_conn_state(s) \
> +	container_of(s, struct rzg2l_du_wb_conn_state, state)
> +
> +/**
> + * struct rzg2l_du_wb_job - Driver-private data for writeback jobs
> + * @sg_tables: scatter-gather tables for the framebuffer memory
> + */
> +struct rzg2l_du_wb_job {
> +	struct sg_table sg_tables[3];
> +};
> +
> +static int rzg2l_du_wb_conn_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +
> +	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> +				    dev->mode_config.max_height);
> +}
> +
> +static int rzg2l_du_wb_prepare_job(struct drm_writeback_connector
> *connector,
> +				   struct drm_writeback_job *job)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D wb_to_rzg2l_crtc(connector);
> +	struct rzg2l_du_wb_job *rjob;
> +	int ret;
> +
> +	if (!job->fb)
> +		return 0;
> +
> +	rjob =3D kzalloc(sizeof(*rjob), GFP_KERNEL);
> +	if (!rjob)
> +		return -ENOMEM;
> +
> +	/* Map the framebuffer to the VSP. */
> +	ret =3D rzg2l_du_vsp_map_fb(rcrtc->vsp, job->fb, rjob->sg_tables);
> +	if (ret < 0) {
> +		kfree(rjob);
> +		return ret;
> +	}
> +
> +	job->priv =3D rjob;
> +	return 0;
> +}
> +
> +static void rzg2l_du_wb_cleanup_job(struct drm_writeback_connector
> *connector,
> +				    struct drm_writeback_job *job)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D wb_to_rzg2l_crtc(connector);
> +	struct rzg2l_du_wb_job *rjob =3D job->priv;
> +
> +	if (!job->fb)
> +		return;
> +
> +	rzg2l_du_vsp_unmap_fb(rcrtc->vsp, job->fb, rjob->sg_tables);
> +	kfree(rjob);
> +}
> +
> +static const struct drm_connector_helper_funcs
> rzg2l_du_wb_conn_helper_funcs =3D {
> +	.get_modes =3D rzg2l_du_wb_conn_get_modes,
> +	.prepare_writeback_job =3D rzg2l_du_wb_prepare_job,
> +	.cleanup_writeback_job =3D rzg2l_du_wb_cleanup_job,
> +};
> +
> +static struct drm_connector_state *
> +rzg2l_du_wb_conn_duplicate_state(struct drm_connector *connector)
> +{
> +	struct rzg2l_du_wb_conn_state *copy;
> +
> +	if (WARN_ON(!connector->state))
> +		return NULL;
> +
> +	copy =3D kzalloc(sizeof(*copy), GFP_KERNEL);
> +	if (!copy)
> +		return NULL;
> +
> +	__drm_atomic_helper_connector_duplicate_state(connector, &copy-
> >state);
> +
> +	return &copy->state;
> +}
> +
> +static void rzg2l_du_wb_conn_destroy_state(struct drm_connector
> *connector,
> +					   struct drm_connector_state *state)
> +{
> +	__drm_atomic_helper_connector_destroy_state(state);
> +	kfree(to_rzg2l_wb_conn_state(state));
> +}
> +
> +static void rzg2l_du_wb_conn_reset(struct drm_connector *connector)
> +{
> +	struct rzg2l_du_wb_conn_state *state;
> +
> +	if (connector->state) {
> +		rzg2l_du_wb_conn_destroy_state(connector, connector->state);
> +		connector->state =3D NULL;
> +	}
> +
> +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (state =3D=3D NULL)
> +		return;
> +
> +	__drm_atomic_helper_connector_reset(connector, &state->state);
> +}
> +
> +static const struct drm_connector_funcs rzg2l_du_wb_conn_funcs =3D {
> +	.reset =3D rzg2l_du_wb_conn_reset,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D drm_connector_cleanup,
> +	.atomic_duplicate_state =3D rzg2l_du_wb_conn_duplicate_state,
> +	.atomic_destroy_state =3D rzg2l_du_wb_conn_destroy_state,
> +};
> +
> +static int rzg2l_du_wb_enc_atomic_check(struct drm_encoder *encoder,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct rzg2l_du_wb_conn_state *wb_state =3D
> +		to_rzg2l_wb_conn_state(conn_state);
> +	const struct drm_display_mode *mode =3D &crtc_state->mode;
> +	struct drm_device *dev =3D encoder->dev;
> +	struct drm_framebuffer *fb;
> +
> +	if (!conn_state->writeback_job)
> +		return 0;
> +
> +	fb =3D conn_state->writeback_job->fb;
> +
> +	/*
> +	 * Verify that the framebuffer format is supported and that its
> size
> +	 * matches the current mode.
> +	 */
> +	if (fb->width !=3D mode->hdisplay || fb->height !=3D mode->vdisplay) {
> +		dev_dbg(dev->dev, "%s: invalid framebuffer size %ux%u\n",
> +			__func__, fb->width, fb->height);
> +		return -EINVAL;
> +	}
> +
> +	wb_state->format =3D rzg2l_du_format_info(fb->format->format);
> +	if (wb_state->format =3D=3D NULL) {
> +		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
> +			fb->format->format);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_encoder_helper_funcs
> rzg2l_du_wb_enc_helper_funcs =3D {
> +	.atomic_check =3D rzg2l_du_wb_enc_atomic_check,
> +};
> +
> +/*
> + * Only RGB formats are currently supported as the VSP outputs RGB to
> the DU
> + * and can't convert to YUV separately for writeback.
> + */
> +static const u32 writeback_formats[] =3D {
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_ARGB4444,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_ARGB1555,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +int rzg2l_du_writeback_init(struct rzg2l_du_device *rcdu,
> +			    struct rzg2l_du_crtc *rcrtc)
> +{
> +	struct drm_writeback_connector *wb_conn =3D &rcrtc->writeback;
> +
> +	wb_conn->encoder.possible_crtcs =3D 1 << drm_crtc_index(&rcrtc-
> >crtc);
> +	drm_connector_helper_add(&wb_conn->base,
> +				 &rzg2l_du_wb_conn_helper_funcs);
> +
> +	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> +					    &rzg2l_du_wb_conn_funcs,
> +					    &rzg2l_du_wb_enc_helper_funcs,
> +					    writeback_formats,
> +					    ARRAY_SIZE(writeback_formats));
> +}
> +
> +void rzg2l_du_writeback_setup(struct rzg2l_du_crtc *rcrtc,
> +			      struct vsp1_du_writeback_config *cfg)
> +{
> +	struct rzg2l_du_wb_conn_state *wb_state;
> +	struct drm_connector_state *state;
> +	struct rzg2l_du_wb_job *rjob;
> +	struct drm_framebuffer *fb;
> +	unsigned int i;
> +
> +	state =3D rcrtc->writeback.base.state;
> +	if (!state || !state->writeback_job)
> +		return;
> +
> +	fb =3D state->writeback_job->fb;
> +	rjob =3D state->writeback_job->priv;
> +	wb_state =3D to_rzg2l_wb_conn_state(state);
> +
> +	cfg->pixelformat =3D wb_state->format->v4l2;
> +	cfg->pitch =3D fb->pitches[0];
> +
> +	for (i =3D 0; i < wb_state->format->planes; ++i)
> +		cfg->mem[i] =3D sg_dma_address(rjob->sg_tables[i].sgl)
> +			    + fb->offsets[i];
> +
> +	drm_writeback_queue_job(&rcrtc->writeback, state);
> +}
> +
> +void rzg2l_du_writeback_complete(struct rzg2l_du_crtc *rcrtc)
> +{
> +	drm_writeback_signal_completion(&rcrtc->writeback, 0);
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h
> b/drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h
> new file mode 100644
> index 000000000000..1553331ad34b
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l_du_writeback.h  --  RZ/G2L Display Unit Writeback Support
> + *
> + * Copyright (C) 2019 Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Based on rcar_du_writeback.h
> + */
> +
> +#ifndef __RZG2L_DU_WRITEBACK_H__
> +#define __RZG2L_DU_WRITEBACK_H__
> +
> +#include <drm/drm_plane.h>
> +
> +struct rzg2l_du_crtc;
> +struct rzg2l_du_device;
> +struct vsp1_du_atomic_pipe_config;
> +
> +#ifdef CONFIG_DRM_RCAR_WRITEBACK
> +int rzg2l_du_writeback_init(struct rzg2l_du_device *rcdu,
> +			    struct rzg2l_du_crtc *rcrtc);
> +void rzg2l_du_writeback_setup(struct rzg2l_du_crtc *rcrtc,
> +			      struct vsp1_du_writeback_config *cfg);
> +void rzg2l_du_writeback_complete(struct rzg2l_du_crtc *rcrtc);
> +#else
> +static inline int rzg2l_du_writeback_init(struct rzg2l_du_device *rcdu,
> +					  struct rzg2l_du_crtc *rcrtc)
> +{
> +	return -ENXIO;
> +}
> +static inline void
> +rzg2l_du_writeback_setup(struct rzg2l_du_crtc *rcrtc,
> +			 struct vsp1_du_writeback_config *cfg)
> +{
> +}
> +static inline void rzg2l_du_writeback_complete(struct rzg2l_du_crtc
> *rcrtc)
> +{
> +}
> +#endif
> +
> +#endif /* __RZG2L_DU_WRITEBACK_H__ */
> --
> 2.25.1

