Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972E1D5062
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB446ECC0;
	Fri, 15 May 2020 14:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45746ECC0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:26:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f13so2508322wmc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=19gFs9lxkUh7rdHbhqvIDwg7sxgT7XSi25FnbHUkoLU=;
 b=QDgTBP0JWvHzJF4aoMhmUS4DD1TcfluIc+UaTgXpBWI1XcsHJyO4J+sY3j1FSCIZ25
 1m7ZIj+7Fotd5CXUSdOw1aO206NOZChZ0EgEzNHcyYXBUtBdf6RIWUaZRIxS035X+IVS
 r5ixnldND74ZaABGjLuUz9Izl+HvVnnyK4qzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=19gFs9lxkUh7rdHbhqvIDwg7sxgT7XSi25FnbHUkoLU=;
 b=ir4vTfSPD4HLbLQPILcwSmgF1raavGg7bDG9krdysDQW5pYp2y4dvieDi0R0VOHFyW
 wqrhBhsVGTAf27yanrq5RQUDf8YbV2hzaVO5CF1KGmB3ht7j5n59HeRji4hiHZlRXn7E
 8ZDeylZyPblU1S2V0s+PdmQzsnKjL8++XQcnluOOuFyPYoUHnr9UgWGhzutxXhpq+ipa
 RR+mL0RT9MGRz4zZ94mjTg/3I1HYMMFcSlh3uQ0xu2v9bbm327rfFg0vQUPwd+etv0A+
 FupYz6jx9veRH43WmbO5WJu8P2mWTTbURfRyr2BBg/46XpPiSbja8+Q92Nnd+8MLZEqO
 dkZg==
X-Gm-Message-State: AOAM531qSu/HDHbXA5fuD+vXGub4iSdfBb9kJ5IRcDuJl9nX4k5fy6Af
 0dRNLT/vNhdx0hKDjzch0TrTmg==
X-Google-Smtp-Source: ABdhPJzerq59a2aOBs7y/aQaAcg82jjuSp50pVe7KAN5AZwSroBNDGm7wZVpxLnvf6Vdneg5gZbcyw==
X-Received: by 2002:a1c:a793:: with SMTP id q141mr4246342wme.70.1589552799400; 
 Fri, 15 May 2020 07:26:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k13sm3692464wmj.40.2020.05.15.07.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:26:38 -0700 (PDT)
Date: Fri, 15 May 2020 16:26:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 34/38] drm/vgem: remove _unlocked suffix in
 drm_object_put_unlocked
Message-ID: <20200515142637.GL206103@phenom.ffwll.local>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-35-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515095118.2743122-35-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 10:51:14AM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
> 
> Just drop the suffix. It makes the API cleaner.
> 
> Done via the following script:
> 
> __from=drm_gem_object_put_unlocked
> __to=drm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>   sed -i  "s/$__from/$__to/g" $__file;
> done
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vgem/vgem_drv.c   | 6 +++---
>  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index ec1a8ebb6f1b..e4dc7b267a0b 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -198,7 +198,7 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
>  
>  	ret = drm_gem_handle_create(file, &obj->base, handle);
>  	if (ret) {
> -		drm_gem_object_put_unlocked(&obj->base);
> +		drm_gem_object_put(&obj->base);
>  		return ERR_PTR(ret);
>  	}
>  
> @@ -223,7 +223,7 @@ static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	args->size = gem_object->size;
>  	args->pitch = pitch;
>  
> -	drm_gem_object_put_unlocked(gem_object);
> +	drm_gem_object_put(gem_object);
>  
>  	DRM_DEBUG("Created object of size %llu\n", args->size);
>  
> @@ -251,7 +251,7 @@ static int vgem_gem_dumb_map(struct drm_file *file, struct drm_device *dev,
>  
>  	*offset = drm_vma_node_offset_addr(&obj->vma_node);
>  unref:
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index 9268f6fc3f66..17f32f550dd9 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -182,7 +182,7 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
>  		dma_fence_put(fence);
>  	}
>  err:
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
