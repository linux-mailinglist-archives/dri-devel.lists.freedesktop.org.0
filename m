Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C834F5E64
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7613A10E21E;
	Wed,  6 Apr 2022 12:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A778710EBE2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:52:10 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id bg10so4077282ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Gy2SHSDs62cOPDGxmNmOEiJsuiUiAO+gEmkkvO7aK8I=;
 b=DG5ekHP9oS1H9YxN4itXSWQZgMW6PUAaYU0PbIHkJJqNsTNcIZpEd/Ve+wxQ6eSyV3
 muihYi/qJfhDFu/f2FKJZLUQwGQwrcWoLa7y7KCJWTh4mBrNf4r5L1BOymYbaVpwH5tb
 oXMZb9TQzA+g1oBrM0BDVr0+fWRfEk4vyxhLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Gy2SHSDs62cOPDGxmNmOEiJsuiUiAO+gEmkkvO7aK8I=;
 b=LPf+rMS7Q6HhluyhsNUwXN2ZUmJKxvT2i+R4R4Od87XmQdcEYRMN7NAnJW8WGAMrG1
 fAHOzB3VhqHgyp6T4jAI/1IvelgngscaB61bHulNOs8hAdeBGGjKYuTXvhW9RwIQ2akU
 uE5029qmCCUufY0LE+8rwPCW6mUiqogbOKURJpplMCcPrl6TQbgeLNC99v0bACwwUpiJ
 DCZJHf9Gmf6mhc1SKwLw8Vqggo1YT6Z1s7qZtKdQNs5CnRCnBYbdblcOIqjP/FJ5oXkM
 Iwl9eKOuXjir1pQskP/zVkSCti/hguHzW8m9RWQNNA5luRjuZ4PiDaiTgI+DzXAE+f06
 mYgQ==
X-Gm-Message-State: AOAM5335QPvr0ZxrFPMDk6LPTAfcEa3EXVBMyki7G+DFItQmtm2pQnhC
 pEjk/rgiQa34uytte6idTxqnHQ==
X-Google-Smtp-Source: ABdhPJyI7ucJfJaGo4l26++wlpzJuGxby1Gy51WLLnugwZCfGNTYV7IACHVjiI35LEAIbJrnouxAJg==
X-Received: by 2002:a17:907:3d8c:b0:6df:4bdc:a282 with SMTP id
 he12-20020a1709073d8c00b006df4bdca282mr8058860ejc.464.1649249529076; 
 Wed, 06 Apr 2022 05:52:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170906728800b006e0351df2dcsm6661422ejl.70.2022.04.06.05.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:52:08 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:52:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 15/16] drm/ttm: remove bo->moving
