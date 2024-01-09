Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE08288B9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D9A10E45C;
	Tue,  9 Jan 2024 15:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7D710E45C;
 Tue,  9 Jan 2024 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704812961; x=1736348961;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4Nf4+HZEuG1b5VsedD5cJHneqRX7ZjUrsk8TT1RWAJ8=;
 b=IPfFmMrl1przPp5kjl/EOizUONom6mTTE0y2Fld4f818wK6eEAU6r1Ac
 MohzHreZs4oplYjZIsHWWfmQrPqK46iCFYzRzs2RaN0/g5xhuQGSXBNVh
 X7QMxCPUMDgIog0ppK0HcR8E7U5ukSPYg4/lF+clBlXzrz2PG0H5vDWvL
 LtyknLy1iqeQqWhuv2DqM9wrC3eMkG7/v6s6pKI6cGW9nQhnzxI2ni2Oc
 5bITSk595RC6j2CfViT65PmH0MfBchNQWtb5KAcfOLoFkAZl9RqkpuXe4
 jrqGXXeJ4KbLt5kR2rFOSpETvZ8f+V5DNz0KaIZqzxP/2gKwLMEPhg/TT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11714381"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="11714381"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 07:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955049988"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="955049988"
Received: from larnott-mobl1.ger.corp.intel.com (HELO [10.213.222.67])
 ([10.213.222.67])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 07:09:20 -0800
Message-ID: <d0f89a0e-4670-40fd-a4b8-a1fffc6da225@linux.intel.com>
Date: Tue, 9 Jan 2024 15:09:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: add shared fdinfo stats
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-3-alexander.deucher@amd.com>
 <5b231151-45fe-4d65-a9c2-63973267bdba@gmail.com>
 <d2f7c614-228d-490c-9317-8eab0d87ee28@linux.intel.com>
 <ZZ1CGUyMjoN9PkOI@phenom.ffwll.local>
 <1373ca5e-a04a-470f-9b0e-0a7b9e8aa7a7@linux.intel.com>
 <CAKMK7uHs0gxVEE8D1g+14KDZOtN53J32SaCn8NONBr8cVw8AqQ@mail.gmail.com>
 <e9fdf33c-d93e-4120-ba9b-f494c504e047@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e9fdf33c-d93e-4120-ba9b-f494c504e047@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/01/2024 14:57, Christian König wrote:
