Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8164C511BF3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBBA10F605;
	Wed, 27 Apr 2022 15:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5C289EA3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:38:21 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gh6so4282797ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 08:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PmNRKaCwISHZDGTWWxALT08w53pQiTNMw3umDyG0l6g=;
 b=iOJE6kGmrlQyydqWQ7IUJaIYJ8hvU3dlrsa3FymUIP1qt20g9lMAke9R07F8DZyoWm
 m6gU35BRnPRXKaZkn+To6NUGxX7wNVLlOuxQIKCkkYigNqhmvg7/Qxg6PqHkX6x7I3vr
 yqLpoMDTCp2VDK932hUACLHk+718KuW0gGbpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PmNRKaCwISHZDGTWWxALT08w53pQiTNMw3umDyG0l6g=;
 b=wSWf+ZvYaZQs8N1hS3LstW2vX/dByjdeR3ZncXeoe30FhZywN842pFfg0OQHg/szDi
 iAKkRQUWYaT3ho4rL7RY3GAo6movnJ3MVPda5j2Y3pOT9y9t+Hwq/V1bgDR3lysBj45I
 f4xNS1plSzoElO0dllm0ku3qpn+G07BuC2UesQLkZjYdSt6ASBlJ6AYcmo8zyrpmizYR
 6Jrp+bN6O7rWjbbUXlTTm6KQK9Mm/koIK55EUV/TxkrFVhziHfZj24+iVtDxTAUGwBhs
 SQjZZfLBKeBcSPJjBg4jhcCjvPLdVLWbbYOG5mLi+9q7z8QBHw2Yg3Prvl2rvlgnpPEV
 +teg==
X-Gm-Message-State: AOAM531vtN8sA0ksWNvMkaHEwc+DXqPR9zXkp0R3eZ0w5R784e/XNooa
 6Yy6vkeqWs+IDoDU9KoR4LWzTA==
X-Google-Smtp-Source: ABdhPJzn4OrKoBKbU2cV+Y1goAhMW2iFKvHq7SgwVWNqzkN/hr3VPj9zUmRwWIgZgfkJNhutMi8g9w==
X-Received: by 2002:a17:906:4fc3:b0:6e0:66a5:d59c with SMTP id
 i3-20020a1709064fc300b006e066a5d59cmr26387560ejw.131.1651073899658; 
 Wed, 27 Apr 2022 08:38:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056402270e00b00426243efcc2sm1486edd.34.2022.04.27.08.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 08:38:19 -0700 (PDT)
Date: Wed, 27 Apr 2022 17:38:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v2] drm/doc: add rfc section for small BAR uapi
Message-ID: <YmljaVOQot8HoFjm@phenom.ffwll.local>
References: <20220420171328.57253-1-matthew.auld@intel.com>
 <5553382d-2674-76f0-ab6e-408b99111a62@intel.com>
 <a667ccc4-fd5e-7e15-cffc-d5a65a834825@intel.com>
 <dbc758bd-1fc6-45cf-9fcd-366a35e26808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbc758bd-1fc6-45cf-9fcd-366a35e26808@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 08:55:07AM +0200, Christian König wrote:
> Well usually we increment the drm minor version when adding some new flags
> on amdgpu.
> 
> Additional to that just one comment from our experience with that: You don't
> just need one flag, but two. The first one is a hint which says "CPU access
> needed" and the second is a promise which says "CPU access never needed".
> 
> The background is that on a whole bunch of buffers you can 100% certain say
> that you will never ever need CPU access.
> 
> Then at least we have a whole bunch of buffers where we might need CPU
> access, but can't tell for sure.
> 
> And last we have stuff like transfer buffers you can be 100% sure that you
> need CPU access.
> 
> Separating it like this helped a lot with performance on small BAR systems.

So my assumption was that for transfer buffers you'd fill them with the
cpu first anyway, so no need for the extra flag.

I guess this if for transfer buffers for gpu -> cpu transfers, where it
would result in costly bo move and stalls and it's better to make sure
it's cpu accessible from the start? At least on current gpu we have where
there's no coherent interconnect, those buffers have to be in system
memory or your cpu access will be a disaster, so again they're naturally
cpu accessible.

