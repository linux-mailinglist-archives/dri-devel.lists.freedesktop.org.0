Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB58A3892F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F2610E052;
	Mon, 17 Feb 2025 16:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OI3WTMQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D179E10E052
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:33:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f26a82d1dso2099644f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739809993; x=1740414793; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Czo+abDjGEXjXRngmG8KE7G58bH+0TPX+ShC6kAE364=;
 b=OI3WTMQ4W/7c5dPBTMd4W8UwwemJbVdieT2zrU5mfflgHn5QYoYhK/tzSj29D1PuMM
 ok/NoK8SEy3ZKSkf2i47KkaaEsB/11CIE4qA1uD3ompOA5tymqVGna9xjMDHc6YYnUMt
 d0SqKA4Mwg8WGRmmpLAxmjCE71NgfzmhYyNk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739809993; x=1740414793;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Czo+abDjGEXjXRngmG8KE7G58bH+0TPX+ShC6kAE364=;
 b=uWPcqZvZA5soZUd2NjKZs5/k6KI3EisqQiKFzK9WQfEdNnFuh1C88xETzyEbXWUKay
 klmOZTvg6sn22YDOhJgE3ddozlDIFJTQmK8SYBY5q3/TJAuN/KLTN1Lph/wd1/uNRGXi
 pByfW+kBW43xRa1KRdGgfJemeCUTHNVBLNOj/28tnxUD8TT/PcAa+BmdhwZrWJhUC6X+
 XnyX9f2xCeIso2CvCU4O9uZXs4TJHI4F3dvC+RZ6oakpVlNzklMB3/Z0YE4R2VDqKoWx
 sGnMfmT2e4w5LQuV9T864iKMzUDtOdpgVDt1NZ/eAjX2o5qToDUYQHBQEfXXEbkUleYU
 f2lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4byfEmwukv6G+FPYPHRcrOUMyoXwafgwnplY233+cfbaDDi3t7WGZNyZY6JSnW1KtPIWY/RMwnuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytUw7jIU/dCOBO3QHrm2npUrfYH4LOtqx1VxIN/ASDGNd04zrB
 2wy8W+RdqNOnyw4ksqMrBlTHQ8J7OLQ+Zi1s6iV0gFWK6/hDxyayZHvpexRigRg=
X-Gm-Gg: ASbGncs9qNvwYQP94FMCTdqSXrpR6N88R1g/iNRsox15bnQYswRJSxyDxXwVfnAUnJw
 nqaspaQUyMCuYsvcZ+0duhQX8uX+mCrAvBkFqYbR3xS2os6tywYYrVyJAf5c/VfOkPwU/T5ioOG
 nFG5aZ5eNuXlPw8fAqXiUTeYNYH6LnO4ZImTfspgoICCXKWlWXXtL2TdZkE7QdjfBrW2i+xV5Tl
 aI/0cGkAjDM/FoGHIpy6UkSgveepYYmN+qKLC8Is8O/cKJj/SHC7QsksDZSnftHFq9MkRBcsXgv
 njV3TXkX/rBnWtIctev5HQd5tPM=
X-Google-Smtp-Source: AGHT+IF/zPnB9i/djSQzx6Nft2LwuPmMRw3hmVUFnih+2dJwvP4POCL/t/vyntRmA+wiKTPgwSfABw==
X-Received: by 2002:a5d:452e:0:b0:385:e1eb:a7af with SMTP id
 ffacd0b85a97d-38f33f57dc0mr7697565f8f.48.1739809993189; 
 Mon, 17 Feb 2025 08:33:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439858ec5fasm30572795e9.29.2025.02.17.08.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:33:11 -0800 (PST)
Date: Mon, 17 Feb 2025 17:33:09 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v3 01/37] drm/atomic: Document history of drm_atomic_state
Message-ID: <Z7NkxTHVQzzSHv1B@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-1-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-1-e71598f49c8f@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Feb 13, 2025 at 03:43:20PM +0100, Maxime Ripard wrote:
> After some discussions on the mailing-list for an earlier revision of
> the series, it was suggested to document the evolution of
> drm_atomic_state and its use by drivers to explain some of the confusion
> one might still encounter when reading the framework code.
> 
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Link: https://lore.kernel.org/dri-devel/Z4jtKHY4qN3RNZNG@phenom.ffwll.local/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Thanks for documenting that little bit of lore!

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

> ---
>  include/drm/drm_atomic.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 1ded9a8d4e84d7d9879d7f60a876ba9d69785766..4c673f0698fef6b60f77db980378d5e88e0e250e 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -355,10 +355,41 @@ struct __drm_private_objs_state {
>   * these.
>   *
>   * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
>   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
>   * private state structures, drm_atomic_get_private_obj_state().
> + *
> + * NOTE: struct drm_atomic_state first started as a single collection of
> + * entities state pointers (drm_plane_state, drm_crtc_state, etc.).
> + *
> + * At atomic_check time, you could get the state about to be committed
> + * from drm_atomic_state, and the one currently running from the
> + * entities state pointer (drm_crtc.state, for example). After the call
> + * to drm_atomic_helper_swap_state(), the entities state pointer would
> + * contain the state previously checked, and the drm_atomic_state
> + * structure the old state.
> + *
> + * Over time, and in order to avoid confusion, drm_atomic_state has
> + * grown to have both the old state (ie, the state we replace) and the
> + * new state (ie, the state we want to apply). Those names are stable
> + * during the commit process, which makes it easier to reason about.
> + *
> + * You can still find some traces of that evolution through some hooks
> + * or callbacks taking a drm_atomic_state parameter called names like
> + * "old_state". This doesn't necessarily mean that the previous
> + * drm_atomic_state is passed, but rather that this used to be the state
> + * collection we were replacing after drm_atomic_helper_swap_state(),
> + * but the variable name was never updated.
> + *
> + * Some atomic operations implementations followed a similar process. We
> + * first started to pass the entity state only. However, it was pretty
> + * cumbersome for drivers, and especially CRTCs, to retrieve the states
> + * of other components. Thus, we switched to passing the whole
> + * drm_atomic_state as a parameter to those operations. Similarly, the
> + * transition isn't complete yet, and one might still find atomic
> + * operations taking a drm_atomic_state pointer, or a component state
> + * pointer. The former is the preferred form.
>   */
>  struct drm_atomic_state {
>  	/**
>  	 * @ref:
>  	 *
> 
> -- 
> 2.48.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