> Am 09.01.24 um 15:26 schrieb Daniel Vetter:
>> On Tue, 9 Jan 2024 at 14:25, Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>> On 09/01/2024 12:54, Daniel Vetter wrote:
>>>> On Tue, Jan 09, 2024 at 09:30:15AM +0000, Tvrtko Ursulin wrote:
>>>>> On 09/01/2024 07:56, Christian König wrote:
>>>>>> Am 07.12.23 um 19:02 schrieb Alex Deucher:
>>>>>>> Add shared stats.  Useful for seeing shared memory.
>>>>>>>
>>>>>>> v2: take dma-buf into account as well
>>>>>>>
>>>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>>>>>>>     3 files changed, 21 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>>> index 5706b282a0c7..c7df7fa3459f 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>>> @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p,
>>>>>>> struct drm_file *file)
>>>>>>>                stats.requested_visible_vram/1024UL);
>>>>>>>         drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
>>>>>>>                stats.requested_gtt/1024UL);
>>>>>>> +    drm_printf(p, "drm-shared-vram:\t%llu KiB\n",
>>>>>>> stats.vram_shared/1024UL);
>>>>>>> +    drm_printf(p, "drm-shared-gtt:\t%llu KiB\n",
>>>>>>> stats.gtt_shared/1024UL);
>>>>>>> +    drm_printf(p, "drm-shared-cpu:\t%llu KiB\n",
>>>>>>> stats.cpu_shared/1024UL);
>>>>>>> +
>>>>>>>         for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>>>>>>>             if (!usage[hw_ip])
>>>>>>>                 continue;
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>> index d79b4ca1ecfc..1b37d95475b8 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>> @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct 
>>>>>>> amdgpu_bo *bo,
>>>>>>>                   struct amdgpu_mem_stats *stats)
>>>>>>>     {
>>>>>>>         uint64_t size = amdgpu_bo_size(bo);
>>>>>>> +    struct drm_gem_object *obj;
>>>>>>>         unsigned int domain;
>>>>>>> +    bool shared;
>>>>>>>         /* Abort if the BO doesn't currently have a backing store */
>>>>>>>         if (!bo->tbo.resource)
>>>>>>>             return;
>>>>>>> +    obj = &bo->tbo.base;
>>>>>>> +    shared = (obj->handle_count > 1) || obj->dma_buf;
>>>>>> I still think that looking at handle_count is the completely wrong
>>>>>> approach, we should really only look at obj->dma_buf.
>>>>> Yeah it is all a bit tricky with the handle table walk. I don't 
>>>>> think it is
>>>>> even possible to claim it is shared with obj->dma_buf could be the 
>>>>> same
>>>>> process creating say via udmabuf and importing into drm. It is a wild
>>>>> scenario yes, but it could be private memory in that case. Not sure 
>>>>> where it
>>>>> would leave us if we said this is just a limitation of a BO based 
>>>>> tracking.
>>>>>
>>>>> Would adding a new category "imported" help?
>>>>>
>>>>> Hmm or we simply change drm-usage-stats.rst:
>>>>>
>>>>> """
>>>>> - drm-shared-<region>: <uint> [KiB|MiB]
>>>>>
>>>>> The total size of buffers that are shared with another file (ie. 
>>>>> have more
>>>>> than than a single handle).
>>>>> """
>>>>>
>>>>> Changing ie into eg coule be get our of jail free card to allow the
>>>>> "(obj->handle_count > 1) || obj->dma_buf;" condition?
>>>>>
>>>>> Because of the shared with another _file_ wording would cover my wild
>>>>> udmabuf self-import case. Unless there are more such creative 
>>>>> private import
>>>>> options.
>>>> Yeah I think clarifying that we can only track sharing with other fd 
>>>> and
>>>> have no idea whether this means sharing with another process or not is
>>>> probably simplest. Maybe not exactly what users want, but still the
>>>> roughly best-case approximation we can deliver somewhat cheaply.
>>>>
>>>> Also maybe time for a drm_gem_buffer_object_is_shared() helper so we 
>>>> don't
>>>> copypaste this all over and then end up in divergent conditions? I'm
>>>> guessing that there's going to be a bunch of drivers which needs this
>>>> little helper to add drm-shared-* stats to their fdinfo ...
>>> Yeah I agree that works and i915 would need to use the helper too.
>>>
>>> I would only suggest to name it so the meaning of shared is obviously
>>> only about the fdinfo memory stats and no one gets a more meaningful
>>> idea about its semantics.
>>>
>>> We have drm_show_memory_stats and drm_print_memory_stats exported so
>>> perhaps something like drm_object_is_shared_for_memory_stats,
>>> drm_object_is_memory_stats_shared, drm_memory_stats_object_is_shared?
> 
> + for drm_object_is_shared_for_memory_stats().

Hmmm although I probably meant to write 
drm_gem_object_is_shared_for_memory_stats. Since drm_mode_object seems 
to have claimed the drm_object_ function name space.

>>> And s/ie/eg/ in the above quoted drm-usage-stats.rst.
>> Ack on making it clear this helper would be for fdinfo memory stats
>> only. Sounds like a good idea to stop people from finding really
>> creative uses ...
> 
> It's astonishing how defensive the development process has become :)

A bit. :) But probably justified in this case.

Regards,

Tvrtko

> 
> Cheers,
> Christian.
> 
>> -Sima
>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Cheers, Sima
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> +
>>>>>>>         domain = 
>>>>>>> amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
>>>>>>>         switch (domain) {
>>>>>>>         case AMDGPU_GEM_DOMAIN_VRAM:
>>>>>>>             stats->vram += size;
>>>>>>>             if (amdgpu_bo_in_cpu_visible_vram(bo))
>>>>>>>                 stats->visible_vram += size;
>>>>>>> +        if (shared)
>>>>>>> +            stats->vram_shared += size;
>>>>>>>             break;
>>>>>>>         case AMDGPU_GEM_DOMAIN_GTT:
>>>>>>>             stats->gtt += size;
>>>>>>> +        if (shared)
>>>>>>> +            stats->gtt_shared += size;
>>>>>>>             break;
>>>>>>>         case AMDGPU_GEM_DOMAIN_CPU:
>>>>>>>         default:
>>>>>>>             stats->cpu += size;
>>>>>>> +        if (shared)
>>>>>>> +            stats->cpu_shared += size;
>>>>>>>             break;
>>>>>>>         }
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>>> index d28e21baef16..0503af75dc26 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>>> @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
>>>>>>>     struct amdgpu_mem_stats {
>>>>>>>         /* current VRAM usage, includes visible VRAM */
>>>>>>>         uint64_t vram;
>>>>>>> +    /* current shared VRAM usage, includes visible VRAM */
>>>>>>> +    uint64_t vram_shared;
>>>>>>>         /* current visible VRAM usage */
>>>>>>>         uint64_t visible_vram;
>>>>>>>         /* current GTT usage */
>>>>>>>         uint64_t gtt;
>>>>>>> +    /* current shared GTT usage */
>>>>>>> +    uint64_t gtt_shared;
>>>>>>>         /* current system memory usage */
>>>>>>>         uint64_t cpu;
>>>>>>> +    /* current shared system memory usage */
>>>>>>> +    uint64_t cpu_shared;
>>>>>>>         /* sum of evicted buffers, includes visible VRAM */
>>>>>>>         uint64_t evicted_vram;
>>>>>>>         /* sum of evicted buffers due to CPU access */
>>
>>
> 
