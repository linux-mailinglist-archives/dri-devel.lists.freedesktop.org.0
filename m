Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E117E561F5B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 17:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6BE10E1C4;
	Thu, 30 Jun 2022 15:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FF410E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:35:11 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31780ad7535so182885427b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8haTjNBcH+LcftoXE3ahpr3dk7E0a9MOTmlN+dsj4M=;
 b=BsXPi7eVJunj/Tvfh7LnIaCGWjcpdiOpYVN/0JKA7HeW7l7oGUzYIPi8aPQYIGwaxT
 rG4cTrqImejVN9MABcoW7XC8hNfGrL27k4qpVHAe0GFeadBrs2FFRX7camHs4wUP9C0Z
 Fqll7tSS6pUxWrhZCaHNyehzZgGUBBY7xNbq6scZqRQneY6rAXY3+BXcD3ovJL6jkEma
 PZzIbRw/5jnpRcRWB0sYDK2HOMqKjgeklap6pHoUy7S9wyruwGuIhrjb9h9Kneax+vDI
 vJexpNRFf5NaNthQrDgpcyBSdu0FXi4Pexv4vcvWOm2On1W/HlmC/6QVArcHfHCzYH0a
 oaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8haTjNBcH+LcftoXE3ahpr3dk7E0a9MOTmlN+dsj4M=;
 b=fDvO9SXIyTEd/unX0ALGr6rVj0tSPAIfZGQA/50oTcU4hzdMXd4hu5CyK2/fkoBANN
 O/JsRLQkY9klJRxxftX1vFHgJCvtpQKelYSQIj0Y2jD0UuChIL8OmciZxKz51gV/dgMv
 KTfD3YQIMFGH7wvsLhmuVt9+/ARvolMovDf5MO0u+o4zJs5cN/6C2x2HfGiH1azpaLW0
 RSfFYOf5GcITA809ejKJQGnvefyZBaWnVKzwJ95WFghv7395Cd+a/X7jxyABTjT0sUFS
 5XgjcnY4anKDMLpE7CNo58UYfmC6KOb662FKsPEuZgrqGq81YSc5nc50zXHM5QQKPFEW
 IPGg==
X-Gm-Message-State: AJIora+A+uMPMPMQJzFlAeV8NC3Zxn3HMti5NFfBA82ogt9OC6+kPtRx
 EuQeGGLssxBi/Wok5EhbXVic/6lMVKGpl8BMeGXNog==
X-Google-Smtp-Source: AGRyM1utiyQEpt4zUSHSw+wrssNyP5doS+Qyb+cNRng5NOs2cV0mYAt9a8n2w3he2aHY2rSWEIymiz5Rjco7atAK9oU=
X-Received: by 2002:a81:5745:0:b0:318:99e6:3279 with SMTP id
 l66-20020a815745000000b0031899e63279mr10763213ywb.311.1656603310656; Thu, 30
 Jun 2022 08:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
 <20220626014916.5130-4-niranjana.vishwanathapura@intel.com>
 <CAOFGe954aK2wz_TEORbw3BsW1a7EHtpUB1g6ZoYX=kSVmn+kRg@mail.gmail.com>
 <41f09e4b-4da2-de96-5f4b-a571670f738f@intel.com>
In-Reply-To: <41f09e4b-4da2-de96-5f4b-a571670f738f@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 30 Jun 2022 10:34:59 -0500
Message-ID: <CAOFGe95FeJmhisxfL9vk_Fy8cGYZLG5FR8ZRA8r7MjOfz3r3fQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/doc/rfc: VM_BIND uapi definition
To: Matthew Auld <matthew.auld@intel.com>
Content-Type: multipart/alternative; boundary="000000000000dd9f2e05e2ac03d7"
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, oak.zeng@intel.com,
 Chris Wilson <chris.p.wilson@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dd9f2e05e2ac03d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2022 at 10:14 AM Matthew Auld <matthew.auld@intel.com>
wrote:

