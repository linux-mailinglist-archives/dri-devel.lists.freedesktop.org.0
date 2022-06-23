Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B645A557696
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 11:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712F011A052;
	Thu, 23 Jun 2022 09:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA8D11A052;
 Thu, 23 Jun 2022 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655976519; x=1687512519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nzJ1cEdJbOpld6buVCEWDj+AgXWfFQJWH2IqUH4/eTc=;
 b=YZf779EVScdDBMmXq2RxQ56GhLSqmq23FL95dIb+aXo9r5bCD0Xg8Bic
 qEan68d68pvFu5ZrgGH32LDtnTKvEOZStPOKZDYn403wk3uIfgRPvPyPP
 IzXkkJMeVpcMVWsKmGQBjkjpNfiAxhpj1OxLJ1AJPzV66RBhocUw+MFIx
 Gl6oFvqokmci4fLElXeWT1RFoqvDHBXRNQZJ3xOM+XKXZ0PUNPJe0F5Sy
 iHZ4lxtRUqy3LyDQq5AFS8IdTUwaGYwyFKAfutu7Xt6IuAcQLEyybTNxY
 E5vdBH61SAyRX0pXi/aiBFLaGA8MjZ4UVD/WlwKlYtlpecycAR5uwpGn7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="344662462"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="344662462"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 02:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="592625404"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2022 02:28:37 -0700
Received: from [10.249.129.203] (unknown [10.249.129.203])
 by linux.intel.com (Postfix) with ESMTP id E385D580970;
 Thu, 23 Jun 2022 02:28:33 -0700 (PDT)
