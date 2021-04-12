Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A72435C642
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEA289C0A;
	Mon, 12 Apr 2021 12:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05D489C49
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:30:08 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id n140so13211368oig.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BxrxBsCgsYl3vaAFd1oaGW3C1LZoG9HBAfTM4Na4K7s=;
 b=Iz5tP5ByHqYh27Ss+VWRlhtXeBbJS6bPg10pO43WGsxC6rGSZbI34zmbrthooWnFlf
 1N8G0yUrOHmwjahKvHmZSXZ1wqO4kt0J+V/mZYhhP82NkWMyfBAvt0oTumxe5FZCWlzW
 cYNjl3um3z8Y2ffA4KM2Sg3rcRWjh8XfcAGLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxrxBsCgsYl3vaAFd1oaGW3C1LZoG9HBAfTM4Na4K7s=;
 b=LrOqje0EqF3mirhIu3ZVz5QHApkc4h32Blz89xx2EWHgeJ+WcS6Pn0/RZ+uwniJ6nl
 UumXHrKb587lgmpdeNM2JOmT01Oa9NuL0kn82s6kQyPbFiks3ydSLu1qp/6DJYQd+Ay8
 RWHMC6Xu1nkWePoGXsHY7cFggz7p2j1jVQTZlaQaM4JTpC8dLMa4yU16vdOr12RCCbVq
 7hIZtxzexTcpQzx15TovbLLgwo48XEF2yrYJoMrHJnJsByFpqiQ57uMNJeTHxYtxyoHY
 W4W07lqkaGBX79RHHcyMUicx2sjJWKH4c9STR+ZQQEnpDCrT9yVpsF5pGFpLm0mVIaHs
 t2Xg==
X-Gm-Message-State: AOAM533X1FRKLiGA0XiquwvPhi2KtDg2fo5/whq0pJaiQWCz/itg2vsk
 GWrs6Z/CP3yyfQWcS1DED0G6WCAcSwPkHorHCVwU6Q==
X-Google-Smtp-Source: ABdhPJyTqm/rUxe1kL4wJ2GIqMSCe5kthzrGonvJlkec1l3TabftR9br+/wZOTNhS0CzX1/CqckR0/jnB7ez6cJFJlE=
X-Received: by 2002:aca:1c17:: with SMTP id c23mr5119179oic.128.1618230608085; 
 Mon, 12 Apr 2021 05:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210412121802.57131-1-matthew.auld@intel.com>
In-Reply-To: <20210412121802.57131-1-matthew.auld@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 12 Apr 2021 14:29:57 +0200
Message-ID: <CAKMK7uGSrx+uRDUWwHTJkaY7aufdmz7REvEWDgYByGP+wvg4XA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/doc/rfc: i915 DG1 uAPI
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 2:18 PM Matthew Auld <matthew.auld@intel.com> wrote:
>
> Add an entry for the new uAPI needed for DG1.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@gmail.com>
> ---
>  Documentation/gpu/rfc/i915_create_ext.c       | 48 ++++++++++
>  .../gpu/rfc/i915_create_ext_placements.c      | 19 ++++
>  Documentation/gpu/rfc/i915_region_query.c     | 54 +++++++++++
>  Documentation/gpu/rfc/index.rst               | 91 +++++++++++++++++++
>  4 files changed, 212 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_create_ext.c
>  create mode 100644 Documentation/gpu/rfc/i915_create_ext_placements.c
>  create mode 100644 Documentation/gpu/rfc/i915_region_query.c
>
> diff --git a/Documentation/gpu/rfc/i915_create_ext.c b/Documentation/gpu/rfc/i915_create_ext.c
> new file mode 100644
> index 000000000000..57c98717d14c
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_create_ext.c

