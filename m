Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06C604DAB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFE910EB23;
	Wed, 19 Oct 2022 16:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ED610EAC2;
 Wed, 19 Oct 2022 16:44:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so454783wms.0; 
 Wed, 19 Oct 2022 09:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U6Uk1lrOodS56sL16R+s3Cr5RKrTHZct4Aa/Tvx3ASs=;
 b=Oo49zSE8KrYWStV0IeDLGPtomV7qt4rmQbraOHHbospGaKcww5z5Kiii/GvFE7gt/x
 6Q/A+ORQX7yAHx/1L7bRLn9hBXYy1nNJEklyeLq/QxTVbJkW2mLDnMWwpBJIMr9aZxL+
 scla/SMNUGSGiEG7EUHvPARyCnA9Q7y7IcMy34yRnC3zLS2oYe3DijqSMDM3b8mzQcDD
 ns99jYh2Qhpmsf3gdC7geRCJHW4/WzsViWbJLKiuG8dSSUiuxkHXJAMlLITpQ0/ZyQI/
 UOomU892lP+iq39/EsZ9Ccni/FRtU9MehsTxJcVjgpk9z2p6fDgDSaMm6dGZ4UKxSC0O
 5sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U6Uk1lrOodS56sL16R+s3Cr5RKrTHZct4Aa/Tvx3ASs=;
 b=1osyxqcblBRCcgXx1/mZZijarju0g8/VIMorw7sBTarccAsKqb6InvDNbpg7ttmNZe
 smiLVvDEQynqX+sxYE4sNeXRzpZ7D0sllwKqL0mJWEfc3AarPMExurCD9S5HVHYdvBxH
 mPn/h4USq6TAYnIu03/Nx9vpksNw09pypT/VWbiSVYXc7Adpea/0V/Ay6pCId5B7JC1o
 3vI8UHMnaXDTq9WeSGqkwz4Xxwe48/3RwDJ1NOihmIkHY9eGe+3XNWSFZ1qh2Jj6jgCN
 JwQYUS/oQTsJHgymbaXSKD6SUvrmW5Me6ufq8369OVgaG+f65OyW7jsvHXfdmyleOoXI
 O8Ag==
X-Gm-Message-State: ACrzQf3bRTsVwhDMEs+QDQB180g6XGB4bIcqdM1x69DKs3dF472IeTQD
 /RdhbgCTaynpkFoyLuM532+3S2y7hoY=
X-Google-Smtp-Source: AMsMyM51z3DwL5PPSV8cElqNkPgfIXZuGBHid2r8Uzftz8XI8HlBQFoS7LDK84XUUbw0+8YLJCaL2Q==
X-Received: by 2002:a05:600c:19cc:b0:3c6:fd74:cb2b with SMTP id
 u12-20020a05600c19cc00b003c6fd74cb2bmr6538151wmq.6.1666197840303; 
 Wed, 19 Oct 2022 09:44:00 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f4ab:6c74:114:840d?
 ([2a02:908:1256:79a0:f4ab:6c74:114:840d])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a5d5966000000b002252884cc91sm14153453wri.43.2022.10.19.09.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:43:59 -0700 (PDT)
Message-ID: <0579fb14-17c3-37c6-6b9f-3a0eef0f6f77@gmail.com>
Date: Wed, 19 Oct 2022 18:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzZdIGRybS9hbWQ6IGZpeOKAmXMgb24gdHRtX3Jl?=
 =?UTF-8?Q?source_rework_to_use_size=5ft_type?=
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
 <20221019152736.654451-2-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221019152736.654451-2-Amaranath.Somalapuram@amd.com>
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
> Fix the ttm_resource from num_pages to size_t size.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c     | 3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c        | 6 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c   | 8 ++++----
>   6 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 1f3302aebeff..44367f03316f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -144,7 +144,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   		node->base.start = node->mm_nodes[0].start;
>   	} else {
>   		node->mm_nodes[0].start = 0;
> -		node->mm_nodes[0].size = node->base.num_pages;
> +		node->mm_nodes[0].size = PFN_UP(node->base.size);
>   		node->base.start = AMDGPU_BO_INVALID_OFFSET;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 2e8f6cd7a729..e51f80bb1d07 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -542,6 +542,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   		/* GWS and OA don't need any alignment. */
>   		page_align = bp->byte_align;
>   		size <<= PAGE_SHIFT;
> +
>   	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
>   		/* Both size and alignment must be a multiple of 4. */
>   		page_align = ALIGN(bp->byte_align, 4);
> @@ -776,7 +777,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>   		return 0;
>   	}
>   
> -	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
> +	r = ttm_bo_kmap(&bo->tbo, 0, PFN_UP(bo->tbo.resource->size), &bo->kmap);

