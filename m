Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A336412F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 14:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD266E2C7;
	Mon, 19 Apr 2021 12:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8D6E222;
 Mon, 19 Apr 2021 12:02:53 +0000 (UTC)
IronPort-SDR: 86uyzgQ3QTvREhOk7Cy3UcYdkJ50sv4nceyPpcBUoBsTg8j3KkFvrSj4OqrEa56cOFouqeFPso
 4Y0zcIOOOfug==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="280636276"
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="280636276"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 05:02:47 -0700
IronPort-SDR: rkQnMaizmX4gKMIfXlWndWr5lrDr/mjWea7RJPatIRnC/oNaULIjGuXSEL7O7MD+//9mRnsmbw
 WHDOC2TOFkSQ==
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="419973623"
Received: from vpjampan-mobl2.ger.corp.intel.com (HELO [10.252.9.192])
 ([10.252.9.192])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 05:02:45 -0700
Subject: Re: [PATCH v3 4/4] drm/doc/rfc: i915 DG1 uAPI
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-4-matthew.auld@intel.com>
 <CAOFGe96QALJa4FbWkVxczTdOA6b41zk1GxdYwRsrP7GwSZ4zvw@mail.gmail.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <6cf790c7-84bf-4d35-c1c3-4cf826655faf@intel.com>
