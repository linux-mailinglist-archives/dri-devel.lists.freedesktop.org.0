Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DAB7365D5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F1810E294;
	Tue, 20 Jun 2023 08:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4BB10E27E;
 Tue, 20 Jun 2023 08:12:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f907f311ccso34341635e9.1; 
 Tue, 20 Jun 2023 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687248735; x=1689840735;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I36r/8LVHtCPq5ukbXjby4xik39NTXyn/IlgXCV8mng=;
 b=Xc/TL+YuwKNYNJRlrKoutVUeMIhx+pwIS7mk5aCr521jUOsyQe3XT4I0cqZqL7+/uP
 eCPV0Ecm16i7IbxQfHQbeN9EmfluSSoO67Z0bEfNfYru0dUb6XNuJ0I3wNMvdzO9Gl7K
 LQhOlrsqwuACMrQx8+Q4xzrk7KBCvxgIYEhDOEQAbWOoQNccqo1xrvL9hkcICm4M1Pyj
 egZGat+dU96Wmp+O8wjIs2XOh51LjTK6KULRVxEMCH3bAE0Fr7qBUFTuvqK39qy0aoRG
 oj1am37GCTJV8KMdb9znF8EruLGInJKEBJbZizI9k6gHhpYTfj2DzP3gSvqMhSPCUUZM
 G/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687248735; x=1689840735;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I36r/8LVHtCPq5ukbXjby4xik39NTXyn/IlgXCV8mng=;
 b=i0L84xlbgZcWTIiexa3r/SHyJHw3l0uGPcfYmXcMndRIHc9HCJoyvt3fk6ivfWUtpM
 bfUZOms8QrOUZeed23kkwnCNuxEpifxXJbGkRsghgHIQmBSmausOBGLK0s/l+l+VNFf6
 RVoQacU4EHQavtUGE4uKAUc37KNKEvVovqOoPdGdm23eGJ5hKzcFLnQzv7JoRx8rzIcU
 qkc9tw6bFuTceYKDsLNZqLI9Ryhq1MKT1RbhuQTOE9vR4Zxvr3W1KfAMn6+vTe3jgLZ2
 OPm0N1WytMJtMGghWRgdmBJLQ852euwma0nC7oIuLTOgBB2JEqXsl9rWEwaoCMlFQHvS
 kyFQ==
X-Gm-Message-State: AC+VfDxVFvj4k4Z65c3rOvIo0UT6J/vr+z0r+VS2FKLZ1wgp5bN7IWvP
 hjgSUXE9nRgsK6vXOlBz4cg=
X-Google-Smtp-Source: ACHHUZ6TQc2GdlamQNx2PFBSf4APnhUZ0F8g1YBW/+U+pOeDL4pHvVONofgREc1fJ+febM2A3Yf+dg==
X-Received: by 2002:a05:600c:3653:b0:3f7:5e07:ea54 with SMTP id
 y19-20020a05600c365300b003f75e07ea54mr10031056wmq.13.1687248734765; 
 Tue, 20 Jun 2023 01:12:14 -0700 (PDT)
Received: from ?IPV6:2a00:e180:154d:9c00:68d9:fc9c:8543:a6?
 ([2a00:e180:154d:9c00:68d9:fc9c:8543:a6])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfe608000000b0030ae849c70csm1408847wrm.37.2023.06.20.01.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 01:12:14 -0700 (PDT)
Message-ID: <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
Date: Tue, 20 Jun 2023 10:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, francois.dugast@intel.com,
 felix.kuehling@amd.com, arunpravin.paneerselvam@amd.com,
 thomas_os@shipmail.org, dakr@redhat.com, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com, boris.brezillon@collabora.com
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
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

Am 20.06.23 um 06:07 schrieb Tatsuyuki Ishi:
> +Boris and +Matthew in case you want to take over this patch set.
>
> Here are some review / testing comments, including those I posted 
> before to ease tracking.
>
> On 5/4/23 20:51, Christian König wrote:
>> Use the new component here as well and remove the old handling.
>>
>> v2: drop dupplicate handling
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  71 ++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |   5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 210 +++++++++-----------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h      |   7 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  22 --
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   3 -
>>   7 files changed, 115 insertions(+), 204 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 02b827785e39..eba3e4f01ea6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -133,6 +141,8 @@ int amdgpu_bo_list_create(struct amdgpu_device 
>> *adev, struct drm_file *filp,
>>         list->first_userptr = first_userptr;
>>       list->num_entries = num_entries;
>> +    sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
>> +         amdgpu_bo_list_entry_cmp, NULL);
>
> Previously amdgpu_bo_list_get_list sorted all entries, but this one 
> only sorts userptr entries. I think this changes behavior?

The intention here is to sort all entries except the userptrs. Need to 
double check.

