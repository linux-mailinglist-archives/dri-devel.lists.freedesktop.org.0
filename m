Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB2A5111C4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 08:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A594010E13E;
	Wed, 27 Apr 2022 06:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A0710E13E;
 Wed, 27 Apr 2022 06:55:11 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id kq17so1498290ejb.4;
 Tue, 26 Apr 2022 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0eI1Uijj0b2w2PDu9yxBR8oqRU3QJAy+/xSyh/wx9rk=;
 b=MnYFjRZmovIO7r7Y+zQ57d1uSu1s97e5Znv/ZWcu0dGKf6Rchg/V6ZMDulrZS4+uAh
 95QLqvrdO8SDkRkPa907Yd04GTrnV85T/jvWs+Sq8M09hZkGe3DnaMjAjHXkypNKAmt3
 kXemcd1nlRa0Q7Jitxotff/tLhJUNsv/cv0KsYsPFuVYeJjtNZICcB7tywZ2X0o4d39p
 FKCy0z4Vs7aYvx3QC/O8ds7ghJld28I1K7siAvO9sUbx5phISOGHgDgtiOfqQvIry/vX
 pQT2VrNOAT1TXZMYf7L32VUXbhEHRvX+5EwNKn2NBnxMjzG6L9N0IK7MtP62GaOYjpZa
 Mhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0eI1Uijj0b2w2PDu9yxBR8oqRU3QJAy+/xSyh/wx9rk=;
 b=mf8vXEuGNeipbz774e3ccYBglliEHSFyCO7hHL8ByfEbEk6XVx4O9qXycD8OEZWwhS
 aCslai0cxJRoOm0mUbu+7rcOw9/8Q5o6ME29Blti1S6Ln1KBCMH7QBahBma0YmSH78Lj
 ks2ncWeSKJYA3nmPSWdJ+SnPHn2WoT6hmt/y/EOhZSf9r9sVCodZSsrC+LUNUbwRsm68
 h9kRbTOeOp7M8S+MznTvl5Pa9zRg9u+ozp0LGEjrr0iMVvRum4uAXlYwvvbhZR1zYMPg
 C1TxjsnKOnlU5qXOeP7b9MyFfxTqjPB0KTKuJpJNXO2y7BihFCgwDz5Z/361R74bsc1O
 5e2w==
X-Gm-Message-State: AOAM532JoyTzdRPUxbq4KQWvQD9Dad1AntUVWX50UbPLcS73nbb7wL6c
 luOkZKFrHbMNAhHtgJsXnpexzZ/cBTU=
X-Google-Smtp-Source: ABdhPJwm6yTUu0DKtDtAYwTPgKVq07/LAM4Rf07gHkYm5Oq+Mevbq1gfBA+rSnmo/J5cfRwDLV1Lhw==
X-Received: by 2002:a17:907:94ca:b0:6da:e637:fa42 with SMTP id
 dn10-20020a17090794ca00b006dae637fa42mr25274232ejc.347.1651042509931; 
 Tue, 26 Apr 2022 23:55:09 -0700 (PDT)
Received: from [192.168.178.21] (p57b0b9e1.dip0.t-ipconnect.de.
 [87.176.185.225]) by smtp.gmail.com with ESMTPSA id
 b8-20020a056402278800b004261ac0126asm101716ede.94.2022.04.26.23.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 23:55:08 -0700 (PDT)
Message-ID: <dbc758bd-1fc6-45cf-9fcd-366a35e26808@gmail.com>
Date: Wed, 27 Apr 2022 08:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/doc: add rfc section for small BAR uapi
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220420171328.57253-1-matthew.auld@intel.com>
 <5553382d-2674-76f0-ab6e-408b99111a62@intel.com>
 <a667ccc4-fd5e-7e15-cffc-d5a65a834825@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <a667ccc4-fd5e-7e15-cffc-d5a65a834825@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, mesa-dev@lists.freedesktop.org,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well usually we increment the drm minor version when adding some new 
flags on amdgpu.

Additional to that just one comment from our experience with that: You 
don't just need one flag, but two. The first one is a hint which says 
"CPU access needed" and the second is a promise which says "CPU access 
never needed".

The background is that on a whole bunch of buffers you can 100% certain 
say that you will never ever need CPU access.

Then at least we have a whole bunch of buffers where we might need CPU 
access, but can't tell for sure.

And last we have stuff like transfer buffers you can be 100% sure that 
you need CPU access.

Separating it like this helped a lot with performance on small BAR systems.

Regards,
Christian.

