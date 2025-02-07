Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149FA2C5EB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A74310EB2D;
	Fri,  7 Feb 2025 14:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Skz6NGaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC5E10EB2B;
 Fri,  7 Feb 2025 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738939631; x=1770475631;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jBfNvWT2cXvfcELxgp/rf2fwwlfW9GoE47nzdAqnmFI=;
 b=Skz6NGaGQkqkc3IKL5UA/oi2ymMbcJ6YEkmDiOkwGWyv7Vq7HCf2MFO/
 c6Z3ZhCL9w6fsUEBPiB3s2FsofexFzC6fk2zQE/Lpdh8AII2+Dwn32q10
 y878rqOjU7FcR+u082ZuY73lODwXilPAgUPYlzMI3Wj0OzY799BPW/sLy
 a04plOokxOFLOmzwpLsylSb1zppUVudZ6W8QFVLgvmZBGwrsdmanfzKkn
 d7OgOeIv5EredXXRMB8xySyDtLbMsp+XFhlhqu/TxZwdl1zBtF/NKbNnX
 Px/KwMnPGO3aPk4lN6VMMVModPYANTGH52ungoIcHk7RTSQrbTJZc3O3i g==;
X-CSE-ConnectionGUID: +sXbVjbWQa+E4iwxSg7aUQ==
X-CSE-MsgGUID: CwkCZDe4RPm9zMnQsWR5zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43240323"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="43240323"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:47:04 -0800
X-CSE-ConnectionGUID: KVLcjfsIQtOzCdaUydWIxw==
X-CSE-MsgGUID: nQ6hZ4PSSwuzcoUtKsyiEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111984196"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:46:58 -0800
Message-ID: <87ff7fa2f55715e0f480dbf1241ed93033b41583.camel@linux.intel.com>
Subject: Re: [PATCH v4 30/33] drm/xe: Add SVM debug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 15:46:55 +0100
In-Reply-To: <20250129195212.745731-31-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-31-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:52 -0800, Matthew Brost wrote:
> Add some useful SVM debug logging fro SVM range which prints the
> range's
> state.
>=20
> v2:
> =C2=A0- Upadte logging with latest structure layout

NIT: Update