>
>> @@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct 
>> amdgpu_cs_parser *p,
>>           e->user_invalidated = userpage_invalidated;
>>       }
>>   -    r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
>> -                   &duplicates);
>> -    if (unlikely(r != 0)) {
>> -        if (r != -ERESTARTSYS)
>> -            DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
>> -        goto out_free_user_pages;
>> +    drm_exec_while_not_all_locked(&p->exec) {
>> +        r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
>> +        drm_exec_continue_on_contention(&p->exec);
>
> Duplicate handling is needed for pretty much every call of 
> amdgpu_vm_lock_pd, as bo->tbo.base.resv == vm->root.bo->tbo.base.resv 
> for AMDGPU_GEM_CREATE_VM_ALWAYS_VALID.

Well no. AMDGPU_GEM_CREATE_VM_ALWAYS_VALID means that BOs should *not* 
be part of the relocation list. So when those cause an EALREADY here 
then userspace has a bug.

> I think Boris's suggestion of having this through a common 
> DRM_EXEC_FLAG_ALLOW_DUPLICATES flag fits well.

No, again. The only driver which should accept duplicates is radeon, for 
all other drivers especially new ones duplicates should probably be 
rejected.

We only allow this for radeon because it is already UAPI, could be that 
we need to do this for amdgpu as well but I really hope we don't need this.

>
>> +        if (unlikely(r))
>> +            goto out_free_user_pages;
>> +
>> +        amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +            r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);
>
> Previously there were comments for how the fence count is calculated, 
> now they seem to be removed. I'd prefer if they were properly retained 
> as finding out who calls drm_resv_add_fence is not trivial, and wrong 
> reservation count can also be really hard to debug.

I need to double check this, the reservation count looks incorrect in 
the first place.

>
> Likewise for amdgpu_vm_lock_pd (which was added in another commit).
>
>> + drm_exec_break_on_contention(&p->exec);
>> +            if (unlikely(r))
>> +                goto out_free_user_pages;
>> +
>> +            e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
>> +            e->range = NULL;
>> +        }
>> +        drm_exec_continue_on_contention(&p->exec);
>> +
>> +        if (p->uf_bo) {
>> +            r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
>> +                         2);
>> +            drm_exec_continue_on_contention(&p->exec);
>> +            if (unlikely(r))
>> +                goto out_free_user_pages;
>> +        }
>>       }
>>   -    amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> -        struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>> +    amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
>> +        struct mm_struct *usermm;
>>   -        e->bo_va = amdgpu_vm_bo_find(vm, bo);
>> +        usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
>> +        if (usermm && usermm != current->mm) {
>> +            r = -EPERM;
>> +            goto out_free_user_pages;
>> +        }
>> +
>> +        if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
>> +            e->user_invalidated && e->user_pages) {
>> +            amdgpu_bo_placement_from_domain(e->bo,
>> +                            AMDGPU_GEM_DOMAIN_CPU);
>> +            r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
>> +                        &ctx);
>> +            if (r)
>> +                goto out_free_user_pages;
>> +
>> +            amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
>> +                             e->user_pages);
>> +        }
>> +
>> +        kvfree(e->user_pages);
>> +        e->user_pages = NULL;
>>       }
>>         amdgpu_cs_get_threshold_for_moves(p->adev, 
>> &p->bytes_moved_threshold,
>> @@ -1296,9 +1271,8 @@ static int amdgpu_cs_submit(struct 
>> amdgpu_cs_parser *p,
>>        */
>>       r = 0;
>>       amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
>> -        struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>> -
>> -        r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, e->range);
>> +        r |= !amdgpu_ttm_tt_get_user_pages_done(e->bo->tbo.ttm,
>> +                            e->range);
>>           e->range = NULL;
>
> e->range = NULL; needs to be removed, or it's causing *massive* memory 
> leaks.


What? That sounds like nonsense to me 
amdgpu_ttm_tt_get_user_pages_done() frees the range it gets.

>
>>       }
>>       if (r) {
>> @@ -1307,20 +1281,22 @@ static int amdgpu_cs_submit(struct 
>> amdgpu_cs_parser *p,
>>       }
>>         p->fence = dma_fence_get(&leader->base.s_fence->finished);
>> -    list_for_each_entry(e, &p->validated, tv.head) {
>> +    drm_exec_for_each_locked_object(&p->exec, index, gobj) {
>> +
>> + ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
>>             /* Everybody except for the gang leader uses READ */
>>           for (i = 0; i < p->gang_size; ++i) {
>>               if (p->jobs[i] == leader)
>>                   continue;
>>   -            dma_resv_add_fence(e->tv.bo->base.resv,
>> +            dma_resv_add_fence(gobj->resv,
>> &p->jobs[i]->base.s_fence->finished,
>>                          DMA_RESV_USAGE_READ);
>>           }
>>   -        /* The gang leader is remembered as writer */
>> -        e->tv.num_shared = 0;
>> +        /* The gang leader as remembered as writer */
>> +        dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
>>       }
>
> Previously PD used READ accesses, now everything is WRITE. This 
> probably isn't right.

That shouldn't matter. We should switch to using BOOKKEEP at some point, 
but for now that's irrelevant.

Thanks,
Christian.

>
> Regards,
> Tatsuyuki

