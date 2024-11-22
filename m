Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FF9D56BC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 01:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA510E41B;
	Fri, 22 Nov 2024 00:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mmcDi9qd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECA310E41B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 00:30:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53d9ff8f1e4so1665938e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 16:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732235421; x=1732840221; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5BhBLdjQdXAjcSUcVMrVvzX1dlsskkhUoC+tDH3PDqM=;
 b=mmcDi9qdEDSPu4PIbxMZkNNrxysPy2BlmVvg8HFDGK/YupAapbWvItEqNUtZwbyY6G
 BkcRzBxNF5wBeOLTHfBc8U/TFNgC6/UuoNlxLdFmAdQDZLYKy64bI5vNmMf3nPrhOcUq
 WSdX15WYhQSdG4pK3fEdaaMQOrJE5UStpoK3CW/SFBR3/c9M/PTKZYDl/5X+JHxvm2Zm
 dPJRmiYboyF8lEgrNvoSmPQs4lnYnYo+Xb5kzC0hrOrUoPRHmS9EiVlwaUGJzaSn2i7X
 C6bRjhoEJZGejngXsec/F0BJUJOdJZ9Zjl5dFbJO1jnJxy6HjbOUEmCaSq334MzSYK1U
 NG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732235421; x=1732840221;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5BhBLdjQdXAjcSUcVMrVvzX1dlsskkhUoC+tDH3PDqM=;
 b=nBX7Y4hOkYd0nMhBjo8PdNvej/h/5vkJdH++iLl3Ab1ieJl/R9dBJ6rDAccGwt47fn
 htQnSG0Mb6bXz6u2W4hc47HPsyblN7NFVhaON595eUs3ZiQ39p1p+d/vc0zechVJteZa
 VKkOrnocBGW+6N6EFXGLglngoiKe7DfHUP/qAPYsb5YkIutPsq8JND+a9MlOqYd5LK2Z
 KtOc8YhpbalJ7BIc7b7HUVgcANwB+K6PT+2nKOjJqgpef+BqbqUt/kfwPRcyS676wyAw
 TDUgUGApRO4/ttv6oKj5dBxo52y9VCrPq+LPd7h/RTR3uW7JIjtiqfzozBLsJkWhb3C8
 7nvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX84zHvLjHjTME7iZjyBAVGcrqm9xM/NHet7b0xN9xQOZmkeemo2VbKlguqumoEO9qxd2N7zorh9vM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywar/nlzWkb06ZlsOtmDrwz1JH6UuFvWlwO79yi9TAH8vczD4a2
 O9BtYyiGO9HjFAVOOX6bugxPZjnZReGzD4NLvo8RA8EGFMqd0lpMhZjcnf6rrS0=
X-Gm-Gg: ASbGncteNE6xeqoi/nfOoO6lJS7bIRG1MlbCAl+/dMuFE53YlspfEdomRFI67e+WthF
 9S81+XuByIeVaSr57IhAi2espil2GQIAmdGU/A3COT/7UM4wnbkO++onYKziXvwXAMsppuW/XEz
 6d1GJDYgnwMNJVJkZPbBZRhbKlxLGmRqhXZnT2zTi5ajb+9OwjzyHvPtP157WPNPIupOjvWNTlz
 75MoLOpV5sGAAFaVzV3qMNKcHk3DfxCkGrwBGz/r03fg9YcRuJyYCEH0T2YKZejGL/HSpqQKE6J
 L7sm94TQs8/HSV4Rr1tlo9zfQxZgdA==
X-Google-Smtp-Source: AGHT+IG4EPGA2jzHyIRfJlNpyGrwE32A0BiLSV17CvKlFjJWwM0w4vzx7gsETwH0TnIeSHKRLBWFVA==
X-Received: by 2002:a05:6512:3ba2:b0:53d:9ff8:edcd with SMTP id
 2adb3069b0e04-53dd3aaff67mr424818e87.51.1732235420958; 
 Thu, 21 Nov 2024 16:30:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2481ea7sm126205e87.140.2024.11.21.16.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 16:30:19 -0800 (PST)
Date: Fri, 22 Nov 2024 02:30:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/9] drm/vs: Add VS Plane API
Message-ID: <c3r6gl2rmqmalemwrbmgz53m4qlzuheq3nijstahketulteucv@ufr7vam3z44f>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-8-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-8-keith.zhao@starfivetech.com>
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

