Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CF562D85
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA0F10E80E;
	Fri,  1 Jul 2022 08:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A229B10E7FA;
 Fri,  1 Jul 2022 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656663101; x=1688199101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JR3DN4Lp57bGzJfwv/mWZk0WHvWjgMLhidn4M6IVLjI=;
 b=JeSz2HxdPEzQCE3TwAgKlcfZWyhQoYQviBEorkMUL82SEzO4UHlDcD9B
 q4Cbps3cItyM+/ovCWEdeJvInXhd+TPApxEpuz1rAEQ8rSAih82DK8Z9T
 HfmC7ckxWQqgOurEJ1zfcgUmhg9lX6fYIcX+ow7/EIWVB06rgXYIfuef2
 oYp0OQyXjWRaqOxYjj9SYMGJet0/J8fSvV4BpUbwEKMkuCet5NfWjJw8J
 T7neh/ezsBD7bbD1iIy53NSXh+JsMhCMXSqkjvp995FHBMrIDg+L2wEOV
 KBIgMh4ZWuZQyz64M2ijMMBQtAfVWZHdLor1UlPEDx/lPUZxmdDiT50Jm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="283319355"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="283319355"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:11:41 -0700
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="681314538"
Received: from vibhutes-mobl.ger.corp.intel.com (HELO [10.213.192.227])
 ([10.213.192.227])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:11:38 -0700
