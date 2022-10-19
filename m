Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3F604DAF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D29210EB28;
	Wed, 19 Oct 2022 16:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D4410EAC2;
 Wed, 19 Oct 2022 16:44:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f11so30078482wrm.6;
 Wed, 19 Oct 2022 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5cG38G/Rt4CgieRyZg/tnSu6pEj29Zbl0o2fHT7rrb4=;
 b=F2Q7+FHp+5B/v6vb9+KsePupjag073gDBYbXsQluyUNIErehAn3/pqel+yD97MeIAD
 bkBVsiqp+Itb/BJVonpzTMtHzvmEXLN7MHw/6Hn2VJIWAixWuFSQ4WoqN49iIDYF2etH
 qG+g13tNQT0iOdvHJ60g1dfy/etj61mtsiLxrjGPiVjngNlkPVWvj4qwCaJOvgBjkl0j
 s8duG6qC1WjAS45+2fMu8alx9Knf4bWY9P97ujVH2VHoA36yQvbxvTAAOC7UlW9h1um1
 EZJgESYpyq3tWxWh54LiatWq08RYsXQ8cQEQkWwyb4KSTA2e6oCOhyMS3olYyQWpFYgI
 Nt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5cG38G/Rt4CgieRyZg/tnSu6pEj29Zbl0o2fHT7rrb4=;
 b=Zmb3jNdRzIkG04MCUa6iWfmPxskqazyFWjUIopI2tts9t/Qa53nYATSDYaZ36s8QgF
 azRKrWbV+zRZXXlsnzEJVyA72f/UhcsnxLidTDteWhEimvhfjtZ+ORgATXuCiWHI4NCZ
 jxEMTLGw33i8U+sz/NhwlSKMiXPPviPLKPfTTtgd/4r9+xPYAwiiv0XusK5sPM3xCPNd
 +cCzrw0mV09P+9aUSiE64SQCeeBc0Gpe9/y3WVytSzUGpA66O3XM0loDop35swWkj87s
 yCMZr+3xl8mhNfwxkTwwDjlrQ79YxUASAwNce2KB0BDXgCpquaVjsZojOiczSQkkO3uc
 POnQ==
X-Gm-Message-State: ACrzQf0dI0K5in1WXkR7FZI+f95JAmO5XGEUwTM9EQe5MWOEuq3F5gs7
 wtXaGfu0Z6f+xbQF2+gZwjW+8rS+bz0=
X-Google-Smtp-Source: AMsMyM4aLVkmO32V/CA0IpsI8/9WcXnBiiwky7ktgdC2wGp92XHsTWQM8g/ed5v0lV73er5xa7prpg==
X-Received: by 2002:a05:6000:1786:b0:22e:41c0:cb0e with SMTP id
 e6-20020a056000178600b0022e41c0cb0emr5686084wrg.93.1666197891106; 
 Wed, 19 Oct 2022 09:44:51 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f4ab:6c74:114:840d?
 ([2a02:908:1256:79a0:f4ab:6c74:114:840d])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b003c7084d072csm497745wmq.28.2022.10.19.09.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:44:50 -0700 (PDT)
Message-ID: <5075ed5c-0cc0-2351-bc51-58fe2bd06de7@gmail.com>
Date: Wed, 19 Oct 2022 18:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAzLzZdIGRybS9pOTE1OiBmaXjigJlzIG9uIHR0bV9y?=
 =?UTF-8?Q?esource_rework_to_use_size=5ft_type?=
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
 <20221019152736.654451-3-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221019152736.654451-3-Amaranath.Somalapuram@amd.com>
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
Cc: alexander.deucher@amd.com, shashank.sharma@amd.com,
 christian.koenig@amd.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.10.22 um 17:27 schrieb Somalapuram Amaranath:
> Fix the ttm_resource from num_pages to size_t size.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>   drivers/gpu/drm/i915/i915_scatterlist.c       |  4 ++--
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 12 ++++++------
>   drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
>   4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 4f861782c3e8..7a1e92c11946 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -649,7 +649,7 @@ bool i915_ttm_resource_mappable(struct ttm_resource *res)
>   	if (!i915_ttm_cpu_maps_iomem(res))
>   		return true;
>   
> -	return bman_res->used_visible_size == bman_res->base.num_pages;
> +	return bman_res->used_visible_size == PFN_UP(bman_res->base.size);
>   }
>   
>   static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index dcc081874ec8..114e5e39aa72 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -158,7 +158,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   						     u32 page_alignment)
>   {
>   	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> -	const u64 size = res->num_pages << PAGE_SHIFT;
> +	const u64 size = res->size;
>   	const u32 max_segment = round_down(UINT_MAX, page_alignment);
>   	struct drm_buddy *mm = bman_res->mm;
>   	struct list_head *blocks = &bman_res->blocks;
> @@ -177,7 +177,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   
>   	i915_refct_sgt_init(rsgt, size);
>   	st = &rsgt->table;
> -	if (sg_alloc_table(st, res->num_pages, GFP_KERNEL)) {
> +	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {
>   		i915_refct_sgt_put(rsgt);
>   		return ERR_PTR(-ENOMEM);
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index e19452f0e100..7e611476c7a4 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -62,8 +62,8 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	if (place->fpfn || lpfn != man->size)
>   		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	GEM_BUG_ON(!bman_res->base.num_pages);
> -	size = bman_res->base.num_pages << PAGE_SHIFT;
> +	GEM_BUG_ON(!bman_res->base.size);
> +	size = bman_res->base.size;
>   
>   	min_page_size = bman->default_page_size;
>   	if (bo->page_alignment)
> @@ -72,7 +72,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
>   	GEM_BUG_ON(!IS_ALIGNED(size, min_page_size));
>   
> -	if (place->fpfn + bman_res->base.num_pages != place->lpfn &&
> +	if (place->fpfn + PFN_UP(bman_res->base.size) != place->lpfn &&
>   	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>   		unsigned long pages;
>   
> @@ -108,7 +108,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   		goto err_free_blocks;
>   
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
> +		u64 original_size = (u64)bman_res->base.size;
>   
>   		drm_buddy_block_trim(mm,
>   				     original_size,
> @@ -116,7 +116,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	}
>   
>   	if (lpfn <= bman->visible_size) {
> -		bman_res->used_visible_size = bman_res->base.num_pages;
> +		bman_res->used_visible_size = PFN_UP(bman_res->base.size);
>   	} else {
>   		struct drm_buddy_block *block;
>   
> @@ -228,7 +228,7 @@ static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
>   
>   	if (!place->fpfn &&
>   	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
> -		return bman_res->used_visible_size == res->num_pages;
> +		return bman_res->used_visible_size == PFN_UP(res->size);
>   
>   	/* Check each drm buddy block individually */
>   	list_for_each_entry(block, &bman_res->blocks, link) {
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 575d67bc6ffe..cf89d0c2a2d9 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -244,7 +244,7 @@ void intel_region_ttm_resource_free(struct intel_memory_region *mem,
>   	struct ttm_resource_manager *man = mem->region_private;
>   	struct ttm_buffer_object mock_bo = {};
>   
> -	mock_bo.base.size = res->num_pages << PAGE_SHIFT;
> +	mock_bo.base.size = res->size;
>   	mock_bo.bdev = &mem->i915->bdev;
>   	res->bo = &mock_bo;
>   

