Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C5761D8F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 17:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221E010E3DB;
	Tue, 25 Jul 2023 15:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0399310E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 15:42:40 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-992ca792065so947712466b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 08:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1690299759; x=1690904559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wxPmIatxTXy31kUxbKzYcZYp/VN+Gul+eKu1vONRI6k=;
 b=Kqd1CtVD3pNPxLLuzcNakWv7B3YbOkQ50I3Iz1vyNID9kAiHk880xJfkWkeLEb+Z3+
 sL9gx0AEcxgZLmI21U0k53RhZTy4LEK7f3hj2KYffAq6l6QV9J0tSiX8OlFgTK1/3gUQ
 7OCB3KXKpAmYN1M+fOR9uF38sIrZylMdXHFZGqt6uWs2uwtg0Qf2IjMrWwCa3Q1Ir1uk
 TqKlh5ESpL17JB/39aeR/f5FJI4CzMbLJ/eSySZ+vAFqk28lC8jn2qzOUYA0sfsk2Tz/
 uFbfdrq6YRJWAPOThDJSE9tP55BkpmDzLPOYlaBjSE580ESEl3ykJRrUiX3mqa8QDDJp
 ff/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690299759; x=1690904559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxPmIatxTXy31kUxbKzYcZYp/VN+Gul+eKu1vONRI6k=;
 b=UPy3h241lJacPJQUhrEZTEKiWRhcYp4gbyCk4IJnWB8nK62K/wCgqj36LcdZcl8SYM
 ibATrAIST+Q0nfl+AhlsMljyYf6GkT8n0ZPaDL5KxYS6RxU4EYIt+8CaMg6GmMu27evv
 6nSo2JSpSHjp5x4vdGsgvBXl7KZvQmTF/5bSzfXpVwLu8rgdTHxOHZc0L0zNVxsCutX1
 i4ts8+WbYp76XU4ch4SVzWQ+ZqOvRGhV+AQwIF4BNduLjgiAmnv8ohK6FMcFH3FM8xOc
 nafqg0eZT44d1vxny/G5GM2NhgQNJsK0BCVEJJrim7LIO362PtA/WtbkNj4KQwHJKpd9
 AkJg==
X-Gm-Message-State: ABy/qLaSceYommRw1haEt5ooTU9hJZG71Xcy7Wlg1vJ1acuK9TRjblaK
 jeuyKwvVYTEcvwRAo6eKbdsZn/jBhRNub6HGSbu+eQ==
X-Google-Smtp-Source: APBJJlFMrrSNqhMZRvIor7cTHUaiWXJHyO7qtFHvUT9gdwsO2OpWsHyNTySfwNRNZ2HuPl5yT2jTqa5MwUIQmb27BpI=
X-Received: by 2002:a17:907:b13:b0:991:b292:695 with SMTP id
 h19-20020a1709070b1300b00991b2920695mr13497924ejl.55.1690299759276; Tue, 25
 Jul 2023 08:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-4-dakr@redhat.com>
 <CAOFGe95kS0KzSUhjWiikBcx9vRQKnqipFE+a=FPobCgEi=ysAw@mail.gmail.com>
 <da776218-e930-5cbf-b2ab-8e6c39b900cd@redhat.com>
In-Reply-To: <da776218-e930-5cbf-b2ab-8e6c39b900cd@redhat.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Tue, 25 Jul 2023 10:42:27 -0500
Message-ID: <CAOFGe95tHENSBCUKF6Hba8b_4Tcys_p_T2zKhSA+xRJxKQyQNw@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 03/12] drm/nouveau: new VM_BIND uapi
 interfaces
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b748bb06015194cc"
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

--000000000000b748bb06015194cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 9:04=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:

