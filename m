Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BCE828892
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 15:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9C310E454;
	Tue,  9 Jan 2024 14:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253FB10E40C;
 Tue,  9 Jan 2024 14:57:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso36402505e9.2; 
 Tue, 09 Jan 2024 06:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704812227; x=1705417027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TYBv+2FGF18Jywk0oqhiGZR9MA+ZyF7X4R2qUqcuIV8=;
 b=QGpnDxJUFZq1f8WQn5hFKTyIBRPhTg9t4y3/Fl13x87+IWi0vqbVG0WeqwxGa09gEW
 75kABFA2Drzv4n8tuB66YvK6b2Y17sFOM+GdVA4ORJoTgbWjDHj7crLwsubeqHdEpQfk
 l0QDPYj6X4hpdS7+OljLuzNuBEjSmpHw+ciOJlyIlmtOrrMU7ir+bJdwBNAQHkqRylec
 WIAA01jihmoCA6fybObckl/wpubF8dEEF0fMIMQ5hK+WSGYBBQnNPJ7blid/ukLUVrGE
 zb8fykWQMygRr1oSbBUIkcFhhRZB/qszlvpxxHrZG9BRbbz7BvKTaLYm1/UZhKIeElKL
 VNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704812227; x=1705417027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYBv+2FGF18Jywk0oqhiGZR9MA+ZyF7X4R2qUqcuIV8=;
 b=gmZHbd+LAjpmTIyCtR6gneJ8GmygV7fxw2Y3eNpqGq7+wZ0ErY+m42m3SxkwnpK6Cp
 jBpUzI/OVRDFwHyM+IZx+2FARNrNlVQegB42Kam/nh6/PI+4CfVsp9iqMkMRv2UHJH33
 rpKcoqQBNY0Lh6oo1JG/wL92Jzdb+64G2aNVqKDVdmLuu+y2ExAyQT/Lt/WUYZmHRkSY
 op/78D7Dd2ct20aej9lPVZ2sDc8oI0tM2gtmXiSdEj8tLoe47IbGlTfvADSJg2+/Hh78
 Dh2Hg8gVYP0sNPF9hqtmCDbPdaoVg2xsofQf8DFIjXXLyBrvp2y5gtPvG7/0k/sxAF4r
 kEAA==
X-Gm-Message-State: AOJu0YxDP657dseetY8O0ZjNxqrdOnQR5agvUTg9juh6wMbdglufnJqP
 mOMbn9A1BYgirNaEHbviefg=
X-Google-Smtp-Source: AGHT+IHKSjCNfi7aCesqFY9h+d29wewoc/J8VesiZGEqkJXFbvtJGjc2QPu1dz8NWAj/qDTtEc+2AA==
X-Received: by 2002:a05:600c:a4b:b0:40d:92c9:da8c with SMTP id
 c11-20020a05600c0a4b00b0040d92c9da8cmr2071142wmq.161.1704812227224; 
 Tue, 09 Jan 2024 06:57:07 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4688000000b0033725783839sm2596007wrq.110.2024.01.09.06.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 06:57:06 -0800 (PST)
Message-ID: <e9fdf33c-d93e-4120-ba9b-f494c504e047@gmail.com>
Date: Tue, 9 Jan 2024 15:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: add shared fdinfo stats
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-3-alexander.deucher@amd.com>
 <5b231151-45fe-4d65-a9c2-63973267bdba@gmail.com>
 <d2f7c614-228d-490c-9317-8eab0d87ee28@linux.intel.com>
 <ZZ1CGUyMjoN9PkOI@phenom.ffwll.local>
 <1373ca5e-a04a-470f-9b0e-0a7b9e8aa7a7@linux.intel.com>
 <CAKMK7uHs0gxVEE8D1g+14KDZOtN53J32SaCn8NONBr8cVw8AqQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAKMK7uHs0gxVEE8D1g+14KDZOtN53J32SaCn8NONBr8cVw8AqQ@mail.gmail.com>
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

