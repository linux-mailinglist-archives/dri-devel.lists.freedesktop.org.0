Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32809E0244
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB7E10E70F;
	Mon,  2 Dec 2024 12:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maC0koIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F4F10E233;
 Mon,  2 Dec 2024 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733142815; x=1764678815;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JMJH8JdOiUgJygOfnCgtYMcGv5AaxAY27c0LjEa370E=;
 b=maC0koIvlnus8JBmuTkNYCQ6FUAaL5Its/Zk3kXmg+0MtY55QW5G98us
 qgfR5junCk6vEt7hqlp+aMmFl0HSHY+7ojL+Ny7oMn4HVjkXM5yyHVb9+
 433RcrVkSCLYEe1UrIXt9c+yANdKUwaySjWuzZ1/hhx08qXhc7Z+pbwoZ
 7pcnf2DkFXnTGbWwQK5Eywucj32quB1cuFKtJRX3lThfWAzUjrphGL9/5
 XkTgTM/JL/sLnZQ+wESfbzPSP9rMNdccHEMTlwpNkcB3zSUDviYt9dm6V
 wXBWz1PdHPlSwXe1qn0zTTdatJ1Rv4r5LgAcbINgvWNs3AT9foGwlMHCT A==;
X-CSE-ConnectionGUID: gnQQyvAqQieyaUU6+8xJSQ==
X-CSE-MsgGUID: QayE7pxyRBOS7WgXMGn5Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33230208"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33230208"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:33:35 -0800
X-CSE-ConnectionGUID: 4QMJamEDQ7qZC+xGlaNqwg==
X-CSE-MsgGUID: M2BZ59muRGifMwILxP2iSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="97168619"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:33:31 -0800
Message-ID: <db162f5ef89b9d48c9fe300918120a4537b7b0d1.camel@linux.intel.com>
Subject: Re: [PATCH v2 26/29] drm/xe: Add SVM debug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 13:33:29 +0100
In-Reply-To: <20241016032518.539495-27-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-27-matthew.brost@intel.com>
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
> Add some useful SVM debug logging.
>=20
> v2:
> =C2=A0- Upadte logging with latest structure layout
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0 |=C2=A0=C2=A0 8 +++
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 101 +++++++++++++++++++++++++++++++--=
-
> --
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0=C2=A0 2 +
> =C2=A03 files changed, 99 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 687abd1a5e74..75f548ebe2b3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -632,6 +632,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0		/* Move this entire thing to xe_svm.c? */
> =C2=A0		xe_svm_notifier_lock(xe_vma_vm(vma));
> =C2=A0		if (!xe_svm_range_pages_valid(range)) {
> +			xe_svm_range_debug(range, "BIND PREPARE -
> RETRY");
> =C2=A0			xe_svm_notifier_unlock(xe_vma_vm(vma));
> =C2=A0			return -EAGAIN;
> =C2=A0		}
> @@ -640,6 +641,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0					 range->base.va.end - range-
> >base.va.start,
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
> @@ -1397,10 +1402,13 @@ static int xe_pt_svm_pre_commit(struct
> xe_migrate_pt_update *pt_update)
> =C2=A0		if (op->subop =3D=3D XE_VMA_SUBOP_UNMAP_RANGE)
> =C2=A0			continue;
> =C2=A0
> +		xe_svm_range_debug(range, "PRE-COMMIT");
> +
> =C2=A0		xe_assert(vm->xe, xe_vma_is_system_allocator(op-
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
> index 555bc71ae523..acf2a3750f38 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -14,6 +14,18 @@
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_vm_types.h"
> =C2=A0
> +static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> +{
> +	/* Not reliable without notifier lock */

lockdep assert?

> +	return range->base.flags.has_devmem_pages;
> +}
> +
> +static bool xe_svm_range_has_vram_binding(struct xe_svm_range
> *range)
> +{
> +	/* Not reliable without notifier lock */

lockdep assert?

> +	return xe_svm_range_in_vram(range) && range->tile_present;
> +}
> +
> =C2=A0static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> =C2=A0{
> =C2=A0	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> @@ -24,6 +36,23 @@ static struct xe_vm *range_to_vm(struct
> drm_gpusvm_range *r)
> =C2=A0	return gpusvm_to_vm(r->gpusvm);
> =C2=A0}
> =C2=A0
> +#define range_debug(r__,
> operaton__)					\
> +	vm_dbg(&range_to_vm(&(r__)->base)->xe-
> >drm,			\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s: asid=3D%u, gpusvm=3D0x%016llx=
, vram=3D%d,%d,
> seqno=3D%lu, " \
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "start=3D0x%014llx, end=3D0x%014ll=
x,
> size=3D%llu",		\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (operaton__), range_to_vm(&(r__)->=
base)-
> >usm.asid,	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u64)(r__)-
> >base.gpusvm,					\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_in_vram((r__)) ? 1 :
> 0,			\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_has_vram_binding((r__=
)) ? 1 :
> 0,		\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r__)-
> >base.notifier_seq,				\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r__)->base.va.start, (r__)-
> >base.va.end,		\
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r__)->base.va.end - (r__)->base.v=
a.start)
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
> @@ -61,6 +90,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm
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
> =C2=A0	u8 tile_mask =3D 0;
> =C2=A0	u8 id;
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
> =C2=A0	if (range->base.va.start < mmu_range->start)
> =C2=A0		*adj_start =3D range->base.va.start;
> @@ -139,6 +174,11 @@ static void xe_svm_invalidate(struct drm_gpusvm
> *gpusvm,
> =C2=A0	if (xe_vm_is_closed(vm))
> =C2=A0		return;
> =C2=A0
> +	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "INVALIDATE: asid=3D%u, gpusvm=3D0=
x%016llx, seqno=3D%lu,
> start=3D0x%016lx, end=3D0x%016lx, event=3D%d",
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->usm.asid, (u64)gpusvm, notifie=
r-
> >notifier.invalidate_seq,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmu_range->start, mmu_range->end, =
mmu_range->event);
> +
> =C2=A0	/* Adjust invalidation to notifier boundaries */
> =C2=A0	if (adj_start < notifier->interval.start)
> =C2=A0		adj_start =3D notifier->interval.start;
> @@ -218,8 +258,12 @@ static int __xe_svm_garbage_collector(struct
> xe_vm *vm,
> =C2=A0{
> =C2=A0	struct dma_fence *fence;
> =C2=A0
> -	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap)
> +	range_debug(range, "GARBAGE COLLECTOR");
> +
> +	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap) {
> +		range_debug(range, "GARBAGE COLLECTOT - EVICT");
Typo COLLECTOT

With those fixed,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>




> =C2=A0		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range-
> >base);
> +	}
> =C2=A0
> =C2=A0	xe_vm_lock(vm, false);
> =C2=A0	fence =3D xe_vm_range_unbind(vm, range);
> @@ -350,16 +394,23 @@ static int xe_svm_copy(struct page **pages,
> dma_addr_t *dma_addr,
> =C2=A0			int incr =3D (match && last) ? 1 : 0;
> =C2=A0
> =C2=A0			if (vram_addr !=3D VRAM_ADDR_INVALID) {
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
> @@ -377,14 +428,21 @@ static int xe_svm_copy(struct page **pages,
> dma_addr_t *dma_addr,
> =C2=A0			}
> =C2=A0
> =C2=A0			if (!match && last && dma_addr[i] && spage)
> {
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
> @@ -554,12 +612,14 @@ static struct xe_bo *xe_svm_alloc_vram(struct
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
> >base.va.end -
> @@ -582,8 +642,13 @@ static struct xe_bo *xe_svm_alloc_vram(struct
> xe_vm *vm, struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.va.start);
> =C2=A0
> =C2=A0	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> >blocks;
> -	list_for_each_entry(block, blocks, link)
> +	list_for_each_entry(block, blocks, link) {
> +		vm_dbg(&vm->xe->drm, "ALLOC VRAM: asid=3D%u,
> gpusvm=3D0x%016llx, pfn=3D%llu, npages=3D%llu",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->usm.asid, (u64)&vm->svm.gpusv=
m,
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
> @@ -637,6 +702,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (xe_svm_range_is_valid(range, tile))
> =C2=A0		return 0;
> =C2=A0
> +	range_debug(range, "PAGE FAULT");
> +
> =C2=A0	/* XXX: Add migration policy, for now migrate range once */
> =C2=A0	if (IS_DGFX(vm->xe) && !range->migrated &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 range->base.flags.migrate_devmem &&
> @@ -646,25 +713,33 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0		bo =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> =C2=A0		if (IS_ERR(bo)) {
> =C2=A0			drm_info(&vm->xe->drm,
> -				 "VRAM allocation failed, falling
> back to retrying, asid=3D%u, errno %ld\n",
> -				 vm->usm.asid, PTR_ERR(bo));
> +				 "VRAM allocation failed, falling
> back to retrying, asid=3D%u, gpusvm=3D0x%016llx, errno %ld\n",
> +				 vm->usm.asid, (u64)&vm->svm.gpusvm,
> +				 PTR_ERR(bo));
> =C2=A0			bo =3D NULL;
> =C2=A0			goto retry;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	range_debug(range, "GET PAGES");
> =C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> -	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where CPU
> mappings have change */
> =C2=A0	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -EP=
ERM)
> {	/* Corner where CPU mappings have change */
> -		if (err =3D=3D -EOPNOTSUPP)
> +		if (err =3D=3D -EOPNOTSUPP) {
> +			range_debug(range, "PAGE FAULT - EVICT
> PAGES");
> =C2=A0			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> &range->base);
> +		}
> =C2=A0		drm_info(&vm->xe->drm,
> =C2=A0			 "Get pages failed, falling back to
> retrying, asid=3D%u, gpusvm=3D0x%016llx, errno %d\n",
> =C2=A0			 vm->usm.asid, (u64)&vm->svm.gpusvm, err);
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
> @@ -680,8 +755,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
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
> index 5b9d5ac9ef72..139acee41b42 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -36,6 +36,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic);
> =C2=A0bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> =C2=A0
> +void xe_svm_range_debug(struct xe_svm_range *range, const char
> *operation);
> +
> =C2=A0int xe_svm_bo_evict(struct xe_bo *bo);
> =C2=A0
> =C2=A0static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)

