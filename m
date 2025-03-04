Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CCA4D945
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6534C10E537;
	Tue,  4 Mar 2025 09:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Tfba2XTR";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qCvDIahd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1379110E537
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1741081948; x=1772617948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/VD/a98yyCDfU0SnOMU0rBxOeXhg52QvUZEBAyqv8Bw=;
 b=Tfba2XTRwMERmunJ+eiJj86R1XU/3zRZ7jPEpfP2BH47ghwfU3LCNzCb
 8z74FJFmFiqVDBPKmBqFYcZTCiFKN5QLOkG82DxkdZ+bZt4wa0HBxVl/l
 G8Uj9QbJkzYpDRlswXja0vJVc3U+VVWT/iDu0/9jn8D0KGK2njxCVtioV
 k4s5tVgpLYTV1Y2CdfLjzkGzm8a7AC1rSR9U6zfL+w5L7hl/fCarX92nu
 JXdpZhOvuoB+QrUXMOfa6LE0foJji5inRDKP4uJsgDoRWygSKMZnAE36m
 cwyP4A2skzOlzLdX+BtjxQQ4bRy43GIakOPMYz90luzFycmZz7to0NwNq A==;
X-CSE-ConnectionGUID: Ydj/0GUmRGm2UMVXtfd5xQ==
X-CSE-MsgGUID: ppoVPoayTkquX4t30HAVZA==
X-IronPort-AV: E=Sophos;i="6.13,331,1732575600"; d="scan'208";a="42262166"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Mar 2025 10:52:27 +0100
X-CheckPoint: {67C6CD5B-11-18B7E41A-CF5803A6}
X-MAIL-CPID: 03A005A869DADFCCF1CB15E663175D25_1
X-Control-Analysis: str=0001.0A00211E.67C6CD5B.0007, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AFB016CC2F; Tue,  4 Mar 2025 10:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1741081942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VD/a98yyCDfU0SnOMU0rBxOeXhg52QvUZEBAyqv8Bw=;
 b=qCvDIahdzX+SI9KvpR3VjuFNf2v8ygK6rm5b4WI4uiagdFEMJ3BKXKJ7tAeCOfAaC2H2Bi
 5J/yNARaER9ZBAahmx7Ocjvf9tFwGcXMRRqFvwSYKb5X6c8VJEJmuZLJVEWfOI7IKsnl9A
 DBZ8buHQn/Ar03UfdoZ4tjpPLJhalyCtiJyr7i1tX0wCw3IAq27WMgY0VzmNfDanfl0voM
 2D/T1xIJ7Ucito2jwMA7Sq4/IZXbSohWQCORBgNW7wOD68CivjL6oTj/YBXTQ3D9Fxk7N/
 tkrSOhRYS4ubrlnF3wAYEzUgCXvygUNuuIrSVAncXcBYDov+QEoPlSiLDFx5MQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, peng.fan@nxp.com
Subject: Re: [PATCH v5 2/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Tue, 04 Mar 2025 10:52:21 +0100
Message-ID: <8499738.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250304082434.834031-3-victor.liu@nxp.com>
References: <20250304082434.834031-1-victor.liu@nxp.com>
 <20250304082434.834031-3-victor.liu@nxp.com>
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

thanks for the update.

Am Dienstag, 4. M=E4rz 2025, 09:24:34 CET schrieb Liu Ying:
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add a DRM bridge driver to support the display format configuratio=
n.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * Rebase upon next-20250303.  This causes the drop of .remove_new by using
>   devm_drm_bridge_add().  Also, this causes API change for
>   imx93_pdfc_bridge_atomic_enable().
> * Update year of copyright.
>=20
> v3->v4:
> * Use dev_err_probe() in imx93_pdfc_bridge_probe(). (Krzysztof)
> * Drop MODULE_ALIAS(). (Krzysztof)
> * Update year of Copyright.
>=20
> v2->v3:
> * No change.
> * Resend with the patch rebased upon v6.11-rc1.
>=20
> v1->v2:
> * Set *num_input_fmts to zero in case
>   imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL.
> * Replace .remove callback with .remove_new callback in
>   imx93_pdfc_bridge_driver.
>=20
>  drivers/gpu/drm/bridge/imx/Kconfig      |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 186 ++++++++++++++++++++++++
>  3 files changed, 195 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index 9a480c6abb85..51138d74ddfb 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -88,4 +88,12 @@ config DRM_IMX93_MIPI_DSI
>  	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
>  	  processor.
> =20
> +config DRM_IMX93_PARALLEL_DISP_FMT_CONFIG
> +	tristate "NXP i.MX93 parallel display format configuration"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this to enable parallel display format configuration
> +	  found in NXP i.MX93 processor.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge=
/imx/Makefile
> index dd5d48584806..f4ccc5cbef72 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pix=
el-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
>  obj-$(CONFIG_DRM_IMX93_MIPI_DSI) +=3D imx93-mipi-dsi.o
> +obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONFIG) +=3D imx93-pdfc.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/br=
idge/imx/imx93-pdfc.c
> new file mode 100644
> index 000000000000..7dfb87e64197
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2022-2025 NXP
> + */
> +
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>
> +
> +#define DISPLAY_MUX		0x60
> +#define  PARALLEL_DISP_FORMAT	0x700
> +
> +enum imx93_pdfc_format {
> +	RGB888_TO_RGB888 =3D 0x0,
> +	RGB888_TO_RGB666 =3D 0x1 << 8,
> +	RGB565_TO_RGB565 =3D 0x2 << 8,
> +};

