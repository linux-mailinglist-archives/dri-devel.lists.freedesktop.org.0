Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E3529D93
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 11:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B1010FCD7;
	Tue, 17 May 2022 09:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEEB10FBE9;
 Tue, 17 May 2022 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652778737; x=1684314737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bgFNAzLdoUo7kXkueYvStDwnBvDrtSkswshfJ+65cvI=;
 b=bZbE9D22YGMgrNJujIDjyJPYTX0tsUbQdns0AT1Elq2M8bsgEfprSNOQ
 kIdjAc5uYdCJAxrfXxS20QhVYvWDNiE1Ve392N72g6mCxRG9EV7ApGf1t
 Qi9gZiSOkCF+r2+E3XMgAWrIxQ61dsQEiuDzVX18+JuP8JdjhM+Fpp8bf
 AYrofV/+RrbDD57TY69Ok9WivGLfajvQ7wVDPxirGdzUeZ08XRatKYyUf
 pxxWHHRu/wFuUEdGBeaEhebyuRPon3FFtFei03pTU+u7WeiaHtFNpDJKa
 UbIKTLbsQOlLk8Qdk0fZxyq13W3073B5XGx1R7ZJfUhlGczlE5NbFodb1 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="270813548"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="270813548"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 02:12:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="816810202"
Received: from kanesean-mobl.ger.corp.intel.com (HELO [10.252.16.201])
 ([10.252.16.201])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 02:12:14 -0700
