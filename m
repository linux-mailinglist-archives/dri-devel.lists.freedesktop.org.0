Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2D65E2C0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 02:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568D910E61B;
	Thu,  5 Jan 2023 01:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8A610E620
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 01:57:30 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z26so53103848lfu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 17:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CF0r5PnaoluwFKXdtjXwWM7n3lcKzpRdAUhTbUDkBfc=;
 b=kR6al4pkKHIaLezOi2LM4ZvBqOy0Pc2fm78CshJuOVRDBVVS8LXpxbLvf1BLpDq/Yz
 FXvcecJBpAuZBUg0QKuHRcMCqP5RlWqcQkNBp+u8YRrjSANqDiQ5RHEQIUszUXkX71z8
 uCDBn1kv6stECVXsJMU55Mw6wmeUlb2yTgfJnWCn2jTRjMWmxfG9zku8kqAghE0Gbl3p
 46a1HCLDVx8pbD8SbYQJ2dUGlU6d/yX1012egs1W1L4d7PjEmOoqOsNuYFAajm6AIOK7
 RE3kRwyzTvn8BYv1b+GkJwg3xT4iBjaTjceSsnG0OuX2i4iQocH8f/4FC8GiTxXUXl5M
 tUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CF0r5PnaoluwFKXdtjXwWM7n3lcKzpRdAUhTbUDkBfc=;
 b=bwTpgetj1q+qeU/eQbwQfNF0xFhjR+89hsHliGEq5E6rEUQaTk5AwkhTd29KYedhkE
 kDO13r4PUOvAGtTwu57YFaB3xeuN5UxRoM9OYabKD4z6kM0LtLeCRaOX9h6/rmggKRZo
 3F12vpi9dXN55nFPfNOrvTeMYE7JeM0pdoQ1H9Ujlqu3XxMGF50oWSBcYKQsd4CDY4Uj
 HFJG9yPPfgYmP9gJT9MmLrNivXs64MX+yeIxVhgpzkJhMz8Sx28qll0kDgxfIU8FnxGZ
 DPpZSl6CGofTMptAAi4VP+Zp8tAbNbYxaeUY20AXw6pTj8w78D7T0MCG1rvhvtdiSGkr
 WVHg==
X-Gm-Message-State: AFqh2kqE5Amm8u+VW+7Sw0h/H+HmI8ITzjez9j+x/0rtNCEy/Wk/YcMX
 MBXWQiyJNUrGM4x2CUTCHrgKGA==
X-Google-Smtp-Source: AMrXdXsdRJ+FCeNtp1+qPhm8WUUxrE/G+6Kdpa6SWyNE2wl2RTzT1AONo6lKNNF13bRgyEkPJab1Ew==
X-Received: by 2002:ac2:5fce:0:b0:4b5:850e:6f4a with SMTP id
 q14-20020ac25fce000000b004b5850e6f4amr15743044lfg.69.1672883848427; 
 Wed, 04 Jan 2023 17:57:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e16-20020ac24e10000000b004b4ea0f4e25sm5265141lfr.301.2023.01.04.17.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 17:57:27 -0800 (PST)
Message-ID: <15db0937-4e1b-b30e-0625-d13ccd43dc84@linaro.org>
Date: Thu, 5 Jan 2023 03:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 2/3] drm: Adjust atomic checks for solid fill color
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104234036.636-3-quic_jesszhan@quicinc.com>
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2023 01:40, Jessica Zhang wrote:
> Loosen the requirements for atomic and legacy commit so that, in cases
> where solid fill planes is enabled (and FB_ID is NULL), the commit can
> still go through.
> 
> In addition, add framebuffer NULL checks in other areas to account for
> FB being NULL when solid fill is enabled.
> 
> Changes in V2:
> - Changed to checks for if solid_fill_blob is set (Dmitry)
> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>    (Dmitry)
> - Fixed indentation issue (Dmitry)
> 
> Changes in V3:
> - Created drm_plane_has_visible_data() helper and corrected CRTC and FB
>    NULL-check logic (Dmitry)
> - Merged `if (fb)` blocks in drm_atomic_plane_check() and abstracted
>    them into helper method (Dmitry)
> - Inverted `if (solid_fill_enabled) else if (fb)` check order (Dmitry)
> - Fixed indentation (Dmitry)
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 136 ++++++++++++++++------------
>   drivers/gpu/drm/drm_atomic_helper.c |  34 ++++---
>   drivers/gpu/drm/drm_plane.c         |   8 +-
>   include/drm/drm_atomic_helper.h     |   5 +-
>   include/drm/drm_plane.h             |  19 ++++
>   5 files changed, 124 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index f197f59f6d99..63f34b430479 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -580,6 +580,76 @@ plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>   	return true;
>   }
>   
> +static int drm_atomic_check_fb(const struct drm_plane_state *state)

