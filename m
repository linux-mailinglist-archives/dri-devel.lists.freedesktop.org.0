Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14923C909
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A6A88EF0;
	Wed,  5 Aug 2020 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519B088EF0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:21:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q76so5584949wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VVMzm+6TqpPKz5KY9G0jFug4AO3RL2MBTzZUEar1KOM=;
 b=kn85KIlF2bVnOZyVW/QX/OgzAjJbFbmoWMeOdAlz4nZHKLXirsMJZvN+UleKUQ1HLs
 4OlxE6T7N0e88gnKOyW/+JHAoS/jX5252SS7Q9VeMrhr8CpseqzvljkxxWPC21ZJpRQG
 XqgcuvBKS0MYuWZYJpFlvKU0Oa0phF0iGATiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VVMzm+6TqpPKz5KY9G0jFug4AO3RL2MBTzZUEar1KOM=;
 b=L2gZtfZcg6YS1HwBhrVqyEDAWmiYvvqmGrITzUPArbZUwCwZ/3ghepKTrva3boc2Zv
 /nBpbV89F/7CayrGbM5Py3vyOeC/bIHBPQygFN63WX9OxWMFEuqzGb4mcwSqUr6GK0BC
 HoR0xEC2PTW3Moj6nNfoUGYtEkKrNjJnJQGtbSdokHFtlIk0OYKZx7UBEIdZPBar9NWy
 Idv38qol9BCMrDZREEtVGfq/quqNdtwe8xV0rChDLLjb6fRwqESi0SLPoiWf2f+ujiQj
 W5LpS5hgWn9x2GfOGPlXletICiozbdaC691CM3qY329ZCI4USAVPXFarEumfB9tIVV2x
 L03g==
X-Gm-Message-State: AOAM531VRpYo6dpoqo2qdfsgyn8M4S/2EvAg/JAQGJLiVTUfQd38QRzZ
 pCsW5FLk4iD21k9OC+14vXGhLA==
X-Google-Smtp-Source: ABdhPJyyrYwLuJx5jVr8G+pRqx/I5hJ3yFPjyI8Y9BX5NWOh0BObdA7Vr8msmJ2SZAHgGgLH5StjcA==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr2363490wml.35.1596619310995; 
 Wed, 05 Aug 2020 02:21:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j24sm2088851wrb.49.2020.08.05.02.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 02:21:50 -0700 (PDT)
Date: Wed, 5 Aug 2020 11:21:48 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 33/59] drm/vmwgfx: fix gmrid takedown paths to new
 interface
Message-ID: <20200805092148.GB6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-34-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-34-airlied@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: sroland@vmware.com, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 12:56:06PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  9 ++++-----
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 11 ++++++++---
>  3 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 4f4d22bac477..f368a9cc0c2a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -996,9 +996,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  	vmw_kms_close(dev_priv);
>  out_no_kms:
>  	if (dev_priv->has_mob)
> -		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
> +		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
>  	if (dev_priv->has_gmr)
> -		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_GMR);
> +		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
>  	vmw_vram_manager_fini(dev_priv);
>  out_no_vram:
>  	(void)ttm_bo_device_release(&dev_priv->bdev);
> @@ -1047,12 +1047,11 @@ static void vmw_driver_unload(struct drm_device *dev)
>  	vmw_overlay_close(dev_priv);
>  
>  	if (dev_priv->has_gmr)
> -		(void)ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_GMR);
> -	(void)ttm_bo_clean_mm(&dev_priv->bdev, TTM_PL_VRAM);
> +		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
>  
>  	vmw_release_device_early(dev_priv);
>  	if (dev_priv->has_mob)
> -		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
> +		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
>  	vmw_vram_manager_fini(dev_priv);
>  	(void) ttm_bo_device_release(&dev_priv->bdev);
>  	drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index c6530d7b6d51..aa763c6b1146 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1222,6 +1222,7 @@ int vmw_overlay_num_free_overlays(struct vmw_private *dev_priv);
>   */
>  
>  int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type);
> +void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type);
>  
>  /**
>   * Prime - vmwgfx_prime.c
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index 141fb14e3583..ec1b5bb01a93 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -133,20 +133,25 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  	return 0;
>  }
>  
> -static int vmw_gmrid_man_takedown(struct ttm_mem_type_manager *man)
> +void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
>  {
> +	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
>  	struct vmwgfx_gmrid_man *gman =
>  		(struct vmwgfx_gmrid_man *)man->priv;
>  
> +	ttm_mem_type_manager_disable(man);
> +
> +	ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
> +
>  	if (gman) {

I don't think this can ever be non-NULL if init worked, not after the
demidlayering. Maybe put a WARN_ON(!gman) in here. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  		ida_destroy(&gman->gmr_ida);
>  		kfree(gman);
>  	}
> -	return 0;
> +
> +	ttm_mem_type_manager_cleanup(man);
>  }
>  
>  static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
> -	.takedown = vmw_gmrid_man_takedown,
>  	.get_node = vmw_gmrid_man_get_node,
>  	.put_node = vmw_gmrid_man_put_node,
>  };
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