Am 09.01.24 um 15:26 schrieb Daniel Vetter:
> On Tue, 9 Jan 2024 at 14:25, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> On 09/01/2024 12:54, Daniel Vetter wrote:
>>> On Tue, Jan 09, 2024 at 09:30:15AM +0000, Tvrtko Ursulin wrote:
>>>> On 09/01/2024 07:56, Christian König wrote:
>>>>> Am 07.12.23 um 19:02 schrieb Alex Deucher:
>>>>>> Add shared stats.  Useful for seeing shared memory.
>>>>>>
>>>>>> v2: take dma-buf into account as well
>>>>>>
>>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>>>>>>     3 files changed, 21 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>> index 5706b282a0c7..c7df7fa3459f 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>>>> @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p,
>>>>>> struct drm_file *file)
>>>>>>                stats.requested_visible_vram/1024UL);
>>>>>>         drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
>>>>>>                stats.requested_gtt/1024UL);
>>>>>> +    drm_printf(p, "drm-shared-vram:\t%llu KiB\n",
>>>>>> stats.vram_shared/1024UL);
>>>>>> +    drm_printf(p, "drm-shared-gtt:\t%llu KiB\n",
>>>>>> stats.gtt_shared/1024UL);
>>>>>> +    drm_printf(p, "drm-shared-cpu:\t%llu KiB\n",
>>>>>> stats.cpu_shared/1024UL);
>>>>>> +
>>>>>>         for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>>>>>>             if (!usage[hw_ip])
>>>>>>                 continue;
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>> index d79b4ca1ecfc..1b37d95475b8 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>> @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>>>>>>                   struct amdgpu_mem_stats *stats)
>>>>>>     {
>>>>>>         uint64_t size = amdgpu_bo_size(bo);
>>>>>> +    struct drm_gem_object *obj;
>>>>>>         unsigned int domain;
>>>>>> +    bool shared;
>>>>>>         /* Abort if the BO doesn't currently have a backing store */
>>>>>>         if (!bo->tbo.resource)
>>>>>>             return;
>>>>>> +    obj = &bo->tbo.base;
>>>>>> +    shared = (obj->handle_count > 1) || obj->dma_buf;
>>>>> I still think that looking at handle_count is the completely wrong
>>>>> approach, we should really only look at obj->dma_buf.
>>>> Yeah it is all a bit tricky with the handle table walk. I don't think it is
>>>> even possible to claim it is shared with obj->dma_buf could be the same
>>>> process creating say via udmabuf and importing into drm. It is a wild
>>>> scenario yes, but it could be private memory in that case. Not sure where it
>>>> would leave us if we said this is just a limitation of a BO based tracking.
>>>>
>>>> Would adding a new category "imported" help?
>>>>
>>>> Hmm or we simply change drm-usage-stats.rst:
>>>>
>>>> """
>>>> - drm-shared-<region>: <uint> [KiB|MiB]
>>>>
>>>> The total size of buffers that are shared with another file (ie. have more
>>>> than than a single handle).
>>>> """
>>>>
>>>> Changing ie into eg coule be get our of jail free card to allow the
>>>> "(obj->handle_count > 1) || obj->dma_buf;" condition?
>>>>
>>>> Because of the shared with another _file_ wording would cover my wild
>>>> udmabuf self-import case. Unless there are more such creative private import
>>>> options.
>>> Yeah I think clarifying that we can only track sharing with other fd and
>>> have no idea whether this means sharing with another process or not is
>>> probably simplest. Maybe not exactly what users want, but still the
>>> roughly best-case approximation we can deliver somewhat cheaply.
>>>
>>> Also maybe time for a drm_gem_buffer_object_is_shared() helper so we don't
>>> copypaste this all over and then end up in divergent conditions? I'm
>>> guessing that there's going to be a bunch of drivers which needs this
>>> little helper to add drm-shared-* stats to their fdinfo ...
>> Yeah I agree that works and i915 would need to use the helper too.
>>
>> I would only suggest to name it so the meaning of shared is obviously
>> only about the fdinfo memory stats and no one gets a more meaningful
>> idea about its semantics.
>>
>> We have drm_show_memory_stats and drm_print_memory_stats exported so
>> perhaps something like drm_object_is_shared_for_memory_stats,
>> drm_object_is_memory_stats_shared, drm_memory_stats_object_is_shared?

+ for drm_object_is_shared_for_memory_stats().

>>
>> And s/ie/eg/ in the above quoted drm-usage-stats.rst.
> Ack on making it clear this helper would be for fdinfo memory stats
> only. Sounds like a good idea to stop people from finding really
> creative uses ...

It's astonishing how defensive the development process has become :)

Cheers,
Christian.

> -Sima
>
>> Regards,
>>
>> Tvrtko
>>
>>> Cheers, Sima
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> +
>>>>>>         domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
>>>>>>         switch (domain) {
>>>>>>         case AMDGPU_GEM_DOMAIN_VRAM:
>>>>>>             stats->vram += size;
>>>>>>             if (amdgpu_bo_in_cpu_visible_vram(bo))
>>>>>>                 stats->visible_vram += size;
>>>>>> +        if (shared)
>>>>>> +            stats->vram_shared += size;
>>>>>>             break;
>>>>>>         case AMDGPU_GEM_DOMAIN_GTT:
>>>>>>             stats->gtt += size;
>>>>>> +        if (shared)
>>>>>> +            stats->gtt_shared += size;
>>>>>>             break;
>>>>>>         case AMDGPU_GEM_DOMAIN_CPU:
>>>>>>         default:
>>>>>>             stats->cpu += size;
>>>>>> +        if (shared)
>>>>>> +            stats->cpu_shared += size;
>>>>>>             break;
>>>>>>         }
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>> index d28e21baef16..0503af75dc26 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>>>> @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
>>>>>>     struct amdgpu_mem_stats {
>>>>>>         /* current VRAM usage, includes visible VRAM */
>>>>>>         uint64_t vram;
>>>>>> +    /* current shared VRAM usage, includes visible VRAM */
>>>>>> +    uint64_t vram_shared;
>>>>>>         /* current visible VRAM usage */
>>>>>>         uint64_t visible_vram;
>>>>>>         /* current GTT usage */
>>>>>>         uint64_t gtt;
>>>>>> +    /* current shared GTT usage */
>>>>>> +    uint64_t gtt_shared;
>>>>>>         /* current system memory usage */
>>>>>>         uint64_t cpu;
>>>>>> +    /* current shared system memory usage */
>>>>>> +    uint64_t cpu_shared;
>>>>>>         /* sum of evicted buffers, includes visible VRAM */
>>>>>>         uint64_t evicted_vram;
>>>>>>         /* sum of evicted buffers due to CPU access */
>
>

