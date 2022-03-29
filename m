Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D54EB0DE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 17:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6F810F0B9;
	Tue, 29 Mar 2022 15:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770510F0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 15:43:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so1453639wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wRbBNM9MtCFZSc+72xEY37oF4RzUbwkmjKoeLQrdiZk=;
 b=BBMlD1AUAT1LX3zfyFH4XzGqZRrALDeUsKwl5KsPzabihcf63sAUVnmEDeE61ACBVt
 u2L8GUWVeXu9GF2kTRoVUtO/8ml1EH3309sJ4UyCLW/H8b73Px/7GsJRLkecWnZOyPtQ
 rv+KWj10s1MLmjTdYN7AWt79i5kKW2FxLihuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wRbBNM9MtCFZSc+72xEY37oF4RzUbwkmjKoeLQrdiZk=;
 b=KU+Fk1RxUs65Z030DtD/pwfe6H9mbTo72xrgaqAlPW5jaLWwfxUicXkWoKIYc350uB
 jPU+4jr0IEpKx/2oFD60awutSmV000PQB2fHXrKKkP5nz1BxtcYwRlJOAk/4RUAq/G5q
 bhcFIg4tvq7katkjeCG4b+6IKsmLg21NRQiqpwd0vpDAX9Sput1uzT4jlmHAWzQ6pBPe
 oRYgSwWK+cRiBogJ3p6w/w7g1TPX3eeTSo4MsSa+0yPtHLrO7ySt0fKNP0aE1jCWZ7H6
 axTquORnlu8reB7JY7yMsRdor/AGFxifTnpPmM77mhyDLlGrIpZuiRVb/xu7uum5TkZT
 0HoA==
X-Gm-Message-State: AOAM531nulEIqgbRCrjx34vG85boGzVlQ1LEpgC3I34GG/GRytBcjHmT
 XRZuxrKMflqMPfjS2EzDmTHOaQ==
X-Google-Smtp-Source: ABdhPJz7dZ3ItC0TEAUWyyNJjY2O0VXel0K6zUcicl+4yg4DNhsHkwgbpzFjxYPSNC9qqBEyaanMmw==
X-Received: by 2002:a05:600c:364f:b0:38c:c9f9:f867 with SMTP id
 y15-20020a05600c364f00b0038cc9f9f867mr288713wmq.155.1648568594008; 
 Tue, 29 Mar 2022 08:43:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d6c6c000000b00203ec2b1255sm19541409wrz.60.2022.03.29.08.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:43:13 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:43:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 17/23] dma-buf: specify usage while adding fences to
 dma_resv obj v5
Message-ID: <YkMpD6bamZ3THpMg@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-17-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-17-christian.koenig@amd.com>
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

On Mon, Mar 21, 2022 at 02:58:50PM +0100, Christian König wrote:
> Instead of distingting between shared and exclusive fences specify
> the fence usage while adding fences.
> 
> Rework all drivers to use this interface instead and deprecate the old one.
> 
> v2: some kerneldoc comments suggested by Daniel
> v3: fix a missing case in radeon
> v4: rebase on nouveau changes, fix lockdep and temporary disable warning
> v5: more documentation updates
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                    | 345 ++++++++----------
>  drivers/dma-buf/st-dma-resv.c                 | 101 ++---
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   6 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  10 +-
>  drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |   5 +-
>  drivers/gpu/drm/i915/i915_vma.c               |   6 +-
>  drivers/gpu/drm/lima/lima_gem.c               |   2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |   9 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.c       |   4 +-
>  drivers/gpu/drm/qxl/qxl_release.c             |   3 +-
>  drivers/gpu/drm/radeon/radeon_object.c        |   6 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  |   2 +-
>  drivers/gpu/drm/ttm/ttm_bo_util.c             |   5 +-
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c        |   6 +-
>  drivers/gpu/drm/v3d/v3d_gem.c                 |   4 +-
>  drivers/gpu/drm/vc4/vc4_gem.c                 |   2 +-
>  drivers/gpu/drm/vgem/vgem_fence.c             |   9 +-
>  drivers/gpu/drm/virtio/virtgpu_gem.c          |   3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   3 +-
>  include/linux/dma-buf.h                       |  17 +-
>  include/linux/dma-resv.h                      |  72 ++--
>  26 files changed, 276 insertions(+), 370 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index bb7b023c2d33..26257ba1527e 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -44,12 +44,12 @@
>  /**
>   * DOC: Reservation Object Overview
>   *
> - * The reservation object provides a mechanism to manage shared and
> - * exclusive fences associated with a buffer.  A reservation object
> - * can have attached one exclusive fence (normally associated with
> - * write operations) or N shared fences (read operations).  The RCU
> - * mechanism is used to protect read access to fences from locked
> - * write-side updates.
> + * The reservation object provides a mechanism to manage a container of
> + * dma_fence object associated with a resource. A reservation object
> + * can have any number of fences attaches to it. Each fence carring an usage
								carries

> + * parameter determining how the operation represented by the fence is using the
> + * resource. The RCU mechanism is used to protect read access to fences from
> + * locked write-side updates.
>   *
>   * See struct dma_resv for more details.
>   */
> @@ -57,29 +57,74 @@
>  DEFINE_WD_CLASS(reservation_ww_class);
>  EXPORT_SYMBOL(reservation_ww_class);
>  
> +/* Mask for the lower fence pointer bits */
> +#define DMA_RESV_LIST_MASK	0x3
> +
>  struct dma_resv_list {
>  	struct rcu_head rcu;
> -	u32 shared_count, shared_max;
> -	struct dma_fence __rcu *shared[];
> +	u32 num_fences, max_fences;
> +	struct dma_fence __rcu *table[];
>  };
>  
> +/**
> + * dma_resv_list_entry - extract fence and usage from a list entry
> + * @list: the list to extract and entry from
> + * @index: which entry we want
> + * @resv: optional dma_resv obj for lockdep check that the access is allowed
> + * @fence: the resulting fence
> + * @usage: the resulting usage
> + *
> + * Extract the fence and usage flags from an RCU protected entry in the list.
> + */

No kerneldoc for static helpers which are internal to .c files. I was
going a bit wtf why would you export such a bad internals-heavy interface
until I realized it's only used in dma-resv.c.

> +static void dma_resv_list_entry(struct dma_resv_list *list, unsigned int index,
> +				struct dma_resv *resv, struct dma_fence **fence,
> +				enum dma_resv_usage *usage)
> +{
> +	long tmp;
> +
> +	tmp = (long)rcu_dereference_check(list->table[index],
> +					  resv ? dma_resv_held(resv) : true);
> +	*fence = (struct dma_fence *)(tmp & ~DMA_RESV_LIST_MASK);
> +	if (usage)
> +		*usage = tmp & DMA_RESV_LIST_MASK;
> +}
> +
> +/**
> + * dma_resv_list_set - set fence and usage at a specific index
> + * @list: the list to modify
> + * @index: where to make the change
> + * @fence: the fence to set
> + * @usage: the usage to set
> + *
> + * Set the fence and usage flags at the specific index in the list.
> + */