Message-ID: <8cfef3ba-feb0-49a8-b241-374e7e456f45@intel.com>
Date: Thu, 23 Jun 2022 12:28:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220622151229.GY376@nvishwa1-DESK>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 chris.p.wilson@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2022 18:12, Niranjana Vishwanathapura wrote:
> On Wed, Jun 22, 2022 at 09:10:07AM +0100, Tvrtko Ursulin wrote:
>>
>> On 22/06/2022 04:56, Niranjana Vishwanathapura wrote:
>>> VM_BIND and related uapi definitions
>>>
>>> v2: Reduce the scope to simple Mesa use case.
>>> v3: Expand VM_UNBIND documentation and add
>>>     I915_GEM_VM_BIND/UNBIND_FENCE_VALID
>>>     and I915_GEM_VM_BIND_TLB_FLUSH flags.
>>>
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>> ---
>>>  Documentation/gpu/rfc/i915_vm_bind.h | 243 +++++++++++++++++++++++++++
>>>  1 file changed, 243 insertions(+)
>>>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>>>
>>> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h 
>>> b/Documentation/gpu/rfc/i915_vm_bind.h
>>> new file mode 100644
>>> index 000000000000..fa23b2d7ec6f
>>> --- /dev/null
>>> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
>>> @@ -0,0 +1,243 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2022 Intel Corporation
>>> + */
>>> +
>>> +/**
>>> + * DOC: I915_PARAM_HAS_VM_BIND
>>> + *
>>> + * VM_BIND feature availability.
>>> + * See typedef drm_i915_getparam_t param.
>>> + */
>>> +#define I915_PARAM_HAS_VM_BIND        57
>>> +
>>> +/**
>>> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
>>> + *
>>> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
>>> + * See struct drm_i915_gem_vm_control flags.
>>> + *
>>> + * The older execbuf2 ioctl will not support VM_BIND mode of 
>>> operation.
>>> + * For VM_BIND mode, we have new execbuf3 ioctl which will not 
>>> accept any
>>> + * execlist (See struct drm_i915_gem_execbuffer3 for more details).
>>> + *
>>> + */
>>> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND    (1 << 0)
>>> +
>>> +/* VM_BIND related ioctls */
>>> +#define DRM_I915_GEM_VM_BIND        0x3d
>>> +#define DRM_I915_GEM_VM_UNBIND        0x3e
>>> +#define DRM_I915_GEM_EXECBUFFER3    0x3f
>>> +
>>> +#define DRM_IOCTL_I915_GEM_VM_BIND DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
>>> +#define DRM_IOCTL_I915_GEM_VM_UNBIND DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
>>> +#define DRM_IOCTL_I915_GEM_EXECBUFFER3 DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
>>> +
>>> +/**
>>> + * struct drm_i915_gem_vm_bind_fence - Bind/unbind completion 
>>> notification.
>>> + *
>>> + * A timeline out fence for vm_bind/unbind completion notification.
>>> + */
>>> +struct drm_i915_gem_vm_bind_fence {
>>> +    /** @handle: User's handle for a drm_syncobj to signal. */
>>> +    __u32 handle;
>>> +
>>> +    /** @rsvd: Reserved, MBZ */
>>> +    __u32 rsvd;
>>> +
>>> +    /**
>>> +     * @value: A point in the timeline.
>>> +     * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>>> +     * timeline drm_syncobj is invalid as it turns a drm_syncobj 
>>> into a
>>> +     * binary one.
>>> +     */
>>> +    __u64 value;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>> + *
>>> + * This structure is passed to VM_BIND ioctl and specifies the 
>>> mapping of GPU
>>> + * virtual address (VA) range to the section of an object that 
>>> should be bound
>>> + * in the device page table of the specified address space (VM).
>>> + * The VA range specified must be unique (ie., not currently bound) 
>>> and can
>>> + * be mapped to whole object or a section of the object (partial 
>>> binding).
>>> + * Multiple VA mappings can be created to the same section of the 
>>> object
>>> + * (aliasing).
>>> + *
>>> + * The @start, @offset and @length should be 4K page aligned. 
>>> However the DG2
>>> + * and XEHPSDV has 64K page size for device local-memory and has 
>>> compact page
>>> + * table. On those platforms, for binding device local-memory 
>>> objects, the
>>> + * @start should be 2M aligned, @offset and @length should be 64K 
>>> aligned.
>>
>> Should some error codes be documented and has the ability to 
>> programmatically probe the alignment restrictions been considered?
>>
>
> Currently what we have internally is that -EINVAL is returned if the 
> sart, offset
> and length are not aligned. If the specified mapping already exits, we 
> return
> -EEXIST. If there are conflicts in the VA range and VA range can't be 
> reserved,
> then -ENOSPC is returned. I can add this documentation here. But I am 
> worried
> that there will be more suggestions/feedback about error codes while 
> reviewing
> the code patch series, and we have to revisit it again.


That's not really a good excuse to not document.


>
>>> + * Also, on those platforms, it is not allowed to bind an device 
>>> local-memory
>>> + * object and a system memory object in a single 2M section of VA 
>>> range.
>>
>> Text should be clear whether "not allowed" means there will be an 
>> error returned, or it will appear to work but bad things will happen.
>>
>
> Yah, error returned, will fix.
>
>>> + */
>>> +struct drm_i915_gem_vm_bind {
>>> +    /** @vm_id: VM (address space) id to bind */
>>> +    __u32 vm_id;
>>> +
>>> +    /** @handle: Object handle */
>>> +    __u32 handle;
>>> +
>>> +    /** @start: Virtual Address start to bind */
>>> +    __u64 start;
>>> +
>>> +    /** @offset: Offset in object to bind */
>>> +    __u64 offset;
>>> +
>>> +    /** @length: Length of mapping to bind */
>>> +    __u64 length;
>>> +
>>> +    /**
>>> +     * @flags: Supported flags are:
>>> +     *
>>> +     * I915_GEM_VM_BIND_FENCE_VALID:
>>> +     * @fence is valid, needs bind completion notification.
>>> +     *
>>> +     * I915_GEM_VM_BIND_READONLY:
>>> +     * Mapping is read-only.
>>> +     *
>>> +     * I915_GEM_VM_BIND_CAPTURE:
>>> +     * Capture this mapping in the dump upon GPU error.
>>> +     *
>>> +     * I915_GEM_VM_BIND_TLB_FLUSH:
>>> +     * Flush the TLB for the specified range after bind completion.
>>> +     */
>>> +    __u64 flags;
>>> +#define I915_GEM_VM_BIND_FENCE_VALID    (1 << 0)
>>> +#define I915_GEM_VM_BIND_READONLY    (1 << 1)
>>> +#define I915_GEM_VM_BIND_CAPTURE    (1 << 2)
>>> +#define I915_GEM_VM_BIND_TLB_FLUSH    (1 << 2)
>>
>> What is the use case for allowing any random user to play with 
>> (global) TLB flushing?
>>
>
> I heard it from Daniel on intel-gfx, apparently it is a Mesa requirement.
>
>>> +
>>> +    /** @fence: Timeline fence for bind completion signaling */
>>> +    struct drm_i915_gem_vm_bind_fence fence;
>>
>> As agreed the other day - please document in the main kerneldoc 
>> section that all (un)binds are executed asynchronously and out of order.
>>
>
> I have added it in the latest revision of .rst file.
>
>>> +
>>> +    /** @extensions: 0-terminated chain of extensions */
>>> +    __u64 extensions;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
>>> + *
>>> + * This structure is passed to VM_UNBIND ioctl and specifies the 
>>> GPU virtual
>>> + * address (VA) range that should be unbound from the device page 
>>> table of the
>>> + * specified address space (VM). The specified VA range must match 
>>> one of the
>>> + * mappings created with the VM_BIND ioctl. 


This will not work for space bindings.

We need to make this a feature and have i915 say that non-matching 
bind/unbind are not currently supported.

So that when support is added for non matching bind/unbind, we can 
detect the support and enable sparse in UMD.


>>> TLB is flushed upon unbind
>>> + * completion. The unbind operation will force unbind the specified
>>
>> Do we want to provide TLB flushing guarantees here and why? (As 
>> opposed to leaving them for implementation details.) If there is no 
>> implied order in either binds/unbinds, or between the two intermixed, 
>> then what is the point of guaranteeing a TLB flush on unbind completion?
>>
>
> I think we ensure that tlb is flushed before signaling the out fence
> of vm_unbind call, then user ensure corretness by staging submissions
> or vm_bind calls after vm_unbind out fence signaling.
>
>> range from
>>> + * device page table without waiting for any GPU job to complete. 
>>> It is UMDs
>>> + * responsibility to ensure the mapping is no longer in use before 
>>> calling
>>> + * VM_UNBIND.
>>> + *
>>> + * The @start and @length musy specify a unique mapping bound with 
>>> VM_BIND
>>> + * ioctl.
>>> + */
>>> +struct drm_i915_gem_vm_unbind {
>>> +    /** @vm_id: VM (address space) id to bind */
>>> +    __u32 vm_id;
>>> +
>>> +    /** @rsvd: Reserved, MBZ */
>>> +    __u32 rsvd;
>>> +
>>> +    /** @start: Virtual Address start to unbind */
>>> +    __u64 start;
>>> +
>>> +    /** @length: Length of mapping to unbind */
>>> +    __u64 length;
>>> +
>>> +    /**
>>> +     * @flags: Supported flags are:
>>> +     *
>>> +     * I915_GEM_VM_UNBIND_FENCE_VALID:
>>> +     * @fence is valid, needs unbind completion notification.
>>> +     */
>>> +    __u64 flags;
>>> +#define I915_GEM_VM_UNBIND_FENCE_VALID    (1 << 0)
>>> +
>>> +    /** @fence: Timeline fence for unbind completion signaling */
>>> +    struct drm_i915_gem_vm_bind_fence fence;
>>
>> I am not sure the simplified ioctl story is super coherent. If 
>> everything is now fully async and out of order, but the input fence 
>> has been dropped, then how is userspace supposed to handle the 
>> address space? It will have to wait (in userspace) for unbinds to 
>> complete before submitting subsequent binds which use the same VA range.
>>
>
> Yah and Mesa appararently will be having the support to handle it.


Maybe there was miscommunication, but I thought things would be in order 
with a out fence only.

I didn't see out-of-order mentioned in our last internal discussion.

I think we can deal with it anyway using a timeline semaphore.


>
>> Maybe that's passable, but then the fact execbuf3 has no input fence 
>> suggests a userspace wait between it and binds. And I am pretty sure 
>> historically those were always quite bad for performance.
>>
>
> execbuf3 has the input fence through timline fence array support.
>
>> Presumably userspace clients are happy with no input fences or it was 
>> considered to costly to implement it?
>>
>
> Yah, apparently Mesa can work with no input fence. This helps us in
> focusing on rest of the VM_BIND feature delivery.
>
> Niranjana
>
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>> +    /** @extensions: 0-terminated chain of extensions */
>>> +    __u64 extensions;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_i915_gem_execbuffer3 - Structure for 
>>> DRM_I915_GEM_EXECBUFFER3
>>> + * ioctl.
>>> + *
>>> + * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and 
>>> VM_BIND mode
>>> + * only works with this ioctl for submission.
>>> + * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
>>> + */
>>> +struct drm_i915_gem_execbuffer3 {
>>> +    /**
>>> +     * @ctx_id: Context id
>>> +     *
>>> +     * Only contexts with user engine map are allowed.
>>> +     */
>>> +    __u32 ctx_id;
>>> +
>>> +    /**
>>> +     * @engine_idx: Engine index
>>> +     *
>>> +     * An index in the user engine map of the context specified by 
>>> @ctx_id.
>>> +     */
>>> +    __u32 engine_idx;
>>> +
>>> +    /** @rsvd1: Reserved, MBZ */
>>> +    __u32 rsvd1;
>>> +
>>> +    /**
>>> +     * @batch_count: Number of batches in @batch_address array.
>>> +     *
>>> +     * 0 is invalid. For parallel submission, it should be equal to 
>>> the
>>> +     * number of (parallel) engines involved in that submission.
>>> +     */
>>> +    __u32 batch_count;
>>> +
>>> +    /**
>>> +     * @batch_address: Array of batch gpu virtual addresses.
>>> +     *
>>> +     * If @batch_count is 1, then it is the gpu virtual address of the
>>> +     * batch buffer. If @batch_count > 1, then it is a pointer to 
>>> an array
>>> +     * of batch buffer gpu virtual addresses.
>>> +     */
>>> +    __u64 batch_address;
>>> +
>>> +    /**
>>> +     * @flags: Supported flags are:
>>> +     *
>>> +     * I915_EXEC3_SECURE:
>>> +     * Request a privileged ("secure") batch buffer/s.
>>> +     * It is only available for DRM_ROOT_ONLY | DRM_MASTER processes.
>>> +     */
>>> +    __u64 flags;
>>> +#define I915_EXEC3_SECURE    (1<<0)
>>> +
>>> +    /** @rsvd2: Reserved, MBZ */
>>> +    __u64 rsvd2;
>>> +
>>> +    /**
>>> +     * @extensions: Zero-terminated chain of extensions.
>>> +     *
>>> +     * DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES:
>>> +     * It has same format as 
>>> DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES.
>>> +     * See struct drm_i915_gem_execbuffer_ext_timeline_fences.
>>> +     */
>>> +    __u64 extensions;
>>> +#define DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES    0
>>> +};
>>> +
>>> +/**
>>> + * struct drm_i915_gem_create_ext_vm_private - Extension to make 
>>> the object
>>> + * private to the specified VM.
>>> + *
>>> + * See struct drm_i915_gem_create_ext.
>>> + */
>>> +struct drm_i915_gem_create_ext_vm_private {
>>> +#define I915_GEM_CREATE_EXT_VM_PRIVATE        2
>>> +    /** @base: Extension link. See struct i915_user_extension. */
>>> +    struct i915_user_extension base;
>>> +
>>> +    /** @vm_id: Id of the VM to which the object is private */
>>> +    __u32 vm_id;
>>> +};


