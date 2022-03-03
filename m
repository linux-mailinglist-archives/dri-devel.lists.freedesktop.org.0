Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508024CBD57
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 13:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7FD10E2AD;
	Thu,  3 Mar 2022 12:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FC110E2AD;
 Thu,  3 Mar 2022 12:04:20 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id r13so10182501ejd.5;
 Thu, 03 Mar 2022 04:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rucsh55X8SB3/4UQpxKDpG/Rfc4OTsrF6P5e0He1ljs=;
 b=T8V4WgSUkrx589vfhsNfl59AfvL5tJToNojYrjSDcBjrjF4SBlf4quJr1KH1qEuBrU
 b255N7Lt2bhAJa1pkNmM2poplRRbiryZ3OetiZlOfWMWb1VqKPvriMqF+TFnYyFWB0t9
 Rru/l57IOfCp/tF/bfz9L4PX6BLcCN/w2l8ViEtnIZgfUVNF9mNVvx+mTgKXbO0VCQIX
 p+rwP80g5N5oSnNr2cE421yZz8Qd0lRFX1gYybL8r89hL1ToJ9m4t5As0CeV5PoH2qX/
 4/36/ZGT72R3lwZkpxOJEBnaR7kvqa/zb2oQ1RT3XRZWXgMwAemyJqflRMOpI00u5yx+
 a9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rucsh55X8SB3/4UQpxKDpG/Rfc4OTsrF6P5e0He1ljs=;
 b=ouZYm62/4C1brTIsD01EglkkXN2qG9M51lfUOy7tfWH5RVxAcTmmtqpzONh4imhWz/
 OKNIrjcO8n6mlPYHkhpBeuR4zwCwZOlekPX32soeALexg99SRuI/H0RvUUphEI0e8gCo
 0yNwSQuiRGyynSROz98ou0p2K9cQ53fyW9hMC+udjEoDUj/fT+hXGffrtJsfL1F22epV
 6+EMCcSb479ZNK/+o5e5nNo0B/bI8vZK/F5aI7Sz0y88piEt/tQwd3JTxhS6hDqNfGP8
 eer+7HPj0agRmArKWNF1yGFtrl7aH7ya9LLDNMfToFfH7BKFfha/218oIugmf1Lre++O
 vrAA==
X-Gm-Message-State: AOAM530gqGRGt9Cq/v4feRDBA8Beq4Ee/PAd5nHpLiwz6ekyYTNFpCiv
 G5L7X4+q9T3tos4yi38iQ7w=
X-Google-Smtp-Source: ABdhPJzDfJDmYd6r+okU1IrVVM6PGtYQZq5x6F+f2/I1/2WW3rxvp+2HN4kpV1TIsRCx74OkypyjAw==
X-Received: by 2002:a17:906:6a2a:b0:6cf:d228:790c with SMTP id
 qw42-20020a1709066a2a00b006cfd228790cmr27804224ejc.75.1646309058706; 
 Thu, 03 Mar 2022 04:04:18 -0800 (PST)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170906340400b006d077e850b5sm636026ejb.23.2022.03.03.04.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 04:04:18 -0800 (PST)
Message-ID: <1e045fa5-95e4-f17e-4677-7c379a03973f@gmail.com>
Date: Thu, 3 Mar 2022 13:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220301203838.4463-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220301203838.4463-1-Arunpravin.PaneerSelvam@amd.com>
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



