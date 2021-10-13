Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F842C3B0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57E36E0D2;
	Wed, 13 Oct 2021 14:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184E6E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:41:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id y3so9283373wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jGMkBBfNYWD5l6yF3GfKb3a9h4ZAoIEy/XxuCJkYEgA=;
 b=MkjGa1fTwEp/8a6q8+5OQ6x2gviDzu8ayNbri6BlLQG56Ze2tHYyQog4x3PpavLSKn
 fCLr2tRuhV5riyqTB+FxPDupagWt+nlK/EOqcqeWucXbzuBPNnfuMnUYTHpx9SeJK9Wm
 42QuKBWm/O6QKtaUx0kHFxH6KXsmfLV2rdHP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jGMkBBfNYWD5l6yF3GfKb3a9h4ZAoIEy/XxuCJkYEgA=;
 b=s9WLsxVQpcQ88cshMXrHbQvhvR9cWLG/yzPqHJojxKKmfjN9SxKrxqtW7egIPsQtpc
 ZOe7EGwR4iRLHNR6Rlq7VnbheAtvm4sfoXM/IqPR768aR+2xaSA3cY2vcjfvl3f+s1mO
 jMgC/V+2zCz2MhC2mioWQpa0UE6KLVoZpVkf/hmIfwJ1CXls94Vy3qjyOQL/oM8I4x6r
 5i6HfTdR3kQvcOEH4P+fNQp650hACwgo95Q2Qct3IaQSRxNEah2GloMDdLO2dPcirFeS
 qW3TXl+ja09NVioQH9bO/KQunZ3ydveywcL0GV8k3l92r1HlYMGPS2nLe7LGTo25JYV8
 CTBg==
X-Gm-Message-State: AOAM533S7rThE9/Irxri5WD/PSWPRMD/COmw8SY7v4eMUbGcvEBr5Y4R
 8V6OFgaJ7dqnVS3kNqUutmHFlg==
X-Google-Smtp-Source: ABdhPJxDOyhaheAS2SuHqWG7XUI0NEkcYWWqJ+B2SMMlPC89xy0O5UO3t0jcYJH02Tz5l1cwFGzMyw==
X-Received: by 2002:adf:df8c:: with SMTP id z12mr36064795wrl.292.1634136105524; 
 Wed, 13 Oct 2021 07:41:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j14sm8064671wrw.12.2021.10.13.07.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:41:44 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:41:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
Subject: Re: [PATCH 2/6] drm/i915: Introduce refcounted sg-tables
Message-ID: <YWbwJ+LbRt9+c7H6@phenom.ffwll.local>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008133530.664509-3-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 08, 2021 at 03:35:26PM +0200, Thomas Hellström wrote:
> As we start to introduce asynchronous failsafe object migration,
> where we update the object state and then submit asynchronous
> commands we need to record what memory resources are actually used
> by various part of the command stream. Initially for three purposes:
> 
> 1) Error capture.
> 2) Asynchronous migration error recovery.
> 3) Asynchronous vma bind.
> 
> At the time where these happens, the object state may have been updated
> to be several migrations ahead and object sg-tables discarded.
> 
> In order to make it possible to keep sg-tables with memory resource
> information for these operations, introduce refcounted sg-tables that
> aren't freed until the last user is done with them.
> 
> The alternative would be to reference information sitting on the
> corresponding ttm_resources which typically have the same lifetime as
> these refcountes sg_tables, but that leads to other awkward constructs:
> Due to the design direction chosen for ttm resource managers that would
> lead to diamond-style inheritance, the LMEM resources may sometimes be
> prematurely freed, and finally the subclassed struct ttm_resource would
> have to bleed into the asynchronous vma bind code.

On the diamon inheritence I was pondering some more whether we shouldn't
just do the classic C union horrors, i.e.

struct ttm_resource {
	/* stuff */
};

struct ttm_drm_mm_resource {
	struct ttm_resource base;
	struct drm_mm_node;
};

struct ttm_buddy_resource {
	struct ttm_resource base;
	struct drm_buddy_node;
};

