Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A13B0A37A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 13:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D402810E0C4;
	Fri, 18 Jul 2025 11:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="NrECWZSE";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cruOnt7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB0410E0C4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1752839462; x=1784375462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Bv0FKU0AFfIw7QT77LKmorlBooIjyGyTgpW0y6qE4g=;
 b=NrECWZSE/WlEi0ZAl9PX8kR83zaWyVz4yc/9kC7IP7LWYcKp1oT9Cfg0
 GEiniZ9Z3nJsWegWB8kuhYaHFF0UqmSCWVuW4R18+0J6mlZzzxYYckVTl
 46NDJINfgV1iA8s9l93VnfFlhjxKwl9cB6pY3mfTAYbu0Mo+XmHvHnAuH
 ELgsfKhiD2yfy+6WNclQjJx+zEnDfusHG5TVj96QLl1xKOVTHUil8NJEN
 cscX4ApV85O+o/9BkzcOj8OyewRjDnA1GL//Xrf7FHiMDcZ8BGOqs81LB
 wkkCz0J8Qb+BJbImOT4194nRXFqT2GTCWnum+qrhNXplVvMHd7SITq8yn w==;
X-CSE-ConnectionGUID: VvKxd26RTx2rVNs7A20qNQ==
X-CSE-MsgGUID: 2gSUfdVMRiuC4WhWOeoO4A==
X-IronPort-AV: E=Sophos;i="6.16,321,1744063200"; d="scan'208";a="45292812"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 18 Jul 2025 13:50:58 +0200
X-CheckPoint: {687A3522-31-B791C630-E7A1546C}
X-MAIL-CPID: 1ED35FAB929331D10C9F702485E0BB3A_2
X-Control-Analysis: str=0001.0A002109.687A34DD.008C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7773F160039; Fri, 18 Jul 2025 13:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1752839454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Bv0FKU0AFfIw7QT77LKmorlBooIjyGyTgpW0y6qE4g=;
 b=cruOnt7nOfu9W7DGM8mT9yJ5KtIgFAS2iXHiSBqPa7JOQlKSYtsXvf1MQuX8H2RQVlsDX9
 9LNGS2rDhJBJP9B3lOcCsWrOVw2pMpQxbtiidclKvlj3IUwLerOvZmuMtjuxUQKsfGUlQp
 6zi7T62zhWeL4t4PS9NxoaeqFfRyP+tEqAZVX2TnZXSioT7KRzHJMbYg1tOg0EFAP2z1VV
 7W9RFzTt747twqcv/tpdcLB8wNzO6A49goa/qoovwpweKeZVlurXgMhpuVXChBtjAuo80x
 3FdMtjjhrnod6vwroj/D940CpzBIbdZPZC4iF6wAYS7JIZg1xLq5GFjFf0gkTg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Fri, 18 Jul 2025 13:50:49 +0200
Message-ID: <4668607.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250718101150.3681002-3-shengjiu.wang@nxp.com>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

thanks for sending this path.