> On 30/06/2022 06:11, Jason Ekstrand wrote:
> > On Sat, Jun 25, 2022 at 8:49 PM Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com
> > <mailto:niranjana.vishwanathapura@intel.com>> wrote:
> >
> >     VM_BIND and related uapi definitions
> >
> >     v2: Reduce the scope to simple Mesa use case.
> >     v3: Expand VM_UNBIND documentation and add
> >          I915_GEM_VM_BIND/UNBIND_FENCE_VALID
> >          and I915_GEM_VM_BIND_TLB_FLUSH flags.
> >     v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional
> >          documentation for vm_bind/unbind.
> >     v5: Remove TLB flush requirement on VM_UNBIND.
> >          Add version support to stage implementation.
> >     v6: Define and use drm_i915_gem_timeline_fence structure for
> >          all timeline fences.
> >     v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.
> >          Update documentation on async vm_bind/unbind and versioning.
> >          Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3
> >          batch_count field and I915_EXEC3_SECURE flag.
> >
> >     Signed-off-by: Niranjana Vishwanathapura
> >     <niranjana.vishwanathapura@intel.com
> >     <mailto:niranjana.vishwanathapura@intel.com>>
> >     Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch
> >     <mailto:daniel.vetter@ffwll.ch>>
> >     ---
> >       Documentation/gpu/rfc/i915_vm_bind.h | 280
> +++++++++++++++++++++++++++
> >       1 file changed, 280 insertions(+)
> >       create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
> >
> >     diff --git a/Documentation/gpu/rfc/i915_vm_bind.h
> >     b/Documentation/gpu/rfc/i915_vm_bind.h
> >     new file mode 100644
> >     index 000000000000..a93e08bceee6
> >     --- /dev/null
> >     +++ b/Documentation/gpu/rfc/i915_vm_bind.h
> >     @@ -0,0 +1,280 @@
> >     +/* SPDX-License-Identifier: MIT */
> >     +/*
> >     + * Copyright =C2=A9 2022 Intel Corporation
> >     + */
> >     +
> >     +/**
> >     + * DOC: I915_PARAM_VM_BIND_VERSION
> >     + *
> >     + * VM_BIND feature version supported.
> >     + * See typedef drm_i915_getparam_t param.
> >     + *
> >     + * Specifies the VM_BIND feature version supported.
> >     + * The following versions of VM_BIND have been defined:
> >     + *
> >     + * 0: No VM_BIND support.
> >     + *
> >     + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings
> >     created
> >     + *    previously with VM_BIND, the ioctl will not support unbindin=
g
> >     multiple
> >     + *    mappings or splitting them. Similarly, VM_BIND calls will no=
t
> >     replace
> >     + *    any existing mappings.
> >     + *
> >     + * 2: The restrictions on unbinding partial or multiple mappings i=
s
> >     + *    lifted, Similarly, binding will replace any mappings in the
> >     given range.
> >     + *
> >     + * See struct drm_i915_gem_vm_bind and struct
> drm_i915_gem_vm_unbind.
> >     + */
> >     +#define I915_PARAM_VM_BIND_VERSION     57
> >     +
> >     +/**
> >     + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
> >     + *
> >     + * Flag to opt-in for VM_BIND mode of binding during VM creation.
> >     + * See struct drm_i915_gem_vm_control flags.
> >     + *
> >     + * The older execbuf2 ioctl will not support VM_BIND mode of
> operation.
> >     + * For VM_BIND mode, we have new execbuf3 ioctl which will not
> >     accept any
> >     + * execlist (See struct drm_i915_gem_execbuffer3 for more details)=
.
> >     + */
> >     +#define I915_VM_CREATE_FLAGS_USE_VM_BIND       (1 << 0)
> >     +
> >     +/* VM_BIND related ioctls */
> >     +#define DRM_I915_GEM_VM_BIND           0x3d
> >     +#define DRM_I915_GEM_VM_UNBIND         0x3e
> >     +#define DRM_I915_GEM_EXECBUFFER3       0x3f
> >     +
> >     +#define DRM_IOCTL_I915_GEM_VM_BIND
> >       DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct
> >     drm_i915_gem_vm_bind)
> >     +#define DRM_IOCTL_I915_GEM_VM_UNBIND
> >       DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct
> >     drm_i915_gem_vm_bind)
> >     +#define DRM_IOCTL_I915_GEM_EXECBUFFER3
> >       DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct
> >     drm_i915_gem_execbuffer3)
> >     +
> >     +/**
> >     + * struct drm_i915_gem_timeline_fence - An input or output timelin=
e
> >     fence.
> >     + *
> >     + * The operation will wait for input fence to signal.
> >     + *
> >     + * The returned output fence will be signaled after the completion
> >     of the
> >     + * operation.
> >     + */
> >     +struct drm_i915_gem_timeline_fence {
> >     +       /** @handle: User's handle for a drm_syncobj to wait on or
> >     signal. */
> >     +       __u32 handle;
> >     +
> >     +       /**
> >     +        * @flags: Supported flags are:
> >     +        *
> >     +        * I915_TIMELINE_FENCE_WAIT:
> >     +        * Wait for the input fence before the operation.
> >     +        *
> >     +        * I915_TIMELINE_FENCE_SIGNAL:
> >     +        * Return operation completion fence as output.
> >     +        */
> >     +       __u32 flags;
> >     +#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
> >     +#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
> >     +#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS
> >     (-(I915_TIMELINE_FENCE_SIGNAL << 1))
> >     +
> >     +       /**
> >     +        * @value: A point in the timeline.
> >     +        * Value must be 0 for a binary drm_syncobj. A Value of 0
> for a
> >     +        * timeline drm_syncobj is invalid as it turns a drm_syncob=
j
> >     into a
> >     +        * binary one.
> >     +        */
> >     +       __u64 value;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
> >     + *
> >     + * This structure is passed to VM_BIND ioctl and specifies the
> >     mapping of GPU
> >     + * virtual address (VA) range to the section of an object that
> >     should be bound
> >     + * in the device page table of the specified address space (VM).
> >     + * The VA range specified must be unique (ie., not currently bound=
)
> >     and can
> >     + * be mapped to whole object or a section of the object (partial
> >     binding).
> >     + * Multiple VA mappings can be created to the same section of the
> >     object
> >     + * (aliasing).
> >     + *
> >     + * The @start, @offset and @length must be 4K page aligned. Howeve=
r
> >     the DG2
> >     + * and XEHPSDV has 64K page size for device local-memory and has
> >     compact page
> >     + * table. On those platforms, for binding device local-memory
> >     objects, the
> >     + * @start must be 2M aligned, @offset and @length must be 64K
> aligned.
> >
> >
> > This is not acceptable.  We need 64K granularity.  This includes the
> > starting address, the BO offset, and the length.  Why?  The tl;dr is
> > that it's a requirement for about 50% of D3D12 apps if we want them to
> > run on Linux via D3D12.  A longer explanation follows.  I don't
> > necessarily expect kernel folks to get all the details but hopefully
> > I'll have left enough of a map that some of the Intel Mesa folks can
> > help fill in details.
> >
> > Many modern D3D12 apps have a hard requirement on Tier2 tiled
> > resources.  This is a feature that Intel has supported in the D3D12
> > driver since Skylake.  In order to implement this feature, VKD3D
> > requires the various sparseResidencyImage* and sparseResidency*Sampled
> > Vulkan features.  If we want those apps to work (there's getting to be
> > quite a few of them), we need to implement the Vulkan sparse residency
> > features.
> > |
> > |
> > What is sparse residency?  I'm glad you asked!  The sparse residency
> > features allow a client to separately bind each miplevel or array slice
> > of an image to a chunk of device memory independently, without affectin=
g
> > any other areas of the image.  Once you get to a high enough miplevel
> > that everything fits inside a single sparse image block (that's a
> > technical Vulkan term you can search for in the spec), you can enter a
> > "miptail" which contains all the remaining miplevels in a single sparse
> > image block.
> >
> > The term "sparse image block" is what the Vulkan spec uses.  On Intel
> > hardware and in the docs, it's what we call a "tile".  Specifically, th=
e
> > image needs to use Yf or Ys tiling on SKL-TGL or a Tile64 on DG2+.  Thi=
s
> > is because Tile4 and legacy X and Y-tiling don't provide any guarantees
> > about page alignment for slices.  Yf, Ys, and Tile64, on the other hand=
,
> > align all slices of the image to a tile boundary, allowing us to map
> > memory to different slices independently, assuming we have 64K (or 4K
> > for Yf) VM_BIND granularity.  (4K isn't actually a requirement for
> > SKL-TGL; we can use Ys all the time which has 64K tiles but there's no
> > reason to not support 4K alignments on integrated.)
> >
> > Someone may be tempted to ask, "Can't we wiggle the strides around or
> > something to make it work?"  I thought about that and no, you can't.
> > The problem here is LOD2+.  Sure, you can have a stride such that the
> > image is a multiple of 2M worth of tiles across.  That'll work fine for
> > LOD0 and LOD1; both will be 2M aligned.  However, LOD2 won't be and
> > there's no way to control that.  The hardware will place it to the righ=
t
> > of LOD1 by ROUND_UP(width, tile_width) pixels and there's nothing you
> > can do about that.  If that position doesn't happen to hit a 2M
> > boundary, you're out of luck.
> >
> > I hope that explanation provides enough detail.  Sadly, this is one of
> > those things which has a lot of moving pieces all over different bits o=
f
> > the hardware and various APIs and they all have to work together just
> > right for it to all come out in the end.  But, yeah, we really need 64K
> > aligned binding if we want VKD3D to work.
>
> Just to confirm, the new model would be to enforce 64K GTT alignment for
> lmem pages, and then for smem pages we would only require 4K alignment,
> but with the added restriction that userspace will never try to mix the
> two (lmem vs smem) within the same 2M va range (page-table). The kernel
> will verify this and throw an error if needed. This model should work
> with the above?
>

Mesa doesn't have full control over BO placement so I don't think we can
guarantee quite as much as you want there.  We can guarantee, I think, that
we never place LMEM-only and SMEM-only in the same 2M block.  However, most
BOs will be LMEM+SMEM (with a preference for LMEM) and then it'll be up to
the kernel to sort out any issues.  Is that reasonable?

--Jason



> >
> > --Jason
> >
> >     + * Also, for such mappings, i915 will reserve the whole 2M range
> >     for it so as
> >     + * to not allow multiple mappings in that 2M range (Compact page
> >     tables do not
> >     + * allow 64K page and 4K page bindings in the same 2M range).
> >     + *
> >     + * Error code -EINVAL will be returned if @start, @offset and
> >     @length are not
> >     + * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION)=
,
> >     error code
> >     + * -ENOSPC will be returned if the VA range specified can't be
> >     reserved.
> >     + *
> >     + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
> >     concurrently
> >     + * are not ordered. Furthermore, parts of the VM_BIND operation ca=
n
> >     be done
> >     + * asynchronously, if valid @fence is specified.
> >     + */
> >     +struct drm_i915_gem_vm_bind {
> >     +       /** @vm_id: VM (address space) id to bind */
> >     +       __u32 vm_id;
> >     +
> >     +       /** @handle: Object handle */
> >     +       __u32 handle;
> >     +
> >     +       /** @start: Virtual Address start to bind */
> >     +       __u64 start;
> >     +
> >     +       /** @offset: Offset in object to bind */
> >     +       __u64 offset;
> >     +
> >     +       /** @length: Length of mapping to bind */
> >     +       __u64 length;
> >     +
> >     +       /**
> >     +        * @flags: Supported flags are:
> >     +        *
> >     +        * I915_GEM_VM_BIND_READONLY:
> >     +        * Mapping is read-only.
> >     +        *
> >     +        * I915_GEM_VM_BIND_CAPTURE:
> >     +        * Capture this mapping in the dump upon GPU error.
> >     +        */
> >     +       __u64 flags;
> >     +#define I915_GEM_VM_BIND_READONLY      (1 << 1)
> >     +#define I915_GEM_VM_BIND_CAPTURE       (1 << 2)
> >     +
> >     +       /**
> >     +        * @fence: Timeline fence for bind completion signaling.
> >     +        *
> >     +        * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT
> flag
> >     +        * is invalid, and an error will be returned.
> >     +        */
> >     +       struct drm_i915_gem_timeline_fence fence;
> >     +
> >     +       /**
> >     +        * @extensions: Zero-terminated chain of extensions.
> >     +        *
> >     +        * For future extensions. See struct i915_user_extension.
> >     +        */
> >     +       __u64 extensions;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
> >     + *
> >     + * This structure is passed to VM_UNBIND ioctl and specifies the
> >     GPU virtual
> >     + * address (VA) range that should be unbound from the device page
> >     table of the
> >     + * specified address space (VM). VM_UNBIND will force unbind the
> >     specified
> >     + * range from device page table without waiting for any GPU job to
> >     complete.
> >     + * It is UMDs responsibility to ensure the mapping is no longer in
> >     use before
> >     + * calling VM_UNBIND.
> >     + *
> >     + * If the specified mapping is not found, the ioctl will simply
> >     return without
> >     + * any error.
> >     + *
> >     + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
> >     concurrently
> >     + * are not ordered. Furthermore, parts of the VM_UNBIND operation
> >     can be done
> >     + * asynchronously, if valid @fence is specified.
> >     + */
> >     +struct drm_i915_gem_vm_unbind {
> >     +       /** @vm_id: VM (address space) id to bind */
> >     +       __u32 vm_id;
> >     +
> >     +       /** @rsvd: Reserved, MBZ */
> >     +       __u32 rsvd;
> >     +
> >     +       /** @start: Virtual Address start to unbind */
> >     +       __u64 start;
> >     +
> >     +       /** @length: Length of mapping to unbind */
> >     +       __u64 length;
> >     +
> >     +       /** @flags: Currently reserved, MBZ */
> >     +       __u64 flags;
> >     +
> >     +       /**
> >     +        * @fence: Timeline fence for unbind completion signaling.
> >     +        *
> >     +        * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT
> flag
> >     +        * is invalid, and an error will be returned.
> >     +        */
> >     +       struct drm_i915_gem_timeline_fence fence;
> >     +
> >     +       /**
> >     +        * @extensions: Zero-terminated chain of extensions.
> >     +        *
> >     +        * For future extensions. See struct i915_user_extension.
> >     +        */
> >     +       __u64 extensions;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_i915_gem_execbuffer3 - Structure for
> >     DRM_I915_GEM_EXECBUFFER3
> >     + * ioctl.
> >     + *
> >     + * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and
> >     VM_BIND mode
> >     + * only works with this ioctl for submission.
> >     + * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
> >     + */
> >     +struct drm_i915_gem_execbuffer3 {
> >     +       /**
> >     +        * @ctx_id: Context id
> >     +        *
> >     +        * Only contexts with user engine map are allowed.
> >     +        */
> >     +       __u32 ctx_id;
> >     +
> >     +       /**
> >     +        * @engine_idx: Engine index
> >     +        *
> >     +        * An index in the user engine map of the context specified
> >     by @ctx_id.
> >     +        */
> >     +       __u32 engine_idx;
> >     +
> >     +       /**
> >     +        * @batch_address: Batch gpu virtual address/es.
> >     +        *
> >     +        * For normal submission, it is the gpu virtual address of
> >     the batch
> >     +        * buffer. For parallel submission, it is a pointer to an
> >     array of
> >     +        * batch buffer gpu virtual addresses with array size equal
> >     to the
> >     +        * number of (parallel) engines involved in that submission
> (See
> >     +        * struct i915_context_engines_parallel_submit).
> >     +        */
> >     +       __u64 batch_address;
> >     +
> >     +       /** @flags: Currently reserved, MBZ */
> >     +       __u64 flags;
> >     +
> >     +       /** @rsvd1: Reserved, MBZ */
> >     +       __u32 rsvd1;
> >     +
> >     +       /** @fence_count: Number of fences in @timeline_fences
> array. */
> >     +       __u32 fence_count;
> >     +
> >     +       /**
> >     +        * @timeline_fences: Pointer to an array of timeline fences=
.
> >     +        *
> >     +        * Timeline fences are of format struct
> >     drm_i915_gem_timeline_fence.
> >     +        */
> >     +       __u64 timeline_fences;
> >     +
> >     +       /** @rsvd2: Reserved, MBZ */
> >     +       __u64 rsvd2;
> >     +
> >     +       /**
> >     +        * @extensions: Zero-terminated chain of extensions.
> >     +        *
> >     +        * For future extensions. See struct i915_user_extension.
> >     +        */
> >     +       __u64 extensions;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_i915_gem_create_ext_vm_private - Extension to make
> >     the object
> >     + * private to the specified VM.
> >     + *
> >     + * See struct drm_i915_gem_create_ext.
> >     + */
> >     +struct drm_i915_gem_create_ext_vm_private {
> >     +#define I915_GEM_CREATE_EXT_VM_PRIVATE         2
> >     +       /** @base: Extension link. See struct i915_user_extension. =
*/
> >     +       struct i915_user_extension base;
> >     +
> >     +       /** @vm_id: Id of the VM to which the object is private */
> >     +       __u32 vm_id;
> >     +};
> >     --
> >     2.21.0.rc0.32.g243a4c7e27
> >
>

--000000000000dd9f2e05e2ac03d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jun 30, 2022 at 10:14 AM Matthew Auld &lt;<a href=3D"mailto:=
matthew.auld@intel.com">matthew.auld@intel.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On 30/06/2022 06:11, Jason Ek=
strand wrote:<br>
&gt; On Sat, Jun 25, 2022 at 8:49 PM Niranjana Vishwanathapura <br>
&gt; &lt;<a href=3D"mailto:niranjana.vishwanathapura@intel.com" target=3D"_=
blank">niranjana.vishwanathapura@intel.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:niranjana.vishwanathapura@intel.com" targ=
et=3D"_blank">niranjana.vishwanathapura@intel.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0VM_BIND and related uapi definitions<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0v2: Reduce the scope to simple Mesa use case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0v3: Expand VM_UNBIND documentation and add<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I915_GEM_VM_BIND/UNBIND_FENCE_VALID<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and I915_GEM_VM_BIND_TLB_FLUSH flags=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add =
additional<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 documentation for vm_bind/unbind.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0v5: Remove TLB flush requirement on VM_UNBIND.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Add version support to stage impleme=
ntation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0v6: Define and use drm_i915_gem_timeline_fence stru=
cture for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all timeline fences.<br>
&gt;=C2=A0 =C2=A0 =C2=A0v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_=
BIND_VERSION.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Update documentation on async vm_bin=
d/unbind and versioning.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Remove redundant vm_bind/unbind FENC=
E_VALID flag, execbuf3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 batch_count field and I915_EXEC3_SEC=
URE flag.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Niranjana Vishwanathapura<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:niranjana.vishwanathapura@int=
el.com" target=3D"_blank">niranjana.vishwanathapura@intel.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:niranjana.vishwanathap=
ura@intel.com" target=3D"_blank">niranjana.vishwanathapura@intel.com</a>&gt=
;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:da=
niel.vetter@ffwll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:daniel.vetter@ffwll.ch=
" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/gpu/rfc/i915_vm_bind.h | 280 +=
++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 280 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 Documentation/gpu/rfc/i91=
5_vm_bind.h<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/Documentation/gpu/rfc/i915_vm_bind.h<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0b/Documentation/gpu/rfc/i915_vm_bind.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 000000000000..a93e08bceee6<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/Documentation/gpu/rfc/i915_vm_bind.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,280 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/* SPDX-License-Identifier: MIT */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Copyright =C2=A9 2022 Intel Corporation<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * DOC: I915_PARAM_VM_BIND_VERSION<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * VM_BIND feature version supported.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * See typedef drm_i915_getparam_t param.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Specifies the VM_BIND feature version supported=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * The following versions of VM_BIND have been def=
ined:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * 0: No VM_BIND support.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * 1: In VM_UNBIND calls, the UMD must specify the=
 exact mappings<br>
&gt;=C2=A0 =C2=A0 =C2=A0created<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 previously with VM_BIND, the ioctl=
 will not support unbinding<br>
&gt;=C2=A0 =C2=A0 =C2=A0multiple<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 mappings or splitting them. Simila=
rly, VM_BIND calls will not<br>
&gt;=C2=A0 =C2=A0 =C2=A0replace<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 any existing mappings.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * 2: The restrictions on unbinding partial or mul=
tiple mappings is<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 lifted, Similarly, binding will re=
place any mappings in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0given range.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * See struct drm_i915_gem_vm_bind and struct drm_=
i915_gem_vm_unbind.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_PARAM_VM_BIND_VERSION=C2=A0 =C2=A0 =
=C2=A057<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Flag to opt-in for VM_BIND mode of binding duri=
ng VM creation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * See struct drm_i915_gem_vm_control flags.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * The older execbuf2 ioctl will not support VM_BI=
ND mode of operation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * For VM_BIND mode, we have new execbuf3 ioctl wh=
ich will not<br>
&gt;=C2=A0 =C2=A0 =C2=A0accept any<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * execlist (See struct drm_i915_gem_execbuffer3 f=
or more details).<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_VM_CREATE_FLAGS_USE_VM_BIND=C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/* VM_BIND related ioctls */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_I915_GEM_VM_BIND=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x3d<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_I915_GEM_VM_UNBIND=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00x3e<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_I915_GEM_EXECBUFFER3=C2=A0 =C2=A0 =C2=
=A0 =C2=A00x3f<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_IOCTL_I915_GEM_VM_BIND=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_=
BIND, struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_i915_gem_vm_bind)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_IOCTL_I915_GEM_VM_UNBIND=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_=
UNBIND, struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_i915_gem_vm_bind)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_IOCTL_I915_GEM_EXECBUFFER3=C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXE=
CBUFFER3, struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_i915_gem_execbuffer3)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_i915_gem_timeline_fence - An input o=
r output timeline<br>
&gt;=C2=A0 =C2=A0 =C2=A0fence.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * The operation will wait for input fence to sign=
al.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * The returned output fence will be signaled afte=
r the completion<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * operation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_i915_gem_timeline_fence {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: User&#39;s=
 handle for a drm_syncobj to wait on or<br>
&gt;=C2=A0 =C2=A0 =C2=A0signal. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: Supported fl=
ags are:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_TIMELINE_FENCE_=
WAIT:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Wait for the input f=
ence before the operation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_TIMELINE_FENCE_=
SIGNAL:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Return operation com=
pletion fence as output.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_TIMELINE_FENCE_WAIT=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_TIMELINE_FENCE_SIGNAL=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS<br>
&gt;=C2=A0 =C2=A0 =C2=A0(-(I915_TIMELINE_FENCE_SIGNAL &lt;&lt; 1))<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @value: A point in t=
he timeline.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value must be 0 for =
a binary drm_syncobj. A Value of 0 for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * timeline drm_syncobj=
 is invalid as it turns a drm_syncobj<br>
&gt;=C2=A0 =C2=A0 =C2=A0into a<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * binary one.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_i915_gem_vm_bind - VA to object mapp=
ing to bind.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * This structure is passed to VM_BIND ioctl and s=
pecifies the<br>
&gt;=C2=A0 =C2=A0 =C2=A0mapping of GPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * virtual address (VA) range to the section of an=
 object that<br>
&gt;=C2=A0 =C2=A0 =C2=A0should be bound<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * in the device page table of the specified addre=
ss space (VM).<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * The VA range specified must be unique (ie., not=
 currently bound)<br>
&gt;=C2=A0 =C2=A0 =C2=A0and can<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * be mapped to whole object or a section of the o=
bject (partial<br>
&gt;=C2=A0 =C2=A0 =C2=A0binding).<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Multiple VA mappings can be created to the same=
 section of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0object<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * (aliasing).<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * The @start, @offset and @length must be 4K page=
 aligned. However<br>
&gt;=C2=A0 =C2=A0 =C2=A0the DG2<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * and XEHPSDV has 64K page size for device local-=
memory and has<br>
&gt;=C2=A0 =C2=A0 =C2=A0compact page<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * table. On those platforms, for binding device l=
ocal-memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0objects, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * @start must be 2M aligned, @offset and @length =
must be 64K aligned.<br>
&gt; <br>
&gt; <br>
&gt; This is not acceptable.=C2=A0 We need 64K granularity.=C2=A0 This incl=
udes the <br>
&gt; starting address, the BO offset, and the length.=C2=A0 Why?=C2=A0 The =
tl;dr is <br>
&gt; that it&#39;s a requirement for about 50% of D3D12 apps if we want the=
m to <br>
&gt; run on Linux via D3D12.=C2=A0 A longer explanation follows.=C2=A0 I do=
n&#39;t <br>
&gt; necessarily expect kernel folks to get all the details but hopefully <=
br>
&gt; I&#39;ll have left enough of a map that some of the Intel Mesa folks c=
an <br>
&gt; help fill in details.<br>
&gt; <br>
&gt; Many modern D3D12 apps have a hard requirement on Tier2 tiled <br>
&gt; resources.=C2=A0 This is a feature that Intel has supported in the D3D=
12 <br>
&gt; driver since Skylake.=C2=A0 In order to implement this feature, VKD3D =
<br>
&gt; requires the various sparseResidencyImage* and sparseResidency*Sampled=
 <br>
&gt; Vulkan features.=C2=A0 If we want those apps to work (there&#39;s gett=
ing to be <br>
&gt; quite a few of them), we need to implement the Vulkan sparse residency=
 <br>
&gt; features.<br>
&gt; |<br>
&gt; |<br>
&gt; What is sparse residency?=C2=A0 I&#39;m glad you asked!=C2=A0 The spar=
se residency <br>
&gt; features allow a client to separately bind each miplevel or array slic=
e <br>
&gt; of an image to a chunk of device memory independently, without affecti=
ng <br>
&gt; any other areas of the image.=C2=A0 Once you get to a high enough mipl=
evel <br>
&gt; that everything fits inside a single sparse image block (that&#39;s a =
<br>
&gt; technical Vulkan term you can search for in the spec), you can enter a=
 <br>
&gt; &quot;miptail&quot; which contains all the remaining miplevels in a si=
ngle sparse <br>
&gt; image block.<br>
&gt; <br>
&gt; The term &quot;sparse image block&quot; is what the Vulkan spec uses.=
=C2=A0 On Intel <br>
&gt; hardware and in the docs, it&#39;s what we call a &quot;tile&quot;.=C2=
=A0 Specifically, the <br>
&gt; image needs to use Yf or Ys tiling on SKL-TGL or a Tile64 on DG2+.=C2=
=A0 This <br>
&gt; is because Tile4 and legacy X and Y-tiling don&#39;t provide any guara=
ntees <br>
&gt; about page alignment for slices.=C2=A0 Yf, Ys, and Tile64, on the othe=
r hand, <br>
&gt; align all slices of the image to a tile boundary, allowing us to map <=
br>
&gt; memory to different slices independently, assuming we have 64K (or 4K =
<br>
&gt; for Yf) VM_BIND granularity.=C2=A0 (4K isn&#39;t actually a requiremen=
t for <br>
&gt; SKL-TGL; we can use Ys all the time which has 64K tiles but there&#39;=
s no <br>
&gt; reason to not support 4K alignments on integrated.)<br>
&gt; <br>
&gt; Someone may be tempted to ask, &quot;Can&#39;t we wiggle the strides a=
round or <br>
&gt; something to make it work?&quot;=C2=A0 I thought about that and no, yo=
u can&#39;t.=C2=A0 <br>
&gt; The problem here is LOD2+.=C2=A0 Sure, you can have a stride such that=
 the <br>
&gt; image is a multiple of 2M worth of tiles across.=C2=A0 That&#39;ll wor=
k fine for <br>
&gt; LOD0 and LOD1; both will be 2M aligned.=C2=A0 However, LOD2 won&#39;t =
be and <br>
&gt; there&#39;s no way to control that.=C2=A0 The hardware will place it t=
o the right <br>
&gt; of LOD1 by ROUND_UP(width, tile_width) pixels and there&#39;s nothing =
you <br>
&gt; can do about that.=C2=A0 If that position doesn&#39;t happen to hit a =
2M <br>
&gt; boundary, you&#39;re out of luck.<br>
&gt; <br>
&gt; I hope that explanation provides enough detail.=C2=A0 Sadly, this is o=
ne of <br>
&gt; those things which has a lot of moving pieces all over different bits =
of <br>
&gt; the hardware and various APIs and they all have to work together just =
<br>
&gt; right for it to all come out in the end.=C2=A0 But, yeah, we really ne=
ed 64K <br>
&gt; aligned binding if we want VKD3D to work.<br>
<br>
Just to confirm, the new model would be to enforce 64K GTT alignment for <b=
r>
lmem pages, and then for smem pages we would only require 4K alignment, <br=
>
but with the added restriction that userspace will never try to mix the <br=
>
two (lmem vs smem) within the same 2M va range (page-table). The kernel <br=
>
will verify this and throw an error if needed. This model should work <br>
with the above?<br></blockquote><div><br></div><div>Mesa doesn&#39;t have f=
ull control over BO placement so I don&#39;t think we can guarantee quite a=
s much as you want there.=C2=A0 We can guarantee, I think, that we never pl=
ace LMEM-only and SMEM-only in the same 2M block.=C2=A0 However, most BOs w=
ill be LMEM+SMEM (with a preference for LMEM) and then it&#39;ll be up to t=
he kernel to sort out any issues.=C2=A0 Is that reasonable?</div><div><br><=
/div><div>--Jason</div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; <br>
&gt; --Jason<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Also, for such mappings, i915 will reserve the =
whole 2M range<br>
&gt;=C2=A0 =C2=A0 =C2=A0for it so as<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * to not allow multiple mappings in that 2M range=
 (Compact page<br>
&gt;=C2=A0 =C2=A0 =C2=A0tables do not<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * allow 64K page and 4K page bindings in the same=
 2M range).<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Error code -EINVAL will be returned if @start, =
@offset and<br>
&gt;=C2=A0 =C2=A0 =C2=A0@length are not<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * properly aligned. In version 1 (See I915_PARAM_=
VM_BIND_VERSION),<br>
&gt;=C2=A0 =C2=A0 =C2=A0error code<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * -ENOSPC will be returned if the VA range specif=
ied can&#39;t be<br>
&gt;=C2=A0 =C2=A0 =C2=A0reserved.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * VM_BIND/UNBIND ioctl calls executed on differen=
t CPU threads<br>
&gt;=C2=A0 =C2=A0 =C2=A0concurrently<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * are not ordered. Furthermore, parts of the VM_B=
IND operation can<br>
&gt;=C2=A0 =C2=A0 =C2=A0be done<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * asynchronously, if valid @fence is specified.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_i915_gem_vm_bind {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @vm_id: VM (address=
 space) id to bind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: Object han=
dle */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @start: Virtual Add=
ress start to bind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 start;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @offset: Offset in =
object to bind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @length: Length of =
mapping to bind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 length;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: Supported fl=
ags are:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_GEM_VM_BIND_REA=
DONLY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Mapping is read-only=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_GEM_VM_BIND_CAP=
TURE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Capture this mapping=
 in the dump upon GPU error.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_GEM_VM_BIND_READONLY=C2=A0 =C2=A0 =C2=
=A0 (1 &lt;&lt; 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_GEM_VM_BIND_CAPTURE=C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 &lt;&lt; 2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @fence: Timeline fen=
ce for bind completion signaling.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * It is an out fence, =
hence using I915_TIMELINE_FENCE_WAIT flag<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is invalid, and an e=
rror will be returned.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_tim=
eline_fence fence;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @extensions: Zero-te=
rminated chain of extensions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For future extension=
s. See struct i915_user_extension.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 extensions;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_i915_gem_vm_unbind - VA to object ma=
pping to unbind.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * This structure is passed to VM_UNBIND ioctl and=
 specifies the<br>
&gt;=C2=A0 =C2=A0 =C2=A0GPU virtual<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * address (VA) range that should be unbound from =
the device page<br>
&gt;=C2=A0 =C2=A0 =C2=A0table of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * specified address space (VM). VM_UNBIND will fo=
rce unbind the<br>
&gt;=C2=A0 =C2=A0 =C2=A0specified<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * range from device page table without waiting fo=
r any GPU job to<br>
&gt;=C2=A0 =C2=A0 =C2=A0complete.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * It is UMDs responsibility to ensure the mapping=
 is no longer in<br>
&gt;=C2=A0 =C2=A0 =C2=A0use before<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * calling VM_UNBIND.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * If the specified mapping is not found, the ioct=
l will simply<br>
&gt;=C2=A0 =C2=A0 =C2=A0return without<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * any error.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * VM_BIND/UNBIND ioctl calls executed on differen=
t CPU threads<br>
&gt;=C2=A0 =C2=A0 =C2=A0concurrently<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * are not ordered. Furthermore, parts of the VM_U=
NBIND operation<br>
&gt;=C2=A0 =C2=A0 =C2=A0can be done<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * asynchronously, if valid @fence is specified.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_i915_gem_vm_unbind {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @vm_id: VM (address=
 space) id to bind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rsvd: Reserved, MB=
Z */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 rsvd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @start: Virtual Add=
ress start to unbind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 start;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @length: Length of =
mapping to unbind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 length;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: Currently r=
eserved, MBZ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @fence: Timeline fen=
ce for unbind completion signaling.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * It is an out fence, =
hence using I915_TIMELINE_FENCE_WAIT flag<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is invalid, and an e=
rror will be returned.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_tim=
eline_fence fence;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @extensions: Zero-te=
rminated chain of extensions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For future extension=
s. See struct i915_user_extension.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 extensions;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_i915_gem_execbuffer3 - Structure for=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_I915_GEM_EXECBUFFER3<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * ioctl.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM=
_BIND mode and<br>
&gt;=C2=A0 =C2=A0 =C2=A0VM_BIND mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * only works with this ioctl for submission.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * See I915_VM_CREATE_FLAGS_USE_VM_BIND.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_i915_gem_execbuffer3 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @ctx_id: Context id<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Only contexts with u=
ser engine map are allowed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 ctx_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @engine_idx: Engine =
index<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * An index in the user=
 engine map of the context specified<br>
&gt;=C2=A0 =C2=A0 =C2=A0by @ctx_id.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 engine_idx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @batch_address: Batc=
h gpu virtual address/es.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For normal submissio=
n, it is the gpu virtual address of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the batch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * buffer. For parallel=
 submission, it is a pointer to an<br>
&gt;=C2=A0 =C2=A0 =C2=A0array of<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * batch buffer gpu vir=
tual addresses with array size equal<br>
&gt;=C2=A0 =C2=A0 =C2=A0to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * number of (parallel)=
 engines involved in that submission (See<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * struct i915_context_=
engines_parallel_submit).<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 batch_address;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: Currently r=
eserved, MBZ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rsvd1: Reserved, M=
BZ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 rsvd1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @fence_count: Numbe=
r of fences in @timeline_fences array. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 fence_count;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @timeline_fences: Po=
inter to an array of timeline fences.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Timeline fences are =
of format struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_i915_gem_timeline_fence.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 timeline_fences;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rsvd2: Reserved, M=
BZ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 rsvd2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @extensions: Zero-te=
rminated chain of extensions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For future extension=
s. See struct i915_user_extension.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 extensions;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_i915_gem_create_ext_vm_private - Ext=
ension to make<br>
&gt;=C2=A0 =C2=A0 =C2=A0the object<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * private to the specified VM.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * See struct drm_i915_gem_create_ext.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_i915_gem_create_ext_vm_private {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_GEM_CREATE_EXT_VM_PRIVATE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A02<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @base: Extension li=
nk. See struct i915_user_extension. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_user_extens=
ion base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @vm_id: Id of the V=
M to which the object is private */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.21.0.rc0.32.g243a4c7e27<br>
&gt; <br>
</blockquote></div></div>

--000000000000dd9f2e05e2ac03d7--
