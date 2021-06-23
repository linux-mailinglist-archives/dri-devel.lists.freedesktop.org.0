Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9A3B1724
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 11:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B166E89F;
	Wed, 23 Jun 2021 09:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448CF6E896
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:45:40 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id s19so2556756ioc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 02:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8gz89K+x320TzMzMlB3+TLV3c93YiJCgn8umvlOMJ7I=;
 b=UARL5J9lCxepYR+GpbiT8J1lwnotarNRcwqOzmlkdPdATr4Ft7irVcJYUbtEQkx1LO
 zxsxY6Zm0Z5RD2A17BLP71onkMoKvAoZEjSAtOpjeD75+vttZHD1VJWAnzOHw4T15X0x
 se2ZaGrozmEjIH++gDlMWdONx/tsFCKOCbcDTAPE8aSaZfPOugpvZLJ+rST5e62BCMif
 teGq/8tlyxXnvZzR0MqA4Hjw/P7DxnEB4xiJsJp4zLYQuR7GGop1zJMsQN/kgU7lSvWF
 LJY6PoHplEjH3uVXi5PtNJkjEEUcSs9YK4ycNb1UhR7r30hNPy2AYpWfaIJkaJb1L+6D
 +/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8gz89K+x320TzMzMlB3+TLV3c93YiJCgn8umvlOMJ7I=;
 b=aC5Z6abKdbQMu94fQJdjjDbAEyzgvD6JE7Fu7L2kvTZrbH3E5heSk0b04FS1m9NfqH
 081MuiGtAG82jmvK08CybYHvHAYgXpRWQuAMwhrSoUJQkjUpD2tb+WJfD1PMO3Y+DKcZ
 9BjU6TCoa0BTeh7mhTRgKAjSa7pKyx5FpG9VNrUIs9vWHnM4x3x/UCK+3sNCyulZDGvc
 jzJaAKfZJsu8cxE8LlAjmQc+UPSc6nJKW+2vz+CzeIMsBIoAgL3HtwEesI+gAcTof/Ae
 GF98UjIiY4c4GyYj5roANFdrbdM7SYLjSJTpLpInBuXZ7kx88yXqZCcHGoAOREg132R9
 x4pg==
X-Gm-Message-State: AOAM533Mw99PpVpxXdUqdoTSdeYqJs1sJFleLMeCnPgztyvoUmHksWW7
 YjYb6rvE5/6xcFWiV848L32ueTBwJTAH+2ITK9lyKQ==
X-Google-Smtp-Source: ABdhPJz0Qdv8wrZCQKMjrVivv7XKFWpj7oILU6UBEyVuV5CbKdEvy4Ib4hW+cuG2n1jxs4HjTMU5IoMdoKRWpSJ1e3s=
X-Received: by 2002:a02:ca4a:: with SMTP id i10mr8071337jal.141.1624441539001; 
 Wed, 23 Jun 2021 02:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
