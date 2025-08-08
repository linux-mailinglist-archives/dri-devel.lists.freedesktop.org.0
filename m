Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07772B1EFE4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 22:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A96E10E994;
	Fri,  8 Aug 2025 20:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MdoH+ehw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF2D10E98B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 20:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHS7Nwyjay3ECWrSDm9z3fD3ApTvmv+eXpGaiIa3vrb4+HkDeeWJRruRcxtDXL93D8Bs+QUYuzOHJiJOpPyGeikIdkRtgh3xWY87WvZO6kwJBbRw/mz4K/i8T8YGMzXQeeA6q4BjaCCuOy3NPtMT0ESHq3F8vfRXECbJIabuIQ0yJedlktxKnIe4yWXEdEgV5GS0wgWcPzrHxzRvqDGuJN3ewE5fR1OrV0EhDwCIT2SV1dAsU/Da6COEuZfZBg99yGCWUNFLo/YtkO9MfCGEvfJto1CvlKxsCBKIVKlsfh8XuNAllaqergtUpnsFyY7CHfvN/AOid6gIzw+16hsT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgsMJyf/6AaR8Ms6eprrywtPW2q3WElSO2W7ZEqDUt0=;
 b=bOaZqZe9jJ0i9TECQZSIKOmOXiwDXmCLaXeiTPstpk4xdOb2h78PnqSU5Qiuymbl6Br4X6RzW/OzALKbSOSHf9Z8mMlDaybfgabw3dAd8PnnSphPukZJLZcVAz2DVBrlTTRSweetFGQlPhOJoVsuGLQnR1t9mXKTJzktSKbjZn2AvejWEg2UaGdwFDcesP3XjMk0nwnhID2mF4+tI3noJCo5kAAzl5qEI+iQ9jgJ9ie6Vn6CRZagFoP5pYjKj5Z4j8YLJLk2eiMqDuU+5CNSiALV7ZHDsSwpv1Ll5mYZohGurqZSzXcF9C/2VXX0hdgMm/J2a98jJCHSpnmXIQGRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgsMJyf/6AaR8Ms6eprrywtPW2q3WElSO2W7ZEqDUt0=;
 b=MdoH+ehwqa7Me3PP32f+K9xTK08Al3u5zxyys5KO24PTf0L79wiK5DURP0kRWtOBhl5R3n68Y+Q8v/pM2WVy7tt1e54zSoO9nRP0ylhQHhLLkAejtPPTjCt9OR9iIBgicaSzD/r2leCatrCnqsajNXppHiMZ5qeejowciIb5ybuQ+4Zae9j+cyd91K3cqlKCFOiVzNIEHcEAEDFsnmksdj9aAmf2iQo6C7nIlIZbKw+By0pTCc1j9H2MwCpQsiFV5sgEU4Ctun8+ro+WAeeXSRPvJBOc+bIR2rOPQltRiAu8806pr7REVpBgbLkIxyqAdV48KVMohyDEDfndlsCh1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9474.eurprd04.prod.outlook.com (2603:10a6:10:368::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 20:50:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 20:50:01 +0000
Date: Fri, 8 Aug 2025 16:49:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 5/7] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
Message-ID: <aJZi5sLrcinh3FXX@lizhi-Precision-Tower-5810>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
 <20250808080617.2924184-6-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808080617.2924184-6-shengjiu.wang@nxp.com>