>
>
> On 7/22/23 00:58, Faith Ekstrand wrote:
> >
> > On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich <dakr@redhat.c=
om
> > <mailto:dakr@redhat.com>> wrote:
> >
> >     This commit provides the interfaces for the new UAPI motivated by t=
he
> >     Vulkan API. It allows user mode drivers (UMDs) to:
> >
> >     1) Initialize a GPU virtual address (VA) space via the new
> >         DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel
> reserved
> >         VA area.
> >
> >     2) Bind and unbind GPU VA space mappings via the new
> >         DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> >
> >     3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
> >
> >     Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
> >     asynchronous processing with DRM syncobjs as synchronization
> mechanism.
> >
> >     The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
> >     DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
> >
> >     Co-authored-by: Dave Airlie <airlied@redhat.com
> >     <mailto:airlied@redhat.com>>
> >     Signed-off-by: Danilo Krummrich <dakr@redhat.com
> >     <mailto:dakr@redhat.com>>
> >     ---
> >       Documentation/gpu/driver-uapi.rst |   8 ++
> >       include/uapi/drm/nouveau_drm.h    | 209
> ++++++++++++++++++++++++++++++
> >       2 files changed, 217 insertions(+)
> >
> >     diff --git a/Documentation/gpu/driver-uapi.rst
> >     b/Documentation/gpu/driver-uapi.rst
> >     index 4411e6919a3d..9c7ca6e33a68 100644
> >     --- a/Documentation/gpu/driver-uapi.rst
> >     +++ b/Documentation/gpu/driver-uapi.rst
> >     @@ -6,3 +6,11 @@ drm/i915 uAPI
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >       .. kernel-doc:: include/uapi/drm/i915_drm.h
> >     +
> >     +drm/nouveau uAPI
> >     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     +
> >     +VM_BIND / EXEC uAPI
> >     +-------------------
> >     +
> >     +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
> >     diff --git a/include/uapi/drm/nouveau_drm.h
> >     b/include/uapi/drm/nouveau_drm.h
> >     index 853a327433d3..4d3a70529637 100644
> >     --- a/include/uapi/drm/nouveau_drm.h
> >     +++ b/include/uapi/drm/nouveau_drm.h
> >     @@ -126,6 +126,209 @@ struct drm_nouveau_gem_cpu_fini {
> >              __u32 handle;
> >       };
> >
> >     +/**
> >     + * struct drm_nouveau_sync - sync object
> >     + *
> >     + * This structure serves as synchronization mechanism for
> (potentially)
> >     + * asynchronous operations such as EXEC or VM_BIND.
> >     + */
> >     +struct drm_nouveau_sync {
> >     +       /**
> >     +        * @flags: the flags for a sync object
> >     +        *
> >     +        * The first 8 bits are used to determine the type of the
> >     sync object.
> >     +        */
> >     +       __u32 flags;
> >     +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
> >     +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
> >     +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
> >     +       /**
> >     +        * @handle: the handle of the sync object
> >     +        */
> >     +       __u32 handle;
> >     +       /**
> >     +        * @timeline_value:
> >     +        *
> >     +        * The timeline point of the sync object in case the syncob=
j
> >     is of
> >     +        * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
> >     +        */
> >     +       __u64 timeline_value;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_nouveau_vm_init - GPU VA space init structure
> >     + *
> >     + * Used to initialize the GPU's VA space for a user client, tellin=
g
> >     the kernel
> >     + * which portion of the VA space is managed by the UMD and kernel
> >     respectively.
> >
> >
> > I assume this has to be called quite early. Like maybe before any BOs o=
r
> > channels are created? In any case, it'd be nice to have that documented=
.
>
> Exactly, doing any of those will disable the new uAPI entirely if it
> wasn't yet initialized. I will add some documentation for this.
>

Thanks!


> >
> >     + */
> >     +struct drm_nouveau_vm_init {
> >     +       /**
> >     +        * @unmanaged_addr: start address of the kernel managed VA
> >     space region
> >     +        */
> >     +       __u64 unmanaged_addr;
> >     +       /**
> >     +        * @unmanaged_size: size of the kernel managed VA space
> >     region in bytes
> >     +        */
> >     +       __u64 unmanaged_size;
> >
> >
> > Over-all, I think this is the right API. My only concern is with the
> > word "unmanaged". None of the VA space is unmanaged. Some is
> > userspace-managed and some is kernel-managed.  I guess "unmanaged" kind=
a
> > makes sense because this is coming from userspace and it's saying which
> > bits it manages and which bits it doesn't.  Still seems clunky to me.
> > Maybe kernel_managed? IDK, that feels weird too. Since we're already
> > using UMD in this file, we could call it kmd_managed. IDK. =F0=9F=A4=B7=
=F0=9F=8F=BB=E2=80=8D=E2=99=80=EF=B8=8F
>
> kernel_managed / kmd_managed both sounds fine to me. I'm good with
> either one.
>

Let's go with kernel_managed then, unless anyone objects.


> >
> > Yeah, I know this is a total bikeshed color thing and I'm not going to
> > block anything based on it. =F0=9F=98=85 Just wanted to see if we can c=
ome up with
> > anything better.  It's documented and that's the important thing.
> >
> >     +};
> >     +
> >     +/**
> >     + * struct drm_nouveau_vm_bind_op - VM_BIND operation
> >     + *
> >     + * This structure represents a single VM_BIND operation. UMDs
> >     should pass
> >     + * an array of this structure via struct drm_nouveau_vm_bind's
> >     &op_ptr field.
> >     + */
> >     +struct drm_nouveau_vm_bind_op {
> >     +       /**
> >     +        * @op: the operation type
> >     +        */
> >     +       __u32 op;
> >     +/**
> >     + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
> >     + *
> >     + * Map a GEM object to the GPU's VA space. Optionally, the
> >     + * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the
> >     kernel to
> >     + * create sparse mappings for the given range.
> >     + */
> >     +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
> >     +/**
> >     + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
> >     + *
> >     + * Unmap an existing mapping in the GPU's VA space. If the region
> >     the mapping
> >     + * is located in is a sparse region, new sparse mappings are
> >     created where the
> >     + * unmapped (memory backed) mapping was mapped previously. To
> >     remove a sparse
> >     + * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
> >     + */
> >     +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
> >     +       /**
> >     +        * @flags: the flags for a &drm_nouveau_vm_bind_op
> >     +        */
> >     +       __u32 flags;
> >     +/**
> >     + * @DRM_NOUVEAU_VM_BIND_SPARSE:
> >     + *
> >     + * Indicates that an allocated VA space region should be sparse.
> >     + */
> >     +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
> >     +       /**
> >     +        * @handle: the handle of the DRM GEM object to map
> >     +        */
> >     +       __u32 handle;
> >     +       /**
> >     +        * @pad: 32 bit padding, should be 0
> >     +        */
> >     +       __u32 pad;
> >     +       /**
> >     +        * @addr:
> >     +        *
> >     +        * the address the VA space region or (memory backed)
> >     mapping should be mapped to
> >     +        */
> >     +       __u64 addr;
> >     +       /**
> >     +        * @bo_offset: the offset within the BO backing the mapping
> >     +        */
> >     +       __u64 bo_offset;
> >     +       /**
> >     +        * @range: the size of the requested mapping in bytes
> >     +        */
> >     +       __u64 range;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_nouveau_vm_bind - structure for
> DRM_IOCTL_NOUVEAU_VM_BIND
> >     + */
> >     +struct drm_nouveau_vm_bind {
> >     +       /**
> >     +        * @op_count: the number of &drm_nouveau_vm_bind_op
> >     +        */
> >     +       __u32 op_count;
> >
> >
> > I've chatted a bit with Dave on IRC about this but both VM_BIND and EXE=
C
> > should support `op_count =3D=3D 0` and do exactly the same thing that t=
hey
> > would do if there were real ops. In the case of vm_bind, that just mean=
s
> > wait on the waits and then signal the signals. In particular, it should
> > NOT just return success and do nothing. Dave has a patch for this for
> > EXEC but IDK if VM_BIND needs any attention.  Of course, if it's not
> > ASYNC, then quickly doing nothing after validating inputs is acceptable=
.
>
> What will this be used for? I guess it would not be important to be
> executed in order with "regular" (non-noop) jobs? Because the only thing
> this would tell you is that e.g. for VM_BIND all previous binds
> completed, which is what we have syncobjs for.
>

Yes, exactly that. Effectively, it allows you to add more signal objects to
the last submitted job after the fact. Vulkan allows submits with zero
command buffers and they have to behave the same as submits that actually
do work. We also use this internally in Mesa to implement things like
`vkQueueWaitForIdle`. (It's actually a little more subtle than that because
the new signals will also wait on any waits in the zero-size exec.)

The standard driver work-around for this which Mesa Vulkan drivers carry is
to have a no-op pushbuf that you stash somewhere. Whenever
command_buffer_count =3D=3D 0, you submit that one instead to trick the ker=
nel
into thinking it's doing work. Since we're building a new UAPI, though, we
may as well just support this corner case directly in the kernel driver.

~Faith


> - Danilo
>
> >
> >     +       /**
> >     +        * @flags: the flags for a &drm_nouveau_vm_bind ioctl
> >     +        */
> >     +       __u32 flags;
> >     +/**
> >     + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
> >     + *
> >     + * Indicates that the given VM_BIND operation should be executed
> >     asynchronously
> >     + * by the kernel.
> >     + *
> >     + * If this flag is not supplied the kernel executes the associated
> >     operations
> >     + * synchronously and doesn't accept any &drm_nouveau_sync objects.
> >     + */
> >     +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
> >     +       /**
> >     +        * @wait_count: the number of wait &drm_nouveau_syncs
> >     +        */
> >     +       __u32 wait_count;
> >     +       /**
> >     +        * @sig_count: the number of &drm_nouveau_syncs to signal
> >     when finished
> >     +        */
> >     +       __u32 sig_count;
> >     +       /**
> >     +        * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> >     +        */
> >     +       __u64 wait_ptr;
> >     +       /**
> >     +        * @sig_ptr: pointer to &drm_nouveau_syncs to signal when
> >     finished
> >     +        */
> >     +       __u64 sig_ptr;
> >     +       /**
> >     +        * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to
> execute
> >     +        */
> >     +       __u64 op_ptr;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_nouveau_exec_push - EXEC push operation
> >     + *
> >     + * This structure represents a single EXEC push operation. UMDs
> >     should pass an
> >     + * array of this structure via struct drm_nouveau_exec's &push_ptr
> >     field.
> >     + */
> >     +struct drm_nouveau_exec_push {
> >     +       /**
> >     +        * @va: the virtual address of the push buffer mapping
> >     +        */
> >     +       __u64 va;
> >     +       /**
> >     +        * @va_len: the length of the push buffer mapping
> >     +        */
> >     +       __u64 va_len;
> >     +};
> >     +
> >     +/**
> >     + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
> >     + */
> >     +struct drm_nouveau_exec {
> >     +       /**
> >     +        * @channel: the channel to execute the push buffer in
> >     +        */
> >     +       __u32 channel;
> >     +       /**
> >     +        * @push_count: the number of &drm_nouveau_exec_push ops
> >     +        */
> >     +       __u32 push_count;
> >
> >
> > Same comment as above. We want `push_count =3D=3D 0` to behave the same=
 as
> > any other EXEC just without anything new. In particular, it needs to
> > wait on all the waits as well as the previous EXECs on that channel and
> > then signal the sigs. I know Dave has a patch for this and it's working
> > quite well in my testing.
> >
> > Other than that, everything looks good.  I'm still re-reading all the
> > NVK patches but they've been working quite well in my testing this week
> > apart from a perf issue I need to dig into. I'll give a real RB once
> > we're sure we all agree on the semantics of _count.
> >
> > ~Faith
> >
> >     +       /**
> >     +        * @wait_count: the number of wait &drm_nouveau_syncs
> >     +        */
> >     +       __u32 wait_count;
> >     +       /**
> >     +        * @sig_count: the number of &drm_nouveau_syncs to signal
> >     when finished
> >     +        */
> >     +       __u32 sig_count;
> >     +       /**
> >     +        * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> >     +        */
> >     +       __u64 wait_ptr;
> >     +       /**
> >     +        * @sig_ptr: pointer to &drm_nouveau_syncs to signal when
> >     finished
> >     +        */
> >     +       __u64 sig_ptr;
> >     +       /**
> >     +        * @push_ptr: pointer to &drm_nouveau_exec_push ops
> >     +        */
> >     +       __u64 push_ptr;
> >     +};
> >     +
> >       #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
> >       #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> >       #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> >     @@ -136,6 +339,9 @@ struct drm_nouveau_gem_cpu_fini {
> >       #define DRM_NOUVEAU_NVIF               0x07
> >       #define DRM_NOUVEAU_SVM_INIT           0x08
> >       #define DRM_NOUVEAU_SVM_BIND           0x09
> >     +#define DRM_NOUVEAU_VM_INIT            0x10
> >     +#define DRM_NOUVEAU_VM_BIND            0x11
> >     +#define DRM_NOUVEAU_EXEC               0x12
> >       #define DRM_NOUVEAU_GEM_NEW            0x40
> >       #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> >       #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> >     @@ -197,6 +403,9 @@ struct drm_nouveau_svm_bind {
> >       #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW
> >     (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct
> >     drm_nouveau_gem_cpu_fini)
> >       #define DRM_IOCTL_NOUVEAU_GEM_INFO
> >       DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct
> >     drm_nouveau_gem_info)
> >
> >     +#define DRM_IOCTL_NOUVEAU_VM_INIT
> >     DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct
> >     drm_nouveau_vm_init)
> >     +#define DRM_IOCTL_NOUVEAU_VM_BIND
> >     DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct
> >     drm_nouveau_vm_bind)
> >     +#define DRM_IOCTL_NOUVEAU_EXEC
> >       DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct
> drm_nouveau_exec)
> >       #if defined(__cplusplus)
> >       }
> >       #endif
> >     --
> >     2.41.0
> >
>
>