Am 27.04.22 um 08:48 schrieb Lionel Landwerlin:
> One question though, how do we detect that this flag 
> (I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS) is accepted on a given 
> kernel?
> I assume older kernels are going to reject object creation if we use 
> this flag?
>
> I didn't plan to use __drm_i915_query_vma_info, but isn't it 
> inconsistent to select the placement on the GEM object and then query 
> whether it's mappable by address?
> You made a comment stating this is racy, wouldn't querying on the GEM 
> object prevent this?
>
> Thanks,
>
> -Lionel
>
> On 27/04/2022 09:35, Lionel Landwerlin wrote:
>> Hi Matt,
>>
>>
>> The proposal looks good to me.
>>
>> Looking forward to try it on drm-tip.
>>
>>
>> -Lionel
>>
>> On 20/04/2022 20:13, Matthew Auld wrote:
>>> Add an entry for the new uapi needed for small BAR on DG2+.
>>>
>>> v2:
>>>    - Some spelling fixes and other small tweaks. (Akeem & Thomas)
>>>    - Rework error capture interactions, including no longer needing
>>>      NEEDS_CPU_ACCESS for objects marked for capture. (Thomas)
>>>    - Add probed_cpu_visible_size. (Lionel)
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>>> Cc: mesa-dev@lists.freedesktop.org
>>> ---
>>>   Documentation/gpu/rfc/i915_small_bar.h   | 190 
>>> +++++++++++++++++++++++
>>>   Documentation/gpu/rfc/i915_small_bar.rst |  58 +++++++
>>>   Documentation/gpu/rfc/index.rst          |   4 +
>>>   3 files changed, 252 insertions(+)
>>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
>>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
>>>
>>> diff --git a/Documentation/gpu/rfc/i915_small_bar.h 
>>> b/Documentation/gpu/rfc/i915_small_bar.h
>>> new file mode 100644
>>> index 000000000000..7bfd0cf44d35
>>> --- /dev/null
>>> +++ b/Documentation/gpu/rfc/i915_small_bar.h
>>> @@ -0,0 +1,190 @@
>>> +/**
>>> + * struct __drm_i915_memory_region_info - Describes one region as 
>>> known to the
>>> + * driver.
>>> + *
>>> + * Note this is using both struct drm_i915_query_item and struct 
>>> drm_i915_query.
>>> + * For this new query we are adding the new query id 
>>> DRM_I915_QUERY_MEMORY_REGIONS
>>> + * at &drm_i915_query_item.query_id.
>>> + */
>>> +struct __drm_i915_memory_region_info {
>>> +    /** @region: The class:instance pair encoding */
>>> +    struct drm_i915_gem_memory_class_instance region;
>>> +
>>> +    /** @rsvd0: MBZ */
>>> +    __u32 rsvd0;
>>> +
>>> +    /** @probed_size: Memory probed by the driver (-1 = unknown) */
>>> +    __u64 probed_size;
>>> +
>>> +    /** @unallocated_size: Estimate of memory remaining (-1 = 
>>> unknown) */
>>> +    __u64 unallocated_size;
>>> +
>>> +    union {
>>> +        /** @rsvd1: MBZ */
>>> +        __u64 rsvd1[8];
>>> +        struct {
>>> +            /**
>>> +             * @probed_cpu_visible_size: Memory probed by the driver
>>> +             * that is CPU accessible. (-1 = unknown).
>>> +             *
>>> +             * This will be always be <= @probed_size, and the
>>> +             * remainder(if there is any) will not be CPU
>>> +             * accessible.
>>> +             */
>>> +            __u64 probed_cpu_visible_size;
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +/**
>>> + * struct __drm_i915_gem_create_ext - Existing gem_create 
>>> behaviour, with added
>>> + * extension support using struct i915_user_extension.
>>> + *
>>> + * Note that new buffer flags should be added here, at least for 
>>> the stuff that
>>> + * is immutable. Previously we would have two ioctls, one to create 
>>> the object
>>> + * with gem_create, and another to apply various parameters, 
>>> however this
>>> + * creates some ambiguity for the params which are considered 
>>> immutable. Also in
>>> + * general we're phasing out the various SET/GET ioctls.
>>> + */
>>> +struct __drm_i915_gem_create_ext {
>>> +    /**
>>> +     * @size: Requested size for the object.
>>> +     *
>>> +     * The (page-aligned) allocated size for the object will be 
>>> returned.
>>> +     *
>>> +     * Note that for some devices we have might have further minimum
>>> +     * page-size restrictions(larger than 4K), like for device 
>>> local-memory.
>>> +     * However in general the final size here should always reflect 
>>> any
>>> +     * rounding up, if for example using the 
>>> I915_GEM_CREATE_EXT_MEMORY_REGIONS
>>> +     * extension to place the object in device local-memory.
>>> +     */
>>> +    __u64 size;
>>> +    /**
>>> +     * @handle: Returned handle for the object.
>>> +     *
>>> +     * Object handles are nonzero.
>>> +     */
>>> +    __u32 handle;
>>> +    /**
>>> +     * @flags: Optional flags.
>>> +     *
>>> +     * Supported values:
>>> +     *
>>> +     * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS - Signal to the 
>>> kernel that
>>> +     * the object will need to be accessed via the CPU.
>>> +     *
>>> +     * Only valid when placing objects in I915_MEMORY_CLASS_DEVICE, 
>>> and
>>> +     * only strictly required on platforms where only some of the 
>>> device
>>> +     * memory is directly visible or mappable through the CPU, like 
>>> on DG2+.
>>> +     *
>>> +     * One of the placements MUST also be I915_MEMORY_CLASS_SYSTEM, to
>>> +     * ensure we can always spill the allocation to system memory, 
>>> if we
>>> +     * can't place the object in the mappable part of
>>> +     * I915_MEMORY_CLASS_DEVICE.
>>> +     *
>>> +     * Note that since the kernel only supports flat-CCS on objects 
>>> that can
>>> +     * *only* be placed in I915_MEMORY_CLASS_DEVICE, we therefore 
>>> don't
>>> +     * support I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS together with
>>> +     * flat-CCS.
>>> +     *
>>> +     * Without this hint, the kernel will assume that non-mappable
>>> +     * I915_MEMORY_CLASS_DEVICE is preferred for this object. Note 
>>> that the
>>> +     * kernel can still migrate the object to the mappable part, as 
>>> a last
>>> +     * resort, if userspace ever CPU faults this object, but this 
>>> might be
>>> +     * expensive, and so ideally should be avoided.
>>> +     */
>>> +#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
>>> +    __u32 flags;
>>> +    /**
>>> +     * @extensions: The chain of extensions to apply to this object.
>>> +     *
>>> +     * This will be useful in the future when we need to support 
>>> several
>>> +     * different extensions, and we need to apply more than one when
>>> +     * creating the object. See struct i915_user_extension.
>>> +     *
>>> +     * If we don't supply any extensions then we get the same old 
>>> gem_create
>>> +     * behaviour.
>>> +     *
>>> +     * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>>> +     * struct drm_i915_gem_create_ext_memory_regions.
>>> +     *
>>> +     * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>> +     * struct drm_i915_gem_create_ext_protected_content.
>>> +     */
>>> +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>> +    __u64 extensions;
>>> +};
>>> +
>>> +#define DRM_I915_QUERY_VMA_INFO    5
>>> +
>>> +/**
>>> + * struct __drm_i915_query_vma_info
>>> + *
>>> + * Given a vm and GTT address, lookup the corresponding vma, 
>>> returning its set
>>> + * of attributes.
>>> + *
>>> + * .. code-block:: C
>>> + *
>>> + *    struct drm_i915_query_vma_info info = {};
>>> + *    struct drm_i915_query_item item = {
>>> + *        .data_ptr = (uintptr_t)&info,
>>> + *        .query_id = DRM_I915_QUERY_VMA_INFO,
>>> + *    };
>>> + *    struct drm_i915_query query = {
>>> + *        .num_items = 1,
>>> + *        .items_ptr = (uintptr_t)&item,
>>> + *    };
>>> + *    int err;
>>> + *
>>> + *    // Unlike some other types of queries, there is no need to 
>>> first query
>>> + *    // the size of the data_ptr blob here, since we already know 
>>> ahead of
>>> + *    // time how big this needs to be.
>>> + *    item.length = sizeof(info);
>>> + *
>>> + *    // Next we fill in the vm_id and ppGTT address of the vma we 
>>> wish
>>> + *    // to query, before then firing off the query.
>>> + *    info.vm_id = vm_id;
>>> + *    info.offset = gtt_address;
>>> + *    err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
>>> + *    if (err || item.length < 0) ...
>>> + *
>>> + *    // If all went well we can now inspect the returned attributes.
>>> + *    if (info.attributes & DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE) ...
>>> + */
>>> +struct __drm_i915_query_vma_info {
>>> +    /**
>>> +     * @vm_id: The given vm id that contains the vma. The id is the 
>>> value
>>> +     * returned by the DRM_I915_GEM_VM_CREATE. See struct
>>> +     * drm_i915_gem_vm_control.vm_id.
>>> +     */
>>> +    __u32 vm_id;
>>> +    /** @pad: MBZ. */
>>> +    __u32 pad;
>>> +    /**
>>> +     * @offset: The corresponding ppGTT address of the vma which 
>>> the kernel
>>> +     * will use to perform the lookup.
>>> +     */
>>> +    __u64 offset;
>>> +    /**
>>> +     * @attributes: The returned attributes for the given vma.
>>> +     *
>>> +     * Possible values:
>>> +     *
>>> +     * DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE - Set if the pages 
>>> backing the
>>> +     * vma are currently CPU accessible. If this is not set then 
>>> the vma is
>>> +     * currently backed by I915_MEMORY_CLASS_DEVICE memory, which 
>>> the CPU
>>> +     * cannot directly access(this is only possible on discrete 
>>> devices with
>>> +     * a small BAR). Attempting to MMAP and fault such an object will
>>> +     * require the kernel first synchronising any GPU work tied to the
>>> +     * object, before then migrating the pages, either to the CPU 
>>> accessible
>>> +     * part of I915_MEMORY_CLASS_DEVICE, or 
>>> I915_MEMORY_CLASS_SYSTEM, if the
>>> +     * placements permit it. See 
>>> I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS.
>>> +     *
>>> +     * Note that this is inherently racy.
>>> +     */
>>> +#define DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE (1<<0)
>>> +    __u64 attributes;
>>> +    /** @rsvd: MBZ */
>>> +    __u32 rsvd[4];
>>> +};
>>> diff --git a/Documentation/gpu/rfc/i915_small_bar.rst 
>>> b/Documentation/gpu/rfc/i915_small_bar.rst
>>> new file mode 100644
>>> index 000000000000..be3d9bcdd86d
>>> --- /dev/null
>>> +++ b/Documentation/gpu/rfc/i915_small_bar.rst
>>> @@ -0,0 +1,58 @@
>>> +==========================
>>> +I915 Small BAR RFC Section
>>> +==========================
>>> +Starting from DG2 we will have resizable BAR support for device 
>>> local-memory(i.e
>>> +I915_MEMORY_CLASS_DEVICE), but in some cases the final BAR size 
>>> might still be
>>> +smaller than the total probed_size. In such cases, only some subset of
>>> +I915_MEMORY_CLASS_DEVICE will be CPU accessible(for example the 
>>> first 256M),
>>> +while the remainder is only accessible via the GPU.
>>> +
>>> +I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS flag
>>> +----------------------------------------------
>>> +New gem_create_ext flag to tell the kernel that a BO will require 
>>> CPU access.
>>> +This becomes important when placing an object in 
>>> I915_MEMORY_CLASS_DEVICE, where
>>> +underneath the device has a small BAR, meaning only some portion of 
>>> it is CPU
>>> +accessible. Without this flag the kernel will assume that CPU 
>>> access is not
>>> +required, and prioritize using the non-CPU visible portion of
>>> +I915_MEMORY_CLASS_DEVICE.
>>> +
>>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>>> +   :functions: __drm_i915_gem_create_ext
>>> +
>>> +probed_cpu_visible_size attribute
>>> +---------------------------------
>>> +New struct__drm_i915_memory_region attribute which returns the 
>>> total size of the
>>> +CPU accessible portion, for the particular region. This should only be
>>> +applicable for I915_MEMORY_CLASS_DEVICE.
>>> +
>>> +Vulkan will need this as part of creating a separate VkMemoryHeap 
>>> with the
>>> +VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT set, to represent the CPU 
>>> visible portion,
>>> +where the total size of the heap needs to be known.
>>> +
>>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>>> +   :functions: __drm_i915_memory_region_info
>>> +
>>> +DRM_I915_QUERY_VMA_INFO query
>>> +-----------------------------
>>> +Query the attributes of some vma. Given a vm and GTT offset, find the
>>> +respective vma, and return its set of attributes. For now we only 
>>> support
>>> +DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE, which is set if the object/vma is
>>> +currently placed in memory that is accessible by the CPU. This 
>>> should always be
>>> +set on devices where the CPU probed_cpu_visible_size of 
>>> I915_MEMORY_CLASS_DEVICE
>>> +matches the probed_size. If this is not set then CPU faulting the 
>>> object will
>>> +likely first require migrating the pages.
>>> +
>>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>>> +   :functions: __drm_i915_query_vma_info
>>> +
>>> +Error Capture restrictions
>>> +--------------------------
>>> +With error capture we have two new restrictions:
>>> +
>>> +    1) Error capture is best effort on small BAR systems; if the 
>>> pages are not
>>> +    CPU accessible, at the time of capture, then the kernel is free 
>>> to skip
>>> +    trying to capture them.
>>> +
>>> +    2) On discrete we now reject error capture on recoverable 
>>> contexts. In the
>>> +    future the kernel may want to blit during error capture, when 
>>> for example
>>> +    something is not currently CPU accessible.
>>> diff --git a/Documentation/gpu/rfc/index.rst 
>>> b/Documentation/gpu/rfc/index.rst
>>> index 91e93a705230..5a3bd3924ba6 100644
>>> --- a/Documentation/gpu/rfc/index.rst
>>> +++ b/Documentation/gpu/rfc/index.rst
>>> @@ -23,3 +23,7 @@ host such documentation:
>>>   .. toctree::
>>>         i915_scheduler.rst
>>> +
>>> +.. toctree::
>>> +
>>> +    i915_small_bar.rst
>>
>>
>

