Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F01253DE2F
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 22:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C9B10E4A7;
	Sun,  5 Jun 2022 20:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCB710E4A7
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 20:37:02 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id v1so14743949ejg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JIv5Os7UW17jQarYFYAgHw1gk9i/5CzphDERM7LJol0=;
 b=KKEQVjHFvHVgH6n9j1SWf1CPRDAI6LAfT7hLOqiRf227/sSVV8dqvGachHlkPeMKo0
 Af3y8aVKoCxG0WiE5Bji4cqSDBWYd9SSkFBNjeMfVG3DumAPH1w1UnAI3XZicUUBoUsG
 k8mThU2TwgxKiqNsZe3Fmkhe8vIyo5xUQB3iUi5TGQwWByzW1qj58cmXfbDaCDpDSRdb
 gfmPJp/mdWzI8iDtwsHqEXQ+SrPENvsLMy2yI/UV82rCfxL9sEY/eA4pUUC15epYiOuH
 gOwXM0HNSkfikAhbtGYNDOcviCrTzl85DBftdkVS4UxVAZfcr25wEMYu4tSVxteff+jw
 VauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIv5Os7UW17jQarYFYAgHw1gk9i/5CzphDERM7LJol0=;
 b=ZB5lc3S1D82l8ys2PKMiUpFPKapeYF/DQWry66r1ZXOW7Q7dy+Dzd7cDEAcmrXRV01
 ntS2QeD4o+BxXObBELqDunHwguxrIOnJOSYoAAJwl98LvSAUV2aYRx73CH0dStA06k6G
 214gi4tQN0Wybxh2OG196R8wZFwdnEYURy6WWdzWm1zyiS9pFQGYcU1No4OjKq5b7Dtk
 +IG4VhsSSeg8Bn+qVvLs7uVcf8xiNIXDDEnjXskot1BnT/DQYG2db+mO8/PRaU6mjz3L
 L+lxpdcznbQXFTn0TnrPqtWm0Yw6fVHvOj6oCjlfrhvUZk+IMOmzKE7vzGCz34jJb989
 M41g==
X-Gm-Message-State: AOAM531W3c268tRAennvJic2I4MHzGO3P8F6uhn4AgrpNbfo8Q/d7Czh
 cGnogk1AwSunL04An8AMjnQ=
X-Google-Smtp-Source: ABdhPJxq0CggFkPg19k1fkn9/91OlI+D+WtdILAUwuNCg4zMiaIMsZpFVcDDY8NneZzFfMNNocLiPw==
X-Received: by 2002:a17:907:9722:b0:706:19d0:80b5 with SMTP id
 jg34-20020a170907972200b0070619d080b5mr18516602ejc.33.1654461421326; 
 Sun, 05 Jun 2022 13:37:01 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 v7-20020aa7d647000000b0042bd2012196sm7347210edr.85.2022.06.05.13.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 13:37:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, megi@xff.cz,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add support for pixel blend mode
 property
Date: Sun, 05 Jun 2022 22:36:59 +0200
Message-ID: <4714286.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
References: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne nedelja, 05. junij 2022 ob 17:47:31 CEST je Roman Stratiienko napisal(a):
> Allwinner DE2 and DE3 hardware support 3 pixel blend modes:
> "None", "Pre-multiplied", "Coverage"
> 
> Add the blend mode property and route it to the appropriate registers.
> 
> Note:
> "force_premulti" parameter was added to handle multi-overlay channel
> cases in future changes. It must be set to true for cases when more
> than 1 overlay layer is used within a channel and at least one of the
> overlay layers within a group uses premultiplied blending mode.

Please remove this parameter. It's nothing special, so it can be easily added 
once it's actually needed. For now, it only complicates code.