Message-ID: <Yk2M9oEV4AXfjBMJ@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-16-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-16-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:31AM +0200, Christian König wrote:
> This is now handled by the DMA-buf framework in the dma_resv obj.
> 
> Also remove the workaround inside VMWGFX to update the moving fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Looks all reasonable.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 13 ++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  5 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 11 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   | 11 ++++--
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 10 ++----
>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  7 ----
>  drivers/gpu/drm/ttm/ttm_bo_vm.c               | 34 +++++++------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  6 ----
>  include/drm/ttm/ttm_bo_api.h                  |  2 --
>  9 files changed, 39 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 808e21dcb517..a4955ef76cfc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2447,6 +2447,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>  		struct amdgpu_bo *bo = mem->bo;
>  		uint32_t domain = mem->domain;
>  		struct kfd_mem_attachment *attachment;
> +		struct dma_resv_iter cursor;
> +		struct dma_fence *fence;
>  
>  		total_size += amdgpu_bo_size(bo);
>  
> @@ -2461,10 +2463,13 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>  				goto validate_map_fail;
>  			}
>  		}
> -		ret = amdgpu_sync_fence(&sync_obj, bo->tbo.moving);
> -		if (ret) {
> -			pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
> -			goto validate_map_fail;
> +		dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
> +					DMA_RESV_USAGE_KERNEL, fence) {
> +			ret = amdgpu_sync_fence(&sync_obj, fence);
> +			if (ret) {
> +				pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
> +				goto validate_map_fail;
> +			}
>  		}
>  		list_for_each_entry(attachment, &mem->attachments, list) {
>  			if (!attachment->is_mapped)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 5832c05ab10d..ef93abec13b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -612,9 +612,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>  		if (unlikely(r))
>  			goto fail_unreserve;
>  
> -		amdgpu_bo_fence(bo, fence, false);
> -		dma_fence_put(bo->tbo.moving);
> -		bo->tbo.moving = dma_fence_get(fence);
> +		dma_resv_add_fence(bo->tbo.base.resv, fence,
> +				   DMA_RESV_USAGE_KERNEL);
>  		dma_fence_put(fence);
>  	}
>  	if (!bp->resv)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> index e3fbf0f10add..31913ae86de6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -74,13 +74,12 @@ static int amdgpu_vm_cpu_update(struct amdgpu_vm_update_params *p,
>  {
>  	unsigned int i;
>  	uint64_t value;
> -	int r;
> +	long r;
>  
> -	if (vmbo->bo.tbo.moving) {
> -		r = dma_fence_wait(vmbo->bo.tbo.moving, true);
> -		if (r)
> -			return r;
> -	}
> +	r = dma_resv_wait_timeout(vmbo->bo.tbo.base.resv, DMA_RESV_USAGE_KERNEL,
> +				  true, MAX_SCHEDULE_TIMEOUT);
> +	if (r < 0)
> +		return r;
>  
>  	pe += (unsigned long)amdgpu_bo_kptr(&vmbo->bo);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 9485b541947e..9cd6f41896c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -205,14 +205,19 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>  	struct amdgpu_bo *bo = &vmbo->bo;
>  	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
>  		: AMDGPU_IB_POOL_DELAYED;
> +	struct dma_resv_iter cursor;
>  	unsigned int i, ndw, nptes;
> +	struct dma_fence *fence;
>  	uint64_t *pte;
>  	int r;
>  
>  	/* Wait for PD/PT moves to be completed */
> -	r = amdgpu_sync_fence(&p->job->sync, bo->tbo.moving);
> -	if (r)
> -		return r;
> +	dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
> +				DMA_RESV_USAGE_KERNEL, fence) {
> +		r = amdgpu_sync_fence(&p->job->sync, fence);
> +		if (r)
> +			return r;
> +	}
>  
>  	do {
>  		ndw = p->num_dw_left;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 360f980c7e10..015a94f766de 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -418,7 +418,6 @@ static void ttm_bo_release(struct kref *kref)
>  	dma_resv_unlock(bo->base.resv);
>  
>  	atomic_dec(&ttm_glob.bo_count);
> -	dma_fence_put(bo->moving);
>  	bo->destroy(bo);
>  }
>  
> @@ -714,9 +713,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
>  EXPORT_SYMBOL(ttm_bo_unpin);
>  
>  /*
> - * Add the last move fence to the BO and reserve a new shared slot. We only use
> - * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
> - * either stall or use an exclusive fence respectively set bo->moving.
> + * Add the last move fence to the BO as kernel dependency and reserve a new
> + * fence slot.
>   */
>  static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  				 struct ttm_resource_manager *man,
> @@ -746,9 +744,6 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  		dma_fence_put(fence);
>  		return ret;
>  	}
> -
> -	dma_fence_put(bo->moving);
> -	bo->moving = fence;
>  	return 0;
>  }
>  
> @@ -951,7 +946,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>  	bo->bdev = bdev;
>  	bo->type = type;
>  	bo->page_alignment = page_alignment;
> -	bo->moving = NULL;
>  	bo->pin_count = 0;
>  	bo->sg = sg;
>  	bo->bulk_move = NULL;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 99deb45894f4..bc5190340b9c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -228,7 +228,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  
>  	atomic_inc(&ttm_glob.bo_count);
>  	INIT_LIST_HEAD(&fbo->base.ddestroy);
> -	fbo->base.moving = NULL;
>  	drm_vma_node_reset(&fbo->base.base.vma_node);
>  
>  	kref_init(&fbo->base.kref);
> @@ -500,9 +499,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>  	 * operation has completed.
>  	 */
>  
> -	dma_fence_put(bo->moving);
> -	bo->moving = dma_fence_get(fence);
> -
>  	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
>  	if (ret)
>  		return ret;
> @@ -546,9 +542,6 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>  	spin_unlock(&from->move_lock);
>  
>  	ttm_resource_free(bo, &bo->resource);
> -
> -	dma_fence_put(bo->moving);
> -	bo->moving = dma_fence_get(fence);
>  }
>  
>  int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 08ba083a80d2..5b324f245265 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -46,17 +46,13 @@
>  static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
>  				struct vm_fault *vmf)
>  {
> -	vm_fault_t ret = 0;
> -	int err = 0;
> -
> -	if (likely(!bo->moving))
> -		goto out_unlock;
> +	long err = 0;
>  
>  	/*
>  	 * Quick non-stalling check for idle.
>  	 */
> -	if (dma_fence_is_signaled(bo->moving))
> -		goto out_clear;
> +	if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_KERNEL))
> +		return 0;
>  
>  	/*
>  	 * If possible, avoid waiting for GPU with mmap_lock
> @@ -64,34 +60,30 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
>  	 * is the first attempt.
>  	 */
>  	if (fault_flag_allow_retry_first(vmf->flags)) {
> -		ret = VM_FAULT_RETRY;
>  		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> -			goto out_unlock;
> +			return VM_FAULT_RETRY;
>  
>  		ttm_bo_get(bo);
>  		mmap_read_unlock(vmf->vma->vm_mm);
> -		(void) dma_fence_wait(bo->moving, true);
> +		(void)dma_resv_wait_timeout(bo->base.resv,
> +					    DMA_RESV_USAGE_KERNEL, true,
> +					    MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(bo->base.resv);
>  		ttm_bo_put(bo);
> -		goto out_unlock;
> +		return VM_FAULT_RETRY;
>  	}
>  
>  	/*
>  	 * Ordinary wait.
>  	 */
> -	err = dma_fence_wait(bo->moving, true);
> -	if (unlikely(err != 0)) {
> -		ret = (err != -ERESTARTSYS) ? VM_FAULT_SIGBUS :
> +	err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_KERNEL, true,
> +				    MAX_SCHEDULE_TIMEOUT);
> +	if (unlikely(err < 0)) {
> +		return (err != -ERESTARTSYS) ? VM_FAULT_SIGBUS :
>  			VM_FAULT_NOPAGE;
> -		goto out_unlock;
>  	}
>  
> -out_clear:
> -	dma_fence_put(bo->moving);
> -	bo->moving = NULL;
> -
> -out_unlock:
> -	return ret;
> +	return 0;
>  }
>  
>  static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index a84d1d5628d0..a7d62a4eb47b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -1161,12 +1161,6 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
>  		*num_prefault = __KERNEL_DIV_ROUND_UP(last_cleaned - res_start,
>  						      PAGE_SIZE);
>  		vmw_bo_fence_single(bo, NULL);
> -		if (bo->moving)
> -			dma_fence_put(bo->moving);
> -
> -		return dma_resv_get_singleton(bo->base.resv,
> -					      DMA_RESV_USAGE_WRITE,
> -					      &bo->moving);
>  	}
>  
>  	return 0;
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index c76932b68a33..2d524f8b0802 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -94,7 +94,6 @@ struct ttm_tt;
>   * @deleted: True if the object is only a zombie and already deleted.
>   * @ddestroy: List head for the delayed destroy list.
>   * @swap: List head for swap LRU list.
> - * @moving: Fence set when BO is moving
>   * @offset: The current GPU offset, which can have different meanings
>   * depending on the memory type. For SYSTEM type memory, it should be 0.
>   * @cur_placement: Hint of current placement.
> @@ -147,7 +146,6 @@ struct ttm_buffer_object {
>  	 * Members protected by a bo reservation.
>  	 */
>  
> -	struct dma_fence *moving;
>  	unsigned priority;
>  	unsigned pin_count;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
