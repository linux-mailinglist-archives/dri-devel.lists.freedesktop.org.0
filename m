Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58D4EB13B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5FF10E855;
	Tue, 29 Mar 2022 16:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC04F10E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:02:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w4so25469600wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=becJ5KT8sF1KkAngaqQzDXTfdZ4op0Di3EoEc738ziY=;
 b=E4nVRjsIfSHhbd5tKa708Ur+hKnLBh6VRW3kMSXD90xRbSftw+R1FXZIzpzwAX0QKX
 txi+L6CYIjVyOc4VbhJd/DwS6e0hK31La1ba4h8H4i5G4FqGja8CmZbo9tbizH6T4NLz
 JavAA2jCAVimgaZxAZQqUEswIb7tg0JOBpBes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=becJ5KT8sF1KkAngaqQzDXTfdZ4op0Di3EoEc738ziY=;
 b=FYE4LqF/Zykjr7xQAeaWAYKoAi2/QzemcjoiPe2fyb1lBMHnAuQWyuggC5m9pPhu1X
 zGKZprqpdA+ZoF7qBSY6OiIn9IoYsO9MiwagzMoD0PhpBaK3hJ4jPMnNHZt5EfjVLtW2
 EbfCmhQCzt59sAcTWe4xIJfXfwq0xNqqp+AeLg9Wk29j9YN81DPOeuVRvC65P17OuMPe
 9BhnAxut9j2Ks3aRiNoeeSwYNg1UxnCnPExcMwVHO8e0IzL7ajc392qAB+MBBQgl4EF5
 g68OSwKlsfQheVTTX6snbwUIetAYlc0U5iAogZ/iyXuk7SoDB4XSWsl/tf7zScSzY7Go
 XDsw==
X-Gm-Message-State: AOAM530k9qIYCcOKq5A6BNQQPgaSlUNpUrncUMFBfu+7EFFC/8aKWSk4
 33aYVnLB/F5uIEDbw5ohGJ90GQ==
X-Google-Smtp-Source: ABdhPJyQXCBMcqyiQw5JXpwTDpPr6yeDTmdjHA1d7EwPfmPPFNrHKwG/qzSn1PM7nlkfc31ieLliDw==
X-Received: by 2002:adf:fa87:0:b0:203:f28e:76c3 with SMTP id
 h7-20020adffa87000000b00203f28e76c3mr32207997wrr.579.1648569755441; 
 Tue, 29 Mar 2022 09:02:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm2578662wmq.46.2022.03.29.09.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 09:02:34 -0700 (PDT)
Date: Tue, 29 Mar 2022 18:02:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 23/23] drm/ttm: remove bo->moving
Message-ID: <YkMtmPFWiaLFEnWg@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-23-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-23-christian.koenig@amd.com>
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

On Mon, Mar 21, 2022 at 02:58:56PM +0100, Christian König wrote:
> This is now handled by the DMA-buf framework in the dma_resv obj.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 13 ++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  7 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 11 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   | 11 ++++--
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 10 ++----
>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  7 ----
>  drivers/gpu/drm/ttm/ttm_bo_vm.c               | 34 +++++++------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  6 ----
>  include/drm/ttm/ttm_bo_api.h                  |  2 --
>  9 files changed, 40 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index b461c3aab877..fe168b3cc3f2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2406,6 +2406,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>  		struct amdgpu_bo *bo = mem->bo;
>  		uint32_t domain = mem->domain;
>  		struct kfd_mem_attachment *attachment;
> +		struct dma_resv_iter cursor;
> +		struct dma_fence *fence;
>  
>  		total_size += amdgpu_bo_size(bo);
>  
> @@ -2420,10 +2422,13 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
> index 1618b6847c69..887fa3f4284e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -609,9 +609,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
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
> @@ -1307,7 +1306,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  
>  	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
>  	if (!WARN_ON(r)) {
> -		amdgpu_bo_fence(abo, fence, false);
> +		dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
>  		dma_fence_put(fence);
>  	}
>  
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
> index dbb551762805..bdb44cee19d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -204,14 +204,19 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
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

Just a bikeshed, but I think a amdgpu_sync_resv(resv, usage) helper would
be neat.

> +		if (r)
> +			return r;
> +	}
>  
>  	do {
>  		ndw = p->num_dw_left;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 8fea9f88d118..9bce692075da 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -468,7 +468,6 @@ static void ttm_bo_release(struct kref *kref)
>  	dma_resv_unlock(bo->base.resv);
>  
>  	atomic_dec(&ttm_glob.bo_count);
> -	dma_fence_put(bo->moving);
>  	bo->destroy(bo);
>  }
>  
> @@ -737,9 +736,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  }
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
> @@ -769,9 +767,6 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  		dma_fence_put(fence);
>  		return ret;
>  	}
> -
> -	dma_fence_put(bo->moving);
> -	bo->moving = fence;
>  	return 0;
>  }
>  
> @@ -978,7 +973,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>  	bo->bdev = bdev;
>  	bo->type = type;
>  	bo->page_alignment = page_alignment;
> -	bo->moving = NULL;
>  	bo->pin_count = 0;
>  	bo->sg = sg;
>  	if (resv) {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 98e1c804519e..a2e3a9626198 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -229,7 +229,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	atomic_inc(&ttm_glob.bo_count);
>  	INIT_LIST_HEAD(&fbo->base.ddestroy);
>  	INIT_LIST_HEAD(&fbo->base.lru);
> -	fbo->base.moving = NULL;
>  	drm_vma_node_reset(&fbo->base.base.vma_node);
>  
>  	kref_init(&fbo->base.kref);
> @@ -501,9 +500,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>  	 * operation has completed.
>  	 */
>  
> -	dma_fence_put(bo->moving);
> -	bo->moving = dma_fence_get(fence);
> -
>  	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
>  	if (ret)
>  		return ret;
> @@ -547,9 +543,6 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
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
> index f999fdd927df..c6d02c98a19a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -1163,12 +1163,6 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
>  		*num_prefault = __KERNEL_DIV_ROUND_UP(last_cleaned - res_start,
>  						      PAGE_SIZE);
>  		vmw_bo_fence_single(bo, NULL);
> -		if (bo->moving)
> -			dma_fence_put(bo->moving);
> -
> -		return dma_resv_get_singleton(bo->base.resv,
> -					      DMA_RESV_USAGE_KERNEL,
> -					      &bo->moving);

This seems to be entirely misplaced and I'm pretty sure doesn't even
compile interim.

>  	}
>  
>  	return 0;
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index c17b2df9178b..4c7134550262 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -97,7 +97,6 @@ struct ttm_tt;
>   * @lru: List head for the lru list.
>   * @ddestroy: List head for the delayed destroy list.
>   * @swap: List head for swap LRU list.
> - * @moving: Fence set when BO is moving
>   * @offset: The current GPU offset, which can have different meanings
>   * depending on the memory type. For SYSTEM type memory, it should be 0.
>   * @cur_placement: Hint of current placement.
> @@ -150,7 +149,6 @@ struct ttm_buffer_object {
>  	 * Members protected by a bo reservation.
>  	 */
>  
> -	struct dma_fence *moving;
>  	unsigned priority;
>  	unsigned pin_count;

Aside from the vmwgfx thing this looks good. With the vmwgfx patch split
issue (I think it's just that) fixed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