On Wed, Nov 20, 2024 at 02:18:46PM +0800, keith zhao wrote:
> This commit introduces plane functions and helper functions
> for the VS DRM subsystem, enhancing support for managing
> display planes and their configurations.
> 
> Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Makefile   |   3 +-
>  drivers/gpu/drm/verisilicon/vs_plane.c | 358 +++++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_plane.h |  27 ++
>  3 files changed, 387 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
> 
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> index 37f6a4db2a12..1a0e46f38ae8 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -2,6 +2,7 @@
>  
>  vs_drm-objs := vs_dc_hw.o \
>  	       vs_modeset.o \
> -	       vs_crtc.o
> +	       vs_crtc.o \
> +	       vs_plane.o
>  
>  obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
> new file mode 100644
> index 000000000000..ba47d0185fc6
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_plane.c
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) VeriSilicon Holdings Co., Ltd.
> + */
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_blend.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "vs_plane.h"
> +#include "vs_drv.h"
> +#include "vs_crtc.h"
> +
> +static inline struct vs_plane_state *
> +to_vs_plane_state(struct drm_plane_state *state)
> +{
> +	return container_of(state, struct vs_plane_state, base);
> +}
> +
> +static inline struct vs_plane *to_vs_plane(struct drm_plane *plane)
> +{
> +	return container_of(plane, struct vs_plane, base);
> +}
> +
> +static void vs_plane_atomic_destroy_state(struct drm_plane *plane,
> +					  struct drm_plane_state *state)
> +{
> +	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
> +
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(vs_plane_state);
> +}
> +
> +static void vs_plane_reset(struct drm_plane *plane)
> +{
> +	struct vs_plane_state *state;
> +
> +	if (plane->state)
> +		vs_plane_atomic_destroy_state(plane, plane->state);
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return;
> +
> +	__drm_atomic_helper_plane_reset(plane, &state->base);
> +}
> +
> +static struct drm_plane_state *
> +vs_plane_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct vs_plane_state *state;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
> +
> +	return &state->base;
> +}
> +
> +static bool vs_format_mod_supported(struct drm_plane *plane,
> +				    u32 format,
> +				    u64 modifier)
> +{
> +	int i;
> +
> +	/* We always have to allow these modifiers:
> +	 * 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
> +	 * 2. Not passing any modifiers is the same as explicitly passing INVALID.
> +	 */
> +	if (modifier == DRM_FORMAT_MOD_LINEAR)
> +		return true;
> +
> +	/* Check that the modifier is on the list of the plane's supported modifiers. */
> +	for (i = 0; i < plane->modifier_count; i++) {
> +		if (modifier == plane->modifiers[i])
> +			break;
> +	}
> +
> +	if (i == plane->modifier_count)
> +		return false;
> +
> +	return true;
> +}
> +
> +static const struct drm_plane_funcs vs_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.reset			= vs_plane_reset,
> +	.atomic_duplicate_state = vs_plane_atomic_duplicate_state,
> +	.atomic_destroy_state	= vs_plane_atomic_destroy_state,
> +	.format_mod_supported	= vs_format_mod_supported,

         * If not present, then any modifier in the plane's modifier
         * list is allowed with any of the plane's formats.

How is your implementation different from the default behaviour?

> +};
> +
> +static unsigned char vs_get_plane_number(struct drm_framebuffer *fb)

Inline at the calling site.

