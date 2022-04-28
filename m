Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDC51322A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 13:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0494410E67C;
	Thu, 28 Apr 2022 11:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86F010E385;
 Thu, 28 Apr 2022 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651144287; x=1682680287;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sUkmbLFTeoBDTP1v0oPMIP0Qcj7cXrMSkMN2GeEFres=;
 b=MyHEzAC8llP1PR09pdNAUjdBJe9Rgjrku80TkZe31umN5qOk3T9bzx9Y
 f2gpCCvn0sDorHErtNAJlmTXo4uVJWbjdyAZ9g4QZtZcaTWH+ZVBIupSz
 gai3imxYzvb0Qy3vql7uyfCZoAEyFMDwCrgClRoNgGiT4XLRci7yc3xdd
 j5TVpZDqu3mfHXdLDROBRAyfMOBa8qobYRrNpjJY9SP4oS1eKb93BthgS
 4kcw2qZ2GAcRTUCXLcM+MaYPNeMeoh9vcldSVZBgePycMXnhfh/QinCxF
 2AHcnzCcPK6TjqQlQauE+63xktTyPpA5PrGpLpjx7fTgExx+8Tvt2/mxO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265103840"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="265103840"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 04:11:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="514222555"
Received: from wdries-mobl1.ger.corp.intel.com (HELO [10.213.210.166])
 ([10.213.210.166])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 04:11:24 -0700
Message-ID: <56f8f771-0cd1-de95-2df5-69b71a7fbe11@linux.intel.com>
Date: Thu, 28 Apr 2022 12:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/doc: add rfc section for small BAR uapi
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220420171328.57253-1-matthew.auld@intel.com>
 <c8875f46-c0f7-1e3e-d48c-165dbc9d8b55@linux.intel.com>
 <896cba53-4c94-6de2-e8a3-ace648386576@intel.com>
 <effe7753-8948-a287-bbc6-db4675cba017@linux.intel.com>
 <c1344274-343e-ddc0-3d03-a5b69e16b182@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c1344274-343e-ddc0-3d03-a5b69e16b182@intel.com>
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
 Kenneth Graunke <kenneth@whitecape.org>, mesa-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2022 11:25, Matthew Auld wrote:
> On 28/04/2022 09:55, Tvrtko Ursulin wrote:
>>
>> On 27/04/2022 18:36, Matthew Auld wrote:
>>> On 27/04/2022 09:36, Tvrtko Ursulin wrote:
>>>>
>>>> On 20/04/2022 18:13, Matthew Auld wrote:
>>>>> Add an entry for the new uapi needed for small BAR on DG2+.
>>>>>
>>>>> v2:
>>>>>    - Some spelling fixes and other small tweaks. (Akeem & Thomas)
>>>>>    - Rework error capture interactions, including no longer needing
>>>>>      NEEDS_CPU_ACCESS for objects marked for capture. (Thomas)
>>>>>    - Add probed_cpu_visible_size. (Lionel)
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>>>>> Cc: mesa-dev@lists.freedesktop.org
>>>>> ---
>>>>>   Documentation/gpu/rfc/i915_small_bar.h   | 190 
>>>>> +++++++++++++++++++++++
>>>>>   Documentation/gpu/rfc/i915_small_bar.rst |  58 +++++++
>>>>>   Documentation/gpu/rfc/index.rst          |   4 +
>>>>>   3 files changed, 252 insertions(+)
>>>>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
>>>>>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
>>>>>
>>>>> diff --git a/Documentation/gpu/rfc/i915_small_bar.h 
>>>>> b/Documentation/gpu/rfc/i915_small_bar.h
>>>>> new file mode 100644
>>>>> index 000000000000..7bfd0cf44d35
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/rfc/i915_small_bar.h
>>>>> @@ -0,0 +1,190 @@
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
>>>>> +
>>>>> +    /** @unallocated_size: Estimate of memory remaining (-1 = 
>>>>> unknown) */
>>>>> +    __u64 unallocated_size;
>>>>> +
>>>>> +    union {
>>>>> +        /** @rsvd1: MBZ */
>>>>> +        __u64 rsvd1[8];
>>>>> +        struct {
>>>>> +            /**
>>>>> +             * @probed_cpu_visible_size: Memory probed by the driver
>>>>> +             * that is CPU accessible. (-1 = unknown).
>>>>> +             *
>>>>> +             * This will be always be <= @probed_size, and the
>>>>> +             * remainder(if there is any) will not be CPU
>>>>> +             * accessible.
>>>>> +             */
>>>>> +            __u64 probed_cpu_visible_size;
>>>>
>>>> Would unallocated_cpu_visible_size be useful, to follow the total 
>>>> unallocated_size?
>>>
>>> Make sense. But I don't think unallocated_size has actually been 
>>> properly wired up yet. It still just gives the same value as 
>>> probed_size. IIRC for unallocated_size we still need a real 
>>> user/usecase/umd, before wiring that up for real with the existing 
>>> avail tracking. Once we have that we can also add 
>>> unallocated_cpu_visible_size.
>>
>> So this does nothing at the moment:
>>
>>   info.unallocated_size = mr->avail;
>>
>> Right, it is set to "mem->avail = mem->total;" at region init time and 
>> I indeed can't find it ever getting modified. Okay.
>>
>>>> Btw, have we ever considered whether unallocated_size should require 
>>>> CAP_SYS_ADMIN/PERFMON or something?
>>>
>>> Note sure. But just in case we do add it for real at some point, why 
>>> the added restriction?
>>
>> To avoid a side channel, albeit perhaps a very weak one. For engine 
>> utilization we require CAP_SYS_PERFMON, but that is implied by the 
>> perf core API. It's open for discussion. I guess it may make sense to 
>> limit it also because it is questionable the field(s) are even useful.
>>
>>>
>>>>
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
>>>>> +     * page-size restrictions(larger than 4K), likefor device 
>>>>> local-memory.
>>>>> +     * However in general the final size here should always 
>>>>> reflect any
>>>>> +     * rounding up, if for example using the 
>>>>> I915_GEM_CREATE_EXT_MEMORY_REGIONS
>>>>> +     * extension to place the object in device local-memory.
>>>>> +     */
>>>>> +    __u64 size;
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
>>>>> I915_MEMORY_CLASS_DEVICE, and
>>>>> +     * only strictly required on platforms where only some of the 
>>>>> device
>>>>> +     * memory is directly visible or mappable through the CPU, 
>>>>> like on DG2+.
>>>>> +     *
>>>>> +     * One of the placements MUST also be 
>>>>> I915_MEMORY_CLASS_SYSTEM, to
>>>>> +     * ensure we can always spill the allocation tosystem memory, 
>>>>> if we
>>>>> +     * can't place the object in the mappable part of
>>>>> +     * I915_MEMORY_CLASS_DEVICE.
>>>>> +     *
>>>>> +     * Note that since the kernel only supports flat-CCS on 
>>>>> objects that can
>>>>> +     * *only* be placed in I915_MEMORY_CLASS_DEVICE, we therefore 
>>>>> don't
>>>>> +     * support I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS together 
>>>>> with
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
>>>>> +     */
>>>>
>>>> So "needs_cpu_access" flag could almost be viewed as a sub-region 
>>>> placement priority? What I mean is this:
>>>>
>>>> 1)
>>>> placements=device,system flags=
>>>>
>>>> This results in placement priorities: device, device_cpu_mappable, 
>>>> system.
>>>
>>> Yup.
>>>
>>>>
>>>> 2)
>>>> placements=device,system flags=needs_cpu_access
>>>>
>>>> This results in placement priorities: device_cpu_mappable, device, 
>>>> system.
>>>
>>> Here it would only be: device_cpu_mappable, system. We would 
>>> completely ignore "device" in this case.
>>>
>>>>
>>>> Is this correct?
>>>>
>>>> The benefit of the flag is that i915 can place the object to the 
>>>> right place from the start instead of on the first CPU access? Is 
>>>> that worth it or is there more to it?
>>>
>>> Yeah, the object will only be placed somewhere that is also CPU 
>>> mappable, with the flag set.
>>
>> Hm, wouldn't it be more efficient to be able to migrate it over to 
>> non-mappable in cases when mappable is over-subscribed?
> 
> Not sure. As an alternative strategy, I guess that might be interesting, 
> and if userspace wants something like that we can always add a new flag 
> I guess? It's a toss up whether just using system memory is better/worse 
> than incurring an extra move at fault time?

