Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8C612277
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 13:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BD410E29B;
	Sat, 29 Oct 2022 11:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DC2892C1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 11:38:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g12so12266866lfh.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5DgHn3Z7VIIrkvwHvI3cH2+he+xn49YF+4LbfEWGgnY=;
 b=pn/MimPyr3KtEIwqEQP3Ou4NTHCEmJaiZ/vbqVItiKchXCdYnHEazYzKDU8wYAPZ5w
 HhVdcW1vBAUkX+jUc/6Glpb+Jt3tTBGBCkKscu9CUJ367YjsncbaFz6MU8SMvH6UJ8re
 hL28QRR08pOexZptsE3RCdsJJVO0NLjB7jLiDFCUkPOGvlXVPPAfsTL99kf7Hlwsm3I+
 zE2X5+7nTCdnn+pPQze7JEqmT6NSRkpXENf80CYUFLoKjfwnr4tn7p5LCsjnfN+n6s3M
 qzLdmVf6FKFLKq+HCWPfVd3x6Ai0fvzESq/Eb9d1L9ge7HYMFYGC/ScIY/3MD5ZHfc0w
 Hlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DgHn3Z7VIIrkvwHvI3cH2+he+xn49YF+4LbfEWGgnY=;
 b=xp3ImowzGWx7N17+Um15GIIcOIDxUKUBeE3Jq0pmQDXRW1GjJf1T8EU7Z70mYYf92e
 hRY4kFA7aOH6Us6f/1hBlZ4ZipwrkNORl+LXPVDxzXKTasQRKrRO8MsMr8ESraJt2Tpv
 s6Hi4DjD3j9SJUuOqKGywjfBPUuhWEvVGyIvdZ0mUrN3YR1+SJ5hXbb0VutRoFQIjr6x
 yFiRCO++KeKcZrzXZO3rdkahlXZow8DcD35RFsfq8NFJtrTW5TcI4QawfiF5ZhAHBZv2
 Y5v2QlXeL0kfaGknXuBdNEKfHfKWXxG2ubnUqfHBuuZiP5s16s7slJDT25sEw0LuB3JV
 cTXQ==
X-Gm-Message-State: ACrzQf03jdM80kvissDwaX1+8Kkq8WRuUdQQa3dlJ0H486I3uf7MrDt6
 oJPBB9NT6AWjuIr5LCI383K+2g==
X-Google-Smtp-Source: AMsMyM5bl10gUymnR8n+17He2i8b/8Ci7vNOk4s3ZIr6XOoMwyhinChtBKnm5fNdcEhx2MPyHWfbTg==
X-Received: by 2002:a05:6512:2350:b0:4a2:4523:cd08 with SMTP id
 p16-20020a056512235000b004a24523cd08mr1664787lfu.231.1667043508770; 
 Sat, 29 Oct 2022 04:38:28 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 bf43-20020a05651225ab00b00497a191bf23sm241466lfb.299.2022.10.29.04.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 04:38:28 -0700 (PDT)
Message-ID: <8d375543-846a-59b0-0bd5-061c31b32d02@linaro.org>
Date: Sat, 29 Oct 2022 14:38:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 2/3] drm: Adjust atomic checks for solid fill color
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028225952.160-3-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/10/2022 01:59, Jessica Zhang wrote:
> Loosen the requirements for atomic and legacy commit so that, in cases
> where solid fill planes is enabled (and FB_ID is NULL), the commit can
> still go through.
> 
> In addition, add framebuffer NULL checks in other areas to account for
> FB being NULL when solid fill is enabled.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 68 ++++++++++++++++-------------
>   drivers/gpu/drm/drm_atomic_helper.c | 34 +++++++++------
>   drivers/gpu/drm/drm_plane.c         |  8 ++--
>   include/drm/drm_atomic_helper.h     |  5 ++-
>   4 files changed, 64 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index f197f59f6d99..b576ed221431 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -601,8 +601,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	uint32_t num_clips;
>   	int ret;
>   
> -	/* either *both* CRTC and FB must be set, or neither */
> -	if (crtc && !fb) {
> +	/* When color_fill is disabled,
> +	 * either *both* CRTC and FB must be set, or neither
> +	 */
> +	if (crtc && !fb && !new_plane_state->color_fill) {

Using !color_fill sounds bad. It would disallow using black as the plane 
fill color. I think, you need to check color_fill_format instead.

>   		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
>   			       plane->base.id, plane->name);
>   		return -EINVAL;
> @@ -626,14 +628,16 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	}


Don't we need to check that the color_fill_format is supported too?

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
> +		if (ret)
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> +				       plane->base.id, plane->name,
> +				       &fb->format->format, fb->modifier);
> +			return ret;
>   	}
>   
>   	/* Give drivers some help against integer overflows */
> @@ -649,28 +653,30 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
> index 8bf41aa24068..5a5ffa06b8bd 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -818,7 +818,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   	*src = drm_plane_state_src(plane_state);
>   	*dst = drm_plane_state_dest(plane_state);
>   
> -	if (!fb) {
> +	if (!fb && !plane_state->color_fill) {
>   		plane_state->visible = false;
>   		return 0;
>   	}
> @@ -835,25 +835,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
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
> +			    	"Invalid scaling of plane\n");
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
> +	} else if (plane_state->color_fill) {
> +		plane_state->visible = true;
> +	}
>   
>   	if (!plane_state->visible)
>   		/*
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 726f2f163c26..223b5ed93d3a 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -850,8 +850,8 @@ static int __setplane_internal(struct drm_plane *plane,
>   
>   	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb) {
> +	/* No fb and no color fill means shut it down */
> +	if (!fb && (plane->state && !plane->state->color_fill)) {

I'd suggest abstracting this to a helper function, which can then be 
used in drm_atomic_plane_check() too.

>   		plane->old_fb = plane->fb;
>   		ret = plane->funcs->disable_plane(plane, ctx);
>   		if (!ret) {
> @@ -902,8 +902,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>   
>   	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>   
> -	/* No fb means shut it down */
> -	if (!fb)
> +	/* No fb and no color fill means shut it down */
> +	if (!fb && (plane->state && !plane->state->color_fill))
>   		return plane->funcs->disable_plane(plane, ctx);
>   
>   	/*
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 2a0b17842402..aa7576f0879d 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -219,8 +219,9 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
>   	 * Anything else should be considered a bug in the atomic core, so we
>   	 * gently warn about it.
>   	 */
> -	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
> -		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
> +	WARN_ON(!new_plane_state->color_fill &&
> +			((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
> +			(new_plane_state->crtc != NULL && new_plane_state->fb == NULL)));

Please fix the indentation.

>   
>   	return old_plane_state->crtc && !new_plane_state->crtc;
>   }

-- 
With best wishes
Dmitry

