Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8483989F8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039026EC87;
	Wed,  2 Jun 2021 12:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B506EC87
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:46:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id k7so3598154ejv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pNALq4jdCTj6Js/olk/gx6O79vbcdYCnpBmr6bW8H1I=;
 b=LsAr8OXv2IONBAythYdlK4yom3iqj7MWVWAXgg7MMWZQ8w6uqEeQ0LI73F0PyhPako
 OqYLTvVEJyZkmWx/knahYgsEavSntmAStfJi8B1ABpvMpU4e8zcdEkEPO3FNkfmRxbKi
 vU+YbSoD+NEmeF9sKaR9PH8RDa4NqfXCB2UeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pNALq4jdCTj6Js/olk/gx6O79vbcdYCnpBmr6bW8H1I=;
 b=IbqBSW6UgJcW/szgMenPicTAy4rKnqWa65U2CiHniNkF/t3CU4rzGrFD48m4m3z7Km
 D4REpnvLzuzJ01nPLeWGuXeIycK8BsWYGlVQ6DQpdpYj8cd52PkX7mopo5OYQVevBHNj
 ycQs7LkrS2gZAWpPu81ey6F2btxxkatizEoPweYOHqRsAXFYHc6/CAh62xonpK8O+gqc
 1FqzHDShSgPkD+kLW+Fl7pxCjF6AYDHx++ZzINcy25YcHNLhSHj/bvKlyEZ2uvbUH4+y
 RpoO0Jb1SfIQboQ6X4qpMgPa46jjVu+oMiECK97O0kui5Agpy0x9f8qje/wVXNLNvkF9
 0L/Q==
X-Gm-Message-State: AOAM533TwnZfKK+32B9odG57j2sFzm+s2CArXGtClnGq3ncnhk/kFyRs
 cp64L/DAexj8yKrVmkgpa/Efhg==
X-Google-Smtp-Source: ABdhPJxm74OROdUxhqTMpEOxD04VkvQjxTzYxeaqG1qkAsfD8IbXID6Ti8ULDfKg/OtOpEjnokXBjQ==
X-Received: by 2002:a17:906:b317:: with SMTP id
 n23mr16718647ejz.324.1622637977823; 
 Wed, 02 Jun 2021 05:46:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v21sm1272156edt.48.2021.06.02.05.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 05:46:17 -0700 (PDT)
