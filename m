Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16265347F26
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A896ECB7;
	Wed, 24 Mar 2021 17:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C316ECBA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:19:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j18so25244513wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GuYNvthxKkSXOkGEh4ApOtnvBrnvJzBzXlbpH0uAOTQ=;
 b=Ll85cQeevLctRVwayVf4UC/+KA+OA05zjqRfYi3dlTnwGdXXP9NSMQXYfagYrxbJ1Z
 R6IHNzma4jzBTomqpx7arzw+zLrJmY3tYPbKpr34UdoQhk42lnNv1k5yjBHvmKed665t
 6xikCN+j5NYrC+zwwTqrqaBxfUVAKjW81yKhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GuYNvthxKkSXOkGEh4ApOtnvBrnvJzBzXlbpH0uAOTQ=;
 b=DUkIX3mpjqY40KfD1TyWniq+LlaQpuMh3rNELhsf7z0/cA9a2L65RaJ8XslLXQZxvk
 ctYDeQjRhZzjaJCFZYOWCFklGWZuCeqT7cUjX19I4DIxHnZQOBwJ2D6enoTMDZMtSnCQ
 8gz+NGu3Jr5BfHcPIjAQateUAQQCl3Riqbe0UtsnUfPTGmbl8S9biO1SUxGjuI86ne7D
 em4ma0wLnUmlBvRn53wP1Dz1S+7OrBcdM/7XGjfnReARkScUyivIVCSyaS9OMP0fu1HS
 Qinql6HUs2rlz3hFIGzTIppnR0C6YdO/1i3BWgXRvbNsl1UrpkJkbF6lDEOTElrqoBGA
 U/9Q==
X-Gm-Message-State: AOAM530Bg/C5dG3/8Un1syeEO29Kg0v5fOySdwYfAhCj5H2XFrWBh6Zr
 H+T3VuJTCAVRwhAfsA/FpNdaI3Ud+ksXMCMB
X-Google-Smtp-Source: ABdhPJyroVlME6YW2VqzHjKiDb44253RvEsYist+L7VfbSbK3X2CUvJVR0Z5LQ71Igfd+aT5zEhEQg==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr4610631wry.407.1616606385002; 
 Wed, 24 Mar 2021 10:19:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z2sm3899450wrv.47.2021.03.24.10.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:19:44 -0700 (PDT)
Date: Wed, 24 Mar 2021 18:19:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 70/70] drm/i915: Remove asynchronous vma
 binding
Message-ID: <YFt0rhQAuxyD7Gcu@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-71-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-71-maarten.lankhorst@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:59PM +0100, Maarten Lankhorst wrote:
> The current asynchronous work is done in a dma_fence_work, which
> has signalling annotations, because dma_fence_work signals on completion.
> 
> On braswell, we can call stop_machine inside fence_work, causing a splat
> because memory allocation inside stop_machine is allowed.
> 
> Strictly speaking this is a false positive, but go for safe and remove
> asynchronous vma binding entirely.

Please add at least the condensed version of the full dependency cycle
here. I'm also not sure we can call it a false positive, that's always a
bit a bold statement for lockdep splats which needs extroadinary evidence.
So maybe drop that part.

Also maybe good to reference the commit which added async ggtt pte writes
for reference here.