For me it doesn't make sense to allow bos wo/ cpu mappable flag to use 
the mappable section (albeit as 2nd priority) and not allowing the cpu 
mappable ones to temporarily go anywhere in lmem.

 From i915 side it needs to know the allowed regions (for this argument 
I speak of mappable / non-mappable as separate regions, even if uapi 
does not expose them as separate memory regions). i915 does not know in 
advance the exact usage pattern.

In case of multiple clients, one might touch a buffer from the CPU once 
and then render with GPU many times. Another client might touch from CPU 
a lot more. With mappable space contention this would cause the buffer 
from the first client to constantly get migrated between smem and lmem, 
while in reality it could have been migrated to non mappable lmem and 
used by the GPU without any problems.

As some sort of diagram:

	Client A BO	Client B BO
	--------------	--------------
	CPU access		
			CPU access (Client A BO "evicted" to smem)
	GPU access	GPU access
	GPU access	CPU access
	GPU access	GPU access

If we assume there is only space for one BO in mappable, allowing 
non-mappable placement allows Client A to be unaffected by Client B 
activity. While with the current proposal it needlessly takes a hit on 
every, or every other GPU access.

So I think, if there isn't a fundamental reason to disallow it which I 
am missing, not limiting the implied placement when cpu access flag is 
given is beneficial to flexibility of migration decisions i915 can make.

Regards,

Tvrtko

