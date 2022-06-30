Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C70561F95
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 17:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3BD10FC50;
	Thu, 30 Jun 2022 15:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AE810FC39
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:45:24 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v185so24951971ybe.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhSWRUPTE8aQEiKG0IP1QCTj+Yk+2AsxCjWplBMvlhQ=;
 b=DwZl0KwtNPFHvcFW9UT4sigEVYtoHdcx5fXhJGsTFZJSnIXd/qTLdhJfFNpmcc748I
 nIUcdJ+sRr6KapinTcEa1N7ntsE8xGSb4UJz2WAYHS6C2hcLQv3DoygARu1+vrl1/jVq
 Bxqqx+LUad+zmhatfDwZ90oZ871OXt241gcfCLUBDPVBCMxAX3sBxNG4gv1V+TyTcBCY
 xzgTocxSX+CvD9HP7z6D9u2gt/n2zsveEbdza0eGp8wc4r3sKUyipVUXv6x792IG+Au2
 lwwzF3K+r9lSE7Z7krTinMTw0/BJe/jQXxfLzMLF1oI9IlGJUg68/2t4yEtBeMMoBgVY
 nnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhSWRUPTE8aQEiKG0IP1QCTj+Yk+2AsxCjWplBMvlhQ=;
 b=YKRik0gn9o+VAghqF9Q6XGBr5BGMAokG3X9BkVBut9N9zNUf3rkpQ5G0APRmsbUCZs
 IcnhAZWq+rHCBeFdUZS7W8wcXBkWSJt2gLNc49jHuM7BHB79zf7QA2v5gy2jIAPE8Bpf
 /z8jSLKppHROl9UjZ5+jYzpnVYsDTu2yXq/yZCghGjWw+bWzVa1KB3ky8rwvUj6GsKrm
 1Lwqs1D9dfqlrVYLPiR8TMXLNKnyMRXRgAr+536lGYq31q51Mztl3zyjV+z/fyS5YLEk
 3oLRhAcF+ngktLykWvIhnXbxHuzx7q5KGPTKBqFFC2CjKnmG4x3QwAcCfc1tVceiCEn1
 d1+w==
X-Gm-Message-State: AJIora8uU1ae9iagUCK5so1rAKvukMVvUSyoQ2+CgEHBKJfukCLnhC2j
 2sDxcqrkMZ4sRp1enXkd8ZQiSbQsyJPlL/WH5mwO8A==
X-Google-Smtp-Source: AGRyM1uWQfeHHos02EKKof+W+F05bo2onpM4tYIg2Y863dXpiN9XMjOkaVx8waz26hLw7eEdZu2RR/RbIuAGDksg5Io=
X-Received: by 2002:a5b:98c:0:b0:64a:d5c3:4422 with SMTP id
 c12-20020a5b098c000000b0064ad5c34422mr10168722ybq.638.1656603923135; Thu, 30
 Jun 2022 08:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
 <20220626014916.5130-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220626014916.5130-4-niranjana.vishwanathapura@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 30 Jun 2022 10:45:12 -0500
Message-ID: <CAOFGe95YNYs+H=+FGvj=81bKtWbNsyU9vyh_1OGtAroqja4H9g@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/doc/rfc: VM_BIND uapi definition
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: multipart/alternative; boundary="0000000000005f511f05e2ac28fb"
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
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, oak.zeng@intel.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005f511f05e2ac28fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 25, 2022 at 8:49 PM Niranjana Vishwanathapura <
niranjana.vishwanathapura@intel.com> wrote:

