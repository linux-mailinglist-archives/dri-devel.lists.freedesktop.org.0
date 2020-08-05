Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7E23C901
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7772B89E15;
	Wed,  5 Aug 2020 09:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D64789E15
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:19:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g8so5143445wmk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dB08Hwbo5tHrCOUb9SdEh628MWwGglfJ4bhpdHTVaXQ=;
 b=RP35qJGxzVtMTT8UKIluo84Zj3c55HDnQQAh76xSFQoSJSy3CFCygcMlOWE/9/PweT
 1M/SY4OAjsqrnBzwsxcgAwtJieiJ/gUcUI26yMl1bNam13TZWfmzQNCrWlatWLu5y9GQ
 F7j6tMykwN6LQdt1bsHBfCJk8B73ZwY74BTJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dB08Hwbo5tHrCOUb9SdEh628MWwGglfJ4bhpdHTVaXQ=;
 b=d6fkXMtxSbDDDTDhgdd6nNljtx5wj+oZxXtKCcnB9e5jI6GwcV/A+uGcwSUY7BkFlp
 kA/wLXczE8/HjjxoU1sCRxV4PEWqLReaRq8/fFdyvOL/DPH1WtGIw7BppDm3BrUS55k7
 jeTQbyadpG2slhWyKSUW0FSk5CrAXv6ERT8aD6pZn3t394hPczzG+KVbZ+/4XM9T8ciT
 I4rBLOIms1x/huA3SN1qNwfH0b8EBZNqRS7+aK1Vw07xwPCUix4N0/UD3HDO80k8DHsZ
 S24qPoSYC94PEfNpsOo6WKIJeewXZ0M3lD/Y+iJMiQnj805sduo4BydEUl7TkOPLNvaN
 cf6A==
X-Gm-Message-State: AOAM530ZPy2B9XsjNWXAEN9dWVubgnEY8STjb6JebRgZ8kYXAFIYORcv
 caktJF6SWBz+UpT7MS4YiB+1WA==
X-Google-Smtp-Source: ABdhPJxwUS6MwC7qOjgth/yzdrpUz+YVcXxsJgmee6eXKK6YJQQz5flE6kht010pdCXpk9C5K2V0WA==
X-Received: by 2002:a1c:27c1:: with SMTP id n184mr2551792wmn.6.1596619146864; 
 Wed, 05 Aug 2020 02:19:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm1988098wrg.38.2020.08.05.02.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 02:19:05 -0700 (PDT)
Date: Wed, 5 Aug 2020 11:19:04 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 28/59] drm/vmwgfx: takedown vram manager
Message-ID: <20200805091904.GA6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-29-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-29-airlied@gmail.com>
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

On Tue, Aug 04, 2020 at 12:56:01PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Don't bother returning EBUSY, nobody cares enough,
> if the driver has a problem, it should deal with it.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 14 +++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 23 +++++++++++++----------
>  3 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 364d5f3ff9a8..4f4d22bac477 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -637,6 +637,17 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
>  	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
>  	return ret;
>  }
> +
> +static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
> +{
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	vmw_thp_fini(dev_priv);
> +#else
> +	ttm_bo_man_fini(&dev_priv->bdev,
> +			    &dev_priv->bdev.man[TTM_PL_VRAM]);
> +#endif
> +}
> +
>  static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  {
>  	struct vmw_private *dev_priv;
> @@ -988,7 +999,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
>  	if (dev_priv->has_gmr)
>  		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_GMR);
> -	(void)ttm_bo_clean_mm(&dev_priv->bdev, TTM_PL_VRAM);
> +	vmw_vram_manager_fini(dev_priv);
>  out_no_vram:
>  	(void)ttm_bo_device_release(&dev_priv->bdev);
>  out_no_bdev:
> @@ -1042,6 +1053,7 @@ static void vmw_driver_unload(struct drm_device *dev)
>  	vmw_release_device_early(dev_priv);
>  	if (dev_priv->has_mob)
>  		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
> +	vmw_vram_manager_fini(dev_priv);

I think drmm_ would be neat for all this stuff eventually, but we're still
in the very early phases of rolling that out.


>  	(void) ttm_bo_device_release(&dev_priv->bdev);
>  	drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
>  	vmw_release_device_late(dev_priv);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 8f319dd6cdb4..c6530d7b6d51 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1521,6 +1521,7 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>  /* Transparent hugepage support - vmwgfx_thp.c */
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  extern int vmw_thp_init(struct vmw_private *dev_priv);
> +void vmw_thp_fini(struct vmw_private *dev_priv);
>  #endif
>  
>  /**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 0292c931c265..548f152b9963 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -135,21 +135,25 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>  	return 0;
>  }
>  
> -static int vmw_thp_takedown(struct ttm_mem_type_manager *man)
> +void vmw_thp_fini(struct vmw_private *dev_priv)
>  {
> +	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
>  	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
>  	struct drm_mm *mm = &rman->mm;
> +	int ret;
> +
> +	ttm_mem_type_manager_disable(man);
>  
> +	ret = ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
> +	if (ret)
> +		return;
>  	spin_lock(&rman->lock);
> -	if (drm_mm_clean(mm)) {
> -		drm_mm_takedown(mm);
> -		spin_unlock(&rman->lock);
> -		kfree(rman);
> -		man->priv = NULL;
> -		return 0;
> -	}
> +	drm_mm_clean(mm);
> +	drm_mm_takedown(mm);
>  	spin_unlock(&rman->lock);
> -	return -EBUSY;
> +	kfree(rman);
> +	man->priv = NULL;
> +	ttm_mem_type_manager_cleanup(man);
>  }
>  
>  static void vmw_thp_debug(struct ttm_mem_type_manager *man,
> @@ -163,7 +167,6 @@ static void vmw_thp_debug(struct ttm_mem_type_manager *man,
>  }
>  
>  const struct ttm_mem_type_manager_func vmw_thp_func = {
> -	.takedown = vmw_thp_takedown,
>  	.get_node = vmw_thp_get_node,
>  	.put_node = vmw_thp_put_node,
>  	.debug = vmw_thp_debug

Still the mildly icky #ifdef, but looks good to me.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
