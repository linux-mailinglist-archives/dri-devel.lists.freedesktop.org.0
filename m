Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593714EB14D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA15910E8CC;
	Tue, 29 Mar 2022 16:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E22810E8CC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:06:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h23so25517041wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wkjSMHDtZ2V1Cry44p9D3KzBXtSqa7C2eAenvv5z1hU=;
 b=hMP91Zom9ZiEISNwPNKZxvNCPN1FT+MYyq8CGHx2iaKMlL9iJyxsLLts3OpcLBDvbc
 oQePi1vMyEggDGEVCzlVXCQJp+I/gsoSERX1v078w0nHzBNG/bDarLZlre4pAoee2WMB
 wnD8aWpQorwuK3VQ9KMG8F5l3y/cJ7a74ix1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wkjSMHDtZ2V1Cry44p9D3KzBXtSqa7C2eAenvv5z1hU=;
 b=TKHkoVEbpEzkhruaRWrOMHqQhOajF64mFS6XSWd8uxPiYTJV/DrlXak/Rwfb3eAtDg
 Q8WY8miXCTJXKPTmzS+nuo1HUPplGuLWuZSI2t2vDg/b9J5cj/oliOX7sPLhIsjkK5ji
 ElNfpNRZLW2C8uZY+APmLnAc7pQWFB7UCGcYTAvrcGqcDDDFg+gwMjVFIoRK9O2BM6n3
 NGESTuXSVWEByHnvYDfyzdYrRZx6EcZsgpPkqsuxw7fxbn79oGNEjcOjhs/Ab+vH+7JJ
 JlOEIg3VGEc2INjLqiF7JLrV2jRfdOFAjpVG+yQBTI1hFNRFUYl3zt71f3MQyylIsL5q
 dFFQ==
X-Gm-Message-State: AOAM532RMDz4BmJa6fa3Lk045/dInN7iCw3GntUlULN91FgF2Xr3ell/
 Yg1bbX3JebP3dzGshIvwvH5mgA==
X-Google-Smtp-Source: ABdhPJw9S12NVlo06rezm+Ou1bhUpP7G58b09UBza2nCX8bZcD8TxsoOLA3a+7frns9BIHQ8KHbogw==
X-Received: by 2002:adf:fc43:0:b0:203:d867:9fe5 with SMTP id
 e3-20020adffc43000000b00203d8679fe5mr31838964wrs.272.1648570009667; 
 Tue, 29 Mar 2022 09:06:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4141000000b00205d3d37dcdsm1375612wrq.103.2022.03.29.09.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 09:06:49 -0700 (PDT)
Date: Tue, 29 Mar 2022 18:06:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 20/23] dma-buf: add DMA_RESV_USAGE_BOOKKEEP v2
Message-ID: <YkMul8nO5CoxOSS3@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-20-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-20-christian.koenig@amd.com>
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

On Mon, Mar 21, 2022 at 02:58:53PM +0100, Christian König wrote:
> Add an usage for submissions independent of implicit sync but still
> interesting for memory management.

This fails to mention that you're hding the amdgpu vm optimization in
here. I'd split that out, but it really needs to be in the commit message.


