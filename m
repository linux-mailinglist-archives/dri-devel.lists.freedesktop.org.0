Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C57ACD3D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 02:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700610E19C;
	Mon, 25 Sep 2023 00:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE5310E19C;
 Mon, 25 Sep 2023 00:42:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso653854866b.1; 
 Sun, 24 Sep 2023 17:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695602535; x=1696207335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiVLtOn71YpPdmSO8dSqiXOVH4KyHGrNR/jO8RDa5LQ=;
 b=LL8+7m6L7oLFggO5SOA5rzJlQ4b36qUU+rQ0oOA43rTOjVVS5qYgcR0vJ4QGelo4jZ
 LtRMVrwBgzXZVmXDHJXD4ROb1I/j/QgGkCYQUBmrLy1rpezkcbG1bicVLLxB0195EcJW
 D2UPsBHhcQS+79EvT5BTM0ef6a6YXu1SpLlPSUpUjrfccaKClP6T/4SIYV7GMvcSPlA3
 bJOH/8zZ1B6DsYZMOYvwwxjMoTp68hRsqTQt6He6/YLZGNSsSJLadbegf+S2Sx+YCXtV
 IDSH6yXRAHwjftXuh7WqsVJB1XzLu9AEgr4v1iO8Odfl9xc6sjFsXg9mty2ZcDTX1PYQ
 nz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695602535; x=1696207335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oiVLtOn71YpPdmSO8dSqiXOVH4KyHGrNR/jO8RDa5LQ=;
 b=tRoEH545GvkvIF2wBOWRKAeUll+qPARArvzQQw13NmHrOT4sKh1dNdqT6HE8q8wWTP
 6DGBP3lyxUdgD/Wrmwbag0a18mHiC+gWnBPhDtCFMDruCTZI4q97/HDwH760YKBGSuWH
 t/PkWIDRLic9Hj0i7wnG9+8UneFGvp8SO/v/SLZKTQZiycmQbMM7cMyL6p7i9uQ20f+U
 olv6klbw4Kwubgzvv8UawvZyaLoDVaO5zPSaQXCE8vaWfnnl8FdGSQ1OzW9COT1lrndp
 if8Bjy4wB4/JfbeUvNw6sA+iRWuY1yxBjSfBJ9etC4WzUFnYX2PdTDdVsj0t3mnlJhwR
 bGcg==
X-Gm-Message-State: AOJu0YyNcUIwoYQ9tTcNjZ79W+QYTKI3nkCu2J2VIgz9c9UM86SyCrZ/
 B70kNlEVT3YJoYqxm55tgzMH33tla/LhYiwUi+M=
X-Google-Smtp-Source: AGHT+IF/ktWxTTvGi1qZs+HMzKQMc6alUdTE9ZCu5p3u7g2OSCibFyrffX6NzvcKuux8Pnb9jD3czdnKPAxDU45tf1k=
X-Received: by 2002:a17:907:7789:b0:9ae:3ee3:1f59 with SMTP id
 ky9-20020a170907778900b009ae3ee31f59mr4343683ejc.13.1695602534046; Sun, 24
 Sep 2023 17:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-2-dakr@redhat.com>
 <420719df-275b-8cdf-1ef0-40b63d511aa4@amd.com>
In-Reply-To: <420719df-275b-8cdf-1ef0-40b63d511aa4@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 25 Sep 2023 10:42:02 +1000
Message-ID: <CAPM=9txhyutm4JJew4BhVooD=+txjTQ7M59DYb6uVPk8c6cA6Q@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v4 1/8] drm/gpuvm: rename struct
 drm_gpuva_manager to struct drm_gpuvm
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sept 2023 at 16:49, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 20.09.23 um 16:42 schrieb Danilo Krummrich:
> > Rename struct drm_gpuva_manager to struct drm_gpuvm including
> > corresponding functions. This way the GPUVA manager's structures align
> > very well with the documentation of VM_BIND [1] and VM_BIND locking [2]=
.
> >
> > It also provides a better foundation for the naming of data structures
> > and functions introduced for implementing a common dma-resv per GPU-VM
> > including tracking of external and evicted objects in subsequent
> > patches.
> >
> > [1] Documentation/gpu/drm-vm-bind-async.rst
> > [2] Documentation/gpu/drm-vm-bind-locking.rst
> >
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>
> Not sure if that name is better or worse, but from the handling I
> suggest to have this patch separately pushed to drm-misc-next.
>
> Feel free to add my Acked-by for pushing this.
>

Acked-by: Dave Airlie <airlied@redhat.com>


> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/Makefile                      |   2 +-
> >   drivers/gpu/drm/drm_debugfs.c                 |  16 +-
> >   .../gpu/drm/{drm_gpuva_mgr.c =3D> drm_gpuvm.c}  | 400 +++++++++------=
---
> >   drivers/gpu/drm/nouveau/nouveau_exec.c        |   2 +-
> >   drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  24 +-
> >   drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   6 +-
> >   include/drm/drm_debugfs.h                     |   6 +-
> >   include/drm/{drm_gpuva_mgr.h =3D> drm_gpuvm.h}  | 153 ++++---
> >   8 files changed, 304 insertions(+), 305 deletions(-)
> >   rename drivers/gpu/drm/{drm_gpuva_mgr.c =3D> drm_gpuvm.c} (78%)
> >   rename include/drm/{drm_gpuva_mgr.h =3D> drm_gpuvm.h} (78%)
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 215e78e79125..7a84b3cddeab 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -45,7 +45,7 @@ drm-y :=3D \
> >       drm_vblank.o \
> >       drm_vblank_work.o \
> >       drm_vma_manager.o \
> > -     drm_gpuva_mgr.o \
> > +     drm_gpuvm.o \
> >       drm_writeback.o
> >   drm-$(CONFIG_DRM_LEGACY) +=3D \
> >       drm_agpsupport.o \
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugf=
s.c
> > index 44ecd7d0daac..f291fb4b359f 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -40,7 +40,7 @@
> >   #include <drm/drm_file.h>
> >   #include <drm/drm_gem.h>
> >   #include <drm/drm_managed.h>
> > -#include <drm/drm_gpuva_mgr.h>
> > +#include <drm/drm_gpuvm.h>
> >
> >   #include "drm_crtc_internal.h"
> >   #include "drm_internal.h"
> > @@ -189,31 +189,31 @@ static const struct file_operations drm_debugfs_f=
ops =3D {
> >   /**
> >    * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
> >    * @m: pointer to the &seq_file to write
> > - * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> >    *
> >    * Dumps the GPU VA mappings of a given DRM GPU VA manager.
> >    *
> >    * For each DRM GPU VA space drivers should call this function from t=
heir
> >    * &drm_info_list's show callback.
> >    *
> > - * Returns: 0 on success, -ENODEV if the &mgr is not initialized
> > + * Returns: 0 on success, -ENODEV if the &gpuvm is not initialized
> >    */
> >   int drm_debugfs_gpuva_info(struct seq_file *m,
> > -                        struct drm_gpuva_manager *mgr)
> > +                        struct drm_gpuvm *gpuvm)
> >   {
> > -     struct drm_gpuva *va, *kva =3D &mgr->kernel_alloc_node;
> > +     struct drm_gpuva *va, *kva =3D &gpuvm->kernel_alloc_node;
> >
> > -     if (!mgr->name)
> > +     if (!gpuvm->name)
> >               return -ENODEV;
> >
> >       seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
> > -                mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_rang=
e);
> > +                gpuvm->name, gpuvm->mm_start, gpuvm->mm_start + gpuvm-=
>mm_range);
> >       seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
> >                  kva->va.addr, kva->va.addr + kva->va.range);
> >       seq_puts(m, "\n");
> >       seq_puts(m, " VAs | start              | range              | end=
                | object             | object offset\n");
> >       seq_puts(m, "----------------------------------------------------=
---------------------------------------------------------\n");
> > -     drm_gpuva_for_each_va(va, mgr) {
> > +     drm_gpuvm_for_each_va(va, gpuvm) {
> >               if (unlikely(va =3D=3D kva))
> >                       continue;
> >
> > diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuv=
m.c
> > similarity index 78%
> > rename from drivers/gpu/drm/drm_gpuva_mgr.c
> > rename to drivers/gpu/drm/drm_gpuvm.c
> > index f86bfad74ff8..7074bcad5b28 100644
> > --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -25,7 +25,7 @@
> >    *
> >    */
> >
> > -#include <drm/drm_gpuva_mgr.h>
> > +#include <drm/drm_gpuvm.h>
> >
> >   #include <linux/interval_tree_generic.h>
> >   #include <linux/mm.h>
> > @@ -33,8 +33,8 @@
> >   /**
> >    * DOC: Overview
> >    *
> > - * The DRM GPU VA Manager, represented by struct drm_gpuva_manager kee=
ps track
> > - * of a GPU's virtual address (VA) space and manages the corresponding=
 virtual
> > + * The DRM GPU VA Manager, represented by struct drm_gpuvm keeps track=
 of a
> > + * GPU's virtual address (VA) space and manages the corresponding virt=
ual
> >    * mappings represented by &drm_gpuva objects. It also keeps track of=
 the
> >    * mapping's backing &drm_gem_object buffers.
> >    *
> > @@ -47,28 +47,28 @@
> >    * The GPU VA manager internally uses a rb-tree to manage the
> >    * &drm_gpuva mappings within a GPU's virtual address space.
> >    *
> > - * The &drm_gpuva_manager contains a special &drm_gpuva representing t=
he
> > + * The &drm_gpuvm structure contains a special &drm_gpuva representing=
 the
> >    * portion of VA space reserved by the kernel. This node is initializ=
ed together
> >    * with the GPU VA manager instance and removed when the GPU VA manag=
er is
> >    * destroyed.
> >    *
> > - * In a typical application drivers would embed struct drm_gpuva_manag=
er and
> > + * In a typical application drivers would embed struct drm_gpuvm and
> >    * struct drm_gpuva within their own driver specific structures, ther=
e won't be
> >    * any memory allocations of its own nor memory allocations of &drm_g=
puva
> >    * entries.
> >    *
> > - * The data structures needed to store &drm_gpuvas within the &drm_gpu=
va_manager
> > - * are contained within struct drm_gpuva already. Hence, for inserting
> > - * &drm_gpuva entries from within dma-fence signalling critical sectio=
ns it is
> > - * enough to pre-allocate the &drm_gpuva structures.
> > + * The data structures needed to store &drm_gpuvas within the &drm_gpu=
vm are
> > + * contained within struct drm_gpuva already. Hence, for inserting &dr=
m_gpuva
> > + * entries from within dma-fence signalling critical sections it is en=
ough to
> > + * pre-allocate the &drm_gpuva structures.
> >    */
> >
> >   /**
> >    * DOC: Split and Merge
> >    *
> >    * Besides its capability to manage and represent a GPU VA space, the
> > - * &drm_gpuva_manager also provides functions to let the &drm_gpuva_ma=
nager
> > - * calculate a sequence of operations to satisfy a given map or unmap =
request.
> > + * GPU VA manager also provides functions to let the &drm_gpuvm calcul=
ate a
> > + * sequence of operations to satisfy a given map or unmap request.
> >    *
> >    * Therefore the DRM GPU VA manager provides an algorithm implementin=
g splitting
> >    * and merging of existent GPU VA mappings with the ones that are req=
uested to
> > @@ -76,16 +76,16 @@
> >    * implement Vulkan 'Sparse Memory Bindings' - drivers UAPIs often re=
fer to this
> >    * as VM BIND.
> >    *
> > - * Drivers can call drm_gpuva_sm_map() to receive a sequence of callba=
cks
> > + * Drivers can call drm_gpuvm_sm_map() to receive a sequence of callba=
cks
> >    * containing map, unmap and remap operations for a given newly reque=
sted
> >    * mapping. The sequence of callbacks represents the set of operation=
s to
> >    * execute in order to integrate the new mapping cleanly into the cur=
rent state
> >    * of the GPU VA space.
> >    *
> >    * Depending on how the new GPU VA mapping intersects with the existe=
nt mappings
> > - * of the GPU VA space the &drm_gpuva_fn_ops callbacks contain an arbi=
trary
> > - * amount of unmap operations, a maximum of two remap operations and a=
 single
> > - * map operation. The caller might receive no callback at all if no op=
eration is
> > + * of the GPU VA space the &drm_gpuvm_ops callbacks contain an arbitra=
ry amount
> > + * of unmap operations, a maximum of two remap operations and a single=
 map
> > + * operation. The caller might receive no callback at all if no operat=
ion is
> >    * required, e.g. if the requested mapping already exists in the exac=
t same way.
> >    *
> >    * The single map operation represents the original map operation req=
uested by
> > @@ -95,7 +95,7 @@
> >    * &drm_gpuva to unmap is physically contiguous with the original map=
ping
> >    * request. Optionally, if 'keep' is set, drivers may keep the actual=
 page table
> >    * entries for this &drm_gpuva, adding the missing page table entries=
 only and
> > - * update the &drm_gpuva_manager's view of things accordingly.
> > + * update the &drm_gpuvm's view of things accordingly.
> >    *
> >    * Drivers may do the same optimization, namely delta page table upda=
tes, also
> >    * for remap operations. This is possible since &drm_gpuva_op_remap c=
onsists of
> > @@ -106,34 +106,34 @@
> >    * the beginning and one at the end of the new mapping, hence there i=
s a
> >    * maximum of two remap operations.
> >    *
> > - * Analogous to drm_gpuva_sm_map() drm_gpuva_sm_unmap() uses &drm_gpuv=
a_fn_ops
> > - * to call back into the driver in order to unmap a range of GPU VA sp=
ace. The
> > + * Analogous to drm_gpuvm_sm_map() drm_gpuvm_sm_unmap() uses &drm_gpuv=
m_ops to
> > + * call back into the driver in order to unmap a range of GPU VA space=
. The
> >    * logic behind this function is way simpler though: For all existent=
 mappings
> >    * enclosed by the given range unmap operations are created. For mapp=
ings which
> >    * are only partically located within the given range, remap operatio=
ns are
> >    * created such that those mappings are split up and re-mapped partic=
ally.
> >    *
> > - * As an alternative to drm_gpuva_sm_map() and drm_gpuva_sm_unmap(),
> > - * drm_gpuva_sm_map_ops_create() and drm_gpuva_sm_unmap_ops_create() c=
an be used
> > + * As an alternative to drm_gpuvm_sm_map() and drm_gpuvm_sm_unmap(),
> > + * drm_gpuvm_sm_map_ops_create() and drm_gpuvm_sm_unmap_ops_create() c=
an be used
> >    * to directly obtain an instance of struct drm_gpuva_ops containing =
a list of
> >    * &drm_gpuva_op, which can be iterated with drm_gpuva_for_each_op().=
 This list
> >    * contains the &drm_gpuva_ops analogous to the callbacks one would r=
eceive when
> > - * calling drm_gpuva_sm_map() or drm_gpuva_sm_unmap(). While this way =
requires
> > + * calling drm_gpuvm_sm_map() or drm_gpuvm_sm_unmap(). While this way =
requires
> >    * more memory (to allocate the &drm_gpuva_ops), it provides drivers =
a way to
> >    * iterate the &drm_gpuva_op multiple times, e.g. once in a context w=
here memory
> >    * allocations are possible (e.g. to allocate GPU page tables) and on=
ce in the
> >    * dma-fence signalling critical path.
> >    *
> > - * To update the &drm_gpuva_manager's view of the GPU VA space
> > - * drm_gpuva_insert() and drm_gpuva_remove() may be used. These functi=
ons can
> > - * safely be used from &drm_gpuva_fn_ops callbacks originating from
> > - * drm_gpuva_sm_map() or drm_gpuva_sm_unmap(). However, it might be mo=
re
> > - * convenient to use the provided helper functions drm_gpuva_map(),
> > - * drm_gpuva_remap() and drm_gpuva_unmap() instead.
> > + * To update the &drm_gpuvm's view of the GPU VA space drm_gpuva_inser=
t() and
> > + * drm_gpuva_remove() may be used. These functions can safely be used =
from
> > + * &drm_gpuvm_ops callbacks originating from drm_gpuvm_sm_map() or
> > + * drm_gpuvm_sm_unmap(). However, it might be more convenient to use t=
he
> > + * provided helper functions drm_gpuva_map(), drm_gpuva_remap() and
> > + * drm_gpuva_unmap() instead.
> >    *
> >    * The following diagram depicts the basic relationships of existent =
GPU VA
> >    * mappings, a newly requested mapping and the resulting mappings as =
implemented
> > - * by drm_gpuva_sm_map() - it doesn't cover any arbitrary combinations=
 of these.
> > + * by drm_gpuvm_sm_map() - it doesn't cover any arbitrary combinations=
 of these.
> >    *
> >    * 1) Requested mapping is identical. Replace it, but indicate the ba=
cking PTEs
> >    *    could be kept.
> > @@ -421,10 +421,10 @@
> >    *  // Allocates a new &drm_gpuva.
> >    *  struct drm_gpuva * driver_gpuva_alloc(void);
> >    *
> > - *   // Typically drivers would embedd the &drm_gpuva_manager and &drm=
_gpuva
> > + *   // Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
> >    *  // structure in individual driver structures and lock the dma-res=
v with
> >    *  // drm_exec or similar helpers.
> > - *   int driver_mapping_create(struct drm_gpuva_manager *mgr,
> > + *   int driver_mapping_create(struct drm_gpuvm *gpuvm,
> >    *                            u64 addr, u64 range,
> >    *                            struct drm_gem_object *obj, u64 offset)
> >    *  {
> > @@ -432,7 +432,7 @@
> >    *          struct drm_gpuva_op *op
> >    *
> >    *          driver_lock_va_space();
> > - *           ops =3D drm_gpuva_sm_map_ops_create(mgr, addr, range,
> > + *           ops =3D drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
> >    *                                            obj, offset);
> >    *          if (IS_ERR(ops))
> >    *                  return PTR_ERR(ops);
> > @@ -448,7 +448,7 @@
> >    *                                    // free memory and unlock
> >    *
> >    *                          driver_vm_map();
> > - *                           drm_gpuva_map(mgr, va, &op->map);
> > + *                           drm_gpuva_map(gpuvm, va, &op->map);
> >    *                          drm_gpuva_link(va);
> >    *
> >    *                          break;
> > @@ -504,23 +504,23 @@
> >    * 2) Receive a callback for each &drm_gpuva_op to create a new mappi=
ng::
> >    *
> >    *  struct driver_context {
> > - *           struct drm_gpuva_manager *mgr;
> > + *           struct drm_gpuvm *gpuvm;
> >    *          struct drm_gpuva *new_va;
> >    *          struct drm_gpuva *prev_va;
> >    *          struct drm_gpuva *next_va;
> >    *  };
> >    *
> > - *   // ops to pass to drm_gpuva_manager_init()
> > - *   static const struct drm_gpuva_fn_ops driver_gpuva_ops =3D {
> > + *   // ops to pass to drm_gpuvm_init()
> > + *   static const struct drm_gpuvm_ops driver_gpuvm_ops =3D {
> >    *          .sm_step_map =3D driver_gpuva_map,
> >    *          .sm_step_remap =3D driver_gpuva_remap,
> >    *          .sm_step_unmap =3D driver_gpuva_unmap,
> >    *  };
> >    *
> > - *   // Typically drivers would embedd the &drm_gpuva_manager and &drm=
_gpuva
> > + *   // Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
> >    *  // structure in individual driver structures and lock the dma-res=
v with
> >    *  // drm_exec or similar helpers.
> > - *   int driver_mapping_create(struct drm_gpuva_manager *mgr,
> > + *   int driver_mapping_create(struct drm_gpuvm *gpuvm,
> >    *                            u64 addr, u64 range,
> >    *                            struct drm_gem_object *obj, u64 offset)
> >    *  {
> > @@ -529,7 +529,7 @@
> >    *          struct drm_gpuva_op *op;
> >    *          int ret =3D 0;
> >    *
> > - *           ctx.mgr =3D mgr;
> > + *           ctx.gpuvm =3D gpuvm;
> >    *
> >    *          ctx.new_va =3D kzalloc(sizeof(*ctx.new_va), GFP_KERNEL);
> >    *          ctx.prev_va =3D kzalloc(sizeof(*ctx.prev_va), GFP_KERNEL)=
;
> > @@ -540,7 +540,7 @@
> >    *          }
> >    *
> >    *          driver_lock_va_space();
> > - *           ret =3D drm_gpuva_sm_map(mgr, &ctx, addr, range, obj, off=
set);
> > + *           ret =3D drm_gpuvm_sm_map(gpuvm, &ctx, addr, range, obj, o=
ffset);
> >    *          driver_unlock_va_space();
> >    *
> >    *  out:
> > @@ -554,7 +554,7 @@
> >    *  {
> >    *          struct driver_context *ctx =3D __ctx;
> >    *
> > - *           drm_gpuva_map(ctx->mgr, ctx->new_va, &op->map);
> > + *           drm_gpuva_map(ctx->vm, ctx->new_va, &op->map);
> >    *
> >    *          drm_gpuva_link(ctx->new_va);
> >    *
> > @@ -609,12 +609,12 @@ INTERVAL_TREE_DEFINE(struct drm_gpuva, rb.node, u=
64, rb.__subtree_last,
> >                    GPUVA_START, GPUVA_LAST, static __maybe_unused,
> >                    drm_gpuva_it)
> >
> > -static int __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> >                             struct drm_gpuva *va);
> >   static void __drm_gpuva_remove(struct drm_gpuva *va);
> >
> >   static bool
> > -drm_gpuva_check_overflow(u64 addr, u64 range)
> > +drm_gpuvm_check_overflow(u64 addr, u64 range)
> >   {
> >       u64 end;
> >
> > @@ -623,121 +623,121 @@ drm_gpuva_check_overflow(u64 addr, u64 range)
> >   }
> >
> >   static bool
> > -drm_gpuva_in_mm_range(struct drm_gpuva_manager *mgr, u64 addr, u64 ran=
ge)
> > +drm_gpuvm_in_mm_range(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
> >   {
> >       u64 end =3D addr + range;
> > -     u64 mm_start =3D mgr->mm_start;
> > -     u64 mm_end =3D mm_start + mgr->mm_range;
> > +     u64 mm_start =3D gpuvm->mm_start;
> > +     u64 mm_end =3D mm_start + gpuvm->mm_range;
> >
> >       return addr >=3D mm_start && end <=3D mm_end;
> >   }
> >
> >   static bool
> > -drm_gpuva_in_kernel_node(struct drm_gpuva_manager *mgr, u64 addr, u64 =
range)
> > +drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
> >   {
> >       u64 end =3D addr + range;
> > -     u64 kstart =3D mgr->kernel_alloc_node.va.addr;
> > -     u64 krange =3D mgr->kernel_alloc_node.va.range;
> > +     u64 kstart =3D gpuvm->kernel_alloc_node.va.addr;
> > +     u64 krange =3D gpuvm->kernel_alloc_node.va.range;
> >       u64 kend =3D kstart + krange;
> >
> >       return krange && addr < kend && kstart < end;
> >   }
> >
> >   static bool
> > -drm_gpuva_range_valid(struct drm_gpuva_manager *mgr,
> > +drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
> >                     u64 addr, u64 range)
> >   {
> > -     return !drm_gpuva_check_overflow(addr, range) &&
> > -            drm_gpuva_in_mm_range(mgr, addr, range) &&
> > -            !drm_gpuva_in_kernel_node(mgr, addr, range);
> > +     return !drm_gpuvm_check_overflow(addr, range) &&
> > +            drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
> > +            !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
> >   }
> >
> >   /**
> > - * drm_gpuva_manager_init() - initialize a &drm_gpuva_manager
> > - * @mgr: pointer to the &drm_gpuva_manager to initialize
> > + * drm_gpuvm_init() - initialize a &drm_gpuvm
> > + * @gpuvm: pointer to the &drm_gpuvm to initialize
> >    * @name: the name of the GPU VA space
> >    * @start_offset: the start offset of the GPU VA space
> >    * @range: the size of the GPU VA space
> >    * @reserve_offset: the start of the kernel reserved GPU VA area
> >    * @reserve_range: the size of the kernel reserved GPU VA area
> > - * @ops: &drm_gpuva_fn_ops called on &drm_gpuva_sm_map / &drm_gpuva_sm=
_unmap
> > + * @ops: &drm_gpuvm_ops called on &drm_gpuvm_sm_map / &drm_gpuvm_sm_un=
map
> >    *
> > - * The &drm_gpuva_manager must be initialized with this function befor=
e use.
> > + * The &drm_gpuvm must be initialized with this function before use.
> >    *
> > - * Note that @mgr must be cleared to 0 before calling this function. T=
he given
> > + * Note that @gpuvm must be cleared to 0 before calling this function.=
 The given
> >    * &name is expected to be managed by the surrounding driver structur=
es.
> >    */
> >   void
> > -drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> > -                    const char *name,
> > -                    u64 start_offset, u64 range,
> > -                    u64 reserve_offset, u64 reserve_range,
> > -                    const struct drm_gpuva_fn_ops *ops)
> > +drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> > +            const char *name,
> > +            u64 start_offset, u64 range,
> > +            u64 reserve_offset, u64 reserve_range,
> > +            const struct drm_gpuvm_ops *ops)
> >   {
> > -     mgr->rb.tree =3D RB_ROOT_CACHED;
> > -     INIT_LIST_HEAD(&mgr->rb.list);
> > +     gpuvm->rb.tree =3D RB_ROOT_CACHED;
> > +     INIT_LIST_HEAD(&gpuvm->rb.list);
> >
> > -     drm_gpuva_check_overflow(start_offset, range);
> > -     mgr->mm_start =3D start_offset;
> > -     mgr->mm_range =3D range;
> > +     drm_gpuvm_check_overflow(start_offset, range);
> > +     gpuvm->mm_start =3D start_offset;
> > +     gpuvm->mm_range =3D range;
> >
> > -     mgr->name =3D name ? name : "unknown";
> > -     mgr->ops =3D ops;
> > +     gpuvm->name =3D name ? name : "unknown";
> > +     gpuvm->ops =3D ops;
> >
> > -     memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
> > +     memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
> >
> >       if (reserve_range) {
> > -             mgr->kernel_alloc_node.va.addr =3D reserve_offset;
> > -             mgr->kernel_alloc_node.va.range =3D reserve_range;
> > +             gpuvm->kernel_alloc_node.va.addr =3D reserve_offset;
> > +             gpuvm->kernel_alloc_node.va.range =3D reserve_range;
> >
> > -             if (likely(!drm_gpuva_check_overflow(reserve_offset,
> > +             if (likely(!drm_gpuvm_check_overflow(reserve_offset,
> >                                                    reserve_range)))
> > -                     __drm_gpuva_insert(mgr, &mgr->kernel_alloc_node);
> > +                     __drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_no=
de);
> >       }
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_manager_init);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_init);
> >
> >   /**
> > - * drm_gpuva_manager_destroy() - cleanup a &drm_gpuva_manager
> > - * @mgr: pointer to the &drm_gpuva_manager to clean up
> > + * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> > + * @gpuvm: pointer to the &drm_gpuvm to clean up
> >    *
> >    * Note that it is a bug to call this function on a manager that stil=
l
> >    * holds GPU VA mappings.
> >    */
> >   void
> > -drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
> > +drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> >   {
> > -     mgr->name =3D NULL;
> > +     gpuvm->name =3D NULL;
> >
> > -     if (mgr->kernel_alloc_node.va.range)
> > -             __drm_gpuva_remove(&mgr->kernel_alloc_node);
> > +     if (gpuvm->kernel_alloc_node.va.range)
> > +             __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
> >
> > -     WARN(!RB_EMPTY_ROOT(&mgr->rb.tree.rb_root),
> > +     WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
> >            "GPUVA tree is not empty, potentially leaking memory.");
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_manager_destroy);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> >
> >   static int
> > -__drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +__drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> >                  struct drm_gpuva *va)
> >   {
> >       struct rb_node *node;
> >       struct list_head *head;
> >
> > -     if (drm_gpuva_it_iter_first(&mgr->rb.tree,
> > +     if (drm_gpuva_it_iter_first(&gpuvm->rb.tree,
> >                                   GPUVA_START(va),
> >                                   GPUVA_LAST(va)))
> >               return -EEXIST;
> >
> > -     va->mgr =3D mgr;
> > +     va->vm =3D gpuvm;
> >
> > -     drm_gpuva_it_insert(va, &mgr->rb.tree);
> > +     drm_gpuva_it_insert(va, &gpuvm->rb.tree);
> >
> >       node =3D rb_prev(&va->rb.node);
> >       if (node)
> >               head =3D &(to_drm_gpuva(node))->rb.entry;
> >       else
> > -             head =3D &mgr->rb.list;
> > +             head =3D &gpuvm->rb.list;
> >
> >       list_add(&va->rb.entry, head);
> >
> > @@ -746,36 +746,36 @@ __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> >
> >   /**
> >    * drm_gpuva_insert() - insert a &drm_gpuva
> > - * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > + * @gpuvm: the &drm_gpuvm to insert the &drm_gpuva in
> >    * @va: the &drm_gpuva to insert
> >    *
> >    * Insert a &drm_gpuva with a given address and range into a
> > - * &drm_gpuva_manager.
> > + * &drm_gpuvm.
> >    *
> >    * It is safe to use this function using the safe versions of iterati=
ng the GPU
> > - * VA space, such as drm_gpuva_for_each_va_safe() and
> > - * drm_gpuva_for_each_va_range_safe().
> > + * VA space, such as drm_gpuvm_for_each_va_safe() and
> > + * drm_gpuvm_for_each_va_range_safe().
> >    *
> >    * Returns: 0 on success, negative error code on failure.
> >    */
> >   int
> > -drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> >                struct drm_gpuva *va)
> >   {
> >       u64 addr =3D va->va.addr;
> >       u64 range =3D va->va.range;
> >
> > -     if (unlikely(!drm_gpuva_range_valid(mgr, addr, range)))
> > +     if (unlikely(!drm_gpuva_range_valid(gpuvm, addr, range)))
> >               return -EINVAL;
> >
> > -     return __drm_gpuva_insert(mgr, va);
> > +     return __drm_gpuva_insert(gpuvm, va);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_insert);
> >
> >   static void
> >   __drm_gpuva_remove(struct drm_gpuva *va)
> >   {
> > -     drm_gpuva_it_remove(va, &va->mgr->rb.tree);
> > +     drm_gpuva_it_remove(va, &va->vm->rb.tree);
> >       list_del_init(&va->rb.entry);
> >   }
> >
> > @@ -786,15 +786,15 @@ __drm_gpuva_remove(struct drm_gpuva *va)
> >    * This removes the given &va from the underlaying tree.
> >    *
> >    * It is safe to use this function using the safe versions of iterati=
ng the GPU
> > - * VA space, such as drm_gpuva_for_each_va_safe() and
> > - * drm_gpuva_for_each_va_range_safe().
> > + * VA space, such as drm_gpuvm_for_each_va_safe() and
> > + * drm_gpuvm_for_each_va_range_safe().
> >    */
> >   void
> >   drm_gpuva_remove(struct drm_gpuva *va)
> >   {
> > -     struct drm_gpuva_manager *mgr =3D va->mgr;
> > +     struct drm_gpuvm *gpuvm =3D va->vm;
> >
> > -     if (unlikely(va =3D=3D &mgr->kernel_alloc_node)) {
> > +     if (unlikely(va =3D=3D &gpuvm->kernel_alloc_node)) {
> >               WARN(1, "Can't destroy kernel reserved node.\n");
> >               return;
> >       }
> > @@ -853,37 +853,37 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
> >
> >   /**
> >    * drm_gpuva_find_first() - find the first &drm_gpuva in the given ra=
nge
> > - * @mgr: the &drm_gpuva_manager to search in
> > + * @gpuvm: the &drm_gpuvm to search in
> >    * @addr: the &drm_gpuvas address
> >    * @range: the &drm_gpuvas range
> >    *
> >    * Returns: the first &drm_gpuva within the given range
> >    */
> >   struct drm_gpuva *
> > -drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> > +drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
> >                    u64 addr, u64 range)
> >   {
> >       u64 last =3D addr + range - 1;
> >
> > -     return drm_gpuva_it_iter_first(&mgr->rb.tree, addr, last);
> > +     return drm_gpuva_it_iter_first(&gpuvm->rb.tree, addr, last);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_find_first);
> >
> >   /**
> >    * drm_gpuva_find() - find a &drm_gpuva
> > - * @mgr: the &drm_gpuva_manager to search in
> > + * @gpuvm: the &drm_gpuvm to search in
> >    * @addr: the &drm_gpuvas address
> >    * @range: the &drm_gpuvas range
> >    *
> >    * Returns: the &drm_gpuva at a given &addr and with a given &range
> >    */
> >   struct drm_gpuva *
> > -drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > +drm_gpuva_find(struct drm_gpuvm *gpuvm,
> >              u64 addr, u64 range)
> >   {
> >       struct drm_gpuva *va;
> >
> > -     va =3D drm_gpuva_find_first(mgr, addr, range);
> > +     va =3D drm_gpuva_find_first(gpuvm, addr, range);
> >       if (!va)
> >               goto out;
> >
> > @@ -900,7 +900,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_find);
> >
> >   /**
> >    * drm_gpuva_find_prev() - find the &drm_gpuva before the given addre=
ss
> > - * @mgr: the &drm_gpuva_manager to search in
> > + * @gpuvm: the &drm_gpuvm to search in
> >    * @start: the given GPU VA's start address
> >    *
> >    * Find the adjacent &drm_gpuva before the GPU VA with given &start a=
ddress.
> > @@ -911,18 +911,18 @@ EXPORT_SYMBOL_GPL(drm_gpuva_find);
> >    * Returns: a pointer to the found &drm_gpuva or NULL if none was fou=
nd
> >    */
> >   struct drm_gpuva *
> > -drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> > +drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start)
> >   {
> > -     if (!drm_gpuva_range_valid(mgr, start - 1, 1))
> > +     if (!drm_gpuva_range_valid(gpuvm, start - 1, 1))
> >               return NULL;
> >
> > -     return drm_gpuva_it_iter_first(&mgr->rb.tree, start - 1, start);
> > +     return drm_gpuva_it_iter_first(&gpuvm->rb.tree, start - 1, start)=
;
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_find_prev);
> >
> >   /**
> >    * drm_gpuva_find_next() - find the &drm_gpuva after the given addres=
s
> > - * @mgr: the &drm_gpuva_manager to search in
> > + * @gpuvm: the &drm_gpuvm to search in
> >    * @end: the given GPU VA's end address
> >    *
> >    * Find the adjacent &drm_gpuva after the GPU VA with given &end addr=
ess.
> > @@ -933,47 +933,47 @@ EXPORT_SYMBOL_GPL(drm_gpuva_find_prev);
> >    * Returns: a pointer to the found &drm_gpuva or NULL if none was fou=
nd
> >    */
> >   struct drm_gpuva *
> > -drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
> > +drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end)
> >   {
> > -     if (!drm_gpuva_range_valid(mgr, end, 1))
> > +     if (!drm_gpuva_range_valid(gpuvm, end, 1))
> >               return NULL;
> >
> > -     return drm_gpuva_it_iter_first(&mgr->rb.tree, end, end + 1);
> > +     return drm_gpuva_it_iter_first(&gpuvm->rb.tree, end, end + 1);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_find_next);
> >
> >   /**
> >    * drm_gpuva_interval_empty() - indicate whether a given interval of =
the VA space
> >    * is empty
> > - * @mgr: the &drm_gpuva_manager to check the range for
> > + * @gpuvm: the &drm_gpuvm to check the range for
> >    * @addr: the start address of the range
> >    * @range: the range of the interval
> >    *
> >    * Returns: true if the interval is empty, false otherwise
> >    */
> >   bool
> > -drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 =
range)
> > +drm_gpuva_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
> >   {
> > -     return !drm_gpuva_find_first(mgr, addr, range);
> > +     return !drm_gpuva_find_first(gpuvm, addr, range);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_interval_empty);
> >
> >   /**
> >    * drm_gpuva_map() - helper to insert a &drm_gpuva according to a
> >    * &drm_gpuva_op_map
> > - * @mgr: the &drm_gpuva_manager
> > + * @gpuvm: the &drm_gpuvm
> >    * @va: the &drm_gpuva to insert
> >    * @op: the &drm_gpuva_op_map to initialize @va with
> >    *
> > - * Initializes the @va from the @op and inserts it into the given @mgr=
.
> > + * Initializes the @va from the @op and inserts it into the given @gpu=
vm.
> >    */
> >   void
> > -drm_gpuva_map(struct drm_gpuva_manager *mgr,
> > +drm_gpuva_map(struct drm_gpuvm *gpuvm,
> >             struct drm_gpuva *va,
> >             struct drm_gpuva_op_map *op)
> >   {
> >       drm_gpuva_init_from_op(va, op);
> > -     drm_gpuva_insert(mgr, va);
> > +     drm_gpuva_insert(gpuvm, va);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_map);
> >
> > @@ -993,18 +993,18 @@ drm_gpuva_remap(struct drm_gpuva *prev,
> >               struct drm_gpuva_op_remap *op)
> >   {
> >       struct drm_gpuva *curr =3D op->unmap->va;
> > -     struct drm_gpuva_manager *mgr =3D curr->mgr;
> > +     struct drm_gpuvm *gpuvm =3D curr->vm;
> >
> >       drm_gpuva_remove(curr);
> >
> >       if (op->prev) {
> >               drm_gpuva_init_from_op(prev, op->prev);
> > -             drm_gpuva_insert(mgr, prev);
> > +             drm_gpuva_insert(gpuvm, prev);
> >       }
> >
> >       if (op->next) {
> >               drm_gpuva_init_from_op(next, op->next);
> > -             drm_gpuva_insert(mgr, next);
> > +             drm_gpuva_insert(gpuvm, next);
> >       }
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_remap);
> > @@ -1024,7 +1024,7 @@ drm_gpuva_unmap(struct drm_gpuva_op_unmap *op)
> >   EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
> >
> >   static int
> > -op_map_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
> > +op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> >         u64 addr, u64 range,
> >         struct drm_gem_object *obj, u64 offset)
> >   {
> > @@ -1040,7 +1040,7 @@ op_map_cb(const struct drm_gpuva_fn_ops *fn, void=
 *priv,
> >   }
> >
> >   static int
> > -op_remap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
> > +op_remap_cb(const struct drm_gpuvm_ops *fn, void *priv,
> >           struct drm_gpuva_op_map *prev,
> >           struct drm_gpuva_op_map *next,
> >           struct drm_gpuva_op_unmap *unmap)
> > @@ -1058,7 +1058,7 @@ op_remap_cb(const struct drm_gpuva_fn_ops *fn, vo=
id *priv,
> >   }
> >
> >   static int
> > -op_unmap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
> > +op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
> >           struct drm_gpuva *va, bool merge)
> >   {
> >       struct drm_gpuva_op op =3D {};
> > @@ -1071,8 +1071,8 @@ op_unmap_cb(const struct drm_gpuva_fn_ops *fn, vo=
id *priv,
> >   }
> >
> >   static int
> > -__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
> > -                const struct drm_gpuva_fn_ops *ops, void *priv,
> > +__drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> > +                const struct drm_gpuvm_ops *ops, void *priv,
> >                  u64 req_addr, u64 req_range,
> >                  struct drm_gem_object *req_obj, u64 req_offset)
> >   {
> > @@ -1080,10 +1080,10 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mg=
r,
> >       u64 req_end =3D req_addr + req_range;
> >       int ret;
> >
> > -     if (unlikely(!drm_gpuva_range_valid(mgr, req_addr, req_range)))
> > +     if (unlikely(!drm_gpuva_range_valid(gpuvm, req_addr, req_range)))
> >               return -EINVAL;
> >
> > -     drm_gpuva_for_each_va_range_safe(va, next, mgr, req_addr, req_end=
) {
> > +     drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_e=
nd) {
> >               struct drm_gem_object *obj =3D va->gem.obj;
> >               u64 offset =3D va->gem.offset;
> >               u64 addr =3D va->va.addr;
> > @@ -1215,18 +1215,18 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mg=
r,
> >   }
> >
> >   static int
> > -__drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
> > -                  const struct drm_gpuva_fn_ops *ops, void *priv,
> > +__drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
> > +                  const struct drm_gpuvm_ops *ops, void *priv,
> >                    u64 req_addr, u64 req_range)
> >   {
> >       struct drm_gpuva *va, *next;
> >       u64 req_end =3D req_addr + req_range;
> >       int ret;
> >
> > -     if (unlikely(!drm_gpuva_range_valid(mgr, req_addr, req_range)))
> > +     if (unlikely(!drm_gpuva_range_valid(gpuvm, req_addr, req_range)))
> >               return -EINVAL;
> >
> > -     drm_gpuva_for_each_va_range_safe(va, next, mgr, req_addr, req_end=
) {
> > +     drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_e=
nd) {
> >               struct drm_gpuva_op_map prev =3D {}, next =3D {};
> >               bool prev_split =3D false, next_split =3D false;
> >               struct drm_gem_object *obj =3D va->gem.obj;
> > @@ -1273,8 +1273,8 @@ __drm_gpuva_sm_unmap(struct drm_gpuva_manager *mg=
r,
> >   }
> >
> >   /**
> > - * drm_gpuva_sm_map() - creates the &drm_gpuva_op split/merge steps
> > - * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> >    * @req_addr: the start address of the new mapping
> >    * @req_range: the range of the new mapping
> >    * @req_obj: the &drm_gem_object to map
> > @@ -1282,15 +1282,15 @@ __drm_gpuva_sm_unmap(struct drm_gpuva_manager *=
mgr,
> >    * @priv: pointer to a driver private data structure
> >    *
> >    * This function iterates the given range of the GPU VA space. It uti=
lizes the
> > - * &drm_gpuva_fn_ops to call back into the driver providing the split =
and merge
> > + * &drm_gpuvm_ops to call back into the driver providing the split and=
 merge
> >    * steps.
> >    *
> >    * Drivers may use these callbacks to update the GPU VA space right a=
way within
> >    * the callback. In case the driver decides to copy and store the ope=
rations for
> > - * later processing neither this function nor &drm_gpuva_sm_unmap is a=
llowed to
> > - * be called before the &drm_gpuva_manager's view of the GPU VA space =
was
> > + * later processing neither this function nor &drm_gpuvm_sm_unmap is a=
llowed to
> > + * be called before the &drm_gpuvm's view of the GPU VA space was
> >    * updated with the previous set of operations. To update the
> > - * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> > + * &drm_gpuvm's view of the GPU VA space drm_gpuva_insert(),
> >    * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() sho=
uld be
> >    * used.
> >    *
> > @@ -1305,39 +1305,39 @@ __drm_gpuva_sm_unmap(struct drm_gpuva_manager *=
mgr,
> >    * Returns: 0 on success or a negative error code
> >    */
> >   int
> > -drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
> > +drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> >                u64 req_addr, u64 req_range,
> >                struct drm_gem_object *req_obj, u64 req_offset)
> >   {
> > -     const struct drm_gpuva_fn_ops *ops =3D mgr->ops;
> > +     const struct drm_gpuvm_ops *ops =3D gpuvm->ops;
> >
> >       if (unlikely(!(ops && ops->sm_step_map &&
> >                      ops->sm_step_remap &&
> >                      ops->sm_step_unmap)))
> >               return -EINVAL;
> >
> > -     return __drm_gpuva_sm_map(mgr, ops, priv,
> > +     return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> >                                 req_addr, req_range,
> >                                 req_obj, req_offset);
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_sm_map);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
> >
> >   /**
> > - * drm_gpuva_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
> > - * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> >    * @priv: pointer to a driver private data structure
> >    * @req_addr: the start address of the range to unmap
> >    * @req_range: the range of the mappings to unmap
> >    *
> >    * This function iterates the given range of the GPU VA space. It uti=
lizes the
> > - * &drm_gpuva_fn_ops to call back into the driver providing the operat=
ions to
> > + * &drm_gpuvm_ops to call back into the driver providing the operation=
s to
> >    * unmap and, if required, split existent mappings.
> >    *
> >    * Drivers may use these callbacks to update the GPU VA space right a=
way within
> >    * the callback. In case the driver decides to copy and store the ope=
rations for
> > - * later processing neither this function nor &drm_gpuva_sm_map is all=
owed to be
> > - * called before the &drm_gpuva_manager's view of the GPU VA space was=
 updated
> > - * with the previous set of operations. To update the &drm_gpuva_manag=
er's view
> > + * later processing neither this function nor &drm_gpuvm_sm_map is all=
owed to be
> > + * called before the &drm_gpuvm's view of the GPU VA space was updated
> > + * with the previous set of operations. To update the &drm_gpuvm's vie=
w
> >    * of the GPU VA space drm_gpuva_insert(), drm_gpuva_destroy_locked()=
 and/or
> >    * drm_gpuva_destroy_unlocked() should be used.
> >    *
> > @@ -1350,24 +1350,24 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_map);
> >    * Returns: 0 on success or a negative error code
> >    */
> >   int
> > -drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
> > +drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
> >                  u64 req_addr, u64 req_range)
> >   {
> > -     const struct drm_gpuva_fn_ops *ops =3D mgr->ops;
> > +     const struct drm_gpuvm_ops *ops =3D gpuvm->ops;
> >
> >       if (unlikely(!(ops && ops->sm_step_remap &&
> >                      ops->sm_step_unmap)))
> >               return -EINVAL;
> >
> > -     return __drm_gpuva_sm_unmap(mgr, ops, priv,
> > +     return __drm_gpuvm_sm_unmap(gpuvm, ops, priv,
> >                                   req_addr, req_range);
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
> >
> >   static struct drm_gpuva_op *
> > -gpuva_op_alloc(struct drm_gpuva_manager *mgr)
> > +gpuva_op_alloc(struct drm_gpuvm *gpuvm)
> >   {
> > -     const struct drm_gpuva_fn_ops *fn =3D mgr->ops;
> > +     const struct drm_gpuvm_ops *fn =3D gpuvm->ops;
> >       struct drm_gpuva_op *op;
> >
> >       if (fn && fn->op_alloc)
> > @@ -1382,10 +1382,10 @@ gpuva_op_alloc(struct drm_gpuva_manager *mgr)
> >   }
> >
> >   static void
> > -gpuva_op_free(struct drm_gpuva_manager *mgr,
> > +gpuva_op_free(struct drm_gpuvm *gpuvm,
> >             struct drm_gpuva_op *op)
> >   {
> > -     const struct drm_gpuva_fn_ops *fn =3D mgr->ops;
> > +     const struct drm_gpuvm_ops *fn =3D gpuvm->ops;
> >
> >       if (fn && fn->op_free)
> >               fn->op_free(op);
> > @@ -1398,14 +1398,14 @@ drm_gpuva_sm_step(struct drm_gpuva_op *__op,
> >                 void *priv)
> >   {
> >       struct {
> > -             struct drm_gpuva_manager *mgr;
> > +             struct drm_gpuvm *vm;
> >               struct drm_gpuva_ops *ops;
> >       } *args =3D priv;
> > -     struct drm_gpuva_manager *mgr =3D args->mgr;
> > +     struct drm_gpuvm *gpuvm =3D args->vm;
> >       struct drm_gpuva_ops *ops =3D args->ops;
> >       struct drm_gpuva_op *op;
> >
> > -     op =3D gpuva_op_alloc(mgr);
> > +     op =3D gpuva_op_alloc(gpuvm);
> >       if (unlikely(!op))
> >               goto err;
> >
> > @@ -1444,20 +1444,20 @@ drm_gpuva_sm_step(struct drm_gpuva_op *__op,
> >   err_free_prev:
> >       kfree(op->remap.prev);
> >   err_free_op:
> > -     gpuva_op_free(mgr, op);
> > +     gpuva_op_free(gpuvm, op);
> >   err:
> >       return -ENOMEM;
> >   }
> >
> > -static const struct drm_gpuva_fn_ops gpuva_list_ops =3D {
> > +static const struct drm_gpuvm_ops gpuvm_list_ops =3D {
> >       .sm_step_map =3D drm_gpuva_sm_step,
> >       .sm_step_remap =3D drm_gpuva_sm_step,
> >       .sm_step_unmap =3D drm_gpuva_sm_step,
> >   };
> >
> >   /**
> > - * drm_gpuva_sm_map_ops_create() - creates the &drm_gpuva_ops to split=
 and merge
> > - * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split=
 and merge
> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> >    * @req_addr: the start address of the new mapping
> >    * @req_range: the range of the new mapping
> >    * @req_obj: the &drm_gem_object to map
> > @@ -1476,9 +1476,9 @@ static const struct drm_gpuva_fn_ops gpuva_list_o=
ps =3D {
> >    * map operation requested by the caller.
> >    *
> >    * Note that before calling this function again with another mapping =
request it
> > - * is necessary to update the &drm_gpuva_manager's view of the GPU VA =
space. The
> > + * is necessary to update the &drm_gpuvm's view of the GPU VA space. T=
he
> >    * previously obtained operations must be either processed or abandon=
ed. To
> > - * update the &drm_gpuva_manager's view of the GPU VA space drm_gpuva_=
insert(),
> > + * update the &drm_gpuvm's view of the GPU VA space drm_gpuva_insert()=
,
> >    * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() sho=
uld be
> >    * used.
> >    *
> > @@ -1488,13 +1488,13 @@ static const struct drm_gpuva_fn_ops gpuva_list=
_ops =3D {
> >    * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on=
 failure
> >    */
> >   struct drm_gpuva_ops *
> > -drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> >                           u64 req_addr, u64 req_range,
> >                           struct drm_gem_object *req_obj, u64 req_offse=
t)
> >   {
> >       struct drm_gpuva_ops *ops;
> >       struct {
> > -             struct drm_gpuva_manager *mgr;
> > +             struct drm_gpuvm *vm;
> >               struct drm_gpuva_ops *ops;
> >       } args;
> >       int ret;
> > @@ -1505,10 +1505,10 @@ drm_gpuva_sm_map_ops_create(struct drm_gpuva_ma=
nager *mgr,
> >
> >       INIT_LIST_HEAD(&ops->list);
> >
> > -     args.mgr =3D mgr;
> > +     args.vm =3D gpuvm;
> >       args.ops =3D ops;
> >
> > -     ret =3D __drm_gpuva_sm_map(mgr, &gpuva_list_ops, &args,
> > +     ret =3D __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
> >                                req_addr, req_range,
> >                                req_obj, req_offset);
> >       if (ret)
> > @@ -1517,15 +1517,15 @@ drm_gpuva_sm_map_ops_create(struct drm_gpuva_ma=
nager *mgr,
> >       return ops;
> >
> >   err_free_ops:
> > -     drm_gpuva_ops_free(mgr, ops);
> > +     drm_gpuva_ops_free(gpuvm, ops);
> >       return ERR_PTR(ret);
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_sm_map_ops_create);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_ops_create);
> >
> >   /**
> > - * drm_gpuva_sm_unmap_ops_create() - creates the &drm_gpuva_ops to spl=
it on
> > + * drm_gpuvm_sm_unmap_ops_create() - creates the &drm_gpuva_ops to spl=
it on
> >    * unmap
> > - * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> >    * @req_addr: the start address of the range to unmap
> >    * @req_range: the range of the mappings to unmap
> >    *
> > @@ -1540,9 +1540,9 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_map_ops_create);
> >    * remap operations.
> >    *
> >    * Note that before calling this function again with another range to=
 unmap it
> > - * is necessary to update the &drm_gpuva_manager's view of the GPU VA =
space. The
> > + * is necessary to update the &drm_gpuvm's view of the GPU VA space. T=
he
> >    * previously obtained operations must be processed or abandoned. To =
update the
> > - * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> > + * &drm_gpuvm's view of the GPU VA space drm_gpuva_insert(),
> >    * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() sho=
uld be
> >    * used.
> >    *
> > @@ -1552,12 +1552,12 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_map_ops_create);
> >    * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on=
 failure
> >    */
> >   struct drm_gpuva_ops *
> > -drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
> >                             u64 req_addr, u64 req_range)
> >   {
> >       struct drm_gpuva_ops *ops;
> >       struct {
> > -             struct drm_gpuva_manager *mgr;
> > +             struct drm_gpuvm *vm;
> >               struct drm_gpuva_ops *ops;
> >       } args;
> >       int ret;
> > @@ -1568,10 +1568,10 @@ drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_=
manager *mgr,
> >
> >       INIT_LIST_HEAD(&ops->list);
> >
> > -     args.mgr =3D mgr;
> > +     args.vm =3D gpuvm;
> >       args.ops =3D ops;
> >
> > -     ret =3D __drm_gpuva_sm_unmap(mgr, &gpuva_list_ops, &args,
> > +     ret =3D __drm_gpuvm_sm_unmap(gpuvm, &gpuvm_list_ops, &args,
> >                                  req_addr, req_range);
> >       if (ret)
> >               goto err_free_ops;
> > @@ -1579,14 +1579,14 @@ drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_=
manager *mgr,
> >       return ops;
> >
> >   err_free_ops:
> > -     drm_gpuva_ops_free(mgr, ops);
> > +     drm_gpuva_ops_free(gpuvm, ops);
> >       return ERR_PTR(ret);
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap_ops_create);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_ops_create);
> >
> >   /**
> > - * drm_gpuva_prefetch_ops_create() - creates the &drm_gpuva_ops to pre=
fetch
> > - * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * drm_gpuvm_prefetch_ops_create() - creates the &drm_gpuva_ops to pre=
fetch
> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> >    * @addr: the start address of the range to prefetch
> >    * @range: the range of the mappings to prefetch
> >    *
> > @@ -1603,7 +1603,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap_ops_create);
> >    * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on=
 failure
> >    */
> >   struct drm_gpuva_ops *
> > -drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
> >                             u64 addr, u64 range)
> >   {
> >       struct drm_gpuva_ops *ops;
> > @@ -1618,8 +1618,8 @@ drm_gpuva_prefetch_ops_create(struct drm_gpuva_ma=
nager *mgr,
> >
> >       INIT_LIST_HEAD(&ops->list);
> >
> > -     drm_gpuva_for_each_va_range(va, mgr, addr, end) {
> > -             op =3D gpuva_op_alloc(mgr);
> > +     drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
> > +             op =3D gpuva_op_alloc(gpuvm);
> >               if (!op) {
> >                       ret =3D -ENOMEM;
> >                       goto err_free_ops;
> > @@ -1633,14 +1633,14 @@ drm_gpuva_prefetch_ops_create(struct drm_gpuva_=
manager *mgr,
> >       return ops;
> >
> >   err_free_ops:
> > -     drm_gpuva_ops_free(mgr, ops);
> > +     drm_gpuva_ops_free(gpuvm, ops);
> >       return ERR_PTR(ret);
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_prefetch_ops_create);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
> >
> >   /**
> > - * drm_gpuva_gem_unmap_ops_create() - creates the &drm_gpuva_ops to un=
map a GEM
> > - * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * drm_gpuvm_gem_unmap_ops_create() - creates the &drm_gpuva_ops to un=
map a GEM
> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> >    * @obj: the &drm_gem_object to unmap
> >    *
> >    * This function creates a list of operations to perform unmapping fo=
r every
> > @@ -1658,7 +1658,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_prefetch_ops_create);
> >    * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on=
 failure
> >    */
> >   struct drm_gpuva_ops *
> > -drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
> >                              struct drm_gem_object *obj)
> >   {
> >       struct drm_gpuva_ops *ops;
> > @@ -1675,7 +1675,7 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_m=
anager *mgr,
> >       INIT_LIST_HEAD(&ops->list);
> >
> >       drm_gem_for_each_gpuva(va, obj) {
> > -             op =3D gpuva_op_alloc(mgr);
> > +             op =3D gpuva_op_alloc(gpuvm);
> >               if (!op) {
> >                       ret =3D -ENOMEM;
> >                       goto err_free_ops;
> > @@ -1689,21 +1689,21 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva=
_manager *mgr,
> >       return ops;
> >
> >   err_free_ops:
> > -     drm_gpuva_ops_free(mgr, ops);
> > +     drm_gpuva_ops_free(gpuvm, ops);
> >       return ERR_PTR(ret);
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuva_gem_unmap_ops_create);
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_gem_unmap_ops_create);
> >
> >   /**
> >    * drm_gpuva_ops_free() - free the given &drm_gpuva_ops
> > - * @mgr: the &drm_gpuva_manager the ops were created for
> > + * @gpuvm: the &drm_gpuvm the ops were created for
> >    * @ops: the &drm_gpuva_ops to free
> >    *
> >    * Frees the given &drm_gpuva_ops structure including all the ops ass=
ociated
> >    * with it.
> >    */
> >   void
> > -drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
> > +drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
> >                  struct drm_gpuva_ops *ops)
> >   {
> >       struct drm_gpuva_op *op, *next;
> > @@ -1717,7 +1717,7 @@ drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
> >                       kfree(op->remap.unmap);
> >               }
> >
> > -             gpuva_op_free(mgr, op);
> > +             gpuva_op_free(gpuvm, op);
> >       }
> >
> >       kfree(ops);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/n=
ouveau/nouveau_exec.c
> > index a90c4cd8cbb2..c001952cd678 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> > @@ -106,7 +106,7 @@ nouveau_exec_job_submit(struct nouveau_job *job)
> >       drm_exec_until_all_locked(exec) {
> >               struct drm_gpuva *va;
> >
> > -             drm_gpuva_for_each_va(va, &uvmm->umgr) {
> > +             drm_gpuvm_for_each_va(va, &uvmm->umgr) {
> >                       if (unlikely(va =3D=3D &uvmm->umgr.kernel_alloc_n=
ode))
> >                               continue;
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.c
> > index aae780e4a4aa..c750072cb268 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -444,7 +444,7 @@ op_map_prepare_unwind(struct nouveau_uvma *uvma)
> >   static void
> >   op_unmap_prepare_unwind(struct drm_gpuva *va)
> >   {
> > -     drm_gpuva_insert(va->mgr, va);
> > +     drm_gpuva_insert(va->vm, va);
> >   }
> >
> >   static void
> > @@ -1194,7 +1194,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *=
job)
> >                               goto unwind_continue;
> >                       }
> >
> > -                     op->ops =3D drm_gpuva_sm_unmap_ops_create(&uvmm->=
umgr,
> > +                     op->ops =3D drm_gpuvm_sm_unmap_ops_create(&uvmm->=
umgr,
> >                                                               op->va.ad=
dr,
> >                                                               op->va.ra=
nge);
> >                       if (IS_ERR(op->ops)) {
> > @@ -1240,7 +1240,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *=
job)
> >                               }
> >                       }
> >
> > -                     op->ops =3D drm_gpuva_sm_map_ops_create(&uvmm->um=
gr,
> > +                     op->ops =3D drm_gpuvm_sm_map_ops_create(&uvmm->um=
gr,
> >                                                             op->va.addr=
,
> >                                                             op->va.rang=
e,
> >                                                             op->gem.obj=
,
> > @@ -1264,7 +1264,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *=
job)
> >                       break;
> >               }
> >               case OP_UNMAP:
> > -                     op->ops =3D drm_gpuva_sm_unmap_ops_create(&uvmm->=
umgr,
> > +                     op->ops =3D drm_gpuvm_sm_unmap_ops_create(&uvmm->=
umgr,
> >                                                               op->va.ad=
dr,
> >                                                               op->va.ra=
nge);
> >                       if (IS_ERR(op->ops)) {
> > @@ -1836,11 +1836,11 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, st=
ruct nouveau_cli *cli,
> >       uvmm->kernel_managed_addr =3D kernel_managed_addr;
> >       uvmm->kernel_managed_size =3D kernel_managed_size;
> >
> > -     drm_gpuva_manager_init(&uvmm->umgr, cli->name,
> > -                            NOUVEAU_VA_SPACE_START,
> > -                            NOUVEAU_VA_SPACE_END,
> > -                            kernel_managed_addr, kernel_managed_size,
> > -                            NULL);
> > +     drm_gpuvm_init(&uvmm->umgr, cli->name,
> > +                    NOUVEAU_VA_SPACE_START,
> > +                    NOUVEAU_VA_SPACE_END,
> > +                    kernel_managed_addr, kernel_managed_size,
> > +                    NULL);
> >
> >       ret =3D nvif_vmm_ctor(&cli->mmu, "uvmm",
> >                           cli->vmm.vmm.object.oclass, RAW,
> > @@ -1855,7 +1855,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, stru=
ct nouveau_cli *cli,
> >       return 0;
> >
> >   out_free_gpuva_mgr:
> > -     drm_gpuva_manager_destroy(&uvmm->umgr);
> > +     drm_gpuvm_destroy(&uvmm->umgr);
> >   out_unlock:
> >       mutex_unlock(&cli->mutex);
> >       return ret;
> > @@ -1877,7 +1877,7 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
> >       wait_event(entity->job.wq, list_empty(&entity->job.list.head));
> >
> >       nouveau_uvmm_lock(uvmm);
> > -     drm_gpuva_for_each_va_safe(va, next, &uvmm->umgr) {
> > +     drm_gpuvm_for_each_va_safe(va, next, &uvmm->umgr) {
> >               struct nouveau_uvma *uvma =3D uvma_from_va(va);
> >               struct drm_gem_object *obj =3D va->gem.obj;
> >
> > @@ -1910,7 +1910,7 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
> >
> >       mutex_lock(&cli->mutex);
> >       nouveau_vmm_fini(&uvmm->vmm);
> > -     drm_gpuva_manager_destroy(&uvmm->umgr);
> > +     drm_gpuvm_destroy(&uvmm->umgr);
> >       mutex_unlock(&cli->mutex);
> >
> >       dma_resv_fini(&uvmm->resv);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.h
> > index fc7f6fd2a4e1..e96c9919d1bd 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> > @@ -3,13 +3,13 @@
> >   #ifndef __NOUVEAU_UVMM_H__
> >   #define __NOUVEAU_UVMM_H__
> >
> > -#include <drm/drm_gpuva_mgr.h>
> > +#include <drm/drm_gpuvm.h>
> >
> >   #include "nouveau_drv.h"
> >
> >   struct nouveau_uvmm {
> >       struct nouveau_vmm vmm;
> > -     struct drm_gpuva_manager umgr;
> > +     struct drm_gpuvm umgr;
> >       struct maple_tree region_mt;
> >       struct mutex mutex;
> >       struct dma_resv resv;
> > @@ -44,7 +44,7 @@ struct nouveau_uvma {
> >   #define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
> >   #define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
> >
> > -#define to_uvmm(x) uvmm_from_mgr((x)->va.mgr)
> > +#define to_uvmm(x) uvmm_from_mgr((x)->va.vm)
> >
> >   struct nouveau_uvmm_bind_job {
> >       struct nouveau_job base;
> > diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> > index 3bba169f9bae..cf06cee4343f 100644
> > --- a/include/drm/drm_debugfs.h
> > +++ b/include/drm/drm_debugfs.h
> > @@ -35,7 +35,7 @@
> >   #include <linux/types.h>
> >   #include <linux/seq_file.h>
> >
> > -#include <drm/drm_gpuva_mgr.h>
> > +#include <drm/drm_gpuvm.h>
> >
> >   /**
> >    * DRM_DEBUGFS_GPUVA_INFO - &drm_info_list entry to dump a GPU VA spa=
ce
> > @@ -152,7 +152,7 @@ void drm_debugfs_add_files(struct drm_device *dev,
> >                          const struct drm_debugfs_info *files, int coun=
t);
> >
> >   int drm_debugfs_gpuva_info(struct seq_file *m,
> > -                        struct drm_gpuva_manager *mgr);
> > +                        struct drm_gpuvm *gpuvm);
> >   #else
> >   static inline void drm_debugfs_create_files(const struct drm_info_lis=
t *files,
> >                                           int count, struct dentry *roo=
t,
> > @@ -177,7 +177,7 @@ static inline void drm_debugfs_add_files(struct drm=
_device *dev,
> >   {}
> >
> >   static inline int drm_debugfs_gpuva_info(struct seq_file *m,
> > -                                      struct drm_gpuva_manager *mgr)
> > +                                      struct drm_gpuvm *gpuvm)
> >   {
> >       return 0;
> >   }
> > diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuvm.h
> > similarity index 78%
> > rename from include/drm/drm_gpuva_mgr.h
> > rename to include/drm/drm_gpuvm.h
> > index ed8d50200cc3..0e802676e0a9 100644
> > --- a/include/drm/drm_gpuva_mgr.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -1,7 +1,7 @@
> >   /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > -#ifndef __DRM_GPUVA_MGR_H__
> > -#define __DRM_GPUVA_MGR_H__
> > +#ifndef __DRM_GPUVM_H__
> > +#define __DRM_GPUVM_H__
> >
> >   /*
> >    * Copyright (c) 2022 Red Hat.
> > @@ -31,8 +31,8 @@
> >
> >   #include <drm/drm_gem.h>
> >
> > -struct drm_gpuva_manager;
> > -struct drm_gpuva_fn_ops;
> > +struct drm_gpuvm;
> > +struct drm_gpuvm_ops;
> >
> >   /**
> >    * enum drm_gpuva_flags - flags for struct drm_gpuva
> > @@ -62,15 +62,15 @@ enum drm_gpuva_flags {
> >    * struct drm_gpuva - structure to track a GPU VA mapping
> >    *
> >    * This structure represents a GPU VA mapping and is associated with =
a
> > - * &drm_gpuva_manager.
> > + * &drm_gpuvm.
> >    *
> >    * Typically, this structure is embedded in bigger driver structures.
> >    */
> >   struct drm_gpuva {
> >       /**
> > -      * @mgr: the &drm_gpuva_manager this object is associated with
> > +      * @vm: the &drm_gpuvm this object is associated with
> >        */
> > -     struct drm_gpuva_manager *mgr;
> > +     struct drm_gpuvm *vm;
> >
> >       /**
> >        * @flags: the &drm_gpuva_flags for this mapping
> > @@ -137,20 +137,20 @@ struct drm_gpuva {
> >       } rb;
> >   };
> >
> > -int drm_gpuva_insert(struct drm_gpuva_manager *mgr, struct drm_gpuva *=
va);
> > +int drm_gpuva_insert(struct drm_gpuvm *gpuvm, struct drm_gpuva *va);
> >   void drm_gpuva_remove(struct drm_gpuva *va);
> >
> >   void drm_gpuva_link(struct drm_gpuva *va);
> >   void drm_gpuva_unlink(struct drm_gpuva *va);
> >
> > -struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > +struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
> >                                u64 addr, u64 range);
> > -struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> > +struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
> >                                      u64 addr, u64 range);
> > -struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u=
64 start);
> > -struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u=
64 end);
> > +struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 sta=
rt);
> > +struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end=
);
> >
> > -bool drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr,=
 u64 range);
> > +bool drm_gpuva_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 r=
ange);
> >
> >   static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64=
 range,
> >                                 struct drm_gem_object *obj, u64 offset)
> > @@ -186,7 +186,7 @@ static inline bool drm_gpuva_invalidated(struct drm=
_gpuva *va)
> >   }
> >
> >   /**
> > - * struct drm_gpuva_manager - DRM GPU VA Manager
> > + * struct drm_gpuvm - DRM GPU VA Manager
> >    *
> >    * The DRM GPU VA Manager keeps track of a GPU's virtual address spac=
e by using
> >    * &maple_tree structures. Typically, this structure is embedded in b=
igger
> > @@ -197,7 +197,7 @@ static inline bool drm_gpuva_invalidated(struct drm=
_gpuva *va)
> >    *
> >    * There should be one manager instance per GPU virtual address space=
.
> >    */
> > -struct drm_gpuva_manager {
> > +struct drm_gpuvm {
> >       /**
> >        * @name: the name of the DRM GPU VA space
> >        */
> > @@ -237,100 +237,99 @@ struct drm_gpuva_manager {
> >       struct drm_gpuva kernel_alloc_node;
> >
> >       /**
> > -      * @ops: &drm_gpuva_fn_ops providing the split/merge steps to dri=
vers
> > +      * @ops: &drm_gpuvm_ops providing the split/merge steps to driver=
s
> >        */
> > -     const struct drm_gpuva_fn_ops *ops;
> > +     const struct drm_gpuvm_ops *ops;
> >   };
> >
> > -void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> > -                         const char *name,
> > -                         u64 start_offset, u64 range,
> > -                         u64 reserve_offset, u64 reserve_range,
> > -                         const struct drm_gpuva_fn_ops *ops);
> > -void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
> > +void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> > +                 u64 start_offset, u64 range,
> > +                 u64 reserve_offset, u64 reserve_range,
> > +                 const struct drm_gpuvm_ops *ops);
> > +void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> >
> >   static inline struct drm_gpuva *
> >   __drm_gpuva_next(struct drm_gpuva *va)
> >   {
> > -     if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
> > +     if (va && !list_is_last(&va->rb.entry, &va->vm->rb.list))
> >               return list_next_entry(va, rb.entry);
> >
> >       return NULL;
> >   }
> >
> >   /**
> > - * drm_gpuva_for_each_va_range() - iterate over a range of &drm_gpuvas
> > + * drm_gpuvm_for_each_va_range() - iterate over a range of &drm_gpuvas
> >    * @va__: &drm_gpuva structure to assign to in each iteration step
> > - * @mgr__: &drm_gpuva_manager to walk over
> > + * @gpuvm__: &drm_gpuvm to walk over
> >    * @start__: starting offset, the first gpuva will overlap this
> >    * @end__: ending offset, the last gpuva will start before this (but =
may
> >    * overlap)
> >    *
> > - * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager =
that lie
> > + * This iterator walks over all &drm_gpuvas in the &drm_gpuvm that lie
> >    * between @start__ and @end__. It is implemented similarly to list_f=
or_each(),
> > - * but is using the &drm_gpuva_manager's internal interval tree to acc=
elerate
> > + * but is using the &drm_gpuvm's internal interval tree to accelerate
> >    * the search for the starting &drm_gpuva, and hence isn't safe again=
st removal
> >    * of elements. It assumes that @end__ is within (or is the upper lim=
it of) the
> > - * &drm_gpuva_manager. This iterator does not skip over the &drm_gpuva=
_manager's
> > + * &drm_gpuvm. This iterator does not skip over the &drm_gpuvm's
> >    * @kernel_alloc_node.
> >    */
> > -#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
> > -     for (va__ =3D drm_gpuva_find_first((mgr__), (start__), (end__) - =
(start__)); \
> > +#define drm_gpuvm_for_each_va_range(va__, gpuvm__, start__, end__) \
> > +     for (va__ =3D drm_gpuva_find_first((gpuvm__), (start__), (end__) =
- (start__)); \
> >            va__ && (va__->va.addr < (end__)); \
> >            va__ =3D __drm_gpuva_next(va__))
> >
> >   /**
> > - * drm_gpuva_for_each_va_range_safe() - safely iterate over a range of
> > + * drm_gpuvm_for_each_va_range_safe() - safely iterate over a range of
> >    * &drm_gpuvas
> >    * @va__: &drm_gpuva to assign to in each iteration step
> >    * @next__: another &drm_gpuva to use as temporary storage
> > - * @mgr__: &drm_gpuva_manager to walk over
> > + * @gpuvm__: &drm_gpuvm to walk over
> >    * @start__: starting offset, the first gpuva will overlap this
> >    * @end__: ending offset, the last gpuva will start before this (but =
may
> >    * overlap)
> >    *
> > - * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager =
that lie
> > + * This iterator walks over all &drm_gpuvas in the &drm_gpuvm that lie
> >    * between @start__ and @end__. It is implemented similarly to
> > - * list_for_each_safe(), but is using the &drm_gpuva_manager's interna=
l interval
> > + * list_for_each_safe(), but is using the &drm_gpuvm's internal interv=
al
> >    * tree to accelerate the search for the starting &drm_gpuva, and hen=
ce is safe
> >    * against removal of elements. It assumes that @end__ is within (or =
is the
> > - * upper limit of) the &drm_gpuva_manager. This iterator does not skip=
 over the
> > - * &drm_gpuva_manager's @kernel_alloc_node.
> > + * upper limit of) the &drm_gpuvm. This iterator does not skip over th=
e
> > + * &drm_gpuvm's @kernel_alloc_node.
> >    */
> > -#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__,=
 end__) \
> > -     for (va__ =3D drm_gpuva_find_first((mgr__), (start__), (end__) - =
(start__)), \
> > +#define drm_gpuvm_for_each_va_range_safe(va__, next__, gpuvm__, start_=
_, end__) \
> > +     for (va__ =3D drm_gpuva_find_first((gpuvm__), (start__), (end__) =
- (start__)), \
> >            next__ =3D __drm_gpuva_next(va__); \
> >            va__ && (va__->va.addr < (end__)); \
> >            va__ =3D next__, next__ =3D __drm_gpuva_next(va__))
> >
> >   /**
> > - * drm_gpuva_for_each_va() - iterate over all &drm_gpuvas
> > + * drm_gpuvm_for_each_va() - iterate over all &drm_gpuvas
> >    * @va__: &drm_gpuva to assign to in each iteration step
> > - * @mgr__: &drm_gpuva_manager to walk over
> > + * @gpuvm__: &drm_gpuvm to walk over
> >    *
> >    * This iterator walks over all &drm_gpuva structures associated with=
 the given
> > - * &drm_gpuva_manager.
> > + * &drm_gpuvm.
> >    */
> > -#define drm_gpuva_for_each_va(va__, mgr__) \
> > -     list_for_each_entry(va__, &(mgr__)->rb.list, rb.entry)
> > +#define drm_gpuvm_for_each_va(va__, gpuvm__) \
> > +     list_for_each_entry(va__, &(gpuvm__)->rb.list, rb.entry)
> >
> >   /**
> > - * drm_gpuva_for_each_va_safe() - safely iterate over all &drm_gpuvas
> > + * drm_gpuvm_for_each_va_safe() - safely iterate over all &drm_gpuvas
> >    * @va__: &drm_gpuva to assign to in each iteration step
> >    * @next__: another &drm_gpuva to use as temporary storage
> > - * @mgr__: &drm_gpuva_manager to walk over
> > + * @gpuvm__: &drm_gpuvm to walk over
> >    *
> >    * This iterator walks over all &drm_gpuva structures associated with=
 the given
> > - * &drm_gpuva_manager. It is implemented with list_for_each_entry_safe=
(), and
> > + * &drm_gpuvm. It is implemented with list_for_each_entry_safe(), and
> >    * hence safe against the removal of elements.
> >    */
> > -#define drm_gpuva_for_each_va_safe(va__, next__, mgr__) \
> > -     list_for_each_entry_safe(va__, next__, &(mgr__)->rb.list, rb.entr=
y)
> > +#define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
> > +     list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.en=
try)
> >
> >   /**
> >    * enum drm_gpuva_op_type - GPU VA operation type
> >    *
> > - * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_m=
anager.
> > + * Operations to alter the GPU VA mappings tracked by the &drm_gpuvm.
> >    */
> >   enum drm_gpuva_op_type {
> >       /**
> > @@ -413,7 +412,7 @@ struct drm_gpuva_op_unmap {
> >        *
> >        * Optionally, if &keep is set, drivers may keep the actual page =
table
> >        * mappings for this &drm_gpuva, adding the missing page table en=
tries
> > -      * only and update the &drm_gpuva_manager accordingly.
> > +      * only and update the &drm_gpuvm accordingly.
> >        */
> >       bool keep;
> >   };
> > @@ -584,22 +583,22 @@ struct drm_gpuva_ops {
> >   #define drm_gpuva_next_op(op) list_next_entry(op, entry)
> >
> >   struct drm_gpuva_ops *
> > -drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> >                           u64 addr, u64 range,
> >                           struct drm_gem_object *obj, u64 offset);
> >   struct drm_gpuva_ops *
> > -drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
> >                             u64 addr, u64 range);
> >
> >   struct drm_gpuva_ops *
> > -drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
> >                                u64 addr, u64 range);
> >
> >   struct drm_gpuva_ops *
> > -drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
> >                              struct drm_gem_object *obj);
> >
> > -void drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
> > +void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
> >                       struct drm_gpuva_ops *ops);
> >
> >   static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
> > @@ -610,15 +609,15 @@ static inline void drm_gpuva_init_from_op(struct =
drm_gpuva *va,
> >   }
> >
> >   /**
> > - * struct drm_gpuva_fn_ops - callbacks for split/merge steps
> > + * struct drm_gpuvm_ops - callbacks for split/merge steps
> >    *
> > - * This structure defines the callbacks used by &drm_gpuva_sm_map and
> > - * &drm_gpuva_sm_unmap to provide the split/merge steps for map and un=
map
> > + * This structure defines the callbacks used by &drm_gpuvm_sm_map and
> > + * &drm_gpuvm_sm_unmap to provide the split/merge steps for map and un=
map
> >    * operations to drivers.
> >    */
> > -struct drm_gpuva_fn_ops {
> > +struct drm_gpuvm_ops {
> >       /**
> > -      * @op_alloc: called when the &drm_gpuva_manager allocates
> > +      * @op_alloc: called when the &drm_gpuvm allocates
> >        * a struct drm_gpuva_op
> >        *
> >        * Some drivers may want to embed struct drm_gpuva_op into driver
> > @@ -630,7 +629,7 @@ struct drm_gpuva_fn_ops {
> >       struct drm_gpuva_op *(*op_alloc)(void);
> >
> >       /**
> > -      * @op_free: called when the &drm_gpuva_manager frees a
> > +      * @op_free: called when the &drm_gpuvm frees a
> >        * struct drm_gpuva_op
> >        *
> >        * Some drivers may want to embed struct drm_gpuva_op into driver
> > @@ -642,19 +641,19 @@ struct drm_gpuva_fn_ops {
> >       void (*op_free)(struct drm_gpuva_op *op);
> >
> >       /**
> > -      * @sm_step_map: called from &drm_gpuva_sm_map to finally insert =
the
> > +      * @sm_step_map: called from &drm_gpuvm_sm_map to finally insert =
the
> >        * mapping once all previous steps were completed
> >        *
> >        * The &priv pointer matches the one the driver passed to
> > -      * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> > +      * &drm_gpuvm_sm_map or &drm_gpuvm_sm_unmap, respectively.
> >        *
> > -      * Can be NULL if &drm_gpuva_sm_map is used.
> > +      * Can be NULL if &drm_gpuvm_sm_map is used.
> >        */
> >       int (*sm_step_map)(struct drm_gpuva_op *op, void *priv);
> >
> >       /**
> > -      * @sm_step_remap: called from &drm_gpuva_sm_map and
> > -      * &drm_gpuva_sm_unmap to split up an existent mapping
> > +      * @sm_step_remap: called from &drm_gpuvm_sm_map and
> > +      * &drm_gpuvm_sm_unmap to split up an existent mapping
> >        *
> >        * This callback is called when existent mapping needs to be spli=
t up.
> >        * This is the case when either a newly requested mapping overlap=
s or
> > @@ -662,38 +661,38 @@ struct drm_gpuva_fn_ops {
> >        * mapping is requested.
> >        *
> >        * The &priv pointer matches the one the driver passed to
> > -      * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> > +      * &drm_gpuvm_sm_map or &drm_gpuvm_sm_unmap, respectively.
> >        *
> > -      * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unm=
ap is
> > +      * Can be NULL if neither &drm_gpuvm_sm_map nor &drm_gpuvm_sm_unm=
ap is
> >        * used.
> >        */
> >       int (*sm_step_remap)(struct drm_gpuva_op *op, void *priv);
> >
> >       /**
> > -      * @sm_step_unmap: called from &drm_gpuva_sm_map and
> > -      * &drm_gpuva_sm_unmap to unmap an existent mapping
> > +      * @sm_step_unmap: called from &drm_gpuvm_sm_map and
> > +      * &drm_gpuvm_sm_unmap to unmap an existent mapping
> >        *
> >        * This callback is called when existent mapping needs to be unma=
pped.
> >        * This is the case when either a newly requested mapping enclose=
s an
> >        * existent mapping or an unmap of an existent mapping is request=
ed.
> >        *
> >        * The &priv pointer matches the one the driver passed to
> > -      * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> > +      * &drm_gpuvm_sm_map or &drm_gpuvm_sm_unmap, respectively.
> >        *
> > -      * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unm=
ap is
> > +      * Can be NULL if neither &drm_gpuvm_sm_map nor &drm_gpuvm_sm_unm=
ap is
> >        * used.
> >        */
> >       int (*sm_step_unmap)(struct drm_gpuva_op *op, void *priv);
> >   };
> >
> > -int drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
> > +int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> >                    u64 addr, u64 range,
> >                    struct drm_gem_object *obj, u64 offset);
> >
> > -int drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
> > +int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
> >                      u64 addr, u64 range);
> >
> > -void drm_gpuva_map(struct drm_gpuva_manager *mgr,
> > +void drm_gpuva_map(struct drm_gpuvm *gpuvm,
> >                  struct drm_gpuva *va,
> >                  struct drm_gpuva_op_map *op);
> >
> > @@ -703,4 +702,4 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
> >
> >   void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
> >
> > -#endif /* __DRM_GPUVA_MGR_H__ */
> > +#endif /* __DRM_GPUVM_H__ */
>
