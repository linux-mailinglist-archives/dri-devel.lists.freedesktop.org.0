Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4E52A39D
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0618510E6B6;
	Tue, 17 May 2022 13:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9610E6B6;
 Tue, 17 May 2022 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652794727; x=1684330727;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fYqxX+yIv7Ph8QiktZIwxzGzE/A47v33dJx/8NVstQo=;
 b=I9/SsPRZXdKm1YqNA8xBMIoOZZN/HQ/9qYHxZwBvq0dv9XZ+1+jCxJcs
 YUnam84SM+isEJWyIfi7WnWu5Yo4Sk6ZOIG124Hy+jV4rOXl/ZlOLFe0P
 mOnRovtK+Xfoajh4no+oWq/VaF1z/wieRw7gqLpA4aM+yTk23pYe7ze8m
 Bx1LfXip9mxBBpO9e5LXiEzgjlYxbrP/uP64qXvBez2aEo86frurefws1
 zOyi68/kjzF/LRasKYw8noKpWqt49Hcfzp4esF4SlFTTs7QXsbWpjHSSL
 28kon04UYHR5yHK2gPaWPLW8omfdYcBYfGs3jccjLuTHTd4YFK0MSDWtU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271308305"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="271308305"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 06:38:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="597131053"
Received: from aghafar-mobl1.ger.corp.intel.com (HELO [10.213.210.37])
 ([10.213.210.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 06:38:44 -0700
Message-ID: <8694e7b5-2ce8-2aa5-a6f4-88b00271e249@linux.intel.com>
Date: Tue, 17 May 2022 14:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] drm/doc: add rfc section for small BAR uapi
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220516181152.1236708-1-matthew.auld@intel.com>
 <bcea3c24-b9a4-f889-94ad-40c668ab42ac@linux.intel.com>
 <a60771bd-4f02-ca46-b202-5685c8df1393@intel.com>
 <bc190b2d-49d1-bd15-a53a-86da5aa1c6d9@linux.intel.com>
 <e3df207c-ddcf-3fe8-6ed2-84ed34992df8@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e3df207c-ddcf-3fe8-6ed2-84ed34992df8@intel.com>
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
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, mesa-dev@lists.freedesktop.org,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/05/2022 10:39, Lionel Landwerlin wrote:
> On 17/05/2022 12:23, Tvrtko Ursulin wrote:
>>
>> On 17/05/2022 09:55, Lionel Landwerlin wrote:
>>> On 17/05/2022 11:29, Tvrtko Ursulin wrote:
>>>>
>>>> On 16/05/2022 19:11, Matthew Auld wrote:
>>>>> Add an entry for the new uapi needed for small BAR on DG2+.
>>>>>
>>>>> v2:
>>>>>    - Some spelling fixes and other small tweaks. (Akeem & Thomas)
>>>>>    - Rework error capture interactions, including no longer needing
>>>>>      NEEDS_CPU_ACCESS for objects marked for capture. (Thomas)
>>>>>    - Add probed_cpu_visible_size. (Lionel)
>>>>> v3:
>>>>>    - Drop the vma query for now.
>>>>>    - Add unallocated_cpu_visible_size as part of the region query.
>>>>>    - Improve the docs some more, including documenting the expected
>>>>>      behaviour on older kernels, since this came up in some offline
>>>>>      discussion.
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>>>>> Cc: mesa-dev@lists.freedesktop.org
>>>>> ---
>>>>>   Documentation/gpu/rfc/i915_small_bar.h   | 164 
>>>>> +++++++++++++++++++++++
>>>>>   Documentation/gpu/rfc/i915_small_bar.rst |  47 +++++++
>>>>>   Documentation/gpu/rfc/index.rst          |   4 +
>>>>>   3 files changed, 215 insertions(+)
>>>>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
>>>>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
>>>>>
>>>>> diff --git a/Documentation/gpu/rfc/i915_small_bar.h 
>>>>> b/Documentation/gpu/rfc/i915_small_bar.h
>>>>> new file mode 100644
>>>>> index 000000000000..4079d287750b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/rfc/i915_small_bar.h
>>>>> @@ -0,0 +1,164 @@
>>>>> +/**
>>>>> + * struct __drm_i915_memory_region_info - Describes one region as 
>>>>> known to the
>>>>> + * driver.
>>>>> + *
>>>>> + * Note this is using both struct drm_i915_query_item and struct 
>>>>> drm_i915_query.
>>>>> + * For this new query we are adding the new query id 
>>>>> DRM_I915_QUERY_MEMORY_REGIONS
>>>>> + * at &drm_i915_query_item.query_id.
>>>>> + */
>>>>> +struct __drm_i915_memory_region_info {
>>>>> +    /** @region: The class:instance pair encoding */
>>>>> +    struct drm_i915_gem_memory_class_instance region;
>>>>> +
>>>>> +    /** @rsvd0: MBZ */
>>>>> +    __u32 rsvd0;
>>>>> +
>>>>> +    /** @probed_size: Memory probed by the driver (-1 = unknown) */
>>>>> +    __u64 probed_size;
>>>>
>>>> Is -1 possible today or when it will be? For system memory it 
>>>> appears zeroes are returned today so that has to stay I think. Does 
>>>> it effectively mean userspace has to consider both 0 and -1 as 
>>>> unknown is the question.
>>>
>>>
>>> I raised this on v2. As far as I can tell there are no situation 
>>> where we would get -1.
>>>
>>> Is it really probed_size=0 on smem?? It's not the case on the 
>>> internal branch.
>>
>> My bad, I misread the arguments to intel_memory_region_create while 
>> grepping:
>>
>> struct intel_memory_region *i915_gem_shmem_setup(struct 
>> drm_i915_private *i915,
>>                          u16 type, u16 instance)
>> {
>>     return intel_memory_region_create(i915, 0,
>>                       totalram_pages() << PAGE_SHIFT,
>>                       PAGE_SIZE, 0, 0,
>>                       type, instance,
>>                       &shmem_region_ops);
>>
>> I saw "0, 0" and wrongly assumed that would be the data, since it 
>> matched with my mental model and the comment against unallocated_size 
>> saying it's only tracked for device memory.
>>
>> Although I'd say it is questionable for i915 to return this data. I 
>> wonder it use case is possible where it would even be wrong but don't 
>> know. I guess the cat is out of the bag now.
> 
> 
> Not sure how questionable that is. There are a bunch of tools reporting 
> the amount of memory available (free, top, htop, etc...).
> 
> It might not be totalram_pages() but probably something close to it.

Questionable as it being a resource driver does not own so it reporting 
it is a pure userspace convenience and maintenance burden for the 
driver. :) Not sure I understand why userspace even wants to know? Only 
reliable use could be to decide whether to even try and run a workload? 
But in that case too perhaps users wants to run it with swapping so let 
them.

There is also the question memory accounting and a process could be 
running in a container with a limited view of the world (totalram_pages 
would be wrong). Although granted, we bypass memory accounting at the 
moment. Not sure what was the discussion on that before. Probably 
because one process can create an object and another can instantiate the 
backing store. Whether or not we could, or should, therefore account 
against the real creator is the question. But if we one day did, then 
we'd have to fiddle with the memory query to stop returning 
totalram_pages() and that would potentially be complicated. Well 
"would".. we probably will since this is already shipping.

Regards,

Tvrtko

> 
> Having a non 0 & non -1 value is useful.
> 
> 
> -Lionel
> 
> 
>>
>> If the situation is -1 for unknown and some valid size (not zero) I 
>> don't think there is a problem here.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Anv is not currently handling that case.
>>>
>>>
>>> I would very much like to not deal with 0 for smem.
>>>
>>> It really makes it easier for userspace rather than having to fish 
>>> information from 2 different places and on top of dealing with 
>>> multiple kernel versions.
>>>
>>>
>>> -Lionel
>>>
>>>
>>>>
>>>>> +
>>>>> +    /**
>>>>> +     * @unallocated_size: Estimate of memory remaining (-1 = unknown)
>>>>> +     *
>>>>> +     * Note this is only currently tracked for 
>>>>> I915_MEMORY_CLASS_DEVICE
>>>>> +     * regions, and also requires CAP_PERFMON or CAP_SYS_ADMIN to get
>>>>> +     * reliable accounting. Without this(or if this an older 
>>>>> kernel) the
>>>>
>>>> s/if this an/if this is an/
>>>>
>>>> Also same question as above about -1.
>>>>
>>>>> +     * value here will always match the @probed_size.
>>>>> +     */
>>>>> +    __u64 unallocated_size;
>>>>> +
>>>>> +    union {
>>>>> +        /** @rsvd1: MBZ */
>>>>> +        __u64 rsvd1[8];
>>>>> +        struct {
>>>>> +            /**
>>>>> +             * @probed_cpu_visible_size: Memory probed by the driver
>>>>> +             * that is CPU accessible. (-1 = unknown).
>>>>
>>>> Also question about -1. In this case this could be done since the 
>>>> field is yet to be added but I am curious if it ever can be -1.
>>>>
>>>>> +             *
>>>>> +             * This will be always be <= @probed_size, and the
>>>>> +             * remainder(if there is any) will not be CPU
>>>>> +             * accessible.
>>>>> +             *
>>>>> +             * On systems without small BAR, the @probed_size will
>>>>> +             * always equal the @probed_cpu_visible_size, since all
>>>>> +             * of it will be CPU accessible.
>>>>> +             *
>>>>> +             * Note that if the value returned here is zero, then
>>>>> +             * this must be an old kernel which lacks the relevant
>>>>> +             * small-bar uAPI support(including
>>>>
>>>> I have noticed you prefer no space before parentheses throughout the 
>>>> text so I guess it's just my preference to have it. Very nitpicky 
>>>> even if I am right so up to you.
>>>>
>>>>> +             * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS), but on
>>>>> +             * such systems we should never actually end up with a
>>>>> +             * small BAR configuration, assuming we are able to load
>>>>> +             * the kernel module. Hence it should be safe to treat
>>>>> +             * this the same as when @probed_cpu_visible_size ==
>>>>> +             * @probed_size.
>>>>> +             */
>>>>> +            __u64 probed_cpu_visible_size;
>>>>> +
>>>>> +            /**
>>>>> +             * @unallocated_cpu_visible_size: Estimate of CPU
>>>>> +             * visible memory remaining (-1 = unknown).
>>>>> +             *
>>>>> +             * Note this is only currently tracked for
>>>>> +             * I915_MEMORY_CLASS_DEVICE regions, and also requires
>>>>> +             * CAP_PERFMON or CAP_SYS_ADMIN to get reliable
>>>>> +             * accounting. Without this the value here will always
>>>>> +             * equal the @probed_cpu_visible_size.
>>>>> +             */
>>>>> +            __u64 unallocated_cpu_visible_size;
>>>>> +        };
>>>>> +    };
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct __drm_i915_gem_create_ext - Existing gem_create 
>>>>> behaviour, with added
>>>>> + * extension support using struct i915_user_extension.
>>>>> + *
>>>>> + * Note that new buffer flags should be added here, at least for 
>>>>> the stuff that
>>>>> + * is immutable. Previously we would have two ioctls, one to 
>>>>> create the object
>>>>> + * with gem_create, and another to apply various parameters, 
>>>>> however this
>>>>> + * creates some ambiguity for the params which are considered 
>>>>> immutable. Also in
>>>>> + * general we're phasing out the various SET/GET ioctls.
>>>>> + */
>>>>> +struct __drm_i915_gem_create_ext {
>>>>> +    /**
>>>>> +     * @size: Requested size for the object.
>>>>> +     *
>>>>> +     * The (page-aligned) allocated size for the object will be 
>>>>> returned.
>>>>> +     *
>>>>> +     * Note that for some devices we have might have further minimum
>>>>> +     * page-size restrictions(larger than 4K), like for device 
>>>>> local-memory.
>>>>> +     * However in general the final size here should always 
>>>>> reflect any
>>>>> +     * rounding up, if for example using the 
>>>>> I915_GEM_CREATE_EXT_MEMORY_REGIONS
>>>>> +     * extension to place the object in device local-memory.
>>>>
>>>> Is it defined how rounding up works when a list of regions is given 
>>>> (like smem+lmem) and should that be explicitly mentioned here?
>>>>
>>>>> +     */
>>>>> +    __u64 size;
>>>>
>>>> Blank line here (etc below) maybe to match the previous doc block?
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> +    /**
>>>>> +     * @handle: Returned handle for the object.
>>>>> +     *
>>>>> +     * Object handles are nonzero.
>>>>> +     */
>>>>> +    __u32 handle;
>>>>> +    /**
>>>>> +     * @flags: Optional flags.
>>>>> +     *
>>>>> +     * Supported values:
>>>>> +     *
>>>>> +     * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS - Signal to the 
>>>>> kernel that
>>>>> +     * the object will need to be accessed via the CPU.
>>>>> +     *
>>>>> +     * Only valid when placing objects in 
>>>>> I915_MEMORY_CLASS_DEVICE, and only
>>>>> +     * strictly required on configurations where some subset of 
>>>>> the device
>>>>> +     * memory is directly visible/mappable through the CPU(which 
>>>>> we also
>>>>> +     * call small BAR), like on some DG2+ systems. Note that this 
>>>>> is quite
>>>>> +     * undesirable, but due to various factors like the client 
>>>>> CPU, BIOS etc
>>>>> +     * it's something we can expect to see in the wild. See struct
>>>>> +     * __drm_i915_memory_region_info.probed_cpu_visible_size for 
>>>>> how to
>>>>> +     * determine if this system applies.
>>>>> +     *
>>>>> +     * Note that one of the placements MUST be 
>>>>> I915_MEMORY_CLASS_SYSTEM, to
>>>>> +     * ensure the kernel can always spill the allocation to system 
>>>>> memory,
>>>>> +     * if the object can't be allocated in the mappable part of
>>>>> +     * I915_MEMORY_CLASS_DEVICE.
>>>>> +     *
>>>>> +     * Also note that since the kernel only supports flat-CCS on 
>>>>> objects
>>>>> +     * that can *only* be placed in I915_MEMORY_CLASS_DEVICE, we 
>>>>> therefore
>>>>> +     * don't support I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS 
>>>>> together with
>>>>> +     * flat-CCS.
>>>>> +     *
>>>>> +     * Without this hint, the kernel will assume that non-mappable
>>>>> +     * I915_MEMORY_CLASS_DEVICE is preferred for this object. Note 
>>>>> that the
>>>>> +     * kernel can still migrate the object to the mappable part, 
>>>>> as a last
>>>>> +     * resort, if userspace ever CPU faults this object, but this 
>>>>> might be
>>>>> +     * expensive, and so ideally should be avoided.
>>>>> +     *
>>>>> +     * On older kernels, where usage of this flag results in an 
>>>>> error, since
>>>>> +     * we lack the relevant small BAR uAPI(see also struct
>>>>> +     * __drm_i915_memory_region_info.probed_cpu_visible_size) it 
>>>>> should
>>>>> +     * NEVER be possible to end up with a small BAR configuration, 
>>>>> assuming
>>>>> +     * we can also successfully load the i915 kernel module. In 
>>>>> such cases
>>>>> +     * the entire I915_MEMORY_CLASS_DEVICE region will be CPU 
>>>>> accessible,
>>>>> +     * and as such there are zero restrictions on where the object 
>>>>> can be
>>>>> +     * placed.
>>>>> +     */
>>>>> +#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
>>>>> +    __u32 flags;
>>>>> +    /**
>>>>> +     * @extensions: The chain of extensions to apply to this object.
>>>>> +     *
>>>>> +     * This will be useful in the future when we need to support 
>>>>> several
>>>>> +     * different extensions, and we need to apply more than one when
>>>>> +     * creating the object. See struct i915_user_extension.
>>>>> +     *
>>>>> +     * If we don't supply any extensions then we get the same old 
>>>>> gem_create
>>>>> +     * behaviour.
>>>>> +     *
>>>>> +     * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>>>>> +     * struct drm_i915_gem_create_ext_memory_regions.
>>>>> +     *
>>>>> +     * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>>>> +     * struct drm_i915_gem_create_ext_protected_content.
>>>>> +     */
>>>>> +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>>>> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>>>> +    __u64 extensions;
>>>>> +};
>>>>> diff --git a/Documentation/gpu/rfc/i915_small_bar.rst 
>>>>> b/Documentation/gpu/rfc/i915_small_bar.rst
>>>>> new file mode 100644
>>>>> index 000000000000..a322481cea8b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/rfc/i915_small_bar.rst
>>>>> @@ -0,0 +1,47 @@
>>>>> +==========================
>>>>> +I915 Small BAR RFC Section
>>>>> +==========================
>>>>> +Starting from DG2 we will have resizable BAR support for device 
>>>>> local-memory(i.e
>>>>> +I915_MEMORY_CLASS_DEVICE), but in some cases the final BAR size 
>>>>> might still be
>>>>> +smaller than the total probed_size. In such cases, only some 
>>>>> subset of
>>>>> +I915_MEMORY_CLASS_DEVICE will be CPU accessible(for example the 
>>>>> first 256M),
>>>>> +while the remainder is only accessible via the GPU.
>>>>> +
>>>>> +I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS flag
>>>>> +----------------------------------------------
>>>>> +New gem_create_ext flag to tell the kernel that a BO will require 
>>>>> CPU access.
>>>>> +This becomes important when placing an object in 
>>>>> I915_MEMORY_CLASS_DEVICE, where
>>>>> +underneath the device has a small BAR, meaning only some portion 
>>>>> of it is CPU
>>>>> +accessible. Without this flag the kernel will assume that CPU 
>>>>> access is not
>>>>> +required, and prioritize using the non-CPU visible portion of
>>>>> +I915_MEMORY_CLASS_DEVICE.
>>>>> +
>>>>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>>>>> +   :functions: __drm_i915_gem_create_ext
>>>>> +
>>>>> +probed_cpu_visible_size attribute
>>>>> +---------------------------------
>>>>> +New struct__drm_i915_memory_region attribute which returns the 
>>>>> total size of the
>>>>> +CPU accessible portion, for the particular region. This should 
>>>>> only be
>>>>> +applicable for I915_MEMORY_CLASS_DEVICE. We also report the
>>>>> +unallocated_cpu_visible_size, alongside the unallocated_size.
>>>>> +
>>>>> +Vulkan will need this as part of creating a separate VkMemoryHeap 
>>>>> with the
>>>>> +VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT set, to represent the CPU 
>>>>> visible portion,
>>>>> +where the total size of the heap needs to be known. It also wants 
>>>>> to be able to
>>>>> +give a rough estimate of how memory can potentially be allocated.
>>>>> +
>>>>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>>>>> +   :functions: __drm_i915_memory_region_info
>>>>> +
>>>>> +Error Capture restrictions
>>>>> +--------------------------
>>>>> +With error capture we have two new restrictions:
>>>>> +
>>>>> +    1) Error capture is best effort on small BAR systems; if the 
>>>>> pages are not
>>>>> +    CPU accessible, at the time of capture, then the kernel is 
>>>>> free to skip
>>>>> +    trying to capture them.
>>>>> +
>>>>> +    2) On discrete we now reject error capture on recoverable 
>>>>> contexts. In the
>>>>> +    future the kernel may want to blit during error capture, when 
>>>>> for example
>>>>> +    something is not currently CPU accessible.
>>>>> diff --git a/Documentation/gpu/rfc/index.rst 
>>>>> b/Documentation/gpu/rfc/index.rst
>>>>> index 91e93a705230..5a3bd3924ba6 100644
>>>>> --- a/Documentation/gpu/rfc/index.rst
>>>>> +++ b/Documentation/gpu/rfc/index.rst
>>>>> @@ -23,3 +23,7 @@ host such documentation:
>>>>>   .. toctree::
>>>>>         i915_scheduler.rst
>>>>> +
>>>>> +.. toctree::
>>>>> +
>>>>> +    i915_small_bar.rst
>>>
>>>
> 