How about?
#define  PARALLEL_DISP_FORMAT          GENMASK(10, 8)
#define  FORMAT_RGB888_TO_RGB888       FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
#define  FORMAT_RGB888_TO_RGB666       FIELD_PREP(PARALLEL_DISP_FORMAT, 1)
#define  FORMAT_RGB565_TO_RGB565       FIELD_PREP(PARALLEL_DISP_FORMAT, 2)
#define  FORMAT_RGB555_TO_RGB555       FIELD_PREP(PARALLEL_DISP_FORMAT, 3)
#define  FORMAT_YUV_TO_YCBCR24         FIELD_PREP(PARALLEL_DISP_FORMAT, 4)
#define  FORMAT_YUV_TO_YUV444          FIELD_PREP(PARALLEL_DISP_FORMAT, 5)

> +
> +struct imx93_pdfc {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	u32 format;
> +};
> +
> +static int imx93_pdfc_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct imx93_pdfc *pdfc =3D bridge->driver_private;
> +
> +	return drm_bridge_attach(bridge->encoder, pdfc->next_bridge, bridge, fl=
ags);
> +}
> +
> +static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> +					    struct drm_atomic_state *state)
> +{
> +	struct imx93_pdfc *pdfc =3D bridge->driver_private;
> +
> +	regmap_update_bits(pdfc->regmap, DISPLAY_MUX, PARALLEL_DISP_FORMAT,
> +			   pdfc->format);
> +}
> +
> +static const u32 imx93_pdfc_bus_output_fmts[] =3D {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB565_1X16,
> +	MEDIA_BUS_FMT_FIXED
> +};
> +
> +static bool imx93_pdfc_bus_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> +		if (imx93_pdfc_bus_output_fmts[i] =3D=3D fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_connector_state *conn_state,
> +					    u32 output_fmt,
> +					    unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts =3D 0;
> +
> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt))
> +		return NULL;
> +
> +	input_fmts =3D kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		input_fmts[0] =3D output_fmt;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
> +	*num_input_fmts =3D 1;
> +
> +	return input_fmts;
> +}
> +
> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_connector_state *conn_state)
> +{
> +	struct imx93_pdfc *pdfc =3D bridge->driver_private;
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		pdfc->format =3D RGB888_TO_RGB888;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		pdfc->format =3D RGB888_TO_RGB666;
> +		break;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		pdfc->format =3D RGB565_TO_RGB565;

Do really need to store the bus format in device struct?
It's possible to access the bridge state in atomic_enable using
drm_atomic_get_bridge_state, no? TBH I don't know what are the best
practices though.
> +		break;
> +	default:
> +		DRM_DEV_DEBUG_DRIVER(pdfc->dev, "Unsupported output bus format: 0x%x\n=
",
> +				     bridge_state->output_bus_cfg.format);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs imx93_pdfc_bridge_funcs =3D {
> +	.attach			=3D imx93_pdfc_bridge_attach,
> +	.atomic_enable		=3D imx93_pdfc_bridge_atomic_enable,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts	=3D imx93_pdfc_bridge_atomic_get_input_bus_f=
mts,
> +	.atomic_check		=3D imx93_pdfc_bridge_atomic_check,
> +	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
> +};
> +
> +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct imx93_pdfc *pdfc;
> +
> +	pdfc =3D devm_kzalloc(dev, sizeof(*pdfc), GFP_KERNEL);
> +	if (!pdfc)
> +		return -ENOMEM;
> +
> +	pdfc->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(pdfc->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
> +				     "failed to get regmap\n");
> +
> +	pdfc->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(pdfc->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	pdfc->dev =3D dev;
> +	pdfc->bridge.driver_private =3D pdfc;
> +	pdfc->bridge.funcs =3D &imx93_pdfc_bridge_funcs;
> +	pdfc->bridge.of_node =3D dev->of_node;

pdfc->bridge.type =3D DRM_MODE_CONNECTOR_DPI;

Despite that looks god to me.

Best regards
Alexander

> +
> +	return devm_drm_bridge_add(dev, &pdfc->bridge);
> +}
> +
> +static const struct of_device_id imx93_pdfc_dt_ids[] =3D {
> +	{ .compatible =3D "nxp,imx93-pdfc", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
> +
> +static struct platform_driver imx93_pdfc_bridge_driver =3D {
> +	.probe	=3D imx93_pdfc_bridge_probe,
> +	.driver	=3D {
> +		.of_match_table =3D imx93_pdfc_dt_ids,
> +		.name =3D "imx93_pdfc",
> +	},
> +};
> +module_platform_driver(imx93_pdfc_bridge_driver);
> +
> +MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration dri=
ver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL v2");
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


