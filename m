Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BC561269
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 08:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB6410F22D;
	Thu, 30 Jun 2022 06:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DFB10ED4E;
 Thu, 30 Jun 2022 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656570267; x=1688106267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sCNu7ZNk5jH51sC73d1DFhZtTIEqdWJHgMUVDGeUbhc=;
 b=ckha/LBWX00J17JEgw71pQuv/ev3Pn7fQFb7ZyiYu16FjGG61Dc1Q4G6
 znfasj+4EEK1USHgisZwyn6dwV3KWWNG4ghBob3u4tsP+/yLiTlhsNsN9
 c+GpBuUS8r3qb9i2ES8vydvbpWbkB3P33sBd6QyRyj6++tgq9co583nWp
 1mV4lcQdPIRw7Q3y3Zg1VwGKNyRUHSQbKnDmHJbMn6aFDEi9FN9q0dQ+w
 5H9VgBrA3Q/wJyoi/rxtB4/kfLGAZuHdyc4vLYtv3TjFs21z2iCNcko/2
 ebS4SUw7fsykvX5eaenmrKdiyeIEKvjG9lomulTxufoFSjOeJ7TIV2l5H A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="281022526"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="281022526"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:24:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="733508995"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:24:26 -0700
Date: Wed, 29 Jun 2022 23:24:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH v6 3/3] drm/doc/rfc: VM_BIND uapi definition
Message-ID: <20220630062407.GE14039@nvishwa1-DESK>
References: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
 <20220626014916.5130-4-niranjana.vishwanathapura@intel.com>
 <CAOFGe954aK2wz_TEORbw3BsW1a7EHtpUB1g6ZoYX=kSVmn+kRg@mail.gmail.com>
 <20220630061531.GC14039@nvishwa1-DESK>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630061531.GC14039@nvishwa1-DESK>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 11:15:31PM -0700, Niranjana Vishwanathapura wrote:
>On Thu, Jun 30, 2022 at 12:11:15AM -0500, Jason Ekstrand wrote:
>>  On Sat, Jun 25, 2022 at 8:49 PM Niranjana Vishwanathapura
>>  <niranjana.vishwanathapura@intel.com> wrote:
>>
>>    VM_BIND and related uapi definitions
>>
>>    v2: Reduce the scope to simple Mesa use case.
>>    v3: Expand VM_UNBIND documentation and add
>>        I915_GEM_VM_BIND/UNBIND_FENCE_VALID
>>        and I915_GEM_VM_BIND_TLB_FLUSH flags.
>>    v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional
>>        documentation for vm_bind/unbind.
>>    v5: Remove TLB flush requirement on VM_UNBIND.
>>        Add version support to stage implementation.
>>    v6: Define and use drm_i915_gem_timeline_fence structure for
>>        all timeline fences.
>>    v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.
>>        Update documentation on async vm_bind/unbind and versioning.
>>        Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3
>>        batch_count field and I915_EXEC3_SECURE flag.
>>
>>    Signed-off-by: Niranjana Vishwanathapura
>>    <niranjana.vishwanathapura@intel.com>
>>    Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>    ---
>>     Documentation/gpu/rfc/i915_vm_bind.h | 280 +++++++++++++++++++++++++++
>>     1 file changed, 280 insertions(+)
>>     create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>>
>>    diff --git a/Documentation/gpu/rfc/i915_vm_bind.h
>>    b/Documentation/gpu/rfc/i915_vm_bind.h
>>    new file mode 100644
>>    index 000000000000..a93e08bceee6
>>    --- /dev/null
>>    +++ b/Documentation/gpu/rfc/i915_vm_bind.h
>>    @@ -0,0 +1,280 @@
>>    +/* SPDX-License-Identifier: MIT */
>>    +/*
>>    + * Copyright © 2022 Intel Corporation
>>    + */
>>    +
>>    +/**
>>    + * DOC: I915_PARAM_VM_BIND_VERSION
>>    + *
>>    + * VM_BIND feature version supported.
>>    + * See typedef drm_i915_getparam_t param.
>>    + *
>>    + * Specifies the VM_BIND feature version supported.
>>    + * The following versions of VM_BIND have been defined:
>>    + *
>>    + * 0: No VM_BIND support.
>>    + *
>>    + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings
>>    created
>>    + *    previously with VM_BIND, the ioctl will not support unbinding
>>    multiple
>>    + *    mappings or splitting them. Similarly, VM_BIND calls will not
>>    replace
>>    + *    any existing mappings.
>>    + *
>>    + * 2: The restrictions on unbinding partial or multiple mappings is
>>    + *    lifted, Similarly, binding will replace any mappings in the given
>>    range.
>>    + *
>>    + * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
>>    + */
>>    +#define I915_PARAM_VM_BIND_VERSION     57
>>    +
>>    +/**
>>    + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
>>    + *
>>    + * Flag to opt-in for VM_BIND mode of binding during VM creation.
>>    + * See struct drm_i915_gem_vm_control flags.
>>    + *
>>    + * The older execbuf2 ioctl will not support VM_BIND mode of operation.
>>    + * For VM_BIND mode, we have new execbuf3 ioctl which will not accept
>>    any
>>    + * execlist (See struct drm_i915_gem_execbuffer3 for more details).
>>    + */
>>    +#define I915_VM_CREATE_FLAGS_USE_VM_BIND       (1 << 0)
>>    +
>>    +/* VM_BIND related ioctls */
>>    +#define DRM_I915_GEM_VM_BIND           0x3d
>>    +#define DRM_I915_GEM_VM_UNBIND         0x3e
>>    +#define DRM_I915_GEM_EXECBUFFER3       0x3f
>>    +
>>    +#define DRM_IOCTL_I915_GEM_VM_BIND                
>>DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct
>>    drm_i915_gem_vm_bind)
>>    +#define DRM_IOCTL_I915_GEM_VM_UNBIND              
>>DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct
>>    drm_i915_gem_vm_bind)
>>    +#define DRM_IOCTL_I915_GEM_EXECBUFFER3            
>>DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct
>>    drm_i915_gem_execbuffer3)
>>    +
>>    +/**
>>    + * struct drm_i915_gem_timeline_fence - An input or output timeline
>>    fence.
>>    + *
>>    + * The operation will wait for input fence to signal.
>>    + *
>>    + * The returned output fence will be signaled after the completion of
>>    the
>>    + * operation.
>>    + */
>>    +struct drm_i915_gem_timeline_fence {
>>    +       /** @handle: User's handle for a drm_syncobj to wait on or
>>    signal. */
>>    +       __u32 handle;
>>    +
>>    +       /**
>>    +        * @flags: Supported flags are:
>>    +        *
>>    +        * I915_TIMELINE_FENCE_WAIT:
>>    +        * Wait for the input fence before the operation.
>>    +        *
>>    +        * I915_TIMELINE_FENCE_SIGNAL:
>>    +        * Return operation completion fence as output.
>>    +        */
>>    +       __u32 flags;
>>    +#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
>>    +#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
>>    +#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS
>>    (-(I915_TIMELINE_FENCE_SIGNAL << 1))
>>    +
>>    +       /**
>>    +        * @value: A point in the timeline.
>>    +        * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>>    +        * timeline drm_syncobj is invalid as it turns a drm_syncobj
>>    into a
>>    +        * binary one.
>>    +        */
>>    +       __u64 value;
>>    +};
>>    +
>>    +/**
>>    + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>    + *
>>    + * This structure is passed to VM_BIND ioctl and specifies the mapping
>>    of GPU
>>    + * virtual address (VA) range to the section of an object that should
>>    be bound
>>    + * in the device page table of the specified address space (VM).
>>    + * The VA range specified must be unique (ie., not currently bound) and
>>    can
>>    + * be mapped to whole object or a section of the object (partial
>>    binding).
>>    + * Multiple VA mappings can be created to the same section of the
>>    object
>>    + * (aliasing).
>>    + *
>>    + * The @start, @offset and @length must be 4K page aligned. However the
>>    DG2
>>    + * and XEHPSDV has 64K page size for device local-memory and has
>>    compact page
>>    + * table. On those platforms, for binding device local-memory objects,
>>    the
>>    + * @start must be 2M aligned, @offset and @length must be 64K aligned.
>>
>>  This is not acceptable.  We need 64K granularity.  This includes the
>>  starting address, the BO offset, and the length.  Why?  The tl;dr is that
>>  it's a requirement for about 50% of D3D12 apps if we want them to run on
>>  Linux via D3D12.  A longer explanation follows.  I don't necessarily
>>  expect kernel folks to get all the details but hopefully I'll have left
>>  enough of a map that some of the Intel Mesa folks can help fill in
>>  details.
>>  Many modern D3D12 apps have a hard requirement on Tier2 tiled 
>>resources.   This is a feature that Intel has supported in the D3D12 
>>driver since
>>  Skylake.  In order to implement this feature, VKD3D requires the various
>>  sparseResidencyImage* and sparseResidency*Sampled Vulkan features.  If we
>>  want those apps to work (there's getting to be quite a few of them), we
>>  need to implement the Vulkan sparse residency features.
>>  What is sparse residency?  I'm glad you asked!  The sparse residency
>>  features allow a client to separately bind each miplevel or array slice of
>>  an image to a chunk of device memory independently, without affecting any
>>  other areas of the image.  Once you get to a high enough miplevel that
>>  everything fits inside a single sparse image block (that's a technical
>>  Vulkan term you can search for in the spec), you can enter a "miptail"
>>  which contains all the remaining miplevels in a single sparse image block.
>>  The term "sparse image block" is what the Vulkan spec uses.  On Intel
>>  hardware and in the docs, it's what we call a "tile".  Specifically, the
>>  image needs to use Yf or Ys tiling on SKL-TGL or a Tile64 on DG2+.  This
>>  is because Tile4 and legacy X and Y-tiling don't provide any guarantees
>>  about page alignment for slices.  Yf, Ys, and Tile64, on the other hand,
>>  align all slices of the image to a tile boundary, allowing us to map
>>  memory to different slices independently, assuming we have 64K (or 4K for
>>  Yf) VM_BIND granularity.  (4K isn't actually a requirement for SKL-TGL; we
>>  can use Ys all the time which has 64K tiles but there's no reason to not
>>  support 4K alignments on integrated.)
>>  Someone may be tempted to ask, "Can't we wiggle the strides around or
>>  something to make it work?"  I thought about that and no, you can't.  The
>>  problem here is LOD2+.  Sure, you can have a stride such that the image is
>>  a multiple of 2M worth of tiles across.  That'll work fine for LOD0 and
>>  LOD1; both will be 2M aligned.  However, LOD2 won't be and there's no way
>>  to control that.  The hardware will place it to the right of LOD1 by
>>  ROUND_UP(width, tile_width) pixels and there's nothing you can do about
>>  that.  If that position doesn't happen to hit a 2M boundary, you're out of
>>  luck.
>>  I hope that explanation provides enough detail.  Sadly, this is one of
>>  those things which has a lot of moving pieces all over different bits of
>>  the hardware and various APIs and they all have to work together just
>>  right for it to all come out in the end.  But, yeah, we really need 64K
>>  aligned binding if we want VKD3D to work.
>
>Thanks Jason,
>
>We currently had 64K alignment for VM_BIND, But currently for non-VM_BIND

s/We currently had/We previously had/

>scenario (for soft-pinning), there is a 2M alignment requirement and I just
>kept the same for VM_BIND. This was discussed here.
>https://lists.freedesktop.org/archives/intel-gfx/2022-June/299185.html
>
>So Matt Auld,
>If this 2M requirement is not going to cut it for Mesa sparse binding feature,
>I think we will have to go with 64K alignment but ensuring UMD doesn't mix
>and match 64K and 4K mappings in same 2M range. What do you think?
>
>Niranjana
>
>>  --Jason
>>
>>    + * Also, for such mappings, i915 will reserve the whole 2M range for it
>>    so as
>>    + * to not allow multiple mappings in that 2M range (Compact page tables
>>    do not
>>    + * allow 64K page and 4K page bindings in the same 2M range).
>>    + *
>>    + * Error code -EINVAL will be returned if @start, @offset and @length
>>    are not
>>    + * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION),
>>    error code
>>    + * -ENOSPC will be returned if the VA range specified can't be
>>    reserved.
>>    + *
>>    + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
>>    concurrently
>>    + * are not ordered. Furthermore, parts of the VM_BIND operation can be
>>    done
>>    + * asynchronously, if valid @fence is specified.
>>    + */
>>    +struct drm_i915_gem_vm_bind {
>>    +       /** @vm_id: VM (address space) id to bind */
>>    +       __u32 vm_id;
>>    +
>>    +       /** @handle: Object handle */
>>    +       __u32 handle;
>>    +
>>    +       /** @start: Virtual Address start to bind */
>>    +       __u64 start;
>>    +
>>    +       /** @offset: Offset in object to bind */
>>    +       __u64 offset;
>>    +
>>    +       /** @length: Length of mapping to bind */
>>    +       __u64 length;
>>    +
>>    +       /**
>>    +        * @flags: Supported flags are:
>>    +        *
>>    +        * I915_GEM_VM_BIND_READONLY:
>>    +        * Mapping is read-only.
>>    +        *
>>    +        * I915_GEM_VM_BIND_CAPTURE:
>>    +        * Capture this mapping in the dump upon GPU error.
>>    +        */
>>    +       __u64 flags;
>>    +#define I915_GEM_VM_BIND_READONLY      (1 << 1)
>>    +#define I915_GEM_VM_BIND_CAPTURE       (1 << 2)
>>    +
>>    +       /**
>>    +        * @fence: Timeline fence for bind completion signaling.
>>    +        *
>>    +        * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>>    +        * is invalid, and an error will be returned.
>>    +        */
>>    +       struct drm_i915_gem_timeline_fence fence;
>>    +
>>    +       /**
>>    +        * @extensions: Zero-terminated chain of extensions.
>>    +        *
>>    +        * For future extensions. See struct i915_user_extension.
>>    +        */
>>    +       __u64 extensions;
>>    +};
>>    +
>>    +/**
>>    + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
>>    + *
>>    + * This structure is passed to VM_UNBIND ioctl and specifies the GPU
>>    virtual
>>    + * address (VA) range that should be unbound from the device page table
>>    of the
>>    + * specified address space (VM). VM_UNBIND will force unbind the
>>    specified
>>    + * range from device page table without waiting for any GPU job to
>>    complete.
>>    + * It is UMDs responsibility to ensure the mapping is no longer in use
>>    before
>>    + * calling VM_UNBIND.
>>    + *
>>    + * If the specified mapping is not found, the ioctl will simply return
>>    without
>>    + * any error.
>>    + *
>>    + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
>>    concurrently
>>    + * are not ordered. Furthermore, parts of the VM_UNBIND operation can
>>    be done
>>    + * asynchronously, if valid @fence is specified.
>>    + */
>>    +struct drm_i915_gem_vm_unbind {
>>    +       /** @vm_id: VM (address space) id to bind */
>>    +       __u32 vm_id;
>>    +
>>    +       /** @rsvd: Reserved, MBZ */
>>    +       __u32 rsvd;
>>    +
>>    +       /** @start: Virtual Address start to unbind */
>>    +       __u64 start;
>>    +
>>    +       /** @length: Length of mapping to unbind */
>>    +       __u64 length;
>>    +
>>    +       /** @flags: Currently reserved, MBZ */
>>    +       __u64 flags;
>>    +
>>    +       /**
>>    +        * @fence: Timeline fence for unbind completion signaling.
>>    +        *
>>    +        * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>>    +        * is invalid, and an error will be returned.
>>    +        */
>>    +       struct drm_i915_gem_timeline_fence fence;
>>    +
>>    +       /**
>>    +        * @extensions: Zero-terminated chain of extensions.
>>    +        *
>>    +        * For future extensions. See struct i915_user_extension.
>>    +        */
>>    +       __u64 extensions;
>>    +};
>>    +
>>    +/**
>>    + * struct drm_i915_gem_execbuffer3 - Structure for
>>    DRM_I915_GEM_EXECBUFFER3
>>    + * ioctl.
>>    + *
>>    + * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and
>>    VM_BIND mode
>>    + * only works with this ioctl for submission.
>>    + * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
>>    + */
>>    +struct drm_i915_gem_execbuffer3 {
>>    +       /**
>>    +        * @ctx_id: Context id
>>    +        *
>>    +        * Only contexts with user engine map are allowed.
>>    +        */
>>    +       __u32 ctx_id;
>>    +
>>    +       /**
>>    +        * @engine_idx: Engine index
>>    +        *
>>    +        * An index in the user engine map of the context specified by
>>    @ctx_id.
>>    +        */
>>    +       __u32 engine_idx;
>>    +
>>    +       /**
>>    +        * @batch_address: Batch gpu virtual address/es.
>>    +        *
>>    +        * For normal submission, it is the gpu virtual address of the
>>    batch
>>    +        * buffer. For parallel submission, it is a pointer to an array
>>    of
>>    +        * batch buffer gpu virtual addresses with array size equal to
>>    the
>>    +        * number of (parallel) engines involved in that submission (See
>>    +        * struct i915_context_engines_parallel_submit).
>>    +        */
>>    +       __u64 batch_address;
>>    +
>>    +       /** @flags: Currently reserved, MBZ */
>>    +       __u64 flags;
>>    +
>>    +       /** @rsvd1: Reserved, MBZ */
>>    +       __u32 rsvd1;
>>    +
>>    +       /** @fence_count: Number of fences in @timeline_fences array. */
>>    +       __u32 fence_count;
>>    +
>>    +       /**
>>    +        * @timeline_fences: Pointer to an array of timeline fences.
>>    +        *
>>    +        * Timeline fences are of format struct
>>    drm_i915_gem_timeline_fence.
>>    +        */
>>    +       __u64 timeline_fences;
>>    +
>>    +       /** @rsvd2: Reserved, MBZ */
>>    +       __u64 rsvd2;
>>    +
>>    +       /**
>>    +        * @extensions: Zero-terminated chain of extensions.
>>    +        *
>>    +        * For future extensions. See struct i915_user_extension.
>>    +        */
>>    +       __u64 extensions;
>>    +};
>>    +
>>    +/**
>>    + * struct drm_i915_gem_create_ext_vm_private - Extension to make the
>>    object
>>    + * private to the specified VM.
>>    + *
>>    + * See struct drm_i915_gem_create_ext.
>>    + */
>>    +struct drm_i915_gem_create_ext_vm_private {
>>    +#define I915_GEM_CREATE_EXT_VM_PRIVATE         2
>>    +       /** @base: Extension link. See struct i915_user_extension. */
>>    +       struct i915_user_extension base;
>>    +
>>    +       /** @vm_id: Id of the VM to which the object is private */
>>    +       __u32 vm_id;
>>    +};
>>    --
>>    2.21.0.rc0.32.g243a4c7e27