With those things on the commit message addressed:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c |   3 -
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c       |   1 -
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c       |   1 -
>  drivers/gpu/drm/i915/gt/intel_ggtt.c       |   4 -
>  drivers/gpu/drm/i915/gt/intel_gtt.h        |   2 -
>  drivers/gpu/drm/i915/i915_gem.c            |   6 -
>  drivers/gpu/drm/i915/i915_vma.c            | 174 +++------------------
>  drivers/gpu/drm/i915/i915_vma.h            |   5 +-
>  drivers/gpu/drm/i915/i915_vma_types.h      |   3 -
>  9 files changed, 21 insertions(+), 178 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 48b2258091c3..52b35b1a14f1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -505,9 +505,6 @@ static void dbg_poison(struct i915_ggtt *ggtt,
>  	if (!drm_mm_node_allocated(&ggtt->error_capture))
>  		return;
>  
> -	if (ggtt->vm.bind_async_flags & I915_VMA_GLOBAL_BIND)
> -		return; /* beware stop_machine() inversion */
> -
>  	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
>  
>  	mutex_lock(&ggtt->error_mutex);
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index e08dff376339..0c5a9a767849 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -436,7 +436,6 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
>  	ppgtt->base.vm.pd_shift = ilog2(SZ_4K * SZ_4K / sizeof(gen6_pte_t));
>  	ppgtt->base.vm.top = 1;
>  
> -	ppgtt->base.vm.bind_async_flags = I915_VMA_LOCAL_BIND;
>  	ppgtt->base.vm.allocate_va_range = gen6_alloc_va_range;
>  	ppgtt->base.vm.clear_range = gen6_ppgtt_clear_range;
>  	ppgtt->base.vm.insert_entries = gen6_ppgtt_insert_entries;
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 176c19633412..92f8a23e66cc 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -736,7 +736,6 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
>  			goto err_free_pd;
>  	}
>  
> -	ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
>  	ppgtt->vm.insert_entries = gen8_ppgtt_insert;
>  	ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
>  	ppgtt->vm.clear_range = gen8_ppgtt_clear;
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index c2fc49495029..2a36b09a3761 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -127,7 +127,6 @@ void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>  
>  	list_for_each_entry_safe(vma, vn, &ggtt->vm.bound_list, vm_link) {
>  		GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> -		i915_vma_wait_for_bind(vma);
>  
>  		if (i915_vma_is_pinned(vma))
>  			continue;
> @@ -671,7 +670,6 @@ static int init_aliasing_ppgtt(struct i915_ggtt *ggtt)
>  	ppgtt->vm.allocate_va_range(&ppgtt->vm, &stash, 0, ggtt->vm.total);
>  
>  	ggtt->alias = ppgtt;
> -	ggtt->vm.bind_async_flags |= ppgtt->vm.bind_async_flags;
>  
>  	GEM_BUG_ON(ggtt->vm.vma_ops.bind_vma != ggtt_bind_vma);
>  	ggtt->vm.vma_ops.bind_vma = aliasing_gtt_bind_vma;
> @@ -911,8 +909,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	    IS_CHERRYVIEW(i915) /* fails with concurrent use/update */) {
>  		ggtt->vm.insert_entries = bxt_vtd_ggtt_insert_entries__BKL;
>  		ggtt->vm.insert_page    = bxt_vtd_ggtt_insert_page__BKL;
> -		ggtt->vm.bind_async_flags =
> -			I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
>  	}
>  
>  	ggtt->invalidate = gen8_ggtt_invalidate;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index e67e34e17913..d9d2ca8b4b61 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -230,8 +230,6 @@ struct i915_address_space {
>  	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
>  	u64 reserved;		/* size addr space reserved */
>  
> -	unsigned int bind_async_flags;
> -
>  	/*
>  	 * Each active user context has its own address space (in full-ppgtt).
>  	 * Since the vm may be shared between multiple contexts, we count how
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index d23a417295f8..a45ff3b76e93 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -943,12 +943,6 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>  		mutex_unlock(&ggtt->vm.mutex);
>  	}
>  
> -	ret = i915_vma_wait_for_bind(vma);
> -	if (ret) {
> -		i915_vma_unpin(vma);
> -		return ERR_PTR(ret);
> -	}
> -
>  	return vma;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 03291c032814..260020e2dca6 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -289,79 +289,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>  	return vma;
>  }
>  
> -struct i915_vma_work {
> -	struct dma_fence_work base;
> -	struct i915_address_space *vm;
> -	struct i915_vm_pt_stash stash;
> -	struct i915_vma *vma;
> -	struct drm_i915_gem_object *pinned;
> -	struct i915_sw_dma_fence_cb cb;
> -	enum i915_cache_level cache_level;
> -	unsigned int flags;
> -};
> -
> -static int __vma_bind(struct dma_fence_work *work)
> -{
> -	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
> -	struct i915_vma *vma = vw->vma;
> -
> -	vma->ops->bind_vma(vw->vm, &vw->stash,
> -			   vma, vw->cache_level, vw->flags);
> -	return 0;
> -}
> -
> -static void __vma_release(struct dma_fence_work *work)
> -{
> -	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
> -
> -	if (vw->pinned) {
> -		__i915_gem_object_unpin_pages(vw->pinned);
> -		i915_gem_object_put(vw->pinned);
> -	}
> -
> -	i915_vm_free_pt_stash(vw->vm, &vw->stash);
> -	i915_vm_put(vw->vm);
> -}
> -
> -static const struct dma_fence_work_ops bind_ops = {
> -	.name = "bind",
> -	.work = __vma_bind,
> -	.release = __vma_release,
> -};
> -
> -struct i915_vma_work *i915_vma_work(void)
> -{
> -	struct i915_vma_work *vw;
> -
> -	vw = kzalloc(sizeof(*vw), GFP_KERNEL);
> -	if (!vw)
> -		return NULL;
> -
> -	dma_fence_work_init(&vw->base, &bind_ops);
> -	vw->base.dma.error = -EAGAIN; /* disable the worker by default */
> -
> -	return vw;
> -}
> -
> -int i915_vma_wait_for_bind(struct i915_vma *vma)
> -{
> -	int err = 0;
> -
> -	if (rcu_access_pointer(vma->active.excl.fence)) {
> -		struct dma_fence *fence;
> -
> -		rcu_read_lock();
> -		fence = dma_fence_get_rcu_safe(&vma->active.excl.fence);
> -		rcu_read_unlock();
> -		if (fence) {
> -			err = dma_fence_wait(fence, MAX_SCHEDULE_TIMEOUT);
> -			dma_fence_put(fence);
> -		}
> -	}
> -
> -	return err;
> -}
> -
>  /**
>   * i915_vma_bind - Sets up PTEs for an VMA in it's corresponding address space.
>   * @vma: VMA to map
> @@ -375,8 +302,7 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
>   */
>  int i915_vma_bind(struct i915_vma *vma,
>  		  enum i915_cache_level cache_level,
> -		  u32 flags,
> -		  struct i915_vma_work *work)
> +		  u32 flags, struct i915_vm_pt_stash *stash)
>  {
>  	u32 bind_flags;
>  	u32 vma_flags;
> @@ -405,39 +331,7 @@ int i915_vma_bind(struct i915_vma *vma,
>  	GEM_BUG_ON(!vma->pages);
>  
>  	trace_i915_vma_bind(vma, bind_flags);
> -	if (work && bind_flags & vma->vm->bind_async_flags) {
> -		struct dma_fence *prev;
> -
> -		work->vma = vma;
> -		work->cache_level = cache_level;
> -		work->flags = bind_flags;
> -
> -		/*
> -		 * Note we only want to chain up to the migration fence on
> -		 * the pages (not the object itself). As we don't track that,
> -		 * yet, we have to use the exclusive fence instead.
> -		 *
> -		 * Also note that we do not want to track the async vma as
> -		 * part of the obj->resv->excl_fence as it only affects
> -		 * execution and not content or object's backing store lifetime.
> -		 */
> -		prev = i915_active_set_exclusive(&vma->active, &work->base.dma);
> -		if (prev) {
> -			__i915_sw_fence_await_dma_fence(&work->base.chain,
> -							prev,
> -							&work->cb);
> -			dma_fence_put(prev);
> -		}
> -
> -		work->base.dma.error = 0; /* enable the queue_work() */
> -
> -		if (vma->obj) {
> -			__i915_gem_object_pin_pages(vma->obj);
> -			work->pinned = i915_gem_object_get(vma->obj);
> -		}
> -	} else {
> -		vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, bind_flags);
> -	}
> +	vma->ops->bind_vma(vma->vm, stash, vma, cache_level, bind_flags);
>  
>  	atomic_or(bind_flags, &vma->flags);
>  	return 0;
> @@ -531,9 +425,6 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
>  	if (!drm_mm_node_allocated(&vma->node))
>  		return false;
>  
> -	if (test_bit(I915_VMA_ERROR_BIT, __i915_vma_flags(vma)))
> -		return true;
> -
>  	if (vma->node.size < size)
>  		return true;
>  
> @@ -752,7 +643,7 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
>  		if (unlikely(flags & ~bound))
>  			return false;
>  
> -		if (unlikely(bound & (I915_VMA_OVERFLOW | I915_VMA_ERROR)))
> +		if (unlikely(bound & I915_VMA_OVERFLOW))
>  			return false;
>  
>  		if (!(bound & I915_VMA_PIN_MASK))
> @@ -770,7 +661,7 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
>  	 */
>  	mutex_lock(&vma->vm->mutex);
>  	do {
> -		if (unlikely(bound & (I915_VMA_OVERFLOW | I915_VMA_ERROR))) {
> +		if (unlikely(bound & I915_VMA_OVERFLOW)) {
>  			pinned = false;
>  			break;
>  		}
> @@ -858,10 +749,10 @@ static void vma_unbind_pages(struct i915_vma *vma)
>  int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  		    u64 size, u64 alignment, u64 flags)
>  {
> -	struct i915_vma_work *work = NULL;
>  	intel_wakeref_t wakeref = 0;
>  	unsigned int bound;
>  	int err;
> +	struct i915_vm_pt_stash stash = {};
>  
>  #ifdef CONFIG_PROVE_LOCKING
>  	if (debug_locks && !WARN_ON(!ww) && vma->resv)
> @@ -884,33 +775,21 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	if (flags & PIN_GLOBAL)
>  		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>  
> -	if (flags & vma->vm->bind_async_flags) {
> -		/* lock VM */
> -		err = i915_vm_lock_objects(vma->vm, ww);
> +	if (vma->vm->allocate_va_range) {
> +		err = i915_vm_alloc_pt_stash(vma->vm,
> +					     &stash,
> +					     vma->size);
>  		if (err)
>  			goto err_rpm;
>  
> -		work = i915_vma_work();
> -		if (!work) {
> -			err = -ENOMEM;
> +		err = i915_vm_lock_objects(vma->vm, ww);
> +		if (err)
>  			goto err_rpm;
> -		}
>  
> -		work->vm = i915_vm_get(vma->vm);
> -
> -		/* Allocate enough page directories to used PTE */
> -		if (vma->vm->allocate_va_range) {
> -			err = i915_vm_alloc_pt_stash(vma->vm,
> -						     &work->stash,
> -						     vma->size);
> -			if (err)
> -				goto err_fence;
> -
> -			err = i915_vm_pin_pt_stash(vma->vm,
> -						   &work->stash);
> -			if (err)
> -				goto err_fence;
> -		}
> +		err = i915_vm_pin_pt_stash(vma->vm,
> +					   &stash);
> +		if (err)
> +			goto err_rpm;
>  	}
>  
>  	/*
> @@ -933,7 +812,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	err = mutex_lock_interruptible_nested(&vma->vm->mutex,
>  					      !(flags & PIN_GLOBAL));
>  	if (err)
> -		goto err_fence;
> +		goto err_rpm;
>  
>  	/* No more allocations allowed now we hold vm->mutex */
>  
> @@ -943,11 +822,6 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	}
>  
>  	bound = atomic_read(&vma->flags);
> -	if (unlikely(bound & I915_VMA_ERROR)) {
> -		err = -ENOMEM;
> -		goto err_unlock;
> -	}
> -
>  	if (unlikely(!((bound + 1) & I915_VMA_PIN_MASK))) {
>  		err = -EAGAIN; /* pins are meant to be fairly temporary */
>  		goto err_unlock;
> @@ -974,7 +848,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	GEM_BUG_ON(!vma->pages);
>  	err = i915_vma_bind(vma,
>  			    vma->obj ? vma->obj->cache_level : 0,
> -			    flags, work);
> +			    flags, &stash);
>  	if (err)
>  		goto err_remove;
>  
> @@ -997,10 +871,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	i915_active_release(&vma->active);
>  err_unlock:
>  	mutex_unlock(&vma->vm->mutex);
> -err_fence:
> -	if (work)
> -		dma_fence_work_commit_imm(&work->base);
>  err_rpm:
> +	i915_vm_free_pt_stash(vma->vm, &stash);
>  	if (wakeref)
>  		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>  	vma_put_pages(vma);
> @@ -1035,14 +907,8 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  			err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
>  		else
>  			err = i915_vma_pin(vma, 0, align, flags | PIN_GLOBAL);
> -		if (err != -ENOSPC) {
> -			if (!err) {
> -				err = i915_vma_wait_for_bind(vma);
> -				if (err)
> -					i915_vma_unpin(vma);
> -			}
> +		if (err != -ENOSPC)
>  			return err;
> -		}
>  
>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
>  		flush_idle_contexts(vm->gt);
> @@ -1307,7 +1173,7 @@ void __i915_vma_evict(struct i915_vma *vma)
>  		trace_i915_vma_unbind(vma);
>  		vma->ops->unbind_vma(vma->vm, vma);
>  	}
> -	atomic_and(~(I915_VMA_BIND_MASK | I915_VMA_ERROR | I915_VMA_GGTT_WRITE),
> +	atomic_and(~(I915_VMA_BIND_MASK | I915_VMA_GGTT_WRITE),
>  		   &vma->flags);
>  
>  	i915_vma_detach(vma);
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 8df784a026d2..d1d0fc76ef99 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -195,11 +195,10 @@ i915_vma_compare(struct i915_vma *vma,
>  	return memcmp(&vma->ggtt_view.partial, &view->partial, view->type);
>  }
>  
> -struct i915_vma_work *i915_vma_work(void);
>  int i915_vma_bind(struct i915_vma *vma,
>  		  enum i915_cache_level cache_level,
>  		  u32 flags,
> -		  struct i915_vma_work *work);
> +		  struct i915_vm_pt_stash *stash);
>  
>  bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color);
>  bool i915_vma_misplaced(const struct i915_vma *vma,
> @@ -418,8 +417,6 @@ struct i915_vma *i915_vma_make_unshrinkable(struct i915_vma *vma);
>  void i915_vma_make_shrinkable(struct i915_vma *vma);
>  void i915_vma_make_purgeable(struct i915_vma *vma);
>  
> -int i915_vma_wait_for_bind(struct i915_vma *vma);
> -
>  static inline int i915_vma_sync(struct i915_vma *vma)
>  {
>  	/* Wait for the asynchronous bindings and pending GPU reads */
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index f5cb848b7a7e..c671b2b5caa1 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -236,9 +236,6 @@ struct i915_vma {
>  
>  #define I915_VMA_ALLOC_BIT	12
>  
> -#define I915_VMA_ERROR_BIT	13
> -#define I915_VMA_ERROR		((int)BIT(I915_VMA_ERROR_BIT))
> -
>  #define I915_VMA_GGTT_BIT	14
>  #define I915_VMA_CAN_FENCE_BIT	15
>  #define I915_VMA_USERFAULT_BIT	16
> -- 
> 2.31.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
