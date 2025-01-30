Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1ABA2321C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4302510E9B8;
	Thu, 30 Jan 2025 16:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbM0LZJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF7E10E9B8;
 Thu, 30 Jan 2025 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738255308; x=1769791308;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZOcZjPDHrx5Kewu+B2tSlPly+XtuDtOkawew0pS5KV0=;
 b=kbM0LZJtqm7dn6wvlARJxVxCFv/vzUmRLfxZl6y1sht3sy0vd1OtEZn+
 Q+uZUfoFRusBfeDSddXeMuPV96CaGkIFPqk7/03BbHGSKa2uM+73GJ5ot
 ikUhNj2XqpPz8C68+tMlcTX5KHdTUot5v/wEUPK7n2NRLf7bTxFBC6STW
 ytJGg7eQP8fiIvbuTF2tw5yJFnxnVDELJk1AiSjGH0gzgLswSZpfRSPRn
 M27rylviR+VtG2sCBA6yW1O8glYioxjEHzHBQ/V7tI4bf7MGOx4Jd/i/m
 DRBwlkera3BCZuSlvoM57r6ROC+6FA0fMjyRUd8nGXSHEe0CLobllEXj9 w==;
X-CSE-ConnectionGUID: yEwkh72UQwGFHEvTSNSU5g==
X-CSE-MsgGUID: EpumK2KSRM2yvtJC+SiDZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38012015"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38012015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:41:47 -0800
X-CSE-ConnectionGUID: co4L3dWDSUmTnIGn+tUwdA==
X-CSE-MsgGUID: NolTECOvRnOV2M6UXK3kyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="140272230"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.79])
 ([10.245.246.79])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:41:45 -0800
Message-ID: <86bea5df89c11ed7a64fea44755b4233cc861cbc.camel@linux.intel.com>
Subject: Re: [PATCH v4 28/33] drm/xe: Add SVM VRAM migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Thu, 30 Jan 2025 17:41:42 +0100
In-Reply-To: <Z5uprTtHJqOsn0EB@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-29-matthew.brost@intel.com>
 <01d5d109-aef5-463f-9475-22c2483501a3@intel.com>
 <Z5uprTtHJqOsn0EB@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-01-30 at 08:32 -0800, Matthew Brost wrote:
