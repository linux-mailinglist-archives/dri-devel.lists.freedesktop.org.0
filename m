Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E145980E1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 11:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B178C83A8;
	Thu, 18 Aug 2022 09:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFB42BE9F;
 Thu, 18 Aug 2022 09:33:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y3so1146706eda.6;
 Thu, 18 Aug 2022 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=N2XG0dA60CgZE82y3DI/0Og4FGzzItI/11ziaaTX6Ow=;
 b=GYOSB0dnmZ4ZopjLDlaDuKHbIFrbCwX9xYB8zi6TS4YrAqeV+ES/fTTvT8T7lYLhPn
 rKYeNMv3+aSOkGDyn4uFQqel7sDCCQ9wcFA5s9oPmxRB3i7rnP4hcUm9wNMMVmLeY7B7
 Uq6u8Qgegag/N12Cg7wHfoXFDBR68lsUPonultI/I67Hd9naBXPjulw94s/aEWSMjUO5
 V+Qi5ynGStpdbx4I0HfXO/wN/VJu8hNjPVQuNy4MstdQiERYxnNPeB0yVZ5wQIgvQ41V
 TalhlYI/RZEdeww3zJmb22DxJFVPVM1tUL+HEtpQ3GntjdK4Bee9eCA10FNwWRA1pfSb
 GoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=N2XG0dA60CgZE82y3DI/0Og4FGzzItI/11ziaaTX6Ow=;
 b=I98Ye+kuWLLX6huDh9HJzCKscZBg6kdryhNAnM/YVBWCb8L3lofByUktfg1DzNIS2V
 DCrPHVoCp2DapoeJwaLtFNddKaCR2O8xyk2BXVMsCUbs6PVvJi3OaZyfURNgVwvdtX34
 WOsJc6tCRAM9aytF+WXGZZEyixA43ll1Dnt01OJnfz0Polwee8wQaUzkCL2U4N5PZ3gV
 5HOEHs9bPccgLOTWKuwtOZhnRaZ5+8dl37HOTMPGOkxQDJwAgBKBNyj9yZxpV2nD5Nhs
 RRign9gPynMnsevdvM9da0tyjQ9rDnkEesFjl1K7MAGESYY9al19Y61yLJZyvjF9W8/V
 VzTg==
X-Gm-Message-State: ACgBeo3HC3jOyG+GGIH1I2vMufylKx5ZHEQ1a5PGDU/DtADHOcgAx6nl
 lIfZ9ZbCEGJLEGcDP0uR6YQ=
X-Google-Smtp-Source: AA6agR46U3beNiVNDX6RqkSQZXwgMYzOtzbk7nA5ng0m0+w4aTivAuMjC9P5hhnPv0Sflo+AXV9xiQ==
X-Received: by 2002:a05:6402:280f:b0:43d:f946:a895 with SMTP id
 h15-20020a056402280f00b0043df946a895mr1636345ede.229.1660815236433; 
 Thu, 18 Aug 2022 02:33:56 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 p25-20020a056402045900b00445e506ddcasm798883edw.57.2022.08.18.02.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 02:33:55 -0700 (PDT)
Message-ID: <ec1ee656-6162-2f66-13b7-f2b83b00dba6@gmail.com>
Date: Thu, 18 Aug 2022 11:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] drm/ttm: Add usage to ttm_validate_buffer.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
 <20220813012801.1115950-2-bas@basnieuwenhuizen.nl>
 <60ac78e0-e65f-89c2-8404-2b65911f3e05@amd.com>
 <CAP+8YyE7DrWHFML5FHyuDdtZW7iY9FLR8Jma2Ar5C9qB8rWReQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAP+8YyE7DrWHFML5FHyuDdtZW7iY9FLR8Jma2Ar5C9qB8rWReQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 18.08.22 um 02:30 schrieb Bas Nieuwenhuizen:
