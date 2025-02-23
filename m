Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E4A40D36
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 08:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E5810E092;
	Sun, 23 Feb 2025 07:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cFrRcUEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4F10E092
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 07:15:48 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1880002f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 23:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740294947; x=1740899747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6oa/ebySssC0rK+0SrRLsb+u+tOYcxAaPGIDJxVzbs=;
 b=cFrRcUEySM1WgW2Uq8tQrjjCXTGn0nKB5lMoEfvIvlC4GPP1Qu95lnpPnAv0h3WFSt
 JnPzcotst3T7kcmJ2elloGAg1wCcO8Gx1bBvi76grnSlnjxpNVj3qISw6dgwwWUIJPij
 iu4jR98MqTqmMXst76mhVJulyDJDS+D5Zo2RNCm5LPsNHIeKAZ/Z0OzX5ClFaSNv0bbs
 8kPv+y0/NVAcVv+ltD//YiKvjroUKDSfSay1OJag9PT4LP1UsqPGFbdmY/hlUgcl6oZD
 /Txtyp3kZ+rWNEhIc4rG0qGoyfYK04/NY/ESqWaD1MM1q3otwA8LDRYaMgBuPolnqnS1
 9c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740294947; x=1740899747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6oa/ebySssC0rK+0SrRLsb+u+tOYcxAaPGIDJxVzbs=;
 b=TqX+YqvfhgDyhsOx9bN7T8wEeTYLdvLygDSBGLC4Pc68Ik4EUTMOP/ip+MORWMhw3g
 6Y0VuLNBTyFPqR89PHsB3ZUg/Kg35m6nUgolPsgzlQipTfTmGAjSXP8dCfHG6mbBx5Wt
 x0Y43tr+yrQPiPFm1H4FIfMakNY0hnjWKgkg1o/hSkbs4NlHZBcd1pzGcgeNHkU0SVu/
 yfz/BU+j5fN/nDcZ9qJivF/q0TbffrKAJAZwRxxXh96sLwwTGTt+SnuXtRlEzBZV4R2r
 RIY+c2ZSTFgqzSSd3qpLLk7eyoLGYOXRuUdnY8W014WCYaQxuaMv4UB71QAlEnaUOtQt
 VAqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzvlihA0B6XnU1TxnECKc0SjzMH8TVUVpr7U9BuXFDfgLCkIv42UhZDguwr/oNI/cIGA+7Xs+ZzhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrNDBkXmwMLZWDvi+gSAL4lywNavXAWIcVPSmroCCoQaiS2tYV
 xHkADu/I9NNxsvBpJ3ejj9B70uQVy5Tyh9AQhICKMGH3LTzmpb9P
X-Gm-Gg: ASbGncsUeBnzSCayZ2tSp5ECfJciYOEiM2fRx9imOdrVmPCPAdPW0U18hyxhmGbUTun
 m/UZ+276xmjtnc3WUZJxvt9uWYsd2rEY9WFGQFixRj6PQ09N9co0BnMruyS3A1gDNuk5pJ988aj
 hoY383CbgbhSedZwwCk5yqT2UirD9Rj4lIAVSoUUyyTGfsisictkN55jTMbqUks7Xr7PGczpoif
 Z3FvsZz76GkNZoGZMnp/7ZzlZMZc9wi09pky/3gfBgOoArrwaOriQxkV7DZhFh51tlfYDe9UDW1
 nxn9/biL5DBH/jrEvbt06wY7rZNo5SWwXKZIWqW8Q8wm4MLHlbQn1wkymzXGV2bI6vi8v3GHTas
 jhA==
X-Google-Smtp-Source: AGHT+IEnkb30SA+X9mOVEWAXsC2Ls3yn4Gcq/0XOfU7eQ65pjUWNN4Y0a8vAPgYwTx8MVDcs2UCfJA==
X-Received: by 2002:a5d:588c:0:b0:38f:4cdc:5d36 with SMTP id
 ffacd0b85a97d-38f6f09bc4emr7603337f8f.43.1740294946526; 
 Sat, 22 Feb 2025 23:15:46 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b43d4sm27805167f8f.4.2025.02.22.23.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 23:15:45 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v7 24/27] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
Date: Sun, 23 Feb 2025 08:15:43 +0100
Message-ID: <15402414.tv2OnDr8pf@jernej-laptop>
In-Reply-To: <20250216183710.8443-25-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-25-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne nedelja, 16. februar 2025 ob 19:36:24 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>=20
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
> - AFBC ARM Frame Buffer Compression support
> - YUV420 input support
>=20
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>=20
> Extend the mixer to support the DE33.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>=20
> ---
> Changelog v4..v5:
> - Whitespace fixes
> - Correct strict mode warnings from checkpatch.pl
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 109 ++++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h |  13 +++-
>  2 files changed, 105 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index f0d48796d651f..3584b496c5d58 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -321,8 +321,12 @@ static void sun8i_mixer_commit(struct sunxi_engine *=
engine,
>  	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
>  		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> =20
> -	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> -		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_DBUFF,
> +			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);

