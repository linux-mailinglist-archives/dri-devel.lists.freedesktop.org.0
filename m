Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776B87FBD1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 11:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D964810E4D2;
	Tue, 19 Mar 2024 10:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bIyXxVdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2C810E4D2;
 Tue, 19 Mar 2024 10:29:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso21184265e9.0; 
 Tue, 19 Mar 2024 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710844143; x=1711448943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nYhxlcLm2ju7Vke60GQCUqLG9abp/zkC8GYhtSApUBA=;
 b=bIyXxVdXxFS7m3U9ctNTDJ8wNiR9G2Dyxee4byM9pKWAkL6DLEL9OWH1WI/XVSpuwO
 mbCTaS92+XyVB64GbhC5775WeYncKf89obRSccg1A7VWxrJQ9K++eV9xmaAMOODPVIPN
 RIohr48KNbou97N9hABGjmawbz1F84VsfTzxHpPW6ITbtV3j79DygK1xx8OlfwHTG/fg
 6tsg56VMu8NKDXAeR76TkbYXq3KWIvOr0ikpRIqnHRqsL/jIg59QqppoX1BNYXBfll6r
 7yXU71fLwN+AYe7Px8MUz9y4XuZd5i1rPCM6oe1cvEYLohnGWxPDSC45lFCV3Q1NrpSN
 TlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710844143; x=1711448943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nYhxlcLm2ju7Vke60GQCUqLG9abp/zkC8GYhtSApUBA=;
 b=YbwYRfPvNiLCNDDUXx/ATAgxprO1bOV0vVPOrZquCg0Ot5Cw1SZmpVSsj+hItJ0eqL
 Jn0Tcgk8AYxi4h6XJVPHFt7nYIIvBo9IrcsK62F5oei/mqfJYRq0lGA8tdecH57UwD2W
 SPLNHBzpdUkJ+YS6etwCxfJHoEwpco4LSBl9uKwpbL2kwgJsVZr69SXEFB0Mj0FriLyL
 tkI/OR3M14N1Yw4hjMYFJ/RsK/ttD+0gTerRneniEDuBddH3/W785d1nNPhsNpTlAyKL
 4Zpmg4QCxDibdScI0TEphdlhGjH7dKsC/ij8ck1DTERmbthyU0e7oyS672dvF8YShhIw
 3YTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+5rQOwKRLJi96TeYKp1RQ5DGkBhDtzrur4rmilf4KnFbkJ89zzkSr6qVpxn9/tsqlKQ3M9q6IcB3L5kE7nowcPUWMzrL5nSSQut8uQ1LvcaBZ1bNs/PFQ5XYVh1ehW+5DIU2D7J5R+4lP99kU0w==
X-Gm-Message-State: AOJu0YyRTyCVeXs8hnfFW2UC3KmJer0EJbp8jkF178anBYOw2ScNdy3o
 sTZL9jdHMp59RHRBQPe5DZ6HWzDEOFfz512jFsKQDvqZYg6Qg8zO
X-Google-Smtp-Source: AGHT+IEfC/HTP62nbr/Wz4xz6hFyvSKuknJs3UyMpsDCB8CIHrnUvLO2iLEyast2GEknf+s6DK/npQ==
X-Received: by 2002:adf:ee0e:0:b0:33e:d139:412c with SMTP id
 y14-20020adfee0e000000b0033ed139412cmr1983754wrn.30.1710844142924; 
 Tue, 19 Mar 2024 03:29:02 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 az23-20020adfe197000000b0033e9d9f891csm5305690wrb.58.2024.03.19.03.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 03:29:02 -0700 (PDT)
Message-ID: <b1fc43cf-699f-496d-a239-11a5b288292b@gmail.com>
Date: Tue, 19 Mar 2024 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 18.03.24 um 22:40 schrieb Arunpravin Paneer Selvam:
> Add clear page support in vram memory region.
>
> v1(Christian):
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
> v3(Christian):
>    - Remove buffer clear code in VRAM manager instead change the
>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>      the DRM_BUDDY_CLEARED flag.
>    - Remove ! from amdgpu_res_cleared(&cursor) check.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Acked-by: Felix Kuehling <felix.kuehling@amd.com>

Just a few nit picks below, but in general already looks good to me.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>   6 files changed, 111 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 8bc79924d171..c92d92b28a57 100644
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
> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	if (!amdgpu_bo_support_uswc(bo->flags))
>   		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>   
> -	if (adev->ras_enabled)
> -		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
> +	bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>   
>   	bo->tbo.bdev = &adev->mman.bdev;
>   	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
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
> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>   	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>   		return;
>   
> -	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence, true);
> +	r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>   	if (!WARN_ON(r)) {
> +		struct amdgpu_vram_mgr_resource *vres;
> +
> +		vres = to_amdgpu_vram_mgr_resource(bo->resource);
> +		vres->flags |= DRM_BUDDY_CLEARED;

Those lines should probably be in the VRAM manager.

>   		amdgpu_bo_fence(abo, fence, false);
>   		dma_fence_put(fence);
>   	}
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
> index 8722beba494e..bcbffe909b47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>   		struct dma_fence *wipe_fence = NULL;
>   
> -		r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
> -					false);
> +		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> +				       false);
>   		if (r) {
>   			goto error;
>   		} else if (wipe_fence) {
> +			struct amdgpu_vram_mgr_resource *vres;
> +
> +			vres = to_amdgpu_vram_mgr_resource(bo->resource);
> +			vres->flags |= DRM_BUDDY_CLEARED;
>   			dma_fence_put(fence);
>   			fence = wipe_fence;
>   		}
> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>   	return 0;
>   }
>   

Some kerneldoc here what the function does would ne nice to have.

> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **fence)
> +{
> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_res_cursor cursor;
> +	struct dma_fence *f = NULL;

It might be cleaner to just use the stub fence here (see 
dma_fence_get_stub()).

This would avoid to local variable init in the caller and the if which 
checks if the function returned a fence or not.

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
> +		if (amdgpu_res_cleared(&cursor)) {
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

Just make fence a mandatory parameter and drop the if and the get/put dance.

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
> index 65ec82141a8e..b404d89d52e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -38,8 +38,6 @@
>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
>   
> -#define AMDGPU_POISON	0xd0bed0be
> -
>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>   
> @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
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
> index c0c851409241..e494f5bf136a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>   	u64 vis_usage = 0, max_bytes, min_block_size;
>   	struct amdgpu_vram_mgr_resource *vres;
>   	u64 size, remaining_size, lpfn, fpfn;
> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>   		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>   
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> +

Mhm, you should probably *not* store this flags in the vres structure.

As soon as the BO is used the VRAM wouldn't be cleared any more.

Regards,
Christian.

>   	if (fpfn || lpfn != mgr->mm.size)
>   		/* Allocate blocks in desired range */
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
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

