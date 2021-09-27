Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4C419A95
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 19:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C3989D46;
	Mon, 27 Sep 2021 17:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FE389D46
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:08:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B3C7E580864;
 Mon, 27 Sep 2021 13:08:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 27 Sep 2021 13:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Gc0OP4pkuNL0HpjTn0pMbStUFsK
 Lcwk3ItWg/iSQqKQ=; b=tOFra5OmYrdnmso9/4ldxTcd+rGglneKEcnJh4DvT+J
 pQFBIZEZ4lmwqvOn9MSgpIqj7aqYrGllfW6E3LGTZFrMY7CjXVE6F/OXKTsBwKAH
 s6lwUGJpZiHghEVJtveTmCAl0jsSfTTvR07pT0AZyRyYvVn4Fh9s6rK16DH+x+Gk
 P6uIa7DZkt2wW56bCUo0ai4m20MAlGkJ6vfBdlodrhzMyiWgAdRbabzHNKhtTozd
 nlc+ik4tNER0wY8RiJU7I4CQh8yc7in3lJy3rtX+FG0DRdLKKPq+i5TvsoUb3bAB
 K6eeOIV4Zln79BAUfMwAJHg87Y2MA7gwDmeYwQPd1TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Gc0OP4
 pkuNL0HpjTn0pMbStUFsKLcwk3ItWg/iSQqKQ=; b=mbm2RvGjIMVzM3fXhiJfd/
 M4n69dpEOJii76wgfb1QL68YQVBVNTGp1XThbqrc95ecSIsIBsqzSOV9gIomg498
 4IlrUqjIBqaBguvrbynLSpyYoPYpMOrOrEkyagWSMUZGIZHrUyq0ufcZfMI8QqTB
 0ENrryvmAsuSZsCHHNKR3uxAhf3xclOSl5b2UXlkJx5jWgXWZeJiukKqRHxp4w3s
 v19pdYwemZzcCuYuQFCKf3gtMlb7JgaikJ4i/k6hp3CzlfycWpahtk7YbJW3lN3I
 RL/nA8VCX8McxNK4hqDNasChvt7fGcKAesqHhUvYQkNkayJ/qvaQ8W4IK+Cw3jPw
 ==
X-ME-Sender: <xms:n_pRYeNOb3NkPocXRdkdTdvMIN8nF-vudjZibReTUSmZb2HiVO_kXA>
 <xme:n_pRYc-kfgLkCjVMc7uMaOy7TfKQcrkIZcWao3EiG1jHOT1d6hSLxiB2jo-5bXn_Z
 XfUxWF0qM6NASG_tRg>
X-ME-Received: <xmr:n_pRYVR-MkCwHsB-nO3hj9PDyHIEiKFTuHr3Rg8t5a0JgDIc_LfbsVAGSuZDkn9lg8GBD2C_bioshgSnTvKwn8kMl6gGztMinaWaCgZV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n_pRYeutUkWpSxPxXF3HYInkOnmta1VQ-8AhqLNI6UEecITdSr5Vkg>
 <xmx:n_pRYWfzXCdaTBVfUED8csGIcWfC6enimEJfSY8JXpl3WaKxCqiysA>
 <xmx:n_pRYS3JHHv9Q9gvc-GpITSxFTeqJxmImlYB02nezGCyeyl3G-GTgg>
 <xmx:n_pRYXMQpNw9EBRq2fhBXQen3JRmbhXk_Ak8Kj9Vv0Qq2hcV4qsjPA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 13:08:47 -0400 (EDT)
Date: Mon, 27 Sep 2021 19:08:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,	Sam Ravnborg <sam@ravnborg.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,	devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org,	linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org,	Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 06/10] drm/ingenic: Add dw-hdmi driver for jz4780
Message-ID: <20210927170846.srsfzbq7lsli4vwj@gilmour>
References: <cover.1632761067.git.hns@goldelico.com>
 <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3axagvyhgirwaxbf"
Content-Disposition: inline
In-Reply-To: <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
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


