Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E647431ED
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B0810E426;
	Fri, 30 Jun 2023 00:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7800A10E424
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:48:48 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b6985de215so21449901fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688086126; x=1690678126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ue2+PAMkkpTTFh6ams9GTGFfqKoFrX5tBKtSTZ4Mf1Q=;
 b=mESmDSMarvujhmX3UFh4P7nzFXPJU13HRojzzWE8u1fbo16pI/jox8a3SGiUwdIRUO
 1aLjTE5iYYeLZmAaRekpexw3eKku0d8IcFlw5CNtk2A1sQ+7TIeF+F7ftTgUmiifr0Hh
 cTUJnFAMMKR7d00+Qby2v9lwR9whsDD3F7xU7UHqXO1txfGlkgE+0DoxRRq2L3iGakA+
 Ih4DO7v3VCYLQYBRWpeSPNhoXmxAq93NXV+zaTZSUmg5GbtcpNDQdzbnrQkFBwKd25RX
 AIdeAbZpa6KmCOL5SAk82SFq0BYJlJ1HSRNKydCo8EndxI9uyBk4q/PT5XtKYh87bPsv
 pGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688086126; x=1690678126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ue2+PAMkkpTTFh6ams9GTGFfqKoFrX5tBKtSTZ4Mf1Q=;
 b=l6TPg7icpsMyuj0Wp8ie2itK4yEh5AhgkjT42OH/2jQtg0wjYOTq4F8V6cEhOOEUmT
 Plzd5iPyT0s531NH19BQq+uI8zAxN84esWzlBkHmEW4oWm+x/M4vvXy37XP3CW74lC+2
 dDhguXDyli5sr5T3i0dsIW1+7zd05WP8hg7VKJbmE6b43sJCnu2OBn7tvEl2K5CdCnVp
 VngV3PwtzEPOFqIbBR9gVaucp6fHO2Y1b5NnjExV8AbPLUd9KJ3hYeehTNc7XG4QZzhe
 CPkIr2MavWcVxYVRbOkFARV1csA+kW/qKvLyWgDtA9oD9wWNfygf6tm6kSFV9Mo98wuf
 OW+g==
X-Gm-Message-State: ABy/qLZVMNopoqxccVN9aysNMOrQAqfAjBJT5Wm72GJwzGhH+kZcG698
 sAWLczDTleZlRmvd2rQXJwmkcg==
X-Google-Smtp-Source: APBJJlEuVS4BhuLKztf3MhL3MCL825JMA9TYdgygvNQ5WPe00tsW31qwjRFs9XS03OcOE0LLXH+R7Q==
X-Received: by 2002:a05:6512:3d09:b0:4f8:6d54:72fb with SMTP id
 d9-20020a0565123d0900b004f86d5472fbmr1235644lfv.62.1688086125944; 
 Thu, 29 Jun 2023 17:48:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v27-20020ac2561b000000b004f8596a31dcsm2151468lfd.209.2023.06.29.17.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:48:45 -0700 (PDT)