Here bo->tbo.base.size would make more sense, but apart from that the 
patch looks good to me.

Regards,
Christian.

>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 6546552e596c..5c4f93ee0c57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -62,7 +62,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   	if (!res)
>   		goto fallback;
>   
> -	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
> +	BUG_ON(start + size > res->size);
>   
>   	cur->mem_type = res->mem_type;
>   
> @@ -110,7 +110,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   	cur->size = size;
>   	cur->remaining = size;
>   	cur->node = NULL;
> -	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
> +	WARN_ON(res && start + size > res->size);
>   	return;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 5e6ddc7e101c..677ad2016976 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -127,7 +127,7 @@ TRACE_EVENT(amdgpu_bo_create,
>   
>   	    TP_fast_assign(
>   			   __entry->bo = bo;
> -			   __entry->pages = bo->tbo.resource->num_pages;
> +			   __entry->pages = PFN_UP(bo->tbo.resource->size);
>   			   __entry->type = bo->tbo.resource->mem_type;
>   			   __entry->prefer = bo->preferred_domains;
>   			   __entry->allow = bo->allowed_domains;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index dc262d2c2925..36066965346f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -381,7 +381,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	dst.offset = 0;
>   
>   	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
> -				       new_mem->num_pages << PAGE_SHIFT,
> +				       new_mem->size,
>   				       amdgpu_bo_encrypted(abo),
>   				       bo->base.resv, &fence);
>   	if (r)
> @@ -424,7 +424,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   static bool amdgpu_mem_visible(struct amdgpu_device *adev,
>   			       struct ttm_resource *mem)
>   {
> -	u64 mem_size = (u64)mem->num_pages << PAGE_SHIFT;
> +	u64 mem_size = (u64)mem->size;
>   	struct amdgpu_res_cursor cursor;
>   	u64 end;
>   
> @@ -568,7 +568,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_device *bdev,
>   				     struct ttm_resource *mem)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
> -	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> +	size_t bus_size = (size_t)mem->size;
>   
>   	switch (mem->mem_type) {
>   	case TTM_PL_SYSTEM:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 73a517bcf5c1..18c1a173d187 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -439,7 +439,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		/* Allocate blocks in desired range */
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	remaining_size = (u64)vres->base.num_pages << PAGE_SHIFT;
> +	remaining_size = (u64)vres->base.size;
>   
>   	mutex_lock(&mgr->lock);
>   	while (remaining_size) {
> @@ -498,7 +498,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		LIST_HEAD(temp);
>   
>   		trim_list = &vres->blocks;
> -		original_size = (u64)vres->base.num_pages << PAGE_SHIFT;
> +		original_size = (u64)vres->base.size;
>   
>   		/*
>   		 * If size value is rounded up to min_block_size, trim the last
> @@ -533,8 +533,8 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   			amdgpu_vram_mgr_block_size(block);
>   		start >>= PAGE_SHIFT;
>   
> -		if (start > vres->base.num_pages)
> -			start -= vres->base.num_pages;
> +		if (start > PFN_UP(vres->base.size))
> +			start -= PFN_UP(vres->base.size);
>   		else
>   			start = 0;
>   		vres->base.start = max(vres->base.start, start);