Date: Wed, 2 Jun 2021 14:46:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/7] dma-buf: rename and cleanup dma_resv_get_excl
Message-ID: <YLd9l0QkgFXTOmtP@phenom.ffwll.local>
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602111714.212426-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 01:17:11PM +0200, Christian König wrote:
> When the comment needs to state explicitly that this
> doesn't get a reference to the object then the function
> is named rather badly.
> 
> Rename the function and use rcu_dereference_check(), this
> way it can be used from both rcu as well as lock protected
> critical sections.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c                |  4 ++--
>  drivers/dma-buf/dma-resv.c               | 10 +++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_busy.c |  3 +--
>  drivers/gpu/drm/msm/msm_gem.c            |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_bo.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.c  |  2 +-
>  drivers/gpu/drm/radeon/radeon_display.c  |  2 +-
>  drivers/gpu/drm/radeon/radeon_sync.c     |  2 +-
>  drivers/gpu/drm/radeon/radeon_uvd.c      |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c             |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  2 +-
>  include/linux/dma-resv.h                 | 13 +++++--------
>  15 files changed, 25 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d3b4e370dbc1..4d0ddc712f1e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -234,7 +234,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  		shared_count = fobj->shared_count;
>  	else
>  		shared_count = 0;
> -	fence_excl = rcu_dereference(resv->fence_excl);
> +	fence_excl = dma_resv_exclusive(resv);
>  	if (read_seqcount_retry(&resv->seq, seq)) {
>  		rcu_read_unlock();
>  		goto retry;
> @@ -1385,7 +1385,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  		robj = buf_obj->resv;
>  		seq = read_seqcount_begin(&robj->seq);
>  		rcu_read_lock();
> -		fence = rcu_dereference(robj->fence_excl);
> +		fence = dma_resv_exclusive(robj);
>  		if (fence)
>  			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
>  				   fence->ops->get_driver_name(fence),
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 6c6195315e9f..81b032b43457 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -281,7 +281,7 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
>   */
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  {
> -	struct dma_fence *old_fence = dma_resv_get_excl(obj);
> +	struct dma_fence *old_fence = dma_resv_exclusive(obj);
>  	struct dma_resv_list *old;
>  	u32 i = 0;
>  
> @@ -377,7 +377,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>  	rcu_read_unlock();
>  
>  	src_list = dma_resv_get_list(dst);
> -	old = dma_resv_get_excl(dst);
> +	old = dma_resv_exclusive(dst);
>  
>  	write_seqcount_begin(&dst->seq);
>  	/* write_seqcount_begin provides the necessary memory barrier */
> @@ -425,7 +425,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>  		rcu_read_lock();
>  		seq = read_seqcount_begin(&obj->seq);
>  
> -		fence_excl = rcu_dereference(obj->fence_excl);
> +		fence_excl = dma_resv_exclusive(obj);
>  		if (fence_excl && !dma_fence_get_rcu(fence_excl))
>  			goto unlock;
>  
> @@ -520,7 +520,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
>  	rcu_read_lock();
>  	i = -1;
>  
> -	fence = rcu_dereference(obj->fence_excl);
> +	fence = dma_resv_exclusive(obj);
>  	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>  		if (!dma_fence_get_rcu(fence))
>  			goto unlock_retry;
> @@ -642,7 +642,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>  	}
>  
>  	if (!shared_count) {
> -		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
> +		struct dma_fence *fence_excl = dma_resv_exclusive(obj);
>  
>  		if (fence_excl) {
>  			ret = dma_resv_test_signaled_single(fence_excl);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 73c76a3e2b12..cd5146fa6fb6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -226,7 +226,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>  	if (!amdgpu_vm_ready(vm))
>  		goto out_unlock;
>  
> -	fence = dma_resv_get_excl(bo->tbo.base.resv);
> +	fence = dma_resv_exclusive(bo->tbo.base.resv);
>  	if (fence) {
>  		amdgpu_bo_fence(bo, fence, true);
>  		fence = NULL;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 4e558632a5d2..c84d5b843985 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -210,7 +210,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>  		return -EINVAL;
>  
>  	/* always sync to the exclusive fence */
> -	f = dma_resv_get_excl(resv);
> +	f = dma_resv_exclusive(resv);
>  	r = amdgpu_sync_fence(sync, f);
>  
>  	flist = dma_resv_get_list(resv);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index db69f19ab5bc..d4f54dea8ac1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -471,7 +471,7 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>  		}
>  	}
>  
> -	fence = rcu_dereference(robj->fence_excl);
> +	fence = dma_resv_exclusive(robj);
>  	if (fence)
>  		etnaviv_gem_describe_fence(fence, "Exclusive", m);
>  	rcu_read_unlock();
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 25235ef630c1..02312a0c3a36 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -113,8 +113,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>  	seq = raw_read_seqcount(&obj->base.resv->seq);
>  
>  	/* Translate the exclusive fence to the READ *and* WRITE engine */
> -	args->busy =
> -		busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
> +	args->busy = busy_check_writer(dma_resv_exclusive(obj->base.resv));
>  
>  	/* Translate shared fences to READ set of engines */
>  	list = rcu_dereference(obj->base.resv->fence);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 56df86e5f740..54c1b53426d6 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -819,7 +819,7 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>  
>  	fobj = dma_resv_get_list(obj->resv);
>  	if (!fobj || (fobj->shared_count == 0)) {
> -		fence = dma_resv_get_excl(obj->resv);
> +		fence = dma_resv_exclusive(obj->resv);
>  		/* don't need to wait on our own fences, since ring is fifo */
>  		if (fence && (fence->context != fctx->context)) {
>  			ret = dma_fence_wait(fence, true);
> @@ -1035,7 +1035,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>  		}
>  	}
>  
> -	fence = rcu_dereference(robj->fence_excl);
> +	fence = dma_resv_exclusive(robj);
>  	if (fence)
>  		describe_fence(fence, "Exclusive", m);
>  	rcu_read_unlock();
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index e688ca77483d..ac0ebcc4ebb7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -955,7 +955,7 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>  {
>  	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>  	struct drm_device *dev = drm->dev;
> -	struct dma_fence *fence = dma_resv_get_excl(bo->base.resv);
> +	struct dma_fence *fence = dma_resv_exclusive(bo->base.resv);
>  
>  	nv10_bo_put_tile_region(dev, *old_tile, fence);
>  	*old_tile = new_tile;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index e5dcbf67de7e..a6cb35181aee 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -356,7 +356,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>  	}
>  
>  	fobj = dma_resv_get_list(resv);
> -	fence = dma_resv_get_excl(resv);
> +	fence = dma_resv_exclusive(resv);
>  
>  	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
>  		struct nouveau_channel *prev = NULL;
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 652af7a134bd..57c910e5ae77 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -533,7 +533,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  		DRM_ERROR("failed to pin new rbo buffer before flip\n");
>  		goto cleanup;
>  	}
> -	work->fence = dma_fence_get(dma_resv_get_excl(new_rbo->tbo.base.resv));
> +	work->fence = dma_fence_get(dma_resv_exclusive(new_rbo->tbo.base.resv));
>  	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
>  	radeon_bo_unreserve(new_rbo);
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
> index 5d3302945076..e476f90ef1c1 100644
> --- a/drivers/gpu/drm/radeon/radeon_sync.c
> +++ b/drivers/gpu/drm/radeon/radeon_sync.c
> @@ -98,7 +98,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
>  	int r = 0;
>  
>  	/* always sync to the exclusive fence */
> -	f = dma_resv_get_excl(resv);
> +	f = dma_resv_exclusive(resv);
>  	fence = f ? to_radeon_fence(f) : NULL;
>  	if (fence && fence->rdev == rdev)
>  		radeon_sync_fence(sync, fence);
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index dfa9fdbe98da..02d4bbdc9111 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -477,7 +477,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>  		return -EINVAL;
>  	}
>  
> -	f = dma_resv_get_excl(bo->tbo.base.resv);
> +	f = dma_resv_exclusive(bo->tbo.base.resv);
>  	if (f) {
>  		r = radeon_fence_wait((struct radeon_fence *)f, false);
>  		if (r) {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5a7ab4b35b2d..92361556bf0b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -262,7 +262,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>  
>  	rcu_read_lock();
>  	fobj = rcu_dereference(resv->fence);
> -	fence = rcu_dereference(resv->fence_excl);
> +	fence = dma_resv_exclusive(resv);
>  	if (fence && !fence->ops->signaled)
>  		dma_fence_enable_sw_signaling(fence);
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index 62ea920addc3..c78f38ee1c20 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -1166,7 +1166,7 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
>  		if (bo->moving)
>  			dma_fence_put(bo->moving);
>  		bo->moving = dma_fence_get
> -			(dma_resv_get_excl(bo->base.resv));
> +			(dma_resv_exclusive(bo->base.resv));
>  	}
>  
>  	return 0;
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index f32a3d176513..7549ec5eb35c 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -226,22 +226,19 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
>  }
>  
>  /**
> - * dma_resv_get_excl - get the reservation object's
> - * exclusive fence, with update-side lock held
> + * dma_resv_exclusive - return the object's exclusive fence
>   * @obj: the reservation object
>   *
> - * Returns the exclusive fence (if any).  Does NOT take a
> - * reference. Writers must hold obj->lock, readers may only
> - * hold a RCU read side lock.
> + * Returns the exclusive fence (if any). Caller must either hold the objects
> + * lock or the rcu read side lock.

For some kerneldoc goodies, please spell this out with "object lock
through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
or one of the variants of each".

I just like a to throw around a lot of hyperlinks around to let people who
read docs navigate to all the pieces easily.
-Daniel

>   *
>   * RETURNS
>   * The exclusive fence or NULL
>   */
>  static inline struct dma_fence *
> -dma_resv_get_excl(struct dma_resv *obj)
> +dma_resv_exclusive(struct dma_resv *obj)
>  {
> -	return rcu_dereference_protected(obj->fence_excl,
> -					 dma_resv_held(obj));
> +	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