--3axagvyhgirwaxbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 06:44:24PM +0200, H. Nikolaus Schaller wrote:
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> A specialisation of the generic Synopsys HDMI driver is employed for JZ47=
80
> HDMI support. This requires a new driver, plus device tree and configurat=
ion
> modifications.
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>  drivers/gpu/drm/ingenic/Makefile          |   1 +
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 142 ++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>=20
> diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kc=
onfig
> index 3b57f8be007c..4c7d311fbeff 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
> =20
>  	  The Image Processing Unit (IPU) will appear as a second primary plane.
> =20
> +config DRM_INGENIC_DW_HDMI
> +	bool "Ingenic specific support for Synopsys DW HDMI"
> +	depends on MACH_JZ4780
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this option to enable Synopsys DesignWare HDMI based driver.
> +	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
> +	  select this option..
> +
>  endif
> diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/M=
akefile
> index d313326bdddb..3db9888a6c04 100644
> --- a/drivers/gpu/drm/ingenic/Makefile
> +++ b/drivers/gpu/drm/ingenic/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
>  ingenic-drm-y =3D ingenic-drm-drv.o
>  ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
> +ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/=
ingenic/ingenic-dw-hdmi.c
> new file mode 100644
> index 000000000000..dd9c94ae842e
> --- /dev/null
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
> + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
> + *
> + * Derived from dw_hdmi-imx.c with i.MX portions removed.
> + * Probe and remove operations derived from rcar_dw_hdmi.c.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] =3D {
> +	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000=
 } } },
> +	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 0x0005=
 } } },
> +	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 0x000a=
 } } },
> +	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 0x000f=
 } } },
> +	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000=
 } } }
> +};
> +
> +static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] =3D {
> +	/*pixelclk     bpp8    bpp10   bpp12 */
> +	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
> +	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
> +	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
> +	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
> +	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
> +	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
> +};
> +
> +/*
> + * Resistance term 133Ohm Cfg
> + * PREEMP config 0.00
> + * TX/CK level 10
> + */
> +static const struct dw_hdmi_phy_config ingenic_phy_config[] =3D {
> +	/*pixelclk   symbol   term   vlev */
> +	{ 216000000, 0x800d, 0x0005, 0x01ad},
> +	{ ~0UL,      0x0000, 0x0000, 0x0000}
> +};
> +
> +static enum drm_mode_status
> +ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +			   const struct drm_display_info *info,
> +			   const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 13500)
> +		return MODE_CLOCK_LOW;
> +	/* FIXME: Hardware is capable of 270MHz, but setup data is missing. */
> +	if (mode->clock > 216000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static bool
> +ingenic_dw_hdmi_mode_fixup(struct drm_bridge *bridge,
> +			   const struct drm_display_mode *mode,
> +			   struct drm_display_mode *adjusted_mode)
> +{
> +	adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +	adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC=
);
> +
> +	return true;
> +}
> +
> +static const struct drm_bridge_timings ingenic_dw_hdmi_timings =3D {
> +	.input_bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +};
> +
> +static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data =3D {
> +	.mpll_cfg   =3D ingenic_mpll_cfg,
> +	.cur_ctr    =3D ingenic_cur_ctr,
> +	.phy_config =3D ingenic_phy_config,
> +	.mode_valid =3D ingenic_dw_hdmi_mode_valid,
> +	.mode_fixup =3D ingenic_dw_hdmi_mode_fixup,
> +	.timings    =3D &ingenic_dw_hdmi_timings,
> +	.output_port	=3D 1,
> +};
> +
> +static const struct of_device_id ingenic_dw_hdmi_dt_ids[] =3D {
> +	{ .compatible =3D "ingenic,jz4780-dw-hdmi" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
> +
> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi;
> +	struct regulator *regulator;
> +	int ret;
> +
> +	hdmi =3D dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	regulator =3D devm_regulator_get_optional(&pdev->dev, "hdmi-5v");
> +
> +	if (IS_ERR(regulator)) {
> +		ret =3D PTR_ERR(regulator);
> +
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %s (%d)\n",
> +			      "hdmi-5v", ret);
> +		return ret;
> +	}

This doesn't match your binding

Maxime

--3axagvyhgirwaxbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYVH6ngAKCRDj7w1vZxhR
xWk2AQDiNT8TeIhED/oxK4Vw8clujvOWDBYc9gga1C/Y8xXzIAD9GYcYgqFW9jBq
m8WbTXVCnn79tn9Rd/Ja9fiwVE8MDA0=
=fDtM
-----END PGP SIGNATURE-----

--3axagvyhgirwaxbf--
