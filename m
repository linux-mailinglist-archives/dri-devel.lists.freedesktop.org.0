Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50112365D6C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6636E874;
	Tue, 20 Apr 2021 16:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E7F6E872;
 Tue, 20 Apr 2021 16:34:28 +0000 (UTC)
IronPort-SDR: w3Xt9HNjw79tBTVYs6Mj182BoyFkSyQlKphsWSDg21J8am1thfH7OsiDRKGFBAZeWvB1Gpbhnv
 +0tes3E3lsUw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="259496830"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="259496830"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:34:27 -0700
IronPort-SDR: VOz+HAXUV1WO9RcdSTgqN7dAME+sHt/Y/HpQ24pQGud9mZeWBp9K3lT3iWA2/eHnmgVCeif1OR
 DFoqnSE9wG9A==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="385405938"
Received: from nmuniand-mobl1.gar.corp.intel.com (HELO [10.213.128.245])
 ([10.213.128.245])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:34:22 -0700
Subject: Re: [PATCH v3 4/4] drm/doc/rfc: i915 DG1 uAPI
To: Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Auld <matthew.auld@intel.com>
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-4-matthew.auld@intel.com>
 <CAOFGe96QALJa4FbWkVxczTdOA6b41zk1GxdYwRsrP7GwSZ4zvw@mail.gmail.com>
 <6cf790c7-84bf-4d35-c1c3-4cf826655faf@intel.com>
 <CAOFGe95gMUuqXX=Yn_xMRVxQmcwiqNEN0m3PgyNACcm0iNTyKg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5a412489-75ed-e971-0e0b-388f0f964fac@linux.intel.com>
Date: Tue, 20 Apr 2021 17:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe95gMUuqXX=Yn_xMRVxQmcwiqNEN0m3PgyNACcm0iNTyKg@mail.gmail.com>
Content-Language: en-US
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


