Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF455A3C8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F92E10F532;
	Fri, 24 Jun 2022 21:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879F010F533
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:40:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so3983833wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pAi+LBlnWgN+7WSmLJo2WV06guKY5eDIqB1brGNF8fY=;
 b=ERzNl0Xn85NBB/9KQY4CMjlPL1u45Vsa3j+pSm5A94ItaEsbginyT4+X7ykx6R5hgN
 P9Zd4Qbo/S/EtrFfjl6QPc84qsHlIs7dbTdSaPVNOeJ1/d9k2o9vW+qpjwdRQwzOAG4+
 g7bRBEJkv2nQrsjAyHWYj1cpg68ItH4p7FPVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pAi+LBlnWgN+7WSmLJo2WV06guKY5eDIqB1brGNF8fY=;
 b=wcIfGs1blP0MhiuUYXXRZr7U2Ln25LEcFTIlV/dkhhK9WAhAycaZVHZkT/2MdiLMIB
 QD3RkIgbpCsu8/snKglP/e1+nLCBUalXEQjZzu923/gdDkU28MJuGeb5c09fXO40tZqj
 jV7yOB35/POwAfcOXL2h+biRrG7X4rYHavpKXYJa7cJxo1s7DJz83HCl5f+P69t2saIf
 6KTXYgqbIChCQplFfPjnB33yvmkDRMWGwqgF5hCJyMGDbUKXsrXn4acfbz4Cc0uXYigY
 74w1m/0t8o7sVfXJ8KltEferDxqqqxgDKj3OlRoosxYhCkE1TIW+rfzQ0x7M7avQA4xK
 IXPQ==
X-Gm-Message-State: AJIora9ELVhEZIDYU+zWxVA3A7AXrHDZLa9J0ga5NGXjLfty+CzNnz3r
 BW29dNsZOBiK2L11SFvyX4DnZA==
X-Google-Smtp-Source: AGRyM1ubkjcCX6iz+H1S3cOzTW1yORhyHnJKczSbWOvZCJ4x5yQ6LEdFkR6qEWr4iiMocv7tDNgsqQ==
X-Received: by 2002:a05:600c:1553:b0:39c:8873:e241 with SMTP id
 f19-20020a05600c155300b0039c8873e241mr6158612wmg.9.1656106844965; 
 Fri, 24 Jun 2022 14:40:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003a02cbf862esm4105351wmr.13.2022.06.24.14.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:40:44 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:40:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Message-ID: <YrYvWuYNImfopN5n@phenom.ffwll.local>
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-5-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220619223104.667413-5-mwen@igalia.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 nicholas.kazlauskas@amd.com, bhawanpreet.lakha@amd.com, sunpeng.li@amd.com,
 alex.hung@amd.com, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 seanpaul@chromium.org, nikola.cornij@amd.com, christian.koenig@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 19, 2022 at 09:31:03PM -0100, Melissa Wen wrote:
> Add 3D LUT for gammar correction using a 3D lookup table.  The position
> in the color correction pipeline where 3D LUT is applied depends on hw
> design, being after CTM or gamma. If just after CTM, a shaper lut must
> be set to shape the content for a non-linear space. That details should
> be handled by the driver according to its color capabilities.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