> +{
> +	const struct drm_format_info *info;
> +
> +	if (!fb)
> +		return 0;
> +
> +	info = drm_format_info(fb->format->format);
> +	if (!info || info->num_planes > DRM_FORMAT_MAX_PLANES)
> +		return 0;
> +
> +	return info->num_planes;
> +}
> +
> +static bool vs_dc_mod_supported(const struct vs_plane_info *vs_info, u64 modifier)
> +{
> +	const u64 *mods;
> +
> +	if (vs_info->type == DRM_PLANE_TYPE_CURSOR)
> +		return 0;
> +
> +	if (!vs_info->data->modifiers)
> +		return false;
> +
> +	for (mods = vs_info->data->modifiers; *mods != DRM_FORMAT_MOD_INVALID; mods++) {
> +		if (*mods == modifier)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int vs_common_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	const struct vs_plane_info *plane_info;
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (!new_state->crtc || !new_state->fb)
> +		return 0;
> +
> +	plane_info = (struct vs_plane_info *)&dc->hw.info->info[to_vs_plane(plane)->id];
> +
> +	if (fb->width < plane_info->data->min_width ||
> +	    fb->width > plane_info->data->max_width ||
> +	    fb->height < plane_info->data->min_height ||
> +	    fb->height > plane_info->data->max_height)
> +		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
> +			     to_vs_plane(plane)->id);

Don't allow users spam console. Use drm_dbg_kms(), drm_dbg_atomic() or
drm_dbg_driver(), whichever fits better.

> +
> +	if (!vs_dc_mod_supported(plane_info, fb->modifier)) {

Should not be necessary, it matches default drm behaviour, see
drm_plane_has_format() called from drm_atomic_plane_check().

> +		drm_err(plane->dev, "unsupported modifier on plane%d.\n", to_vs_plane(plane)->id);
> +		return -EINVAL;
> +	}
> +
> +	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);

drm_atomic_get_new_crtc_state(). Don't call deprecated functions.

