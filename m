Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED95604DA6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B3910EB11;
	Wed, 19 Oct 2022 16:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F9110E9AC;
 Wed, 19 Oct 2022 16:42:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v1so815762wrt.11;
 Wed, 19 Oct 2022 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3/Bs6kqrgFABQQtvnbn0RONHCOV7yYxUierShgwEzj0=;
 b=csninIMN7NpCVdWPdIHu+FWpPJfw99JQQFHm4/LkHBGyBsuuv/HRwVbjzBr0hqUXW1
 VOMnsqHyflUsWkuJqruYMyUw1ECEX3RD8YrfqUSYDS7lKzmCncZXMefbM4Ohz1ja0e8s
 zYPa5/5+PQ9eINqUWyxHLD9yiFOPsY9nH6Rj/wRwFNgMr4G3pxlcK9oO6JqSk9aMj5HF
 dOxe7qXNzD9heP8ZRoIF0KUS9ohf3W9mGfgiQb1XqcFh9s7hJiGVgFHimZU5COaDYV8n
 AG0BsJVTWwCnMiuyeJG+6RH4fwIF/UiE8efkzOzlSQlJA1/1l+EemgHtP/+buD66n0wp
 k8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3/Bs6kqrgFABQQtvnbn0RONHCOV7yYxUierShgwEzj0=;
 b=2LgOzAfCmPn/Ilq7/klpWp/u9AQSRPZxkEx/4ZenWEAT4D/XKScjMKtmwTiX2HNn/l
 pZsCm8fvUm4xteAMt8ROw83zvx4i9PC1+ko/Jzi8frxqnAbfLSMpYOVNfRkB4QbXmDnG
 uD+wtJxpnqM9gC6Phkbu6gx/kSSSsgEBU1mugXcmgz+LOFXhicAIyI68OshKs6Kq+5pQ
 /jsp0Rf43H68saYQxX/8m9a1jxyWNMX3zubsyQBoiO7tpmkS1ViiZuB0cmvJ4yFjD5pp
 4Hw/RgH/8Gil/9a7602mDNl7/w/FaxIUdQC8isz0HHTVel4kknX8CEVJ+vlO4a6jdxBV
 vn1g==
X-Gm-Message-State: ACrzQf1o5YpTdusjq6EY5ga94jViwwUqtlhLdhDZySBOnAUNpJBlq4kH
 DrwURtgcg9SCXg07gxD3SdY=
X-Google-Smtp-Source: AMsMyM6FbFe+xgSmtLC0J5g/aLs0PRG5EusmnYk0UBNnzoZXi4WDqQLggbZr7JTO39AzloodIES8ng==
X-Received: by 2002:a05:6000:15ce:b0:230:a14d:997b with SMTP id
 y14-20020a05600015ce00b00230a14d997bmr5950739wry.370.1666197739107; 
 Wed, 19 Oct 2022 09:42:19 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f4ab:6c74:114:840d?
 ([2a02:908:1256:79a0:f4ab:6c74:114:840d])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bca51000000b003c6237e867esm511899wml.0.2022.10.19.09.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:42:18 -0700 (PDT)
Message-ID: <be2d7a93-5062-0582-0e6b-e4a3a73fb6d8@gmail.com>
Date: Wed, 19 Oct 2022 18:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] drm/ttm: rework on ttm_resource to use size_t type
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
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
Cc: alexander.deucher@amd.com, shashank.sharma@amd.com,
 christian.koenig@amd.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.10.22 um 17:27 schrieb Somalapuram Amaranath:
> Change ttm_resource structure from num_pages to size_t size in bytes.

When you remove the num_pages field (instead of adding the size 
additionally) you need to change all drivers in one patch.

Otherwise the build would break in between patches and that's not 
something we can do.

