Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38B7E2CA8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D511610E3DA;
	Mon,  6 Nov 2023 19:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28D310E3DA;
 Mon,  6 Nov 2023 19:14:27 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50943ccbbaeso6962472e87.2; 
 Mon, 06 Nov 2023 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699298066; x=1699902866; darn=lists.freedesktop.org;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQV69gqHD6ZZKp1O7jV7TbAR+OVipr0K/5WxQhXXdx0=;
 b=MdAXeTQ5JcPDzF/vAPKdXCgB+OrRlCPcQS5rc/jEB/xwXfvOIaF7n7R9E6jWNT2TaH
 xhaGpWvQgQniJHOkV3OmR69V9J9zGPPkGxWJRaIpFgGNNgRSmNhbTLehBQs4KujdMgkv
 6KynPdud/unPnxkRaVw0AMh0/4J1YqOpt0IT7q6qatPwreKHXJ3r3AX1K8WAjegkkg04
 wU10Sm6Ef3f8yVX/Nrqw4Jw7AmKySK0WgfOrcoHw/eQCMFMgg4Zeq0QhRsKiSLoA6VYL
 HOZWC+O7KTX/UtfbEYrIVwd4i7XBsezwS0nBc9rjgAvPYGTuL0DiX5HwxDvs73qCX9+w
 bZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699298066; x=1699902866;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iQV69gqHD6ZZKp1O7jV7TbAR+OVipr0K/5WxQhXXdx0=;
 b=IAWsNk1SQH6haF54icWq8oO/WeDJ31U24Yr0UL/nz66Dsm2iAO7O5QAz+SxNdplpuq
 ehPwQx23UmVAN37i2YtX66oDzhesA8wfSVnxoIvK6jlV6iBeWrXxNmiBw1JtdcPwli80
 /wJ9vgJrxNAMEjqE6G53jjJPh3LCQ0Gzpk+bNt4B46E3T/x0+nm514Ic6ku67KYlfsOw
 JUC6EM7Dkvcd5SlhX0qlfbrC4r8yB6h87Sh5v1xm9ES7n45QzfXYgLoEV+3aqus2c0Ud
 9qAmiITYchbxKo+Ua2Kx3F/iy/AQnjWMx8BGbhZswHrq5ntx8RD4Z5d/dETrQt0AVNE/
 yOVg==
X-Gm-Message-State: AOJu0Yw+qdIkbAATZfvNDw+tMZH1loaEUiV7lq+FRrReGKHMnZ9Xq2sH
 oVMPtSNwRDUCHJMlVh2bQU8=
X-Google-Smtp-Source: AGHT+IGXtwJ96d4MS+/S2R1y6ZiaLP2LlPXPqxkqP9rq/CDRH94HHFvh40w8jZOhGnaT7gRR4fgyrQ==
X-Received: by 2002:a05:6512:1586:b0:509:1ecb:5a04 with SMTP id
 bp6-20020a056512158600b005091ecb5a04mr23758973lfb.19.1699298065466; 
 Mon, 06 Nov 2023 11:14:25 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b0032f7d1e2c7csm336793wrt.95.2023.11.06.11.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 11:14:25 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------8coc5cuiSVlNQgzlv9i3ddJo"
Message-ID: <86a5d285-7e3f-4117-be02-35f09d48bbda@gmail.com>
Date: Mon, 6 Nov 2023 20:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/amdgpu: Add flag to disable implicit sync for
 GEM operations.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-3-ishitatsuyuki@gmail.com>
 <d044c075-3030-4d76-b507-398be639fa50@amd.com>
 <58C142E3-2565-4817-BF4F-7F4D24771D8C@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <58C142E3-2565-4817-BF4F-7F4D24771D8C@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------8coc5cuiSVlNQgzlv9i3ddJo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.23 um 16:47 schrieb Tatsuyuki Ishi:
>> On Nov 6, 2023, at 22:44, Christian König <christian.koenig@amd.com> 
>> wrote:
>>
>> Am 02.11.23 um 15:04 schrieb Tatsuyuki Ishi:
>>> In Vulkan, it is the application's responsibility to perform adequate
>>> synchronization before a sparse unmap, replace or BO destroy operation.
>>> Until now, the kernel applied the same rule as implicitly-synchronized
>>> APIs like OpenGL, which with per-VM BOs made page table updates 
>>> stall the
>>> queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag allows
>>> drivers to opt-out of this behavior, while still ensuring adequate 
>>> implicit
>>> sync happens for kernel-initiated updates (e.g. BO moves).
>>>
>>> We record whether to use implicit sync or not for each freed mapping. To
>>> avoid increasing the mapping struct's size, this is union-ized with the
>>> interval tree field which is unused after the unmap.
>>>
>>> The reason this is done with a GEM ioctl flag, instead of being a VM /
>>> context global setting, is that the current libdrm implementation shares
>>> the DRM handle even between different kind of drivers (radeonsi vs 
>>> radv).
>>
>> It would be nice if we could make this more future prove by not using 
>> a flag, but rather a drm_syncobj.
>
> There is asynchronous VM_BIND and synchronous VM_BIND. Using syncobjs 
> address asynchronous binds, but what this patch set solves is to add 
> an explicitly synced synchronous bind.

All VM updates are asynchronous in the sense that they are queues up and 
don't execute immediately.

If you don't add input/output fences and don't sync implicitly with 
command submission any more you actually have no idea in userspace when 
they execute.

That doesn't sound like a good idea to me.

>
> Even within Vulkan, there are use cases for synchronous binds. This is 
> when a non-sparse BO is destroyed (or created but that’s not 
> synchronized). Such operations should still be explicit sync, unlike 
> OpenGL where it syncs to previous submissions. So adding asynchronous 
> bind doesn’t supersede this need.
>
> I’ve also thought whether we can just make the unmap asynchronous, 
> since the spec requires that destroyed stuff are not accessed in any 
> way, but I think it will complicate behavior when the destruction of 
> BO immediately follows.
>
> We should implement asynchronous bind someday to make 
> vkQueueBindSparse work (even) better, but that will likely involve a 
> larger scope including the scheduler. Getting synchronous but 
> explicitly synced binds should be simpler and a good incremental step.

That's the whole point, I don't think that the flag is simpler/cleaner 
than a fence.

We still need to take the implicit sync which can come from kernel 
operations into account, but at the same time disable the implicit sync 
which comes from user space submissions.

