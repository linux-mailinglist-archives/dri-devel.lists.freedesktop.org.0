Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D92736289
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 06:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A9410E172;
	Tue, 20 Jun 2023 04:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6C10E172;
 Tue, 20 Jun 2023 04:07:45 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6666b89ffaeso1218107b3a.1; 
 Mon, 19 Jun 2023 21:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687234064; x=1689826064;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ituisTKRh05UIoGJ3s4t+V6DstjYn56GWSD85FlHLQ=;
 b=ahQJOpVgW+JbLKHxNmf3gUyNlG4Tyr3wdkmUb8BuQ/4j4rkFgVeM5IDE9JRd8aynVH
 WgqgOVZzHw2kvF+BeUvf9JtyARDl98yDUICC5ooRA8ub58lSowxVkkwhNixNmn6SBjkl
 9teM7gQmXuXTLOZ+ISxYKUNR04/kNrE0tmXAU+Xp+YfgjyCirgA2GEmgo3aOC8pCTLrf
 k7BnyPVv3Oof6NuFcryuiS5WAlbtTuXJhw6ovAgMjsd2RKqqTGBP9Z+jDJhUzPxRzOW/
 8Och5s4xnSZ4hG3q0QnU+pSN7CULBGNXYK6EmxpqeP2PriFFgKmoV9+LwA+pDMd/cCkV
 2FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687234064; x=1689826064;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ituisTKRh05UIoGJ3s4t+V6DstjYn56GWSD85FlHLQ=;
 b=Ini23GjkSxWaNv3v/eG6ebA0r9Wt5nvjv3B81S3ORnQg4MzN1oi8DlOMOomnb1fTbL
 IrpEOMxO8Ikzq9BnBdxXRylaZKA/yJWce76yVgbAqHC2aOnAYLsBfL+m9NkjC+TF1RIR
 VnsDreKGsU8nuCwFUxU4Y3wn8nTru82pg5RbhRtu3+zsK8nm6b0Ko7fsQMY0KR4NVuMw
 hdCcx3E1EltCndeWRJSFHsMAFbl44DaxJji4KkHjbM7kpGa/f24U/fKZdaxbe7p0XxZO
 e3DxVSP5J7QiyC1FyYXGicP9i7D+KoIhRIvNgU/Tg3pGcYPWdEQzDM1rMavchHokZixZ
 LEBQ==
X-Gm-Message-State: AC+VfDyNgVIxZixdlaHJ6YStIY7em6meUjksrr0EhViQWNeC59ZKu7DS
 gFKIRx4KnRPoB7wGOm+uOwQ=
X-Google-Smtp-Source: ACHHUZ5cPFiBrjssL2IvYHYMp9o0tSI7KcstrYg1UwToc3MbzSTrB94eUv6I/N4wMvEZn/t71S1n5g==
X-Received: by 2002:a05:6a00:1a4e:b0:662:a9c3:7b84 with SMTP id
 h14-20020a056a001a4e00b00662a9c37b84mr13785353pfv.2.1687234064365; 
 Mon, 19 Jun 2023 21:07:44 -0700 (PDT)
Received: from [10.104.2.174] (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 y123-20020a633281000000b0055386b1415dsm242382pgy.51.2023.06.19.21.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 21:07:43 -0700 (PDT)
Message-ID: <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
Date: Tue, 20 Jun 2023 13:07:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 boris.brezillon@collabora.com
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
In-Reply-To: <20230504115159.2245-7-christian.koenig@amd.com>
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

+Boris and +Matthew in case you want to take over this patch set.

Here are some review / testing comments, including those I posted before 
to ease tracking.

On 5/4/23 20:51, Christian König wrote:
> Use the new component here as well and remove the old handling.
> 
> v2: drop dupplicate handling
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  71 ++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |   5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 210 +++++++++-----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h      |   7 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  22 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   3 -
>   7 files changed, 115 insertions(+), 204 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 02b827785e39..eba3e4f01ea6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -133,6 +141,8 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>   
>   	list->first_userptr = first_userptr;
>   	list->num_entries = num_entries;
> +	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
> +	     amdgpu_bo_list_entry_cmp, NULL);

