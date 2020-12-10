Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49DD2D5F9B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B8E6E5B9;
	Thu, 10 Dec 2020 15:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AA36E3F7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:27:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so5892168wrc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 07:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=73e9R2sV+6Fen1aflM2C9CmyZEcEwoXWYLXjyEDcelc=;
 b=JzM0KGbkKzZOwxSjIFon7DlMU3Xmo+sHKsGnsetTxYAQPCTCAp4/btXCKzlI5G6oYK
 5KFUAwdCpRddptTFZnkKThC44QPi3FgIZKOKC0Er/J0nHxRqyfU8azV/B4bniFdsslJ1
 3IqQtszTEUljTOC8IbAaKiZk9GQK8UV/VvYhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=73e9R2sV+6Fen1aflM2C9CmyZEcEwoXWYLXjyEDcelc=;
 b=a1KYEr1QY/5uUXheffT7PYNqT6JYmpZY7NeKbTeyk6CmdDI1B15sAP6ZvppTq0cOuk
 2FgH8Nx1lSgZg4YvQ2U9IdfJg4juab8ZGwYvRnqz+r0uqiX9kj01iUP8KnTz4xOfMiqa
 960qGxJF3Mv98eyTdFuDgBJ8qM/lV1rCh9lZryCuu6nIgg1CxeIDEwAXOqrTUvs7UrSW
 k8/MO5/M91ij+CB0Fy16k0I8qb63Epm94APpSTDByqmduWPD1J59mkRKoya6fzvpjnpL
 mLeEWVcTr2ckfKxrzuzNhCfHhGGzPLqm0nKKyhpPF5j+WKH58E+6u6dwEmac3CnOjGqZ
 B6fA==
X-Gm-Message-State: AOAM532rLEvFogNC7DetpV3pV6jAZNKdCch7ot1ibqnDRj7SoMbw7QTK
 aW+lf1g4G9u/mk3tP+D3TcHtqw==
X-Google-Smtp-Source: ABdhPJxXqVLyBl9ucxWb9rSWymd/8m5NKqK00vObRk+TJ0Y9+uhiI9ETkHxMoJV+yHzTO+N/og4heQ==
X-Received: by 2002:adf:90f1:: with SMTP id i104mr9061377wri.348.1607614062212; 
 Thu, 10 Dec 2020 07:27:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 94sm10817976wrq.22.2020.12.10.07.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 07:27:41 -0800 (PST)
Date: Thu, 10 Dec 2020 16:27:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 1/2] drm: automatic legacy gamma support
Message-ID: <20201210152739.GF401619@phenom.ffwll.local>
References: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
 <20201210140852.1040054-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210140852.1040054-2-tomi.valkeinen@ti.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 04:08:51PM +0200, Tomi Valkeinen wrote:
> To support legacy gamma ioctls the drivers need to set
> drm_crtc_funcs.gamma_set either to a custom implementation or to
> drm_atomic_helper_legacy_gamma_set. Most of the atomic drivers do the
> latter.
> 
> We can simplify this by making the core handle it automatically.
> 
> Add three functions to drm_color_mgmt.c:
> 
> drm_crtc_supports_legacy_gamma() which tells if the driver supports
> setting the legacy gamma.
> 
> drm_crtc_gamma_ramp_set() which sets the given gamma ramp to GAMMA_LUT
> and resets DEGAMMA_LUT and CTM.
> 
> drm_crtc_legacy_gamma_set() which sets the given gamma ramp values
> either using drm_crtc_funcs.gamma_set or drm_crtc_gamma_ramp_set().
> 
> These functions are used from the drm_mode_gamma_set_ioctl, and from
> drm_fb_helper.c when it is dealing with fbdev cmap.
> 
> We can then drop drm_atomic_helper_legacy_gamma_set() and remove all its
> uses.
> 
> Note that we need to EXPORT_SYMBOL all the new functions as they are
> used from drm_fb_helper, but they are declared in drm_crtc_internal.h as
> they are not supposed to be used by the drivers.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 -
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |   1 -
>  drivers/gpu/drm/arm/malidp_crtc.c             |   1 -
>  drivers/gpu/drm/armada/armada_crtc.c          |   1 -
>  drivers/gpu/drm/ast/ast_mode.c                |   1 -
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |   1 -
>  drivers/gpu/drm/drm_atomic_helper.c           |  70 ---------
>  drivers/gpu/drm/drm_color_mgmt.c              | 138 ++++++++++++++++--
>  drivers/gpu/drm/drm_crtc_internal.h           |  10 ++
>  drivers/gpu/drm/drm_fb_helper.c               |  28 ++--
>  drivers/gpu/drm/i915/display/intel_display.c  |   1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 -
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   1 -
>  drivers/gpu/drm/nouveau/dispnv50/head.c       |   2 -
>  drivers/gpu/drm/omapdrm/omap_crtc.c           |   1 -
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   1 -
>  drivers/gpu/drm/stm/ltdc.c                    |   1 -
>  drivers/gpu/drm/vc4/vc4_crtc.c                |   1 -
>  drivers/gpu/drm/vc4/vc4_txp.c                 |   1 -
>  include/drm/drm_atomic_helper.h               |   4 -
>  include/drm/drm_color_mgmt.h                  |   1 -
>  22 files changed, 148 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2855bb918535..848b06c51b0e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5396,7 +5396,6 @@ static void dm_disable_vblank(struct drm_crtc *crtc)
>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.reset = dm_crtc_reset_state,
>  	.destroy = amdgpu_dm_crtc_destroy,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.atomic_duplicate_state = dm_crtc_duplicate_state,
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 4b485eb512e2..59172acb9738 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -550,7 +550,6 @@ static void komeda_crtc_vblank_disable(struct drm_crtc *crtc)
>  }
>  
>  static const struct drm_crtc_funcs komeda_crtc_funcs = {
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  	.destroy		= drm_crtc_cleanup,
>  	.set_config		= drm_atomic_helper_set_config,
>  	.page_flip		= drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
> index 108e7a31bd26..494075ddbef6 100644
> --- a/drivers/gpu/drm/arm/malidp_crtc.c
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -510,7 +510,6 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
>  }
>  
>  static const struct drm_crtc_funcs malidp_crtc_funcs = {
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = drm_crtc_cleanup,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
> index 3ebcf5a52c8b..b7bb90ae787f 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -820,7 +820,6 @@ static const struct drm_crtc_funcs armada_crtc_funcs = {
>  	.cursor_set	= armada_drm_crtc_cursor_set,
>  	.cursor_move	= armada_drm_crtc_cursor_move,
>  	.destroy	= armada_drm_crtc_destroy,
> -	.gamma_set	= drm_atomic_helper_legacy_gamma_set,
>  	.set_config	= drm_atomic_helper_set_config,
>  	.page_flip	= drm_atomic_helper_page_flip,
>  	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 9db371f4054f..5b0ec785c516 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -903,7 +903,6 @@ static void ast_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>  
>  static const struct drm_crtc_funcs ast_crtc_funcs = {
>  	.reset = ast_crtc_reset,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = drm_crtc_cleanup,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index c58fa00b4848..05ad75d155e8 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -473,7 +473,6 @@ static const struct drm_crtc_funcs atmel_hlcdc_crtc_funcs = {
>  	.atomic_destroy_state = atmel_hlcdc_crtc_destroy_state,
>  	.enable_vblank = atmel_hlcdc_crtc_enable_vblank,
>  	.disable_vblank = atmel_hlcdc_crtc_disable_vblank,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  int atmel_hlcdc_crtc_create(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ba1507036f26..b114658100b3 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3499,76 +3499,6 @@ int drm_atomic_helper_page_flip_target(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
>  
> -/**
> - * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction table
> - * @crtc: CRTC object
> - * @red: red correction table
> - * @green: green correction table
> - * @blue: green correction table
> - * @size: size of the tables
> - * @ctx: lock acquire context
> - *
> - * Implements support for legacy gamma correction table for drivers
> - * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> - * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
> - * how the atomic color management and gamma tables work.
> - */
> -int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> -				       u16 *red, u16 *green, u16 *blue,
> -				       uint32_t size,
> -				       struct drm_modeset_acquire_ctx *ctx)
> -{
> -	struct drm_device *dev = crtc->dev;
> -	struct drm_atomic_state *state;
> -	struct drm_crtc_state *crtc_state;
> -	struct drm_property_blob *blob = NULL;
> -	struct drm_color_lut *blob_data;
> -	int i, ret = 0;
> -	bool replaced;
> -
> -	state = drm_atomic_state_alloc(crtc->dev);
> -	if (!state)
> -		return -ENOMEM;
> -
> -	blob = drm_property_create_blob(dev,
> -					sizeof(struct drm_color_lut) * size,
> -					NULL);
> -	if (IS_ERR(blob)) {
> -		ret = PTR_ERR(blob);
> -		blob = NULL;
> -		goto fail;
> -	}
> -
> -	/* Prepare GAMMA_LUT with the legacy values. */
> -	blob_data = blob->data;
> -	for (i = 0; i < size; i++) {
> -		blob_data[i].red = red[i];
> -		blob_data[i].green = green[i];
> -		blob_data[i].blue = blue[i];
> -	}
> -
> -	state->acquire_ctx = ctx;
> -	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> -	if (IS_ERR(crtc_state)) {
> -		ret = PTR_ERR(crtc_state);
> -		goto fail;
> -	}
> -
> -	/* Reset DEGAMMA_LUT and CTM properties. */
> -	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> -	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> -	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> -	crtc_state->color_mgmt_changed |= replaced;
> -
> -	ret = drm_atomic_commit(state);
> -
> -fail:
> -	drm_atomic_state_put(state);
> -	drm_property_blob_put(blob);
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_atomic_helper_legacy_gamma_set);
> -
>  /**
>   * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output format to
>   *						  the input end of a bridge
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 3bcabc2f6e0e..c4e4d59c4432 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -22,6 +22,7 @@
>  
>  #include <linux/uaccess.h>
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> @@ -89,9 +90,8 @@
>   *	modes) appropriately.
>   *
>   * There is also support for a legacy gamma table, which is set up by calling
> - * drm_mode_crtc_set_gamma_size(). Drivers which support both should use
> - * drm_atomic_helper_legacy_gamma_set() to alias the legacy gamma ramp with the
> - * "GAMMA_LUT" property above.
> + * drm_mode_crtc_set_gamma_size(). The DRM core will then alias the legacy gamma
> + * ramp with "GAMMA_LUT".
>   *
>   * Support for different non RGB color encodings is controlled through
>   * &drm_plane specific COLOR_ENCODING and COLOR_RANGE properties. They
> @@ -156,9 +156,6 @@ EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
>   * optional. The gamma and degamma properties are only attached if
>   * their size is not 0 and ctm_property is only attached if has_ctm is
>   * true.
> - *
> - * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
> - * legacy &drm_crtc_funcs.gamma_set callback.
>   */
>  void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  				uint degamma_lut_size,
> @@ -231,6 +228,129 @@ int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
>  
> +/**
> + * drm_crtc_supports_legacy_gamma - does the crtc support legacy gamma correction table
> + * @crtc: CRTC object
> + *
> + * Returns true/false if the given crtc supports setting the legacy gamma
> + * correction table.
> + */
> +bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
> +{
> +	uint32_t gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
> +
> +	if (!crtc->gamma_size)
> +		return false;
> +
> +	if (crtc->funcs->gamma_set)
> +		return true;
> +
> +	return !!drm_mode_obj_find_prop_id(&crtc->base, gamma_id);
> +}
> +EXPORT_SYMBOL(drm_crtc_supports_legacy_gamma);
> +
> +/**
> + * drm_crtc_gamma_ramp_set - set gamma ramp using GAMMA_LUT property
> + * @state: atomic state to which the gamma ramp is set
> + * @crtc: CRTC object
> + * @blob: property blob for the gamma ramp
> + *
> + * Set given gamma ramp to the crtc using GAMMA_LUT property and resetting
> + * DEGAMMA_LUT and CTM.
> + */
> +int drm_crtc_gamma_ramp_set(struct drm_atomic_state *state, struct drm_crtc *crtc,
> +		       struct drm_property_blob *blob)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_property_blob *gamma_blob;
> +	struct drm_property_blob *degamma_blob;
> +	bool replaced;
> +
> +	gamma_blob = blob;
> +	degamma_blob = NULL;
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
> +	/* Set GAMMA_LUT and reset DEGAMMA_LUT and CTM */
> +	replaced = drm_property_replace_blob(&crtc_state->degamma_lut, degamma_blob);
> +	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> +	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, gamma_blob);
> +	crtc_state->color_mgmt_changed |= replaced;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_gamma_ramp_set);
> +
> +/**
> + * drm_crtc_legacy_gamma_set - set the legacy gamma correction table
> + * @crtc: CRTC object
> + * @red: red correction table
> + * @green: green correction table
> + * @blue: green correction table
> + * @size: size of the tables
> + * @ctx: lock acquire context
> + *
> + * Implements support for legacy gamma correction table for drivers
> + * that have set drm_crtc_funcs.gamma_set or that support color management
> + * through the DEGAMMA_LUT/GAMMA_LUT properties. See
> + * drm_crtc_enable_color_mgmt() and the containing chapter for
> + * how the atomic color management and gamma tables work.
> + *
> + * This function sets the gamma using drm_crtc_funcs.gamma_set if set, or
> + * alternatively using crtc color management properties.
> + */
> +int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
> +			      u16 *red, u16 *green, u16 *blue,
> +			      uint32_t size,
> +			      struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_atomic_state *state;
> +	struct drm_property_blob *blob;
> +	struct drm_color_lut *blob_data;
> +	int i, ret = 0;
> +
> +	if (crtc->funcs->gamma_set)
> +		return crtc->funcs->gamma_set(crtc, red, green, blue, size, ctx);
> +
> +	state = drm_atomic_state_alloc(crtc->dev);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	blob = drm_property_create_blob(dev,
> +					sizeof(struct drm_color_lut) * size,
> +					NULL);
> +	if (IS_ERR(blob)) {
> +		ret = PTR_ERR(blob);
> +		blob = NULL;
> +		goto fail;
> +	}
> +
> +	/* Prepare GAMMA_LUT with the legacy values. */
> +	blob_data = blob->data;
> +	for (i = 0; i < size; i++) {
> +		blob_data[i].red = red[i];
> +		blob_data[i].green = green[i];
> +		blob_data[i].blue = blue[i];
> +	}
> +
> +	state->acquire_ctx = ctx;
> +
> +	ret = drm_crtc_gamma_ramp_set(state, crtc, blob);
> +	if (ret)
> +		goto fail;
> +
> +	ret = drm_atomic_commit(state);
> +
> +fail:
> +	drm_atomic_state_put(state);
> +	drm_property_blob_put(blob);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_crtc_legacy_gamma_set);
> +
>  /**
>   * drm_mode_gamma_set_ioctl - set the gamma table
>   * @dev: DRM device
> @@ -262,7 +382,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
>  	if (!crtc)
>  		return -ENOENT;
>  
> -	if (crtc->funcs->gamma_set == NULL)
> +	if (!drm_crtc_supports_legacy_gamma(crtc))
>  		return -ENOSYS;
>  
>  	/* memcpy into gamma store */
> @@ -290,8 +410,8 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
>  		goto out;
>  	}
>  
> -	ret = crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
> -				     crtc->gamma_size, &ctx);
> +	ret = drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
> +					crtc->gamma_size, &ctx);
>  
>  out:
>  	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 54d4cf1233e9..74856df6482a 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -51,9 +51,11 @@ struct drm_mode_fb_cmd2;
>  struct drm_mode_fb_cmd;
>  struct drm_mode_object;
>  struct drm_mode_set;
> +struct drm_modeset_acquire_ctx;
>  struct drm_plane;
>  struct drm_plane_state;
>  struct drm_property;
> +struct drm_property_blob;
>  struct edid;
>  struct kref;
>  struct work_struct;
> @@ -114,6 +116,14 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
>  const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
>  const char *drm_get_color_range_name(enum drm_color_range range);
>  
> +bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc);
> +int drm_crtc_gamma_ramp_set(struct drm_atomic_state *state, struct drm_crtc *crtc,
> +		       struct drm_property_blob *blob);
> +int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
> +			      u16 *red, u16 *green, u16 *blue,
> +			      uint32_t size,
> +			      struct drm_modeset_acquire_ctx *ctx);
> +
>  /* IOCTLs */
>  int drm_mode_gamma_get_ioctl(struct drm_device *dev,
>  			     void *data, struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index e82db0f4e771..80e3797f0f01 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -46,6 +46,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  
> +#include "drm_crtc_internal.h"

So this is a bit annoying, because thus far we managed to have a very
clear split between core and helpers. And I think we can keep that.

>  #include "drm_crtc_helper_internal.h"
>  #include "drm_internal.h"
>  
> @@ -136,15 +137,15 @@ static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
>  {
>  	uint16_t *r_base, *g_base, *b_base;
>  
> -	if (crtc->funcs->gamma_set == NULL)
> +	if (!drm_crtc_supports_legacy_gamma(crtc))
>  		return;
>  
>  	r_base = crtc->gamma_store;
>  	g_base = r_base + crtc->gamma_size;
>  	b_base = g_base + crtc->gamma_size;
>  
> -	crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
> -			       crtc->gamma_size, NULL);
> +	drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
> +				  crtc->gamma_size, NULL);

