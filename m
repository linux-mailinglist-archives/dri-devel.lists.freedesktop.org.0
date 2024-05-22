Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBC8CBC02
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF4510E562;
	Wed, 22 May 2024 07:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tw7n8Wwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE41B10E562
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:29:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5634362801;
 Wed, 22 May 2024 07:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8575FC32781;
 Wed, 22 May 2024 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716362986;
 bh=V3uPlocq7EfqVIlxxbF6SPjdseVkyVIwyPMroCDimqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tw7n8WwuA54pyRy1AvmhSnbT3434jUpB0DZ+vZhOT5dJBlX2zrR0ABXs81MwoL+tb
 0ZVZ6NnC9bb+4b4MVylhVU9n55T42YDEHzx9CI09ibR8aVxvlBej+c0pIygL/5RPBv
 CdkhI0mB1F20Sg0wartj6n6NoOUoDUc4zD87oI0r+k2K1C9/9DejVEDs0WHe4ldb6s
 qoFH55EEWOjrJy5Dl381Sy634ijSagvKOgE0qbA+O5/l0PXyVdLxClJsVCpWE8LMpr
 X/ZYKSG1eV5S+w7tkUaPVsAYgCjvGhlxnoGkzQ94llQMFkSYKuvVo/+l9QPeKyAKgd
 E2noSXrQsMPyQ==
Date: Wed, 22 May 2024 09:29:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: keith <keith.zhao@starfivetech.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com, 
 heiko@sntech.de, andy.yan@rock-chips.com, xingyu.wu@starfivetech.com, 
 p.zabel@pengutronix.de, jack.zhu@starfivetech.com,
 shengyang.chen@starfivetech.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 10/10] drm/vs: add simple dsi encoder
Message-ID: <20240522-devious-strict-tapir-3a7f5a@houat>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-11-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2txi7h3za2mlitau"
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-11-keith.zhao@starfivetech.com>
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