X-ClientProxiedBy: PH8PR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::16) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: 875fc868-be39-4eab-2863-08ddd6bd247d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uKCQ19aEi+ODi7ne9uvpzezBR0LTza4Yd3mRQ8DVSWXteSgHHBkC5Zxnnmjc?=
 =?us-ascii?Q?rJiKO0YqOWY4wfvHPgz55m29TP7SXqX9DViXPcUtSI8gxaag6nleZIriEu5t?=
 =?us-ascii?Q?lEBCfKoU56tbJnI6He4wPUglbl5a/bvUM/ZUP8Gd/BgyRvP4Mz/jfksaWZ6k?=
 =?us-ascii?Q?5U142BI+RWrYyJ3/mhjU9cEjObT3fq2nXFpa2TgJT6cWJQQkZeTFbf4WPd8m?=
 =?us-ascii?Q?Z2YXeW/VhhUktfgIWiDTOYW0z4/sbKd4dO2GZ6LIWkhoi4EgqIs9z66uO68M?=
 =?us-ascii?Q?mysDHg3ZiinOai/URCY4gaiFQt09WrLUvb2h3SfgDiMPVw4yKOH3lB8U29Gb?=
 =?us-ascii?Q?4sJCokQT18vxG+ccQ8SrjaGUdr2XvR0YLbEE75C8k807apigS4mUoRhPyb19?=
 =?us-ascii?Q?8QiUX0KS7srcBswTEysFgQUcEPSMuZoRH8MUDZEXRYe+kXa8qMQO/oxOjKsj?=
 =?us-ascii?Q?PwD6WrjPSTPWkJZgq1y/cJRRyisfBxUPYFIe3Ehxp8FisHvxeVx6BzOxX8tG?=
 =?us-ascii?Q?T2uqLC997y7wNyYCTMl3xTl/WR7jNd6rLTY9XDaPPJNSuNJqO8b4YXSDAtcu?=
 =?us-ascii?Q?O3uIChyshfXJ/3LMvGiWOCvQo4zh4ToDfgJE2LUa/jT0TtUJCMA6DzfNZUkZ?=
 =?us-ascii?Q?1rMSE+CwsFPMptO3erc3wGjYU+M3WIIpwARSHWX0nj+ONtxDCQhFt+DXqX/V?=
 =?us-ascii?Q?hP1/89dR/k8oz7S2oesqsmuERQZreWUOQ48ePWbRUgUSnBxciirribYWyd7b?=
 =?us-ascii?Q?+truwD03OFezowVCmmeF95v0qs9ZrtkT1hveRDn9dDWibwLbUtqDY2rnsY68?=
 =?us-ascii?Q?cXyhFNO4jrSX1gAowavcCSLhmN8eEDiO9mv9BREBmuFs/+doMoYtMFcLwYDs?=
 =?us-ascii?Q?bLnlxU0nHvzj9Oc2qQRBwvkieQkZklBXhvxMnDF1fSjaVp+JkT8a9OfMHz1a?=
 =?us-ascii?Q?5y/llHIB5IV0NITYi/2HuASK7+x6YYY1/xfcnxbU+ie00lf5M2leHe+ym0nc?=
 =?us-ascii?Q?YJNxhOW9AigHYVEIzksMEs2NOJ/mW8sOC+0vDiERb+9qlVN0xfs4HGvKbwYt?=
 =?us-ascii?Q?yPXvqj5oezjaZrhgR2BxF0sICvj7qIX5uPrzcvK682eZf+eMjainwwGlXr7A?=
 =?us-ascii?Q?MjTh8k/WXoUj1wS9eotSalW0o4h1tjuhJV5nHczQNnbbjX0vSFmtpsZBPkuE?=
 =?us-ascii?Q?QQozfCbRVcH9sWtnDD2G+Fvv4v0C+rhs6jbjqdbpOsJ8Oh6xWa9VEuoRkSm4?=
 =?us-ascii?Q?DHXt7HoWdstvciGjc8DnWigadszi4SLmXBb1PXXrCYQcQ5B2TIKKi5wade/A?=
 =?us-ascii?Q?S4+tliZK6GqsAvivUeWmccEJy2nMAdbD6dQ4+55lYfgUF43/yzUChUzjSvEO?=
 =?us-ascii?Q?Cg4q1UqQlYxVw1KqZHfTh/2Dl+gCZybTULCnuvrZl5mcZEIfgVtrGC4dGZgW?=
 =?us-ascii?Q?eQCSmZ64yEsv6uf4rVkl9tLc2/7kR4XM3kxVquoedYYZziQnFEOQxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wU8p7XkWcdzMIT++QudMM6qClmv89wNcgDMRsHT545ekBrVZqIlwrPyFCQsT?=
 =?us-ascii?Q?+9wTZGjUlBSHd+m6Pf5t0Q+326bl+CCIKpfzVtOZU8/64bYAEBh/CboJKLQ6?=
 =?us-ascii?Q?jhlyTRrmKmJ8YqJeWnnUuikm1eEV3MrFZYcxscgWFKwJ+PTBO0nrNxJ0LBAs?=
 =?us-ascii?Q?dW0RSTEHyckP57uQurNvXM//V9HNKVy4zNMG4MDZTNCyR1CPyFta4n5D2ITp?=
 =?us-ascii?Q?QjLYyvmrwky4cZ8hH0gGBXshlgdMS33qnopGpmZb+bSDwXTd7G8OeXPVjMmh?=
 =?us-ascii?Q?nTMdfPF+KlQunKgj7n1I0++PsBuCGAVEJ07rCkFYZZeM2kn58CIKmS0S8Ulh?=
 =?us-ascii?Q?znZZNGduO06MAxooNkRPbK/p7MDDu/KtnoWcVMsPWdkC7XYM5EnGmXxNp8wm?=
 =?us-ascii?Q?SMZlXhQfFnvNVVb0dUY6GvRp4TOcdOLszU+WImJIbhwbJgsvdKv8df5yVP48?=
 =?us-ascii?Q?PjxwY/Qvd98Js5Ph09l1snpxVrDGodgJpuEJi5ieKTc2zXUkUuHAVQxMdWyf?=
 =?us-ascii?Q?k/QC11gqqDESXLOajCskLrSw8GvSuEIyRkf2nOywc+DuD5qQIsh2asNHuexM?=
 =?us-ascii?Q?nKvsmS3WjFgGBim/ufv5dKKyGEcXXfHX9Q3ZemjkudYPq/0cgiH8djNy9VlD?=
 =?us-ascii?Q?xF8Cb/i7FzJ6/CZ8wTokLfKiXEGOyA37hjd0O3RFaShDg14+53mBJ0K6Ssui?=
 =?us-ascii?Q?s3kRLumxeOdfG0Kauj1StooSEGCth4+zSQozE8g+5DdspiX7dzrf2SUsa8/Y?=
 =?us-ascii?Q?GphyaJvYDIvPINVNmSSGb8AGwJKlUJcz6G+mkb21BnKx1y8YOL7H+b1OXSsS?=
 =?us-ascii?Q?r4fCdncfrc0+oCsIvoFW3ZJSkT/s6gLG6ea/3Q6VfREnQO3MnIUGKxDHO2UO?=
 =?us-ascii?Q?I2/mgoK/f9DM63Nec49eU3lahX6xzbUEvvWWaEzTO9vMZ1NzdRnovSUi2Nxh?=
 =?us-ascii?Q?NlYm+1dI/LdC6VzL+LddQwE8ScOBnHzlMOMWVAfPm9VkgMdE6b71Xu0V8IuA?=
 =?us-ascii?Q?cWf3Z7ubZRRZxGyHTWDp0gJ98X4Yyh0gIQce+XQw2TVG0UHqTrMctwA65ww0?=
 =?us-ascii?Q?4ASEhjOaL2qf0zgwJ+A21B6ciY6gBIVAlHhBzs4xNRti0yKPfvKl2DLI2vyQ?=
 =?us-ascii?Q?mx+UtBszIz6EDrM46OgsMzekvXqR0fA7yeYS3MbcoDWMyZGPrJt+MbM1AdU1?=
 =?us-ascii?Q?qPyXLdB2GZDmKFw4S4TfeQkTI1UIV6fH+Hy1k1tH/C4q9oRQ2wNZjZZPrCrK?=
 =?us-ascii?Q?B9ZWh7SOdYfsalCj1pGI3A4EsRyoOrtz+YggsmG7jUqNRLzjs0n3SkriSuCs?=
 =?us-ascii?Q?eby28urXNFrL9WunkI/wup4RbOX1bR339jL1xsSiyJoyIkmJ2/uJ+ef2NCYC?=
 =?us-ascii?Q?4/8jPiW7Z4eW13fOSqsx9oF8/WtUUmzzzBY3VmikB+mWAx2nNt5+xNKh/DSR?=
 =?us-ascii?Q?u3gWM/7mE+gVc/WD4ktVMDNOqau391jzZMlCGbMI1iGsIMO6vF0MJIrbd0UL?=
 =?us-ascii?Q?ehOBdFVxf21e2uamTonSVsZRaiym9oF7DSiJ7ltxvHPIpU1kOGwbLfENjKyQ?=
 =?us-ascii?Q?CEQxoINeSvVbw9PYLGO3Czjty0l1pKVsccB+/Nd6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875fc868-be39-4eab-2863-08ddd6bd247d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 20:50:01.3295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naIAbkY16K50K5sfOIuEL63XBz53+Dv1sWut5z9hXCvdfvMoBoRjoRngDdgVhj243MEQO5XkW5+ZBdHmW2yFXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9474
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