What's the use-case for the "cpu access required" flag where "cpu access
before gpu access" isn't a good enough hint already to get the same perf
benefits?

Also for scanout my idea at least is that we just fail mmap when you
haven't set the flag and the scanout is pinned to unmappable, for two
reasons:
- 4k buffers are big, if we force them all into mappable things are
  non-pretty.
- You need mesa anyway to access tiled buffers, and mesa knows how to use
  a transfer buffer. That should work even when you do desktop switching
  and fastboot and stuff like that with the getfb2 ioctl should all work
  (and without getfb2 it's doomed to garbage anyway).

So only dumb kms buffers (which are linear) would ever get the
NEEDS_CPU_ACCESS flag, and only those we'd ever pin into cpu accessible
range for scanout. Is there a hole in that plan?

Cheers, Daniel

> 
> Regards,
> Christian.
> 
> Am 27.04.22 um 08:48 schrieb Lionel Landwerlin:
> > One question though, how do we detect that this flag
> > (I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS) is accepted on a given
> > kernel?
> > I assume older kernels are going to reject object creation if we use
> > this flag?
> > 
> > I didn't plan to use __drm_i915_query_vma_info, but isn't it
> > inconsistent to select the placement on the GEM object and then query
> > whether it's mappable by address?
> > You made a comment stating this is racy, wouldn't querying on the GEM
> > object prevent this?
> > 
> > Thanks,
> > 
> > -Lionel
> > 
> > On 27/04/2022 09:35, Lionel Landwerlin wrote:
> > > Hi Matt,
> > > 
> > > 
> > > The proposal looks good to me.
> > > 
> > > Looking forward to try it on drm-tip.
> > > 
> > > 
> > > -Lionel
> > > 
> > > On 20/04/2022 20:13, Matthew Auld wrote:
> > > > Add an entry for the new uapi needed for small BAR on DG2+.
> > > > 
> > > > v2:
> > > >    - Some spelling fixes and other small tweaks. (Akeem & Thomas)
> > > >    - Rework error capture interactions, including no longer needing
> > > >      NEEDS_CPU_ACCESS for objects marked for capture. (Thomas)
> > > >    - Add probed_cpu_visible_size. (Lionel)
> > > > 
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > > Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> > > > Cc: mesa-dev@lists.freedesktop.org
> > > > ---
> > > >   Documentation/gpu/rfc/i915_small_bar.h   | 190
> > > > +++++++++++++++++++++++
> > > >   Documentation/gpu/rfc/i915_small_bar.rst |  58 +++++++
> > > >   Documentation/gpu/rfc/index.rst          |   4 +
> > > >   3 files changed, 252 insertions(+)
> > > >   create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
> > > >   create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
> > > > 
> > > > diff --git a/Documentation/gpu/rfc/i915_small_bar.h
> > > > b/Documentation/gpu/rfc/i915_small_bar.h
> > > > new file mode 100644
> > > > index 000000000000..7bfd0cf44d35
> > > > --- /dev/null
> > > > +++ b/Documentation/gpu/rfc/i915_small_bar.h
> > > > @@ -0,0 +1,190 @@
> > > > +/**
> > > > + * struct __drm_i915_memory_region_info - Describes one region
> > > > as known to the
> > > > + * driver.
> > > > + *
> > > > + * Note this is using both struct drm_i915_query_item and
> > > > struct drm_i915_query.
> > > > + * For this new query we are adding the new query id
> > > > DRM_I915_QUERY_MEMORY_REGIONS
> > > > + * at &drm_i915_query_item.query_id.
> > > > + */
> > > > +struct __drm_i915_memory_region_info {
> > > > +    /** @region: The class:instance pair encoding */
> > > > +    struct drm_i915_gem_memory_class_instance region;
> > > > +
> > > > +    /** @rsvd0: MBZ */
> > > > +    __u32 rsvd0;
> > > > +
> > > > +    /** @probed_size: Memory probed by the driver (-1 = unknown) */
> > > > +    __u64 probed_size;
> > > > +
> > > > +    /** @unallocated_size: Estimate of memory remaining (-1 =
> > > > unknown) */
> > > > +    __u64 unallocated_size;
> > > > +
> > > > +    union {
> > > > +        /** @rsvd1: MBZ */
> > > > +        __u64 rsvd1[8];
> > > > +        struct {
> > > > +            /**
> > > > +             * @probed_cpu_visible_size: Memory probed by the driver
> > > > +             * that is CPU accessible. (-1 = unknown).
> > > > +             *
> > > > +             * This will be always be <= @probed_size, and the
> > > > +             * remainder(if there is any) will not be CPU
> > > > +             * accessible.
> > > > +             */
> > > > +            __u64 probed_cpu_visible_size;
> > > > +        };
> > > > +    };
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct __drm_i915_gem_create_ext - Existing gem_create
> > > > behaviour, with added
> > > > + * extension support using struct i915_user_extension.
> > > > + *
> > > > + * Note that new buffer flags should be added here, at least
> > > > for the stuff that
> > > > + * is immutable. Previously we would have two ioctls, one to
> > > > create the object
> > > > + * with gem_create, and another to apply various parameters,
> > > > however this
> > > > + * creates some ambiguity for the params which are considered
> > > > immutable. Also in
> > > > + * general we're phasing out the various SET/GET ioctls.
> > > > + */
> > > > +struct __drm_i915_gem_create_ext {
> > > > +    /**
> > > > +     * @size: Requested size for the object.
> > > > +     *
> > > > +     * The (page-aligned) allocated size for the object will be
> > > > returned.
> > > > +     *
> > > > +     * Note that for some devices we have might have further minimum
> > > > +     * page-size restrictions(larger than 4K), like for device
> > > > local-memory.
> > > > +     * However in general the final size here should always
> > > > reflect any
> > > > +     * rounding up, if for example using the
> > > > I915_GEM_CREATE_EXT_MEMORY_REGIONS
> > > > +     * extension to place the object in device local-memory.
> > > > +     */
> > > > +    __u64 size;
> > > > +    /**
> > > > +     * @handle: Returned handle for the object.
> > > > +     *
> > > > +     * Object handles are nonzero.
> > > > +     */
> > > > +    __u32 handle;
> > > > +    /**
> > > > +     * @flags: Optional flags.
> > > > +     *
> > > > +     * Supported values:
> > > > +     *
> > > > +     * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS - Signal to
> > > > the kernel that
> > > > +     * the object will need to be accessed via the CPU.
> > > > +     *
> > > > +     * Only valid when placing objects in
> > > > I915_MEMORY_CLASS_DEVICE, and
> > > > +     * only strictly required on platforms where only some of
> > > > the device
> > > > +     * memory is directly visible or mappable through the CPU,
> > > > like on DG2+.
> > > > +     *
> > > > +     * One of the placements MUST also be I915_MEMORY_CLASS_SYSTEM, to
> > > > +     * ensure we can always spill the allocation to system
> > > > memory, if we
> > > > +     * can't place the object in the mappable part of
> > > > +     * I915_MEMORY_CLASS_DEVICE.
> > > > +     *
> > > > +     * Note that since the kernel only supports flat-CCS on
> > > > objects that can
> > > > +     * *only* be placed in I915_MEMORY_CLASS_DEVICE, we
> > > > therefore don't
> > > > +     * support I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS together with
> > > > +     * flat-CCS.
> > > > +     *
> > > > +     * Without this hint, the kernel will assume that non-mappable
> > > > +     * I915_MEMORY_CLASS_DEVICE is preferred for this object.
> > > > Note that the
> > > > +     * kernel can still migrate the object to the mappable
> > > > part, as a last
> > > > +     * resort, if userspace ever CPU faults this object, but
> > > > this might be
> > > > +     * expensive, and so ideally should be avoided.
> > > > +     */
> > > > +#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
> > > > +    __u32 flags;
> > > > +    /**
> > > > +     * @extensions: The chain of extensions to apply to this object.
> > > > +     *
> > > > +     * This will be useful in the future when we need to
> > > > support several
> > > > +     * different extensions, and we need to apply more than one when
> > > > +     * creating the object. See struct i915_user_extension.
> > > > +     *
> > > > +     * If we don't supply any extensions then we get the same
> > > > old gem_create
> > > > +     * behaviour.
> > > > +     *
> > > > +     * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
> > > > +     * struct drm_i915_gem_create_ext_memory_regions.
> > > > +     *
> > > > +     * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> > > > +     * struct drm_i915_gem_create_ext_protected_content.
> > > > +     */
> > > > +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> > > > +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> > > > +    __u64 extensions;
> > > > +};
> > > > +
> > > > +#define DRM_I915_QUERY_VMA_INFO    5
> > > > +
> > > > +/**
> > > > + * struct __drm_i915_query_vma_info
> > > > + *
> > > > + * Given a vm and GTT address, lookup the corresponding vma,
> > > > returning its set
> > > > + * of attributes.
> > > > + *
> > > > + * .. code-block:: C
> > > > + *
> > > > + *    struct drm_i915_query_vma_info info = {};
> > > > + *    struct drm_i915_query_item item = {
> > > > + *        .data_ptr = (uintptr_t)&info,
> > > > + *        .query_id = DRM_I915_QUERY_VMA_INFO,
> > > > + *    };
> > > > + *    struct drm_i915_query query = {
> > > > + *        .num_items = 1,
> > > > + *        .items_ptr = (uintptr_t)&item,
> > > > + *    };
> > > > + *    int err;
> > > > + *
> > > > + *    // Unlike some other types of queries, there is no need
> > > > to first query
> > > > + *    // the size of the data_ptr blob here, since we already
> > > > know ahead of
> > > > + *    // time how big this needs to be.
> > > > + *    item.length = sizeof(info);
> > > > + *
> > > > + *    // Next we fill in the vm_id and ppGTT address of the vma
> > > > we wish
> > > > + *    // to query, before then firing off the query.
> > > > + *    info.vm_id = vm_id;
> > > > + *    info.offset = gtt_address;
> > > > + *    err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> > > > + *    if (err || item.length < 0) ...
> > > > + *
> > > > + *    // If all went well we can now inspect the returned attributes.
> > > > + *    if (info.attributes & DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE) ...
> > > > + */
> > > > +struct __drm_i915_query_vma_info {
> > > > +    /**
> > > > +     * @vm_id: The given vm id that contains the vma. The id is
> > > > the value
> > > > +     * returned by the DRM_I915_GEM_VM_CREATE. See struct
> > > > +     * drm_i915_gem_vm_control.vm_id.
> > > > +     */
> > > > +    __u32 vm_id;
> > > > +    /** @pad: MBZ. */
> > > > +    __u32 pad;
> > > > +    /**
> > > > +     * @offset: The corresponding ppGTT address of the vma
> > > > which the kernel
> > > > +     * will use to perform the lookup.
> > > > +     */
> > > > +    __u64 offset;
> > > > +    /**
> > > > +     * @attributes: The returned attributes for the given vma.
> > > > +     *
> > > > +     * Possible values:
> > > > +     *
> > > > +     * DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE - Set if the pages
> > > > backing the
> > > > +     * vma are currently CPU accessible. If this is not set
> > > > then the vma is
> > > > +     * currently backed by I915_MEMORY_CLASS_DEVICE memory,
> > > > which the CPU
> > > > +     * cannot directly access(this is only possible on discrete
> > > > devices with
> > > > +     * a small BAR). Attempting to MMAP and fault such an object will
> > > > +     * require the kernel first synchronising any GPU work tied to the
> > > > +     * object, before then migrating the pages, either to the
> > > > CPU accessible
> > > > +     * part of I915_MEMORY_CLASS_DEVICE, or
> > > > I915_MEMORY_CLASS_SYSTEM, if the
> > > > +     * placements permit it. See
> > > > I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS.
> > > > +     *
> > > > +     * Note that this is inherently racy.
> > > > +     */
> > > > +#define DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE (1<<0)
> > > > +    __u64 attributes;
> > > > +    /** @rsvd: MBZ */
> > > > +    __u32 rsvd[4];
> > > > +};
> > > > diff --git a/Documentation/gpu/rfc/i915_small_bar.rst
> > > > b/Documentation/gpu/rfc/i915_small_bar.rst
> > > > new file mode 100644
> > > > index 000000000000..be3d9bcdd86d
> > > > --- /dev/null
> > > > +++ b/Documentation/gpu/rfc/i915_small_bar.rst
> > > > @@ -0,0 +1,58 @@
> > > > +==========================
> > > > +I915 Small BAR RFC Section
> > > > +==========================
> > > > +Starting from DG2 we will have resizable BAR support for device
> > > > local-memory(i.e
> > > > +I915_MEMORY_CLASS_DEVICE), but in some cases the final BAR size
> > > > might still be
> > > > +smaller than the total probed_size. In such cases, only some subset of
> > > > +I915_MEMORY_CLASS_DEVICE will be CPU accessible(for example the
> > > > first 256M),
> > > > +while the remainder is only accessible via the GPU.
> > > > +
> > > > +I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS flag
> > > > +----------------------------------------------
> > > > +New gem_create_ext flag to tell the kernel that a BO will
> > > > require CPU access.
> > > > +This becomes important when placing an object in
> > > > I915_MEMORY_CLASS_DEVICE, where
> > > > +underneath the device has a small BAR, meaning only some
> > > > portion of it is CPU
> > > > +accessible. Without this flag the kernel will assume that CPU
> > > > access is not
> > > > +required, and prioritize using the non-CPU visible portion of
> > > > +I915_MEMORY_CLASS_DEVICE.
> > > > +
> > > > +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
> > > > +   :functions: __drm_i915_gem_create_ext
> > > > +
> > > > +probed_cpu_visible_size attribute
> > > > +---------------------------------
> > > > +New struct__drm_i915_memory_region attribute which returns the
> > > > total size of the
> > > > +CPU accessible portion, for the particular region. This should only be
> > > > +applicable for I915_MEMORY_CLASS_DEVICE.
> > > > +
> > > > +Vulkan will need this as part of creating a separate
> > > > VkMemoryHeap with the
> > > > +VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT set, to represent the CPU
> > > > visible portion,
> > > > +where the total size of the heap needs to be known.
> > > > +
> > > > +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
> > > > +   :functions: __drm_i915_memory_region_info
> > > > +
> > > > +DRM_I915_QUERY_VMA_INFO query
> > > > +-----------------------------
> > > > +Query the attributes of some vma. Given a vm and GTT offset, find the
> > > > +respective vma, and return its set of attributes. For now we
> > > > only support
> > > > +DRM_I915_QUERY_VMA_INFO_CPU_VISIBLE, which is set if the object/vma is
> > > > +currently placed in memory that is accessible by the CPU. This
> > > > should always be
> > > > +set on devices where the CPU probed_cpu_visible_size of
> > > > I915_MEMORY_CLASS_DEVICE
> > > > +matches the probed_size. If this is not set then CPU faulting
> > > > the object will
> > > > +likely first require migrating the pages.
> > > > +
> > > > +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
> > > > +   :functions: __drm_i915_query_vma_info
> > > > +
> > > > +Error Capture restrictions
> > > > +--------------------------
> > > > +With error capture we have two new restrictions:
> > > > +
> > > > +    1) Error capture is best effort on small BAR systems; if
> > > > the pages are not
> > > > +    CPU accessible, at the time of capture, then the kernel is
> > > > free to skip
> > > > +    trying to capture them.
> > > > +
> > > > +    2) On discrete we now reject error capture on recoverable
> > > > contexts. In the
> > > > +    future the kernel may want to blit during error capture,
> > > > when for example
> > > > +    something is not currently CPU accessible.
> > > > diff --git a/Documentation/gpu/rfc/index.rst
> > > > b/Documentation/gpu/rfc/index.rst
> > > > index 91e93a705230..5a3bd3924ba6 100644
> > > > --- a/Documentation/gpu/rfc/index.rst
> > > > +++ b/Documentation/gpu/rfc/index.rst
> > > > @@ -23,3 +23,7 @@ host such documentation:
> > > >   .. toctree::
> > > >         i915_scheduler.rst
> > > > +
> > > > +.. toctree::
> > > > +
> > > > +    i915_small_bar.rst
> > > 
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