Message-ID: <ed53eab0-5114-d356-4c1f-661f970d5e7b@linux.intel.com>
Date: Fri, 1 Jul 2022 09:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v6 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
 <20220626014916.5130-4-niranjana.vishwanathapura@intel.com>
 <d805c4bfb11acd1f9271a72650f39174be30501c.camel@intel.com>
 <20220630060820.GB14039@nvishwa1-DESK>
 <c68da0dd-cd58-9be6-2a9b-ed1d2f3e0297@linux.intel.com>
 <20220630162218.GG14039@nvishwa1-DESK>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220630162218.GG14039@nvishwa1-DESK>
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/06/2022 17:22, Niranjana Vishwanathapura wrote:
> On Thu, Jun 30, 2022 at 08:59:09AM +0100, Tvrtko Ursulin wrote:
>>
>> On 30/06/2022 07:08, Niranjana Vishwanathapura wrote:
>>> On Wed, Jun 29, 2022 at 05:33:49PM -0700, Zanoni, Paulo R wrote:
>>>> On Sat, 2022-06-25 at 18:49 -0700, Niranjana Vishwanathapura wrote:
>>>>> VM_BIND and related uapi definitions
>>>>>
>>>>> v2: Reduce the scope to simple Mesa use case.
>>>>> v3: Expand VM_UNBIND documentation and add
>>>>>     I915_GEM_VM_BIND/UNBIND_FENCE_VALID
>>>>>     and I915_GEM_VM_BIND_TLB_FLUSH flags.
>>>>> v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional
>>>>>     documentation for vm_bind/unbind.
>>>>> v5: Remove TLB flush requirement on VM_UNBIND.
>>>>>     Add version support to stage implementation.
>>>>> v6: Define and use drm_i915_gem_timeline_fence structure for
>>>>>     all timeline fences.
>>>>> v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.
>>>>>     Update documentation on async vm_bind/unbind and versioning.
>>>>>     Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3
>>>>>     batch_count field and I915_EXEC3_SECURE flag.
>>>>>
>>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>>> <niranjana.vishwanathapura@intel.com>
>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> ---
>>>>>  Documentation/gpu/rfc/i915_vm_bind.h | 280 
>>>>> +++++++++++++++++++++++++++
>>>>>  1 file changed, 280 insertions(+)
>>>>>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>>>>>
>>>>> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h 
>>>>> b/Documentation/gpu/rfc/i915_vm_bind.h
>>>>> new file mode 100644
>>>>> index 000000000000..a93e08bceee6
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
>>>>> @@ -0,0 +1,280 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2022 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +/**
>>>>> + * DOC: I915_PARAM_VM_BIND_VERSION
>>>>> + *
>>>>> + * VM_BIND feature version supported.
>>>>> + * See typedef drm_i915_getparam_t param.
>>>>> + *
>>>>> + * Specifies the VM_BIND feature version supported.
>>>>> + * The following versions of VM_BIND have been defined:
>>>>> + *
>>>>> + * 0: No VM_BIND support.
>>>>> + *
>>>>> + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings 
>>>>> created
>>>>> + *    previously with VM_BIND, the ioctl will not support 
>>>>> unbinding multiple
>>>>> + *    mappings or splitting them. Similarly, VM_BIND calls will 
>>>>> not replace
>>>>> + *    any existing mappings.
>>>>> + *
>>>>> + * 2: The restrictions on unbinding partial or multiple mappings is
>>>>> + *    lifted, Similarly, binding will replace any mappings in the 
>>>>> given range.
>>>>> + *
>>>>> + * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
>>>>> + */
>>>>> +#define I915_PARAM_VM_BIND_VERSION   57
>>>>> +
>>>>> +/**
>>>>> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
>>>>> + *
>>>>> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
>>>>> + * See struct drm_i915_gem_vm_control flags.
>>>>> + *
>>>>> + * The older execbuf2 ioctl will not support VM_BIND mode of 
>>>>> operation.
>>>>> + * For VM_BIND mode, we have new execbuf3 ioctl which will not 
>>>>> accept any
>>>>> + * execlist (See struct drm_i915_gem_execbuffer3 for more details).
>>>>> + */
>>>>> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND     (1 << 0)
>>>>> +
>>>>> +/* VM_BIND related ioctls */
>>>>> +#define DRM_I915_GEM_VM_BIND         0x3d
>>>>> +#define DRM_I915_GEM_VM_UNBIND               0x3e
>>>>> +#define DRM_I915_GEM_EXECBUFFER3     0x3f
>>>>> +
>>>>> +#define DRM_IOCTL_I915_GEM_VM_BIND DRM_IOWR(DRM_COMMAND_BASE + 
>>>>> DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
>>>>> +#define DRM_IOCTL_I915_GEM_VM_UNBIND DRM_IOWR(DRM_COMMAND_BASE + 
>>>>> DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
>>>>> +#define DRM_IOCTL_I915_GEM_EXECBUFFER3 DRM_IOWR(DRM_COMMAND_BASE + 
>>>>> DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
>>>>> +
>>>>> +/**
>>>>> + * struct drm_i915_gem_timeline_fence - An input or output 
>>>>> timeline fence.
>>>>> + *
>>>>> + * The operation will wait for input fence to signal.
>>>>> + *
>>>>> + * The returned output fence will be signaled after the completion 
>>>>> of the
>>>>> + * operation.
>>>>> + */
>>>>> +struct drm_i915_gem_timeline_fence {
>>>>> +     /** @handle: User's handle for a drm_syncobj to wait on or 
>>>>> signal. */
>>>>> +     __u32 handle;
>>>>> +
>>>>> +     /**
>>>>> +      * @flags: Supported flags are:
>>>>> +      *
>>>>> +      * I915_TIMELINE_FENCE_WAIT:
>>>>> +      * Wait for the input fence before the operation.
>>>>> +      *
>>>>> +      * I915_TIMELINE_FENCE_SIGNAL:
>>>>> +      * Return operation completion fence as output.
>>>>> +      */
>>>>> +     __u32 flags;
>>>>> +#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
>>>>> +#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
>>>>> +#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS 
>>>>> (-(I915_TIMELINE_FENCE_SIGNAL << 1))
>>>>> +
>>>>> +     /**
>>>>> +      * @value: A point in the timeline.
>>>>> +      * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>>>>> +      * timeline drm_syncobj is invalid as it turns a drm_syncobj 
>>>>> into a
>>>>> +      * binary one.
>>>>> +      */
>>>>> +     __u64 value;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>>>> + *
>>>>> + * This structure is passed to VM_BIND ioctl and specifies the 
>>>>> mapping of GPU
>>>>> + * virtual address (VA) range to the section of an object that 
>>>>> should be bound
>>>>> + * in the device page table of the specified address space (VM).
>>>>> + * The VA range specified must be unique (ie., not currently 
>>>>> bound) and can
>>>>> + * be mapped to whole object or a section of the object (partial 
>>>>> binding).
>>>>> + * Multiple VA mappings can be created to the same section of the 
>>>>> object
>>>>> + * (aliasing).
>>>>> + *
>>>>> + * The @start, @offset and @length must be 4K page aligned. 
>>>>> However the DG2
>>>>> + * and XEHPSDV has 64K page size for device local-memory and has 
>>>>> compact page
>>>>> + * table. On those platforms, for binding device local-memory 
>>>>> objects, the
>>>>> + * @start must be 2M aligned, @offset and @length must be 64K 
>>>>> aligned.
>>>>> + * Also, for such mappings, i915 will reserve the whole 2M range 
>>>>> for it so as
>>>>> + * to not allow multiple mappings in that 2M range (Compact page 
>>>>> tables do not
>>>>> + * allow 64K page and 4K page bindings in the same 2M range).
>>>>> + *
>>>>> + * Error code -EINVAL will be returned if @start, @offset and 
>>>>> @length are not
>>>>> + * properly aligned. In version 1 (See 
>>>>> I915_PARAM_VM_BIND_VERSION), error code
>>>>> + * -ENOSPC will be returned if the VA range specified can't be 
>>>>> reserved.
>>>>> + *
>>>>> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads 
>>>>> concurrently
>>>>> + * are not ordered. Furthermore, parts of the VM_BIND operation 
>>>>> can be done
>>>>> + * asynchronously, if valid @fence is specified.
>>>>
>>>> Does that mean that if I don't provide @fence, then this ioctl will be
>>>> synchronous (i.e., when it returns, the memory will be guaranteed to be
>>>> bound)? The text is kinda implying that, but from one of your earlier
>>>> replies to Tvrtko, that doesn't seem to be the case. I guess we could
>>>> change the text to make this more explicit.
>>>>
>>>
>>> Yes, I thought, if user doesn't specify the out fence, KMD better make
>>> the ioctl synchronous by waiting until the binding finishes before
>>> returning. Otherwise, UMD has no way to ensure binding is complete and
>>> UMD must pass in out fence for VM_BIND calls.
>>
>> This problematic angle is exactly what I raised and I did not 
>> understand you were suggesting sync behaviour back then.
>>
>> I suggested a possible execbuf3 extension which makes it wait for any 
>> pending (un)bind activity on a VM. Sounds better to me than making 
>> everything sync for the use case of N binds followed by 1 execbuf. 
>> *If* userspace wants an easy "fire and forget" mode for such use case, 
>> rather than having to use a fence on all.
>>
> 
> This is a good optimization. But it creates some synchronization between
> VM_BIND and execbuf3. Based on discussion in IRC, looks like folks are

"Some synchronisation".. what does that mean? It creates the same 
synchronisation as if userspace used the out-in fencing between _every_ 
vm bind and execbuf. Only difference being it is simpler / less overhead 
to use.

> Ok with waiting in VM_BIND call if out fence is not specified by UMD.
> So, we can go with that for now.

If people actually plan to use this implied synchronous mode then it 
will suck. It will be worse than execbuf2. There at least kernel had the 
freedom to do things asynchronously while batch is waiting for execution 
time on the GPU. While in this proposal every bind is userspace-kernel 
roundtrip.

Or if people do not plan to use it, then the question is why are we 
adding it and fixing the contract in the uapi forever.

So what is the usecase?

Regards,

Tvrtko

> 
> Niranjana
> 
>> Regards,
>>
>> Tvrtko
>>
>>> But latest comment form Daniel on other thread might suggest 
>>> something else.
>>> Daniel, can you comment?
>>>
>>>> In addition, previously we had the guarantee that an execbuf ioctl
>>>> would wait for all the pending vm_bind operations to finish before
>>>> doing anything. Do we still have this guarantee or do we have to make
>>>> use of the fences now?
>>>>
>>>
>>> No, we don't have that anymore (execbuf is decoupled from VM_BIND).
>>> Execbuf3 submission will not wait for any previous VM_BIND to finish.
>>> UMD must pass in VM_BIND out fence as in fence for execbuf3 to ensure
>>> that.
>>>
>>>>> + */
>>>>> +struct drm_i915_gem_vm_bind {
>>>>> +     /** @vm_id: VM (address space) id to bind */
>>>>> +     __u32 vm_id;
>>>>> +
>>>>> +     /** @handle: Object handle */
>>>>> +     __u32 handle;
>>>>> +
>>>>> +     /** @start: Virtual Address start to bind */
>>>>> +     __u64 start;
>>>>> +
>>>>> +     /** @offset: Offset in object to bind */
>>>>> +     __u64 offset;
>>>>> +
>>>>> +     /** @length: Length of mapping to bind */
>>>>> +     __u64 length;
>>>>> +
>>>>> +     /**
>>>>> +      * @flags: Supported flags are:
>>>>> +      *
>>>>> +      * I915_GEM_VM_BIND_READONLY:
>>>>> +      * Mapping is read-only.
>>>>
>>>> Can you please explain what happens when we try to write to a range
>>>> that's bound as read-only?
>>>>
>>>
>>> It will be mapped as read-only in device page table. Hence any
>>> write access will fail. I would expect a CAT error reported.
>>>
>>> I am seeing that currently the page table R/W setting is based
>>> on whether BO is readonly or not (UMDs can request a userptr
>>> BO to readonly). We can make this READONLY here as a subset.
>>> ie., if BO is readonly, the mappings must be readonly. If BO
>>> is not readonly, then the mapping can be either readonly or
>>> not.
>>>
>>> But if Mesa doesn't have a use for this, then we can remove
>>> this flag for now.
>>>
>>>>
>>>>> +      *
>>>>> +      * I915_GEM_VM_BIND_CAPTURE:
>>>>> +      * Capture this mapping in the dump upon GPU error.
>>>>> +      */
>>>>> +     __u64 flags;
>>>>> +#define I915_GEM_VM_BIND_READONLY    (1 << 1)
>>>>> +#define I915_GEM_VM_BIND_CAPTURE     (1 << 2)
>>>>> +
>>>>> +     /**
>>>>> +      * @fence: Timeline fence for bind completion signaling.
>>>>> +      *
>>>>> +      * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>>>>> +      * is invalid, and an error will be returned.
>>>>> +      */
>>>>> +     struct drm_i915_gem_timeline_fence fence;
>>>>> +
>>>>> +     /**
>>>>> +      * @extensions: Zero-terminated chain of extensions.
>>>>> +      *
>>>>> +      * For future extensions. See struct i915_user_extension.
>>>>> +      */
>>>>> +     __u64 extensions;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
>>>>> + *
>>>>> + * This structure is passed to VM_UNBIND ioctl and specifies the 
>>>>> GPU virtual
>>>>> + * address (VA) range that should be unbound from the device page 
>>>>> table of the
>>>>> + * specified address space (VM). VM_UNBIND will force unbind the 
>>>>> specified
>>>>> + * range from device page table without waiting for any GPU job to 
>>>>> complete.
>>>>> + * It is UMDs responsibility to ensure the mapping is no longer in 
>>>>> use before
>>>>> + * calling VM_UNBIND.
>>>>> + *
>>>>> + * If the specified mapping is not found, the ioctl will simply 
>>>>> return without
>>>>> + * any error.
>>>>> + *
>>>>> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads 
>>>>> concurrently
>>>>> + * are not ordered. Furthermore, parts of the VM_UNBIND operation 
>>>>> can be done
>>>>> + * asynchronously, if valid @fence is specified.
>>>>> + */
>>>>> +struct drm_i915_gem_vm_unbind {
>>>>> +     /** @vm_id: VM (address space) id to bind */
>>>>> +     __u32 vm_id;
>>>>> +
>>>>> +     /** @rsvd: Reserved, MBZ */
>>>>> +     __u32 rsvd;
>>>>> +
>>>>> +     /** @start: Virtual Address start to unbind */
>>>>> +     __u64 start;
>>>>> +
>>>>> +     /** @length: Length of mapping to unbind */
>>>>> +     __u64 length;
>>>>> +
>>>>> +     /** @flags: Currently reserved, MBZ */
>>>>> +     __u64 flags;
>>>>> +
>>>>> +     /**
>>>>> +      * @fence: Timeline fence for unbind completion signaling.
>>>>> +      *
>>>>> +      * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>>>>> +      * is invalid, and an error will be returned.
>>>>> +      */
>>>>> +     struct drm_i915_gem_timeline_fence fence;
>>>>> +
>>>>> +     /**
>>>>> +      * @extensions: Zero-terminated chain of extensions.
>>>>> +      *
>>>>> +      * For future extensions. See struct i915_user_extension.
>>>>> +      */
>>>>> +     __u64 extensions;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_i915_gem_execbuffer3 - Structure for 
>>>>> DRM_I915_GEM_EXECBUFFER3
>>>>> + * ioctl.
>>>>> + *
>>>>> + * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and 
>>>>> VM_BIND mode
>>>>> + * only works with this ioctl for submission.
>>>>> + * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
>>>>> + */
>>>>> +struct drm_i915_gem_execbuffer3 {
>>>>> +     /**
>>>>> +      * @ctx_id: Context id
>>>>> +      *
>>>>> +      * Only contexts with user engine map are allowed.
>>>>> +      */
>>>>> +     __u32 ctx_id;
>>>>> +
>>>>> +     /**
>>>>> +      * @engine_idx: Engine index
>>>>> +      *
>>>>> +      * An index in the user engine map of the context specified 
>>>>> by @ctx_id.
>>>>> +      */
>>>>> +     __u32 engine_idx;
>>>>> +
>>>>> +     /**
>>>>> +      * @batch_address: Batch gpu virtual address/es.
>>>>> +      *
>>>>> +      * For normal submission, it is the gpu virtual address of 
>>>>> the batch
>>>>> +      * buffer. For parallel submission, it is a pointer to an 
>>>>> array of
>>>>> +      * batch buffer gpu virtual addresses with array size equal 
>>>>> to the
>>>>> +      * number of (parallel) engines involved in that submission (See
>>>>> +      * struct i915_context_engines_parallel_submit).
>>>>> +      */
>>>>> +     __u64 batch_address;
>>>>> +
>>>>> +     /** @flags: Currently reserved, MBZ */
>>>>> +     __u64 flags;
>>>>> +
>>>>> +     /** @rsvd1: Reserved, MBZ */
>>>>> +     __u32 rsvd1;
>>>>> +
>>>>> +     /** @fence_count: Number of fences in @timeline_fences array. */
>>>>> +     __u32 fence_count;
>>>>> +
>>>>> +     /**
>>>>> +      * @timeline_fences: Pointer to an array of timeline fences.
>>>>> +      *
>>>>> +      * Timeline fences are of format struct 
>>>>> drm_i915_gem_timeline_fence.
>>>>> +      */
>>>>> +     __u64 timeline_fences;
>>>>> +
>>>>> +     /** @rsvd2: Reserved, MBZ */
>>>>> +     __u64 rsvd2;
>>>>> +
>>>>
>>>> Just out of curiosity: if we can extend behavior with @extensions and
>>>> even @flags, why would we need a rsvd2? Perhaps we could kill rsvd2?
>>>>
>>>
>>> True. I added it just in case some requests came up that would require
>>> some additional fields. During this review process itself there were
>>> some requests. Adding directly here should have a slight performance
>>> edge over adding it as an extension (one less copy_from_user).
>>>
>>> But if folks think this is an overkill, I will remove it.
>>>
>>> Niranjana
>>>
>>>>> +     /**
>>>>> +      * @extensions: Zero-terminated chain of extensions.
>>>>> +      *
>>>>> +      * For future extensions. See struct i915_user_extension.
>>>>> +      */
>>>>> +     __u64 extensions;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_i915_gem_create_ext_vm_private - Extension to make 
>>>>> the object
>>>>> + * private to the specified VM.
>>>>> + *
>>>>> + * See struct drm_i915_gem_create_ext.
>>>>> + */
>>>>> +struct drm_i915_gem_create_ext_vm_private {
>>>>> +#define I915_GEM_CREATE_EXT_VM_PRIVATE               2
>>>>> +     /** @base: Extension link. See struct i915_user_extension. */
>>>>> +     struct i915_user_extension base;
>>>>> +
>>>>> +     /** @vm_id: Id of the VM to which the object is private */
>>>>> +     __u32 vm_id;
>>>>> +};
>>>>