Am 01.03.22 um 21:38 schrieb Arunpravin:
> - Remove drm_mm references and replace with drm buddy functionalities
> - Add res cursor support for drm buddy
>
> v2(Matthew Auld):
>    - replace spinlock with mutex as we call kmem_cache_zalloc
>      (..., GFP_KERNEL) in drm_buddy_alloc() function
>
>    - lock drm_buddy_block_trim() function as it calls
>      mark_free/mark_split are all globally visible
>
> v3(Matthew Auld):
>    - remove trim method error handling as we address the failure case
>      at drm_buddy_block_trim() function
>
> v4:
>    - fix warnings reported by kernel test robot <lkp@intel.com>
>
> v5:
>    - fix merge conflict issue
>
> v6:
>    - fix warnings reported by kernel test robot <lkp@intel.com>
>
> v7:
>    - remove DRM_BUDDY_RANGE_ALLOCATION flag usage
>
> v8:
>    - keep DRM_BUDDY_RANGE_ALLOCATION flag usage
>    - resolve conflicts created by drm/amdgpu: remove VRAM accounting v2
>
> v9(Christian):
>    - rename label name as fallback
>    - move struct amdgpu_vram_mgr to amdgpu_vram_mgr.h
>    - remove unnecessary flags from struct amdgpu_vram_reservation
>    - rewrite block NULL check condition
>    - change else style as per coding standard
>    - rewrite the node max size
>    - add a helper function to fetch the first entry from the list
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/Kconfig                       |   1 +
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 249 ++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  68 +++++
>   5 files changed, 289 insertions(+), 136 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f1422bee3dcc..5133c3f028ab 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -280,6 +280,7 @@ config DRM_AMDGPU
>   	select HWMON
>   	select BACKLIGHT_CLASS_DEVICE
>   	select INTERVAL_TREE
> +	select DRM_BUDDY
>   	help
>   	  Choose this option if you have a recent AMD Radeon graphics card.
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index acfa207cf970..864c609ba00b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -30,12 +30,15 @@
>   #include <drm/ttm/ttm_resource.h>
>   #include <drm/ttm/ttm_range_manager.h>
>   
> +#include "amdgpu_vram_mgr.h"
> +
>   /* state back for walking over vram_mgr and gtt_mgr allocations */
>   struct amdgpu_res_cursor {
>   	uint64_t		start;
>   	uint64_t		size;
>   	uint64_t		remaining;
> -	struct drm_mm_node	*node;
> +	void			*node;
> +	uint32_t		mem_type;
>   };
>   
>   /**
> @@ -52,27 +55,63 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   				    uint64_t start, uint64_t size,
>   				    struct amdgpu_res_cursor *cur)
>   {
> +	struct drm_buddy_block *block;
> +	struct list_head *head, *next;
>   	struct drm_mm_node *node;
>   
> -	if (!res || res->mem_type == TTM_PL_SYSTEM) {
> -		cur->start = start;
> -		cur->size = size;
> -		cur->remaining = size;
> -		cur->node = NULL;
> -		WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
> -		return;
> -	}
> +	if (!res)
> +		goto fallback;
>   
>   	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
>   
> -	node = to_ttm_range_mgr_node(res)->mm_nodes;
> -	while (start >= node->size << PAGE_SHIFT)
> -		start -= node++->size << PAGE_SHIFT;
> +	cur->mem_type = res->mem_type;
> +
> +	switch (cur->mem_type) {
> +	case TTM_PL_VRAM:
> +		head = &to_amdgpu_vram_mgr_node(res)->blocks;
> +
> +		block = list_first_entry_or_null(head,
> +						 struct drm_buddy_block,
> +						 link);
> +		if (!block)
> +			goto fallback;
> +
> +		while (start >= amdgpu_node_size(block)) {
> +			start -= amdgpu_node_size(block);
> +
> +			next = block->link.next;
> +			if (next != head)
> +				block = list_entry(next, struct drm_buddy_block, link);
> +		}
> +
> +		cur->start = amdgpu_node_start(block) + start;
> +		cur->size = min(amdgpu_node_size(block) - start, size);
> +		cur->remaining = size;
> +		cur->node = block;
> +		break;
> +	case TTM_PL_TT:
> +		node = to_ttm_range_mgr_node(res)->mm_nodes;
> +		while (start >= node->size << PAGE_SHIFT)
> +			start -= node++->size << PAGE_SHIFT;
> +
> +		cur->start = (node->start << PAGE_SHIFT) + start;
> +		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->remaining = size;
> +		cur->node = node;
> +		break;
> +	default:
> +		goto fallback;
> +	}
>   
> -	cur->start = (node->start << PAGE_SHIFT) + start;
> -	cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +	return;
> +
> +fallback:
> +	cur->start = start;
> +	cur->size = size;
>   	cur->remaining = size;
> -	cur->node = node;
> +	cur->node = NULL;
> +	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
> +	return;
>   }
>   
>   /**
> @@ -85,7 +124,9 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>    */
>   static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   {
> -	struct drm_mm_node *node = cur->node;
> +	struct drm_buddy_block *block;
> +	struct drm_mm_node *node;
> +	struct list_head *next;
>   
>   	BUG_ON(size > cur->remaining);
>   
> @@ -99,9 +140,27 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		return;
>   	}
>   
> -	cur->node = ++node;
> -	cur->start = node->start << PAGE_SHIFT;
> -	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +	switch (cur->mem_type) {
> +	case TTM_PL_VRAM:
> +		block = cur->node;
> +
> +		next = block->link.next;
> +		block = list_entry(next, struct drm_buddy_block, link);
> +
> +		cur->node = block;
> +		cur->start = amdgpu_node_start(block);
> +		cur->size = min(amdgpu_node_size(block), cur->remaining);
> +		break;
> +	case TTM_PL_TT:
> +		node = cur->node;
> +
> +		cur->node = ++node;
> +		cur->start = node->start << PAGE_SHIFT;
> +		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +		break;
> +	default:
> +		return;
> +	}
>   }
>   
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 9120ae80ef52..6a70818039dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -26,6 +26,7 @@
>   
>   #include <linux/dma-direction.h>
>   #include <drm/gpu_scheduler.h>
> +#include "amdgpu_vram_mgr.h"
>   #include "amdgpu.h"
>   
>   #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
> @@ -38,15 +39,6 @@
>   
>   #define AMDGPU_POISON	0xd0bed0be
>   
> -struct amdgpu_vram_mgr {
> -	struct ttm_resource_manager manager;
> -	struct drm_mm mm;
> -	spinlock_t lock;
> -	struct list_head reservations_pending;
> -	struct list_head reserved_pages;
> -	atomic64_t vis_usage;
> -};
> -
>   struct amdgpu_gtt_mgr {
>   	struct ttm_resource_manager manager;
>   	struct drm_mm mm;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 0a7611648573..cdf66802e6bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -32,8 +32,10 @@
>   #include "atom.h"
>   
>   struct amdgpu_vram_reservation {
> +	u64 start;
> +	u64 size;
> +	struct list_head block;
>   	struct list_head node;
> -	struct drm_mm_node mm_node;
>   };
>   
>   static inline struct amdgpu_vram_mgr *
> @@ -194,10 +196,10 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
>    * Calculate how many bytes of the MM node are inside visible VRAM
>    */
>   static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
> -				    struct drm_mm_node *node)
> +				    struct drm_buddy_block *block)
>   {
> -	uint64_t start = node->start << PAGE_SHIFT;
> -	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
> +	u64 start = amdgpu_node_start(block);
> +	u64 end = start + amdgpu_node_size(block);
>   
>   	if (start >= adev->gmc.visible_vram_size)
>   		return 0;
> @@ -218,9 +220,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>   	struct ttm_resource *res = bo->tbo.resource;
> -	unsigned pages = res->num_pages;
> -	struct drm_mm_node *mm;
> -	u64 usage;
> +	struct amdgpu_vram_mgr_node *node = to_amdgpu_vram_mgr_node(res);
> +	struct drm_buddy_block *block;
> +	u64 usage = 0;
>   
>   	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
>   		return amdgpu_bo_size(bo);
> @@ -228,9 +230,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>   	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
>   		return 0;
>   
> -	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
> -	for (usage = 0; pages; pages -= mm->size, mm++)
> -		usage += amdgpu_vram_mgr_vis_size(adev, mm);
> +	list_for_each_entry(block, &node->blocks, link)
> +		usage += amdgpu_vram_mgr_vis_size(adev, block);
>   
>   	return usage;
>   }
> @@ -240,21 +241,28 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> -	struct drm_mm *mm = &mgr->mm;
> +	struct drm_buddy *mm = &mgr->mm;
>   	struct amdgpu_vram_reservation *rsv, *temp;
> +	struct drm_buddy_block *block;
>   	uint64_t vis_usage;
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
> -		if (drm_mm_reserve_node(mm, &rsv->mm_node))
> +		if (drm_buddy_alloc_blocks(mm, rsv->start, rsv->start + rsv->size,
> +					   rsv->size, mm->chunk_size, &rsv->block,
> +					   DRM_BUDDY_RANGE_ALLOCATION))
> +			continue;
> +
> +		block = amdgpu_get_node(&rsv->block);
> +		if (!block)
>   			continue;
>   
>   		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
> -			rsv->mm_node.start, rsv->mm_node.size);
> +			rsv->start, rsv->size);
>   
> -		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
> +		vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
>   		atomic64_add(vis_usage, &mgr->vis_usage);
>   		spin_lock(&man->bdev->lru_lock);
> -		man->usage += rsv->mm_node.size << PAGE_SHIFT;
> +		man->usage += rsv->size;
>   		spin_unlock(&man->bdev->lru_lock);
>   		list_move(&rsv->node, &mgr->reserved_pages);
>   	}
> @@ -279,13 +287,15 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>   		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&rsv->node);
> -	rsv->mm_node.start = start >> PAGE_SHIFT;
> -	rsv->mm_node.size = size >> PAGE_SHIFT;
> +	INIT_LIST_HEAD(&rsv->block);
> +
> +	rsv->start = start;
> +	rsv->size = size;
>   
> -	spin_lock(&mgr->lock);
> +	mutex_lock(&mgr->lock);
>   	list_add_tail(&rsv->node, &mgr->reservations_pending);
>   	amdgpu_vram_mgr_do_reserve(&mgr->manager);
> -	spin_unlock(&mgr->lock);
> +	mutex_unlock(&mgr->lock);
>   
>   	return 0;
>   }
> @@ -307,19 +317,19 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>   	struct amdgpu_vram_reservation *rsv;
>   	int ret;
>   
> -	spin_lock(&mgr->lock);
> +	mutex_lock(&mgr->lock);
>   
>   	list_for_each_entry(rsv, &mgr->reservations_pending, node) {
> -		if ((rsv->mm_node.start <= start) &&
> -		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
> +		if (rsv->start <= start &&
> +		    (start < (rsv->start + rsv->size))) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
>   	}
>   
>   	list_for_each_entry(rsv, &mgr->reserved_pages, node) {
> -		if ((rsv->mm_node.start <= start) &&
> -		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
> +		if (rsv->start <= start &&
> +		    (start < (rsv->start + rsv->size))) {
>   			ret = 0;
>   			goto out;
>   		}
> @@ -327,32 +337,10 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>   
>   	ret = -ENOENT;
>   out:
> -	spin_unlock(&mgr->lock);
> +	mutex_unlock(&mgr->lock);
>   	return ret;
>   }
>   
> -/**
> - * amdgpu_vram_mgr_virt_start - update virtual start address
> - *
> - * @mem: ttm_resource to update
> - * @node: just allocated node
> - *
> - * Calculate a virtual BO start address to easily check if everything is CPU
> - * accessible.
> - */
> -static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
> -				       struct drm_mm_node *node)
> -{
> -	unsigned long start;
> -
> -	start = node->start + node->size;
> -	if (start > mem->num_pages)
> -		start -= mem->num_pages;
> -	else
> -		start = 0;
> -	mem->start = max(mem->start, start);
> -}
> -
>   /**
>    * amdgpu_vram_mgr_new - allocate new ranges
>    *
> @@ -368,13 +356,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   			       const struct ttm_place *place,
>   			       struct ttm_resource **res)
>   {
> -	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
> +	unsigned long lpfn, pages_per_node, pages_left, pages;
> +	u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> -	uint64_t vis_usage = 0, mem_bytes, max_bytes;
> -	struct ttm_range_mgr_node *node;
> -	struct drm_mm *mm = &mgr->mm;
> -	enum drm_mm_insert_mode mode;
> +	struct amdgpu_vram_mgr_node *node;
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
>   	unsigned i;
>   	int r;
>   
> @@ -389,7 +377,6 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	mem_bytes = tbo->base.size;
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>   		pages_per_node = ~0ul;
> -		num_nodes = 1;
>   	} else {
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   		pages_per_node = HPAGE_PMD_NR;
> @@ -399,11 +386,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   #endif
>   		pages_per_node = max_t(uint32_t, pages_per_node,
>   				       tbo->page_alignment);
> -		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>   	}
>   
> -	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
> -			GFP_KERNEL | __GFP_ZERO);
> +	node = kzalloc(sizeof(*node), GFP_KERNEL);
>   	if (!node)
>   		return -ENOMEM;
>   
> @@ -415,48 +400,83 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		goto error_fini;
>   	}
>   
> -	mode = DRM_MM_INSERT_BEST;
> +	INIT_LIST_HEAD(&node->blocks);
> +
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> -		mode = DRM_MM_INSERT_HIGH;
> +		node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>   
> -	pages_left = node->base.num_pages;
> +	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> +		/* Allocate blocks in desired range */
> +		node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	/* Limit maximum size to 2GB due to SG table limitations */
> -	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
> +	BUG_ON(!node->base.num_pages);
> +	pages_left = node->base.num_pages;
>   
>   	i = 0;
> -	spin_lock(&mgr->lock);
>   	while (pages_left) {
> -		uint32_t alignment = tbo->page_alignment;
> +		if (tbo->page_alignment)
> +			min_page_size = tbo->page_alignment << PAGE_SHIFT;
> +		else
> +			min_page_size = mgr->default_page_size;
> +
> +		/* Limit maximum size to 2GB due to SG table limitations */
> +		pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>   
>   		if (pages >= pages_per_node)
> -			alignment = pages_per_node;
> -
> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
> -						alignment, 0, place->fpfn,
> -						lpfn, mode);
> -		if (unlikely(r)) {
> -			if (pages > pages_per_node) {
> -				if (is_power_of_2(pages))
> -					pages = pages / 2;
> -				else
> -					pages = rounddown_pow_of_two(pages);
> -				continue;
> -			}
> -			goto error_free;
> +			min_page_size = pages_per_node << PAGE_SHIFT;
> +
> +		if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +			pages = roundup_pow_of_two(pages);
> +			min_page_size = pages << PAGE_SHIFT;
> +
> +			if (pages > lpfn)
> +				lpfn = pages;
>   		}
>   
> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
> -		pages_left -= pages;
> +		BUG_ON(min_page_size < mm->chunk_size);
> +
> +		mutex_lock(&mgr->lock);
> +		r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +					   (u64)lpfn << PAGE_SHIFT,
> +					   (u64)pages << PAGE_SHIFT,
> +					   min_page_size,
> +					   &node->blocks,
> +					   node->flags);
> +		mutex_unlock(&mgr->lock);
> +		if (unlikely(r))
> +			goto error_free_blocks;
> +
>   		++i;
>   
>   		if (pages > pages_left)
> -			pages = pages_left;
> +			pages_left = 0;
> +		else
> +			pages_left -= pages;
>   	}
> -	spin_unlock(&mgr->lock);
>   
> -	if (i == 1)
> +	/* Free unused pages for contiguous allocation */
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
> +
> +		mutex_lock(&mgr->lock);
> +		drm_buddy_block_trim(mm,
> +				     actual_size,
> +				     &node->blocks);
> +		mutex_unlock(&mgr->lock);
> +	}
> +
> +	list_for_each_entry(block, &node->blocks, link)
> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
> +
> +	block = amdgpu_get_node(&node->blocks);
> +	if (!block) {
> +		r = -EINVAL;
> +		goto error_fini;
> +	}
> +
> +	node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
> +
> +	if (i == 1 && place->flags & TTM_PL_FLAG_CONTIGUOUS)
>   		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>   
>   	if (adev->gmc.xgmi.connected_to_cpu)
> @@ -468,13 +488,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	*res = &node->base;
>   	return 0;
>   
> -error_free:
> -	while (i--)
> -		drm_mm_remove_node(&node->mm_nodes[i]);
> -	spin_unlock(&mgr->lock);
> +error_free_blocks:
> +	mutex_lock(&mgr->lock);
> +	drm_buddy_free_list(mm, &node->blocks);
> +	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &node->base);
> -	kvfree(node);
> +	kfree(node);
>   
>   	return r;
>   }
> @@ -490,27 +510,26 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   				struct ttm_resource *res)
>   {
> -	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
> +	struct amdgpu_vram_mgr_node *node = to_amdgpu_vram_mgr_node(res);
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
>   	uint64_t vis_usage = 0;
> -	unsigned i, pages;
>   
> -	spin_lock(&mgr->lock);
> -	for (i = 0, pages = res->num_pages; pages;
> -	     pages -= node->mm_nodes[i].size, ++i) {
> -		struct drm_mm_node *mm = &node->mm_nodes[i];
> +	mutex_lock(&mgr->lock);
> +	list_for_each_entry(block, &node->blocks, link)
> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>   
> -		drm_mm_remove_node(mm);
> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
> -	}
>   	amdgpu_vram_mgr_do_reserve(man);
> -	spin_unlock(&mgr->lock);
> +
> +	drm_buddy_free_list(mm, &node->blocks);
> +	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
>   
>   	ttm_resource_fini(man, res);
> -	kvfree(node);
> +	kfree(node);
>   }
>   
>   /**
> @@ -648,13 +667,22 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
>   				  struct drm_printer *printer)
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
>   
>   	drm_printf(printer, "  vis usage:%llu\n",
>   		   amdgpu_vram_mgr_vis_usage(mgr));
>   
> -	spin_lock(&mgr->lock);
> -	drm_mm_print(&mgr->mm, printer);
> -	spin_unlock(&mgr->lock);
> +	mutex_lock(&mgr->lock);
> +	drm_printf(printer, "default_page_size: %lluKiB\n",
> +		   mgr->default_page_size >> 10);
> +
> +	drm_buddy_print(mm, printer);
> +
> +	drm_printf(printer, "reserved:\n");
> +	list_for_each_entry(block, &mgr->reserved_pages, link)
> +		drm_buddy_block_print(mm, block, printer);
> +	mutex_unlock(&mgr->lock);
>   }
>   
>   static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
> @@ -674,16 +702,21 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>   {
>   	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>   	struct ttm_resource_manager *man = &mgr->manager;
> +	int err;
>   
>   	ttm_resource_manager_init(man, &adev->mman.bdev,
>   				  adev->gmc.real_vram_size);
>   
>   	man->func = &amdgpu_vram_mgr_func;
>   
> -	drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
> -	spin_lock_init(&mgr->lock);
> +	err = drm_buddy_init(&mgr->mm, man->size, PAGE_SIZE);
> +	if (err)
> +		return err;
> +
> +	mutex_init(&mgr->lock);
>   	INIT_LIST_HEAD(&mgr->reservations_pending);
>   	INIT_LIST_HEAD(&mgr->reserved_pages);
> +	mgr->default_page_size = PAGE_SIZE;
>   
>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
>   	ttm_resource_manager_set_used(man, true);
> @@ -711,16 +744,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   	if (ret)
>   		return;
>   
> -	spin_lock(&mgr->lock);
> +	mutex_lock(&mgr->lock);
>   	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
>   		kfree(rsv);
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
> -		drm_mm_remove_node(&rsv->mm_node);
> +		drm_buddy_free_list(&mgr->mm, &rsv->block);
>   		kfree(rsv);
>   	}
> -	drm_mm_takedown(&mgr->mm);
> -	spin_unlock(&mgr->lock);
> +	drm_buddy_fini(&mgr->mm);
> +	mutex_unlock(&mgr->lock);
>   
>   	ttm_resource_manager_cleanup(man);
>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> new file mode 100644
> index 000000000000..e7d6bbf40c33
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __AMDGPU_VRAM_MGR_H__
> +#define __AMDGPU_VRAM_MGR_H__
> +
> +#include <drm/drm_buddy.h>
> +
> +struct amdgpu_vram_mgr {
> +	struct ttm_resource_manager manager;
> +	struct drm_buddy mm;
> +	/* protects access to buffer objects */
> +	struct mutex lock;
> +	struct list_head reservations_pending;
> +	struct list_head reserved_pages;
> +	atomic64_t vis_usage;
> +	u64 default_page_size;
> +};
> +
> +struct amdgpu_vram_mgr_node {
> +	struct ttm_resource base;
> +	struct list_head blocks;
> +	unsigned long flags;
> +};
> +
> +static inline u64 amdgpu_node_start(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_offset(block);
> +}
> +
> +static inline u64 amdgpu_node_size(struct drm_buddy_block *block)
> +{
> +	return PAGE_SIZE << drm_buddy_block_order(block);
> +}
> +
> +static inline struct drm_buddy_block *
> +amdgpu_get_node(struct list_head *list)

That function name is way to generic. Somebody could mix it up with 
something completely different and _get_ in a name usually means that 
you are grabbing a reference (which is not the case here).

I suggest to call it something like amdgpu_vram_mgr_first_blcok() and 
move it from the headers into amdgpu_vram_mgr.c because code outside of 
that file shouldn't mess with this.

Apart from that the looks really good now.

Regards,
Christian.

> +{
> +	return list_first_entry_or_null(list, struct drm_buddy_block, link);
> +}
> +
> +static inline struct amdgpu_vram_mgr_node *
> +to_amdgpu_vram_mgr_node(struct ttm_resource *res)
> +{
> +	return container_of(res, struct amdgpu_vram_mgr_node, base);
> +}
> +
> +#endif

