Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445969E017C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5D610E6FB;
	Mon,  2 Dec 2024 12:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0x+6oNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D8810E6FB;
 Mon,  2 Dec 2024 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733141200; x=1764677200;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=b1G+dZSZC1u6WFYaj1mpusYFiYwrhplHX41CkoDEMmM=;
 b=Y0x+6oNQKms3sMiCz+U/MXs7pFp/bsaAiMGp50Ca0clMfX+LRhATIMr9
 eVh/pLW2A1hnbvg5J40IqolquI0ZfSzs3R1pv6D3bzQKgRTECP2PD4fJ6
 TyT72AEx23jlVpl5JQ/FImcL4gLS42iAar2uz+Kj38PYDsK777NVS4vGR
 wZJWFQOkY5q4+QEjt0xwXIFiAFZ3TKRAIkVP3IDcdx4y2ZFUbYatCRAr/
 PDCsUbgcp1NnrWNeVrUnECFoepXq5CPi8MHj7WN8Vo4celKzXKgeE3lAI
 3SsU5WUdsB5B6Judf+CO+pVJlZGs681Jq8gRtSMWycOybaKS2aNAcaSZv w==;
X-CSE-ConnectionGUID: R+umRIdsQr++MDg63EZpTA==
X-CSE-MsgGUID: TpYylsw/SWCSCy0TvhdE7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43916987"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="43916987"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:06:39 -0800
X-CSE-ConnectionGUID: FBwwlTtlRxeZ0et1jI38LQ==
X-CSE-MsgGUID: QhidxGxCQsyxyM3gp7wdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="92996628"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:06:36 -0800
Message-ID: <c7ae9afa6b06e1aa6233929d20487b68b3fca2c7.camel@linux.intel.com>
Subject: Re: [PATCH v2 24/29] drm/xe: Add SVM VRAM migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 13:06:33 +0100
In-Reply-To: <20241016032518.539495-25-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-25-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
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
>=20
> Signed-off-by: Matthew Brost matthew.brost@intel.com
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 96
> +++++++++++++++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 1 +
> =C2=A02 files changed, 94 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 976b4ce15db4..31b80cde15c4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -218,6 +218,9 @@ static int __xe_svm_garbage_collector(struct
> xe_vm *vm,
> =C2=A0{
> =C2=A0	struct dma_fence *fence;
> =C2=A0
> +	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap)
> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range-
> >base);
> +
> =C2=A0	xe_vm_lock(vm, false);
> =C2=A0	fence =3D xe_vm_range_unbind(vm, range);
> =C2=A0	xe_vm_unlock(vm);
> @@ -458,7 +461,6 @@ static int xe_svm_populate_devmem_pfn(struct
> drm_gpusvm_devmem *devmem_allocatio
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -__maybe_unused
> =C2=A0static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> =C2=A0	.devmem_release =3D xe_svm_devmem_release,
> =C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> @@ -542,21 +544,84 @@ static bool xe_svm_range_is_valid(struct
> xe_svm_range *range,
> =C2=A0	return (range->tile_present & ~range->tile_invalidated) &
> BIT(tile->id);
> =C2=A0}
> =C2=A0
> +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram;
> +}
> +
> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> xe_tile *tile,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx
> *ctx)

This function will se substantial updates with multi-device, but let's
leave as is for now.

