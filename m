Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20E549B23
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 20:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AAF10F449;
	Mon, 13 Jun 2022 18:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C276E10F0DC;
 Mon, 13 Jun 2022 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655143768; x=1686679768;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uni21d2WEDOoZtZW5l47kxD0Coma5Oqk91wphfklYX0=;
 b=ZmYfn86mcnlkI+4N6ZL3SOrkTHCilw1ChpNSHpH+Trozh3DL0owmagtx
 nFgiIzXTNLUEs9NMYkzYUeDSAF7mZEfLMf/55PrVY71RvjVnxVA2X+wY5
 nTr1zPQ9cmjIblxqs36QK4pdEWlOnpcXoE+Q8Bd30JLTONspbqzc0hjg5
 zuzLnN3DrRO3+m5sjCFAgJ7VAaQgyT3Z+/r1uCjWhhvXcs4iDpR7lz/yw
 LMwClriTTj+7jyI2XHCqeDJXspROQkFe9p1UJUxhrEtE20gRmu2SWMc+9
 P7SngaRFX9cQRuzkePBwPnWbZcFbStZzdLyVbYszLAOoRfWecPMhcPTre Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="364695760"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="364695760"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 11:09:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="651553638"
Received: from npower-mobl.ger.corp.intel.com (HELO [10.213.222.108])
 ([10.213.222.108])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 11:09:07 -0700