In-Reply-To: <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 23 Jun 2021 11:45:33 +0200
Message-ID: <CAP+8YyHPLpe6jM7gz3ZNL3QqdHiCdL0P5cVMS7ddNgBSJmutSA@mail.gmail.com>
Subject: Re: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit
 fencing uapi
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
>
> Implicit fencing done properly needs to treat the implicit fencing
> slots like a funny kind of IPC mailbox. In other words it needs to be
> explicitly. This is the only way it will mesh well with explicit
> fencing userspace like vk, and it's also the bare minimum required to
> be able to manage anything else that wants to use the same buffer on
> multiple engines in parallel, and still be able to share it through
> implicit sync.
>
> amdgpu completely lacks such an uapi. Fix this.
>
> Luckily the concept of ignoring implicit fences exists already, and
> takes care of all the complexities of making sure that non-optional
> fences (like bo moves) are not ignored. This support was added in
>
> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
> Author: Andres Rodriguez <andresx7@gmail.com>
> Date:   Fri Sep 15 20:44:06 2017 -0400
>
>     drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
>
> Unfortuantely it's the wrong semantics, because it's a bo flag and
> disables implicit sync on an allocated buffer completely.
>
> We _do_ want implicit sync, but control it explicitly. For this we
> need a flag on the drm_file, so that a given userspace (like vulkan)
> can manage the implicit sync slots explicitly. The other side of the
> pipeline (compositor, other process or just different stage in a media
> pipeline in the same process) can then either do the same, or fully
> participate in the implicit sync as implemented by the kernel by
> default.
>
> By building on the existing flag for buffers we avoid any issues with
> opening up additional security concerns - anything this new flag here
> allows is already.
>
> All drivers which supports this concept of a userspace-specific
> opt-out of implicit sync have a flag in their CS ioctl, but in reality
> that turned out to be a bit too inflexible. See the discussion below,
> let's try to do a bit better for amdgpu.
>
> This alone only allows us to completely avoid any stalls due to
> implicit sync, it does not yet allow us to use implicit sync as a
> strange form of IPC for sync_file.
>
> For that we need two more pieces:
>
> - a way to get the current implicit sync fences out of a buffer. Could
>   be done in a driver ioctl, but everyone needs this, and generally a
>   dma-buf is involved anyway to establish the sharing. So an ioctl on
>   the dma-buf makes a ton more sense:
>
>   https://lore.kernel.org/dri-devel/20210520190007.534046-4-jason@jlekstr=
and.net/
>
>   Current drivers in upstream solves this by having the opt-out flag
>   on their CS ioctl. This has the downside that very often the CS
>   which must actually stall for the implicit fence is run a while
>   after the implicit fence point was logically sampled per the api
>   spec (vk passes an explicit syncobj around for that afaiui), and so
>   results in oversync. Converting the implicit sync fences into a
>   snap-shot sync_file is actually accurate.
>
> - Simillar we need to be able to set the exclusive implicit fence.
>   Current drivers again do this with a CS ioctl flag, with again the
>   same problems that the time the CS happens additional dependencies
>   have been added. An explicit ioctl to only insert a sync_file (while
>   respecting the rules for how exclusive and shared fence slots must
>   be update in struct dma_resv) is much better. This is proposed here:
>
>   https://lore.kernel.org/dri-devel/20210520190007.534046-5-jason@jlekstr=
and.net/
>
> These three pieces together allow userspace to fully control implicit
> fencing and remove all unecessary stall points due to them.
>
> Well, as much as the implicit fencing model fundamentally allows:
> There is only one set of fences, you can only choose to sync against
> only writers (exclusive slot), or everyone. Hence suballocating
> multiple buffers or anything else like this is fundamentally not
> possible, and can only be fixed by a proper explicit fencing model.
>
> Aside from that caveat this model gets implicit fencing as closely to
> explicit fencing semantics as possible:
>
> On the actual implementation I opted for a simple setparam ioctl, no
> locking (just atomic reads/writes) for simplicity. There is a nice
> flag parameter in the VM ioctl which we could use, except:
> - it's not checked, so userspace likely passes garbage
> - there's already a comment that userspace _does_ pass garbage in the
>   priority field
> So yeah unfortunately this flag parameter for setting vm flags is
> useless, and we need to hack up a new one.
>
> v2: Explain why a new SETPARAM (Jason)
>
> v3: Bas noticed I forgot to hook up the dependency-side shortcut. We
> need both, or this doesn't do much.
>
> v4: Rebase over the amdgpu patch to always set the implicit sync
> fences.

So I think there is still a case missing in this implementation.
Consider these 3 cases

(format: a->b: b waits on a. Yes, I know arrows are hard)

explicit->explicit: This doesn't wait now, which is good
Implicit->explicit: This doesn't wait now, which is good
explicit->implicit : This still waits as the explicit submission still
adds shared fences and most things that set an exclusive fence for
implicit sync will hence wait on it.

This is probably good enough for what radv needs now but also sounds
like a risk wrt baking in new uapi behavior that we don't want to be
the end result.

Within AMDGPU this is probably solvable in two ways:

1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for shared fences=
.
2) Have an EXPLICIT fence owner that is used for explicit submissions
that is ignored by AMDGPU_SYNC_NE_OWNER.

But this doesn't solve cross-driver interactions here.

>
> Cc: mesa-dev@lists.freedesktop.org
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Kristian H. Kristensen <hoegsberg@google.com>
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
>  include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
>  4 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 65df34c17264..c5386d13eb4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pars=
er *p,
>         struct amdgpu_bo *gds;
>         struct amdgpu_bo *gws;
>         struct amdgpu_bo *oa;
> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implicit_sync);
>         int r;
>
>         INIT_LIST_HEAD(&p->validated);
> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pars=
er *p,
>
>                 e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
>
> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo))=
 {
> +               if (bo->tbo.base.dma_buf &&
> +                   !(no_implicit_sync || amdgpu_bo_explicit_sync(bo))) {
>                         e->chain =3D dma_fence_chain_alloc();
>                         if (!e->chain) {
>                                 r =3D -ENOMEM;
> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pars=
er *p)
>  {
>         struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
>         struct amdgpu_bo_list_entry *e;
> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implicit_sync);
>         int r;
>
>         list_for_each_entry(e, &p->validated, tv.head) {
> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pars=
er *p)
>                 struct dma_resv *resv =3D bo->tbo.base.resv;
>                 enum amdgpu_sync_mode sync_mode;
>
> -               sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
> +               sync_mode =3D no_implicit_sync || amdgpu_bo_explicit_sync=
(bo) ?
>                         AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
>                 r =3D amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync=
_mode,
>                                      &fpriv->vm);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index c080ba15ae77..f982626b5328 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, struct=
 amdgpu_fpriv **fpriv)
>         return 0;
>  }
>
> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp)
> +{
> +       struct drm_amdgpu_setparam *setparam =3D data;
> +       struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
> +
> +       switch (setparam->param) {
> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
> +               if (setparam->value)
> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, true);
> +               else
> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, false);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D {
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM=
_AUTH|DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_REND=
ER_ALLOW),
> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D=
 {
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DR=
M_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DR=
M_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, D=
RM_AUTH|DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, DRM_AUT=
H|DRM_RENDER_ALLOW),
>  };
>
>  static const struct drm_driver amdgpu_kms_driver =3D {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.h
> index ddb85a85cbba..0e8c440c6303 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -321,6 +321,12 @@ struct amdgpu_vm {
>         bool                    bulk_moveable;
>         /* Flag to indicate if VM is used for compute */
>         bool                    is_compute_context;
> +       /*
> +        * Flag to indicate whether implicit sync should always be skippe=
d on
> +        * this context. We do not care about races at all, userspace is =
allowed
> +        * to shoot itself with implicit sync to its fullest liking.
> +        */
> +       bool no_implicit_sync;
>  };
>
>  struct amdgpu_vm_manager {
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.=
h
> index 0cbd1540aeac..9eae245c14d6 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -54,6 +54,7 @@ extern "C" {
>  #define DRM_AMDGPU_VM                  0x13
>  #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
>  #define DRM_AMDGPU_SCHED               0x15
> +#define DRM_AMDGPU_SETPARAM            0x16
>
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + DRM_A=
MDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + DRM_A=
MDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -71,6 +72,7 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND_BASE + DRM_A=
MDGPU_VM, union drm_amdgpu_vm)
>  #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM=
_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>  #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_BASE + DRM_AM=
DGPU_SCHED, union drm_amdgpu_sched)
> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BASE + DRM_AM=
DGPU_SETPARAM, struct drm_amdgpu_setparam)
>
>  /**
>   * DOC: memory domains
> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
>         struct drm_amdgpu_sched_in in;
>  };
>
> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
> +
> +struct drm_amdgpu_setparam {
> +       /* AMDGPU_SETPARAM_* */
> +       __u32   param;
> +       __u32   value;
> +};
> +
>  /*
>   * This is not a reliable API and you should expect it to fail for any
>   * number of reasons and have fallback path that do not use userptr to
> --
> 2.32.0.rc2
>
