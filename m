Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826CA23423
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 19:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E94410E9BC;
	Thu, 30 Jan 2025 18:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIHaMela";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BD510E07B;
 Thu, 30 Jan 2025 18:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738263115; x=1769799115;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ovJ4yogCjzkhO6ZSe4eVeVmmbpkQzsXl/Ec9i4MtSSk=;
 b=BIHaMela503+4L/nIUoK/Ng7q2IIjtl9GES8kgV0+y7RcHk5tF76IZRw
 mRmttQ+D+7Y2NchLKcgwZh1GtYDR7qjPRIcSJ02cq9idGiqPoGRL2qc5a
 dv+yfOCx24NKWL++Mjfj//8QCwRmFhXq2J1qqmIg5fxBcd4LOx4qeiqLl
 o49MOPDmbc4c8bt5F+2Zsm36zzJo56Ce1WmTdRvqOIC+peHfJFbcd8sNz
 xNTNiJPseue4fIMk/OXPqqN/XKOu8lS1mb3rXFp+GpL63qFYHH84N8wya
 BcfBIMRchXvoS7SVxe7U7F7JA0E0I8+d2Smg95Pace5iwWYECUJGT5frt A==;
X-CSE-ConnectionGUID: Aa8T+LkET5meP88XI1zhew==
X-CSE-MsgGUID: 2NcPRk8/R7a9YTH8JOwZiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38928625"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38928625"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 10:51:55 -0800
X-CSE-ConnectionGUID: hAWcMW9HRTSpsKBfho/ucw==
X-CSE-MsgGUID: RP32p/eMSaei3WRb6XJxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132685016"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.79])
 ([10.245.246.79])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 10:51:51 -0800
Message-ID: <f914f280031adb68dec28e61badf9033da2bfd64.camel@linux.intel.com>
Subject: Re: [PATCH v4 28/33] drm/xe: Add SVM VRAM migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Thu, 30 Jan 2025 19:51:49 +0100
In-Reply-To: <Z5u3YyxWSGvDONl5@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-29-matthew.brost@intel.com>
 <01d5d109-aef5-463f-9475-22c2483501a3@intel.com>
 <Z5uprTtHJqOsn0EB@lstrano-desk.jf.intel.com>
 <93473543-9536-46f2-aabb-ee5e4dca60cc@intel.com>
 <Z5u3YyxWSGvDONl5@lstrano-desk.jf.intel.com>
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