Previously amdgpu_bo_list_get_list sorted all entries, but this one only 
sorts userptr entries. I think this changes behavior?

> @@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   		e->user_invalidated = userpage_invalidated;
>   	}
>   
> -	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
> -				   &duplicates);
> -	if (unlikely(r != 0)) {
> -		if (r != -ERESTARTSYS)
> -			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
> -		goto out_free_user_pages;
> +	drm_exec_while_not_all_locked(&p->exec) {
> +		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
> +		drm_exec_continue_on_contention(&p->exec);

Duplicate handling is needed for pretty much every call of 
amdgpu_vm_lock_pd, as bo->tbo.base.resv == vm->root.bo->tbo.base.resv 
for AMDGPU_GEM_CREATE_VM_ALWAYS_VALID.

I think Boris's suggestion of having this through a common 
DRM_EXEC_FLAG_ALLOW_DUPLICATES flag fits well.

> +		if (unlikely(r))
> +			goto out_free_user_pages;
> +
> +		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);

Previously there were comments for how the fence count is calculated, 
now they seem to be removed. I'd prefer if they were properly retained 
as finding out who calls drm_resv_add_fence is not trivial, and wrong 
reservation count can also be really hard to debug.

Likewise for amdgpu_vm_lock_pd (which was added in another commit).

> +			drm_exec_break_on_contention(&p->exec);
> +			if (unlikely(r))
> +				goto out_free_user_pages;
> +
> +			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
> +			e->range = NULL;
> +		}
> +		drm_exec_continue_on_contention(&p->exec);
> +
> +		if (p->uf_bo) {
> +			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
> +						 2);
> +			drm_exec_continue_on_contention(&p->exec);
> +			if (unlikely(r))
> +				goto out_free_user_pages;
> +		}
>   	}
>   
> -	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
> +	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
> +		struct mm_struct *usermm;
>   
> -		e->bo_va = amdgpu_vm_bo_find(vm, bo);
> +		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
> +		if (usermm && usermm != current->mm) {
> +			r = -EPERM;
> +			goto out_free_user_pages;
> +		}
> +
> +		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
> +		    e->user_invalidated && e->user_pages) {
> +			amdgpu_bo_placement_from_domain(e->bo,
> +							AMDGPU_GEM_DOMAIN_CPU);
> +			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
> +					    &ctx);
> +			if (r)
> +				goto out_free_user_pages;
> +
> +			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
> +						     e->user_pages);
> +		}
> +
> +		kvfree(e->user_pages);
> +		e->user_pages = NULL;
>   	}
>   
>   	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
> @@ -1296,9 +1271,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	 */
>   	r = 0;
>   	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
> -		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
> -
> -		r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, e->range);
> +		r |= !amdgpu_ttm_tt_get_user_pages_done(e->bo->tbo.ttm,
> +							e->range);
>   		e->range = NULL;

e->range = NULL; needs to be removed, or it's causing *massive* memory 
leaks.

>   	}
>   	if (r) {
> @@ -1307,20 +1281,22 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	}
>   
>   	p->fence = dma_fence_get(&leader->base.s_fence->finished);
> -	list_for_each_entry(e, &p->validated, tv.head) {
> +	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
> +
> +		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
>   
>   		/* Everybody except for the gang leader uses READ */
>   		for (i = 0; i < p->gang_size; ++i) {
>   			if (p->jobs[i] == leader)
>   				continue;
>   
> -			dma_resv_add_fence(e->tv.bo->base.resv,
> +			dma_resv_add_fence(gobj->resv,
>   					   &p->jobs[i]->base.s_fence->finished,
>   					   DMA_RESV_USAGE_READ);
>   		}
>   
> -		/* The gang leader is remembered as writer */
> -		e->tv.num_shared = 0;
> +		/* The gang leader as remembered as writer */
> +		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
>   	}

Previously PD used READ accesses, now everything is WRITE. This probably 
isn't right.

Regards,
Tatsuyuki
