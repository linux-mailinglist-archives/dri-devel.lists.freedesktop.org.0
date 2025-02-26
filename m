Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B6A466F4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D0C10E961;
	Wed, 26 Feb 2025 16:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrDVxpcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B41210E961;
 Wed, 26 Feb 2025 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740588452; x=1772124452;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wNdQzVF0gGXOx+7t/6h2C1kRIB1Wc5FRssOFjP0ZL5w=;
 b=OrDVxpcETFsiOFQNkbdYkON+QDH9iL2s+grRyQ3AjWt2iNHsbcOUyZgM
 uAHeAsHYeT2YEp/sCkkntvR2IagOnZvI9ROLqfH/qJj6c86yRDvV+Mj/0
 7o1J3GHWgY/Tkyp92FPfzUxYd1ze1NEIIFVL6vmUmdcd4D9OdqTOBepKM
 tEiywGTbbR0Ik6ps5nemayD9XnzvaSVS7VlMOxgPhr4KqhBFdwkLrvxwc
 HyOaR5YEyN/+pE658aWa6dEJFIKlYKU3pKDyKLppSRslvk2CLg1UHyyqE
 LAm0ILRoJhWbcZ9adKf/L6Wy7uU/WdHpoltQV3pZIjniNbegyiDhEBWA7 w==;
X-CSE-ConnectionGUID: t+eqdloVRSimfwedtpeJNA==
X-CSE-MsgGUID: zXTMMRLDQpa0qtbi2Ctc7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52861898"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52861898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 08:47:32 -0800
X-CSE-ConnectionGUID: K3NRAghHRQybcXIh2oxyzw==
X-CSE-MsgGUID: aFOhhnpDTRaSI7YJs4OHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117673205"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 08:47:29 -0800
Message-ID: <7bd3d2b1f477d3ee580625f081b4408d8fd233f2.camel@linux.intel.com>
Subject: Re: [PATCH v6 27/32] drm/xe: Add SVM VRAM migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Wed, 26 Feb 2025 17:47:26 +0100
In-Reply-To: <20250225044311.3178695-28-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-28-matthew.brost@intel.com>
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

On Mon, 2025-02-24 at 20:43 -0800, Matthew Brost wrote:
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
> v6:
> =C2=A0- s/drm_info/drm_dbg (Thomas)
> =C2=A0- s/migrated/skip_migrate (Himal)
> =C2=A0- Better debug message on VRAM migration failure (Himal)
> =C2=A0- Drop return BO from VRAM allocation function (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 97
> +++++++++++++++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 5 ++
> =C2=A02 files changed, 98 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index cb3567b561be..d8ff7fc708ee 100644
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
> @@ -508,7 +513,6 @@ static int xe_svm_populate_devmem_pfn(struct
> drm_gpusvm_devmem *devmem_allocatio
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -__maybe_unused
> =C2=A0static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> =C2=A0	.devmem_release =3D xe_svm_devmem_release,
> =C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> @@ -588,6 +592,62 @@ static bool xe_svm_range_is_valid(struct
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
> +static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx)
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
> +		return -EFAULT;
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
> +
> +	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> >blocks;
> +	list_for_each_entry(block, blocks, link)
> +		block->private =3D vr;
> +
> +	err =3D drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range-
> >base,
> +					=C2=A0=C2=A0 &bo->devmem_allocation,
> ctx);
> +	xe_bo_unlock(bo);
> +	if (err)
> +		xe_bo_put(bo);	/* Creation ref */
> +
> +unlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return err;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_svm_handle_pagefault() - SVM handle page fault
> =C2=A0 * @vm: The VM.
> @@ -596,7 +656,8 @@ static bool xe_svm_range_is_valid(struct
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
> @@ -604,7 +665,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
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
> @@ -631,9 +698,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (xe_svm_range_is_valid(range, tile))
> =C2=A0		return 0;
> =C2=A0
> +	/* XXX: Add migration policy, for now migrate range once */
> +	if (!range->skip_migrate && range->base.flags.migrate_devmem
> &&
> +	=C2=A0=C2=A0=C2=A0 xe_svm_range_size(range) >=3D SZ_64K) {
> +		range->skip_migrate =3D true;
> +
> +		err =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		if (err) {
> +			drm_dbg(&vm->xe->drm,
> +				"VRAM allocation failed, falling
> back to "
> +				"retrying fault, asid=3D%u, errno
> %pe\n",
> +				vm->usm.asid, ERR_PTR(err));
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
> +		drm_dbg(&vm->xe->drm,
> +			"Get pages failed, falling back to retrying,
> asid=3D%u, gpusvm=3D%p, errno %pe\n",
> +			vm->usm.asid, &vm->svm.gpusvm,
> ERR_PTR(err));
> =C2=A0		goto retry;
> +	}
> =C2=A0	if (err)
> =C2=A0		goto err_out;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 49c35e9ec183..5d4eeb2d34ce 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -35,6 +35,11 @@ struct xe_svm_range {
> =C2=A0	 * range. Protected by GPU SVM notifier lock.
> =C2=A0	 */
> =C2=A0	u8 tile_invalidated;
> +	/**
> +	 * @skip_migrate: Skip migration to VRAM, protected by GPU
> fault handler
> +	 * locking.
> +	 */
> +	u8 skip_migrate	:1;
> =C2=A0};
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_DRM_GPUSVM)

