Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A13B975CF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 21:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C8B10E198;
	Tue, 23 Sep 2025 19:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s28hwR+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBF710E198
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 19:35:37 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-62f4a8dfadcso7182064a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758656136; x=1759260936; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qdwjSx6yqDrwznedzComO+rifSLut17oWkmQ13N72Tc=;
 b=s28hwR+umgUiSCuflwtPbUwxBVYdhEbcjoem6EWF9T9HX1T5T5KLISxflpl0HeOIT0
 p9oN0dqq52sCJPBaFerqa8HTZhicdaQb+coILTRwW9rSZ5UxrHWG4SPthSQ4O/HVAvJu
 ff+gErKsXb9dWN5bSp9i9nDne8D19S/gyg6SoWL7uP+OtcRkbulpZWXGopotXKhPPkTD
 ZIM+aHSoQ8GSW4Zw4NE4B8cLpCqbprH/cvMalJDHR3vCn5PYH3o1AhRpSVc/53ixlE3H
 lB2WWOGeFJJBQN1RORJck9CAFbIxhDt01lk9qntXtgQEV2sTgVyjkC8VGU3fSRaw/DU9
 wqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758656136; x=1759260936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdwjSx6yqDrwznedzComO+rifSLut17oWkmQ13N72Tc=;
 b=vK8f3ZCA1h4NLBWGhQkWm+NWaLQVGeLPcgDMOmALYtJdJz+164B2/tID35cPI8IWic
 MvfLyQO8UyPQxlMUUwJtoAWH0XmoVArFKd1wipdP7YwxPMQTC2AbqYvpy94EgNWnZUE9
 uLXn//qsQRuq4tKeEaXdYdcI5VwIhCcaKTNEbrmbKgn6AC1MUCnxsIwpQtlvwd4xUMqb
 iDxdVPc4yRcV3C+uehco8VSYzaazq+P2NKPVZYU4bRb9mW0q/NjPay1uRSo9Ln2hmiWF
 92XDgIYBhHdO0GS6GSqwxLKrfCGBNXUa1KtXxe/KzOIvqaPIK9HZYPGkE3BclnwDvNqz
 m+UQ==
X-Gm-Message-State: AOJu0YyFAZ4OGOwKw7a9Q8wPc19qTGzMiZEOfZACwBuas31M1zPsM4ZM
 MLXDp4ahOA3yoW/GLDXjksUuui8mQZZZT7AToKNEW9vj4kjeVHIVUFprmT6H/6kvP20=
X-Gm-Gg: ASbGncu0WyjGnlozF+tGl+TqmVu7czJtlxDaT9YH32Gc5wuTYsnH/eAjW+BCM4e9lle
 t1CZej3wViDMexjTT2jwMmmO/v82pM38rSZc8MGIO1kypnFGmvlTxPTL8v2ICYNSNYvibz9Wx9J
 UUd9FoR4gcdXNyOrlK0PTM2ziB7JHt+CIg4+G6LP1/rEkaJzApseFi1jIAkeROBNUCTa/DfNKZP
 G3boYi/o+ZkHve/39QpoW2ldysANoPlE4pjUCqaHzf2Up0CmeimAkjD/gG5YBu+iEA/6l/wMHDH
 daF44J071GlUEDy9GukErk/OTCX94vi8u+yymq1dV4V4MJPYeTwmTmGp3KUoBr3Do2MM+wVedMJ
 z0NsiahTSUVF6FP6Kw1pq2VhRWvWdrnEl
X-Google-Smtp-Source: AGHT+IGlCvK6yuqIUQUFOgGwHK0uqqneA6mTN1hmeGJkoLmdyjKHvGizIk+emNFkQbBfTqMzUbXl5A==
X-Received: by 2002:a17:907:d25:b0:b0e:8cd4:e2d3 with SMTP id
 a640c23a62f3a-b302705ebc2mr337045066b.19.1758656136185; 
 Tue, 23 Sep 2025 12:35:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:bd4e:c20d:5910:982f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b27217f616esm995766666b.72.2025.09.23.12.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 12:35:35 -0700 (PDT)
Date: Tue, 23 Sep 2025 21:35:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
Message-ID: <aNL2g40S03YUs9wR@linaro.org>
References: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
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

On Tue, Sep 23, 2025 at 07:04:40AM -0700, Rob Clark wrote:
> Imported dma-bufs also have obj->resv != &obj->_resv.  So we should
> check both this condition in addition to flags for handling the
> _NO_SHARE case.
> 
> Fixes this splat that was reported with IRIS video playback:
> 
>     ------------[ cut here ]------------
>     WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
>     CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT
>     pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>     pc : msm_gem_free_object+0x1f8/0x264 [msm]
>     lr : msm_gem_free_object+0x138/0x264 [msm]
>     sp : ffff800092a1bb30
>     x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
>     x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
>     x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
>     x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
>     x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
>     x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>     x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
>     x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
>     x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
>     x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
>     Call trace:
>      msm_gem_free_object+0x1f8/0x264 [msm] (P)
>      drm_gem_object_free+0x1c/0x30 [drm]
>      drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
>      drm_gem_object_release_handle+0x5c/0xcc [drm]
>      drm_gem_handle_delete+0x68/0xbc [drm]
>      drm_gem_close_ioctl+0x34/0x40 [drm]
>      drm_ioctl_kernel+0xc0/0x130 [drm]
>      drm_ioctl+0x360/0x4e0 [drm]
>      __arm64_sys_ioctl+0xac/0x104
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x34/0xec
>      el0t_64_sync_handler+0xa0/0xe4
>      el0t_64_sync+0x198/0x19c
>     ---[ end trace 0000000000000000 ]---
>     ------------[ cut here ]------------
> 
> Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Perhaps also add

Closes: https://lore.kernel.org/r/aNF6N8u1VIFSTaRM@linaro.org/

when applying.

Thanks!
Stephan

> Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 9f0f5b77f1bd..3aea9b493375 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>  		put_pages(obj);
>  	}
>  
> -	if (obj->resv != &obj->_resv) {
> +	/*
> +	 * In error paths, we could end up here before msm_gem_new_handle()
> +	 * has changed obj->resv to point to the shared resv.  In this case,
> +	 * we don't want to drop a ref to the shared r_obj that we haven't
> +	 * taken yet.
> +	 */
> +	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
>  		struct drm_gem_object *r_obj =
>  			container_of(obj->resv, struct drm_gem_object, _resv);
>  
> -		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> -
>  		/* Drop reference we hold to shared resv obj: */
>  		drm_gem_object_put(r_obj);
>  	}
> -- 
> 2.51.0
> 
