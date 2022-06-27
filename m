Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B34355B8C9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413310F87D;
	Mon, 27 Jun 2022 08:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3BE10E253
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:54:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QceqAiGeFbGhNkXM4wv69YH8atDpSb1pelNAup1ApZTl+Hueyde3ZTS8gGNRL5qgSs3Qjyxzaxs/Fbz82M9RcHy43lGt+nsQb2e6peVgn9nBQ4y2BK+M20MJFGWOMCX580kQZCLJa0ScTNyGme5oOHtS1gfFlLzIdsticxAApmc8Q4DLP2GeROs9NlAjtFsFIy9HJ2T7HyY6ICVlXAVe1h+deOZPbp8llfMG298JICAEl7m+mFimRu10QLwiS22PDB3VlmVG1IBsOm9JLttsGK4/A7HmAo408DIFgxkl0eGnKs4B5W1u3rNX692gLv7NwYpkfANx9cLBIUK+p54Yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zVzZor6p4qxP2PKBme4CiXbtXW1vHvr9SiPxbjrdmg=;
 b=BsmmHEwbGP0AIQEsLl+Rt5PpXUrBm2PH+UY1VyRo2vrOVFyHMZBNxaJcBe3XOuV8ts0OR7G1vFsPS25whyInh3LZN9eVyoJyZ8KRKLEdRf6GIkJD2q2DKMcxTjQzn/lQjXJ/kt6tR4pDnz51X78vZdHMyLHK8tZwnxnsGwyACaTDU+EpakZxqDhVlgBVOt6uLx98/EzsqeuPYzDsOzDPVl/hAEFRzFzWToXZMdO/jXYK2VuLDGCKrKF2r0jt6eAs/XCQx7yv0ByYWznCGWSZJFS6/JGl3O83rzObgXBCl6m0Bykff9nhLGmcF74xDHEf7J2a/VlT4grqL5EwrTH8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zVzZor6p4qxP2PKBme4CiXbtXW1vHvr9SiPxbjrdmg=;
 b=bjHXg2jhZ4KbVuLyuenMPOO1amdnju+7pDOa08czVZxmwUI6zHX3ej8UR8Y6ciQNb73v/amOKzSsB3k5TNLAtB7vPFswd6dCTaOYaZCDVzHUNIdVoA8kerK+cv563m1luEsbIycSjO1otlPDqXTTWQoFu3oxJR075SSuQPxgOac=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8352.eurprd04.prod.outlook.com (2603:10a6:102:1cd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 07:54:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d%6]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:54:13 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Ying Liu <victor.liu@nxp.com>