Message-ID: <1d47a8f0-c9bd-101d-ad45-f65d1a314912@intel.com>
Date: Tue, 17 May 2022 10:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.0
Subject: Re: [PATCH v3] drm/doc: add rfc section for small BAR uapi
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220516181152.1236708-1-matthew.auld@intel.com>
 <bcea3c24-b9a4-f889-94ad-40c668ab42ac@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <bcea3c24-b9a4-f889-94ad-40c668ab42ac@linux.intel.com>
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
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, mesa-dev@lists.freedesktop.org,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 09:29, Tvrtko Ursulin wrote:
> 
> On 16/05/2022 19:11, Matthew Auld wrote:
>> Add an entry for the new uapi needed for small BAR on DG2+.
>>
>> v2:
>>    - Some spelling fixes and other small tweaks. (Akeem & Thomas)
>>    - Rework error capture interactions, including no longer needing
>>      NEEDS_CPU_ACCESS for objects marked for capture. (Thomas)
>>    - Add probed_cpu_visible_size. (Lionel)
>> v3:
>>    - Drop the vma query for now.
>>    - Add unallocated_cpu_visible_size as part of the region query.
>>    - Improve the docs some more, including documenting the expected
>>      behaviour on older kernels, since this came up in some offline
>>      discussion.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>> Cc: mesa-dev@lists.freedesktop.org
>> ---
>>   Documentation/gpu/rfc/i915_small_bar.h   | 164 +++++++++++++++++++++++
>>   Documentation/gpu/rfc/i915_small_bar.rst |  47 +++++++
>>   Documentation/gpu/rfc/index.rst          |   4 +
>>   3 files changed, 215 insertions(+)
>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
>>
>> diff --git a/Documentation/gpu/rfc/i915_small_bar.h 
>> b/Documentation/gpu/rfc/i915_small_bar.h
>> new file mode 100644
>> index 000000000000..4079d287750b
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/i915_small_bar.h
>> @@ -0,0 +1,164 @@
>> +/**
>> + * struct __drm_i915_memory_region_info - Describes one region as 
>> known to the
>> + * driver.
>> + *
>> + * Note this is using both struct drm_i915_query_item and struct 
>> drm_i915_query.
>> + * For this new query we are adding the new query id 
>> DRM_I915_QUERY_MEMORY_REGIONS
>> + * at &drm_i915_query_item.query_id.
>> + */
>> +struct __drm_i915_memory_region_info {
>> +    /** @region: The class:instance pair encoding */
>> +    struct drm_i915_gem_memory_class_instance region;
>> +
>> +    /** @rsvd0: MBZ */
>> +    __u32 rsvd0;
>> +
>> +    /** @probed_size: Memory probed by the driver (-1 = unknown) */
>> +    __u64 probed_size;
> 
> Is -1 possible today or when it will be? For system memory it appears 
> zeroes are returned today so that has to stay I think. Does it 
> effectively mean userspace has to consider both 0 and -1 as unknown is 
> the question.

It looks like it just returns the totalram_pages(). So at the moment 
nothing ever currently returns -1 or 0. Maybe that was a mistake for 
I915_MEMORY_SYSTEM.

> 
>> +
>> +    /**
>> +     * @unallocated_size: Estimate of memory remaining (-1 = unknown)
>> +     *
>> +     * Note this is only currently tracked for I915_MEMORY_CLASS_DEVICE
>> +     * regions, and also requires CAP_PERFMON or CAP_SYS_ADMIN to get
>> +     * reliable accounting. Without this(or if this an older kernel) the
> 
> s/if this an/if this is an/
> 
> Also same question as above about -1.

This should be the same as above, since this will give the same value as 
probed_size, or give the real avail value for lmem.

> 
>> +     * value here will always match the @probed_size.
>> +     */
>> +    __u64 unallocated_size;
>> +
>> +    union {
>> +        /** @rsvd1: MBZ */
>> +        __u64 rsvd1[8];
>> +        struct {
>> +            /**
>> +             * @probed_cpu_visible_size: Memory probed by the driver
>> +             * that is CPU accessible. (-1 = unknown).
> 
> Also question about -1. In this case this could be done since the field 
> is yet to be added but I am curious if it ever can be -1.

I was just going to make this the same as probed_size for system memory. 
But we could use -1 here instead. What do you think? Same for 
unallocated below.

> 
>> +             *
>> +             * This will be always be <= @probed_size, and the
>> +             * remainder(if there is any) will not be CPU
>> +             * accessible.
>> +             *
>> +             * On systems without small BAR, the @probed_size will
>> +             * always equal the @probed_cpu_visible_size, since all
>> +             * of it will be CPU accessible.
>> +             *
>> +             * Note that if the value returned here is zero, then
>> +             * this must be an old kernel which lacks the relevant
>> +             * small-bar uAPI support(including
> 
> I have noticed you prefer no space before parentheses throughout the 
> text so I guess it's just my preference to have it. Very nitpicky even 
> if I am right so up to you.

Ok, will change :)

> 
>> +             * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS), but on
>> +             * such systems we should never actually end up with a
>> +             * small BAR configuration, assuming we are able to load
>> +             * the kernel module. Hence it should be safe to treat
>> +             * this the same as when @probed_cpu_visible_size ==
>> +             * @probed_size.
>> +             */
>> +            __u64 probed_cpu_visible_size;
>> +
>> +            /**
>> +             * @unallocated_cpu_visible_size: Estimate of CPU
>> +             * visible memory remaining (-1 = unknown).
>> +             *
>> +             * Note this is only currently tracked for
>> +             * I915_MEMORY_CLASS_DEVICE regions, and also requires
>> +             * CAP_PERFMON or CAP_SYS_ADMIN to get reliable
>> +             * accounting. Without this the value here will always
>> +             * equal the @probed_cpu_visible_size.
>> +             */
>> +            __u64 unallocated_cpu_visible_size;
>> +        };
>> +    };
>> +};
>> +
>> +/**
>> + * struct __drm_i915_gem_create_ext - Existing gem_create behaviour, 
>> with added
>> + * extension support using struct i915_user_extension.
>> + *
>> + * Note that new buffer flags should be added here, at least for the 
>> stuff that
>> + * is immutable. Previously we would have two ioctls, one to create 
>> the object
>> + * with gem_create, and another to apply various parameters, however 
>> this
>> + * creates some ambiguity for the params which are considered 
>> immutable. Also in
>> + * general we're phasing out the various SET/GET ioctls.
>> + */
>> +struct __drm_i915_gem_create_ext {
>> +    /**
>> +     * @size: Requested size for the object.
>> +     *
>> +     * The (page-aligned) allocated size for the object will be 
>> returned.
>> +     *
>> +     * Note that for some devices we have might have further minimum
>> +     * page-size restrictions(larger than 4K), like for device 
>> local-memory.
>> +     * However in general the final size here should always reflect any
>> +     * rounding up, if for example using the 
>> I915_GEM_CREATE_EXT_MEMORY_REGIONS
>> +     * extension to place the object in device local-memory.
> 
> Is it defined how rounding up works when a list of regions is given 
> (like smem+lmem) and should that be explicitly mentioned here?

Yes, it uses the largest minimum page-size for the set of regions when 
doing the round_up. Will tweak.

> 
>> +     */
>> +    __u64 size;
> 
> Blank line here (etc below) maybe to match the previous doc block?

Ok, will tweak. Thanks for the comments and suggestions.

> 
> Regards,
> 
> Tvrtko
> 
>> +    /**
>> +     * @handle: Returned handle for the object.
>> +     *
>> +     * Object handles are nonzero.
>> +     */
>> +    __u32 handle;
>> +    /**
>> +     * @flags: Optional flags.
>> +     *
>> +     * Supported values:
>> +     *
>> +     * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS - Signal to the 
>> kernel that
>> +     * the object will need to be accessed via the CPU.
>> +     *
>> +     * Only valid when placing objects in I915_MEMORY_CLASS_DEVICE, 
>> and only
>> +     * strictly required on configurations where some subset of the 
>> device
>> +     * memory is directly visible/mappable through the CPU(which we also
>> +     * call small BAR), like on some DG2+ systems. Note that this is 
>> quite
>> +     * undesirable, but due to various factors like the client CPU, 
>> BIOS etc
>> +     * it's something we can expect to see in the wild. See struct
>> +     * __drm_i915_memory_region_info.probed_cpu_visible_size for how to
>> +     * determine if this system applies.
>> +     *
>> +     * Note that one of the placements MUST be 
>> I915_MEMORY_CLASS_SYSTEM, to
>> +     * ensure the kernel can always spill the allocation to system 
>> memory,
>> +     * if the object can't be allocated in the mappable part of
>> +     * I915_MEMORY_CLASS_DEVICE.
>> +     *
>> +     * Also note that since the kernel only supports flat-CCS on objects
>> +     * that can *only* be placed in I915_MEMORY_CLASS_DEVICE, we 
>> therefore
>> +     * don't support I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS 
>> together with
>> +     * flat-CCS.
>> +     *
>> +     * Without this hint, the kernel will assume that non-mappable
>> +     * I915_MEMORY_CLASS_DEVICE is preferred for this object. Note 
>> that the
>> +     * kernel can still migrate the object to the mappable part, as a 
>> last
>> +     * resort, if userspace ever CPU faults this object, but this 
>> might be
>> +     * expensive, and so ideally should be avoided.
>> +     *
>> +     * On older kernels, where usage of this flag results in an 
>> error, since
>> +     * we lack the relevant small BAR uAPI(see also struct
>> +     * __drm_i915_memory_region_info.probed_cpu_visible_size) it should
>> +     * NEVER be possible to end up with a small BAR configuration, 
>> assuming
>> +     * we can also successfully load the i915 kernel module. In such 
>> cases
>> +     * the entire I915_MEMORY_CLASS_DEVICE region will be CPU 
>> accessible,
>> +     * and as such there are zero restrictions on where the object 
>> can be
>> +     * placed.
>> +     */
>> +#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
>> +    __u32 flags;
>> +    /**
>> +     * @extensions: The chain of extensions to apply to this object.
>> +     *
>> +     * This will be useful in the future when we need to support several
>> +     * different extensions, and we need to apply more than one when
>> +     * creating the object. See struct i915_user_extension.
>> +     *
>> +     * If we don't supply any extensions then we get the same old 
>> gem_create
>> +     * behaviour.
>> +     *
>> +     * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>> +     * struct drm_i915_gem_create_ext_memory_regions.
>> +     *
>> +     * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>> +     * struct drm_i915_gem_create_ext_protected_content.
>> +     */
>> +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>> +    __u64 extensions;
>> +};
>> diff --git a/Documentation/gpu/rfc/i915_small_bar.rst 
>> b/Documentation/gpu/rfc/i915_small_bar.rst
>> new file mode 100644
>> index 000000000000..a322481cea8b
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/i915_small_bar.rst
>> @@ -0,0 +1,47 @@
>> +==========================
>> +I915 Small BAR RFC Section
>> +==========================
>> +Starting from DG2 we will have resizable BAR support for device 
>> local-memory(i.e
>> +I915_MEMORY_CLASS_DEVICE), but in some cases the final BAR size might 
>> still be
>> +smaller than the total probed_size. In such cases, only some subset of
>> +I915_MEMORY_CLASS_DEVICE will be CPU accessible(for example the first 
>> 256M),
>> +while the remainder is only accessible via the GPU.
>> +
>> +I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS flag
>> +----------------------------------------------
>> +New gem_create_ext flag to tell the kernel that a BO will require CPU 
>> access.
>> +This becomes important when placing an object in 
>> I915_MEMORY_CLASS_DEVICE, where
>> +underneath the device has a small BAR, meaning only some portion of 
>> it is CPU
>> +accessible. Without this flag the kernel will assume that CPU access 
>> is not
>> +required, and prioritize using the non-CPU visible portion of
>> +I915_MEMORY_CLASS_DEVICE.
>> +
>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>> +   :functions: __drm_i915_gem_create_ext
>> +
>> +probed_cpu_visible_size attribute
>> +---------------------------------
>> +New struct__drm_i915_memory_region attribute which returns the total 
>> size of the
>> +CPU accessible portion, for the particular region. This should only be
>> +applicable for I915_MEMORY_CLASS_DEVICE. We also report the
>> +unallocated_cpu_visible_size, alongside the unallocated_size.
>> +
>> +Vulkan will need this as part of creating a separate VkMemoryHeap 
>> with the
>> +VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT set, to represent the CPU visible 
>> portion,
>> +where the total size of the heap needs to be known. It also wants to 
>> be able to
>> +give a rough estimate of how memory can potentially be allocated.
>> +
>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>> +   :functions: __drm_i915_memory_region_info
>> +
>> +Error Capture restrictions
>> +--------------------------
>> +With error capture we have two new restrictions:
>> +
>> +    1) Error capture is best effort on small BAR systems; if the 
>> pages are not
>> +    CPU accessible, at the time of capture, then the kernel is free 
>> to skip
>> +    trying to capture them.
>> +
>> +    2) On discrete we now reject error capture on recoverable 
>> contexts. In the
>> +    future the kernel may want to blit during error capture, when for 
>> example
>> +    something is not currently CPU accessible.
>> diff --git a/Documentation/gpu/rfc/index.rst 
>> b/Documentation/gpu/rfc/index.rst
>> index 91e93a705230..5a3bd3924ba6 100644
>> --- a/Documentation/gpu/rfc/index.rst
>> +++ b/Documentation/gpu/rfc/index.rst
>> @@ -23,3 +23,7 @@ host such documentation:
>>   .. toctree::
>>       i915_scheduler.rst
>> +
>> +.. toctree::
>> +
>> +    i915_small_bar.rst