> 
> Test:
> Manually tested all the modes using kmsxx python wrapper with and
> without 'force_premulti' flag enabled.
> 
> Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 ++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 48 ++++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 49 ++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  5 +++
>  5 files changed, 94 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> b/drivers/gpu/drm/sun4i/sun8i_mixer.h index ebfc276b2464..5c05907e26fb
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -65,6 +65,8 @@
>  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
>  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
> 
> +#define SUN8I_MIXER_BLEND_PREMULTIPLY_EN(pipe)	BIT(pipe)
> +
>  #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
> 
>  #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index 6ccbbca3176d..29c0d9cca19a
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -58,24 +58,46 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer
> *mixer, int channel, }
> 
>  static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int
> channel, -					int overlay, struct 
drm_plane *plane)
> +					int overlay, struct 
drm_plane *plane,
> +					unsigned int zpos, 
bool force_premulti)
>  {
> -	u32 mask, val, ch_base;
> +	u32 mask, val, ch_base, bld_base;
> +	bool in_premulti, out_premulti;
> 
> +	bld_base = sun8i_blender_base(mixer);
>  	ch_base = sun8i_channel_base(mixer, channel);
> 
> +	in_premulti = plane->state->pixel_blend_mode == 
DRM_MODE_BLEND_PREMULTI;
> +	out_premulti = force_premulti || in_premulti;
> +
>  	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> -		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> +	       SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK |
> +	       SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK;
> 
>  	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 
8);
> 
> -	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
> -		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> -		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +	if (plane->state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> +		val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER;
> +	} else {
> +		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) 
?
> +			       
SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> +			       
SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +
> +		if (in_premulti)
> +			val |= 
SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI;
> +	}
> +
> +	if (!in_premulti && out_premulti)
> +		val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM;
> 
>  	regmap_update_bits(mixer->engine.regs,
>  			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, 
overlay),
>  			   mask, val);
> +
> +	regmap_update_bits(
> +		mixer->engine.regs, 
SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> +		SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> +		out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 
0);
>  }
> 
>  static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int
> channel, @@ -274,7 +296,7 @@ static void
> sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> sun8i_ui_layer_update_coord(mixer, layer->channel,
>  				    layer->overlay, plane, zpos);
>  	sun8i_ui_layer_update_alpha(mixer, layer->channel,
> -				    layer->overlay, plane);
> +				    layer->overlay, plane, zpos, 
false);
>  	sun8i_ui_layer_update_formats(mixer, layer->channel,
>  				      layer->overlay, plane);
>  	sun8i_ui_layer_update_buffer(mixer, layer->channel,
> @@ -332,8 +354,8 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct
> drm_device *drm, {
>  	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
>  	int channel = mixer->cfg->vi_num + index;
> +	unsigned int plane_cnt, blend_modes;
>  	struct sun8i_ui_layer *layer;
> -	unsigned int plane_cnt;
>  	int ret;
> 
>  	layer = devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
> @@ -362,6 +384,16 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct
> drm_device *drm, return ERR_PTR(ret);
>  	}
> 
> +	blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
> +		      BIT(DRM_MODE_BLEND_COVERAGE) |
> +		      BIT(DRM_MODE_BLEND_PIXEL_NONE);
> +
> +	ret = drm_plane_create_blend_mode_property(&layer->plane, 
blend_modes);
> +	if (ret) {
> +		dev_err(drm->dev, "Couldn't add blend mode 
property\n");
> +		return ERR_PTR(ret);
> +	}
> +
>  	ret = drm_plane_create_zpos_property(&layer->plane, channel,
>  					     0, plane_cnt - 
1);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h index 43c48cf7bc51..bd3c30e8058d
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> @@ -46,6 +46,11 @@
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER		((1) << 1)
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)
> 
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK	GENMASK(17, 16)
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COVERAGE	((0) << 16)
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM	((1) << 16)
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI	((2) << 16)
> +
>  struct sun8i_mixer;
> 
>  struct sun8i_ui_layer {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index 662ba1018cc4..6581fc7d9668
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -52,21 +52,38 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer
> *mixer, int channel, }
> 
>  static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int
> channel, -					int overlay, struct 
drm_plane *plane)
> +					int overlay, struct 
drm_plane *plane,
> +					unsigned int zpos, 
bool force_premulti)
>  {
> -	u32 mask, val, ch_base;
> +	u32 mask, val, ch_base, bld_base;
> +	bool in_premulti = false, out_premulti = false;
> 
>  	ch_base = sun8i_channel_base(mixer, channel);
> +	bld_base = sun8i_blender_base(mixer);
> 
>  	if (mixer->cfg->is_de3) {
> +		in_premulti = plane->state->pixel_blend_mode == 
DRM_MODE_BLEND_PREMULTI;
> +		out_premulti = force_premulti || in_premulti;
> +
>  		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
> -		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
> +		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK 
|
> +		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK;
>  		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
>  			(plane->state->alpha >> 8);
> 
> -		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) 
?
> -			
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> -			
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +		if (plane->state->pixel_blend_mode == 
DRM_MODE_BLEND_PIXEL_NONE) {
> +			val |= 
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER;
> +		} else {
> +			val |= (plane->state->alpha == 
DRM_BLEND_ALPHA_OPAQUE) ?
> +				       
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> +				       
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +
> +			if (in_premulti)
> +				val |= 
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI;
> +		}
> +
> +		if (!in_premulti && out_premulti)
> +			val |= 
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM;
> 
>  		regmap_update_bits(mixer->engine.regs,
>  				   
SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> @@ -79,6 +96,11 @@ static void sun8i_vi_layer_update_alpha(struct
> sun8i_mixer *mixer, int channel, SUN8I_MIXER_FCC_GLOBAL_ALPHA
>  					(plane->state->alpha 
>> 8));
>  	}
> +
> +	regmap_update_bits(
> +		mixer->engine.regs, 
SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> +		SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> +		out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 
0);

Shouldn't be above block inside DE3 if block?

Looks good otherwise.

Best regards,
Jernej

>  }
> 
>  static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int
> channel, @@ -408,7 +430,7 @@ static void
> sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> sun8i_vi_layer_update_coord(mixer, layer->channel,
>  				    layer->overlay, plane, zpos);
>  	sun8i_vi_layer_update_alpha(mixer, layer->channel,
> -				    layer->overlay, plane);
> +				    layer->overlay, plane, zpos, 
false);
>  	sun8i_vi_layer_update_formats(mixer, layer->channel,
>  				      layer->overlay, plane);
>  	sun8i_vi_layer_update_buffer(mixer, layer->channel,
> @@ -563,6 +585,19 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct
> drm_device *drm, }
>  	}
> 
> +	if (mixer->cfg->is_de3) {
> +		unsigned int blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) 
|
> +					   
BIT(DRM_MODE_BLEND_COVERAGE) |
> +					   
BIT(DRM_MODE_BLEND_PIXEL_NONE);
> +
> +		ret = drm_plane_create_blend_mode_property(&layer-
>plane,
> +							   
blend_modes);
> +		if (ret) {
> +			dev_err(drm->dev, "Couldn't add blend mode 
property\n");
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
>  	ret = drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 
1);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h index 9939a4cc7a52..ccf91f09f1fe
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> @@ -44,6 +44,11 @@
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK	GENMASK(31, 24)
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(x)	((x) << 24)
> 
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK	GENMASK(17, 16)
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COVERAGE	((0) << 16)
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM	((1) << 16)
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI	((2) << 16)
> +
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL	((0) << 
1)
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER	((1) << 
1)
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)