Whatever else we have, maybe also integer resources for guc_id.

And then the horrors:

struct i915_gem_resource {
	union {
		struct ttm_resource base;
		struct ttm_drm_mm_resource drm_mm;
		struct ttm_buffer_object buddy;
	};

	/* i915 stuff */
};

BUILD_BUG_ON(offsetof(struct i915_gem_resource, base) ==
	offsetof(struct i915_gem_resource, drmm_mm.base))
BUILD_BUG_ON(offsetof(struct i915_gem_resource, base) ==
	offsetof(struct i915_gem_resource, buddy.base))

This is horrible, but also in official C89 and later unions are the only
ways to do inheritance. The only reason we can do different in linux is
because we compile with strict aliasing turned off.

So I think we can shrug this off as officially sanctioned horrors. There's
a small downside with overhead maybe, but I don't think the amount in
difference between the various allocators is big enough that we should
care. Plus a pointer to driver stuff to resolve the diamond inheritance
through different means isn't free either.

But also this is for much later, I think for now refcounting sglist as a
standalone thing is ok, since we do seem to need them in a bunch of
places. But eventually I do think we should aim to merge them with
ttm_resource, if/when those get refcounted.
-Daniel

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 159 +++++++++++-------
>  drivers/gpu/drm/i915/i915_scatterlist.c       |  62 +++++--
>  drivers/gpu/drm/i915/i915_scatterlist.h       |  76 ++++++++-
>  drivers/gpu/drm/i915/intel_region_ttm.c       |  15 +-
>  drivers/gpu/drm/i915/intel_region_ttm.h       |   5 +-
>  drivers/gpu/drm/i915/selftests/mock_region.c  |  12 +-
>  7 files changed, 238 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 7c3da4e3e737..d600cf7ceb35 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -485,6 +485,7 @@ struct drm_i915_gem_object {
>  		 */
>  		struct list_head region_link;
>  
> +		struct i915_refct_sgt *rsgt;
>  		struct sg_table *pages;
>  		void *mapping;
>  
> @@ -538,7 +539,7 @@ struct drm_i915_gem_object {
>  	} mm;
>  
>  	struct {
> -		struct sg_table *cached_io_st;
> +		struct i915_refct_sgt *cached_io_rsgt;
>  		struct i915_gem_object_page_iter get_io_page;
>  		struct drm_i915_gem_object *backup;
>  		bool created:1;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 74a1ffd0d7dd..4b4d7457bef9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -34,7 +34,7 @@
>   * struct i915_ttm_tt - TTM page vector with additional private information
>   * @ttm: The base TTM page vector.
>   * @dev: The struct device used for dma mapping and unmapping.
> - * @cached_st: The cached scatter-gather table.
> + * @cached_rsgt: The cached scatter-gather table.
>   *
>   * Note that DMA may be going on right up to the point where the page-
>   * vector is unpopulated in delayed destroy. Hence keep the
> @@ -45,7 +45,7 @@
>  struct i915_ttm_tt {
>  	struct ttm_tt ttm;
>  	struct device *dev;
> -	struct sg_table *cached_st;
> +	struct i915_refct_sgt cached_rsgt;
>  };
>  
>  static const struct ttm_place sys_placement_flags = {
> @@ -179,6 +179,21 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
>  	placement->busy_placement = busy;
>  }
>  
> +static void i915_ttm_tt_release(struct kref *ref)
> +{
> +	struct i915_ttm_tt *i915_tt =
> +		container_of(ref, typeof(*i915_tt), cached_rsgt.kref);
> +	struct sg_table *st = &i915_tt->cached_rsgt.table;
> +
> +	GEM_WARN_ON(st->sgl);
> +
> +	kfree(i915_tt);
> +}
> +
> +static const struct i915_refct_sgt_ops tt_rsgt_ops = {
> +	.release = i915_ttm_tt_release
> +};
> +
>  static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>  					 uint32_t page_flags)
>  {
> @@ -203,6 +218,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>  		return NULL;
>  	}
>  
> +	i915_refct_sgt_init_ops(&i915_tt->cached_rsgt, bo->base.size,
> +				&tt_rsgt_ops);
>  	i915_tt->dev = obj->base.dev->dev;
>  
>  	return &i915_tt->ttm;
> @@ -211,13 +228,13 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>  static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> +	struct sg_table *st = &i915_tt->cached_rsgt.table;
> +
> +	GEM_WARN_ON(kref_read(&i915_tt->cached_rsgt.kref) != 1);
>  
> -	if (i915_tt->cached_st) {
> -		dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_st,
> -				  DMA_BIDIRECTIONAL, 0);
> -		sg_free_table(i915_tt->cached_st);
> -		kfree(i915_tt->cached_st);
> -		i915_tt->cached_st = NULL;
> +	if (st->sgl) {
> +		dma_unmap_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
> +		sg_free_table(st);
>  	}
>  	ttm_pool_free(&bdev->pool, ttm);
>  }
> @@ -226,8 +243,10 @@ static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>  
> +	GEM_WARN_ON(kref_read(&i915_tt->cached_rsgt.kref) != 1);
> +
>  	ttm_tt_fini(ttm);
> -	kfree(i915_tt);
> +	i915_refct_sgt_put(&i915_tt->cached_rsgt);
>  }
>  
>  static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
> @@ -261,12 +280,12 @@ static int i915_ttm_move_notify(struct ttm_buffer_object *bo)
>  	return 0;
>  }
>  
> -static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
> +static void i915_ttm_free_cached_io_rsgt(struct drm_i915_gem_object *obj)
>  {
>  	struct radix_tree_iter iter;
>  	void __rcu **slot;
>  
> -	if (!obj->ttm.cached_io_st)
> +	if (!obj->ttm.cached_io_rsgt)
>  		return;
>  
>  	rcu_read_lock();
> @@ -274,9 +293,8 @@ static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
>  		radix_tree_delete(&obj->ttm.get_io_page.radix, iter.index);
>  	rcu_read_unlock();
>  
> -	sg_free_table(obj->ttm.cached_io_st);
> -	kfree(obj->ttm.cached_io_st);
> -	obj->ttm.cached_io_st = NULL;
> +	i915_refct_sgt_put(obj->ttm.cached_io_rsgt);
> +	obj->ttm.cached_io_rsgt = NULL;
>  }
>  
>  static void
> @@ -347,7 +365,7 @@ static void i915_ttm_purge(struct drm_i915_gem_object *obj)
>  		obj->write_domain = 0;
>  		obj->read_domains = 0;
>  		i915_ttm_adjust_gem_after_move(obj);
> -		i915_ttm_free_cached_io_st(obj);
> +		i915_ttm_free_cached_io_rsgt(obj);
>  		obj->mm.madv = __I915_MADV_PURGED;
>  	}
>  }
> @@ -358,7 +376,7 @@ static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
>  	int ret = i915_ttm_move_notify(bo);
>  
>  	GEM_WARN_ON(ret);
> -	GEM_WARN_ON(obj->ttm.cached_io_st);
> +	GEM_WARN_ON(obj->ttm.cached_io_rsgt);
>  	if (!ret && obj->mm.madv != I915_MADV_WILLNEED)
>  		i915_ttm_purge(obj);
>  }
> @@ -369,7 +387,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>  
>  	if (likely(obj)) {
>  		__i915_gem_object_pages_fini(obj);
> -		i915_ttm_free_cached_io_st(obj);
> +		i915_ttm_free_cached_io_rsgt(obj);
>  	}
>  }
>  
> @@ -389,40 +407,35 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
>  					  ttm_mem_type - I915_PL_LMEM0);
>  }
>  
> -static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
> +static struct i915_refct_sgt *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>  {
>  	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>  	struct sg_table *st;
>  	int ret;
>  
> -	if (i915_tt->cached_st)
> -		return i915_tt->cached_st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return ERR_PTR(-ENOMEM);
> +	if (i915_tt->cached_rsgt.table.sgl)
> +		return i915_refct_sgt_get(&i915_tt->cached_rsgt);
>  
> +	st = &i915_tt->cached_rsgt.table;
>  	ret = sg_alloc_table_from_pages_segment(st,
>  			ttm->pages, ttm->num_pages,
>  			0, (unsigned long)ttm->num_pages << PAGE_SHIFT,
>  			i915_sg_segment_size(), GFP_KERNEL);
>  	if (ret) {
> -		kfree(st);
> +		st->sgl = NULL;
>  		return ERR_PTR(ret);
>  	}
>  
>  	ret = dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
>  	if (ret) {
>  		sg_free_table(st);
> -		kfree(st);
>  		return ERR_PTR(ret);
>  	}
>  
> -	i915_tt->cached_st = st;
> -	return st;
> +	return i915_refct_sgt_get(&i915_tt->cached_rsgt);
>  }
>  
> -static struct sg_table *
> +static struct i915_refct_sgt *
>  i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>  			 struct ttm_resource *res)
>  {
> @@ -436,7 +449,21 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>  	 * the resulting st. Might make sense for GGTT.
>  	 */
>  	GEM_WARN_ON(!cpu_maps_iomem(res));
> -	return intel_region_ttm_resource_to_st(obj->mm.region, res);
> +	if (bo->resource == res) {
> +		if (!obj->ttm.cached_io_rsgt) {
> +			struct i915_refct_sgt *rsgt;
> +
> +			rsgt = intel_region_ttm_resource_to_rsgt(obj->mm.region,
> +								 res);
> +			if (IS_ERR(rsgt))
> +				return rsgt;
> +
> +			obj->ttm.cached_io_rsgt = rsgt;
> +		}
> +		return i915_refct_sgt_get(obj->ttm.cached_io_rsgt);
> +	}
> +
> +	return intel_region_ttm_resource_to_rsgt(obj->mm.region, res);
>  }
>  
>  static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
> @@ -447,10 +474,7 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
>  {
>  	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
>  						     bdev);
> -	struct ttm_resource_manager *src_man =
> -		ttm_manager_type(bo->bdev, bo->resource->mem_type);
>  	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> -	struct sg_table *src_st;
>  	struct i915_request *rq;
>  	struct ttm_tt *src_ttm = bo->ttm;
>  	enum i915_cache_level src_level, dst_level;
> @@ -476,17 +500,22 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
>  		}
>  		intel_engine_pm_put(i915->gt.migrate.context->engine);
>  	} else {
> -		src_st = src_man->use_tt ? i915_ttm_tt_get_st(src_ttm) :
> -			obj->ttm.cached_io_st;
> +		struct i915_refct_sgt *src_rsgt =
> +			i915_ttm_resource_get_st(obj, bo->resource);
> +
> +		if (IS_ERR(src_rsgt))
> +			return PTR_ERR(src_rsgt);
>  
>  		src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
>  		intel_engine_pm_get(i915->gt.migrate.context->engine);
>  		ret = intel_context_migrate_copy(i915->gt.migrate.context,
> -						 NULL, src_st->sgl, src_level,
> +						 NULL, src_rsgt->table.sgl,
> +						 src_level,
>  						 gpu_binds_iomem(bo->resource),
>  						 dst_st->sgl, dst_level,
>  						 gpu_binds_iomem(dst_mem),
>  						 &rq);
> +		i915_refct_sgt_put(src_rsgt);
>  		if (!ret && rq) {
>  			i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
>  			i915_request_put(rq);
> @@ -500,13 +529,14 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
>  static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
>  			    struct ttm_resource *dst_mem,
>  			    struct ttm_tt *dst_ttm,
> -			    struct sg_table *dst_st,
> +			    struct i915_refct_sgt *dst_rsgt,
>  			    bool allow_accel)
>  {
>  	int ret = -EINVAL;
>  
>  	if (allow_accel)
> -		ret = i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm, dst_st);
> +		ret = i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm,
> +					  &dst_rsgt->table);
>  	if (ret) {
>  		struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>  		struct intel_memory_region *dst_reg, *src_reg;
> @@ -523,12 +553,13 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
>  		dst_iter = !cpu_maps_iomem(dst_mem) ?
>  			ttm_kmap_iter_tt_init(&_dst_iter.tt, dst_ttm) :
>  			ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
> -						 dst_st, dst_reg->region.start);
> +						 &dst_rsgt->table,
> +						 dst_reg->region.start);
>  
>  		src_iter = !cpu_maps_iomem(bo->resource) ?
>  			ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
>  			ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
> -						 obj->ttm.cached_io_st,
> +						 &obj->ttm.cached_io_rsgt->table,
>  						 src_reg->region.start);
>  
>  		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
> @@ -544,7 +575,7 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>  	struct ttm_resource_manager *dst_man =
>  		ttm_manager_type(bo->bdev, dst_mem->mem_type);
>  	struct ttm_tt *ttm = bo->ttm;
> -	struct sg_table *dst_st;
> +	struct i915_refct_sgt *dst_rsgt;
>  	bool clear;
>  	int ret;
>  
> @@ -570,22 +601,24 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>  			return ret;
>  	}
>  
> -	dst_st = i915_ttm_resource_get_st(obj, dst_mem);
> -	if (IS_ERR(dst_st))
> -		return PTR_ERR(dst_st);
> +	dst_rsgt = i915_ttm_resource_get_st(obj, dst_mem);
> +	if (IS_ERR(dst_rsgt))
> +		return PTR_ERR(dst_rsgt);
>  
>  	clear = !cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
>  	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
> -		__i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_st, true);
> +		__i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_rsgt, true);
>  
>  	ttm_bo_move_sync_cleanup(bo, dst_mem);
>  	i915_ttm_adjust_domains_after_move(obj);
> -	i915_ttm_free_cached_io_st(obj);
> +	i915_ttm_free_cached_io_rsgt(obj);
>  
>  	if (gpu_binds_iomem(dst_mem) || cpu_maps_iomem(dst_mem)) {
> -		obj->ttm.cached_io_st = dst_st;
> -		obj->ttm.get_io_page.sg_pos = dst_st->sgl;
> +		obj->ttm.cached_io_rsgt = dst_rsgt;
> +		obj->ttm.get_io_page.sg_pos = dst_rsgt->table.sgl;
>  		obj->ttm.get_io_page.sg_idx = 0;
> +	} else {
> +		i915_refct_sgt_put(dst_rsgt);
>  	}
>  
>  	i915_ttm_adjust_gem_after_move(obj);
> @@ -649,7 +682,6 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>  		.interruptible = true,
>  		.no_wait_gpu = false,
>  	};
> -	struct sg_table *st;
>  	int real_num_busy;
>  	int ret;
>  
> @@ -687,12 +719,16 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>  	}
>  
>  	if (!i915_gem_object_has_pages(obj)) {
> -		/* Object either has a page vector or is an iomem object */
> -		st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
> -		if (IS_ERR(st))
> -			return PTR_ERR(st);
> +		struct i915_refct_sgt *rsgt =
> +			i915_ttm_resource_get_st(obj, bo->resource);
> +
> +		if (IS_ERR(rsgt))
> +			return PTR_ERR(rsgt);
>  
> -		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
> +		GEM_BUG_ON(obj->mm.rsgt);
> +		obj->mm.rsgt = rsgt;
> +		__i915_gem_object_set_pages(obj, &rsgt->table,
> +					    i915_sg_dma_sizes(rsgt->table.sgl));
>  	}
>  
>  	return ret;
> @@ -766,6 +802,11 @@ static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
>  	 * and shrinkers will move it out if needed.
>  	 */
>  
> +	if (obj->mm.rsgt) {
> +		i915_refct_sgt_put(obj->mm.rsgt);
> +		obj->mm.rsgt = NULL;
> +	}
> +
>  	i915_ttm_adjust_lru(obj);
>  }
>  
> @@ -1023,7 +1064,7 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = intr,
>  	};
> -	struct sg_table *dst_st;
> +	struct i915_refct_sgt *dst_rsgt;
>  	int ret;
>  
>  	assert_object_held(dst);
> @@ -1038,11 +1079,11 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
>  	if (ret)
>  		return ret;
>  
> -	dst_st = gpu_binds_iomem(dst_bo->resource) ?
> -		dst->ttm.cached_io_st : i915_ttm_tt_get_st(dst_bo->ttm);
> -
> +	dst_rsgt = i915_ttm_resource_get_st(dst, dst_bo->resource);
>  	__i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
> -			dst_st, allow_accel);
> +			dst_rsgt, allow_accel);
> +
> +	i915_refct_sgt_put(dst_rsgt);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index 4a6712dca838..8a510ee5d1ad 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -41,8 +41,32 @@ bool i915_sg_trim(struct sg_table *orig_st)
>  	return true;
>  }
>  
> +static void i915_refct_sgt_release(struct kref *ref)
> +{
> +	struct i915_refct_sgt *rsgt =
> +		container_of(ref, typeof(*rsgt), kref);
> +
> +	sg_free_table(&rsgt->table);
> +	kfree(rsgt);
> +}
> +
> +static const struct i915_refct_sgt_ops rsgt_ops = {
> +	.release = i915_refct_sgt_release
> +};
> +
> +/**
> + * i915_refct_sgt_init - Initialize a struct i915_refct_sgt with default ops
> + * @rsgt: The struct i915_refct_sgt to initialize.
> + * size: The size of the underlying memory buffer.
> + */
> +void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size)
> +{
> +	i915_refct_sgt_init_ops(rsgt, size, &rsgt_ops);
> +}
> +
>  /**
> - * i915_sg_from_mm_node - Create an sg_table from a struct drm_mm_node
> + * i915_rsgt_from_mm_node - Create a refcounted sg_table from a struct
> + * drm_mm_node
>   * @node: The drm_mm_node.
>   * @region_start: An offset to add to the dma addresses of the sg list.
>   *
> @@ -50,25 +74,28 @@ bool i915_sg_trim(struct sg_table *orig_st)
>   * taking a maximum segment length into account, splitting into segments
>   * if necessary.
>   *
> - * Return: A pointer to a kmalloced struct sg_table on success, negative
> + * Return: A pointer to a kmalloced struct i915_refct_sgt on success, negative
>   * error code cast to an error pointer on failure.
>   */
> -struct sg_table *i915_sg_from_mm_node(const struct drm_mm_node *node,
> -				      u64 region_start)
> +struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
> +					      u64 region_start)
>  {
>  	const u64 max_segment = SZ_1G; /* Do we have a limit on this? */
>  	u64 segment_pages = max_segment >> PAGE_SHIFT;
>  	u64 block_size, offset, prev_end;
> +	struct i915_refct_sgt *rsgt;
>  	struct sg_table *st;
>  	struct scatterlist *sg;
>  
> -	st = kmalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> +	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
> +	if (!rsgt)
>  		return ERR_PTR(-ENOMEM);
>  
> +	i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
> +	st = &rsgt->table;
>  	if (sg_alloc_table(st, DIV_ROUND_UP(node->size, segment_pages),
>  			   GFP_KERNEL)) {
> -		kfree(st);
> +		i915_refct_sgt_put(rsgt);
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> @@ -104,11 +131,11 @@ struct sg_table *i915_sg_from_mm_node(const struct drm_mm_node *node,
>  	sg_mark_end(sg);
>  	i915_sg_trim(st);
>  
> -	return st;
> +	return rsgt;
>  }
>  
>  /**
> - * i915_sg_from_buddy_resource - Create an sg_table from a struct
> + * i915_rsgt_from_buddy_resource - Create a refcounted sg_table from a struct
>   * i915_buddy_block list
>   * @res: The struct i915_ttm_buddy_resource.
>   * @region_start: An offset to add to the dma addresses of the sg list.
> @@ -117,11 +144,11 @@ struct sg_table *i915_sg_from_mm_node(const struct drm_mm_node *node,
>   * taking a maximum segment length into account, splitting into segments
>   * if necessary.
>   *
> - * Return: A pointer to a kmalloced struct sg_table on success, negative
> + * Return: A pointer to a kmalloced struct i915_refct_sgts on success, negative
>   * error code cast to an error pointer on failure.
>   */
> -struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
> -					     u64 region_start)
> +struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
> +						     u64 region_start)
>  {
>  	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
>  	const u64 size = res->num_pages << PAGE_SHIFT;
> @@ -129,18 +156,21 @@ struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
>  	struct i915_buddy_mm *mm = bman_res->mm;
>  	struct list_head *blocks = &bman_res->blocks;
>  	struct i915_buddy_block *block;
> +	struct i915_refct_sgt *rsgt;
>  	struct scatterlist *sg;
>  	struct sg_table *st;
>  	resource_size_t prev_end;
>  
>  	GEM_BUG_ON(list_empty(blocks));
>  
> -	st = kmalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> +	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
> +	if (!rsgt)
>  		return ERR_PTR(-ENOMEM);
>  
> +	i915_refct_sgt_init(rsgt, size);
> +	st = &rsgt->table;
>  	if (sg_alloc_table(st, res->num_pages, GFP_KERNEL)) {
> -		kfree(st);
> +		i915_refct_sgt_put(rsgt);
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> @@ -181,7 +211,7 @@ struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
>  	sg_mark_end(sg);
>  	i915_sg_trim(st);
>  
> -	return st;
> +	return rsgt;
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index b8bd5925b03f..321fd4a9f777 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -144,10 +144,78 @@ static inline unsigned int i915_sg_segment_size(void)
>  
>  bool i915_sg_trim(struct sg_table *orig_st);
>  
> -struct sg_table *i915_sg_from_mm_node(const struct drm_mm_node *node,
> -				      u64 region_start);
> +/**
> + * struct i915_refct_sgt_ops - Operations structure for struct i915_refct_sgt
> + */
> +struct i915_refct_sgt_ops {
> +	/**
> +	 * release() - Free the memory of the struct i915_refct_sgt
> +	 * @ref: struct kref that is embedded in the struct i915_refct_sgt
> +	 */
> +	void (*release)(struct kref *ref);
> +};
> +
> +/**
> + * struct i915_refct_sgt - A refcounted scatter-gather table
> + * @kref: struct kref for refcounting
> + * @table: struct sg_table holding the scatter-gather table itself. Note that
> + * @table->sgl = NULL can be used to determine whether a scatter-gather table
> + * is present or not.
> + * @size: The size in bytes of the underlying memory buffer
> + * @ops: The operations structure.
> + */
> +struct i915_refct_sgt {
> +	struct kref kref;
> +	struct sg_table table;
> +	size_t size;
> +	const struct i915_refct_sgt_ops *ops;
> +};
> +
> +/**
> + * i915_refct_sgt_put - Put a refcounted sg-table
> + * @rsgt the struct i915_refct_sgt to put.
> + */
> +static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
> +{
> +	if (rsgt)
> +		kref_put(&rsgt->kref, rsgt->ops->release);
> +}
> +
> +/**
> + * i915_refct_sgt_get - Get a refcounted sg-table
> + * @rsgt the struct i915_refct_sgt to get.
> + */
> +static inline struct i915_refct_sgt *
> +i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
> +{
> +	kref_get(&rsgt->kref);
> +	return rsgt;
> +}
> +
> +/**
> + * i915_refct_sgt_init_ops - Initialize a refcounted sg-list with a custom
> + * operations structure
> + * @rsgt The struct i915_refct_sgt to initialize.
> + * @size: Size in bytes of the underlying memory buffer.
> + * @ops: A customized operations structure in case the refcounted sg-list
> + * is embedded into another structure.
> + */
> +static inline void i915_refct_sgt_init_ops(struct i915_refct_sgt *rsgt,
> +					   size_t size,
> +					   const struct i915_refct_sgt_ops *ops)
> +{
> +	kref_init(&rsgt->kref);
> +	rsgt->table.sgl = NULL;
> +	rsgt->size = size;
> +	rsgt->ops = ops;
> +}
> +
> +void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size);
> +
> +struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
> +					      u64 region_start);
>  
> -struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
> -					     u64 region_start);
> +struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
> +						     u64 region_start);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 98c7339bf8ba..2e901a27e259 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -115,8 +115,8 @@ void intel_region_ttm_fini(struct intel_memory_region *mem)
>  }
>  
>  /**
> - * intel_region_ttm_resource_to_st - Convert an opaque TTM resource manager resource
> - * to an sg_table.
> + * intel_region_ttm_resource_to_rsgt -
> + * Convert an opaque TTM resource manager resource to a refcounted sg_table.
>   * @mem: The memory region.
>   * @res: The resource manager resource obtained from the TTM resource manager.
>   *
> @@ -126,17 +126,18 @@ void intel_region_ttm_fini(struct intel_memory_region *mem)
>   *
>   * Return: A malloced sg_table on success, an error pointer on failure.
>   */
> -struct sg_table *intel_region_ttm_resource_to_st(struct intel_memory_region *mem,
> -						 struct ttm_resource *res)
> +struct i915_refct_sgt *
> +intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
> +				  struct ttm_resource *res)
>  {
>  	if (mem->is_range_manager) {
>  		struct ttm_range_mgr_node *range_node =
>  			to_ttm_range_mgr_node(res);
>  
> -		return i915_sg_from_mm_node(&range_node->mm_nodes[0],
> -					    mem->region.start);
> +		return i915_rsgt_from_mm_node(&range_node->mm_nodes[0],
> +					      mem->region.start);
>  	} else {
> -		return i915_sg_from_buddy_resource(res, mem->region.start);
> +		return i915_rsgt_from_buddy_resource(res, mem->region.start);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
> index 6f44075920f2..7bbe2b46b504 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.h
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.h
> @@ -22,8 +22,9 @@ int intel_region_ttm_init(struct intel_memory_region *mem);
>  
>  void intel_region_ttm_fini(struct intel_memory_region *mem);
>  
> -struct sg_table *intel_region_ttm_resource_to_st(struct intel_memory_region *mem,
> -						 struct ttm_resource *res);
> +struct i915_refct_sgt *
> +intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
> +				  struct ttm_resource *res);
>  
>  void intel_region_ttm_resource_free(struct intel_memory_region *mem,
>  				    struct ttm_resource *res);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
> index efa86dffe3c6..2752b5b98f60 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_region.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_region.c
> @@ -17,9 +17,9 @@
>  static void mock_region_put_pages(struct drm_i915_gem_object *obj,
>  				  struct sg_table *pages)
>  {
> +	i915_refct_sgt_put(obj->mm.rsgt);
> +	obj->mm.rsgt = NULL;
>  	intel_region_ttm_resource_free(obj->mm.region, obj->mm.res);
> -	sg_free_table(pages);
> -	kfree(pages);
>  }
>  
>  static int mock_region_get_pages(struct drm_i915_gem_object *obj)
> @@ -38,12 +38,14 @@ static int mock_region_get_pages(struct drm_i915_gem_object *obj)
>  	if (IS_ERR(obj->mm.res))
>  		return PTR_ERR(obj->mm.res);
>  
> -	pages = intel_region_ttm_resource_to_st(obj->mm.region, obj->mm.res);
> -	if (IS_ERR(pages)) {
> -		err = PTR_ERR(pages);
> +	obj->mm.rsgt = intel_region_ttm_resource_to_rsgt(obj->mm.region,
> +							 obj->mm.res);
> +	if (IS_ERR(obj->mm.rsgt)) {
> +		err = PTR_ERR(obj->mm.rsgt);
>  		goto err_free_resource;
>  	}
>  
> +	pages = &obj->mm.rsgt->table;
>  	__i915_gem_object_set_pages(obj, pages, i915_sg_dma_sizes(pages->sgl));
>  
>  	return 0;
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