> VM_BIND and related uapi definitions
>
> v2: Reduce the scope to simple Mesa use case.
> v3: Expand VM_UNBIND documentation and add
>     I915_GEM_VM_BIND/UNBIND_FENCE_VALID
>     and I915_GEM_VM_BIND_TLB_FLUSH flags.
> v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional
>     documentation for vm_bind/unbind.
> v5: Remove TLB flush requirement on VM_UNBIND.
>     Add version support to stage implementation.
> v6: Define and use drm_i915_gem_timeline_fence structure for
>     all timeline fences.
> v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.
>     Update documentation on async vm_bind/unbind and versioning.
>     Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3
>     batch_count field and I915_EXEC3_SECURE flag.
>
> Signed-off-by: Niranjana Vishwanathapura <
> niranjana.vishwanathapura@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/rfc/i915_vm_bind.h | 280 +++++++++++++++++++++++++++
>  1 file changed, 280 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>
> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h
> b/Documentation/gpu/rfc/i915_vm_bind.h
> new file mode 100644
> index 000000000000..a93e08bceee6
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
> @@ -0,0 +1,280 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +/**
> + * DOC: I915_PARAM_VM_BIND_VERSION
> + *
> + * VM_BIND feature version supported.
> + * See typedef drm_i915_getparam_t param.
> + *
> + * Specifies the VM_BIND feature version supported.
> + * The following versions of VM_BIND have been defined:
> + *
> + * 0: No VM_BIND support.
> + *
> + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings create=
d
> + *    previously with VM_BIND, the ioctl will not support unbinding
> multiple
> + *    mappings or splitting them. Similarly, VM_BIND calls will not
> replace
> + *    any existing mappings.
> + *
> + * 2: The restrictions on unbinding partial or multiple mappings is
> + *    lifted, Similarly, binding will replace any mappings in the given
> range.
> + *
> + * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
> + */
> +#define I915_PARAM_VM_BIND_VERSION     57
> +
> +/**
> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
> + *
> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
> + * See struct drm_i915_gem_vm_control flags.
> + *
> + * The older execbuf2 ioctl will not support VM_BIND mode of operation.
> + * For VM_BIND mode, we have new execbuf3 ioctl which will not accept an=
y
> + * execlist (See struct drm_i915_gem_execbuffer3 for more details).
> + */
> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND       (1 << 0)
> +
> +/* VM_BIND related ioctls */
> +#define DRM_I915_GEM_VM_BIND           0x3d
> +#define DRM_I915_GEM_VM_UNBIND         0x3e
> +#define DRM_I915_GEM_EXECBUFFER3       0x3f
> +
> +#define DRM_IOCTL_I915_GEM_VM_BIND             DRM_IOWR(DRM_COMMAND_BASE
> + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_VM_UNBIND           DRM_IOWR(DRM_COMMAND_BASE
> + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_EXECBUFFER3         DRM_IOWR(DRM_COMMAND_BASE
> + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
> +
> +/**
> + * struct drm_i915_gem_timeline_fence - An input or output timeline fenc=
e.
> + *
> + * The operation will wait for input fence to signal.
> + *
> + * The returned output fence will be signaled after the completion of th=
e
> + * operation.
> + */
> +struct drm_i915_gem_timeline_fence {
> +       /** @handle: User's handle for a drm_syncobj to wait on or signal=
.
> */
> +       __u32 handle;
> +
> +       /**
> +        * @flags: Supported flags are:
> +        *
> +        * I915_TIMELINE_FENCE_WAIT:
> +        * Wait for the input fence before the operation.
> +        *
> +        * I915_TIMELINE_FENCE_SIGNAL:
> +        * Return operation completion fence as output.
> +        */
> +       __u32 flags;
> +#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
> +#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
> +#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNA=
L
> << 1))
> +
> +       /**
> +        * @value: A point in the timeline.
> +        * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
> +        * timeline drm_syncobj is invalid as it turns a drm_syncobj into=
 a
> +        * binary one.
> +        */
> +       __u64 value;
> +};
> +
> +/**
> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
> + *
> + * This structure is passed to VM_BIND ioctl and specifies the mapping o=
f
> GPU
> + * virtual address (VA) range to the section of an object that should be
> bound
> + * in the device page table of the specified address space (VM).
> + * The VA range specified must be unique (ie., not currently bound) and
> can
> + * be mapped to whole object or a section of the object (partial binding=
).
> + * Multiple VA mappings can be created to the same section of the object
> + * (aliasing).
> + *
> + * The @start, @offset and @length must be 4K page aligned. However the
> DG2
> + * and XEHPSDV has 64K page size for device local-memory and has compact
> page
> + * table. On those platforms, for binding device local-memory objects, t=
he
> + * @start must be 2M aligned, @offset and @length must be 64K aligned.
> + * Also, for such mappings, i915 will reserve the whole 2M range for it
> so as
> + * to not allow multiple mappings in that 2M range (Compact page tables
> do not
> + * allow 64K page and 4K page bindings in the same 2M range).
> + *
> + * Error code -EINVAL will be returned if @start, @offset and @length ar=
e
> not
> + * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), erro=
r
> code
> + * -ENOSPC will be returned if the VA range specified can't be reserved.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
> concurrently
> + * are not ordered. Furthermore, parts of the VM_BIND operation can be
> done
> + * asynchronously, if valid @fence is specified.
> + */
> +struct drm_i915_gem_vm_bind {
> +       /** @vm_id: VM (address space) id to bind */
> +       __u32 vm_id;
> +
> +       /** @handle: Object handle */
> +       __u32 handle;
> +
> +       /** @start: Virtual Address start to bind */
> +       __u64 start;
> +
> +       /** @offset: Offset in object to bind */
> +       __u64 offset;
> +
> +       /** @length: Length of mapping to bind */
> +       __u64 length;
> +
> +       /**
> +        * @flags: Supported flags are:
> +        *
> +        * I915_GEM_VM_BIND_READONLY:
> +        * Mapping is read-only.
> +        *
> +        * I915_GEM_VM_BIND_CAPTURE:
> +        * Capture this mapping in the dump upon GPU error.
> +        */
> +       __u64 flags;
> +#define I915_GEM_VM_BIND_READONLY      (1 << 1)
> +#define I915_GEM_VM_BIND_CAPTURE       (1 << 2)
> +
> +       /**
> +        * @fence: Timeline fence for bind completion signaling.
> +        *
> +        * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
> +        * is invalid, and an error will be returned.
> +        */
> +       struct drm_i915_gem_timeline_fence fence;
>

Why a single fence and not an array of fences?  If Mesa wants to use the
out fences for signalling VkSemaphores on the sparse binding queue, we need
N of them.  We can still have the "zero fences means block" behavior.

--Jason


> +
> +       /**
> +        * @extensions: Zero-terminated chain of extensions.
> +        *
> +        * For future extensions. See struct i915_user_extension.
> +        */
> +       __u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
> + *
> + * This structure is passed to VM_UNBIND ioctl and specifies the GPU
> virtual
> + * address (VA) range that should be unbound from the device page table
> of the
> + * specified address space (VM). VM_UNBIND will force unbind the specifi=
ed
> + * range from device page table without waiting for any GPU job to
> complete.
> + * It is UMDs responsibility to ensure the mapping is no longer in use
> before
> + * calling VM_UNBIND.
> + *
> + * If the specified mapping is not found, the ioctl will simply return
> without
> + * any error.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
> concurrently
> + * are not ordered. Furthermore, parts of the VM_UNBIND operation can be
> done
> + * asynchronously, if valid @fence is specified.
> + */
> +struct drm_i915_gem_vm_unbind {
> +       /** @vm_id: VM (address space) id to bind */
> +       __u32 vm_id;
> +
> +       /** @rsvd: Reserved, MBZ */
> +       __u32 rsvd;
> +
> +       /** @start: Virtual Address start to unbind */
> +       __u64 start;
> +
> +       /** @length: Length of mapping to unbind */
> +       __u64 length;
> +
> +       /** @flags: Currently reserved, MBZ */
> +       __u64 flags;
> +
> +       /**
> +        * @fence: Timeline fence for unbind completion signaling.
> +        *
> +        * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
> +        * is invalid, and an error will be returned.
> +        */
> +       struct drm_i915_gem_timeline_fence fence;
> +
> +       /**
> +        * @extensions: Zero-terminated chain of extensions.
> +        *
> +        * For future extensions. See struct i915_user_extension.
> +        */
> +       __u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_gem_execbuffer3 - Structure for
> DRM_I915_GEM_EXECBUFFER3
> + * ioctl.
> + *
> + * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and VM_BIND
> mode
> + * only works with this ioctl for submission.
> + * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
> + */
> +struct drm_i915_gem_execbuffer3 {
> +       /**
> +        * @ctx_id: Context id
> +        *
> +        * Only contexts with user engine map are allowed.
> +        */
> +       __u32 ctx_id;
> +
> +       /**
> +        * @engine_idx: Engine index
> +        *
> +        * An index in the user engine map of the context specified by
> @ctx_id.
> +        */
> +       __u32 engine_idx;
> +
> +       /**
> +        * @batch_address: Batch gpu virtual address/es.
> +        *
> +        * For normal submission, it is the gpu virtual address of the
> batch
> +        * buffer. For parallel submission, it is a pointer to an array o=
f
> +        * batch buffer gpu virtual addresses with array size equal to th=
e
> +        * number of (parallel) engines involved in that submission (See
> +        * struct i915_context_engines_parallel_submit).
> +        */
> +       __u64 batch_address;
> +
> +       /** @flags: Currently reserved, MBZ */
> +       __u64 flags;
> +
> +       /** @rsvd1: Reserved, MBZ */
> +       __u32 rsvd1;
> +
> +       /** @fence_count: Number of fences in @timeline_fences array. */
> +       __u32 fence_count;
> +
> +       /**
> +        * @timeline_fences: Pointer to an array of timeline fences.
> +        *
> +        * Timeline fences are of format struct
> drm_i915_gem_timeline_fence.
> +        */
> +       __u64 timeline_fences;
> +
> +       /** @rsvd2: Reserved, MBZ */
> +       __u64 rsvd2;
> +
> +       /**
> +        * @extensions: Zero-terminated chain of extensions.
> +        *
> +        * For future extensions. See struct i915_user_extension.
> +        */
> +       __u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_gem_create_ext_vm_private - Extension to make the
> object
> + * private to the specified VM.
> + *
> + * See struct drm_i915_gem_create_ext.
> + */
> +struct drm_i915_gem_create_ext_vm_private {
> +#define I915_GEM_CREATE_EXT_VM_PRIVATE         2
> +       /** @base: Extension link. See struct i915_user_extension. */
> +       struct i915_user_extension base;
> +
> +       /** @vm_id: Id of the VM to which the object is private */
> +       __u32 vm_id;
> +};
> --
> 2.21.0.rc0.32.g243a4c7e27
>
>

--0000000000005f511f05e2ac28fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Jun 25, 2022 at 8:49 PM Niranjana Vishwanathapura &lt;<a hre=
f=3D"mailto:niranjana.vishwanathapura@intel.com">niranjana.vishwanathapura@=
intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">VM_BIND and related uapi definitions<br>
<br>
v2: Reduce the scope to simple Mesa use case.<br>
v3: Expand VM_UNBIND documentation and add<br>
=C2=A0 =C2=A0 I915_GEM_VM_BIND/UNBIND_FENCE_VALID<br>
=C2=A0 =C2=A0 and I915_GEM_VM_BIND_TLB_FLUSH flags.<br>
v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional<br>
=C2=A0 =C2=A0 documentation for vm_bind/unbind.<br>
v5: Remove TLB flush requirement on VM_UNBIND.<br>
=C2=A0 =C2=A0 Add version support to stage implementation.<br>
v6: Define and use drm_i915_gem_timeline_fence structure for<br>
=C2=A0 =C2=A0 all timeline fences.<br>
v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.<br>
=C2=A0 =C2=A0 Update documentation on async vm_bind/unbind and versioning.<=
br>
=C2=A0 =C2=A0 Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3<br=
>
=C2=A0 =C2=A0 batch_count field and I915_EXEC3_SECURE flag.<br>
<br>
Signed-off-by: Niranjana Vishwanathapura &lt;<a href=3D"mailto:niranjana.vi=
shwanathapura@intel.com" target=3D"_blank">niranjana.vishwanathapura@intel.=
com</a>&gt;<br>
Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" ta=
rget=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
---<br>
=C2=A0Documentation/gpu/rfc/i915_vm_bind.h | 280 ++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 280 insertions(+)<br>
=C2=A0create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h<br>
<br>
diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i=
915_vm_bind.h<br>
new file mode 100644<br>
index 000000000000..a93e08bceee6<br>
--- /dev/null<br>
+++ b/Documentation/gpu/rfc/i915_vm_bind.h<br>
@@ -0,0 +1,280 @@<br>
+/* SPDX-License-Identifier: MIT */<br>
+/*<br>
+ * Copyright =C2=A9 2022 Intel Corporation<br>
+ */<br>
+<br>
+/**<br>
+ * DOC: I915_PARAM_VM_BIND_VERSION<br>
+ *<br>
+ * VM_BIND feature version supported.<br>
+ * See typedef drm_i915_getparam_t param.<br>
+ *<br>
+ * Specifies the VM_BIND feature version supported.<br>
+ * The following versions of VM_BIND have been defined:<br>
+ *<br>
+ * 0: No VM_BIND support.<br>
+ *<br>
+ * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created<=
br>
+ *=C2=A0 =C2=A0 previously with VM_BIND, the ioctl will not support unbind=
ing multiple<br>
+ *=C2=A0 =C2=A0 mappings or splitting them. Similarly, VM_BIND calls will =
not replace<br>
+ *=C2=A0 =C2=A0 any existing mappings.<br>
+ *<br>
+ * 2: The restrictions on unbinding partial or multiple mappings is<br>
+ *=C2=A0 =C2=A0 lifted, Similarly, binding will replace any mappings in th=
e given range.<br>
+ *<br>
+ * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.<br>
+ */<br>
+#define I915_PARAM_VM_BIND_VERSION=C2=A0 =C2=A0 =C2=A057<br>
+<br>
+/**<br>
+ * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND<br>
+ *<br>
+ * Flag to opt-in for VM_BIND mode of binding during VM creation.<br>
+ * See struct drm_i915_gem_vm_control flags.<br>
+ *<br>
+ * The older execbuf2 ioctl will not support VM_BIND mode of operation.<br=
>
+ * For VM_BIND mode, we have new execbuf3 ioctl which will not accept any<=
br>
+ * execlist (See struct drm_i915_gem_execbuffer3 for more details).<br>
+ */<br>
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;=
&lt; 0)<br>
+<br>
+/* VM_BIND related ioctls */<br>
+#define DRM_I915_GEM_VM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3d<=
br>
+#define DRM_I915_GEM_VM_UNBIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3e<br>
+#define DRM_I915_GEM_EXECBUFFER3=C2=A0 =C2=A0 =C2=A0 =C2=A00x3f<br>
+<br>
+#define DRM_IOCTL_I915_GEM_VM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915=
_gem_vm_bind)<br>
+#define DRM_IOCTL_I915_GEM_VM_UNBIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_=
vm_bind)<br>
+#define DRM_IOCTL_I915_GEM_EXECBUFFER3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DR=
M_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_exe=
cbuffer3)<br>
+<br>
+/**<br>
+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.=
<br>
+ *<br>
+ * The operation will wait for input fence to signal.<br>
+ *<br>
+ * The returned output fence will be signaled after the completion of the<=
br>
+ * operation.<br>
+ */<br>
+struct drm_i915_gem_timeline_fence {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: User&#39;s handle for a drm_syncob=
j to wait on or signal. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: Supported flags are:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_TIMELINE_FENCE_WAIT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Wait for the input fence before the operatio=
n.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_TIMELINE_FENCE_SIGNAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Return operation completion fence as output.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+#define I915_TIMELINE_FENCE_WAIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(1 &lt;&lt; 0)<br>
+#define I915_TIMELINE_FENCE_SIGNAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &l=
t;&lt; 1)<br>
+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL =
&lt;&lt; 1))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @value: A point in the timeline.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Value must be 0 for a binary drm_syncobj. A =
Value of 0 for a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * timeline drm_syncobj is invalid as it turns =
a drm_syncobj into a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * binary one.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 value;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.<br>
+ *<br>
+ * This structure is passed to VM_BIND ioctl and specifies the mapping of =
GPU<br>
+ * virtual address (VA) range to the section of an object that should be b=
ound<br>
+ * in the device page table of the specified address space (VM).<br>
+ * The VA range specified must be unique (ie., not currently bound) and ca=
n<br>
+ * be mapped to whole object or a section of the object (partial binding).=
<br>
+ * Multiple VA mappings can be created to the same section of the object<b=
r>
+ * (aliasing).<br>
+ *<br>
+ * The @start, @offset and @length must be 4K page aligned. However the DG=
2<br>
+ * and XEHPSDV has 64K page size for device local-memory and has compact p=
age<br>
+ * table. On those platforms, for binding device local-memory objects, the=
<br>
+ * @start must be 2M aligned, @offset and @length must be 64K aligned.<br>
+ * Also, for such mappings, i915 will reserve the whole 2M range for it so=
 as<br>