On Thu, 2025-01-30 at 09:31 -0800, Matthew Brost wrote:
> On Thu, Jan 30, 2025 at 04:56:39PM +0000, Matthew Auld wrote:
> > On 30/01/2025 16:32, Matthew Brost wrote:
> > > On Thu, Jan 30, 2025 at 02:22:55PM +0000, Matthew Auld wrote:
> > > > On 29/01/2025 19:52, Matthew Brost wrote:
> > > > > Migration is implemented with range granularity, with VRAM
> > > > > backing being
> > > > > a VM private TTM BO (i.e., shares dma-resv with VM). The
> > > > > lifetime of the
> > > > > TTM BO is limited to when the SVM range is in VRAM (i.e.,
> > > > > when a VRAM
> > > > > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > > > >=20
> > > > > The design choice for using TTM BO for VRAM backing store, as
> > > > > opposed to
> > > > > direct buddy allocation, is as follows:
> > > > >=20
> > > > > - DRM buddy allocations are not at page granularity, offering
> > > > > no
> > > > > =C2=A0=C2=A0=C2=A0 advantage over a BO.
> > > > > - Unified eviction is required (SVM VRAM and TTM BOs need to
> > > > > be able to
> > > > > =C2=A0=C2=A0=C2=A0 evict each other).
> > > > > - For exhaustive eviction [1], SVM VRAM allocations will
> > > > > almost certainly
> > > > > =C2=A0=C2=A0=C2=A0 require a dma-resv.
> > > > > - Likely allocation size is 2M which makes of size of BO
> > > > > (872)
> > > > > =C2=A0=C2=A0=C2=A0 acceptable per allocation (872 / 2M =3D=3D .00=
04158).
> > > > >=20
> > > > > With this, using TTM BO for VRAM backing store seems to be an
> > > > > obvious
> > > > > choice as it allows leveraging of the TTM eviction code.
> > > > >=20
> > > > > Current migration policy is migrate any SVM range greater
> > > > > than or equal
> > > > > to 64k once.
> > > > >=20
> > > > > [1] https://patchwork.freedesktop.org/series/133643/
> > > > >=20
> > > > > v2:
> > > > > =C2=A0=C2=A0 - Rebase on latest GPU SVM
> > > > > =C2=A0=C2=A0 - Retry page fault on get pages returning mixed allo=
cation
> > > > > =C2=A0=C2=A0 - Use drm_gpusvm_devmem
> > > > > v3:
> > > > > =C2=A0=C2=A0 - Use new BO flags
> > > > > =C2=A0=C2=A0 - New range structure (Thomas)
> > > > > =C2=A0=C2=A0 - Hide migration behind Kconfig
> > > > > =C2=A0=C2=A0 - Kernel doc (Thomas)
> > > > > =C2=A0=C2=A0 - Use check_pages_threshold
> > > > > v4:
> > > > > =C2=A0=C2=A0 - Don't evict partial unmaps in garbage collector (T=
homas)
> > > > > =C2=A0=C2=A0 - Use %pe to print errors (Thomas)
> > > > > =C2=A0=C2=A0 - Use %p to print pointers (Thomas)
> > > > >=20
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_svm.c | 99
> > > > > +++++++++++++++++++++++++++++++++++--
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_svm.h |=C2=A0 5 ++
> > > > > =C2=A0=C2=A0 2 files changed, 100 insertions(+), 4 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > index ba1db030bf33..fc030855d078 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > @@ -502,7 +502,6 @@ static int
> > > > > xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem
> > > > > *devmem_allocatio
> > > > > =C2=A0=C2=A0=C2=A0	return 0;
> > > > > =C2=A0=C2=A0 }
> > > > > -__maybe_unused
> > > > > =C2=A0=C2=A0 static const struct drm_gpusvm_devmem_ops
> > > > > gpusvm_devmem_ops =3D {
> > > > > =C2=A0=C2=A0=C2=A0	.devmem_release =3D xe_svm_devmem_release,
> > > > > =C2=A0=C2=A0=C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devme=
m_pfn,
> > > > > @@ -582,6 +581,64 @@ static bool xe_svm_range_is_valid(struct
> > > > > xe_svm_range *range,
> > > > > =C2=A0=C2=A0=C2=A0	return (range->tile_present & ~range-
> > > > > >tile_invalidated) & BIT(tile->id);
> > > > > =C2=A0=C2=A0 }
> > > > > +static struct xe_mem_region *tile_to_mr(struct xe_tile
> > > > > *tile)
> > > > > +{
> > > > > +	return &tile->mem.vram;
> > > > > +}
> > > > > +
> > > > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm,
> > > > > struct xe_tile *tile,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range
> > > > > *range,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > > > drm_gpusvm_ctx *ctx)
> > > > > +{
> > > > > +	struct xe_mem_region *mr =3D tile_to_mr(tile);
> > > > > +	struct drm_buddy_block *block;
> > > > > +	struct list_head *blocks;
> > > > > +	struct xe_bo *bo;
> > > > > +	ktime_t end =3D 0;
> > > > > +	int err;
> > > > > +
> > > > > +retry:
> > > > > +	xe_vm_lock(vm, false);
> > > > > +	bo =3D xe_bo_create(tile_to_xe(tile), tile, vm, range-
> > > > > >base.itree.last + 1 -
> > > > > +			=C2=A0 range->base.itree.start,
> > > > > ttm_bo_type_device,
> > > > > +			=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > > > +			=C2=A0 XE_BO_FLAG_CPU_ADDR_MIRROR);
> > > > > +	xe_vm_unlock(vm);
> > > >=20
> > > > What was the trick again to ensure eviction is not triggered at
> > > > this point?
> > > > I thought there was some trick with eviction_valuable() but I
> > > > can't find it.
> > > >=20
> > >=20
> > > I dropped that given the hacky nature of how it was implemented.
> > > Yes, it
> > > is possible that we allocate VRAM and it is immediately evicted
> > > before
> > > the bind occurs but in practice should never really happen given
> > > this BO
> > > should be the last entry on the LRU list. Even if this happens, I
> > > believe this is harmless given the bind will abort and trigger a
> > > retry.
> >=20
> > Looking at xe_svm_bo_evict() it wants to use stuff like
> > bo->devmem_allocation, but that is not set up yet?=C2=A0 For example
> > dereferencing the devmem_allocation->mm from there will potentially
> > hit a
> > NPD?
>=20
> Good catch. I think drm_gpusvm_devmem_init at least needs to be moved
> under BO's dma resv lock.
>=20
> The multi-GPU work Thomas is doing will even expand this scope
> further
> to include drm_gpusvm_migrate_to_devmem under the BO dma-resv too -
> this
> was ommitted in this series given we'd have to rework the mmap read
> lock
> a bit too which I'd prefer to wait on until his series.

TBH, I think all pages need to be present in the CPU page-table before
we can release the dma-resv lock. That will ensure the eviction causes
an invalidation later than the migration invalidation, and everybody's
happy.

An alternative until the multi-device series lands could be to pin the
bo until the end of the function. That would avoid the locking
trickiness.

/Thomas

>=20
> Matt
>=20
> >=20
> > >=20
> > > Matt
> > >=20
> > > > > +	if (IS_ERR(bo)) {
> > > > > +		err =3D PTR_ERR(bo);
> > > > > +		if (xe_vm_validate_should_retry(NULL, err,
> > > > > &end))
> > > > > +			goto retry;
> > > > > +		return bo;
> > > > > +	}
> > > > > +
> > > > > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->xe->drm.dev, vm-
> > > > > >svm.gpusvm.mm,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_devmem_ops,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tile->mem.vram.dpagemap=
,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.itree.last +=
 1 -
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.itree.start)=
;
> > > > > +
> > > > > +	blocks =3D &to_xe_ttm_vram_mgr_resource(bo-
> > > > > >ttm.resource)->blocks;
> > > > > +	list_for_each_entry(block, blocks, link)
> > > > > +		block->private =3D mr;
> > > > > +
> > > > > +	/*
> > > > > +	 * Take ref because as soon as
> > > > > drm_gpusvm_migrate_to_devmem succeeds the
> > > > > +	 * creation ref can be dropped upon CPU fault or
> > > > > unmap.
> > > > > +	 */
> > > > > +	xe_bo_get(bo);
> > > > > +
> > > > > +	err =3D drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > > > > &range->base,
> > > > > +					=C2=A0=C2=A0 &bo-
> > > > > >devmem_allocation, ctx);
> > > > > +	if (err) {
> > > > > +		xe_bo_put(bo);	/* Local ref */
> > > > > +		xe_bo_put(bo);	/* Creation ref */
> > > > > +		return ERR_PTR(err);
> > > > > +	}
> > > > > +
> > > > > +	return bo;
> > > > > +}
> > > > > +
> > > > > =C2=A0=C2=A0 /**
> > > > > =C2=A0=C2=A0=C2=A0 * xe_svm_handle_pagefault() - SVM handle page =
fault
> > > > > =C2=A0=C2=A0=C2=A0 * @vm: The VM.
> > > > > @@ -590,7 +647,8 @@ static bool xe_svm_range_is_valid(struct
> > > > > xe_svm_range *range,
> > > > > =C2=A0=C2=A0=C2=A0 * @fault_addr: The GPU fault address.
> > > > > =C2=A0=C2=A0=C2=A0 * @atomic: The fault atomic access bit.
> > > > > =C2=A0=C2=A0=C2=A0 *
> > > > > - * Create GPU bindings for a SVM page fault.
> > > > > + * Create GPU bindings for a SVM page fault. Optionally
> > > > > migrate to device
> > > > > + * memory.
> > > > > =C2=A0=C2=A0=C2=A0 *
> > > > > =C2=A0=C2=A0=C2=A0 * Return: 0 on success, negative error code on=
 error.
> > > > > =C2=A0=C2=A0=C2=A0 */
> > > > > @@ -598,11 +656,18 @@ int xe_svm_handle_pagefault(struct
> > > > > xe_vm *vm, struct xe_vma *vma,
> > > > > =C2=A0=C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64
> > > > > fault_addr,
> > > > > =C2=A0=C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic)
> > > > > =C2=A0=C2=A0 {
> > > > > -	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> > > > > xe_vma_read_only(vma), };
> > > > > +	struct drm_gpusvm_ctx ctx =3D {
> > > > > +		.read_only =3D xe_vma_read_only(vma),
> > > > > +		.devmem_possible =3D IS_DGFX(vm->xe) &&
> > > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRR
> > > > > OR),
> > > > > +		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRR
> > > > > OR) ? SZ_64K : 0,
> > > > > +	};
> > > > > =C2=A0=C2=A0=C2=A0	struct xe_svm_range *range;
> > > > > =C2=A0=C2=A0=C2=A0	struct drm_gpusvm_range *r;
> > > > > =C2=A0=C2=A0=C2=A0	struct drm_exec exec;
> > > > > =C2=A0=C2=A0=C2=A0	struct dma_fence *fence;
> > > > > +	struct xe_bo *bo =3D NULL;
> > > > > =C2=A0=C2=A0=C2=A0	ktime_t end =3D 0;
> > > > > =C2=A0=C2=A0=C2=A0	int err;
> > > > > @@ -610,6 +675,9 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > > *vm, struct xe_vma *vma,
> > > > > =C2=A0=C2=A0=C2=A0	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vm=
a));
> > > > > =C2=A0=C2=A0 retry:
> > > > > +	xe_bo_put(bo);
> > > > > +	bo =3D NULL;
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0	/* Always process UNMAPs first so view SVM ran=
ges is
> > > > > current */
> > > > > =C2=A0=C2=A0=C2=A0	err =3D xe_svm_garbage_collector(vm);
> > > > > =C2=A0=C2=A0=C2=A0	if (err)
> > > > > @@ -625,9 +693,31 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > > *vm, struct xe_vma *vma,
> > > > > =C2=A0=C2=A0=C2=A0	if (xe_svm_range_is_valid(range, tile))
> > > > > =C2=A0=C2=A0=C2=A0		return 0;
> > > > > +	/* XXX: Add migration policy, for now migrate range
> > > > > once */
> > > > > +	if (!range->migrated && range-
> > > > > >base.flags.migrate_devmem &&
> > > > > +	=C2=A0=C2=A0=C2=A0 (range->base.itree.last + 1 - range-
> > > > > >base.itree.start) >=3D SZ_64K) {
> > > > > +		range->migrated =3D true;
> > > > > +
> > > > > +		bo =3D xe_svm_alloc_vram(vm, tile, range,
> > > > > &ctx);
> > > > > +		if (IS_ERR(bo)) {
> > > > > +			drm_info(&vm->xe->drm,
> > > > > +				 "VRAM allocation failed,
> > > > > falling back to retrying, asid=3D%u, errno %pe\n",
> > > > > +				 vm->usm.asid, bo);
> > > > > +			bo =3D NULL;
> > > > > +			goto retry;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gp=
usvm, r,
> > > > > &ctx);
> > > > > -	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner
> > > > > where CPU mappings have changed */
> > > > > +	/* Corner where CPU mappings have changed */
> > > > > +	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D =
-
> > > > > EPERM) {
> > > > > +		if (err =3D=3D -EOPNOTSUPP)
> > > > > +			drm_gpusvm_range_evict(&vm-
> > > > > >svm.gpusvm, &range->base);
> > > > > +		drm_info(&vm->xe->drm,
> > > > > +			 "Get pages failed, falling back to
> > > > > retrying, asid=3D%u, gpusvm=3D%p, errno %pe\n",
> > > > > +			 vm->usm.asid, &vm->svm.gpusvm,
> > > > > ERR_PTR(err));
> > > > > =C2=A0=C2=A0=C2=A0		goto retry;
> > > > > +	}
> > > > > =C2=A0=C2=A0=C2=A0	if (err)
> > > > > =C2=A0=C2=A0=C2=A0		goto err_out;
> > > > > @@ -658,6 +748,7 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > > *vm, struct xe_vma *vma,
> > > > > =C2=A0=C2=A0=C2=A0	dma_fence_put(fence);
> > > > > =C2=A0=C2=A0 err_out:
> > > > > +	xe_bo_put(bo);
> > > > > =C2=A0=C2=A0=C2=A0	return err;
> > > > > =C2=A0=C2=A0 }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > index 63daffdfdbf6..4c2576162c39 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > @@ -35,6 +35,11 @@ struct xe_svm_range {
> > > > > =C2=A0=C2=A0=C2=A0	 * range. Protected by GPU SVM notifier lock.
> > > > > =C2=A0=C2=A0=C2=A0	 */
> > > > > =C2=A0=C2=A0=C2=A0	u8 tile_invalidated;
> > > > > +	/**
> > > > > +	 * @migrated: Range has been migrated to device
> > > > > memory, protected by
> > > > > +	 * GPU fault handler locking.
> > > > > +	 */
> > > > > +	u8 migrated	:1;
> > > > > =C2=A0=C2=A0 };
> > > > > =C2=A0=C2=A0 int xe_devm_add(struct xe_tile *tile, struct xe_mem_=
region
> > > > > *mr);
> > > >=20
> >=20

