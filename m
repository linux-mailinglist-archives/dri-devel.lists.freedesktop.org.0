Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D61CD232
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE926E1E8;
	Mon, 11 May 2020 07:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AC96E1DE;
 Mon, 11 May 2020 07:05:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 50so8915482wrc.11;
 Mon, 11 May 2020 00:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DvLsXI69d3/CWDmNPL0li0FpQeolD6hftJmaIq+Uwfw=;
 b=S+8afC7KIIJeE1O1Agd4Q7qq7UrPJO8sN/NEtJprPtXCPseG4lzi0biJlL5bXAjFpU
 0qIxntSvCXIfEvjGctqS2CPs5KPVRWfM0jSMqR4VcvbSvEn/oxHiNXdQzfR1gDG6Pph3
 Ig4UJlKSkhkYmvs64ERDJUMIdfnuhRJkvviILAa00pGuUgjlxQBynAXm9BI4zxJJgk1h
 poH0RYhrR3k6NFTBYknctYGtJAOt5MtJToxldKHb6ZSPxDDzF4A75dswXMlwl6smHS8K
 nhFJh2pfv+omIO1YjPbft+MnaHkpeWamwsbsQnghoUCVrRj90T3Mt4Sq9BfGaKsJonqa
 niAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=DvLsXI69d3/CWDmNPL0li0FpQeolD6hftJmaIq+Uwfw=;
 b=CrY329dpOsP/bMW8xaH43TUxuwz8nKrxhqlkrVj1L5hVpBO+jANfjITmVN1xKoPL5M
 tlTs64LRzMtBDnZoFZSYd7Uht+is/nNHSS/M+RThzrdFuo8sa6CEeHG10A9uw0ii/6ex
 qZ52Q/CkX/rKh+/zU1Apr01g7SN1PFg7O6xaCmjzSWeqtqOYN1ipy9nLqbbr7ZcizinK
 XGOHS68u0b/NX27fz2Mq8ob3WKHpFDLDpCXeHmiuGRpwJDwl0yWpnKbuIVI52seX9AzF
 SboCzT60CIDKHUlf0E0aKO/zanyzm/Uau7vC0Q2HQk2hsvabLFQsnD3fCAtfs73AHM9t
 g3Lw==
X-Gm-Message-State: AGi0PuYZIupISwOatnYG5t5KT73mOzEugYmzgGrBWRlUpQZxDCkLZNev
 z27RdplViQXVhvsgq89UQl8=
X-Google-Smtp-Source: APiQypJ8ELaiVZx5YTWS4ddL1pAOUfZ7Ndp/ZGvMUJ+AKWFTwEMV5M+l41nrNFj90uK8oNepkcWIcg==
X-Received: by 2002:adf:e751:: with SMTP id c17mr18121771wrn.351.1589180720408; 
 Mon, 11 May 2020 00:05:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 32sm16448355wrg.19.2020.05.11.00.05.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 00:05:19 -0700 (PDT)
Subject: Re: [PATCH 5/6] drm/ttm: Add destroy flag in TTM BO eviction interface
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-6-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d8dbe3eb-598e-fa6a-f1b5-8bf5f0313920@gmail.com>
Date: Mon, 11 May 2020 09:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1589050310-19666-6-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While this looks rather nice it is most likely the wrong approach since 
it doesn't handles other concurrent evictions.

It would most likely be better to add a check calling 
drm_dev_is_unplugged() into amdgpu_bo_move().

