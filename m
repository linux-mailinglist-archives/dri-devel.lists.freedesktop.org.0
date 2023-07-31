Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0C768AAC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 06:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479E10E180;
	Mon, 31 Jul 2023 04:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706A110E182
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 04:11:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe0eb0ca75so6379015e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 21:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690776703; x=1691381503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zsess/8JJrHTnk1M2sCbsEz2P3ISuJ+vZA0sFdsXBAU=;
 b=O90L/at68+T5y2rldkivkDCw0gbH7IqRrlaL0FBM78DaxnNIt67UB40sFh0Xww5L2k
 PMKEeZ29NHA+6HmZQqZE9svXYrF1jwFpI+CkHcjZuvhqfW5gr9Z11JcDtsjQOeqBg9P+
 LINugW1bAUwm/2l3KwlmDlhhMRAi6u7Xq3vNwNxJaa6F3849i3/5so4WmNCPJG4w2hk1
 N/EXPNHPIfWyQFEZID9FdWau0opUfsk/2tid5BBWcmsSirscrrRx+EoGX4c68XDQ98hC
 qdsgRiZFaPhs3YH9yM1i7eK+ZZKTtU8V8UNvSY9VvufkHodYjFXAm499v+5CIIMp4Na/
 7lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690776703; x=1691381503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zsess/8JJrHTnk1M2sCbsEz2P3ISuJ+vZA0sFdsXBAU=;
 b=DXr5+6zP4L/w5aJ9f3y1NwIa25FBvS5xVUR3qwgCYaBa0xdHwLgqudlC3FX5DyN2Fs
 njlD7Cu8EJIr/SVBlDidjASnSwvGIj48UNqbiPiPu21jkK0UmxL93Kn/jyXCx+wR/gjc
 6VdbwOK+hNo9OLWoxWoBFvu+i0Ly9Uz1BSyvMpptdRVljT2UTeodGZLop0tVUSC8boA1
 2BoZ8vL/E84FC+EcOO73zUy79Ur4CFEtuu9hT/mDJ02/gsVvloMCszesFRsxtFKgURcq
 iNZEwMWEKCFPAmD6RQ/K9SdLBRSgxMCEjomoKGrfCU2hreIWf5JUalXZi1HUK+zA4NAI
 1x4w==
X-Gm-Message-State: ABy/qLZM82+4euVEN1S+20OJ1NlroFM+fymsdGr0qaXrGX+o4KEFFTBo
 RA4v+X2N+zfM8XzErm3+I+b01g==
X-Google-Smtp-Source: APBJJlHMhth9LvtXCpSOPC+KGRoPtSJPJdykVuWLgwpUfwb1CNiECcYILT70wHHSP43bFTCrO80arw==
X-Received: by 2002:a19:6408:0:b0:4fe:df7:bcf5 with SMTP id
 y8-20020a196408000000b004fe0df7bcf5mr4824235lfb.8.1690776703130; 
 Sun, 30 Jul 2023 21:11:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a056512024300b004fe28168cd1sm988937lfo.155.2023.07.30.21.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 21:11:42 -0700 (PDT)
Message-ID: <d5644f7e-c96f-d4b1-cc17-8b20b8570298@linaro.org>
Date: Mon, 31 Jul 2023 07:11:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v5 07/10] drm/atomic: Loosen FB atomic checks
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-7-053dbefa909c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728-solid-fill-v5-7-053dbefa909c@quicinc.com>
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

On 28/07/2023 20:02, Jessica Zhang wrote:
> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source != FB, the commit can still go through.
> 
> This includes adding framebuffer NULL checks in other areas to account
> for FB being NULL when non-FB pixel sources are enabled.
> 
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source == FB.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
>   drivers/gpu/drm/drm_atomic_helper.c | 34 ++++++++++++++++++++--------------
>   drivers/gpu/drm/drm_plane.c         | 16 ++++++++++++----
>   include/drm/drm_atomic_helper.h     |  4 ++--
>   include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++++
>   5 files changed, 74 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 017ce0e6570f..b0c532f3db82 100644
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
> @@ -706,9 +706,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	}
>   
>   
> -	ret = drm_atomic_check_fb(new_plane_state);
> -	if (ret)
> -		return ret;
> +	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
> +		ret = drm_atomic_check_fb(new_plane_state);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
>   		drm_dbg_atomic(plane->dev,
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

You can unify this with the previous if condition, it will be more logical.

> +		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
> +		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
> +	} else if (drm_plane_solid_fill_enabled(plane_state)) {
> +		plane_state->visible = true;
> +	}
>   
>   	if (!plane_state->visible)
>   		/*
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 009d3ebd9b39..8f759f546aae 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -839,6 +839,14 @@ bool drm_any_plane_has_format(struct drm_device *dev,
>   }
>   EXPORT_SYMBOL(drm_any_plane_has_format);
>   
> +static bool drm_plane_needs_disable(struct drm_plane_state *state, struct drm_framebuffer *fb)
> +{
> +	if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_NONE)
> +		return true;
> +
> +	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb == NULL;
> +}
> +
>   /*
>    * __setplane_internal - setplane handler for internal callers
>    *
> @@ -861,8 +869,8 @@ static int __setplane_internal(struct drm_plane *plane,
>   
>   	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb) {
> +	/* No visible data means shut it down */
> +	if (drm_plane_needs_disable(plane->state, fb)) {
>   		plane->old_fb = plane->fb;
>   		ret = plane->funcs->disable_plane(plane, ctx);
>   		if (!ret) {
> @@ -913,8 +921,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>   
>   	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb)
> +	/* No visible data means shut it down */
> +	if (drm_plane_needs_disable(plane->state, fb))
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
> index 303f01f0588c..9ff2a837ed17 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -991,6 +991,35 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
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
> +	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL && state->solid_fill_blob;
> +}
> +
> +static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
> +{
> +	switch (state->pixel_source) {
> +	case DRM_PLANE_PIXEL_SOURCE_NONE:
> +		return false;
> +	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
> +		return state->solid_fill_blob != NULL;
> +	case DRM_PLANE_PIXEL_SOURCE_FB:
> +	default:
> +		WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
> +	}
> +
> +	return state->fb != NULL;
> +}
> +
>   bool drm_any_plane_has_format(struct drm_device *dev,
>   			      u32 format, u64 modifier);
>   
> 

-- 
With best wishes
Dmitry