> On Thu, Jan 30, 2025 at 02:22:55PM +0000, Matthew Auld wrote:
> > On 29/01/2025 19:52, Matthew Brost wrote:
> > > Migration is implemented with range granularity, with VRAM
> > > backing being
> > > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime
> > > of the
> > > TTM BO is limited to when the SVM range is in VRAM (i.e., when a
> > > VRAM
> > > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > >=20
> > > The design choice for using TTM BO for VRAM backing store, as
> > > opposed to
> > > direct buddy allocation, is as follows:
> > >=20
> > > - DRM buddy allocations are not at page granularity, offering no
> > > =C2=A0=C2=A0 advantage over a BO.
> > > - Unified eviction is required (SVM VRAM and TTM BOs need to be
> > > able to
> > > =C2=A0=C2=A0 evict each other).
> > > - For exhaustive eviction [1], SVM VRAM allocations will almost
> > > certainly
> > > =C2=A0=C2=A0 require a dma-resv.
> > > - Likely allocation size is 2M which makes of size of BO (872)
> > > =C2=A0=C2=A0 acceptable per allocation (872 / 2M =3D=3D .0004158).
> > >=20
> > > With this, using TTM BO for VRAM backing store seems to be an
> > > obvious
> > > choice as it allows leveraging of the TTM eviction code.
> > >=20
> > > Current migration policy is migrate any SVM range greater than or
> > > equal
> > > to 64k once.
> > >=20
> > > [1] https://patchwork.freedesktop.org/series/133643/
> > >=20
> > > v2:
> > > =C2=A0 - Rebase on latest GPU SVM
> > > =C2=A0 - Retry page fault on get pages returning mixed allocation
> > > =C2=A0 - Use drm_gpusvm_devmem
> > > v3:
> > > =C2=A0 - Use new BO flags
> > > =C2=A0 - New range structure (Thomas)
> > > =C2=A0 - Hide migration behind Kconfig
> > > =C2=A0 - Kernel doc (Thomas)
> > > =C2=A0 - Use check_pages_threshold
> > > v4:
> > > =C2=A0 - Don't evict partial unmaps in garbage collector (Thomas)
> > > =C2=A0 - Use %pe to print errors (Thomas)
> > > =C2=A0 - Use %p to print pointers (Thomas)
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_svm.c | 99
> > > +++++++++++++++++++++++++++++++++++--
> > > =C2=A0 drivers/gpu/drm/xe/xe_svm.h |=C2=A0 5 ++
> > > =C2=A0 2 files changed, 100 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index ba1db030bf33..fc030855d078 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -502,7 +502,6 @@ static int xe_svm_populate_devmem_pfn(struct
> > > drm_gpusvm_devmem *devmem_allocatio
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0 }
> > > -__maybe_unused
> > > =C2=A0 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =
=3D {
> > > =C2=A0=C2=A0	.devmem_release =3D xe_svm_devmem_release,
> > > =C2=A0=C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> > > @@ -582,6 +581,64 @@ static bool xe_svm_range_is_valid(struct
> > > xe_svm_range *range,
> > > =C2=A0=C2=A0	return (range->tile_present & ~range->tile_invalidated)
> > > & BIT(tile->id);
> > > =C2=A0 }
> > > +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> > > +{
> > > +	return &tile->mem.vram;
> > > +}
> > > +
> > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> > > xe_tile *tile,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range
> > > *range,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_gpusvm_ctx *ctx)
> > > +{
> > > +	struct xe_mem_region *mr =3D tile_to_mr(tile);
> > > +	struct drm_buddy_block *block;
> > > +	struct list_head *blocks;
> > > +	struct xe_bo *bo;
> > > +	ktime_t end =3D 0;
> > > +	int err;
> > > +
> > > +retry:
> > > +	xe_vm_lock(vm, false);
> > > +	bo =3D xe_bo_create(tile_to_xe(tile), tile, vm, range-
> > > >base.itree.last + 1 -
> > > +			=C2=A0 range->base.itree.start,
> > > ttm_bo_type_device,
> > > +			=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > +			=C2=A0 XE_BO_FLAG_CPU_ADDR_MIRROR);
> > > +	xe_vm_unlock(vm);
> >=20
> > What was the trick again to ensure eviction is not triggered at
> > this point?
> > I thought there was some trick with eviction_valuable() but I can't
> > find it.
> >=20
>=20
> I dropped that given the hacky nature of how it was implemented. Yes,
> it
> is possible that we allocate VRAM and it is immediately evicted
> before
> the bind occurs but in practice should never really happen given this
> BO
> should be the last entry on the LRU list. Even if this happens, I
> believe this is harmless given the bind will abort and trigger a
> retry.

It might be worth mentioning that in the multidevice series, we create
an external bo and hold on to the lock until the struct mm_struct is
populated with the underlying pages. After that, but before populating
the gpu_vm, eviction can happen. But since now the cpu page-table is
populated, that would trigger a notifier callback and a seqno update
and as Matt says, the bind will be aborted and retried.

/Thomas


>=20
> Matt
>=20
> > > +	if (IS_ERR(bo)) {
> > > +		err =3D PTR_ERR(bo);
> > > +		if (xe_vm_validate_should_retry(NULL, err,
> > > &end))
> > > +			goto retry;
> > > +		return bo;
> > > +	}
> > > +
> > > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->xe->drm.dev, vm-
> > > >svm.gpusvm.mm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_devmem_ops,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tile->mem.vram.dpagemap,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.itree.last + 1 -
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.itree.start);
> > > +
> > > +	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > > >blocks;
> > > +	list_for_each_entry(block, blocks, link)
> > > +		block->private =3D mr;
> > > +
> > > +	/*
> > > +	 * Take ref because as soon as
> > > drm_gpusvm_migrate_to_devmem succeeds the
> > > +	 * creation ref can be dropped upon CPU fault or unmap.
> > > +	 */
> > > +	xe_bo_get(bo);
> > > +
> > > +	err =3D drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > > &range->base,
> > > +					=C2=A0=C2=A0 &bo-
> > > >devmem_allocation, ctx);
> > > +	if (err) {
> > > +		xe_bo_put(bo);	/* Local ref */
> > > +		xe_bo_put(bo);	/* Creation ref */
> > > +		return ERR_PTR(err);
> > > +	}
> > > +
> > > +	return bo;
> > > +}
> > > +
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * xe_svm_handle_pagefault() - SVM handle page fault
> > > =C2=A0=C2=A0 * @vm: The VM.
> > > @@ -590,7 +647,8 @@ static bool xe_svm_range_is_valid(struct
> > > xe_svm_range *range,
> > > =C2=A0=C2=A0 * @fault_addr: The GPU fault address.
> > > =C2=A0=C2=A0 * @atomic: The fault atomic access bit.
> > > =C2=A0=C2=A0 *
> > > - * Create GPU bindings for a SVM page fault.
> > > + * Create GPU bindings for a SVM page fault. Optionally migrate
> > > to device
> > > + * memory.
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Return: 0 on success, negative error code on error.
> > > =C2=A0=C2=A0 */
> > > @@ -598,11 +656,18 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm, struct xe_vma *vma,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64
> > > fault_addr,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic)
> > > =C2=A0 {
> > > -	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> > > xe_vma_read_only(vma), };
> > > +	struct drm_gpusvm_ctx ctx =3D {
> > > +		.read_only =3D xe_vma_read_only(vma),
> > > +		.devmem_possible =3D IS_DGFX(vm->xe) &&
> > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > +		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > ? SZ_64K : 0,
> > > +	};
> > > =C2=A0=C2=A0	struct xe_svm_range *range;
> > > =C2=A0=C2=A0	struct drm_gpusvm_range *r;
> > > =C2=A0=C2=A0	struct drm_exec exec;
> > > =C2=A0=C2=A0	struct dma_fence *fence;
> > > +	struct xe_bo *bo =3D NULL;
> > > =C2=A0=C2=A0	ktime_t end =3D 0;
> > > =C2=A0=C2=A0	int err;
> > > @@ -610,6 +675,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > > =C2=A0=C2=A0	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> > > =C2=A0 retry:
> > > +	xe_bo_put(bo);
> > > +	bo =3D NULL;
> > > +
> > > =C2=A0=C2=A0	/* Always process UNMAPs first so view SVM ranges is
> > > current */
> > > =C2=A0=C2=A0	err =3D xe_svm_garbage_collector(vm);
> > > =C2=A0=C2=A0	if (err)
> > > @@ -625,9 +693,31 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm, struct xe_vma *vma,
> > > =C2=A0=C2=A0	if (xe_svm_range_is_valid(range, tile))
> > > =C2=A0=C2=A0		return 0;
> > > +	/* XXX: Add migration policy, for now migrate range once
> > > */
> > > +	if (!range->migrated && range->base.flags.migrate_devmem
> > > &&
> > > +	=C2=A0=C2=A0=C2=A0 (range->base.itree.last + 1 - range-
> > > >base.itree.start) >=3D SZ_64K) {
> > > +		range->migrated =3D true;
> > > +
> > > +		bo =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > +		if (IS_ERR(bo)) {
> > > +			drm_info(&vm->xe->drm,
> > > +				 "VRAM allocation failed,
> > > falling back to retrying, asid=3D%u, errno %pe\n",
> > > +				 vm->usm.asid, bo);
> > > +			bo =3D NULL;
> > > +			goto retry;
> > > +		}
> > > +	}
> > > +
> > > =C2=A0=C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > &ctx);
> > > -	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where
> > > CPU mappings have changed */
> > > +	/* Corner where CPU mappings have changed */
> > > +	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -
> > > EPERM) {
> > > +		if (err =3D=3D -EOPNOTSUPP)
> > > +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > > &range->base);
> > > +		drm_info(&vm->xe->drm,
> > > +			 "Get pages failed, falling back to
> > > retrying, asid=3D%u, gpusvm=3D%p, errno %pe\n",
> > > +			 vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > > =C2=A0=C2=A0		goto retry;
> > > +	}
> > > =C2=A0=C2=A0	if (err)
> > > =C2=A0=C2=A0		goto err_out;
> > > @@ -658,6 +748,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > > =C2=A0=C2=A0	dma_fence_put(fence);
> > > =C2=A0 err_out:
> > > +	xe_bo_put(bo);
> > > =C2=A0=C2=A0	return err;
> > > =C2=A0 }
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > index 63daffdfdbf6..4c2576162c39 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -35,6 +35,11 @@ struct xe_svm_range {
> > > =C2=A0=C2=A0	 * range. Protected by GPU SVM notifier lock.
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	u8 tile_invalidated;
> > > +	/**
> > > +	 * @migrated: Range has been migrated to device memory,
> > > protected by
> > > +	 * GPU fault handler locking.
> > > +	 */
> > > +	u8 migrated	:1;
> > > =C2=A0 };
> > > =C2=A0 int xe_devm_add(struct xe_tile *tile, struct xe_mem_region
> > > *mr);
> >=20

