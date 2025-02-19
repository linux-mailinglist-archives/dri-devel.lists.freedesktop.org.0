Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE21A3BBAF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 11:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328CC10E7B6;
	Wed, 19 Feb 2025 10:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUIQ8eOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA86410E7B6;
 Wed, 19 Feb 2025 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739961037; x=1771497037;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r7kOeQ4EAJQnOLbWGHQTB7nX8N81vpekWzcZ6id/7aU=;
 b=QUIQ8eOMsEvVO4NKoYSjP3w4oMP8hQqi9upF2rqoqhP4FxIbZi9VaL92
 OfHNbYVZ4Ab0Qj7zppS/5gwMVjDkumtIvHHxgOuCJ+TjFi5lg4cZjSbBn
 rvRcsNkIYH1C9Lik3Y1hoh61xifkcA+3TJ6CBYnyXwuQFjC6YcynE6Cj6
 ym3+oOBC2kkgL1O4X2nGcJ9C07Iod/1LxtCNm2Doovf3orfGlzK0XsC3V
 Zu/C1CpkdbrEq6pWCfSFmgqk+GWudahBA+FrDnni0A6VmfiQ+lNbcCVku
 WPM6QPgeeJjYvx2ntyrp8FyhIpbsLsv3gMsw8Ies02S6m/+Mo9lZ0xzb6 Q==;
X-CSE-ConnectionGUID: 0Cq4kzk8TeuYwfhf2AE1lg==
X-CSE-MsgGUID: CF4esyyzRyGPYyi5chw7Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58230458"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="58230458"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:30:36 -0800
X-CSE-ConnectionGUID: fHFuazXMTdSDW3eA167gLQ==
X-CSE-MsgGUID: r00N9BCbTImy/JAh0WnMFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="145526559"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:30:33 -0800
Message-ID: <55808e272d7d8e9302912f236c249fea11422061.camel@linux.intel.com>
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Wed, 19 Feb 2025 11:30:31 +0100
In-Reply-To: <20250213021112.1228481-28-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
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

On Wed, 2025-02-12 at 18:11 -0800, Matthew Brost wrote:
> Migration is implemented with range granularity, with VRAM backing
> being
> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of
> the
> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> SVM range is migrated to SRAM, the TTM BO is destroyed).
>=20
> The design choice for using TTM BO for VRAM backing store, as opposed
> to
> direct buddy allocation, is as follows:
>=20
> - DRM buddy allocations are not at page granularity, offering no
> =C2=A0 advantage over a BO.
> - Unified eviction is required (SVM VRAM and TTM BOs need to be able
> to
> =C2=A0 evict each other).
> - For exhaustive eviction [1], SVM VRAM allocations will almost
> certainly
> =C2=A0 require a dma-resv.
> - Likely allocation size is 2M which makes of size of BO (872)
> =C2=A0 acceptable per allocation (872 / 2M =3D=3D .0004158).
>=20
> With this, using TTM BO for VRAM backing store seems to be an obvious
> choice as it allows leveraging of the TTM eviction code.
>=20
> Current migration policy is migrate any SVM range greater than or
> equal
> to 64k once.
>=20
> [1] https://patchwork.freedesktop.org/series/133643/
>=20
> v2:
> =C2=A0- Rebase on latest GPU SVM
> =C2=A0- Retry page fault on get pages returning mixed allocation
> =C2=A0- Use drm_gpusvm_devmem
> v3:
> =C2=A0- Use new BO flags
> =C2=A0- New range structure (Thomas)
> =C2=A0- Hide migration behind Kconfig
> =C2=A0- Kernel doc (Thomas)
> =C2=A0- Use check_pages_threshold
> v4:
> =C2=A0- Don't evict partial unmaps in garbage collector (Thomas)
> =C2=A0- Use %pe to print errors (Thomas)
> =C2=A0- Use %p to print pointers (Thomas)
> v5:
> =C2=A0- Use range size helper (Thomas)
> =C2=A0- Make BO external (Thomas)
> =C2=A0- Set tile to NULL for BO creation (Thomas)
> =C2=A0- Drop BO mirror flag (Thomas)
> =C2=A0- Hold BO dma-resv lock across migration (Auld, Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 111
> ++++++++++++++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0=C2=A0 5 ++
> =C2=A02 files changed, 112 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 0a78a838508c..2e1e0f31c1a8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct
> xe_svm_range *range)
> =C2=A0	return drm_gpusvm_range_end(&range->base);
> =C2=A0}
> =C2=A0
> +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> +{
> +	return drm_gpusvm_range_size(&range->base);
> +}
> +
> =C2=A0static void *xe_svm_devm_owner(struct xe_device *xe)
> =C2=A0{
> =C2=A0	return xe;
> @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct
> drm_gpusvm_devmem *devmem_allocatio
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -__maybe_unused
> =C2=A0static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> =C2=A0	.devmem_release =3D xe_svm_devmem_release,
> =C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct
> xe_svm_range *range,
> =C2=A0	return (range->tile_present & ~range->tile_invalidated) &
> BIT(tile->id);
> =C2=A0}
> =C2=A0
> +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram;
> +}
> +
> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> xe_tile *tile,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx
> *ctx)
> +{
> +	struct mm_struct *mm =3D vm->svm.gpusvm.mm;
> +	struct xe_vram_region *vr =3D tile_to_vr(tile);
> +	struct drm_buddy_block *block;
> +	struct list_head *blocks;
> +	struct xe_bo *bo;
> +	ktime_t end =3D 0;
> +	int err;
> +
> +	if (!mmget_not_zero(mm))
> +		return ERR_PTR(-EFAULT);
> +	mmap_read_lock(mm);
> +
> +retry:
> +	bo =3D xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> +				 xe_svm_range_size(range),
> +				 ttm_bo_type_device,
> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> +	if (IS_ERR(bo)) {
> +		err =3D PTR_ERR(bo);
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry;
> +		goto unlock;
> +	}
> +
> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->xe->drm.dev, mm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_devmem_ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tile->mem.vram.dpagemap,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_size(range));