Message-ID: <5ebcd237-a6df-add2-070a-056ccb83427a@linux.intel.com>
Date: Mon, 13 Jun 2022 19:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220610070711.32407-1-niranjana.vishwanathapura@intel.com>
 <20220610070711.32407-4-niranjana.vishwanathapura@intel.com>
 <9b7c4864-18c2-5c70-009a-1c6e7843bf0d@linux.intel.com>
 <9043381e-ff63-934b-4576-132f15c2e363@intel.com>
 <20220610161420.GB376@nvishwa1-DESK>
 <b5292e01-5a1f-d339-cbb4-e565e07e4437@linux.intel.com>
 <20220613150551.GG376@nvishwa1-DESK>
 <459c327d-5796-f9e4-4442-a51714525c73@linux.intel.com>
 <20220613174956.GH376@nvishwa1-DESK>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220613174956.GH376@nvishwa1-DESK>
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
Cc: paulo.r.zanoni@intel.com, Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 thomas.hellstrom@intel.com, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, daniel.vetter@intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/06/2022 18:49, Niranjana Vishwanathapura wrote:
> On Mon, Jun 13, 2022 at 05:22:02PM +0100, Tvrtko Ursulin wrote:
>>
>> On 13/06/2022 16:05, Niranjana Vishwanathapura wrote:
>>> On Mon, Jun 13, 2022 at 09:24:18AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 10/06/2022 17:14, Niranjana Vishwanathapura wrote:
>>>>> On Fri, Jun 10, 2022 at 05:48:39PM +0300, Lionel Landwerlin wrote:
>>>>>> On 10/06/2022 13:37, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 10/06/2022 08:07, Niranjana Vishwanathapura wrote:
>>>>>>>> VM_BIND and related uapi definitions
>>>>>>>>
>>>>>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>>>>>> <niranjana.vishwanathapura@intel.com>
>>>>>>>> ---
>>>>>>>>   Documentation/gpu/rfc/i915_vm_bind.h | 490 
>>>>>>>> +++++++++++++++++++++++++++
>>>>>>>>   1 file changed, 490 insertions(+)
>>>>>>>>   create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>>>>>>>>
>>>>>>>> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h 
>>>>>>>> b/Documentation/gpu/rfc/i915_vm_bind.h
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..9fc854969cfb
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
>>>>>>>> @@ -0,0 +1,490 @@
>>>>>>>> +/* SPDX-License-Identifier: MIT */
>>>>>>>> +/*
>>>>>>>> + * Copyright © 2022 Intel Corporation
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * DOC: I915_PARAM_HAS_VM_BIND
>>>>>>>> + *
>>>>>>>> + * VM_BIND feature availability.
>>>>>>>> + * See typedef drm_i915_getparam_t param.
>>>>>>>> + * bit[0]: If set, VM_BIND is supported, otherwise not.
>>>>>>>> + * bits[8-15]: VM_BIND implementation version.
>>>>>>>> + * version 0 will not have VM_BIND/UNBIND timeline fence array 
>>>>>>>> support.
>>>>>>>> + */
>>>>>>>> +#define I915_PARAM_HAS_VM_BIND        57
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
>>>>>>>> + *
>>>>>>>> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
>>>>>>>> + * See struct drm_i915_gem_vm_control flags.
>>>>>>>> + *
>>>>>>>> + * The older execbuf2 ioctl will not support VM_BIND mode of 
>>>>>>>> operation.
>>>>>>>> + * For VM_BIND mode, we have new execbuf3 ioctl which will not 
>>>>>>>> accept any
>>>>>>>> + * execlist (See struct drm_i915_gem_execbuffer3 for more 
>>>>>>>> details).
>>>>>>>> + *
>>>>>>>> + */
>>>>>>>> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND    (1 << 0)
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * DOC: I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING
>>>>>>>> + *
>>>>>>>> + * Flag to declare context as long running.
>>>>>>>> + * See struct drm_i915_gem_context_create_ext flags.
>>>>>>>> + *
>>>>>>>> + * Usage of dma-fence expects that they complete in reasonable 
>>>>>>>> amount of time.
>>>>>>>> + * Compute on the other hand can be long running. Hence it is 
>>>>>>>> not appropriate
>>>>>>>> + * for compute contexts to export request completion dma-fence 
>>>>>>>> to user.
>>>>>>>> + * The dma-fence usage will be limited to in-kernel consumption 
>>>>>>>> only.
>>>>>>>> + * Compute contexts need to use user/memory fence.
>>>>>>>> + *
>>>>>>>> + * So, long running contexts do not support output fences. Hence,
>>>>>>>> + * I915_EXEC_FENCE_SIGNAL (See &drm_i915_gem_exec_fence.flags) 
>>>>>>>> is expected
>>>>>>>> + * to be not used. DRM_I915_GEM_WAIT ioctl call is also not 
>>>>>>>> supported for
>>>>>>>> + * objects mapped to long running contexts.
>>>>>>>> + */
>>>>>>>> +#define I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING   (1u << 2)
>>>>>>>> +
>>>>>>>> +/* VM_BIND related ioctls */
>>>>>>>> +#define DRM_I915_GEM_VM_BIND        0x3d
>>>>>>>> +#define DRM_I915_GEM_VM_UNBIND        0x3e
>>>>>>>> +#define DRM_I915_GEM_EXECBUFFER3    0x3f
>>>>>>>> +#define DRM_I915_GEM_WAIT_USER_FENCE    0x40
>>>>>>>> +
>>>>>>>> +#define DRM_IOCTL_I915_GEM_VM_BIND DRM_IOWR(DRM_COMMAND_BASE + 
>>>>>>>> DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
>>>>>>>> +#define DRM_IOCTL_I915_GEM_VM_UNBIND DRM_IOWR(DRM_COMMAND_BASE 
>>>>>>>> + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
>>>>>>>> +#define DRM_IOCTL_I915_GEM_EXECBUFFER3 
>>>>>>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct 
>>>>>>>> drm_i915_gem_execbuffer3)
>>>>>>>> +#define DRM_IOCTL_I915_GEM_WAIT_USER_FENCE 
>>>>>>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_WAIT_USER_FENCE, struct 
>>>>>>>> drm_i915_gem_wait_user_fence)
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>>>>>>> + *
>>>>>>>> + * This structure is passed to VM_BIND ioctl and specifies the 
>>>>>>>> mapping of GPU
>>>>>>>> + * virtual address (VA) range to the section of an object that 
>>>>>>>> should be bound
>>>>>>>> + * in the device page table of the specified address space (VM).
>>>>>>>> + * The VA range specified must be unique (ie., not currently 
>>>>>>>> bound) and can
>>>>>>>> + * be mapped to whole object or a section of the object 
>>>>>>>> (partial binding).
>>>>>>>> + * Multiple VA mappings can be created to the same section of 
>>>>>>>> the object
>>>>>>>> + * (aliasing).
>>>>>>>> + *
>>>>>>>> + * The @queue_idx specifies the queue to use for binding. Same 
>>>>>>>> queue can be
>>>>>>>> + * used for both VM_BIND and VM_UNBIND calls. All submitted 
>>>>>>>> bind and unbind
>>>>>>>> + * operations in a queue are performed in the order of submission.
>>>>>>>> + *
>>>>>>>> + * The @start, @offset and @length should be 4K page aligned. 
>>>>>>>> However the DG2
>>>>>>>> + * and XEHPSDV has 64K page size for device local-memory and 
>>>>>>>> has compact page
>>>>>>>> + * table. On those platforms, for binding device local-memory 
>>>>>>>> objects, the
>>>>>>>> + * @start should be 2M aligned, @offset and @length should be 
>>>>>>>> 64K aligned.
>>>>>>>> + * Also, on those platforms, it is not allowed to bind an 
>>>>>>>> device local-memory
>>>>>>>> + * object and a system memory object in a single 2M section of 
>>>>>>>> VA range.
>>>>>>>> + */
>>>>>>>> +struct drm_i915_gem_vm_bind {
>>>>>>>> +    /** @vm_id: VM (address space) id to bind */
>>>>>>>> +    __u32 vm_id;
>>>>>>>> +
>>>>>>>> +    /** @queue_idx: Index of queue for binding */
>>>>>>>> +    __u32 queue_idx;
>>>>>>>
>>>>>>> I have a question here to which I did not find an answer by 
>>>>>>> browsing the old threads.
>>>>>>>
>>>>>>> Queue index appears to be an implicit synchronisation mechanism, 
>>>>>>> right? Operations on the same index are executed/complete in 
>>>>>>> order of ioctl submission?
>>>>>>>
>>>>>>> Do we _have_ to implement this on the kernel side and could just 
>>>>>>> allow in/out fence and let userspace deal with it?
>>>>>>
>>>>>>
>>>>>> It orders operations like in a queue. Which is kind of what 
>>>>>> happens with existing queues/engines.
>>>>>>
>>>>>> If I understood correctly, it's going to be a kthread + a linked 
>>>>>> list right?
>>>>>>
>>>>>
>>>>> Yes, that is correct.
>>>>>
>>>>>>
>>>>>> -Lionel
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Arbitrary/on-demand number of queues will add the complexity on 
>>>>>>> the kernel side which should be avoided if possible.
>>>>>>>
>>>>>
>>>>> It was discussed in the other thread. Jason prefers this over putting
>>>>> an artificial limit on number of queues (as user can anyway can 
>>>>> exhaust
>>>>> the memory). I think complexity in the driver is manageable.
>>>>
>>>> You'll need to create tracking structures on demand, with atomic 
>>>> replace of last fence, ref counting and locking of some sort, more 
>>>> or less?
>>>>
>>>
>>> We will have a workqueue, an work item and a linked list per queue.
>>> VM_BIND/UNBIND call will add the mapping request to the specified 
>>> queue's
>>> linked list and schedule the work item on the workqueue of that queue.
>>> I am not sure what you mean by last fence and replacing it.
>>>
>>>>> The other option being discussed in to have the user create those
>>>>> queues (like creating engine map) before hand and use that in vm_bind
>>>>> and vm_unbind ioctls. This puts a limit on the number of queues.
>>>>> But it is not clean either and not sure it is worth making the 
>>>>> interface
>>>>> more complex.
>>>>> https://www.spinics.net/lists/dri-devel/msg350448.html
>>>>
>>>> What about the third option of a flag to return a fence (of some 
>>>> sort) and pass in a fence? That way userspace can imagine zero or N 
>>>> queues with very little effort on the kernel side. Was this considered?
>>>>
>>>
>>> I am not clear what fence you are talking about here and how does that
>>> help with the number of vm_bind queues. Can you eloborate?
>>
>> It is actually already documented that bind/unbind will support input 
>> and output fences - so what are these queues on top of what userspace 
>> can already achieve by using them? Purely a convenience or there is 
>> more to it?
>>
> 
> Oh, the vm_bind queues are discussed in this thread.
> https://lists.freedesktop.org/archives/intel-gfx/2022-June/299217.html
> 
> Apparently Vulkan has requirement for multiple queues, each queue
> processing vm_bind/unbind calls in the order of submission.

I don't see how that answers my question so I will take the freedom to 
repeat it. What are these queues on top of what userspace can already 
achieve by using in-out fences? Purely a convenience or there is more to it?

Queue1:

out_fence_A = vm_bind A
out_fence_B = vm_bind B, in_fence=out_fence_A
execbuf(in_fence = out_fence_B)

Queue2:

out_fence_C = vm_bind C
out_fence_D = vm_bind D, in_fence=out_fence_C
execbuf(in_fence = out_fence_D)

Parallel bind:
out_fence_E = vm_bind E
out_fence_F = vm_bind F
merged_fence = fence_merge(out_fence_E, out_fence_F)
execbuf(in_fence = merged_fence)

Regards,

Tvrtko
