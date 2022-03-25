Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E84E7A7F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 20:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ED110E425;
	Fri, 25 Mar 2022 19:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02DF10E425
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 19:50:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a1so12191065wrh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S/wVcDrq3uNie/PrY99wuEpqr3aLdYXUuAQIQEhJUoM=;
 b=QUUOaJcu7PNuY3/lgewpoUwntZJKp/nEV1itoQ/J4lyhApx6Ku5e8c0YmZeT57zfeV
 YdL1yd9+SYumLbehoOpRwZRehNBZek6QobhsJ9en6T8hUENJKHjezLqNBuG8eUk/hilE
 /JdMuy058igCaP7HLK7Jkvy6hvfwUkS//yWDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S/wVcDrq3uNie/PrY99wuEpqr3aLdYXUuAQIQEhJUoM=;
 b=rrHutN/t3ulUhyYai3QXket7uQw41Ow2c3NDwEjuqmTKI8i94/wc0TQkyUfPbvKvY1
 0Wi7i+pt1Tz6amG4DJIfXStVzfGZkBNFJ2GJ+uq64WYeQpUtp+491gJV3oZyBZhFj37b
 hr1i9yNX2hfaAoFu25+WH21Xe0/QBEZnFpn1fJnXL/VI298bOyfRaxCwLJTD0wX6Mi9z
 Y8T1pVRClOld+qH+n3NlqGaKm8hvZLAx11HhqZLW4f++LUqNjQR6WBBII7w4p5LA5cS/
 aVh/5ggrmsSvWDlGRWFjFtfagviFM2j/3jEXquztU3AfbeXcrbJoUILfnUUflq97tPJA
 WoDw==
X-Gm-Message-State: AOAM531jCjAhCx8yNZuZ7g4FRp4At/7/J4Cwb0JFsk8PO414mSlrfuKD
 B0GkqSaDfyjvrlJwi+cADJKaJT3RoxJzBnSc
X-Google-Smtp-Source: ABdhPJxxl6hC6sXqlp8sZ2WE6HBziwcaOFuxNv4chbOWvC8HJa0VJk6Z7s42M8nRusSQIxGncWw4zg==
X-Received: by 2002:adf:dcd1:0:b0:205:7afc:4b53 with SMTP id
 x17-20020adfdcd1000000b002057afc4b53mr10593319wrm.40.1648237846013; 
 Fri, 25 Mar 2022 12:50:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8921509wmb.15.2022.03.25.12.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:50:45 -0700 (PDT)
Date: Fri, 25 Mar 2022 20:50:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 1/4] drm/atomic: Print the state every commit
Message-ID: <Yj4dE+XVcvuRi/vF@phenom.ffwll.local>
References: <20220325124822.1785070-1-maxime@cerno.tech>
 <20220325124822.1785070-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325124822.1785070-2-maxime@cerno.tech>
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

On Fri, Mar 25, 2022 at 01:48:19PM +0100, Maxime Ripard wrote:
> The DRM_UT_STATE controls whether we're calling
> drm_atomic_print_new_state() whenever a new state is committed. However,
> that call is made in the drm_mode_atomic_ioctl(), whereas we have
> multiple users of the drm_atomic_commit() function in the kernel
> (framebuffer emulation, drm_atomic_helper_dirtyfb, etc.). Similarly,
> it's only called for a blocking atomic commit.
> 
> This leads to multiple states being committed but never actually
> displayed even though we asked to have verbose atomic state debugging.
> 
> Let's move the call to drm_atomic_print_new_state() to
> drm_atomic_commit() to make sure we don't miss any.

Commit message doesn't match the patch anymore.

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_atomic.c      | 4 ++++
>  drivers/gpu/drm/drm_atomic_uapi.c | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 88cd992df356..73865c147b4b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1423,6 +1423,7 @@ EXPORT_SYMBOL(drm_atomic_check_only);
>  int drm_atomic_commit(struct drm_atomic_state *state)
>  {
>  	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_printer p = drm_info_printer(state->dev->dev);
>  	int ret;
>  
>  	ret = drm_atomic_check_only(state);
> @@ -1431,6 +1432,9 @@ int drm_atomic_commit(struct drm_atomic_state *state)
>  
>  	drm_dbg_atomic(state->dev, "committing %p\n", state);
>  
> +	if (drm_debug_enabled(DRM_UT_STATE))
> +		drm_atomic_print_new_state(state, &p);

Just realized that this changes things now, you no longer print the state
when it fails the atomic check. Not sure we want that behaviour change ...
-Daniel

> +
>  	return config->funcs->atomic_commit(state->dev, state, false);
>  }
>  EXPORT_SYMBOL(drm_atomic_commit);
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