> On Thu, Aug 18, 2022 at 12:04 AM Felix Kuehling <felix.kuehling@amd.com> wrote:
>> Am 2022-08-12 um 21:27 schrieb Bas Nieuwenhuizen:
>>> This way callsites can choose between READ/BOOKKEEP reservations.
>>>
>>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 5 +++++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 9 +++++++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c          | 1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 8 ++++++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          | 1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 1 +
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c             | 1 +
>>>    drivers/gpu/drm/qxl/qxl_release.c                | 1 +
>>>    drivers/gpu/drm/radeon/radeon_cs.c               | 2 ++
>>>    drivers/gpu/drm/radeon/radeon_gem.c              | 1 +
>>>    drivers/gpu/drm/radeon/radeon_vm.c               | 2 ++
>>>    drivers/gpu/drm/ttm/ttm_execbuf_util.c           | 3 +--
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_resource.c         | 7 ++++++-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_validation.c       | 1 +
>>>    include/drm/ttm/ttm_execbuf_util.h               | 2 ++
>>>    15 files changed, 38 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index 4608599ba6bb..a6eb7697c936 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -775,6 +775,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
>>>
>>>        INIT_LIST_HEAD(&entry->head);
>>>        entry->num_shared = 1;
>>> +     entry->usage = DMA_RESV_USAGE_READ;
>> KFD code never calls ttm_eu_fence_buffer_objects. Does it make sense to
>> set this field at all in this case?
> Okay, not super familiar with this code, just wanted to make sure that
> whatever we're doing in this patch is obviously not a functional
> change. I guess it isn't strictly necessaru.
>
>
>> Furthermore, I remember reviewing an RFC patch series by Christian that
>> replaced all the execbuf_util functions with an iterator API. Is
>> Christian's work abandoned or still in progress? How will that interact
>> with your patch series?
> I think instead of doing the above one would just adjust the
> DMA_RESV_USAGE_WRITE references in
> https://patchwork.freedesktop.org/patch/484765/?series=103522&rev=1 to
> DMA_RESV_USAGE_BOOKKEEP if the submission is on a context with
> disabledimplicit sync. And then obviously this patch wouldn't be
> necessary anymore (as well as the PD patch).

Felix is right my series should already give you the opportunity to use 
DMA_RESV_USAGE_BOOKKEEP.

I'm currently rebasing that stuff, so this patch here can be dropped 
when this series is ready.

Apart from that I'm still somewhat sure that we would mess up the VM 
synchronization in case of eviction which this here.

But I really need more time to fully look into this once more.

On the other hand the UAPI looks perfectly fine to me, so you can 
probably keep that as granted for userspace implementation.

Regards,
Christian.

