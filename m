Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A4654B90
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 04:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CADA10E19E;
	Fri, 23 Dec 2022 03:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B1410E190
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 03:08:14 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id m29so5385117lfo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 19:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o1UV6wruw69Ye1iD8h8YhnhPFcrtqvBlw2UWKx2nwno=;
 b=kNeKKCQO3jAf4E0T6UwOsp0C8t+Svi8wtdB6KU4SGjHZ/0ZVEPnlAjiVFijl2nZxE9
 pGptVxBHiFJoMu+iPEw8QY03w5lbi5jq96hJnOblUpn4Fjvi+wzu7m1ztcXyYwdhUaVr
 cWtdjy49xQumsd0ZuorAeQX5abmCXtzFNpajR8TGpTbHkHn+y8kDKSNQkQ/4RFQRyHl3
 FIJryMEBFbU3W9AryZsgmWPuseI+2vPiZlrPSC76Qf4ZZI6UFvC0gZExWbSgTNM2Std9
 lQee9fIbPfiMKB8ZbTxEIHKy5zI8jIwlwUCRPjLX/9B1B+tVIU/fzAW/8rph9XJMosp6
 BFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o1UV6wruw69Ye1iD8h8YhnhPFcrtqvBlw2UWKx2nwno=;
 b=Hl0FgTFLVqyCHeTehJUMLATed/Yy38uQg4uiRovGYLgJv6cWPrsklrgbwnhzi7o1ze
 +hgttN0xZml7ftWLxb4ApszHnZel5UsqAHE27gd4gNvtEAmNHCUSuURP0/SKnIVSW24D
 jpigHhXeQy1JPW/RnkgwcC8PFm5fFs1fb0I/TXeSDeE9PwZ2aZQpv/b3w1xT7khjZD64
 Eya4NNOZ56ZcfWm4iugCcou7hD48+SYLcHIE74TSeOmo3rWsrWbvQijBi38S12Mg38ZE
 1LGf2npwsNs05LdBnx2NL6kUCL8NcZGz3KGQTR+P8vwgoeEyxiLxSVj0FYfPYoXywFYS
 osTg==
X-Gm-Message-State: AFqh2kqHJMvY7e+JAkruiPFbpKduBbZIF/6K6DyQBttJQFOGTFXPWR5L
 PCgBkaXHHLTxjxssCVgKwXtKag==
X-Google-Smtp-Source: AMrXdXtWABdbhRoLyaiJACiDpWaZXVVtkhyJbUguy2IsUCJy9W7j9w7I0W0zmiISO05yuWc+gDITjQ==
X-Received: by 2002:ac2:59c4:0:b0:4b6:f716:e832 with SMTP id
 x4-20020ac259c4000000b004b6f716e832mr2061473lfn.5.1671764892666; 
 Thu, 22 Dec 2022 19:08:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020ac25ecc000000b004b561202ea2sm315555lfq.182.2022.12.22.19.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 19:08:12 -0800 (PST)
Message-ID: <62913cff-8311-cb8c-a746-8e8e3b78d936@linaro.org>
Date: Fri, 23 Dec 2022 05:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 2/3] drm: Adjust atomic checks for solid fill color
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
 <20221222221441.6980-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221222221441.6980-3-quic_jesszhan@quicinc.com>
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

