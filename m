Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6BAB6EE4
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED33891D7;
	Wed, 14 May 2025 15:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ihpLhnzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDE8891D7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:07:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8240C5C5F27;
 Wed, 14 May 2025 15:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF009C4CEE9;
 Wed, 14 May 2025 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235254;
 bh=hNTh5N5lXn9QrHGBRwJrp+J9t/VSGvHvfw9vMqyzwSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ihpLhnzvP6+f8Bnnfrq42RA6TKUceEUVN1+NqW075ucReOVCir+OHBtHNdhZXQO2S
 TrNu1qvtGiOLHqus0tNmCuS5N5mFoeyn+Y/9fCiihN9E19te4GTV1eTDfdYlIjGM4t
 TaP/dVKEGOZ9sGSGOQ4O475zJ2Jolndn7OlpIbizs09TpuMV1RMlE3ksfQ/JfMdmCN
 0mhn6mjJXzlM61jWlb+dENNQSa/yYbEACvn3mDH3ZA4O0/vmwzvpXI6pe7jpnw7A0M
 /irE71rouyy/Uh20daZ6AXxxVWXwX5ZUUQ83g+PICn5A5lzCmFsSb4xk3b66yFn6lN
 MmshBrDgN8LYA==
Date: Wed, 14 May 2025 17:07:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v10 10/11] drm: sun4i: de33: mixer: add Display Engine
 3.3 (DE33) support
Message-ID: <nze2olzqtgagrkiws2dt3uptehyvcgw7kai5ceycroaroin7jb@xeoddccn5uqh>
References: <20250511104042.24249-1-ryan@testtoast.com>
 <20250511104042.24249-11-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nuzs5zhgui5fpegk"
Content-Disposition: inline
In-Reply-To: <20250511104042.24249-11-ryan@testtoast.com>
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


--nuzs5zhgui5fpegk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 10/11] drm: sun4i: de33: mixer: add Display Engine
 3.3 (DE33) support
MIME-Version: 1.0