> +{
> +	struct xe_mem_region *mr =3D tile_to_mr(tile);
> +	struct drm_buddy_block *block;
> +	struct list_head *blocks;
> +	struct xe_bo *bo;
> +	ktime_t end =3D 0;
> +	int err;
> +
> +retry:
> +	xe_vm_lock(vm, false);
> +	bo =3D xe_bo_create(tile_to_xe(tile), tile, vm, range-
> >base.va.end -
> +			=C2=A0 range->base.va.start, ttm_bo_type_device,
> +			=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +			=C2=A0 XE_BO_FLAG_SYSTEM_ALLOC |
> XE_BO_FLAG_SKIP_CLEAR);
> +	xe_vm_unlock(vm);
> +	if (IS_ERR(bo)) {
> +		err =3D PTR_ERR(bo);
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry;
> +		return bo;
> +	}
> +
> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->xe->drm.dev, vm->svm.gpusvm.=
mm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_devmem_ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tile->mem.vram.dpagemap,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.va.end -
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.va.start);
> +
> +	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> >blocks;
> +	list_for_each_entry(block, blocks, link)
> +		block->private =3D mr;
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
> +	if (err) {
> +		xe_bo_put(bo);	/* Local ref */
> +		xe_bo_put(bo);	/* Creation ref */
> +		return ERR_PTR(err);
> +	}
> +
> +	return bo;
> +}
> +
> =C2=A0int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic)
> =C2=A0{
> -	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> xe_vma_read_only(vma), };
> +	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> xe_vma_read_only(vma),
> +		.devmem_possible =3D IS_DGFX(vm->xe), .check_pages =3D
> true, };
> =C2=A0	struct xe_svm_range *range;
> =C2=A0	struct drm_gpusvm_range *r;
> =C2=A0	struct drm_exec exec;
> =C2=A0	struct dma_fence *fence;
> +	struct xe_bo *bo =3D NULL;
> =C2=A0	ktime_t end =3D 0;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	lockdep_assert_held_write(&vm->lock);
> =C2=A0
> =C2=A0retry:
> +	xe_bo_put(bo);
> +	bo =3D NULL;
> +
> =C2=A0	/* Always process UNMAPs first so view SVM ranges is current
> */
> =C2=A0	err =3D xe_svm_garbage_collector(vm);
> =C2=A0	if (err)
> @@ -572,9 +637,32 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (xe_svm_range_is_valid(range, tile))
> =C2=A0		return 0;
> =C2=A0
> +	/* XXX: Add migration policy, for now migrate range once */
> +	if (IS_DGFX(vm->xe) && !range->migrated &&
> +	=C2=A0=C2=A0=C2=A0 range->base.flags.migrate_devmem &&
> +	=C2=A0=C2=A0=C2=A0 (range->base.va.end - range->base.va.start) >=3D SZ_=
64K) {
> +		range->migrated =3D true;
> +
> +		bo =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		if (IS_ERR(bo)) {
> +			drm_info(&vm->xe->drm,
> +				 "VRAM allocation failed, falling
> back to retrying, asid=3D%u, errno %ld\n",
> +				 vm->usm.asid, PTR_ERR(bo));
> +			bo =3D NULL;
> +			goto retry;
> +		}
> +	}
> +
> =C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> =C2=A0	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where CPU
> mappings have change */
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
> +	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -EPERM)
> {	/* Corner where CPU mappings have change */

have changed or have seen a change?


> +		if (err =3D=3D -EOPNOTSUPP)
> +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> &range->base);
> +		drm_info(&vm->xe->drm,
> +			 "Get pages failed, falling back to
> retrying, asid=3D%u, gpusvm=3D0x%016llx, errno %d\n",
> +			 vm->usm.asid, (u64)&vm->svm.gpusvm, err);
> +		goto retry;
> +	}
> =C2=A0	if (err)
> =C2=A0		goto err_out;
> =C2=A0
> @@ -605,6 +693,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	dma_fence_put(fence);
> =C2=A0
> =C2=A0err_out:
> +	xe_bo_put(bo);
> +
> =C2=A0	return err;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 760d22cefb1e..6893664dae70 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -21,6 +21,7 @@ struct xe_svm_range {
> =C2=A0	struct list_head garbage_collector_link;
> =C2=A0	u8 tile_present;
> =C2=A0	u8 tile_invalidated;
> +	u8 migrated	:1;

Kerneldoc, including protection information

> =C2=A0};
> =C2=A0
> =C2=A0int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);

Thanks,
Thomas