On 23/12/2022 00:14, Jessica Zhang wrote:
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
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 69 ++++++++++++++++-------------
>   drivers/gpu/drm/drm_atomic_helper.c | 34 ++++++++------
>   drivers/gpu/drm/drm_plane.c         |  8 ++--
>   include/drm/drm_atomic_helper.h     |  6 ++-
>   include/drm/drm_plane.h             | 12 +++++
>   5 files changed, 78 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index f197f59f6d99..b92d75bda7fd 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -601,8 +601,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	uint32_t num_clips;
>   	int ret;
>   
> -	/* either *both* CRTC and FB must be set, or neither */
> -	if (crtc && !fb) {
> +	/* When solid_fill is disabled,
> +	 * either *both* CRTC and FB must be set, or neither
> +	 */

The cause and effect logic seems to be broken here. I'd expect something 
like: "When CRTC is set, at least one of fb and solid_fill should be set."

Also it might be worth defining
bool drm_plane_has_visible_data(struct drm_plane_state *state)
{
    return state->fb || drm_plane_solid_fill_enabled(state);
}

Then you can use this function here and below, where you check both fb 
and solid_fill property.

> +	if (crtc && !fb && !new_plane_state->solid_fill_blob) {
>   		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
>   			       plane->base.id, plane->name);
>   		return -EINVAL;
> @@ -626,14 +628,17 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	}
>   
>   	/* Check whether this plane supports the fb pixel format. */
> -	ret = drm_plane_check_pixel_format(plane, fb->format->format,
> -					   fb->modifier);
> -	if (ret) {
> -		drm_dbg_atomic(plane->dev,
> -			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> -			       plane->base.id, plane->name,
> -			       &fb->format->format, fb->modifier);
> -		return ret;
> +	if (fb) {
> +		ret = drm_plane_check_pixel_format(plane, fb->format->format,
> +						   fb->modifier);
> +
> +		if (ret) {
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> +				       plane->base.id, plane->name,
> +				       &fb->format->format, fb->modifier);
> +			return ret;
> +		}

I'd suggest merging twof if(fb) blocks and extracting them to a separate 
functions.

>   	}
>   
>   	/* Give drivers some help against integer overflows */
> @@ -649,28 +654,30 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   		return -ERANGE;
>   	}
>   
> -	fb_width = fb->width << 16;
> -	fb_height = fb->height << 16;
> +	if (fb) {
> +		fb_width = fb->width << 16;
> +		fb_height = fb->height << 16;
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
> +		/* Make sure source coordinates are inside the fb. */
> +		if (new_plane_state->src_w > fb_width ||
> +		    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
> +		    new_plane_state->src_h > fb_height ||
> +		    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] invalid source coordinates "
> +				       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> +				       plane->base.id, plane->name,
> +				       new_plane_state->src_w >> 16,
> +				       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
> +				       new_plane_state->src_h >> 16,
> +				       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
> +				       new_plane_state->src_x >> 16,
> +				       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
> +				       new_plane_state->src_y >> 16,
> +				       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
> +				       fb->width, fb->height);
> +			return -ENOSPC;
> +		}
>   	}
>   
>   	clips = __drm_plane_get_damage_clips(new_plane_state);
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 1a586b3c454b..b53897f882c1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   	*src = drm_plane_state_src(plane_state);
>   	*dst = drm_plane_state_dest(plane_state);
>   
> -	if (!fb) {
> +	if (!fb && !drm_plane_solid_fill_enabled(plane_state)) {
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
> +	if (drm_plane_solid_fill_enabled(plane_state)) {
> +		plane_state->visible = true;
> +	} else if (fb) {
> +		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
> +		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
> +	}

I'd invert the order here:

if (fb)
    ....
else if (drm_plane_solid_fill_enabled(...)
    ....

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
> index 33f982cd1a27..16a2a8edcc68 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -230,8 +230,10 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
>   	 * Anything else should be considered a bug in the atomic core, so we
>   	 * gently warn about it.
>   	 */
> -	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
> -		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
> +	WARN_ON(!new_plane_state->solid_fill_blob &&
> +		((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
> +				(new_plane_state->crtc != NULL &&
> +				 new_plane_state->fb == NULL)));

Not quite. This means that if solid_fill_blob is set, then it doesn't 
matter whether crtc or fb is NULL.

Also please fix the indentation of your changes. Original code was 
logical, your indent is not.

>   
>   	return old_plane_state->crtc && !new_plane_state->crtc;
>   }
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index be5ab5f7b477..a9e6a09a75f7 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -977,6 +977,18 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
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
>   bool drm_any_plane_has_format(struct drm_device *dev,
>   			      u32 format, u64 modifier);
>   

-- 
With best wishes
Dmitry

