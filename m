Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949B4E99DE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EF210E6B9;
	Mon, 28 Mar 2022 14:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BD410E6B9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:39:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 i131-20020a1c3b89000000b0038ce25c870dso243118wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IciY3J08ETWW+H9vNbRqwZRtUTYnt03rhuYzUn68kqQ=;
 b=kkby3MJoYcJkVA5wq9wnbyS+sYQCPkLvNGyU0Nywq5UqCUJfJtxG+zrsr1Mvx+E/5Y
 lIDcBH/PLIGRh8STkSR4IZY20XlQ8K0KGGDAuIF411UXddHNAR40gcCwDQswSSaWAbm7
 hnpVPEqaZCAD1RjgW0psMCFngmglqun2UANdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IciY3J08ETWW+H9vNbRqwZRtUTYnt03rhuYzUn68kqQ=;
 b=LBj7KMrnmx98nIPM8W3Vl5wZQ2BJgqLZ1es3deuVkgGwtQsI4f9CamZY3uT4VsqmY6
 zqXaNUHvk0eCzc4yOXz3Yh/LLQ+BRPk+Rm19WfAPXKvr7897ItwKxbwGJI9uC2l7q5P6
 hnCzJL6AMN0bz3WKQqqMXnGKhdcEIrPX7kAVdsyTrOpPKYhX5XOOxrlluKycWrzs9B+4
 ir0DL6qDs319VymuOvz6Q1biIYkPGvo4Mo5yC0SX1Skc3lrmwBXbXVu1OxJbD0FK54cy
 efzpxZz/n4nFpQ7MUVZr9S/1wA0QMmCEBxdbO/Bh5R/sReBrp6S3ZSR2PMKalYRvBCoL
 4ebg==
X-Gm-Message-State: AOAM531cV/LnLU1sb01BsQJ8W7NR6muwA92bU6jp+Fmks/Eo07Xntjz7
 eb0UgbsuI5VbB+yQWaTQaFfbGg==
X-Google-Smtp-Source: ABdhPJy/MfEECOnlfRBr2thQ4483C9VGdoIChYG9t+tVIPtSOXWfu0sUce7a/5hjcjCd6zLnFplEqw==
X-Received: by 2002:a05:600c:3d86:b0:38d:581:89ad with SMTP id
 bi6-20020a05600c3d8600b0038d058189admr9153399wmb.42.1648478351971; 
 Mon, 28 Mar 2022 07:39:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a056000144f00b002057eac999fsm12845199wrx.76.2022.03.28.07.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:39:11 -0700 (PDT)
Date: Mon, 28 Mar 2022 16:39:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 1/4] drm/atomic: Print the state every non-blocking
 commit
Message-ID: <YkHIjZjOikQpVZjP@phenom.ffwll.local>
References: <20220328124304.2309418-1-maxime@cerno.tech>
 <20220328124304.2309418-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328124304.2309418-2-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 02:43:01PM +0200, Maxime Ripard wrote:
> The DRM_UT_STATE controls whether we're calling
> drm_atomic_print_new_state() whenever a new state is committed. However,
> that call is made in the drm_mode_atomic_ioctl(), whereas we have
> multiple users of the drm_atomic_commit() function in the kernel
> (framebuffer emulation, drm_atomic_helper_dirtyfb, etc.).
> 
> This leads to multiple states being committed but never actually
> displayed even though we asked to have verbose atomic state debugging.
> 
> Let's move the call to drm_atomic_print_new_state() to
> drm_atomic_commit() to make sure we don't miss any. Non-blocking commits
> were never logged though, and it would create too much churn in the logs
> to do so, so leave them out for now.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_atomic.c      | 4 ++++
>  drivers/gpu/drm/drm_atomic_uapi.c | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 88cd992df356..637df126c2d9 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1423,8 +1423,12 @@ EXPORT_SYMBOL(drm_atomic_check_only);
>  int drm_atomic_commit(struct drm_atomic_state *state)
>  {
>  	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_printer p = drm_info_printer(state->dev->dev);
>  	int ret;
>  
> +	if (drm_debug_enabled(DRM_UT_STATE))
> +		drm_atomic_print_new_state(state, &p);
> +
>  	ret = drm_atomic_check_only(state);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 9781722519c3..45e6d3c62a9a 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1326,7 +1326,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	struct drm_out_fence_state *fence_state;
>  	int ret = 0;
>  	unsigned int i, j, num_fences;
> -	struct drm_printer p = drm_info_printer(dev->dev);
>  
>  	/* disallow for drivers not supporting atomic: */
>  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
> @@ -1458,9 +1457,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	} else if (arg->flags & DRM_MODE_ATOMIC_NONBLOCK) {
>  		ret = drm_atomic_nonblocking_commit(state);
>  	} else {
> -		if (drm_debug_enabled(DRM_UT_STATE))
> -			drm_atomic_print_new_state(state, &p);
> -
>  		ret = drm_atomic_commit(state);
>  	}
>  
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