Just for the process itself: Idea here is to make these header files
with full kerneldoc, which is then pulled into the .rst file. So
please:
- I think the doc should also explain our overall approach to enabling
dg1 in upstream (which has changed a bit since we last discussed it in
full on dri-devel): 1. merge basic enabling of dg1 (still without
pciid) 2. convert over to ttm, make sure it all keeps working 3. add
pciid for dg1
- make these .h (just for consistency with header file endings,
doesn't matter really, and I'd just create one header file
- please also include the ioctl definitions in the header file (you
can pick dummy numbers for them meanwhile), so that it's clear which
struct is used where
- make the comments full kerneldoc, that way you can put specific
comments in there too
- spearate .rst file added to gpu/rfc/index.rst (so maybe
i915_lmem.rst and i915_lmem.h), otherwise the index file will become
unmanageable real fast.
- one item that's not solved here but will come up latest when we look
at the ttm conversion is that ttm expects to have a single fixed mmap
mode over the lifetime of a buffer. This is because in general it's
not possible to have inconsistent mappings of the same physical memory
address, we've relied on intel platform guarantees for this. So this
is something we need to at least keep as an open, and it might be
quite invasive for userspace.

Cheers, Daniel

> @@ -0,0 +1,48 @@
> +struct drm_i915_gem_create_ext {
> +       /*
> +        * Requested size for the object.
> +        *
> +        * The (page-aligned) allocated size for the object will be returned.
> +        */
> +       __u64 size;
> +       /*
> +        * Returned handle for the object.
> +        *
> +        * Object handles are nonzero.
> +        */
> +       __u32 handle;
> +       /* MBZ */
> +       __u32 flags;
> +       /*
> +        * For I915_GEM_CREATE_EXT_SETPARAM extension usage see both:
> +        *      struct drm_i915_gem_create_ext_setparam.
> +        *      struct drm_i915_gem_object_param for the possible parameters.
> +        */
> +#define I915_GEM_CREATE_EXT_SETPARAM 0
> +       __u64 extensions;
> +};
> +
> +struct drm_i915_gem_object_param {
> +       /* Object handle (0 for I915_GEM_CREATE_EXT_SETPARAM) */
> +       __u32 handle;
> +
> +       /* Data pointer size */
> +       __u32 size;
> +
> +/*
> + * I915_OBJECT_PARAM:
> + *
> + * Select object namespace for the param.
> + */
> +#define I915_OBJECT_PARAM  (1ull<<32)
> +
> +       __u64 param;
> +
> +       /* Data value or pointer */
> +       __u64 data;
> +};
> +
> +struct drm_i915_gem_create_ext_setparam {
> +       struct i915_user_extension base;
> +       struct drm_i915_gem_object_param param;
> +};
> diff --git a/Documentation/gpu/rfc/i915_create_ext_placements.c b/Documentation/gpu/rfc/i915_create_ext_placements.c
> new file mode 100644
> index 000000000000..e2d14484d50a
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_create_ext_placements.c
> @@ -0,0 +1,19 @@
> +#define I915_OBJECT_PARAM  (1ull<<32)
> +
> +/*
> + * I915_OBJECT_PARAM_MEMORY_REGIONS
> + *
> + * Set the data pointer with the desired set of placements in priority
> + * order(each entry must be unique and supported by the device), as an array of
> + * drm_i915_gem_memory_class_instance, or an equivalent layout of class:instance
> + * pair encodings. See DRM_I915_QUERY_MEMORY_REGIONS for how to query the
> + * supported regions.
> + *
> + * In this case the data pointer size should be the number of
> + * drm_i915_gem_memory_class_instance elements in the placements array.
> + *
> + */
> +#define I915_PARAM_MEMORY_REGIONS 0
> +#define I915_OBJECT_PARAM_MEMORY_REGIONS (I915_OBJECT_PARAM | \
> +                                         I915_PARAM_MEMORY_REGIONS)
> +       __u64 param;
> diff --git a/Documentation/gpu/rfc/i915_region_query.c b/Documentation/gpu/rfc/i915_region_query.c
> new file mode 100644
> index 000000000000..45e688726375
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_region_query.c
> @@ -0,0 +1,54 @@
> +enum drm_i915_gem_memory_class {
> +       I915_MEMORY_CLASS_SYSTEM = 0,
> +       I915_MEMORY_CLASS_DEVICE,
> +};
> +
> +struct drm_i915_gem_memory_class_instance {
> +       __u16 memory_class; /* see enum drm_i915_gem_memory_class */
> +       __u16 memory_instance;
> +};
> +
> +/**
> + * struct drm_i915_memory_region_info
> + *
> + * Describes one region as known to the driver.
> + */
> +struct drm_i915_memory_region_info {
> +       /** class:instance pair encoding */
> +       struct drm_i915_gem_memory_class_instance region;
> +
> +       /** MBZ */
> +       __u32 rsvd0;
> +
> +       /** MBZ */
> +       __u64 caps;
> +
> +       /** MBZ */
> +       __u64 flags;
> +
> +       /** Memory probed by the driver (-1 = unknown) */
> +       __u64 probed_size;
> +
> +       /** Estimate of memory remaining (-1 = unknown) */
> +       __u64 unallocated_size;
> +
> +       /** MBZ */
> +       __u64 rsvd1[8];
> +};
> +
> +/**
> + * struct drm_i915_query_memory_regions
> + *
> + * Region info query enumerates all regions known to the driver by filling in
> + * an array of struct drm_i915_memory_region_info structures.
> + */
> +struct drm_i915_query_memory_regions {
> +       /** Number of supported regions */
> +       __u32 num_regions;
> +
> +       /** MBZ */
> +       __u32 rsvd[3];
> +
> +       /* Info about each supported region */
> +       struct drm_i915_memory_region_info regions[];
> +};
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index a8621f7dab8b..40572f514371 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -15,3 +15,94 @@ host such documentation:
>
>  * Once the code has landed move all the documentation to the right places in
>    the main core, helper or driver sections.
> +
> +I915 DG1/LMEM RFC Section
> +=========================
> +
> +Object placement and region query
> +=================================
> +Starting from DG1 we need to give userspace the ability to allocate buffers from
> +device local-memory. Currently the driver supports gem_create, which can place
> +buffers in system memory via shmem, and the usual assortment of other
> +interfaces, like dumb buffers and userptr.
> +
> +To support this new capability, while also providing a uAPI which will work
> +beyond just DG1, we propose to offer three new bits of uAPI:
> +
> +DRM_I915_QUERY_MEMORY_REGIONS
> +-----------------------------
> +Query mechanism which allows userspace to discover the list of supported memory
> +regions(like system-memory and local-memory) for a given device. We identify
> +each region with a class and instance pair, which should be unique. The class
> +here would be DEVICE or SYSTEM, and the instance would be zero, on platforms
> +like DG1.
> +
> +Side note: The class/instance design is borrowed from our existing engine uAPI,
> +where we describe every physical engine in terms of its class, and the
> +particular instance, since we can have more than one per class.
> +
> +In the future we also want to expose more information which can further
> +describe the capabilities of a region.
> +
> +.. literalinclude:: i915_region_query.c
> +
> +GEM_CREATE_EXT
> +--------------
> +New ioctl which is basically just gem_create but now allows userspace to
> +provide a chain of possible extensions. Note that if we don't provide any
> +extensions then we get the exact same behaviour as gem_create.
> +
> +.. literalinclude:: i915_create_ext.c
> +
> +Side note: We also need to support PXP[1] in the near future, which is also
> +applicable to integrated platforms, and adds its own gem_create_ext extension,
> +which basically lets userspace mark a buffer as "protected".
> +
> +I915_OBJECT_PARAM_MEMORY_REGIONS
> +--------------------------------
> +Implemented as an extension for gem_create_ext, we would now allow userspace to
> +optionally provide an immutable list of preferred placements at creation time,
> +in priority order, for a given buffer object.  For the placements we expect
> +them each to use the class/instance encoding, as per the output of the regions
> +query. Having the list in priority order will be useful in the future when
> +placing an object, say during eviction.
> +
> +.. literalinclude:: i915_create_ext_placements.c
> +
> +As an example, on DG1 if we wish to set the placement as local-memory we can do
> +something like:
> +
> +.. code-block::
> +
> +        struct drm_i915_gem_memory_class_instance region_param = {
> +                .memory_class = I915_MEMORY_CLASS_DEVICE,
> +                .memory_instance = 0,
> +        };
> +        struct drm_i915_gem_create_ext_setparam setparam_region = {
> +                .base = { .name = I915_GEM_CREATE_EXT_SETPARAM },
> +                .param = {
> +                        .param = I915_OBJECT_PARAM_MEMORY_REGIONS,
> +                        .data = (uintptr_t)&region_param,
> +                        .size = 1,
> +                },
> +        };
> +
> +        struct drm_i915_gem_create_ext create_ext = {
> +                .size = 16 * PAGE_SIZE,
> +                .extensions = (uintptr_t)&setparam_region,
> +        };
> +        int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> +        if (err) ...
> +
> +One fair criticism here is that this seems a little over-engineered[2]. If we
> +just consider DG1 then yes, a simple gem_create.flags or something is totally
> +all that's needed to tell the kernel to allocate the buffer in local-memory or
> +whatever. However looking to the future we need uAPI which can also support
> +upcoming Xe HP multi-tile architecture in a sane way, where there can be
> +multiple local-memory instances for a given device, and so using both class and
> +instance in our uAPI to describe regions is desirable, although specifically
> +for DG1 it's uninteresting, since we only have a single local-memory instance.
> +
> +[1] https://patchwork.freedesktop.org/series/86798/
> +
> +[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#note_553791
> --
> 2.26.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