--2txi7h3za2mlitau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 21, 2024 at 06:58:17PM GMT, keith wrote:
> add encoder to match cdns dsi driver
>=20
> Signed-off-by: keith <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Makefile        |   3 +-
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   1 +
>  drivers/gpu/drm/verisilicon/vs_drv.h        |   1 +
>  drivers/gpu/drm/verisilicon/vs_simple_enc.c | 190 ++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_simple_enc.h |  25 +++
>  5 files changed, 219 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
>=20
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
> index 2d02b4a3a567..c35ba9bd6f81 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -4,7 +4,8 @@ vs_drm-objs :=3D vs_dc_hw.o \
>  		vs_modeset.o \
>  		vs_plane.o \
>  		vs_crtc.o \
> -		vs_drv.o
> +		vs_drv.o \
> +		vs_simple_enc.o
> =20
>  vs_drm-$(CONFIG_DRM_INNO_STARFIVE_HDMI) +=3D inno_hdmi-starfive.o
>  obj-$(CONFIG_DRM_VERISILICON_DC8200) +=3D vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/veris=
ilicon/vs_drv.c
> index 6f04102b05b3..2748d48f2c7e 100644
> --- a/drivers/gpu/drm/verisilicon/vs_drv.c
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
> @@ -612,6 +612,7 @@ static struct platform_driver *drm_sub_drivers[] =3D {
>  #ifdef CONFIG_DRM_INNO_STARFIVE_HDMI
>  	&starfive_hdmi_driver,
>  #endif
> +	&simple_encoder_driver,
>  };
> =20
>  static struct component_match *vs_add_external_components(struct device =
*dev)
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/veris=
ilicon/vs_drv.h
> index c3c08ed5f8ac..f3f0f170777d 100644
> --- a/drivers/gpu/drm/verisilicon/vs_drv.h
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
> @@ -17,6 +17,7 @@
>  #include <drm/drm_managed.h>
> =20
>  #include "vs_dc_hw.h"
> +#include "vs_simple_enc.h"
> =20
>  /*@pitch_alignment: buffer pitch alignment required by sub-devices.*/
>  struct vs_drm_device {
> diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.c b/drivers/gpu/dr=
m/verisilicon/vs_simple_enc.c
> new file mode 100644
> index 000000000000..d0b1755d77d2
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> + */
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_of.h>
> +
> +#include "vs_crtc.h"
> +#include "vs_simple_enc.h"
> +
> +static const struct simple_encoder_priv dsi_priv =3D {
> +	.encoder_type =3D DRM_MODE_ENCODER_DSI
> +};

A simple encoder is a thing in KMS, and it's not what you are doing /
using. Please use a different name.

> +static inline struct vs_simple_encoder *to_simple_encoder(struct drm_enc=
oder *enc)
> +{
> +	return container_of(enc, struct vs_simple_encoder, encoder);
> +}
> +
> +static int encoder_parse_dt(struct device *dev)
> +{
> +	struct vs_simple_encoder *simple =3D dev_get_drvdata(dev);
> +	unsigned int args[2];
> +
> +	simple->dss_regmap =3D syscon_regmap_lookup_by_phandle_args(dev->of_nod=
e,
> +								  "starfive,syscon",
> +								  2, args);
> +
> +	if (IS_ERR(simple->dss_regmap)) {
> +		return dev_err_probe(dev, PTR_ERR(simple->dss_regmap),
> +				     "getting the regmap failed\n");
> +	}
> +
> +	simple->offset =3D args[0];
> +	simple->mask =3D args[1];
> +
> +	return 0;
> +}
> +
> +static void vs_encoder_atomic_enable(struct drm_encoder *encoder, struct=
 drm_atomic_state *state)
> +{
> +	struct vs_simple_encoder *simple =3D to_simple_encoder(encoder);
> +
> +	regmap_update_bits(simple->dss_regmap, simple->offset, simple->mask, si=
mple->mask);
> +}

That should be handled through cdns_dsi_platform_ops.enable.

> +static int vs_encoder_atomic_check(struct drm_encoder *encoder,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(crtc_state);
> +	struct drm_connector *connector =3D conn_state->connector;
> +	int ret =3D 0;
> +
> +	vs_crtc_state->encoder_type =3D encoder->encoder_type;
> +	if (connector->display_info.num_bus_formats)
> +		vs_crtc_state->output_fmt =3D connector->display_info.bus_formats[0];
> +	else
> +		vs_crtc_state->output_fmt =3D MEDIA_BUS_FMT_FIXED;
> +
> +	switch (vs_crtc_state->output_fmt) {
> +	case MEDIA_BUS_FMT_FIXED:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +		ret =3D 0;
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	/* If MEDIA_BUS_FMT_FIXED, set it to default value */
> +	if (vs_crtc_state->output_fmt =3D=3D MEDIA_BUS_FMT_FIXED)
> +		vs_crtc_state->output_fmt =3D MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	return ret;
> +}

And that should be handled by the core cdns-dsi driver.

Maxime

> +static const struct drm_encoder_helper_funcs encoder_helper_funcs =3D {
> +	.atomic_check =3D vs_encoder_atomic_check,
> +	.atomic_enable =3D vs_encoder_atomic_enable,
> +};
> +
> +static int vs_encoder_bind(struct device *dev, struct device *master, vo=
id *data)
> +{
> +	struct drm_device *drm_dev =3D data;
> +	struct vs_simple_encoder *simple =3D dev_get_drvdata(dev);
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	encoder =3D &simple->encoder;
> +
> +	ret =3D drmm_encoder_init(drm_dev, encoder, NULL, simple->priv->encoder=
_type, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
> +
> +	encoder->possible_crtcs =3D
> +			drm_of_find_possible_crtcs(drm_dev, dev->of_node);
> +
> +	/* output port is port1*/
> +	bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(bridge)) {
> +		if (PTR_ERR(bridge) =3D=3D -ENODEV) {
> +			bridge =3D NULL;
> +			return 0;
> +		}
> +
> +		return PTR_ERR(bridge);
> +	}
> +
> +	return drm_bridge_attach(encoder, bridge, NULL, 0);
> +}
> +
> +static const struct component_ops encoder_component_ops =3D {
> +	.bind =3D vs_encoder_bind,
> +};
> +
> +static int vs_encoder_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct vs_simple_encoder *simple;
> +	int ret;
> +
> +	simple =3D devm_kzalloc(dev, sizeof(*simple), GFP_KERNEL);
> +	if (!simple)
> +		return -ENOMEM;
> +
> +	simple->priv =3D of_device_get_match_data(dev);
> +
> +	simple->dev =3D dev;
> +
> +	dev_set_drvdata(dev, simple);
> +
> +	ret =3D encoder_parse_dt(dev);
> +	if (ret)
> +		return ret;
> +
> +	return component_add(dev, &encoder_component_ops);
> +}
> +
> +static int vs_encoder_remove(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +
> +	component_del(dev, &encoder_component_ops);
> +	dev_set_drvdata(dev, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id simple_encoder_dt_match[] =3D {
> +	{ .compatible =3D "starfive,dsi-encoder", .data =3D &dsi_priv},
> +	{},
> +};

You also don't need a specific compatible here, just reuse cdns,dsi.

Maxime

--2txi7h3za2mlitau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZk2e5gAKCRAnX84Zoj2+
dlNtAX92xm/RDdc/CmqVPEPloHqxxfPMxhP/Ta3CNyw5RyUuuBv0QmyecDivQd9U
bOAfBb8BfiXgB7iKzWtbYwU7sK1+xZp15EceIVQMqpIi4IfZ5VaFBJsszbABX2J5
gPoGjw/s8g==
=FF2L
-----END PGP SIGNATURE-----

--2txi7h3za2mlitau--
