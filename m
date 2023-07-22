Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2075E0B1
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 11:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA8110E023;
	Sun, 23 Jul 2023 09:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5EE10E150
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 15:12:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-992dcae74e0so471911966b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1690038762; x=1690643562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RvZVBZUwfmO7KvOM9fKLCN3JFfJGoZp6AV8cYusVxfI=;
 b=36YMtRXYVrwYZD4e245SRygCfCkLe+y9F8IVuq6ok+ZC35MI5ZeiKYQdy78EECxJ6S
 yl+RPI2UC0wOP1zGK3P+WCXDncfYjJs+dPI6uVzb5oOLkxaSHsBLjiC95xBP1X9BY4/+
 U27qJYbIuAilDjqY/hv8NlQtgplGVbFYNiaIFOxRCGVxTzTKpSODlhXAgSgYgrDaPoj3
 UI7AlSc3ZOTmYAkO0cJdPcHRqeH/E/ptn2NANoaakrMGzHVF0BsFQw0rj6N/xWS6oRML
 TL0LkNMg7fUXMFuLDxty3U7ZoXE7IAh4MBEdzcUvPIu3uEQb+mmGOeEkiNcEazfmAdGj
 D6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690038762; x=1690643562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RvZVBZUwfmO7KvOM9fKLCN3JFfJGoZp6AV8cYusVxfI=;
 b=Xr1Gl9pFdPiGt6vZPmakW4bX3Fv9MX/M6AyLrgT8Tl5k2c9doL+RnHsuwVEEI07nQg
 jC6328gjr+roiZEqdWKBPDELlXyeDAihyMraZrvHZNxK7+xrGafM1PgRruSs5z9MAOlS
 +Mivmol5aEGOmDTJmBqGDBY1DiAycylq58/IgZc1uWJdo6gIQ5JyxjLJTndy3YKfArKW
 XGZUlKYnp5B/QDbLOxe8SW7GhvjtkxnzBiqQTGTUa4MFbMwJMYhwFiA49DRonkiw4ATy
 EWV13v3PyClFuAxvwN/aT7uu9BngCYc9O9Q7gu1Y5VF3BdNFoOWVu6pc67b1iHd2dTfX
 ym6w==
X-Gm-Message-State: ABy/qLaHIWupsNNOg8AqDmBtgdYgencyAzsYcjf1cAcG/D7Cx5q1M2Du
 ItneY9AiJZgrUnaVp0omYLDbmNViu9x2ddDKM/43EA==
X-Google-Smtp-Source: APBJJlG52Ty/VVrpiuosPP5tE4cvv1XiEYQc2ocdZkmTupxEehMt68/ek2hfhX9inh7HKo9M/0rZvoKatz6bw5es960=
X-Received: by 2002:a17:906:7a12:b0:975:942e:81e7 with SMTP id
 d18-20020a1709067a1200b00975942e81e7mr5055427ejo.37.1690038760731; Sat, 22
 Jul 2023 08:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
In-Reply-To: <20230720001443.2380-12-dakr@redhat.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Sat, 22 Jul 2023 10:12:28 -0500
Message-ID: <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 11/12] drm/nouveau: implement new VM_BIND
 uAPI
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fd8b18060114cfae"
X-Mailman-Approved-At: Sun, 23 Jul 2023 09:22:16 +0000
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
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fd8b18060114cfae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:

> This commit provides the implementation for the new uapi motivated by the
> Vulkan API. It allows user mode drivers (UMDs) to:
>
> 1) Initialize a GPU virtual address (VA) space via the new
>    DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
>    space managed by the kernel and userspace, respectively.
>
> 2) Allocate and free a VA space region as well as bind and unbind memory
>    to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>    UMDs can request the named operations to be processed either
>    synchronously or asynchronously. It supports DRM syncobjs
>    (incl. timelines) as synchronization mechanism. The management of the
>    GPU VA mappings is implemented with the DRM GPU VA manager.
>
> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
>    execution happens asynchronously. It supports DRM syncobj (incl.
>    timelines) as synchronization mechanism. DRM GEM object locking is
>    handled with drm_exec.
>
> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
> GPU scheduler for the asynchronous paths.
>

IDK where the best place to talk about this is but this seems as good as
any.

I've been looking into why the Vulkan CTS runs about 2x slower for me on
the new UAPI and I created a little benchmark to facilitate testing:

https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141

The test, roughly, does the following:
 1. Allocates and binds 1000 BOs
 2. Constructs a pushbuf that executes a no-op compute shader.
 3. Does a single EXEC/wait combo to warm up the kernel
 4. Loops 10,000 times, doing SYNCOBJ_RESET (fast), EXEC, and then
SYNCOBJ_WAIT and times the loop

Of course, there's a bit of userspace driver overhead but that's
negledgable.

If you drop the top patch which allocates 1k buffers, the submit time on
the old uAPI is 54 us/exec vs. 66 us/exec on the new UAPI. This includes
the time to do a SYNCOBJ_RESET (fast), EXEC, and SYNCOBJ_WAIT. The Intel
driver, by comparison, is 33us/exec so it's not syncobj overhead. This is a
bit concerning (you'd think the new thing would be faster) but what really
has me concerned is the 1k buffer case.

If you include the top patch in the crucible MR, it allocates 1000 BOs and
VM_BINDs them. All the binding is done before the warmup EXEC. Suddenly,
the submit time jumps to 257 us/exec with the new UAPI. The old UAPI is
much worse (1134 us/exec) but that's not the point. Once we've done the
first EXEC and created our VM bindings, the cost per EXEC shouldn't change
at all based on the number of BOs bound.  Part of the point of VM_BIND is
to get all that binding logic and BO walking off the EXEC path.

Normally, I wouldn't be too worried about a little performance problem like
this. This is the first implementation and we can improve it later. I get
that. However, I suspect the solution to this problem involves more UAPI
and I want to make sure we have it all before we call this all done and
dusted and land it.

The way AMD solves this problem as well as the new Xe driver for Intel is
to have a concept of internal vs. external BOs. Basically, there's an
INTERNAL bit specified somewhere in BO creation that has a few userspace
implications:
 1. In the Xe world where VMs are objects, INTERNAL BOs are assigned a VM
on creation and can never be bound to any other VM.
 2. Any attempt to export an INTERNAL BO via prime or a similar mechanism
will fail with -EINVAL (I think?).

Inside the kernel driver, all the internal BOs on a VM (or DRM file in the
case of nouveau/AMD since they don't have VM objects) share a single
dma_resv which allows you to avoid having to walk lists of BOs and take
locks on every exec. Instead, you can just look at the fences on the
dma_resv for the VM. There's still a BO list associated with the VM for
external BOs but, in most Vulkan applications, there are less than a half
dozen external BOs total.  Meanwhile, the hundreds or thousands of BOs used
entirely internally to the application basically count as one BO when it
comes to locking overhead.

I'm not actually trying to dictate kernel driver design here. If one
dma_resv doesn't work, fine. I don't care as long as EXEC scales. However,
given that the solution in all the other drivers involves a BO create flag
nouveau doesn't have, we need to either add that or prove that we can get
EXEC to scale without it.

~Faith

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/driver-uapi.rst       |    3 +
>  drivers/gpu/drm/nouveau/Kbuild          |    3 +
>  drivers/gpu/drm/nouveau/Kconfig         |    2 +
>  drivers/gpu/drm/nouveau/nouveau_abi16.c |   24 +
>  drivers/gpu/drm/nouveau/nouveau_abi16.h |    1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c    |  156 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h    |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |   27 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |   59 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.c  |  414 +++++
>  drivers/gpu/drm/nouveau/nouveau_exec.h  |   54 +
>  drivers/gpu/drm/nouveau/nouveau_gem.c   |   25 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.h   |    5 +
>  drivers/gpu/drm/nouveau/nouveau_prime.c |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c |  462 ++++++
>  drivers/gpu/drm/nouveau/nouveau_sched.h |  123 ++
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 1970 +++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_uvmm.h  |  107 ++
>  18 files changed, 3372 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
>
> diff --git a/Documentation/gpu/driver-uapi.rst
> b/Documentation/gpu/driver-uapi.rst
> index 9c7ca6e33a68..c08bcbb95fb3 100644
> --- a/Documentation/gpu/driver-uapi.rst
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -13,4 +13,7 @@ drm/nouveau uAPI
>  VM_BIND / EXEC uAPI
>  -------------------
>
> +.. kernel-doc:: drivers/gpu/drm/nouveau/nouveau_exec.c
> +    :doc: Overview
> +
>  .. kernel-doc:: include/uapi/drm/nouveau_drm.h
> diff --git a/drivers/gpu/drm/nouveau/Kbuild
> b/drivers/gpu/drm/nouveau/Kbuild
> index 5e5617006da5..cf6b3a80c0c8 100644
> --- a/drivers/gpu/drm/nouveau/Kbuild
> +++ b/drivers/gpu/drm/nouveau/Kbuild
> @@ -47,6 +47,9 @@ nouveau-y +=3D nouveau_prime.o
>  nouveau-y +=3D nouveau_sgdma.o
>  nouveau-y +=3D nouveau_ttm.o
>  nouveau-y +=3D nouveau_vmm.o
> +nouveau-y +=3D nouveau_exec.o
> +nouveau-y +=3D nouveau_sched.o
> +nouveau-y +=3D nouveau_uvmm.o
>
>  # DRM - modesetting
>  nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) +=3D nouveau_backlight.o
> diff --git a/drivers/gpu/drm/nouveau/Kconfig
> b/drivers/gpu/drm/nouveau/Kconfig
> index a70bd65e1400..c52e8096cca4 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -10,6 +10,8 @@ config DRM_NOUVEAU
>         select DRM_KMS_HELPER
>         select DRM_TTM
>         select DRM_TTM_HELPER
> +       select DRM_EXEC
> +       select DRM_SCHED
>         select I2C
>         select I2C_ALGOBIT
>         select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 82dab51d8aeb..a112f28681d3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -35,6 +35,7 @@
>  #include "nouveau_chan.h"
>  #include "nouveau_abi16.h"
>  #include "nouveau_vmm.h"
> +#include "nouveau_sched.h"
>
>  static struct nouveau_abi16 *
>  nouveau_abi16(struct drm_file *file_priv)
> @@ -125,6 +126,17 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
>  {
>         struct nouveau_abi16_ntfy *ntfy, *temp;
>
> +       /* When a client exits without waiting for it's queued up jobs to
> +        * finish it might happen that we fault the channel. This is due =
to
> +        * drm_file_free() calling drm_gem_release() before the postclose=
()
> +        * callback. Hence, we can't tear down this scheduler entity befo=
re
> +        * uvmm mappings are unmapped. Currently, we can't detect this
> case.
> +        *
> +        * However, this should be rare and harmless, since the channel
> isn't
> +        * needed anymore.
> +        */
> +       nouveau_sched_entity_fini(&chan->sched_entity);
> +
>         /* wait for all activity to stop before cleaning up */
>         if (chan->chan)
>                 nouveau_channel_idle(chan->chan);
> @@ -261,6 +273,13 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>         if (!drm->channel)
>                 return nouveau_abi16_put(abi16, -ENODEV);
>
> +       /* If uvmm wasn't initialized until now disable it completely to
> prevent
> +        * userspace from mixing up UAPIs.
> +        *
> +        * The client lock is already acquired by nouveau_abi16_get().
> +        */
> +       __nouveau_cli_uvmm_disable(cli);
> +
>         device =3D &abi16->device;
>         engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
>
> @@ -304,6 +323,11 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>         if (ret)
>                 goto done;
>
> +       ret =3D nouveau_sched_entity_init(&chan->sched_entity, &drm->sche=
d,
> +                                       drm->sched_wq);
> +       if (ret)
> +               goto done;
> +
>         init->channel =3D chan->chan->chid;
>
>         if (device->info.family >=3D NV_DEVICE_INFO_V0_TESLA)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> index 27eae85f33e6..8209eb28feaf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -26,6 +26,7 @@ struct nouveau_abi16_chan {
>         struct nouveau_bo *ntfy;
>         struct nouveau_vma *ntfy_vma;
>         struct nvkm_mm  heap;
> +       struct nouveau_sched_entity sched_entity;
>  };
>
>  struct nouveau_abi16 {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index e9cbbf594e6f..12d5d2dbbd4e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -199,7 +199,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, int
> *align, u64 *size)
>
>  struct nouveau_bo *
>  nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32
> domain,
> -                u32 tile_mode, u32 tile_flags)
> +                u32 tile_mode, u32 tile_flags, bool internal)
>  {
>         struct nouveau_drm *drm =3D cli->drm;
>         struct nouveau_bo *nvbo;
> @@ -221,8 +221,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size,
> int *align, u32 domain,
>         INIT_LIST_HEAD(&nvbo->vma_list);
>         nvbo->bo.bdev =3D &drm->ttm.bdev;
>
> -       drm_gem_gpuva_init(&nvbo->bo.base);
> -
>         /* This is confusing, and doesn't actually mean we want an uncach=
ed
>          * mapping, but is what NOUVEAU_GEM_DOMAIN_COHERENT gets translat=
ed
>          * into in nouveau_gem_new().
> @@ -235,68 +233,103 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64
> *size, int *align, u32 domain,
>                         nvbo->force_coherent =3D true;
>         }
>
> -       if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_FERMI) {
> -               nvbo->kind =3D (tile_flags & 0x0000ff00) >> 8;
> -               if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> -                       kfree(nvbo);
> -                       return ERR_PTR(-EINVAL);
> +       nvbo->contig =3D !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
> +       if (!nouveau_cli_uvmm(cli) || internal) {
> +               /* for BO noVM allocs, don't assign kinds */
> +               if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_FERMI)=
 {
> +                       nvbo->kind =3D (tile_flags & 0x0000ff00) >> 8;
> +                       if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +                               kfree(nvbo);
> +                               return ERR_PTR(-EINVAL);
> +                       }
> +
> +                       nvbo->comp =3D mmu->kind[nvbo->kind] !=3D nvbo->k=
ind;
> +               } else if (cli->device.info.family >=3D
> NV_DEVICE_INFO_V0_TESLA) {
> +                       nvbo->kind =3D (tile_flags & 0x00007f00) >> 8;
> +                       nvbo->comp =3D (tile_flags & 0x00030000) >> 16;
> +                       if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +                               kfree(nvbo);
> +                               return ERR_PTR(-EINVAL);
> +                       }
> +               } else {
> +                       nvbo->zeta =3D (tile_flags & 0x00000007);
> +               }
> +               nvbo->mode =3D tile_mode;
> +
> +               /* Determine the desirable target GPU page size for the
> buffer. */
> +               for (i =3D 0; i < vmm->page_nr; i++) {
> +                       /* Because we cannot currently allow VMM maps to
> fail
> +                        * during buffer migration, we need to determine
> page
> +                        * size for the buffer up-front, and pre-allocate
> its
> +                        * page tables.
> +                        *
> +                        * Skip page sizes that can't support needed
> domains.
> +                        */
> +                       if (cli->device.info.family >
> NV_DEVICE_INFO_V0_CURIE &&
> +                           (domain & NOUVEAU_GEM_DOMAIN_VRAM) &&
> !vmm->page[i].vram)
> +                               continue;
> +                       if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
> +                           (!vmm->page[i].host || vmm->page[i].shift >
> PAGE_SHIFT))
> +                               continue;
> +
> +                       /* Select this page size if it's the first that
> supports
> +                        * the potential memory domains, or when it's
> compatible
> +                        * with the requested compression settings.
> +                        */
> +                       if (pi < 0 || !nvbo->comp || vmm->page[i].comp)
> +                               pi =3D i;
> +
> +                       /* Stop once the buffer is larger than the curren=
t
> page size. */
> +                       if (*size >=3D 1ULL << vmm->page[i].shift)
> +                               break;
>                 }
>
> -               nvbo->comp =3D mmu->kind[nvbo->kind] !=3D nvbo->kind;
> -       } else
> -       if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_TESLA) {
> -               nvbo->kind =3D (tile_flags & 0x00007f00) >> 8;
> -               nvbo->comp =3D (tile_flags & 0x00030000) >> 16;
> -               if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +               if (WARN_ON(pi < 0)) {
>                         kfree(nvbo);
>                         return ERR_PTR(-EINVAL);
>                 }
> -       } else {
> -               nvbo->zeta =3D (tile_flags & 0x00000007);
> -       }
> -       nvbo->mode =3D tile_mode;
> -       nvbo->contig =3D !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
>
> -       /* Determine the desirable target GPU page size for the buffer. *=
/
> -       for (i =3D 0; i < vmm->page_nr; i++) {
> -               /* Because we cannot currently allow VMM maps to fail
> -                * during buffer migration, we need to determine page
> -                * size for the buffer up-front, and pre-allocate its
> -                * page tables.
> -                *
> -                * Skip page sizes that can't support needed domains.
> -                */
> -               if (cli->device.info.family > NV_DEVICE_INFO_V0_CURIE &&
> -                   (domain & NOUVEAU_GEM_DOMAIN_VRAM) &&
> !vmm->page[i].vram)
> -                       continue;
> -               if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
> -                   (!vmm->page[i].host || vmm->page[i].shift >
> PAGE_SHIFT))
> -                       continue;
> -
> -               /* Select this page size if it's the first that supports
> -                * the potential memory domains, or when it's compatible
> -                * with the requested compression settings.
> -                */
> -               if (pi < 0 || !nvbo->comp || vmm->page[i].comp)
> -                       pi =3D i;
> -
> -               /* Stop once the buffer is larger than the current page
> size. */
> -               if (*size >=3D 1ULL << vmm->page[i].shift)
> -                       break;
> -       }
> +               /* Disable compression if suitable settings couldn't be
> found. */
> +               if (nvbo->comp && !vmm->page[pi].comp) {
> +                       if (mmu->object.oclass >=3D NVIF_CLASS_MMU_GF100)
> +                               nvbo->kind =3D mmu->kind[nvbo->kind];
> +                       nvbo->comp =3D 0;
> +               }
> +               nvbo->page =3D vmm->page[pi].shift;
> +       } else {
> +               /* reject other tile flags when in VM mode. */
> +               if (tile_mode)
> +                       return ERR_PTR(-EINVAL);
> +               if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
> +                       return ERR_PTR(-EINVAL);
>
> -       if (WARN_ON(pi < 0)) {
> -               kfree(nvbo);
> -               return ERR_PTR(-EINVAL);
> -       }
> +               /* Determine the desirable target GPU page size for the
> buffer. */
> +               for (i =3D 0; i < vmm->page_nr; i++) {
> +                       /* Because we cannot currently allow VMM maps to
> fail
> +                        * during buffer migration, we need to determine
> page
> +                        * size for the buffer up-front, and pre-allocate
> its
> +                        * page tables.
> +                        *
> +                        * Skip page sizes that can't support needed
> domains.
> +                        */
> +                       if ((domain & NOUVEAU_GEM_DOMAIN_VRAM) &&
> !vmm->page[i].vram)
> +                               continue;
> +                       if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
> +                           (!vmm->page[i].host || vmm->page[i].shift >
> PAGE_SHIFT))
> +                               continue;
>
> -       /* Disable compression if suitable settings couldn't be found. */
> -       if (nvbo->comp && !vmm->page[pi].comp) {
> -               if (mmu->object.oclass >=3D NVIF_CLASS_MMU_GF100)
> -                       nvbo->kind =3D mmu->kind[nvbo->kind];
> -               nvbo->comp =3D 0;
> +                       if (pi < 0)
> +                               pi =3D i;
> +                       /* Stop once the buffer is larger than the curren=
t
> page size. */
> +                       if (*size >=3D 1ULL << vmm->page[i].shift)
> +                               break;
> +               }
> +               if (WARN_ON(pi < 0)) {
> +                       kfree(nvbo);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +               nvbo->page =3D vmm->page[pi].shift;
>         }
> -       nvbo->page =3D vmm->page[pi].shift;
>
>         nouveau_bo_fixup_align(nvbo, align, size);
>
> @@ -313,6 +346,13 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size,
> int align, u32 domain,
>         nouveau_bo_placement_set(nvbo, domain, 0);
>         INIT_LIST_HEAD(&nvbo->io_reserve_lru);
>
> +       /* At this point we're guaranteed the dma-resv of the
> drm_gem_object is
> +        * initialized. We also can't do it after ttm_bo_init_validate(),
> +        * because during validation we might receive a bo_move() callbac=
k
> where
> +        * we already need to iterate the GEMs GPUVA list.
> +        */
> +       drm_gem_gpuva_init(&nvbo->bo.base);
> +
>         ret =3D ttm_bo_init_validate(nvbo->bo.bdev, &nvbo->bo, type,
>                                    &nvbo->placement, align >> PAGE_SHIFT,
> false,
>                                    sg, robj, nouveau_bo_del_ttm);
> @@ -334,7 +374,7 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int
> align,
>         int ret;
>
>         nvbo =3D nouveau_bo_alloc(cli, &size, &align, domain, tile_mode,
> -                               tile_flags);
> +                               tile_flags, true);
>         if (IS_ERR(nvbo))
>                 return PTR_ERR(nvbo);
>
> @@ -948,6 +988,7 @@ static void nouveau_bo_move_ntfy(struct
> ttm_buffer_object *bo,
>                 list_for_each_entry(vma, &nvbo->vma_list, head) {
>                         nouveau_vma_map(vma, mem);
>                 }
> +               nouveau_uvmm_bo_map_all(nvbo, mem);
>         } else {
>                 list_for_each_entry(vma, &nvbo->vma_list, head) {
>                         ret =3D dma_resv_wait_timeout(bo->base.resv,
> @@ -956,6 +997,7 @@ static void nouveau_bo_move_ntfy(struct
> ttm_buffer_object *bo,
>                         WARN_ON(ret <=3D 0);
>                         nouveau_vma_unmap(vma);
>                 }
> +               nouveau_uvmm_bo_unmap_all(nvbo);
>         }
>
>         if (new_reg)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h
> b/drivers/gpu/drm/nouveau/nouveau_bo.h
> index 774dd93ca76b..cb85207d9e8f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> @@ -73,7 +73,7 @@ extern struct ttm_device_funcs nouveau_bo_driver;
>
>  void nouveau_bo_move_init(struct nouveau_drm *);
>  struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 *size, int
> *align,
> -                                   u32 domain, u32 tile_mode, u32
> tile_flags);
> +                                   u32 domain, u32 tile_mode, u32
> tile_flags, bool internal);
>  int  nouveau_bo_init(struct nouveau_bo *, u64 size, int align, u32 domai=
n,
>                      struct sg_table *sg, struct dma_resv *robj);
>  int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 domai=
n,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index ca3bb8075357..4bde47b5445d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -68,6 +68,9 @@
>  #include "nouveau_platform.h"
>  #include "nouveau_svm.h"
>  #include "nouveau_dmem.h"
> +#include "nouveau_exec.h"
> +#include "nouveau_uvmm.h"
> +#include "nouveau_sched.h"
>
>  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, =
0,
>                         "DRM_UT_CORE",
> @@ -196,6 +199,8 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>         WARN_ON(!list_empty(&cli->worker));
>
>         usif_client_fini(cli);
> +       nouveau_uvmm_fini(&cli->uvmm);
> +       nouveau_sched_entity_fini(&cli->sched_entity);
>         nouveau_vmm_fini(&cli->svm);
>         nouveau_vmm_fini(&cli->vmm);
>         nvif_mmu_dtor(&cli->mmu);
> @@ -301,6 +306,12 @@ nouveau_cli_init(struct nouveau_drm *drm, const char
> *sname,
>         }
>
>         cli->mem =3D &mems[ret];
> +
> +       ret =3D nouveau_sched_entity_init(&cli->sched_entity, &drm->sched=
,
> +                                       drm->sched_wq);
> +       if (ret)
> +               goto done;
> +
>         return 0;
>  done:
>         if (ret)
> @@ -554,10 +565,14 @@ nouveau_drm_device_init(struct drm_device *dev)
>         nvif_parent_ctor(&nouveau_parent, &drm->parent);
>         drm->master.base.object.parent =3D &drm->parent;
>
> -       ret =3D nouveau_cli_init(drm, "DRM-master", &drm->master);
> +       ret =3D nouveau_sched_init(drm);
>         if (ret)
>                 goto fail_alloc;
>
> +       ret =3D nouveau_cli_init(drm, "DRM-master", &drm->master);
> +       if (ret)
> +               goto fail_sched;
> +
>         ret =3D nouveau_cli_init(drm, "DRM", &drm->client);
>         if (ret)
>                 goto fail_master;
> @@ -614,7 +629,6 @@ nouveau_drm_device_init(struct drm_device *dev)
>         }
>
>         return 0;
> -
>  fail_dispinit:
>         nouveau_display_destroy(dev);
>  fail_dispctor:
> @@ -627,6 +641,8 @@ nouveau_drm_device_init(struct drm_device *dev)
>         nouveau_cli_fini(&drm->client);
>  fail_master:
>         nouveau_cli_fini(&drm->master);
> +fail_sched:
> +       nouveau_sched_fini(drm);
>  fail_alloc:
>         nvif_parent_dtor(&drm->parent);
>         kfree(drm);
> @@ -678,6 +694,8 @@ nouveau_drm_device_fini(struct drm_device *dev)
>         }
>         mutex_unlock(&drm->clients_lock);
>
> +       nouveau_sched_fini(drm);
> +
>         nouveau_cli_fini(&drm->client);
>         nouveau_cli_fini(&drm->master);
>         nvif_parent_dtor(&drm->parent);
> @@ -1179,6 +1197,9 @@ nouveau_ioctls[] =3D {
>         DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP,
> nouveau_gem_ioctl_cpu_prep, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI,
> nouveau_gem_ioctl_cpu_fini, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info,
> DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(NOUVEAU_VM_INIT, nouveau_uvmm_ioctl_vm_init,
> DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(NOUVEAU_VM_BIND, nouveau_uvmm_ioctl_vm_bind,
> DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec,
> DRM_RENDER_ALLOW),
>  };
>
>  long
> @@ -1226,6 +1247,8 @@ nouveau_driver_fops =3D {
>  static struct drm_driver
>  driver_stub =3D {
>         .driver_features =3D DRIVER_GEM |
> +                          DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
> +                          DRIVER_GEM_GPUVA |
>                            DRIVER_MODESET |
>                            DRIVER_RENDER,
>         .open =3D nouveau_drm_open,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 20a7f31b9082..ab810b4e028b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -10,8 +10,8 @@
>  #define DRIVER_DATE            "20120801"
>
>  #define DRIVER_MAJOR           1
> -#define DRIVER_MINOR           3
> -#define DRIVER_PATCHLEVEL      1
> +#define DRIVER_MINOR           4
> +#define DRIVER_PATCHLEVEL      0
>
>  /*
>   * 1.1.1:
> @@ -63,7 +63,9 @@ struct platform_device;
>
>  #include "nouveau_fence.h"
>  #include "nouveau_bios.h"
> +#include "nouveau_sched.h"
>  #include "nouveau_vmm.h"
> +#include "nouveau_uvmm.h"
>
>  struct nouveau_drm_tile {
>         struct nouveau_fence *fence;
> @@ -91,6 +93,10 @@ struct nouveau_cli {
>         struct nvif_mmu mmu;
>         struct nouveau_vmm vmm;
>         struct nouveau_vmm svm;
> +       struct nouveau_uvmm uvmm;
> +
> +       struct nouveau_sched_entity sched_entity;
> +
>         const struct nvif_mclass *mem;
>
>         struct list_head head;
> @@ -112,15 +118,60 @@ struct nouveau_cli_work {
>         struct dma_fence_cb cb;
>  };
>
> +static inline struct nouveau_uvmm *
> +nouveau_cli_uvmm(struct nouveau_cli *cli)
> +{
> +       if (!cli || !cli->uvmm.vmm.cli)
> +               return NULL;
> +
> +       return &cli->uvmm;
> +}
> +
> +static inline struct nouveau_uvmm *
> +nouveau_cli_uvmm_locked(struct nouveau_cli *cli)
> +{
> +       struct nouveau_uvmm *uvmm;
> +
> +       mutex_lock(&cli->mutex);
> +       uvmm =3D nouveau_cli_uvmm(cli);
> +       mutex_unlock(&cli->mutex);
> +
> +       return uvmm;
> +}
> +
>  static inline struct nouveau_vmm *
>  nouveau_cli_vmm(struct nouveau_cli *cli)
>  {
> +       struct nouveau_uvmm *uvmm;
> +
> +       uvmm =3D nouveau_cli_uvmm(cli);
> +       if (uvmm)
> +               return &uvmm->vmm;
> +
>         if (cli->svm.cli)
>                 return &cli->svm;
>
>         return &cli->vmm;
>  }
>
> +static inline void
> +__nouveau_cli_uvmm_disable(struct nouveau_cli *cli)
> +{
> +       struct nouveau_uvmm *uvmm;
> +
> +       uvmm =3D nouveau_cli_uvmm(cli);
> +       if (!uvmm)
> +               cli->uvmm.disabled =3D true;
> +}
> +
> +static inline void
> +nouveau_cli_uvmm_disable(struct nouveau_cli *cli)
> +{
> +       mutex_lock(&cli->mutex);
> +       __nouveau_cli_uvmm_disable(cli);
> +       mutex_unlock(&cli->mutex);
> +}
> +
>  void nouveau_cli_work_queue(struct nouveau_cli *, struct dma_fence *,
>                             struct nouveau_cli_work *);
>
> @@ -257,6 +308,10 @@ struct nouveau_drm {
>                 struct mutex lock;
>                 bool component_registered;
>         } audio;
> +
> +       struct drm_gpu_scheduler sched;
> +       struct workqueue_struct *sched_wq;
> +
>  };
>
>  static inline struct nouveau_drm *
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c
> b/drivers/gpu/drm/nouveau/nouveau_exec.c
> new file mode 100644
> index 000000000000..65411ac74237
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -0,0 +1,414 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2022 Red Hat.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES
> OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors:
> + *     Danilo Krummrich <dakr@redhat.com>
> + *
> + */
> +
> +#include <drm/drm_exec.h>
> +
> +#include "nouveau_drv.h"
> +#include "nouveau_gem.h"
> +#include "nouveau_mem.h"
> +#include "nouveau_dma.h"
> +#include "nouveau_exec.h"
> +#include "nouveau_abi16.h"
> +#include "nouveau_chan.h"
> +#include "nouveau_sched.h"
> +#include "nouveau_uvmm.h"
> +
> +/**
> + * DOC: Overview
> + *
> + * Nouveau's VM_BIND / EXEC UAPI consists of three ioctls:
> DRM_NOUVEAU_VM_INIT,
> + * DRM_NOUVEAU_VM_BIND and DRM_NOUVEAU_EXEC.
> + *
> + * In order to use the UAPI firstly a user client must initialize the VA
> space
> + * using the DRM_NOUVEAU_VM_INIT ioctl specifying which region of the VA
> space
> + * should be managed by the kernel and which by the UMD.
> + *
> + * The DRM_NOUVEAU_VM_BIND ioctl provides clients an interface to manage
> the
> + * userspace-managable portion of the VA space. It provides operations t=
o
> map
> + * and unmap memory. Mappings may be flagged as sparse. Sparse mappings
> are not
> + * backed by a GEM object and the kernel will ignore GEM handles provide=
d
> + * alongside a sparse mapping.
> + *
> + * Userspace may request memory backed mappings either within or outside
> of the
> + * bounds (but not crossing those bounds) of a previously mapped sparse
> + * mapping. Subsequently requested memory backed mappings within a spars=
e
> + * mapping will take precedence over the corresponding range of the spar=
se
> + * mapping. If such memory backed mappings are unmapped the kernel will
> make
> + * sure that the corresponding sparse mapping will take their place agai=
n.
> + * Requests to unmap a sparse mapping that still contains memory backed
> mappings
> + * will result in those memory backed mappings being unmapped first.
> + *
> + * Unmap requests are not bound to the range of existing mappings and ca=
n
> even
> + * overlap the bounds of sparse mappings. For such a request the kernel
> will
> + * make sure to unmap all memory backed mappings within the given range,
> + * splitting up memory backed mappings which are only partially containe=
d
> + * within the given range. Unmap requests with the sparse flag set must
> match
> + * the range of a previously mapped sparse mapping exactly though.
> + *
> + * While the kernel generally permits arbitrary sequences and ranges of
> memory
> + * backed mappings being mapped and unmapped, either within a single or
> multiple
> + * VM_BIND ioctl calls, there are some restrictions for sparse mappings.
> + *
> + * The kernel does not permit to:
> + *   - unmap non-existent sparse mappings
> + *   - unmap a sparse mapping and map a new sparse mapping overlapping
> the range
> + *     of the previously unmapped sparse mapping within the same VM_BIND
> ioctl
> + *   - unmap a sparse mapping and map new memory backed mappings
> overlapping the
> + *     range of the previously unmapped sparse mapping within the same
> VM_BIND
> + *     ioctl
> + *
> + * When using the VM_BIND ioctl to request the kernel to map memory to a
> given
> + * virtual address in the GPU's VA space there is no guarantee that the
> actual
> + * mappings are created in the GPU's MMU. If the given memory is swapped
> out
> + * at the time the bind operation is executed the kernel will stash the
> mapping
> + * details into it's internal alloctor and create the actual MMU mapping=
s
> once
> + * the memory is swapped back in. While this is transparent for
> userspace, it is
> + * guaranteed that all the backing memory is swapped back in and all the
> memory
> + * mappings, as requested by userspace previously, are actually mapped
> once the
> + * DRM_NOUVEAU_EXEC ioctl is called to submit an exec job.
> + *
> + * A VM_BIND job can be executed either synchronously or asynchronously.
> If
> + * exectued asynchronously, userspace may provide a list of syncobjs thi=
s
> job
> + * will wait for and/or a list of syncobj the kernel will signal once th=
e
> + * VM_BIND job finished execution. If executed synchronously the ioctl
> will
> + * block until the bind job is finished. For synchronous jobs the kernel
> will
> + * not permit any syncobjs submitted to the kernel.
> + *
> + * To execute a push buffer the UAPI provides the DRM_NOUVEAU_EXEC ioctl=
.
> EXEC
> + * jobs are always executed asynchronously, and, equal to VM_BIND jobs,
> provide
> + * the option to synchronize them with syncobjs.
> + *
> + * Besides that, EXEC jobs can be scheduled for a specified channel to
> execute on.
> + *
> + * Since VM_BIND jobs update the GPU's VA space on job submit, EXEC jobs
> do have
> + * an up to date view of the VA space. However, the actual mappings migh=
t
> still
> + * be pending. Hence, EXEC jobs require to have the particular fences - =
of
> + * the corresponding VM_BIND jobs they depent on - attached to them.
> + */
> +
> +static int
> +nouveau_exec_job_submit(struct nouveau_job *job)
> +{
> +       struct nouveau_exec_job *exec_job =3D to_nouveau_exec_job(job);
> +       struct nouveau_cli *cli =3D exec_job->base.cli;
> +       struct nouveau_uvmm *uvmm =3D nouveau_cli_uvmm(cli);
> +       struct drm_exec *exec =3D &job->exec;
> +       struct drm_gem_object *obj;
> +       unsigned long index;
> +       int ret;
> +
> +       ret =3D nouveau_fence_new(&exec_job->fence);
> +       if (ret)
> +               return ret;
> +
> +       nouveau_uvmm_lock(uvmm);
> +       drm_exec_until_all_locked(exec) {
> +               struct drm_gpuva *va;
> +
> +               drm_gpuva_for_each_va(va, &uvmm->umgr) {
> +                       if (unlikely(va =3D=3D &uvmm->umgr.kernel_alloc_n=
ode))
> +                               continue;
> +
> +                       ret =3D drm_exec_prepare_obj(exec, va->gem.obj, 1=
);
> +                       drm_exec_retry_on_contention(exec);
> +                       if (ret) {
> +                               nouveau_uvmm_unlock(uvmm);
> +                               return ret;
> +                       }
> +               }
> +       }
> +       nouveau_uvmm_unlock(uvmm);
> +
> +       drm_exec_for_each_locked_object(exec, index, obj) {
> +               struct nouveau_bo *nvbo =3D nouveau_gem_object(obj);
> +
> +               ret =3D nouveau_bo_validate(nvbo, true, false);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct dma_fence *
> +nouveau_exec_job_run(struct nouveau_job *job)
> +{
> +       struct nouveau_exec_job *exec_job =3D to_nouveau_exec_job(job);
> +       struct nouveau_channel *chan =3D exec_job->chan;
> +       struct nouveau_fence *fence =3D exec_job->fence;
> +       int i, ret;
> +
> +       ret =3D nouveau_dma_wait(chan, exec_job->push.count + 1, 16);
> +       if (ret) {
> +               NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       for (i =3D 0; i < exec_job->push.count; i++) {
> +               nv50_dma_push(chan, exec_job->push.s[i].va,
> +                             exec_job->push.s[i].va_len);
> +       }
> +
> +       ret =3D nouveau_fence_emit(fence, chan);
> +       if (ret) {
> +               NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n",
> ret);
> +               WIND_RING(chan);
> +               return ERR_PTR(ret);
> +       }
> +
> +       exec_job->fence =3D NULL;
> +
> +       return &fence->base;
> +}
> +
> +static void
> +nouveau_exec_job_free(struct nouveau_job *job)
> +{
> +       struct nouveau_exec_job *exec_job =3D to_nouveau_exec_job(job);
> +
> +       nouveau_job_free(job);
> +
> +       nouveau_fence_unref(&exec_job->fence);
> +       kfree(exec_job->push.s);
> +       kfree(exec_job);
> +}
> +
> +static enum drm_gpu_sched_stat
> +nouveau_exec_job_timeout(struct nouveau_job *job)
> +{
> +       struct nouveau_exec_job *exec_job =3D to_nouveau_exec_job(job);
> +       struct nouveau_channel *chan =3D exec_job->chan;
> +
> +       if (unlikely(!atomic_read(&chan->killed)))
> +               nouveau_channel_kill(chan);
> +
> +       NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
> +                 chan->chid);
> +
> +       nouveau_sched_entity_fini(job->entity);
> +
> +       return DRM_GPU_SCHED_STAT_ENODEV;
> +}
> +
> +static struct nouveau_job_ops nouveau_exec_job_ops =3D {
> +       .submit =3D nouveau_exec_job_submit,
> +       .run =3D nouveau_exec_job_run,
> +       .free =3D nouveau_exec_job_free,
> +       .timeout =3D nouveau_exec_job_timeout,
> +};
> +
> +int
> +nouveau_exec_job_init(struct nouveau_exec_job **pjob,
> +                     struct nouveau_exec_job_args *__args)
> +{
> +       struct nouveau_exec_job *job;
> +       struct nouveau_job_args args =3D {};
> +       int ret;
> +
> +       job =3D *pjob =3D kzalloc(sizeof(*job), GFP_KERNEL);
> +       if (!job)
> +               return -ENOMEM;
> +
> +       job->push.count =3D __args->push.count;
> +       job->push.s =3D kmemdup(__args->push.s,
> +                             sizeof(*__args->push.s) *
> +                             __args->push.count,
> +                             GFP_KERNEL);
> +       if (!job->push.s) {
> +               ret =3D -ENOMEM;
> +               goto err_free_job;
> +       }
> +
> +       job->chan =3D __args->chan;
> +
> +       args.sched_entity =3D __args->sched_entity;
> +       args.file_priv =3D __args->file_priv;
> +
> +       args.in_sync.count =3D __args->in_sync.count;
> +       args.in_sync.s =3D __args->in_sync.s;
> +
> +       args.out_sync.count =3D __args->out_sync.count;
> +       args.out_sync.s =3D __args->out_sync.s;
> +
> +       args.ops =3D &nouveau_exec_job_ops;
> +       args.resv_usage =3D DMA_RESV_USAGE_WRITE;
> +
> +       ret =3D nouveau_job_init(&job->base, &args);
> +       if (ret)
> +               goto err_free_pushs;
> +
> +       return 0;
> +
> +err_free_pushs:
> +       kfree(job->push.s);
> +err_free_job:
> +       kfree(job);
> +       *pjob =3D NULL;
> +
> +       return ret;
> +}
> +
> +static int
> +nouveau_exec(struct nouveau_exec_job_args *args)
> +{
> +       struct nouveau_exec_job *job;
> +       int ret;
> +
> +       ret =3D nouveau_exec_job_init(&job, args);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D nouveau_job_submit(&job->base);
> +       if (ret)
> +               goto err_job_fini;
> +
> +       return 0;
> +
> +err_job_fini:
> +       nouveau_job_fini(&job->base);
> +       return ret;
> +}
> +
> +static int
> +nouveau_exec_ucopy(struct nouveau_exec_job_args *args,
> +                  struct drm_nouveau_exec __user *req)
> +{
> +       struct drm_nouveau_sync **s;
> +       u32 inc =3D req->wait_count;
> +       u64 ins =3D req->wait_ptr;
> +       u32 outc =3D req->sig_count;
> +       u64 outs =3D req->sig_ptr;
> +       u32 pushc =3D req->push_count;
> +       u64 pushs =3D req->push_ptr;
> +       int ret;
> +
> +       args->push.count =3D pushc;
> +       args->push.s =3D u_memcpya(pushs, pushc, sizeof(*args->push.s));
> +       if (IS_ERR(args->push.s))
> +               return PTR_ERR(args->push.s);
> +
> +       if (inc) {
> +               s =3D &args->in_sync.s;
> +
> +               args->in_sync.count =3D inc;
> +               *s =3D u_memcpya(ins, inc, sizeof(**s));
> +               if (IS_ERR(*s)) {
> +                       ret =3D PTR_ERR(*s);
> +                       goto err_free_pushs;
> +               }
> +       }
> +
> +       if (outc) {
> +               s =3D &args->out_sync.s;
> +
> +               args->out_sync.count =3D outc;
> +               *s =3D u_memcpya(outs, outc, sizeof(**s));
> +               if (IS_ERR(*s)) {
> +                       ret =3D PTR_ERR(*s);
> +                       goto err_free_ins;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_free_pushs:
> +       u_free(args->push.s);
> +err_free_ins:
> +       u_free(args->in_sync.s);
> +       return ret;
> +}
> +
> +static void
> +nouveau_exec_ufree(struct nouveau_exec_job_args *args)
> +{
> +       u_free(args->push.s);
> +       u_free(args->in_sync.s);
> +       u_free(args->out_sync.s);
> +}
> +
> +int
> +nouveau_exec_ioctl_exec(struct drm_device *dev,
> +                       void __user *data,
> +                       struct drm_file *file_priv)
> +{
> +       struct nouveau_abi16 *abi16 =3D nouveau_abi16_get(file_priv);
> +       struct nouveau_cli *cli =3D nouveau_cli(file_priv);
> +       struct nouveau_abi16_chan *chan16;
> +       struct nouveau_channel *chan =3D NULL;
> +       struct nouveau_exec_job_args args =3D {};
> +       struct drm_nouveau_exec __user *req =3D data;
> +       int ret =3D 0;
> +
> +       if (unlikely(!abi16))
> +               return -ENOMEM;
> +
> +       /* abi16 locks already */
> +       if (unlikely(!nouveau_cli_uvmm(cli)))
> +               return nouveau_abi16_put(abi16, -ENOSYS);
> +
> +       list_for_each_entry(chan16, &abi16->channels, head) {
> +               if (chan16->chan->chid =3D=3D req->channel) {
> +                       chan =3D chan16->chan;
> +                       break;
> +               }
> +       }
> +
> +       if (!chan)
> +               return nouveau_abi16_put(abi16, -ENOENT);
> +
> +       if (unlikely(atomic_read(&chan->killed)))
> +               return nouveau_abi16_put(abi16, -ENODEV);
> +
> +       if (!chan->dma.ib_max)
> +               return nouveau_abi16_put(abi16, -ENOSYS);
> +
> +       if (unlikely(req->push_count =3D=3D 0))
> +               goto out;
> +
> +       if (unlikely(req->push_count > NOUVEAU_GEM_MAX_PUSH)) {
> +               NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d
> max %d\n",
> +                        req->push_count, NOUVEAU_GEM_MAX_PUSH);
> +               return nouveau_abi16_put(abi16, -EINVAL);
> +       }
> +
> +       ret =3D nouveau_exec_ucopy(&args, req);
> +       if (ret)
> +               goto out;
> +
> +       args.sched_entity =3D &chan16->sched_entity;
> +       args.file_priv =3D file_priv;
> +       args.chan =3D chan;
> +
> +       ret =3D nouveau_exec(&args);
> +       if (ret)
> +               goto out_free_args;
> +
> +out_free_args:
> +       nouveau_exec_ufree(&args);
> +out:
> +       return nouveau_abi16_put(abi16, ret);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h
> b/drivers/gpu/drm/nouveau/nouveau_exec.h
> new file mode 100644
> index 000000000000..3032db27b8d7
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __NOUVEAU_EXEC_H__
> +#define __NOUVEAU_EXEC_H__
> +
> +#include <drm/drm_exec.h>
> +
> +#include "nouveau_drv.h"
> +#include "nouveau_sched.h"
> +
> +struct nouveau_exec_job_args {
> +       struct drm_file *file_priv;
> +       struct nouveau_sched_entity *sched_entity;
> +
> +       struct drm_exec exec;
> +       struct nouveau_channel *chan;
> +
> +       struct {
> +               struct drm_nouveau_sync *s;
> +               u32 count;
> +       } in_sync;
> +
> +       struct {
> +               struct drm_nouveau_sync *s;
> +               u32 count;
> +       } out_sync;
> +
> +       struct {
> +               struct drm_nouveau_exec_push *s;
> +               u32 count;
> +       } push;
> +};
> +
> +struct nouveau_exec_job {
> +       struct nouveau_job base;
> +       struct nouveau_fence *fence;
> +       struct nouveau_channel *chan;
> +
> +       struct {
> +               struct drm_nouveau_exec_push *s;
> +               u32 count;
> +       } push;
> +};
> +
> +#define to_nouveau_exec_job(job)               \
> +               container_of((job), struct nouveau_exec_job, base)
> +
> +int nouveau_exec_job_init(struct nouveau_exec_job **job,
> +                         struct nouveau_exec_job_args *args);
> +
> +int nouveau_exec_ioctl_exec(struct drm_device *dev, void __user *data,
> +                           struct drm_file *file_priv);
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 9c8d1b911a01..3b0fbaedfb57 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -120,7 +120,11 @@ nouveau_gem_object_open(struct drm_gem_object *gem,
> struct drm_file *file_priv)
>                 goto out;
>         }
>
> -       ret =3D nouveau_vma_new(nvbo, vmm, &vma);
> +       /* only create a VMA on binding */
> +       if (!nouveau_cli_uvmm(cli))
> +               ret =3D nouveau_vma_new(nvbo, vmm, &vma);
> +       else
> +               ret =3D 0;
>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>  out:
> @@ -187,6 +191,9 @@ nouveau_gem_object_close(struct drm_gem_object *gem,
> struct drm_file *file_priv)
>         if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
>                 return;
>
> +       if (nouveau_cli_uvmm(cli))
> +               return;
> +
>         ret =3D ttm_bo_reserve(&nvbo->bo, false, false, NULL);
>         if (ret)
>                 return;
> @@ -231,7 +238,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, in=
t
> align, uint32_t domain,
>                 domain |=3D NOUVEAU_GEM_DOMAIN_CPU;
>
>         nvbo =3D nouveau_bo_alloc(cli, &size, &align, domain, tile_mode,
> -                               tile_flags);
> +                               tile_flags, false);
>         if (IS_ERR(nvbo))
>                 return PTR_ERR(nvbo);
>
> @@ -279,13 +286,15 @@ nouveau_gem_info(struct drm_file *file_priv, struct
> drm_gem_object *gem,
>         else
>                 rep->domain =3D NOUVEAU_GEM_DOMAIN_VRAM;
>         rep->offset =3D nvbo->offset;
> -       if (vmm->vmm.object.oclass >=3D NVIF_CLASS_VMM_NV50) {
> +       if (vmm->vmm.object.oclass >=3D NVIF_CLASS_VMM_NV50 &&
> +           !nouveau_cli_uvmm(cli)) {
>                 vma =3D nouveau_vma_find(nvbo, vmm);
>                 if (!vma)
>                         return -EINVAL;
>
>                 rep->offset =3D vma->addr;
> -       }
> +       } else
> +               rep->offset =3D 0;
>
>         rep->size =3D nvbo->bo.base.size;
>         rep->map_handle =3D
> drm_vma_node_offset_addr(&nvbo->bo.base.vma_node);
> @@ -310,6 +319,11 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void
> *data,
>         struct nouveau_bo *nvbo =3D NULL;
>         int ret =3D 0;
>
> +       /* If uvmm wasn't initialized until now disable it completely to
> prevent
> +        * userspace from mixing up UAPIs.
> +        */
> +       nouveau_cli_uvmm_disable(cli);
> +
>         ret =3D nouveau_gem_new(cli, req->info.size, req->align,
>                               req->info.domain, req->info.tile_mode,
>                               req->info.tile_flags, &nvbo);
> @@ -721,6 +735,9 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, voi=
d
> *data,
>         if (unlikely(!abi16))
>                 return -ENOMEM;
>
> +       if (unlikely(nouveau_cli_uvmm(cli)))
> +               return -ENOSYS;
> +
>         list_for_each_entry(temp, &abi16->channels, head) {
>                 if (temp->chan->chid =3D=3D req->channel) {
>                         chan =3D temp->chan;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h
> b/drivers/gpu/drm/nouveau/nouveau_mem.h
> index 76c86d8bb01e..5365a3d3a17f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
> @@ -35,4 +35,9 @@ int nouveau_mem_vram(struct ttm_resource *, bool contig=
,
> u8 page);
>  int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
>  void nouveau_mem_fini(struct nouveau_mem *);
>  int nouveau_mem_map(struct nouveau_mem *, struct nvif_vmm *, struct
> nvif_vma *);
> +int
> +nouveau_mem_map_fixed(struct nouveau_mem *mem,
> +                     struct nvif_vmm *vmm,
> +                     u8 kind, u64 addr,
> +                     u64 offset, u64 range);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c
> b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index f42c2b1b0363..6a883b9a799a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -50,7 +50,7 @@ struct drm_gem_object
> *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>
>         dma_resv_lock(robj, NULL);
>         nvbo =3D nouveau_bo_alloc(&drm->client, &size, &align,
> -                               NOUVEAU_GEM_DOMAIN_GART, 0, 0);
> +                               NOUVEAU_GEM_DOMAIN_GART, 0, 0, true);
>         if (IS_ERR(nvbo)) {
>                 obj =3D ERR_CAST(nvbo);
>                 goto unlock;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> new file mode 100644
> index 000000000000..23f9cae19f21
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -0,0 +1,462 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2022 Red Hat.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES
> OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors:
> + *     Danilo Krummrich <dakr@redhat.com>
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <drm/gpu_scheduler.h>
> +#include <drm/drm_syncobj.h>
> +
> +#include "nouveau_drv.h"
> +#include "nouveau_gem.h"
> +#include "nouveau_mem.h"
> +#include "nouveau_dma.h"
> +#include "nouveau_exec.h"
> +#include "nouveau_abi16.h"
> +#include "nouveau_sched.h"
> +
> +/* FIXME
> + *
> + * We want to make sure that jobs currently executing can't be deferred =
by
> + * other jobs competing for the hardware. Otherwise we might end up with
> job
> + * timeouts just because of too many clients submitting too many jobs. W=
e
> don't
> + * want jobs to time out because of system load, but because of the job
> being
> + * too bulky.
> + *
> + * For now allow for up to 16 concurrent jobs in flight until we know ho=
w
> many
> + * rings the hardware can process in parallel.
> + */
> +#define NOUVEAU_SCHED_HW_SUBMISSIONS           16
> +#define NOUVEAU_SCHED_JOB_TIMEOUT_MS           10000
> +
> +int
> +nouveau_job_init(struct nouveau_job *job,
> +                struct nouveau_job_args *args)
> +{
> +       struct nouveau_sched_entity *entity =3D args->sched_entity;
> +       int ret;
> +
> +       job->file_priv =3D args->file_priv;
> +       job->cli =3D nouveau_cli(args->file_priv);
> +       job->entity =3D entity;
> +
> +       job->sync =3D args->sync;
> +       job->resv_usage =3D args->resv_usage;
> +
> +       job->ops =3D args->ops;
> +
> +       job->in_sync.count =3D args->in_sync.count;
> +       if (job->in_sync.count) {
> +               if (job->sync)
> +                       return -EINVAL;
> +
> +               job->in_sync.data =3D kmemdup(args->in_sync.s,
> +                                        sizeof(*args->in_sync.s) *
> +                                        args->in_sync.count,
> +                                        GFP_KERNEL);
> +               if (!job->in_sync.data)
> +                       return -ENOMEM;
> +       }
> +
> +       job->out_sync.count =3D args->out_sync.count;
> +       if (job->out_sync.count) {
> +               if (job->sync) {
> +                       ret =3D -EINVAL;
> +                       goto err_free_in_sync;
> +               }
> +
> +               job->out_sync.data =3D kmemdup(args->out_sync.s,
> +                                         sizeof(*args->out_sync.s) *
> +                                         args->out_sync.count,
> +                                         GFP_KERNEL);
> +               if (!job->out_sync.data) {
> +                       ret =3D -ENOMEM;
> +                       goto err_free_in_sync;
> +               }
> +
> +               job->out_sync.objs =3D kcalloc(job->out_sync.count,
> +                                            sizeof(*job->out_sync.objs),
> +                                            GFP_KERNEL);
> +               if (!job->out_sync.objs) {
> +                       ret =3D -ENOMEM;
> +                       goto err_free_out_sync;
> +               }
> +
> +               job->out_sync.chains =3D kcalloc(job->out_sync.count,
> +
> sizeof(*job->out_sync.chains),
> +                                              GFP_KERNEL);
> +               if (!job->out_sync.chains) {
> +                       ret =3D -ENOMEM;
> +                       goto err_free_objs;
> +               }
> +
> +       }
> +
> +       ret =3D drm_sched_job_init(&job->base, &entity->base, NULL);
> +       if (ret)
> +               goto err_free_chains;
> +
> +       job->state =3D NOUVEAU_JOB_INITIALIZED;
> +
> +       return 0;
> +
> +err_free_chains:
> +       kfree(job->out_sync.chains);
> +err_free_objs:
> +       kfree(job->out_sync.objs);
> +err_free_out_sync:
> +       kfree(job->out_sync.data);
> +err_free_in_sync:
> +       kfree(job->in_sync.data);
> +return ret;
> +}
> +
> +void
> +nouveau_job_free(struct nouveau_job *job)
> +{
> +       kfree(job->in_sync.data);
> +       kfree(job->out_sync.data);
> +       kfree(job->out_sync.objs);
> +       kfree(job->out_sync.chains);
> +}
> +
> +void nouveau_job_fini(struct nouveau_job *job)
> +{
> +       dma_fence_put(job->done_fence);
> +       drm_sched_job_cleanup(&job->base);
> +       job->ops->free(job);
> +}
> +
> +static int
> +sync_find_fence(struct nouveau_job *job,
> +               struct drm_nouveau_sync *sync,
> +               struct dma_fence **fence)
> +{
> +       u32 stype =3D sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> +       u64 point =3D 0;
> +       int ret;
> +
> +       if (stype !=3D DRM_NOUVEAU_SYNC_SYNCOBJ &&
> +           stype !=3D DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> +               return -EOPNOTSUPP;
> +
> +       if (stype =3D=3D DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> +               point =3D sync->timeline_value;
> +
> +       ret =3D drm_syncobj_find_fence(job->file_priv,
> +                                    sync->handle, point,
> +                                    sync->flags, fence);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_job_add_deps(struct nouveau_job *job)
> +{
> +       struct dma_fence *in_fence =3D NULL;
> +       int ret, i;
> +
> +       for (i =3D 0; i < job->in_sync.count; i++) {
> +               struct drm_nouveau_sync *sync =3D &job->in_sync.data[i];
> +
> +               ret =3D sync_find_fence(job, sync, &in_fence);
> +               if (ret) {
> +                       NV_PRINTK(warn, job->cli,
> +                                 "Failed to find syncobj (-> in):
> handle=3D%d\n",
> +                                 sync->handle);
> +                       return ret;
> +               }
> +
> +               ret =3D drm_sched_job_add_dependency(&job->base, in_fence=
);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void
> +nouveau_job_fence_attach_cleanup(struct nouveau_job *job)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < job->out_sync.count; i++) {
> +               struct drm_syncobj *obj =3D job->out_sync.objs[i];
> +               struct dma_fence_chain *chain =3D job->out_sync.chains[i]=
;
> +
> +               if (obj)
> +                       drm_syncobj_put(obj);
> +
> +               if (chain)
> +                       dma_fence_chain_free(chain);
> +       }
> +}
> +
> +static int
> +nouveau_job_fence_attach_prepare(struct nouveau_job *job)
> +{
> +       int i, ret;
> +
> +       for (i =3D 0; i < job->out_sync.count; i++) {
> +               struct drm_nouveau_sync *sync =3D &job->out_sync.data[i];
> +               struct drm_syncobj **pobj =3D &job->out_sync.objs[i];
> +               struct dma_fence_chain **pchain =3D &job->out_sync.chains=
[i];
> +               u32 stype =3D sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> +
> +               if (stype !=3D DRM_NOUVEAU_SYNC_SYNCOBJ &&
> +                   stype !=3D DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
> +                       ret =3D -EINVAL;
> +                       goto err_sync_cleanup;
> +               }
> +
> +               *pobj =3D drm_syncobj_find(job->file_priv, sync->handle);
> +               if (!*pobj) {
> +                       NV_PRINTK(warn, job->cli,
> +                                 "Failed to find syncobj (-> out):
> handle=3D%d\n",
> +                                 sync->handle);
> +                       ret =3D -ENOENT;
> +                       goto err_sync_cleanup;
> +               }
> +
> +               if (stype =3D=3D DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
> +                       *pchain =3D dma_fence_chain_alloc();
> +                       if (!*pchain) {
> +                               ret =3D -ENOMEM;
> +                               goto err_sync_cleanup;
> +                       }
> +               }
> +       }
> +
> +       return 0;
> +
> +err_sync_cleanup:
> +       nouveau_job_fence_attach_cleanup(job);
> +       return ret;
> +}
> +
> +static void
> +nouveau_job_fence_attach(struct nouveau_job *job)
> +{
> +       struct dma_fence *fence =3D job->done_fence;
> +       int i;
> +
> +       for (i =3D 0; i < job->out_sync.count; i++) {
> +               struct drm_nouveau_sync *sync =3D &job->out_sync.data[i];
> +               struct drm_syncobj **pobj =3D &job->out_sync.objs[i];
> +               struct dma_fence_chain **pchain =3D &job->out_sync.chains=
[i];
> +               u32 stype =3D sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> +
> +               if (stype =3D=3D DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
> +                       drm_syncobj_add_point(*pobj, *pchain, fence,
> +                                             sync->timeline_value);
> +               } else {
> +                       drm_syncobj_replace_fence(*pobj, fence);
> +               }
> +
> +               drm_syncobj_put(*pobj);
> +               *pobj =3D NULL;
> +               *pchain =3D NULL;
> +       }
> +}
> +
> +static void
> +nouveau_job_resv_add_fence(struct nouveau_job *job)
> +{
> +       struct drm_exec *exec =3D &job->exec;
> +       struct drm_gem_object *obj;
> +       unsigned long index;
> +
> +       drm_exec_for_each_locked_object(exec, index, obj) {
> +               struct dma_resv *resv =3D obj->resv;
> +
> +               dma_resv_add_fence(resv, job->done_fence, job->resv_usage=
);
> +       }
> +}
> +
> +int
> +nouveau_job_submit(struct nouveau_job *job)
> +{
> +       struct nouveau_sched_entity *entity =3D
> to_nouveau_sched_entity(job->base.entity);
> +       struct dma_fence *done_fence =3D NULL;
> +       int ret;
> +
> +       ret =3D nouveau_job_add_deps(job);
> +       if (ret)
> +               goto err;
> +
> +       ret =3D nouveau_job_fence_attach_prepare(job);
> +       if (ret)
> +               goto err;
> +
> +       /* Make sure the job appears on the sched_entity's queue in the
> same
> +        * order as it was submitted.
> +        */
> +       mutex_lock(&entity->mutex);
> +
> +       drm_exec_init(&job->exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> +                                 DRM_EXEC_IGNORE_DUPLICATES);
> +
> +       /* Guarantee jobs we won't fail after the submit() callback
> +        * returned successfully.
> +        */
> +       if (job->ops->submit) {
> +               ret =3D job->ops->submit(job);
> +               if (ret)
> +                       goto err_cleanup;
> +       }
> +
> +       drm_sched_job_arm(&job->base);
> +       job->done_fence =3D dma_fence_get(&job->base.s_fence->finished);
> +       if (job->sync)
> +               done_fence =3D dma_fence_get(job->done_fence);
> +
> +       nouveau_job_fence_attach(job);
> +       nouveau_job_resv_add_fence(job);
> +
> +       drm_exec_fini(&job->exec);
> +
> +       /* Set job state before pushing the job to the scheduler,
> +        * such that we do not overwrite the job state set in run().
> +        */
> +       job->state =3D NOUVEAU_JOB_SUBMIT_SUCCESS;
> +
> +       drm_sched_entity_push_job(&job->base);
> +
> +       mutex_unlock(&entity->mutex);
> +
> +       if (done_fence) {
> +               dma_fence_wait(done_fence, true);
> +               dma_fence_put(done_fence);
> +       }
> +
> +       return 0;
> +
> +err_cleanup:
> +       drm_exec_fini(&job->exec);
> +       mutex_unlock(&entity->mutex);
> +       nouveau_job_fence_attach_cleanup(job);
> +err:
> +       job->state =3D NOUVEAU_JOB_SUBMIT_FAILED;
> +       return ret;
> +}
> +
> +bool
> +nouveau_sched_entity_qwork(struct nouveau_sched_entity *entity,
> +                          struct work_struct *work)
> +{
> +       return queue_work(entity->sched_wq, work);
> +}
> +
> +static struct dma_fence *
> +nouveau_job_run(struct nouveau_job *job)
> +{
> +       struct dma_fence *fence;
> +
> +       fence =3D job->ops->run(job);
> +       if (unlikely(IS_ERR(fence)))
> +               job->state =3D NOUVEAU_JOB_RUN_FAILED;
> +       else
> +               job->state =3D NOUVEAU_JOB_RUN_SUCCESS;
> +
> +       return fence;
> +}
> +
> +static struct dma_fence *
> +nouveau_sched_run_job(struct drm_sched_job *sched_job)
> +{
> +       struct nouveau_job *job =3D to_nouveau_job(sched_job);
> +
> +       return nouveau_job_run(job);
> +}
> +
> +static enum drm_gpu_sched_stat
> +nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
> +{
> +       struct nouveau_job *job =3D to_nouveau_job(sched_job);
> +
> +       NV_PRINTK(warn, job->cli, "Job timed out.\n");
> +
> +       if (job->ops->timeout)
> +               return job->ops->timeout(job);
> +
> +       return DRM_GPU_SCHED_STAT_ENODEV;
> +}
> +
> +static void
> +nouveau_sched_free_job(struct drm_sched_job *sched_job)
> +{
> +       struct nouveau_job *job =3D to_nouveau_job(sched_job);
> +
> +       nouveau_job_fini(job);
> +}
> +
> +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> +                             struct drm_gpu_scheduler *sched,
> +                             struct workqueue_struct *sched_wq)
> +{
> +       mutex_init(&entity->mutex);
> +       spin_lock_init(&entity->job.list.lock);
> +       INIT_LIST_HEAD(&entity->job.list.head);
> +       init_waitqueue_head(&entity->job.wq);
> +
> +       entity->sched_wq =3D sched_wq;
> +       return drm_sched_entity_init(&entity->base,
> +                                    DRM_SCHED_PRIORITY_NORMAL,
> +                                    &sched, 1, NULL);
> +}
> +
> +void
> +nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
> +{
> +       drm_sched_entity_destroy(&entity->base);
> +}
> +
> +static const struct drm_sched_backend_ops nouveau_sched_ops =3D {
> +       .run_job =3D nouveau_sched_run_job,
> +       .timedout_job =3D nouveau_sched_timedout_job,
> +       .free_job =3D nouveau_sched_free_job,
> +};
> +
> +int nouveau_sched_init(struct nouveau_drm *drm)
> +{
> +       struct drm_gpu_scheduler *sched =3D &drm->sched;
> +       long job_hang_limit =3D
> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> +
> +       drm->sched_wq =3D create_singlethread_workqueue("nouveau_sched_wq=
");
> +       if (!drm->sched_wq)
> +               return ENOMEM;
> +
> +       return drm_sched_init(sched, &nouveau_sched_ops,
> +                             NOUVEAU_SCHED_HW_SUBMISSIONS, 0,
> job_hang_limit,
> +                             NULL, NULL, "nouveau_sched", drm->dev->dev)=
;
> +}
> +
> +void nouveau_sched_fini(struct nouveau_drm *drm)
> +{
> +       destroy_workqueue(drm->sched_wq);
> +       drm_sched_fini(&drm->sched);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h
> b/drivers/gpu/drm/nouveau/nouveau_sched.h
> new file mode 100644
> index 000000000000..8b27b5f3dd8d
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef NOUVEAU_SCHED_H
> +#define NOUVEAU_SCHED_H
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_exec.h>
> +#include <drm/gpu_scheduler.h>
> +
> +#include "nouveau_drv.h"
> +
> +#define to_nouveau_job(sched_job)              \
> +               container_of((sched_job), struct nouveau_job, base)
> +
> +struct nouveau_job_ops;
> +
> +enum nouveau_job_state {
> +       NOUVEAU_JOB_UNINITIALIZED =3D 0,
> +       NOUVEAU_JOB_INITIALIZED,
> +       NOUVEAU_JOB_SUBMIT_SUCCESS,
> +       NOUVEAU_JOB_SUBMIT_FAILED,
> +       NOUVEAU_JOB_RUN_SUCCESS,
> +       NOUVEAU_JOB_RUN_FAILED,
> +};
> +
> +struct nouveau_job_args {
> +       struct drm_file *file_priv;
> +       struct nouveau_sched_entity *sched_entity;
> +
> +       enum dma_resv_usage resv_usage;
> +       bool sync;
> +
> +       struct {
> +               struct drm_nouveau_sync *s;
> +               u32 count;
> +       } in_sync;
> +
> +       struct {
> +               struct drm_nouveau_sync *s;
> +               u32 count;
> +       } out_sync;
> +
> +       struct nouveau_job_ops *ops;
> +};
> +
> +struct nouveau_job {
> +       struct drm_sched_job base;
> +
> +       enum nouveau_job_state state;
> +
> +       struct nouveau_sched_entity *entity;
> +
> +       struct drm_file *file_priv;
> +       struct nouveau_cli *cli;
> +
> +       struct drm_exec exec;
> +       enum dma_resv_usage resv_usage;
> +       struct dma_fence *done_fence;
> +
> +       bool sync;
> +
> +       struct {
> +               struct drm_nouveau_sync *data;
> +               u32 count;
> +       } in_sync;
> +
> +       struct {
> +               struct drm_nouveau_sync *data;
> +               struct drm_syncobj **objs;
> +               struct dma_fence_chain **chains;
> +               u32 count;
> +       } out_sync;
> +
> +       struct nouveau_job_ops {
> +               int (*submit)(struct nouveau_job *);
> +               struct dma_fence *(*run)(struct nouveau_job *);
> +               void (*free)(struct nouveau_job *);
> +               enum drm_gpu_sched_stat (*timeout)(struct nouveau_job *);
> +       } *ops;
> +};
> +
> +int nouveau_job_ucopy_syncs(struct nouveau_job_args *args,
> +                           u32 inc, u64 ins,
> +                           u32 outc, u64 outs);
> +
> +int nouveau_job_init(struct nouveau_job *job,
> +                    struct nouveau_job_args *args);
> +void nouveau_job_free(struct nouveau_job *job);
> +
> +int nouveau_job_submit(struct nouveau_job *job);
> +void nouveau_job_fini(struct nouveau_job *job);
> +
> +#define to_nouveau_sched_entity(entity)                \
> +               container_of((entity), struct nouveau_sched_entity, base)
> +
> +struct nouveau_sched_entity {
> +       struct drm_sched_entity base;
> +       struct mutex mutex;
> +
> +       struct workqueue_struct *sched_wq;
> +
> +       struct {
> +               struct {
> +                       struct list_head head;
> +                       spinlock_t lock;
> +               } list;
> +               struct wait_queue_head wq;
> +       } job;
> +};
> +
> +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> +                             struct drm_gpu_scheduler *sched,
> +                             struct workqueue_struct *sched_wq);
> +void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
> +
> +bool nouveau_sched_entity_qwork(struct nouveau_sched_entity *entity,
> +                               struct work_struct *work);
> +
> +int nouveau_sched_init(struct nouveau_drm *drm);
> +void nouveau_sched_fini(struct nouveau_drm *drm);
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> new file mode 100644
> index 000000000000..7b444ea5f6d6
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -0,0 +1,1970 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2022 Red Hat.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES
> OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors:
> + *     Danilo Krummrich <dakr@redhat.com>
> + *
> + */
> +
> +/*
> + * Locking:
> + *
> + * The uvmm mutex protects any operations on the GPU VA space provided b=
y
> the
> + * DRM GPU VA manager.
> + *
> + * The GEMs dma_resv lock protects the GEMs GPUVA list, hence link/unlin=
k
> of a
> + * mapping to it's backing GEM must be performed under this lock.
> + *
> + * Actual map/unmap operations within the fence signalling critical path
> are
> + * protected by installing DMA fences to the corresponding GEMs DMA
> + * reservations, such that concurrent BO moves, which itself walk the
> GEMs GPUVA
> + * list in order to map/unmap it's entries, can't occur concurrently.
> + *
> + * Accessing the DRM_GPUVA_INVALIDATED flag doesn't need any separate
> + * protection, since there are no accesses other than from BO move
> callbacks
> + * and from the fence signalling critical path, which are already
> protected by
> + * the corresponding GEMs DMA reservation fence.
> + */
> +
> +#include "nouveau_drv.h"
> +#include "nouveau_gem.h"
> +#include "nouveau_mem.h"
> +#include "nouveau_uvmm.h"
> +
> +#include <nvif/vmm.h>
> +#include <nvif/mem.h>
> +
> +#include <nvif/class.h>
> +#include <nvif/if000c.h>
> +#include <nvif/if900d.h>
> +
> +#define NOUVEAU_VA_SPACE_BITS          47 /* FIXME */
> +#define NOUVEAU_VA_SPACE_START         0x0
> +#define NOUVEAU_VA_SPACE_END           (1ULL << NOUVEAU_VA_SPACE_BITS)
> +
> +#define list_last_op(_ops) list_last_entry(_ops, struct bind_job_op,
> entry)
> +#define list_prev_op(_op) list_prev_entry(_op, entry)
> +#define list_for_each_op(_op, _ops) list_for_each_entry(_op, _ops, entry=
)
> +#define list_for_each_op_from_reverse(_op, _ops) \
> +       list_for_each_entry_from_reverse(_op, _ops, entry)
> +#define list_for_each_op_safe(_op, _n, _ops)
> list_for_each_entry_safe(_op, _n, _ops, entry)
> +
> +enum vm_bind_op {
> +       OP_MAP =3D DRM_NOUVEAU_VM_BIND_OP_MAP,
> +       OP_UNMAP =3D DRM_NOUVEAU_VM_BIND_OP_UNMAP,
> +       OP_MAP_SPARSE,
> +       OP_UNMAP_SPARSE,
> +};
> +
> +struct nouveau_uvma_prealloc {
> +       struct nouveau_uvma *map;
> +       struct nouveau_uvma *prev;
> +       struct nouveau_uvma *next;
> +};
> +
> +struct bind_job_op {
> +       struct list_head entry;
> +
> +       enum vm_bind_op op;
> +       u32 flags;
> +
> +       struct {
> +               u64 addr;
> +               u64 range;
> +       } va;
> +
> +       struct {
> +               u32 handle;
> +               u64 offset;
> +               struct drm_gem_object *obj;
> +       } gem;
> +
> +       struct nouveau_uvma_region *reg;
> +       struct nouveau_uvma_prealloc new;
> +       struct drm_gpuva_ops *ops;
> +};
> +
> +struct uvmm_map_args {
> +       struct nouveau_uvma_region *region;
> +       u64 addr;
> +       u64 range;
> +       u8 kind;
> +};
> +
> +static int
> +nouveau_uvmm_vmm_sparse_ref(struct nouveau_uvmm *uvmm,
> +                           u64 addr, u64 range)
> +{
> +       struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> +
> +       return nvif_vmm_raw_sparse(vmm, addr, range, true);
> +}
> +
> +static int
> +nouveau_uvmm_vmm_sparse_unref(struct nouveau_uvmm *uvmm,
> +                             u64 addr, u64 range)
> +{
> +       struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> +
> +       return nvif_vmm_raw_sparse(vmm, addr, range, false);
> +}
> +
> +static int
> +nouveau_uvmm_vmm_get(struct nouveau_uvmm *uvmm,
> +                    u64 addr, u64 range)
> +{
> +       struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> +
> +       return nvif_vmm_raw_get(vmm, addr, range, PAGE_SHIFT);
> +}
> +
> +static int
> +nouveau_uvmm_vmm_put(struct nouveau_uvmm *uvmm,
> +                    u64 addr, u64 range)
> +{
> +       struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> +
> +       return nvif_vmm_raw_put(vmm, addr, range, PAGE_SHIFT);
> +}
> +
> +static int
> +nouveau_uvmm_vmm_unmap(struct nouveau_uvmm *uvmm,
> +                      u64 addr, u64 range, bool sparse)
> +{
> +       struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> +
> +       return nvif_vmm_raw_unmap(vmm, addr, range, PAGE_SHIFT, sparse);
> +}
> +
> +static int
> +nouveau_uvmm_vmm_map(struct nouveau_uvmm *uvmm,
> +                    u64 addr, u64 range,
> +                    u64 bo_offset, u8 kind,
> +                    struct nouveau_mem *mem)
> +{
> +       struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> +       union {
> +               struct gf100_vmm_map_v0 gf100;
> +       } args;
> +       u32 argc =3D 0;
> +
> +       switch (vmm->object.oclass) {
> +       case NVIF_CLASS_VMM_GF100:
> +       case NVIF_CLASS_VMM_GM200:
> +       case NVIF_CLASS_VMM_GP100:
> +               args.gf100.version =3D 0;
> +               if (mem->mem.type & NVIF_MEM_VRAM)
> +                       args.gf100.vol =3D 0;
> +               else
> +                       args.gf100.vol =3D 1;
> +               args.gf100.ro =3D 0;
> +               args.gf100.priv =3D 0;
> +               args.gf100.kind =3D kind;
> +               argc =3D sizeof(args.gf100);
> +               break;
> +       default:
> +               WARN_ON(1);
> +               return -ENOSYS;
> +       }
> +
> +       return nvif_vmm_raw_map(vmm, addr, range, PAGE_SHIFT,
> +                               &args, argc,
> +                               &mem->mem, bo_offset);
> +}
> +
> +static int
> +nouveau_uvma_region_sparse_unref(struct nouveau_uvma_region *reg)
> +{
> +       u64 addr =3D reg->va.addr;
> +       u64 range =3D reg->va.range;
> +
> +       return nouveau_uvmm_vmm_sparse_unref(reg->uvmm, addr, range);
> +}
> +
> +static int
> +nouveau_uvma_vmm_put(struct nouveau_uvma *uvma)
> +{
> +       u64 addr =3D uvma->va.va.addr;
> +       u64 range =3D uvma->va.va.range;
> +
> +       return nouveau_uvmm_vmm_put(uvma->uvmm, addr, range);
> +}
> +
> +static int
> +nouveau_uvma_map(struct nouveau_uvma *uvma,
> +                struct nouveau_mem *mem)
> +{
> +       u64 addr =3D uvma->va.va.addr;
> +       u64 offset =3D uvma->va.gem.offset;
> +       u64 range =3D uvma->va.va.range;
> +
> +       return nouveau_uvmm_vmm_map(uvma->uvmm, addr, range,
> +                                   offset, uvma->kind, mem);
> +}
> +
> +static int
> +nouveau_uvma_unmap(struct nouveau_uvma *uvma)
> +{
> +       u64 addr =3D uvma->va.va.addr;
> +       u64 range =3D uvma->va.va.range;
> +       bool sparse =3D !!uvma->region;
> +
> +       if (drm_gpuva_invalidated(&uvma->va))
> +               return 0;
> +
> +       return nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
> +}
> +
> +static int
> +nouveau_uvma_alloc(struct nouveau_uvma **puvma)
> +{
> +       *puvma =3D kzalloc(sizeof(**puvma), GFP_KERNEL);
> +       if (!*puvma)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static void
> +nouveau_uvma_free(struct nouveau_uvma *uvma)
> +{
> +       kfree(uvma);
> +}
> +
> +static int
> +__nouveau_uvma_insert(struct nouveau_uvmm *uvmm,
> +                     struct nouveau_uvma *uvma)
> +{
> +       return drm_gpuva_insert(&uvmm->umgr, &uvma->va);
> +}
> +
> +static int
> +nouveau_uvma_insert(struct nouveau_uvmm *uvmm,
> +                   struct nouveau_uvma *uvma,
> +                   struct nouveau_uvma_region *region,
> +                   struct drm_gem_object *obj,
> +                   u64 bo_offset, u64 addr,
> +                   u64 range, u8 kind)
> +{
> +       int ret;
> +
> +       uvma->uvmm =3D uvmm;
> +       uvma->region =3D region;
> +       uvma->kind =3D kind;
> +       uvma->va.va.addr =3D addr;
> +       uvma->va.va.range =3D range;
> +       uvma->va.gem.offset =3D bo_offset;
> +       uvma->va.gem.obj =3D obj;
> +
> +       ret =3D __nouveau_uvma_insert(uvmm, uvma);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static void
> +nouveau_uvma_remove(struct nouveau_uvma *uvma)
> +{
> +       drm_gpuva_remove(&uvma->va);
> +}
> +
> +static void
> +nouveau_uvma_gem_get(struct nouveau_uvma *uvma)
> +{
> +       drm_gem_object_get(uvma->va.gem.obj);
> +}
> +
> +static void
> +nouveau_uvma_gem_put(struct nouveau_uvma *uvma)
> +{
> +       drm_gem_object_put(uvma->va.gem.obj);
> +}
> +
> +static int
> +nouveau_uvma_region_alloc(struct nouveau_uvma_region **preg)
> +{
> +       *preg =3D kzalloc(sizeof(**preg), GFP_KERNEL);
> +       if (!*preg)
> +               return -ENOMEM;
> +
> +       kref_init(&(*preg)->kref);
> +
> +       return 0;
> +}
> +
> +static void
> +nouveau_uvma_region_free(struct kref *kref)
> +{
> +       struct nouveau_uvma_region *reg =3D
> +               container_of(kref, struct nouveau_uvma_region, kref);
> +
> +       kfree(reg);
> +}
> +
> +static void
> +nouveau_uvma_region_get(struct nouveau_uvma_region *reg)
> +{
> +       kref_get(&reg->kref);
> +}
> +
> +static void
> +nouveau_uvma_region_put(struct nouveau_uvma_region *reg)
> +{
> +       kref_put(&reg->kref, nouveau_uvma_region_free);
> +}
> +
> +static int
> +__nouveau_uvma_region_insert(struct nouveau_uvmm *uvmm,
> +                            struct nouveau_uvma_region *reg)
> +{
> +       u64 addr =3D reg->va.addr;
> +       u64 range =3D reg->va.range;
> +       u64 last =3D addr + range - 1;
> +       MA_STATE(mas, &uvmm->region_mt, addr, addr);
> +
> +       if (unlikely(mas_walk(&mas))) {
> +               mas_unlock(&mas);
> +               return -EEXIST;
> +       }
> +
> +       if (unlikely(mas.last < last)) {
> +               mas_unlock(&mas);
> +               return -EEXIST;
> +       }
> +
> +       mas.index =3D addr;
> +       mas.last =3D last;
> +
> +       mas_store_gfp(&mas, reg, GFP_KERNEL);
> +
> +       reg->uvmm =3D uvmm;
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_uvma_region_insert(struct nouveau_uvmm *uvmm,
> +                          struct nouveau_uvma_region *reg,
> +                          u64 addr, u64 range)
> +{
> +       int ret;
> +
> +       reg->uvmm =3D uvmm;
> +       reg->va.addr =3D addr;
> +       reg->va.range =3D range;
> +
> +       ret =3D __nouveau_uvma_region_insert(uvmm, reg);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static void
> +nouveau_uvma_region_remove(struct nouveau_uvma_region *reg)
> +{
> +       struct nouveau_uvmm *uvmm =3D reg->uvmm;
> +       MA_STATE(mas, &uvmm->region_mt, reg->va.addr, 0);
> +
> +       mas_erase(&mas);
> +}
> +
> +static int
> +nouveau_uvma_region_create(struct nouveau_uvmm *uvmm,
> +                          u64 addr, u64 range)
> +{
> +       struct nouveau_uvma_region *reg;
> +       int ret;
> +
> +       if (!drm_gpuva_interval_empty(&uvmm->umgr, addr, range))
> +               return -ENOSPC;
> +
> +       ret =3D nouveau_uvma_region_alloc(&reg);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D nouveau_uvma_region_insert(uvmm, reg, addr, range);
> +       if (ret)
> +               goto err_free_region;
> +
> +       ret =3D nouveau_uvmm_vmm_sparse_ref(uvmm, addr, range);
> +       if (ret)
> +               goto err_region_remove;
> +
> +       return 0;
> +
> +err_region_remove:
> +       nouveau_uvma_region_remove(reg);
> +err_free_region:
> +       nouveau_uvma_region_put(reg);
> +       return ret;
> +}
> +
> +static struct nouveau_uvma_region *
> +nouveau_uvma_region_find_first(struct nouveau_uvmm *uvmm,
> +                              u64 addr, u64 range)
> +{
> +       MA_STATE(mas, &uvmm->region_mt, addr, 0);
> +
> +       return mas_find(&mas, addr + range - 1);
> +}
> +
> +static struct nouveau_uvma_region *
> +nouveau_uvma_region_find(struct nouveau_uvmm *uvmm,
> +                        u64 addr, u64 range)
> +{
> +       struct nouveau_uvma_region *reg;
> +
> +       reg =3D nouveau_uvma_region_find_first(uvmm, addr, range);
> +       if (!reg)
> +               return NULL;
> +
> +       if (reg->va.addr !=3D addr ||
> +           reg->va.range !=3D range)
> +               return NULL;
> +
> +       return reg;
> +}
> +
> +static bool
> +nouveau_uvma_region_empty(struct nouveau_uvma_region *reg)
> +{
> +       struct nouveau_uvmm *uvmm =3D reg->uvmm;
> +
> +       return drm_gpuva_interval_empty(&uvmm->umgr,
> +                                       reg->va.addr,
> +                                       reg->va.range);
> +}
> +
> +static int
> +__nouveau_uvma_region_destroy(struct nouveau_uvma_region *reg)
> +{
> +       struct nouveau_uvmm *uvmm =3D reg->uvmm;
> +       u64 addr =3D reg->va.addr;
> +       u64 range =3D reg->va.range;
> +
> +       if (!nouveau_uvma_region_empty(reg))
> +               return -EBUSY;
> +
> +       nouveau_uvma_region_remove(reg);
> +       nouveau_uvmm_vmm_sparse_unref(uvmm, addr, range);
> +       nouveau_uvma_region_put(reg);
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_uvma_region_destroy(struct nouveau_uvmm *uvmm,
> +                           u64 addr, u64 range)
> +{
> +       struct nouveau_uvma_region *reg;
> +
> +       reg =3D nouveau_uvma_region_find(uvmm, addr, range);
> +       if (!reg)
> +               return -ENOENT;
> +
> +       return __nouveau_uvma_region_destroy(reg);
> +}
> +
> +static void
> +nouveau_uvma_region_dirty(struct nouveau_uvma_region *reg)
> +{
> +
> +       init_completion(&reg->complete);
> +       reg->dirty =3D true;
> +}
> +
> +static void
> +nouveau_uvma_region_complete(struct nouveau_uvma_region *reg)
> +{
> +       complete_all(&reg->complete);
> +}
> +
> +static void
> +op_map_prepare_unwind(struct nouveau_uvma *uvma)
> +{
> +       nouveau_uvma_gem_put(uvma);
> +       nouveau_uvma_remove(uvma);
> +       nouveau_uvma_free(uvma);
> +}
> +
> +static void
> +op_unmap_prepare_unwind(struct drm_gpuva *va)
> +{
> +       drm_gpuva_insert(va->mgr, va);
> +}
> +
> +static void
> +nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
> +                              struct nouveau_uvma_prealloc *new,
> +                              struct drm_gpuva_ops *ops,
> +                              struct drm_gpuva_op *last,
> +                              struct uvmm_map_args *args)
> +{
> +       struct drm_gpuva_op *op =3D last;
> +       u64 vmm_get_start =3D args ? args->addr : 0;
> +       u64 vmm_get_end =3D args ? args->addr + args->range : 0;
> +
> +       /* Unwind GPUVA space. */
> +       drm_gpuva_for_each_op_from_reverse(op, ops) {
> +               switch (op->op) {
> +               case DRM_GPUVA_OP_MAP:
> +                       op_map_prepare_unwind(new->map);
> +                       break;
> +               case DRM_GPUVA_OP_REMAP: {
> +                       struct drm_gpuva_op_remap *r =3D &op->remap;
> +
> +                       if (r->next)
> +                               op_map_prepare_unwind(new->next);
> +
> +                       if (r->prev)
> +                               op_map_prepare_unwind(new->prev);
> +
> +                       op_unmap_prepare_unwind(r->unmap->va);
> +                       break;
> +               }
> +               case DRM_GPUVA_OP_UNMAP:
> +                       op_unmap_prepare_unwind(op->unmap.va);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       /* Unmap operation don't allocate page tables, hence skip the
> following
> +        * page table unwind.
> +        */
> +       if (!args)
> +               return;
> +
> +       drm_gpuva_for_each_op(op, ops) {
> +               switch (op->op) {
> +               case DRM_GPUVA_OP_MAP: {
> +                       u64 vmm_get_range =3D vmm_get_end - vmm_get_start=
;
> +
> +                       if (vmm_get_range)
> +                               nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
> +                                                    vmm_get_range);
> +                       break;
> +               }
> +               case DRM_GPUVA_OP_REMAP: {
> +                       struct drm_gpuva_op_remap *r =3D &op->remap;
> +                       struct drm_gpuva *va =3D r->unmap->va;
> +                       u64 ustart =3D va->va.addr;
> +                       u64 urange =3D va->va.range;
> +                       u64 uend =3D ustart + urange;
> +
> +                       if (r->prev)
> +                               vmm_get_start =3D uend;
> +
> +                       if (r->next)
> +                               vmm_get_end =3D ustart;
> +
> +                       if (r->prev && r->next)
> +                               vmm_get_start =3D vmm_get_end =3D 0;
> +
> +                       break;
> +               }
> +               case DRM_GPUVA_OP_UNMAP: {
> +                       struct drm_gpuva_op_unmap *u =3D &op->unmap;
> +                       struct drm_gpuva *va =3D u->va;
> +                       u64 ustart =3D va->va.addr;
> +                       u64 urange =3D va->va.range;
> +                       u64 uend =3D ustart + urange;
> +
> +                       /* Nothing to do for mappings we merge with. */
> +                       if (uend =3D=3D vmm_get_start ||
> +                           ustart =3D=3D vmm_get_end)
> +                               break;
> +
> +                       if (ustart > vmm_get_start) {
> +                               u64 vmm_get_range =3D ustart - vmm_get_st=
art;
> +
> +                               nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
> +                                                    vmm_get_range);
> +                       }
> +                       vmm_get_start =3D uend;
> +                       break;
> +               }
> +               default:
> +                       break;
> +               }
> +
> +               if (op =3D=3D last)
> +                       break;
> +       }
> +}
> +
> +static void
> +nouveau_uvmm_sm_map_prepare_unwind(struct nouveau_uvmm *uvmm,
> +                                  struct nouveau_uvma_prealloc *new,
> +                                  struct drm_gpuva_ops *ops,
> +                                  u64 addr, u64 range)
> +{
> +       struct drm_gpuva_op *last =3D drm_gpuva_last_op(ops);
> +       struct uvmm_map_args args =3D {
> +               .addr =3D addr,
> +               .range =3D range,
> +       };
> +
> +       nouveau_uvmm_sm_prepare_unwind(uvmm, new, ops, last, &args);
> +}
> +
> +static void
> +nouveau_uvmm_sm_unmap_prepare_unwind(struct nouveau_uvmm *uvmm,
> +                                    struct nouveau_uvma_prealloc *new,
> +                                    struct drm_gpuva_ops *ops)
> +{
> +       struct drm_gpuva_op *last =3D drm_gpuva_last_op(ops);
> +
> +       nouveau_uvmm_sm_prepare_unwind(uvmm, new, ops, last, NULL);
> +}
> +
> +static int
> +op_map_prepare(struct nouveau_uvmm *uvmm,
> +              struct nouveau_uvma **puvma,
> +              struct drm_gpuva_op_map *m,
> +              struct uvmm_map_args *args)
> +{
> +       struct nouveau_uvma *uvma;
> +       int ret;
> +
> +       ret =3D nouveau_uvma_alloc(&uvma);
> +       if (ret)
> +               goto err;
> +
> +       ret =3D nouveau_uvma_insert(uvmm, uvma, args->region,
> +                                 m->gem.obj, m->gem.offset,
> +                                 m->va.addr, m->va.range,
> +                                 args->kind);
> +       if (ret)
> +               goto err_free_uvma;
> +
> +       /* Keep a reference until this uvma is destroyed. */
> +       nouveau_uvma_gem_get(uvma);
> +
> +       *puvma =3D uvma;
> +       return 0;
> +
> +err_free_uvma:
> +       nouveau_uvma_free(uvma);
> +err:
> +       *puvma =3D NULL;
> +       return ret;
> +}
> +
> +static void
> +op_unmap_prepare(struct drm_gpuva_op_unmap *u)
> +{
> +       struct nouveau_uvma *uvma =3D uvma_from_va(u->va);
> +
> +       nouveau_uvma_remove(uvma);
> +}
> +
> +static int
> +nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
> +                       struct nouveau_uvma_prealloc *new,
> +                       struct drm_gpuva_ops *ops,
> +                       struct uvmm_map_args *args)
> +{
> +       struct drm_gpuva_op *op;
> +       u64 vmm_get_start =3D args ? args->addr : 0;
> +       u64 vmm_get_end =3D args ? args->addr + args->range : 0;
> +       int ret;
> +
> +       drm_gpuva_for_each_op(op, ops) {
> +               switch (op->op) {
> +               case DRM_GPUVA_OP_MAP: {
> +                       u64 vmm_get_range =3D vmm_get_end - vmm_get_start=
;
> +
> +                       ret =3D op_map_prepare(uvmm, &new->map, &op->map,
> args);
> +                       if (ret)
> +                               goto unwind;
> +
> +                       if (args && vmm_get_range) {
> +                               ret =3D nouveau_uvmm_vmm_get(uvmm,
> vmm_get_start,
> +                                                          vmm_get_range)=
;
> +                               if (ret) {
> +                                       op_map_prepare_unwind(new->map);
> +                                       goto unwind;
> +                               }
> +                       }
> +                       break;
> +               }
> +               case DRM_GPUVA_OP_REMAP: {
> +                       struct drm_gpuva_op_remap *r =3D &op->remap;
> +                       struct drm_gpuva *va =3D r->unmap->va;
> +                       struct uvmm_map_args remap_args =3D {
> +                               .kind =3D uvma_from_va(va)->kind,
> +                       };
> +                       u64 ustart =3D va->va.addr;
> +                       u64 urange =3D va->va.range;
> +                       u64 uend =3D ustart + urange;
> +
> +                       op_unmap_prepare(r->unmap);
> +
> +                       if (r->prev) {
> +                               ret =3D op_map_prepare(uvmm, &new->prev,
> r->prev,
> +                                                    &remap_args);
> +                               if (ret)
> +                                       goto unwind;
> +
> +                               if (args)
> +                                       vmm_get_start =3D uend;
> +                       }
> +
> +                       if (r->next) {
> +                               ret =3D op_map_prepare(uvmm, &new->next,
> r->next,
> +                                                    &remap_args);
> +                               if (ret) {
> +                                       if (r->prev)
> +
>  op_map_prepare_unwind(new->prev);
> +                                       goto unwind;
> +                               }
> +
> +                               if (args)
> +                                       vmm_get_end =3D ustart;
> +                       }
> +
> +                       if (args && (r->prev && r->next))
> +                               vmm_get_start =3D vmm_get_end =3D 0;
> +
> +                       break;
> +               }
> +               case DRM_GPUVA_OP_UNMAP: {
> +                       struct drm_gpuva_op_unmap *u =3D &op->unmap;
> +                       struct drm_gpuva *va =3D u->va;
> +                       u64 ustart =3D va->va.addr;
> +                       u64 urange =3D va->va.range;
> +                       u64 uend =3D ustart + urange;
> +
> +                       op_unmap_prepare(u);
> +
> +                       if (!args)
> +                               break;
> +
> +                       /* Nothing to do for mappings we merge with. */
> +                       if (uend =3D=3D vmm_get_start ||
> +                           ustart =3D=3D vmm_get_end)
> +                               break;
> +
> +                       if (ustart > vmm_get_start) {
> +                               u64 vmm_get_range =3D ustart - vmm_get_st=
art;
> +
> +                               ret =3D nouveau_uvmm_vmm_get(uvmm,
> vmm_get_start,
> +                                                          vmm_get_range)=
;
> +                               if (ret) {
> +                                       op_unmap_prepare_unwind(va);
> +                                       goto unwind;
> +                               }
> +                       }
> +                       vmm_get_start =3D uend;
> +
> +                       break;
> +               }
> +               default:
> +                       ret =3D -EINVAL;
> +                       goto unwind;
> +               }
> +       }
> +
> +       return 0;
> +
> +unwind:
> +       if (op !=3D drm_gpuva_first_op(ops))
> +               nouveau_uvmm_sm_prepare_unwind(uvmm, new, ops,
> +                                              drm_gpuva_prev_op(op),
> +                                              args);
> +       return ret;
> +}
> +
> +static int
> +nouveau_uvmm_sm_map_prepare(struct nouveau_uvmm *uvmm,
> +                           struct nouveau_uvma_prealloc *new,
> +                           struct nouveau_uvma_region *region,
> +                           struct drm_gpuva_ops *ops,
> +                           u64 addr, u64 range, u8 kind)
> +{
> +       struct uvmm_map_args args =3D {
> +               .region =3D region,
> +               .addr =3D addr,
> +               .range =3D range,
> +               .kind =3D kind,
> +       };
> +
> +       return nouveau_uvmm_sm_prepare(uvmm, new, ops, &args);
> +}
> +
> +static int
> +nouveau_uvmm_sm_unmap_prepare(struct nouveau_uvmm *uvmm,
> +                             struct nouveau_uvma_prealloc *new,
> +                             struct drm_gpuva_ops *ops)
> +{
> +       return nouveau_uvmm_sm_prepare(uvmm, new, ops, NULL);
> +}
> +
> +static struct drm_gem_object *
> +op_gem_obj(struct drm_gpuva_op *op)
> +{
> +       switch (op->op) {
> +       case DRM_GPUVA_OP_MAP:
> +               return op->map.gem.obj;
> +       case DRM_GPUVA_OP_REMAP:
> +               /* Actually, we're looking for the GEMs backing remap.pre=
v
> and
> +                * remap.next, but since this is a remap they're identica=
l
> to
> +                * the GEM backing the unmapped GPUVA.
> +                */
> +               return op->remap.unmap->va->gem.obj;
> +       case DRM_GPUVA_OP_UNMAP:
> +               return op->unmap.va->gem.obj;
> +       default:
> +               WARN(1, "Unknown operation.\n");
> +               return NULL;
> +       }
> +}
> +
> +static void
> +op_map(struct nouveau_uvma *uvma)
> +{
> +       struct nouveau_bo *nvbo =3D nouveau_gem_object(uvma->va.gem.obj);
> +
> +       nouveau_uvma_map(uvma, nouveau_mem(nvbo->bo.resource));
> +}
> +
> +static void
> +op_unmap(struct drm_gpuva_op_unmap *u)
> +{
> +       struct drm_gpuva *va =3D u->va;
> +       struct nouveau_uvma *uvma =3D uvma_from_va(va);
> +
> +       /* nouveau_uvma_unmap() does not unmap if backing BO is evicted. =
*/
> +       if (!u->keep)
> +               nouveau_uvma_unmap(uvma);
> +}
> +
> +static void
> +op_unmap_range(struct drm_gpuva_op_unmap *u,
> +              u64 addr, u64 range)
> +{
> +       struct nouveau_uvma *uvma =3D uvma_from_va(u->va);
> +       bool sparse =3D !!uvma->region;
> +
> +       if (!drm_gpuva_invalidated(u->va))
> +               nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
> +}
> +
> +static void
> +op_remap(struct drm_gpuva_op_remap *r,
> +        struct nouveau_uvma_prealloc *new)
> +{
> +       struct drm_gpuva_op_unmap *u =3D r->unmap;
> +       struct nouveau_uvma *uvma =3D uvma_from_va(u->va);
> +       u64 addr =3D uvma->va.va.addr;
> +       u64 range =3D uvma->va.va.range;
> +
> +       if (r->prev)
> +               addr =3D r->prev->va.addr + r->prev->va.range;
> +
> +       if (r->next)
> +               range =3D r->next->va.addr - addr;
> +
> +       op_unmap_range(u, addr, range);
> +}
> +
> +static int
> +nouveau_uvmm_sm(struct nouveau_uvmm *uvmm,
> +               struct nouveau_uvma_prealloc *new,
> +               struct drm_gpuva_ops *ops)
> +{
> +       struct drm_gpuva_op *op;
> +
> +       drm_gpuva_for_each_op(op, ops) {
> +               switch (op->op) {
> +               case DRM_GPUVA_OP_MAP:
> +                       op_map(new->map);
> +                       break;
> +               case DRM_GPUVA_OP_REMAP:
> +                       op_remap(&op->remap, new);
> +                       break;
> +               case DRM_GPUVA_OP_UNMAP:
> +                       op_unmap(&op->unmap);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_uvmm_sm_map(struct nouveau_uvmm *uvmm,
> +                   struct nouveau_uvma_prealloc *new,
> +                   struct drm_gpuva_ops *ops)
> +{
> +       return nouveau_uvmm_sm(uvmm, new, ops);
> +}
> +
> +static int
> +nouveau_uvmm_sm_unmap(struct nouveau_uvmm *uvmm,
> +                     struct nouveau_uvma_prealloc *new,
> +                     struct drm_gpuva_ops *ops)
> +{
> +       return nouveau_uvmm_sm(uvmm, new, ops);
> +}
> +
> +static void
> +nouveau_uvmm_sm_cleanup(struct nouveau_uvmm *uvmm,
> +                       struct nouveau_uvma_prealloc *new,
> +                       struct drm_gpuva_ops *ops, bool unmap)
> +{
> +       struct drm_gpuva_op *op;
> +
> +       drm_gpuva_for_each_op(op, ops) {
> +               switch (op->op) {
> +               case DRM_GPUVA_OP_MAP:
> +                       break;
> +               case DRM_GPUVA_OP_REMAP: {
> +                       struct drm_gpuva_op_remap *r =3D &op->remap;
> +                       struct drm_gpuva_op_map *p =3D r->prev;
> +                       struct drm_gpuva_op_map *n =3D r->next;
> +                       struct drm_gpuva *va =3D r->unmap->va;
> +                       struct nouveau_uvma *uvma =3D uvma_from_va(va);
> +
> +                       if (unmap) {
> +                               u64 addr =3D va->va.addr;
> +                               u64 end =3D addr + va->va.range;
> +
> +                               if (p)
> +                                       addr =3D p->va.addr + p->va.range=
;
> +
> +                               if (n)
> +                                       end =3D n->va.addr;
> +
> +                               nouveau_uvmm_vmm_put(uvmm, addr, end -
> addr);
> +                       }
> +
> +                       nouveau_uvma_gem_put(uvma);
> +                       nouveau_uvma_free(uvma);
> +                       break;
> +               }
> +               case DRM_GPUVA_OP_UNMAP: {
> +                       struct drm_gpuva_op_unmap *u =3D &op->unmap;
> +                       struct drm_gpuva *va =3D u->va;
> +                       struct nouveau_uvma *uvma =3D uvma_from_va(va);
> +
> +                       if (unmap)
> +                               nouveau_uvma_vmm_put(uvma);
> +
> +                       nouveau_uvma_gem_put(uvma);
> +                       nouveau_uvma_free(uvma);
> +                       break;
> +               }
> +               default:
> +                       break;
> +               }
> +       }
> +}
> +
> +static void
> +nouveau_uvmm_sm_map_cleanup(struct nouveau_uvmm *uvmm,
> +                           struct nouveau_uvma_prealloc *new,
> +                           struct drm_gpuva_ops *ops)
> +{
> +       nouveau_uvmm_sm_cleanup(uvmm, new, ops, false);
> +}
> +
> +static void
> +nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
> +                             struct nouveau_uvma_prealloc *new,
> +                             struct drm_gpuva_ops *ops)
> +{
> +       nouveau_uvmm_sm_cleanup(uvmm, new, ops, true);
> +}
> +
> +static int
> +nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64
> range)
> +{
> +       u64 end =3D addr + range;
> +       u64 unmanaged_end =3D uvmm->unmanaged_addr +
> +                           uvmm->unmanaged_size;
> +
> +       if (addr & ~PAGE_MASK)
> +               return -EINVAL;
> +
> +       if (range & ~PAGE_MASK)
> +               return -EINVAL;
> +
> +       if (end <=3D addr)
> +               return -EINVAL;
> +
> +       if (addr < NOUVEAU_VA_SPACE_START ||
> +           end > NOUVEAU_VA_SPACE_END)
> +               return -EINVAL;
> +
> +       if (addr < unmanaged_end &&
> +           end > uvmm->unmanaged_addr)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_uvmm_bind_job_alloc(struct nouveau_uvmm_bind_job **pjob)
> +{
> +       *pjob =3D kzalloc(sizeof(**pjob), GFP_KERNEL);
> +       if (!*pjob)
> +               return -ENOMEM;
> +
> +       kref_init(&(*pjob)->kref);
> +
> +       return 0;
> +}
> +
> +static void
> +nouveau_uvmm_bind_job_free(struct kref *kref)
> +{
> +       struct nouveau_uvmm_bind_job *job =3D
> +               container_of(kref, struct nouveau_uvmm_bind_job, kref);
> +
> +       nouveau_job_free(&job->base);
> +       kfree(job);
> +}
> +
> +static void
> +nouveau_uvmm_bind_job_get(struct nouveau_uvmm_bind_job *job)
> +{
> +       kref_get(&job->kref);
> +}
> +
> +static void
> +nouveau_uvmm_bind_job_put(struct nouveau_uvmm_bind_job *job)
> +{
> +       kref_put(&job->kref, nouveau_uvmm_bind_job_free);
> +}
> +
> +static int
> +bind_validate_op(struct nouveau_job *job,
> +                struct bind_job_op *op)
> +{
> +       struct nouveau_uvmm *uvmm =3D nouveau_cli_uvmm(job->cli);
> +       struct drm_gem_object *obj =3D op->gem.obj;
> +
> +       if (op->op =3D=3D OP_MAP) {
> +               if (op->gem.offset & ~PAGE_MASK)
> +                       return -EINVAL;
> +
> +               if (obj->size <=3D op->gem.offset)
> +                       return -EINVAL;
> +
> +               if (op->va.range > (obj->size - op->gem.offset))
> +                       return -EINVAL;
> +       }
> +
> +       return nouveau_uvmm_validate_range(uvmm, op->va.addr,
> op->va.range);
> +}
> +
> +static void
> +bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
> +{
> +       struct nouveau_uvmm_bind_job *bind_job;
> +       struct nouveau_sched_entity *entity =3D job->entity;
> +       struct bind_job_op *op;
> +       u64 end =3D addr + range;
> +
> +again:
> +       spin_lock(&entity->job.list.lock);
> +       list_for_each_entry(bind_job, &entity->job.list.head, entry) {
> +               list_for_each_op(op, &bind_job->ops) {
> +                       if (op->op =3D=3D OP_UNMAP) {
> +                               u64 op_addr =3D op->va.addr;
> +                               u64 op_end =3D op_addr + op->va.range;
> +
> +                               if (!(end <=3D op_addr || addr >=3D op_en=
d)) {
> +
>  nouveau_uvmm_bind_job_get(bind_job);
> +
>  spin_unlock(&entity->job.list.lock);
> +
>  wait_for_completion(&bind_job->complete);
> +
>  nouveau_uvmm_bind_job_put(bind_job);
> +                                       goto again;
> +                               }
> +                       }
> +               }
> +       }
> +       spin_unlock(&entity->job.list.lock);
> +}
> +
> +static int
> +bind_validate_map_common(struct nouveau_job *job, u64 addr, u64 range,
> +                        bool sparse)
> +{
> +       struct nouveau_uvmm *uvmm =3D nouveau_cli_uvmm(job->cli);
> +       struct nouveau_uvma_region *reg;
> +       u64 reg_addr, reg_end;
> +       u64 end =3D addr + range;
> +
> +again:
> +       nouveau_uvmm_lock(uvmm);
> +       reg =3D nouveau_uvma_region_find_first(uvmm, addr, range);
> +       if (!reg) {
> +               nouveau_uvmm_unlock(uvmm);
> +               return 0;
> +       }
> +
> +       /* Generally, job submits are serialized, hence only
> +        * dirty regions can be modified concurrently. */
> +       if (reg->dirty) {
> +               nouveau_uvma_region_get(reg);
> +               nouveau_uvmm_unlock(uvmm);
> +               wait_for_completion(&reg->complete);
> +               nouveau_uvma_region_put(reg);
> +               goto again;
> +       }
> +       nouveau_uvmm_unlock(uvmm);
> +
> +       if (sparse)
> +               return -ENOSPC;
> +
> +       reg_addr =3D reg->va.addr;
> +       reg_end =3D reg_addr + reg->va.range;
> +
> +       /* Make sure the mapping is either outside of a
> +        * region or fully enclosed by a region.
> +        */
> +       if (reg_addr > addr || reg_end < end)
> +               return -ENOSPC;
> +
> +       return 0;
> +}
> +
> +static int
> +bind_validate_region(struct nouveau_job *job)
> +{
> +       struct nouveau_uvmm_bind_job *bind_job =3D to_uvmm_bind_job(job);
> +       struct bind_job_op *op;
> +       int ret;
> +
> +       list_for_each_op(op, &bind_job->ops) {
> +               u64 op_addr =3D op->va.addr;
> +               u64 op_range =3D op->va.range;
> +               bool sparse =3D false;
> +
> +               switch (op->op) {
> +               case OP_MAP_SPARSE:
> +                       sparse =3D true;
> +                       bind_validate_map_sparse(job, op_addr, op_range);
> +                       fallthrough;
> +               case OP_MAP:
> +                       ret =3D bind_validate_map_common(job, op_addr,
> op_range,
> +                                                      sparse);
> +                       if (ret)
> +                               return ret;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void
> +bind_link_gpuvas(struct drm_gpuva_ops *ops, struct nouveau_uvma_prealloc
> *new)
> +{
> +       struct drm_gpuva_op *op;
> +
> +       drm_gpuva_for_each_op(op, ops) {
> +               switch (op->op) {
> +               case DRM_GPUVA_OP_MAP:
> +                       drm_gpuva_link(&new->map->va);
> +                       break;
> +               case DRM_GPUVA_OP_REMAP:
> +                       if (op->remap.prev)
> +                               drm_gpuva_link(&new->prev->va);
> +                       if (op->remap.next)
> +                               drm_gpuva_link(&new->next->va);
> +                       drm_gpuva_unlink(op->remap.unmap->va);
> +                       break;
> +               case DRM_GPUVA_OP_UNMAP:
> +                       drm_gpuva_unlink(op->unmap.va);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +}
> +
> +static int
> +nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
> +{
> +       struct nouveau_uvmm *uvmm =3D nouveau_cli_uvmm(job->cli);
> +       struct nouveau_uvmm_bind_job *bind_job =3D to_uvmm_bind_job(job);
> +       struct nouveau_sched_entity *entity =3D job->entity;
> +       struct drm_exec *exec =3D &job->exec;
> +       struct bind_job_op *op;
> +       int ret;
> +
> +       list_for_each_op(op, &bind_job->ops) {
> +               if (op->op =3D=3D OP_MAP) {
> +                       op->gem.obj =3D drm_gem_object_lookup(job->file_p=
riv,
> +
>  op->gem.handle);
> +                       if (!op->gem.obj)
> +                               return -ENOENT;
> +               }
> +
> +               ret =3D bind_validate_op(job, op);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* If a sparse region or mapping overlaps a dirty region, we need
> to
> +        * wait for the region to complete the unbind process. This is du=
e
> to
> +        * how page table management is currently implemented. A future
> +        * implementation might change this.
> +        */
> +       ret =3D bind_validate_region(job);
> +       if (ret)
> +               return ret;
> +
> +       /* Once we start modifying the GPU VA space we need to keep
> holding the
> +        * uvmm lock until we can't fail anymore. This is due to the set
> of GPU
> +        * VA space changes must appear atomically and we need to be able
> to
> +        * unwind all GPU VA space changes on failure.
> +        */
> +       nouveau_uvmm_lock(uvmm);
> +       list_for_each_op(op, &bind_job->ops) {
> +               switch (op->op) {
> +               case OP_MAP_SPARSE:
> +                       ret =3D nouveau_uvma_region_create(uvmm,
> +                                                        op->va.addr,
> +                                                        op->va.range);
> +                       if (ret)
> +                               goto unwind_continue;
> +
> +                       break;
> +               case OP_UNMAP_SPARSE:
> +                       op->reg =3D nouveau_uvma_region_find(uvmm,
> op->va.addr,
> +                                                          op->va.range);
> +                       if (!op->reg || op->reg->dirty) {
> +                               ret =3D -ENOENT;
> +                               goto unwind_continue;
> +                       }
> +
> +                       op->ops =3D
> drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
> +
>  op->va.addr,
> +
>  op->va.range);
> +                       if (IS_ERR(op->ops)) {
> +                               ret =3D PTR_ERR(op->ops);
> +                               goto unwind_continue;
> +                       }
> +
> +                       ret =3D nouveau_uvmm_sm_unmap_prepare(uvmm, &op->=
new,
> +                                                           op->ops);
> +                       if (ret) {
> +                               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +                               op->ops =3D NULL;
> +                               op->reg =3D NULL;
> +                               goto unwind_continue;
> +                       }
> +
> +                       nouveau_uvma_region_dirty(op->reg);
> +
> +                       break;
> +               case OP_MAP: {
> +                       struct nouveau_uvma_region *reg;
> +
> +                       reg =3D nouveau_uvma_region_find_first(uvmm,
> +                                                            op->va.addr,
> +                                                            op->va.range=
);
> +                       if (reg) {
> +                               u64 reg_addr =3D reg->va.addr;
> +                               u64 reg_end =3D reg_addr + reg->va.range;
> +                               u64 op_addr =3D op->va.addr;
> +                               u64 op_end =3D op_addr + op->va.range;
> +
> +                               if (unlikely(reg->dirty)) {
> +                                       ret =3D -EINVAL;
> +                                       goto unwind_continue;
> +                               }
> +
> +                               /* Make sure the mapping is either outsid=
e
> of a
> +                                * region or fully enclosed by a region.
> +                                */
> +                               if (reg_addr > op_addr || reg_end <
> op_end) {
> +                                       ret =3D -ENOSPC;
> +                                       goto unwind_continue;
> +                               }
> +                       }
> +
> +                       op->ops =3D drm_gpuva_sm_map_ops_create(&uvmm->um=
gr,
> +                                                             op->va.addr=
,
> +                                                             op->va.rang=
e,
> +                                                             op->gem.obj=
,
> +
>  op->gem.offset);
> +                       if (IS_ERR(op->ops)) {
> +                               ret =3D PTR_ERR(op->ops);
> +                               goto unwind_continue;
> +                       }
> +
> +                       ret =3D nouveau_uvmm_sm_map_prepare(uvmm, &op->ne=
w,
> +                                                         reg, op->ops,
> +                                                         op->va.addr,
> +                                                         op->va.range,
> +                                                         op->flags &
> 0xff);
> +                       if (ret) {
> +                               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +                               op->ops =3D NULL;
> +                               goto unwind_continue;
> +                       }
> +
> +                       break;
> +               }
> +               case OP_UNMAP:
> +                       op->ops =3D
> drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
> +
>  op->va.addr,
> +
>  op->va.range);
> +                       if (IS_ERR(op->ops)) {
> +                               ret =3D PTR_ERR(op->ops);
> +                               goto unwind_continue;
> +                       }
> +
> +                       ret =3D nouveau_uvmm_sm_unmap_prepare(uvmm, &op->=
new,
> +                                                           op->ops);
> +                       if (ret) {
> +                               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +                               op->ops =3D NULL;
> +                               goto unwind_continue;
> +                       }
> +
> +                       break;
> +               default:
> +                       ret =3D -EINVAL;
> +                       goto unwind_continue;
> +               }
> +       }
> +
> +       drm_exec_until_all_locked(exec) {
> +               list_for_each_op(op, &bind_job->ops) {
> +                       struct drm_gpuva_op *va_op;
> +
> +                       if (IS_ERR_OR_NULL(op->ops))
> +                               continue;
> +
> +                       drm_gpuva_for_each_op(va_op, op->ops) {
> +                               struct drm_gem_object *obj =3D
> op_gem_obj(va_op);
> +
> +                               if (unlikely(!obj))
> +                                       continue;
> +
> +                               ret =3D drm_exec_prepare_obj(exec, obj, 1=
);
> +                               drm_exec_retry_on_contention(exec);
> +                               if (ret) {
> +                                       op =3D list_last_op(&bind_job->op=
s);
> +                                       goto unwind;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       list_for_each_op(op, &bind_job->ops) {
> +               struct drm_gpuva_op *va_op;
> +
> +               if (IS_ERR_OR_NULL(op->ops))
> +                       continue;
> +
> +               drm_gpuva_for_each_op(va_op, op->ops) {
> +                       struct drm_gem_object *obj =3D op_gem_obj(va_op);
> +
> +                       /* Don't validate GEMs backing mappings we're
> about to
> +                        * unmap, it's not worth the effort.
> +                        */
> +                       if (unlikely(va_op->op =3D=3D DRM_GPUVA_OP_UNMAP)=
)
> +                               continue;
> +
> +                       if (unlikely(!obj))
> +                               continue;
> +
> +                       ret =3D nouveau_bo_validate(nouveau_gem_object(ob=
j),
> +                                                 true, false);
> +                       if (ret) {
> +                               op =3D list_last_op(&bind_job->ops);
> +                               goto unwind;
> +                       }
> +               }
> +       }
> +
> +       /* Link and unlink GPUVAs while holding the dma_resv lock.
> +        *
> +        * As long as we validate() all GEMs and add fences to all GEMs D=
MA
> +        * reservations backing map and remap operations we can be sure
> there
> +        * won't be any concurrent (in)validations during job execution,
> hence
> +        * we're safe to check drm_gpuva_invalidated() within the fence
> +        * signalling critical path without holding a separate lock.
> +        *
> +        * GPUVAs about to be unmapped are safe as well, since they're
> unlinked
> +        * already.
> +        *
> +        * GEMs from map and remap operations must be validated before
> linking
> +        * their corresponding mappings to prevent the actual PT update t=
o
> +        * happen right away in validate() rather than asynchronously as
> +        * intended.
> +        *
> +        * Note that after linking and unlinking the GPUVAs in this loop
> this
> +        * function cannot fail anymore, hence there is no need for an
> unwind
> +        * path.
> +        */
> +       list_for_each_op(op, &bind_job->ops) {
> +               switch (op->op) {
> +               case OP_UNMAP_SPARSE:
> +               case OP_MAP:
> +               case OP_UNMAP:
> +                       bind_link_gpuvas(op->ops, &op->new);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +       nouveau_uvmm_unlock(uvmm);
> +
> +       spin_lock(&entity->job.list.lock);
> +       list_add(&bind_job->entry, &entity->job.list.head);
> +       spin_unlock(&entity->job.list.lock);
> +
> +       return 0;
> +
> +unwind_continue:
> +       op =3D list_prev_op(op);
> +unwind:
> +       list_for_each_op_from_reverse(op, &bind_job->ops) {
> +               switch (op->op) {
> +               case OP_MAP_SPARSE:
> +                       nouveau_uvma_region_destroy(uvmm, op->va.addr,
> +                                                   op->va.range);
> +                       break;
> +               case OP_UNMAP_SPARSE:
> +                       __nouveau_uvma_region_insert(uvmm, op->reg);
> +                       nouveau_uvmm_sm_unmap_prepare_unwind(uvmm,
> &op->new,
> +                                                            op->ops);
> +                       break;
> +               case OP_MAP:
> +                       nouveau_uvmm_sm_map_prepare_unwind(uvmm, &op->new=
,
> +                                                          op->ops,
> +                                                          op->va.addr,
> +                                                          op->va.range);
> +                       break;
> +               case OP_UNMAP:
> +                       nouveau_uvmm_sm_unmap_prepare_unwind(uvmm,
> &op->new,
> +                                                            op->ops);
> +                       break;
> +               }
> +
> +               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +               op->ops =3D NULL;
> +               op->reg =3D NULL;
> +       }
> +
> +       nouveau_uvmm_unlock(uvmm);
> +       return ret;
> +}
> +
> +static struct dma_fence *
> +nouveau_uvmm_bind_job_run(struct nouveau_job *job)
> +{
> +       struct nouveau_uvmm_bind_job *bind_job =3D to_uvmm_bind_job(job);
> +       struct nouveau_uvmm *uvmm =3D nouveau_cli_uvmm(job->cli);
> +       struct bind_job_op *op;
> +       int ret =3D 0;
> +
> +       list_for_each_op(op, &bind_job->ops) {
> +               switch (op->op) {
> +               case OP_MAP_SPARSE:
> +                       /* noop */
> +                       break;
> +               case OP_MAP:
> +                       ret =3D nouveau_uvmm_sm_map(uvmm, &op->new, op->o=
ps);
> +                       if (ret)
> +                               goto out;
> +                       break;
> +               case OP_UNMAP_SPARSE:
> +                       fallthrough;
> +               case OP_UNMAP:
> +                       ret =3D nouveau_uvmm_sm_unmap(uvmm, &op->new,
> op->ops);
> +                       if (ret)
> +                               goto out;
> +                       break;
> +               }
> +       }
> +
> +out:
> +       if (ret)
> +               NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
> +       return ERR_PTR(ret);
> +}
> +
> +static void
> +nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
> +{
> +       struct nouveau_uvmm_bind_job *bind_job =3D
> +               container_of(work, struct nouveau_uvmm_bind_job, work);
> +       struct nouveau_job *job =3D &bind_job->base;
> +       struct nouveau_uvmm *uvmm =3D nouveau_cli_uvmm(job->cli);
> +       struct nouveau_sched_entity *entity =3D job->entity;
> +       struct bind_job_op *op, *next;
> +
> +       list_for_each_op(op, &bind_job->ops) {
> +               struct drm_gem_object *obj =3D op->gem.obj;
> +
> +               /* When nouveau_uvmm_bind_job_submit() fails op->ops and
> op->reg
> +                * will be NULL, hence skip the cleanup.
> +                */
> +               switch (op->op) {
> +               case OP_MAP_SPARSE:
> +                       /* noop */
> +                       break;
> +               case OP_UNMAP_SPARSE:
> +                       if (!IS_ERR_OR_NULL(op->ops))
> +                               nouveau_uvmm_sm_unmap_cleanup(uvmm,
> &op->new,
> +                                                             op->ops);
> +
> +                       if (op->reg) {
> +                               nouveau_uvma_region_sparse_unref(op->reg)=
;
> +                               nouveau_uvmm_lock(uvmm);
> +                               nouveau_uvma_region_remove(op->reg);
> +                               nouveau_uvmm_unlock(uvmm);
> +                               nouveau_uvma_region_complete(op->reg);
> +                               nouveau_uvma_region_put(op->reg);
> +                       }
> +
> +                       break;
> +               case OP_MAP:
> +                       if (!IS_ERR_OR_NULL(op->ops))
> +                               nouveau_uvmm_sm_map_cleanup(uvmm, &op->ne=
w,
> +                                                           op->ops);
> +                       break;
> +               case OP_UNMAP:
> +                       if (!IS_ERR_OR_NULL(op->ops))
> +                               nouveau_uvmm_sm_unmap_cleanup(uvmm,
> &op->new,
> +                                                             op->ops);
> +                       break;
> +               }
> +
> +               if (!IS_ERR_OR_NULL(op->ops))
> +                       drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +
> +               if (obj)
> +                       drm_gem_object_put(obj);
> +       }
> +
> +       spin_lock(&entity->job.list.lock);
> +       list_del(&bind_job->entry);
> +       spin_unlock(&entity->job.list.lock);
> +
> +       complete_all(&bind_job->complete);
> +       wake_up(&entity->job.wq);
> +
> +       /* Remove and free ops after removing the bind job from the job
> list to
> +        * avoid races against bind_validate_map_sparse().
> +        */
> +       list_for_each_op_safe(op, next, &bind_job->ops) {
> +               list_del(&op->entry);
> +               kfree(op);
> +       }
> +
> +       nouveau_uvmm_bind_job_put(bind_job);
> +}
> +
> +static void
> +nouveau_uvmm_bind_job_free_qwork(struct nouveau_job *job)
> +{
> +       struct nouveau_uvmm_bind_job *bind_job =3D to_uvmm_bind_job(job);
> +       struct nouveau_sched_entity *entity =3D job->entity;
> +
> +       nouveau_sched_entity_qwork(entity, &bind_job->work);
> +}
> +
> +static struct nouveau_job_ops nouveau_bind_job_ops =3D {
> +       .submit =3D nouveau_uvmm_bind_job_submit,
> +       .run =3D nouveau_uvmm_bind_job_run,
> +       .free =3D nouveau_uvmm_bind_job_free_qwork,
> +};
> +
> +static int
> +bind_job_op_from_uop(struct bind_job_op **pop,
> +                    struct drm_nouveau_vm_bind_op *uop)
> +{
> +       struct bind_job_op *op;
> +
> +       op =3D *pop =3D kzalloc(sizeof(*op), GFP_KERNEL);
> +       if (!op)
> +               return -ENOMEM;
> +
> +       switch (uop->op) {
> +       case OP_MAP:
> +               op->op =3D uop->flags & DRM_NOUVEAU_VM_BIND_SPARSE ?
> +                        OP_MAP_SPARSE : OP_MAP;
> +               break;
> +       case OP_UNMAP:
> +               op->op =3D uop->flags & DRM_NOUVEAU_VM_BIND_SPARSE ?
> +                        OP_UNMAP_SPARSE : OP_UNMAP;
> +               break;
> +       default:
> +               op->op =3D uop->op;
> +               break;
> +       }
> +
> +       op->flags =3D uop->flags;
> +       op->va.addr =3D uop->addr;
> +       op->va.range =3D uop->range;
> +       op->gem.handle =3D uop->handle;
> +       op->gem.offset =3D uop->bo_offset;
> +
> +       return 0;
> +}
> +
> +static void
> +bind_job_ops_free(struct list_head *ops)
> +{
> +       struct bind_job_op *op, *next;
> +
> +       list_for_each_op_safe(op, next, ops) {
> +               list_del(&op->entry);
> +               kfree(op);
> +       }
> +}
> +
> +static int
> +nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
> +                          struct nouveau_uvmm_bind_job_args *__args)
> +{
> +       struct nouveau_uvmm_bind_job *job;
> +       struct nouveau_job_args args =3D {};
> +       struct bind_job_op *op;
> +       int i, ret;
> +
> +       ret =3D nouveau_uvmm_bind_job_alloc(&job);
> +       if (ret)
> +               return ret;
> +
> +       INIT_LIST_HEAD(&job->ops);
> +       INIT_LIST_HEAD(&job->entry);
> +
> +       for (i =3D 0; i < __args->op.count; i++) {
> +               ret =3D bind_job_op_from_uop(&op, &__args->op.s[i]);
> +               if (ret)
> +                       goto err_free;
> +
> +               list_add_tail(&op->entry, &job->ops);
> +       }
> +
> +       init_completion(&job->complete);
> +       INIT_WORK(&job->work, nouveau_uvmm_bind_job_free_work_fn);
> +
> +       args.sched_entity =3D __args->sched_entity;
> +       args.file_priv =3D __args->file_priv;
> +
> +       args.in_sync.count =3D __args->in_sync.count;
> +       args.in_sync.s =3D __args->in_sync.s;
> +
> +       args.out_sync.count =3D __args->out_sync.count;
> +       args.out_sync.s =3D __args->out_sync.s;
> +
> +       args.sync =3D !(__args->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
> +       args.ops =3D &nouveau_bind_job_ops;
> +       args.resv_usage =3D DMA_RESV_USAGE_BOOKKEEP;
> +
> +       ret =3D nouveau_job_init(&job->base, &args);
> +       if (ret)
> +               goto err_free;
> +
> +       *pjob =3D job;
> +       return 0;
> +
> +err_free:
> +       bind_job_ops_free(&job->ops);
> +       kfree(job);
> +       *pjob =3D NULL;
> +
> +       return ret;
> +}
> +
> +int
> +nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
> +                          void *data,
> +                          struct drm_file *file_priv)
> +{
> +       struct nouveau_cli *cli =3D nouveau_cli(file_priv);
> +       struct drm_nouveau_vm_init *init =3D data;
> +
> +       return nouveau_uvmm_init(&cli->uvmm, cli, init->unmanaged_addr,
> +                                init->unmanaged_size);
> +}
> +
> +static int
> +nouveau_uvmm_vm_bind(struct nouveau_uvmm_bind_job_args *args)
> +{
> +       struct nouveau_uvmm_bind_job *job;
> +       int ret;
> +
> +       ret =3D nouveau_uvmm_bind_job_init(&job, args);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D nouveau_job_submit(&job->base);
> +       if (ret)
> +               goto err_job_fini;
> +
> +       return 0;
> +
> +err_job_fini:
> +       nouveau_job_fini(&job->base);
> +       return ret;
> +}
> +
> +static int
> +nouveau_uvmm_vm_bind_ucopy(struct nouveau_uvmm_bind_job_args *args,
> +                          struct drm_nouveau_vm_bind __user *req)
> +{
> +       struct drm_nouveau_sync **s;
> +       u32 inc =3D req->wait_count;
> +       u64 ins =3D req->wait_ptr;
> +       u32 outc =3D req->sig_count;
> +       u64 outs =3D req->sig_ptr;
> +       u32 opc =3D req->op_count;
> +       u64 ops =3D req->op_ptr;
> +       int ret;
> +
> +       args->flags =3D req->flags;
> +
> +       args->op.count =3D opc;
> +       args->op.s =3D u_memcpya(ops, opc,
> +                             sizeof(*args->op.s));
> +       if (IS_ERR(args->op.s))
> +               return PTR_ERR(args->op.s);
> +
> +       if (inc) {
> +               s =3D &args->in_sync.s;
> +
> +               args->in_sync.count =3D inc;
> +               *s =3D u_memcpya(ins, inc, sizeof(**s));
> +               if (IS_ERR(*s)) {
> +                       ret =3D PTR_ERR(*s);
> +                       goto err_free_ops;
> +               }
> +       }
> +
> +       if (outc) {
> +               s =3D &args->out_sync.s;
> +
> +               args->out_sync.count =3D outc;
> +               *s =3D u_memcpya(outs, outc, sizeof(**s));
> +               if (IS_ERR(*s)) {
> +                       ret =3D PTR_ERR(*s);
> +                       goto err_free_ins;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_free_ops:
> +       u_free(args->op.s);
> +err_free_ins:
> +       u_free(args->in_sync.s);
> +       return ret;
> +}
> +
> +static void
> +nouveau_uvmm_vm_bind_ufree(struct nouveau_uvmm_bind_job_args *args)
> +{
> +       u_free(args->op.s);
> +       u_free(args->in_sync.s);
> +       u_free(args->out_sync.s);
> +}
> +
> +int
> +nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
> +                          void __user *data,
> +                          struct drm_file *file_priv)
> +{
> +       struct nouveau_cli *cli =3D nouveau_cli(file_priv);
> +       struct nouveau_uvmm_bind_job_args args =3D {};
> +       struct drm_nouveau_vm_bind __user *req =3D data;
> +       int ret =3D 0;
> +
> +       if (unlikely(!nouveau_cli_uvmm_locked(cli)))
> +               return -ENOSYS;
> +
> +       ret =3D nouveau_uvmm_vm_bind_ucopy(&args, req);
> +       if (ret)
> +               return ret;
> +
> +       args.sched_entity =3D &cli->sched_entity;
> +       args.file_priv =3D file_priv;
> +
> +       ret =3D nouveau_uvmm_vm_bind(&args);
> +       if (ret)
> +               goto out_free_args;
> +
> +out_free_args:
> +       nouveau_uvmm_vm_bind_ufree(&args);
> +       return ret;
> +}
> +
> +void
> +nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem=
)
> +{
> +       struct drm_gem_object *obj =3D &nvbo->bo.base;
> +       struct drm_gpuva *va;
> +
> +       dma_resv_assert_held(obj->resv);
> +
> +       drm_gem_for_each_gpuva(va, obj) {
> +               struct nouveau_uvma *uvma =3D uvma_from_va(va);
> +
> +               nouveau_uvma_map(uvma, mem);
> +               drm_gpuva_invalidate(va, false);
> +       }
> +}
> +
> +void
> +nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
> +{
> +       struct drm_gem_object *obj =3D &nvbo->bo.base;
> +       struct drm_gpuva *va;
> +
> +       dma_resv_assert_held(obj->resv);
> +
> +       drm_gem_for_each_gpuva(va, obj) {
> +               struct nouveau_uvma *uvma =3D uvma_from_va(va);
> +
> +               nouveau_uvma_unmap(uvma);
> +               drm_gpuva_invalidate(va, true);
> +       }
> +}
> +
> +int
> +nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
> +                 u64 unmanaged_addr, u64 unmanaged_size)
> +{
> +       int ret;
> +       u64 unmanaged_end =3D unmanaged_addr + unmanaged_size;
> +
> +       mutex_init(&uvmm->mutex);
> +       mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
> +       mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
> +
> +       mutex_lock(&cli->mutex);
> +
> +       if (unlikely(cli->uvmm.disabled)) {
> +               ret =3D -ENOSYS;
> +               goto out_unlock;
> +       }
> +
> +       if (unmanaged_end <=3D unmanaged_addr) {
> +               ret =3D -EINVAL;
> +               goto out_unlock;
> +       }
> +
> +       if (unmanaged_end > NOUVEAU_VA_SPACE_END) {
> +               ret =3D -EINVAL;
> +               goto out_unlock;
> +       }
> +
> +       uvmm->unmanaged_addr =3D unmanaged_addr;
> +       uvmm->unmanaged_size =3D unmanaged_size;
> +
> +       drm_gpuva_manager_init(&uvmm->umgr, cli->name,
> +                              NOUVEAU_VA_SPACE_START,
> +                              NOUVEAU_VA_SPACE_END,
> +                              unmanaged_addr, unmanaged_size,
> +                              NULL);
> +
> +       ret =3D nvif_vmm_ctor(&cli->mmu, "uvmm",
> +                           cli->vmm.vmm.object.oclass, RAW,
> +                           unmanaged_addr, unmanaged_size,
> +                           NULL, 0, &cli->uvmm.vmm.vmm);
> +       if (ret)
> +               goto out_free_gpuva_mgr;
> +
> +       cli->uvmm.vmm.cli =3D cli;
> +       mutex_unlock(&cli->mutex);
> +
> +       return 0;
> +
> +out_free_gpuva_mgr:
> +       drm_gpuva_manager_destroy(&uvmm->umgr);
> +out_unlock:
> +       mutex_unlock(&cli->mutex);
> +       return ret;
> +}
> +
> +void
> +nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
> +{
> +       MA_STATE(mas, &uvmm->region_mt, 0, 0);
> +       struct nouveau_uvma_region *reg;
> +       struct nouveau_cli *cli =3D uvmm->vmm.cli;
> +       struct nouveau_sched_entity *entity =3D &cli->sched_entity;
> +       struct drm_gpuva *va, *next;
> +
> +       if (!cli)
> +               return;
> +
> +       rmb(); /* for list_empty to work without lock */
> +       wait_event(entity->job.wq, list_empty(&entity->job.list.head));
> +
> +       nouveau_uvmm_lock(uvmm);
> +       drm_gpuva_for_each_va_safe(va, next, &uvmm->umgr) {
> +               struct nouveau_uvma *uvma =3D uvma_from_va(va);
> +               struct drm_gem_object *obj =3D va->gem.obj;
> +
> +               if (unlikely(va =3D=3D &uvmm->umgr.kernel_alloc_node))
> +                       continue;
> +
> +               drm_gpuva_remove(va);
> +
> +               dma_resv_lock(obj->resv, NULL);
> +               drm_gpuva_unlink(va);
> +               dma_resv_unlock(obj->resv);
> +
> +               nouveau_uvma_unmap(uvma);
> +               nouveau_uvma_vmm_put(uvma);
> +
> +               nouveau_uvma_gem_put(uvma);
> +               nouveau_uvma_free(uvma);
> +       }
> +
> +       mas_for_each(&mas, reg, ULONG_MAX) {
> +               mas_erase(&mas);
> +               nouveau_uvma_region_sparse_unref(reg);
> +               nouveau_uvma_region_put(reg);
> +       }
> +
> +       WARN(!mtree_empty(&uvmm->region_mt),
> +            "nouveau_uvma_region tree not empty, potentially leaking
> memory.");
> +       __mt_destroy(&uvmm->region_mt);
> +       nouveau_uvmm_unlock(uvmm);
> +
> +       mutex_lock(&cli->mutex);
> +       nouveau_vmm_fini(&uvmm->vmm);
> +       drm_gpuva_manager_destroy(&uvmm->umgr);
> +       mutex_unlock(&cli->mutex);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> new file mode 100644
> index 000000000000..374b8fbd2a59
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __NOUVEAU_UVMM_H__
> +#define __NOUVEAU_UVMM_H__
> +
> +#include <drm/drm_gpuva_mgr.h>
> +
> +#include "nouveau_drv.h"
> +
> +struct nouveau_uvmm {
> +       struct nouveau_vmm vmm;
> +       struct drm_gpuva_manager umgr;
> +       struct maple_tree region_mt;
> +       struct mutex mutex;
> +
> +       u64 unmanaged_addr;
> +       u64 unmanaged_size;
> +
> +       bool disabled;
> +};
> +
> +struct nouveau_uvma_region {
> +       struct nouveau_uvmm *uvmm;
> +
> +       struct {
> +               u64 addr;
> +               u64 range;
> +       } va;
> +
> +       struct kref kref;
> +
> +       struct completion complete;
> +       bool dirty;
> +};
> +
> +struct nouveau_uvma {
> +       struct drm_gpuva va;
> +
> +       struct nouveau_uvmm *uvmm;
> +       struct nouveau_uvma_region *region;
> +
> +       u8 kind;
> +};
> +
> +struct nouveau_uvmm_bind_job {
> +       struct nouveau_job base;
> +
> +       struct kref kref;
> +       struct list_head entry;
> +       struct work_struct work;
> +       struct completion complete;
> +
> +       /* struct bind_job_op */
> +       struct list_head ops;
> +};
> +
> +struct nouveau_uvmm_bind_job_args {
> +       struct drm_file *file_priv;
> +       struct nouveau_sched_entity *sched_entity;
> +
> +       unsigned int flags;
> +
> +       struct {
> +               struct drm_nouveau_sync *s;
> +               u32 count;
> +       } in_sync;
> +
> +       struct {
> +               struct drm_nouveau_sync *s;
> +               u32 count;
> +       } out_sync;
> +
> +       struct {
> +               struct drm_nouveau_vm_bind_op *s;
> +               u32 count;
> +       } op;
> +};
> +
> +#define to_uvmm_bind_job(job) container_of((job), struct
> nouveau_uvmm_bind_job, base)
> +
> +#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
> +#define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
> +
> +int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli=
,
> +                     u64 unmanaged_addr, u64 unmanaged_size);
> +void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
> +
> +void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_me=
m
> *mem);
> +void nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo);
> +
> +int nouveau_uvmm_ioctl_vm_init(struct drm_device *dev, void __user *data=
,
> +                              struct drm_file *file_priv);
> +
> +int nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev, void __user *data=
,
> +                              struct drm_file *file_priv);
> +
> +static inline void nouveau_uvmm_lock(struct nouveau_uvmm *uvmm)
> +{
> +       mutex_lock(&uvmm->mutex);
> +}
> +
> +static inline void nouveau_uvmm_unlock(struct nouveau_uvmm *uvmm)
> +{
> +       mutex_unlock(&uvmm->mutex);
> +}
> +
> +#endif
> --
> 2.41.0
>
>

--000000000000fd8b18060114cfae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBXZWQsIEp1bCAxOSwgMjAyMyBhdCA3OjE14oCvUE0gRGFuaWxv
IEtydW1tcmljaCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRha3JAcmVkaGF0LmNvbSI+ZGFrckByZWRo
YXQuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5UaGlzIGNvbW1pdCBwcm92aWRl
cyB0aGUgaW1wbGVtZW50YXRpb24gZm9yIHRoZSBuZXcgdWFwaSBtb3RpdmF0ZWQgYnkgdGhlPGJy
Pg0KVnVsa2FuIEFQSS4gSXQgYWxsb3dzIHVzZXIgbW9kZSBkcml2ZXJzIChVTURzKSB0bzo8YnI+
DQo8YnI+DQoxKSBJbml0aWFsaXplIGEgR1BVIHZpcnR1YWwgYWRkcmVzcyAoVkEpIHNwYWNlIHZp
YSB0aGUgbmV3PGJyPg0KwqAgwqBEUk1fSU9DVExfTk9VVkVBVV9WTV9JTklUIGlvY3RsIGZvciBV
TURzIHRvIHNwZWNpZnkgdGhlIHBvcnRpb24gb2YgVkE8YnI+DQrCoCDCoHNwYWNlIG1hbmFnZWQg
YnkgdGhlIGtlcm5lbCBhbmQgdXNlcnNwYWNlLCByZXNwZWN0aXZlbHkuPGJyPg0KPGJyPg0KMikg
QWxsb2NhdGUgYW5kIGZyZWUgYSBWQSBzcGFjZSByZWdpb24gYXMgd2VsbCBhcyBiaW5kIGFuZCB1
bmJpbmQgbWVtb3J5PGJyPg0KwqAgwqB0byB0aGUgR1BVcyBWQSBzcGFjZSB2aWEgdGhlIG5ldyBE
Uk1fSU9DVExfTk9VVkVBVV9WTV9CSU5EIGlvY3RsLjxicj4NCsKgIMKgVU1EcyBjYW4gcmVxdWVz
dCB0aGUgbmFtZWQgb3BlcmF0aW9ucyB0byBiZSBwcm9jZXNzZWQgZWl0aGVyPGJyPg0KwqAgwqBz
eW5jaHJvbm91c2x5IG9yIGFzeW5jaHJvbm91c2x5LiBJdCBzdXBwb3J0cyBEUk0gc3luY29ianM8
YnI+DQrCoCDCoChpbmNsLiB0aW1lbGluZXMpIGFzIHN5bmNocm9uaXphdGlvbiBtZWNoYW5pc20u
IFRoZSBtYW5hZ2VtZW50IG9mIHRoZTxicj4NCsKgIMKgR1BVIFZBIG1hcHBpbmdzIGlzIGltcGxl
bWVudGVkIHdpdGggdGhlIERSTSBHUFUgVkEgbWFuYWdlci48YnI+DQo8YnI+DQozKSBFeGVjdXRl
IHB1c2ggYnVmZmVycyB3aXRoIHRoZSBuZXcgRFJNX0lPQ1RMX05PVVZFQVVfRVhFQyBpb2N0bC4g
VGhlPGJyPg0KwqAgwqBleGVjdXRpb24gaGFwcGVucyBhc3luY2hyb25vdXNseS4gSXQgc3VwcG9y
dHMgRFJNIHN5bmNvYmogKGluY2wuPGJyPg0KwqAgwqB0aW1lbGluZXMpIGFzIHN5bmNocm9uaXph
dGlvbiBtZWNoYW5pc20uIERSTSBHRU0gb2JqZWN0IGxvY2tpbmcgaXM8YnI+DQrCoCDCoGhhbmRs
ZWQgd2l0aCBkcm1fZXhlYy48YnI+DQo8YnI+DQpCb3RoLCBEUk1fSU9DVExfTk9VVkVBVV9WTV9C
SU5EIGFuZCBEUk1fSU9DVExfTk9VVkVBVV9FWEVDLCB1c2UgdGhlIERSTTxicj4NCkdQVSBzY2hl
ZHVsZXIgZm9yIHRoZSBhc3luY2hyb25vdXMgcGF0aHMuPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxi
cj48L2Rpdj48ZGl2PklESyB3aGVyZSB0aGUgYmVzdCBwbGFjZSB0byB0YWxrIGFib3V0IHRoaXMg
aXMgYnV0IHRoaXMgc2VlbXMgYXMgZ29vZCBhcyBhbnkuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JJiMzOTt2ZSBiZWVuIGxvb2tpbmcgaW50byB3aHkgdGhlIFZ1bGthbiBDVFMgcnVucyBhYm91
dCAyeCBzbG93ZXIgZm9yIG1lIG9uIHRoZSBuZXcgVUFQSSBhbmQgSSBjcmVhdGVkIGEgbGl0dGxl
IGJlbmNobWFyayB0byBmYWNpbGl0YXRlIHRlc3Rpbmc6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj48YSBocmVmPSJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9jcnVjaWJsZS8t
L21lcmdlX3JlcXVlc3RzLzE0MSI+aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
Y3J1Y2libGUvLS9tZXJnZV9yZXF1ZXN0cy8xNDE8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5UaGUgdGVzdCwgcm91Z2hseSwgZG9lcyB0aGUgZm9sbG93aW5nOjwvZGl2PjxkaXY+wqAxLiBB
bGxvY2F0ZXMgYW5kIGJpbmRzIDEwMDAgQk9zPC9kaXY+PGRpdj7CoDIuIENvbnN0cnVjdHMgYSBw
dXNoYnVmIHRoYXQgZXhlY3V0ZXMgYSBuby1vcCBjb21wdXRlIHNoYWRlci48L2Rpdj48ZGl2PsKg
My4gRG9lcyBhIHNpbmdsZSBFWEVDL3dhaXQgY29tYm8gdG8gd2FybSB1cCB0aGUga2VybmVsPC9k
aXY+PGRpdj7CoDQuIExvb3BzIDEwLDAwMCB0aW1lcywgZG9pbmcgU1lOQ09CSl9SRVNFVCAoZmFz
dCksIEVYRUMsIGFuZCB0aGVuIFNZTkNPQkpfV0FJVCBhbmQgdGltZXMgdGhlIGxvb3A8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2Pk9mIGNvdXJzZSwgdGhlcmUmIzM5O3MgYSBiaXQgb2YgdXNlcnNw
YWNlIGRyaXZlciBvdmVyaGVhZCBidXQgdGhhdCYjMzk7cyBuZWdsZWRnYWJsZS48YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5JZiB5b3UgZHJvcCB0aGUgdG9wIHBhdGNoIHdoaWNoIGFsbG9j
YXRlcyAxayBidWZmZXJzLCB0aGUgc3VibWl0IHRpbWUgb24gdGhlIG9sZCB1QVBJIGlzIDxzcGFu
PjU0IHVzPC9zcGFuPjxzcGFuPi9leGVjIHZzLjwvc3Bhbj4gNjxzcGFuPjYgdXM8L3NwYW4+PHNw
YW4+L2V4ZWMgb24gdGhlIG5ldyBVQVBJLiBUaGlzIGluY2x1ZGVzIHRoZSB0aW1lIHRvIGRvIGEg
U1lOQ09CSl9SRVNFVCAoZmFzdCksIEVYRUMsIGFuZCBTWU5DT0JKX1dBSVQuPC9zcGFuPjxzcGFu
PiBUaGUgSW50ZWwgZHJpdmVyLCBieSBjb21wYXJpc29uLCBpcyAzM3VzL2V4ZWMgc28gaXQmIzM5
O3Mgbm90IHN5bmNvYmogb3ZlcmhlYWQuIFRoaXMgaXMgYSBiaXQgY29uY2VybmluZyAoeW91JiMz
OTtkIHRoaW5rIHRoZSBuZXcgdGhpbmcgd291bGQgYmUgZmFzdGVyKSBidXQgd2hhdCByZWFsbHkg
aGFzIG1lIGNvbmNlcm5lZCBpcyB0aGUgMWsgYnVmZmVyIGNhc2UuPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPklmIHlvdSBpbmNsdWRlIHRoZSB0b3Ag
cGF0Y2ggaW4gdGhlIGNydWNpYmxlIE1SLCBpdCBhbGxvY2F0ZXMgMTAwMCBCT3MgYW5kIFZNX0JJ
TkRzIHRoZW0uIEFsbCB0aGUgYmluZGluZyBpcyBkb25lIGJlZm9yZSB0aGUgd2FybXVwIEVYRUMu
IFN1ZGRlbmx5LCB0aGUgc3VibWl0IHRpbWUganVtcHMgdG8gMjU3IHVzL2V4ZWMgd2l0aCB0aGUg
bmV3IFVBUEkuIFRoZSBvbGQgVUFQSSBpcyBtdWNoIHdvcnNlICgxMTM0IHVzL2V4ZWMpIGJ1dCB0
aGF0JiMzOTtzIG5vdCB0aGUgcG9pbnQuIE9uY2Ugd2UmIzM5O3ZlIGRvbmUgdGhlIGZpcnN0IEVY
RUMgYW5kIGNyZWF0ZWQgb3VyIFZNIGJpbmRpbmdzLCB0aGUgY29zdCBwZXIgRVhFQyBzaG91bGRu
JiMzOTt0IGNoYW5nZSBhdCBhbGwgYmFzZWQgb24gdGhlIG51bWJlciBvZiBCT3MgYm91bmQuwqAg
UGFydCBvZiB0aGUgcG9pbnQgb2YgVk1fQklORCBpcyB0byBnZXQgYWxsIHRoYXQgYmluZGluZyBs
b2dpYyBhbmQgQk8gd2Fsa2luZyBvZmYgdGhlIEVYRUMgcGF0aC48L3NwYW4+PC9kaXY+PGRpdj48
c3Bhbj48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Tm9ybWFsbHksIEkgd291bGRuJiMzOTt0
IGJlIHRvbyB3b3JyaWVkIGFib3V0IGEgbGl0dGxlIHBlcmZvcm1hbmNlIHByb2JsZW0gbGlrZSB0
aGlzLiBUaGlzIGlzIHRoZSBmaXJzdCBpbXBsZW1lbnRhdGlvbiBhbmQgd2UgY2FuIGltcHJvdmUg
aXQgbGF0ZXIuIEkgZ2V0IHRoYXQuIEhvd2V2ZXIsIEkgc3VzcGVjdCB0aGUgc29sdXRpb24gdG8g
dGhpcyBwcm9ibGVtIGludm9sdmVzIG1vcmUgVUFQSSBhbmQgSSB3YW50IHRvIG1ha2Ugc3VyZSB3
ZSBoYXZlIGl0IGFsbCBiZWZvcmUgd2UgY2FsbCB0aGlzIGFsbCBkb25lIGFuZCBkdXN0ZWQgYW5k
IGxhbmQgaXQuPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlRoZSB3YXkgQU1EIHNvbHZlcyB0aGlzIHByb2JsZW0gYXMgd2VsbCBhcyB0aGUgbmV3IFhl
IGRyaXZlciBmb3IgSW50ZWwgaXMgdG8gaGF2ZSBhIGNvbmNlcHQgb2YgaW50ZXJuYWwgdnMuIGV4
dGVybmFsIEJPcy4gQmFzaWNhbGx5LCB0aGVyZSYjMzk7cyBhbiBJTlRFUk5BTCBiaXQgc3BlY2lm
aWVkIHNvbWV3aGVyZSBpbiBCTyBjcmVhdGlvbiB0aGF0IGhhcyBhIGZldyB1c2Vyc3BhY2UgaW1w
bGljYXRpb25zOjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPsKgMS4gSW4gdGhlIFhlIHdvcmxkIHdo
ZXJlIFZNcyBhcmUgb2JqZWN0cywgSU5URVJOQUwgQk9zIGFyZSBhc3NpZ25lZCBhIFZNIG9uIGNy
ZWF0aW9uIGFuZCBjYW4gbmV2ZXIgYmUgYm91bmQgdG8gYW55IG90aGVyIFZNLjwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPsKgMi4gQW55IGF0dGVtcHQgdG8gZXhwb3J0IGFuIElOVEVSTkFMIEJPIHZp
YSBwcmltZSBvciBhIHNpbWlsYXIgbWVjaGFuaXNtIHdpbGwgZmFpbCB3aXRoIC1FSU5WQUwgKEkg
dGhpbms/KS48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SW5zaWRlIHRoZSBr
ZXJuZWwgZHJpdmVyLCBhbGwgdGhlIGludGVybmFsIEJPcyBvbiBhIFZNIChvciBEUk0gZmlsZSBp
biB0aGUgY2FzZSBvZiBub3V2ZWF1L0FNRCBzaW5jZSB0aGV5IGRvbiYjMzk7dCBoYXZlIFZNIG9i
amVjdHMpIHNoYXJlIGEgc2luZ2xlIGRtYV9yZXN2IHdoaWNoIGFsbG93cyB5b3UgdG8gYXZvaWQg
aGF2aW5nIHRvIHdhbGsgbGlzdHMgb2YgQk9zIGFuZCB0YWtlIGxvY2tzIG9uIGV2ZXJ5IGV4ZWMu
IEluc3RlYWQsIHlvdSBjYW4ganVzdCBsb29rIGF0IHRoZSBmZW5jZXMgb24gdGhlIGRtYV9yZXN2
IGZvciB0aGUgVk0uIFRoZXJlJiMzOTtzIHN0aWxsIGEgQk8gbGlzdCBhc3NvY2lhdGVkIHdpdGgg
dGhlIFZNIGZvciBleHRlcm5hbCBCT3MgYnV0LCBpbiBtb3N0IFZ1bGthbiBhcHBsaWNhdGlvbnMs
IHRoZXJlIGFyZSBsZXNzIHRoYW4gYSBoYWxmIGRvemVuIGV4dGVybmFsIEJPcyB0b3RhbC7CoCBN
ZWFud2hpbGUsIHRoZSBodW5kcmVkcyBvciB0aG91c2FuZHMgb2YgQk9zIHVzZWQgZW50aXJlbHkg
aW50ZXJuYWxseSB0byB0aGUgYXBwbGljYXRpb24gYmFzaWNhbGx5IGNvdW50IGFzIG9uZSBCTyB3
aGVuIGl0IGNvbWVzIHRvIGxvY2tpbmcgb3ZlcmhlYWQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JJiMzOTttIG5vdCBhY3R1YWxseSB0cnlpbmcgdG8gZGljdGF0ZSBrZXJuZWwgZHJpdmVyIGRl
c2lnbiBoZXJlLiBJZiBvbmUgZG1hX3Jlc3YgZG9lc24mIzM5O3Qgd29yaywgZmluZS4gSSBkb24m
IzM5O3QgY2FyZSBhcyBsb25nIGFzIEVYRUMgc2NhbGVzLiBIb3dldmVyLCBnaXZlbiB0aGF0IHRo
ZSBzb2x1dGlvbiBpbiBhbGwgdGhlIG90aGVyIGRyaXZlcnMgaW52b2x2ZXMgYSBCTyBjcmVhdGUg
ZmxhZyBub3V2ZWF1IGRvZXNuJiMzOTt0IGhhdmUsIHdlIG5lZWQgdG8gZWl0aGVyIGFkZCB0aGF0
IG9yIHByb3ZlIHRoYXQgd2UgY2FuIGdldCBFWEVDIHRvIHNjYWxlIHdpdGhvdXQgaXQuPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5+RmFpdGg8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
Pg0KU2lnbmVkLW9mZi1ieTogRGFuaWxvIEtydW1tcmljaCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRh
a3JAcmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRha3JAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJy
Pg0KLS0tPGJyPg0KwqBEb2N1bWVudGF0aW9uL2dwdS9kcml2ZXItdWFwaS5yc3TCoCDCoCDCoCDC
oHzCoCDCoCAzICs8YnI+DQrCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tidWlsZMKgIMKgIMKg
IMKgIMKgIHzCoCDCoCAzICs8YnI+DQrCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWfC
oCDCoCDCoCDCoCDCoHzCoCDCoCAyICs8YnI+DQrCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfYWJpMTYuYyB8wqAgwqAyNCArPGJyPg0KwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2FiaTE2LmggfMKgIMKgIDEgKzxicj4NCsKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9iby5jwqAgwqAgfMKgIDE1NiArLTxicj4NCsKgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9iby5owqAgwqAgfMKgIMKgIDIgKy08YnI+DQrCoGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZHJtLmPCoCDCoHzCoCDCoDI3ICstPGJyPg0KwqBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5owqAgwqB8wqAgwqA1OSArLTxicj4NCsKgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9leGVjLmPCoCB8wqAgNDE0ICsrKysrPGJyPg0KwqBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2V4ZWMuaMKgIHzCoCDCoDU0ICs8YnI+DQrCoGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmPCoCDCoHzCoCDCoDI1ICstPGJyPg0K
wqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X21lbS5owqAgwqB8wqAgwqAgNSArPGJy
Pg0KwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMgfMKgIMKgIDIgKy08
YnI+DQrCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc2NoZWQuYyB8wqAgNDYyICsr
KysrKzxicj4NCsKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zY2hlZC5oIHzCoCAx
MjMgKys8YnI+DQrCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdXZtbS5jwqAgfCAx
OTcwICsrKysrKysrKysrKysrKysrKysrKysrPGJyPg0KwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3V2bW0uaMKgIHzCoCAxMDcgKys8YnI+DQrCoDE4IGZpbGVzIGNoYW5nZWQsIDMz
NzIgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pPGJyPg0KwqBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9leGVjLmM8YnI+DQrCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2V4ZWMuaDxicj4NCsKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc2NoZWQu
Yzxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfc2NoZWQuaDxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfdXZtbS5jPGJyPg0KwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV91dm1tLmg8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9ncHUvZHJpdmVyLXVhcGkucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJpdmVyLXVh
cGkucnN0PGJyPg0KaW5kZXggOWM3Y2E2ZTMzYTY4Li5jMDhiY2JiOTVmYjMgMTAwNjQ0PGJyPg0K
LS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJpdmVyLXVhcGkucnN0PGJyPg0KKysrIGIvRG9jdW1l
bnRhdGlvbi9ncHUvZHJpdmVyLXVhcGkucnN0PGJyPg0KQEAgLTEzLDQgKzEzLDcgQEAgZHJtL25v
dXZlYXUgdUFQSTxicj4NCsKgVk1fQklORCAvIEVYRUMgdUFQSTxicj4NCsKgLS0tLS0tLS0tLS0t
LS0tLS0tLTxicj4NCjxicj4NCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9leGVjLmM8YnI+DQorwqAgwqAgOmRvYzogT3ZlcnZpZXc8YnI+DQorPGJyPg0K
wqAuLiBrZXJuZWwtZG9jOjogaW5jbHVkZS91YXBpL2RybS9ub3V2ZWF1X2RybS5oPGJyPg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tidWlsZCBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L0tidWlsZDxicj4NCmluZGV4IDVlNTYxNzAwNmRhNS4uY2Y2YjNhODBjMGM4IDEw
MDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tidWlsZDxicj4NCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tidWlsZDxicj4NCkBAIC00Nyw2ICs0Nyw5IEBAIG5v
dXZlYXUteSArPSBub3V2ZWF1X3ByaW1lLm88YnI+DQrCoG5vdXZlYXUteSArPSBub3V2ZWF1X3Nn
ZG1hLm88YnI+DQrCoG5vdXZlYXUteSArPSBub3V2ZWF1X3R0bS5vPGJyPg0KwqBub3V2ZWF1LXkg
Kz0gbm91dmVhdV92bW0ubzxicj4NCitub3V2ZWF1LXkgKz0gbm91dmVhdV9leGVjLm88YnI+DQor
bm91dmVhdS15ICs9IG5vdXZlYXVfc2NoZWQubzxicj4NCitub3V2ZWF1LXkgKz0gbm91dmVhdV91
dm1tLm88YnI+DQo8YnI+DQrCoCMgRFJNIC0gbW9kZXNldHRpbmc8YnI+DQrCoG5vdXZlYXUtJChD
T05GSUdfRFJNX05PVVZFQVVfQkFDS0xJR0hUKSArPSBub3V2ZWF1X2JhY2tsaWdodC5vPGJyPg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9LY29uZmlnPGJyPg0KaW5kZXggYTcwYmQ2NWUxNDAwLi5jNTJlODA5NmNj
YTQgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZzxicj4N
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWc8YnI+DQpAQCAtMTAsNiArMTAs
OCBAQCBjb25maWcgRFJNX05PVVZFQVU8YnI+DQrCoCDCoCDCoCDCoCBzZWxlY3QgRFJNX0tNU19I
RUxQRVI8YnI+DQrCoCDCoCDCoCDCoCBzZWxlY3QgRFJNX1RUTTxicj4NCsKgIMKgIMKgIMKgIHNl
bGVjdCBEUk1fVFRNX0hFTFBFUjxicj4NCivCoCDCoCDCoCDCoHNlbGVjdCBEUk1fRVhFQzxicj4N
CivCoCDCoCDCoCDCoHNlbGVjdCBEUk1fU0NIRUQ8YnI+DQrCoCDCoCDCoCDCoCBzZWxlY3QgSTJD
PGJyPg0KwqAgwqAgwqAgwqAgc2VsZWN0IEkyQ19BTEdPQklUPGJyPg0KwqAgwqAgwqAgwqAgc2Vs
ZWN0IEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UgaWYgRFJNX05PVVZFQVVfQkFDS0xJR0hUPGJyPg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuYzxicj4NCmluZGV4IDgyZGFiNTFk
OGFlYi4uYTExMmYyODY4MWQzIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfYWJpMTYuYzxicj4NCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfYWJpMTYuYzxicj4NCkBAIC0zNSw2ICszNSw3IEBAPGJyPg0KwqAjaW5jbHVkZSAmcXVv
dDtub3V2ZWF1X2NoYW4uaCZxdW90Ozxicj4NCsKgI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9hYmkx
Ni5oJnF1b3Q7PGJyPg0KwqAjaW5jbHVkZSAmcXVvdDtub3V2ZWF1X3ZtbS5oJnF1b3Q7PGJyPg0K
KyNpbmNsdWRlICZxdW90O25vdXZlYXVfc2NoZWQuaCZxdW90Ozxicj4NCjxicj4NCsKgc3RhdGlj
IHN0cnVjdCBub3V2ZWF1X2FiaTE2ICo8YnI+DQrCoG5vdXZlYXVfYWJpMTYoc3RydWN0IGRybV9m
aWxlICpmaWxlX3ByaXYpPGJyPg0KQEAgLTEyNSw2ICsxMjYsMTcgQEAgbm91dmVhdV9hYmkxNl9j
aGFuX2Zpbmkoc3RydWN0IG5vdXZlYXVfYWJpMTYgKmFiaTE2LDxicj4NCsKgezxicj4NCsKgIMKg
IMKgIMKgIHN0cnVjdCBub3V2ZWF1X2FiaTE2X250ZnkgKm50ZnksICp0ZW1wOzxicj4NCjxicj4N
CivCoCDCoCDCoCDCoC8qIFdoZW4gYSBjbGllbnQgZXhpdHMgd2l0aG91dCB3YWl0aW5nIGZvciBp
dCYjMzk7cyBxdWV1ZWQgdXAgam9icyB0bzxicj4NCivCoCDCoCDCoCDCoCAqIGZpbmlzaCBpdCBt
aWdodCBoYXBwZW4gdGhhdCB3ZSBmYXVsdCB0aGUgY2hhbm5lbC4gVGhpcyBpcyBkdWUgdG88YnI+
DQorwqAgwqAgwqAgwqAgKiBkcm1fZmlsZV9mcmVlKCkgY2FsbGluZyBkcm1fZ2VtX3JlbGVhc2Uo
KSBiZWZvcmUgdGhlIHBvc3RjbG9zZSgpPGJyPg0KK8KgIMKgIMKgIMKgICogY2FsbGJhY2suIEhl
bmNlLCB3ZSBjYW4mIzM5O3QgdGVhciBkb3duIHRoaXMgc2NoZWR1bGVyIGVudGl0eSBiZWZvcmU8
YnI+DQorwqAgwqAgwqAgwqAgKiB1dm1tIG1hcHBpbmdzIGFyZSB1bm1hcHBlZC4gQ3VycmVudGx5
LCB3ZSBjYW4mIzM5O3QgZGV0ZWN0IHRoaXMgY2FzZS48YnI+DQorwqAgwqAgwqAgwqAgKjxicj4N
CivCoCDCoCDCoCDCoCAqIEhvd2V2ZXIsIHRoaXMgc2hvdWxkIGJlIHJhcmUgYW5kIGhhcm1sZXNz
LCBzaW5jZSB0aGUgY2hhbm5lbCBpc24mIzM5O3Q8YnI+DQorwqAgwqAgwqAgwqAgKiBuZWVkZWQg
YW55bW9yZS48YnI+DQorwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqBub3V2ZWF1X3Nj
aGVkX2VudGl0eV9maW5pKCZhbXA7Y2hhbi0mZ3Q7c2NoZWRfZW50aXR5KTs8YnI+DQorPGJyPg0K
wqAgwqAgwqAgwqAgLyogd2FpdCBmb3IgYWxsIGFjdGl2aXR5IHRvIHN0b3AgYmVmb3JlIGNsZWFu
aW5nIHVwICovPGJyPg0KwqAgwqAgwqAgwqAgaWYgKGNoYW4tJmd0O2NoYW4pPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgbm91dmVhdV9jaGFubmVsX2lkbGUoY2hhbi0mZ3Q7Y2hhbik7PGJy
Pg0KQEAgLTI2MSw2ICsyNzMsMTMgQEAgbm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2FsbG9j
KEFCSTE2X0lPQ1RMX0FSR1MpPGJyPg0KwqAgwqAgwqAgwqAgaWYgKCFkcm0tJmd0O2NoYW5uZWwp
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIG5vdXZlYXVfYWJpMTZfcHV0KGFi
aTE2LCAtRU5PREVWKTs8YnI+DQo8YnI+DQorwqAgwqAgwqAgwqAvKiBJZiB1dm1tIHdhc24mIzM5
O3QgaW5pdGlhbGl6ZWQgdW50aWwgbm93IGRpc2FibGUgaXQgY29tcGxldGVseSB0byBwcmV2ZW50
PGJyPg0KK8KgIMKgIMKgIMKgICogdXNlcnNwYWNlIGZyb20gbWl4aW5nIHVwIFVBUElzLjxicj4N
CivCoCDCoCDCoCDCoCAqPGJyPg0KK8KgIMKgIMKgIMKgICogVGhlIGNsaWVudCBsb2NrIGlzIGFs
cmVhZHkgYWNxdWlyZWQgYnkgbm91dmVhdV9hYmkxNl9nZXQoKS48YnI+DQorwqAgwqAgwqAgwqAg
Ki88YnI+DQorwqAgwqAgwqAgwqBfX25vdXZlYXVfY2xpX3V2bW1fZGlzYWJsZShjbGkpOzxicj4N
Cis8YnI+DQrCoCDCoCDCoCDCoCBkZXZpY2UgPSAmYW1wO2FiaTE2LSZndDtkZXZpY2U7PGJyPg0K
wqAgwqAgwqAgwqAgZW5naW5lID0gTlZfREVWSUNFX0hPU1RfUlVOTElTVF9FTkdJTkVTX0dSOzxi
cj4NCjxicj4NCkBAIC0zMDQsNiArMzIzLDExIEBAIG5vdXZlYXVfYWJpMTZfaW9jdGxfY2hhbm5l
bF9hbGxvYyhBQkkxNl9JT0NUTF9BUkdTKTxicj4NCsKgIMKgIMKgIMKgIGlmIChyZXQpPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBkb25lOzxicj4NCjxicj4NCivCoCDCoCDCoCDC
oHJldCA9IG5vdXZlYXVfc2NoZWRfZW50aXR5X2luaXQoJmFtcDtjaGFuLSZndDtzY2hlZF9lbnRp
dHksICZhbXA7ZHJtLSZndDtzY2hlZCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm0tJmd0O3NjaGVkX3dxKTs8YnI+DQor
wqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZG9u
ZTs8YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgaW5pdC0mZ3Q7Y2hhbm5lbCA9IGNoYW4tJmd0O2No
YW4tJmd0O2NoaWQ7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgaWYgKGRldmljZS0mZ3Q7aW5mby5m
YW1pbHkgJmd0Oz0gTlZfREVWSUNFX0lORk9fVjBfVEVTTEEpPGJyPg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuaCBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfYWJpMTYuaDxicj4NCmluZGV4IDI3ZWFlODVmMzNlNi4uODIwOWViMjhm
ZWFmIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJp
MTYuaDxicj4NCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuaDxi
cj4NCkBAIC0yNiw2ICsyNiw3IEBAIHN0cnVjdCBub3V2ZWF1X2FiaTE2X2NoYW4gezxicj4NCsKg
IMKgIMKgIMKgIHN0cnVjdCBub3V2ZWF1X2JvICpudGZ5Ozxicj4NCsKgIMKgIMKgIMKgIHN0cnVj
dCBub3V2ZWF1X3ZtYSAqbnRmeV92bWE7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IG52a21fbW3C
oCBoZWFwOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3NjaGVkX2VudGl0eSBzY2hl
ZF9lbnRpdHk7PGJyPg0KwqB9Ozxicj4NCjxicj4NCsKgc3RydWN0IG5vdXZlYXVfYWJpMTYgezxi
cj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM8YnI+DQppbmRleCBlOWNiYmY1OTRl
NmYuLjEyZDVkMmRiYmQ0ZSAxMDA2NDQ8YnI+DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmM8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JvLmM8YnI+DQpAQCAtMTk5LDcgKzE5OSw3IEBAIG5vdXZlYXVfYm9fZml4dXBfYWxpZ24oc3Ry
dWN0IG5vdXZlYXVfYm8gKm52Ym8sIGludCAqYWxpZ24sIHU2NCAqc2l6ZSk8YnI+DQo8YnI+DQrC
oHN0cnVjdCBub3V2ZWF1X2JvICo8YnI+DQrCoG5vdXZlYXVfYm9fYWxsb2Moc3RydWN0IG5vdXZl
YXVfY2xpICpjbGksIHU2NCAqc2l6ZSwgaW50ICphbGlnbiwgdTMyIGRvbWFpbiw8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgdTMyIHRpbGVfbW9kZSwgdTMyIHRpbGVfZmxhZ3MpPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHUzMiB0aWxlX21vZGUsIHUzMiB0aWxlX2ZsYWdzLCBi
b29sIGludGVybmFsKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIHN0cnVjdCBub3V2ZWF1X2Ry
bSAqZHJtID0gY2xpLSZndDtkcm07PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IG5vdXZlYXVfYm8g
Km52Ym87PGJyPg0KQEAgLTIyMSw4ICsyMjEsNiBAQCBub3V2ZWF1X2JvX2FsbG9jKHN0cnVjdCBu
b3V2ZWF1X2NsaSAqY2xpLCB1NjQgKnNpemUsIGludCAqYWxpZ24sIHUzMiBkb21haW4sPGJyPg0K
wqAgwqAgwqAgwqAgSU5JVF9MSVNUX0hFQUQoJmFtcDtudmJvLSZndDt2bWFfbGlzdCk7PGJyPg0K
wqAgwqAgwqAgwqAgbnZiby0mZ3Q7Ym8uYmRldiA9ICZhbXA7ZHJtLSZndDt0dG0uYmRldjs8YnI+
DQo8YnI+DQotwqAgwqAgwqAgwqBkcm1fZ2VtX2dwdXZhX2luaXQoJmFtcDtudmJvLSZndDtiby5i
YXNlKTs8YnI+DQotPGJyPg0KwqAgwqAgwqAgwqAgLyogVGhpcyBpcyBjb25mdXNpbmcsIGFuZCBk
b2VzbiYjMzk7dCBhY3R1YWxseSBtZWFuIHdlIHdhbnQgYW4gdW5jYWNoZWQ8YnI+DQrCoCDCoCDC
oCDCoCDCoCogbWFwcGluZywgYnV0IGlzIHdoYXQgTk9VVkVBVV9HRU1fRE9NQUlOX0NPSEVSRU5U
IGdldHMgdHJhbnNsYXRlZDxicj4NCsKgIMKgIMKgIMKgIMKgKiBpbnRvIGluIG5vdXZlYXVfZ2Vt
X25ldygpLjxicj4NCkBAIC0yMzUsNjggKzIzMywxMDMgQEAgbm91dmVhdV9ib19hbGxvYyhzdHJ1
Y3Qgbm91dmVhdV9jbGkgKmNsaSwgdTY0ICpzaXplLCBpbnQgKmFsaWduLCB1MzIgZG9tYWluLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG52Ym8tJmd0O2ZvcmNlX2Nv
aGVyZW50ID0gdHJ1ZTs8YnI+DQrCoCDCoCDCoCDCoCB9PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKg
aWYgKGNsaS0mZ3Q7ZGV2aWNlLmluZm8uZmFtaWx5ICZndDs9IE5WX0RFVklDRV9JTkZPX1YwX0ZF
Uk1JKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnZiby0mZ3Q7a2luZCA9ICh0aWxl
X2ZsYWdzICZhbXA7IDB4MDAwMGZmMDApICZndDsmZ3Q7IDg7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKCFudmlmX21tdV9raW5kX3ZhbGlkKG1tdSwgbnZiby0mZ3Q7a2luZCkpIHs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBrZnJlZShudmJvKTs8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gRVJSX1BUUigtRUlO
VkFMKTs8YnI+DQorwqAgwqAgwqAgwqBudmJvLSZndDtjb250aWcgPSAhKHRpbGVfZmxhZ3MgJmFt
cDsgTk9VVkVBVV9HRU1fVElMRV9OT05DT05USUcpOzxicj4NCivCoCDCoCDCoCDCoGlmICghbm91
dmVhdV9jbGlfdXZtbShjbGkpIHx8IGludGVybmFsKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLyogZm9yIEJPIG5vVk0gYWxsb2NzLCBkb24mIzM5O3QgYXNzaWduIGtpbmRzICovPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGNsaS0mZ3Q7ZGV2aWNlLmluZm8uZmFtaWx5
ICZndDs9IE5WX0RFVklDRV9JTkZPX1YwX0ZFUk1JKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbnZiby0mZ3Q7a2luZCA9ICh0aWxlX2ZsYWdzICZhbXA7IDB4MDAw
MGZmMDApICZndDsmZ3Q7IDg7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKCFudmlmX21tdV9raW5kX3ZhbGlkKG1tdSwgbnZiby0mZ3Q7a2luZCkpIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBrZnJlZShudmJv
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXR1cm4gRVJSX1BUUigtRUlOVkFMKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG52Ym8tJmd0O2NvbXAgPSBtbXUtJmd0O2tpbmRbbnZiby0mZ3Q7a2luZF0gIT0gbnZiby0mZ3Q7
a2luZDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9IGVsc2UgaWYgKGNsaS0mZ3Q7ZGV2
aWNlLmluZm8uZmFtaWx5ICZndDs9IE5WX0RFVklDRV9JTkZPX1YwX1RFU0xBKSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnZiby0mZ3Q7a2luZCA9ICh0aWxlX2Zs
YWdzICZhbXA7IDB4MDAwMDdmMDApICZndDsmZ3Q7IDg7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbnZiby0mZ3Q7Y29tcCA9ICh0aWxlX2ZsYWdzICZhbXA7IDB4MDAw
MzAwMDApICZndDsmZ3Q7IDE2Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmICghbnZpZl9tbXVfa2luZF92YWxpZChtbXUsIG52Ym8tJmd0O2tpbmQpKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKga2ZyZWUobnZi
byk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0gZWxzZSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnZiby0mZ3Q7emV0YSA9ICh0aWxlX2Zs
YWdzICZhbXA7IDB4MDAwMDAwMDcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudmJvLSZndDttb2RlID0gdGlsZV9tb2RlOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBEZXRlcm1pbmUgdGhlIGRlc2lyYWJs
ZSB0YXJnZXQgR1BVIHBhZ2Ugc2l6ZSBmb3IgdGhlIGJ1ZmZlci4gKi88YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgdm1tLSZndDtwYWdlX25yOyBpKyspIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBCZWNhdXNlIHdlIGNh
bm5vdCBjdXJyZW50bHkgYWxsb3cgVk1NIG1hcHMgdG8gZmFpbDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIGR1cmluZyBidWZmZXIgbWlncmF0aW9uLCB3ZSBuZWVk
IHRvIGRldGVybWluZSBwYWdlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICogc2l6ZSBmb3IgdGhlIGJ1ZmZlciB1cC1mcm9udCwgYW5kIHByZS1hbGxvY2F0ZSBpdHM8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBwYWdlIHRhYmxlcy48
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKjxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIFNraXAgcGFnZSBzaXplcyB0aGF0IGNhbiYj
Mzk7dCBzdXBwb3J0IG5lZWRlZCBkb21haW5zLjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChjbGktJmd0O2RldmljZS5pbmZvLmZhbWlseSAmZ3Q7IE5WX0RFVklDRV9JTkZPX1YwX0NV
UklFICZhbXA7JmFtcDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAoZG9tYWluICZhbXA7IE5PVVZFQVVfR0VNX0RPTUFJTl9WUkFNKSAmYW1wOyZhbXA7ICF2
bW0tJmd0O3BhZ2VbaV0udnJhbSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAoKGRvbWFpbiAmYW1wOyBOT1VWRUFVX0dFTV9ET01BSU5fR0FSVCkgJmFt
cDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgh
dm1tLSZndDtwYWdlW2ldLmhvc3QgfHwgdm1tLSZndDtwYWdlW2ldLnNoaWZ0ICZndDsgUEFHRV9T
SElGVCkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29udGludWU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoC8qIFNlbGVjdCB0aGlzIHBhZ2Ugc2l6ZSBpZiBpdCYjMzk7cyB0aGUgZmlyc3QgdGhhdCBz
dXBwb3J0czxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHRoZSBw
b3RlbnRpYWwgbWVtb3J5IGRvbWFpbnMsIG9yIHdoZW4gaXQmIzM5O3MgY29tcGF0aWJsZTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHdpdGggdGhlIHJlcXVlc3Rl
ZCBjb21wcmVzc2lvbiBzZXR0aW5ncy48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
cGkgJmx0OyAwIHx8ICFudmJvLSZndDtjb21wIHx8IHZtbS0mZ3Q7cGFnZVtpXS5jb21wKTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpID0gaTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogU3RvcCBv
bmNlIHRoZSBidWZmZXIgaXMgbGFyZ2VyIHRoYW4gdGhlIGN1cnJlbnQgcGFnZSBzaXplLiAqLzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICgqc2l6ZSAmZ3Q7PSAx
VUxMICZsdDsmbHQ7IHZtbS0mZ3Q7cGFnZVtpXS5zaGlmdCk8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnZiby0mZ3Q7
Y29tcCA9IG1tdS0mZ3Q7a2luZFtudmJvLSZndDtraW5kXSAhPSBudmJvLSZndDtraW5kOzxicj4N
Ci3CoCDCoCDCoCDCoH0gZWxzZTxicj4NCi3CoCDCoCDCoCDCoGlmIChjbGktJmd0O2RldmljZS5p
bmZvLmZhbWlseSAmZ3Q7PSBOVl9ERVZJQ0VfSU5GT19WMF9URVNMQSkgezxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoG52Ym8tJmd0O2tpbmQgPSAodGlsZV9mbGFncyAmYW1wOyAweDAwMDA3
ZjAwKSAmZ3Q7Jmd0OyA4Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG52Ym8tJmd0O2Nv
bXAgPSAodGlsZV9mbGFncyAmYW1wOyAweDAwMDMwMDAwKSAmZ3Q7Jmd0OyAxNjs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIW52aWZfbW11X2tpbmRfdmFsaWQobW11LCBudmJvLSZn
dDtraW5kKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChXQVJOX09OKHBpICZs
dDsgMCkpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBrZnJlZShu
dmJvKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KLcKgIMKg
IMKgIMKgfSBlbHNlIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudmJvLSZndDt6ZXRh
ID0gKHRpbGVfZmxhZ3MgJmFtcDsgMHgwMDAwMDAwNyk7PGJyPg0KLcKgIMKgIMKgIMKgfTxicj4N
Ci3CoCDCoCDCoCDCoG52Ym8tJmd0O21vZGUgPSB0aWxlX21vZGU7PGJyPg0KLcKgIMKgIMKgIMKg
bnZiby0mZ3Q7Y29udGlnID0gISh0aWxlX2ZsYWdzICZhbXA7IE5PVVZFQVVfR0VNX1RJTEVfTk9O
Q09OVElHKTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqAvKiBEZXRlcm1pbmUgdGhlIGRlc2lyYWJs
ZSB0YXJnZXQgR1BVIHBhZ2Ugc2l6ZSBmb3IgdGhlIGJ1ZmZlci4gKi88YnI+DQotwqAgwqAgwqAg
wqBmb3IgKGkgPSAwOyBpICZsdDsgdm1tLSZndDtwYWdlX25yOyBpKyspIHs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAvKiBCZWNhdXNlIHdlIGNhbm5vdCBjdXJyZW50bHkgYWxsb3cgVk1N
IG1hcHMgdG8gZmFpbDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIGR1cmluZyBidWZm
ZXIgbWlncmF0aW9uLCB3ZSBuZWVkIHRvIGRldGVybWluZSBwYWdlPGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICogc2l6ZSBmb3IgdGhlIGJ1ZmZlciB1cC1mcm9udCwgYW5kIHByZS1hbGxv
Y2F0ZSBpdHM8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBwYWdlIHRhYmxlcy48YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqIFNraXAgcGFnZSBzaXplcyB0aGF0IGNhbiYjMzk7dCBzdXBwb3J0IG5lZWRlZCBkb21haW5z
Ljxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChjbGktJmd0O2RldmljZS5pbmZvLmZhbWlseSAmZ3Q7IE5WX0RFVklDRV9JTkZP
X1YwX0NVUklFICZhbXA7JmFtcDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAo
ZG9tYWluICZhbXA7IE5PVVZFQVVfR0VNX0RPTUFJTl9WUkFNKSAmYW1wOyZhbXA7ICF2bW0tJmd0
O3BhZ2VbaV0udnJhbSk8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b250aW51ZTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoKGRvbWFpbiAmYW1wOyBO
T1VWRUFVX0dFTV9ET01BSU5fR0FSVCkgJmFtcDsmYW1wOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCghdm1tLSZndDtwYWdlW2ldLmhvc3QgfHwgdm1tLSZndDtwYWdlW2ldLnNo
aWZ0ICZndDsgUEFHRV9TSElGVCkpPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29udGludWU7PGJyPg0KLTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIFNl
bGVjdCB0aGlzIHBhZ2Ugc2l6ZSBpZiBpdCYjMzk7cyB0aGUgZmlyc3QgdGhhdCBzdXBwb3J0czxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHRoZSBwb3RlbnRpYWwgbWVtb3J5IGRvbWFp
bnMsIG9yIHdoZW4gaXQmIzM5O3MgY29tcGF0aWJsZTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAqIHdpdGggdGhlIHJlcXVlc3RlZCBjb21wcmVzc2lvbiBzZXR0aW5ncy48YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
cGkgJmx0OyAwIHx8ICFudmJvLSZndDtjb21wIHx8IHZtbS0mZ3Q7cGFnZVtpXS5jb21wKTxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpID0gaTs8YnI+DQotPGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogU3RvcCBvbmNlIHRoZSBidWZmZXIgaXMgbGFyZ2Vy
IHRoYW4gdGhlIGN1cnJlbnQgcGFnZSBzaXplLiAqLzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmICgqc2l6ZSAmZ3Q7PSAxVUxMICZsdDsmbHQ7IHZtbS0mZ3Q7cGFnZVtpXS5zaGlmdCk8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQotwqAg
wqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogRGlzYWJsZSBjb21wcmVz
c2lvbiBpZiBzdWl0YWJsZSBzZXR0aW5ncyBjb3VsZG4mIzM5O3QgYmUgZm91bmQuICovPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG52Ym8tJmd0O2NvbXAgJmFtcDsmYW1wOyAhdm1t
LSZndDtwYWdlW3BpXS5jb21wKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaWYgKG1tdS0mZ3Q7b2JqZWN0Lm9jbGFzcyAmZ3Q7PSBOVklGX0NMQVNTX01NVV9HRjEw
MCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBu
dmJvLSZndDtraW5kID0gbW11LSZndDtraW5kW252Ym8tJmd0O2tpbmRdOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG52Ym8tJmd0O2NvbXAgPSAwOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudmJvLSZn
dDtwYWdlID0gdm1tLSZndDtwYWdlW3BpXS5zaGlmdDs8YnI+DQorwqAgwqAgwqAgwqB9IGVsc2Ug
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHJlamVjdCBvdGhlciB0aWxlIGZsYWdz
IHdoZW4gaW4gVk0gbW9kZS4gKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAodGls
ZV9tb2RlKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBF
UlJfUFRSKC1FSU5WQUwpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICh0aWxlX2Zs
YWdzICZhbXA7IH5OT1VWRUFVX0dFTV9USUxFX05PTkNPTlRJRyk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTs8YnI+DQo8YnI+
DQotwqAgwqAgwqAgwqBpZiAoV0FSTl9PTihwaSAmbHQ7IDApKSB7PGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKga2ZyZWUobnZibyk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIEVSUl9QVFIoLUVJTlZBTCk7PGJyPg0KLcKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoC8qIERldGVybWluZSB0aGUgZGVzaXJhYmxlIHRhcmdldCBHUFUgcGFnZSBz
aXplIGZvciB0aGUgYnVmZmVyLiAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZvciAo
aSA9IDA7IGkgJmx0OyB2bW0tJmd0O3BhZ2VfbnI7IGkrKykgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIEJlY2F1c2Ugd2UgY2Fubm90IGN1cnJlbnRseSBhbGxv
dyBWTU0gbWFwcyB0byBmYWlsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICogZHVyaW5nIGJ1ZmZlciBtaWdyYXRpb24sIHdlIG5lZWQgdG8gZGV0ZXJtaW5lIHBhZ2U8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBzaXplIGZvciB0aGUg
YnVmZmVyIHVwLWZyb250LCBhbmQgcHJlLWFsbG9jYXRlIGl0czxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHBhZ2UgdGFibGVzLjxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICogU2tpcCBwYWdlIHNpemVzIHRoYXQgY2FuJiMzOTt0IHN1cHBvcnQgbmVlZGVk
IGRvbWFpbnMuPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKChkb21haW4gJmFtcDsg
Tk9VVkVBVV9HRU1fRE9NQUlOX1ZSQU0pICZhbXA7JmFtcDsgIXZtbS0mZ3Q7cGFnZVtpXS52cmFt
KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bnRpbnVlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICgoZG9t
YWluICZhbXA7IE5PVVZFQVVfR0VNX0RPTUFJTl9HQVJUKSAmYW1wOyZhbXA7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKCF2bW0tJmd0O3BhZ2VbaV0uaG9z
dCB8fCB2bW0tJmd0O3BhZ2VbaV0uc2hpZnQgJmd0OyBQQUdFX1NISUZUKSk8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQo8
YnI+DQotwqAgwqAgwqAgwqAvKiBEaXNhYmxlIGNvbXByZXNzaW9uIGlmIHN1aXRhYmxlIHNldHRp
bmdzIGNvdWxkbiYjMzk7dCBiZSBmb3VuZC4gKi88YnI+DQotwqAgwqAgwqAgwqBpZiAobnZiby0m
Z3Q7Y29tcCAmYW1wOyZhbXA7ICF2bW0tJmd0O3BhZ2VbcGldLmNvbXApIHs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAobW11LSZndDtvYmplY3Qub2NsYXNzICZndDs9IE5WSUZfQ0xB
U1NfTU1VX0dGMTAwKTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG52
Ym8tJmd0O2tpbmQgPSBtbXUtJmd0O2tpbmRbbnZiby0mZ3Q7a2luZF07PGJyPg0KLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgbnZiby0mZ3Q7Y29tcCA9IDA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHBpICZsdDsgMCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaSA9IGk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogU3RvcCBvbmNlIHRoZSBidWZmZXIgaXMgbGFyZ2VyIHRo
YW4gdGhlIGN1cnJlbnQgcGFnZSBzaXplLiAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGlmICgqc2l6ZSAmZ3Q7PSAxVUxMICZsdDsmbHQ7IHZtbS0mZ3Q7cGFnZVtp
XS5zaGlmdCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaWYgKFdBUk5fT04ocGkgJmx0OyAwKSkgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGtmcmVlKG52Ym8pOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudmJvLSZn
dDtwYWdlID0gdm1tLSZndDtwYWdlW3BpXS5zaGlmdDs8YnI+DQrCoCDCoCDCoCDCoCB9PGJyPg0K
LcKgIMKgIMKgIMKgbnZiby0mZ3Q7cGFnZSA9IHZtbS0mZ3Q7cGFnZVtwaV0uc2hpZnQ7PGJyPg0K
PGJyPg0KwqAgwqAgwqAgwqAgbm91dmVhdV9ib19maXh1cF9hbGlnbihudmJvLCBhbGlnbiwgc2l6
ZSk7PGJyPg0KPGJyPg0KQEAgLTMxMyw2ICszNDYsMTMgQEAgbm91dmVhdV9ib19pbml0KHN0cnVj
dCBub3V2ZWF1X2JvICpudmJvLCB1NjQgc2l6ZSwgaW50IGFsaWduLCB1MzIgZG9tYWluLDxicj4N
CsKgIMKgIMKgIMKgIG5vdXZlYXVfYm9fcGxhY2VtZW50X3NldChudmJvLCBkb21haW4sIDApOzxi
cj4NCsKgIMKgIMKgIMKgIElOSVRfTElTVF9IRUFEKCZhbXA7bnZiby0mZ3Q7aW9fcmVzZXJ2ZV9s
cnUpOzxicj4NCjxicj4NCivCoCDCoCDCoCDCoC8qIEF0IHRoaXMgcG9pbnQgd2UmIzM5O3JlIGd1
YXJhbnRlZWQgdGhlIGRtYS1yZXN2IG9mIHRoZSBkcm1fZ2VtX29iamVjdCBpczxicj4NCivCoCDC
oCDCoCDCoCAqIGluaXRpYWxpemVkLiBXZSBhbHNvIGNhbiYjMzk7dCBkbyBpdCBhZnRlciB0dG1f
Ym9faW5pdF92YWxpZGF0ZSgpLDxicj4NCivCoCDCoCDCoCDCoCAqIGJlY2F1c2UgZHVyaW5nIHZh
bGlkYXRpb24gd2UgbWlnaHQgcmVjZWl2ZSBhIGJvX21vdmUoKSBjYWxsYmFjayB3aGVyZTxicj4N
CivCoCDCoCDCoCDCoCAqIHdlIGFscmVhZHkgbmVlZCB0byBpdGVyYXRlIHRoZSBHRU1zIEdQVVZB
IGxpc3QuPGJyPg0KK8KgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKgIMKgIMKgZHJtX2dlbV9ncHV2
YV9pbml0KCZhbXA7bnZiby0mZ3Q7Ym8uYmFzZSk7PGJyPg0KKzxicj4NCsKgIMKgIMKgIMKgIHJl
dCA9IHR0bV9ib19pbml0X3ZhbGlkYXRlKG52Ym8tJmd0O2JvLmJkZXYsICZhbXA7bnZiby0mZ3Q7
Ym8sIHR5cGUsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmYW1wO252Ym8tJmd0O3BsYWNlbWVudCwgYWxpZ24gJmd0OyZndDsgUEFHRV9T
SElGVCwgZmFsc2UsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzZywgcm9iaiwgbm91dmVhdV9ib19kZWxfdHRtKTs8YnI+DQpAQCAtMzM0
LDcgKzM3NCw3IEBAIG5vdXZlYXVfYm9fbmV3KHN0cnVjdCBub3V2ZWF1X2NsaSAqY2xpLCB1NjQg
c2l6ZSwgaW50IGFsaWduLDxicj4NCsKgIMKgIMKgIMKgIGludCByZXQ7PGJyPg0KPGJyPg0KwqAg
wqAgwqAgwqAgbnZibyA9IG5vdXZlYXVfYm9fYWxsb2MoY2xpLCAmYW1wO3NpemUsICZhbXA7YWxp
Z24sIGRvbWFpbiwgdGlsZV9tb2RlLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRpbGVfZmxhZ3MpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRpbGVfZmxhZ3MsIHRydWUpOzxicj4NCsKgIMKg
IMKgIMKgIGlmIChJU19FUlIobnZibykpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0
dXJuIFBUUl9FUlIobnZibyk7PGJyPg0KPGJyPg0KQEAgLTk0OCw2ICs5ODgsNyBAQCBzdGF0aWMg
dm9pZCBub3V2ZWF1X2JvX21vdmVfbnRmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxpc3RfZm9yX2VhY2hfZW50cnkodm1hLCAmYW1w
O252Ym8tJmd0O3ZtYV9saXN0LCBoZWFkKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgbm91dmVhdV92bWFfbWFwKHZtYSwgbWVtKTs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1tX2Jv
X21hcF9hbGwobnZibywgbWVtKTs8YnI+DQrCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGxpc3RfZm9yX2VhY2hfZW50cnkodm1hLCAmYW1wO252Ym8tJmd0
O3ZtYV9saXN0LCBoZWFkKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmV0ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0KGJvLSZndDtiYXNlLnJlc3YsPGJyPg0KQEAg
LTk1Niw2ICs5OTcsNyBAQCBzdGF0aWMgdm9pZCBub3V2ZWF1X2JvX21vdmVfbnRmeShzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFdBUk5fT04ocmV0ICZsdDs9IDApOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIG5vdXZlYXVfdm1hX3VubWFwKHZtYSk7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtbV9ib191
bm1hcF9hbGwobnZibyk7PGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCjxicj4NCsKgIMKgIMKgIMKg
IGlmIChuZXdfcmVnKTxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JvLmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmg8YnI+DQpp
bmRleCA3NzRkZDkzY2E3NmIuLmNiODUyMDdkOWU4ZiAxMDA2NDQ8YnI+DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmg8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmg8YnI+DQpAQCAtNzMsNyArNzMsNyBAQCBleHRlcm4gc3RydWN0
IHR0bV9kZXZpY2VfZnVuY3Mgbm91dmVhdV9ib19kcml2ZXI7PGJyPg0KPGJyPg0KwqB2b2lkIG5v
dXZlYXVfYm9fbW92ZV9pbml0KHN0cnVjdCBub3V2ZWF1X2RybSAqKTs8YnI+DQrCoHN0cnVjdCBu
b3V2ZWF1X2JvICpub3V2ZWF1X2JvX2FsbG9jKHN0cnVjdCBub3V2ZWF1X2NsaSAqLCB1NjQgKnNp
emUsIGludCAqYWxpZ24sPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdTMyIGRvbWFpbiwgdTMyIHRpbGVfbW9kZSwgdTMyIHRpbGVfZmxh
Z3MpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHUzMiBkb21haW4sIHUzMiB0aWxlX21vZGUsIHUzMiB0aWxlX2ZsYWdzLCBib29sIGlu
dGVybmFsKTs8YnI+DQrCoGludMKgIG5vdXZlYXVfYm9faW5pdChzdHJ1Y3Qgbm91dmVhdV9ibyAq
LCB1NjQgc2l6ZSwgaW50IGFsaWduLCB1MzIgZG9tYWluLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RydWN0IHNnX3RhYmxlICpzZywgc3RydWN0IGRtYV9yZXN2ICpyb2Jq
KTs8YnI+DQrCoGludMKgIG5vdXZlYXVfYm9fbmV3KHN0cnVjdCBub3V2ZWF1X2NsaSAqLCB1NjQg
c2l6ZSwgaW50IGFsaWduLCB1MzIgZG9tYWluLDxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kcm0uYzxicj4NCmluZGV4IGNhM2JiODA3NTM1Ny4uNGJkZTQ3YjU0NDVkIDEwMDY0NDxi
cj4NCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmM8YnI+DQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jPGJyPg0KQEAgLTY4LDYgKzY4
LDkgQEA8YnI+DQrCoCNpbmNsdWRlICZxdW90O25vdXZlYXVfcGxhdGZvcm0uaCZxdW90Ozxicj4N
CsKgI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9zdm0uaCZxdW90Ozxicj4NCsKgI2luY2x1ZGUgJnF1
b3Q7bm91dmVhdV9kbWVtLmgmcXVvdDs8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9leGVj
LmgmcXVvdDs8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV91dm1tLmgmcXVvdDs8YnI+DQor
I2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9zY2hlZC5oJnF1b3Q7PGJyPg0KPGJyPg0KwqBERUNMQVJF
X0RZTkRCR19DTEFTU01BUChkcm1fZGVidWdfY2xhc3NlcywgRERfQ0xBU1NfVFlQRV9ESVNKT0lO
VF9CSVRTLCAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90
O0RSTV9VVF9DT1JFJnF1b3Q7LDxicj4NCkBAIC0xOTYsNiArMTk5LDggQEAgbm91dmVhdV9jbGlf
ZmluaShzdHJ1Y3Qgbm91dmVhdV9jbGkgKmNsaSk8YnI+DQrCoCDCoCDCoCDCoCBXQVJOX09OKCFs
aXN0X2VtcHR5KCZhbXA7Y2xpLSZndDt3b3JrZXIpKTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCB1
c2lmX2NsaWVudF9maW5pKGNsaSk7PGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV91dm1tX2Zpbmko
JmFtcDtjbGktJmd0O3V2bW0pOzxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfc2NoZWRfZW50aXR5
X2ZpbmkoJmFtcDtjbGktJmd0O3NjaGVkX2VudGl0eSk7PGJyPg0KwqAgwqAgwqAgwqAgbm91dmVh
dV92bW1fZmluaSgmYW1wO2NsaS0mZ3Q7c3ZtKTs8YnI+DQrCoCDCoCDCoCDCoCBub3V2ZWF1X3Zt
bV9maW5pKCZhbXA7Y2xpLSZndDt2bW0pOzxicj4NCsKgIMKgIMKgIMKgIG52aWZfbW11X2R0b3Io
JmFtcDtjbGktJmd0O21tdSk7PGJyPg0KQEAgLTMwMSw2ICszMDYsMTIgQEAgbm91dmVhdV9jbGlf
aW5pdChzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwgY29uc3QgY2hhciAqc25hbWUsPGJyPg0KwqAg
wqAgwqAgwqAgfTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGNsaS0mZ3Q7bWVtID0gJmFtcDttZW1z
W3JldF07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfc2NoZWRfZW50aXR5
X2luaXQoJmFtcDtjbGktJmd0O3NjaGVkX2VudGl0eSwgJmFtcDtkcm0tJmd0O3NjaGVkLDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGRybS0mZ3Q7c2NoZWRfd3EpOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBkb25lOzxicj4NCis8YnI+DQrCoCDCoCDCoCDCoCBy
ZXR1cm4gMDs8YnI+DQrCoGRvbmU6PGJyPg0KwqAgwqAgwqAgwqAgaWYgKHJldCk8YnI+DQpAQCAt
NTU0LDEwICs1NjUsMTQgQEAgbm91dmVhdV9kcm1fZGV2aWNlX2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldik8YnI+DQrCoCDCoCDCoCDCoCBudmlmX3BhcmVudF9jdG9yKCZhbXA7bm91dmVhdV9w
YXJlbnQsICZhbXA7ZHJtLSZndDtwYXJlbnQpOzxicj4NCsKgIMKgIMKgIMKgIGRybS0mZ3Q7bWFz
dGVyLmJhc2Uub2JqZWN0LnBhcmVudCA9ICZhbXA7ZHJtLSZndDtwYXJlbnQ7PGJyPg0KPGJyPg0K
LcKgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV9jbGlfaW5pdChkcm0sICZxdW90O0RSTS1tYXN0ZXIm
cXVvdDssICZhbXA7ZHJtLSZndDttYXN0ZXIpOzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG5vdXZl
YXVfc2NoZWRfaW5pdChkcm0pOzxicj4NCsKgIMKgIMKgIMKgIGlmIChyZXQpPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZ290byBmYWlsX2FsbG9jOzxicj4NCjxicj4NCivCoCDCoCDCoCDC
oHJldCA9IG5vdXZlYXVfY2xpX2luaXQoZHJtLCAmcXVvdDtEUk0tbWFzdGVyJnF1b3Q7LCAmYW1w
O2RybS0mZ3Q7bWFzdGVyKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdvdG8gZmFpbF9zY2hlZDs8YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAg
cmV0ID0gbm91dmVhdV9jbGlfaW5pdChkcm0sICZxdW90O0RSTSZxdW90OywgJmFtcDtkcm0tJmd0
O2NsaWVudCk7PGJyPg0KwqAgwqAgwqAgwqAgaWYgKHJldCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBnb3RvIGZhaWxfbWFzdGVyOzxicj4NCkBAIC02MTQsNyArNjI5LDYgQEAgbm91dmVh
dV9kcm1fZGV2aWNlX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldik8YnI+DQrCoCDCoCDCoCDC
oCB9PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgcmV0dXJuIDA7PGJyPg0KLTxicj4NCsKgZmFpbF9k
aXNwaW5pdDo8YnI+DQrCoCDCoCDCoCDCoCBub3V2ZWF1X2Rpc3BsYXlfZGVzdHJveShkZXYpOzxi
cj4NCsKgZmFpbF9kaXNwY3Rvcjo8YnI+DQpAQCAtNjI3LDYgKzY0MSw4IEBAIG5vdXZlYXVfZHJt
X2RldmljZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpPGJyPg0KwqAgwqAgwqAgwqAgbm91
dmVhdV9jbGlfZmluaSgmYW1wO2RybS0mZ3Q7Y2xpZW50KTs8YnI+DQrCoGZhaWxfbWFzdGVyOjxi
cj4NCsKgIMKgIMKgIMKgIG5vdXZlYXVfY2xpX2ZpbmkoJmFtcDtkcm0tJmd0O21hc3Rlcik7PGJy
Pg0KK2ZhaWxfc2NoZWQ6PGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV9zY2hlZF9maW5pKGRybSk7
PGJyPg0KwqBmYWlsX2FsbG9jOjxicj4NCsKgIMKgIMKgIMKgIG52aWZfcGFyZW50X2R0b3IoJmFt
cDtkcm0tJmd0O3BhcmVudCk7PGJyPg0KwqAgwqAgwqAgwqAga2ZyZWUoZHJtKTs8YnI+DQpAQCAt
Njc4LDYgKzY5NCw4IEBAIG5vdXZlYXVfZHJtX2RldmljZV9maW5pKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpPGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKgIG11dGV4X3VubG9jaygm
YW1wO2RybS0mZ3Q7Y2xpZW50c19sb2NrKTs8YnI+DQo8YnI+DQorwqAgwqAgwqAgwqBub3V2ZWF1
X3NjaGVkX2ZpbmkoZHJtKTs8YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgbm91dmVhdV9jbGlfZmlu
aSgmYW1wO2RybS0mZ3Q7Y2xpZW50KTs8YnI+DQrCoCDCoCDCoCDCoCBub3V2ZWF1X2NsaV9maW5p
KCZhbXA7ZHJtLSZndDttYXN0ZXIpOzxicj4NCsKgIMKgIMKgIMKgIG52aWZfcGFyZW50X2R0b3Io
JmFtcDtkcm0tJmd0O3BhcmVudCk7PGJyPg0KQEAgLTExNzksNiArMTE5Nyw5IEBAIG5vdXZlYXVf
aW9jdGxzW10gPSB7PGJyPg0KwqAgwqAgwqAgwqAgRFJNX0lPQ1RMX0RFRl9EUlYoTk9VVkVBVV9H
RU1fQ1BVX1BSRVAsIG5vdXZlYXVfZ2VtX2lvY3RsX2NwdV9wcmVwLCBEUk1fUkVOREVSX0FMTE9X
KSw8YnI+DQrCoCDCoCDCoCDCoCBEUk1fSU9DVExfREVGX0RSVihOT1VWRUFVX0dFTV9DUFVfRklO
SSwgbm91dmVhdV9nZW1faW9jdGxfY3B1X2ZpbmksIERSTV9SRU5ERVJfQUxMT1cpLDxicj4NCsKg
IMKgIMKgIMKgIERSTV9JT0NUTF9ERUZfRFJWKE5PVVZFQVVfR0VNX0lORk8sIG5vdXZlYXVfZ2Vt
X2lvY3RsX2luZm8sIERSTV9SRU5ERVJfQUxMT1cpLDxicj4NCivCoCDCoCDCoCDCoERSTV9JT0NU
TF9ERUZfRFJWKE5PVVZFQVVfVk1fSU5JVCwgbm91dmVhdV91dm1tX2lvY3RsX3ZtX2luaXQsIERS
TV9SRU5ERVJfQUxMT1cpLDxicj4NCivCoCDCoCDCoCDCoERSTV9JT0NUTF9ERUZfRFJWKE5PVVZF
QVVfVk1fQklORCwgbm91dmVhdV91dm1tX2lvY3RsX3ZtX2JpbmQsIERSTV9SRU5ERVJfQUxMT1cp
LDxicj4NCivCoCDCoCDCoCDCoERSTV9JT0NUTF9ERUZfRFJWKE5PVVZFQVVfRVhFQywgbm91dmVh
dV9leGVjX2lvY3RsX2V4ZWMsIERSTV9SRU5ERVJfQUxMT1cpLDxicj4NCsKgfTs8YnI+DQo8YnI+
DQrCoGxvbmc8YnI+DQpAQCAtMTIyNiw2ICsxMjQ3LDggQEAgbm91dmVhdV9kcml2ZXJfZm9wcyA9
IHs8YnI+DQrCoHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlcjxicj4NCsKgZHJpdmVyX3N0dWIgPSB7
PGJyPg0KwqAgwqAgwqAgwqAgLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBEUklWRVJfU1lOQ09CSiB8IERS
SVZFUl9TWU5DT0JKX1RJTUVMSU5FIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgRFJJVkVSX0dFTV9HUFVWQSB8PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBEUklWRVJfTU9ERVNFVCB8PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBEUklWRVJfUkVOREVSLDxicj4NCsKgIMKgIMKgIMKg
IC5vcGVuID0gbm91dmVhdV9kcm1fb3Blbiw8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZHJ2Lmg8YnI+DQppbmRleCAyMGE3ZjMxYjkwODIuLmFiODEwYjRlMDI4YiAxMDA2NDQ8YnI+
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oPGJyPg0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaDxicj4NCkBAIC0xMCw4ICsxMCw4
IEBAPGJyPg0KwqAjZGVmaW5lIERSSVZFUl9EQVRFwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7MjAx
MjA4MDEmcXVvdDs8YnI+DQo8YnI+DQrCoCNkZWZpbmUgRFJJVkVSX01BSk9SwqAgwqAgwqAgwqAg
wqAgwqAxPGJyPg0KLSNkZWZpbmUgRFJJVkVSX01JTk9SwqAgwqAgwqAgwqAgwqAgwqAzPGJyPg0K
LSNkZWZpbmUgRFJJVkVSX1BBVENITEVWRUzCoCDCoCDCoCAxPGJyPg0KKyNkZWZpbmUgRFJJVkVS
X01JTk9SwqAgwqAgwqAgwqAgwqAgwqA0PGJyPg0KKyNkZWZpbmUgRFJJVkVSX1BBVENITEVWRUzC
oCDCoCDCoCAwPGJyPg0KPGJyPg0KwqAvKjxicj4NCsKgICogMS4xLjE6PGJyPg0KQEAgLTYzLDcg
KzYzLDkgQEAgc3RydWN0IHBsYXRmb3JtX2RldmljZTs8YnI+DQo8YnI+DQrCoCNpbmNsdWRlICZx
dW90O25vdXZlYXVfZmVuY2UuaCZxdW90Ozxicj4NCsKgI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9i
aW9zLmgmcXVvdDs8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9zY2hlZC5oJnF1b3Q7PGJy
Pg0KwqAjaW5jbHVkZSAmcXVvdDtub3V2ZWF1X3ZtbS5oJnF1b3Q7PGJyPg0KKyNpbmNsdWRlICZx
dW90O25vdXZlYXVfdXZtbS5oJnF1b3Q7PGJyPg0KPGJyPg0KwqBzdHJ1Y3Qgbm91dmVhdV9kcm1f
dGlsZSB7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IG5vdXZlYXVfZmVuY2UgKmZlbmNlOzxicj4N
CkBAIC05MSw2ICs5MywxMCBAQCBzdHJ1Y3Qgbm91dmVhdV9jbGkgezxicj4NCsKgIMKgIMKgIMKg
IHN0cnVjdCBudmlmX21tdSBtbXU7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IG5vdXZlYXVfdm1t
IHZtbTs8YnI+DQrCoCDCoCDCoCDCoCBzdHJ1Y3Qgbm91dmVhdV92bW0gc3ZtOzxicj4NCivCoCDC
oCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bW0gdXZtbTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
c3RydWN0IG5vdXZlYXVfc2NoZWRfZW50aXR5IHNjaGVkX2VudGl0eTs8YnI+DQorPGJyPg0KwqAg
wqAgwqAgwqAgY29uc3Qgc3RydWN0IG52aWZfbWNsYXNzICptZW07PGJyPg0KPGJyPg0KwqAgwqAg
wqAgwqAgc3RydWN0IGxpc3RfaGVhZCBoZWFkOzxicj4NCkBAIC0xMTIsMTUgKzExOCw2MCBAQCBz
dHJ1Y3Qgbm91dmVhdV9jbGlfd29yayB7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IGRtYV9mZW5j
ZV9jYiBjYjs8YnI+DQrCoH07PGJyPg0KPGJyPg0KK3N0YXRpYyBpbmxpbmUgc3RydWN0IG5vdXZl
YXVfdXZtbSAqPGJyPg0KK25vdXZlYXVfY2xpX3V2bW0oc3RydWN0IG5vdXZlYXVfY2xpICpjbGkp
PGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBpZiAoIWNsaSB8fCAhY2xpLSZndDt1dm1tLnZtbS5j
bGkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIE5VTEw7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHJldHVybiAmYW1wO2NsaS0mZ3Q7dXZtbTs8YnI+DQorfTxicj4NCis8YnI+
DQorc3RhdGljIGlubGluZSBzdHJ1Y3Qgbm91dmVhdV91dm1tICo8YnI+DQorbm91dmVhdV9jbGlf
dXZtbV9sb2NrZWQoc3RydWN0IG5vdXZlYXVfY2xpICpjbGkpPGJyPg0KK3s8YnI+DQorwqAgwqAg
wqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBt
dXRleF9sb2NrKCZhbXA7Y2xpLSZndDttdXRleCk7PGJyPg0KK8KgIMKgIMKgIMKgdXZtbSA9IG5v
dXZlYXVfY2xpX3V2bW0oY2xpKTs8YnI+DQorwqAgwqAgwqAgwqBtdXRleF91bmxvY2soJmFtcDtj
bGktJmd0O211dGV4KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIHV2bW07PGJyPg0K
K308YnI+DQorPGJyPg0KwqBzdGF0aWMgaW5saW5lIHN0cnVjdCBub3V2ZWF1X3ZtbSAqPGJyPg0K
wqBub3V2ZWF1X2NsaV92bW0oc3RydWN0IG5vdXZlYXVfY2xpICpjbGkpPGJyPg0KwqB7PGJyPg0K
K8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtbSAqdXZtbTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgdXZtbSA9IG5vdXZlYXVfY2xpX3V2bW0oY2xpKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAo
dXZtbSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gJmFtcDt1dm1tLSZndDt2
bW07PGJyPg0KKzxicj4NCsKgIMKgIMKgIMKgIGlmIChjbGktJmd0O3N2bS5jbGkpPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuICZhbXA7Y2xpLSZndDtzdm07PGJyPg0KPGJyPg0K
wqAgwqAgwqAgwqAgcmV0dXJuICZhbXA7Y2xpLSZndDt2bW07PGJyPg0KwqB9PGJyPg0KPGJyPg0K
K3N0YXRpYyBpbmxpbmUgdm9pZDxicj4NCitfX25vdXZlYXVfY2xpX3V2bW1fZGlzYWJsZShzdHJ1
Y3Qgbm91dmVhdV9jbGkgKmNsaSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2
ZWF1X3V2bW0gKnV2bW07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHV2bW0gPSBub3V2ZWF1X2Ns
aV91dm1tKGNsaSk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCF1dm1tKTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsaS0mZ3Q7dXZtbS5kaXNhYmxlZCA9IHRydWU7PGJyPg0KK308YnI+DQor
PGJyPg0KK3N0YXRpYyBpbmxpbmUgdm9pZDxicj4NCitub3V2ZWF1X2NsaV91dm1tX2Rpc2FibGUo
c3RydWN0IG5vdXZlYXVfY2xpICpjbGkpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBtdXRleF9s
b2NrKCZhbXA7Y2xpLSZndDttdXRleCk7PGJyPg0KK8KgIMKgIMKgIMKgX19ub3V2ZWF1X2NsaV91
dm1tX2Rpc2FibGUoY2xpKTs8YnI+DQorwqAgwqAgwqAgwqBtdXRleF91bmxvY2soJmFtcDtjbGkt
Jmd0O211dGV4KTs8YnI+DQorfTxicj4NCis8YnI+DQrCoHZvaWQgbm91dmVhdV9jbGlfd29ya19x
dWV1ZShzdHJ1Y3Qgbm91dmVhdV9jbGkgKiwgc3RydWN0IGRtYV9mZW5jZSAqLDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBub3V2ZWF1X2NsaV93
b3JrICopOzxicj4NCjxicj4NCkBAIC0yNTcsNiArMzA4LDEwIEBAIHN0cnVjdCBub3V2ZWF1X2Ry
bSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IG11dGV4IGxvY2s7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYm9vbCBjb21wb25lbnRfcmVnaXN0ZXJlZDs8YnI+DQrC
oCDCoCDCoCDCoCB9IGF1ZGlvOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dw
dV9zY2hlZHVsZXIgc2NoZWQ7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1
Y3QgKnNjaGVkX3dxOzxicj4NCis8YnI+DQrCoH07PGJyPg0KPGJyPg0KwqBzdGF0aWMgaW5saW5l
IHN0cnVjdCBub3V2ZWF1X2RybSAqPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZXhlYy5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9l
eGVjLmM8YnI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAwMDAwMC4u
NjU0MTFhYzc0MjM3PGJyPg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZXhlYy5jPGJyPg0KQEAgLTAsMCArMSw0MTQgQEA8YnI+DQorLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLzxicj4NCisvKjxicj4NCisgKiBDb3B5cmln
aHQgKGMpIDIwMjIgUmVkIEhhdC48YnI+DQorICo8YnI+DQorICogUGVybWlzc2lvbiBpcyBoZXJl
YnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGE8YnI+
DQorICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24g
ZmlsZXMgKHRoZSAmcXVvdDtTb2Z0d2FyZSZxdW90OyksPGJyPg0KKyAqIHRvIGRlYWwgaW4gdGhl
IFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRp
b248YnI+DQorICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxp
c2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsPGJyPg0KKyAqIGFuZC9vciBzZWxsIGNvcGllcyBv
ZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZTxicj4NCisg
KiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2lu
ZyBjb25kaXRpb25zOjxicj4NCisgKjxicj4NCisgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGlj
ZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbjxicj4NCisg
KiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS48YnI+
DQorICo8YnI+DQorICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICZxdW90O0FTIElTJnF1b3Q7
LCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SPGJyPg0KKyAqIElNUExJ
RUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hB
TlRBQklMSVRZLDxicj4NCisgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQg
Tk9OSU5GUklOR0VNRU5ULsKgIElOIE5PIEVWRU5UIFNIQUxMPGJyPg0KKyAqIFRIRSBDT1BZUklH
SFQgSE9MREVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdF
UyBPUjxicj4NCisgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENP
TlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSw8YnI+DQorICogQVJJU0lORyBGUk9NLCBPVVQgT0Yg
T1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SPGJyPg0KKyAq
IE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS48YnI+DQorICo8YnI+DQorICogQXV0aG9y
czo8YnI+DQorICrCoCDCoCDCoERhbmlsbyBLcnVtbXJpY2ggJmx0OzxhIGhyZWY9Im1haWx0bzpk
YWtyQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5kYWtyQHJlZGhhdC5jb208L2E+Jmd0Ozxi
cj4NCisgKjxicj4NCisgKi88YnI+DQorPGJyPg0KKyNpbmNsdWRlICZsdDtkcm0vZHJtX2V4ZWMu
aCZndDs8YnI+DQorPGJyPg0KKyNpbmNsdWRlICZxdW90O25vdXZlYXVfZHJ2LmgmcXVvdDs8YnI+
DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9nZW0uaCZxdW90Ozxicj4NCisjaW5jbHVkZSAmcXVv
dDtub3V2ZWF1X21lbS5oJnF1b3Q7PGJyPg0KKyNpbmNsdWRlICZxdW90O25vdXZlYXVfZG1hLmgm
cXVvdDs8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9leGVjLmgmcXVvdDs8YnI+DQorI2lu
Y2x1ZGUgJnF1b3Q7bm91dmVhdV9hYmkxNi5oJnF1b3Q7PGJyPg0KKyNpbmNsdWRlICZxdW90O25v
dXZlYXVfY2hhbi5oJnF1b3Q7PGJyPg0KKyNpbmNsdWRlICZxdW90O25vdXZlYXVfc2NoZWQuaCZx
dW90Ozxicj4NCisjaW5jbHVkZSAmcXVvdDtub3V2ZWF1X3V2bW0uaCZxdW90Ozxicj4NCis8YnI+
DQorLyoqPGJyPg0KKyAqIERPQzogT3ZlcnZpZXc8YnI+DQorICo8YnI+DQorICogTm91dmVhdSYj
Mzk7cyBWTV9CSU5EIC8gRVhFQyBVQVBJIGNvbnNpc3RzIG9mIHRocmVlIGlvY3RsczogRFJNX05P
VVZFQVVfVk1fSU5JVCw8YnI+DQorICogRFJNX05PVVZFQVVfVk1fQklORCBhbmQgRFJNX05PVVZF
QVVfRVhFQy48YnI+DQorICo8YnI+DQorICogSW4gb3JkZXIgdG8gdXNlIHRoZSBVQVBJIGZpcnN0
bHkgYSB1c2VyIGNsaWVudCBtdXN0IGluaXRpYWxpemUgdGhlIFZBIHNwYWNlPGJyPg0KKyAqIHVz
aW5nIHRoZSBEUk1fTk9VVkVBVV9WTV9JTklUIGlvY3RsIHNwZWNpZnlpbmcgd2hpY2ggcmVnaW9u
IG9mIHRoZSBWQSBzcGFjZTxicj4NCisgKiBzaG91bGQgYmUgbWFuYWdlZCBieSB0aGUga2VybmVs
IGFuZCB3aGljaCBieSB0aGUgVU1ELjxicj4NCisgKjxicj4NCisgKiBUaGUgRFJNX05PVVZFQVVf
Vk1fQklORCBpb2N0bCBwcm92aWRlcyBjbGllbnRzIGFuIGludGVyZmFjZSB0byBtYW5hZ2UgdGhl
PGJyPg0KKyAqIHVzZXJzcGFjZS1tYW5hZ2FibGUgcG9ydGlvbiBvZiB0aGUgVkEgc3BhY2UuIEl0
IHByb3ZpZGVzIG9wZXJhdGlvbnMgdG8gbWFwPGJyPg0KKyAqIGFuZCB1bm1hcCBtZW1vcnkuIE1h
cHBpbmdzIG1heSBiZSBmbGFnZ2VkIGFzIHNwYXJzZS4gU3BhcnNlIG1hcHBpbmdzIGFyZSBub3Q8
YnI+DQorICogYmFja2VkIGJ5IGEgR0VNIG9iamVjdCBhbmQgdGhlIGtlcm5lbCB3aWxsIGlnbm9y
ZSBHRU0gaGFuZGxlcyBwcm92aWRlZDxicj4NCisgKiBhbG9uZ3NpZGUgYSBzcGFyc2UgbWFwcGlu
Zy48YnI+DQorICo8YnI+DQorICogVXNlcnNwYWNlIG1heSByZXF1ZXN0IG1lbW9yeSBiYWNrZWQg
bWFwcGluZ3MgZWl0aGVyIHdpdGhpbiBvciBvdXRzaWRlIG9mIHRoZTxicj4NCisgKiBib3VuZHMg
KGJ1dCBub3QgY3Jvc3NpbmcgdGhvc2UgYm91bmRzKSBvZiBhIHByZXZpb3VzbHkgbWFwcGVkIHNw
YXJzZTxicj4NCisgKiBtYXBwaW5nLiBTdWJzZXF1ZW50bHkgcmVxdWVzdGVkIG1lbW9yeSBiYWNr
ZWQgbWFwcGluZ3Mgd2l0aGluIGEgc3BhcnNlPGJyPg0KKyAqIG1hcHBpbmcgd2lsbCB0YWtlIHBy
ZWNlZGVuY2Ugb3ZlciB0aGUgY29ycmVzcG9uZGluZyByYW5nZSBvZiB0aGUgc3BhcnNlPGJyPg0K
KyAqIG1hcHBpbmcuIElmIHN1Y2ggbWVtb3J5IGJhY2tlZCBtYXBwaW5ncyBhcmUgdW5tYXBwZWQg
dGhlIGtlcm5lbCB3aWxsIG1ha2U8YnI+DQorICogc3VyZSB0aGF0IHRoZSBjb3JyZXNwb25kaW5n
IHNwYXJzZSBtYXBwaW5nIHdpbGwgdGFrZSB0aGVpciBwbGFjZSBhZ2Fpbi48YnI+DQorICogUmVx
dWVzdHMgdG8gdW5tYXAgYSBzcGFyc2UgbWFwcGluZyB0aGF0IHN0aWxsIGNvbnRhaW5zIG1lbW9y
eSBiYWNrZWQgbWFwcGluZ3M8YnI+DQorICogd2lsbCByZXN1bHQgaW4gdGhvc2UgbWVtb3J5IGJh
Y2tlZCBtYXBwaW5ncyBiZWluZyB1bm1hcHBlZCBmaXJzdC48YnI+DQorICo8YnI+DQorICogVW5t
YXAgcmVxdWVzdHMgYXJlIG5vdCBib3VuZCB0byB0aGUgcmFuZ2Ugb2YgZXhpc3RpbmcgbWFwcGlu
Z3MgYW5kIGNhbiBldmVuPGJyPg0KKyAqIG92ZXJsYXAgdGhlIGJvdW5kcyBvZiBzcGFyc2UgbWFw
cGluZ3MuIEZvciBzdWNoIGEgcmVxdWVzdCB0aGUga2VybmVsIHdpbGw8YnI+DQorICogbWFrZSBz
dXJlIHRvIHVubWFwIGFsbCBtZW1vcnkgYmFja2VkIG1hcHBpbmdzIHdpdGhpbiB0aGUgZ2l2ZW4g
cmFuZ2UsPGJyPg0KKyAqIHNwbGl0dGluZyB1cCBtZW1vcnkgYmFja2VkIG1hcHBpbmdzIHdoaWNo
IGFyZSBvbmx5IHBhcnRpYWxseSBjb250YWluZWQ8YnI+DQorICogd2l0aGluIHRoZSBnaXZlbiBy
YW5nZS4gVW5tYXAgcmVxdWVzdHMgd2l0aCB0aGUgc3BhcnNlIGZsYWcgc2V0IG11c3QgbWF0Y2g8
YnI+DQorICogdGhlIHJhbmdlIG9mIGEgcHJldmlvdXNseSBtYXBwZWQgc3BhcnNlIG1hcHBpbmcg
ZXhhY3RseSB0aG91Z2guPGJyPg0KKyAqPGJyPg0KKyAqIFdoaWxlIHRoZSBrZXJuZWwgZ2VuZXJh
bGx5IHBlcm1pdHMgYXJiaXRyYXJ5IHNlcXVlbmNlcyBhbmQgcmFuZ2VzIG9mIG1lbW9yeTxicj4N
CisgKiBiYWNrZWQgbWFwcGluZ3MgYmVpbmcgbWFwcGVkIGFuZCB1bm1hcHBlZCwgZWl0aGVyIHdp
dGhpbiBhIHNpbmdsZSBvciBtdWx0aXBsZTxicj4NCisgKiBWTV9CSU5EIGlvY3RsIGNhbGxzLCB0
aGVyZSBhcmUgc29tZSByZXN0cmljdGlvbnMgZm9yIHNwYXJzZSBtYXBwaW5ncy48YnI+DQorICo8
YnI+DQorICogVGhlIGtlcm5lbCBkb2VzIG5vdCBwZXJtaXQgdG86PGJyPg0KKyAqwqAgwqAtIHVu
bWFwIG5vbi1leGlzdGVudCBzcGFyc2UgbWFwcGluZ3M8YnI+DQorICrCoCDCoC0gdW5tYXAgYSBz
cGFyc2UgbWFwcGluZyBhbmQgbWFwIGEgbmV3IHNwYXJzZSBtYXBwaW5nIG92ZXJsYXBwaW5nIHRo
ZSByYW5nZTxicj4NCisgKsKgIMKgIMKgb2YgdGhlIHByZXZpb3VzbHkgdW5tYXBwZWQgc3BhcnNl
IG1hcHBpbmcgd2l0aGluIHRoZSBzYW1lIFZNX0JJTkQgaW9jdGw8YnI+DQorICrCoCDCoC0gdW5t
YXAgYSBzcGFyc2UgbWFwcGluZyBhbmQgbWFwIG5ldyBtZW1vcnkgYmFja2VkIG1hcHBpbmdzIG92
ZXJsYXBwaW5nIHRoZTxicj4NCisgKsKgIMKgIMKgcmFuZ2Ugb2YgdGhlIHByZXZpb3VzbHkgdW5t
YXBwZWQgc3BhcnNlIG1hcHBpbmcgd2l0aGluIHRoZSBzYW1lIFZNX0JJTkQ8YnI+DQorICrCoCDC
oCDCoGlvY3RsPGJyPg0KKyAqPGJyPg0KKyAqIFdoZW4gdXNpbmcgdGhlIFZNX0JJTkQgaW9jdGwg
dG8gcmVxdWVzdCB0aGUga2VybmVsIHRvIG1hcCBtZW1vcnkgdG8gYSBnaXZlbjxicj4NCisgKiB2
aXJ0dWFsIGFkZHJlc3MgaW4gdGhlIEdQVSYjMzk7cyBWQSBzcGFjZSB0aGVyZSBpcyBubyBndWFy
YW50ZWUgdGhhdCB0aGUgYWN0dWFsPGJyPg0KKyAqIG1hcHBpbmdzIGFyZSBjcmVhdGVkIGluIHRo
ZSBHUFUmIzM5O3MgTU1VLiBJZiB0aGUgZ2l2ZW4gbWVtb3J5IGlzIHN3YXBwZWQgb3V0PGJyPg0K
KyAqIGF0IHRoZSB0aW1lIHRoZSBiaW5kIG9wZXJhdGlvbiBpcyBleGVjdXRlZCB0aGUga2VybmVs
IHdpbGwgc3Rhc2ggdGhlIG1hcHBpbmc8YnI+DQorICogZGV0YWlscyBpbnRvIGl0JiMzOTtzIGlu
dGVybmFsIGFsbG9jdG9yIGFuZCBjcmVhdGUgdGhlIGFjdHVhbCBNTVUgbWFwcGluZ3Mgb25jZTxi
cj4NCisgKiB0aGUgbWVtb3J5IGlzIHN3YXBwZWQgYmFjayBpbi4gV2hpbGUgdGhpcyBpcyB0cmFu
c3BhcmVudCBmb3IgdXNlcnNwYWNlLCBpdCBpczxicj4NCisgKiBndWFyYW50ZWVkIHRoYXQgYWxs
IHRoZSBiYWNraW5nIG1lbW9yeSBpcyBzd2FwcGVkIGJhY2sgaW4gYW5kIGFsbCB0aGUgbWVtb3J5
PGJyPg0KKyAqIG1hcHBpbmdzLCBhcyByZXF1ZXN0ZWQgYnkgdXNlcnNwYWNlIHByZXZpb3VzbHks
IGFyZSBhY3R1YWxseSBtYXBwZWQgb25jZSB0aGU8YnI+DQorICogRFJNX05PVVZFQVVfRVhFQyBp
b2N0bCBpcyBjYWxsZWQgdG8gc3VibWl0IGFuIGV4ZWMgam9iLjxicj4NCisgKjxicj4NCisgKiBB
IFZNX0JJTkQgam9iIGNhbiBiZSBleGVjdXRlZCBlaXRoZXIgc3luY2hyb25vdXNseSBvciBhc3lu
Y2hyb25vdXNseS4gSWY8YnI+DQorICogZXhlY3R1ZWQgYXN5bmNocm9ub3VzbHksIHVzZXJzcGFj
ZSBtYXkgcHJvdmlkZSBhIGxpc3Qgb2Ygc3luY29ianMgdGhpcyBqb2I8YnI+DQorICogd2lsbCB3
YWl0IGZvciBhbmQvb3IgYSBsaXN0IG9mIHN5bmNvYmogdGhlIGtlcm5lbCB3aWxsIHNpZ25hbCBv
bmNlIHRoZTxicj4NCisgKiBWTV9CSU5EIGpvYiBmaW5pc2hlZCBleGVjdXRpb24uIElmIGV4ZWN1
dGVkIHN5bmNocm9ub3VzbHkgdGhlIGlvY3RsIHdpbGw8YnI+DQorICogYmxvY2sgdW50aWwgdGhl
IGJpbmQgam9iIGlzIGZpbmlzaGVkLiBGb3Igc3luY2hyb25vdXMgam9icyB0aGUga2VybmVsIHdp
bGw8YnI+DQorICogbm90IHBlcm1pdCBhbnkgc3luY29ianMgc3VibWl0dGVkIHRvIHRoZSBrZXJu
ZWwuPGJyPg0KKyAqPGJyPg0KKyAqIFRvIGV4ZWN1dGUgYSBwdXNoIGJ1ZmZlciB0aGUgVUFQSSBw
cm92aWRlcyB0aGUgRFJNX05PVVZFQVVfRVhFQyBpb2N0bC4gRVhFQzxicj4NCisgKiBqb2JzIGFy
ZSBhbHdheXMgZXhlY3V0ZWQgYXN5bmNocm9ub3VzbHksIGFuZCwgZXF1YWwgdG8gVk1fQklORCBq
b2JzLCBwcm92aWRlPGJyPg0KKyAqIHRoZSBvcHRpb24gdG8gc3luY2hyb25pemUgdGhlbSB3aXRo
IHN5bmNvYmpzLjxicj4NCisgKjxicj4NCisgKiBCZXNpZGVzIHRoYXQsIEVYRUMgam9icyBjYW4g
YmUgc2NoZWR1bGVkIGZvciBhIHNwZWNpZmllZCBjaGFubmVsIHRvIGV4ZWN1dGUgb24uPGJyPg0K
KyAqPGJyPg0KKyAqIFNpbmNlIFZNX0JJTkQgam9icyB1cGRhdGUgdGhlIEdQVSYjMzk7cyBWQSBz
cGFjZSBvbiBqb2Igc3VibWl0LCBFWEVDIGpvYnMgZG8gaGF2ZTxicj4NCisgKiBhbiB1cCB0byBk
YXRlIHZpZXcgb2YgdGhlIFZBIHNwYWNlLiBIb3dldmVyLCB0aGUgYWN0dWFsIG1hcHBpbmdzIG1p
Z2h0IHN0aWxsPGJyPg0KKyAqIGJlIHBlbmRpbmcuIEhlbmNlLCBFWEVDIGpvYnMgcmVxdWlyZSB0
byBoYXZlIHRoZSBwYXJ0aWN1bGFyIGZlbmNlcyAtIG9mPGJyPg0KKyAqIHRoZSBjb3JyZXNwb25k
aW5nIFZNX0JJTkQgam9icyB0aGV5IGRlcGVudCBvbiAtIGF0dGFjaGVkIHRvIHRoZW0uPGJyPg0K
KyAqLzxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4NCitub3V2ZWF1X2V4ZWNfam9iX3N1Ym1p
dChzdHJ1Y3Qgbm91dmVhdV9qb2IgKmpvYik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVj
dCBub3V2ZWF1X2V4ZWNfam9iICpleGVjX2pvYiA9IHRvX25vdXZlYXVfZXhlY19qb2Ioam9iKTs8
YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9jbGkgKmNsaSA9IGV4ZWNfam9iLSZndDti
YXNlLmNsaTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tID0gbm91
dmVhdV9jbGlfdXZtbShjbGkpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZXhlYyAqZXhl
YyA9ICZhbXA7am9iLSZndDtleGVjOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqOzxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgaW5kZXg7PGJyPg0KK8Kg
IMKgIMKgIMKgaW50IHJldDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV9m
ZW5jZV9uZXcoJmFtcDtleGVjX2pvYi0mZ3Q7ZmVuY2UpOzxicj4NCivCoCDCoCDCoCDCoGlmIChy
ZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgbm91dmVhdV91dm1tX2xvY2sodXZtbSk7PGJyPg0KK8KgIMKgIMKgIMKgZHJt
X2V4ZWNfdW50aWxfYWxsX2xvY2tlZChleGVjKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3RydWN0IGRybV9ncHV2YSAqdmE7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGRybV9ncHV2YV9mb3JfZWFjaF92YSh2YSwgJmFtcDt1dm1tLSZndDt1bWdyKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHVubGlrZWx5KHZhID09ICZh
bXA7dXZtbS0mZ3Q7dW1nci5rZXJuZWxfYWxsb2Nfbm9kZSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IGRybV9leGVjX3ByZXBhcmVf
b2JqKGV4ZWMsIHZhLSZndDtnZW0ub2JqLCAxKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBkcm1fZXhlY19yZXRyeV9vbl9jb250ZW50aW9uKGV4ZWMpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2ZWF1X3V2bW1fdW5s
b2NrKHV2bW0pOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJldHVybiByZXQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJy
Pg0KK8KgIMKgIMKgIMKgbm91dmVhdV91dm1tX3VubG9jayh1dm1tKTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgZHJtX2V4ZWNfZm9yX2VhY2hfbG9ja2VkX29iamVjdChleGVjLCBpbmRleCwgb2Jq
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfYm8gKm52Ym8g
PSBub3V2ZWF1X2dlbV9vYmplY3Qob2JqKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0ID0gbm91dmVhdV9ib192YWxpZGF0ZShudmJvLCB0cnVlLCBmYWxzZSk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1
Y3QgZG1hX2ZlbmNlICo8YnI+DQorbm91dmVhdV9leGVjX2pvYl9ydW4oc3RydWN0IG5vdXZlYXVf
am9iICpqb2IpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9leGVjX2pv
YiAqZXhlY19qb2IgPSB0b19ub3V2ZWF1X2V4ZWNfam9iKGpvYik7PGJyPg0KK8KgIMKgIMKgIMKg
c3RydWN0IG5vdXZlYXVfY2hhbm5lbCAqY2hhbiA9IGV4ZWNfam9iLSZndDtjaGFuOzxicj4NCivC
oCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X2ZlbmNlICpmZW5jZSA9IGV4ZWNfam9iLSZndDtmZW5j
ZTs8YnI+DQorwqAgwqAgwqAgwqBpbnQgaSwgcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBy
ZXQgPSBub3V2ZWF1X2RtYV93YWl0KGNoYW4sIGV4ZWNfam9iLSZndDtwdXNoLmNvdW50ICsgMSwg
MTYpOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBOVl9QUklOVEsoZXJyLCBqb2ItJmd0O2NsaSwgJnF1b3Q7bnY1MGNhbF9zcGFjZTogJWRc
biZxdW90OywgcmV0KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gRVJSX1BU
UihyZXQpOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZm9yIChp
ID0gMDsgaSAmbHQ7IGV4ZWNfam9iLSZndDtwdXNoLmNvdW50OyBpKyspIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBudjUwX2RtYV9wdXNoKGNoYW4sIGV4ZWNfam9iLSZndDtwdXNoLnNb
aV0udmEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZXhlY19qb2ItJmd0O3B1c2guc1tpXS52YV9sZW4pOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV9mZW5jZV9lbWl0KGZlbmNlLCBjaGFuKTs8
YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
TlZfUFJJTlRLKGVyciwgam9iLSZndDtjbGksICZxdW90O2Vycm9yIGZlbmNpbmcgcHVzaGJ1Zjog
JWRcbiZxdW90OywgcmV0KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBXSU5EX1JJTkco
Y2hhbik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIEVSUl9QVFIocmV0KTs8
YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGV4ZWNfam9iLSZndDtm
ZW5jZSA9IE5VTEw7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAmYW1wO2ZlbmNlLSZn
dDtiYXNlOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitub3V2ZWF1X2V4
ZWNfam9iX2ZyZWUoc3RydWN0IG5vdXZlYXVfam9iICpqb2IpPGJyPg0KK3s8YnI+DQorwqAgwqAg
wqAgwqBzdHJ1Y3Qgbm91dmVhdV9leGVjX2pvYiAqZXhlY19qb2IgPSB0b19ub3V2ZWF1X2V4ZWNf
am9iKGpvYik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfam9iX2ZyZWUoam9iKTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV9mZW5jZV91bnJlZigmYW1wO2V4ZWNfam9i
LSZndDtmZW5jZSk7PGJyPg0KK8KgIMKgIMKgIMKga2ZyZWUoZXhlY19qb2ItJmd0O3B1c2gucyk7
PGJyPg0KK8KgIMKgIMKgIMKga2ZyZWUoZXhlY19qb2IpOzxicj4NCit9PGJyPg0KKzxicj4NCitz
dGF0aWMgZW51bSBkcm1fZ3B1X3NjaGVkX3N0YXQ8YnI+DQorbm91dmVhdV9leGVjX2pvYl90aW1l
b3V0KHN0cnVjdCBub3V2ZWF1X2pvYiAqam9iKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG5vdXZlYXVfZXhlY19qb2IgKmV4ZWNfam9iID0gdG9fbm91dmVhdV9leGVjX2pvYihqb2Ip
Ozxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X2NoYW5uZWwgKmNoYW4gPSBleGVjX2pv
Yi0mZ3Q7Y2hhbjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKHVubGlrZWx5KCFhdG9taWNf
cmVhZCgmYW1wO2NoYW4tJmd0O2tpbGxlZCkpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG5vdXZlYXVfY2hhbm5lbF9raWxsKGNoYW4pOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBOVl9Q
UklOVEsod2Fybiwgam9iLSZndDtjbGksICZxdW90O2pvYiB0aW1lb3V0LCBjaGFubmVsICVkIGtp
bGxlZCFcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjaGFuLSZndDtj
aGlkKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV9zY2hlZF9lbnRpdHlfZmluaShq
b2ItJmd0O2VudGl0eSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBEUk1fR1BVX1ND
SEVEX1NUQVRfRU5PREVWOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgc3RydWN0IG5vdXZl
YXVfam9iX29wcyBub3V2ZWF1X2V4ZWNfam9iX29wcyA9IHs8YnI+DQorwqAgwqAgwqAgwqAuc3Vi
bWl0ID0gbm91dmVhdV9leGVjX2pvYl9zdWJtaXQsPGJyPg0KK8KgIMKgIMKgIMKgLnJ1biA9IG5v
dXZlYXVfZXhlY19qb2JfcnVuLDxicj4NCivCoCDCoCDCoCDCoC5mcmVlID0gbm91dmVhdV9leGVj
X2pvYl9mcmVlLDxicj4NCivCoCDCoCDCoCDCoC50aW1lb3V0ID0gbm91dmVhdV9leGVjX2pvYl90
aW1lb3V0LDxicj4NCit9Ozxicj4NCis8YnI+DQoraW50PGJyPg0KK25vdXZlYXVfZXhlY19qb2Jf
aW5pdChzdHJ1Y3Qgbm91dmVhdV9leGVjX2pvYiAqKnBqb2IsPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfZXhlY19qb2JfYXJncyAqX19hcmdzKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfZXhlY19qb2IgKmpvYjs8YnI+
DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9qb2JfYXJncyBhcmdzID0ge307PGJyPg0KK8Kg
IMKgIMKgIMKgaW50IHJldDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgam9iID0gKnBqb2IgPSBr
emFsbG9jKHNpemVvZigqam9iKSwgR0ZQX0tFUk5FTCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCFq
b2IpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FTk9NRU07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGpvYi0mZ3Q7cHVzaC5jb3VudCA9IF9fYXJncy0mZ3Q7cHVzaC5jb3Vu
dDs8YnI+DQorwqAgwqAgwqAgwqBqb2ItJmd0O3B1c2gucyA9IGttZW1kdXAoX19hcmdzLSZndDtw
dXNoLnMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
c2l6ZW9mKCpfX2FyZ3MtJmd0O3B1c2gucykgKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fYXJncy0mZ3Q7cHVzaC5jb3VudCw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBHRlBfS0VSTkVMKTs8YnI+DQor
wqAgwqAgwqAgwqBpZiAoIWpvYi0mZ3Q7cHVzaC5zKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0ID0gLUVOT01FTTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVy
cl9mcmVlX2pvYjs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGpv
Yi0mZ3Q7Y2hhbiA9IF9fYXJncy0mZ3Q7Y2hhbjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYXJn
cy5zY2hlZF9lbnRpdHkgPSBfX2FyZ3MtJmd0O3NjaGVkX2VudGl0eTs8YnI+DQorwqAgwqAgwqAg
wqBhcmdzLmZpbGVfcHJpdiA9IF9fYXJncy0mZ3Q7ZmlsZV9wcml2Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBhcmdzLmluX3N5bmMuY291bnQgPSBfX2FyZ3MtJmd0O2luX3N5bmMuY291bnQ7PGJy
Pg0KK8KgIMKgIMKgIMKgYXJncy5pbl9zeW5jLnMgPSBfX2FyZ3MtJmd0O2luX3N5bmMuczs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgYXJncy5vdXRfc3luYy5jb3VudCA9IF9fYXJncy0mZ3Q7b3V0
X3N5bmMuY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgYXJncy5vdXRfc3luYy5zID0gX19hcmdzLSZn
dDtvdXRfc3luYy5zOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBhcmdzLm9wcyA9ICZhbXA7bm91
dmVhdV9leGVjX2pvYl9vcHM7PGJyPg0KK8KgIMKgIMKgIMKgYXJncy5yZXN2X3VzYWdlID0gRE1B
X1JFU1ZfVVNBR0VfV1JJVEU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVf
am9iX2luaXQoJmFtcDtqb2ItJmd0O2Jhc2UsICZhbXA7YXJncyk7PGJyPg0KK8KgIMKgIMKgIMKg
aWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVycl9mcmVlX3B1c2hz
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorPGJyPg0KK2Vycl9mcmVl
X3B1c2hzOjxicj4NCivCoCDCoCDCoCDCoGtmcmVlKGpvYi0mZ3Q7cHVzaC5zKTs8YnI+DQorZXJy
X2ZyZWVfam9iOjxicj4NCivCoCDCoCDCoCDCoGtmcmVlKGpvYik7PGJyPg0KK8KgIMKgIMKgIMKg
KnBqb2IgPSBOVUxMOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCit9
PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfZXhlYyhzdHJ1Y3Qgbm91dmVh
dV9leGVjX2pvYl9hcmdzICphcmdzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5v
dXZlYXVfZXhlY19qb2IgKmpvYjs8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqByZXQgPSBub3V2ZWF1X2V4ZWNfam9iX2luaXQoJmFtcDtqb2IsIGFyZ3Mp
Ozxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0dXJuIHJldDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV9qb2Jfc3Vi
bWl0KCZhbXA7am9iLSZndDtiYXNlKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX2pvYl9maW5pOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqByZXR1cm4gMDs8YnI+DQorPGJyPg0KK2Vycl9qb2JfZmluaTo8YnI+DQorwqAgwqAg
wqAgwqBub3V2ZWF1X2pvYl9maW5pKCZhbXA7am9iLSZndDtiYXNlKTs8YnI+DQorwqAgwqAgwqAg
wqByZXR1cm4gcmV0Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZl
YXVfZXhlY191Y29weShzdHJ1Y3Qgbm91dmVhdV9leGVjX2pvYl9hcmdzICphcmdzLDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgZHJtX25vdXZlYXVfZXhlYyBfX3VzZXIg
KnJlcSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fbm91dmVhdV9zeW5jICoq
czs8YnI+DQorwqAgwqAgwqAgwqB1MzIgaW5jID0gcmVxLSZndDt3YWl0X2NvdW50Ozxicj4NCivC
oCDCoCDCoCDCoHU2NCBpbnMgPSByZXEtJmd0O3dhaXRfcHRyOzxicj4NCivCoCDCoCDCoCDCoHUz
MiBvdXRjID0gcmVxLSZndDtzaWdfY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IG91dHMgPSBy
ZXEtJmd0O3NpZ19wdHI7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIHB1c2hjID0gcmVxLSZndDtwdXNo
X2NvdW50Ozxicj4NCivCoCDCoCDCoCDCoHU2NCBwdXNocyA9IHJlcS0mZ3Q7cHVzaF9wdHI7PGJy
Pg0KK8KgIMKgIMKgIMKgaW50IHJldDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYXJncy0mZ3Q7
cHVzaC5jb3VudCA9IHB1c2hjOzxicj4NCivCoCDCoCDCoCDCoGFyZ3MtJmd0O3B1c2gucyA9IHVf
bWVtY3B5YShwdXNocywgcHVzaGMsIHNpemVvZigqYXJncy0mZ3Q7cHVzaC5zKSk7PGJyPg0KK8Kg
IMKgIMKgIMKgaWYgKElTX0VSUihhcmdzLSZndDtwdXNoLnMpKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJldHVybiBQVFJfRVJSKGFyZ3MtJmd0O3B1c2gucyk7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoGlmIChpbmMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzID0gJmFt
cDthcmdzLSZndDtpbl9zeW5jLnM7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGFyZ3MtJmd0O2luX3N5bmMuY291bnQgPSBpbmM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKnMgPSB1X21lbWNweWEoaW5zLCBpbmMsIHNpemVvZigqKnMpKTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAoSVNfRVJSKCpzKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJldCA9IFBUUl9FUlIoKnMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX2ZyZWVfcHVzaHM7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
aWYgKG91dGMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzID0gJmFtcDthcmdzLSZn
dDtvdXRfc3luYy5zOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhcmdzLSZn
dDtvdXRfc3luYy5jb3VudCA9IG91dGM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKnMg
PSB1X21lbWNweWEob3V0cywgb3V0Yywgc2l6ZW9mKCoqcykpOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGlmIChJU19FUlIoKnMpKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0ID0gUFRSX0VSUigqcyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZ290byBlcnJfZnJlZV9pbnM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJu
IDA7PGJyPg0KKzxicj4NCitlcnJfZnJlZV9wdXNoczo8YnI+DQorwqAgwqAgwqAgwqB1X2ZyZWUo
YXJncy0mZ3Q7cHVzaC5zKTs8YnI+DQorZXJyX2ZyZWVfaW5zOjxicj4NCivCoCDCoCDCoCDCoHVf
ZnJlZShhcmdzLSZndDtpbl9zeW5jLnMpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJy
Pg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK25vdXZlYXVfZXhlY191ZnJlZShz
dHJ1Y3Qgbm91dmVhdV9leGVjX2pvYl9hcmdzICphcmdzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgdV9mcmVlKGFyZ3MtJmd0O3B1c2gucyk7PGJyPg0KK8KgIMKgIMKgIMKgdV9mcmVlKGFyZ3Mt
Jmd0O2luX3N5bmMucyk7PGJyPg0KK8KgIMKgIMKgIMKgdV9mcmVlKGFyZ3MtJmd0O291dF9zeW5j
LnMpOzxicj4NCit9PGJyPg0KKzxicj4NCitpbnQ8YnI+DQorbm91dmVhdV9leGVjX2lvY3RsX2V4
ZWMoc3RydWN0IGRybV9kZXZpY2UgKmRldiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB2b2lkIF9fdXNlciAqZGF0YSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdik8YnI+DQorezxicj4NCivC
oCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X2FiaTE2ICphYmkxNiA9IG5vdXZlYXVfYWJpMTZfZ2V0
KGZpbGVfcHJpdik7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfY2xpICpjbGkgPSBu
b3V2ZWF1X2NsaShmaWxlX3ByaXYpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X2Fi
aTE2X2NoYW4gKmNoYW4xNjs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9jaGFubmVs
ICpjaGFuID0gTlVMTDs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9leGVjX2pvYl9h
cmdzIGFyZ3MgPSB7fTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZlYXVfZXhlYyBf
X3VzZXIgKnJlcSA9IGRhdGE7PGJyPg0KK8KgIMKgIMKgIMKgaW50IHJldCA9IDA7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGlmICh1bmxpa2VseSghYWJpMTYpKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJldHVybiAtRU5PTUVNOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBhYmkx
NiBsb2NrcyBhbHJlYWR5ICovPGJyPg0KK8KgIMKgIMKgIMKgaWYgKHVubGlrZWx5KCFub3V2ZWF1
X2NsaV91dm1tKGNsaSkpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBub3V2
ZWF1X2FiaTE2X3B1dChhYmkxNiwgLUVOT1NZUyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGxp
c3RfZm9yX2VhY2hfZW50cnkoY2hhbjE2LCAmYW1wO2FiaTE2LSZndDtjaGFubmVscywgaGVhZCkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChjaGFuMTYtJmd0O2NoYW4tJmd0O2No
aWQgPT0gcmVxLSZndDtjaGFubmVsKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY2hhbiA9IGNoYW4xNi0mZ3Q7Y2hhbjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJy
Pg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoIWNoYW4pPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIG5vdXZlYXVfYWJpMTZfcHV0KGFiaTE2LCAt
RU5PRU5UKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKHVubGlrZWx5KGF0b21pY19yZWFk
KCZhbXA7Y2hhbi0mZ3Q7a2lsbGVkKSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIG5vdXZlYXVfYWJpMTZfcHV0KGFiaTE2LCAtRU5PREVWKTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgaWYgKCFjaGFuLSZndDtkbWEuaWJfbWF4KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJldHVybiBub3V2ZWF1X2FiaTE2X3B1dChhYmkxNiwgLUVOT1NZUyk7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGlmICh1bmxpa2VseShyZXEtJmd0O3B1c2hfY291bnQgPT0gMCkpPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBvdXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oGlmICh1bmxpa2VseShyZXEtJmd0O3B1c2hfY291bnQgJmd0OyBOT1VWRUFVX0dFTV9NQVhfUFVT
SCkpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOVl9QUklOVEsoZXJyLCBjbGksICZx
dW90O3B1c2hidWYgcHVzaCBjb3VudCBleGNlZWRzIGxpbWl0OiAlZCBtYXggJWRcbiZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVxLSZndDtwdXNoX2Nv
dW50LCBOT1VWRUFVX0dFTV9NQVhfUFVTSCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0dXJuIG5vdXZlYXVfYWJpMTZfcHV0KGFiaTE2LCAtRUlOVkFMKTs8YnI+DQorwqAgwqAgwqAg
wqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfZXhlY191Y29weSgmYW1w
O2FyZ3MsIHJlcSk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBnb3RvIG91dDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYXJncy5zY2hlZF9l
bnRpdHkgPSAmYW1wO2NoYW4xNi0mZ3Q7c2NoZWRfZW50aXR5Ozxicj4NCivCoCDCoCDCoCDCoGFy
Z3MuZmlsZV9wcml2ID0gZmlsZV9wcml2Ozxicj4NCivCoCDCoCDCoCDCoGFyZ3MuY2hhbiA9IGNo
YW47PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfZXhlYygmYW1wO2FyZ3Mp
Ozxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Z290byBvdXRfZnJlZV9hcmdzOzxicj4NCis8YnI+DQorb3V0X2ZyZWVfYXJnczo8YnI+DQorwqAg
wqAgwqAgwqBub3V2ZWF1X2V4ZWNfdWZyZWUoJmFtcDthcmdzKTs8YnI+DQorb3V0Ojxicj4NCivC
oCDCoCDCoCDCoHJldHVybiBub3V2ZWF1X2FiaTE2X3B1dChhYmkxNiwgcmV0KTs8YnI+DQorfTxi
cj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2V4ZWMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZXhlYy5oPGJyPg0KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwMDAwMDAuLjMwMzJkYjI3YjhkNzxicj4NCi0tLSAv
ZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2V4ZWMu
aDxicj4NCkBAIC0wLDAgKzEsNTQgQEA8YnI+DQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IE1JVCAqLzxicj4NCis8YnI+DQorI2lmbmRlZiBfX05PVVZFQVVfRVhFQ19IX188YnI+DQorI2Rl
ZmluZSBfX05PVVZFQVVfRVhFQ19IX188YnI+DQorPGJyPg0KKyNpbmNsdWRlICZsdDtkcm0vZHJt
X2V4ZWMuaCZndDs8YnI+DQorPGJyPg0KKyNpbmNsdWRlICZxdW90O25vdXZlYXVfZHJ2LmgmcXVv
dDs8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9zY2hlZC5oJnF1b3Q7PGJyPg0KKzxicj4N
CitzdHJ1Y3Qgbm91dmVhdV9leGVjX2pvYl9hcmdzIHs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGVfcHJpdjs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9zY2hl
ZF9lbnRpdHkgKnNjaGVkX2VudGl0eTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGRy
bV9leGVjIGV4ZWM7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfY2hhbm5lbCAqY2hh
bjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZlYXVfc3luYyAqczs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB1MzIgY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgfSBpbl9zeW5jOzxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVj
dCBkcm1fbm91dmVhdV9zeW5jICpzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHUzMiBj
b3VudDs8YnI+DQorwqAgwqAgwqAgwqB9IG91dF9zeW5jOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBzdHJ1Y3Qgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fbm91dmVh
dV9leGVjX3B1c2ggKnM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTMyIGNvdW50Ozxi
cj4NCivCoCDCoCDCoCDCoH0gcHVzaDs8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0cnVjdCBub3V2
ZWF1X2V4ZWNfam9iIHs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9qb2IgYmFzZTs8
YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9mZW5jZSAqZmVuY2U7PGJyPg0KK8KgIMKg
IMKgIMKgc3RydWN0IG5vdXZlYXVfY2hhbm5lbCAqY2hhbjs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgc3RydWN0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZl
YXVfZXhlY19wdXNoICpzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHUzMiBjb3VudDs8
YnI+DQorwqAgwqAgwqAgwqB9IHB1c2g7PGJyPg0KK307PGJyPg0KKzxicj4NCisjZGVmaW5lIHRv
X25vdXZlYXVfZXhlY19qb2Ioam9iKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRhaW5lcl9vZigoam9iKSwgc3RydWN0IG5vdXZlYXVfZXhl
Y19qb2IsIGJhc2UpPGJyPg0KKzxicj4NCitpbnQgbm91dmVhdV9leGVjX2pvYl9pbml0KHN0cnVj
dCBub3V2ZWF1X2V4ZWNfam9iICoqam9iLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X2V4ZWNfam9iX2FyZ3MgKmFyZ3MpOzxicj4NCis8
YnI+DQoraW50IG5vdXZlYXVfZXhlY19pb2N0bF9leGVjKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHZvaWQgX191c2VyICpkYXRhLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KTs8YnI+DQorPGJyPg0KKyNlbmRp
Zjxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5j
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uYzxicj4NCmluZGV4IDljOGQx
YjkxMWEwMS4uM2IwZmJhZWRmYjU3IDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZ2VtLmM8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2dlbS5jPGJyPg0KQEAgLTEyMCw3ICsxMjAsMTEgQEAgbm91dmVhdV9nZW1fb2JqZWN0
X29wZW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9w
cml2KTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gb3V0Ozxicj4NCsKgIMKgIMKg
IMKgIH08YnI+DQo8YnI+DQotwqAgwqAgwqAgwqByZXQgPSBub3V2ZWF1X3ZtYV9uZXcobnZibywg
dm1tLCAmYW1wO3ZtYSk7PGJyPg0KK8KgIMKgIMKgIMKgLyogb25seSBjcmVhdGUgYSBWTUEgb24g
YmluZGluZyAqLzxicj4NCivCoCDCoCDCoCDCoGlmICghbm91dmVhdV9jbGlfdXZtbShjbGkpKTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfdm1hX25ldyhudmJvLCB2
bW0sICZhbXA7dm1hKTs8YnI+DQorwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmV0ID0gMDs8YnI+DQrCoCDCoCDCoCDCoCBwbV9ydW50aW1lX21hcmtfbGFzdF9i
dXN5KGRldik7PGJyPg0KwqAgwqAgwqAgwqAgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2
KTs8YnI+DQrCoG91dDo8YnI+DQpAQCAtMTg3LDYgKzE5MSw5IEBAIG5vdXZlYXVfZ2VtX29iamVj
dF9jbG9zZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSwgc3RydWN0IGRybV9maWxlICpmaWxl
X3ByaXYpPGJyPg0KwqAgwqAgwqAgwqAgaWYgKHZtbS0mZ3Q7dm1tLm9iamVjdC5vY2xhc3MgJmx0
OyBOVklGX0NMQVNTX1ZNTV9OVjUwKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVy
bjs8YnI+DQo8YnI+DQorwqAgwqAgwqAgwqBpZiAobm91dmVhdV9jbGlfdXZtbShjbGkpKTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAg
cmV0ID0gdHRtX2JvX3Jlc2VydmUoJmFtcDtudmJvLSZndDtibywgZmFsc2UsIGZhbHNlLCBOVUxM
KTs8YnI+DQrCoCDCoCDCoCDCoCBpZiAocmV0KTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHJldHVybjs8YnI+DQpAQCAtMjMxLDcgKzIzOCw3IEBAIG5vdXZlYXVfZ2VtX25ldyhzdHJ1Y3Qg
bm91dmVhdV9jbGkgKmNsaSwgdTY0IHNpemUsIGludCBhbGlnbiwgdWludDMyX3QgZG9tYWluLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRvbWFpbiB8PSBOT1VWRUFVX0dFTV9ET01BSU5f
Q1BVOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIG52Ym8gPSBub3V2ZWF1X2JvX2FsbG9jKGNsaSwg
JmFtcDtzaXplLCAmYW1wO2FsaWduLCBkb21haW4sIHRpbGVfbW9kZSw8YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aWxlX2ZsYWdzKTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aWxlX2ZsYWdz
LCBmYWxzZSk7PGJyPg0KwqAgwqAgwqAgwqAgaWYgKElTX0VSUihudmJvKSk8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gUFRSX0VSUihudmJvKTs8YnI+DQo8YnI+DQpAQCAtMjc5
LDEzICsyODYsMTUgQEAgbm91dmVhdV9nZW1faW5mbyhzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJp
diwgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sPGJyPg0KwqAgwqAgwqAgwqAgZWxzZTxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlcC0mZ3Q7ZG9tYWluID0gTk9VVkVBVV9HRU1fRE9N
QUlOX1ZSQU07PGJyPg0KwqAgwqAgwqAgwqAgcmVwLSZndDtvZmZzZXQgPSBudmJvLSZndDtvZmZz
ZXQ7PGJyPg0KLcKgIMKgIMKgIMKgaWYgKHZtbS0mZ3Q7dm1tLm9iamVjdC5vY2xhc3MgJmd0Oz0g
TlZJRl9DTEFTU19WTU1fTlY1MCkgezxicj4NCivCoCDCoCDCoCDCoGlmICh2bW0tJmd0O3ZtbS5v
YmplY3Qub2NsYXNzICZndDs9IE5WSUZfQ0xBU1NfVk1NX05WNTAgJmFtcDsmYW1wOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCFub3V2ZWF1X2NsaV91dm1tKGNsaSkpIHs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB2bWEgPSBub3V2ZWF1X3ZtYV9maW5kKG52Ym8sIHZtbSk7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKCF2bWEpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmV0dXJuIC1FSU5WQUw7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmVwLSZndDtvZmZzZXQgPSB2bWEtJmd0O2FkZHI7PGJyPg0KLcKgIMKgIMKgIMKg
fTxicj4NCivCoCDCoCDCoCDCoH0gZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
cC0mZ3Q7b2Zmc2V0ID0gMDs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCByZXAtJmd0O3NpemUgPSBu
dmJvLSZndDtiby5iYXNlLnNpemU7PGJyPg0KwqAgwqAgwqAgwqAgcmVwLSZndDttYXBfaGFuZGxl
ID0gZHJtX3ZtYV9ub2RlX29mZnNldF9hZGRyKCZhbXA7bnZiby0mZ3Q7Ym8uYmFzZS52bWFfbm9k
ZSk7PGJyPg0KQEAgLTMxMCw2ICszMTksMTEgQEAgbm91dmVhdV9nZW1faW9jdGxfbmV3KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsPGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IG5v
dXZlYXVfYm8gKm52Ym8gPSBOVUxMOzxicj4NCsKgIMKgIMKgIMKgIGludCByZXQgPSAwOzxicj4N
Cjxicj4NCivCoCDCoCDCoCDCoC8qIElmIHV2bW0gd2FzbiYjMzk7dCBpbml0aWFsaXplZCB1bnRp
bCBub3cgZGlzYWJsZSBpdCBjb21wbGV0ZWx5IHRvIHByZXZlbnQ8YnI+DQorwqAgwqAgwqAgwqAg
KiB1c2Vyc3BhY2UgZnJvbSBtaXhpbmcgdXAgVUFQSXMuPGJyPg0KK8KgIMKgIMKgIMKgICovPGJy
Pg0KK8KgIMKgIMKgIMKgbm91dmVhdV9jbGlfdXZtbV9kaXNhYmxlKGNsaSk7PGJyPg0KKzxicj4N
CsKgIMKgIMKgIMKgIHJldCA9IG5vdXZlYXVfZ2VtX25ldyhjbGksIHJlcS0mZ3Q7aW5mby5zaXpl
LCByZXEtJmd0O2FsaWduLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHJlcS0mZ3Q7aW5mby5kb21haW4sIHJlcS0mZ3Q7aW5mby50aWxlX21vZGUsPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVxLSZndDtp
bmZvLnRpbGVfZmxhZ3MsICZhbXA7bnZibyk7PGJyPg0KQEAgLTcyMSw2ICs3MzUsOSBAQCBub3V2
ZWF1X2dlbV9pb2N0bF9wdXNoYnVmKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
PGJyPg0KwqAgwqAgwqAgwqAgaWYgKHVubGlrZWx5KCFhYmkxNikpPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcmV0dXJuIC1FTk9NRU07PGJyPg0KPGJyPg0KK8KgIMKgIMKgIMKgaWYgKHVu
bGlrZWx5KG5vdXZlYXVfY2xpX3V2bW0oY2xpKSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0dXJuIC1FTk9TWVM7PGJyPg0KKzxicj4NCsKgIMKgIMKgIMKgIGxpc3RfZm9yX2VhY2hf
ZW50cnkodGVtcCwgJmFtcDthYmkxNi0mZ3Q7Y2hhbm5lbHMsIGhlYWQpIHs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpZiAodGVtcC0mZ3Q7Y2hhbi0mZ3Q7Y2hpZCA9PSByZXEtJmd0O2No
YW5uZWwpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjaGFuID0g
dGVtcC0mZ3Q7Y2hhbjs8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9tZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVtLmg8YnI+
DQppbmRleCA3NmM4NmQ4YmIwMWUuLjUzNjVhM2QzYTE3ZiAxMDA2NDQ8YnI+DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X21lbS5oPGJyPg0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9tZW0uaDxicj4NCkBAIC0zNSw0ICszNSw5IEBAIGludCBub3V2
ZWF1X21lbV92cmFtKHN0cnVjdCB0dG1fcmVzb3VyY2UgKiwgYm9vbCBjb250aWcsIHU4IHBhZ2Up
Ozxicj4NCsKgaW50IG5vdXZlYXVfbWVtX2hvc3Qoc3RydWN0IHR0bV9yZXNvdXJjZSAqLCBzdHJ1
Y3QgdHRtX3R0ICopOzxicj4NCsKgdm9pZCBub3V2ZWF1X21lbV9maW5pKHN0cnVjdCBub3V2ZWF1
X21lbSAqKTs8YnI+DQrCoGludCBub3V2ZWF1X21lbV9tYXAoc3RydWN0IG5vdXZlYXVfbWVtICos
IHN0cnVjdCBudmlmX3ZtbSAqLCBzdHJ1Y3QgbnZpZl92bWEgKik7PGJyPg0KK2ludDxicj4NCitu
b3V2ZWF1X21lbV9tYXBfZml4ZWQoc3RydWN0IG5vdXZlYXVfbWVtICptZW0sPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IG52aWZfdm1tICp2bW0sPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTgga2luZCwgdTY0IGFkZHIsPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTY0IG9mZnNldCwgdTY0IHJhbmdlKTs8YnI+
DQrCoCNlbmRpZjxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmM8YnI+
DQppbmRleCBmNDJjMmIxYjAzNjMuLjZhODgzYjlhNzk5YSAxMDA2NDQ8YnI+DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmM8YnI+DQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmM8YnI+DQpAQCAtNTAsNyArNTAsNyBAQCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm5vdXZlYXVfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LDxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGRtYV9yZXN2X2xvY2so
cm9iaiwgTlVMTCk7PGJyPg0KwqAgwqAgwqAgwqAgbnZibyA9IG5vdXZlYXVfYm9fYWxsb2MoJmFt
cDtkcm0tJmd0O2NsaWVudCwgJmFtcDtzaXplLCAmYW1wO2FsaWduLDxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5PVVZFQVVfR0VNX0RPTUFJTl9H
QVJULCAwLCAwKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBOT1VWRUFVX0dFTV9ET01BSU5fR0FSVCwgMCwgMCwgdHJ1ZSk7PGJyPg0KwqAgwqAg
wqAgwqAgaWYgKElTX0VSUihudmJvKSkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9i
aiA9IEVSUl9DQVNUKG52Ym8pOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gdW5s
b2NrOzxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3Nj
aGVkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3NjaGVkLmM8YnI+DQpuZXcg
ZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAwMDAwMC4uMjNmOWNhZTE5ZjIxPGJy
Pg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfc2NoZWQuYzxicj4NCkBAIC0wLDAgKzEsNDYyIEBAPGJyPg0KKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBNSVQgKi88YnI+DQorLyo8YnI+DQorICogQ29weXJpZ2h0IChjKSAyMDIyIFJl
ZCBIYXQuPGJyPg0KKyAqPGJyPg0KKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZy
ZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhPGJyPg0KKyAqIGNvcHkgb2Yg
dGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgJnF1
b3Q7U29mdHdhcmUmcXVvdDspLDxicj4NCisgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRo
b3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uPGJyPg0KKyAqIHRo
ZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRl
LCBzdWJsaWNlbnNlLDxicj4NCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJl
LCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGU8YnI+DQorICogU29mdHdhcmUgaXMg
ZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczo8
YnI+DQorICo8YnI+DQorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVy
bWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW48YnI+DQorICogYWxsIGNvcGllcyBv
ciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuPGJyPg0KKyAqPGJyPg0KKyAq
IFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAmcXVvdDtBUyBJUyZxdW90OywgV0lUSE9VVCBXQVJS
QU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUjxicj4NCisgKiBJTVBMSUVELCBJTkNMVURJTkcg
QlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSw8YnI+
DQorICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVO
VC7CoCBJTiBOTyBFVkVOVCBTSEFMTDxicj4NCisgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBP
UiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1I8YnI+DQorICog
T1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBP
UiBPVEhFUldJU0UsPGJyPg0KKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJ
T04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUjxicj4NCisgKiBPVEhFUiBERUFMSU5H
UyBJTiBUSEUgU09GVFdBUkUuPGJyPg0KKyAqPGJyPg0KKyAqIEF1dGhvcnM6PGJyPg0KKyAqwqAg
wqAgwqBEYW5pbG8gS3J1bW1yaWNoICZsdDs8YSBocmVmPSJtYWlsdG86ZGFrckByZWRoYXQuY29t
IiB0YXJnZXQ9Il9ibGFuayI+ZGFrckByZWRoYXQuY29tPC9hPiZndDs8YnI+DQorICo8YnI+DQor
ICovPGJyPg0KKzxicj4NCisjaW5jbHVkZSAmbHQ7bGludXgvc2xhYi5oJmd0Ozxicj4NCisjaW5j
bHVkZSAmbHQ7ZHJtL2dwdV9zY2hlZHVsZXIuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2RybS9k
cm1fc3luY29iai5oJmd0Ozxicj4NCis8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9kcnYu
aCZxdW90Ozxicj4NCisjaW5jbHVkZSAmcXVvdDtub3V2ZWF1X2dlbS5oJnF1b3Q7PGJyPg0KKyNp
bmNsdWRlICZxdW90O25vdXZlYXVfbWVtLmgmcXVvdDs8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91
dmVhdV9kbWEuaCZxdW90Ozxicj4NCisjaW5jbHVkZSAmcXVvdDtub3V2ZWF1X2V4ZWMuaCZxdW90
Ozxicj4NCisjaW5jbHVkZSAmcXVvdDtub3V2ZWF1X2FiaTE2LmgmcXVvdDs8YnI+DQorI2luY2x1
ZGUgJnF1b3Q7bm91dmVhdV9zY2hlZC5oJnF1b3Q7PGJyPg0KKzxicj4NCisvKiBGSVhNRTxicj4N
CisgKjxicj4NCisgKiBXZSB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IGpvYnMgY3VycmVudGx5IGV4
ZWN1dGluZyBjYW4mIzM5O3QgYmUgZGVmZXJyZWQgYnk8YnI+DQorICogb3RoZXIgam9icyBjb21w
ZXRpbmcgZm9yIHRoZSBoYXJkd2FyZS4gT3RoZXJ3aXNlIHdlIG1pZ2h0IGVuZCB1cCB3aXRoIGpv
Yjxicj4NCisgKiB0aW1lb3V0cyBqdXN0IGJlY2F1c2Ugb2YgdG9vIG1hbnkgY2xpZW50cyBzdWJt
aXR0aW5nIHRvbyBtYW55IGpvYnMuIFdlIGRvbiYjMzk7dDxicj4NCisgKiB3YW50IGpvYnMgdG8g
dGltZSBvdXQgYmVjYXVzZSBvZiBzeXN0ZW0gbG9hZCwgYnV0IGJlY2F1c2Ugb2YgdGhlIGpvYiBi
ZWluZzxicj4NCisgKiB0b28gYnVsa3kuPGJyPg0KKyAqPGJyPg0KKyAqIEZvciBub3cgYWxsb3cg
Zm9yIHVwIHRvIDE2IGNvbmN1cnJlbnQgam9icyBpbiBmbGlnaHQgdW50aWwgd2Uga25vdyBob3cg
bWFueTxicj4NCisgKiByaW5ncyB0aGUgaGFyZHdhcmUgY2FuIHByb2Nlc3MgaW4gcGFyYWxsZWwu
PGJyPg0KKyAqLzxicj4NCisjZGVmaW5lIE5PVVZFQVVfU0NIRURfSFdfU1VCTUlTU0lPTlPCoCDC
oCDCoCDCoCDCoCDCoDE2PGJyPg0KKyNkZWZpbmUgTk9VVkVBVV9TQ0hFRF9KT0JfVElNRU9VVF9N
U8KgIMKgIMKgIMKgIMKgIMKgMTAwMDA8YnI+DQorPGJyPg0KK2ludDxicj4NCitub3V2ZWF1X2pv
Yl9pbml0KHN0cnVjdCBub3V2ZWF1X2pvYiAqam9iLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBzdHJ1Y3Qgbm91dmVhdV9qb2JfYXJncyAqYXJncyk8YnI+DQorezxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBub3V2ZWF1X3NjaGVkX2VudGl0eSAqZW50aXR5ID0gYXJncy0mZ3Q7c2NoZWRf
ZW50aXR5Ozxicj4NCivCoCDCoCDCoCDCoGludCByZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oGpvYi0mZ3Q7ZmlsZV9wcml2ID0gYXJncy0mZ3Q7ZmlsZV9wcml2Ozxicj4NCivCoCDCoCDCoCDC
oGpvYi0mZ3Q7Y2xpID0gbm91dmVhdV9jbGkoYXJncy0mZ3Q7ZmlsZV9wcml2KTs8YnI+DQorwqAg
wqAgwqAgwqBqb2ItJmd0O2VudGl0eSA9IGVudGl0eTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
am9iLSZndDtzeW5jID0gYXJncy0mZ3Q7c3luYzs8YnI+DQorwqAgwqAgwqAgwqBqb2ItJmd0O3Jl
c3ZfdXNhZ2UgPSBhcmdzLSZndDtyZXN2X3VzYWdlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBq
b2ItJmd0O29wcyA9IGFyZ3MtJmd0O29wczs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgam9iLSZn
dDtpbl9zeW5jLmNvdW50ID0gYXJncy0mZ3Q7aW5fc3luYy5jb3VudDs8YnI+DQorwqAgwqAgwqAg
wqBpZiAoam9iLSZndDtpbl9zeW5jLmNvdW50KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKGpvYi0mZ3Q7c3luYyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXR1cm4gLUVJTlZBTDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
am9iLSZndDtpbl9zeW5jLmRhdGEgPSBrbWVtZHVwKGFyZ3MtJmd0O2luX3N5bmMucyw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgc2l6ZW9mKCphcmdzLSZndDtpbl9zeW5jLnMpICo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJncy0mZ3Q7aW5fc3lu
Yy5jb3VudCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgR0ZQX0tFUk5FTCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKCFqb2ItJmd0O2luX3N5bmMuZGF0YSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXR1cm4gLUVOT01FTTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGpvYi0mZ3Q7b3V0X3N5bmMuY291bnQgPSBhcmdzLSZndDtvdXRfc3lu
Yy5jb3VudDs8YnI+DQorwqAgwqAgwqAgwqBpZiAoam9iLSZndDtvdXRfc3luYy5jb3VudCkgezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChqb2ItJmd0O3N5bmMpIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSAtRUlOVkFMOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX2ZyZWVfaW5fc3luYzs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGpvYi0mZ3Q7b3V0X3N5bmMuZGF0YSA9IGttZW1kdXAoYXJncy0mZ3Q7b3V0X3N5bmMu
cyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzaXplb2YoKmFyZ3MtJmd0O291dF9zeW5jLnMpICo8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBh
cmdzLSZndDtvdXRfc3luYy5jb3VudCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBHRlBfS0VSTkVMKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIWpvYi0mZ3Q7b3V0X3N5bmMuZGF0YSkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IC1FTk9NRU07PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJfZnJlZV9pbl9zeW5jOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgam9iLSZndDtvdXRfc3luYy5vYmpzID0ga2NhbGxvYyhqb2ItJmd0O291dF9zeW5j
LmNvdW50LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzaXplb2YoKmpvYi0mZ3Q7b3V0X3N5bmMub2JqcyksPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIEdGUF9LRVJORUwpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlm
ICgham9iLSZndDtvdXRfc3luYy5vYmpzKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0ID0gLUVOT01FTTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBnb3RvIGVycl9mcmVlX291dF9zeW5jOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgam9iLSZndDtvdXRf
c3luYy5jaGFpbnMgPSBrY2FsbG9jKGpvYi0mZ3Q7b3V0X3N5bmMuY291bnQsPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHNpemVvZigqam9iLSZndDtvdXRfc3luYy5jaGFpbnMpLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBHRlBfS0VSTkVMKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIWpvYi0mZ3Q7
b3V0X3N5bmMuY2hhaW5zKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0ID0gLUVOT01FTTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBnb3RvIGVycl9mcmVlX29ianM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IGRybV9z
Y2hlZF9qb2JfaW5pdCgmYW1wO2pvYi0mZ3Q7YmFzZSwgJmFtcDtlbnRpdHktJmd0O2Jhc2UsIE5V
TEwpOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ290byBlcnJfZnJlZV9jaGFpbnM7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGpvYi0mZ3Q7
c3RhdGUgPSBOT1VWRUFVX0pPQl9JTklUSUFMSVpFRDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
cmV0dXJuIDA7PGJyPg0KKzxicj4NCitlcnJfZnJlZV9jaGFpbnM6PGJyPg0KK8KgIMKgIMKgIMKg
a2ZyZWUoam9iLSZndDtvdXRfc3luYy5jaGFpbnMpOzxicj4NCitlcnJfZnJlZV9vYmpzOjxicj4N
CivCoCDCoCDCoCDCoGtmcmVlKGpvYi0mZ3Q7b3V0X3N5bmMub2Jqcyk7PGJyPg0KK2Vycl9mcmVl
X291dF9zeW5jOjxicj4NCivCoCDCoCDCoCDCoGtmcmVlKGpvYi0mZ3Q7b3V0X3N5bmMuZGF0YSk7
PGJyPg0KK2Vycl9mcmVlX2luX3N5bmM6PGJyPg0KK8KgIMKgIMKgIMKga2ZyZWUoam9iLSZndDtp
bl9zeW5jLmRhdGEpOzxicj4NCityZXR1cm4gcmV0Ozxicj4NCit9PGJyPg0KKzxicj4NCit2b2lk
PGJyPg0KK25vdXZlYXVfam9iX2ZyZWUoc3RydWN0IG5vdXZlYXVfam9iICpqb2IpPGJyPg0KK3s8
YnI+DQorwqAgwqAgwqAgwqBrZnJlZShqb2ItJmd0O2luX3N5bmMuZGF0YSk7PGJyPg0KK8KgIMKg
IMKgIMKga2ZyZWUoam9iLSZndDtvdXRfc3luYy5kYXRhKTs8YnI+DQorwqAgwqAgwqAgwqBrZnJl
ZShqb2ItJmd0O291dF9zeW5jLm9ianMpOzxicj4NCivCoCDCoCDCoCDCoGtmcmVlKGpvYi0mZ3Q7
b3V0X3N5bmMuY2hhaW5zKTs8YnI+DQorfTxicj4NCis8YnI+DQordm9pZCBub3V2ZWF1X2pvYl9m
aW5pKHN0cnVjdCBub3V2ZWF1X2pvYiAqam9iKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgZG1h
X2ZlbmNlX3B1dChqb2ItJmd0O2RvbmVfZmVuY2UpOzxicj4NCivCoCDCoCDCoCDCoGRybV9zY2hl
ZF9qb2JfY2xlYW51cCgmYW1wO2pvYi0mZ3Q7YmFzZSk7PGJyPg0KK8KgIMKgIMKgIMKgam9iLSZn
dDtvcHMtJmd0O2ZyZWUoam9iKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4N
CitzeW5jX2ZpbmRfZmVuY2Uoc3RydWN0IG5vdXZlYXVfam9iICpqb2IsPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9ub3V2ZWF1X3N5bmMgKnN5bmMsPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKTxicj4NCit7PGJyPg0K
K8KgIMKgIMKgIMKgdTMyIHN0eXBlID0gc3luYy0mZ3Q7ZmxhZ3MgJmFtcDsgRFJNX05PVVZFQVVf
U1lOQ19UWVBFX01BU0s7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IHBvaW50ID0gMDs8YnI+DQorwqAg
wqAgwqAgwqBpbnQgcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoc3R5cGUgIT0gRFJN
X05PVVZFQVVfU1lOQ19TWU5DT0JKICZhbXA7JmFtcDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqBz
dHlwZSAhPSBEUk1fTk9VVkVBVV9TWU5DX1RJTUVMSU5FX1NZTkNPQkopPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FT1BOT1RTVVBQOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBpZiAoc3R5cGUgPT0gRFJNX05PVVZFQVVfU1lOQ19USU1FTElORV9TWU5DT0JKKTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBvaW50ID0gc3luYy0mZ3Q7dGltZWxpbmVfdmFsdWU7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IGRybV9zeW5jb2JqX2ZpbmRfZmVuY2Uoam9iLSZn
dDtmaWxlX3ByaXYsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHN5bmMtJmd0O2hhbmRsZSwgcG9pbnQsPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN5bmMtJmd0O2ZsYWdz
LCBmZW5jZSk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+
DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4NCitub3V2ZWF1X2pvYl9hZGRfZGVwcyhz
dHJ1Y3Qgbm91dmVhdV9qb2IgKmpvYik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBk
bWFfZmVuY2UgKmluX2ZlbmNlID0gTlVMTDs8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0LCBpOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgam9iLSZndDtpbl9zeW5j
LmNvdW50OyBpKyspIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25v
dXZlYXVfc3luYyAqc3luYyA9ICZhbXA7am9iLSZndDtpbl9zeW5jLmRhdGFbaV07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IHN5bmNfZmluZF9mZW5jZShqb2IsIHN5
bmMsICZhbXA7aW5fZmVuY2UpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQp
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOVl9QUklOVEsod2Fy
biwgam9iLSZndDtjbGksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJnF1b3Q7RmFpbGVkIHRvIGZpbmQgc3luY29iaiAoLSZndDsgaW4pOiBo
YW5kbGU9JWRcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzeW5jLSZndDtoYW5kbGUpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBkcm1fc2NoZWRf
am9iX2FkZF9kZXBlbmRlbmN5KCZhbXA7am9iLSZndDtiYXNlLCBpbl9mZW5jZSk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJy
Pg0KK25vdXZlYXVfam9iX2ZlbmNlX2F0dGFjaF9jbGVhbnVwKHN0cnVjdCBub3V2ZWF1X2pvYiAq
am9iKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGk7PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoGZvciAoaSA9IDA7IGkgJmx0OyBqb2ItJmd0O291dF9zeW5jLmNvdW50OyBpKyspIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX3N5bmNvYmogKm9iaiA9IGpvYi0m
Z3Q7b3V0X3N5bmMub2Jqc1tpXTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZG1hX2ZlbmNlX2NoYWluICpjaGFpbiA9IGpvYi0mZ3Q7b3V0X3N5bmMuY2hhaW5zW2ldOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAob2JqKTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRybV9zeW5jb2JqX3B1dChvYmopOzxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoY2hhaW4pPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hX2ZlbmNlX2NoYWluX2ZyZWUoY2hhaW4pOzxicj4NCivC
oCDCoCDCoCDCoH08YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4NCitub3V2ZWF1
X2pvYl9mZW5jZV9hdHRhY2hfcHJlcGFyZShzdHJ1Y3Qgbm91dmVhdV9qb2IgKmpvYik8YnI+DQor
ezxicj4NCivCoCDCoCDCoCDCoGludCBpLCByZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGZv
ciAoaSA9IDA7IGkgJmx0OyBqb2ItJmd0O291dF9zeW5jLmNvdW50OyBpKyspIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZlYXVfc3luYyAqc3luYyA9ICZhbXA7
am9iLSZndDtvdXRfc3luYy5kYXRhW2ldOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
cnVjdCBkcm1fc3luY29iaiAqKnBvYmogPSAmYW1wO2pvYi0mZ3Q7b3V0X3N5bmMub2Jqc1tpXTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZG1hX2ZlbmNlX2NoYWluICoqcGNo
YWluID0gJmFtcDtqb2ItJmd0O291dF9zeW5jLmNoYWluc1tpXTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB1MzIgc3R5cGUgPSBzeW5jLSZndDtmbGFncyAmYW1wOyBEUk1fTk9VVkVBVV9T
WU5DX1RZUEVfTUFTSzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHN0
eXBlICE9IERSTV9OT1VWRUFVX1NZTkNfU1lOQ09CSiAmYW1wOyZhbXA7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3R5cGUgIT0gRFJNX05PVVZFQVVfU1lOQ19USU1FTElORV9T
WU5DT0JKKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0g
LUVJTlZBTDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVy
cl9zeW5jX2NsZWFudXA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqcG9iaiA9IGRybV9zeW5jb2JqX2ZpbmQoam9iLSZn
dDtmaWxlX3ByaXYsIHN5bmMtJmd0O2hhbmRsZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKCEqcG9iaikgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oE5WX1BSSU5USyh3YXJuLCBqb2ItJmd0O2NsaSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtGYWlsZWQgdG8gZmluZCBzeW5jb2Jq
ICgtJmd0OyBvdXQpOiBoYW5kbGU9JWRcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzeW5jLSZndDtoYW5kbGUpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IC1FTk9FTlQ7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJfc3luY19jbGVhbnVwOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKHN0eXBlID09IERSTV9OT1VWRUFVX1NZTkNfVElNRUxJTkVfU1lOQ09CSikg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCpwY2hhaW4gPSBkbWFf
ZmVuY2VfY2hhaW5fYWxsb2MoKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAoISpwY2hhaW4pIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXQgPSAtRU5PTUVNOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX3N5bmNfY2xlYW51cDs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0
dXJuIDA7PGJyPg0KKzxicj4NCitlcnJfc3luY19jbGVhbnVwOjxicj4NCivCoCDCoCDCoCDCoG5v
dXZlYXVfam9iX2ZlbmNlX2F0dGFjaF9jbGVhbnVwKGpvYik7PGJyPg0KK8KgIMKgIMKgIMKgcmV0
dXJuIHJldDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQ8YnI+DQorbm91dmVhdV9q
b2JfZmVuY2VfYXR0YWNoKHN0cnVjdCBub3V2ZWF1X2pvYiAqam9iKTxicj4NCit7PGJyPg0KK8Kg
IMKgIMKgIMKgc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UgPSBqb2ItJmd0O2RvbmVfZmVuY2U7PGJy
Pg0KK8KgIMKgIMKgIMKgaW50IGk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGZvciAoaSA9IDA7
IGkgJmx0OyBqb2ItJmd0O291dF9zeW5jLmNvdW50OyBpKyspIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZlYXVfc3luYyAqc3luYyA9ICZhbXA7am9iLSZndDtv
dXRfc3luYy5kYXRhW2ldOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1f
c3luY29iaiAqKnBvYmogPSAmYW1wO2pvYi0mZ3Q7b3V0X3N5bmMub2Jqc1tpXTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZG1hX2ZlbmNlX2NoYWluICoqcGNoYWluID0gJmFt
cDtqb2ItJmd0O291dF9zeW5jLmNoYWluc1tpXTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB1MzIgc3R5cGUgPSBzeW5jLSZndDtmbGFncyAmYW1wOyBEUk1fTk9VVkVBVV9TWU5DX1RZUEVf
TUFTSzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHN0eXBlID09IERS
TV9OT1VWRUFVX1NZTkNfVElNRUxJTkVfU1lOQ09CSikgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGRybV9zeW5jb2JqX2FkZF9wb2ludCgqcG9iaiwgKnBjaGFpbiwg
ZmVuY2UsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3luYy0mZ3Q7dGltZWxpbmVfdmFsdWUpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0gZWxzZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZHJtX3N5bmNvYmpfcmVwbGFjZV9mZW5jZSgqcG9iaiwgZmVuY2UpOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZHJtX3N5bmNvYmpfcHV0KCpwb2JqKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAqcG9iaiA9IE5VTEw7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKnBjaGFpbiA9
IE5VTEw7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9p
ZDxicj4NCitub3V2ZWF1X2pvYl9yZXN2X2FkZF9mZW5jZShzdHJ1Y3Qgbm91dmVhdV9qb2IgKmpv
Yik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZXhlYyAqZXhlYyA9ICZhbXA7
am9iLSZndDtleGVjOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
Ozxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgaW5kZXg7PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoGRybV9leGVjX2Zvcl9lYWNoX2xvY2tlZF9vYmplY3QoZXhlYywgaW5kZXgsIG9iaikg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkbWFfcmVzdiAqcmVzdiA9IG9i
ai0mZ3Q7cmVzdjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hX3Jlc3Zf
YWRkX2ZlbmNlKHJlc3YsIGpvYi0mZ3Q7ZG9uZV9mZW5jZSwgam9iLSZndDtyZXN2X3VzYWdlKTs8
YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KK308YnI+DQorPGJyPg0KK2ludDxicj4NCitub3V2ZWF1
X2pvYl9zdWJtaXQoc3RydWN0IG5vdXZlYXVfam9iICpqb2IpPGJyPg0KK3s8YnI+DQorwqAgwqAg
wqAgwqBzdHJ1Y3Qgbm91dmVhdV9zY2hlZF9lbnRpdHkgKmVudGl0eSA9IHRvX25vdXZlYXVfc2No
ZWRfZW50aXR5KGpvYi0mZ3Q7YmFzZS5lbnRpdHkpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBk
bWFfZmVuY2UgKmRvbmVfZmVuY2UgPSBOVUxMOzxicj4NCivCoCDCoCDCoCDCoGludCByZXQ7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfam9iX2FkZF9kZXBzKGpvYik7PGJy
Pg0KK8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3Rv
IGVycjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV9qb2JfZmVuY2VfYXR0
YWNoX3ByZXBhcmUoam9iKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBNYWtl
IHN1cmUgdGhlIGpvYiBhcHBlYXJzIG9uIHRoZSBzY2hlZF9lbnRpdHkmIzM5O3MgcXVldWUgaW4g
dGhlIHNhbWU8YnI+DQorwqAgwqAgwqAgwqAgKiBvcmRlciBhcyBpdCB3YXMgc3VibWl0dGVkLjxi
cj4NCivCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoG11dGV4X2xvY2soJmFtcDtlbnRp
dHktJmd0O211dGV4KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZHJtX2V4ZWNfaW5pdCgmYW1w
O2pvYi0mZ3Q7ZXhlYywgRFJNX0VYRUNfSU5URVJSVVBUSUJMRV9XQUlUIHw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBEUk1fRVhFQ19JR05P
UkVfRFVQTElDQVRFUyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qIEd1YXJhbnRlZSBqb2Jz
IHdlIHdvbiYjMzk7dCBmYWlsIGFmdGVyIHRoZSBzdWJtaXQoKSBjYWxsYmFjazxicj4NCivCoCDC
oCDCoCDCoCAqIHJldHVybmVkIHN1Y2Nlc3NmdWxseS48YnI+DQorwqAgwqAgwqAgwqAgKi88YnI+
DQorwqAgwqAgwqAgwqBpZiAoam9iLSZndDtvcHMtJmd0O3N1Ym1pdCkgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJldCA9IGpvYi0mZ3Q7b3BzLSZndDtzdWJtaXQoam9iKTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX2NsZWFudXA7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqBkcm1fc2NoZWRfam9iX2FybSgmYW1wO2pvYi0mZ3Q7YmFzZSk7
PGJyPg0KK8KgIMKgIMKgIMKgam9iLSZndDtkb25lX2ZlbmNlID0gZG1hX2ZlbmNlX2dldCgmYW1w
O2pvYi0mZ3Q7YmFzZS5zX2ZlbmNlLSZndDtmaW5pc2hlZCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYg
KGpvYi0mZ3Q7c3luYyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkb25lX2ZlbmNlID0g
ZG1hX2ZlbmNlX2dldChqb2ItJmd0O2RvbmVfZmVuY2UpOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBub3V2ZWF1X2pvYl9mZW5jZV9hdHRhY2goam9iKTs8YnI+DQorwqAgwqAgwqAgwqBub3V2ZWF1
X2pvYl9yZXN2X2FkZF9mZW5jZShqb2IpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBkcm1fZXhl
Y19maW5pKCZhbXA7am9iLSZndDtleGVjKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyogU2V0
IGpvYiBzdGF0ZSBiZWZvcmUgcHVzaGluZyB0aGUgam9iIHRvIHRoZSBzY2hlZHVsZXIsPGJyPg0K
K8KgIMKgIMKgIMKgICogc3VjaCB0aGF0IHdlIGRvIG5vdCBvdmVyd3JpdGUgdGhlIGpvYiBzdGF0
ZSBzZXQgaW4gcnVuKCkuPGJyPg0KK8KgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKgIMKgIMKgam9i
LSZndDtzdGF0ZSA9IE5PVVZFQVVfSk9CX1NVQk1JVF9TVUNDRVNTOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBkcm1fc2NoZWRfZW50aXR5X3B1c2hfam9iKCZhbXA7am9iLSZndDtiYXNlKTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgbXV0ZXhfdW5sb2NrKCZhbXA7ZW50aXR5LSZndDttdXRleCk7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChkb25lX2ZlbmNlKSB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZG1hX2ZlbmNlX3dhaXQoZG9uZV9mZW5jZSwgdHJ1ZSk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hX2ZlbmNlX3B1dChkb25lX2ZlbmNlKTs8YnI+DQorwqAg
wqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCis8YnI+DQor
ZXJyX2NsZWFudXA6PGJyPg0KK8KgIMKgIMKgIMKgZHJtX2V4ZWNfZmluaSgmYW1wO2pvYi0mZ3Q7
ZXhlYyk7PGJyPg0KK8KgIMKgIMKgIMKgbXV0ZXhfdW5sb2NrKCZhbXA7ZW50aXR5LSZndDttdXRl
eCk7PGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV9qb2JfZmVuY2VfYXR0YWNoX2NsZWFudXAoam9i
KTs8YnI+DQorZXJyOjxicj4NCivCoCDCoCDCoCDCoGpvYi0mZ3Q7c3RhdGUgPSBOT1VWRUFVX0pP
Ql9TVUJNSVRfRkFJTEVEOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KK308YnI+
DQorPGJyPg0KK2Jvb2w8YnI+DQorbm91dmVhdV9zY2hlZF9lbnRpdHlfcXdvcmsoc3RydWN0IG5v
dXZlYXVfc2NoZWRfZW50aXR5ICplbnRpdHksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk8YnI+DQorezxicj4NCivC
oCDCoCDCoCDCoHJldHVybiBxdWV1ZV93b3JrKGVudGl0eS0mZ3Q7c2NoZWRfd3EsIHdvcmspOzxi
cj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgc3RydWN0IGRtYV9mZW5jZSAqPGJyPg0KK25vdXZl
YXVfam9iX3J1bihzdHJ1Y3Qgbm91dmVhdV9qb2IgKmpvYik8YnI+DQorezxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBmZW5j
ZSA9IGpvYi0mZ3Q7b3BzLSZndDtydW4oam9iKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAodW5saWtl
bHkoSVNfRVJSKGZlbmNlKSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgam9iLSZndDtz
dGF0ZSA9IE5PVVZFQVVfSk9CX1JVTl9GQUlMRUQ7PGJyPg0KK8KgIMKgIMKgIMKgZWxzZTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGpvYi0mZ3Q7c3RhdGUgPSBOT1VWRUFVX0pPQl9SVU5f
U1VDQ0VTUzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIGZlbmNlOzxicj4NCit9PGJy
Pg0KKzxicj4NCitzdGF0aWMgc3RydWN0IGRtYV9mZW5jZSAqPGJyPg0KK25vdXZlYXVfc2NoZWRf
cnVuX2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKTxicj4NCit7PGJyPg0KK8Kg
IMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfam9iICpqb2IgPSB0b19ub3V2ZWF1X2pvYihzY2hlZF9q
b2IpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gbm91dmVhdV9qb2JfcnVuKGpvYik7
PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBlbnVtIGRybV9ncHVfc2NoZWRfc3RhdDxicj4N
Citub3V2ZWF1X3NjaGVkX3RpbWVkb3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRf
am9iKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfam9iICpqb2IgPSB0
b19ub3V2ZWF1X2pvYihzY2hlZF9qb2IpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBOVl9QUklO
VEsod2Fybiwgam9iLSZndDtjbGksICZxdW90O0pvYiB0aW1lZCBvdXQuXG4mcXVvdDspOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqBpZiAoam9iLSZndDtvcHMtJmd0O3RpbWVvdXQpPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIGpvYi0mZ3Q7b3BzLSZndDt0aW1lb3V0KGpvYik7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBEUk1fR1BVX1NDSEVEX1NUQVRfRU5PREVW
Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitub3V2ZWF1X3NjaGVkX2Zy
ZWVfam9iKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpPGJyPg0KK3s8YnI+DQorwqAg
wqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9qb2IgKmpvYiA9IHRvX25vdXZlYXVfam9iKHNjaGVkX2pv
Yik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfam9iX2Zpbmkoam9iKTs8YnI+DQor
fTxicj4NCis8YnI+DQoraW50IG5vdXZlYXVfc2NoZWRfZW50aXR5X2luaXQoc3RydWN0IG5vdXZl
YXVfc2NoZWRfZW50aXR5ICplbnRpdHksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qgd29ya3F1
ZXVlX3N0cnVjdCAqc2NoZWRfd3EpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBtdXRleF9pbml0
KCZhbXA7ZW50aXR5LSZndDttdXRleCk7PGJyPg0KK8KgIMKgIMKgIMKgc3Bpbl9sb2NrX2luaXQo
JmFtcDtlbnRpdHktJmd0O2pvYi5saXN0LmxvY2spOzxicj4NCivCoCDCoCDCoCDCoElOSVRfTElT
VF9IRUFEKCZhbXA7ZW50aXR5LSZndDtqb2IubGlzdC5oZWFkKTs8YnI+DQorwqAgwqAgwqAgwqBp
bml0X3dhaXRxdWV1ZV9oZWFkKCZhbXA7ZW50aXR5LSZndDtqb2Iud3EpOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBlbnRpdHktJmd0O3NjaGVkX3dxID0gc2NoZWRfd3E7PGJyPg0KK8KgIMKgIMKg
IMKgcmV0dXJuIGRybV9zY2hlZF9lbnRpdHlfaW5pdCgmYW1wO2VudGl0eS0mZ3Q7YmFzZSw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
RFJNX1NDSEVEX1BSSU9SSVRZX05PUk1BTCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmFtcDtzY2hlZCwgMSwgTlVMTCk7PGJyPg0K
K308YnI+DQorPGJyPg0KK3ZvaWQ8YnI+DQorbm91dmVhdV9zY2hlZF9lbnRpdHlfZmluaShzdHJ1
Y3Qgbm91dmVhdV9zY2hlZF9lbnRpdHkgKmVudGl0eSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDC
oGRybV9zY2hlZF9lbnRpdHlfZGVzdHJveSgmYW1wO2VudGl0eS0mZ3Q7YmFzZSk7PGJyPg0KK308
YnI+DQorPGJyPg0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3NjaGVkX2JhY2tlbmRfb3BzIG5v
dXZlYXVfc2NoZWRfb3BzID0gezxicj4NCivCoCDCoCDCoCDCoC5ydW5fam9iID0gbm91dmVhdV9z
Y2hlZF9ydW5fam9iLDxicj4NCivCoCDCoCDCoCDCoC50aW1lZG91dF9qb2IgPSBub3V2ZWF1X3Nj
aGVkX3RpbWVkb3V0X2pvYiw8YnI+DQorwqAgwqAgwqAgwqAuZnJlZV9qb2IgPSBub3V2ZWF1X3Nj
aGVkX2ZyZWVfam9iLDxicj4NCit9Ozxicj4NCis8YnI+DQoraW50IG5vdXZlYXVfc2NoZWRfaW5p
dChzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVj
dCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQgPSAmYW1wO2RybS0mZ3Q7c2NoZWQ7PGJyPg0KK8Kg
IMKgIMKgIMKgbG9uZyBqb2JfaGFuZ19saW1pdCA9IG1zZWNzX3RvX2ppZmZpZXMoTk9VVkVBVV9T
Q0hFRF9KT0JfVElNRU9VVF9NUyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGRybS0mZ3Q7c2No
ZWRfd3EgPSBjcmVhdGVfc2luZ2xldGhyZWFkX3dvcmtxdWV1ZSgmcXVvdDtub3V2ZWF1X3NjaGVk
X3dxJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoIWRybS0mZ3Q7c2NoZWRfd3EpPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIEVOT01FTTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgcmV0dXJuIGRybV9zY2hlZF9pbml0KHNjaGVkLCAmYW1wO25vdXZlYXVfc2NoZWRfb3Bz
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5PVVZF
QVVfU0NIRURfSFdfU1VCTUlTU0lPTlMsIDAsIGpvYl9oYW5nX2xpbWl0LDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5VTEwsIE5VTEwsICZxdW90O25v
dXZlYXVfc2NoZWQmcXVvdDssIGRybS0mZ3Q7ZGV2LSZndDtkZXYpOzxicj4NCit9PGJyPg0KKzxi
cj4NCit2b2lkIG5vdXZlYXVfc2NoZWRfZmluaShzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSk8YnI+
DQorezxicj4NCivCoCDCoCDCoCDCoGRlc3Ryb3lfd29ya3F1ZXVlKGRybS0mZ3Q7c2NoZWRfd3Ep
Ozxicj4NCivCoCDCoCDCoCDCoGRybV9zY2hlZF9maW5pKCZhbXA7ZHJtLSZndDtzY2hlZCk7PGJy
Pg0KK308YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9z
Y2hlZC5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zY2hlZC5oPGJyPg0KbmV3
IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwMDAwMDAuLjhiMjdiNWYzZGQ4ZDxi
cj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3NjaGVkLmg8YnI+DQpAQCAtMCwwICsxLDEyMyBAQDxicj4NCisvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTUlUICovPGJyPg0KKzxicj4NCisjaWZuZGVmIE5PVVZFQVVfU0NIRURfSDxi
cj4NCisjZGVmaW5lIE5PVVZFQVVfU0NIRURfSDxicj4NCis8YnI+DQorI2luY2x1ZGUgJmx0O2xp
bnV4L3R5cGVzLmgmZ3Q7PGJyPg0KKzxicj4NCisjaW5jbHVkZSAmbHQ7ZHJtL2RybV9leGVjLmgm
Z3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtkcm0vZ3B1X3NjaGVkdWxlci5oJmd0Ozxicj4NCis8YnI+
DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9kcnYuaCZxdW90Ozxicj4NCis8YnI+DQorI2RlZmlu
ZSB0b19ub3V2ZWF1X2pvYihzY2hlZF9qb2IpwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRhaW5lcl9vZigoc2NoZWRfam9iKSwgc3RydWN0IG5v
dXZlYXVfam9iLCBiYXNlKTxicj4NCis8YnI+DQorc3RydWN0IG5vdXZlYXVfam9iX29wczs8YnI+
DQorPGJyPg0KK2VudW0gbm91dmVhdV9qb2Jfc3RhdGUgezxicj4NCivCoCDCoCDCoCDCoE5PVVZF
QVVfSk9CX1VOSU5JVElBTElaRUQgPSAwLDxicj4NCivCoCDCoCDCoCDCoE5PVVZFQVVfSk9CX0lO
SVRJQUxJWkVELDxicj4NCivCoCDCoCDCoCDCoE5PVVZFQVVfSk9CX1NVQk1JVF9TVUNDRVNTLDxi
cj4NCivCoCDCoCDCoCDCoE5PVVZFQVVfSk9CX1NVQk1JVF9GQUlMRUQsPGJyPg0KK8KgIMKgIMKg
IMKgTk9VVkVBVV9KT0JfUlVOX1NVQ0NFU1MsPGJyPg0KK8KgIMKgIMKgIMKgTk9VVkVBVV9KT0Jf
UlVOX0ZBSUxFRCw8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0cnVjdCBub3V2ZWF1X2pvYl9hcmdz
IHs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdjs8YnI+DQorwqAg
wqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9zY2hlZF9lbnRpdHkgKnNjaGVkX2VudGl0eTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgZW51bSBkbWFfcmVzdl91c2FnZSByZXN2X3VzYWdlOzxicj4NCivC
oCDCoCDCoCDCoGJvb2wgc3luYzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZlYXVfc3luYyAqczs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1MzIgY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgfSBp
bl9zeW5jOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fbm91dmVhdV9zeW5jICpzOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHUzMiBjb3VudDs8YnI+DQorwqAgwqAgwqAgwqB9IG91dF9zeW5jOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9qb2Jfb3BzICpvcHM7PGJyPg0KK307
PGJyPg0KKzxicj4NCitzdHJ1Y3Qgbm91dmVhdV9qb2Igezxicj4NCivCoCDCoCDCoCDCoHN0cnVj
dCBkcm1fc2NoZWRfam9iIGJhc2U7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGVudW0gbm91dmVh
dV9qb2Jfc3RhdGUgc3RhdGU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1
X3NjaGVkX2VudGl0eSAqZW50aXR5Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGVfcHJpdjs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9jbGkgKmNs
aTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGRybV9leGVjIGV4ZWM7PGJyPg0KK8Kg
IMKgIMKgIMKgZW51bSBkbWFfcmVzdl91c2FnZSByZXN2X3VzYWdlOzxicj4NCivCoCDCoCDCoCDC
oHN0cnVjdCBkbWFfZmVuY2UgKmRvbmVfZmVuY2U7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGJv
b2wgc3luYzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZlYXVfc3luYyAqZGF0YTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB1MzIgY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgfSBpbl9zeW5jOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0cnVjdCBkcm1fbm91dmVhdV9zeW5jICpkYXRhOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0cnVjdCBkcm1fc3luY29iaiAqKm9ianM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc3RydWN0IGRtYV9mZW5jZV9jaGFpbiAqKmNoYWluczs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB1MzIgY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgfSBvdXRfc3luYzs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfam9iX29wcyB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ICgqc3VibWl0KShzdHJ1Y3Qgbm91dmVhdV9qb2IgKik7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRtYV9mZW5jZSAqKCpydW4pKHN0cnVjdCBu
b3V2ZWF1X2pvYiAqKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2b2lkICgqZnJlZSko
c3RydWN0IG5vdXZlYXVfam9iICopOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVudW0g
ZHJtX2dwdV9zY2hlZF9zdGF0ICgqdGltZW91dCkoc3RydWN0IG5vdXZlYXVfam9iICopOzxicj4N
CivCoCDCoCDCoCDCoH0gKm9wczs8YnI+DQorfTs8YnI+DQorPGJyPg0KK2ludCBub3V2ZWF1X2pv
Yl91Y29weV9zeW5jcyhzdHJ1Y3Qgbm91dmVhdV9qb2JfYXJncyAqYXJncyw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1MzIgaW5jLCB1NjQgaW5zLDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHUzMiBvdXRjLCB1NjQg
b3V0cyk7PGJyPg0KKzxicj4NCitpbnQgbm91dmVhdV9qb2JfaW5pdChzdHJ1Y3Qgbm91dmVhdV9q
b2IgKmpvYiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IG5vdXZl
YXVfam9iX2FyZ3MgKmFyZ3MpOzxicj4NCit2b2lkIG5vdXZlYXVfam9iX2ZyZWUoc3RydWN0IG5v
dXZlYXVfam9iICpqb2IpOzxicj4NCis8YnI+DQoraW50IG5vdXZlYXVfam9iX3N1Ym1pdChzdHJ1
Y3Qgbm91dmVhdV9qb2IgKmpvYik7PGJyPg0KK3ZvaWQgbm91dmVhdV9qb2JfZmluaShzdHJ1Y3Qg
bm91dmVhdV9qb2IgKmpvYik7PGJyPg0KKzxicj4NCisjZGVmaW5lIHRvX25vdXZlYXVfc2NoZWRf
ZW50aXR5KGVudGl0eSnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29udGFpbmVyX29mKChlbnRpdHkpLCBzdHJ1Y3Qgbm91dmVhdV9zY2hlZF9l
bnRpdHksIGJhc2UpPGJyPg0KKzxicj4NCitzdHJ1Y3Qgbm91dmVhdV9zY2hlZF9lbnRpdHkgezxi
cj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5IGJhc2U7PGJyPg0KK8KgIMKg
IMKgIMKgc3RydWN0IG11dGV4IG11dGV4Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
d29ya3F1ZXVlX3N0cnVjdCAqc2NoZWRfd3E7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHN0cnVj
dCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgbGlzdF9oZWFkIGhlYWQ7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3BpbmxvY2tfdCBsb2NrOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0gbGlzdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzdHJ1Y3Qgd2FpdF9xdWV1ZV9oZWFkIHdxOzxicj4NCivCoCDCoCDCoCDCoH0gam9iOzxicj4N
Cit9Ozxicj4NCis8YnI+DQoraW50IG5vdXZlYXVfc2NoZWRfZW50aXR5X2luaXQoc3RydWN0IG5v
dXZlYXVfc2NoZWRfZW50aXR5ICplbnRpdHksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qgd29y
a3F1ZXVlX3N0cnVjdCAqc2NoZWRfd3EpOzxicj4NCit2b2lkIG5vdXZlYXVfc2NoZWRfZW50aXR5
X2Zpbmkoc3RydWN0IG5vdXZlYXVfc2NoZWRfZW50aXR5ICplbnRpdHkpOzxicj4NCis8YnI+DQor
Ym9vbCBub3V2ZWF1X3NjaGVkX2VudGl0eV9xd29yayhzdHJ1Y3Qgbm91dmVhdV9zY2hlZF9lbnRp
dHkgKmVudGl0eSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspOzxicj4NCis8YnI+DQoraW50IG5vdXZl
YXVfc2NoZWRfaW5pdChzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSk7PGJyPg0KK3ZvaWQgbm91dmVh
dV9zY2hlZF9maW5pKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtKTs8YnI+DQorPGJyPg0KKyNlbmRp
Zjxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3V2bW0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdXZtbS5jPGJyPg0KbmV3IGZpbGUg
bW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwMDAwMDAuLjdiNDQ0ZWE1ZjZkNjxicj4NCi0t
LSAvZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3V2
bW0uYzxicj4NCkBAIC0wLDAgKzEsMTk3MCBAQDxicj4NCisvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUICovPGJyPg0KKy8qPGJyPg0KKyAqIENvcHlyaWdodCAoYykgMjAyMiBSZWQgSGF0
Ljxicj4NCisgKjxicj4NCisgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9m
IGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYTxicj4NCisgKiBjb3B5IG9mIHRoaXMg
c29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICZxdW90O1Nv
ZnR3YXJlJnF1b3Q7KSw8YnI+DQorICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCBy
ZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbjxicj4NCisgKiB0aGUgcmln
aHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3Vi
bGljZW5zZSw8YnI+DQorICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5k
IHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlPGJyPg0KKyAqIFNvZnR3YXJlIGlzIGZ1cm5p
c2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6PGJyPg0K
KyAqPGJyPg0KKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Np
b24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluPGJyPg0KKyAqIGFsbCBjb3BpZXMgb3Igc3Vi
c3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLjxicj4NCisgKjxicj4NCisgKiBUSEUg
U09GVFdBUkUgSVMgUFJPVklERUQgJnF1b3Q7QVMgSVMmcXVvdDssIFdJVEhPVVQgV0FSUkFOVFkg
T0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1I8YnI+DQorICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBO
T1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksPGJyPg0KKyAq
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuwqAg
SU4gTk8gRVZFTlQgU0hBTEw8YnI+DQorICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVU
SE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SPGJyPg0KKyAqIE9USEVS
IExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RI
RVJXSVNFLDxicj4NCisgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJ
VEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1I8YnI+DQorICogT1RIRVIgREVBTElOR1MgSU4g
VEhFIFNPRlRXQVJFLjxicj4NCisgKjxicj4NCisgKiBBdXRob3JzOjxicj4NCisgKsKgIMKgIMKg
RGFuaWxvIEtydW1tcmljaCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRha3JAcmVkaGF0LmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmRha3JAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KKyAqPGJyPg0KKyAqLzxi
cj4NCis8YnI+DQorLyo8YnI+DQorICogTG9ja2luZzo8YnI+DQorICo8YnI+DQorICogVGhlIHV2
bW0gbXV0ZXggcHJvdGVjdHMgYW55IG9wZXJhdGlvbnMgb24gdGhlIEdQVSBWQSBzcGFjZSBwcm92
aWRlZCBieSB0aGU8YnI+DQorICogRFJNIEdQVSBWQSBtYW5hZ2VyLjxicj4NCisgKjxicj4NCisg
KiBUaGUgR0VNcyBkbWFfcmVzdiBsb2NrIHByb3RlY3RzIHRoZSBHRU1zIEdQVVZBIGxpc3QsIGhl
bmNlIGxpbmsvdW5saW5rIG9mIGE8YnI+DQorICogbWFwcGluZyB0byBpdCYjMzk7cyBiYWNraW5n
IEdFTSBtdXN0IGJlIHBlcmZvcm1lZCB1bmRlciB0aGlzIGxvY2suPGJyPg0KKyAqPGJyPg0KKyAq
IEFjdHVhbCBtYXAvdW5tYXAgb3BlcmF0aW9ucyB3aXRoaW4gdGhlIGZlbmNlIHNpZ25hbGxpbmcg
Y3JpdGljYWwgcGF0aCBhcmU8YnI+DQorICogcHJvdGVjdGVkIGJ5IGluc3RhbGxpbmcgRE1BIGZl
bmNlcyB0byB0aGUgY29ycmVzcG9uZGluZyBHRU1zIERNQTxicj4NCisgKiByZXNlcnZhdGlvbnMs
IHN1Y2ggdGhhdCBjb25jdXJyZW50IEJPIG1vdmVzLCB3aGljaCBpdHNlbGYgd2FsayB0aGUgR0VN
cyBHUFVWQTxicj4NCisgKiBsaXN0IGluIG9yZGVyIHRvIG1hcC91bm1hcCBpdCYjMzk7cyBlbnRy
aWVzLCBjYW4mIzM5O3Qgb2NjdXIgY29uY3VycmVudGx5Ljxicj4NCisgKjxicj4NCisgKiBBY2Nl
c3NpbmcgdGhlIERSTV9HUFVWQV9JTlZBTElEQVRFRCBmbGFnIGRvZXNuJiMzOTt0IG5lZWQgYW55
IHNlcGFyYXRlPGJyPg0KKyAqIHByb3RlY3Rpb24sIHNpbmNlIHRoZXJlIGFyZSBubyBhY2Nlc3Nl
cyBvdGhlciB0aGFuIGZyb20gQk8gbW92ZSBjYWxsYmFja3M8YnI+DQorICogYW5kIGZyb20gdGhl
IGZlbmNlIHNpZ25hbGxpbmcgY3JpdGljYWwgcGF0aCwgd2hpY2ggYXJlIGFscmVhZHkgcHJvdGVj
dGVkIGJ5PGJyPg0KKyAqIHRoZSBjb3JyZXNwb25kaW5nIEdFTXMgRE1BIHJlc2VydmF0aW9uIGZl
bmNlLjxicj4NCisgKi88YnI+DQorPGJyPg0KKyNpbmNsdWRlICZxdW90O25vdXZlYXVfZHJ2Lmgm
cXVvdDs8YnI+DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9nZW0uaCZxdW90Ozxicj4NCisjaW5j
bHVkZSAmcXVvdDtub3V2ZWF1X21lbS5oJnF1b3Q7PGJyPg0KKyNpbmNsdWRlICZxdW90O25vdXZl
YXVfdXZtbS5oJnF1b3Q7PGJyPg0KKzxicj4NCisjaW5jbHVkZSAmbHQ7bnZpZi92bW0uaCZndDs8
YnI+DQorI2luY2x1ZGUgJmx0O252aWYvbWVtLmgmZ3Q7PGJyPg0KKzxicj4NCisjaW5jbHVkZSAm
bHQ7bnZpZi9jbGFzcy5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7bnZpZi9pZjAwMGMuaCZndDs8
YnI+DQorI2luY2x1ZGUgJmx0O252aWYvaWY5MDBkLmgmZ3Q7PGJyPg0KKzxicj4NCisjZGVmaW5l
IE5PVVZFQVVfVkFfU1BBQ0VfQklUU8KgIMKgIMKgIMKgIMKgIDQ3IC8qIEZJWE1FICovPGJyPg0K
KyNkZWZpbmUgTk9VVkVBVV9WQV9TUEFDRV9TVEFSVMKgIMKgIMKgIMKgIMKgMHgwPGJyPg0KKyNk
ZWZpbmUgTk9VVkVBVV9WQV9TUEFDRV9FTkTCoCDCoCDCoCDCoCDCoCDCoCgxVUxMICZsdDsmbHQ7
IE5PVVZFQVVfVkFfU1BBQ0VfQklUUyk8YnI+DQorPGJyPg0KKyNkZWZpbmUgbGlzdF9sYXN0X29w
KF9vcHMpIGxpc3RfbGFzdF9lbnRyeShfb3BzLCBzdHJ1Y3QgYmluZF9qb2Jfb3AsIGVudHJ5KTxi
cj4NCisjZGVmaW5lIGxpc3RfcHJldl9vcChfb3ApIGxpc3RfcHJldl9lbnRyeShfb3AsIGVudHJ5
KTxicj4NCisjZGVmaW5lIGxpc3RfZm9yX2VhY2hfb3AoX29wLCBfb3BzKSBsaXN0X2Zvcl9lYWNo
X2VudHJ5KF9vcCwgX29wcywgZW50cnkpPGJyPg0KKyNkZWZpbmUgbGlzdF9mb3JfZWFjaF9vcF9m
cm9tX3JldmVyc2UoX29wLCBfb3BzKSBcPGJyPg0KK8KgIMKgIMKgIMKgbGlzdF9mb3JfZWFjaF9l
bnRyeV9mcm9tX3JldmVyc2UoX29wLCBfb3BzLCBlbnRyeSk8YnI+DQorI2RlZmluZSBsaXN0X2Zv
cl9lYWNoX29wX3NhZmUoX29wLCBfbiwgX29wcykgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKF9v
cCwgX24sIF9vcHMsIGVudHJ5KTxicj4NCis8YnI+DQorZW51bSB2bV9iaW5kX29wIHs8YnI+DQor
wqAgwqAgwqAgwqBPUF9NQVAgPSBEUk1fTk9VVkVBVV9WTV9CSU5EX09QX01BUCw8YnI+DQorwqAg
wqAgwqAgwqBPUF9VTk1BUCA9IERSTV9OT1VWRUFVX1ZNX0JJTkRfT1BfVU5NQVAsPGJyPg0KK8Kg
IMKgIMKgIMKgT1BfTUFQX1NQQVJTRSw8YnI+DQorwqAgwqAgwqAgwqBPUF9VTk1BUF9TUEFSU0Us
PGJyPg0KK307PGJyPg0KKzxicj4NCitzdHJ1Y3Qgbm91dmVhdV91dm1hX3ByZWFsbG9jIHs8YnI+
DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1hICptYXA7PGJyPg0KK8KgIMKgIMKgIMKg
c3RydWN0IG5vdXZlYXVfdXZtYSAqcHJldjs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVh
dV91dm1hICpuZXh0Ozxicj4NCit9Ozxicj4NCis8YnI+DQorc3RydWN0IGJpbmRfam9iX29wIHs8
YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgbGlzdF9oZWFkIGVudHJ5Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBlbnVtIHZtX2JpbmRfb3Agb3A7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIGZsYWdzOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHU2NCBhZGRyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCByYW5nZTs8YnI+
DQorwqAgwqAgwqAgwqB9IHZhOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHUzMiBoYW5kbGU7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdTY0IG9mZnNldDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iajs8YnI+DQorwqAgwqAgwqAgwqB9IGdlbTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtYV9yZWdpb24gKnJlZzs8YnI+DQorwqAgwqAg
wqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1hX3ByZWFsbG9jIG5ldzs8YnI+DQorwqAgwqAgwqAgwqBz
dHJ1Y3QgZHJtX2dwdXZhX29wcyAqb3BzOzxicj4NCit9Ozxicj4NCis8YnI+DQorc3RydWN0IHV2
bW1fbWFwX2FyZ3Mgezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9u
ICpyZWdpb247PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGFkZHI7PGJyPg0KK8KgIMKgIMKgIMKgdTY0
IHJhbmdlOzxicj4NCivCoCDCoCDCoCDCoHU4IGtpbmQ7PGJyPg0KK307PGJyPg0KKzxicj4NCitz
dGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtbV92bW1fc3BhcnNlX3JlZihzdHJ1Y3Qgbm91dmVh
dV91dm1tICp1dm1tLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHU2NCBhZGRyLCB1NjQgcmFuZ2UpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
bnZpZl92bW0gKnZtbSA9ICZhbXA7dXZtbS0mZ3Q7dm1tLnZtbTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgcmV0dXJuIG52aWZfdm1tX3Jhd19zcGFyc2Uodm1tLCBhZGRyLCByYW5nZSwgdHJ1ZSk7
PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQ8YnI+DQorbm91dmVhdV91dm1tX3ZtbV9z
cGFyc2VfdW5yZWYoc3RydWN0IG5vdXZlYXVfdXZtbSAqdXZtbSw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgYWRkciwgdTY0IHJhbmdlKTxicj4N
Cit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG52aWZfdm1tICp2bW0gPSAmYW1wO3V2bW0tJmd0
O3ZtbS52bW07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBudmlmX3ZtbV9yYXdfc3Bh
cnNlKHZtbSwgYWRkciwgcmFuZ2UsIGZhbHNlKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGlj
IGludDxicj4NCitub3V2ZWF1X3V2bW1fdm1tX2dldChzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1t
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1NjQgYWRkciwgdTY0IHJhbmdl
KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG52aWZfdm1tICp2bW0gPSAmYW1wO3V2
bW0tJmd0O3ZtbS52bW07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBudmlmX3ZtbV9y
YXdfZ2V0KHZtbSwgYWRkciwgcmFuZ2UsIFBBR0VfU0hJRlQpOzxicj4NCit9PGJyPg0KKzxicj4N
CitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtbV92bW1fcHV0KHN0cnVjdCBub3V2ZWF1X3V2
bW0gKnV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHU2NCBhZGRyLCB1
NjQgcmFuZ2UpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgbnZpZl92bW0gKnZtbSA9
ICZhbXA7dXZtbS0mZ3Q7dm1tLnZtbTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIG52
aWZfdm1tX3Jhd19wdXQodm1tLCBhZGRyLCByYW5nZSwgUEFHRV9TSElGVCk7PGJyPg0KK308YnI+
DQorPGJyPg0KK3N0YXRpYyBpbnQ8YnI+DQorbm91dmVhdV91dm1tX3ZtbV91bm1hcChzdHJ1Y3Qg
bm91dmVhdV91dm1tICp1dm1tLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB1NjQgYWRkciwgdTY0IHJhbmdlLCBib29sIHNwYXJzZSk8YnI+DQorezxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBudmlmX3ZtbSAqdm1tID0gJmFtcDt1dm1tLSZndDt2bW0udm1tOzxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gbnZpZl92bW1fcmF3X3VubWFwKHZtbSwgYWRkciwgcmFu
Z2UsIFBBR0VfU0hJRlQsIHNwYXJzZSk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQ8
YnI+DQorbm91dmVhdV91dm1tX3ZtbV9tYXAoc3RydWN0IG5vdXZlYXVfdXZtbSAqdXZtbSw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdTY0IGFkZHIsIHU2NCByYW5nZSw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdTY0IGJvX29mZnNldCwgdTgga2luZCw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IG5vdXZlYXVfbWVtICpt
ZW0pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgbnZpZl92bW0gKnZtbSA9ICZhbXA7
dXZtbS0mZ3Q7dm1tLnZtbTs8YnI+DQorwqAgwqAgwqAgwqB1bmlvbiB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RydWN0IGdmMTAwX3ZtbV9tYXBfdjAgZ2YxMDA7PGJyPg0KK8KgIMKg
IMKgIMKgfSBhcmdzOzxicj4NCivCoCDCoCDCoCDCoHUzMiBhcmdjID0gMDs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgc3dpdGNoICh2bW0tJmd0O29iamVjdC5vY2xhc3MpIHs8YnI+DQorwqAgwqAg
wqAgwqBjYXNlIE5WSUZfQ0xBU1NfVk1NX0dGMTAwOjxicj4NCivCoCDCoCDCoCDCoGNhc2UgTlZJ
Rl9DTEFTU19WTU1fR00yMDA6PGJyPg0KK8KgIMKgIMKgIMKgY2FzZSBOVklGX0NMQVNTX1ZNTV9H
UDEwMDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhcmdzLmdmMTAwLnZlcnNpb24gPSAw
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChtZW0tJmd0O21lbS50eXBlICZhbXA7
IE5WSUZfTUVNX1ZSQU0pPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YXJncy5nZjEwMC52b2wgPSAwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVsc2U8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhcmdzLmdmMTAwLnZvbCA9IDE7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cDovL2FyZ3MuZ2YxMDAu
cm8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmFyZ3MuZ2YxMDAucm88L2E+ID0g
MDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhcmdzLmdmMTAwLnByaXYgPSAwOzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFyZ3MuZ2YxMDAua2luZCA9IGtpbmQ7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYXJnYyA9IHNpemVvZihhcmdzLmdmMTAwKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFdBUk5fT04oMSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmV0dXJuIC1FTk9TWVM7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqByZXR1cm4gbnZpZl92bW1fcmF3X21hcCh2bW0sIGFkZHIsIHJhbmdlLCBQQUdF
X1NISUZULDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZhbXA7YXJncywgYXJnYyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmYW1wO21lbS0mZ3Q7bWVtLCBib19vZmZzZXQpOzxicj4NCit9PGJy
Pg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtYV9yZWdpb25fc3BhcnNlX3Vu
cmVmKHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9uICpyZWcpPGJyPg0KK3s8YnI+DQorwqAgwqAg
wqAgwqB1NjQgYWRkciA9IHJlZy0mZ3Q7dmEuYWRkcjs8YnI+DQorwqAgwqAgwqAgwqB1NjQgcmFu
Z2UgPSByZWctJmd0O3ZhLnJhbmdlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gbm91
dmVhdV91dm1tX3ZtbV9zcGFyc2VfdW5yZWYocmVnLSZndDt1dm1tLCBhZGRyLCByYW5nZSk7PGJy
Pg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQ8YnI+DQorbm91dmVhdV91dm1hX3ZtbV9wdXQo
c3RydWN0IG5vdXZlYXVfdXZtYSAqdXZtYSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHU2NCBh
ZGRyID0gdXZtYS0mZ3Q7dmEudmEuYWRkcjs8YnI+DQorwqAgwqAgwqAgwqB1NjQgcmFuZ2UgPSB1
dm1hLSZndDt2YS52YS5yYW5nZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIG5vdXZl
YXVfdXZtbV92bW1fcHV0KHV2bWEtJmd0O3V2bW0sIGFkZHIsIHJhbmdlKTs8YnI+DQorfTxicj4N
Cis8YnI+DQorc3RhdGljIGludDxicj4NCitub3V2ZWF1X3V2bWFfbWFwKHN0cnVjdCBub3V2ZWF1
X3V2bWEgKnV2bWEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBub3V2ZWF1
X21lbSAqbWVtKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGFkZHIgPSB1dm1hLSZndDt2
YS52YS5hZGRyOzxicj4NCivCoCDCoCDCoCDCoHU2NCBvZmZzZXQgPSB1dm1hLSZndDt2YS5nZW0u
b2Zmc2V0Ozxicj4NCivCoCDCoCDCoCDCoHU2NCByYW5nZSA9IHV2bWEtJmd0O3ZhLnZhLnJhbmdl
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gbm91dmVhdV91dm1tX3ZtbV9tYXAodXZt
YS0mZ3Q7dXZtbSwgYWRkciwgcmFuZ2UsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb2Zmc2V0LCB1dm1hLSZndDtraW5kLCBtZW0pOzxi
cj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtYV91bm1hcChz
dHJ1Y3Qgbm91dmVhdV91dm1hICp1dm1hKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGFk
ZHIgPSB1dm1hLSZndDt2YS52YS5hZGRyOzxicj4NCivCoCDCoCDCoCDCoHU2NCByYW5nZSA9IHV2
bWEtJmd0O3ZhLnZhLnJhbmdlOzxicj4NCivCoCDCoCDCoCDCoGJvb2wgc3BhcnNlID0gISF1dm1h
LSZndDtyZWdpb247PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChkcm1fZ3B1dmFfaW52YWxp
ZGF0ZWQoJmFtcDt1dm1hLSZndDt2YSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIDA7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBub3V2ZWF1X3V2bW1fdm1tX3Vu
bWFwKHV2bWEtJmd0O3V2bW0sIGFkZHIsIHJhbmdlLCBzcGFyc2UpOzxicj4NCit9PGJyPg0KKzxi
cj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtYV9hbGxvYyhzdHJ1Y3Qgbm91dmVhdV91
dm1hICoqcHV2bWEpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqAqcHV2bWEgPSBremFsbG9jKHNp
emVvZigqKnB1dm1hKSwgR0ZQX0tFUk5FTCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCEqcHV2bWEp
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FTk9NRU07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxi
cj4NCitub3V2ZWF1X3V2bWFfZnJlZShzdHJ1Y3Qgbm91dmVhdV91dm1hICp1dm1hKTxicj4NCit7
PGJyPg0KK8KgIMKgIMKgIMKga2ZyZWUodXZtYSk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRp
YyBpbnQ8YnI+DQorX19ub3V2ZWF1X3V2bWFfaW5zZXJ0KHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2
bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVf
dXZtYSAqdXZtYSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHJldHVybiBkcm1fZ3B1dmFfaW5z
ZXJ0KCZhbXA7dXZtbS0mZ3Q7dW1nciwgJmFtcDt1dm1hLSZndDt2YSk7PGJyPg0KK308YnI+DQor
PGJyPg0KK3N0YXRpYyBpbnQ8YnI+DQorbm91dmVhdV91dm1hX2luc2VydChzdHJ1Y3Qgbm91dmVh
dV91dm1tICp1dm1tLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBu
b3V2ZWF1X3V2bWEgKnV2bWEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Ry
dWN0IG5vdXZlYXVfdXZtYV9yZWdpb24gKnJlZ2lvbiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB1NjQgYm9fb2Zmc2V0LCB1NjQgYWRkciw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgcmFuZ2UsIHU4IGtpbmQpPGJyPg0KK3s8YnI+DQorwqAg
wqAgwqAgwqBpbnQgcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB1dm1hLSZndDt1dm1tID0g
dXZtbTs8YnI+DQorwqAgwqAgwqAgwqB1dm1hLSZndDtyZWdpb24gPSByZWdpb247PGJyPg0KK8Kg
IMKgIMKgIMKgdXZtYS0mZ3Q7a2luZCA9IGtpbmQ7PGJyPg0KK8KgIMKgIMKgIMKgdXZtYS0mZ3Q7
dmEudmEuYWRkciA9IGFkZHI7PGJyPg0KK8KgIMKgIMKgIMKgdXZtYS0mZ3Q7dmEudmEucmFuZ2Ug
PSByYW5nZTs8YnI+DQorwqAgwqAgwqAgwqB1dm1hLSZndDt2YS5nZW0ub2Zmc2V0ID0gYm9fb2Zm
c2V0Ozxicj4NCivCoCDCoCDCoCDCoHV2bWEtJmd0O3ZhLmdlbS5vYmogPSBvYmo7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoHJldCA9IF9fbm91dmVhdV91dm1hX2luc2VydCh1dm1tLCB1dm1hKTs8
YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybiByZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0K
Kzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitub3V2ZWF1X3V2bWFfcmVtb3ZlKHN0cnVjdCBub3V2
ZWF1X3V2bWEgKnV2bWEpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBkcm1fZ3B1dmFfcmVtb3Zl
KCZhbXA7dXZtYS0mZ3Q7dmEpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4N
Citub3V2ZWF1X3V2bWFfZ2VtX2dldChzdHJ1Y3Qgbm91dmVhdV91dm1hICp1dm1hKTxicj4NCit7
PGJyPg0KK8KgIMKgIMKgIMKgZHJtX2dlbV9vYmplY3RfZ2V0KHV2bWEtJmd0O3ZhLmdlbS5vYmop
Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitub3V2ZWF1X3V2bWFfZ2Vt
X3B1dChzdHJ1Y3Qgbm91dmVhdV91dm1hICp1dm1hKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKg
ZHJtX2dlbV9vYmplY3RfcHV0KHV2bWEtJmd0O3ZhLmdlbS5vYmopOzxicj4NCit9PGJyPg0KKzxi
cj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtYV9yZWdpb25fYWxsb2Moc3RydWN0IG5v
dXZlYXVfdXZtYV9yZWdpb24gKipwcmVnKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgKnByZWcg
PSBremFsbG9jKHNpemVvZigqKnByZWcpLCBHRlBfS0VSTkVMKTs8YnI+DQorwqAgwqAgwqAgwqBp
ZiAoISpwcmVnKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRU5PTUVNOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBrcmVmX2luaXQoJmFtcDsoKnByZWcpLSZndDtrcmVmKTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0
YXRpYyB2b2lkPGJyPg0KK25vdXZlYXVfdXZtYV9yZWdpb25fZnJlZShzdHJ1Y3Qga3JlZiAqa3Jl
Zik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9uICpy
ZWcgPTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1
Y3Qgbm91dmVhdV91dm1hX3JlZ2lvbiwga3JlZik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGtm
cmVlKHJlZyk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK25vdXZlYXVf
dXZtYV9yZWdpb25fZ2V0KHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9uICpyZWcpPGJyPg0KK3s8
YnI+DQorwqAgwqAgwqAgwqBrcmVmX2dldCgmYW1wO3JlZy0mZ3Q7a3JlZik7PGJyPg0KK308YnI+
DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK25vdXZlYXVfdXZtYV9yZWdpb25fcHV0KHN0cnVj
dCBub3V2ZWF1X3V2bWFfcmVnaW9uICpyZWcpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBrcmVm
X3B1dCgmYW1wO3JlZy0mZ3Q7a3JlZiwgbm91dmVhdV91dm1hX3JlZ2lvbl9mcmVlKTs8YnI+DQor
fTxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4NCitfX25vdXZlYXVfdXZtYV9yZWdpb25faW5z
ZXJ0KHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9uICpyZWcpPGJy
Pg0KK3s8YnI+DQorwqAgwqAgwqAgwqB1NjQgYWRkciA9IHJlZy0mZ3Q7dmEuYWRkcjs8YnI+DQor
wqAgwqAgwqAgwqB1NjQgcmFuZ2UgPSByZWctJmd0O3ZhLnJhbmdlOzxicj4NCivCoCDCoCDCoCDC
oHU2NCBsYXN0ID0gYWRkciArIHJhbmdlIC0gMTs8YnI+DQorwqAgwqAgwqAgwqBNQV9TVEFURSht
YXMsICZhbXA7dXZtbS0mZ3Q7cmVnaW9uX210LCBhZGRyLCBhZGRyKTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgaWYgKHVubGlrZWx5KG1hc193YWxrKCZhbXA7bWFzKSkpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBtYXNfdW5sb2NrKCZhbXA7bWFzKTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gLUVFWElTVDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGlmICh1bmxpa2VseShtYXMubGFzdCAmbHQ7IGxhc3QpKSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFzX3VubG9jaygmYW1wO21hcyk7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FRVhJU1Q7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBtYXMuaW5kZXggPSBhZGRyOzxicj4NCivCoCDCoCDCoCDCoG1hcy5s
YXN0ID0gbGFzdDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbWFzX3N0b3JlX2dmcCgmYW1wO21h
cywgcmVnLCBHRlBfS0VSTkVMKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmVnLSZndDt1dm1t
ID0gdXZtbTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQor
PGJyPg0KK3N0YXRpYyBpbnQ8YnI+DQorbm91dmVhdV91dm1hX3JlZ2lvbl9pbnNlcnQoc3RydWN0
IG5vdXZlYXVfdXZtbSAqdXZtbSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgc3RydWN0IG5vdXZlYXVfdXZtYV9yZWdpb24gKnJlZyw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdTY0IGFkZHIsIHU2NCByYW5nZSk8YnI+DQor
ezxicj4NCivCoCDCoCDCoCDCoGludCByZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJlZy0m
Z3Q7dXZtbSA9IHV2bW07PGJyPg0KK8KgIMKgIMKgIMKgcmVnLSZndDt2YS5hZGRyID0gYWRkcjs8
YnI+DQorwqAgwqAgwqAgwqByZWctJmd0O3ZhLnJhbmdlID0gcmFuZ2U7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHJldCA9IF9fbm91dmVhdV91dm1hX3JlZ2lvbl9pbnNlcnQodXZtbSwgcmVnKTs8
YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybiByZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0K
Kzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitub3V2ZWF1X3V2bWFfcmVnaW9uX3JlbW92ZShzdHJ1
Y3Qgbm91dmVhdV91dm1hX3JlZ2lvbiAqcmVnKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG5vdXZlYXVfdXZtbSAqdXZtbSA9IHJlZy0mZ3Q7dXZtbTs8YnI+DQorwqAgwqAgwqAgwqBN
QV9TVEFURShtYXMsICZhbXA7dXZtbS0mZ3Q7cmVnaW9uX210LCByZWctJmd0O3ZhLmFkZHIsIDAp
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBtYXNfZXJhc2UoJmFtcDttYXMpOzxicj4NCit9PGJy
Pg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtYV9yZWdpb25fY3JlYXRlKHN0
cnVjdCBub3V2ZWF1X3V2bW0gKnV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHU2NCBhZGRyLCB1NjQgcmFuZ2UpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAg
wqBzdHJ1Y3Qgbm91dmVhdV91dm1hX3JlZ2lvbiAqcmVnOzxicj4NCivCoCDCoCDCoCDCoGludCBy
ZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmICghZHJtX2dwdXZhX2ludGVydmFsX2VtcHR5
KCZhbXA7dXZtbS0mZ3Q7dW1nciwgYWRkciwgcmFuZ2UpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJldHVybiAtRU5PU1BDOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXQgPSBub3V2
ZWF1X3V2bWFfcmVnaW9uX2FsbG9jKCZhbXA7cmVnKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0
KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfdXZtYV9yZWdpb25faW5zZXJ0KHV2bW0sIHJlZywgYWRk
ciwgcmFuZ2UpOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ290byBlcnJfZnJlZV9yZWdpb247PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJl
dCA9IG5vdXZlYXVfdXZtbV92bW1fc3BhcnNlX3JlZih1dm1tLCBhZGRyLCByYW5nZSk7PGJyPg0K
K8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVy
cl9yZWdpb25fcmVtb3ZlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQor
PGJyPg0KK2Vycl9yZWdpb25fcmVtb3ZlOjxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9y
ZWdpb25fcmVtb3ZlKHJlZyk7PGJyPg0KK2Vycl9mcmVlX3JlZ2lvbjo8YnI+DQorwqAgwqAgwqAg
wqBub3V2ZWF1X3V2bWFfcmVnaW9uX3B1dChyZWcpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBy
ZXQ7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3Qgbm91dmVhdV91dm1hX3JlZ2lv
biAqPGJyPg0KK25vdXZlYXVfdXZtYV9yZWdpb25fZmluZF9maXJzdChzdHJ1Y3Qgbm91dmVhdV91
dm1tICp1dm1tLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB1NjQgYWRkciwgdTY0IHJhbmdlKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgTUFfU1RB
VEUobWFzLCAmYW1wO3V2bW0tJmd0O3JlZ2lvbl9tdCwgYWRkciwgMCk7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHJldHVybiBtYXNfZmluZCgmYW1wO21hcywgYWRkciArIHJhbmdlIC0gMSk7PGJy
Pg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3Qgbm91dmVhdV91dm1hX3JlZ2lvbiAqPGJy
Pg0KK25vdXZlYXVfdXZtYV9yZWdpb25fZmluZChzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tLDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1NjQgYWRkciwgdTY0IHJh
bmdlKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtYV9yZWdpb24g
KnJlZzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmVnID0gbm91dmVhdV91dm1hX3JlZ2lvbl9m
aW5kX2ZpcnN0KHV2bW0sIGFkZHIsIHJhbmdlKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoIXJlZyk8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gTlVMTDs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgaWYgKHJlZy0mZ3Q7dmEuYWRkciAhPSBhZGRyIHx8PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgcmVnLSZndDt2YS5yYW5nZSAhPSByYW5nZSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXR1cm4gTlVMTDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIHJlZzs8YnI+
DQorfTxicj4NCis8YnI+DQorc3RhdGljIGJvb2w8YnI+DQorbm91dmVhdV91dm1hX3JlZ2lvbl9l
bXB0eShzdHJ1Y3Qgbm91dmVhdV91dm1hX3JlZ2lvbiAqcmVnKTxicj4NCit7PGJyPg0KK8KgIMKg
IMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtbSAqdXZtbSA9IHJlZy0mZ3Q7dXZtbTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgcmV0dXJuIGRybV9ncHV2YV9pbnRlcnZhbF9lbXB0eSgmYW1wO3V2bW0t
Jmd0O3VtZ3IsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnLSZndDt2YS5hZGRyLDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy0mZ3Q7dmEucmFu
Z2UpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK19fbm91dmVhdV91dm1h
X3JlZ2lvbl9kZXN0cm95KHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9uICpyZWcpPGJyPg0KK3s8
YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tID0gcmVnLSZndDt1dm1t
Ozxicj4NCivCoCDCoCDCoCDCoHU2NCBhZGRyID0gcmVnLSZndDt2YS5hZGRyOzxicj4NCivCoCDC
oCDCoCDCoHU2NCByYW5nZSA9IHJlZy0mZ3Q7dmEucmFuZ2U7PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoGlmICghbm91dmVhdV91dm1hX3JlZ2lvbl9lbXB0eShyZWcpKTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJldHVybiAtRUJVU1k7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoG5vdXZl
YXVfdXZtYV9yZWdpb25fcmVtb3ZlKHJlZyk7PGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV91dm1t
X3ZtbV9zcGFyc2VfdW5yZWYodXZtbSwgYWRkciwgcmFuZ2UpOzxicj4NCivCoCDCoCDCoCDCoG5v
dXZlYXVfdXZtYV9yZWdpb25fcHV0KHJlZyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVy
biAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtYV9y
ZWdpb25fZGVzdHJveShzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCBhZGRyLCB1NjQgcmFuZ2UpPGJyPg0K
K3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1hX3JlZ2lvbiAqcmVnOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqByZWcgPSBub3V2ZWF1X3V2bWFfcmVnaW9uX2ZpbmQodXZtbSwg
YWRkciwgcmFuZ2UpOzxicj4NCivCoCDCoCDCoCDCoGlmICghcmVnKTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJldHVybiAtRU5PRU5UOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1
cm4gX19ub3V2ZWF1X3V2bWFfcmVnaW9uX2Rlc3Ryb3kocmVnKTs8YnI+DQorfTxicj4NCis8YnI+
DQorc3RhdGljIHZvaWQ8YnI+DQorbm91dmVhdV91dm1hX3JlZ2lvbl9kaXJ0eShzdHJ1Y3Qgbm91
dmVhdV91dm1hX3JlZ2lvbiAqcmVnKTxicj4NCit7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlu
aXRfY29tcGxldGlvbigmYW1wO3JlZy0mZ3Q7Y29tcGxldGUpOzxicj4NCivCoCDCoCDCoCDCoHJl
Zy0mZ3Q7ZGlydHkgPSB0cnVlOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4N
Citub3V2ZWF1X3V2bWFfcmVnaW9uX2NvbXBsZXRlKHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9u
ICpyZWcpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBjb21wbGV0ZV9hbGwoJmFtcDtyZWctJmd0
O2NvbXBsZXRlKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQ8YnI+DQorb3BfbWFw
X3ByZXBhcmVfdW53aW5kKHN0cnVjdCBub3V2ZWF1X3V2bWEgKnV2bWEpPGJyPg0KK3s8YnI+DQor
wqAgwqAgwqAgwqBub3V2ZWF1X3V2bWFfZ2VtX3B1dCh1dm1hKTs8YnI+DQorwqAgwqAgwqAgwqBu
b3V2ZWF1X3V2bWFfcmVtb3ZlKHV2bWEpOzxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9m
cmVlKHV2bWEpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitvcF91bm1h
cF9wcmVwYXJlX3Vud2luZChzdHJ1Y3QgZHJtX2dwdXZhICp2YSk8YnI+DQorezxicj4NCivCoCDC
oCDCoCDCoGRybV9ncHV2YV9pbnNlcnQodmEtJmd0O21nciwgdmEpOzxicj4NCit9PGJyPg0KKzxi
cj4NCitzdGF0aWMgdm9pZDxicj4NCitub3V2ZWF1X3V2bW1fc21fcHJlcGFyZV91bndpbmQoc3Ry
dWN0IG5vdXZlYXVfdXZtbSAqdXZtbSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IG5vdXZlYXVfdXZtYV9wcmVhbGxvYyAqbmV3LDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgZHJt
X2dwdXZhX29wcyAqb3BzLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBzdHJ1Y3QgZHJtX2dwdXZhX29wICpsYXN0LDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgdXZtbV9tYXBfYXJncyAqYXJn
cyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ3B1dmFfb3AgKm9wID0gbGFz
dDs8YnI+DQorwqAgwqAgwqAgwqB1NjQgdm1tX2dldF9zdGFydCA9IGFyZ3MgPyBhcmdzLSZndDth
ZGRyIDogMDs8YnI+DQorwqAgwqAgwqAgwqB1NjQgdm1tX2dldF9lbmQgPSBhcmdzID8gYXJncy0m
Z3Q7YWRkciArIGFyZ3MtJmd0O3JhbmdlIDogMDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyog
VW53aW5kIEdQVVZBIHNwYWNlLiAqLzxicj4NCivCoCDCoCDCoCDCoGRybV9ncHV2YV9mb3JfZWFj
aF9vcF9mcm9tX3JldmVyc2Uob3AsIG9wcykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHN3aXRjaCAob3AtJmd0O29wKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBE
Uk1fR1BVVkFfT1BfTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG9wX21hcF9wcmVwYXJlX3Vud2luZChuZXctJmd0O21hcCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2FzZSBEUk1fR1BVVkFfT1BfUkVNQVA6IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wX3JlbWFwICpyID0gJmFtcDtvcC0mZ3Q7cmVt
YXA7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChy
LSZndDtuZXh0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG9wX21hcF9wcmVwYXJlX3Vud2luZChuZXctJmd0O25leHQpOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoci0mZ3Q7cHJldik8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcF9tYXBfcHJl
cGFyZV91bndpbmQobmV3LSZndDtwcmV2KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgb3BfdW5tYXBfcHJlcGFyZV91bndpbmQoci0mZ3Q7dW5tYXAtJmd0
O3ZhKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2FzZSBEUk1fR1BVVkFfT1BfVU5NQVA6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgb3BfdW5tYXBfcHJlcGFyZV91bndpbmQob3AtJmd0OzxhIGhyZWY9Imh0dHA6Ly91
bm1hcC52YSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dW5tYXAudmE8L2E+KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQor
wqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qIFVubWFwIG9wZXJhdGlvbiBk
b24mIzM5O3QgYWxsb2NhdGUgcGFnZSB0YWJsZXMsIGhlbmNlIHNraXAgdGhlIGZvbGxvd2luZzxi
cj4NCivCoCDCoCDCoCDCoCAqIHBhZ2UgdGFibGUgdW53aW5kLjxicj4NCivCoCDCoCDCoCDCoCAq
Lzxicj4NCivCoCDCoCDCoCDCoGlmICghYXJncyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm47PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGRybV9ncHV2YV9mb3JfZWFjaF9vcChv
cCwgb3BzKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3dpdGNoIChvcC0mZ3Q7b3Ap
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIERSTV9HUFVWQV9PUF9NQVA6IHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgdm1tX2dldF9yYW5n
ZSA9IHZtbV9nZXRfZW5kIC0gdm1tX2dldF9zdGFydDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHZtbV9nZXRfcmFuZ2UpPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1tX3ZtbV9w
dXQodXZtbSwgdm1tX2dldF9zdGFydCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm1tX2dl
dF9yYW5nZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNhc2UgRFJNX0dQVVZBX09QX1JFTUFQOiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9ncHV2YV9vcF9yZW1hcCAqciA9ICZhbXA7b3AtJmd0
O3JlbWFwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBk
cm1fZ3B1dmEgKnZhID0gci0mZ3Q7dW5tYXAtJmd0O3ZhOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHU2NCB1c3RhcnQgPSB2YS0mZ3Q7dmEuYWRkcjs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgdXJhbmdlID0gdmEtJmd0O3ZhLnJh
bmdlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCB1ZW5kID0g
dXN0YXJ0ICsgdXJhbmdlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpZiAoci0mZ3Q7cHJldik8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB2bW1fZ2V0X3N0YXJ0ID0gdWVuZDs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHItJmd0O25leHQpPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdm1tX2dldF9lbmQg
PSB1c3RhcnQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChyLSZndDtwcmV2ICZhbXA7JmFtcDsgci0mZ3Q7bmV4dCk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2bW1fZ2V0X3N0YXJ0ID0gdm1tX2dl
dF9lbmQgPSAwOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2FzZSBEUk1fR1BVVkFfT1BfVU5NQVA6IHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wX3VubWFwICp1ID0gJmFt
cDtvcC0mZ3Q7dW5tYXA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
c3RydWN0IGRybV9ncHV2YSAqdmEgPSB1LSZndDt2YTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB1NjQgdXN0YXJ0ID0gdmEtJmd0O3ZhLmFkZHI7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTY0IHVyYW5nZSA9IHZhLSZndDt2YS5yYW5n
ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgdWVuZCA9IHVz
dGFydCArIHVyYW5nZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLyogTm90aGluZyB0byBkbyBmb3IgbWFwcGluZ3Mgd2UgbWVyZ2Ugd2l0aC4gKi88YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAodWVuZCA9PSB2bW1fZ2V0
X3N0YXJ0IHx8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dXN0YXJ0ID09IHZtbV9nZXRfZW5kKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAodXN0YXJ0ICZndDsgdm1tX2dldF9zdGFydCkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCB2bW1fZ2V0
X3JhbmdlID0gdXN0YXJ0IC0gdm1tX2dldF9zdGFydDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1tX3ZtbV9wdXQo
dXZtbSwgdm1tX2dldF9zdGFydCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm1tX2dldF9y
YW5nZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZtbV9nZXRfc3RhcnQgPSB1ZW5kOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0
Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKG9wID09IGxhc3QpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMg
dm9pZDxicj4NCitub3V2ZWF1X3V2bW1fc21fbWFwX3ByZXBhcmVfdW53aW5kKHN0cnVjdCBub3V2
ZWF1X3V2bW0gKnV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBub3V2ZWF1X3V2bWFfcHJlYWxsb2MgKm5ldyw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0
IGRybV9ncHV2YV9vcHMgKm9wcyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgdTY0IGFkZHIsIHU2NCByYW5nZSk8YnI+DQorezxicj4NCivC
oCDCoCDCoCDCoHN0cnVjdCBkcm1fZ3B1dmFfb3AgKmxhc3QgPSBkcm1fZ3B1dmFfbGFzdF9vcChv
cHMpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCB1dm1tX21hcF9hcmdzIGFyZ3MgPSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmFkZHIgPSBhZGRyLDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoC5yYW5nZSA9IHJhbmdlLDxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoG5vdXZlYXVfdXZtbV9zbV9wcmVwYXJlX3Vud2luZCh1dm1tLCBuZXcsIG9w
cywgbGFzdCwgJmFtcDthcmdzKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQ8YnI+
DQorbm91dmVhdV91dm1tX3NtX3VubWFwX3ByZXBhcmVfdW53aW5kKHN0cnVjdCBub3V2ZWF1X3V2
bW0gKnV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHN0cnVjdCBub3V2ZWF1X3V2bWFfcHJlYWxsb2MgKm5ldyw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0
IGRybV9ncHV2YV9vcHMgKm9wcyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1f
Z3B1dmFfb3AgKmxhc3QgPSBkcm1fZ3B1dmFfbGFzdF9vcChvcHMpOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBub3V2ZWF1X3V2bW1fc21fcHJlcGFyZV91bndpbmQodXZtbSwgbmV3LCBvcHMsIGxh
c3QsIE5VTEwpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK29wX21hcF9w
cmVwYXJlKHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIHN0cnVjdCBub3V2ZWF1X3V2bWEgKipwdXZtYSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgc3RydWN0IGRybV9ncHV2YV9vcF9tYXAgKm0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IHN0cnVjdCB1dm1tX21hcF9hcmdzICphcmdzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG5vdXZlYXVfdXZtYSAqdXZtYTs8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqByZXQgPSBub3V2ZWF1X3V2bWFfYWxsb2MoJmFtcDt1dm1hKTs8YnI+
DQorwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8g
ZXJyOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXQgPSBub3V2ZWF1X3V2bWFfaW5zZXJ0KHV2
bW0sIHV2bWEsIGFyZ3MtJmd0O3JlZ2lvbiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtLSZndDtnZW0ub2JqLCBtLSZndDtnZW0ub2Zmc2V0
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG0tJmd0O3ZhLmFkZHIsIG0tJmd0O3ZhLnJhbmdlLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFyZ3MtJmd0O2tpbmQpOzxicj4NCivCoCDC
oCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJfZnJl
ZV91dm1hOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBLZWVwIGEgcmVmZXJlbmNlIHVudGls
IHRoaXMgdXZtYSBpcyBkZXN0cm95ZWQuICovPGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV91dm1h
X2dlbV9nZXQodXZtYSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCpwdXZtYSA9IHV2bWE7PGJy
Pg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KKzxicj4NCitlcnJfZnJlZV91dm1hOjxicj4N
CivCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9mcmVlKHV2bWEpOzxicj4NCitlcnI6PGJyPg0KK8Kg
IMKgIMKgIMKgKnB1dm1hID0gTlVMTDs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4N
Cit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitvcF91bm1hcF9wcmVwYXJlKHN0cnVj
dCBkcm1fZ3B1dmFfb3BfdW5tYXAgKnUpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
bm91dmVhdV91dm1hICp1dm1hID0gdXZtYV9mcm9tX3ZhKHUtJmd0O3ZhKTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgbm91dmVhdV91dm1hX3JlbW92ZSh1dm1hKTs8YnI+DQorfTxicj4NCis8YnI+
DQorc3RhdGljIGludDxicj4NCitub3V2ZWF1X3V2bW1fc21fcHJlcGFyZShzdHJ1Y3Qgbm91dmVh
dV91dm1tICp1dm1tLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
cnVjdCBub3V2ZWF1X3V2bWFfcHJlYWxsb2MgKm5ldyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wcyAqb3BzLDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCB1dm1tX21hcF9hcmdzICphcmdzKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGRybV9ncHV2YV9vcCAqb3A7PGJyPg0KK8Kg
IMKgIMKgIMKgdTY0IHZtbV9nZXRfc3RhcnQgPSBhcmdzID8gYXJncy0mZ3Q7YWRkciA6IDA7PGJy
Pg0KK8KgIMKgIMKgIMKgdTY0IHZtbV9nZXRfZW5kID0gYXJncyA/IGFyZ3MtJmd0O2FkZHIgKyBh
cmdzLSZndDtyYW5nZSA6IDA7PGJyPg0KK8KgIMKgIMKgIMKgaW50IHJldDs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgZHJtX2dwdXZhX2Zvcl9lYWNoX29wKG9wLCBvcHMpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzd2l0Y2ggKG9wLSZndDtvcCkgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNhc2UgRFJNX0dQVVZBX09QX01BUDogezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHU2NCB2bW1fZ2V0X3JhbmdlID0gdm1tX2dldF9lbmQgLSB2bW1f
Z2V0X3N0YXJ0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXQgPSBvcF9tYXBfcHJlcGFyZSh1dm1tLCAmYW1wO25ldy0mZ3Q7bWFwLCAmYW1wO29wLSZn
dDttYXAsIGFyZ3MpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlm
IChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ290byB1bndpbmQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChhcmdzICZhbXA7JmFtcDsgdm1tX2dldF9yYW5nZSkgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfdXZt
bV92bW1fZ2V0KHV2bW0sIHZtbV9nZXRfc3RhcnQsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHZtbV9nZXRfcmFuZ2UpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcF9tYXBfcHJlcGFyZV91
bndpbmQobmV3LSZndDttYXApOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gdW53aW5kOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRFJNX0dQVVZBX09QX1JFTUFQOiB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9ncHV2YV9vcF9yZW1hcCAq
ciA9ICZhbXA7b3AtJmd0O3JlbWFwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0cnVjdCBkcm1fZ3B1dmEgKnZhID0gci0mZ3Q7dW5tYXAtJmd0O3ZhOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCB1dm1tX21hcF9hcmdzIHJl
bWFwX2FyZ3MgPSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgLmtpbmQgPSB1dm1hX2Zyb21fdmEodmEpLSZndDtraW5kLDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdTY0IHVzdGFydCA9IHZhLSZndDt2YS5hZGRyOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCB1cmFuZ2UgPSB2YS0mZ3Q7dmEucmFuZ2U7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTY0IHVlbmQgPSB1c3Rh
cnQgKyB1cmFuZ2U7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG9wX3VubWFwX3ByZXBhcmUoci0mZ3Q7dW5tYXApOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoci0mZ3Q7cHJldikgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IG9wX21hcF9wcmVw
YXJlKHV2bW0sICZhbXA7bmV3LSZndDtwcmV2LCByLSZndDtwcmV2LDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmYW1wO3JlbWFwX2FyZ3MpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byB1bndpbmQ7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChhcmdzKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHZtbV9nZXRfc3RhcnQgPSB1ZW5kOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHItJmd0O25leHQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBvcF9tYXBfcHJlcGFyZSh1dm1t
LCAmYW1wO25ldy0mZ3Q7bmV4dCwgci0mZ3Q7bmV4dCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmFtcDtyZW1hcF9hcmdzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHItJmd0O3ByZXYpPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgb3BfbWFwX3ByZXBhcmVfdW53aW5kKG5ldy0mZ3Q7cHJldik7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ290byB1bndpbmQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAoYXJncyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2bW1fZ2V0X2VuZCA9IHVzdGFydDs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChhcmdzICZhbXA7JmFtcDsgKHIt
Jmd0O3ByZXYgJmFtcDsmYW1wOyByLSZndDtuZXh0KSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2bW1fZ2V0X3N0YXJ0ID0gdm1tX2dldF9lbmQg
PSAwOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVh
azs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY2FzZSBEUk1fR1BVVkFfT1BfVU5NQVA6IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wX3VubWFwICp1ID0gJmFtcDtvcC0m
Z3Q7dW5tYXA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0
IGRybV9ncHV2YSAqdmEgPSB1LSZndDt2YTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB1NjQgdXN0YXJ0ID0gdmEtJmd0O3ZhLmFkZHI7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTY0IHVyYW5nZSA9IHZhLSZndDt2YS5yYW5nZTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgdWVuZCA9IHVzdGFydCAr
IHVyYW5nZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
b3BfdW5tYXBfcHJlcGFyZSh1KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaWYgKCFhcmdzKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAvKiBOb3RoaW5nIHRvIGRvIGZvciBtYXBwaW5ncyB3ZSBtZXJnZSB3
aXRoLiAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICh1ZW5k
ID09IHZtbV9nZXRfc3RhcnQgfHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB1c3RhcnQgPT0gdm1tX2dldF9lbmQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICh1c3RhcnQgJmd0OyB2bW1fZ2V0X3N0YXJ0
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dTY0IHZtbV9nZXRfcmFuZ2UgPSB1c3RhcnQgLSB2bW1fZ2V0X3N0YXJ0Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBub3V2
ZWF1X3V2bW1fdm1tX2dldCh1dm1tLCB2bW1fZ2V0X3N0YXJ0LDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB2bW1fZ2V0X3JhbmdlKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BfdW5tYXBf
cHJlcGFyZV91bndpbmQodmEpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gdW53aW5kOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdm1tX2dldF9zdGFydCA9IHVlbmQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IC1FSU5WQUw7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byB1bndpbmQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0
dXJuIDA7PGJyPg0KKzxicj4NCit1bndpbmQ6PGJyPg0KK8KgIMKgIMKgIMKgaWYgKG9wICE9IGRy
bV9ncHV2YV9maXJzdF9vcChvcHMpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZl
YXVfdXZtbV9zbV9wcmVwYXJlX3Vud2luZCh1dm1tLCBuZXcsIG9wcyw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgZHJtX2dwdXZhX3ByZXZfb3Aob3ApLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmdzKTs8YnI+DQor
wqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJy
Pg0KK25vdXZlYXVfdXZtbV9zbV9tYXBfcHJlcGFyZShzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1t
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBu
b3V2ZWF1X3V2bWFfcHJlYWxsb2MgKm5ldyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1hX3JlZ2lvbiAqcmVnaW9uLDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ3B1
dmFfb3BzICpvcHMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdTY0IGFkZHIsIHU2NCByYW5nZSwgdTgga2luZCk8YnI+DQorezxicj4NCivCoCDCoCDCoCDC
oHN0cnVjdCB1dm1tX21hcF9hcmdzIGFyZ3MgPSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLnJlZ2lvbiA9IHJlZ2lvbiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuYWRkciA9
IGFkZHIsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnJhbmdlID0gcmFuZ2UsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmtpbmQgPSBraW5kLDxicj4NCivCoCDCoCDCoCDCoH07
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBub3V2ZWF1X3V2bW1fc21fcHJlcGFyZSh1
dm1tLCBuZXcsIG9wcywgJmFtcDthcmdzKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGlu
dDxicj4NCitub3V2ZWF1X3V2bW1fc21fdW5tYXBfcHJlcGFyZShzdHJ1Y3Qgbm91dmVhdV91dm1t
ICp1dm1tLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHN0cnVjdCBub3V2ZWF1X3V2bWFfcHJlYWxsb2MgKm5ldyw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wcyAqb3BzKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIG5vdXZlYXVfdXZtbV9zbV9wcmVwYXJlKHV2
bW0sIG5ldywgb3BzLCBOVUxMKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqPGJyPg0KK29wX2dlbV9vYmooc3RydWN0IGRybV9ncHV2YV9vcCAqb3Ap
PGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzd2l0Y2ggKG9wLSZndDtvcCkgezxicj4NCivCoCDC
oCDCoCDCoGNhc2UgRFJNX0dQVVZBX09QX01BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm4gb3AtJmd0O21hcC5nZW0ub2JqOzxicj4NCivCoCDCoCDCoCDCoGNhc2UgRFJNX0dQ
VVZBX09QX1JFTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIEFjdHVhbGx5LCB3
ZSYjMzk7cmUgbG9va2luZyBmb3IgdGhlIEdFTXMgYmFja2luZyByZW1hcC5wcmV2IGFuZDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHJlbWFwLm5leHQsIGJ1dCBzaW5jZSB0aGlzIGlz
IGEgcmVtYXAgdGhleSYjMzk7cmUgaWRlbnRpY2FsIHRvPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICogdGhlIEdFTSBiYWNraW5nIHRoZSB1bm1hcHBlZCBHUFVWQS48YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4g
b3AtJmd0O3JlbWFwLnVubWFwLSZndDt2YS0mZ3Q7Z2VtLm9iajs8YnI+DQorwqAgwqAgwqAgwqBj
YXNlIERSTV9HUFVWQV9PUF9VTk1BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1
cm4gb3AtJmd0O3VubWFwLnZhLSZndDtnZW0ub2JqOzxicj4NCivCoCDCoCDCoCDCoGRlZmF1bHQ6
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgV0FSTigxLCAmcXVvdDtVbmtub3duIG9wZXJh
dGlvbi5cbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIE5VTEw7
PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4N
CitvcF9tYXAoc3RydWN0IG5vdXZlYXVfdXZtYSAqdXZtYSk8YnI+DQorezxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1fb2JqZWN0KHV2bWEtJmd0
O3ZhLmdlbS5vYmopOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBub3V2ZWF1X3V2bWFfbWFwKHV2
bWEsIG5vdXZlYXVfbWVtKG52Ym8tJmd0O2JvLnJlc291cmNlKSk7PGJyPg0KK308YnI+DQorPGJy
Pg0KK3N0YXRpYyB2b2lkPGJyPg0KK29wX3VubWFwKHN0cnVjdCBkcm1fZ3B1dmFfb3BfdW5tYXAg
KnUpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhICp2YSA9IHUtJmd0
O3ZhOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWEgKnV2bWEgPSB1dm1hX2Zy
b21fdmEodmEpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBub3V2ZWF1X3V2bWFfdW5tYXAo
KSBkb2VzIG5vdCB1bm1hcCBpZiBiYWNraW5nIEJPIGlzIGV2aWN0ZWQuICovPGJyPg0KK8KgIMKg
IMKgIMKgaWYgKCF1LSZndDtrZWVwKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZl
YXVfdXZtYV91bm1hcCh1dm1hKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQ8YnI+
DQorb3BfdW5tYXBfcmFuZ2Uoc3RydWN0IGRybV9ncHV2YV9vcF91bm1hcCAqdSw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgdTY0IGFkZHIsIHU2NCByYW5nZSk8YnI+DQorezxicj4NCivCoCDC
oCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWEgKnV2bWEgPSB1dm1hX2Zyb21fdmEodS0mZ3Q7dmEp
Ozxicj4NCivCoCDCoCDCoCDCoGJvb2wgc3BhcnNlID0gISF1dm1hLSZndDtyZWdpb247PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoGlmICghZHJtX2dwdXZhX2ludmFsaWRhdGVkKHUtJmd0O3ZhKSk8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2ZWF1X3V2bW1fdm1tX3VubWFwKHV2bWEt
Jmd0O3V2bW0sIGFkZHIsIHJhbmdlLCBzcGFyc2UpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0
aWMgdm9pZDxicj4NCitvcF9yZW1hcChzdHJ1Y3QgZHJtX2dwdXZhX29wX3JlbWFwICpyLDxicj4N
CivCoCDCoCDCoCDCoCBzdHJ1Y3Qgbm91dmVhdV91dm1hX3ByZWFsbG9jICpuZXcpPGJyPg0KK3s8
YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wX3VubWFwICp1ID0gci0mZ3Q7dW5t
YXA7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtYSAqdXZtYSA9IHV2bWFfZnJv
bV92YSh1LSZndDt2YSk7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGFkZHIgPSB1dm1hLSZndDt2YS52
YS5hZGRyOzxicj4NCivCoCDCoCDCoCDCoHU2NCByYW5nZSA9IHV2bWEtJmd0O3ZhLnZhLnJhbmdl
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoci0mZ3Q7cHJldik8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBhZGRyID0gci0mZ3Q7cHJldi0mZ3Q7dmEuYWRkciArIHItJmd0O3ByZXYt
Jmd0O3ZhLnJhbmdlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoci0mZ3Q7bmV4dCk8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYW5nZSA9IHItJmd0O25leHQtJmd0O3ZhLmFkZHIg
LSBhZGRyOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBvcF91bm1hcF9yYW5nZSh1LCBhZGRyLCBy
YW5nZSk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQ8YnI+DQorbm91dmVhdV91dm1t
X3NtKHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3RydWN0IG5vdXZlYXVfdXZtYV9wcmVhbGxvYyAqbmV3LDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN0cnVjdCBkcm1fZ3B1dmFfb3BzICpvcHMpPGJyPg0KK3s8YnI+DQorwqAgwqAg
wqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wICpvcDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZHJt
X2dwdXZhX2Zvcl9lYWNoX29wKG9wLCBvcHMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzd2l0Y2ggKG9wLSZndDtvcCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2Ug
RFJNX0dQVVZBX09QX01BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBvcF9tYXAobmV3LSZndDttYXApOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRFJNX0dQVVZB
X09QX1JFTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wX3Jl
bWFwKCZhbXA7b3AtJmd0O3JlbWFwLCBuZXcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRFJN
X0dQVVZBX09QX1VOTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG9wX3VubWFwKCZhbXA7b3AtJmd0O3VubWFwKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0
Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0K
K25vdXZlYXVfdXZtbV9zbV9tYXAoc3RydWN0IG5vdXZlYXVfdXZtbSAqdXZtbSw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1hX3ByZWFsbG9jICpu
ZXcsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9ncHV2YV9v
cHMgKm9wcyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHJldHVybiBub3V2ZWF1X3V2bW1fc20o
dXZtbSwgbmV3LCBvcHMpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25v
dXZlYXVfdXZtbV9zbV91bm1hcChzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tLDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWFfcHJlYWxsb2Mg
Km5ldyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dw
dXZhX29wcyAqb3BzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIG5vdXZlYXVfdXZt
bV9zbSh1dm1tLCBuZXcsIG9wcyk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJy
Pg0KK25vdXZlYXVfdXZtbV9zbV9jbGVhbnVwKHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2bW0sPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZt
YV9wcmVhbGxvYyAqbmV3LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHN0cnVjdCBkcm1fZ3B1dmFfb3BzICpvcHMsIGJvb2wgdW5tYXApPGJyPg0KK3s8YnI+DQorwqAg
wqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wICpvcDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
ZHJtX2dwdXZhX2Zvcl9lYWNoX29wKG9wLCBvcHMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBzd2l0Y2ggKG9wLSZndDtvcCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNh
c2UgRFJNX0dQVVZBX09QX01BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIERSTV9HUFVWQV9P
UF9SRU1BUDogezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVj
dCBkcm1fZ3B1dmFfb3BfcmVtYXAgKnIgPSAmYW1wO29wLSZndDtyZW1hcDs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX29wX21hcCAqcCA9
IHItJmd0O3ByZXY7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Ry
dWN0IGRybV9ncHV2YV9vcF9tYXAgKm4gPSByLSZndDtuZXh0Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ3B1dmEgKnZhID0gci0mZ3Q7dW5tYXAt
Jmd0O3ZhOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBu
b3V2ZWF1X3V2bWEgKnV2bWEgPSB1dm1hX2Zyb21fdmEodmEpOzxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAodW5tYXApIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgYWRkciA9IHZhLSZndDt2
YS5hZGRyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHU2NCBlbmQgPSBhZGRyICsgdmEtJmd0O3ZhLnJhbmdlOzxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocCk8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBh
ZGRyID0gcC0mZ3Q7dmEuYWRkciArIHAtJmd0O3ZhLnJhbmdlOzxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobik8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBl
bmQgPSBuLSZndDt2YS5hZGRyOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2ZWF1X3V2bW1fdm1tX3B1dCh1dm1tLCBhZGRyLCBl
bmQgLSBhZGRyKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZt
YV9nZW1fcHV0KHV2bWEpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG5vdXZlYXVfdXZtYV9mcmVlKHV2bWEpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIERSTV9HUFVWQV9PUF9VTk1BUDogezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ3B1dmFfb3BfdW5tYXAg
KnUgPSAmYW1wO29wLSZndDt1bm1hcDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhICp2YSA9IHUtJmd0O3ZhOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWEgKnV2bWEgPSB1dm1h
X2Zyb21fdmEodmEpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAodW5tYXApPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgbm91dmVhdV91dm1hX3ZtbV9wdXQodXZtYSk7PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9nZW1fcHV0KHV2bWEp
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9m
cmVlKHV2bWEpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFr
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBkZWZhdWx0Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJy
ZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJy
Pg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK25vdXZlYXVfdXZtbV9zbV9tYXBf
Y2xlYW51cChzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tLDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWFfcHJlYWxsb2MgKm5l
dyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZHJtX2dwdXZhX29wcyAqb3BzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV91dm1t
X3NtX2NsZWFudXAodXZtbSwgbmV3LCBvcHMsIGZhbHNlKTs8YnI+DQorfTxicj4NCis8YnI+DQor
c3RhdGljIHZvaWQ8YnI+DQorbm91dmVhdV91dm1tX3NtX3VubWFwX2NsZWFudXAoc3RydWN0IG5v
dXZlYXVfdXZtbSAqdXZtbSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1hX3ByZWFsbG9jICpuZXcsPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9ncHV2YV9v
cHMgKm9wcyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfdXZtbV9zbV9jbGVhbnVw
KHV2bW0sIG5ldywgb3BzLCB0cnVlKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxi
cj4NCitub3V2ZWF1X3V2bW1fdmFsaWRhdGVfcmFuZ2Uoc3RydWN0IG5vdXZlYXVfdXZtbSAqdXZt
bSwgdTY0IGFkZHIsIHU2NCByYW5nZSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHU2NCBlbmQg
PSBhZGRyICsgcmFuZ2U7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IHVubWFuYWdlZF9lbmQgPSB1dm1t
LSZndDt1bm1hbmFnZWRfYWRkciArPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdXZtbS0mZ3Q7dW5tYW5hZ2VkX3NpemU7PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoGlmIChhZGRyICZhbXA7IH5QQUdFX01BU0spPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0dXJuIC1FSU5WQUw7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChyYW5nZSAmYW1w
OyB+UEFHRV9NQVNLKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRUlOVkFM
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoZW5kICZsdDs9IGFkZHIpPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FSU5WQUw7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oGlmIChhZGRyICZsdDsgTk9VVkVBVV9WQV9TUEFDRV9TVEFSVCB8fDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoGVuZCAmZ3Q7IE5PVVZFQVVfVkFfU1BBQ0VfRU5EKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJldHVybiAtRUlOVkFMOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoYWRk
ciAmbHQ7IHVubWFuYWdlZF9lbmQgJmFtcDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoGVu
ZCAmZ3Q7IHV2bW0tJmd0O3VubWFuYWdlZF9hZGRyKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJldHVybiAtRUlOVkFMOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+
DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4NCitub3V2ZWF1X3V2bW1fYmluZF9qb2Jf
YWxsb2Moc3RydWN0IG5vdXZlYXVfdXZtbV9iaW5kX2pvYiAqKnBqb2IpPGJyPg0KK3s8YnI+DQor
wqAgwqAgwqAgwqAqcGpvYiA9IGt6YWxsb2Moc2l6ZW9mKCoqcGpvYiksIEdGUF9LRVJORUwpOzxi
cj4NCivCoCDCoCDCoCDCoGlmICghKnBqb2IpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0dXJuIC1FTk9NRU07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGtyZWZfaW5pdCgmYW1wOygq
cGpvYiktJmd0O2tyZWYpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQor
fTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQ8YnI+DQorbm91dmVhdV91dm1tX2JpbmRfam9iX2Zy
ZWUoc3RydWN0IGtyZWYgKmtyZWYpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91
dmVhdV91dm1tX2JpbmRfam9iICpqb2IgPTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3Qgbm91dmVhdV91dm1tX2JpbmRfam9iLCBrcmVmKTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV9qb2JfZnJlZSgmYW1wO2pvYi0mZ3Q7YmFzZSk7
PGJyPg0KK8KgIMKgIMKgIMKga2ZyZWUoam9iKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGlj
IHZvaWQ8YnI+DQorbm91dmVhdV91dm1tX2JpbmRfam9iX2dldChzdHJ1Y3Qgbm91dmVhdV91dm1t
X2JpbmRfam9iICpqb2IpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBrcmVmX2dldCgmYW1wO2pv
Yi0mZ3Q7a3JlZik7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK25vdXZl
YXVfdXZtbV9iaW5kX2pvYl9wdXQoc3RydWN0IG5vdXZlYXVfdXZtbV9iaW5kX2pvYiAqam9iKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKga3JlZl9wdXQoJmFtcDtqb2ItJmd0O2tyZWYsIG5vdXZl
YXVfdXZtbV9iaW5kX2pvYl9mcmVlKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxi
cj4NCitiaW5kX3ZhbGlkYXRlX29wKHN0cnVjdCBub3V2ZWF1X2pvYiAqam9iLDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgYmluZF9qb2Jfb3AgKm9wKTxicj4NCit7PGJyPg0K
K8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtbSAqdXZtbSA9IG5vdXZlYXVfY2xpX3V2bW0o
am9iLSZndDtjbGkpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
ID0gb3AtJmd0O2dlbS5vYmo7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChvcC0mZ3Q7b3Ag
PT0gT1BfTUFQKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG9wLSZndDtnZW0u
b2Zmc2V0ICZhbXA7IH5QQUdFX01BU0spPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmV0dXJuIC1FSU5WQUw7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmIChvYmotJmd0O3NpemUgJmx0Oz0gb3AtJmd0O2dlbS5vZmZzZXQpPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FSU5WQUw7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChvcC0mZ3Q7dmEucmFuZ2UgJmd0OyAob2JqLSZn
dDtzaXplIC0gb3AtJmd0O2dlbS5vZmZzZXQpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJldHVybiAtRUlOVkFMOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgcmV0dXJuIG5vdXZlYXVfdXZtbV92YWxpZGF0ZV9yYW5nZSh1dm1tLCBv
cC0mZ3Q7dmEuYWRkciwgb3AtJmd0O3ZhLnJhbmdlKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3Rh
dGljIHZvaWQ8YnI+DQorYmluZF92YWxpZGF0ZV9tYXBfc3BhcnNlKHN0cnVjdCBub3V2ZWF1X2pv
YiAqam9iLCB1NjQgYWRkciwgdTY0IHJhbmdlKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG5vdXZlYXVfdXZtbV9iaW5kX2pvYiAqYmluZF9qb2I7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG5vdXZlYXVfc2NoZWRfZW50aXR5ICplbnRpdHkgPSBqb2ItJmd0O2VudGl0eTs8YnI+DQor
wqAgwqAgwqAgwqBzdHJ1Y3QgYmluZF9qb2Jfb3AgKm9wOzxicj4NCivCoCDCoCDCoCDCoHU2NCBl
bmQgPSBhZGRyICsgcmFuZ2U7PGJyPg0KKzxicj4NCithZ2Fpbjo8YnI+DQorwqAgwqAgwqAgwqBz
cGluX2xvY2soJmFtcDtlbnRpdHktJmd0O2pvYi5saXN0LmxvY2spOzxicj4NCivCoCDCoCDCoCDC
oGxpc3RfZm9yX2VhY2hfZW50cnkoYmluZF9qb2IsICZhbXA7ZW50aXR5LSZndDtqb2IubGlzdC5o
ZWFkLCBlbnRyeSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxpc3RfZm9yX2VhY2hf
b3Aob3AsICZhbXA7YmluZF9qb2ItJmd0O29wcykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGlmIChvcC0mZ3Q7b3AgPT0gT1BfVU5NQVApIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgb3BfYWRkciA9IG9w
LSZndDt2YS5hZGRyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHU2NCBvcF9lbmQgPSBvcF9hZGRyICsgb3AtJmd0O3ZhLnJhbmdlOzxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
IShlbmQgJmx0Oz0gb3BfYWRkciB8fCBhZGRyICZndDs9IG9wX2VuZCkpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2
ZWF1X3V2bW1fYmluZF9qb2JfZ2V0KGJpbmRfam9iKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGluX3VubG9jaygmYW1w
O2VudGl0eS0mZ3Q7am9iLmxpc3QubG9jayk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd2FpdF9mb3JfY29tcGxldGlvbigm
YW1wO2JpbmRfam9iLSZndDtjb21wbGV0ZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1tX2JpbmRfam9i
X3B1dChiaW5kX2pvYik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBhZ2Fpbjs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQor
wqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgc3Bpbl91bmxvY2soJmFtcDtlbnRpdHktJmd0
O2pvYi5saXN0LmxvY2spOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK2Jp
bmRfdmFsaWRhdGVfbWFwX2NvbW1vbihzdHJ1Y3Qgbm91dmVhdV9qb2IgKmpvYiwgdTY0IGFkZHIs
IHU2NCByYW5nZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYm9v
bCBzcGFyc2UpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1tICp1
dm1tID0gbm91dmVhdV9jbGlfdXZtbShqb2ItJmd0O2NsaSk7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG5vdXZlYXVfdXZtYV9yZWdpb24gKnJlZzs8YnI+DQorwqAgwqAgwqAgwqB1NjQgcmVnX2Fk
ZHIsIHJlZ19lbmQ7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IGVuZCA9IGFkZHIgKyByYW5nZTs8YnI+
DQorPGJyPg0KK2FnYWluOjxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfdXZtbV9sb2NrKHV2bW0p
Ozxicj4NCivCoCDCoCDCoCDCoHJlZyA9IG5vdXZlYXVfdXZtYV9yZWdpb25fZmluZF9maXJzdCh1
dm1tLCBhZGRyLCByYW5nZSk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCFyZWcpIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2ZWF1X3V2bW1fdW5sb2NrKHV2bW0pOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgLyogR2VuZXJhbGx5LCBqb2Igc3VibWl0cyBhcmUgc2VyaWFsaXplZCwg
aGVuY2Ugb25seTxicj4NCivCoCDCoCDCoCDCoCAqIGRpcnR5IHJlZ2lvbnMgY2FuIGJlIG1vZGlm
aWVkIGNvbmN1cnJlbnRseS4gKi88YnI+DQorwqAgwqAgwqAgwqBpZiAocmVnLSZndDtkaXJ0eSkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9yZWdpb25fZ2V0KHJl
Zyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1tX3VubG9jayh1dm1t
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3YWl0X2Zvcl9jb21wbGV0aW9uKCZhbXA7
cmVnLSZndDtjb21wbGV0ZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91
dm1hX3JlZ2lvbl9wdXQocmVnKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGFn
YWluOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqBub3V2ZWF1X3V2bW1fdW5s
b2NrKHV2bW0pOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoc3BhcnNlKTxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRU5PU1BDOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqByZWdfYWRkciA9IHJlZy0mZ3Q7dmEuYWRkcjs8YnI+DQorwqAgwqAgwqAgwqByZWdfZW5kID0g
cmVnX2FkZHIgKyByZWctJmd0O3ZhLnJhbmdlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBN
YWtlIHN1cmUgdGhlIG1hcHBpbmcgaXMgZWl0aGVyIG91dHNpZGUgb2YgYTxicj4NCivCoCDCoCDC
oCDCoCAqIHJlZ2lvbiBvciBmdWxseSBlbmNsb3NlZCBieSBhIHJlZ2lvbi48YnI+DQorwqAgwqAg
wqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqBpZiAocmVnX2FkZHIgJmd0OyBhZGRyIHx8IHJlZ19l
bmQgJmx0OyBlbmQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FTk9TUEM7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitz
dGF0aWMgaW50PGJyPg0KK2JpbmRfdmFsaWRhdGVfcmVnaW9uKHN0cnVjdCBub3V2ZWF1X2pvYiAq
am9iKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtbV9iaW5kX2pv
YiAqYmluZF9qb2IgPSB0b191dm1tX2JpbmRfam9iKGpvYik7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IGJpbmRfam9iX29wICpvcDs8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBsaXN0X2Zvcl9lYWNoX29wKG9wLCAmYW1wO2JpbmRfam9iLSZndDtvcHMp
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgb3BfYWRkciA9IG9wLSZndDt2YS5h
ZGRyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCBvcF9yYW5nZSA9IG9wLSZndDt2
YS5yYW5nZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBib29sIHNwYXJzZSA9IGZhbHNl
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzd2l0Y2ggKG9wLSZndDtvcCkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgT1BfTUFQX1NQQVJTRTo8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGFyc2UgPSB0cnVlOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJpbmRfdmFsaWRhdGVfbWFwX3NwYXJz
ZShqb2IsIG9wX2FkZHIsIG9wX3JhbmdlKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBmYWxsdGhyb3VnaDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNl
IE9QX01BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBi
aW5kX3ZhbGlkYXRlX21hcF9jb21tb24oam9iLCBvcF9hZGRyLCBvcF9yYW5nZSw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgc3BhcnNlKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVmYXVs
dDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQ8YnI+
DQorYmluZF9saW5rX2dwdXZhcyhzdHJ1Y3QgZHJtX2dwdXZhX29wcyAqb3BzLCBzdHJ1Y3Qgbm91
dmVhdV91dm1hX3ByZWFsbG9jICpuZXcpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZHJtX2dwdXZhX29wICpvcDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZHJtX2dwdXZhX2Zvcl9l
YWNoX29wKG9wLCBvcHMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzd2l0Y2ggKG9w
LSZndDtvcCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRFJNX0dQVVZBX09Q
X01BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ3B1dmFf
bGluaygmYW1wO25ldy0mZ3Q7bWFwLSZndDt2YSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBE
Uk1fR1BVVkFfT1BfUkVNQVA6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKG9wLSZndDtyZW1hcC5wcmV2KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRybV9ncHV2YV9saW5rKCZhbXA7bmV3LSZndDtwcmV2LSZn
dDt2YSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG9wLSZn
dDtyZW1hcC5uZXh0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRybV9ncHV2YV9saW5rKCZhbXA7bmV3LSZndDtuZXh0LSZndDt2YSk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtX2dwdXZhX3VubGluayhvcC0m
Z3Q7cmVtYXAudW5tYXAtJmd0O3ZhKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIERSTV9HUFVW
QV9PUF9VTk1BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1f
Z3B1dmFfdW5saW5rKG9wLSZndDs8YSBocmVmPSJodHRwOi8vdW5tYXAudmEiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPnVubWFwLnZhPC9hPik7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZGVmYXVsdDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9
PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtbV9iaW5kX2pvYl9zdWJt
aXQoc3RydWN0IG5vdXZlYXVfam9iICpqb2IpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1
Y3Qgbm91dmVhdV91dm1tICp1dm1tID0gbm91dmVhdV9jbGlfdXZtbShqb2ItJmd0O2NsaSk7PGJy
Pg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtbV9iaW5kX2pvYiAqYmluZF9qb2IgPSB0
b191dm1tX2JpbmRfam9iKGpvYik7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfc2No
ZWRfZW50aXR5ICplbnRpdHkgPSBqb2ItJmd0O2VudGl0eTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1
Y3QgZHJtX2V4ZWMgKmV4ZWMgPSAmYW1wO2pvYi0mZ3Q7ZXhlYzs8YnI+DQorwqAgwqAgwqAgwqBz
dHJ1Y3QgYmluZF9qb2Jfb3AgKm9wOzxicj4NCivCoCDCoCDCoCDCoGludCByZXQ7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGxpc3RfZm9yX2VhY2hfb3Aob3AsICZhbXA7YmluZF9qb2ItJmd0O29w
cykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChvcC0mZ3Q7b3AgPT0gT1BfTUFQ
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O2dlbS5v
YmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoam9iLSZndDtmaWxlX3ByaXYsPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O2dlbS5oYW5kbGUpOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICghb3AtJmd0O2dlbS5vYmopPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1F
Tk9FTlQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXQgPSBiaW5kX3ZhbGlkYXRlX29wKGpvYiwgb3ApOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoC8qIElmIGEgc3BhcnNlIHJlZ2lvbiBvciBtYXBwaW5nIG92ZXJsYXBzIGEg
ZGlydHkgcmVnaW9uLCB3ZSBuZWVkIHRvPGJyPg0KK8KgIMKgIMKgIMKgICogd2FpdCBmb3IgdGhl
IHJlZ2lvbiB0byBjb21wbGV0ZSB0aGUgdW5iaW5kIHByb2Nlc3MuIFRoaXMgaXMgZHVlIHRvPGJy
Pg0KK8KgIMKgIMKgIMKgICogaG93IHBhZ2UgdGFibGUgbWFuYWdlbWVudCBpcyBjdXJyZW50bHkg
aW1wbGVtZW50ZWQuIEEgZnV0dXJlPGJyPg0KK8KgIMKgIMKgIMKgICogaW1wbGVtZW50YXRpb24g
bWlnaHQgY2hhbmdlIHRoaXMuPGJyPg0KK8KgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKgIMKgIMKg
cmV0ID0gYmluZF92YWxpZGF0ZV9yZWdpb24oam9iKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0
KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoC8qIE9uY2Ugd2Ugc3RhcnQgbW9kaWZ5aW5nIHRoZSBHUFUgVkEgc3BhY2Ugd2Ug
bmVlZCB0byBrZWVwIGhvbGRpbmcgdGhlPGJyPg0KK8KgIMKgIMKgIMKgICogdXZtbSBsb2NrIHVu
dGlsIHdlIGNhbiYjMzk7dCBmYWlsIGFueW1vcmUuIFRoaXMgaXMgZHVlIHRvIHRoZSBzZXQgb2Yg
R1BVPGJyPg0KK8KgIMKgIMKgIMKgICogVkEgc3BhY2UgY2hhbmdlcyBtdXN0IGFwcGVhciBhdG9t
aWNhbGx5IGFuZCB3ZSBuZWVkIHRvIGJlIGFibGUgdG88YnI+DQorwqAgwqAgwqAgwqAgKiB1bndp
bmQgYWxsIEdQVSBWQSBzcGFjZSBjaGFuZ2VzIG9uIGZhaWx1cmUuPGJyPg0KK8KgIMKgIMKgIMKg
ICovPGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV91dm1tX2xvY2sodXZtbSk7PGJyPg0KK8KgIMKg
IMKgIMKgbGlzdF9mb3JfZWFjaF9vcChvcCwgJmFtcDtiaW5kX2pvYi0mZ3Q7b3BzKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3dpdGNoIChvcC0mZ3Q7b3ApIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjYXNlIE9QX01BUF9TUEFSU0U6PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV91dm1hX3JlZ2lvbl9jcmVhdGUodXZt
bSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3AtJmd0O3ZhLmFkZHIsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wLSZndDt2YS5yYW5nZSk7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHVud2luZF9jb250aW51ZTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBPUF9VTk1BUF9TUEFSU0U6PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O3JlZyA9IG5vdXZlYXVfdXZt
YV9yZWdpb25fZmluZCh1dm1tLCBvcC0mZ3Q7dmEuYWRkciw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgb3AtJmd0O3ZhLnJhbmdlKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAoIW9wLSZndDtyZWcgfHwgb3AtJmd0O3JlZy0mZ3Q7ZGlydHkp
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXQgPSAtRU5PRU5UOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGdvdG8gdW53aW5kX2NvbnRpbnVlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgb3AtJmd0O29wcyA9IGRybV9ncHV2YV9zbV91bm1hcF9vcHNfY3JlYXRlKCZhbXA7
dXZtbS0mZ3Q7dW1nciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBvcC0mZ3Q7dmEuYWRkciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBvcC0mZ3Q7dmEucmFuZ2UpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChJU19FUlIob3AtJmd0O29wcykpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBQVFJfRVJSKG9wLSZndDtvcHMpOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8g
dW53aW5kX2NvbnRpbnVlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0g
bm91dmVhdV91dm1tX3NtX3VubWFwX3ByZXBhcmUodXZtbSwgJmFtcDtvcC0mZ3Q7bmV3LDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wLSZndDtvcHMpOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ3B1dmFfb3BzX2ZyZWUo
JmFtcDt1dm1tLSZndDt1bWdyLCBvcC0mZ3Q7b3BzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7b3BzID0gTlVMTDs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7cmVnID0g
TlVMTDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBnb3RvIHVud2luZF9jb250aW51ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG5vdXZlYXVfdXZtYV9yZWdpb25fZGlydHkob3AtJmd0O3JlZyk7PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNhc2UgT1BfTUFQOiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdXZtYV9yZWdpb24gKnJlZzs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gbm91dmVhdV91dm1hX3JlZ2lv
bl9maW5kX2ZpcnN0KHV2bW0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IG9wLSZndDt2YS5hZGRyLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBv
cC0mZ3Q7dmEucmFuZ2UpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChyZWcpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB1NjQgcmVnX2FkZHIgPSByZWctJmd0O3ZhLmFkZHI7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTY0IHJlZ19lbmQgPSByZWdfYWRk
ciArIHJlZy0mZ3Q7dmEucmFuZ2U7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdTY0IG9wX2FkZHIgPSBvcC0mZ3Q7dmEuYWRkcjs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjQgb3BfZW5kID0g
b3BfYWRkciArIG9wLSZndDt2YS5yYW5nZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHVubGlrZWx5KHJlZy0mZ3Q7ZGlydHkp
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0ID0gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHVud2luZF9jb250aW51ZTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIE1ha2Ugc3VyZSB0aGUgbWFwcGluZyBpcyBlaXRoZXIgb3V0c2lkZSBvZiBhPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogcmVnaW9uIG9y
IGZ1bGx5IGVuY2xvc2VkIGJ5IGEgcmVnaW9uLjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZWdfYWRkciAmZ3Q7IG9wX2FkZHIgfHwgcmVn
X2VuZCAmbHQ7IG9wX2VuZCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IC1FTk9TUEM7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byB1
bndpbmRfY29udGludWU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O29w
cyA9IGRybV9ncHV2YV9zbV9tYXBfb3BzX2NyZWF0ZSgmYW1wO3V2bW0tJmd0O3VtZ3IsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O3ZhLmFkZHIsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O3ZhLnJhbmdlLDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wLSZndDtnZW0ub2JqLDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wLSZndDtnZW0ub2Zmc2V0KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoSVNfRVJSKG9wLSZn
dDtvcHMpKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0ID0gUFRSX0VSUihvcC0mZ3Q7b3BzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHVud2luZF9jb250aW51ZTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfdXZtbV9zbV9tYXBfcHJl
cGFyZSh1dm1tLCAmYW1wO29wLSZndDtuZXcsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnLCBvcC0mZ3Q7b3BzLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG9wLSZndDt2YS5hZGRyLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wLSZn
dDt2YS5yYW5nZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7Zmxh
Z3MgJmFtcDsgMHhmZik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aWYgKHJldCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGRybV9ncHV2YV9vcHNfZnJlZSgmYW1wO3V2bW0tJmd0O3VtZ3IsIG9wLSZndDtvcHMp
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9w
LSZndDtvcHMgPSBOVUxMOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGdvdG8gdW53aW5kX2NvbnRpbnVlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgT1BfVU5NQVA6PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O29wcyA9IGRybV9ncHV2YV9zbV91bm1hcF9vcHNf
Y3JlYXRlKCZhbXA7dXZtbS0mZ3Q7dW1nciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBvcC0mZ3Q7dmEuYWRkciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7dmEucmFuZ2UpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGlmIChJU19FUlIob3AtJmd0O29wcykpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBQVFJfRVJSKG9w
LSZndDtvcHMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGdvdG8gdW53aW5kX2NvbnRpbnVlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0ID0gbm91dmVhdV91dm1tX3NtX3VubWFwX3ByZXBhcmUodXZtbSwgJmFtcDtvcC0m
Z3Q7bmV3LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wLSZndDtvcHMp
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ3B1
dmFfb3BzX2ZyZWUoJmFtcDt1dm1tLSZndDt1bWdyLCBvcC0mZ3Q7b3BzKTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7b3BzID0gTlVM
TDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
b3RvIHVud2luZF9jb250aW51ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJy
ZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRlZmF1bHQ6PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHVud2luZF9jb250aW51ZTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBkcm1fZXhlY191bnRpbF9hbGxfbG9ja2VkKGV4ZWMpIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBsaXN0X2Zvcl9lYWNoX29wKG9wLCAmYW1wO2JpbmRfam9iLSZndDtvcHMp
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dw
dXZhX29wICp2YV9vcDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaWYgKElTX0VSUl9PUl9OVUxMKG9wLSZndDtvcHMpKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRpbnVlOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ3B1dmFfZm9yX2VhY2hfb3Ao
dmFfb3AsIG9wLSZndDtvcHMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IG9wX2dlbV9vYmoo
dmFfb3ApOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAodW5saWtlbHkoIW9iaikpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9
IGRybV9leGVjX3ByZXBhcmVfb2JqKGV4ZWMsIG9iaiwgMSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtX2V4ZWNfcmV0cnlfb25fY29udGVu
dGlvbihleGVjKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AgPSBsaXN0X2xhc3Rfb3AoJmFtcDtiaW5kX2pv
Yi0mZ3Q7b3BzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHVud2luZDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAg
wqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGxpc3RfZm9yX2VhY2hfb3Aob3AsICZh
bXA7YmluZF9qb2ItJmd0O29wcykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVj
dCBkcm1fZ3B1dmFfb3AgKnZhX29wOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAoSVNfRVJSX09SX05VTEwob3AtJmd0O29wcykpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGRybV9ncHV2YV9mb3JfZWFjaF9vcCh2YV9vcCwgb3AtJmd0O29wcykgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqID0gb3BfZ2VtX29iaih2YV9vcCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC8qIERvbiYjMzk7dCB2YWxpZGF0ZSBHRU1zIGJhY2tpbmcgbWFwcGlu
Z3Mgd2UmIzM5O3JlIGFib3V0IHRvPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICogdW5tYXAsIGl0JiMzOTtzIG5vdCB3b3J0aCB0aGUgZWZmb3J0Ljxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGlmICh1bmxpa2VseSh2YV9vcC0mZ3Q7b3AgPT0gRFJNX0dQVVZB
X09QX1VOTUFQKSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb250aW51ZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKHVubGlrZWx5KCFvYmopKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRpbnVlOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBub3V2ZWF1X2JvX3ZhbGlkYXRlKG5vdXZl
YXVfZ2VtX29iamVjdChvYmopLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUsIGZhbHNlKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AgPSBsaXN0
X2xhc3Rfb3AoJmFtcDtiaW5kX2pvYi0mZ3Q7b3BzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHVud2luZDs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyogTGluayBhbmQg
dW5saW5rIEdQVVZBcyB3aGlsZSBob2xkaW5nIHRoZSBkbWFfcmVzdiBsb2NrLjxicj4NCivCoCDC
oCDCoCDCoCAqPGJyPg0KK8KgIMKgIMKgIMKgICogQXMgbG9uZyBhcyB3ZSB2YWxpZGF0ZSgpIGFs
bCBHRU1zIGFuZCBhZGQgZmVuY2VzIHRvIGFsbCBHRU1zIERNQTxicj4NCivCoCDCoCDCoCDCoCAq
IHJlc2VydmF0aW9ucyBiYWNraW5nIG1hcCBhbmQgcmVtYXAgb3BlcmF0aW9ucyB3ZSBjYW4gYmUg
c3VyZSB0aGVyZTxicj4NCivCoCDCoCDCoCDCoCAqIHdvbiYjMzk7dCBiZSBhbnkgY29uY3VycmVu
dCAoaW4pdmFsaWRhdGlvbnMgZHVyaW5nIGpvYiBleGVjdXRpb24sIGhlbmNlPGJyPg0KK8KgIMKg
IMKgIMKgICogd2UmIzM5O3JlIHNhZmUgdG8gY2hlY2sgZHJtX2dwdXZhX2ludmFsaWRhdGVkKCkg
d2l0aGluIHRoZSBmZW5jZTxicj4NCivCoCDCoCDCoCDCoCAqIHNpZ25hbGxpbmcgY3JpdGljYWwg
cGF0aCB3aXRob3V0IGhvbGRpbmcgYSBzZXBhcmF0ZSBsb2NrLjxicj4NCivCoCDCoCDCoCDCoCAq
PGJyPg0KK8KgIMKgIMKgIMKgICogR1BVVkFzIGFib3V0IHRvIGJlIHVubWFwcGVkIGFyZSBzYWZl
IGFzIHdlbGwsIHNpbmNlIHRoZXkmIzM5O3JlIHVubGlua2VkPGJyPg0KK8KgIMKgIMKgIMKgICog
YWxyZWFkeS48YnI+DQorwqAgwqAgwqAgwqAgKjxicj4NCivCoCDCoCDCoCDCoCAqIEdFTXMgZnJv
bSBtYXAgYW5kIHJlbWFwIG9wZXJhdGlvbnMgbXVzdCBiZSB2YWxpZGF0ZWQgYmVmb3JlIGxpbmtp
bmc8YnI+DQorwqAgwqAgwqAgwqAgKiB0aGVpciBjb3JyZXNwb25kaW5nIG1hcHBpbmdzIHRvIHBy
ZXZlbnQgdGhlIGFjdHVhbCBQVCB1cGRhdGUgdG88YnI+DQorwqAgwqAgwqAgwqAgKiBoYXBwZW4g
cmlnaHQgYXdheSBpbiB2YWxpZGF0ZSgpIHJhdGhlciB0aGFuIGFzeW5jaHJvbm91c2x5IGFzPGJy
Pg0KK8KgIMKgIMKgIMKgICogaW50ZW5kZWQuPGJyPg0KK8KgIMKgIMKgIMKgICo8YnI+DQorwqAg
wqAgwqAgwqAgKiBOb3RlIHRoYXQgYWZ0ZXIgbGlua2luZyBhbmQgdW5saW5raW5nIHRoZSBHUFVW
QXMgaW4gdGhpcyBsb29wIHRoaXM8YnI+DQorwqAgwqAgwqAgwqAgKiBmdW5jdGlvbiBjYW5ub3Qg
ZmFpbCBhbnltb3JlLCBoZW5jZSB0aGVyZSBpcyBubyBuZWVkIGZvciBhbiB1bndpbmQ8YnI+DQor
wqAgwqAgwqAgwqAgKiBwYXRoLjxicj4NCivCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDC
oGxpc3RfZm9yX2VhY2hfb3Aob3AsICZhbXA7YmluZF9qb2ItJmd0O29wcykgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN3aXRjaCAob3AtJmd0O29wKSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2FzZSBPUF9VTk1BUF9TUEFSU0U6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY2FzZSBPUF9NQVA6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBPUF9V
Tk1BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiaW5kX2xpbmtf
Z3B1dmFzKG9wLSZndDtvcHMsICZhbXA7b3AtJmd0O25ldyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZGVmYXVsdDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCivC
oCDCoCDCoCDCoG5vdXZlYXVfdXZtbV91bmxvY2sodXZtbSk7PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoHNwaW5fbG9jaygmYW1wO2VudGl0eS0mZ3Q7am9iLmxpc3QubG9jayk7PGJyPg0KK8KgIMKg
IMKgIMKgbGlzdF9hZGQoJmFtcDtiaW5kX2pvYi0mZ3Q7ZW50cnksICZhbXA7ZW50aXR5LSZndDtq
b2IubGlzdC5oZWFkKTs8YnI+DQorwqAgwqAgwqAgwqBzcGluX3VubG9jaygmYW1wO2VudGl0eS0m
Z3Q7am9iLmxpc3QubG9jayk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4N
Cis8YnI+DQordW53aW5kX2NvbnRpbnVlOjxicj4NCivCoCDCoCDCoCDCoG9wID0gbGlzdF9wcmV2
X29wKG9wKTs8YnI+DQordW53aW5kOjxicj4NCivCoCDCoCDCoCDCoGxpc3RfZm9yX2VhY2hfb3Bf
ZnJvbV9yZXZlcnNlKG9wLCAmYW1wO2JpbmRfam9iLSZndDtvcHMpIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzd2l0Y2ggKG9wLSZndDtvcCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNhc2UgT1BfTUFQX1NQQVJTRTo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBub3V2ZWF1X3V2bWFfcmVnaW9uX2Rlc3Ryb3kodXZtbSwgb3AtJmd0O3ZhLmFk
ZHIsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O3ZhLnJhbmdlKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjYXNlIE9QX1VOTUFQX1NQQVJTRTo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBfX25vdXZlYXVfdXZtYV9yZWdpb25faW5zZXJ0KHV2bW0sIG9wLSZn
dDtyZWcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVf
dXZtbV9zbV91bm1hcF9wcmVwYXJlX3Vud2luZCh1dm1tLCAmYW1wO29wLSZndDtuZXcsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wLSZndDtvcHMpOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNhc2UgT1BfTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG5vdXZlYXVfdXZtbV9zbV9tYXBfcHJlcGFyZV91bndpbmQodXZtbSwgJmFtcDtvcC0m
Z3Q7bmV3LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcC0mZ3Q7b3BzLDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcC0mZ3Q7dmEuYWRkciw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3AtJmd0O3ZhLnJhbmdlKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjYXNlIE9QX1VOTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoG5vdXZlYXVfdXZtbV9zbV91bm1hcF9wcmVwYXJlX3Vud2luZCh1dm1tLCAmYW1w
O29wLSZndDtuZXcsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wLSZn
dDtvcHMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZHJtX2dwdXZhX29wc19mcmVlKCZhbXA7dXZtbS0mZ3Q7dW1nciwgb3AtJmd0O29w
cyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O29wcyA9IE5VTEw7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O3JlZyA9IE5VTEw7PGJyPg0KK8KgIMKgIMKg
IMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBub3V2ZWF1X3V2bW1fdW5sb2NrKHV2bW0pOzxi
cj4NCivCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBz
dHJ1Y3QgZG1hX2ZlbmNlICo8YnI+DQorbm91dmVhdV91dm1tX2JpbmRfam9iX3J1bihzdHJ1Y3Qg
bm91dmVhdV9qb2IgKmpvYik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1
X3V2bW1fYmluZF9qb2IgKmJpbmRfam9iID0gdG9fdXZtbV9iaW5kX2pvYihqb2IpOzxicj4NCivC
oCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2bW0gPSBub3V2ZWF1X2NsaV91dm1tKGpv
Yi0mZ3Q7Y2xpKTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgYmluZF9qb2Jfb3AgKm9wOzxicj4N
CivCoCDCoCDCoCDCoGludCByZXQgPSAwOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBsaXN0X2Zv
cl9lYWNoX29wKG9wLCAmYW1wO2JpbmRfam9iLSZndDtvcHMpIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzd2l0Y2ggKG9wLSZndDtvcCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNhc2UgT1BfTUFQX1NQQVJTRTo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAvKiBub29wICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBPUF9NQVA6PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV91dm1tX3Nt
X21hcCh1dm1tLCAmYW1wO29wLSZndDtuZXcsIG9wLSZndDtvcHMpOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBvdXQ7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2FzZSBPUF9VTk1BUF9TUEFSU0U6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZmFsbHRocm91Z2g7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBP
UF9VTk1BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBu
b3V2ZWF1X3V2bW1fc21fdW5tYXAodXZtbSwgJmFtcDtvcC0mZ3Q7bmV3LCBvcC0mZ3Q7b3BzKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gb3V0Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCitvdXQ6
PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBO
Vl9QUklOVEsoZXJyLCBqb2ItJmd0O2NsaSwgJnF1b3Q7YmluZCBqb2IgZmFpbGVkOiAlZFxuJnF1
b3Q7LCByZXQpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBFUlJfUFRSKHJldCk7PGJyPg0KK308
YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK25vdXZlYXVfdXZtbV9iaW5kX2pvYl9mcmVl
X3dvcmtfZm4oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgc3RydWN0IG5vdXZlYXVfdXZtbV9iaW5kX2pvYiAqYmluZF9qb2IgPTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3Qgbm91dmVhdV91dm1tX2Jp
bmRfam9iLCB3b3JrKTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9qb2IgKmpvYiA9
ICZhbXA7YmluZF9qb2ItJmd0O2Jhc2U7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVf
dXZtbSAqdXZtbSA9IG5vdXZlYXVfY2xpX3V2bW0oam9iLSZndDtjbGkpOzxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBub3V2ZWF1X3NjaGVkX2VudGl0eSAqZW50aXR5ID0gam9iLSZndDtlbnRpdHk7
PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGJpbmRfam9iX29wICpvcCwgKm5leHQ7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGxpc3RfZm9yX2VhY2hfb3Aob3AsICZhbXA7YmluZF9qb2ItJmd0O29w
cykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqID0gb3AtJmd0O2dlbS5vYmo7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIFdoZW4gbm91dmVhdV91dm1tX2JpbmRfam9iX3N1Ym1pdCgpIGZhaWxzIG9wLSZndDtvcHMg
YW5kIG9wLSZndDtyZWc8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiB3aWxsIGJlIE5V
TEwsIGhlbmNlIHNraXAgdGhlIGNsZWFudXAuPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3dpdGNoIChvcC0mZ3Q7b3ApIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIE9QX01BUF9TUEFSU0U6PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogbm9vcCAqLzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNhc2UgT1BfVU5NQVBfU1BBUlNFOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGlmICghSVNfRVJSX09SX05VTEwob3AtJmd0O29wcykpPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1tX3NtX3Vu
bWFwX2NsZWFudXAodXZtbSwgJmFtcDtvcC0mZ3Q7bmV3LDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoG9wLSZndDtvcHMpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAob3AtJmd0O3JlZykgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9yZWdpb25f
c3BhcnNlX3VucmVmKG9wLSZndDtyZWcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtbV9sb2NrKHV2bW0pOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9y
ZWdpb25fcmVtb3ZlKG9wLSZndDtyZWcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtbV91bmxvY2sodXZtbSk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1h
X3JlZ2lvbl9jb21wbGV0ZShvcC0mZ3Q7cmVnKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2ZWF1X3V2bWFfcmVnaW9uX3B1dChvcC0mZ3Q7
cmVnKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgT1BfTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGlmICghSVNfRVJSX09SX05VTEwob3AtJmd0O29wcykpPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1t
X3NtX21hcF9jbGVhbnVwKHV2bW0sICZhbXA7b3AtJmd0O25ldyw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7b3BzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNl
IE9QX1VOTUFQOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICgh
SVNfRVJSX09SX05VTEwob3AtJmd0O29wcykpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1tX3NtX3VubWFwX2NsZWFudXAodXZt
bSwgJmFtcDtvcC0mZ3Q7bmV3LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG9wLSZndDtvcHMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFJU19FUlJfT1JfTlVMTChvcC0mZ3Q7b3BzKSk8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ3B1dmFfb3BzX2ZyZWUoJmFt
cDt1dm1tLSZndDt1bWdyLCBvcC0mZ3Q7b3BzKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKG9iaik8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBkcm1fZ2VtX29iamVjdF9wdXQob2JqKTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHNwaW5fbG9jaygmYW1wO2VudGl0eS0mZ3Q7am9iLmxpc3QubG9jayk7PGJy
Pg0KK8KgIMKgIMKgIMKgbGlzdF9kZWwoJmFtcDtiaW5kX2pvYi0mZ3Q7ZW50cnkpOzxicj4NCivC
oCDCoCDCoCDCoHNwaW5fdW5sb2NrKCZhbXA7ZW50aXR5LSZndDtqb2IubGlzdC5sb2NrKTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgY29tcGxldGVfYWxsKCZhbXA7YmluZF9qb2ItJmd0O2NvbXBs
ZXRlKTs8YnI+DQorwqAgwqAgwqAgwqB3YWtlX3VwKCZhbXA7ZW50aXR5LSZndDtqb2Iud3EpOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBSZW1vdmUgYW5kIGZyZWUgb3BzIGFmdGVyIHJlbW92
aW5nIHRoZSBiaW5kIGpvYiBmcm9tIHRoZSBqb2IgbGlzdCB0bzxicj4NCivCoCDCoCDCoCDCoCAq
IGF2b2lkIHJhY2VzIGFnYWluc3QgYmluZF92YWxpZGF0ZV9tYXBfc3BhcnNlKCkuPGJyPg0KK8Kg
IMKgIMKgIMKgICovPGJyPg0KK8KgIMKgIMKgIMKgbGlzdF9mb3JfZWFjaF9vcF9zYWZlKG9wLCBu
ZXh0LCAmYW1wO2JpbmRfam9iLSZndDtvcHMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBsaXN0X2RlbCgmYW1wO29wLSZndDtlbnRyeSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKga2ZyZWUob3ApOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
bm91dmVhdV91dm1tX2JpbmRfam9iX3B1dChiaW5kX2pvYik7PGJyPg0KK308YnI+DQorPGJyPg0K
K3N0YXRpYyB2b2lkPGJyPg0KK25vdXZlYXVfdXZtbV9iaW5kX2pvYl9mcmVlX3F3b3JrKHN0cnVj
dCBub3V2ZWF1X2pvYiAqam9iKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZl
YXVfdXZtbV9iaW5kX2pvYiAqYmluZF9qb2IgPSB0b191dm1tX2JpbmRfam9iKGpvYik7PGJyPg0K
K8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfc2NoZWRfZW50aXR5ICplbnRpdHkgPSBqb2ItJmd0
O2VudGl0eTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV9zY2hlZF9lbnRpdHlfcXdv
cmsoZW50aXR5LCAmYW1wO2JpbmRfam9iLSZndDt3b3JrKTs8YnI+DQorfTxicj4NCis8YnI+DQor
c3RhdGljIHN0cnVjdCBub3V2ZWF1X2pvYl9vcHMgbm91dmVhdV9iaW5kX2pvYl9vcHMgPSB7PGJy
Pg0KK8KgIMKgIMKgIMKgLnN1Ym1pdCA9IG5vdXZlYXVfdXZtbV9iaW5kX2pvYl9zdWJtaXQsPGJy
Pg0KK8KgIMKgIMKgIMKgLnJ1biA9IG5vdXZlYXVfdXZtbV9iaW5kX2pvYl9ydW4sPGJyPg0KK8Kg
IMKgIMKgIMKgLmZyZWUgPSBub3V2ZWF1X3V2bW1fYmluZF9qb2JfZnJlZV9xd29yayw8YnI+DQor
fTs8YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQ8YnI+DQorYmluZF9qb2Jfb3BfZnJvbV91b3Aoc3Ry
dWN0IGJpbmRfam9iX29wICoqcG9wLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzdHJ1Y3QgZHJtX25vdXZlYXVfdm1fYmluZF9vcCAqdW9wKTxicj4NCit7PGJyPg0KK8KgIMKg
IMKgIMKgc3RydWN0IGJpbmRfam9iX29wICpvcDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgb3Ag
PSAqcG9wID0ga3phbGxvYyhzaXplb2YoKm9wKSwgR0ZQX0tFUk5FTCk7PGJyPg0KK8KgIMKgIMKg
IMKgaWYgKCFvcCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVOT01FTTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3dpdGNoICh1b3AtJmd0O29wKSB7PGJyPg0KK8KgIMKg
IMKgIMKgY2FzZSBPUF9NQVA6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3AtJmd0O29w
ID0gdW9wLSZndDtmbGFncyAmYW1wOyBEUk1fTk9VVkVBVV9WTV9CSU5EX1NQQVJTRSA/PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE9QX01BUF9TUEFSU0UgOiBPUF9N
QVA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKg
Y2FzZSBPUF9VTk1BUDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7b3AgPSB1
b3AtJmd0O2ZsYWdzICZhbXA7IERSTV9OT1VWRUFVX1ZNX0JJTkRfU1BBUlNFID88YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT1BfVU5NQVBfU1BBUlNFIDogT1BfVU5N
QVA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKg
ZGVmYXVsdDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcC0mZ3Q7b3AgPSB1b3AtJmd0
O29wOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgb3AtJmd0O2ZsYWdzID0gdW9wLSZndDtmbGFnczs8
YnI+DQorwqAgwqAgwqAgwqBvcC0mZ3Q7dmEuYWRkciA9IHVvcC0mZ3Q7YWRkcjs8YnI+DQorwqAg
wqAgwqAgwqBvcC0mZ3Q7dmEucmFuZ2UgPSB1b3AtJmd0O3JhbmdlOzxicj4NCivCoCDCoCDCoCDC
oG9wLSZndDtnZW0uaGFuZGxlID0gdW9wLSZndDtoYW5kbGU7PGJyPg0KK8KgIMKgIMKgIMKgb3At
Jmd0O2dlbS5vZmZzZXQgPSB1b3AtJmd0O2JvX29mZnNldDs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK2JpbmRf
am9iX29wc19mcmVlKHN0cnVjdCBsaXN0X2hlYWQgKm9wcyk8YnI+DQorezxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBiaW5kX2pvYl9vcCAqb3AsICpuZXh0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBsaXN0X2Zvcl9lYWNoX29wX3NhZmUob3AsIG5leHQsIG9wcykgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGxpc3RfZGVsKCZhbXA7b3AtJmd0O2VudHJ5KTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBrZnJlZShvcCk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9PGJyPg0K
Kzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtbV9iaW5kX2pvYl9pbml0KHN0cnVj
dCBub3V2ZWF1X3V2bW1fYmluZF9qb2IgKipwam9iLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3Qgbm91dmVhdV91dm1tX2JpbmRfam9iX2FyZ3MgKl9f
YXJncyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bW1fYmluZF9q
b2IgKmpvYjs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9qb2JfYXJncyBhcmdzID0g
e307PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGJpbmRfam9iX29wICpvcDs8YnI+DQorwqAgwqAg
wqAgwqBpbnQgaSwgcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXQgPSBub3V2ZWF1X3V2
bW1fYmluZF9qb2JfYWxsb2MoJmFtcDtqb2IpOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgSU5JVF9MSVNUX0hFQUQoJmFtcDtqb2ItJmd0O29wcyk7PGJyPg0KK8KgIMKgIMKgIMKg
SU5JVF9MSVNUX0hFQUQoJmFtcDtqb2ItJmd0O2VudHJ5KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgZm9yIChpID0gMDsgaSAmbHQ7IF9fYXJncy0mZ3Q7b3AuY291bnQ7IGkrKykgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IGJpbmRfam9iX29wX2Zyb21fdW9wKCZhbXA7b3As
ICZhbXA7X19hcmdzLSZndDtvcC5zW2ldKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
ZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJy
X2ZyZWU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxpc3RfYWRkX3RhaWwo
JmFtcDtvcC0mZ3Q7ZW50cnksICZhbXA7am9iLSZndDtvcHMpOzxicj4NCivCoCDCoCDCoCDCoH08
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaW5pdF9jb21wbGV0aW9uKCZhbXA7am9iLSZndDtjb21w
bGV0ZSk7PGJyPg0KK8KgIMKgIMKgIMKgSU5JVF9XT1JLKCZhbXA7am9iLSZndDt3b3JrLCBub3V2
ZWF1X3V2bW1fYmluZF9qb2JfZnJlZV93b3JrX2ZuKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
YXJncy5zY2hlZF9lbnRpdHkgPSBfX2FyZ3MtJmd0O3NjaGVkX2VudGl0eTs8YnI+DQorwqAgwqAg
wqAgwqBhcmdzLmZpbGVfcHJpdiA9IF9fYXJncy0mZ3Q7ZmlsZV9wcml2Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBhcmdzLmluX3N5bmMuY291bnQgPSBfX2FyZ3MtJmd0O2luX3N5bmMuY291bnQ7
PGJyPg0KK8KgIMKgIMKgIMKgYXJncy5pbl9zeW5jLnMgPSBfX2FyZ3MtJmd0O2luX3N5bmMuczs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYXJncy5vdXRfc3luYy5jb3VudCA9IF9fYXJncy0mZ3Q7
b3V0X3N5bmMuY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgYXJncy5vdXRfc3luYy5zID0gX19hcmdz
LSZndDtvdXRfc3luYy5zOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBhcmdzLnN5bmMgPSAhKF9f
YXJncy0mZ3Q7ZmxhZ3MgJmFtcDsgRFJNX05PVVZFQVVfVk1fQklORF9SVU5fQVNZTkMpOzxicj4N
CivCoCDCoCDCoCDCoGFyZ3Mub3BzID0gJmFtcDtub3V2ZWF1X2JpbmRfam9iX29wczs8YnI+DQor
wqAgwqAgwqAgwqBhcmdzLnJlc3ZfdXNhZ2UgPSBETUFfUkVTVl9VU0FHRV9CT09LS0VFUDs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0ID0gbm91dmVhdV9qb2JfaW5pdCgmYW1wO2pvYi0mZ3Q7
YmFzZSwgJmFtcDthcmdzKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX2ZyZWU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCpw
am9iID0gam9iOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCis8YnI+DQorZXJyX2Zy
ZWU6PGJyPg0KK8KgIMKgIMKgIMKgYmluZF9qb2Jfb3BzX2ZyZWUoJmFtcDtqb2ItJmd0O29wcyk7
PGJyPg0KK8KgIMKgIMKgIMKga2ZyZWUoam9iKTs8YnI+DQorwqAgwqAgwqAgwqAqcGpvYiA9IE5V
TEw7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KK308YnI+DQorPGJy
Pg0KK2ludDxicj4NCitub3V2ZWF1X3V2bW1faW9jdGxfdm1faW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2b2lk
ICpkYXRhLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBu
b3V2ZWF1X2NsaSAqY2xpID0gbm91dmVhdV9jbGkoZmlsZV9wcml2KTs8YnI+DQorwqAgwqAgwqAg
wqBzdHJ1Y3QgZHJtX25vdXZlYXVfdm1faW5pdCAqaW5pdCA9IGRhdGE7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHJldHVybiBub3V2ZWF1X3V2bW1faW5pdCgmYW1wO2NsaS0mZ3Q7dXZtbSwgY2xp
LCBpbml0LSZndDt1bm1hbmFnZWRfYWRkciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5pdC0mZ3Q7dW5tYW5hZ2VkX3NpemUpOzxicj4NCit9
PGJyPg0KKzxicj4NCitzdGF0aWMgaW50PGJyPg0KK25vdXZlYXVfdXZtbV92bV9iaW5kKHN0cnVj
dCBub3V2ZWF1X3V2bW1fYmluZF9qb2JfYXJncyAqYXJncyk8YnI+DQorezxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBub3V2ZWF1X3V2bW1fYmluZF9qb2IgKmpvYjs8YnI+DQorwqAgwqAgwqAgwqBp
bnQgcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXQgPSBub3V2ZWF1X3V2bW1fYmluZF9q
b2JfaW5pdCgmYW1wO2pvYiwgYXJncyk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqByZXQgPSBub3V2ZWF1X2pvYl9zdWJtaXQoJmFtcDtqb2ItJmd0O2Jhc2UpOzxicj4NCivCoCDC
oCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJfam9i
X2Zpbmk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCis8YnI+DQorZXJy
X2pvYl9maW5pOjxicj4NCivCoCDCoCDCoCDCoG5vdXZlYXVfam9iX2ZpbmkoJmFtcDtqb2ItJmd0
O2Jhc2UpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KK308YnI+DQorPGJyPg0K
K3N0YXRpYyBpbnQ8YnI+DQorbm91dmVhdV91dm1tX3ZtX2JpbmRfdWNvcHkoc3RydWN0IG5vdXZl
YXVfdXZtbV9iaW5kX2pvYl9hcmdzICphcmdzLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgZHJtX25vdXZlYXVfdm1fYmluZCBfX3VzZXIgKnJlcSk8
YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fbm91dmVhdV9zeW5jICoqczs8YnI+
DQorwqAgwqAgwqAgwqB1MzIgaW5jID0gcmVxLSZndDt3YWl0X2NvdW50Ozxicj4NCivCoCDCoCDC
oCDCoHU2NCBpbnMgPSByZXEtJmd0O3dhaXRfcHRyOzxicj4NCivCoCDCoCDCoCDCoHUzMiBvdXRj
ID0gcmVxLSZndDtzaWdfY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IG91dHMgPSByZXEtJmd0
O3NpZ19wdHI7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIG9wYyA9IHJlcS0mZ3Q7b3BfY291bnQ7PGJy
Pg0KK8KgIMKgIMKgIMKgdTY0IG9wcyA9IHJlcS0mZ3Q7b3BfcHRyOzxicj4NCivCoCDCoCDCoCDC
oGludCByZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFyZ3MtJmd0O2ZsYWdzID0gcmVxLSZn
dDtmbGFnczs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYXJncy0mZ3Q7b3AuY291bnQgPSBvcGM7
PGJyPg0KK8KgIMKgIMKgIMKgYXJncy0mZ3Q7b3AucyA9IHVfbWVtY3B5YShvcHMsIG9wYyw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaXplb2YoKmFy
Z3MtJmd0O29wLnMpKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoSVNfRVJSKGFyZ3MtJmd0O29wLnMp
KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBQVFJfRVJSKGFyZ3MtJmd0O29w
LnMpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoaW5jKSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcyA9ICZhbXA7YXJncy0mZ3Q7aW5fc3luYy5zOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBhcmdzLSZndDtpbl9zeW5jLmNvdW50ID0gaW5jOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCpzID0gdV9tZW1jcHlhKGlucywgaW5jLCBzaXplb2YoKipz
KSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKElTX0VSUigqcykpIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBQVFJfRVJSKCpzKTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVycl9mcmVlX29wczs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBpZiAob3V0Yykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHMgPSAmYW1wO2FyZ3MtJmd0O291dF9zeW5jLnM7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGFyZ3MtJmd0O291dF9zeW5jLmNvdW50ID0gb3V0Yzs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAqcyA9IHVfbWVtY3B5YShvdXRzLCBvdXRjLCBzaXplb2YoKipzKSk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKElTX0VSUigqcykpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBQVFJfRVJSKCpzKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVycl9mcmVlX2luczs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorPGJyPg0KK2Vycl9mcmVlX29wczo8YnI+DQorwqAg
wqAgwqAgwqB1X2ZyZWUoYXJncy0mZ3Q7b3Aucyk7PGJyPg0KK2Vycl9mcmVlX2luczo8YnI+DQor
wqAgwqAgwqAgwqB1X2ZyZWUoYXJncy0mZ3Q7aW5fc3luYy5zKTs8YnI+DQorwqAgwqAgwqAgwqBy
ZXR1cm4gcmV0Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4NCitub3V2ZWF1
X3V2bW1fdm1fYmluZF91ZnJlZShzdHJ1Y3Qgbm91dmVhdV91dm1tX2JpbmRfam9iX2FyZ3MgKmFy
Z3MpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqB1X2ZyZWUoYXJncy0mZ3Q7b3Aucyk7PGJyPg0K
K8KgIMKgIMKgIMKgdV9mcmVlKGFyZ3MtJmd0O2luX3N5bmMucyk7PGJyPg0KK8KgIMKgIMKgIMKg
dV9mcmVlKGFyZ3MtJmd0O291dF9zeW5jLnMpOzxicj4NCit9PGJyPg0KKzxicj4NCitpbnQ8YnI+
DQorbm91dmVhdV91dm1tX2lvY3RsX3ZtX2JpbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm9pZCBfX3VzZXIgKmRh
dGEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBk
cm1fZmlsZSAqZmlsZV9wcml2KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZl
YXVfY2xpICpjbGkgPSBub3V2ZWF1X2NsaShmaWxlX3ByaXYpOzxicj4NCivCoCDCoCDCoCDCoHN0
cnVjdCBub3V2ZWF1X3V2bW1fYmluZF9qb2JfYXJncyBhcmdzID0ge307PGJyPg0KK8KgIMKgIMKg
IMKgc3RydWN0IGRybV9ub3V2ZWF1X3ZtX2JpbmQgX191c2VyICpyZXEgPSBkYXRhOzxicj4NCivC
oCDCoCDCoCDCoGludCByZXQgPSAwOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAodW5saWtl
bHkoIW5vdXZlYXVfY2xpX3V2bW1fbG9ja2VkKGNsaSkpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJldHVybiAtRU5PU1lTOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXQgPSBub3V2
ZWF1X3V2bW1fdm1fYmluZF91Y29weSgmYW1wO2FyZ3MsIHJlcSk7PGJyPg0KK8KgIMKgIMKgIMKg
aWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBhcmdzLnNjaGVkX2VudGl0eSA9ICZhbXA7Y2xpLSZndDtzY2hlZF9l
bnRpdHk7PGJyPg0KK8KgIMKgIMKgIMKgYXJncy5maWxlX3ByaXYgPSBmaWxlX3ByaXY7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG5vdXZlYXVfdXZtbV92bV9iaW5kKCZhbXA7YXJncyk7
PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
b3RvIG91dF9mcmVlX2FyZ3M7PGJyPg0KKzxicj4NCitvdXRfZnJlZV9hcmdzOjxicj4NCivCoCDC
oCDCoCDCoG5vdXZlYXVfdXZtbV92bV9iaW5kX3VmcmVlKCZhbXA7YXJncyk7PGJyPg0KK8KgIMKg
IMKgIMKgcmV0dXJuIHJldDs8YnI+DQorfTxicj4NCis8YnI+DQordm9pZDxicj4NCitub3V2ZWF1
X3V2bW1fYm9fbWFwX2FsbChzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibywgc3RydWN0IG5vdXZlYXVf
bWVtICptZW0pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaiA9ICZhbXA7bnZiby0mZ3Q7Ym8uYmFzZTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJt
X2dwdXZhICp2YTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQo
b2JqLSZndDtyZXN2KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZHJtX2dlbV9mb3JfZWFjaF9n
cHV2YSh2YSwgb2JqKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IG5vdXZl
YXVfdXZtYSAqdXZtYSA9IHV2bWFfZnJvbV92YSh2YSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV9tYXAodXZtYSwgbWVtKTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBkcm1fZ3B1dmFfaW52YWxpZGF0ZSh2YSwgZmFsc2UpOzxicj4NCivCoCDC
oCDCoCDCoH08YnI+DQorfTxicj4NCis8YnI+DQordm9pZDxicj4NCitub3V2ZWF1X3V2bW1fYm9f
dW5tYXBfYWxsKHN0cnVjdCBub3V2ZWF1X2JvICpudmJvKTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSAmYW1wO252Ym8tJmd0O2JvLmJhc2U7PGJy
Pg0KK8KgIMKgIMKgIMKgc3RydWN0IGRybV9ncHV2YSAqdmE7PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoGRtYV9yZXN2X2Fzc2VydF9oZWxkKG9iai0mZ3Q7cmVzdik7PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoGRybV9nZW1fZm9yX2VhY2hfZ3B1dmEodmEsIG9iaikgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWEgKnV2bWEgPSB1dm1hX2Zyb21fdmEodmEp
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2ZWF1X3V2bWFfdW5tYXAo
dXZtYSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtX2dwdXZhX2ludmFsaWRhdGUo
dmEsIHRydWUpOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorfTxicj4NCis8YnI+DQoraW50PGJy
Pg0KK25vdXZlYXVfdXZtbV9pbml0KHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2bW0sIHN0cnVjdCBu
b3V2ZWF1X2NsaSAqY2xpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCB1bm1h
bmFnZWRfYWRkciwgdTY0IHVubWFuYWdlZF9zaXplKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKg
aW50IHJldDs8YnI+DQorwqAgwqAgwqAgwqB1NjQgdW5tYW5hZ2VkX2VuZCA9IHVubWFuYWdlZF9h
ZGRyICsgdW5tYW5hZ2VkX3NpemU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoG11dGV4X2luaXQo
JmFtcDt1dm1tLSZndDttdXRleCk7PGJyPg0KK8KgIMKgIMKgIMKgbXRfaW5pdF9mbGFncygmYW1w
O3V2bW0tJmd0O3JlZ2lvbl9tdCwgTVRfRkxBR1NfTE9DS19FWFRFUk4pOzxicj4NCivCoCDCoCDC
oCDCoG10X3NldF9leHRlcm5hbF9sb2NrKCZhbXA7dXZtbS0mZ3Q7cmVnaW9uX210LCAmYW1wO3V2
bW0tJmd0O211dGV4KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbXV0ZXhfbG9jaygmYW1wO2Ns
aS0mZ3Q7bXV0ZXgpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAodW5saWtlbHkoY2xpLSZn
dDt1dm1tLmRpc2FibGVkKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IC1F
Tk9TWVM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBvdXRfdW5sb2NrOzxicj4N
CivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKHVubWFuYWdlZF9lbmQg
Jmx0Oz0gdW5tYW5hZ2VkX2FkZHIpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQg
PSAtRUlOVkFMOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gb3V0X3VubG9jazs8
YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmICh1bm1hbmFnZWRf
ZW5kICZndDsgTk9VVkVBVV9WQV9TUEFDRV9FTkQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXQgPSAtRUlOVkFMOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gb3V0
X3VubG9jazs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHV2bW0t
Jmd0O3VubWFuYWdlZF9hZGRyID0gdW5tYW5hZ2VkX2FkZHI7PGJyPg0KK8KgIMKgIMKgIMKgdXZt
bS0mZ3Q7dW5tYW5hZ2VkX3NpemUgPSB1bm1hbmFnZWRfc2l6ZTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgZHJtX2dwdXZhX21hbmFnZXJfaW5pdCgmYW1wO3V2bW0tJmd0O3VtZ3IsIGNsaS0mZ3Q7
bmFtZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Tk9VVkVBVV9WQV9TUEFDRV9TVEFSVCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgTk9VVkVBVV9WQV9TUEFDRV9FTkQsPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVubWFuYWdlZF9hZGRyLCB1bm1hbmFn
ZWRfc2l6ZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgTlVMTCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IG52aWZfdm1tX2N0b3IoJmFt
cDtjbGktJmd0O21tdSwgJnF1b3Q7dXZtbSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbGktJmd0O3ZtbS52bW0ub2JqZWN0Lm9jbGFzcywgUkFX
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVubWFuYWdl
ZF9hZGRyLCB1bm1hbmFnZWRfc2l6ZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBOVUxMLCAwLCAmYW1wO2NsaS0mZ3Q7dXZtbS52bW0udm1tKTs8YnI+DQor
wqAgwqAgwqAgwqBpZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gb3V0
X2ZyZWVfZ3B1dmFfbWdyOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBjbGktJmd0O3V2bW0udm1t
LmNsaSA9IGNsaTs8YnI+DQorwqAgwqAgwqAgwqBtdXRleF91bmxvY2soJmFtcDtjbGktJmd0O211
dGV4KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KKzxicj4NCitvdXRf
ZnJlZV9ncHV2YV9tZ3I6PGJyPg0KK8KgIMKgIMKgIMKgZHJtX2dwdXZhX21hbmFnZXJfZGVzdHJv
eSgmYW1wO3V2bW0tJmd0O3VtZ3IpOzxicj4NCitvdXRfdW5sb2NrOjxicj4NCivCoCDCoCDCoCDC
oG11dGV4X3VubG9jaygmYW1wO2NsaS0mZ3Q7bXV0ZXgpOzxicj4NCivCoCDCoCDCoCDCoHJldHVy
biByZXQ7PGJyPg0KK308YnI+DQorPGJyPg0KK3ZvaWQ8YnI+DQorbm91dmVhdV91dm1tX2Zpbmko
c3RydWN0IG5vdXZlYXVfdXZtbSAqdXZtbSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoE1BX1NU
QVRFKG1hcywgJmFtcDt1dm1tLSZndDtyZWdpb25fbXQsIDAsIDApOzxicj4NCivCoCDCoCDCoCDC
oHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9uICpyZWc7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0
IG5vdXZlYXVfY2xpICpjbGkgPSB1dm1tLSZndDt2bW0uY2xpOzxicj4NCivCoCDCoCDCoCDCoHN0
cnVjdCBub3V2ZWF1X3NjaGVkX2VudGl0eSAqZW50aXR5ID0gJmFtcDtjbGktJmd0O3NjaGVkX2Vu
dGl0eTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhICp2YSwgKm5leHQ7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoGlmICghY2xpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJldHVybjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcm1iKCk7IC8qIGZvciBsaXN0X2VtcHR5
IHRvIHdvcmsgd2l0aG91dCBsb2NrICovPGJyPg0KK8KgIMKgIMKgIMKgd2FpdF9ldmVudChlbnRp
dHktJmd0O2pvYi53cSwgbGlzdF9lbXB0eSgmYW1wO2VudGl0eS0mZ3Q7am9iLmxpc3QuaGVhZCkp
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBub3V2ZWF1X3V2bW1fbG9jayh1dm1tKTs8YnI+DQor
wqAgwqAgwqAgwqBkcm1fZ3B1dmFfZm9yX2VhY2hfdmFfc2FmZSh2YSwgbmV4dCwgJmFtcDt1dm1t
LSZndDt1bWdyKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVf
dXZtYSAqdXZtYSA9IHV2bWFfZnJvbV92YSh2YSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSB2YS0mZ3Q7Z2VtLm9iajs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHVubGlrZWx5KHZhID09ICZhbXA7dXZtbS0m
Z3Q7dW1nci5rZXJuZWxfYWxsb2Nfbm9kZSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGRybV9ncHV2YV9yZW1vdmUodmEpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBkbWFfcmVzdl9sb2NrKG9iai0mZ3Q7cmVzdiwgTlVMTCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZHJtX2dwdXZhX3VubGluayh2YSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZG1hX3Jlc3ZfdW5sb2NrKG9iai0mZ3Q7cmVzdik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZtYV91bm1hcCh1dm1hKTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBub3V2ZWF1X3V2bWFfdm1tX3B1dCh1dm1hKTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1hX2dlbV9wdXQodXZtYSk7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbm91dmVhdV91dm1hX2ZyZWUodXZtYSk7PGJyPg0KK8KgIMKgIMKg
IMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBtYXNfZm9yX2VhY2goJmFtcDttYXMsIHJlZywg
VUxPTkdfTUFYKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFzX2VyYXNlKCZhbXA7
bWFzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBub3V2ZWF1X3V2bWFfcmVnaW9uX3Nw
YXJzZV91bnJlZihyZWcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vdXZlYXVfdXZt
YV9yZWdpb25fcHV0KHJlZyk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqBXQVJOKCFtdHJlZV9lbXB0eSgmYW1wO3V2bW0tJmd0O3JlZ2lvbl9tdCksPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgICZxdW90O25vdXZlYXVfdXZtYV9yZWdpb24gdHJlZSBub3QgZW1wdHks
IHBvdGVudGlhbGx5IGxlYWtpbmcgbWVtb3J5LiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgX19t
dF9kZXN0cm95KCZhbXA7dXZtbS0mZ3Q7cmVnaW9uX210KTs8YnI+DQorwqAgwqAgwqAgwqBub3V2
ZWF1X3V2bW1fdW5sb2NrKHV2bW0pOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBtdXRleF9sb2Nr
KCZhbXA7Y2xpLSZndDttdXRleCk7PGJyPg0KK8KgIMKgIMKgIMKgbm91dmVhdV92bW1fZmluaSgm
YW1wO3V2bW0tJmd0O3ZtbSk7PGJyPg0KK8KgIMKgIMKgIMKgZHJtX2dwdXZhX21hbmFnZXJfZGVz
dHJveSgmYW1wO3V2bW0tJmd0O3VtZ3IpOzxicj4NCivCoCDCoCDCoCDCoG11dGV4X3VubG9jaygm
YW1wO2NsaS0mZ3Q7bXV0ZXgpOzxicj4NCit9PGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfdXZtbS5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV91dm1tLmg8YnI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAw
MDAwMC4uMzc0YjhmYmQyYTU5PGJyPg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdXZtbS5oPGJyPg0KQEAgLTAsMCArMSwxMDcgQEA8YnI+
DQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLzxicj4NCis8YnI+DQorI2lmbmRl
ZiBfX05PVVZFQVVfVVZNTV9IX188YnI+DQorI2RlZmluZSBfX05PVVZFQVVfVVZNTV9IX188YnI+
DQorPGJyPg0KKyNpbmNsdWRlICZsdDtkcm0vZHJtX2dwdXZhX21nci5oJmd0Ozxicj4NCis8YnI+
DQorI2luY2x1ZGUgJnF1b3Q7bm91dmVhdV9kcnYuaCZxdW90Ozxicj4NCis8YnI+DQorc3RydWN0
IG5vdXZlYXVfdXZtbSB7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVfdm1tIHZtbTs8
YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhX21hbmFnZXIgdW1ncjs8YnI+DQorwqAg
wqAgwqAgwqBzdHJ1Y3QgbWFwbGVfdHJlZSByZWdpb25fbXQ7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG11dGV4IG11dGV4Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB1NjQgdW5tYW5hZ2VkX2Fk
ZHI7PGJyPg0KK8KgIMKgIMKgIMKgdTY0IHVubWFuYWdlZF9zaXplOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBib29sIGRpc2FibGVkOzxicj4NCit9Ozxicj4NCis8YnI+DQorc3RydWN0IG5vdXZl
YXVfdXZtYV9yZWdpb24gezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bW0gKnV2
bW07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdTY0IGFkZHI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdTY0IHJhbmdl
Ozxicj4NCivCoCDCoCDCoCDCoH0gdmE7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBr
cmVmIGtyZWY7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBjb21wbGV0aW9uIGNvbXBs
ZXRlOzxicj4NCivCoCDCoCDCoCDCoGJvb2wgZGlydHk7PGJyPg0KK307PGJyPg0KKzxicj4NCitz
dHJ1Y3Qgbm91dmVhdV91dm1hIHs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2dwdXZhIHZh
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tOzxicj4N
CivCoCDCoCDCoCDCoHN0cnVjdCBub3V2ZWF1X3V2bWFfcmVnaW9uICpyZWdpb247PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoHU4IGtpbmQ7PGJyPg0KK307PGJyPg0KKzxicj4NCitzdHJ1Y3Qgbm91
dmVhdV91dm1tX2JpbmRfam9iIHs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgbm91dmVhdV9qb2Ig
YmFzZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGtyZWYga3JlZjs8YnI+DQorwqAg
wqAgwqAgwqBzdHJ1Y3QgbGlzdF9oZWFkIGVudHJ5Ozxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCB3
b3JrX3N0cnVjdCB3b3JrOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBjb21wbGV0aW9uIGNvbXBs
ZXRlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBzdHJ1Y3QgYmluZF9qb2Jfb3AgKi88YnI+
DQorwqAgwqAgwqAgwqBzdHJ1Y3QgbGlzdF9oZWFkIG9wczs8YnI+DQorfTs8YnI+DQorPGJyPg0K
K3N0cnVjdCBub3V2ZWF1X3V2bW1fYmluZF9qb2JfYXJncyB7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXY7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5vdXZlYXVf
c2NoZWRfZW50aXR5ICpzY2hlZF9lbnRpdHk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHVuc2ln
bmVkIGludCBmbGFnczs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX25vdXZlYXVfc3luYyAqczs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1MzIgY291bnQ7PGJyPg0KK8KgIMKgIMKgIMKgfSBpbl9zeW5j
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0cnVjdCBkcm1fbm91dmVhdV9zeW5jICpzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHUzMiBjb3VudDs8YnI+DQorwqAgwqAgwqAgwqB9IG91dF9zeW5jOzxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBzdHJ1Y3Qgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVj
dCBkcm1fbm91dmVhdV92bV9iaW5kX29wICpzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHUzMiBjb3VudDs8YnI+DQorwqAgwqAgwqAgwqB9IG9wOzxicj4NCit9Ozxicj4NCis8YnI+DQor
I2RlZmluZSB0b191dm1tX2JpbmRfam9iKGpvYikgY29udGFpbmVyX29mKChqb2IpLCBzdHJ1Y3Qg
bm91dmVhdV91dm1tX2JpbmRfam9iLCBiYXNlKTxicj4NCis8YnI+DQorI2RlZmluZSB1dm1tX2Zy
b21fbWdyKHgpIGNvbnRhaW5lcl9vZigoeCksIHN0cnVjdCBub3V2ZWF1X3V2bW0sIHVtZ3IpPGJy
Pg0KKyNkZWZpbmUgdXZtYV9mcm9tX3ZhKHgpIGNvbnRhaW5lcl9vZigoeCksIHN0cnVjdCBub3V2
ZWF1X3V2bWEsIHZhKTxicj4NCis8YnI+DQoraW50IG5vdXZlYXVfdXZtbV9pbml0KHN0cnVjdCBu
b3V2ZWF1X3V2bW0gKnV2bW0sIHN0cnVjdCBub3V2ZWF1X2NsaSAqY2xpLDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NCB1bm1hbmFnZWRfYWRkciwgdTY0IHVubWFuYWdl
ZF9zaXplKTs8YnI+DQordm9pZCBub3V2ZWF1X3V2bW1fZmluaShzdHJ1Y3Qgbm91dmVhdV91dm1t
ICp1dm1tKTs8YnI+DQorPGJyPg0KK3ZvaWQgbm91dmVhdV91dm1tX2JvX21hcF9hbGwoc3RydWN0
IG5vdXZlYXVfYm8gKm52Ym92LCBzdHJ1Y3Qgbm91dmVhdV9tZW0gKm1lbSk7PGJyPg0KK3ZvaWQg
bm91dmVhdV91dm1tX2JvX3VubWFwX2FsbChzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibyk7PGJyPg0K
Kzxicj4NCitpbnQgbm91dmVhdV91dm1tX2lvY3RsX3ZtX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZCBfX3VzZXIgKmRhdGEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KTs8YnI+DQorPGJy
Pg0KK2ludCBub3V2ZWF1X3V2bW1faW9jdGxfdm1fYmluZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkIF9fdXNlciAqZGF0YSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpOzxicj4NCis8YnI+DQor
c3RhdGljIGlubGluZSB2b2lkIG5vdXZlYXVfdXZtbV9sb2NrKHN0cnVjdCBub3V2ZWF1X3V2bW0g
KnV2bW0pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBtdXRleF9sb2NrKCZhbXA7dXZtbS0mZ3Q7
bXV0ZXgpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW5saW5lIHZvaWQgbm91dmVhdV91
dm1tX3VubG9jayhzdHJ1Y3Qgbm91dmVhdV91dm1tICp1dm1tKTxicj4NCit7PGJyPg0KK8KgIMKg
IMKgIMKgbXV0ZXhfdW5sb2NrKCZhbXA7dXZtbS0mZ3Q7bXV0ZXgpOzxicj4NCit9PGJyPg0KKzxi
cj4NCisjZW5kaWY8YnI+DQotLSA8YnI+DQoyLjQxLjA8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+
PC9kaXY+PC9kaXY+DQo=
--000000000000fd8b18060114cfae--