Regards,
Christian.

Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
> This will allow to invalidate, destroy backing storage and notify users
> of BOs when device is unpluged.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c            |  4 +--
>   drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                | 41 ++++++++++++++++++-----------
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 ++---
>   include/drm/ttm/ttm_bo_api.h                |  2 +-
>   8 files changed, 35 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 1a4894f..f96c6d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1145,7 +1145,7 @@ static int amdgpu_debugfs_evict_gtt(struct seq_file *m, void *data)
>   	if (r < 0)
>   		return r;
>   
> -	seq_printf(m, "(%d)\n", ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_TT));
> +	seq_printf(m, "(%d)\n", ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_TT, false));
>   
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 22afd11..82d43d0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1046,7 +1046,7 @@ int amdgpu_bo_evict_vram(struct amdgpu_device *adev)
>   		return 0;
>   	}
>   #endif
> -	return ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_VRAM);
> +	return ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_VRAM, false);
>   }
>   
>   static const char *amdgpu_vram_names[] = {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 6b1629c..f3eea89 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -759,7 +759,7 @@ nouveau_do_suspend(struct drm_device *dev, bool runtime)
>   	}
>   
>   	NV_DEBUG(drm, "evicting buffers...\n");
> -	ttm_bo_evict_mm(&drm->ttm.bdev, TTM_PL_VRAM);
> +	ttm_bo_evict_mm(&drm->ttm.bdev, TTM_PL_VRAM, false);
>   
>   	NV_DEBUG(drm, "waiting for kernel channels to go idle...\n");
>   	if (drm->cechan) {
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index ab72dc3..45bb89b 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -359,10 +359,10 @@ int qxl_bo_check_id(struct qxl_device *qdev, struct qxl_bo *bo)
>   
>   int qxl_surf_evict(struct qxl_device *qdev)
>   {
> -	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_PRIV);
> +	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_PRIV, false);
>   }
>   
>   int qxl_vram_evict(struct qxl_device *qdev)
>   {
> -	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_VRAM);
> +	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_VRAM, false);
>   }
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index 140d94c..3eeeb8d 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -429,7 +429,7 @@ int radeon_bo_evict_vram(struct radeon_device *rdev)
>   			return 0;
>   	}
>   #endif
> -	return ttm_bo_evict_mm(&rdev->mman.bdev, TTM_PL_VRAM);
> +	return ttm_bo_evict_mm(&rdev->mman.bdev, TTM_PL_VRAM, false);
>   }
>   
>   void radeon_bo_force_delete(struct radeon_device *rdev)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index eae61cc..a17f87c2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -42,6 +42,7 @@
>   #include <linux/module.h>
>   #include <linux/atomic.h>
>   #include <linux/dma-resv.h>
> +#include <drm/drm_drv.h>
>   
>   static void ttm_bo_global_kobj_release(struct kobject *kobj);
>   
> @@ -652,7 +653,8 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_device *bdev, int resched)
>   EXPORT_SYMBOL(ttm_bo_unlock_delayed_workqueue);
>   
>   static int ttm_bo_evict(struct ttm_buffer_object *bo,
> -			struct ttm_operation_ctx *ctx)
> +			struct ttm_operation_ctx *ctx,
> +			bool destroy)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
>   	struct ttm_mem_reg evict_mem;
> @@ -665,18 +667,23 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   	placement.num_busy_placement = 0;
>   	bdev->driver->evict_flags(bo, &placement);
>   
> -	if (!placement.num_placement && !placement.num_busy_placement) {
> +	evict_mem = bo->mem;
> +	evict_mem.mm_node = NULL;
> +	evict_mem.bus.io_reserved_vm = false;
> +	evict_mem.bus.io_reserved_count = 0;
> +
> +	if (destroy || !placement.num_placement && !placement.num_busy_placement) {
>   		ret = ttm_bo_pipeline_gutting(bo);
>   		if (ret)
>   			return ret;
>   
> -		return ttm_tt_create(bo, false);
> -	}
> +		ret = ttm_tt_create(bo, false);
>   
> -	evict_mem = bo->mem;
> -	evict_mem.mm_node = NULL;
> -	evict_mem.bus.io_reserved_vm = false;
> -	evict_mem.bus.io_reserved_count = 0;
> +		if (bdev->driver->move_notify)
> +			bdev->driver->move_notify(bo, true, &evict_mem);
> +
> +		return ret;
> +	}
>   
>   	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
>   	if (ret) {
> @@ -785,7 +792,8 @@ static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>   			       uint32_t mem_type,
>   			       const struct ttm_place *place,
>   			       struct ttm_operation_ctx *ctx,
> -			       struct ww_acquire_ctx *ticket)
> +			       struct ww_acquire_ctx *ticket,
> +			       bool destroy)
>   {
>   	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
>   	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
> @@ -846,7 +854,7 @@ static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>   
>   	spin_unlock(&ttm_bo_glob.lru_lock);
>   
> -	ret = ttm_bo_evict(bo, ctx);
> +	ret = ttm_bo_evict(bo, ctx, destroy);
>   	if (locked)
>   		ttm_bo_unreserve(bo);
>   
> @@ -919,7 +927,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   		if (mem->mm_node)
>   			break;
>   		ret = ttm_mem_evict_first(bdev, mem->mem_type, place, ctx,
> -					  ticket);
> +					  ticket, false);
>   		if (unlikely(ret != 0))
>   			return ret;
>   	} while (1);
> @@ -1428,7 +1436,8 @@ int ttm_bo_create(struct ttm_bo_device *bdev,
>   EXPORT_SYMBOL(ttm_bo_create);
>   
>   static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
> -				   unsigned mem_type)
> +				   unsigned mem_type,
> +				   bool destroy)
>   {
>   	struct ttm_operation_ctx ctx = {
>   		.interruptible = false,
> @@ -1450,7 +1459,7 @@ static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
>   		while (!list_empty(&man->lru[i])) {
>   			spin_unlock(&glob->lru_lock);
>   			ret = ttm_mem_evict_first(bdev, mem_type, NULL, &ctx,
> -						  NULL);
> +						  NULL, destroy);
>   			if (ret)
>   				return ret;
>   			spin_lock(&glob->lru_lock);
> @@ -1494,7 +1503,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   
>   	ret = 0;
>   	if (mem_type > 0) {
> -		ret = ttm_bo_force_list_clean(bdev, mem_type);
> +		ret = ttm_bo_force_list_clean(bdev, mem_type, false);
>   		if (ret) {
>   			pr_err("Cleanup eviction failed\n");
>   			return ret;
> @@ -1510,7 +1519,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   }
>   EXPORT_SYMBOL(ttm_bo_clean_mm);
>   
> -int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
> +int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type, bool destroy)
>   {
>   	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
>   
> @@ -1524,7 +1533,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   		return 0;
>   	}
>   
> -	return ttm_bo_force_list_clean(bdev, mem_type);
> +	return ttm_bo_force_list_clean(bdev, mem_type, destroy);
>   }
>   EXPORT_SYMBOL(ttm_bo_evict_mm);
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 71e45b56..350064f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -468,7 +468,7 @@ static int vmw_request_device(struct vmw_private *dev_priv)
>   	if (dev_priv->cman)
>   		vmw_cmdbuf_remove_pool(dev_priv->cman);
>   	if (dev_priv->has_mob) {
> -		(void) ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB);
> +		(void) ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB, false);
>   		vmw_otables_takedown(dev_priv);
>   	}
>   	if (dev_priv->cman)
> @@ -501,7 +501,7 @@ static void vmw_release_device_early(struct vmw_private *dev_priv)
>   		vmw_cmdbuf_remove_pool(dev_priv->cman);
>   
>   	if (dev_priv->has_mob) {
> -		ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB);
> +		ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB, false);
>   		vmw_otables_takedown(dev_priv);
>   	}
>   }
> @@ -1227,7 +1227,7 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
>   	if (dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
>   		dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
>   		spin_unlock(&dev_priv->svga_lock);
> -		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
> +		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM, false))
>   			DRM_ERROR("Failed evicting VRAM buffers.\n");
>   		vmw_write(dev_priv, SVGA_REG_ENABLE,
>   			  SVGA_REG_ENABLE_HIDE |
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index b9bc1b0..9d57b8c 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -597,7 +597,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type);
>    * -ERESTARTSYS: The call was interrupted by a signal while waiting to
>    * evict a buffer.
>    */
> -int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type);
> +int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type, bool destroy);
>   
>   /**
>    * ttm_kmap_obj_virtual

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
