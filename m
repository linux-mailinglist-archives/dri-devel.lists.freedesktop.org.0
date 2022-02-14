Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3404B41FC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B5F10E13B;
	Mon, 14 Feb 2022 06:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7010E143;
 Mon, 14 Feb 2022 06:32:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso10972584wmj.2; 
 Sun, 13 Feb 2022 22:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8Rz4UlL5O9ttNPwQZ1bmwtfEQoEusKRizoUczbjzk8A=;
 b=IZsqztCfnwnoFMgW6I7uJxqHu7pnyoUG1iu2LsaGYd84r56KKgfT9+JwQLcq8JQ9I2
 H+5+hwfbr+bks28v4BaHsq+cZVnKjTg1qTCHdcM5sigRLiUIlo74iE9nixKFWRHwvTAA
 aRiyj1tXQy7sfq0bIyGc3d9vKwQk3ze9pQnfiLE9Gl5tcfgZGYBkVBAkQ+LTs0a6Ndgo
 b2E+dokNz2TuRGhBseSiX4uoDRdVdRAxw49iU95VfsfvkF8iHASGW4f+bLpwJnFHbSZh
 I/rYkLFfzzLgyILFdcAfOHFv3ncH9C4+o+HemNiMaAbcZylAQdX1B5tRkW+r+MscZXFt
 4ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Rz4UlL5O9ttNPwQZ1bmwtfEQoEusKRizoUczbjzk8A=;
 b=YGWr1rG+YVoDaeWkHmQWW1KTgm47vqBT7MGKMyOOyZg9f97exNuTk+5T4npu73w+sp
 v1H+/BlQ0vU0udsB7Z/OkWv8xXHmoJ3rxKc1ZeJFfka8qOeE+RCrcBTldGXZ/s8yhxyN
 xuh9Ie/rkne23SO5PT8u0XnxHDRITzyaabker2gQ5g2EKBr5WfHvuXa3GM1y2ekpiOV3
 3GB3bJuRZ75XiL2nlKA4vYR13f1WDtvDGywJ7Y+//LXqCytmCTUM5dS2TE6qHynn6Mm4
 SqJ+LFP80Af4QUX6BswcMAOryjD9DLMihrZmHH88TjTTAJK4t6b1v43NoPHZbB/6vUgH
 5/TQ==
X-Gm-Message-State: AOAM532kXlm8JiaoHN/PIRuO/zaNAUV3fxvGCfpdnAKOjOkB48Q+glPB
 dsYZnq1gqj+qlBnctDhAS6s=
X-Google-Smtp-Source: ABdhPJzqKtqb/IJSwo+FDtfKS2bchrLmeESO8mrSZfNgzA6/GKnMZBQis3rWPcmBmoyzcQIGCAG29g==
X-Received: by 2002:a7b:c381:: with SMTP id s1mr10001574wmj.114.1644820336249; 
 Sun, 13 Feb 2022 22:32:16 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:50d5:8646:21a1:a00a?
 ([2a02:908:1252:fb60:50d5:8646:21a1:a00a])
 by smtp.gmail.com with ESMTPSA id o14sm31956006wry.104.2022.02.13.22.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 22:32:15 -0800 (PST)
Message-ID: <32487d00-8ee2-b54e-cf5d-3b241ff19a5b@gmail.com>
Date: Mon, 14 Feb 2022 07:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/5] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, matthew.auld@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.02.22 um 09:52 schrieb Arunpravin:
> - Make drm_buddy_alloc a single function to handle
>    range allocation and non-range allocation demands
>
> - Implemented a new function alloc_range() which allocates
>    the requested power-of-two block comply with range limitations
>
> - Moved order computation and memory alignment logic from
>    i915 driver to drm buddy
>
> v2:
>    merged below changes to keep the build unbroken
>     - drm_buddy_alloc_range() becomes obsolete and may be removed
>     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>     - apply enhanced drm_buddy_alloc() function to i915 driver
>
> v3(Matthew Auld):
>    - Fix alignment issues and remove unnecessary list_empty check
>    - add more validation checks for input arguments
>    - make alloc_range() block allocations as bottom-up
>    - optimize order computation logic
>    - replace uint64_t with u64, which is preferred in the kernel
>
> v4(Matthew Auld):
>    - keep drm_buddy_alloc_range() function implementation for generic
>      actual range allocations
>    - keep alloc_range() implementation for end bias allocations
>
> v5(Matthew Auld):
>    - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
>      as place->lpfn will currently always be zero for i915
>
> v6(Matthew Auld):
>    - fixup potential uaf - If we are unlucky and can't allocate
>      enough memory when splitting blocks, where we temporarily
>      end up with the given block and its buddy on the respective
>      free list, then we need to ensure we delete both blocks,
>      and no just the buddy, before potentially freeing them
>
>    - fix warnings reported by kernel test robot <lkp@intel.com>
>
> v7(Matthew Auld):
>    - revert fixup potential uaf
>    - keep __alloc_range() add node to the list logic same as
>      drm_buddy_alloc_blocks() by having a temporary list variable
>    - at drm_buddy_alloc_blocks() keep i915 range_overflows macro
>      and add a new check for end variable
>
> v8:
>    - fix warnings reported by kernel test robot <lkp@intel.com>
>
> v9(Matthew Auld):
>    - remove DRM_BUDDY_RANGE_ALLOCATION flag
>    - remove unnecessary function description
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