>
>> Regards,
>>     Felix
>>
>>
>>>        entry->bo = &bo->tbo;
>>>        mutex_lock(&process_info->lock);
>>>        if (userptr)
>>> @@ -919,6 +920,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>>>        ctx->kfd_bo.priority = 0;
>>>        ctx->kfd_bo.tv.bo = &bo->tbo;
>>>        ctx->kfd_bo.tv.num_shared = 1;
>>> +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>>>
>>>        amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
>>> @@ -982,6 +984,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>>>        ctx->kfd_bo.priority = 0;
>>>        ctx->kfd_bo.tv.bo = &bo->tbo;
>>>        ctx->kfd_bo.tv.num_shared = 1;
>>> +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>>>
>>>        i = 0;
>>> @@ -2207,6 +2210,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>>>                list_add_tail(&mem->resv_list.head, &resv_list);
>>>                mem->resv_list.bo = mem->validate_list.bo;
>>>                mem->resv_list.num_shared = mem->validate_list.num_shared;
>>> +             mem->resv_list.usage = mem->validate_list.usage;
>>>        }
>>>
>>>        /* Reserve all BOs and page tables for validation */
>>> @@ -2406,6 +2410,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>>>                list_add_tail(&mem->resv_list.head, &ctx.list);
>>>                mem->resv_list.bo = mem->validate_list.bo;
>>>                mem->resv_list.num_shared = mem->validate_list.num_shared;
>>> +             mem->resv_list.usage = mem->validate_list.usage;
>>>        }
>>>
>>>        ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index d8f1335bc68f..f1ceb25d1b84 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -57,6 +57,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
>>>        p->uf_entry.tv.bo = &bo->tbo;
>>>        /* One for TTM and two for the CS job */
>>>        p->uf_entry.tv.num_shared = 3;
>>> +     p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        drm_gem_object_put(gobj);
>>>
>>> @@ -522,8 +523,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>        mutex_lock(&p->bo_list->bo_list_mutex);
>>>
>>>        /* One for TTM and one for the CS job */
>>> -     amdgpu_bo_list_for_each_entry(e, p->bo_list)
>>> +     amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>>                e->tv.num_shared = 2;
>>> +             e->tv.usage = DMA_RESV_USAGE_READ;
>>> +     }
>>>
>>>        amdgpu_bo_list_get_list(p->bo_list, &p->validated);
>>>
>>> @@ -1282,8 +1285,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>        amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>>>
>>>        /* Make sure all BOs are remembered as writers */
>>> -     amdgpu_bo_list_for_each_entry(e, p->bo_list)
>>> +     amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>>                e->tv.num_shared = 0;
>>> +             e->tv.usage = DMA_RESV_USAGE_WRITE;
>>> +     }
>>>
>>>        ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>>>        mutex_unlock(&p->adev->notifier_lock);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> index c6d4d41c4393..24941ed1a5ec 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> @@ -75,6 +75,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>        INIT_LIST_HEAD(&csa_tv.head);
>>>        csa_tv.bo = &bo->tbo;
>>>        csa_tv.num_shared = 1;
>>> +     csa_tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        list_add(&csa_tv.head, &list);
>>>        amdgpu_vm_get_pd_bo(vm, &list, &pd);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 8ef31d687ef3..f8cf52eb1931 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -208,6 +208,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>>>
>>>        tv.bo = &bo->tbo;
>>>        tv.num_shared = 2;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
>>> @@ -733,10 +734,13 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>>>                        return -ENOENT;
>>>                abo = gem_to_amdgpu_bo(gobj);
>>>                tv.bo = &abo->tbo;
>>> -             if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
>>> +             if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
>>>                        tv.num_shared = 1;
>>> -             else
>>> +                     tv.usage = DMA_RESV_USAGE_READ;
>>> +             } else {
>>>                        tv.num_shared = 0;
>>> +                     tv.usage = DMA_RESV_USAGE_WRITE;
>>> +             }
>>>                list_add(&tv.head, &list);
>>>        } else {
>>>                gobj = NULL;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> index 69a70a0aaed9..6b1da37c2280 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> @@ -996,6 +996,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
>>>
>>>        csa_tv.bo = &ctx_data->meta_data_obj->tbo;
>>>        csa_tv.num_shared = 1;
>>> +     csa_tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        list_add(&csa_tv.head, &list);
>>>        amdgpu_vm_get_pd_bo(vm, &list, &pd);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index dc76d2b3ce52..1b5d2317b987 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -325,6 +325,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>>>        entry->tv.bo = &vm->root.bo->tbo;
>>>        /* Two for VM updates, one for TTM and one for the CS job */
>>>        entry->tv.num_shared = 4;
>>> +     entry->tv.usage = DMA_RESV_USAGE_READ;
>>>        entry->user_pages = NULL;
>>>        list_add(&entry->tv.head, validated);
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index 7b332246eda3..83531b00b29d 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1410,6 +1410,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
>>>
>>>                ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
>>>                ctx->tv[gpuidx].num_shared = 4;
>>> +             ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
>>>                list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
>>>        }
>>>
>>> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
>>> index 368d26da0d6a..0c6e45992604 100644
>>> --- a/drivers/gpu/drm/qxl/qxl_release.c
>>> +++ b/drivers/gpu/drm/qxl/qxl_release.c
>>> @@ -184,6 +184,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
>>>        qxl_bo_ref(bo);
>>>        entry->tv.bo = &bo->tbo;
>>>        entry->tv.num_shared = 0;
>>> +     entry->tv.usage = DMA_RESV_USAGE_WRITE;
>>>        list_add_tail(&entry->tv.head, &release->bos);
>>>        return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
>>> index 446f7bae54c4..6cc470dcf177 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_cs.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
>>> @@ -184,6 +184,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
>>>
>>>                p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
>>>                p->relocs[i].tv.num_shared = !r->write_domain;
>>> +             p->relocs[i].tv.usage = r->write_domain ? DMA_RESV_USAGE_WRITE :
>>> +                                                       DMA_RESV_USAGE_READ;
>>>
>>>                radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
>>>                                      priority);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 8c01a7f0e027..e7abd535bdc2 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -636,6 +636,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
>>>
>>>        tv.bo = &bo_va->bo->tbo;
>>>        tv.num_shared = 1;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
>>> index 987cabbf1318..72ff5347b56d 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_vm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
>>> @@ -144,6 +144,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>>>        list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>>>        list[0].tv.bo = &vm->page_directory->tbo;
>>>        list[0].tv.num_shared = 1;
>>> +     list[0].tv.usage = DMA_RESV_USAGE_READ;
>>>        list[0].tiling_flags = 0;
>>>        list_add(&list[0].tv.head, head);
>>>
>>> @@ -156,6 +157,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>>>                list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>>>                list[idx].tv.bo = &list[idx].robj->tbo;
>>>                list[idx].tv.num_shared = 1;
>>> +             list[idx].tv.usage = DMA_RESV_USAGE_READ;
>>>                list[idx].tiling_flags = 0;
>>>                list_add(&list[idx++].tv.head, head);
>>>        }
>>> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> index dbee34a058df..44a6bce66cf7 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> @@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>>>        list_for_each_entry(entry, list, head) {
>>>                struct ttm_buffer_object *bo = entry->bo;
>>>
>>> -             dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
>>> -                                DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
>>> +             dma_resv_add_fence(bo->base.resv, fence, entry->usage);
>>>                ttm_bo_move_to_lru_tail_unlocked(bo);
>>>                dma_resv_unlock(bo->base.resv);
>>>        }
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> index a7d62a4eb47b..0de0365504d6 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> @@ -131,6 +131,7 @@ static void vmw_resource_release(struct kref *kref)
>>>
>>>                        val_buf.bo = bo;
>>>                        val_buf.num_shared = 0;
>>> +                     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>                        res->func->unbind(res, false, &val_buf);
>>>                }
>>>                res->backup_dirty = false;
>>> @@ -553,6 +554,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>>>        ttm_bo_get(&res->backup->base);
>>>        val_buf->bo = &res->backup->base;
>>>        val_buf->num_shared = 0;
>>> +     val_buf->usage = DMA_RESV_USAGE_WRITE;
>>>        list_add_tail(&val_buf->head, &val_list);
>>>        ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
>>>        if (unlikely(ret != 0))
>>> @@ -658,6 +660,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
>>>
>>>        val_buf.bo = NULL;
>>>        val_buf.num_shared = 0;
>>> +     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>        ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
>>>        if (unlikely(ret != 0))
>>>                return ret;
>>> @@ -709,6 +712,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
>>>
>>>        val_buf.bo = NULL;
>>>        val_buf.num_shared = 0;
>>> +     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>        if (res->backup)
>>>                val_buf.bo = &res->backup->base;
>>>        do {
>>> @@ -777,7 +781,8 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
>>>    {
>>>        struct ttm_validate_buffer val_buf = {
>>>                .bo = &vbo->base,
>>> -             .num_shared = 0
>>> +             .num_shared = 0,
>>> +             .usage = DMA_RESV_USAGE_WRITE
>>>        };
>>>
>>>        dma_resv_assert_held(vbo->base.base.resv);
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> index f46891012be3..913e91962af1 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> @@ -289,6 +289,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
>>>                if (!val_buf->bo)
>>>                        return -ESRCH;
>>>                val_buf->num_shared = 0;
>>> +             val_buf->usage = DMA_RESV_USAGE_WRITE;
>>>                list_add_tail(&val_buf->head, &ctx->bo_list);
>>>                bo_node->as_mob = as_mob;
>>>                bo_node->cpu_blit = cpu_blit;
>>> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
>>> index a99d7fdf2964..5b65f5e1354a 100644
>>> --- a/include/drm/ttm/ttm_execbuf_util.h
>>> +++ b/include/drm/ttm/ttm_execbuf_util.h
>>> @@ -41,12 +41,14 @@
>>>     * @head:           list head for thread-private list.
>>>     * @bo:             refcounted buffer object pointer.
>>>     * @num_shared:     How many shared fences we want to add.
>>> + * @usage           dma resv usage of the fences to add.
>>>     */
>>>
>>>    struct ttm_validate_buffer {
>>>        struct list_head head;
>>>        struct ttm_buffer_object *bo;
>>>        unsigned int num_shared;
>>> +     enum dma_resv_usage usage;
>>>    };
>>>
>>>    /**

