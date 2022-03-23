Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B904E4D77
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 08:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6D610E5E2;
	Wed, 23 Mar 2022 07:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C1610E5E1;
 Wed, 23 Mar 2022 07:37:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id pv16so1154123ejb.0;
 Wed, 23 Mar 2022 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2ImceWYBoPiqBBOOEytUsJtPdDggUfyLvVXnD8LV884=;
 b=mP58g6OHXBHC/7jwsh6cIx+oywVTLlbeV2mQSwtosLUv/q+bx/WR6osPLJqipFM9Tf
 rG8QUXIv10MTz4Rb2O7JEyjRc7oswiZQFefb6MtvRtsDDGRybzPJHIsog4mCmGlpH74T
 d7GiM+Blt4Gpu6/mC9asEy5T9WhyMdsgJ8BPNx7HZ7oRXU7izskJTrOuSFKYjuWKajil
 2sc74CdZa2DrX+YB3CkrCycNHcja1HUMPFiMQATwBYOZaEPjcuUUqOC4VwyCZQYqV2bZ
 YwKnIQUbWC4AdPdNfW2f/+MbzWx+skR16Aj6YzMYj/jI3rb5/w9PZkFxKCXsVIxyHlx1
 OGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ImceWYBoPiqBBOOEytUsJtPdDggUfyLvVXnD8LV884=;
 b=HdIuoVgEbJ35PvKjf4IWOMlU31mD/oA5EaQAgk5g8IXxneDqNPMpWyHah/x/AIOwHP
 89I6Hs0ngFEHwLDPErCMiFNMD4LgLstJo9vSZIjwsbDoMIQ8jSPCTapmzlk0ANHNd03k
 BikU/4gC/SgIsqtXGbqpcoRpPsHY8RDPUr8YVXtWXh7kNfapI5LScVI0t3cNaUGQkWH1
 Xn4C6wPmokNbNzNP84UGl0KuRaxkZo/7lY5nV/yF8aXr7X0MQVr9tWEb4g4CWQ969+sz
 2ZPrm46ju6Xnqihw6H7xEY+TVYRABboabZGxzjyfspbfzhlWHKl7/tqLbGwLY34y0nQ4
 LeoA==
X-Gm-Message-State: AOAM532opn0ro+h5jOnF5x56osAhAzY2ICxcPinaXNYi9ke6Zmu+3w7m
 a8MzSXWfyJvCBtXA3JzPtLo=
X-Google-Smtp-Source: ABdhPJwlzZ7eGtrjCZN0di1fzv7jPQ4mO24Cf1hi9x4fsimyB7ZWFpZ3TQ7AW2/2pJeiXjgaUZvmzQ==
X-Received: by 2002:a17:907:7fa2:b0:6d8:2397:42 with SMTP id
 qk34-20020a1709077fa200b006d823970042mr29943989ejc.218.1648021034168; 
 Wed, 23 Mar 2022 00:37:14 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a170906251600b006d6d9081f46sm9475570ejb.150.2022.03.23.00.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 00:37:13 -0700 (PDT)
Message-ID: <c255f3ea-a269-1886-f79a-2d8a38b956b1@gmail.com>
Date: Wed, 23 Mar 2022 08:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 07:25 schrieb Arunpravin Paneer Selvam:
> [SNIP]
> @@ -415,48 +409,86 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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

Please drop this BUG_ON(). This is not something which prevents further 
data corruption, so the BUG_ON() is not justified.

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

The handling here looks extremely awkward to me.

min_page_size should be determined outside of the loop, based on 
default_page_size, alignment and contiguous flag.

Then why do you drop the lock and grab it again inside the loop? And 
what is "i" actually good for?

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
> +		if (!is_contiguous && !IS_ALIGNED(pages, min_page_size >> PAGE_SHIFT))
> +			is_contiguous = 1;
> +
> +		if (is_contiguous) {
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
> +	if (is_contiguous) {

Well that looks really odd, why is trimming not part of 
drm_buddy_alloc_blocks() ?

> +		u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
> +
> +		mutex_lock(&mgr->lock);
> +		drm_buddy_block_trim(mm,
> +				     actual_size,
> +				     &node->blocks);

Why is the drm_buddy_block_trim() function given all the blocks and not 
just the last one?

Regards,
Christian.

> +		mutex_unlock(&mgr->lock);
> +	}
> +
> +	list_for_each_entry(block, &node->blocks, link)
> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
> +
> +	block = amdgpu_vram_mgr_first_block(&node->blocks);
> +	if (!block) {
> +		r = -EINVAL;
> +		goto error_fini;
> +	}
> +
> +	node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
> +
> +	if (i == 1 && is_contiguous)
>   		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>   
>   	if (adev->gmc.xgmi.connected_to_cpu)
> @@ -468,13 +500,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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
> @@ -490,27 +522,26 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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
> @@ -648,13 +679,22 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
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
> @@ -674,16 +714,21 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
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
> @@ -711,16 +756,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
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
>
> base-commit: a678f97326454b60ffbbde6abf52d23997d71a27