As long as nobody objects I'm going to push patches 1-3 to drm-misc-next 
in the next hour or so:

Then going to take a deeper look into patches 4 and 5 to get them reviewed.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/drm_buddy.c                   | 292 +++++++++++++-----
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  63 ++--
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>   include/drm/drm_buddy.h                       |  11 +-
>   4 files changed, 250 insertions(+), 118 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index d60878bc9c20..e0c0d786a572 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -282,23 +282,97 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
>   }
>   EXPORT_SYMBOL(drm_buddy_free_list);
>   
> -/**
> - * drm_buddy_alloc_blocks - allocate power-of-two blocks
> - *
> - * @mm: DRM buddy manager to allocate from
> - * @order: size of the allocation
> - *
> - * The order value here translates to:
> - *
> - * 0 = 2^0 * mm->chunk_size
> - * 1 = 2^1 * mm->chunk_size
> - * 2 = 2^2 * mm->chunk_size
> - *
> - * Returns:
> - * allocated ptr to the &drm_buddy_block on success
> - */
> -struct drm_buddy_block *
> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= e2 && e1 >= s2;
> +}
> +
> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= s2 && e1 >= e2;
> +}
> +
> +static struct drm_buddy_block *
> +alloc_range_bias(struct drm_buddy *mm,
> +		 u64 start, u64 end,
> +		 unsigned int order)
> +{
> +	struct drm_buddy_block *block;
> +	struct drm_buddy_block *buddy;
> +	LIST_HEAD(dfs);
> +	int err;
> +	int i;
> +
> +	end = end - 1;
> +
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct drm_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		if (drm_buddy_block_order(block) < order)
> +			continue;
> +
> +		block_start = drm_buddy_block_offset(block);
> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(start, end, block_start, block_end))
> +			continue;
> +
> +		if (drm_buddy_block_is_allocated(block))
> +			continue;
> +
> +		if (contains(start, end, block_start, block_end) &&
> +		    order == drm_buddy_block_order(block)) {
> +			/*
> +			 * Find the free block within the range.
> +			 */
> +			if (drm_buddy_block_is_free(block))
> +				return block;
> +
> +			continue;
> +		}
> +
> +		if (!drm_buddy_block_is_split(block)) {
> +			err = split_block(mm, block);
> +			if (unlikely(err))
> +				goto err_undo;
> +		}
> +
> +		list_add(&block->right->tmp_link, &dfs);
> +		list_add(&block->left->tmp_link, &dfs);
> +	} while (1);
> +
> +	return ERR_PTR(-ENOSPC);
> +
> +err_undo:
> +	/*
> +	 * We really don't want to leave around a bunch of split blocks, since
> +	 * bigger is better, so make sure we merge everything back before we
> +	 * free the allocated blocks.
> +	 */
> +	buddy = get_buddy(block);
> +	if (buddy &&
> +	    (drm_buddy_block_is_free(block) &&
> +	     drm_buddy_block_is_free(buddy)))
> +		__drm_buddy_free(mm, block);
> +	return ERR_PTR(err);
> +}
> +
> +static struct drm_buddy_block *
> +alloc_from_freelist(struct drm_buddy *mm,
> +		    unsigned int order,
> +		    unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
>   	unsigned int i;
> @@ -320,78 +394,29 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>   	while (i != order) {
>   		err = split_block(mm, block);
>   		if (unlikely(err))
> -			goto out_free;
> +			goto err_undo;
>   
> -		/* Go low */
> -		block = block->left;
> +		block = block->right;
>   		i--;
>   	}
> -
> -	mark_allocated(block);
> -	mm->avail -= drm_buddy_block_size(mm, block);
> -	kmemleak_update_trace(block);
>   	return block;
>   
> -out_free:
> +err_undo:
>   	if (i != order)
>   		__drm_buddy_free(mm, block);
>   	return ERR_PTR(err);
>   }
> -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> -
> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> -{
> -	return s1 <= e2 && e1 >= s2;
> -}
> -
> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> -{
> -	return s1 <= s2 && e1 >= e2;
> -}
>   
> -/**
> - * drm_buddy_alloc_range - allocate range
> - *
> - * @mm: DRM buddy manager to allocate from
> - * @blocks: output list head to add allocated blocks
> - * @start: start of the allowed range for this block
> - * @size: size of the allocation
> - *
> - * Intended for pre-allocating portions of the address space, for example to
> - * reserve a block for the initial framebuffer or similar, hence the expectation
> - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
> - * allocations, so if that's not the case then the drm_mm range allocator is
> - * probably a much better fit, and so you should probably go use that instead.
> - *
> - * Note that it's safe to chain together multiple alloc_ranges
> - * with the same blocks list
> - *
> - * Returns:
> - * 0 on success, error code on failure.
> - */
> -int drm_buddy_alloc_range(struct drm_buddy *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size)
> +static int __alloc_range(struct drm_buddy *mm,
> +			 struct list_head *dfs,
> +			 u64 start, u64 size,
> +			 struct list_head *blocks)
>   {
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
>   	LIST_HEAD(allocated);
> -	LIST_HEAD(dfs);
>   	u64 end;
>   	int err;
> -	int i;
> -
> -	if (size < mm->chunk_size)
> -		return -EINVAL;
> -
> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
> -		return -EINVAL;
> -
> -	if (range_overflows(start, size, mm->size))
> -		return -EINVAL;
> -
> -	for (i = 0; i < mm->n_roots; ++i)
> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>   
>   	end = start + size - 1;
>   
> @@ -399,7 +424,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>   		u64 block_start;
>   		u64 block_end;
>   
> -		block = list_first_entry_or_null(&dfs,
> +		block = list_first_entry_or_null(dfs,
>   						 struct drm_buddy_block,
>   						 tmp_link);
>   		if (!block)
> @@ -436,8 +461,8 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>   				goto err_undo;
>   		}
>   
> -		list_add(&block->right->tmp_link, &dfs);
> -		list_add(&block->left->tmp_link, &dfs);
> +		list_add(&block->right->tmp_link, dfs);
> +		list_add(&block->left->tmp_link, dfs);
>   	} while (1);
>   
>   	list_splice_tail(&allocated, blocks);
> @@ -459,7 +484,120 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>   	drm_buddy_free_list(mm, &allocated);
>   	return err;
>   }
> -EXPORT_SYMBOL(drm_buddy_alloc_range);
> +
> +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
> +				   u64 start,
> +				   u64 size,
> +				   struct list_head *blocks)
> +{
> +	LIST_HEAD(dfs);
> +	int i;
> +
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	return __alloc_range(mm, &dfs, start, size, blocks);
> +}
> +
> +/**
> + * drm_buddy_alloc_blocks - allocate power-of-two blocks
> + *
> + * @mm: DRM buddy manager to allocate from
> + * @start: start of the allowed range for this block
> + * @end: end of the allowed range for this block
> + * @size: size of the allocation
> + * @min_page_size: alignment of the allocation
> + * @blocks: output list head to add allocated blocks
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
> + *
> + * alloc_range_bias() called on range limitations, which traverses
> + * the tree and returns the desired block.
> + *
> + * alloc_from_freelist() called when *no* range restrictions
> + * are enforced, which picks the block from the freelist.
> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			   u64 start, u64 end, u64 size,
> +			   u64 min_page_size,
> +			   struct list_head *blocks,
> +			   unsigned long flags)
> +{
> +	struct drm_buddy_block *block = NULL;
> +	unsigned int min_order, order;
> +	unsigned long pages;
> +	LIST_HEAD(allocated);
> +	int err;
> +
> +	if (size < mm->chunk_size)
> +		return -EINVAL;
> +
> +	if (min_page_size < mm->chunk_size)
> +		return -EINVAL;
> +
> +	if (!is_power_of_2(min_page_size))
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
> +		return -EINVAL;
> +
> +	if (end > mm->size)
> +		return -EINVAL;
> +
> +	if (range_overflows(start, size, mm->size))
> +		return -EINVAL;
> +
> +	/* Actual range allocation */
> +	if (start + size == end)
> +		return __drm_buddy_alloc_range(mm, start, size, blocks);
> +
> +	pages = size >> ilog2(mm->chunk_size);
> +	order = fls(pages) - 1;
> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
> +	do {
> +		order = min(order, (unsigned int)fls(pages) - 1);
> +		BUG_ON(order > mm->max_order);
> +		BUG_ON(order < min_order);
> +
> +		do {
> +			if (start || end != size)
> +				/* Allocate traversing within the range */
> +				block = alloc_range_bias(mm, start, end, order);
> +			else
> +				/* Allocate from freelist */
> +				block = alloc_from_freelist(mm, order, flags);
> +
> +			if (!IS_ERR(block))
> +				break;
> +
> +			if (order-- == min_order) {
> +				err = -ENOSPC;
> +				goto err_free;
> +			}
> +		} while (1);
> +
> +		mark_allocated(block);
> +		mm->avail -= drm_buddy_block_size(mm, block);
> +		kmemleak_update_trace(block);
> +		list_add_tail(&block->link, &allocated);
> +
> +		pages -= BIT(order);
> +
> +		if (!pages)
> +			break;
> +	} while (1);
> +
> +	list_splice_tail(&allocated, blocks);
> +	return 0;
> +
> +err_free:
> +	drm_buddy_free_list(mm, &allocated);
> +	return err;
> +}
> +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>   
>   /**
>    * drm_buddy_block_print - print block information
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 247714bab044..7aef6ad9fe84 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   	struct i915_ttm_buddy_resource *bman_res;
>   	struct drm_buddy *mm = &bman->mm;
> -	unsigned long n_pages;
> -	unsigned int min_order;
> +	unsigned long n_pages, lpfn;
>   	u64 min_page_size;
>   	u64 size;
>   	int err;
>   
> -	GEM_BUG_ON(place->fpfn || place->lpfn);
> +	lpfn = place->lpfn;
> +	if (!lpfn)
> +		lpfn = man->size;
>   
>   	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>   	if (!bman_res)
> @@ -60,10 +61,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   		min_page_size = bo->page_alignment << PAGE_SHIFT;
>   
>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		unsigned long pages;
> +
>   		size = roundup_pow_of_two(size);
> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
> +		min_page_size = size;
> +
> +		pages = size >> ilog2(mm->chunk_size);
> +		if (pages > lpfn)
> +			lpfn = pages;
>   	}
>   
>   	if (size > mm->size) {
> @@ -73,34 +80,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   
>   	n_pages = size >> ilog2(mm->chunk_size);
>   
> -	do {
> -		struct drm_buddy_block *block;
> -		unsigned int order;
> -
> -		order = fls(n_pages) - 1;
> -		GEM_BUG_ON(order > mm->max_order);
> -		GEM_BUG_ON(order < min_order);
> -
> -		do {
> -			mutex_lock(&bman->lock);
> -			block = drm_buddy_alloc_blocks(mm, order);
> -			mutex_unlock(&bman->lock);
> -			if (!IS_ERR(block))
> -				break;
> -
> -			if (order-- == min_order) {
> -				err = -ENOSPC;
> -				goto err_free_blocks;
> -			}
> -		} while (1);
> -
> -		n_pages -= BIT(order);
> -
> -		list_add_tail(&block->link, &bman_res->blocks);
> -
> -		if (!n_pages)
> -			break;
> -	} while (1);
> +	mutex_lock(&bman->lock);
> +	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +				     (u64)lpfn << PAGE_SHIFT,
> +				     (u64)n_pages << PAGE_SHIFT,
> +				     min_page_size,
> +				     &bman_res->blocks,
> +				     bman_res->flags);
> +	mutex_unlock(&bman->lock);
> +	if (unlikely(err))
> +		goto err_free_blocks;
>   
>   	*res = &bman_res->base;
>   	return 0;
> @@ -268,12 +257,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>   {
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   	struct drm_buddy *mm = &bman->mm;
> +	unsigned long flags = 0;
>   	int ret;
>   
>   	mutex_lock(&bman->lock);
> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
> +	ret = drm_buddy_alloc_blocks(mm, start,
> +				     start + size,
> +				     size, mm->chunk_size,
> +				     &bman->reserved,
> +				     flags);
>   	mutex_unlock(&bman->lock);
>   
>   	return ret;
>   }
> -
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> index 312077941411..72c90b432e87 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> @@ -20,6 +20,7 @@ struct drm_buddy;
>    *
>    * @base: struct ttm_resource base class we extend
>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>    * @mm: the struct i915_buddy_mm for this resource
>    *
>    * Extends the struct ttm_resource to manage an address space allocation with
> @@ -28,6 +29,7 @@ struct drm_buddy;
>   struct i915_ttm_buddy_resource {
>   	struct ttm_resource base;
>   	struct list_head blocks;
> +	unsigned long flags;
>   	struct drm_buddy *mm;
>   };
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index f524db152413..1f2435426c69 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -131,12 +131,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>   
>   void drm_buddy_fini(struct drm_buddy *mm);
>   
> -struct drm_buddy_block *
> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
> -
> -int drm_buddy_alloc_range(struct drm_buddy *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size);
> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			   u64 start, u64 end, u64 size,
> +			   u64 min_page_size,
> +			   struct list_head *blocks,
> +			   unsigned long flags);
>   
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   