As far as I can see the easiest way to do this and which both doesn't 
break anything currently and still leaves room to extend the interface 
is to add an input dependency fence.

If you then use a signaled syncpoint as input you get exactly the 
semantic you desire while we are still able to add an output fence later on.

Regards,
Christian.

>
> Tatsuyuki.
>
>> You can extend the drm_amdgpu_gem_va structure by adding a 
>> drm_syncobj handle and timeline point at the end.
>>
>> If the syncobj/timeline point results in a fence we give that as 
>> input dependency the operation has to wait for.
>>
>> And output fence can come later on as well, but that one is much more 
>> harder to handle.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>>> ---
>>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 14 ++++--
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  7 ++-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 ++-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 47 +++++++++++--------
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 23 +++++----
>>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 +++----
>>>  include/uapi/drm/amdgpu_drm.h                 |  2 +
>>>  9 files changed, 71 insertions(+), 50 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index 7d6daf8d2bfa..10e129bff977 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -1196,7 +1196,7 @@ static void unmap_bo_from_gpuvm(struct kgd_mem 
>>> *mem,
>>> struct amdgpu_device *adev = entry->adev;
>>> struct amdgpu_vm *vm = bo_va->base.vm;
>>>  -amdgpu_vm_bo_unmap(adev, bo_va, entry->va);
>>> +amdgpu_vm_bo_unmap(adev, bo_va, entry->va, true);
>>> amdgpu_vm_clear_freed(adev, vm, &bo_va->last_pt_update);
>>>  diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> index 720011019741..612279e65bff 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> @@ -122,7 +122,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device 
>>> *adev, struct amdgpu_vm *vm,
>>> }
>>> }
>>>  -r = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);
>>> +r = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr, true);
>>> if (r) {
>>> DRM_ERROR("failed to do bo_unmap on static CSA, err=%d\n", r);
>>> goto error;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index a1b15d0d6c48..cca68b89754e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -667,9 +667,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, 
>>> void *data,
>>> const uint32_t valid_flags = AMDGPU_VM_DELAY_UPDATE |
>>> AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE |
>>> AMDGPU_VM_PAGE_EXECUTABLE | AMDGPU_VM_MTYPE_MASK |
>>> -AMDGPU_VM_PAGE_NOALLOC;
>>> +AMDGPU_VM_PAGE_NOALLOC | AMDGPU_VM_EXPLICIT_SYNC;
>>> const uint32_t prt_flags = AMDGPU_VM_DELAY_UPDATE |
>>> -AMDGPU_VM_PAGE_PRT;
>>> +AMDGPU_VM_PAGE_PRT | AMDGPU_VM_EXPLICIT_SYNC;
>>> struct drm_amdgpu_gem_va *args = data;
>>> struct drm_gem_object *gobj;
>>> @@ -680,6 +680,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, 
>>> void *data,
>>> struct drm_exec exec;
>>> uint64_t va_flags;
>>> uint64_t vm_size;
>>> +bool sync_unmap;
>>> int r = 0;
>>> if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
>>> @@ -715,6 +716,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, 
>>> void *data,
>>> return -EINVAL;
>>> }
>>>  +sync_unmap = !(args->flags & AMDGPU_VM_EXPLICIT_SYNC);
>>> +
>>> switch (args->operation) {
>>> case AMDGPU_VA_OP_MAP:
>>> case AMDGPU_VA_OP_UNMAP:
>>> @@ -774,19 +777,20 @@ int amdgpu_gem_va_ioctl(struct drm_device 
>>> *dev, void *data,
>>>     va_flags);
>>> break;
>>> case AMDGPU_VA_OP_UNMAP:
>>> -r = amdgpu_vm_bo_unmap(adev, bo_va, args->va_address);
>>> +r = amdgpu_vm_bo_unmap(adev, bo_va, args->va_address,
>>> +      sync_unmap);
>>> break;
>>> case AMDGPU_VA_OP_CLEAR:
>>> r = amdgpu_vm_bo_clear_mappings(adev, &fpriv->vm,
>>> args->va_address,
>>> -args->map_size);
>>> +args->map_size, sync_unmap);
>>> break;
>>> case AMDGPU_VA_OP_REPLACE:
>>> va_flags = amdgpu_gem_va_map_flags(adev, args->flags);
>>> r = amdgpu_vm_bo_replace_map(adev, bo_va, args->va_address,
>>>     args->offset_in_bo, args->map_size,
>>> -    va_flags);
>>> +    va_flags, sync_unmap);
>>> break;
>>> default:
>>> break;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> index f3ee83cdf97e..28be03f1bbcf 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> @@ -67,7 +67,12 @@ struct amdgpu_bo_va_mapping {
>>> struct rb_noderb;
>>> uint64_tstart;
>>> uint64_tlast;
>>> -uint64_t__subtree_last;
>>> +union {
>>> +/* BOs in interval tree only */
>>> +uint64_t__subtree_last;
>>> +/* Freed BOs only */
>>> +boolsync_unmap;
>>> +};
>>> uint64_toffset;
>>> uint64_tflags;
>>>  };
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>>> index 2fd1bfb35916..e71443c8c59b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>>> @@ -276,6 +276,7 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
>>>     __field(long, last)
>>>     __field(u64, offset)
>>>     __field(u64, flags)
>>> +    __field(bool, sync_unmap)
>>>     ),
>>>    TP_fast_assign(
>>> @@ -284,10 +285,11 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
>>>   __entry->last = mapping->last;
>>>   __entry->offset = mapping->offset;
>>>   __entry->flags = mapping->flags;
>>> +  __entry->sync_unmap = mapping->sync_unmap;
>>>   ),
>>> -   TP_printk("bo=%p, start=%lx, last=%lx, offset=%010llx, flags=%llx",
>>> +   TP_printk("bo=%p, start=%lx, last=%lx, offset=%010llx, 
>>> flags=%llx, sync_unmap=%d",
>>>      __entry->bo, __entry->start, __entry->last,
>>> -     __entry->offset, __entry->flags)
>>> +     __entry->offset, __entry->flags, __entry->sync_unmap)
>>>  );
>>>    DECLARE_EVENT_CLASS(amdgpu_vm_mapping,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 7b9762f1cddd..a74472e16952 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -844,6 +844,7 @@ static void amdgpu_vm_tlb_seq_cb(struct 
>>> dma_fence *fence,
>>>   * @immediate: immediate submission in a page fault
>>>   * @unlocked: unlocked invalidation during MM callback
>>>   * @flush_tlb: trigger tlb invalidation after update completed
>>> + * @sync_unmap: wait for BO users before unmapping
>>>   * @resv: fences we need to sync to
>>>   * @start: start of mapped range
>>>   * @last: last mapped entry
>>> @@ -861,8 +862,9 @@ static void amdgpu_vm_tlb_seq_cb(struct 
>>> dma_fence *fence,
>>>   */
>>>  int amdgpu_vm_update_range(struct amdgpu_device *adev, struct 
>>> amdgpu_vm *vm,
>>>   bool immediate, bool unlocked, bool flush_tlb,
>>> -  struct dma_resv *resv, uint64_t start, uint64_t last,
>>> -  uint64_t flags, uint64_t offset, uint64_t vram_base,
>>> +  bool sync_unmap, struct dma_resv *resv,
>>> +  uint64_t start, uint64_t last, uint64_t flags,
>>> +  uint64_t offset, uint64_t vram_base,
>>>   struct ttm_resource *res, dma_addr_t *pages_addr,
>>>   struct dma_fence **fence)
>>>  {
>>> @@ -902,7 +904,7 @@ int amdgpu_vm_update_range(struct amdgpu_device 
>>> *adev, struct amdgpu_vm *vm,
>>> /* Implicitly sync to command submissions in the same VM before
>>> * unmapping. Sync to moving fences before mapping.
>>> */
>>> -if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
>>> +if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) && sync_unmap)
>>> sync_mode = AMDGPU_SYNC_EQ_OWNER;
>>> else
>>> sync_mode = AMDGPU_SYNC_EXPLICIT;
>>> @@ -1145,10 +1147,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device 
>>> *adev, struct amdgpu_bo_va *bo_va,
>>> trace_amdgpu_vm_bo_update(mapping);
>>> r = amdgpu_vm_update_range(adev, vm, false, false, flush_tlb,
>>> -  resv, mapping->start, mapping->last,
>>> -  update_flags, mapping->offset,
>>> -  vram_base, mem, pages_addr,
>>> -  last_update);
>>> +  true, resv, mapping->start,
>>> +  mapping->last, update_flags,
>>> +  mapping->offset, vram_base, mem,
>>> +  pages_addr, last_update);
>>> if (r)
>>> return r;
>>> }
>>> @@ -1340,7 +1342,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device 
>>> *adev,
>>>    mapping->start < AMDGPU_GMC_HOLE_START)
>>> init_pte_value = AMDGPU_PTE_DEFAULT_ATC;
>>>  -r = amdgpu_vm_update_range(adev, vm, false, false, true, resv,
>>> +r = amdgpu_vm_update_range(adev, vm, false, false, true,
>>> +  mapping->sync_unmap, resv,
>>>   mapping->start, mapping->last,
>>>   init_pte_value, 0, 0, NULL, NULL,
>>>   &f);
>>> @@ -1572,6 +1575,7 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
>>>   * @offset: requested offset in the BO
>>>   * @size: BO size in bytes
>>>   * @flags: attributes of pages (read/write/valid/etc.)
>>> + * @sync_unmap: wait for BO users before replacing existing mapping
>>>   *
>>>   * Add a mapping of the BO at the specefied addr into the VM. 
>>> Replace existing
>>>   * mappings as we do so.
>>> @@ -1582,9 +1586,9 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
>>>   * Object has to be reserved and unreserved outside!
>>>   */
>>>  int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>>> -    struct amdgpu_bo_va *bo_va,
>>> -    uint64_t saddr, uint64_t offset,
>>> -    uint64_t size, uint64_t flags)
>>> +    struct amdgpu_bo_va *bo_va, uint64_t saddr,
>>> +    uint64_t offset, uint64_t size, uint64_t flags,
>>> +    bool sync_unmap)
>>>  {
>>> struct amdgpu_bo_va_mapping *mapping;
>>> struct amdgpu_bo *bo = bo_va->base.bo;
>>> @@ -1608,7 +1612,7 @@ int amdgpu_vm_bo_replace_map(struct 
>>> amdgpu_device *adev,
>>> if (!mapping)
>>> return -ENOMEM;
>>>  -r = amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size);
>>> +r = amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size, 
>>> sync_unmap);
>>> if (r) {
>>> kfree(mapping);
>>> return r;
>>> @@ -1633,6 +1637,7 @@ int amdgpu_vm_bo_replace_map(struct 
>>> amdgpu_device *adev,
>>>   * @adev: amdgpu_device pointer
>>>   * @bo_va: bo_va to remove the address from
>>>   * @saddr: where to the BO is mapped
>>> + * @sync_unmap: wait for BO users before unmapping
>>>   *
>>>   * Remove a mapping of the BO at the specefied addr from the VM.
>>>   *
>>> @@ -1641,9 +1646,8 @@ int amdgpu_vm_bo_replace_map(struct 
>>> amdgpu_device *adev,
>>>   *
>>>   * Object has to be reserved and unreserved outside!
>>>   */
>>> -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>>> -      struct amdgpu_bo_va *bo_va,
>>> -      uint64_t saddr)
>>> +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct 
>>> amdgpu_bo_va *bo_va,
>>> +      uint64_t saddr, bool sync_unmap)
>>>  {
>>> struct amdgpu_bo_va_mapping *mapping;
>>> struct amdgpu_vm *vm = bo_va->base.vm;
>>> @@ -1671,6 +1675,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>>> list_del(&mapping->list);
>>> amdgpu_vm_it_remove(mapping, &vm->va);
>>> mapping->bo_va = NULL;
>>> +mapping->sync_unmap = sync_unmap;
>>> trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>> if (valid)
>>> @@ -1689,6 +1694,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>>>   * @vm: VM structure to use
>>>   * @saddr: start of the range
>>>   * @size: size of the range
>>> + * @sync_unmap: wait for BO users before unmapping
>>>   *
>>>   * Remove all mappings in a range, split them as appropriate.
>>>   *
>>> @@ -1696,8 +1702,8 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>>>   * 0 for success, error for failure.
>>>   */
>>>  int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>>> -struct amdgpu_vm *vm,
>>> -uint64_t saddr, uint64_t size)
>>> +struct amdgpu_vm *vm, uint64_t saddr,
>>> +uint64_t size, bool sync_unmap)
>>>  {
>>> struct amdgpu_bo_va_mapping *before, *after, *tmp, *next;
>>> LIST_HEAD(removed);
>>> @@ -1761,6 +1767,7 @@ int amdgpu_vm_bo_clear_mappings(struct 
>>> amdgpu_device *adev,
>>>    tmp->last = eaddr;
>>> tmp->bo_va = NULL;
>>> +tmp->sync_unmap = sync_unmap;
>>> list_add(&tmp->list, &vm->freed);
>>> trace_amdgpu_vm_bo_unmap(NULL, tmp);
>>> }
>>> @@ -1889,6 +1896,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>>> list_del(&mapping->list);
>>> amdgpu_vm_it_remove(mapping, &vm->va);
>>> mapping->bo_va = NULL;
>>> +mapping->sync_unmap = true;
>>> trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>> list_add(&mapping->list, &vm->freed);
>>> }
>>> @@ -2617,8 +2625,9 @@ bool amdgpu_vm_handle_fault(struct 
>>> amdgpu_device *adev, u32 pasid,
>>> goto error_unlock;
>>> }
>>>  -r = amdgpu_vm_update_range(adev, vm, true, false, false, NULL, addr,
>>> -  addr, flags, value, 0, NULL, NULL, NULL);
>>> +r = amdgpu_vm_update_range(adev, vm, true, false, false, true, NULL,
>>> +  addr, addr, flags, value, 0, NULL, NULL,
>>> +  NULL);
>>> if (r)
>>> goto error_unlock;
>>>  diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> index 204ab13184ed..73b7b49fdb2e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> @@ -423,12 +423,12 @@ void amdgpu_vm_bo_base_init(struct 
>>> amdgpu_vm_bo_base *base,
>>>    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
>>>  int amdgpu_vm_update_range(struct amdgpu_device *adev, struct 
>>> amdgpu_vm *vm,
>>>   bool immediate, bool unlocked, bool flush_tlb,
>>> -  struct dma_resv *resv, uint64_t start, uint64_t last,
>>> -  uint64_t flags, uint64_t offset, uint64_t vram_base,
>>> +  bool sync_unmap, struct dma_resv *resv,
>>> +  uint64_t start, uint64_t last, uint64_t flags,
>>> +  uint64_t offset, uint64_t vram_base,
>>>   struct ttm_resource *res, dma_addr_t *pages_addr,
>>>   struct dma_fence **fence);
>>> -int amdgpu_vm_bo_update(struct amdgpu_device *adev,
>>> -struct amdgpu_bo_va *bo_va,
>>> +int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct 
>>> amdgpu_bo_va *bo_va,
>>> bool clear);
>>>  bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
>>>  void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
>>> @@ -444,15 +444,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
>>>     uint64_t addr, uint64_t offset,
>>>     uint64_t size, uint64_t flags);
>>>  int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>>> -    struct amdgpu_bo_va *bo_va,
>>> -    uint64_t addr, uint64_t offset,
>>> -    uint64_t size, uint64_t flags);
>>> -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>>> -      struct amdgpu_bo_va *bo_va,
>>> -      uint64_t addr);
>>> +    struct amdgpu_bo_va *bo_va, uint64_t addr,
>>> +    uint64_t offset, uint64_t size, uint64_t flags,
>>> +    bool sync_unmap);
>>> +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct 
>>> amdgpu_bo_va *bo_va,
>>> +      uint64_t addr, bool sync_unmap);
>>>  int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>>> -struct amdgpu_vm *vm,
>>> -uint64_t saddr, uint64_t size);
>>> +struct amdgpu_vm *vm, uint64_t saddr,
>>> +uint64_t size, bool sync_unmap);
>>>  struct amdgpu_bo_va_mapping *amdgpu_vm_bo_lookup_mapping(struct 
>>> amdgpu_vm *vm,
>>> uint64_t addr);
>>>  void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct 
>>> ww_acquire_ctx *ticket);
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c 
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index bb16b795d1bc..6eb4a0a4bc84 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1291,9 +1291,9 @@ svm_range_unmap_from_gpu(struct amdgpu_device 
>>> *adev, struct amdgpu_vm *vm,
>>> pr_debug("[0x%llx 0x%llx]\n", start, last);
>>>  -return amdgpu_vm_update_range(adev, vm, false, true, true, NULL, 
>>> start,
>>> -     last, init_pte_value, 0, 0, NULL, NULL,
>>> -     fence);
>>> +return amdgpu_vm_update_range(adev, vm, false, true, true, true, NULL,
>>> +     start, last, init_pte_value, 0, 0, NULL,
>>> +     NULL, fence);
>>>  }
>>>    static int
>>> @@ -1398,12 +1398,12 @@ svm_range_map_to_gpu(struct 
>>> kfd_process_device *pdd, struct svm_range *prange,
>>> * different memory partition based on fpfn/lpfn, we should use
>>> * same vm_manager.vram_base_offset regardless memory partition.
>>> */
>>> -r = amdgpu_vm_update_range(adev, vm, false, false, flush_tlb, NULL,
>>> -  last_start, prange->start + i,
>>> -  pte_flags,
>>> -  (last_start - prange->start) << PAGE_SHIFT,
>>> -  bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
>>> -  NULL, dma_addr, &vm->last_update);
>>> +r = amdgpu_vm_update_range(
>>> +adev, vm, false, false, flush_tlb, true, NULL,
>>> +last_start, prange->start + i, pte_flags,
>>> +(last_start - prange->start) << PAGE_SHIFT,
>>> +bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
>>> +NULL, dma_addr, &vm->last_update);
>>> for (j = last_start - prange->start; j <= i; j++)
>>> dma_addr[j] |= last_domain;
>>> diff --git a/include/uapi/drm/amdgpu_drm.h 
>>> b/include/uapi/drm/amdgpu_drm.h
>>> index f477eda6a2b8..3cdcc299956e 100644
>>> --- a/include/uapi/drm/amdgpu_drm.h
>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>> @@ -556,6 +556,8 @@ struct drm_amdgpu_gem_op {
>>>  #define AMDGPU_VM_MTYPE_RW(5 << 5)
>>>  /* don't allocate MALL */
>>>  #define AMDGPU_VM_PAGE_NOALLOC(1 << 9)
>>> +/* don't sync on unmap */
>>> +#define AMDGPU_VM_EXPLICIT_SYNC(1 << 10)
>>>    struct drm_amdgpu_gem_va {
>>> /** GEM object handle */
>

--------------8coc5cuiSVlNQgzlv9i3ddJo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 06.11.23 um 16:47 schrieb Tatsuyuki Ishi:<br>
    <blockquote type="cite"
      cite="mid:58C142E3-2565-4817-BF4F-7F4D24771D8C@gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>
        <blockquote type="cite">
          <div>On Nov 6, 2023, at 22:44, Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:</div>
          <br class="Apple-interchange-newline">
          <div>
            <meta charset="UTF-8">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;"> </span><span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">Am
              02.11.23 um 15:04 schrieb Tatsuyuki Ishi:</span><br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <blockquote type="cite"
style="font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">In
              Vulkan, it is the application's responsibility to perform
              adequate<br>
              synchronization before a sparse unmap, replace or BO
              destroy operation.<br>
              Until now, the kernel applied the same rule as
              implicitly-synchronized<br>
              APIs like OpenGL, which with per-VM BOs made page table
              updates stall the<br>
              queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC
              flag allows<br>
              drivers to opt-out of this behavior, while still ensuring
              adequate implicit<br>
              sync happens for kernel-initiated updates (e.g. BO moves).<br>
              <br>
              We record whether to use implicit sync or not for each
              freed mapping. To<br>
              avoid increasing the mapping struct's size, this is
              union-ized with the<br>
              interval tree field which is unused after the unmap.<br>
              <br>
              The reason this is done with a GEM ioctl flag, instead of
              being a VM /<br>
              context global setting, is that the current libdrm
              implementation shares<br>
              the DRM handle even between different kind of drivers
              (radeonsi vs radv).<br>
            </blockquote>
            <br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">It
              would be nice if we could make this more future prove by
              not using a flag, but rather a drm_syncobj.</span></div>
        </blockquote>
        <div><br>
        </div>
        <div>There is asynchronous VM_BIND and synchronous VM_BIND.
          Using syncobjs address asynchronous binds, but what this patch
          set solves is to add an explicitly synced synchronous bind.</div>
      </div>
    </blockquote>
    <br>
    All VM updates are asynchronous in the sense that they are queues up
    and don't execute immediately.<br>
    <br>
    If you don't add input/output fences and don't sync implicitly with
    command submission any more you actually have no idea in userspace
    when they execute.<br>
    <br>
    That doesn't sound like a good idea to me.<br>
    <br>
    <blockquote type="cite"
      cite="mid:58C142E3-2565-4817-BF4F-7F4D24771D8C@gmail.com">
      <div>
        <div><br>
        </div>
        <div>Even within Vulkan, there are use cases for synchronous
          binds. This is when a non-sparse BO is destroyed (or created
          but that’s not synchronized). Such operations should still be
          explicit sync, unlike OpenGL where it syncs to previous
          submissions. So adding asynchronous bind doesn’t supersede
          this need.</div>
        <div><br>
        </div>
        <div>I’ve also thought whether we can just make the unmap
          asynchronous, since the spec requires that destroyed stuff are
          not accessed in any way, but I think it will complicate
          behavior when the destruction of BO immediately follows.</div>
        <div><br>
        </div>
        <div>We should implement asynchronous bind someday to make
          vkQueueBindSparse work (even) better, but that will likely
          involve a larger scope including the scheduler. Getting
          synchronous but explicitly synced binds should be simpler and
          a good incremental step.</div>
      </div>
    </blockquote>
    <br>
    That's the whole point, I don't think that the flag is
    simpler/cleaner than a fence.<br>
    <br>
    We still need to take the implicit sync which can come from kernel
    operations into account, but at the same time disable the implicit
    sync which comes from user space submissions.<br>
    <br>
    As far as I can see the easiest way to do this and which both
    doesn't break anything currently and still leaves room to extend the
    interface is to add an input dependency fence.<br>
    <br>
    If you then use a signaled syncpoint as input you get exactly the
    semantic you desire while we are still able to add an output fence
    later on.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:58C142E3-2565-4817-BF4F-7F4D24771D8C@gmail.com">
      <div>
        <div><br>
        </div>
        <div>Tatsuyuki.</div>
        <br>
        <blockquote type="cite">
          <div><span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">You
              can extend the drm_amdgpu_gem_va structure by adding a
              drm_syncobj handle and timeline point at the end.</span><br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">If
              the syncobj/timeline point results in a fence we give that
              as input dependency the operation has to wait for.</span><br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">And
              output fence can come later on as well, but that one is
              much more harder to handle.</span><br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">Regards,</span><br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">Christian.</span><br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <br
style="caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
            <blockquote type="cite"
style="font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"><br>
              Signed-off-by: Tatsuyuki Ishi
              <a class="moz-txt-link-rfc2396E" href="mailto:ishitatsuyuki@gmail.com">&lt;ishitatsuyuki@gmail.com&gt;</a><br>
              ---<br>
               .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 14 ++++--<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  7 ++-<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 ++-<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 47
              +++++++++++--------<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 23
              +++++----<br>
               drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18
              +++----<br>
               include/uapi/drm/amdgpu_drm.h                 |  2 +<br>
               9 files changed, 71 insertions(+), 50 deletions(-)<br>
              <br>
              diff --git
              a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
              index 7d6daf8d2bfa..10e129bff977 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
              @@ -1196,7 +1196,7 @@ static void
              unmap_bo_from_gpuvm(struct kgd_mem *mem,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_device *adev = entry-&gt;adev;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_vm *vm = bo_va-&gt;base.vm;<br>
               -<span class="Apple-tab-span" style="white-space: pre;">	</span>amdgpu_vm_bo_unmap(adev,
              bo_va, entry-&gt;va);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>amdgpu_vm_bo_unmap(adev,
              bo_va, entry-&gt;va, true);<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span>amdgpu_vm_clear_freed(adev,
              vm, &amp;bo_va-&gt;last_pt_update);<br>
               diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c<br>
              index 720011019741..612279e65bff 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c<br>
              @@ -122,7 +122,7 @@ int amdgpu_unmap_static_csa(struct
              amdgpu_device *adev, struct amdgpu_vm *vm,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>}<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>}<br>
               -<span class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr, true);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (r) {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>DRM_ERROR("failed
              to do bo_unmap on static CSA, err=%d\n", r);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>goto
              error;<br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
              index a1b15d0d6c48..cca68b89754e 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
              @@ -667,9 +667,9 @@ int amdgpu_gem_va_ioctl(struct
              drm_device *dev, void *data,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>const
              uint32_t valid_flags = AMDGPU_VM_DELAY_UPDATE |<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>AMDGPU_VM_PAGE_READABLE
              | AMDGPU_VM_PAGE_WRITEABLE |<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>AMDGPU_VM_PAGE_EXECUTABLE
              | AMDGPU_VM_MTYPE_MASK |<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>AMDGPU_VM_PAGE_NOALLOC;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>AMDGPU_VM_PAGE_NOALLOC
              | AMDGPU_VM_EXPLICIT_SYNC;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>const
              uint32_t prt_flags = AMDGPU_VM_DELAY_UPDATE |<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>AMDGPU_VM_PAGE_PRT;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>AMDGPU_VM_PAGE_PRT
              | AMDGPU_VM_EXPLICIT_SYNC;<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              drm_amdgpu_gem_va *args = data;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              drm_gem_object *gobj;<br>
              @@ -680,6 +680,7 @@ int amdgpu_gem_va_ioctl(struct
              drm_device *dev, void *data,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              drm_exec exec;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t
              va_flags;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t
              vm_size;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>bool
              sync_unmap;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>int
              r = 0;<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (args-&gt;va_address &lt; AMDGPU_VA_RESERVED_SIZE) {<br>
              @@ -715,6 +716,8 @@ int amdgpu_gem_va_ioctl(struct
              drm_device *dev, void *data,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>return
              -EINVAL;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>}<br>
               +<span class="Apple-tab-span" style="white-space: pre;">	</span>sync_unmap
              = !(args-&gt;flags &amp; AMDGPU_VM_EXPLICIT_SYNC);<br>
              +<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>switch
              (args-&gt;operation) {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>case
              AMDGPU_VA_OP_MAP:<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>case
              AMDGPU_VA_OP_UNMAP:<br>
              @@ -774,19 +777,20 @@ int amdgpu_gem_va_ioctl(struct
              drm_device *dev, void *data,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    va_flags);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>break;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>case
              AMDGPU_VA_OP_UNMAP:<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_unmap(adev, bo_va, args-&gt;va_address);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_unmap(adev, bo_va, args-&gt;va_address,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>      sync_unmap);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>break;<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span>case
              AMDGPU_VA_OP_CLEAR:<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_clear_mappings(adev, &amp;fpriv-&gt;vm,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>args-&gt;va_address,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>args-&gt;map_size);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>args-&gt;map_size,
              sync_unmap);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>break;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>case
              AMDGPU_VA_OP_REPLACE:<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>va_flags
              = amdgpu_gem_va_map_flags(adev, args-&gt;flags);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_replace_map(adev, bo_va,
              args-&gt;va_address,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    args-&gt;offset_in_bo,
              args-&gt;map_size,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    va_flags);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    va_flags,
              sync_unmap);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>break;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>default:<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>break;<br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h<br>
              index f3ee83cdf97e..28be03f1bbcf 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h<br>
              @@ -67,7 +67,12 @@ struct amdgpu_bo_va_mapping {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              rb_node<span class="Apple-tab-span"
              style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>rb;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>start;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>last;<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>__subtree_last;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>union
              {<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>/*
              BOs in interval tree only */<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>__subtree_last;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>/*
              Freed BOs only */<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>bool<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>sync_unmap;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>};<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>offset;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>flags;<br>
               };<br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
              index 2fd1bfb35916..e71443c8c59b 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
              @@ -276,6 +276,7 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    __field(long,
              last)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    __field(u64,
              offset)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    __field(u64,
              flags)<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    __field(bool,
              sync_unmap)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    ),<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>   TP_fast_assign(<br>
              @@ -284,10 +285,11 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  __entry-&gt;last
              = mapping-&gt;last;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  __entry-&gt;offset
              = mapping-&gt;offset;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  __entry-&gt;flags
              = mapping-&gt;flags;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  __entry-&gt;sync_unmap
              = mapping-&gt;sync_unmap;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  ),<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>   TP_printk("bo=%p,
              start=%lx, last=%lx, offset=%010llx, flags=%llx",<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>   TP_printk("bo=%p,
              start=%lx, last=%lx, offset=%010llx, flags=%llx,
              sync_unmap=%d",<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>     __entry-&gt;bo,
              __entry-&gt;start, __entry-&gt;last,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>     __entry-&gt;offset,
              __entry-&gt;flags)<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>     __entry-&gt;offset,
              __entry-&gt;flags, __entry-&gt;sync_unmap)<br>
               );<br>
                 DECLARE_EVENT_CLASS(amdgpu_vm_mapping,<br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
              index 7b9762f1cddd..a74472e16952 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
              @@ -844,6 +844,7 @@ static void
              amdgpu_vm_tlb_seq_cb(struct dma_fence *fence,<br>
                * @immediate: immediate submission in a page fault<br>
                * @unlocked: unlocked invalidation during MM callback<br>
                * @flush_tlb: trigger tlb invalidation after update
              completed<br>
              + * @sync_unmap: wait for BO users before unmapping<br>
                * @resv: fences we need to sync to<br>
                * @start: start of mapped range<br>
                * @last: last mapped entry<br>
              @@ -861,8 +862,9 @@ static void
              amdgpu_vm_tlb_seq_cb(struct dma_fence *fence,<br>
                */<br>
               int amdgpu_vm_update_range(struct amdgpu_device *adev,
              struct amdgpu_vm *vm,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  bool immediate,
              bool unlocked, bool flush_tlb,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  struct dma_resv
              *resv, uint64_t start, uint64_t last,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  uint64_t flags,
              uint64_t offset, uint64_t vram_base,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  bool sync_unmap,
              struct dma_resv *resv,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  uint64_t start,
              uint64_t last, uint64_t flags,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  uint64_t offset,
              uint64_t vram_base,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  struct
              ttm_resource *res, dma_addr_t *pages_addr,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  struct dma_fence
              **fence)<br>
               {<br>
              @@ -902,7 +904,7 @@ int amdgpu_vm_update_range(struct
              amdgpu_device *adev, struct amdgpu_vm *vm,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>/*
              Implicitly sync to command submissions in the same VM
              before<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>* unmapping. Sync
              to moving fences before mapping.<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>*/<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (!(flags &amp; (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (!(flags &amp; (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT))
              &amp;&amp; sync_unmap)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>sync_mode
              = AMDGPU_SYNC_EQ_OWNER;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>else<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>sync_mode
              = AMDGPU_SYNC_EXPLICIT;<br>
              @@ -1145,10 +1147,10 @@ int amdgpu_vm_bo_update(struct
              amdgpu_device *adev, struct amdgpu_bo_va *bo_va,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>trace_amdgpu_vm_bo_update(mapping);<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_update_range(adev, vm, false, false,
              flush_tlb,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  resv,
              mapping-&gt;start, mapping-&gt;last,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  update_flags,
              mapping-&gt;offset,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  vram_base, mem,
              pages_addr,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  last_update);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  true, resv,
              mapping-&gt;start,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  mapping-&gt;last,
              update_flags,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  mapping-&gt;offset,
              vram_base, mem,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  pages_addr,
              last_update);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>if
              (r)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>return
              r;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>}<br>
              @@ -1340,7 +1342,8 @@ int amdgpu_vm_clear_freed(struct
              amdgpu_device *adev,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>   mapping-&gt;start
              &lt; AMDGPU_GMC_HOLE_START)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>init_pte_value
              = AMDGPU_PTE_DEFAULT_ATC;<br>
               -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_update_range(adev, vm, false, false, true,
              resv,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_update_range(adev, vm, false, false, true,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  mapping-&gt;sync_unmap,
              resv,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  mapping-&gt;start,
              mapping-&gt;last,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  init_pte_value,
              0, 0, NULL, NULL,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  &amp;f);<br>
              @@ -1572,6 +1575,7 @@ int amdgpu_vm_bo_map(struct
              amdgpu_device *adev,<br>
                * @offset: requested offset in the BO<br>
                * @size: BO size in bytes<br>
                * @flags: attributes of pages (read/write/valid/etc.)<br>
              + * @sync_unmap: wait for BO users before replacing
              existing mapping<br>
                *<br>
                * Add a mapping of the BO at the specefied addr into the
              VM. Replace existing<br>
                * mappings as we do so.<br>
              @@ -1582,9 +1586,9 @@ int amdgpu_vm_bo_map(struct
              amdgpu_device *adev,<br>
                * Object has to be reserved and unreserved outside!<br>
                */<br>
               int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    struct
              amdgpu_bo_va *bo_va,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t
              saddr, uint64_t offset,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t size,
              uint64_t flags)<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    struct
              amdgpu_bo_va *bo_va, uint64_t saddr,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t
              offset, uint64_t size, uint64_t flags,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    bool
              sync_unmap)<br>
               {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_bo_va_mapping *mapping;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_bo *bo = bo_va-&gt;base.bo;<br>
              @@ -1608,7 +1612,7 @@ int amdgpu_vm_bo_replace_map(struct
              amdgpu_device *adev,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (!mapping)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>return
              -ENOMEM;<br>
               -<span class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_clear_mappings(adev, bo_va-&gt;base.vm,
              saddr, size);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_bo_clear_mappings(adev, bo_va-&gt;base.vm,
              saddr, size, sync_unmap);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (r) {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>kfree(mapping);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>return
              r;<br>
              @@ -1633,6 +1637,7 @@ int amdgpu_vm_bo_replace_map(struct
              amdgpu_device *adev,<br>
                * @adev: amdgpu_device pointer<br>
                * @bo_va: bo_va to remove the address from<br>
                * @saddr: where to the BO is mapped<br>
              + * @sync_unmap: wait for BO users before unmapping<br>
                *<br>
                * Remove a mapping of the BO at the specefied addr from
              the VM.<br>
                *<br>
              @@ -1641,9 +1646,8 @@ int amdgpu_vm_bo_replace_map(struct
              amdgpu_device *adev,<br>
                *<br>
                * Object has to be reserved and unreserved outside!<br>
                */<br>
              -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>      struct
              amdgpu_bo_va *bo_va,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>      uint64_t
              saddr)<br>
              +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct
              amdgpu_bo_va *bo_va,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>      uint64_t
              saddr, bool sync_unmap)<br>
               {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_bo_va_mapping *mapping;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_vm *vm = bo_va-&gt;base.vm;<br>
              @@ -1671,6 +1675,7 @@ int amdgpu_vm_bo_unmap(struct
              amdgpu_device *adev,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>list_del(&amp;mapping-&gt;list);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>amdgpu_vm_it_remove(mapping,
              &amp;vm-&gt;va);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>mapping-&gt;bo_va
              = NULL;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>mapping-&gt;sync_unmap
              = sync_unmap;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>trace_amdgpu_vm_bo_unmap(bo_va,
              mapping);<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (valid)<br>
              @@ -1689,6 +1694,7 @@ int amdgpu_vm_bo_unmap(struct
              amdgpu_device *adev,<br>
                * @vm: VM structure to use<br>
                * @saddr: start of the range<br>
                * @size: size of the range<br>
              + * @sync_unmap: wait for BO users before unmapping<br>
                *<br>
                * Remove all mappings in a range, split them as
              appropriate.<br>
                *<br>
              @@ -1696,8 +1702,8 @@ int amdgpu_vm_bo_unmap(struct
              amdgpu_device *adev,<br>
                * 0 for success, error for failure.<br>
                */<br>
               int amdgpu_vm_bo_clear_mappings(struct amdgpu_device
              *adev,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_vm *vm,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t
              saddr, uint64_t size)<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_vm *vm, uint64_t saddr,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t
              size, bool sync_unmap)<br>
               {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_bo_va_mapping *before, *after, *tmp, *next;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>LIST_HEAD(removed);<br>
              @@ -1761,6 +1767,7 @@ int
              amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>   tmp-&gt;last =
              eaddr;<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>tmp-&gt;bo_va
              = NULL;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>tmp-&gt;sync_unmap
              = sync_unmap;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>list_add(&amp;tmp-&gt;list,
              &amp;vm-&gt;freed);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>trace_amdgpu_vm_bo_unmap(NULL,
              tmp);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>}<br>
              @@ -1889,6 +1896,7 @@ void amdgpu_vm_bo_del(struct
              amdgpu_device *adev,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>list_del(&amp;mapping-&gt;list);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>amdgpu_vm_it_remove(mapping,
              &amp;vm-&gt;va);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>mapping-&gt;bo_va
              = NULL;<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>mapping-&gt;sync_unmap
              = true;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>trace_amdgpu_vm_bo_unmap(bo_va,
              mapping);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>list_add(&amp;mapping-&gt;list,
              &amp;vm-&gt;freed);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>}<br>
              @@ -2617,8 +2625,9 @@ bool amdgpu_vm_handle_fault(struct
              amdgpu_device *adev, u32 pasid,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>goto
              error_unlock;<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>}<br>
               -<span class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_update_range(adev, vm, true, false, false,
              NULL, addr,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  addr, flags,
              value, 0, NULL, NULL, NULL);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_update_range(adev, vm, true, false, false,
              true, NULL,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  addr, addr,
              flags, value, 0, NULL, NULL,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  NULL);<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>if
              (r)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>goto
              error_unlock;<br>
               diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
              index 204ab13184ed..73b7b49fdb2e 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
              @@ -423,12 +423,12 @@ void amdgpu_vm_bo_base_init(struct
              amdgpu_vm_bo_base *base,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>   struct
              amdgpu_vm *vm, struct amdgpu_bo *bo);<br>
               int amdgpu_vm_update_range(struct amdgpu_device *adev,
              struct amdgpu_vm *vm,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  bool immediate,
              bool unlocked, bool flush_tlb,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  struct dma_resv
              *resv, uint64_t start, uint64_t last,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  uint64_t flags,
              uint64_t offset, uint64_t vram_base,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  bool sync_unmap,
              struct dma_resv *resv,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  uint64_t start,
              uint64_t last, uint64_t flags,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  uint64_t offset,
              uint64_t vram_base,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  struct
              ttm_resource *res, dma_addr_t *pages_addr,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  struct dma_fence
              **fence);<br>
              -int amdgpu_vm_bo_update(struct amdgpu_device *adev,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_bo_va *bo_va,<br>
              +int amdgpu_vm_bo_update(struct amdgpu_device *adev,
              struct amdgpu_bo_va *bo_va,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>bool
              clear);<br>
               bool amdgpu_vm_evictable(struct amdgpu_bo *bo);<br>
               void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,<br>
              @@ -444,15 +444,14 @@ int amdgpu_vm_bo_map(struct
              amdgpu_device *adev,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t addr,
              uint64_t offset,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t size,
              uint64_t flags);<br>
               int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    struct
              amdgpu_bo_va *bo_va,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t addr,
              uint64_t offset,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t size,
              uint64_t flags);<br>
              -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>      struct
              amdgpu_bo_va *bo_va,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>      uint64_t
              addr);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    struct
              amdgpu_bo_va *bo_va, uint64_t addr,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    uint64_t
              offset, uint64_t size, uint64_t flags,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>    bool
              sync_unmap);<br>
              +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct
              amdgpu_bo_va *bo_va,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>      uint64_t
              addr, bool sync_unmap);<br>
               int amdgpu_vm_bo_clear_mappings(struct amdgpu_device
              *adev,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_vm *vm,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t
              saddr, uint64_t size);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>struct
              amdgpu_vm *vm, uint64_t saddr,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>uint64_t
              size, bool sync_unmap);<br>
               struct amdgpu_bo_va_mapping
              *amdgpu_vm_bo_lookup_mapping(struct amdgpu_vm *vm,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>uint64_t addr);<br>
               void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct
              ww_acquire_ctx *ticket);<br>
              diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
              b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>
              index bb16b795d1bc..6eb4a0a4bc84 100644<br>
              --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>
              +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>
              @@ -1291,9 +1291,9 @@ svm_range_unmap_from_gpu(struct
              amdgpu_device *adev, struct amdgpu_vm *vm,<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span>pr_debug("[0x%llx
              0x%llx]\n", start, last);<br>
               -<span class="Apple-tab-span" style="white-space: pre;">	</span>return
              amdgpu_vm_update_range(adev, vm, false, true, true, NULL,
              start,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>     last,
              init_pte_value, 0, 0, NULL, NULL,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>     fence);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span>return
              amdgpu_vm_update_range(adev, vm, false, true, true, true,
              NULL,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>     start, last,
              init_pte_value, 0, 0, NULL,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>     NULL, fence);<br>
               }<br>
                 static int<br>
              @@ -1398,12 +1398,12 @@ svm_range_map_to_gpu(struct
              kfd_process_device *pdd, struct svm_range *prange,<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>* different memory
              partition based on fpfn/lpfn, we should use<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>* same
              vm_manager.vram_base_offset regardless memory partition.<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>*/<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_update_range(adev, vm, false, false,
              flush_tlb, NULL,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  last_start,
              prange-&gt;start + i,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  pte_flags,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  (last_start -
              prange-&gt;start) &lt;&lt; PAGE_SHIFT,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  bo_adev ?
              bo_adev-&gt;vm_manager.vram_base_offset : 0,<br>
              -<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
                class="Apple-converted-space"> </span>  NULL, dma_addr,
              &amp;vm-&gt;last_update);<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>r
              = amdgpu_vm_update_range(<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>adev,
              vm, false, false, flush_tlb, true, NULL,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>last_start,
              prange-&gt;start + i, pte_flags,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>(last_start
              - prange-&gt;start) &lt;&lt; PAGE_SHIFT,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>bo_adev
              ? bo_adev-&gt;vm_manager.vram_base_offset : 0,<br>
              +<span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>NULL,
              dma_addr, &amp;vm-&gt;last_update);<br>
                 <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>for
              (j = last_start - prange-&gt;start; j &lt;= i; j++)<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>dma_addr[j]
              |= last_domain;<br>
              diff --git a/include/uapi/drm/amdgpu_drm.h
              b/include/uapi/drm/amdgpu_drm.h<br>
              index f477eda6a2b8..3cdcc299956e 100644<br>
              --- a/include/uapi/drm/amdgpu_drm.h<br>
              +++ b/include/uapi/drm/amdgpu_drm.h<br>
              @@ -556,6 +556,8 @@ struct drm_amdgpu_gem_op {<br>
               #define AMDGPU_VM_MTYPE_RW<span class="Apple-tab-span"
              style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>(5
              &lt;&lt; 5)<br>
               /* don't allocate MALL */<br>
               #define AMDGPU_VM_PAGE_NOALLOC<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>(1
              &lt;&lt; 9)<br>
              +/* don't sync on unmap */<br>
              +#define AMDGPU_VM_EXPLICIT_SYNC<span
              class="Apple-tab-span" style="white-space: pre;">	</span><span
              class="Apple-tab-span" style="white-space: pre;">	</span>(1
              &lt;&lt; 10)<br>
                 struct drm_amdgpu_gem_va {<br>
               <span class="Apple-tab-span" style="white-space: pre;">	</span>/**
              GEM object handle */</blockquote>
          </div>
        </blockquote>
      </div>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------8coc5cuiSVlNQgzlv9i3ddJo--
