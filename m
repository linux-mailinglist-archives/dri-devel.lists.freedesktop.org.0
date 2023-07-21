Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A5D75D7B4
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1794E10E70F;
	Fri, 21 Jul 2023 22:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794DC10E710
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 22:58:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98df3dea907so372879466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 15:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1689980328; x=1690585128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3TdhF2mBxzZnAG60L9IldpXYtbQ3cNWwPE+SC4e7ZHA=;
 b=yQAMellr1BOOTOUYs0dRkjMxjgdrRlmKX9YYPFSOwwN1lpRmdc5KcOd5mvxcz9CI8m
 QhrRl9bG0IHMPbCfyMKTw4FMzwEClhffAlsF0WIlQCrDObjjl1eTcZaOZl5/GUrVKxw7
 GBOVkQB6fieFh6ypWmOOTLDDhcer5usa38Q2ENdykPmscfzk++U4e0M/hnjXzZYt1g/a
 ctibcru7dyt9l9xjMgGmMZSXAJ6+7ozBF4A86gKhLuOOd7MXd0o+aAlamIvp8pvRTUJ4
 f/zf15Xzon0d7O8vDYfHedp+p68OfivrPK0kNS22Ag2Uq9eezLz48GjFYL8GHR0LFO0B
 NKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689980328; x=1690585128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3TdhF2mBxzZnAG60L9IldpXYtbQ3cNWwPE+SC4e7ZHA=;
 b=K4lEg7dpBmaDmm/DYhjlagTDoQQWJOIBwOS7QMYe2kP5FsKG+q9lxGRmZdC/6dujiH
 bWds3xNhSBFXtTvyE/DUuarVkwwsWNVC4wrGKglAZcbGiTbtVKRaQmSpvq3TK1obIsny
 ZSnL6/IxQiaBeWXVc6Vqr4GKO8R+8eWVKthJlE7FoksFw2qFkSmKZUGkDZbGKiZTdvXh
 agG9hmXWQRMSKlHouErub8FifR4MFNopqoQM78CYhwLA+fFzpoDBlJeVGIB4VRRq3b0T
 D4opzz19sAz/WqjItb8+OiBov1craZbKfWWSc4KpyqUO/4F5DuSzCjQRHmCxmCtON4Gj
 +qfg==
X-Gm-Message-State: ABy/qLbeOWe5+mstxJF20mbgSsC+wlt6HWr4Z2P8aky9d5qxUN1Bm8hm
 zCN0D8QT11iNOs21RHCoZx1AYq4g3k7HbhtTC0uCZA==
X-Google-Smtp-Source: APBJJlFikxB6VkPOGpxNFsoJHEWztjJiV6wMOsiRwZHbdyeOXAkXCXKJvS4M+W9u0dURWl9vMkQ7Pc2fEcOlvRAlIOw=
X-Received: by 2002:a17:907:771a:b0:993:d617:bdc5 with SMTP id
 kw26-20020a170907771a00b00993d617bdc5mr2810745ejc.37.1689980327687; Fri, 21
 Jul 2023 15:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-4-dakr@redhat.com>
In-Reply-To: <20230720001443.2380-4-dakr@redhat.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 21 Jul 2023 17:58:35 -0500
Message-ID: <CAOFGe95kS0KzSUhjWiikBcx9vRQKnqipFE+a=FPobCgEi=ysAw@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 03/12] drm/nouveau: new VM_BIND uapi
 interfaces
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001c0ff60601073543"
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001c0ff60601073543
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:

> This commit provides the interfaces for the new UAPI motivated by the
> Vulkan API. It allows user mode drivers (UMDs) to:
>
> 1) Initialize a GPU virtual address (VA) space via the new
>    DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
>    VA area.
>
> 2) Bind and unbind GPU VA space mappings via the new
>    DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>
> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>
> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
> asynchronous processing with DRM syncobjs as synchronization mechanism.
>
> The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>
> Co-authored-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/driver-uapi.rst |   8 ++
>  include/uapi/drm/nouveau_drm.h    | 209 ++++++++++++++++++++++++++++++
>  2 files changed, 217 insertions(+)
>
> diff --git a/Documentation/gpu/driver-uapi.rst
> b/Documentation/gpu/driver-uapi.rst
> index 4411e6919a3d..9c7ca6e33a68 100644
> --- a/Documentation/gpu/driver-uapi.rst
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -6,3 +6,11 @@ drm/i915 uAPI
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  .. kernel-doc:: include/uapi/drm/i915_drm.h
> +
> +drm/nouveau uAPI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +VM_BIND / EXEC uAPI
> +-------------------
> +
> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
> diff --git a/include/uapi/drm/nouveau_drm.h
> b/include/uapi/drm/nouveau_drm.h
> index 853a327433d3..4d3a70529637 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -126,6 +126,209 @@ struct drm_nouveau_gem_cpu_fini {
>         __u32 handle;
>  };
>
> +/**
> + * struct drm_nouveau_sync - sync object
> + *
> + * This structure serves as synchronization mechanism for (potentially)
> + * asynchronous operations such as EXEC or VM_BIND.
> + */
> +struct drm_nouveau_sync {
> +       /**
> +        * @flags: the flags for a sync object
> +        *
> +        * The first 8 bits are used to determine the type of the sync
> object.
> +        */
> +       __u32 flags;
> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
> +       /**
> +        * @handle: the handle of the sync object
> +        */
> +       __u32 handle;
> +       /**
> +        * @timeline_value:
> +        *
> +        * The timeline point of the sync object in case the syncobj is o=
f
> +        * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
> +        */
> +       __u64 timeline_value;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_init - GPU VA space init structure
> + *
> + * Used to initialize the GPU's VA space for a user client, telling the
> kernel
> + * which portion of the VA space is managed by the UMD and kernel
> respectively.
>

I assume this has to be called quite early. Like maybe before any BOs or
channels are created? In any case, it'd be nice to have that documented.


> + */
> +struct drm_nouveau_vm_init {
> +       /**
> +        * @unmanaged_addr: start address of the kernel managed VA space
> region
> +        */
> +       __u64 unmanaged_addr;
> +       /**
> +        * @unmanaged_size: size of the kernel managed VA space region in
> bytes
> +        */
> +       __u64 unmanaged_size;
>

Over-all, I think this is the right API. My only concern is with the word
"unmanaged". None of the VA space is unmanaged. Some is userspace-managed
and some is kernel-managed.  I guess "unmanaged" kinda makes sense because
this is coming from userspace and it's saying which bits it manages and
which bits it doesn't.  Still seems clunky to me.  Maybe kernel_managed?
IDK, that feels weird too. Since we're already using UMD in this file, we
could call it kmd_managed. IDK. =F0=9F=A4=B7=F0=9F=8F=BB=E2=80=8D=E2=99=80=
=EF=B8=8F

Yeah, I know this is a total bikeshed color thing and I'm not going to
block anything based on it. =F0=9F=98=85 Just wanted to see if we can come =
up with
anything better.  It's documented and that's the important thing.


> +};
> +
> +/**
> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
> + *
> + * This structure represents a single VM_BIND operation. UMDs should pas=
s
> + * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr
> field.
> + */
> +struct drm_nouveau_vm_bind_op {
> +       /**
> +        * @op: the operation type
> +        */
> +       __u32 op;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
> + *
> + * Map a GEM object to the GPU's VA space. Optionally, the
> + * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel
> to
> + * create sparse mappings for the given range.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
> + *
> + * Unmap an existing mapping in the GPU's VA space. If the region the
> mapping
> + * is located in is a sparse region, new sparse mappings are created
> where the
> + * unmapped (memory backed) mapping was mapped previously. To remove a
> sparse
> + * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
> +       /**
> +        * @flags: the flags for a &drm_nouveau_vm_bind_op
> +        */
> +       __u32 flags;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
> + *
> + * Indicates that an allocated VA space region should be sparse.
> + */
> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
> +       /**
> +        * @handle: the handle of the DRM GEM object to map
> +        */
> +       __u32 handle;
> +       /**
> +        * @pad: 32 bit padding, should be 0
> +        */
> +       __u32 pad;
> +       /**
> +        * @addr:
> +        *
> +        * the address the VA space region or (memory backed) mapping
> should be mapped to
> +        */
> +       __u64 addr;
> +       /**
> +        * @bo_offset: the offset within the BO backing the mapping
> +        */
> +       __u64 bo_offset;
> +       /**
> +        * @range: the size of the requested mapping in bytes
> +        */
> +       __u64 range;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
> + */
> +struct drm_nouveau_vm_bind {
> +       /**
> +        * @op_count: the number of &drm_nouveau_vm_bind_op
> +        */
> +       __u32 op_count;
>

I've chatted a bit with Dave on IRC about this but both VM_BIND and EXEC
should support `op_count =3D=3D 0` and do exactly the same thing that they
would do if there were real ops. In the case of vm_bind, that just means
wait on the waits and then signal the signals. In particular, it should NOT
just return success and do nothing. Dave has a patch for this for EXEC but
IDK if VM_BIND needs any attention.  Of course, if it's not ASYNC, then
quickly doing nothing after validating inputs is acceptable.


> +       /**
> +        * @flags: the flags for a &drm_nouveau_vm_bind ioctl
> +        */
> +       __u32 flags;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
> + *
> + * Indicates that the given VM_BIND operation should be executed
> asynchronously
> + * by the kernel.
> + *
> + * If this flag is not supplied the kernel executes the associated
> operations
> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
> + */
> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
> +       /**
> +        * @wait_count: the number of wait &drm_nouveau_syncs
> +        */
> +       __u32 wait_count;
> +       /**
> +        * @sig_count: the number of &drm_nouveau_syncs to signal when
> finished
> +        */
> +       __u32 sig_count;
> +       /**
> +        * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> +        */
> +       __u64 wait_ptr;
> +       /**
> +        * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finishe=
d
> +        */
> +       __u64 sig_ptr;
> +       /**
> +        * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
> +        */
> +       __u64 op_ptr;
> +};
> +
> +/**
> + * struct drm_nouveau_exec_push - EXEC push operation
> + *
> + * This structure represents a single EXEC push operation. UMDs should
> pass an
> + * array of this structure via struct drm_nouveau_exec's &push_ptr field=
.
> + */
> +struct drm_nouveau_exec_push {
> +       /**
> +        * @va: the virtual address of the push buffer mapping
> +        */
> +       __u64 va;
> +       /**
> +        * @va_len: the length of the push buffer mapping
> +        */
> +       __u64 va_len;
> +};
> +
> +/**
> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
> + */
> +struct drm_nouveau_exec {
> +       /**
> +        * @channel: the channel to execute the push buffer in
> +        */
> +       __u32 channel;
> +       /**
> +        * @push_count: the number of &drm_nouveau_exec_push ops
> +        */
> +       __u32 push_count;
>

Same comment as above. We want `push_count =3D=3D 0` to behave the same as =
any
other EXEC just without anything new. In particular, it needs to wait on
all the waits as well as the previous EXECs on that channel and then signal
the sigs. I know Dave has a patch for this and it's working quite well in
my testing.

Other than that, everything looks good.  I'm still re-reading all the NVK
patches but they've been working quite well in my testing this week apart
from a perf issue I need to dig into. I'll give a real RB once we're sure
we all agree on the semantics of _count.

~Faith


> +       /**
> +        * @wait_count: the number of wait &drm_nouveau_syncs
> +        */
> +       __u32 wait_count;
> +       /**
> +        * @sig_count: the number of &drm_nouveau_syncs to signal when
> finished
> +        */
> +       __u32 sig_count;
> +       /**
> +        * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> +        */
> +       __u64 wait_ptr;
> +       /**
> +        * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finishe=
d
> +        */
> +       __u64 sig_ptr;
> +       /**
> +        * @push_ptr: pointer to &drm_nouveau_exec_push ops
> +        */
> +       __u64 push_ptr;
> +};
> +
>  #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> @@ -136,6 +339,9 @@ struct drm_nouveau_gem_cpu_fini {
>  #define DRM_NOUVEAU_NVIF               0x07
>  #define DRM_NOUVEAU_SVM_INIT           0x08
>  #define DRM_NOUVEAU_SVM_BIND           0x09
> +#define DRM_NOUVEAU_VM_INIT            0x10
> +#define DRM_NOUVEAU_VM_BIND            0x11
> +#define DRM_NOUVEAU_EXEC               0x12
>  #define DRM_NOUVEAU_GEM_NEW            0x40
>  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> @@ -197,6 +403,9 @@ struct drm_nouveau_svm_bind {
>  #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE +
> DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>  #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>
> +#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
> +#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
> +#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.41.0
>
>

--0000000000001c0ff60601073543
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich &lt;<a =
href=3D"mailto:dakr@redhat.com">dakr@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">This commit provides the int=
erfaces for the new UAPI motivated by the<br>
Vulkan API. It allows user mode drivers (UMDs) to:<br>
<br>
1) Initialize a GPU virtual address (VA) space via the new<br>
=C2=A0 =C2=A0DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel res=
erved<br>
=C2=A0 =C2=A0VA area.<br>
<br>
2) Bind and unbind GPU VA space mappings via the new<br>
=C2=A0 =C2=A0DRM_IOCTL_NOUVEAU_VM_BIND ioctl.<br>
<br>
3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.<br>
<br>
Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support<br>
asynchronous processing with DRM syncobjs as synchronization mechanism.<br>
<br>
The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,<br>
DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.<br>
<br>
Co-authored-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" targe=
t=3D"_blank">airlied@redhat.com</a>&gt;<br>
Signed-off-by: Danilo Krummrich &lt;<a href=3D"mailto:dakr@redhat.com" targ=
et=3D"_blank">dakr@redhat.com</a>&gt;<br>
---<br>
=C2=A0Documentation/gpu/driver-uapi.rst |=C2=A0 =C2=A08 ++<br>
=C2=A0include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 | 209 +++++++++++++++++++=
+++++++++++<br>
=C2=A02 files changed, 217 insertions(+)<br>
<br>
diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-u=
api.rst<br>
index 4411e6919a3d..9c7ca6e33a68 100644<br>
--- a/Documentation/gpu/driver-uapi.rst<br>
+++ b/Documentation/gpu/driver-uapi.rst<br>
@@ -6,3 +6,11 @@ drm/i915 uAPI<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0.. kernel-doc:: include/uapi/drm/i915_drm.h<br>
+<br>
+drm/nouveau uAPI<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+VM_BIND / EXEC uAPI<br>
+-------------------<br>
+<br>
+.. kernel-doc:: include/uapi/drm/nouveau_drm.h<br>
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.=
h<br>
index 853a327433d3..4d3a70529637 100644<br>
--- a/include/uapi/drm/nouveau_drm.h<br>
+++ b/include/uapi/drm/nouveau_drm.h<br>
@@ -126,6 +126,209 @@ struct drm_nouveau_gem_cpu_fini {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 handle;<br>
=C2=A0};<br>
<br>
+/**<br>
+ * struct drm_nouveau_sync - sync object<br>
+ *<br>
+ * This structure serves as synchronization mechanism for (potentially)<br=
>
+ * asynchronous operations such as EXEC or VM_BIND.<br>
+ */<br>
+struct drm_nouveau_sync {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: the flags for a sync object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The first 8 bits are used to determine the t=
ype of the sync object.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0<br>
+#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1<br>
+#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: the handle of the sync object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @timeline_value:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The timeline point of the sync object in cas=
e the syncobj is of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 timeline_value;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_nouveau_vm_init - GPU VA space init structure<br>
+ *<br>
+ * Used to initialize the GPU&#39;s VA space for a user client, telling th=
e kernel<br>
+ * which portion of the VA space is managed by the UMD and kernel respecti=
vely.<br></blockquote><div><br></div><div>I assume this has to be called qu=
ite early.  Like maybe before any BOs or channels are created?  In any case=
, it&#39;d be nice to have that documented.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+ */<br>
+struct drm_nouveau_vm_init {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @unmanaged_addr: start address of the kernel=
 managed VA space region<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 unmanaged_addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @unmanaged_size: size of the kernel managed =
VA space region in bytes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 unmanaged_size;<br></blockquote><div><br>=
</div><div>Over-all, I think this is the right API. My only concern is with=
 the word &quot;unmanaged&quot;. None of the VA space is unmanaged. Some is=
 userspace-managed and some is kernel-managed.=C2=A0 I guess &quot;unmanage=
d&quot; kinda makes sense because this is coming from userspace and it&#39;=
s saying which bits it manages and which bits it doesn&#39;t.=C2=A0 Still s=
eems clunky to me.=C2=A0 Maybe kernel_managed? IDK, that feels weird too. S=
ince we&#39;re already using UMD in this file, we could call it kmd_managed=
. IDK. =F0=9F=A4=B7=F0=9F=8F=BB=E2=80=8D=E2=99=80=EF=B8=8F</div><div><br></=
div><div>Yeah, I know this is a total bikeshed color thing and I&#39;m not =
going to block anything based on it. =F0=9F=98=85 Just wanted to see if we =
can come up with anything better.=C2=A0 It&#39;s documented and that&#39;s =
the important thing.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+};<br>
+<br>
+/**<br>
+ * struct drm_nouveau_vm_bind_op - VM_BIND operation<br>
+ *<br>
+ * This structure represents a single VM_BIND operation. UMDs should pass<=
br>
+ * an array of this structure via struct drm_nouveau_vm_bind&#39;s &amp;op=
_ptr field.<br>
+ */<br>
+struct drm_nouveau_vm_bind_op {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @op: the operation type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 op;<br>
+/**<br>
+ * @DRM_NOUVEAU_VM_BIND_OP_MAP:<br>
+ *<br>
+ * Map a GEM object to the GPU&#39;s VA space. Optionally, the<br>
+ * &amp;DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kern=
el to<br>
+ * create sparse mappings for the given range.<br>
+ */<br>
+#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0<br>
+/**<br>
+ * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:<br>
+ *<br>
+ * Unmap an existing mapping in the GPU&#39;s VA space. If the region the =
mapping<br>
+ * is located in is a sparse region, new sparse mappings are created where=
 the<br>
+ * unmapped (memory backed) mapping was mapped previously. To remove a spa=
rse<br>
+ * region the &amp;DRM_NOUVEAU_VM_BIND_SPARSE must be set.<br>
+ */<br>
+#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: the flags for a &amp;drm_nouveau_vm_=
bind_op<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+/**<br>
+ * @DRM_NOUVEAU_VM_BIND_SPARSE:<br>
+ *<br>
+ * Indicates that an allocated VA space region should be sparse.<br>
+ */<br>
+#define DRM_NOUVEAU_VM_BIND_SPARSE (1 &lt;&lt; 8)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: the handle of the DRM GEM object to=
 map<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @pad: 32 bit padding, should be 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 pad;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @addr:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the address the VA space region or (memory b=
acked) mapping should be mapped to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @bo_offset: the offset within the BO backing=
 the mapping<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 bo_offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @range: the size of the requested mapping in=
 bytes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 range;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND<br=
>
+ */<br>
+struct drm_nouveau_vm_bind {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @op_count: the number of &amp;drm_nouveau_vm=
_bind_op<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 op_count;<br></blockquote><div><br></div>=
<div>I&#39;ve chatted a bit with Dave on IRC about this but both VM_BIND an=
d EXEC should support `op_count =3D=3D 0` and do exactly the same thing tha=
t they would do if there were real ops. In the case of vm_bind, that just m=
eans wait on the waits and then signal the signals. In particular, it shoul=
d NOT just return success and do nothing. Dave has a patch for this for EXE=
C but IDK if VM_BIND needs any attention.=C2=A0 Of course, if it&#39;s not =
ASYNC, then quickly doing nothing after validating inputs is acceptable.<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: the flags for a &amp;drm_nouveau_vm_=
bind ioctl<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+/**<br>
+ * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:<br>
+ *<br>
+ * Indicates that the given VM_BIND operation should be executed asynchron=
ously<br>
+ * by the kernel.<br>
+ *<br>
+ * If this flag is not supplied the kernel executes the associated operati=
ons<br>
+ * synchronously and doesn&#39;t accept any &amp;drm_nouveau_sync objects.=
<br>
+ */<br>
+#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_count: the number of wait &amp;drm_nou=
veau_syncs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 wait_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_count: the number of &amp;drm_nouveau_s=
yncs to signal when finished<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 sig_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_ptr: pointer to &amp;drm_nouveau_syncs=
 to wait for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 wait_ptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_ptr: pointer to &amp;drm_nouveau_syncs =
to signal when finished<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 sig_ptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @op_ptr: pointer to the &amp;drm_nouveau_vm_=
bind_ops to execute<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 op_ptr;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_nouveau_exec_push - EXEC push operation<br>
+ *<br>
+ * This structure represents a single EXEC push operation. UMDs should pas=
s an<br>
+ * array of this structure via struct drm_nouveau_exec&#39;s &amp;push_ptr=
 field.<br>
+ */<br>
+struct drm_nouveau_exec_push {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @va: the virtual address of the push buffer =
mapping<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 va;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @va_len: the length of the push buffer mappi=
ng<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 va_len;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC<br>
+ */<br>
+struct drm_nouveau_exec {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @channel: the channel to execute the push bu=
ffer in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 channel;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @push_count: the number of &amp;drm_nouveau_=
exec_push ops<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 push_count;<br></blockquote><div><br></di=
v><div>Same comment as above. We want `push_count =3D=3D 0` to behave the s=
ame as any other EXEC just without anything new. In particular, it needs to=
 wait on all the waits as well as the previous EXECs on that channel and th=
en signal the sigs. I know Dave has a patch for this and it&#39;s working q=
uite well in my testing.</div><div><br></div><div>Other than that, everythi=
ng looks good.=C2=A0 I&#39;m still re-reading all the NVK patches but they&=
#39;ve been working quite well in my testing this week apart from a perf is=
sue I need to dig into. I&#39;ll give a real RB once we&#39;re sure we all =
agree on the semantics of _count.</div><div><br></div><div>~Faith<br></div>=
<div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_count: the number of wait &amp;drm_nou=
veau_syncs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 wait_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_count: the number of &amp;drm_nouveau_s=
yncs to signal when finished<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 sig_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_ptr: pointer to &amp;drm_nouveau_syncs=
 to wait for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 wait_ptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_ptr: pointer to &amp;drm_nouveau_syncs =
to signal when finished<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 sig_ptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @push_ptr: pointer to &amp;drm_nouveau_exec_=
push ops<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 push_ptr;<br>
+};<br>
+<br>
=C2=A0#define DRM_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x00 /* deprecated */<br>
=C2=A0#define DRM_NOUVEAU_SETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x01 /* deprecated */<br>
=C2=A0#define DRM_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 0x02 /* depreca=
ted */<br>
@@ -136,6 +339,9 @@ struct drm_nouveau_gem_cpu_fini {<br>
=C2=A0#define DRM_NOUVEAU_NVIF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x07<br>
=C2=A0#define DRM_NOUVEAU_SVM_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x08<br>
=C2=A0#define DRM_NOUVEAU_SVM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x09<br>
+#define DRM_NOUVEAU_VM_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<=
br>
+#define DRM_NOUVEAU_VM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x11<=
br>
+#define DRM_NOUVEAU_EXEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x12<br>
=C2=A0#define DRM_NOUVEAU_GEM_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x40<br>
=C2=A0#define DRM_NOUVEAU_GEM_PUSHBUF=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x41<br>
=C2=A0#define DRM_NOUVEAU_GEM_CPU_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A00x42<br>
@@ -197,6 +403,9 @@ struct drm_nouveau_svm_bind {<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_=
IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cp=
u_fini)<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_GEM_INFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_=
gem_info)<br>
<br>
+#define DRM_IOCTL_NOUVEAU_VM_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_ini=
t)<br>
+#define DRM_IOCTL_NOUVEAU_VM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bin=
d)<br>
+#define DRM_IOCTL_NOUVEAU_EXEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouve=
au_exec)<br>
=C2=A0#if defined(__cplusplus)<br>
=C2=A0}<br>
=C2=A0#endif<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--0000000000001c0ff60601073543--
