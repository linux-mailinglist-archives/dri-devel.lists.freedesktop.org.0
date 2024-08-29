Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2E96410C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AB910E139;
	Thu, 29 Aug 2024 10:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Zueemner";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4157B10E139
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:14:58 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3718acbc87fso279533f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724926496; x=1725531296; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cOXDolonjvHpVVU7gmdcIHEQfSpycont8Mb+uTTKegg=;
 b=ZueemnerTApqHS/kwj1v25ZTcnK5RQKLvY0ttpXrMO0+kC14j3V24q7aXwA2I0OBcN
 5FOeuV0ykUDt/r/+52ehtzPFeFSzklEU8MlZaT0qnc9l4V/6Jj1lpMEJCGh4CaDyFrlX
 HxoH+nY1SaJgwKon8Q51oiFUz+j9O+o/s1Acs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926496; x=1725531296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOXDolonjvHpVVU7gmdcIHEQfSpycont8Mb+uTTKegg=;
 b=c1dQqFmseDFwQm9S9BsWbCfgkUU40rOvO0GyzMD94qHYg6JQMgXm+jeDVrH0lIIcK9
 XS6JEO/XexEMAapiTeecGCYlC+Bu+MKVaqYCW8s/1JcJ0dfVC5tVaDoNvvVrmO+H6UV3
 /VUyCsC+I4tl3OgCIh8fiZCzOIXWR3B+jWwbwpe4FeUbhQE+K889/HLU1zwTyluKN5HY
 QG/+d9iUJ6WlqeWmMzbRL+26sCiqp/30PTnB0xQtH2HMGs90A4I2q48h1h2um/mmbi75
 weCVNQHdqG43Mird4h92gHKVCAkubrGYzKn6yrhUkFCzsHIa6+W3QuJYSWz6//8R0wwj
 +BxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqeCHLiGllyHRa/STqSUFPB7ZXrnxytomYVEWcSEzrHX/ZWO3pO39UHjgR4vLqV71Rf/VW8CNWpfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgq6XiAARX5YthGF1FCnnWgTQeJ3t4m5DQ0pYIESunogC9ESMG
 hlF6GBdU8Tju5/NLwSeTrzcnCe8wUIQXdCDBFys3FNBTKapgmkAb4935jcUJz4Q=
X-Google-Smtp-Source: AGHT+IEFGrDDd+sns+P1BMvkVuGU1BO+GKEI9F3i06qoohpe03oLOtirFvoHiNas211v7bB/12kCrQ==
X-Received: by 2002:adf:f74b:0:b0:367:9522:5e6b with SMTP id
 ffacd0b85a97d-3749b58066bmr1435306f8f.45.1724926496364; 
 Thu, 29 Aug 2024 03:14:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee71b9dsm1016846f8f.38.2024.08.29.03.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:14:55 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:14:53 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 24/28] drm/xe: Basic SVM BO eviction