On Sun, May 11, 2025 at 10:31:19PM +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>=20
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>=20
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>=20
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>=20
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>=20
> Extend the mixer to support the DE33.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>=20
> ---
> Changelog v4..v5:
> - Whitespace fixes
> - Correct strict mode warnings from checkpatch.pl
>=20
> Changelog v7..v8:
> - Add top/disp regmaps to mixer for DE33
> - Remove YUV-specific code
> - Remove use of global double buffer
> - Remove unneeded if/then parentheses and fix an alignment issue as sugge=
sted by checkpatch.pl
>=20
> Changelog v9..v10:
> - Use names from vendor BSP kernel for register blocks.
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 82 +++++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 22 ++++++--
>  2 files changed, 90 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index cc4da11e2c10..0d4695132dae 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -318,8 +318,9 @@ static void sun8i_mixer_commit(struct sunxi_engine *e=
ngine,
>  	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
>  		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> =20
> -	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> -		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
> +	if (mixer->cfg->de_type !=3D sun8i_mixer_de33)
> +		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> +			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
>  }
> =20
>  static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
> @@ -368,25 +369,31 @@ static void sun8i_mixer_mode_set(struct sunxi_engin=
e *engine,
>  				 const struct drm_display_mode *mode)
>  {
>  	struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +	struct regmap *bld_regs;
>  	u32 bld_base, size, val;
>  	bool interlaced;
> =20
>  	bld_base =3D sun8i_blender_base(mixer);
> +	bld_regs =3D sun8i_blender_regmap(mixer);
>  	interlaced =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>  	size =3D SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
> =20
>  	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
>  			 mode->hdisplay, mode->vdisplay);
> =20
> -	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
> -	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
> +	else
> +		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
> +
> +	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
> =20
>  	if (interlaced)
>  		val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
>  	else
>  		val =3D 0;
> =20
> -	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
>  			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
> =20
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> @@ -400,12 +407,29 @@ static const struct sunxi_engine_ops sun8i_engine_o=
ps =3D {
>  };
> =20
>  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> +	.name		=3D "layers",
>  	.reg_bits	=3D 32,
>  	.val_bits	=3D 32,
>  	.reg_stride	=3D 4,
>  	.max_register	=3D 0xffffc, /* guessed */
>  };
> =20
> +static const struct regmap_config sun8i_top_regmap_config =3D {
> +	.name		=3D "top",
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.max_register	=3D 0x3c,
> +};
> +
> +static const struct regmap_config sun8i_disp_regmap_config =3D {
> +	.name		=3D "display",
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.max_register	=3D 0x20000,
> +};
> +
>  static int sun8i_mixer_of_get_id(struct device_node *node)
>  {
>  	struct device_node *ep, *remote;
> @@ -428,33 +452,45 @@ static int sun8i_mixer_of_get_id(struct device_node=
 *node)
> =20
>  static void sun8i_mixer_init(struct sun8i_mixer *mixer)
>  {
> +	struct regmap *top_regs, *disp_regs;
>  	unsigned int base =3D sun8i_blender_base(mixer);
>  	int plane_cnt, i;
> =20
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33) {
> +		top_regs =3D mixer->top_regs;
> +		disp_regs =3D mixer->disp_regs;
> +	} else {
> +		top_regs =3D mixer->engine.regs;
> +		disp_regs =3D mixer->engine.regs;
> +	}
> +
>  	/* Enable the mixer */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
> +	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
>  		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
> =20
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
> +
>  	/* Set background color to black */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
>  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> =20
>  	/*
>  	 * Set fill color of bottom plane to black. Generally not needed
>  	 * except when VI plane is at bottom (zpos =3D 0) and enabled.
>  	 */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
>  		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
>  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> =20
>  	plane_cnt =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
>  	for (i =3D 0; i < plane_cnt; i++)
> -		regmap_write(mixer->engine.regs,
> +		regmap_write(disp_regs,
>  			     SUN8I_MIXER_BLEND_MODE(base, i),
>  			     SUN8I_MIXER_BLEND_MODE_DEF);
> =20
> -	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
>  			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
>  }
> =20
> @@ -526,6 +562,30 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>  		return PTR_ERR(mixer->engine.regs);
>  	}
> =20
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33) {
> +		regs =3D devm_platform_ioremap_resource_byname(pdev, "top");
> +		if (IS_ERR(regs))
> +			return PTR_ERR(regs);
> +
> +		mixer->top_regs =3D devm_regmap_init_mmio(dev, regs,
> +							&sun8i_top_regmap_config);
> +		if (IS_ERR(mixer->top_regs)) {
> +			dev_err(dev, "Couldn't create the top regmap\n");
> +			return PTR_ERR(mixer->top_regs);
> +		}
> +
> +		regs =3D devm_platform_ioremap_resource_byname(pdev, "display");
> +		if (IS_ERR(regs))
> +			return PTR_ERR(regs);
> +
> +		mixer->disp_regs =3D devm_regmap_init_mmio(dev, regs,
> +							 &sun8i_disp_regmap_config);
> +		if (IS_ERR(mixer->disp_regs)) {
> +			dev_err(dev, "Couldn't create the disp regmap\n");
> +			return PTR_ERR(mixer->disp_regs);
> +		}
> +	}
> +
>  	mixer->reset =3D devm_reset_control_get(dev, NULL);
>  	if (IS_ERR(mixer->reset)) {
>  		dev_err(dev, "Couldn't get our reset line\n");
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 43c413052a22..d87d197610e1 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -21,6 +21,9 @@
>  #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
>  #define SUN8I_MIXER_GLOBAL_SIZE			0xc
> =20
> +#define SUN50I_MIXER_GLOBAL_SIZE		0x8
> +#define SUN50I_MIXER_GLOBAL_CLK			0xc
> +
>  #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
> =20
>  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
> @@ -151,6 +154,12 @@ enum {
>  	CCSC_D1_MIXER0_LAYOUT,
>  };
> =20
> +enum sun8i_mixer_type {
> +	sun8i_mixer_de2,
> +	sun8i_mixer_de3,
> +	sun8i_mixer_de33,
> +};

enum variants typically have their name in upper-case.

With that fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

>  /**
>   * struct sun8i_mixer_cfg - mixer HW configuration
>   * @vi_num: number of VI channels
> @@ -171,8 +180,9 @@ struct sun8i_mixer_cfg {
>  	int		scaler_mask;
>  	int		ccsc;
>  	unsigned long	mod_rate;
> -	unsigned int	is_de3 : 1;
> +	unsigned int	de_type;
>  	unsigned int	scanline_yuv;
> +	unsigned int	map[6];
>  };
> =20
>  struct sun8i_mixer {
> @@ -184,6 +194,9 @@ struct sun8i_mixer {
> =20
>  	struct clk			*bus_clk;
>  	struct clk			*mod_clk;
> +
> +	struct regmap			*top_regs;
> +	struct regmap			*disp_regs;
>  };
> =20
>  enum {
> @@ -220,13 +233,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
>  static inline struct regmap *
>  sun8i_blender_regmap(struct sun8i_mixer *mixer)
>  {
> -	return mixer->engine.regs;
> +	return mixer->cfg->de_type =3D=3D sun8i_mixer_de33 ?
> +		mixer->disp_regs : mixer->engine.regs;
>  }
> =20
>  static inline u32
>  sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
>  {
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
> +	else if (mixer->cfg->de_type =3D=3D sun8i_mixer_de3)
>  		return DE3_CH_BASE + channel * DE3_CH_SIZE;
>  	else
>  		return DE2_CH_BASE + channel * DE2_CH_SIZE;
> --=20
> 2.49.0
>=20

--nuzs5zhgui5fpegk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCSxsgAKCRAnX84Zoj2+
dkRiAYDo7nX2ItTCe0pf3Z1XdARQNaGktkYXB0zUcB6/1NH1ixm0hPLo4c7hq8hc
W98Ln8EBgJxniTtSYsPRfs39kMjdE81dS0/lcPKPY639DgGw8xplbyC++TxqGCtZ
1uyrKcVjtg==
=SFVX
-----END PGP SIGNATURE-----

--nuzs5zhgui5fpegk--
