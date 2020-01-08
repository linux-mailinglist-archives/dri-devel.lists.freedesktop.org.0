Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EFB134AFA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 19:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB0589E50;
	Wed,  8 Jan 2020 18:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3029589E32
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 18:52:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m24so20290wmc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eN+hXr5eBKpt1ztp3NuaboZ7DHSPkAz5GKoRsde+TT4=;
 b=XMM6zGO1EO3trQQoyvOMb4qSTOIfv57RK7vkC7tFnQ+RYj1va/QNSJfervVIMsSceW
 40SV/C8QiJeglg46Za9VvO1fWS6GNDBORleOlrIXRDWZJz1jso0jBEj10fWHqlM6J5Ts
 KThwjWnrINw8j6Hw9qYjpYnEiNRLpEknKyDiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eN+hXr5eBKpt1ztp3NuaboZ7DHSPkAz5GKoRsde+TT4=;
 b=khejhEnqEdPL76DpQzBtTxPMTHD6bULKhX81UHt6EeV7jj/UAJYhwI3qWOiDiC1qY5
 /wCCvnyddqWHgvEovO8oN8ugwOF9yEU3wdTyzmjOu5ovDhaygwoffGa9NdiJuJAhXsMu
 kdWsFvbwO4Ej/lObE6+uQnF0/ZJ36+y4/7Ro7+mLdl9v3eYcAwcrn7Rz/bWvhE/1pjjp
 lDfpC2JQ4t0n4wDDJOB0plS2N1v+L9GHKNWSShj0NnB8jndok8LoJJWtqDVwI5i2uDrt
 PvX9naCJgHidsR3PtJw4GN45zoY2QHa6jizovYxUDF1tQYBlPkcOuMKoAakLwHHmTHqD
 5sbg==
X-Gm-Message-State: APjAAAXHViIm1MEHNo3bjQbxGmGpw6Yvpf69Esoc5tqxL8WH/vC9Cjso
 u0zfEKk5repiWuew2LcU+D8gKA==
X-Google-Smtp-Source: APXvYqx7yGU3B6sFjaxjZa1yKnn8UVAi8M+Lwg0iGqjTkYZsweb3pFt3NLxBlU+XKuFu6VSDExRLKw==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr15176wmc.57.1578509488026;
 Wed, 08 Jan 2020 10:51:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id p18sm29510wmb.8.2020.01.08.10.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 10:51:27 -0800 (PST)
Date: Wed, 8 Jan 2020 19:51:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] gpu/drm: clean up white space in
 drm_legacy_lock_master_cleanup()
Message-ID: <20200108185125.GJ43062@phenom.ffwll.local>
References: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 08:43:12AM +0300, Dan Carpenter wrote:
> We moved this code to a different file and accidentally deleted a
> newline.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops, thanks for catching, patch applied!
-Daniel

> ---
>  drivers/gpu/drm/drm_lock.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
> index 2e8ce99d0baa..2c79e8199e3c 100644
> --- a/drivers/gpu/drm/drm_lock.c
> +++ b/drivers/gpu/drm/drm_lock.c
> @@ -360,7 +360,8 @@ void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *m
>  	/*
>  	 * Since the master is disappearing, so is the
>  	 * possibility to lock.
> -	 */	mutex_lock(&dev->struct_mutex);
> +	 */
> +	mutex_lock(&dev->struct_mutex);
>  	if (master->lock.hw_lock) {
>  		if (dev->sigdata.lock == master->lock.hw_lock)
>  			dev->sigdata.lock = NULL;
> -- 
> 2.11.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