Date: Mon, 19 Apr 2021 13:02:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe96QALJa4FbWkVxczTdOA6b41zk1GxdYwRsrP7GwSZ4zvw@mail.gmail.com>
Content-Language: en-GB
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2021 17:38, Jason Ekstrand wrote:
> On Thu, Apr 15, 2021 at 11:04 AM Matthew Auld <matthew.auld@intel.com> wrote:
>>
>> Add an entry for the new uAPI needed for DG1.
>>
>> v2(Daniel):
>>    - include the overall upstreaming plan
>>    - add a note for mmap, there are differences here for TTM vs i915
>>    - bunch of other suggestions from Daniel
>> v3:
>>   (Daniel)
>>    - add a note for set/get caching stuff
>>    - add some more docs for existing query and extensions stuff
>>    - add an actual code example for regions query
>>    - bunch of other stuff
>>   (Jason)
>>    - uAPI change(!):
>>          - try a simpler design with the placements extension
>>          - rather than have a generic setparam which can cover multiple
>>            use cases, have each extension be responsible for one thing
>>            only
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: mesa-dev@lists.freedesktop.org
>> ---
>>   Documentation/gpu/rfc/i915_gem_lmem.h   | 255 ++++++++++++++++++++++++
>>   Documentation/gpu/rfc/i915_gem_lmem.rst | 139 +++++++++++++
>>   Documentation/gpu/rfc/index.rst         |   4 +
>>   3 files changed, 398 insertions(+)
>>   create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.h
>>   create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst
>>
>> diff --git a/Documentation/gpu/rfc/i915_gem_lmem.h b/Documentation/gpu/rfc/i915_gem_lmem.h
>> new file mode 100644
>> index 000000000000..2a82a452e9f2
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/i915_gem_lmem.h
>> @@ -0,0 +1,255 @@
>> +/*
>> + * Note that drm_i915_query_item and drm_i915_query are existing bits of uAPI.
>> + * For the regions query we are just adding a new query id, so no actual new
>> + * ioctl or anything, but including it here for reference.
>> + */
>> +struct drm_i915_query_item {
>> +#define DRM_I915_QUERY_MEMORY_REGIONS   0xdeadbeaf
>> +       ....
>> +        __u64 query_id;
>> +
>> +        /*
>> +         * When set to zero by userspace, this is filled with the size of the
>> +         * data to be written at the data_ptr pointer. The kernel sets this
>> +         * value to a negative value to signal an error on a particular query
>> +         * item.
>> +         */
>> +        __s32 length;
>> +
>> +        __u32 flags;
>> +        /*
>> +         * Data will be written at the location pointed by data_ptr when the
>> +         * value of length matches the length of the data to be written by the
>> +         * kernel.
>> +         */
>> +        __u64 data_ptr;
>> +};
>> +
>> +struct drm_i915_query {
>> +        __u32 num_items;
>> +        /*
>> +         * Unused for now. Must be cleared to zero.
>> +         */
>> +        __u32 flags;
>> +        /*
>> +         * This points to an array of num_items drm_i915_query_item structures.
>> +         */
>> +        __u64 items_ptr;
>> +};
>> +
>> +#define DRM_IOCTL_I915_QUERY   DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
>> +
>> +/**
>> + * enum drm_i915_gem_memory_class
>> + */
>> +enum drm_i915_gem_memory_class {
>> +       /** @I915_MEMORY_CLASS_SYSTEM: system memory */
>> +       I915_MEMORY_CLASS_SYSTEM = 0,
>> +       /** @I915_MEMORY_CLASS_DEVICE: device local-memory */
>> +       I915_MEMORY_CLASS_DEVICE,
>> +};
>> +
>> +/**
>> + * struct drm_i915_gem_memory_class_instance
>> + */
>> +struct drm_i915_gem_memory_class_instance {
>> +       /** @memory_class: see enum drm_i915_gem_memory_class */
>> +       __u16 memory_class;
>> +
>> +       /** @memory_instance: which instance */
>> +       __u16 memory_instance;
>> +};
>> +
>> +/**
>> + * struct drm_i915_memory_region_info
>> + *
>> + * Describes one region as known to the driver.
>> + *
>> + * Note that we reserve quite a lot of stuff here for potential future work. As
>> + * an example we might want expose the capabilities(see caps) for a given
>> + * region, which could include things like if the region is CPU
>> + * mappable/accessible etc.
> 
> I get caps but I'm seriously at a loss as to what the rest of this
> would be used for.  Why are caps and flags both there and separate?
> Flags are typically something you set, not query.  Also, what's with
> rsvd1 at the end?  This smells of substantial over-building to me.
> 
> I thought to myself, "maybe I'm missing a future use-case" so I looked
> at the internal tree and none of this is being used there either.
> This indicates to me that either I'm missing something and there's
> code somewhere I don't know about or, with three years of building on
> internal branches, we still haven't proven that any of this is needed.
> If it's the latter, which I strongly suspect, maybe we should drop the
> unnecessary bits and only add them back in if and when we have proof
> that they're useful.

Do you mean just drop caps/flags here, but keep/inflate rsvd0/rsvd1, 
which is less opinionated about future unknowns? If so, makes sense to me.

> 
> To be clear, I don't mind the query API as such and the class/instance
> stuff seems fine and I really like being able to get the sizes
> directly.  What concerns me is all this extra future-proofing that we
> have zero proof is actually useful.  In my experience, when you build
> out like this without so much as a use-case, you always end up
> building the wrong thing.
> 
>> + */
>> +struct drm_i915_memory_region_info {
>> +       /** @region: class:instance pair encoding */
>> +       struct drm_i915_gem_memory_class_instance region;
>> +
>> +       /** @rsvd0: MBZ */
>> +       __u32 rsvd0;
>> +
>> +       /** @caps: MBZ */
>> +       __u64 caps;
>> +
>> +       /** @flags: MBZ */
>> +       __u64 flags;
>> +
>> +       /** @probed_size: Memory probed by the driver (-1 = unknown) */
>> +       __u64 probed_size;
>> +
>> +       /** @unallocated_size: Estimate of memory remaining (-1 = unknown) */
>> +       __u64 unallocated_size;
>> +
>> +       /** @rsvd1: MBZ */
>> +       __u64 rsvd1[8];
>> +};
>> +
>> +/**
>> + * struct drm_i915_query_memory_regions
>> + *
>> + * Region info query enumerates all regions known to the driver by filling in
>> + * an array of struct drm_i915_memory_region_info structures.
>> + *
>> + * Example for getting the list of supported regions:
>> + *
>> + * .. code-block:: C
>> + *
>> + *     struct drm_i915_query_memory_regions *info;
>> + *     struct drm_i915_query_item item = {
>> + *             .query_id = DRM_I915_QUERY_MEMORY_REGIONS;
>> + *     };
>> + *     struct drm_i915_query query = {
>> + *             .num_items = 1,
>> + *             .items_ptr = (uintptr_t)&item,
>> + *     };
>> + *     int err, i;
>> + *
>> + *     // First query the size of the blob we need, this needs to be large
>> + *     // enough to hold our array of regions. The kernel will fill out the
>> + *     // item.length for us, which is the number of bytes we need.
>> + *     err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
>> + *     if (err) ...
>> + *
>> + *     info = calloc(1, item.length);
>> + *     // Now that we allocated the required number of bytes, we call the ioctl
>> + *     // again, this time with the data_ptr pointing to our newly allocated
>> + *     // blob, which the kernel can then populate with the all the region info.
>> + *     item.data_ptr = (uintptr_t)&info,
>> + *
>> + *     err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
>> + *     if (err) ...
>> + *
>> + *     // We can now access each region in the array
>> + *     for (i = 0; i < info->num_regions; i++) {
>> + *             struct drm_i915_memory_region_info mr = info->regions[i];
>> + *             u16 class = mr.region.class;
>> + *             u16 instance = mr.region.instance;
>> + *
>> + *             ....
>> + *     }
>> + *
>> + *     free(info);
>> + */
>> +struct drm_i915_query_memory_regions {
>> +       /** @num_regions: Number of supported regions */
>> +       __u32 num_regions;
>> +
>> +       /** @rsvd: MBZ */
>> +       __u32 rsvd[3];
> 
> Why pad to 16B instead of 8B?

It's copy-pasta from engine_info. I can shrink it if you want? I don't 
have a strong opinion.

> 
>> +
>> +       /** @regions: Info about each supported region */
>> +       struct drm_i915_memory_region_info regions[];
>> +};
>> +
>> +#define DRM_I915_GEM_CREATE_EXT                0xdeadbeaf
>> +#define DRM_IOCTL_I915_GEM_CREATE_EXT  DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE_EXT, struct drm_i915_gem_create_ext)
>> +
>> +/**
>> + * struct drm_i915_gem_create_ext
>> + *
>> + * Existing gem_create behaviour, with added extension support.
>> + *
>> + * Note that in the future we want to have our buffer flags here, at least for
>> + * the stuff that is immutable. Previously we would have two ioctls, one to
>> + * create the object with gem_create, and another to apply various parameters,
>> + * however this creates some ambiguity for the params which are considered
>> + * immutable. Also in general we're phasing out the various SET/GET ioctls.
>> + */
>> +struct drm_i915_gem_create_ext {
>> +       /**
>> +        * @size: Requested size for the object.
>> +        *
>> +        * The (page-aligned) allocated size for the object will be returned.
>> +        *
>> +        * Note that for some devices we have might have further minimum
>> +        * page-size restrictions(larger than 4K), like for device local-memory.
>> +        * However in general the final size here should always reflect any
>> +        * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
>> +        * extension to place the object in device local-memory.
>> +        */
>> +       __u64 size;
>> +       /**
>> +        * @handle: Returned handle for the object.
>> +        *
>> +        * Object handles are nonzero.
>> +        */
>> +       __u32 handle;
>> +       /** @flags: MBZ */
>> +       __u32 flags;
>> +       /**
>> +        * @extensions: The chain of extensions to apply to this object.
>> +        *
>> +        * This will be useful in the future when we need to support several
>> +        * different extensions, and we need to apply more than one when
>> +        * creating the object. See struct i915_user_extension.
>> +        *
>> +        * If we don't supply any extensions then we get the same old gem_create
>> +        * behaviour.
>> +        *
>> +        * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>> +        * drm_i915_gem_create_ext_memory_regions
>> +        */
>> +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>> +       __u64 extensions;
>> +};
>> +
>> +/**
>> + * struct drm_i915_gem_create_ext_memory_regions
>> + *
>> + * I915_GEM_CREATE_EXT_MEMORY_REGIONS extension:
>> + *
>> + * Set the object with the desired set of placements/regions in priority
>> + * order(each entry must be unique and supported by the device), as an array of
>> + * drm_i915_gem_memory_class_instance, or an equivalent layout of class:instance
>> + * pair encodings. See DRM_I915_QUERY_MEMORY_REGIONS for how to query the
>> + * supported regions for a device.
>> + *
>> + * As an example, on discrete devices, if we wish to set the placement as
>> + * device local-memory we can do something like:
>> + *
>> + * .. code-block:: C
>> + *
>> + *     struct drm_i915_gem_memory_class_instance region_lmem = {
>> + *              .memory_class = I915_MEMORY_CLASS_DEVICE,
>> + *              .memory_instance = 0,
>> + *      };
>> + *      struct drm_i915_gem_create_ext_memory_regions regions = {
>> + *              .base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
>> + *              .regions = (uintptr_t)&region_lmem,
>> + *              .num_regions = 1,
>> + *      };
>> + *      struct drm_i915_gem_create_ext create_ext = {
>> + *              .size = 16 * PAGE_SIZE,
>> + *              .extensions = (uintptr_t)&regions,
>> + *      };
>> + *
>> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
>> + *      if (err) ...
>> + *
>> + * At which point we get the object handle in create_ext.handle, if all went
>> + * well.
>> + */
>> +struct drm_i915_gem_create_ext_memory_regions {
>> +       /** @base: Extension link. See struct i915_user_extension. */
>> +       struct i915_user_extension base;
>> +
>> +       /** @pad: MBZ */
>> +       __u32 pad;
>> +       /** @num_regions: Number of elements in the placements array. */
>> +       __u32 num_regions;
>> +       /**
>> +        * @regions: The placements array.
>> +        *
>> +        * Should be an array of drm_i915_gem_memory_class_instance.
>> +        */
>> +       __u64 regions;
>> +};
>> diff --git a/Documentation/gpu/rfc/i915_gem_lmem.rst b/Documentation/gpu/rfc/i915_gem_lmem.rst
>> new file mode 100644
>> index 000000000000..52f1db15ae94
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/i915_gem_lmem.rst
>> @@ -0,0 +1,139 @@
>> +=========================
>> +I915 DG1/LMEM RFC Section
>> +=========================
>> +
>> +Upstream plan
>> +=============
>> +For upstream the overall plan for landing all the DG1 stuff and turning it for
>> +real, with all the uAPI bits is:
>> +
>> +* Merge basic HW enabling of DG1(still without pciid)
>> +* Merge the uAPI bits behind special CONFIG_BROKEN(or so) flag
>> +        * At this point we can still make changes, but importantly this lets us
>> +          start running IGTs which can utilize local-memory in CI
>> +* Convert over to TTM, make sure it all keeps working
>> +* Add pciid for DG1 and turn on uAPI for real
>> +
>> +New object placement and region query uAPI
>> +==========================================
>> +Starting from DG1 we need to give userspace the ability to allocate buffers from
>> +device local-memory. Currently the driver supports gem_create, which can place
>> +buffers in system memory via shmem, and the usual assortment of other
>> +interfaces, like dumb buffers and userptr.
>> +
>> +To support this new capability, while also providing a uAPI which will work
>> +beyond just DG1, we propose to offer three new bits of uAPI:
>> +
>> +Query uAPI
>> +----------
>> +Existing query interface
>> +^^^^^^^^^^^^^^^^^^^^^^^^
>> +.. kernel-doc:: include/uapi/drm/i915_drm.h
>> +        :functions: drm_i915_query_item drm_i915_query
>> +
>> +DRM_I915_QUERY_MEMORY_REGIONS
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +New query ID which allows userspace to discover the list of supported memory
>> +regions(like system-memory and local-memory) for a given device. We identify
>> +each region with a class and instance pair, which should be unique. The class
>> +here would be DEVICE or SYSTEM, and the instance would be zero, on platforms
>> +like DG1.
>> +
>> +Side note: The class/instance design is borrowed from our existing engine uAPI,
>> +where we describe every physical engine in terms of its class, and the
>> +particular instance, since we can have more than one per class.
>> +
>> +In the future we also want to expose more information which can further
>> +describe the capabilities of a region.
>> +
>> +.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
>> +        :functions: drm_i915_gem_memory_class drm_i915_gem_memory_class_instance drm_i915_memory_region_info drm_i915_query_memory_regions
>> +
>> +GEM_CREATE_EXT
>> +--------------
>> +New ioctl which is basically just gem_create but now allows userspace to
>> +provide a chain of possible extensions. Note that if we don't provide any
>> +extensions then we get the exact same behaviour as gem_create.
>> +
>> +Side note: We also need to support PXP[1] in the near future, which is also
>> +applicable to integrated platforms, and adds its own gem_create_ext extension,
>> +which basically lets userspace mark a buffer as "protected".
> 
> A bit off-topic, but do we really need a whole extension for that?  Or
> can we just throw a bit in flags?  I'm a big fan of landing create_ext
> anyway; I like extensibility.  I'm just questioning whether or not
> that one needs its own struct.
> 
> --Jason
> 
> 
>> +.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
>> +        :functions: drm_i915_gem_create_ext
>> +
>> +It's raining extensions
>> +^^^^^^^^^^^^^^^^^^^^^^^
>> +As noted above, extensions can be supplied as a chain in gem_create_ext using the
>> +existing i915_user_extension. This will be useful in the future when we need to
>> +support several different extensions, and we need to apply more than one when
>> +creating the object.
>> +
>> +.. kernel-doc:: include/uapi/drm/i915_drm.h
>> +        :functions: i915_user_extension
>> +
>> +I915_GEM_CREATE_EXT_MEMORY_REGIONS
>> +----------------------------------
>> +Implemented as an extension for gem_create_ext, we would now allow userspace to
>> +optionally provide an immutable list of preferred placements at creation time,
>> +in priority order, for a given buffer object.  For the placements we expect
>> +them each to use the class/instance encoding, as per the output of the regions
>> +query. Having the list in priority order will be useful in the future when
>> +placing an object, say during eviction.
>> +
>> +.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
>> +        :functions: drm_i915_gem_create_ext_memory_regions
>> +
>> +One fair criticism here is that this seems a little over-engineered[2]. If we
>> +just consider DG1 then yes, a simple gem_create.flags or something is totally
>> +all that's needed to tell the kernel to allocate the buffer in local-memory or
>> +whatever. However looking to the future we need uAPI which can also support
>> +upcoming Xe HP multi-tile architecture in a sane way, where there can be
>> +multiple local-memory instances for a given device, and so using both class and
>> +instance in our uAPI to describe regions is desirable, although specifically
>> +for DG1 it's uninteresting, since we only have a single local-memory instance.
>> +
>> +Existing uAPI issues
>> +====================
>> +Some potential issues we still need to resolve.
>> +
>> +I915 MMAP
>> +---------
>> +In i915 there are multiple ways to MMAP GEM object, including mapping the same
>> +object using different mapping types(WC vs WB), i.e multiple active mmaps per
>> +object. TTM expects one MMAP at most for the lifetime of the object. If it
>> +turns out that we have to backpedal here, there might be some potential
>> +userspace fallout.
>> +
>> +I915 SET/GET_CACHING
>> +--------------------
>> +In i915 we have set/get_caching ioctl. TTM doesn't let us to change this, but
>> +DG1 doesn't support non-snooped pcie transactions, so we can just always
>> +allocate as WB for smem-only buffers.  If/when our hw gains support for
>> +non-snooped pcie transactions then we must fix this mode at allocation time as
>> +a new GEM extension.
>> +
>> +This is related to the mmap problem, because in general (meaning, when we're
>> +not running on intel cpus) the cpu mmap must not, ever, be inconsistent with
>> +allocation mode.
>> +
>> +Possible idea is to let the kernel picks the mmap mode for userspace from the
>> +following table:
>> +
>> +smem-only: WB. Userspace does not need to call clflush.
>> +
>> +smem+lmem: We allocate uncached memory, and give userspace a WC mapping
>> +for when the buffer is in smem, and WC when it's in lmem. GPU does snooped
>> +access, which is a bit inefficient.
>> +
>> +lmem only: always WC
>> +
>> +This means on discrete you only get a single mmap mode, all others must be
>> +rejected. That's probably going to be a new default mode or something like
>> +that.
>> +
>> +Links
>> +=====
>> +[1] https://patchwork.freedesktop.org/series/86798/
>> +
>> +[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#note_553791
>> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
>> index a8621f7dab8b..05670442ca1b 100644
>> --- a/Documentation/gpu/rfc/index.rst
>> +++ b/Documentation/gpu/rfc/index.rst
>> @@ -15,3 +15,7 @@ host such documentation:
>>
>>   * Once the code has landed move all the documentation to the right places in
>>     the main core, helper or driver sections.
>> +
>> +.. toctree::
>> +
>> +    i915_gem_lmem.rst
>> --
>> 2.26.3
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