On 19/04/2021 16:19, Jason Ekstrand wrote:
> On Mon, Apr 19, 2021 at 7:02 AM Matthew Auld <matthew.auld@intel.com> wrote:
>>
>> On 16/04/2021 17:38, Jason Ekstrand wrote:
>>> On Thu, Apr 15, 2021 at 11:04 AM Matthew Auld <matthew.auld@intel.com> wrote:
>>>>
>>>> Add an entry for the new uAPI needed for DG1.
>>>>
>>>> v2(Daniel):
>>>>     - include the overall upstreaming plan
>>>>     - add a note for mmap, there are differences here for TTM vs i915
>>>>     - bunch of other suggestions from Daniel
>>>> v3:
>>>>    (Daniel)
>>>>     - add a note for set/get caching stuff
>>>>     - add some more docs for existing query and extensions stuff
>>>>     - add an actual code example for regions query
>>>>     - bunch of other stuff
>>>>    (Jason)
>>>>     - uAPI change(!):
>>>>           - try a simpler design with the placements extension
>>>>           - rather than have a generic setparam which can cover multiple
>>>>             use cases, have each extension be responsible for one thing
>>>>             only
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>>> Cc: Dave Airlie <airlied@gmail.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: mesa-dev@lists.freedesktop.org
>>>> ---
>>>>    Documentation/gpu/rfc/i915_gem_lmem.h   | 255 ++++++++++++++++++++++++
>>>>    Documentation/gpu/rfc/i915_gem_lmem.rst | 139 +++++++++++++
>>>>    Documentation/gpu/rfc/index.rst         |   4 +
>>>>    3 files changed, 398 insertions(+)
>>>>    create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.h
>>>>    create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst
>>>>
>>>> diff --git a/Documentation/gpu/rfc/i915_gem_lmem.h b/Documentation/gpu/rfc/i915_gem_lmem.h
>>>> new file mode 100644
>>>> index 000000000000..2a82a452e9f2
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/rfc/i915_gem_lmem.h
>>>> @@ -0,0 +1,255 @@
>>>> +/*
>>>> + * Note that drm_i915_query_item and drm_i915_query are existing bits of uAPI.
>>>> + * For the regions query we are just adding a new query id, so no actual new
>>>> + * ioctl or anything, but including it here for reference.
>>>> + */
>>>> +struct drm_i915_query_item {
>>>> +#define DRM_I915_QUERY_MEMORY_REGIONS   0xdeadbeaf
>>>> +       ....
>>>> +        __u64 query_id;
>>>> +
>>>> +        /*
>>>> +         * When set to zero by userspace, this is filled with the size of the
>>>> +         * data to be written at the data_ptr pointer. The kernel sets this
>>>> +         * value to a negative value to signal an error on a particular query
>>>> +         * item.
>>>> +         */
>>>> +        __s32 length;
>>>> +
>>>> +        __u32 flags;
>>>> +        /*
>>>> +         * Data will be written at the location pointed by data_ptr when the
>>>> +         * value of length matches the length of the data to be written by the
>>>> +         * kernel.
>>>> +         */
>>>> +        __u64 data_ptr;
>>>> +};
>>>> +
>>>> +struct drm_i915_query {
>>>> +        __u32 num_items;
>>>> +        /*
>>>> +         * Unused for now. Must be cleared to zero.
>>>> +         */
>>>> +        __u32 flags;
>>>> +        /*
>>>> +         * This points to an array of num_items drm_i915_query_item structures.
>>>> +         */
>>>> +        __u64 items_ptr;
>>>> +};
>>>> +
>>>> +#define DRM_IOCTL_I915_QUERY   DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
>>>> +
>>>> +/**
>>>> + * enum drm_i915_gem_memory_class
>>>> + */
>>>> +enum drm_i915_gem_memory_class {
>>>> +       /** @I915_MEMORY_CLASS_SYSTEM: system memory */
>>>> +       I915_MEMORY_CLASS_SYSTEM = 0,
>>>> +       /** @I915_MEMORY_CLASS_DEVICE: device local-memory */
>>>> +       I915_MEMORY_CLASS_DEVICE,
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_i915_gem_memory_class_instance
>>>> + */
>>>> +struct drm_i915_gem_memory_class_instance {
>>>> +       /** @memory_class: see enum drm_i915_gem_memory_class */
>>>> +       __u16 memory_class;
>>>> +
>>>> +       /** @memory_instance: which instance */
>>>> +       __u16 memory_instance;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_i915_memory_region_info
>>>> + *
>>>> + * Describes one region as known to the driver.
>>>> + *
>>>> + * Note that we reserve quite a lot of stuff here for potential future work. As
>>>> + * an example we might want expose the capabilities(see caps) for a given
>>>> + * region, which could include things like if the region is CPU
>>>> + * mappable/accessible etc.
>>>
>>> I get caps but I'm seriously at a loss as to what the rest of this
>>> would be used for.  Why are caps and flags both there and separate?
>>> Flags are typically something you set, not query.  Also, what's with
>>> rsvd1 at the end?  This smells of substantial over-building to me.
>>>
>>> I thought to myself, "maybe I'm missing a future use-case" so I looked
>>> at the internal tree and none of this is being used there either.
>>> This indicates to me that either I'm missing something and there's
>>> code somewhere I don't know about or, with three years of building on
>>> internal branches, we still haven't proven that any of this is needed.
>>> If it's the latter, which I strongly suspect, maybe we should drop the
>>> unnecessary bits and only add them back in if and when we have proof
>>> that they're useful.
>>
>> Do you mean just drop caps/flags here, but keep/inflate rsvd0/rsvd1,
>> which is less opinionated about future unknowns? If so, makes sense to me.
> 
> I meant drop flags and rsvd1.  We need rsvd0 for padding and  I can
> see some value to caps.  We may want to advertise, for instance, what
> mapping coherency types are available per-heap.  But I don't see any
> use for any of the other fields.

I'd suggest making sure at least enough rsvd fields remain so that flags 
could be added later if needed. Experience from engine info shows that 
both were required in order to extend the query via re-purposing the 
rsvds and adding flag bits to indicate when a certain rsvd contains a 
new piece of information. I probably cannot go into too much detail 
here, but anyway the point is just to make sure too much is not stripped 
out so that instead of simply adding fields/flags we have to add a new 
query in the future. IMO some rsvd fields are not really harmful and if 
they can make things easier in the future why not.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
