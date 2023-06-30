Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF77431DA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E18E10E41D;
	Fri, 30 Jun 2023 00:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC810E41D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:43:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso1612258e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688085833; x=1690677833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3qjm9bsLZw72FoLoVYfydukfevECHErFvLnVeSIAhVQ=;
 b=NZ5lpaDUaeMv44a3yVZ1nMGDCrikyLMIPSqUHvPJjMHWGMe6RqM6btppqrDCKH7qk5
 pgnR6PBMPk5sL1/FRg6bNnjuCGThQPNV3kejm6hM8hPhbzagV6B/KGd0QPRVMUkmvFU+
 DV97Eu7P4qtbuoadwArP3kZ0hOmF0JtAC70qSVHdCDZcbfJr+lvvhFyeGCZhZQSBxMmA
 tI3yrRSI0AUw/+Ui9JB5MTcQPcH9DCrxduugb4gMLdaMFIVcgs/sxijWUZic2hmv8y8D
 jFy9rogtoJcOK4BYNLBcWc0VfolywAV7n3+1VMyyvZVcSmvosbuhCvRZDu3ojPlnijn/
 ynew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688085833; x=1690677833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3qjm9bsLZw72FoLoVYfydukfevECHErFvLnVeSIAhVQ=;
 b=VXr7ZDxx46mm5JVtBZSRQGbuY9zoQNzUK0jszMQPO0GFg7BRhY3aFMvlH2RKVWJZ6s
 6ScZVgU2iFbk6GfMPNR81IOmf7Y3sW5VT9bULkyBEVC3GhefWnCqCs7p6C3FaUY5wUVp
 Jkt0YGsNn6+rCROAfkslzNAYkGZTjYyPMk3EGqkAKFDMNUcZuS7RyxwX0dKllSVZuZP5
 GOoh8n4mKwKARsTEMMntCbKZpjVdPgVgOQbKknh330VnUqCPh1gKWm4zPqYcoK4NMHaP
 Kkw7Fq7tk4fZ0HdLsvhdyo2DtTy7Jdz9/3KryiH5ZGYEf9aZvBKlgZ2w0h8+tpnS3+Ge
 thWA==
X-Gm-Message-State: AC+VfDypu5kVVpE+X151nz1hiQttpo/UZn1ymDKbG8OvccmpqQD3Fjs4
 5C5Fd8VDDT93tO0poLkDQGX+3A==
X-Google-Smtp-Source: ACHHUZ4n2nq7exXxWcoNCfFWdfw3wDzWC7Oc3ufl+zBvSHS1VA+HuuZIE1FXuNdyTzCxIeKmI1yLwQ==
X-Received: by 2002:a05:6512:220d:b0:4fb:7371:3db6 with SMTP id
 h13-20020a056512220d00b004fb73713db6mr2108800lfu.29.1688085833576; 
 Thu, 29 Jun 2023 17:43:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a19520f000000b004fb88fffd19sm1127741lfb.146.2023.06.29.17.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:43:53 -0700 (PDT)
Message-ID: <49be4c4c-8143-a3bf-ddbd-364a2be81e4f@linaro.org>
Date: Fri, 30 Jun 2023 03:43:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 3/7] drm/atomic: Move framebuffer checks to helper
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-3-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-3-f4ec0caa742d@quicinc.com>
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
> Currently framebuffer checks happen directly in
> drm_atomic_plane_check(). Move these checks into their own helper
> method.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c | 130 ++++++++++++++++++++++++-------------------
>   1 file changed, 74 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index b4c6ffc438da..404b984d2d9f 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -580,6 +580,76 @@ plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>   	return true;
>   }
>   
> +static int drm_atomic_check_fb(const struct drm_plane_state *state)
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
> @@ -596,9 +666,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	struct drm_plane *plane = new_plane_state->plane;
>   	struct drm_crtc *crtc = new_plane_state->crtc;
>   	const struct drm_framebuffer *fb = new_plane_state->fb;
> -	unsigned int fb_width, fb_height;
> -	struct drm_mode_rect *clips;
> -	uint32_t num_clips;
>   	int ret;
>   
>   	/* either *both* CRTC and FB must be set, or neither */
> @@ -625,17 +692,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
> @@ -649,49 +705,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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

This doesn't only move code, but also changes semantics, making the 
checks optional if no FB is provided. Consider moving the condition to 
the next patch. Otherwise LGTM.

> +		ret = drm_atomic_check_fb(new_plane_state);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
> 

-- 
With best wishes
Dmitry