Subject: RE: [PATCH v6 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Thread-Topic: [PATCH v6 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Thread-Index: AQHYh/SM2ocodp3cBEeFjHQpdVpqh61i5irA
Date: Mon, 27 Jun 2022 07:54:13 +0000
Message-ID: <DU0PR04MB94179A0FC42036C712ABF3FB88B99@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220624180201.150417-1-marex@denx.de>
 <20220624180201.150417-2-marex@denx.de>
In-Reply-To: <20220624180201.150417-2-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5165ff0a-febd-4159-7123-08da581239fd
x-ms-traffictypediagnostic: PAXPR04MB8352:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tsOd8Xa2xZFW/wbKgdo+cBBYEGFOGgndK99p/1UFfmzPw74Fm6tDJR7tEAJctyybpedmt/5JIT2jquKxFB75aid/3Es5c3KXVYUUICBeuzfuKal8ZQJy3yzkT8AX3elt4LlgFHkoqgP60MRTBEp2AKXCQyhio9NKdnVETY8OtjHov7Us/NuWcDnNNj8AA5+1N3P/gu+Tn30VNOjVl8xR1ZsCk8vGMpMgnGFlJASeO2BzpsZ77De1bfHxVJmUklF9hxHy/oQmAoXBvUlTnHHiV/AWTeIoR7iLVxlysqYXEa8G9zMyTUoV7MQFe28t7TDofWek/H//BhD392eXP0v9miaImYkDLtZwSocOvlYNfNK6bSm+BEjceG2+5DrdHAAC9VyPUOkHviJ3xPUvVt+fO8S9RRh2TwmyDblwmRDZtl+Zzn6kkLAmYdZ7oSF10p7vK5mRhtzmicxUI46gM791fZbLBui2HdGZORrsiapX7FS+bC7vidXS1S0l5Jr6+F0zEtuTFKKJPRNh/HYqT0FZEX9LdVHeoBHXkRQXdeh7fQAAIVy6+wya6YJ0Yuw+G8AQFEkzfgC01M+Z5GMyliZuCOrbOTNFJSvFxdCXCJ9M3+wUNClKyrwc2nJddLtyi19R6kAkDty9QAB30Iv51Znhhhlhfsi5mp76uXhVIdJka0gZKn+Xbpu/KlpRcMD2MtR3TdbbwDMfEyeQCrSUKoCDTVC/0dXT7p5y4YI7sL6cnTsRk6AIgBH0wiQ3YqZSu3J0AFrKEyHno1r0znT7W/u2IdzPfIpA+0EIxcRAv0Wko+w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(71200400001)(6506007)(38100700002)(2906002)(44832011)(86362001)(41300700001)(52536014)(7696005)(8936002)(186003)(5660300002)(478600001)(30864003)(83380400001)(55016003)(122000001)(9686003)(26005)(33656002)(76116006)(66476007)(54906003)(6636002)(64756008)(8676002)(66446008)(110136005)(4326008)(66556008)(38070700005)(66946007)(316002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rIUHU29rSCc3KUAMXjS0snF8dlB9OSfuiKvkuucDKJio9wKCvOZm5I8efDWR?=
 =?us-ascii?Q?/3rwqtzAsW1zAdGSdHAoWrWA/Iuq1UzdlEInDqlNb/aoJRSl1rlDSjW3oQIR?=
 =?us-ascii?Q?CyrGG91zPR4eW8qL5c8pOdcHvsWkjYybl/gIl1wzdi2WpwTZJ25X3g6tQADm?=
 =?us-ascii?Q?OBp7SLzZ0Mtw0MHhxROtviSDtxPGLWZ+iSVFMaS/A6ooSPKRmtxYOTW7LwIr?=
 =?us-ascii?Q?odD5qWXo96q8vAZIW7BDmRAlYQvgVCL2LPdR0uTbnFkEDH3L4qMH73QkZ1xd?=
 =?us-ascii?Q?w8Oy36O+OOxtOCuL3LUVqTs/NYK9HHJ5nsfL3uv4KOzFdJDa0MM/xUb3AG1S?=
 =?us-ascii?Q?mL6kQR01xN+vwKmda4HrbEwEMTFvcSXipHpXKaki3dU8kWNU9aprlGJazrRf?=
 =?us-ascii?Q?WAOV35GigOoXJo0LokbPWGMYvkvQ0vgcwHn0nKeD/kykNdPnepiIKOeUAI/p?=
 =?us-ascii?Q?L0rLOsqicq37gTBzaNRWmrysPKlbEZPXmPCWhkAnOxUWWcsJF2XtdwSV2UO1?=
 =?us-ascii?Q?0MLvndOaVK2lchekl8OsC+96o/aUpYnTvI6AlqgDXfzg/M6k72686EMBi0Xb?=
 =?us-ascii?Q?PDwltS19+NZ00kpCBnC/3pZnmRaDibK3vgZrY8DVDz/hyk8QR6MQf4//DLYy?=
 =?us-ascii?Q?zuJnM3+Hv55cW4zUJglj6HnZ1Lib3OOkrOQAPQ0E2Suegb2V4ifLNfGzcYeT?=
 =?us-ascii?Q?n9y83k3H8V+6F9eqlu0tDGcfJP0HiSoNulkju2dOUQjZxk9ZVWwrnfaBsmC2?=
 =?us-ascii?Q?r759kwjR5HUBLAvdv7tsGL1bNRs9JaCvcokYqISAFVX0IzrTw6Ymi9VsLec4?=
 =?us-ascii?Q?7NHWCvE4/0Z55/3eGodkfiCIL6WUY1/apjPmjhmtzxyLvRzKlNIvvGL+1r5/?=
 =?us-ascii?Q?Img7XCd/KdZvemH2tLwq77IaA/uJuJp0fD6Wo9nlluudq4kX2cFnqnJLlsiw?=
 =?us-ascii?Q?Tl2lDFhNLVLHXBxloFtgBR9U9p2K0maT8VB2yHylEJgzs16+EgS2mvX219BG?=
 =?us-ascii?Q?98XHNkdqE0ZE6Mz0XdfOa5G0OE1s1r+546ce95ap1WR4W/IwGYYVUFns4vGy?=
 =?us-ascii?Q?pkil7BLpJYAGRxVGLXcbVWhq3zYfZBtFn3BuCcpuvcYrnQoTdvP4O6sQjzN1?=
 =?us-ascii?Q?cREKINekeS8WdxtprIEzDGjK1Pz4lvRHch6h7ervDT9tA0yXSVSXqHEzsu8n?=
 =?us-ascii?Q?nmTufA1/v/lza50sav1SZW/zTQaGrgk2NaO5tqIVcGtq9LvCHRYY8pBO50tb?=
 =?us-ascii?Q?122kHRqQNUu0vtSeVAQw0iCyrgsM+sKtOzmJ+oVT3ByQeBYCEYabtzU47mhX?=
 =?us-ascii?Q?tr3X8ScfePm8MOnNlKC9VAxlnKcEcx9dN5wtm4JhgvWGZPEvp1mJjuTc/Hld?=
 =?us-ascii?Q?ApVUMN1Ua7rEePocWNKJpG7FjArmcP30cSUc86PPnAYHJ8Pa2zpijA/+oWZv?=
 =?us-ascii?Q?aQJtvd4whh+W3b7BNJEmbHHIa5ulJMkHowVk8ljNRRH7HKtq5+xnf+lhwda4?=
 =?us-ascii?Q?vWDOfpagi7nHDQ2vmQxZaipjvtgRSK3MiNzr3c3IKNJQr+mEGt1NwUQ0jGQz?=
 =?us-ascii?Q?eoJPLlltcGAUXI8NYkQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5165ff0a-febd-4159-7123-08da581239fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 07:54:13.1756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ooJJMVAZ8qe3xQZkXs8c3qi2EVDorYt9Z0oFEfbGDdefmeH9ryKi7CEhlVdSO0w8qqDuklbZQJOx3kJXwnS1KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8352
X-Mailman-Approved-At: Mon, 27 Jun 2022 08:54:20 +0000
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Ying

> Subject: [PATCH v6 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
>=20
> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
> completely different from the LCDIFv3 found in i.MX23 in that it has a
> completely scrambled register layout compared to all previous LCDIF varia=
nts.
> The new LCDIFv3 also supports 36bit address space.
>=20
> Add a separate driver which is really a fork of MXSFB driver with the i.M=
X8MP
> LCDIF variant handling filled in.
>=20
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: - Drop the pitch check from lcdif_fb_create()
>     - Drop connector caching
>     - Wait for shadow load bit to be cleared in IRQ handler
>     - Make all clock mandatory and grab them all by name
>     - Wait for EN to be cleared in lcdif_disable_controller
>     - Rename to imx-lcdif
>     - Move shadow load to atomic_flush
> V3: - Invert DE polarity to match MX8MPRM datasheet
>     - Enable CSC in RGB to YUV mode for MEDIA_BUS_FMT_UYVY8_1X16
> V4: - Drop lcdif_overlay_plane_formats, it is unused
> V5: - Add TB from Martyn
>     - Drop lcdif_fb_create in favor of drm_gem_fb_create
>     - Pull in mxsfb/ directory from drm top level Makefile
>     - Drop busy polling of CTRLDESCL0_5_SHADOW_LOAD_EN in irq handler
>     - Use devm_request_irq
>     - Drop useless dev.of_node validity check in probe
>     - Drop lcdif_*_axi_clk() prototypes
>     - Invert HS/VS polarity
>     - Drop polling from lcdif_reset_block()
>     - Add TB from Alexander
> V6: - Use SET_RUNTIME_PM_OPS() to set RPM ops and mark ops
> __maybe_unused
>     - Include drm/drm_framebuffer.h now required in linux-next
> ---
>  drivers/gpu/drm/Makefile           |   2 +-
>  drivers/gpu/drm/mxsfb/Kconfig      |  16 +
>  drivers/gpu/drm/mxsfb/Makefile     |   2 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c  | 341 ++++++++++++++++++++
> drivers/gpu/drm/mxsfb/lcdif_drv.h  |  44 +++
> drivers/gpu/drm/mxsfb/lcdif_kms.c  | 483
> +++++++++++++++++++++++++++++  drivers/gpu/drm/mxsfb/lcdif_regs.h |
> 257 +++++++++++++++
>  7 files changed, 1144 insertions(+), 1 deletion(-)  create mode 100644
> drivers/gpu/drm/mxsfb/lcdif_drv.c  create mode 100644
> drivers/gpu/drm/mxsfb/lcdif_drv.h  create mode 100644
> drivers/gpu/drm/mxsfb/lcdif_kms.c  create mode 100644
> drivers/gpu/drm/mxsfb/lcdif_regs.h
>=20
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile index
> 13ef240b3d2b2..75b5ac7c2663c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -130,7 +130,7 @@ obj-y			+=3D bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) +=3D fsl-dcu/
>  obj-$(CONFIG_DRM_ETNAVIV) +=3D etnaviv/
>  obj-y			+=3D hisilicon/
> -obj-$(CONFIG_DRM_MXSFB)	+=3D mxsfb/
> +obj-y			+=3D mxsfb/
>  obj-y			+=3D tiny/
>  obj-$(CONFIG_DRM_PL111) +=3D pl111/
>  obj-$(CONFIG_DRM_TVE200) +=3D tve200/
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfi=
g
> index 987170e16ebd6..873551b4552f5 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -19,3 +19,19 @@ config DRM_MXSFB
>  	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
>=20
>  	  If M is selected the module will be called mxsfb.
> +
> +config DRM_IMX_LCDIF
> +	tristate "i.MX LCDIFv3 LCD controller"
> +	depends on DRM && OF
> +	depends on COMMON_CLK
> +	select DRM_MXS
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_PANEL
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  Choose this option if you have an LCDIFv3 LCD controller.
> +	  Those devices are found in various i.MX SoC (i.MX8MP,
> +	  i.MXRT).
> +
> +	  If M is selected the module will be called imx-lcdif.
> diff --git a/drivers/gpu/drm/mxsfb/Makefile
> b/drivers/gpu/drm/mxsfb/Makefile index 26d153896d720..3fa44059b9d85
> 100644
> --- a/drivers/gpu/drm/mxsfb/Makefile
> +++ b/drivers/gpu/drm/mxsfb/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only  mxsfb-y :=3D mxsfb_drv.o
> mxsfb_kms.o
>  obj-$(CONFIG_DRM_MXSFB)	+=3D mxsfb.o
> +imx-lcdif-y :=3D lcdif_drv.o lcdif_kms.o
> +obj-$(CONFIG_DRM_IMX_LCDIF) +=3D imx-lcdif.o
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> new file mode 100644
> index 0000000000000..76e14ffe84f69
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * This code is based on drivers/gpu/drm/mxsfb/mxsfb*  */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mode_config.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lcdif_drv.h"
> +#include "lcdif_regs.h"
> +
> +static const struct drm_mode_config_funcs lcdif_mode_config_funcs =3D {
> +	.fb_create		=3D drm_gem_fb_create,
> +	.atomic_check		=3D drm_atomic_helper_check,
> +	.atomic_commit		=3D drm_atomic_helper_commit,
> +};
> +
> +static const struct drm_mode_config_helper_funcs
> lcdif_mode_config_helpers =3D {
> +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif) {
> +	struct drm_device *drm =3D lcdif->drm;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret =3D drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> +					  &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge =3D devm_drm_panel_bridge_add_typed(drm->dev, panel,
> +							 DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +
> +	if (!bridge)
> +		return -ENODEV;
> +
> +	ret =3D drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
> +
> +	lcdif->bridge =3D bridge;
> +
> +	return 0;
> +}
> +
> +static irqreturn_t lcdif_irq_handler(int irq, void *data) {
> +	struct drm_device *drm =3D data;
> +	struct lcdif_drm_private *lcdif =3D drm->dev_private;
> +	u32 reg;
> +
> +	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	if (!(reg & CTRLDESCL0_5_SHADOW_LOAD_EN)) {
> +		reg =3D readl(lcdif->base + LCDC_V8_INT_STATUS_D0);
> +
> +		if (reg & INT_STATUS_D0_VS_BLANK)
> +			drm_crtc_handle_vblank(&lcdif->crtc);
> +	}
> +
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base +
> LCDC_V8_INT_STATUS_D0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int lcdif_load(struct drm_device *drm) {
> +	struct platform_device *pdev =3D to_platform_device(drm->dev);
> +	struct lcdif_drm_private *lcdif;
> +	struct resource *res;
> +	int ret;
> +
> +	lcdif =3D devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
> +	if (!lcdif)
> +		return -ENOMEM;
> +
> +	lcdif->drm =3D drm;
> +	drm->dev_private =3D lcdif;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	lcdif->base =3D devm_ioremap_resource(drm->dev, res);
> +	if (IS_ERR(lcdif->base))
> +		return PTR_ERR(lcdif->base);
> +
> +	lcdif->clk =3D devm_clk_get(drm->dev, "pix");
> +	if (IS_ERR(lcdif->clk))
> +		return PTR_ERR(lcdif->clk);
> +
> +	lcdif->clk_axi =3D devm_clk_get(drm->dev, "axi");
> +	if (IS_ERR(lcdif->clk_axi))
> +		return PTR_ERR(lcdif->clk_axi);
> +
> +	lcdif->clk_disp_axi =3D devm_clk_get(drm->dev, "disp_axi");
> +	if (IS_ERR(lcdif->clk_disp_axi))
> +		return PTR_ERR(lcdif->clk_disp_axi);
> +
> +	platform_set_drvdata(pdev, drm);
> +
> +	ret =3D dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(36));
> +	if (ret)
> +		return ret;
> +
> +	/* Modeset init */
> +	drm_mode_config_init(drm);
> +
> +	ret =3D lcdif_kms_init(lcdif);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialize KMS pipeline\n");
> +		return ret;
> +	}
> +
> +	ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialise vblank\n");
> +		return ret;
> +	}
> +
> +	/* Start with vertical blanking interrupt reporting disabled. */
> +	drm_crtc_vblank_off(&lcdif->crtc);
> +
> +	ret =3D lcdif_attach_bridge(lcdif);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
> +
> +	drm->mode_config.min_width	=3D LCDIF_MIN_XRES;
> +	drm->mode_config.min_height	=3D LCDIF_MIN_YRES;
> +	drm->mode_config.max_width	=3D LCDIF_MAX_XRES;
> +	drm->mode_config.max_height	=3D LCDIF_MAX_YRES;
> +	drm->mode_config.funcs		=3D &lcdif_mode_config_funcs;
> +	drm->mode_config.helper_private	=3D &lcdif_mode_config_helpers;
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret =3D platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +	lcdif->irq =3D ret;
> +
> +	ret =3D devm_request_irq(drm->dev, lcdif->irq, lcdif_irq_handler, 0,
> +			       drm->driver->name, drm);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to install IRQ handler\n");
> +		return ret;
> +	}
> +
> +	drm_kms_helper_poll_init(drm);
> +
> +	drm_helper_hpd_irq_event(drm);
> +
> +	pm_runtime_enable(drm->dev);
> +
> +	return 0;
> +}
> +
> +static void lcdif_unload(struct drm_device *drm) {
> +	struct lcdif_drm_private *lcdif =3D drm->dev_private;
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	drm_crtc_vblank_off(&lcdif->crtc);
> +
> +	drm_kms_helper_poll_fini(drm);
> +	drm_mode_config_cleanup(drm);
> +
> +	pm_runtime_put_sync(drm->dev);
> +	pm_runtime_disable(drm->dev);
> +
> +	free_irq(lcdif->irq, drm->dev);
> +
> +	drm->dev_private =3D NULL;
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(fops);
> +
> +static const struct drm_driver lcdif_driver =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET |
> DRIVER_ATOMIC,
> +	DRM_GEM_CMA_DRIVER_OPS,
> +	.fops	=3D &fops,
> +	.name	=3D "imx-lcdif",
> +	.desc	=3D "i.MX LCDIF Controller DRM",
> +	.date	=3D "20220417",
> +	.major	=3D 1,
> +	.minor	=3D 0,
> +};
> +
> +static const struct of_device_id lcdif_dt_ids[] =3D {
> +	{ .compatible =3D "fsl,imx8mp-lcdif" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
> +
> +static int lcdif_probe(struct platform_device *pdev) {
> +	struct drm_device *drm;
> +	int ret;
> +
> +	drm =3D drm_dev_alloc(&lcdif_driver, &pdev->dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	ret =3D lcdif_load(drm);
> +	if (ret)
> +		goto err_free;
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret)
> +		goto err_unload;
> +
> +	drm_fbdev_generic_setup(drm, 32);
> +
> +	return 0;
> +
> +err_unload:
> +	lcdif_unload(drm);
> +err_free:
> +	drm_dev_put(drm);
> +
> +	return ret;
> +}
> +
> +static int lcdif_remove(struct platform_device *pdev) {
> +	struct drm_device *drm =3D platform_get_drvdata(pdev);
> +
> +	drm_dev_unregister(drm);
> +	drm_atomic_helper_shutdown(drm);
> +	lcdif_unload(drm);
> +	drm_dev_put(drm);
> +
> +	return 0;
> +}
> +
> +static void lcdif_shutdown(struct platform_device *pdev) {
> +	struct drm_device *drm =3D platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static int __maybe_unused lcdif_rpm_suspend(struct device *dev) {
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct lcdif_drm_private *lcdif =3D drm->dev_private;
> +
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_disable_unprepare(lcdif->clk);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_disable_unprepare(lcdif->clk_disp_axi);
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_disable_unprepare(lcdif->clk_axi);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused lcdif_rpm_resume(struct device *dev) {
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct lcdif_drm_private *lcdif =3D drm->dev_private;
> +
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_prepare_enable(lcdif->clk_axi);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_prepare_enable(lcdif->clk_disp_axi);
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_prepare_enable(lcdif->clk);
> +
> +	return 0;
> +}
> +
> +static int lcdif_suspend(struct device *dev) {
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D drm_mode_config_helper_suspend(drm);
> +	if (ret)
> +		return ret;
> +
> +	return lcdif_rpm_suspend(dev);
> +}
> +
> +static int lcdif_resume(struct device *dev) {
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +
> +	lcdif_rpm_resume(dev);
> +
> +	return drm_mode_config_helper_resume(drm);
> +}
> +
> +static const struct dev_pm_ops lcdif_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(lcdif_suspend, lcdif_resume)
> +	SET_RUNTIME_PM_OPS(lcdif_rpm_suspend, lcdif_rpm_resume, NULL) };
> +
> +static struct platform_driver lcdif_platform_driver =3D {
> +	.probe		=3D lcdif_probe,
> +	.remove		=3D lcdif_remove,
> +	.shutdown	=3D lcdif_shutdown,
> +	.driver	=3D {
> +		.name		=3D "imx-lcdif",
> +		.of_match_table	=3D lcdif_dt_ids,
> +		.pm		=3D &lcdif_pm_ops,
> +	},
> +};
> +
> +drm_module_platform_driver(lcdif_platform_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("Freescale LCDIF DRM/KMS driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> new file mode 100644
> index 0000000000000..cb916341e8454
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * i.MX8MP/i.MXRT LCDIFv3 LCD controller driver.
> + */
> +
> +#ifndef __LCDIF_DRV_H__
> +#define __LCDIF_DRV_H__
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
> +
> +struct clk;
> +
> +struct lcdif_drm_private {
> +	void __iomem			*base;	/* registers */
> +	struct clk			*clk;
> +	struct clk			*clk_axi;
> +	struct clk			*clk_disp_axi;
> +
> +	unsigned int			irq;
> +
> +	struct drm_device		*drm;
> +	struct {
> +		struct drm_plane	primary;
> +		/* i.MXRT does support overlay planes, add them here. */
> +	} planes;
> +	struct drm_crtc			crtc;
> +	struct drm_encoder		encoder;
> +	struct drm_bridge		*bridge;
> +};
> +
> +static inline struct lcdif_drm_private * to_lcdif_drm_private(struct
> +drm_device *drm) {
> +	return drm->dev_private;
> +}
> +
> +int lcdif_kms_init(struct lcdif_drm_private *lcdif);
> +
> +#endif /* __LCDIF_DRV_H__ */
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> new file mode 100644
> index 0000000000000..76a0d7821d942
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -0,0 +1,483 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * This code is based on drivers/gpu/drm/mxsfb/mxsfb*  */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lcdif_drv.h"
> +#include "lcdif_regs.h"
> +
> +/* 1 second delay should be plenty of time for block reset */
> +#define RESET_TIMEOUT		1000000
> +
> +/*
> +-----------------------------------------------------------------------
> +------
> + * CRTC
> + */
> +static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
> +			      const u32 bus_format)
> +{
> +	struct drm_device *drm =3D lcdif->drm;
> +	const u32 format =3D lcdif->crtc.primary->state->fb->format->format;
> +
> +	writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		writel(DISP_PARA_LINE_PATTERN_RGB565,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		writel(DISP_PARA_LINE_PATTERN_RGB888,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +
> +		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
> +		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
> +		       lcdif->base + LCDC_V8_CSC0_COEF0);
> +		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
> +		       lcdif->base + LCDC_V8_CSC0_COEF1);
> +		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
> +		       lcdif->base + LCDC_V8_CSC0_COEF2);
> +		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
> +		       lcdif->base + LCDC_V8_CSC0_COEF3);
> +		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
> +		       lcdif->base + LCDC_V8_CSC0_COEF4);
> +		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> +		       lcdif->base + LCDC_V8_CSC0_COEF5);
> +
> +		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
> +		       lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown media bus format 0x%x\n",
> bus_format);
> +		break;
> +	}
> +
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +		writel(CTRLDESCL0_5_BPP_16_RGB565,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		writel(CTRLDESCL0_5_BPP_24_RGB888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB4444:
> +		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
> +		break;
> +	}
> +}
> +
> +static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32
> +bus_flags) {
> +	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> +	u32 ctrl =3D 0;
> +
> +	if (m->flags & DRM_MODE_FLAG_NHSYNC)
> +		ctrl |=3D CTRL_INV_HS;
> +	if (m->flags & DRM_MODE_FLAG_NVSYNC)
> +		ctrl |=3D CTRL_INV_VS;
> +	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> +		ctrl |=3D CTRL_INV_DE;
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		ctrl |=3D CTRL_INV_PXCK;
> +
> +	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> +
> +	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
> +	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_DISP_SIZE);
> +
> +	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
> +	       HSYN_PARA_FP_H(m->hsync_start - m->hdisplay),
> +	       lcdif->base + LCDC_V8_HSYN_PARA);
> +
> +	writel(VSYN_PARA_BP_V(m->vtotal - m->vsync_end) |
> +	       VSYN_PARA_FP_V(m->vsync_start - m->vdisplay),
> +	       lcdif->base + LCDC_V8_VSYN_PARA);
> +
> +	writel(VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
> +	       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
> +	       lcdif->base + LCDC_V8_VSYN_HSYN_WIDTH);
> +
> +	writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
> +	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
> +
> +	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_3); }
> +
> +static void lcdif_enable_controller(struct lcdif_drm_private *lcdif) {
> +	u32 reg;
> +
> +	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg |=3D DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> +
> +	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |=3D CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5); }
> +
> +static void lcdif_disable_controller(struct lcdif_drm_private *lcdif) {
> +	u32 reg;
> +	int ret;
> +
> +	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg &=3D ~CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	ret =3D readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
> +				 reg, !(reg & CTRLDESCL0_5_EN),
> +				 0, 36000);	/* Wait ~2 frame times max */
> +	if (ret)
> +		drm_err(lcdif->drm, "Failed to disable controller!\n");
> +
> +	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg &=3D ~DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA); }
> +
> +static void lcdif_reset_block(struct lcdif_drm_private *lcdif) {
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	readl(lcdif->base + LCDC_V8_CTRL);
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +	readl(lcdif->base + LCDC_V8_CTRL);
> +}
> +
> +static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
> +				     struct drm_bridge_state *bridge_state,
> +				     const u32 bus_format)
> +{
> +	struct drm_device *drm =3D lcdif->crtc.dev;
> +	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> +	u32 bus_flags =3D 0;
> +
> +	if (lcdif->bridge && lcdif->bridge->timings)
> +		bus_flags =3D lcdif->bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags =3D bridge_state->input_bus_cfg.flags;
> +
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz
> (actual: %dkHz)\n",
> +			     m->crtc_clock,
> +			     (int)(clk_get_rate(lcdif->clk) / 1000));
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Connector bus_flags: 0x%08X\n",
> +			     bus_flags);
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n",
> m->flags);
> +
> +	/* Mandatory eLCDIF reset as per the Reference Manual */
> +	lcdif_reset_block(lcdif);
> +
> +	lcdif_set_formats(lcdif, bus_format);
> +
> +	lcdif_set_mode(lcdif, bus_flags);
> +}
> +
> +static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +	bool has_primary =3D crtc_state->plane_mask &
> +			   drm_plane_mask(crtc->primary);
> +
> +	/* The primary plane has to be enabled when the CRTC is active. */
> +	if (crtc_state->active && !has_primary)
> +		return -EINVAL;
> +
> +	return drm_atomic_add_affected_planes(state, crtc); }
> +
> +static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *state) {
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> +	struct drm_pending_vblank_event *event;
> +	u32 reg;
> +
> +	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |=3D CTRLDESCL0_5_SHADOW_LOAD_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	event =3D crtc->state->event;
> +	crtc->state->event =3D NULL;
> +
> +	if (!event)
> +		return;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> +		drm_crtc_arm_vblank_event(crtc, event);
> +	else
> +		drm_crtc_send_vblank_event(crtc, event);
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state) {
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> +	struct drm_plane_state *new_pstate =3D
> drm_atomic_get_new_plane_state(state,
> +									    crtc->primary);
> +	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> +	struct drm_bridge_state *bridge_state =3D NULL;
> +	struct drm_device *drm =3D lcdif->drm;
> +	u32 bus_format =3D 0;
> +	dma_addr_t paddr;
> +
> +	/* If there is a bridge attached to the LCDIF, use its bus format */
> +	if (lcdif->bridge) {
> +		bridge_state =3D
> +			drm_atomic_get_new_bridge_state(state,
> +							lcdif->bridge);
> +		if (!bridge_state)
> +			bus_format =3D MEDIA_BUS_FMT_FIXED;
> +		else
> +			bus_format =3D bridge_state->input_bus_cfg.format;
> +
> +		if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> +			dev_warn_once(drm->dev,
> +				      "Bridge does not provide bus format, assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n"
> +				      "Please fix bridge driver by handling
> atomic_get_input_bus_fmts.\n");
> +			bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		}
> +	}
> +
> +	/* If all else fails, default to RGB888_1X24 */
> +	if (!bus_format)
> +		bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
> +
> +	/* Write cur_buf as well to avoid an initial corrupt frame */
> +	paddr =3D drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> +	if (paddr) {
> +		writel(lower_32_bits(paddr),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> +		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> +	}
> +	lcdif_enable_controller(lcdif);
> +
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state) {
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> +	struct drm_device *drm =3D lcdif->drm;
> +	struct drm_pending_vblank_event *event;
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	lcdif_disable_controller(lcdif);
> +
> +	spin_lock_irq(&drm->event_lock);
> +	event =3D crtc->state->event;
> +	if (event) {
> +		crtc->state->event =3D NULL;
> +		drm_crtc_send_vblank_event(crtc, event);
> +	}
> +	spin_unlock_irq(&drm->event_lock);
> +
> +	pm_runtime_put_sync(drm->dev);
> +}
> +
> +static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc) {
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> +
> +	/* Clear and enable VBLANK IRQ */
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base +
> LCDC_V8_INT_STATUS_D0);
> +	writel(INT_ENABLE_D0_VS_BLANK_EN, lcdif->base +
> +LCDC_V8_INT_ENABLE_D0);
> +
> +	return 0;
> +}
> +
> +static void lcdif_crtc_disable_vblank(struct drm_crtc *crtc) {
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> +
> +	/* Disable and clear VBLANK IRQ */
> +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D0);
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base +
> LCDC_V8_INT_STATUS_D0); }
> +
> +static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs =3D {
> +	.atomic_check =3D lcdif_crtc_atomic_check,
> +	.atomic_flush =3D lcdif_crtc_atomic_flush,
> +	.atomic_enable =3D lcdif_crtc_atomic_enable,
> +	.atomic_disable =3D lcdif_crtc_atomic_disable, };
> +
> +static const struct drm_crtc_funcs lcdif_crtc_funcs =3D {
> +	.reset =3D drm_atomic_helper_crtc_reset,
> +	.destroy =3D drm_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank =3D lcdif_crtc_enable_vblank,
> +	.disable_vblank =3D lcdif_crtc_disable_vblank, };
> +
> +/*
> +-----------------------------------------------------------------------
> +------
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
> +/*
> +-----------------------------------------------------------------------
> +------
> + * Planes
> + */
> +
> +static int lcdif_plane_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state *state) {
> +	struct drm_plane_state *plane_state =3D
> drm_atomic_get_new_plane_state(state,
> +									     plane);
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(plane->dev);
> +	struct drm_crtc_state *crtc_state;
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state,
> +						   &lcdif->crtc);
> +
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   false, true);
> +}
> +
> +static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
> +					      struct drm_atomic_state *state) {
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(plane->dev);
> +	struct drm_plane_state *new_pstate =3D
> drm_atomic_get_new_plane_state(state,
> +									    plane);
> +	dma_addr_t paddr;
> +
> +	paddr =3D drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> +	if (paddr) {
> +		writel(lower_32_bits(paddr),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> +		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> +	}
> +}
> +
> +static bool lcdif_format_mod_supported(struct drm_plane *plane,
> +				       uint32_t format,
> +				       uint64_t modifier)
> +{
> +	return modifier =3D=3D DRM_FORMAT_MOD_LINEAR; }
> +
> +static const struct drm_plane_helper_funcs
> lcdif_plane_primary_helper_funcs =3D {
> +	.atomic_check =3D lcdif_plane_atomic_check,
> +	.atomic_update =3D lcdif_plane_primary_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs lcdif_plane_funcs =3D {
> +	.format_mod_supported	=3D lcdif_format_mod_supported,
> +	.update_plane		=3D drm_atomic_helper_update_plane,
> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
> +	.destroy		=3D drm_plane_cleanup,
> +	.reset			=3D drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static const u32 lcdif_primary_plane_formats[] =3D {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const u64 lcdif_modifiers[] =3D {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +/*
> +-----------------------------------------------------------------------
> +------
> + * Initialization
> + */
> +
> +int lcdif_kms_init(struct lcdif_drm_private *lcdif) {
> +	struct drm_encoder *encoder =3D &lcdif->encoder;
> +	struct drm_crtc *crtc =3D &lcdif->crtc;
> +	int ret;
> +
> +	drm_plane_helper_add(&lcdif->planes.primary,
> +			     &lcdif_plane_primary_helper_funcs);
> +	ret =3D drm_universal_plane_init(lcdif->drm, &lcdif->planes.primary, 1,
> +				       &lcdif_plane_funcs,
> +				       lcdif_primary_plane_formats,
> +				       ARRAY_SIZE(lcdif_primary_plane_formats),
> +				       lcdif_modifiers, DRM_PLANE_TYPE_PRIMARY,
> +				       NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
> +	ret =3D drm_crtc_init_with_planes(lcdif->drm, crtc,
> +					&lcdif->planes.primary, NULL,
> +					&lcdif_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
> +	return drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
> +				DRM_MODE_ENCODER_NONE, NULL);
> +}
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> new file mode 100644
> index 0000000000000..c70220651e3a5
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -0,0 +1,257 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * i.MX8MP/i.MXRT LCDIF LCD controller driver.
> + */
> +
> +#ifndef __LCDIF_REGS_H__
> +#define __LCDIF_REGS_H__
> +
> +#define REG_SET	4
> +#define REG_CLR	8
> +
> +/* V8 register set */
> +#define LCDC_V8_CTRL			0x00
> +#define LCDC_V8_DISP_PARA		0x10
> +#define LCDC_V8_DISP_SIZE		0x14
> +#define LCDC_V8_HSYN_PARA		0x18
> +#define LCDC_V8_VSYN_PARA		0x1c
> +#define LCDC_V8_VSYN_HSYN_WIDTH		0x20
> +#define LCDC_V8_INT_STATUS_D0		0x24
> +#define LCDC_V8_INT_ENABLE_D0		0x28
> +#define LCDC_V8_INT_STATUS_D1		0x30
> +#define LCDC_V8_INT_ENABLE_D1		0x34
> +#define LCDC_V8_CTRLDESCL0_1		0x200
> +#define LCDC_V8_CTRLDESCL0_3		0x208
> +#define LCDC_V8_CTRLDESCL_LOW0_4	0x20c
> +#define LCDC_V8_CTRLDESCL_HIGH0_4	0x210
> +#define LCDC_V8_CTRLDESCL0_5		0x214
> +#define LCDC_V8_CSC0_CTRL		0x21c
> +#define LCDC_V8_CSC0_COEF0		0x220
> +#define LCDC_V8_CSC0_COEF1		0x224
> +#define LCDC_V8_CSC0_COEF2		0x228
> +#define LCDC_V8_CSC0_COEF3		0x22c
> +#define LCDC_V8_CSC0_COEF4		0x230
> +#define LCDC_V8_CSC0_COEF5		0x234
> +#define LCDC_V8_PANIC0_THRES		0x238
> +
> +#define CTRL_SFTRST			BIT(31)
> +#define CTRL_CLKGATE			BIT(30)
> +#define CTRL_BYPASS_COUNT		BIT(19)
> +#define CTRL_VSYNC_MODE			BIT(18)
> +#define CTRL_DOTCLK_MODE		BIT(17)
> +#define CTRL_DATA_SELECT		BIT(16)
> +#define CTRL_BUS_WIDTH_16		(0 << 10)
> +#define CTRL_BUS_WIDTH_8		(1 << 10)
> +#define CTRL_BUS_WIDTH_18		(2 << 10)
> +#define CTRL_BUS_WIDTH_24		(3 << 10)
> +#define CTRL_BUS_WIDTH_MASK		(0x3 << 10)
> +#define CTRL_WORD_LENGTH_16		(0 << 8)
> +#define CTRL_WORD_LENGTH_8		(1 << 8)
> +#define CTRL_WORD_LENGTH_18		(2 << 8)
> +#define CTRL_WORD_LENGTH_24		(3 << 8)
> +#define CTRL_MASTER			BIT(5)
> +#define CTRL_DF16			BIT(3)
> +#define CTRL_DF18			BIT(2)
> +#define CTRL_DF24			BIT(1)
> +#define CTRL_RUN			BIT(0)
> +
> +#define CTRL1_RECOVER_ON_UNDERFLOW	BIT(24)
> +#define CTRL1_FIFO_CLEAR		BIT(21)
> +#define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
> +#define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)
> +#define CTRL1_CUR_FRAME_DONE_IRQ_EN	BIT(13)
> +#define CTRL1_CUR_FRAME_DONE_IRQ	BIT(9)
> +
> +#define CTRL2_SET_OUTSTANDING_REQS_1	0
> +#define CTRL2_SET_OUTSTANDING_REQS_2	(0x1 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_4	(0x2 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_8	(0x3 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_16	(0x4 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_MASK	(0x7 << 21)
> +
> +#define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
> +#define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
> +#define TRANSFER_COUNT_SET_HCOUNT(x)	((x) & 0xffff)
> +#define TRANSFER_COUNT_GET_HCOUNT(x)	((x) & 0xffff)
> +
> +#define VDCTRL0_ENABLE_PRESENT		BIT(28)
> +#define VDCTRL0_VSYNC_ACT_HIGH		BIT(27)
> +#define VDCTRL0_HSYNC_ACT_HIGH		BIT(26)
> +#define VDCTRL0_DOTCLK_ACT_FALLING	BIT(25)
> +#define VDCTRL0_ENABLE_ACT_HIGH		BIT(24)
> +#define VDCTRL0_VSYNC_PERIOD_UNIT	BIT(21)
> +#define VDCTRL0_VSYNC_PULSE_WIDTH_UNIT	BIT(20)
> +#define VDCTRL0_HALF_LINE		BIT(19)
> +#define VDCTRL0_HALF_LINE_MODE		BIT(18)
> +#define VDCTRL0_SET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff) #define
> +VDCTRL0_GET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
> +
> +#define VDCTRL2_SET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +#define VDCTRL2_GET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +
> +#define VDCTRL3_MUX_SYNC_SIGNALS	BIT(29)
> +#define VDCTRL3_VSYNC_ONLY		BIT(28)
> +#define SET_HOR_WAIT_CNT(x)		(((x) & 0xfff) << 16)
> +#define GET_HOR_WAIT_CNT(x)		(((x) >> 16) & 0xfff)
> +#define SET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +#define GET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +
> +#define VDCTRL4_SET_DOTCLK_DLY(x)	(((x) & 0x7) << 29) /* v4 only */
> +#define VDCTRL4_GET_DOTCLK_DLY(x)	(((x) >> 29) & 0x7) /* v4 only */
> +#define VDCTRL4_SYNC_SIGNALS_ON		BIT(18)
> +#define SET_DOTCLK_H_VALID_DATA_CNT(x)	((x) & 0x3ffff)
> +
> +#define DEBUG0_HSYNC			BIT(26)
> +#define DEBUG0_VSYNC			BIT(25)
> +
> +#define AS_CTRL_PS_DISABLE		BIT(23)
> +#define AS_CTRL_ALPHA_INVERT		BIT(20)
> +#define AS_CTRL_ALPHA(a)		(((a) & 0xff) << 8)
> +#define AS_CTRL_FORMAT_RGB565		(0xe << 4)
> +#define AS_CTRL_FORMAT_RGB444		(0xd << 4)
> +#define AS_CTRL_FORMAT_RGB555		(0xc << 4)
> +#define AS_CTRL_FORMAT_ARGB4444		(0x9 << 4)
> +#define AS_CTRL_FORMAT_ARGB1555		(0x8 << 4)
> +#define AS_CTRL_FORMAT_RGB888		(0x4 << 4)
> +#define AS_CTRL_FORMAT_ARGB8888		(0x0 << 4)
> +#define AS_CTRL_ENABLE_COLORKEY		BIT(3)
> +#define AS_CTRL_ALPHA_CTRL_ROP		(3 << 1)
> +#define AS_CTRL_ALPHA_CTRL_MULTIPLY	(2 << 1)
> +#define AS_CTRL_ALPHA_CTRL_OVERRIDE	(1 << 1)
> +#define AS_CTRL_ALPHA_CTRL_EMBEDDED	(0 << 1)
> +#define AS_CTRL_AS_ENABLE		BIT(0)
> +
> +/* V8 register set */
> +#define CTRL_SW_RESET			BIT(31)
> +#define CTRL_FETCH_START_OPTION_FPV	0
> +#define CTRL_FETCH_START_OPTION_PWV	BIT(8)
> +#define CTRL_FETCH_START_OPTION_BPV	BIT(9)
> +#define CTRL_FETCH_START_OPTION_RESV	GENMASK(9, 8)
> +#define CTRL_FETCH_START_OPTION_MASK	GENMASK(9, 8)
> +#define CTRL_NEG				BIT(4)
> +#define CTRL_INV_PXCK			BIT(3)
> +#define CTRL_INV_DE			BIT(2)
> +#define CTRL_INV_VS			BIT(1)
> +#define CTRL_INV_HS			BIT(0)
> +
> +#define DISP_PARA_DISP_ON		BIT(31)
> +#define DISP_PARA_SWAP_EN		BIT(30)
> +#define DISP_PARA_LINE_PATTERN_UYVY_H	(GENMASK(29, 28) |
> BIT(26))
> +#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
> +#define DISP_PARA_LINE_PATTERN_RGB888	0
> +#define DISP_PARA_LINE_PATTERN_MASK	GENMASK(29, 26)
> +#define DISP_PARA_DISP_MODE_MASK	GENMASK(25, 24)
> +#define DISP_PARA_BGND_R_MASK		GENMASK(23, 16)
> +#define DISP_PARA_BGND_G_MASK		GENMASK(15, 8)
> +#define DISP_PARA_BGND_B_MASK		GENMASK(7, 0)
> +
> +#define DISP_SIZE_DELTA_Y(n)		(((n) & 0xffff) << 16)
> +#define DISP_SIZE_DELTA_Y_MASK		GENMASK(31, 16)
> +#define DISP_SIZE_DELTA_X(n)		((n) & 0xffff)
> +#define DISP_SIZE_DELTA_X_MASK		GENMASK(15, 0)
> +
> +#define HSYN_PARA_BP_H(n)		(((n) & 0xffff) << 16)
> +#define HSYN_PARA_BP_H_MASK		GENMASK(31, 16)
> +#define HSYN_PARA_FP_H(n)		((n) & 0xffff)
> +#define HSYN_PARA_FP_H_MASK		GENMASK(15, 0)
> +
> +#define VSYN_PARA_BP_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_PARA_BP_V_MASK		GENMASK(31, 16)
> +#define VSYN_PARA_FP_V(n)		((n) & 0xffff)
> +#define VSYN_PARA_FP_V_MASK		GENMASK(15, 0)
> +
> +#define VSYN_HSYN_WIDTH_PW_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_HSYN_WIDTH_PW_V_MASK	GENMASK(31, 16)
> +#define VSYN_HSYN_WIDTH_PW_H(n)		((n) & 0xffff)
> +#define VSYN_HSYN_WIDTH_PW_H_MASK	GENMASK(15, 0)
> +
> +#define INT_STATUS_D0_FIFO_EMPTY	BIT(24)
> +#define INT_STATUS_D0_DMA_DONE		BIT(16)
> +#define INT_STATUS_D0_DMA_ERR		BIT(8)
> +#define INT_STATUS_D0_VS_BLANK		BIT(2)
> +#define INT_STATUS_D0_UNDERRUN		BIT(1)
> +#define INT_STATUS_D0_VSYNC		BIT(0)
> +
> +#define INT_ENABLE_D0_FIFO_EMPTY_EN	BIT(24)
> +#define INT_ENABLE_D0_DMA_DONE_EN	BIT(16)
> +#define INT_ENABLE_D0_DMA_ERR_EN	BIT(8)
> +#define INT_ENABLE_D0_VS_BLANK_EN	BIT(2)
> +#define INT_ENABLE_D0_UNDERRUN_EN	BIT(1)
> +#define INT_ENABLE_D0_VSYNC_EN		BIT(0)
> +
> +#define INT_STATUS_D1_PLANE_PANIC	BIT(0)
> +
> +#define INT_ENABLE_D1_PLANE_PANIC_EN	BIT(0)
> +
> +#define CTRLDESCL0_1_HEIGHT(n)		(((n) & 0xffff) << 16)
> +#define CTRLDESCL0_1_HEIGHT_MASK		GENMASK(31, 16)
> +#define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL0_3_PITCH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_3_PITCH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH(n)	((n) & 0xf)
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH_MASK	GENMASK(3, 0)
> +
> +#define CTRLDESCL0_5_EN			BIT(31)
> +#define CTRLDESCL0_5_SHADOW_LOAD_EN	BIT(30)
> +#define CTRLDESCL0_5_BPP_16_RGB565	BIT(26)
> +#define CTRLDESCL0_5_BPP_16_ARGB1555	(BIT(26) | BIT(24))
> +#define CTRLDESCL0_5_BPP_16_ARGB4444	(BIT(26) | BIT(25))
> +#define CTRLDESCL0_5_BPP_YCbCr422	(BIT(26) | BIT(25) | BIT(24))
> +#define CTRLDESCL0_5_BPP_24_RGB888	BIT(27)
> +#define CTRLDESCL0_5_BPP_32_ARGB8888	(BIT(27) | BIT(24))
> +#define CTRLDESCL0_5_BPP_32_ABGR8888	(BIT(27) | BIT(25))
> +#define CTRLDESCL0_5_BPP_MASK		GENMASK(27, 24)
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U	0
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V	BIT(14)
> +#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1	BIT(15)
> +#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(BIT(15) | BIT(14))
> +#define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
> +
> +#define CSC0_CTRL_CSC_MODE_RGB2YCbCr	GENMASK(2, 1)
> +#define CSC0_CTRL_CSC_MODE_MASK		GENMASK(2, 1)
> +#define CSC0_CTRL_BYPASS		BIT(0)
> +
> +#define CSC0_COEF0_A2(n)		(((n) << 16) & CSC0_COEF0_A2_MASK)
> +#define CSC0_COEF0_A2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF0_A1(n)		((n) & CSC0_COEF0_A1_MASK)
> +#define CSC0_COEF0_A1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF1_B1(n)		(((n) << 16) & CSC0_COEF1_B1_MASK)
> +#define CSC0_COEF1_B1_MASK		GENMASK(26, 16)
> +#define CSC0_COEF1_A3(n)		((n) & CSC0_COEF1_A3_MASK)
> +#define CSC0_COEF1_A3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF2_B3(n)		(((n) << 16) & CSC0_COEF2_B3_MASK)
> +#define CSC0_COEF2_B3_MASK		GENMASK(26, 16)
> +#define CSC0_COEF2_B2(n)		((n) & CSC0_COEF2_B2_MASK)
> +#define CSC0_COEF2_B2_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF3_C2(n)		(((n) << 16) & CSC0_COEF3_C2_MASK)
> +#define CSC0_COEF3_C2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF3_C1(n)		((n) & CSC0_COEF3_C1_MASK)
> +#define CSC0_COEF3_C1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF4_D1(n)		(((n) << 16) & CSC0_COEF4_D1_MASK)
> +#define CSC0_COEF4_D1_MASK		GENMASK(24, 16)
> +#define CSC0_COEF4_C3(n)		((n) & CSC0_COEF4_C3_MASK)
> +#define CSC0_COEF4_C3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF5_D3(n)		(((n) << 16) & CSC0_COEF5_D3_MASK)
> +#define CSC0_COEF5_D3_MASK		GENMASK(24, 16)
> +#define CSC0_COEF5_D2(n)		((n) & CSC0_COEF5_D2_MASK)
> +#define CSC0_COEF5_D2_MASK		GENMASK(8, 0)
> +
> +#define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
> +#define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
> +
> +#define LCDIF_MIN_XRES			120
> +#define LCDIF_MIN_YRES			120
> +#define LCDIF_MAX_XRES			0xffff
> +#define LCDIF_MAX_YRES			0xffff
> +
> +#endif /* __LCDIF_REGS_H__ */
> --
> 2.35.1