This was my mistake. There is no such thing as SUN50I_MIXER_GLOBAL_DBUFF in=
 DE33
anymore. Values are generally applied at vblank time (I think). Above write=
 actually
writes to RCQ register, which is not great. Just drop this code and fix con=
dition to !=3D.

> +	else
> +		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> +			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
>  }
> =20
>  static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
> @@ -371,25 +375,33 @@ static void sun8i_mixer_mode_set(struct sunxi_engin=
e *engine,
>  				 const struct drm_display_mode *mode)
>  {
>  	struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +	struct regmap *bld_regs, *disp_regs;
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
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33) {
> +		disp_regs =3D mixer->disp_regs;
> +		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
> +	} else {
> +		disp_regs =3D mixer->engine.regs;
> +		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
> +	}
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
> @@ -400,10 +412,8 @@ static void sun8i_mixer_mode_set(struct sunxi_engine=
 *engine,
>  	else
>  		val =3D 0xff108080;
> =20
> -	regmap_write(mixer->engine.regs,
> -		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> -	regmap_write(mixer->engine.regs,
> -		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val=
);
> =20
>  	if (mixer->cfg->has_formatter)
>  		sun50i_fmt_setup(mixer, mode->hdisplay, mode->vdisplay);
> @@ -442,12 +452,29 @@ static const struct sunxi_engine_ops sun8i_engine_o=
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
> @@ -470,33 +497,45 @@ static int sun8i_mixer_of_get_id(struct device_node=
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
> @@ -573,6 +612,30 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>  		return PTR_ERR(mixer->engine.regs);
>  	}
> =20
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33) {
> +		regs =3D devm_platform_ioremap_resource(pdev, 1);
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
> +		regs =3D devm_platform_ioremap_resource(pdev, 2);
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
> @@ -787,6 +850,18 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0=
_cfg =3D {
>  	.vi_num		=3D 1,
>  };
> =20
> +static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg =3D {
> +	.ccsc		=3D CCSC_MIXER0_LAYOUT,
> +	.de_type	=3D sun8i_mixer_de33,
> +	.has_formatter	=3D 1,
> +	.mod_rate	=3D 600000000,
> +	.scaler_mask	=3D 0xf,
> +	.scanline_yuv	=3D 4096,
> +	.ui_num		=3D 3,
> +	.vi_num		=3D 1,
> +	.map		=3D {0, 6, 7, 8},
> +};
> +
>  static const struct of_device_id sun8i_mixer_of_table[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun8i-a83t-de2-mixer-0",
> @@ -832,6 +907,10 @@ static const struct of_device_id sun8i_mixer_of_tabl=
e[] =3D {
>  		.compatible =3D "allwinner,sun50i-h6-de3-mixer-0",
>  		.data =3D &sun50i_h6_mixer0_cfg,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun50i-h616-de33-mixer-0",
> +		.data =3D &sun50i_h616_mixer0_cfg,
> +	},

This should go to separate patch, adding feature (DE33) and adding core sup=
port
are two distinct things.

Best regards,
Jernej

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index db962ccd66964..a8afc37dc80d5 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -22,6 +22,10 @@
>  #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
>  #define SUN8I_MIXER_GLOBAL_SIZE			0xc
> =20
> +#define SUN50I_MIXER_GLOBAL_SIZE		0x8
> +#define SUN50I_MIXER_GLOBAL_CLK			0xc
> +#define SUN50I_MIXER_GLOBAL_DBUFF		0x10
> +
>  #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
> =20
>  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
> @@ -155,6 +159,7 @@ enum {
>  enum sun8i_mixer_type {
>  	sun8i_mixer_de2,
>  	sun8i_mixer_de3,
> +	sun8i_mixer_de33,
>  };
> =20
>  /**
> @@ -181,6 +186,7 @@ struct sun8i_mixer_cfg {
>  	unsigned int		de_type;
>  	unsigned int		has_formatter : 1;
>  	unsigned int		scanline_yuv;
> +	unsigned int		map[6];
>  };
> =20
>  struct sun8i_color_model {
> @@ -238,13 +244,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
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
> -	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de3)
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
> +	else if (mixer->cfg->de_type =3D=3D sun8i_mixer_de3)
>  		return DE3_CH_BASE + channel * DE3_CH_SIZE;
>  	else
>  		return DE2_CH_BASE + channel * DE2_CH_SIZE;
>=20