Message-ID: <ZtBKHT_vuNfE5Y5j@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-25-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828024901.2582335-25-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Aug 27, 2024 at 07:48:57PM -0700, Matthew Brost wrote:
> Wire xe_bo_move to GPUSVM migration to SRAM with trylocking of mmap
> lock.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 35 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_svm.c      |  2 ++
>  drivers/gpu/drm/xe/xe_svm.h      | 13 ++++++++++++
>  4 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ad804b6f9e84..ae71fcbe5380 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -25,6 +25,7 @@
>  #include "xe_pm.h"
>  #include "xe_preempt_fence.h"
>  #include "xe_res_cursor.h"
> +#include "xe_svm.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -250,6 +251,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>  static void xe_evict_flags(struct ttm_buffer_object *tbo,
>  			   struct ttm_placement *placement)
>  {
> +	struct xe_bo *bo;
> +
>  	if (!xe_bo_is_xe_bo(tbo)) {
>  		/* Don't handle scatter gather BOs */
>  		if (tbo->type == ttm_bo_type_sg) {
> @@ -261,6 +264,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>  		return;
>  	}
>  
> +	bo = ttm_to_xe_bo(tbo);
> +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) {
> +		*placement = sys_placement;
> +		return;
> +	}
> +
>  	/*
>  	 * For xe, sg bos that are evicted to system just triggers a
>  	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
> @@ -758,6 +767,17 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		}
>  	}
>  
> +	if (!move_lacks_source && (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) &&
> +	    new_mem->mem_type == XE_PL_SYSTEM) {
> +		ret = xe_svm_range_evict(bo->range);
> +		if (!ret) {
> +			drm_dbg(&xe->drm, "Evict system allocator BO success\n");
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +		}
> +
> +		goto out;
> +	}
> +
>  	if (!move_lacks_source &&
>  	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
>  	     (mem_type_is_vram(old_mem_type) &&
> @@ -1096,6 +1116,19 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> +static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
> +				    const struct ttm_place *place)
> +{
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
> +	/* Do not evict SVMs before having a binding */
> +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC &&
> +	    !xe_svm_range_has_vram_binding(bo->range))
> +		return false;
> +
> +	return ttm_bo_eviction_valuable(ttm_bo, place);
> +}
> +
>  const struct ttm_device_funcs xe_ttm_funcs = {
>  	.ttm_tt_create = xe_ttm_tt_create,
>  	.ttm_tt_populate = xe_ttm_tt_populate,
> @@ -1106,7 +1139,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
>  	.io_mem_reserve = xe_ttm_io_mem_reserve,
>  	.io_mem_pfn = xe_ttm_io_mem_pfn,
>  	.release_notify = xe_ttm_bo_release_notify,
> -	.eviction_valuable = ttm_bo_eviction_valuable,
> +	.eviction_valuable = xe_bo_eviction_valuable,
>  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 2ed558ac2264..4523b033417c 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -16,6 +16,7 @@
>  #include "xe_ggtt_types.h"
>  
>  struct xe_device;
> +struct xe_svm_range;
>  struct xe_vm;
>  
>  #define XE_BO_MAX_PLACEMENTS	3
> @@ -47,6 +48,8 @@ struct xe_bo {
>  	struct ttm_bo_kmap_obj kmap;
>  	/** @pinned_link: link to present / evicted list of pinned BO */
>  	struct list_head pinned_link;
> +	/** @range: SVM range for BO */
> +	struct xe_svm_range *range;
>  #ifdef CONFIG_PROC_FS
>  	/**
>  	 * @client: @xe_drm_client which created the bo
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index fd8987e0a506..dc9810828c0a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -531,6 +531,8 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  			  range->base.va.start, ttm_bo_type_device,
>  			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
> +	if (!IS_ERR(bo))
> +		bo->range = range;
>  	xe_vm_unlock(vm);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 3f432483a230..b9cf0e2500da 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -46,6 +46,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  	return range->base.flags.has_dma_mapping;
>  }
>  
> +static inline bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
> +{
> +	return xe_svm_range_in_vram(range) && range->tile_present;
> +}
> +
> +static inline int xe_svm_range_evict(struct xe_svm_range *range)
> +{
> +	struct drm_gpusvm_ctx ctx = { .trylock_mmap = true, };

So even trying to acquire an mmap lock for eviction is I think a design
bug for svm memory ranges. It's a bunch of physical memory, you have no
idea how many mm/vma map it and which one you pick as the special one is
fairly arbitrary.

So dont, eviction should entirely ignore va/mm issues at the top level
like the migrate_device_range function does (maybe we need a
scatter-gather version of that instead of just a range.

That function internally makes sure you're in sync with any vma/vm by:
- installing migration ptes everywhere, which does the mmu_notifer dance
- locking the pages to prevent other concurrent migration or other fun
  stuff from happening
- then restore ptes to something sensisble when it's all done

And it does that by looping over _all_ possible mappings of a page with
the rmap_walk infrastructure.

The only reason when we need the mmap lock (or vma lock or whatever) is if
we need to be coherent with other concurrent mm updates of a specific mm.
That should only be the case when migrating to vram, where the gpusvm->mm
is the special one, and when migrating to sram due to cpu faults, where
the vmf->vma->mm is special (and might at best have a tenous relationship
to the gpusvm->mm). But that's the only cases where a specific mm and vma
have any relevance to svm vram allocations.

-Sima

> +
> +	return drm_gpusvm_migrate_to_sram(range->base.gpusvm, &range->base,
> +					  &ctx);
> +}
> +
>  #define xe_svm_notifier_lock(vm__)	\
>  	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