> v3:
> =C2=A0- Better commit message (Thomas)
> =C2=A0- New range structure (Thomas)
> =C2=A0- s/COLLECTOT/s/COLLECTOR (Thomas)
> v4:
> =C2=A0- Drop partial evict message (Thomas)
> =C2=A0- Use %p for pointers print (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0 |=C2=A0 8 ++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 91 +++++++++++++++++++++++++++++++++-=
-
> --
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 2 +
> =C2=A03 files changed, 93 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f8d06c70f77d..29ade504e1c1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -647,6 +647,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0		/* Move this entire thing to xe_svm.c? */
> =C2=A0		xe_svm_notifier_lock(xe_vma_vm(vma));
> =C2=A0		if (!xe_svm_range_pages_valid(range)) {
> +			xe_svm_range_debug(range, "BIND PREPARE -
> RETRY");
> =C2=A0			xe_svm_notifier_unlock(xe_vma_vm(vma));
> =C2=A0			return -EAGAIN;
> =C2=A0		}
> @@ -655,6 +656,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0					 range->base.itree.last + 1
> - range->base.itree.start,
> =C2=A0					 &curs);
> =C2=A0			is_devmem =3D xe_res_is_vram(&curs);
> +			if (is_devmem)
> +				xe_svm_range_debug(range, "BIND
> PREPARE - DMA VRAM");
> +			else
> +				xe_svm_range_debug(range, "BIND
> PREPARE - DMA");
> =C2=A0		} else {
> =C2=A0			xe_assert(xe, false);
> =C2=A0		}
> @@ -1429,10 +1434,13 @@ static int xe_pt_svm_pre_commit(struct
> xe_migrate_pt_update *pt_update)
> =C2=A0		if (op->subop =3D=3D XE_VMA_SUBOP_UNMAP_RANGE)
> =C2=A0			continue;
> =C2=A0
> +		xe_svm_range_debug(range, "PRE-COMMIT");
> +
> =C2=A0		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op-
> >map_range.vma));
> =C2=A0		xe_assert(vm->xe, op->subop =3D=3D
> XE_VMA_SUBOP_MAP_RANGE);
> =C2=A0
> =C2=A0		if (!xe_svm_range_pages_valid(range)) {
> +			xe_svm_range_debug(range, "PRE-COMMIT -
> RETRY");
> =C2=A0			xe_svm_notifier_unlock(vm);
> =C2=A0			return -EAGAIN;
> =C2=A0		}
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index dafc5061eb42..0df924ca8ed1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -12,6 +12,18 @@
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_vm_types.h"
> =C2=A0
> +static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> +{
> +	/* Not reliable without notifier lock */
> +	return range->base.flags.has_devmem_pages;
> +}
> +
> +static bool xe_svm_range_has_vram_binding(struct xe_svm_range
> *range)
> +{
> +	/* Not reliable without notifier lock */
> +	return xe_svm_range_in_vram(range) && range->tile_present;
> +}
> +
> =C2=A0static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> =C2=A0{
> =C2=A0	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> @@ -22,6 +34,23 @@ static struct xe_vm *range_to_vm(struct
> drm_gpusvm_range *r)
> =C2=A0	return gpusvm_to_vm(r->gpusvm);
> =C2=A0}
> =C2=A0
> +#define range_debug(r__,
> operaton__)					\
> +	vm_dbg(&range_to_vm(&(r__)->base)->xe-
> >drm,			\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s: asid=3D%u, gpusvm=3D%p, vram=
=3D%d,%d, seqno=3D%lu, " \
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "start=3D0x%014lx, end=3D0x%014lx,
> size=3D%lu",		\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (operaton__), range_to_vm(&(r__)->=
base)-
> >usm.asid,	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r__)-
> >base.gpusvm,					\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_in_vram((r__)) ? 1 :
> 0,			\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_has_vram_binding((r__=
)) ? 1 :
> 0,		\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r__)-
> >base.notifier_seq,				\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r__)->base.itree.start, (r__)->ba=
se.itree.last +
> 1,	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r__)->base.itree.last + 1 - (r__)=
->base.itree.start)
> +
> +void xe_svm_range_debug(struct xe_svm_range *range, const char
> *operation)
> +{
> +	range_debug(range, operation);
> +}
> +
> =C2=A0static void *xe_svm_devm_owner(struct xe_device *xe)
> =C2=A0{
> =C2=A0	return xe;
> @@ -59,6 +88,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm
> *vm, struct xe_svm_range *range,
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D vm->xe;
> =C2=A0
> +	range_debug(range, "GARBAGE COLLECTOR ADD");
> +
> =C2=A0	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> =C2=A0
> =C2=A0	spin_lock(&vm->svm.garbage_collector.lock);
> @@ -84,10 +115,14 @@ xe_svm_range_notifier_event_begin(struct xe_vm
> *vm, struct drm_gpusvm_range *r,
> =C2=A0
> =C2=A0	xe_svm_assert_in_notifier(vm);
> =C2=A0
> +	range_debug(range, "NOTIFIER");
> +
> =C2=A0	/* Skip if already unmapped or if no binding exist */
> =C2=A0	if (range->base.flags.unmapped || !range->tile_present)
> =C2=A0		return 0;
> =C2=A0
> +	range_debug(range, "NOTIFIER - EXECUTE");
> +
> =C2=A0	/* Adjust invalidation to range boundaries */
> =C2=A0	if (range->base.itree.start < mmu_range->start)
> =C2=A0		*adj_start =3D range->base.itree.start;
> @@ -140,6 +175,11 @@ static void xe_svm_invalidate(struct drm_gpusvm
> *gpusvm,
> =C2=A0
> =C2=A0	xe_svm_assert_in_notifier(vm);
> =C2=A0
> +	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "INVALIDATE: asid=3D%u, gpusvm=3D%=
p, seqno=3D%lu,
> start=3D0x%016lx, end=3D0x%016lx, event=3D%d",
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->usm.asid, gpusvm, notifier-
> >notifier.invalidate_seq,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmu_range->start, mmu_range->end, =
mmu_range->event);
> +
> =C2=A0	/* Adjust invalidation to notifier boundaries */
> =C2=A0	if (adj_start < notifier->itree.start)
> =C2=A0		adj_start =3D notifier->itree.start;
> @@ -226,6 +266,8 @@ static int __xe_svm_garbage_collector(struct
> xe_vm *vm,
> =C2=A0{
> =C2=A0	struct dma_fence *fence;
> =C2=A0
> +	range_debug(range, "GARBAGE COLLECTOR");
> +
> =C2=A0	xe_vm_lock(vm, false);
> =C2=A0	fence =3D xe_vm_range_unbind(vm, range);
> =C2=A0	xe_vm_unlock(vm);
> @@ -385,16 +427,23 @@ static int xe_svm_copy(struct page **pages,
> dma_addr_t *dma_addr,
> =C2=A0			int incr =3D (match && last) ? 1 : 0;
> =C2=A0
> =C2=A0			if (vram_addr !=3D XE_VRAM_ADDR_INVALID) {
> -				if (sram)
> +				if (sram) {
> +					vm_dbg(&tile->xe->drm,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "COPY TO SRAM -
> 0x%016llx -> 0x%016llx, NPAGES=3D%ld",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vram_addr,
> dma_addr[pos], i - pos + incr);
> =C2=A0					__fence =3D
> xe_migrate_from_vram(tile->migrate,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 i - pos + incr,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 vram_addr,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 dma_addr + pos);
> -				else
> +				} else {
> +					vm_dbg(&tile->xe->drm,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "COPY TO VRAM -
> 0x%016llx -> 0x%016llx, NPAGES=3D%ld",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr[pos],
> vram_addr, i - pos + incr);
> =C2=A0					__fence =3D
> xe_migrate_to_vram(tile->migrate,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> i - pos + incr,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> dma_addr + pos,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> vram_addr);
> +				}
> =C2=A0				if (IS_ERR(__fence)) {
> =C2=A0					err =3D PTR_ERR(__fence);
> =C2=A0					goto err_out;
> @@ -414,14 +463,21 @@ static int xe_svm_copy(struct page **pages,
> dma_addr_t *dma_addr,
> =C2=A0
> =C2=A0			/* Extra mismatched device page, copy it */
> =C2=A0			if (!match && last && vram_addr !=3D
> XE_VRAM_ADDR_INVALID) {
> -				if (sram)
> +				if (sram) {
> +					vm_dbg(&tile->xe->drm,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "COPY TO SRAM -
> 0x%016llx -> 0x%016llx, NPAGES=3D%d",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vram_addr,
> dma_addr[pos], 1);
> =C2=A0					__fence =3D
> xe_migrate_from_vram(tile->migrate, 1,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 vram_addr,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 dma_addr + pos);
> -				else
> +				} else {
> +					vm_dbg(&tile->xe->drm,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "COPY TO VRAM -
> 0x%016llx -> 0x%016llx, NPAGES=3D%d",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr[pos],
> vram_addr, 1);
> =C2=A0					__fence =3D
> xe_migrate_to_vram(tile->migrate, 1,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> dma_addr + pos,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> vram_addr);
> +				}
> =C2=A0				if (IS_ERR(__fence)) {
> =C2=A0					err =3D PTR_ERR(__fence);
> =C2=A0					goto err_out;
> @@ -591,12 +647,14 @@ static struct xe_bo *xe_svm_alloc_vram(struct
> xe_vm *vm, struct xe_tile *tile,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ct=
x
> *ctx)
> =C2=A0{
> =C2=A0	struct xe_mem_region *mr =3D tile_to_mr(tile);
> +	struct drm_buddy *buddy =3D tile_to_buddy(tile);
> =C2=A0	struct drm_buddy_block *block;
> =C2=A0	struct list_head *blocks;
> =C2=A0	struct xe_bo *bo;
> =C2=A0	ktime_t end =3D 0;
> =C2=A0	int err;
> =C2=A0
> +	range_debug(range, "ALLOCATE VRAM");
> =C2=A0retry:
> =C2=A0	xe_vm_lock(vm, false);
> =C2=A0	bo =3D xe_bo_create(tile_to_xe(tile), tile, vm, range-
> >base.itree.last + 1 -
> @@ -619,8 +677,13 @@ static struct xe_bo *xe_svm_alloc_vram(struct
> xe_vm *vm, struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.itree.start);
> =C2=A0
> =C2=A0	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> >blocks;
> -	list_for_each_entry(block, blocks, link)
> +	list_for_each_entry(block, blocks, link) {
> +		vm_dbg(&vm->xe->drm, "ALLOC VRAM: asid=3D%u,
> gpusvm=3D%p, pfn=3D%llu, npages=3D%llu",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->usm.asid, &vm->svm.gpusvm,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 block_offset_to_pfn(mr,
> drm_buddy_block_offset(block)),
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_buddy_block_size(buddy, block=
) >>
> PAGE_SHIFT);
> =C2=A0		block->private =3D mr;
> +	}
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem
> succeeds the
> @@ -693,6 +756,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (xe_svm_range_is_valid(range, tile))
> =C2=A0		return 0;
> =C2=A0
> +	range_debug(range, "PAGE FAULT");
> +
> =C2=A0	/* XXX: Add migration policy, for now migrate range once */
> =C2=A0	if (!range->migrated && range->base.flags.migrate_devmem &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 (range->base.itree.last + 1 - range->base.itree=
.start)
> >=3D SZ_64K) {
> @@ -708,18 +773,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	range_debug(range, "GET PAGES");
> =C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> =C2=A0	/* Corner where CPU mappings have changed */
> =C2=A0	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -EP=
ERM) {
> -		if (err =3D=3D -EOPNOTSUPP)
> +		if (err =3D=3D -EOPNOTSUPP) {
> +			range_debug(range, "PAGE FAULT - EVICT
> PAGES");
> =C2=A0			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> &range->base);
> +		}
> =C2=A0		drm_info(&vm->xe->drm,
> =C2=A0			 "Get pages failed, falling back to
> retrying, asid=3D%u, gpusvm=3D%p, errno %pe\n",
> =C2=A0			 vm->usm.asid, &vm->svm.gpusvm,
> ERR_PTR(err));
> +		range_debug(range, "PAGE FAULT - RETRY PAGES");
> =C2=A0		goto retry;
> =C2=A0	}
> -	if (err)
> +	if (err) {
> +		range_debug(range, "PAGE FAULT - FAIL PAGE
> COLLECT");
> =C2=A0		goto err_out;
> +	}
> +
> +	range_debug(range, "PAGE FAULT - BIND");
> =C2=A0
> =C2=A0retry_bind:
> =C2=A0	drm_exec_init(&exec, 0, 0);
> @@ -735,8 +808,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0		if (IS_ERR(fence)) {
> =C2=A0			drm_exec_fini(&exec);
> =C2=A0			err =3D PTR_ERR(fence);
> -			if (err =3D=3D -EAGAIN)
> +			if (err =3D=3D -EAGAIN) {
> +				range_debug(range, "PAGE FAULT -
> RETRY BIND");
> =C2=A0				goto retry;
> +			}
> =C2=A0			if (xe_vm_validate_should_retry(&exec, err,
> &end))
> =C2=A0				goto retry_bind;
> =C2=A0			goto err_out;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 77dec5aae0ee..f16b76dcc55b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -57,6 +57,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0
> =C2=A0bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> =C2=A0
> +void xe_svm_range_debug(struct xe_svm_range *range, const char
> *operation);
> +
> =C2=A0int xe_svm_bo_evict(struct xe_bo *bo);
> =C2=A0
> =C2=A0static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)