>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c            | 4 ++--
>   drivers/gpu/drm/ttm/ttm_bo_util.c       | 6 +++---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c         | 4 ++--
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 2 +-
>   drivers/gpu/drm/ttm/ttm_resource.c      | 8 ++++----
>   include/drm/ttm/ttm_resource.h          | 2 +-
>   6 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7c8e8be774f1..394ccb13eaed 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -51,8 +51,8 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>   	struct ttm_resource_manager *man;
>   	int i, mem_type;
>   
> -	drm_printf(&p, "No space for %p (%lu pages, %zuK, %zuM)\n",
> -		   bo, bo->resource->num_pages, bo->base.size >> 10,
> +	drm_printf(&p, "No space for %p (%lu size, %zuK, %zuM)\n",
> +		   bo, bo->resource->size, bo->base.size >> 10,

Please just remove printing the resource size completely here.

>   		   bo->base.size >> 20);
>   	for (i = 0; i < placement->num_placement; i++) {
>   		mem_type = placement->placement[i].mem_type;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index fa04e62202c1..da5493f789df 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -173,7 +173,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   
>   	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
>   	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
> -		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
> +		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);

Please use ttm->num_pages here (IIRC).

>   
>   	if (!src_iter->ops->maps_tt)
>   		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
> @@ -357,9 +357,9 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
>   
>   	map->virtual = NULL;
>   	map->bo = bo;
> -	if (num_pages > bo->resource->num_pages)
> +	if (num_pages > PFN_UP(bo->resource->size))
>   		return -EINVAL;
> -	if ((start_page + num_pages) > bo->resource->num_pages)
> +	if ((start_page + num_pages) > PFN_UP(bo->resource->size))
>   		return -EINVAL;
>   
>   	ret = ttm_mem_io_reserve(bo->bdev, bo->resource);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 38119311284d..876e7d07273c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -217,7 +217,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   	page_last = vma_pages(vma) + vma->vm_pgoff -
>   		drm_vma_node_start(&bo->base.vma_node);
>   
> -	if (unlikely(page_offset >= bo->resource->num_pages))
> +	if (unlikely(page_offset >= PFN_UP(bo->resource->size)))

Please use bo->base.size here. The resource size can actually be larger 
than the BO size, but the extra space shouldn't be CPU map-able.

>   		return VM_FAULT_SIGBUS;
>   
>   	prot = ttm_io_prot(bo, bo->resource, prot);
> @@ -412,7 +412,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		 << PAGE_SHIFT);
>   	int ret;
>   
> -	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages)
> +	if (len < 1 || (offset + len) > bo->resource->size)

Same here, please use bo->base.size.

>   		return -EIO;
>   
>   	ret = ttm_bo_reserve(bo, true, false, NULL);
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index f7c16c46cfbc..0a8bc0b7f380 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -83,7 +83,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   
>   	spin_lock(&rman->lock);
>   	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
> -					  node->base.num_pages,
> +					  PFN_UP(node->base.size),
>   					  bo->page_alignment, 0,
>   					  place->fpfn, lpfn, mode);
>   	spin_unlock(&rman->lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index a729c32a1e48..f9cce0727d40 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -177,7 +177,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   	struct ttm_resource_manager *man;
>   
>   	res->start = 0;
> -	res->num_pages = PFN_UP(bo->base.size);
> +	res->size = bo->base.size;
>   	res->mem_type = place->mem_type;
>   	res->placement = place->flags;
>   	res->bus.addr = NULL;
> @@ -192,7 +192,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   		list_add_tail(&res->lru, &bo->bdev->pinned);
>   	else
>   		list_add_tail(&res->lru, &man->lru[bo->priority]);
> -	man->usage += res->num_pages << PAGE_SHIFT;
> +	man->usage += res->size;
>   	spin_unlock(&bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_resource_init);
> @@ -214,7 +214,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>   
>   	spin_lock(&bdev->lru_lock);
>   	list_del_init(&res->lru);
> -	man->usage -= res->num_pages << PAGE_SHIFT;
> +	man->usage -= res->size;
>   	spin_unlock(&bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_resource_fini);
> @@ -665,7 +665,7 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
>   		iosys_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
>   		iter_io->needs_unmap = false;
>   	} else {
> -		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> +		size_t bus_size = (size_t)mem->size;

I think we can remove the local variable now, or is that used in some 
kind of loop?

Thanks,
Christian.

>   
>   		iter_io->needs_unmap = true;
>   		memset(&iter_io->dmap, 0, sizeof(iter_io->dmap));
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 5afc6d664fde..f93c9e52b063 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -208,7 +208,7 @@ struct ttm_bus_placement {
>    */
>   struct ttm_resource {
>   	unsigned long start;
> -	unsigned long num_pages;
> +	size_t size;
>   	uint32_t mem_type;
>   	uint32_t placement;
>   	struct ttm_bus_placement bus;