> 
>>
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
>>>>> +     * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usagesee
>>>>> +     * struct drm_i915_gem_create_ext_memory_regions.
>>>>> +     *
>>>>> +     * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>>>> +     * struct drm_i915_gem_create_ext_protected_content.
>>>>> +     */
>>>>> +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>>>> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>>>> +    __u64 extensions;
>>>>> +};
>>>>> +
>>>>> +#define DRM_I915_QUERY_VMA_INFO    5
>>>>> +
>>>>> +/**
>>>>> + * struct __drm_i915_query_vma_info
>>>>> + *
>>>>> + * Given a vm and GTT address, lookup the corresponding vma, 
>>>>> returning its set
>>>>> + * of attributes.
>>>>> + *
>>>>> + * .. code-block:: C
>>>>> + *
>>>>> + *    struct drm_i915_query_vma_info info = {};
>>>>> + *    struct drm_i915_query_item item = {
>>>>> + *        .data_ptr = (uintptr_t)&info,
>>>>> + *        .query_id = DRM_I915_QUERY_VMA_INFO,
>>>>> + *    };
>>>>> + *    struct drm_i915_query query = {
>>>>> + *        .num_items = 1,
>>>>> + *        .items_ptr = (uintptr_t)&item,
>>>>> + *    };
>>>>> + *    int err;
>>>>> + *
>>>>> + *    // Unlike some other types of queries, there is noneed to 
>>>>> first query
>>>>> + *    // the size of the data_ptr blob here, since we already know 
>>>>> ahead of
>>>>> + *    // time how big this needs to be.
>>>>> + *    item.length = sizeof(info);
>>>>> + *
>>>>> + *    // Next we fill in the vm_id and ppGTT address of the vma we 
>>>>> wish
>>>>> + *    // to query, before then firing off the query.
>>>>> + *    info.vm_id = vm_id;
>>>>> + *    info.offset = gtt_address;
>>>>> + *    err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
>>>>> + *    if (err || item.length < 0) ...
>>>>> + *
>>>>> + *    // If all went well we can now inspect the returned attributes.
>>>>> + *    if (info.attributes & DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE) ...
>>>>> + */
>>>>> +struct __drm_i915_query_vma_info {
>>>>> +    /**
>>>>> +     * @vm_id: The given vm id that contains the vma. The id is 
>>>>> the value
>>>>> +     * returned by the DRM_I915_GEM_VM_CREATE. See struct
>>>>> +     * drm_i915_gem_vm_control.vm_id.
>>>>> +     */
>>>>> +    __u32 vm_id;
>>>>> +    /** @pad: MBZ. */
>>>>> +    __u32 pad;
>>>>> +    /**
>>>>> +     * @offset: The corresponding ppGTT address of the vma which 
>>>>> the kernel
>>>>> +     * will use to perform the lookup.
>>>>> +     */
>>>>> +    __u64 offset;
>>>>> +    /**
>>>>> +     * @attributes: The returned attributes for thegiven vma.
>>>>> +     *
>>>>> +     * Possible values:
>>>>> +     *
>>>>> +     * DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE - Set ifthe pages 
>>>>> backing the
>>>>> +     * vma are currently CPU accessible. If this isnot set then 
>>>>> the vma is
>>>>> +     * currently backed by I915_MEMORY_CLASS_DEVICEmemory, which 
>>>>> the CPU
>>>>> +     * cannot directly access(this is only possibleon discrete 
>>>>> devices with
>>>>> +     * a small BAR). Attempting to MMAP and fault such an object will
>>>>> +     * require the kernel first synchronising any GPU work tied to 
>>>>> the
>>>>> +     * object, before then migrating the pages, either to the CPU 
>>>>> accessible
>>>>> +     * part of I915_MEMORY_CLASS_DEVICE, or 
>>>>> I915_MEMORY_CLASS_SYSTEM, if the
>>>>> +     * placements permit it. See 
>>>>> I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS.
>>>>> +     *
>>>>> +     * Note that this is inherently racy.
>>>>> +     */
>>>>> +#define DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE (1<<0)
>>>>> +    __u64 attributes;
>>>>> +    /** @rsvd: MBZ */
>>>>> +    __u32 rsvd[4];
>>>>> +};
>>>>> diff --git a/Documentation/gpu/rfc/i915_small_bar.rst 
>>>>> b/Documentation/gpu/rfc/i915_small_bar.rst
>>>>> new file mode 100644
>>>>> index 000000000000..be3d9bcdd86d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/rfc/i915_small_bar.rst
>>>>> @@ -0,0 +1,58 @@
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
>>>>> +applicable for I915_MEMORY_CLASS_DEVICE.
>>>>> +
>>>>> +Vulkan will need this as part of creating a separate VkMemoryHeap 
>>>>> with the
>>>>> +VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT set, to represent the CPU 
>>>>> visible portion,
>>>>> +where the total size of the heap needs to be known.
>>>>> +
>>>>> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
>>>>> +   :functions: __drm_i915_memory_region_info
>>>>> +
>>>>> +DRM_I915_QUERY_VMA_INFO query
>>>>> +-----------------------------
>>>>> +Query the attributes of some vma. Given a vm and GTT offset, find the
>>>>> +respective vma, and return its set of attributes. For now we only 
>>>>> support
>>>>> +DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE, which is set if the 
>>>>> object/vma is
>>>>> +currently placed in memory that is accessible by the CPU. This 
>>>>> should always be
>>>>> +set on devices where the CPU probed_cpu_visible_size of 
>>>>> I915_MEMORY_CLASS_DEVICE
>>>>> +matches the probed_size. If this is not set then CPU faulting the 
>>>>> object will
>>>>> +likely first require migrating the pages.
>>>>
>>>> I think there should be justification for the new query documented 
>>>> as well. (Why on top of what.)
>>>
>>> Yeah, I'm wondering now if we can just drop this part of the uapi, 
>>> for now at least, and focus on landing the new flag stuff first.
>>>
>>>>
>>>> Without it personally I can't immediately understand why the 
>>>> disconnect between the object based and VMA based API. Userspace has 
>>>> to do some intervening operations like either execbuf, or vm bind in 
>>>> the future, to make this query usable after object creation. So 
>>>> question is why wouldn't it know already which placements it allowed 
>>>> and so would i915 auto-migrate or not for this particular object. 
>>>> No? Or in other words why this wouldn't be an object based query 
>>>> since the question it is answering is about the object backing store 
>>>> and not the VMA.
>>>
>>> Yeah, just using the object handle or so I guess would also work. 
>>> Thanks for the comments.
>>
>> I saw other folks have said the same so omitting for now sounds good 
>> to me indeed.
>>
>> Regards,
>>
>> Tvrtko
