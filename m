Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781A80CE8B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 15:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF47510E46D;
	Mon, 11 Dec 2023 14:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6310E468;
 Mon, 11 Dec 2023 14:41:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336166b8143so2005525f8f.3; 
 Mon, 11 Dec 2023 06:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702305676; x=1702910476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mkf29c+1lVlxJDBaAqKNbDe9c/ne8JoDUh65/Bt7ybw=;
 b=a2BaoQcUP3mQMdbOhCvZ7MGsOVl3EabC0E/vGZzG6j1nDe+XcusJ5VaovL8l4UatBA
 u+dXWDJ2Ht32ox+Ec7MIa7L18fgK17pDpf0OwP1O2XJzzEPFtuQ4Mzf+wwOgDXuHlrqv
 ERbYbDgXN+kuU/whldVn9i13YS7eAu98+8b/NIoQUBzk6rOWXOOT3ysv73lD86QzKz3l
 TAnXPuTh+Qbhj961IqcuhlhPhINKOkFa3d1PDW6I3NqQ/MqOWpFeAGyPlpdIGcdTAfTt
 At2begjHlrYQZtCZYOLZ5shXd8dAG8TefSCzeOo9nrNj2eEvVu1jn98eTk+ZPkWS7LIz
 BV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702305676; x=1702910476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mkf29c+1lVlxJDBaAqKNbDe9c/ne8JoDUh65/Bt7ybw=;
 b=MSd/4Agk3OCf8za6PXKsf+YiB2HpfFTIW8KFeb3yzbW93Qc6aYYZ+WYB7R7BwGT3R1
 qV7d8Z7P9J1s7kcCExYqyYrFZz6fNjxvIeBu9/pyfNgjMdNsZZyBZU3uUM3xDPwLqfTk
 9wMGGx7gNSPB3r8+ZUwncWvFwOg14aEW9CmXu0qAo9je+mYziAP8+v2WQ1TyWRQt3p41
 eCoP9iGXl/DqxLKOAGeAC7TmJo2alEsqOoIgBuD1ylx8MaZbP5Siq6BoUS6LoXHAneav
 x1kdpAYySF+hCfzfEWuf44GEvI48DhD5qTiyMYeIHaCtiWF4XU9LcjocISEKp5d4NSOB
 lEYw==
X-Gm-Message-State: AOJu0Ywxq6W9YNGCzZGKbLePebqjlWToRHw40q0dSZcM3h6W4ULctT+S
 cloAuOr0eU/JAgdIBOK3S80=
X-Google-Smtp-Source: AGHT+IF6PuQLGa3BzoMrV+mQ9msbEQdSWocCMvRzSeVNxLj+JYZ9ArvBXqcNXxmQ5ZXueamVw5YZ0A==
X-Received: by 2002:a5d:400d:0:b0:333:394a:ed97 with SMTP id
 n13-20020a5d400d000000b00333394aed97mr2691898wrp.114.1702305675607; 
 Mon, 11 Dec 2023 06:41:15 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a05600000c900b0033330846e76sm8748984wrx.86.2023.12.11.06.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 06:41:15 -0800 (PST)
Message-ID: <aa445c4c-6406-479b-ba18-b9ffa8af31c2@gmail.com>
Date: Mon, 11 Dec 2023 15:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231211073113.3234-1-Arunpravin.PaneerSelvam@amd.com>
 <20231211073113.3234-2-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231211073113.3234-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.12.23 um 08:31 schrieb Arunpravin Paneer Selvam:
> Add clear page support in vram memory region.
>
> v1:(Christian)
>    - Dont handle clear page as TTM flag since when moving the BO back
>      in from GTT again we don't need that.
>    - Make a specialized version of amdgpu_fill_buffer() which only
>      clears the VRAM areas which are not already cleared
>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>      amdgpu_object.c
>
> v2:
>    - Modify the function name amdgpu_ttm_* (Alex)
>    - Drop the delayed parameter (Christian)
>    - handle amdgpu_res_cleared(&cursor) just above the size
>      calculation (Christian)
>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffers
>      in the free path to properly wait for fences etc.. (Christian)
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 16 +++---
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 +++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 53 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 15 +++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>   6 files changed, 109 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index cef920a93924..5a01b6266772 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -39,6 +39,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> +#include "amdgpu_vram_mgr.h"
>   
>   /**
>    * DOC: amdgpu_object
> @@ -598,8 +599,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	if (!amdgpu_bo_support_uswc(bo->flags))
>   		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>   
> -	if (adev->ras_enabled)
> -		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
> +	bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>   
>   	bo->tbo.bdev = &adev->mman.bdev;
>   	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
> @@ -629,15 +629,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   
>   	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
> -		struct dma_fence *fence;
> +		struct dma_fence *fence = NULL;
>   
> -		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
> +		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>   		if (unlikely(r))
>   			goto fail_unreserve;
>   
> -		dma_resv_add_fence(bo->tbo.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_fence_put(fence);
> +		if (fence) {
> +			dma_resv_add_fence(bo->tbo.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_fence_put(fence);
> +		}
>   	}
>   	if (!bp->resv)
>   		amdgpu_bo_unreserve(bo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 381101d2bf05..50fcd86e1033 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   	}
>   }
>   
> +/**
> + * amdgpu_res_cleared - check if blocks are cleared
> + *
> + * @cur: the cursor to extract the block
> + *
> + * Check if the @cur block is cleared
> + */
> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
> +{
> +	struct drm_buddy_block *block;
> +
> +	switch (cur->mem_type) {
> +	case TTM_PL_VRAM:
> +		block = cur->node;
> +
> +		if (!amdgpu_vram_mgr_is_cleared(block))
> +			return false;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 05991c5c8ddb..252b384194c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2222,6 +2222,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>   	return 0;
>   }
>   
> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **fence)
> +{
> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_res_cursor cursor;
> +	struct dma_fence *f = NULL;
> +	u64 addr;
> +	int r;
> +
> +	if (!adev->mman.buffer_funcs_enabled)
> +		return -EINVAL;
> +
> +	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
> +
> +	mutex_lock(&adev->mman.gtt_window_lock);
> +	while (cursor.remaining) {
> +		struct dma_fence *next = NULL;
> +		u64 size;
> +
> +		if (!amdgpu_res_cleared(&cursor)) {

That test here is now inverted. You need to remove the !

> +			amdgpu_res_next(&cursor, cursor.size);
> +			continue;
> +		}
> +
> +		/* Never clear more than 256MiB at once to avoid timeouts */
> +		size = min(cursor.size, 256ULL << 20);
> +
> +		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
> +					  1, ring, false, &size, &addr);
> +		if (r)
> +			goto err;
> +
> +		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> +					&next, true, true);
> +		if (r)
> +			goto err;
> +
> +		dma_fence_put(f);
> +		f = next;
> +
> +		amdgpu_res_next(&cursor, size);
> +	}
> +err:
> +	mutex_unlock(&adev->mman.gtt_window_lock);
> +	if (fence)
> +		*fence = dma_fence_get(f);
> +	dma_fence_put(f);
> +
> +	return r;
> +}
> +
>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 65ec82141a8e..cf77489a7adb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -155,6 +155,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   			       uint64_t size, bool tmz,
>   			       struct dma_resv *resv,
>   			       struct dma_fence **f);
> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **fence);
>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index d0e199cc8f17..f3d36c345b63 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -435,6 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>   	u64 vis_usage = 0, max_bytes, min_block_size;
>   	struct amdgpu_vram_mgr_resource *vres;
>   	u64 size, remaining_size, lpfn, fpfn;
> @@ -486,6 +487,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>   		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>   
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> +
>   	if (fpfn || lpfn != mgr->mm.size)
>   		/* Allocate blocks in desired range */
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> @@ -579,7 +583,9 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(res->bo);
>   	struct drm_buddy *mm = &mgr->mm;
> +	struct dma_fence *fence = NULL;
>   	struct drm_buddy_block *block;
>   	uint64_t vis_usage = 0;
>   
> @@ -589,7 +595,14 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) {
> +		if (!amdgpu_fill_buffer(bo, 0, NULL, &fence, true)) {
> +			vres->flags |= DRM_BUDDY_CLEARED;
> +			dma_fence_put(fence);
> +		}
> +	}

Please completely drop that chunk. 
AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE should already be handled elsewhere.

What you might want to do is to change the 
AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set the 
DRM_BUDDY_CLEARED flag.

That might be much cleaner and could potentially also handle the case 
where we can't execute the AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag 
because the engine isn't ready.

Regards,
Christian.

> +
> +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>   	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index 0e04e42cf809..8478522d7366 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>   	return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>   }
>   
> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_is_clear(block);
> +}
> +
>   static inline struct amdgpu_vram_mgr_resource *
>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>   {