Message-ID: <2a5cdfcc-b220-f19b-7410-73e59b31e4a4@linaro.org>
Date: Fri, 30 Jun 2023 03:48:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 4/7] drm/atomic: Loosen FB atomic checks
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-4-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-4-f4ec0caa742d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2023 03:25, Jessica Zhang wrote:
> Loosen the requirements for atomic and legacy commit so that, in cases
> where solid fill planes is enabled but no FB is set, the commit can
> still go through.
> 
> This includes adding framebuffer NULL checks in other areas to account
> for FB being NULL when solid fill is enabled.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 14 +++++++-------
>   drivers/gpu/drm/drm_atomic_helper.c | 34 ++++++++++++++++++++--------------
>   drivers/gpu/drm/drm_plane.c         |  8 ++++----
>   include/drm/drm_atomic_helper.h     |  4 ++--
>   include/drm/drm_plane.h             | 28 ++++++++++++++++++++++++++++
>   5 files changed, 61 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 404b984d2d9f..ec9681c25366 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -668,14 +668,14 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	const struct drm_framebuffer *fb = new_plane_state->fb;
>   	int ret;
>   
> -	/* either *both* CRTC and FB must be set, or neither */
> -	if (crtc && !fb) {
> -		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
> +	/* either *both* CRTC and pixel source must be set, or neither */
> +	if (crtc && !drm_plane_has_visible_data(new_plane_state)) {
> +		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no visible data\n",
>   			       plane->base.id, plane->name);
>   		return -EINVAL;
> -	} else if (fb && !crtc) {
> -		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
> -			       plane->base.id, plane->name);
> +	} else if (drm_plane_has_visible_data(new_plane_state) && !crtc) {
> +		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] Source %d has visible data but no CRTC\n",
> +			       plane->base.id, plane->name, new_plane_state->pixel_source);
>   		return -EINVAL;
>   	}
>   
> @@ -706,7 +706,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	}
>   
>   
> -	if (fb) {
> +	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
>   		ret = drm_atomic_check_fb(new_plane_state);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 41b8066f61ff..d05ec9ef2b3e 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   	*src = drm_plane_state_src(plane_state);
>   	*dst = drm_plane_state_dest(plane_state);
>   
> -	if (!fb) {
> +	if (!drm_plane_has_visible_data(plane_state)) {
>   		plane_state->visible = false;
>   		return 0;
>   	}
> @@ -881,25 +881,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   		return -EINVAL;
>   	}
>   
> -	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
> +	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
> +		drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
>   
> -	/* Check scaling */
> -	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> -	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> -	if (hscale < 0 || vscale < 0) {
> -		drm_dbg_kms(plane_state->plane->dev,
> -			    "Invalid scaling of plane\n");
> -		drm_rect_debug_print("src: ", &plane_state->src, true);
> -		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> -		return -ERANGE;
> +		/* Check scaling */
> +		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> +		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> +
> +		if (hscale < 0 || vscale < 0) {
> +			drm_dbg_kms(plane_state->plane->dev,
> +					"Invalid scaling of plane\n");
> +			drm_rect_debug_print("src: ", &plane_state->src, true);
> +			drm_rect_debug_print("dst: ", &plane_state->dst, false);
> +			return -ERANGE;
> +		}
>   	}
>   
>   	if (crtc_state->enable)
>   		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
>   
> -	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
> -
> -	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
> +	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
> +		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
> +		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
> +	} else if (drm_plane_solid_fill_enabled(plane_state)) {
> +		plane_state->visible = true;
> +	}
>   
>   	if (!plane_state->visible)
>   		/*
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..5f19a27ba182 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -861,8 +861,8 @@ static int __setplane_internal(struct drm_plane *plane,
>   
>   	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb) {
> +	/* No visible data means shut it down */
> +	if (!drm_plane_has_visible_data(plane->state)) {
>   		plane->old_fb = plane->fb;
>   		ret = plane->funcs->disable_plane(plane, ctx);
>   		if (!ret) {
> @@ -913,8 +913,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>   
>   	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb)
> +	/* No visible data means shut it down */
> +	if (!drm_plane_has_visible_data(plane->state))
>   		return plane->funcs->disable_plane(plane, ctx);
>   
>   	/*
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 536a0b0091c3..6d97f38ac1f6 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -256,8 +256,8 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
>   	 * Anything else should be considered a bug in the atomic core, so we
>   	 * gently warn about it.
>   	 */
> -	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
> -		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
> +	WARN_ON((new_plane_state->crtc == NULL && drm_plane_has_visible_data(new_plane_state)) ||
> +		(new_plane_state->crtc != NULL && !drm_plane_has_visible_data(new_plane_state)));
>   
>   	return old_plane_state->crtc && !new_plane_state->crtc;
>   }
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 73fb6cf8a5d9..f893f7a56912 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -998,6 +998,34 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
>   #define drm_for_each_plane(plane, dev) \
>   	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>   
> +/**
> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
> + * @state: plane state
> + *
> + * Returns:
> + * Whether the plane has been assigned a solid_fill_blob
> + */
> +static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
> +{
> +	if (!state)
> +		return false;
> +	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_COLOR && state->solid_fill_blob;
> +}
> +
> +static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
> +{
> +	switch (state->pixel_source) {
> +	case DRM_PLANE_PIXEL_SOURCE_COLOR:
> +		return state->solid_fill_blob != NULL;
> +
> +	default:

I'd say, there should a WARN_ON for the default case and then 
fallthrough to the FB case.

> +		return state->fb != NULL;
> +	}
> +
> +	return false;
> +}
> +
> +
>   bool drm_any_plane_has_format(struct drm_device *dev,
>   			      u32 format, u64 modifier);
>   
> 

-- 
With best wishes
Dmitry