Am Freitag, 18. Juli 2025, 12:11:48 CEST schrieb Shengjiu Wang:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
>=20
> Data received from the audio subsystem can have an arbitrary component
> ordering. The HTX_PAI block has integrated muxing options to select which
> sections of the 32-bit input data word will be mapped to each IEC60958
> field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> individually select P,C,U,V,Data, and Preamble.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 134 +++++++++++++++++++
>  include/drm/bridge/dw_hdmi.h                 |   6 +
>  4 files changed, 148 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index 9a480c6abb85..d95fa84a8dcd 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -24,6 +24,13 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.
> =20
> +config DRM_IMX8MP_HDMI_PAI
> +	tristate "Freescale i.MX8MP HDMI PAI bridge support"
> +	depends on OF
> +	help
> +	  Choose this to enable support for the internal HDMI TX Parallel
> +	  Audio Interface found on the Freescale i.MX8MP SoC.
> +
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge=
/imx/Makefile
> index dd5d48584806..8d01fda25451 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) +=3D imx-ldb-helper.o
>  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) +=3D imx-legacy-bridge.o
>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) +=3D imx8mp-hdmi-tx.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) +=3D imx8mp-hdmi-pai.o
>  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) +=3D imx8mp-hdmi-pvi.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) +=3D imx8qm-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/d=
rm/bridge/imx/imx8mp-hdmi-pai.c
> new file mode 100644
> index 000000000000..f09ee2622e57
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#define HTX_PAI_CTRL                   0x00
> +#define HTX_PAI_CTRL_EXT               0x04
> +#define HTX_PAI_FIELD_CTRL             0x08
> +#define HTX_PAI_STAT                   0x0c
> +#define HTX_PAI_IRQ_NOMASK             0x10
> +#define HTX_PAI_IRQ_MASKED             0x14
> +#define HTX_PAI_IRQ_MASK               0x18
> +
> +#define CTRL_ENABLE                    BIT(0)
> +
> +#define CTRL_EXT_WTMK_HIGH_MASK                GENMASK(31, 24)
> +#define CTRL_EXT_WTMK_HIGH             (0x3 << 24)
> +#define CTRL_EXT_WTMK_LOW_MASK         GENMASK(23, 16)
> +#define CTRL_EXT_WTMK_LOW              (0x3 << 16)
> +#define CTRL_EXT_NUM_CH_MASK           GENMASK(10, 8)
> +#define CTRL_EXT_NUM_CH_SHIFT          8
> +
> +#define FIELD_CTRL_B_FILT              BIT(31)
> +#define FIELD_CTRL_PARITY_EN           BIT(30)
> +#define FIELD_CTRL_END_SEL             BIT(29)
> +#define FIELD_CTRL_PRE_SEL             GENMASK(28, 24)
> +#define FIELD_CTRL_PRE_SEL_SHIFT       24
> +#define FIELD_CTRL_D_SEL               GENMASK(23, 20)
> +#define FIELD_CTRL_D_SEL_SHIFT         20
> +#define FIELD_CTRL_V_SEL               GENMASK(19, 15)
> +#define FIELD_CTRL_V_SEL_SHIFT         15
> +#define FIELD_CTRL_U_SEL               GENMASK(14, 10)
> +#define FIELD_CTRL_U_SEL_SHIFT         10
> +#define FIELD_CTRL_C_SEL               GENMASK(9, 5)
> +#define FIELD_CTRL_C_SEL_SHIFT         5
> +#define FIELD_CTRL_P_SEL               GENMASK(4, 0)
> +#define FIELD_CTRL_P_SEL_SHIFT         0
> +
> +struct imx8mp_hdmi_pai {
> +	struct device	*dev;
> +	void __iomem	*base;
> +};
> +
> +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
> +				   int width, int rate, int non_pcm)
> +{
> +	const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pdata->p=
riv_audio;
> +	int val;
> +
> +	/* PAI set */
> +	val =3D CTRL_EXT_WTMK_HIGH | CTRL_EXT_WTMK_LOW;
> +	val |=3D ((channel - 1) << CTRL_EXT_NUM_CH_SHIFT);
> +	writel(val, hdmi_pai->base + HTX_PAI_CTRL_EXT);
> +
> +	/* IEC60958 format */
> +	val =3D 31 << FIELD_CTRL_P_SEL_SHIFT;
> +	val |=3D 30 << FIELD_CTRL_C_SEL_SHIFT;
> +	val |=3D 29 << FIELD_CTRL_U_SEL_SHIFT;
> +	val |=3D 28 << FIELD_CTRL_V_SEL_SHIFT;
> +	val |=3D 4 << FIELD_CTRL_D_SEL_SHIFT;
> +	val |=3D 0 << FIELD_CTRL_PRE_SEL_SHIFT;

You can use FIELD_PREP_CONST() for these shifts as the GENMASK are
already available.
But where do these numbers come from? I can see that downstream kernel
sets these bits depending on audio config being passed.

> +
> +	writel(val, hdmi_pai->base + HTX_PAI_FIELD_CTRL);
> +	/* PAI start running */
> +	writel(CTRL_ENABLE, hdmi_pai->base + HTX_PAI_CTRL);
> +}
> +
> +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
> +{
> +	const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pdata->p=
riv_audio;
> +
> +	/* Stop PAI */
> +	writel(0, hdmi_pai->base + HTX_PAI_CTRL);
> +}
> +
> +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct imx8mp_hdmi_pai *hdmi_pai;
> +	struct device_node *remote;
> +	struct platform_device *hdmi_tx;
> +	struct resource *res;
> +
> +	hdmi_pai =3D devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> +	if (!hdmi_pai)
> +		return -ENOMEM;
> +
> +	hdmi_pai->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res=
);
> +	if (IS_ERR(hdmi_pai->base))
> +		return PTR_ERR(hdmi_pai->base);
> +
> +	hdmi_pai->dev =3D dev;
> +
> +	remote =3D of_graph_get_remote_node(pdev->dev.of_node, 0, -1);
> +	if (!remote)
> +		return -EINVAL;
> +
> +	hdmi_tx =3D of_find_device_by_node(remote);
> +	if (!hdmi_tx)
> +		return -EINVAL;
> +
> +	plat_data =3D platform_get_drvdata(hdmi_tx);

How do you ensure hdmi_tx has been probed so that drvdata is set?
Also hdmi_tx needs to be dropped.

> +	plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> +	plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> +	plat_data->priv_audio =3D hdmi_pai;

How do you connect this device to aud2htx?

Best regards,
Alexander

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] =3D {
> +	{ .compatible =3D "fsl,imx8mp-hdmi-pai" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> +
> +static struct platform_driver imx8mp_hdmi_pai_platform_driver =3D {
> +	.probe		=3D imx8mp_hdmi_pai_probe,
> +	.driver		=3D {
> +		.name	=3D "imx8mp-hdmi-pai",
> +		.of_match_table =3D imx8mp_hdmi_pai_of_table,
> +	},
> +};
> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index a56a3519a22a..9ca70ce80cc5 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
>  					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
> =20
> +	/*
> +	 * priv_audio is specially used for additional audio device to get
> +	 * driver data through this dw_hdmi_plat_data.
> +	 */
> +	void *priv_audio;
> +
>  	/* Platform-specific audio enable/disable (optional) */
>  	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
>  			     int width, int rate, int non_pcm);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