This change should go to a separate patch. Please don't mix refactoring 
(moving of the code) with the actual functionality changes.

> +{
> +	struct drm_plane *plane = state->plane;
> +	const struct drm_framebuffer *fb = state->fb;
> +	struct drm_mode_rect *clips;
> +
> +	uint32_t num_clips;
> +	unsigned int fb_width, fb_height;
> +	int ret;
> +
> +	/* Check whether this plane supports the fb pixel format. */
> +	ret = drm_plane_check_pixel_format(plane, fb->format->format,
> +					   fb->modifier);
> +
> +	if (ret) {
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> +			       plane->base.id, plane->name,
> +			       &fb->format->format, fb->modifier);
> +		return ret;
> +	}
> +
> +	fb_width = fb->width << 16;
> +	fb_height = fb->height << 16;
> +
> +	/* Make sure source coordinates are inside the fb. */
> +	if (state->src_w > fb_width ||
> +	    state->src_x > fb_width - state->src_w ||
> +	    state->src_h > fb_height ||
> +	    state->src_y > fb_height - state->src_h) {
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] invalid source coordinates "
> +			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> +			       plane->base.id, plane->name,
> +			       state->src_w >> 16,
> +			       ((state->src_w & 0xffff) * 15625) >> 10,
> +			       state->src_h >> 16,
> +			       ((state->src_h & 0xffff) * 15625) >> 10,
> +			       state->src_x >> 16,
> +			       ((state->src_x & 0xffff) * 15625) >> 10,
> +			       state->src_y >> 16,
> +			       ((state->src_y & 0xffff) * 15625) >> 10,
> +			       fb->width, fb->height);
> +		return -ENOSPC;
> +	}
> +
> +	clips = __drm_plane_get_damage_clips(state);
> +	num_clips = drm_plane_get_damage_clips_count(state);
> +
> +	/* Make sure damage clips are valid and inside the fb. */
> +	while (num_clips > 0) {
> +		if (clips->x1 >= clips->x2 ||
> +		    clips->y1 >= clips->y2 ||
> +		    clips->x1 < 0 ||
> +		    clips->y1 < 0 ||
> +		    clips->x2 > fb_width ||
> +		    clips->y2 > fb_height) {
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> +				       plane->base.id, plane->name, clips->x1,
> +				       clips->y1, clips->x2, clips->y2);
> +			return -EINVAL;
> +		}
> +		clips++;
> +		num_clips--;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * drm_atomic_plane_check - check plane state
>    * @old_plane_state: old plane state to check
> @@ -596,13 +666,12 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	struct drm_plane *plane = new_plane_state->plane;
>   	struct drm_crtc *crtc = new_plane_state->crtc;
>   	const struct drm_framebuffer *fb = new_plane_state->fb;
> -	unsigned int fb_width, fb_height;
> -	struct drm_mode_rect *clips;
> -	uint32_t num_clips;
>   	int ret;
>   
> -	/* either *both* CRTC and FB must be set, or neither */
> -	if (crtc && !fb) {
> +	/* When solid_fill is disabled,
> +	 * either *both* CRTC and FB must be set, or neither
> +	 */
> +	if (crtc && !drm_atomic_has_visible_data(new_plane_state)) {
>   		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
>   			       plane->base.id, plane->name);
>   		return -EINVAL;
> @@ -625,17 +694,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   		return -EINVAL;
>   	}
>   
> -	/* Check whether this plane supports the fb pixel format. */
> -	ret = drm_plane_check_pixel_format(plane, fb->format->format,
> -					   fb->modifier);
> -	if (ret) {
> -		drm_dbg_atomic(plane->dev,
> -			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> -			       plane->base.id, plane->name,
> -			       &fb->format->format, fb->modifier);
> -		return ret;
> -	}
> -
>   	/* Give drivers some help against integer overflows */
>   	if (new_plane_state->crtc_w > INT_MAX ||
>   	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
> @@ -649,49 +707,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   		return -ERANGE;
>   	}
>   
> -	fb_width = fb->width << 16;
> -	fb_height = fb->height << 16;
>   
> -	/* Make sure source coordinates are inside the fb. */
> -	if (new_plane_state->src_w > fb_width ||
> -	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
> -	    new_plane_state->src_h > fb_height ||
> -	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
> -		drm_dbg_atomic(plane->dev,
> -			       "[PLANE:%d:%s] invalid source coordinates "
> -			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> -			       plane->base.id, plane->name,
> -			       new_plane_state->src_w >> 16,
> -			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
> -			       new_plane_state->src_h >> 16,
> -			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
> -			       new_plane_state->src_x >> 16,
> -			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
> -			       new_plane_state->src_y >> 16,
> -			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
> -			       fb->width, fb->height);
> -		return -ENOSPC;
> -	}
> -
> -	clips = __drm_plane_get_damage_clips(new_plane_state);
> -	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
> -
> -	/* Make sure damage clips are valid and inside the fb. */
> -	while (num_clips > 0) {
> -		if (clips->x1 >= clips->x2 ||
> -		    clips->y1 >= clips->y2 ||
> -		    clips->x1 < 0 ||
> -		    clips->y1 < 0 ||
> -		    clips->x2 > fb_width ||
> -		    clips->y2 > fb_height) {
> -			drm_dbg_atomic(plane->dev,
> -				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> -				       plane->base.id, plane->name, clips->x1,
> -				       clips->y1, clips->x2, clips->y2);
> -			return -EINVAL;
> -		}
> -		clips++;
> -		num_clips--;
> +	if (fb) {
> +		ret = drm_atomic_check_fb(new_plane_state);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 1a586b3c454b..804ae107ae59 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   	*src = drm_plane_state_src(plane_state);
>   	*dst = drm_plane_state_dest(plane_state);
>   
> -	if (!fb) {
> +	if (!fb && !drm_plane_solid_fill_enabled(plane_state)) {

You have the helper for this check.

>   		plane_state->visible = false;
>   		return 0;
>   	}
> @@ -881,25 +881,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   		return -EINVAL;
>   	}
>   
> -	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
> +	if (fb) {
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
> +	if (fb) {
> +		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
> +		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
> +	} else if (drm_plane_solid_fill_enabled(plane_state)) {
> +		plane_state->visible = true;
> +	}
>   
>   	if (!plane_state->visible)
>   		/*
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 33357629a7f5..bdce2acbef6a 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -856,8 +856,8 @@ static int __setplane_internal(struct drm_plane *plane,
>   
>   	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb) {
> +	/* No fb and no color fill means shut it down */
> +	if (!fb && !drm_plane_solid_fill_enabled(plane->state)) {

And here. And below.

>   		plane->old_fb = plane->fb;
>   		ret = plane->funcs->disable_plane(plane, ctx);
>   		if (!ret) {
> @@ -908,8 +908,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>   
>   	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb)
> +	/* No fb and no color fill means shut it down */
> +	if (!fb && !drm_plane_solid_fill_enabled(plane->state))
>   		return plane->funcs->disable_plane(plane, ctx);
>   
>   	/*
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 33f982cd1a27..a87997b3e0b5 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -230,8 +230,9 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
>   	 * Anything else should be considered a bug in the atomic core, so we
>   	 * gently warn about it.
>   	 */
> -	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
> -		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
> +	WARN_ON(((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||

This condition also needs to be adjusted.

> +		(new_plane_state->crtc != NULL &&
> +		 !drm_atomic_has_visible_data(new_plane_state))));
>   
>   	return old_plane_state->crtc && !new_plane_state->crtc;
>   }
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 3b9da06f358b..3bc6b8d73e8a 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -977,6 +977,25 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
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
> +	return state && state->solid_fill_blob;
> +}
> +
> +static inline bool
> +drm_atomic_has_visible_data(const struct drm_plane_state *state)
> +{
> +	return state->fb || state->solid_fill_blob;
> +}
> +
> +
>   bool drm_any_plane_has_format(struct drm_device *dev,
>   			      u32 format, u64 modifier);
>   

-- 
With best wishes
Dmitry