> v2: cleanup the kerneldoc a bit
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                       |  2 +-
>  drivers/dma-buf/st-dma-resv.c                    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c          |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c         |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           |  6 +++---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c         |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c      |  2 +-
>  drivers/gpu/drm/qxl/qxl_debugfs.c                |  2 +-
>  drivers/gpu/drm/radeon/radeon_gem.c              |  2 +-
>  drivers/gpu/drm/radeon/radeon_mn.c               |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                     | 14 +++++++-------
>  include/linux/dma-resv.h                         | 13 ++++++++++++-
>  15 files changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 10d70812373c..e05be4b52221 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -544,7 +544,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>  
>  	list = NULL;
>  
> -	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
> +	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_BOOKKEEP);
>  	dma_resv_for_each_fence_unlocked(&cursor, f) {
>  
>  		if (dma_resv_iter_is_restarted(&cursor)) {
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 062b57d63fa6..8ace9e84c845 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -296,7 +296,7 @@ int dma_resv(void)
>  	int r;
>  
>  	spin_lock_init(&fence_lock);
> -	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_READ;
> +	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_BOOKKEEP;
>  	     ++usage) {
>  		r = subtests(tests, (void *)(unsigned long)usage);
>  		if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index ab5d6b630a49..b461c3aab877 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -263,7 +263,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  	 */
>  	replacement = dma_fence_get_stub();
>  	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
> -				replacement, DMA_RESV_USAGE_READ);
> +				replacement, DMA_RESV_USAGE_BOOKKEEP);
>  	dma_fence_put(replacement);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index 490d2a7a3e2b..ddf46802b1ff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -111,7 +111,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>  	struct dma_fence *fence;
>  	int r;
>  
> -	r = dma_resv_get_singleton(resv, DMA_RESV_USAGE_READ, &fence);
> +	r = dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP, &fence);
>  	if (r)
>  		goto fallback;
>  
> @@ -139,7 +139,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>  	/* Not enough memory for the delayed delete, as last resort
>  	 * block for all the fences to complete.
>  	 */
> -	dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
> +	dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
>  			      false, MAX_SCHEDULE_TIMEOUT);
>  	amdgpu_pasid_free(pasid);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> index 86f5248676b0..b86c0b8252a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> @@ -75,7 +75,7 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
>  
>  	mmu_interval_set_seq(mni, cur_seq);
>  
> -	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
> +	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
>  				  false, MAX_SCHEDULE_TIMEOUT);
>  	mutex_unlock(&adev->notifier_lock);
>  	if (r <= 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 744e144e5fc2..11c46b3e4c60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -260,7 +260,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>  		return -EINVAL;
>  
>  	/* TODO: Use DMA_RESV_USAGE_READ here */
> -	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, f) {
> +	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, f) {
>  		dma_fence_chain_for_each(f, f) {
>  			struct dma_fence *tmp = dma_fence_chain_contained(f);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 9ffd8c4c34a0..63d8569ebef3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1357,7 +1357,7 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  	 * be resident to run successfully
>  	 */
>  	dma_resv_for_each_fence(&resv_cursor, bo->base.resv,
> -				DMA_RESV_USAGE_READ, f) {
> +				DMA_RESV_USAGE_BOOKKEEP, f) {
>  		if (amdkfd_fence_check_mm(f, current->mm))
>  			return false;
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index f3235aad7282..b4f0679f8797 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2105,7 +2105,7 @@ static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  
> -	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, fence) {
> +	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, fence) {
>  		/* Add a callback for each fence in the reservation object */
>  		amdgpu_vm_prt_get(adev);
>  		amdgpu_vm_add_prt_cb(adev, fence);
> @@ -2707,7 +2707,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
>  		return true;
>  
>  	/* Don't evict VM page tables while they are busy */
> -	if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_READ))
> +	if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP))
>  		return false;
>  
>  	/* Try to block ongoing updates */
> @@ -2888,7 +2888,7 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
>  long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
>  {
>  	timeout = dma_resv_wait_timeout(vm->root.bo->tbo.base.resv,
> -					DMA_RESV_USAGE_READ,
> +					DMA_RESV_USAGE_BOOKKEEP,
>  					true, timeout);
>  	if (timeout <= 0)
>  		return timeout;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index a200d3e66573..4115a222a853 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -66,7 +66,7 @@ bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
>  	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
>  
>  #ifdef CONFIG_LOCKDEP
> -	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_READ) &&
> +	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP) &&
>  		    i915_gem_object_evictable(obj));
>  #endif
>  	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 60feff9160de..1ddd81623691 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -85,7 +85,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
>  		return true;
>  
>  	/* we will unbind on next submission, still have userptr pins */
> -	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_READ, false,
> +	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
>  				  MAX_SCHEDULE_TIMEOUT);
>  	if (r <= 0)
>  		drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r);
> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
> index 33e5889d6608..2d9ed3b94574 100644
> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
> @@ -62,7 +62,7 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
>  		int rel = 0;
>  
>  		dma_resv_iter_begin(&cursor, bo->tbo.base.resv,
> -				    DMA_RESV_USAGE_READ);
> +				    DMA_RESV_USAGE_BOOKKEEP);
>  		dma_resv_for_each_fence_unlocked(&cursor, fence) {
>  			if (dma_resv_iter_is_restarted(&cursor))
>  				rel = 0;
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 71bf9299e45c..9587ab88bedd 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -162,7 +162,7 @@ static int radeon_gem_set_domain(struct drm_gem_object *gobj,
>  	if (domain == RADEON_GEM_DOMAIN_CPU) {
>  		/* Asking for cpu access wait for object idle */
>  		r = dma_resv_wait_timeout(robj->tbo.base.resv,
> -					  DMA_RESV_USAGE_READ,
> +					  DMA_RESV_USAGE_BOOKKEEP,
>  					  true, 30 * HZ);
>  		if (!r)
>  			r = -EBUSY;
> diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
> index 68ebeb1bdfff..29fe8423bd90 100644
> --- a/drivers/gpu/drm/radeon/radeon_mn.c
> +++ b/drivers/gpu/drm/radeon/radeon_mn.c
> @@ -66,7 +66,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
>  		return true;
>  	}
>  
> -	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
> +	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
>  				  false, MAX_SCHEDULE_TIMEOUT);
>  	if (r <= 0)
>  		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0f0aa96fb051..8fea9f88d118 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -272,7 +272,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  
> -	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_READ);
> +	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>  		if (!fence->ops->signaled)
>  			dma_fence_enable_sw_signaling(fence);
> @@ -301,7 +301,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>  	struct dma_resv *resv = &bo->base._resv;
>  	int ret;
>  
> -	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_READ))
> +	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
>  		ret = 0;
>  	else
>  		ret = -EBUSY;
> @@ -313,7 +313,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>  			dma_resv_unlock(bo->base.resv);
>  		spin_unlock(&bo->bdev->lru_lock);
>  
> -		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
> +		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
>  					     interruptible,
>  					     30 * HZ);
>  
> @@ -418,7 +418,7 @@ static void ttm_bo_release(struct kref *kref)
>  			 * fences block for the BO to become idle
>  			 */
>  			dma_resv_wait_timeout(bo->base.resv,
> -					      DMA_RESV_USAGE_READ, false,
> +					      DMA_RESV_USAGE_BOOKKEEP, false,
>  					      30 * HZ);
>  		}
>  
> @@ -429,7 +429,7 @@ static void ttm_bo_release(struct kref *kref)
>  		ttm_mem_io_free(bdev, bo->resource);
>  	}
>  
> -	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ) ||
> +	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP) ||
>  	    !dma_resv_trylock(bo->base.resv)) {
>  		/* The BO is not idle, resurrect it for delayed destroy */
>  		ttm_bo_flush_all_fences(bo);
> @@ -1074,13 +1074,13 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>  	long timeout = 15 * HZ;
>  
>  	if (no_wait) {
> -		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ))
> +		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP))
>  			return 0;
>  		else
>  			return -EBUSY;
>  	}
>  
> -	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_READ,
> +	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
>  					interruptible, timeout);
>  	if (timeout < 0)
>  		return timeout;
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 8f4f406a5d02..f7b8ed0e40ad 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -55,7 +55,7 @@ struct dma_resv_list;
>   * This enum describes the different use cases for a dma_resv object and
>   * controls which fences are returned when queried.
>   *
> - * An important fact is that there is the order KERNEL<WRITE<READ and
> + * An important fact is that there is the order KERNEL<WRITE<READ<BOOKKEEP and
>   * when the dma_resv object is asked for fences for one use case the fences
>   * for the lower use case are returned as well.
>   *
> @@ -93,6 +93,17 @@ enum dma_resv_usage {
>  	 * an implicit read dependency.
>  	 */
>  	DMA_RESV_USAGE_READ,
> +
> +	/**
> +	 * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
> +	 *
> +	 * This should be used by submissions which don't want to participate in
> +	 * implicit synchronization.
> +	 *
> +	 * The most common case are preemption fences as well as page table
> +	 * updates.

Maybe add here "... and their TLB flushes." Since we kinda screwed that up
a bit in i915 and scored a CVE for it :-)

I haven't checked whether you've really caught them all, but I guess we
can do that once more when this has all landed.

With or without the bikesheds:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> +	 */
> +	DMA_RESV_USAGE_BOOKKEEP
>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