Same here.

The kerneldoc we write has driver authors as target audience, so anything
that's too much internals should only be a comment.

> +static void dma_resv_list_set(struct dma_resv_list *list,
> +			      unsigned int index,
> +			      struct dma_fence *fence,
> +			      enum dma_resv_usage usage)
> +{
> +	long tmp = ((long)fence) | usage;
> +
> +	RCU_INIT_POINTER(list->table[index], (struct dma_fence *)tmp);
> +}
> +
>  /**
>   * dma_resv_list_alloc - allocate fence list
> - * @shared_max: number of fences we need space for
> + * @max_fences: number of fences we need space for
>   *
>   * Allocate a new dma_resv_list and make sure to correctly initialize
> - * shared_max.
> + * max_fences.
>   */

Maybe do a cleanup of all these :-)

> -static struct dma_resv_list *dma_resv_list_alloc(unsigned int shared_max)
> +static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
>  {
>  	struct dma_resv_list *list;
>  
> -	list = kmalloc(struct_size(list, shared, shared_max), GFP_KERNEL);
> +	list = kmalloc(struct_size(list, table, max_fences), GFP_KERNEL);
>  	if (!list)
>  		return NULL;
>  
> -	list->shared_max = (ksize(list) - offsetof(typeof(*list), shared)) /
> -		sizeof(*list->shared);
> +	list->max_fences = (ksize(list) - offsetof(typeof(*list), table)) /
> +		sizeof(*list->table);
>  
>  	return list;
>  }
> @@ -97,9 +142,12 @@ static void dma_resv_list_free(struct dma_resv_list *list)
>  	if (!list)
>  		return;
>  
> -	for (i = 0; i < list->shared_count; ++i)
> -		dma_fence_put(rcu_dereference_protected(list->shared[i], true));
> +	for (i = 0; i < list->num_fences; ++i) {
> +		struct dma_fence *fence;
>  
> +		dma_resv_list_entry(list, i, NULL, &fence, NULL);
> +		dma_fence_put(fence);
> +	}
>  	kfree_rcu(list, rcu);
>  }
>  
> @@ -112,8 +160,7 @@ void dma_resv_init(struct dma_resv *obj)
>  	ww_mutex_init(&obj->lock, &reservation_ww_class);
>  	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
>  
> -	RCU_INIT_POINTER(obj->fence, NULL);
> -	RCU_INIT_POINTER(obj->fence_excl, NULL);
> +	RCU_INIT_POINTER(obj->fences, NULL);
>  }
>  EXPORT_SYMBOL(dma_resv_init);
>  
> @@ -123,46 +170,31 @@ EXPORT_SYMBOL(dma_resv_init);
>   */
>  void dma_resv_fini(struct dma_resv *obj)
>  {
> -	struct dma_resv_list *fobj;
> -	struct dma_fence *excl;
> -
>  	/*
>  	 * This object should be dead and all references must have
>  	 * been released to it, so no need to be protected with rcu.
>  	 */
> -	excl = rcu_dereference_protected(obj->fence_excl, 1);
> -	if (excl)
> -		dma_fence_put(excl);
> -
> -	fobj = rcu_dereference_protected(obj->fence, 1);
> -	dma_resv_list_free(fobj);
> +	dma_resv_list_free(rcu_dereference_protected(obj->fences, true));
>  	ww_mutex_destroy(&obj->lock);
>  }
>  EXPORT_SYMBOL(dma_resv_fini);
>  
> -static inline struct dma_fence *
> -dma_resv_excl_fence(struct dma_resv *obj)
> +static inline struct dma_resv_list *dma_resv_fences_list(struct dma_resv *obj)
>  {
> -       return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
> -}
> -
> -static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
> -{
> -	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
> +	return rcu_dereference_check(obj->fences, dma_resv_held(obj));
>  }
>  
>  /**
> - * dma_resv_reserve_fences - Reserve space to add shared fences to
> - * a dma_resv.
> + * dma_resv_reserve_fences - Reserve space to add fences to a dma_resv object.
>   * @obj: reservation object
>   * @num_fences: number of fences we want to add
>   *
> - * Should be called before dma_resv_add_shared_fence().  Must
> - * be called with @obj locked through dma_resv_lock().
> + * Should be called before dma_resv_add_fence().  Must be called with @obj
> + * locked through dma_resv_lock().
>   *
>   * Note that the preallocated slots need to be re-reserved if @obj is unlocked
> - * at any time before calling dma_resv_add_shared_fence(). This is validated
> - * when CONFIG_DEBUG_MUTEXES is enabled.
> + * at any time before calling dma_resv_add_fence(). This is validated when
> + * CONFIG_DEBUG_MUTEXES is enabled.
>   *
>   * RETURNS
>   * Zero for success, or -errno
> @@ -174,11 +206,11 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
>  
>  	dma_resv_assert_held(obj);
>  
> -	old = dma_resv_shared_list(obj);
> -	if (old && old->shared_max) {
> -		if ((old->shared_count + num_fences) <= old->shared_max)
> +	old = dma_resv_fences_list(obj);
> +	if (old && old->max_fences) {
> +		if ((old->num_fences + num_fences) <= old->max_fences)
>  			return 0;
> -		max = max(old->shared_count + num_fences, old->shared_max * 2);
> +		max = max(old->num_fences + num_fences, old->max_fences * 2);
>  	} else {
>  		max = max(4ul, roundup_pow_of_two(num_fences));
>  	}
> @@ -193,27 +225,27 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
>  	 * references from the old struct are carried over to
>  	 * the new.
>  	 */
> -	for (i = 0, j = 0, k = max; i < (old ? old->shared_count : 0); ++i) {
> +	for (i = 0, j = 0, k = max; i < (old ? old->num_fences : 0); ++i) {
> +		enum dma_resv_usage usage;
>  		struct dma_fence *fence;
>  
> -		fence = rcu_dereference_protected(old->shared[i],
> -						  dma_resv_held(obj));
> +		dma_resv_list_entry(old, i, obj, &fence, &usage);
>  		if (dma_fence_is_signaled(fence))
> -			RCU_INIT_POINTER(new->shared[--k], fence);
> +			RCU_INIT_POINTER(new->table[--k], fence);
>  		else
> -			RCU_INIT_POINTER(new->shared[j++], fence);
> +			dma_resv_list_set(new, j++, fence, usage);
>  	}
> -	new->shared_count = j;
> +	new->num_fences = j;
>  
>  	/*
>  	 * We are not changing the effective set of fences here so can
>  	 * merely update the pointer to the new array; both existing
>  	 * readers and new readers will see exactly the same set of
> -	 * active (unsignaled) shared fences. Individual fences and the
> +	 * active (unsignaled) fences. Individual fences and the
>  	 * old array are protected by RCU and so will not vanish under
>  	 * the gaze of the rcu_read_lock() readers.
>  	 */
> -	rcu_assign_pointer(obj->fence, new);
> +	rcu_assign_pointer(obj->fences, new);
>  
>  	if (!old)
>  		return 0;
> @@ -222,7 +254,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
>  	for (i = k; i < max; ++i) {
>  		struct dma_fence *fence;
>  
> -		fence = rcu_dereference_protected(new->shared[i],
> +		fence = rcu_dereference_protected(new->table[i],
>  						  dma_resv_held(obj));
>  		dma_fence_put(fence);
>  	}
> @@ -234,37 +266,39 @@ EXPORT_SYMBOL(dma_resv_reserve_fences);
>  
>  #ifdef CONFIG_DEBUG_MUTEXES
>  /**
> - * dma_resv_reset_shared_max - reset shared fences for debugging
> + * dma_resv_reset_max_fences - reset fences for debugging
>   * @obj: the dma_resv object to reset
>   *
> - * Reset the number of pre-reserved shared slots to test that drivers do
> + * Reset the number of pre-reserved fence slots to test that drivers do
>   * correct slot allocation using dma_resv_reserve_fences(). See also
> - * &dma_resv_list.shared_max.
> + * &dma_resv_list.max_fences.
>   */
> -void dma_resv_reset_shared_max(struct dma_resv *obj)
> +void dma_resv_reset_max_fences(struct dma_resv *obj)
>  {
> -	struct dma_resv_list *fences = dma_resv_shared_list(obj);
> +	struct dma_resv_list *fences = dma_resv_fences_list(obj);
>  
>  	dma_resv_assert_held(obj);
>  
> -	/* Test shared fence slot reservation */
> +	/* Test fence slot reservation */
>  	if (fences)
> -		fences->shared_max = fences->shared_count;
> +		fences->max_fences = fences->num_fences;
>  }
> -EXPORT_SYMBOL(dma_resv_reset_shared_max);
> +EXPORT_SYMBOL(dma_resv_reset_max_fences);
>  #endif
>  
>  /**
> - * dma_resv_add_shared_fence - Add a fence to a shared slot
> + * dma_resv_add_fence - Add a fence to the dma_resv obj
>   * @obj: the reservation object
> - * @fence: the shared fence to add
> + * @fence: the fence to add
> + * @usage: how the fence is used, see enum dma_resv_usage
>   *
> - * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(), and
> + * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
>   * dma_resv_reserve_fences() has been called.
>   *
>   * See also &dma_resv.fence for a discussion of the semantics.
>   */
> -void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
> +void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
> +			enum dma_resv_usage usage)
>  {
>  	struct dma_resv_list *fobj;
>  	struct dma_fence *old;
> @@ -274,44 +308,45 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  
>  	dma_resv_assert_held(obj);
>  
> -	/* Drivers should not add containers here, instead add each fence
> -	 * individually.
> +	/* TODO: Drivers should not add containers here, instead add each fence
> +	 * individually. Disabled for now until we cleaned up amdgpu/ttm.
>  	 */
> -	WARN_ON(dma_fence_is_container(fence));
> +	/* WARN_ON(dma_fence_is_container(fence)); */

Uh this looks like it's a misplaced hack?

If you do need it and cant get rid of it with patch reordering, then I
think it needs to be split out for extra attention.

>  
> -	fobj = dma_resv_shared_list(obj);
> -	count = fobj->shared_count;
> +	fobj = dma_resv_fences_list(obj);
> +	count = fobj->num_fences;
>  
>  	write_seqcount_begin(&obj->seq);
>  
>  	for (i = 0; i < count; ++i) {
> +		enum dma_resv_usage old_usage;
>  
> -		old = rcu_dereference_protected(fobj->shared[i],
> -						dma_resv_held(obj));
> -		if (old->context == fence->context ||
> +		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
> +		if ((old->context == fence->context && old_usage >= usage) ||
>  		    dma_fence_is_signaled(old))
>  			goto replace;
>  	}
>  
> -	BUG_ON(fobj->shared_count >= fobj->shared_max);
> +	BUG_ON(fobj->num_fences >= fobj->max_fences);
>  	old = NULL;
>  	count++;
>  
>  replace:
> -	RCU_INIT_POINTER(fobj->shared[i], fence);
> -	/* pointer update must be visible before we extend the shared_count */
> -	smp_store_mb(fobj->shared_count, count);
> +	dma_resv_list_set(fobj, i, fence, usage);
> +	/* pointer update must be visible before we extend the num_fences */
> +	smp_store_mb(fobj->num_fences, count);
>  
>  	write_seqcount_end(&obj->seq);
>  	dma_fence_put(old);
>  }
> -EXPORT_SYMBOL(dma_resv_add_shared_fence);
> +EXPORT_SYMBOL(dma_resv_add_fence);
>  
>  /**
>   * dma_resv_replace_fences - replace fences in the dma_resv obj
>   * @obj: the reservation object
>   * @context: the context of the fences to replace
>   * @replacement: the new fence to use instead
> + * @usage: how the new fence is used, see enum dma_resv_usage
>   *
>   * Replace fences with a specified context with a new fence. Only valid if the
>   * operation represented by the original fence has no longer access to the
> @@ -321,107 +356,72 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
>   * update fence which makes the resource inaccessible.
>   */
>  void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> -			     struct dma_fence *replacement)
> +			     struct dma_fence *replacement,
> +			     enum dma_resv_usage usage)
>  {
>  	struct dma_resv_list *list;
> -	struct dma_fence *old;
>  	unsigned int i;
>  
>  	dma_resv_assert_held(obj);
>  
> +	list = dma_resv_fences_list(obj);
>  	write_seqcount_begin(&obj->seq);
> +	for (i = 0; list && i < list->num_fences; ++i) {
> +		struct dma_fence *old;
>  
> -	old = dma_resv_excl_fence(obj);
> -	if (old->context == context) {
> -		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
> -		dma_fence_put(old);
> -	}
> -
> -	list = dma_resv_shared_list(obj);
> -	for (i = 0; list && i < list->shared_count; ++i) {
> -		old = rcu_dereference_protected(list->shared[i],
> -						dma_resv_held(obj));
> +		dma_resv_list_entry(list, i, obj, &old, NULL);
>  		if (old->context != context)
>  			continue;
>  
> -		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
> +		dma_resv_list_set(list, i, replacement, usage);
>  		dma_fence_put(old);
>  	}
> -
>  	write_seqcount_end(&obj->seq);
>  }
>  EXPORT_SYMBOL(dma_resv_replace_fences);
>  
>  /**

Kerneldoc comment but not a kerneldoc comment. Needs to be fixed. Probably
good to go through the entire file once and ditch all the kerneldoc for
static function heres.

> - * dma_resv_add_excl_fence - Add an exclusive fence.
> - * @obj: the reservation object
> - * @fence: the exclusive fence to add
> + * dma_resv_iter_restart_unlocked - restart the unlocked iterator
> + * @cursor: The dma_resv_iter object to restart
>   *
> - * Add a fence to the exclusive slot. @obj must be locked with dma_resv_lock().
> - * See also &dma_resv.fence_excl for a discussion of the semantics.
> + * Restart the unlocked iteration by initializing the cursor object.
>   */
> -void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
> -{
> -	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
> -
> -	dma_resv_assert_held(obj);
> -
> -	dma_fence_get(fence);
> -
> -	write_seqcount_begin(&obj->seq);
> -	/* write_seqcount_begin provides the necessary memory barrier */
> -	RCU_INIT_POINTER(obj->fence_excl, fence);
> -	write_seqcount_end(&obj->seq);
> -
> -	dma_fence_put(old_fence);
> -}
> -EXPORT_SYMBOL(dma_resv_add_excl_fence);
> -
> -/* Restart the iterator by initializing all the necessary fields, but not the
> - * relation to the dma_resv object. */
>  static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>  {
>  	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
> -	cursor->index = -1;
> -	cursor->shared_count = 0;
> -	if (cursor->usage >= DMA_RESV_USAGE_READ) {
> -		cursor->fences = dma_resv_shared_list(cursor->obj);
> -		if (cursor->fences)
> -			cursor->shared_count = cursor->fences->shared_count;
> -	} else {
> -		cursor->fences = NULL;
> -	}
> +	cursor->index = 0;
> +	cursor->num_fences = 0;
> +	cursor->fences = dma_resv_fences_list(cursor->obj);
> +	if (cursor->fences)
> +		cursor->num_fences = cursor->fences->num_fences;
>  	cursor->is_restarted = true;
>  }
>  
>  /* Walk to the next not signaled fence and grab a reference to it */
>  static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>  {
> -	struct dma_resv *obj = cursor->obj;
> +	if (!cursor->fences)
> +		return;
>  
>  	do {
>  		/* Drop the reference from the previous round */
>  		dma_fence_put(cursor->fence);
>  
> -		if (cursor->index == -1) {
> -			cursor->fence = dma_resv_excl_fence(obj);
> -			cursor->index++;
> -			if (!cursor->fence)
> -				continue;
> -
> -		} else if (!cursor->fences ||
> -			   cursor->index >= cursor->shared_count) {
> +		if (cursor->index >= cursor->num_fences) {
>  			cursor->fence = NULL;
>  			break;
>  
> -		} else {
> -			struct dma_resv_list *fences = cursor->fences;
> -			unsigned int idx = cursor->index++;
> -
> -			cursor->fence = rcu_dereference(fences->shared[idx]);
>  		}
> +
> +		dma_resv_list_entry(cursor->fences, cursor->index++,
> +				    cursor->obj, &cursor->fence,
> +				    &cursor->fence_usage);
>  		cursor->fence = dma_fence_get_rcu(cursor->fence);
> -		if (!cursor->fence || !dma_fence_is_signaled(cursor->fence))
> +		if (!cursor->fence)
> +			break;
> +
> +		if (!dma_fence_is_signaled(cursor->fence) &&
> +		    cursor->usage >= cursor->fence_usage)
>  			break;
>  	} while (true);
>  }
> @@ -496,15 +496,9 @@ struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
>  	dma_resv_assert_held(cursor->obj);
>  
>  	cursor->index = 0;
> -	if (cursor->usage >= DMA_RESV_USAGE_READ)
> -		cursor->fences = dma_resv_shared_list(cursor->obj);
> -	else
> -		cursor->fences = NULL;
> -
> -	fence = dma_resv_excl_fence(cursor->obj);
> -	if (!fence)
> -		fence = dma_resv_iter_next(cursor);
> +	cursor->fences = dma_resv_fences_list(cursor->obj);
>  
> +	fence = dma_resv_iter_next(cursor);
>  	cursor->is_restarted = true;
>  	return fence;
>  }
> @@ -519,17 +513,17 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_first);
>   */
>  struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
>  {
> -	unsigned int idx;
> +	struct dma_fence *fence;
>  
>  	dma_resv_assert_held(cursor->obj);
>  
>  	cursor->is_restarted = false;
> -	if (!cursor->fences || cursor->index >= cursor->fences->shared_count)
> +	if (!cursor->fences || cursor->index >= cursor->fences->num_fences)
>  		return NULL;
>  
> -	idx = cursor->index++;
> -	return rcu_dereference_protected(cursor->fences->shared[idx],
> -					 dma_resv_held(cursor->obj));
> +	dma_resv_list_entry(cursor->fences, cursor->index++,
> +			    cursor->obj, &fence, &cursor->fence_usage);
> +	return fence;
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_iter_next);
>  
> @@ -544,57 +538,43 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>  {
>  	struct dma_resv_iter cursor;
>  	struct dma_resv_list *list;
> -	struct dma_fence *f, *excl;
> +	struct dma_fence *f;
>  
>  	dma_resv_assert_held(dst);
>  
>  	list = NULL;
> -	excl = NULL;
>  
>  	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
>  	dma_resv_for_each_fence_unlocked(&cursor, f) {
>  
>  		if (dma_resv_iter_is_restarted(&cursor)) {
>  			dma_resv_list_free(list);
> -			dma_fence_put(excl);
> -
> -			if (cursor.shared_count) {
> -				list = dma_resv_list_alloc(cursor.shared_count);
> -				if (!list) {
> -					dma_resv_iter_end(&cursor);
> -					return -ENOMEM;
> -				}
>  
> -				list->shared_count = 0;
> -
> -			} else {
> -				list = NULL;
> +			list = dma_resv_list_alloc(cursor.num_fences);
> +			if (!list) {
> +				dma_resv_iter_end(&cursor);
> +				return -ENOMEM;
>  			}
> -			excl = NULL;
> +			list->num_fences = 0;
>  		}
>  
>  		dma_fence_get(f);
> -		if (dma_resv_iter_is_exclusive(&cursor))
> -			excl = f;
> -		else
> -			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
> +		dma_resv_list_set(list, list->num_fences++, f,
> +				  dma_resv_iter_usage(&cursor));
>  	}
>  	dma_resv_iter_end(&cursor);
>  
>  	write_seqcount_begin(&dst->seq);
> -	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
> -	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
> +	list = rcu_replace_pointer(dst->fences, list, dma_resv_held(dst));
>  	write_seqcount_end(&dst->seq);
>  
>  	dma_resv_list_free(list);
> -	dma_fence_put(excl);
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL(dma_resv_copy_fences);
>  
>  /**
> - * dma_resv_get_fences - Get an object's shared and exclusive
> + * dma_resv_get_fences - Get an object's fences
>   * fences without update side lock held
>   * @obj: the reservation object
>   * @usage: controls which fences to include, see enum dma_resv_usage.
> @@ -623,7 +603,7 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>  			while (*num_fences)
>  				dma_fence_put((*fences)[--(*num_fences)]);
>  
> -			count = cursor.shared_count + 1;
> +			count = cursor.num_fences + 1;
>  
>  			/* Eventually re-allocate the array */
>  			*fences = krealloc_array(*fences, count,
> @@ -695,8 +675,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
>  EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
>  
>  /**
> - * dma_resv_wait_timeout - Wait on reservation's objects
> - * shared and/or exclusive fences.
> + * dma_resv_wait_timeout - Wait on reservation's objects fences
>   * @obj: the reservation object
>   * @usage: controls which fences to include, see enum dma_resv_usage.
>   * @intr: if true, do interruptible wait
> @@ -769,13 +748,13 @@ EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
>   */
>  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
>  {
> +	static const char *usage[] = { "kernel", "write", "read", "other" };
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  
>  	dma_resv_for_each_fence(&cursor, obj, true, fence) {
>  		seq_printf(seq, "\t%s fence:",
> -			   dma_resv_iter_is_exclusive(&cursor) ?
> -				"Exclusive" : "Shared");
> +			   usage[dma_resv_iter_usage(&cursor)]);
>  		dma_fence_describe(fence, seq);
>  	}
>  }
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index d097981061b1..d0f7c2bfd4f0 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -58,8 +58,9 @@ static int sanitycheck(void *arg)
>  	return r;
>  }
>  
> -static int test_signaling(void *arg, enum dma_resv_usage usage)
> +static int test_signaling(void *arg)
>  {
> +	enum dma_resv_usage usage = (unsigned long)arg;
>  	struct dma_resv resv;
>  	struct dma_fence *f;
>  	int r;
> @@ -81,11 +82,7 @@ static int test_signaling(void *arg, enum dma_resv_usage usage)
>  		goto err_unlock;
>  	}
>  
> -	if (usage >= DMA_RESV_USAGE_READ)
> -		dma_resv_add_shared_fence(&resv, f);
> -	else
> -		dma_resv_add_excl_fence(&resv, f);
> -
> +	dma_resv_add_fence(&resv, f, usage);
>  	if (dma_resv_test_signaled(&resv, usage)) {
>  		pr_err("Resv unexpectedly signaled\n");
>  		r = -EINVAL;
> @@ -105,18 +102,9 @@ static int test_signaling(void *arg, enum dma_resv_usage usage)
>  	return r;
>  }
>  
> -static int test_excl_signaling(void *arg)
> -{
> -	return test_signaling(arg, DMA_RESV_USAGE_WRITE);
> -}
> -
> -static int test_shared_signaling(void *arg)
> -{
> -	return test_signaling(arg, DMA_RESV_USAGE_READ);
> -}
> -
> -static int test_for_each(void *arg, enum dma_resv_usage usage)
> +static int test_for_each(void *arg)
>  {
> +	enum dma_resv_usage usage = (unsigned long)arg;
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *f, *fence;
>  	struct dma_resv resv;
> @@ -139,10 +127,7 @@ static int test_for_each(void *arg, enum dma_resv_usage usage)
>  		goto err_unlock;
>  	}
>  
> -	if (usage >= DMA_RESV_USAGE_READ)
> -		dma_resv_add_shared_fence(&resv, f);
> -	else
> -		dma_resv_add_excl_fence(&resv, f);
> +	dma_resv_add_fence(&resv, f, usage);
>  
>  	r = -ENOENT;
>  	dma_resv_for_each_fence(&cursor, &resv, usage, fence) {
> @@ -156,8 +141,7 @@ static int test_for_each(void *arg, enum dma_resv_usage usage)
>  			r = -EINVAL;
>  			goto err_unlock;
>  		}
> -		if (dma_resv_iter_is_exclusive(&cursor) !=
> -		    (usage >= DMA_RESV_USAGE_READ)) {
> +		if (dma_resv_iter_usage(&cursor) != usage) {
>  			pr_err("Unexpected fence usage\n");
>  			r = -EINVAL;
>  			goto err_unlock;
> @@ -177,18 +161,9 @@ static int test_for_each(void *arg, enum dma_resv_usage usage)
>  	return r;
>  }
>  
> -static int test_excl_for_each(void *arg)
> -{
> -	return test_for_each(arg, DMA_RESV_USAGE_WRITE);
> -}
> -
> -static int test_shared_for_each(void *arg)
> -{
> -	return test_for_each(arg, DMA_RESV_USAGE_READ);
> -}
> -
> -static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
> +static int test_for_each_unlocked(void *arg)
>  {
> +	enum dma_resv_usage usage = (unsigned long)arg;
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *f, *fence;
>  	struct dma_resv resv;
> @@ -212,10 +187,7 @@ static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
>  		goto err_free;
>  	}
>  
> -	if (usage >= DMA_RESV_USAGE_READ)
> -		dma_resv_add_shared_fence(&resv, f);
> -	else
> -		dma_resv_add_excl_fence(&resv, f);
> +	dma_resv_add_fence(&resv, f, usage);
>  	dma_resv_unlock(&resv);
>  
>  	r = -ENOENT;
> @@ -235,8 +207,7 @@ static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
>  			r = -EINVAL;
>  			goto err_iter_end;
>  		}
> -		if (dma_resv_iter_is_exclusive(&cursor) !=
> -		    (usage >= DMA_RESV_USAGE_READ)) {
> +		if (dma_resv_iter_usage(&cursor) != usage) {
>  			pr_err("Unexpected fence usage\n");
>  			r = -EINVAL;
>  			goto err_iter_end;
> @@ -262,18 +233,9 @@ static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
>  	return r;
>  }
>  
> -static int test_excl_for_each_unlocked(void *arg)
> -{
> -	return test_for_each_unlocked(arg, DMA_RESV_USAGE_WRITE);
> -}
> -
> -static int test_shared_for_each_unlocked(void *arg)
> -{
> -	return test_for_each_unlocked(arg, DMA_RESV_USAGE_READ);
> -}
> -
> -static int test_get_fences(void *arg, enum dma_resv_usage usage)
> +static int test_get_fences(void *arg)
>  {
> +	enum dma_resv_usage usage = (unsigned long)arg;
>  	struct dma_fence *f, **fences = NULL;
>  	struct dma_resv resv;
>  	int r, i;
> @@ -296,10 +258,7 @@ static int test_get_fences(void *arg, enum dma_resv_usage usage)
>  		goto err_resv;
>  	}
>  
> -	if (usage >= DMA_RESV_USAGE_READ)
> -		dma_resv_add_shared_fence(&resv, f);
> -	else
> -		dma_resv_add_excl_fence(&resv, f);
> +	dma_resv_add_fence(&resv, f, usage);
>  	dma_resv_unlock(&resv);
>  
>  	r = dma_resv_get_fences(&resv, usage, &i, &fences);
> @@ -324,30 +283,24 @@ static int test_get_fences(void *arg, enum dma_resv_usage usage)
>  	return r;
>  }
>  
> -static int test_excl_get_fences(void *arg)
> -{
> -	return test_get_fences(arg, DMA_RESV_USAGE_WRITE);
> -}
> -
> -static int test_shared_get_fences(void *arg)
> -{
> -	return test_get_fences(arg, DMA_RESV_USAGE_READ);
> -}
> -
>  int dma_resv(void)
>  {
>  	static const struct subtest tests[] = {
>  		SUBTEST(sanitycheck),
> -		SUBTEST(test_excl_signaling),
> -		SUBTEST(test_shared_signaling),
> -		SUBTEST(test_excl_for_each),
> -		SUBTEST(test_shared_for_each),
> -		SUBTEST(test_excl_for_each_unlocked),
> -		SUBTEST(test_shared_for_each_unlocked),
> -		SUBTEST(test_excl_get_fences),
> -		SUBTEST(test_shared_get_fences),
> +		SUBTEST(test_signaling),
> +		SUBTEST(test_for_each),
> +		SUBTEST(test_for_each_unlocked),
> +		SUBTEST(test_get_fences),
>  	};
> +	enum dma_resv_usage usage;
> +	int r;
>  
>  	spin_lock_init(&fence_lock);
> -	return subtests(tests, NULL);
> +	for (usage = DMA_RESV_USAGE_WRITE; usage <= DMA_RESV_USAGE_READ;
> +	     ++usage) {
> +		r = subtests(tests, (void *)(unsigned long)usage);
> +		if (r)
> +			return r;
> +	}
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 7de8f67f7dde..ab5d6b630a49 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -263,7 +263,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  	 */
>  	replacement = dma_fence_get_stub();
>  	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
> -				replacement);
> +				replacement, DMA_RESV_USAGE_READ);
>  	dma_fence_put(replacement);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 2bf909a4242a..1c039db976a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -54,8 +54,8 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
>  	bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
>  	p->uf_entry.priority = 0;
>  	p->uf_entry.tv.bo = &bo->tbo;
> -	/* One for TTM and one for the CS job */
> -	p->uf_entry.tv.num_shared = 2;
> +	/* One for TTM and two for the CS job */
> +	p->uf_entry.tv.num_shared = 3;
>  
>  	drm_gem_object_put(gobj);
>  
> @@ -1284,7 +1284,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  			break;
>  		}
>  		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
> -		rcu_assign_pointer(resv->fence_excl, &chain->base);
> +		dma_resv_add_fence(resv, &chain->base, DMA_RESV_USAGE_WRITE);
>  		e->chain = NULL;
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 0a843cc54945..9085a6b1ad56 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1393,10 +1393,8 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
>  		return;
>  	}
>  
> -	if (shared)
> -		dma_resv_add_shared_fence(resv, fence);
> -	else
> -		dma_resv_add_excl_fence(resv, fence);
> +	dma_resv_add_fence(resv, fence, shared ? DMA_RESV_USAGE_READ :
> +			   DMA_RESV_USAGE_WRITE);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index d7cd26dfaf8a..0cc036d93afc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -203,14 +203,10 @@ static void submit_attach_object_fences(struct etnaviv_gem_submit *submit)
>  
>  	for (i = 0; i < submit->nr_bos; i++) {
>  		struct drm_gem_object *obj = &submit->bos[i].obj->base;
> +		bool write = submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE;
>  
> -		if (submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE)
> -			dma_resv_add_excl_fence(obj->resv,
> -							  submit->out_fence);
> -		else
> -			dma_resv_add_shared_fence(obj->resv,
> -							    submit->out_fence);
> -
> +		dma_resv_add_fence(obj->resv, submit->out_fence, write ?
> +				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
>  		submit_unlock_object(submit, i);
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 14a1c0ad8c3c..e7ae94ee1b44 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -148,12 +148,13 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>  		if (dma_resv_iter_is_restarted(&cursor))
>  			args->busy = 0;
>  
> -		if (dma_resv_iter_is_exclusive(&cursor))
> -			/* Translate the exclusive fence to the READ *and* WRITE engine */
> -			args->busy |= busy_check_writer(fence);
> -		else
> -			/* Translate shared fences to READ set of engines */
> -			args->busy |= busy_check_reader(fence);
> +		/* Translate read fences to READ set of engines */
> +		args->busy |= busy_check_reader(fence);
> +	}
> +	dma_resv_iter_begin(&cursor, obj->base.resv, DMA_RESV_USAGE_WRITE);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		/* Translate the write fences to the READ *and* WRITE engine */
> +		args->busy |= busy_check_writer(fence);
>  	}
>  	dma_resv_iter_end(&cursor);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index 8a2223eb0ba9..887cb6b71ae4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -114,7 +114,8 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
>  						obj->base.resv, NULL, true,
>  						i915_fence_timeout(i915),
>  						I915_FENCE_GFP);
> -		dma_resv_add_excl_fence(obj->base.resv, &clflush->base.dma);
> +		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
> +				   DMA_RESV_USAGE_WRITE);
>  		dma_fence_work_commit(&clflush->base);
>  		/*
>  		 * We must have successfully populated the pages(since we are
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 4de6500f3c55..e4a232e22f9d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -622,9 +622,8 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
>  	if (IS_ERR_OR_NULL(copy_fence))
>  		return PTR_ERR_OR_ZERO(copy_fence);
>  
> -	dma_resv_add_excl_fence(dst_bo->base.resv, copy_fence);
> -	dma_resv_add_shared_fence(src_bo->base.resv, copy_fence);
> -
> +	dma_resv_add_fence(dst_bo->base.resv, copy_fence, DMA_RESV_USAGE_WRITE);
> +	dma_resv_add_fence(src_bo->base.resv, copy_fence, DMA_RESV_USAGE_READ);
>  	dma_fence_put(copy_fence);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index fe9f89289418..52fd6705a518 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1640,7 +1640,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
>  		}
>  
>  		if (fence) {
> -			dma_resv_add_excl_fence(vma->obj->base.resv, fence);
> +			dma_resv_add_fence(vma->obj->base.resv, fence,
> +					   DMA_RESV_USAGE_WRITE);
>  			obj->write_domain = I915_GEM_DOMAIN_RENDER;
>  			obj->read_domains = 0;
>  		}
> @@ -1652,7 +1653,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
>  		}
>  
>  		if (fence) {
> -			dma_resv_add_shared_fence(vma->obj->base.resv, fence);
> +			dma_resv_add_fence(vma->obj->base.resv, fence,
> +					   DMA_RESV_USAGE_READ);
>  			obj->write_domain = 0;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 9435a3ca71c8..38caa7f78871 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -366,7 +366,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
>  		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
>  			dma_resv_add_excl_fence(lima_bo_resv(bos[i]), fence);

Not very compile-tested it seems.

I think it'd be good to split this further:

- Add dma_resv_add_fence, which just adds either an exclusive or shared
  fences.
- Convert drivers, cc driver authors (this patch doesn't seem to have
  them).

I think the above two could also be a single patch, but should work even
more split.

- Remaining pieces of this patch to add the functional changes.

Also compile testing of all arm drivers I guess :-)

>  		else
> -			dma_resv_add_shared_fence(lima_bo_resv(bos[i]), fence);
> +			dma_resv_add_fence(lima_bo_resv(bos[i]), fence);
>  	}
>  
>  	drm_gem_unlock_reservations((struct drm_gem_object **)bos,
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 993dbcd7a586..2786913be00a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -397,7 +397,7 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
>  		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
>  			dma_resv_add_excl_fence(obj->resv, submit->user_fence);
>  		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
> -			dma_resv_add_shared_fence(obj->resv, submit->user_fence);
> +			dma_resv_add_fence(obj->resv, submit->user_fence);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index c6bb4dbcd735..05076e530e7d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1308,10 +1308,11 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence, bool excl
>  {
>  	struct dma_resv *resv = nvbo->bo.base.resv;
>  
> -	if (exclusive)
> -		dma_resv_add_excl_fence(resv, &fence->base);
> -	else if (fence)
> -		dma_resv_add_shared_fence(resv, &fence->base);
> +	if (!fence)
> +		return;
> +
> +	dma_resv_add_fence(resv, &fence->base, exclusive ?
> +			   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index d5e81ccee01c..7f01dcf81fab 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -360,9 +360,11 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>  		dma_resv_for_each_fence(&cursor, resv,
>  					dma_resv_usage_rw(exclusive),
>  					fence) {
> +			enum dma_resv_usage usage;
>  			struct nouveau_fence *f;
>  
> -			if (i == 0 && dma_resv_iter_is_exclusive(&cursor))
> +			usage = dma_resv_iter_usage(&cursor);
> +			if (i == 0 && usage == DMA_RESV_USAGE_WRITE)
>  				continue;
>  
>  			f = nouveau_local_fence(fence, chan->drm);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index cde1e8ddaeaa..368d26da0d6a 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -429,7 +429,8 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
>  	list_for_each_entry(entry, &release->bos, head) {
>  		bo = entry->bo;
>  
> -		dma_resv_add_shared_fence(bo->base.resv, &release->base);
> +		dma_resv_add_fence(bo->base.resv, &release->base,
> +				   DMA_RESV_USAGE_READ);
>  		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index afca4bf59a8d..382121c26f81 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -792,8 +792,6 @@ void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
>  		return;
>  	}
>  
> -	if (shared)
> -		dma_resv_add_shared_fence(resv, &fence->base);
> -	else
> -		dma_resv_add_excl_fence(resv, &fence->base);
> +	dma_resv_add_fence(resv, &fence->base, shared ?
> +			   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index d4b2695606e2..6014c363d6e6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -762,7 +762,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  		return ret;
>  	}
>  
> -	dma_resv_add_shared_fence(bo->base.resv, fence);
> +	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
>  
>  	ret = dma_resv_reserve_fences(bo->base.resv, 1);
>  	if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 862d2f22412a..49689c7c8078 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -508,7 +508,8 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>  	if (ret)
>  		return ret;
>  
> -	dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
> +	dma_resv_add_fence(&ghost_obj->base._resv, fence,
> +			   DMA_RESV_USAGE_WRITE);
>  
>  	/**
>  	 * If we're not moving to fixed memory, the TTM object
> @@ -562,7 +563,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>  	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
>  	int ret = 0;
>  
> -	dma_resv_add_excl_fence(bo->base.resv, fence);
> +	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
>  	if (!evict)
>  		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
>  	else if (!from->use_tt && pipeline)
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index 789c645f004e..0eb995d25df1 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -154,10 +154,8 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo = entry->bo;
>  
> -		if (entry->num_shared)
> -			dma_resv_add_shared_fence(bo->base.resv, fence);
> -		else
> -			dma_resv_add_excl_fence(bo->base.resv, fence);
> +		dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
> +				   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
>  		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 961812d33827..2352e9640922 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -550,8 +550,8 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
>  
>  	for (i = 0; i < job->bo_count; i++) {
>  		/* XXX: Use shared fences for read-only objects. */
> -		dma_resv_add_excl_fence(job->bo[i]->resv,
> -					job->done_fence);
> +		dma_resv_add_fence(job->bo[i]->resv, job->done_fence,
> +				   DMA_RESV_USAGE_WRITE);
>  	}
>  
>  	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 594bd6bb00d2..38550317e025 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -546,7 +546,7 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
>  		bo = to_vc4_bo(&exec->bo[i]->base);
>  		bo->seqno = seqno;
>  
> -		dma_resv_add_shared_fence(bo->base.base.resv, exec->fence);
> +		dma_resv_add_fence(bo->base.base.resv, exec->fence);
>  	}
>  
>  	list_for_each_entry(bo, &exec->unref_list, unref_head) {
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index 91fc4940c65a..c2a879734d40 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -161,12 +161,9 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
>  	/* Expose the fence via the dma-buf */
>  	dma_resv_lock(resv, NULL);
>  	ret = dma_resv_reserve_fences(resv, 1);
> -	if (!ret) {
> -		if (arg->flags & VGEM_FENCE_WRITE)
> -			dma_resv_add_excl_fence(resv, fence);
> -		else
> -			dma_resv_add_shared_fence(resv, fence);
> -	}
> +	if (!ret)
> +		dma_resv_add_fence(resv, fence, arg->flags & VGEM_FENCE_WRITE ?
> +				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
>  	dma_resv_unlock(resv);
>  
>  	/* Record the fence in our idr for later signaling */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 1820ca6cf673..580a78809836 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -250,7 +250,8 @@ void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
>  	int i;
>  
>  	for (i = 0; i < objs->nents; i++)
> -		dma_resv_add_excl_fence(objs->objs[i]->resv, fence);
> +		dma_resv_add_fence(objs->objs[i]->resv, fence,
> +				   DMA_RESV_USAGE_WRITE);
>  }
>  
>  void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index b96884f7d03d..bec50223efe5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -758,7 +758,8 @@ void vmw_bo_fence_single(struct ttm_buffer_object *bo,
>  
>  	ret = dma_resv_reserve_fences(bo->base.resv, 1);
>  	if (!ret)
> -		dma_resv_add_excl_fence(bo->base.resv, &fence->base);
> +		dma_resv_add_fence(bo->base.resv, &fence->base,
> +				   DMA_RESV_USAGE_WRITE);
>  	else
>  		/* Last resort fallback when we are OOM */
>  		dma_fence_wait(&fence->base, false);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 74083e62e19d..a8cfc1705d6a 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -393,16 +393,13 @@ struct dma_buf {
>  	 * e.g. exposed in `Implicit Fence Poll Support`_ must follow the
>  	 * below rules.
>  	 *
> -	 * - Drivers must add a shared fence through dma_resv_add_shared_fence()
> -	 *   for anything the userspace API considers a read access. This highly
> -	 *   depends upon the API and window system.
> +	 * - Drivers must add a read fence through dma_resv_add_fence() with the
> +	 *   DMA_RESV_USAGE_READ flag for anything the userspace API considers a
> +	 *   read access. This highly depends upon the API and window system.
>  	 *
> -	 * - Similarly drivers must set the exclusive fence through
> -	 *   dma_resv_add_excl_fence() for anything the userspace API considers
> -	 *   write access.
> -	 *
> -	 * - Drivers may just always set the exclusive fence, since that only
> -	 *   causes unecessarily synchronization, but no correctness issues.

Why did you drop this comment? We have a lot of drivers which are a bit
dumb in this regard here, which is why I added this "being dumb and always
setting write usage is fine" line. And that's still a valid statement, so
why remove it?

> +	 * - Similarly drivers must add a write fence through
> +	 *   dma_resv_add_fence() with the DMA_RESV_USAGE_WRITE flag for
> +	 *   anything the userspace API considers write access.
>  	 *
>  	 * - Some drivers only expose a synchronous userspace API with no
>  	 *   pipelining across drivers. These do not set any fences for their
> @@ -413,7 +410,7 @@ struct dma_buf {
>  	 * Dynamic importers, see dma_buf_attachment_is_dynamic(), have
>  	 * additional constraints on how they set up fences:
>  	 *
> -	 * - Dynamic importers must obey the exclusive fence and wait for it to
> +	 * - Dynamic importers must obey the kernel fences and wait for them to
>  	 *   signal before allowing access to the buffer's underlying storage
>  	 *   through the device.
>  	 *
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 658674c4b7b9..ae0436d7e7b8 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -95,8 +95,8 @@ static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
>  /**
>   * struct dma_resv - a reservation object manages fences for a buffer
>   *
> - * There are multiple uses for this, with sometimes slightly different rules in
> - * how the fence slots are used.
> + * This is a container for dma_fence objects which needs to handle multiple use
> + * cases.

Uh this still holds true? amdgpu still (and will always have to, due to it
being uapi) the additional concept of fence owner. Dropping this cautious
wording doesn't seem vise

If you really want to I think at least add a line that there's additional
complications in some drivers like amdgpu's owner concept.

>   *
>   * One use is to synchronize cross-driver access to a struct dma_buf, either for
>   * dynamic buffer management or just to handle implicit synchronization between
> @@ -126,47 +126,22 @@ struct dma_resv {
>  	 * @seq:
>  	 *
>  	 * Sequence count for managing RCU read-side synchronization, allows
> -	 * read-only access to @fence_excl and @fence while ensuring we take a
> -	 * consistent snapshot.
> +	 * read-only access to @fences while ensuring we take a consistent
> +	 * snapshot.
>  	 */
>  	seqcount_ww_mutex_t seq;
>  
>  	/**
> -	 * @fence_excl:
> +	 * @fences:
>  	 *
> -	 * The exclusive fence, if there is one currently.
> +	 * Array of fences which where added to the dma_resv object
>  	 *
> -	 * To guarantee that no fences are lost, this new fence must signal
> -	 * only after the previous exclusive fence has signalled. If
> -	 * semantically only a new access is added without actually treating the
> -	 * previous one as a dependency the exclusive fences can be strung
> -	 * together using struct dma_fence_chain.
> -	 *
> -	 * Note that actual semantics of what an exclusive or shared fence mean
> -	 * is defined by the user, for reservation objects shared across drivers
> -	 * see &dma_buf.resv.
> -	 */
> -	struct dma_fence __rcu *fence_excl;
> -
> -	/**
> -	 * @fence:
> -	 *
> -	 * List of current shared fences.
> -	 *
> -	 * There are no ordering constraints of shared fences against the
> -	 * exclusive fence slot. If a waiter needs to wait for all access, it
> -	 * has to wait for both sets of fences to signal.
> -	 *
> -	 * A new fence is added by calling dma_resv_add_shared_fence(). Since
> -	 * this often needs to be done past the point of no return in command
> +	 * A new fence is added by calling dma_resv_add_fence(). Since this
> +	 * often needs to be done past the point of no return in command
>  	 * submission it cannot fail, and therefore sufficient slots need to be
>  	 * reserved by calling dma_resv_reserve_fences().
> -	 *
> -	 * Note that actual semantics of what an exclusive or shared fence mean
> -	 * is defined by the user, for reservation objects shared across drivers
> -	 * see &dma_buf.resv.
>  	 */
> -	struct dma_resv_list __rcu *fence;
> +	struct dma_resv_list __rcu *fences;
>  };
>  
>  /**
> @@ -191,6 +166,9 @@ struct dma_resv_iter {
>  	/** @fence: the currently handled fence */
>  	struct dma_fence *fence;
>  
> +	/** @fence_usage: the usage of the current fence */
> +	enum dma_resv_usage fence_usage;
> +
>  	/** @seq: sequence number to check for modifications */
>  	unsigned int seq;
>  
> @@ -200,8 +178,8 @@ struct dma_resv_iter {
>  	/** @fences: the shared fences; private, *MUST* not dereference  */
>  	struct dma_resv_list *fences;
>  
> -	/** @shared_count: number of shared fences */
> -	unsigned int shared_count;
> +	/** @num_fences: number of fences */
> +	unsigned int num_fences;
>  
>  	/** @is_restarted: true if this is the first returned fence */
>  	bool is_restarted;
> @@ -240,14 +218,15 @@ static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
>  }
>  
>  /**
> - * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
> + * dma_resv_iter_usage - Return the usage of the current fence
>   * @cursor: the cursor of the current position
>   *
> - * Returns true if the currently returned fence is the exclusive one.
> + * Returns the usage of the currently processed fence.
>   */
> -static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
> +static inline enum dma_resv_usage
> +dma_resv_iter_usage(struct dma_resv_iter *cursor)
>  {
> -	return cursor->index == 0;
> +	return cursor->fence_usage;
>  }
>  
>  /**
> @@ -302,9 +281,9 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
>  #ifdef CONFIG_DEBUG_MUTEXES
> -void dma_resv_reset_shared_max(struct dma_resv *obj);
> +void dma_resv_reset_max_fences(struct dma_resv *obj);
>  #else
> -static inline void dma_resv_reset_shared_max(struct dma_resv *obj) {}
> +static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
>  #endif
>  
>  /**
> @@ -450,17 +429,18 @@ static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_resv *obj)
>   */
>  static inline void dma_resv_unlock(struct dma_resv *obj)
>  {
> -	dma_resv_reset_shared_max(obj);
> +	dma_resv_reset_max_fences(obj);
>  	ww_mutex_unlock(&obj->lock);
>  }
>  
>  void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences);
> -void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
> +void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
> +			enum dma_resv_usage usage);
>  void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> -			     struct dma_fence *fence);
> -void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> +			     struct dma_fence *fence,
> +			     enum dma_resv_usage usage);
>  int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>  			unsigned int *num_fences, struct dma_fence ***fences);
>  int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,

Feels a bit too unbacked yet to slap an r-b onto it.
-Daniel

> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