> +	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
> +						   plane_info->data->min_scale,
> +						   plane_info->data->max_scale,
> +						   true, true);
> +}
> +
> +static void vs_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
> +
> +	unsigned char i, num_planes, display_id, id;
> +	u32 format;
> +	bool is_yuv;
> +	struct vs_plane *vs_plane = to_vs_plane(plane);
> +	struct vs_plane_state *plane_state = to_vs_plane_state(new_state);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	if (!new_state->fb || !new_state->crtc)
> +		return;
> +
> +	drm_fb_dma_sync_non_coherent(plane->dev, old_state, new_state);
> +
> +	num_planes = vs_get_plane_number(new_state->fb);
> +
> +	for (i = 0; i < num_planes; i++) {
> +		dma_addr_t dma_addr;
> +
> +		dma_addr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, i);
> +		plane_state->dma_addr[i] = dma_addr;
> +	}
> +
> +	display_id = to_vs_display_id(new_state->crtc);
> +	format = new_state->fb->format->format;
> +	is_yuv = new_state->fb->format->is_yuv;
> +	id = vs_plane->id;
> +
> +	dc_plane_hw_update_format_colorspace(dc, format, new_state->color_encoding, id, is_yuv);
> +	if (new_state->visible)
> +		dc_plane_hw_update_address(dc, id, format, plane_state->dma_addr,
> +					   new_state->fb, &new_state->src);
> +	dc_plane_hw_update_format(dc, format, new_state->color_encoding, new_state->rotation,
> +				  new_state->visible, new_state->zpos, id, display_id);
> +	dc_plane_hw_update_scale(dc, &new_state->src, &new_state->dst, id,
> +				 display_id, new_state->rotation);
> +	dc_plane_hw_update_blend(dc, new_state->alpha, new_state->pixel_blend_mode,
> +				 id, display_id);
> +}
> +
> +static void vs_cursor_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	unsigned char display_id;
> +	u32 crtc_w, crtc_x, crtc_y;
> +	s32 hotspot_x, hotspot_y;
> +	dma_addr_t dma_addr;
> +
> +	display_id = to_vs_display_id(new_state->crtc);
> +
> +	if (!new_state->fb || !new_state->crtc)
> +		return;
> +
> +	drm_fb_dma_sync_non_coherent(new_state->fb->dev, old_state, new_state);
> +	dma_addr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, 0);
> +	crtc_w = new_state->crtc_w;
> +
> +	if (new_state->crtc_x > 0) {
> +		crtc_x = new_state->crtc_x;
> +		hotspot_x = 0;
> +	} else {
> +		hotspot_x = -new_state->crtc_x;
> +		crtc_x = 0;
> +	}
> +	if (new_state->crtc_y > 0) {
> +		crtc_y = new_state->crtc_y;
> +		hotspot_y = 0;
> +	} else {
> +		hotspot_y = -new_state->crtc_y;
> +		crtc_y = 0;
> +	}
> +	dc_hw_update_cursor(&dc->hw, display_id, dma_addr, crtc_w, crtc_x,
> +			    crtc_y, hotspot_x, hotspot_y);
> +}
> +
> +static void vs_plane_atomic_disable(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct vs_plane *vs_plane = to_vs_plane(plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	dc_hw_disable_plane(dc, vs_plane->id);
> +}
> +
> +static void vs_cursor_plane_atomic_disable(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	unsigned char display_id;
> +
> +	display_id = to_vs_display_id(old_state->crtc);
> +	dc_hw_disable_cursor(&dc->hw, display_id);
> +}
> +
> +static const struct drm_plane_helper_funcs vs_primary_plane_helpers = {
> +	.atomic_check	= vs_common_plane_atomic_check,
> +	.atomic_update	= vs_plane_atomic_update,
> +	.atomic_disable = vs_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_helper_funcs vs_overlay_plane_helpers = {
> +	.atomic_check	= vs_common_plane_atomic_check,
> +	.atomic_update	= vs_plane_atomic_update,
> +	.atomic_disable = vs_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_helper_funcs vs_cursor_plane_helpers = {
> +	.atomic_check	= vs_common_plane_atomic_check,
> +	.atomic_update	= vs_cursor_plane_atomic_update,
> +	.atomic_disable = vs_cursor_plane_atomic_disable,
> +};
> +
> +struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
> +				 struct vs_plane_info *info,
> +				 unsigned int layer_num,
> +				 unsigned int possible_crtcs)
> +{
> +	struct vs_plane *plane;
> +	const struct vs_plane_data *data = info->data;
> +	int ret;
> +
> +	if (!info)
> +		return NULL;
> +
> +	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
> +					   possible_crtcs,
> +					   &vs_plane_funcs,
> +					   data->formats, data->num_formats,
> +					   data->modifiers, info->type,
> +					   NULL);
> +	if (IS_ERR(plane))
> +		return ERR_CAST(plane);
> +
> +	if (info->type == DRM_PLANE_TYPE_PRIMARY)
> +		drm_plane_helper_add(&plane->base, &vs_primary_plane_helpers);
> +	else if (info->type == DRM_PLANE_TYPE_OVERLAY)
> +		drm_plane_helper_add(&plane->base, &vs_overlay_plane_helpers);
> +	else
> +		drm_plane_helper_add(&plane->base, &vs_cursor_plane_helpers);
> +
> +	if (data->blend_mode) {

Which of the planes sets .blend_mode ?

> +		ret = drm_plane_create_alpha_property(&plane->base);
> +		if (ret)
> +			return NULL;
> +
> +		ret = drm_plane_create_blend_mode_property(&plane->base,
> +							   BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +							   BIT(DRM_MODE_BLEND_PREMULTI) |
> +							   BIT(DRM_MODE_BLEND_COVERAGE));
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	if (data->color_encoding) {
> +		ret = drm_plane_create_color_properties(&plane->base, data->color_encoding,
> +							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
> +							DRM_COLOR_YCBCR_BT709,
> +							DRM_COLOR_YCBCR_LIMITED_RANGE);
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	if (data->rotation) {
> +		ret = drm_plane_create_rotation_property(&plane->base,
> +							 DRM_MODE_ROTATE_0,
> +							 data->rotation);
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	if (data->zpos != 255) {
> +		ret = drm_plane_create_zpos_property(&plane->base, data->zpos, 0, layer_num - 1);
> +		if (ret)
> +			return NULL;
> +	} else {
> +		ret = drm_plane_create_zpos_immutable_property(&plane->base, data->zpos);
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	return plane;
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
> new file mode 100644
> index 000000000000..60d45b69e30a
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_plane.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_PLANE_H__
> +#define __VS_PLANE_H__
> +
> +#include <drm/drm_plane.h>
> +
> +struct vs_plane_info;
> +
> +struct vs_plane_state {
> +	struct drm_plane_state base;
> +	dma_addr_t dma_addr[DRM_FORMAT_MAX_PLANES];
> +};
> +
> +struct vs_plane {
> +	struct drm_plane base;
> +	u8 id;
> +};

Why do you need to export them?

> +
> +struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
> +				 struct vs_plane_info *info,
> +				 unsigned int layer_num,
> +				 unsigned int possible_crtcs);
> +#endif /* __VS_PLANE_H__ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