The way this is done now looks good, although the corresponding multi-
device commit

https://gitlab.freedesktop.org/thomash/kernel/-/commit/1f204b5d05896e5cf63a=
b54a679ee343e76600ff

Goes one step further and removes the bo return of this function to
favor an int error code. The caller doesn't really use the bo, right?

> +
> +	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> >blocks;
> +	list_for_each_entry(block, blocks, link)
> +		block->private =3D vr;
> +
> +	/*
> +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem
> succeeds the
> +	 * creation ref can be dropped upon CPU fault or unmap.
> +	 */
> +	xe_bo_get(bo);
> +
> +	err =3D drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range-
> >base,
> +					=C2=A0=C2=A0 &bo->devmem_allocation,
> ctx);
> +	xe_bo_unlock(bo);
> +	if (err) {
> +		xe_bo_put(bo);	/* Local ref */
> +		xe_bo_put(bo);	/* Creation ref */

Strictly, with the drm_gpusvm_devmem_init() succeeding, this bo put
should be an xe_svm_devmem_release(), right? While equivalent here, if
devmem_init moving forward sets up other resources that are expected to
be released at devmem_release time, they'd be leaked.

> +		bo =3D ERR_PTR(err);
> +	}
> +
> +unlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return bo;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_svm_handle_pagefault() - SVM handle page fault
> =C2=A0 * @vm: The VM.
> @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct
> xe_svm_range *range,
> =C2=A0 * @fault_addr: The GPU fault address.
> =C2=A0 * @atomic: The fault atomic access bit.
> =C2=A0 *
> - * Create GPU bindings for a SVM page fault.
> + * Create GPU bindings for a SVM page fault. Optionally migrate to
> device
> + * memory.
> =C2=A0 *
> =C2=A0 * Return: 0 on success, negative error code on error.
> =C2=A0 */
> @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic)
> =C2=A0{
> -	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> xe_vma_read_only(vma), };
> +	struct drm_gpusvm_ctx ctx =3D {
> +		.read_only =3D xe_vma_read_only(vma),
> +		.devmem_possible =3D IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> SZ_64K : 0,
> +	};
> =C2=A0	struct xe_svm_range *range;
> =C2=A0	struct drm_gpusvm_range *r;
> =C2=A0	struct drm_exec exec;
> =C2=A0	struct dma_fence *fence;
> +	struct xe_bo *bo =3D NULL;
> =C2=A0	ktime_t end =3D 0;
> =C2=A0	int err;
> =C2=A0
> @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> =C2=A0
> =C2=A0retry:
> +	xe_bo_put(bo);
> +	bo =3D NULL;
> +
> =C2=A0	/* Always process UNMAPs first so view SVM ranges is current
> */
> =C2=A0	err =3D xe_svm_garbage_collector(vm);
> =C2=A0	if (err)
> @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (xe_svm_range_is_valid(range, tile))
> =C2=A0		return 0;
> =C2=A0
> +	/* XXX: Add migration policy, for now migrate range once */
> +	if (!range->migrated && range->base.flags.migrate_devmem &&
> +	=C2=A0=C2=A0=C2=A0 xe_svm_range_size(range) >=3D SZ_64K) {
> +		range->migrated =3D true;
> +
> +		bo =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		if (IS_ERR(bo)) {
> +			drm_info(&vm->xe->drm,
> +				 "VRAM allocation failed, falling
> back to retrying, asid=3D%u, errno %pe\n",
> +				 vm->usm.asid, bo);

Typically we use drm_dbg() to print error messages to avoid spamming
the logs and facilitate dynamic debug. Should we change this.

/Thomas



> +			bo =3D NULL;
> +			goto retry;
> +		}
> +	}
> +
> =C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> -	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where CPU
> mappings have changed */
> +	/* Corner where CPU mappings have changed */
> +	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -EPERM) =
{
> +		if (err =3D=3D -EOPNOTSUPP)
> +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> &range->base);
> +		drm_info(&vm->xe->drm,
> +			 "Get pages failed, falling back to
> retrying, asid=3D%u, gpusvm=3D%p, errno %pe\n",
> +			 vm->usm.asid, &vm->svm.gpusvm,
> ERR_PTR(err));
> =C2=A0		goto retry;
> +	}
> =C2=A0	if (err)
> =C2=A0		goto err_out;
> =C2=A0
> @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	dma_fence_put(fence);
> =C2=A0
> =C2=A0err_out:
> +	xe_bo_put(bo);
> =C2=A0
> =C2=A0	return err;
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 0fa525d34987..984a61651d9e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -35,6 +35,11 @@ struct xe_svm_range {
> =C2=A0	 * range. Protected by GPU SVM notifier lock.
> =C2=A0	 */
> =C2=A0	u8 tile_invalidated;
> +	/**
> +	 * @migrated: Range has been migrated to device memory,
> protected by
> +	 * GPU fault handler locking.
> +	 */
> +	u8 migrated	:1;
> =C2=A0};
> =C2=A0
> =C2=A0int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);