+ * to not allow multiple mappings in that 2M range (Compact page tables do=
 not<br>
+ * allow 64K page and 4K page bindings in the same 2M range).<br>
+ *<br>
+ * Error code -EINVAL will be returned if @start, @offset and @length are =
not<br>
+ * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error =
code<br>
+ * -ENOSPC will be returned if the VA range specified can&#39;t be reserve=
d.<br>
+ *<br>
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrent=
ly<br>
+ * are not ordered. Furthermore, parts of the VM_BIND operation can be don=
e<br>
+ * asynchronously, if valid @fence is specified.<br>
+ */<br>
+struct drm_i915_gem_vm_bind {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @vm_id: VM (address space) id to bind */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: Object handle */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @start: Virtual Address start to bind */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 start;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @offset: Offset in object to bind */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 offset;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @length: Length of mapping to bind */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 length;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: Supported flags are:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_GEM_VM_BIND_READONLY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Mapping is read-only.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * I915_GEM_VM_BIND_CAPTURE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Capture this mapping in the dump upon GPU er=
ror.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
+#define I915_GEM_VM_BIND_READONLY=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
+#define I915_GEM_VM_BIND_CAPTURE=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @fence: Timeline fence for bind completion s=
ignaling.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * It is an out fence, hence using I915_TIMELIN=
E_FENCE_WAIT flag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is invalid, and an error will be returned.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_timeline_fence fence;<br></=
blockquote><div><br></div><div>Why a single fence and not an array of fence=
s?=C2=A0 If Mesa wants to use the out fences for signalling VkSemaphores on=
 the sparse binding queue, we need N of them.=C2=A0 We can still have the &=
quot;zero fences means block&quot; behavior.</div><div><br></div><div>--Jas=
on<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @extensions: Zero-terminated chain of extens=
ions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For future extensions. See struct i915_user_=
extension.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 extensions;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.<br>
+ *<br>
+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtu=
al<br>
+ * address (VA) range that should be unbound from the device page table of=
 the<br>
+ * specified address space (VM). VM_UNBIND will force unbind the specified=
<br>
+ * range from device page table without waiting for any GPU job to complet=
e.<br>
+ * It is UMDs responsibility to ensure the mapping is no longer in use bef=
ore<br>
+ * calling VM_UNBIND.<br>
+ *<br>
+ * If the specified mapping is not found, the ioctl will simply return wit=
hout<br>
+ * any error.<br>
+ *<br>
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrent=
ly<br>
+ * are not ordered. Furthermore, parts of the VM_UNBIND operation can be d=
one<br>
+ * asynchronously, if valid @fence is specified.<br>
+ */<br>
+struct drm_i915_gem_vm_unbind {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @vm_id: VM (address space) id to bind */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rsvd: Reserved, MBZ */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 rsvd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @start: Virtual Address start to unbind */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 start;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @length: Length of mapping to unbind */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 length;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: Currently reserved, MBZ */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @fence: Timeline fence for unbind completion=
 signaling.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * It is an out fence, hence using I915_TIMELIN=
E_FENCE_WAIT flag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is invalid, and an error will be returned.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_timeline_fence fence;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @extensions: Zero-terminated chain of extens=
ions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For future extensions. See struct i915_user_=
extension.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 extensions;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_i915_gem_execbuffer3 - Structure for DRM_I915_GEM_EXECBUFFER=
3<br>
+ * ioctl.<br>
+ *<br>
+ * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and VM_BIND m=
ode<br>
+ * only works with this ioctl for submission.<br>
+ * See I915_VM_CREATE_FLAGS_USE_VM_BIND.<br>
+ */<br>
+struct drm_i915_gem_execbuffer3 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @ctx_id: Context id<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Only contexts with user engine map are allow=
ed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 ctx_id;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @engine_idx: Engine index<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * An index in the user engine map of the conte=
xt specified by @ctx_id.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 engine_idx;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @batch_address: Batch gpu virtual address/es=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For normal submission, it is the gpu virtual=
 address of the batch<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * buffer. For parallel submission, it is a poi=
nter to an array of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * batch buffer gpu virtual addresses with arra=
y size equal to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * number of (parallel) engines involved in tha=
t submission (See<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * struct i915_context_engines_parallel_submit)=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 batch_address;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: Currently reserved, MBZ */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rsvd1: Reserved, MBZ */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 rsvd1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @fence_count: Number of fences in @timeline=
_fences array. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 fence_count;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @timeline_fences: Pointer to an array of tim=
eline fences.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Timeline fences are of format struct drm_i91=
5_gem_timeline_fence.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 timeline_fences;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rsvd2: Reserved, MBZ */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 rsvd2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @extensions: Zero-terminated chain of extens=
ions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For future extensions. See struct i915_user_=
extension.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 extensions;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_i915_gem_create_ext_vm_private - Extension to make the objec=
t<br>
+ * private to the specified VM.<br>
+ *<br>
+ * See struct drm_i915_gem_create_ext.<br>
+ */<br>
+struct drm_i915_gem_create_ext_vm_private {<br>
+#define I915_GEM_CREATE_EXT_VM_PRIVATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @base: Extension link. See struct i915_user=
_extension. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_user_extension base;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @vm_id: Id of the VM to which the object is=
 private */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
+};<br>
-- <br>
2.21.0.rc0.32.g243a4c7e27<br>
<br>
</blockquote></div></div>

--0000000000005f511f05e2ac28fb--