I think our color correction pipeline is at a complexity where a DOT graph
that shows how it all works together is justified. So including color
conversion from planes (like yuv->rgb), plane blending and then the color
pipeline here. Maybe in the plane composition section, with the color
conversion pipeline docs linking to that?
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  3 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 14 +++++-
>  drivers/gpu/drm/drm_color_mgmt.c          | 58 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_fb_helper.c           |  2 +
>  drivers/gpu/drm/drm_mode_config.c         | 14 ++++++
>  include/drm/drm_color_mgmt.h              |  4 ++
>  include/drm/drm_crtc.h                    | 12 ++++-
>  include/drm/drm_mode_config.h             | 13 +++++
>  8 files changed, 117 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index cf0545bb6e00..64800bc41365 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
>  		drm_property_blob_get(state->ctm);
>  	if (state->shaper_lut)
>  		drm_property_blob_get(state->shaper_lut);
> +	if (state->lut3d)
> +		drm_property_blob_get(state->lut3d);
>  	if (state->gamma_lut)
>  		drm_property_blob_get(state->gamma_lut);
>  
> @@ -216,6 +218,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
>  	drm_property_blob_put(state->degamma_lut);
>  	drm_property_blob_put(state->ctm);
>  	drm_property_blob_put(state->shaper_lut);
> +	drm_property_blob_put(state->lut3d);
>  	drm_property_blob_put(state->gamma_lut);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 6468f2a080bc..1896c0422f73 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -472,6 +472,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  					&replaced);
>  		state->color_mgmt_changed |= replaced;
>  		return ret;
> +	} else if (property == config->lut3d_property) {
> +		ret = drm_atomic_replace_property_blob_from_id(dev,
> +					&state->lut3d,
> +					val,
> +					-1, sizeof(struct drm_color_lut),
> +					&replaced);
> +		state->color_mgmt_changed |= replaced;
> +		return ret;
>  	} else if (property == config->gamma_lut_property) {
>  		ret = drm_atomic_replace_property_blob_from_id(dev,
>  					&state->gamma_lut,
> @@ -523,10 +531,12 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
>  	else if (property == config->ctm_property)
>  		*val = (state->ctm) ? state->ctm->base.id : 0;
> -	else if (property == config->gamma_lut_property)
> -		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
>  	else if (property == config->shaper_lut_property)
>  		*val = (state->shaper_lut) ? state->shaper_lut->base.id : 0;
> +	else if (property == config->lut3d_property)
> +		*val = (state->lut3d) ? state->lut3d->base.id : 0;
> +	else if (property == config->gamma_lut_property)
> +		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
>  	else if (property == config->prop_out_fence_ptr)
>  		*val = 0;
>  	else if (property == crtc->scaling_filter_property)
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 4f57dc60fe03..696fe1e37801 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -87,6 +87,25 @@
>   *	publish the largest size, and sub-sample smaller sized LUTs
>   *	appropriately.
>   *
> + * “LUT3D”:
> + *	Blob property to set the 3D LUT mapping pixel data after the color
> + *	transformation matrix and before gamma 1D lut correction. The
> + *	data is interpreted as an array of &struct drm_color_lut elements.
> + *	Hardware might choose not to use the full precision of the LUT
> + *	elements.
> + *
> + *	Setting this to NULL (blob property value set to 0) means a the output
> + *	color is identical to the input color. This is generally the driver
> + *	boot-up state too. Drivers can access this blob through
> + *	&drm_crtc_state.gamma_lut.
> + *
> + * “LUT3D_SIZE”:
> + *	Unsigned range property to give the size of the 3D lookup table to be
> + *	set on the LUT3D property (the size depends on the underlying
> + *	hardware). If drivers support multiple LUT sizes then they should
> + *	publish the largest size, and sub-sample smaller sized LUTs
> + *	appropriately.
> + *
>   * “GAMMA_LUT”:
>   *	Blob property to set the gamma lookup table (LUT) mapping pixel data
>   *	after the transformation matrix to data sent to the connector. The
> @@ -204,6 +223,45 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
>  
> +/**
> + * drm_crtc_enable_lut3d - enable 3D LUT properties
> + * @crtc: DRM CRTC
> + * @shaper_lut_size: the size of shaper lut
> + * @lut3d_size: the size of 3D lut
> + *
> + * This function lets the driver enable the 3D LUT color correction property
> + * on a CRTC. This includes 3D LUT and also a shaper LUT, if set. The shaper
> + * LUT property is only attached if its size is not 0 and 3D LUT is set, being
> + * therefore optional.
> + */
> +void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
> +			   uint shaper_lut_size,
> +			   uint lut3d_size)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	if (!lut3d_size)
> +		return;
> +
> +	drm_object_attach_property(&crtc->base,
> +				   config->lut3d_property, 0);
> +	drm_object_attach_property(&crtc->base,
> +				   config->lut3d_size_property,
> +				   lut3d_size);
> +	if (!shaper_lut_size)
> +		return;
> +
> +	drm_object_attach_property(&crtc->base,
> +				   config->shaper_lut_property, 0);
> +	drm_object_attach_property(&crtc->base,
> +				   config->shaper_lut_size_property,
> +				   lut3d_size);
> +
> +}
> +EXPORT_SYMBOL(drm_crtc_enable_lut3d);
> +
> +
>  /**
>   * drm_mode_crtc_set_gamma_size - set the gamma table size
>   * @crtc: CRTC to set the gamma table size for
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index bdd33817d968..358c528c7c80 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1069,6 +1069,8 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
>  		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
>  		replaced |= drm_property_replace_blob(&crtc_state->shaper_lut,
>  						      NULL);
> +		replaced |= drm_property_replace_blob(&crtc_state->lut3d,
> +						      NULL);
>  		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
>  						      gamma_lut);
>  
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 4ba2a95b88e8..5458a7dfbe63 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.shaper_lut_size_property = prop;
>  
> +	prop = drm_property_create(dev,
> +			DRM_MODE_PROP_BLOB,
> +			"LUT3D", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.lut3d_property = prop;
> +
> +	prop = drm_property_create_range(dev,
> +			DRM_MODE_PROP_IMMUTABLE,
> +			"LUT3D_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.lut3d_size_property = prop;
> +
>  	prop = drm_property_create(dev,
>  			DRM_MODE_PROP_BLOB,
>  			"GAMMA_LUT", 0);
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 81c298488b0c..a4f054e0108f 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -59,6 +59,10 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  				bool has_ctm,
>  				uint gamma_lut_size);
>  
> +void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
> +			   uint shaper_lut_size,
> +			   uint lut3d_size);
> +
>  int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
>  				 int gamma_size);
>  
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index a318d5feb44b..c22ffcc4d7aa 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -165,7 +165,7 @@ struct drm_crtc_state {
>  	bool zpos_changed : 1;
>  	/**
>  	 * @color_mgmt_changed: Color management properties have changed
> -	 * (@shaper_lut, @gamma_lut, @degamma_lut or @ctm). Used by
> +	 * (@shaper_lut, @lut3d, @gamma_lut, @degamma_lut or @ctm). Used by
>  	 * the atomic helpers and drivers to steer the atomic commit control
>  	 * flow.
>  	 */
> @@ -298,6 +298,16 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *shaper_lut;
>  
> +	/**
> +	 * @lut3d:
> +	 *
> +	 * 3D Lookup table for converting pixel data. Position where it takes
> +	 * place depends on hw design, after @ctm or @gamma_lut. See
> +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
> +	 * &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *lut3d;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 2df7e171add9..87280694e70d 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -812,6 +812,19 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *shaper_lut_size_property;
>  
> +	/**
> +	 * @lut3d_property: Optional CRTC property to set the 3D LUT used to
> +	 * convert colors; before or after gamma conversion depends on hw
> +	 * design. A shaper LUT can be used to delinearize content before apply
> +	 * 3D LUT correction.
> +	 */
> +	struct drm_property *lut3d_property;
> +	/**
> +	 * @lut3d_size_property: Optional CRTC property for the size of the
> +	 * 3D LUT as supported by the driver (read-only).
> +	 */
> +	struct drm_property *lut3d_size_property;
> +
>  	/**
>  	 * @gamma_lut_property: Optional CRTC property to set the LUT used to
>  	 * convert the colors, after the CTM matrix, to the gamma space of the
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