--000000000000b748bb06015194cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jul 24, 2023 at 9:04=E2=80=AFPM Danilo Krummrich &lt;<a href=
=3D"mailto:dakr@redhat.com">dakr@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 7/22/23 00:58, Faith Ekstrand wrote:<br>
&gt; <br>
&gt; On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich &lt;<a href=
=3D"mailto:dakr@redhat.com" target=3D"_blank">dakr@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:dakr@redhat.com" target=3D"_blank">dakr@r=
edhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This commit provides the interfaces for the new UAP=
I motivated by the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Vulkan API. It allows user mode drivers (UMDs) to:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01) Initialize a GPU virtual address (VA) space via =
the new<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs=
 can provide a kernel reserved<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VA area.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02) Bind and unbind GPU VA space mappings via the ne=
w<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_NOUVEAU_VM_BIND ioctl.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A03) Execute push buffers with the new DRM_IOCTL_NOUV=
EAU_EXEC ioctl.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVE=
AU_EXEC support<br>
&gt;=C2=A0 =C2=A0 =C2=A0asynchronous processing with DRM syncobjs as synchr=
onization mechanism.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronou=
s processing,<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_IOCTL_NOUVEAU_EXEC supports asynchronous proces=
sing only.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Co-authored-by: Dave Airlie &lt;<a href=3D"mailto:a=
irlied@redhat.com" target=3D"_blank">airlied@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:airlied@redhat.com" ta=
rget=3D"_blank">airlied@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Danilo Krummrich &lt;<a href=3D"mail=
to:dakr@redhat.com" target=3D"_blank">dakr@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:dakr@redhat.com" targe=
t=3D"_blank">dakr@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/gpu/driver-uapi.rst |=C2=A0 =
=C2=A08 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 =
| 209 ++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02 files changed, 217 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/Documentation/gpu/driver-uapi.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/Documentation/gpu/driver-uapi.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 4411e6919a3d..9c7ca6e33a68 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/Documentation/gpu/driver-uapi.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/Documentation/gpu/driver-uapi.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -6,3 +6,11 @@ drm/i915 uAPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.. kernel-doc:: include/uapi/drm/i915_drm.h<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+drm/nouveau uAPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+VM_BIND / EXEC uAPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+.. kernel-doc:: include/uapi/drm/nouveau_drm.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/include/uapi/drm/nouveau_drm.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/include/uapi/drm/nouveau_drm.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 853a327433d3..4d3a70529637 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/include/uapi/drm/nouveau_drm.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/uapi/drm/nouveau_drm.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -126,6 +126,209 @@ struct drm_nouveau_gem_cpu_fi=
ni {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_nouveau_sync - sync object<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * This structure serves as synchronization mechan=
ism for (potentially)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * asynchronous operations such as EXEC or VM_BIND=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_nouveau_sync {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: the flags fo=
r a sync object<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The first 8 bits are=
 used to determine the type of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0sync object.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: the handle =
of the sync object<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @timeline_value:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The timeline point o=
f the sync object in case the syncobj<br>
&gt;=C2=A0 =C2=A0 =C2=A0is of<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * type DRM_NOUVEAU_SYN=
C_TIMELINE_SYNCOBJ.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 timeline_value;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_nouveau_vm_init - GPU VA space init =
structure<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Used to initialize the GPU&#39;s VA space for a=
 user client, telling<br>
&gt;=C2=A0 =C2=A0 =C2=A0the kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * which portion of the VA space is managed by the=
 UMD and kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0respectively.<br>
&gt; <br>
&gt; <br>
&gt; I assume this has to be called quite early. Like maybe before any BOs =
or <br>
&gt; channels are created? In any case, it&#39;d be nice to have that docum=
ented.<br>
<br>
Exactly, doing any of those will disable the new uAPI entirely if it <br>
wasn&#39;t yet initialized. I will add some documentation for this.<br></bl=
ockquote><div><br></div><div>Thanks!<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_nouveau_vm_init {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @unmanaged_addr: sta=
rt address of the kernel managed VA<br>
&gt;=C2=A0 =C2=A0 =C2=A0space region<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 unmanaged_addr;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @unmanaged_size: siz=
e of the kernel managed VA space<br>
&gt;=C2=A0 =C2=A0 =C2=A0region in bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 unmanaged_size;<b=
r>
&gt; <br>
&gt; <br>
&gt; Over-all, I think this is the right API. My only concern is with the <=
br>
&gt; word &quot;unmanaged&quot;. None of the VA space is unmanaged. Some is=
 <br>
&gt; userspace-managed and some is kernel-managed.=C2=A0 I guess &quot;unma=
naged&quot; kinda <br>
&gt; makes sense because this is coming from userspace and it&#39;s saying =
which <br>
&gt; bits it manages and which bits it doesn&#39;t.=C2=A0 Still seems clunk=
y to me.=C2=A0 <br>
&gt; Maybe kernel_managed? IDK, that feels weird too. Since we&#39;re alrea=
dy <br>
&gt; using UMD in this file, we could call it kmd_managed. IDK. =F0=9F=A4=
=B7=F0=9F=8F=BB=E2=80=8D=E2=99=80=EF=B8=8F<br>
<br>
kernel_managed / kmd_managed both sounds fine to me. I&#39;m good with <br>
either one.<br></blockquote><div><br></div><div>Let&#39;s go with kernel_ma=
naged then, unless anyone objects.<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Yeah, I know this is a total bikeshed color thing and I&#39;m not goin=
g to <br>
&gt; block anything based on it. =F0=9F=98=85 Just wanted to see if we can =
come up with <br>
&gt; anything better.=C2=A0 It&#39;s documented and that&#39;s the importan=
t thing.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_nouveau_vm_bind_op - VM_BIND operati=
on<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * This structure represents a single VM_BIND oper=
ation. UMDs<br>
&gt;=C2=A0 =C2=A0 =C2=A0should pass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * an array of this structure via struct drm_nouve=
au_vm_bind&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&amp;op_ptr field.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_nouveau_vm_bind_op {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @op: the operation t=
ype<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 op;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * @DRM_NOUVEAU_VM_BIND_OP_MAP:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Map a GEM object to the GPU&#39;s VA space. Opt=
ionally, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * &amp;DRM_NOUVEAU_VM_BIND_SPARSE flag can be pas=
sed to instruct the<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel to<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * create sparse mappings for the given range.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Unmap an existing mapping in the GPU&#39;s VA s=
pace. If the region<br>
&gt;=C2=A0 =C2=A0 =C2=A0the mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * is located in is a sparse region, new sparse ma=
ppings are<br>
&gt;=C2=A0 =C2=A0 =C2=A0created where the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * unmapped (memory backed) mapping was mapped pre=
viously. To<br>
&gt;=C2=A0 =C2=A0 =C2=A0remove a sparse<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * region the &amp;DRM_NOUVEAU_VM_BIND_SPARSE must=
 be set.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: the flags fo=
r a &amp;drm_nouveau_vm_bind_op<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * @DRM_NOUVEAU_VM_BIND_SPARSE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Indicates that an allocated VA space region sho=
uld be sparse.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_VM_BIND_SPARSE (1 &lt;&lt; 8)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: the handle =
of the DRM GEM object to map<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @pad: 32 bit padding=
, should be 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 pad;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @addr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the address the VA s=
pace region or (memory backed)<br>
&gt;=C2=A0 =C2=A0 =C2=A0mapping should be mapped to<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @bo_offset: the offs=
et within the BO backing the mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 bo_offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @range: the size of =
the requested mapping in bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 range;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_nouveau_vm_bind - structure for DRM_=
IOCTL_NOUVEAU_VM_BIND<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_nouveau_vm_bind {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @op_count: the numbe=
r of &amp;drm_nouveau_vm_bind_op<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 op_count;<br>
&gt; <br>
&gt; <br>
&gt; I&#39;ve chatted a bit with Dave on IRC about this but both VM_BIND an=
d EXEC <br>
&gt; should support `op_count =3D=3D 0` and do exactly the same thing that =
they <br>
&gt; would do if there were real ops. In the case of vm_bind, that just mea=
ns <br>
&gt; wait on the waits and then signal the signals. In particular, it shoul=
d <br>
&gt; NOT just return success and do nothing. Dave has a patch for this for =
<br>
&gt; EXEC but IDK if VM_BIND needs any attention.=C2=A0 Of course, if it&#3=
9;s not <br>
&gt; ASYNC, then quickly doing nothing after validating inputs is acceptabl=
e.<br>
<br>
What will this be used for? I guess it would not be important to be <br>
executed in order with &quot;regular&quot; (non-noop) jobs? Because the onl=
y thing <br>
this would tell you is that e.g. for VM_BIND all previous binds <br>
completed, which is what we have syncobjs for.<br></blockquote><div><br></d=
iv><div>Yes, exactly that. Effectively, it allows you to add more signal ob=
jects to the last submitted job after the fact. Vulkan allows submits with =
zero command buffers and they have to behave the same as submits that actua=
lly do work. We also use this internally in Mesa to implement things like `=
vkQueueWaitForIdle`. (It&#39;s actually a little more subtle than that beca=
use the new signals will also wait on any waits in the zero-size exec.)<br>=
</div><div><br></div><div>The standard driver work-around for this which Me=
sa Vulkan drivers carry is to have a no-op pushbuf that you stash somewhere=
. Whenever command_buffer_count =3D=3D 0, you submit that one instead to tr=
ick the kernel into thinking it&#39;s doing work. Since we&#39;re building =
a new UAPI, though, we may as well just support this corner case directly i=
n the kernel driver.</div><div><br></div><div>~Faith<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
- Danilo<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: the flags fo=
r a &amp;drm_nouveau_vm_bind ioctl<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Indicates that the given VM_BIND operation shou=
ld be executed<br>
&gt;=C2=A0 =C2=A0 =C2=A0asynchronously<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * by the kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * If this flag is not supplied the kernel execute=
s the associated<br>
&gt;=C2=A0 =C2=A0 =C2=A0operations<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * synchronously and doesn&#39;t accept any &amp;d=
rm_nouveau_sync objects.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_count: the num=
ber of wait &amp;drm_nouveau_syncs<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 wait_count;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_count: the numb=
er of &amp;drm_nouveau_syncs to signal<br>
&gt;=C2=A0 =C2=A0 =C2=A0when finished<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 sig_count;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_ptr: pointer t=
o &amp;drm_nouveau_syncs to wait for<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 wait_ptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_ptr: pointer to=
 &amp;drm_nouveau_syncs to signal when<br>
&gt;=C2=A0 =C2=A0 =C2=A0finished<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 sig_ptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @op_ptr: pointer to =
the &amp;drm_nouveau_vm_bind_ops to execute<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 op_ptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_nouveau_exec_push - EXEC push operat=
ion<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * This structure represents a single EXEC push op=
eration. UMDs<br>
&gt;=C2=A0 =C2=A0 =C2=A0should pass an<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * array of this structure via struct drm_nouveau_=
exec&#39;s &amp;push_ptr<br>
&gt;=C2=A0 =C2=A0 =C2=A0field.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_nouveau_exec_push {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @va: the virtual add=
ress of the push buffer mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 va;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @va_len: the length =
of the push buffer mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 va_len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_nouveau_exec - structure for DRM_IOC=
TL_NOUVEAU_EXEC<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_nouveau_exec {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @channel: the channe=
l to execute the push buffer in<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 channel;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @push_count: the num=
ber of &amp;drm_nouveau_exec_push ops<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 push_count;<br>
&gt; <br>
&gt; <br>
&gt; Same comment as above. We want `push_count =3D=3D 0` to behave the sam=
e as <br>
&gt; any other EXEC just without anything new. In particular, it needs to <=
br>
&gt; wait on all the waits as well as the previous EXECs on that channel an=
d <br>
&gt; then signal the sigs. I know Dave has a patch for this and it&#39;s wo=
rking <br>
&gt; quite well in my testing.<br>
&gt; <br>
&gt; Other than that, everything looks good.=C2=A0 I&#39;m still re-reading=
 all the <br>
&gt; NVK patches but they&#39;ve been working quite well in my testing this=
 week <br>
&gt; apart from a perf issue I need to dig into. I&#39;ll give a real RB on=
ce <br>
&gt; we&#39;re sure we all agree on the semantics of _count.<br>
&gt; <br>
&gt; ~Faith<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_count: the num=
ber of wait &amp;drm_nouveau_syncs<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 wait_count;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_count: the numb=
er of &amp;drm_nouveau_syncs to signal<br>
&gt;=C2=A0 =C2=A0 =C2=A0when finished<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 sig_count;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @wait_ptr: pointer t=
o &amp;drm_nouveau_syncs to wait for<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 wait_ptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @sig_ptr: pointer to=
 &amp;drm_nouveau_syncs to signal when<br>
&gt;=C2=A0 =C2=A0 =C2=A0finished<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 sig_ptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @push_ptr: pointer t=
o &amp;drm_nouveau_exec_push ops<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 push_ptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x00 /* deprecated */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_SETPARAM=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x01 /* deprecated */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=
=A0 =C2=A0 0x02 /* deprecated */<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -136,6 +339,9 @@ struct drm_nouveau_gem_cpu_fini=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_NVIF=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x07<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_SVM_INIT=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x08<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_SVM_BIND=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x09<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_VM_INIT=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x10<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_VM_BIND=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x11<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_NOUVEAU_EXEC=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x12<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_GEM_NEW=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x40<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_GEM_PUSHBUF=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x41<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_NOUVEAU_GEM_CPU_PREP=C2=A0 =C2=
=A0 =C2=A0 =C2=A00x42<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -197,6 +403,9 @@ struct drm_nouveau_svm_bind {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI=C2=A0=
 =C2=A0 =C2=A0 =C2=A0DRM_IOW<br>
&gt;=C2=A0 =C2=A0 =C2=A0(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struc=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_nouveau_gem_cpu_fini)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_IOCTL_NOUVEAU_GEM_INFO=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_=
INFO, struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_nouveau_gem_info)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_IOCTL_NOUVEAU_VM_INIT=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, st=
ruct<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_nouveau_vm_init)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_IOCTL_NOUVEAU_VM_BIND=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, st=
ruct<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_nouveau_vm_bind)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define DRM_IOCTL_NOUVEAU_EXEC=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC=
, struct drm_nouveau_exec)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#if defined(__cplusplus)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.41.0<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000b748bb06015194cc--