This is only used by legacy non-atomic drivers. It's pretty much
impossible to make kgdb work with atomic drivers, so really let's just not
bother and keep the code as-is.

>  }
>  
>  /**
> @@ -946,7 +947,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  	drm_modeset_lock_all(fb_helper->dev);
>  	drm_client_for_each_modeset(modeset, &fb_helper->client) {
>  		crtc = modeset->crtc;
> -		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
> +		if (!drm_crtc_supports_legacy_gamma(crtc)) {
>  			ret = -EINVAL;
>  			goto out;
>  		}
> @@ -964,8 +965,8 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  		memcpy(g + cmap->start, cmap->green, cmap->len * sizeof(*g));
>  		memcpy(b + cmap->start, cmap->blue, cmap->len * sizeof(*b));
>  
> -		ret = crtc->funcs->gamma_set(crtc, r, g, b,
> -					     crtc->gamma_size, NULL);
> +		ret = drm_crtc_legacy_gamma_set(crtc, r, g, b, crtc->gamma_size,
> +						NULL);
>  		if (ret)
>  			goto out;

Same here.

>  	}
> @@ -1024,12 +1025,10 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
>  	struct drm_device *dev = fb_helper->dev;
>  	struct drm_property_blob *gamma_lut = NULL;
>  	struct drm_modeset_acquire_ctx ctx;
> -	struct drm_crtc_state *crtc_state;
>  	struct drm_atomic_state *state;
>  	struct drm_mode_set *modeset;
>  	struct drm_crtc *crtc;
>  	u16 *r, *g, *b;
> -	bool replaced;
>  	int ret = 0;
>  
>  	drm_modeset_acquire_init(&ctx, 0);
> @@ -1053,18 +1052,9 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
>  			goto out_state;
>  		}
>  
> -		crtc_state = drm_atomic_get_crtc_state(state, crtc);
> -		if (IS_ERR(crtc_state)) {
> -			ret = PTR_ERR(crtc_state);
> +		ret = drm_crtc_gamma_ramp_set(state, crtc, gamma_lut);
> +		if (ret)

You're nesting an atomic commit in an atomic commit here, that will go
boom. I guess ideally we'd move this into drm_client_modeset so it
remembers the fbdev gamma ramp and does it all in one go. Otherwise I
guess you need some kind of different helper, not sure what.
-Daniel

>  			goto out_state;
> -		}
> -
> -		replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
> -						      NULL);
> -		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> -		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> -						      gamma_lut);
> -		crtc_state->color_mgmt_changed |= replaced;
>  	}
>  
>  	ret = drm_atomic_commit(state);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index cddbda5303ff..1e90b8c3b1c7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -16879,7 +16879,6 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
>  }
>  
>  #define INTEL_CRTC_FUNCS \
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set, \
>  	.set_config = drm_atomic_helper_set_config, \
>  	.destroy = intel_crtc_destroy, \
>  	.page_flip = drm_atomic_helper_page_flip, \
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 42d335d3a114..7bb31fbee29d 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -774,8 +774,6 @@ static const struct drm_crtc_funcs ingenic_drm_crtc_funcs = {
>  
>  	.enable_vblank		= ingenic_drm_enable_vblank,
>  	.disable_vblank		= ingenic_drm_disable_vblank,
> -
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  static const struct drm_plane_helper_funcs ingenic_drm_plane_helper_funcs = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index bfe994230543..b665bd498a4a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -619,7 +619,6 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
>  	.reset			= mtk_drm_crtc_reset,
>  	.atomic_duplicate_state	= mtk_drm_crtc_duplicate_state,
>  	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  	.enable_vblank		= mtk_drm_crtc_enable_vblank,
>  	.disable_vblank		= mtk_drm_crtc_disable_vblank,
>  };
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 537c1ef2e464..ec361d17e900 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -503,7 +503,6 @@ nv50_head_destroy(struct drm_crtc *crtc)
>  static const struct drm_crtc_funcs
>  nv50_head_func = {
>  	.reset = nv50_head_reset,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = nv50_head_destroy,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> @@ -518,7 +517,6 @@ nv50_head_func = {
>  static const struct drm_crtc_funcs
>  nvd9_head_func = {
>  	.reset = nv50_head_reset,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.destroy = nv50_head_destroy,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 7d66269ad998..b97f21cf4a91 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -741,7 +741,6 @@ static const struct drm_crtc_funcs omap_crtc_funcs = {
>  	.set_config = drm_atomic_helper_set_config,
>  	.destroy = omap_crtc_destroy,
>  	.page_flip = drm_atomic_helper_page_flip,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.atomic_duplicate_state = omap_crtc_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
>  	.atomic_set_property = omap_crtc_atomic_set_property,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index b5fb941e0f53..f93e0750431d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1144,7 +1144,6 @@ static const struct drm_crtc_funcs crtc_funcs_gen3 = {
>  	.set_crc_source = rcar_du_crtc_set_crc_source,
>  	.verify_crc_source = rcar_du_crtc_verify_crc_source,
>  	.get_crc_sources = rcar_du_crtc_get_crc_sources,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index d1e05482641b..8d15cabdcb02 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1643,7 +1643,6 @@ static const struct drm_crtc_funcs vop_crtc_funcs = {
>  	.disable_vblank = vop_crtc_disable_vblank,
>  	.set_crc_source = vop_crtc_set_crc_source,
>  	.verify_crc_source = vop_crtc_verify_crc_source,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  static void vop_fb_unref_worker(struct drm_flip_work *work, void *val)
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 3980677435cb..7812094f93d6 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -713,7 +713,6 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
>  	.enable_vblank = ltdc_crtc_enable_vblank,
>  	.disable_vblank = ltdc_crtc_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index ea710beb8e00..7495d70d6a32 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -884,7 +884,6 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
>  	.reset = vc4_crtc_reset,
>  	.atomic_duplicate_state = vc4_crtc_duplicate_state,
>  	.atomic_destroy_state = vc4_crtc_destroy_state,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  	.enable_vblank = vc4_enable_vblank,
>  	.disable_vblank = vc4_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 8aa5220885f4..e4b782e42f69 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -382,7 +382,6 @@ static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
>  	.reset			= vc4_crtc_reset,
>  	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
>  	.atomic_destroy_state	= vc4_crtc_destroy_state,
> -	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
>  	.enable_vblank		= vc4_txp_enable_vblank,
>  	.disable_vblank		= vc4_txp_disable_vblank,
>  };
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 5f47720440fa..4045e2507e11 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -147,10 +147,6 @@ int drm_atomic_helper_page_flip_target(
>  				uint32_t flags,
>  				uint32_t target,
>  				struct drm_modeset_acquire_ctx *ctx);
> -int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> -				       u16 *red, u16 *green, u16 *blue,
> -				       uint32_t size,
> -				       struct drm_modeset_acquire_ctx *ctx);
>  
>  /**
>   * drm_atomic_crtc_for_each_plane - iterate over planes currently attached to CRTC
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 81c298488b0c..c41e56e7e7f5 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -61,7 +61,6 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  
>  int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
>  				 int gamma_size);
> -
>  /**
>   * drm_color_lut_size - calculate the number of entries in the LUT
>   * @blob: blob containing the LUT
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