On Fri, Aug 08, 2025 at 04:06:15PM +0800, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
>
> Data received from the audio subsystem can have an arbitrary component
> ordering. The HTX_PAI block has integrated muxing options to select which
> sections of the 32-bit input data word will be mapped to each IEC60958
> field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> individually select P,C,U,V,Data, and Preamble.
>
> Use component helper so that imx8mp-hdmi-tx will be aggregate driver,
> imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
> bind() ops to get the plat_data from imx8mp-hdmi-tx device.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 158 +++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  63 +++++++-
>  include/drm/bridge/dw_hdmi.h                 |   6 +
>  5 files changed, 234 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb85..b9028a5e5a06 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -18,12 +18,23 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	depends on OF
>  	depends on COMMON_CLK
>  	select DRM_DW_HDMI
> +	imply DRM_IMX8MP_HDMI_PAI
>  	imply DRM_IMX8MP_HDMI_PVI
>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
>  	help
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.
>
> +config DRM_IMX8MP_HDMI_PAI
> +	tristate "Freescale i.MX8MP HDMI PAI bridge support"
> +	depends on OF
> +	select DRM_DW_HDMI
> +	select REGMAP
> +	select REGMAP_MMIO
> +	help
> +	  Choose this to enable support for the internal HDMI TX Parallel
> +	  Audio Interface found on the Freescale i.MX8MP SoC.
> +
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index dd5d48584806..8d01fda25451 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
>  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
>  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> new file mode 100644
> index 000000000000..8d13a35b206a
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <drm/bridge/dw_hdmi.h>
> +#include <sound/asoundef.h>
> +
> +#define HTX_PAI_CTRL			0x00
> +#define   ENABLE			BIT(0)
> +
> +#define HTX_PAI_CTRL_EXT		0x04
> +#define   WTMK_HIGH_MASK		GENMASK(31, 24)
> +#define   WTMK_LOW_MASK			GENMASK(23, 16)
> +#define   NUM_CH_MASK			GENMASK(10, 8)
> +#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
> +#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
> +#define   NUM_CH(n)			FIELD_PREP(NUM_CH_MASK, (n) - 1)
> +
> +#define HTX_PAI_FIELD_CTRL		0x08
> +#define   PRE_SEL			GENMASK(28, 24)
> +#define   D_SEL				GENMASK(23, 20)
> +#define   V_SEL				GENMASK(19, 15)
> +#define   U_SEL				GENMASK(14, 10)
> +#define   C_SEL				GENMASK(9, 5)
> +#define   P_SEL				GENMASK(4, 0)
> +
> +struct imx8mp_hdmi_pai {
> +	struct regmap	*regmap;
> +};
> +
> +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
> +				   int width, int rate, int non_pcm,
> +				   int iec958)
> +{
> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
> +	int val;
> +
> +	/* PAI set control extended */
> +	val =  WTMK_HIGH(3) | WTMK_LOW(3);
> +	val |= NUM_CH(channel);
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
> +
> +	/* IEC60958 format */
> +	if (iec958) {
> +		val = FIELD_PREP_CONST(P_SEL,
> +				       __bf_shf(IEC958_SUBFRAME_PARITY));
> +		val |= FIELD_PREP_CONST(C_SEL,
> +					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
> +		val |= FIELD_PREP_CONST(U_SEL,
> +					__bf_shf(IEC958_SUBFRAME_USER_DATA));
> +		val |= FIELD_PREP_CONST(V_SEL,
> +					__bf_shf(IEC958_SUBFRAME_VALIDITY));
> +		val |= FIELD_PREP_CONST(D_SEL,
> +					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
> +		val |= FIELD_PREP_CONST(PRE_SEL,
> +					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
> +	} else {
> +		/*
> +		 * The allowed PCM widths are 24bit and 32bit, as they are supported
> +		 * by aud2htx module.
> +		 * for 24bit, D_SEL = 0, select all the bits.
> +		 * for 32bit, D_SEL = 8, select 24bit in MSB.
> +		 */
> +		val = FIELD_PREP(D_SEL, width - 24);
> +	}
> +
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
> +
> +	/* PAI start running */
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
> +}
> +
> +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
> +{
> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
> +
> +	/* Stop PAI */
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> +}
> +
> +static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = HTX_PAI_FIELD_CTRL,
> +};
> +
> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dw_hdmi_plat_data *plat_data = data;
> +	struct imx8mp_hdmi_pai *hdmi_pai;
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> +	if (!hdmi_pai)
> +		return -ENOMEM;

I am not sure how bind/unbind work here. you use devm_ func here? does
system auto free it at unbind()?

generally, free() happen and driver's remove if use devm_ func

Frank
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	hdmi_pai->regmap = devm_regmap_init_mmio_clk(dev, "apb", base,
> +						     &imx8mp_hdmi_pai_regmap_config);
> +	if (IS_ERR(hdmi_pai->regmap)) {
> +		dev_err(dev, "regmap init failed\n");
> +		return PTR_ERR(hdmi_pai->regmap);
> +	}
> +
> +	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
> +	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
> +	plat_data->priv_audio = hdmi_pai;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops imx8mp_hdmi_pai_ops = {
> +	.bind   = imx8mp_hdmi_pai_bind,
> +};
> +
> +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> +{
> +	return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
> +}
> +
> +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
> +}
> +
> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
> +	{ .compatible = "fsl,imx8mp-hdmi-pai" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> +
> +static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
> +	.probe		= imx8mp_hdmi_pai_probe,
> +	.remove		= imx8mp_hdmi_pai_remove,
> +	.driver		= {
> +		.name	= "imx8mp-hdmi-pai",
> +		.of_match_table = imx8mp_hdmi_pai_of_table,
> +	},
> +};
> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec289..c68896392a2d 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -5,11 +5,13 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
>
>  struct imx8mp_hdmi {
>  	struct dw_hdmi_plat_data plat_data;
> @@ -79,10 +81,43 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
>  	.update_hpd	= dw_hdmi_phy_update_hpd,
>  };
>
> +static int imx8mp_dw_hdmi_bind(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = component_bind_all(dev, &hdmi->plat_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
> +
> +	hdmi->dw_hdmi = dw_hdmi_probe(pdev, &hdmi->plat_data);
> +	if (IS_ERR(hdmi->dw_hdmi))
> +		return PTR_ERR(hdmi->dw_hdmi);
> +
> +	return 0;
> +}
> +
> +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> +{
> +	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	dw_hdmi_remove(hdmi->dw_hdmi);
> +
> +	component_unbind_all(dev, &hdmi->plat_data);
> +}
> +
> +static const struct component_master_ops imx8mp_dw_hdmi_ops = {
> +	.bind   = imx8mp_dw_hdmi_bind,
> +	.unbind = imx8mp_dw_hdmi_unbind,
> +};
> +
>  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct dw_hdmi_plat_data *plat_data;
> +	struct component_match *match = NULL;
> +	struct device_node *remote;
>  	struct imx8mp_hdmi *hdmi;
>
>  	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> @@ -102,20 +137,38 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
>
> -	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> -	if (IS_ERR(hdmi->dw_hdmi))
> -		return PTR_ERR(hdmi->dw_hdmi);
> -
>  	platform_set_drvdata(pdev, hdmi);
>
> +	/* port@2 is for hdmi_pai device */
> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> +	if (!remote) {
> +		hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> +		if (IS_ERR(hdmi->dw_hdmi))
> +			return PTR_ERR(hdmi->dw_hdmi);
> +	} else {
> +		drm_of_component_match_add(dev, &match, component_compare_of, remote);
> +
> +		of_node_put(remote);
> +
> +		return component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
> +	}
> +
>  	return 0;
>  }
>
>  static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
> +	struct device_node *remote;
>
> -	dw_hdmi_remove(hdmi->dw_hdmi);
> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> +	if (remote) {
> +		of_node_put(remote);
> +
> +		component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> +	} else {
> +		dw_hdmi_remove(hdmi->dw_hdmi);
> +	}
>  }
>
>  static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 095cdd9b7424..336f062e1f9d 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
>  					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>
> +	/*
> +	 * priv_audio is specially used for additional audio device to get
> +	 * driver data through this dw_hdmi_plat_data.
> +	 */
> +	void *priv_audio;
> +
>  	/* Platform-specific audio enable/disable (optional) */
>  	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
>  			     int width, int rate, int non_pcm, int iec958);
> --
> 2.34.1
>
