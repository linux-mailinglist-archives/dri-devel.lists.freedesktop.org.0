Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B436A2BF9C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 10:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C47D10EA88;
	Fri,  7 Feb 2025 09:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cx+ybPnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C70A10E0FA;
 Fri,  7 Feb 2025 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738921080; x=1770457080;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6lBjhWSUS4Ch+zveRAk4BYg1BBX9VIHhNNlEsfX2/mI=;
 b=Cx+ybPnwfVPHu1tjbkMi0YaDxhrmNEjB1sfzKGHPHXAzNN1l3R0ZUrQK
 9HZzk8NVb9o7LOb/sHoqpR3Qp5JCdodhmCuw5L7GYD+K3jOOXgy+O06AJ
 +ECiycGXnQ7cgNJzFMIxWZAEry4b93zPDzGkmVO8tI+eqS1q+BhEaGkq3
 w0JxDhAFShfHC6R7w8a1XV4G+bzT+bBIG1kO/KbxZ68CYILrXQSWFAO1f
 2yOGeQ83/A1O1XbaCM/ozXpvAZfz8DUsrA3J5EUpfz5+uoMytKogJ3DSk
 aYY4OF3uWlgMHhbHC+dTXOYP60y1AANyWIPDqN6bWwHLsGN9Vay9ADCNT g==;
X-CSE-ConnectionGUID: gp9tF/JxRD2V8+9Mm1mufA==
X-CSE-MsgGUID: +oOoUv69RcSV0WheiIJrIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39708887"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39708887"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:38:00 -0800
X-CSE-ConnectionGUID: LOfdGbErSEKN08NA//+ywg==
X-CSE-MsgGUID: KO7QesyfRM6lUr9OL9P92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111444916"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:37:56 -0800
Message-ID: <0e38e3507a4b9aafd377fc24cf4aa0839db4765a.camel@linux.intel.com>
Subject: Re: [PATCH v4 08/33] drm/xe/uapi: Add
 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 10:37:53 +0100
In-Reply-To: <20250129195212.745731-9-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-9-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> Add the DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag, which is used to
> create unpopulated virtual memory areas (VMAs) without memory backing
> or
> GPU page tables. These VMAs are referred to as CPU address mirror
> VMAs.
> The idea is that upon a page fault or prefetch, the memory backing
> and
> GPU page tables will be populated.
>=20
> CPU address mirror VMAs only update GPUVM state; they do not have an
> internal page table (PT) state, nor do they have GPU mappings.
>=20
> It is expected that CPU address mirror VMAs will be mixed with buffer
> object (BO) VMAs within a single VM. In other words, system
> allocations
> and runtime allocations can be mixed within a single user-mode driver
> (UMD) program.
>=20
> Expected usage:
>=20
> - Bind the entire virtual address (VA) space upon program load using
> the
> =C2=A0 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag.
> - If a buffer object (BO) requires GPU mapping (runtime allocation),
> =C2=A0 allocate a CPU address using mmap(PROT_NONE), bind the BO to the
> =C2=A0 mmapped address using existing bind IOCTLs. If a CPU map of the BO
> is
> =C2=A0 needed, mmap it again to the same CPU address using mmap(MAP_FIXED=
)
> - If a BO no longer requires GPU mapping, munmap it from the CPU
> address
> =C2=A0 space and them bind the mapping address with the
> =C2=A0 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag.
> - Any malloc'd or mmapped CPU address accessed by the GPU will be
> =C2=A0 faulted in via the SVM implementation (system allocation).
> - Upon freeing any mmapped or malloc'd data, the SVM implementation
> will
> =C2=A0 remove GPU mappings.
>=20
> Only supporting 1 to 1 mapping between user address space and GPU
> address space at the moment as that is the expected use case. uAPI
> defines interface for non 1 to 1 but enforces 1 to 1, this
> restriction
> can be lifted if use cases arrise for non 1 to 1 mappings.
>=20
> This patch essentially short-circuits the code in the existing VM
> bind
> paths to avoid populating page tables when the
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag is set.
>=20
> v3:
> =C2=A0- Call vm_bind_ioctl_ops_fini on -ENODATA
> =C2=A0- Don't allow DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR on non-faulting
> VMs
> =C2=A0-
> s/DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR/DRM_XE_VM_BIND_FLAG_CPU_ADDR_M
> IRROR (Thomas)
> =C2=A0- Rework commit message for expected usage (Thomas)
> =C2=A0- Describe state of code after patch in commit message (Thomas)
> v4:
> =C2=A0- Fix alignment (Checkpatch)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 76 ++++++++++++----
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15=
0 +++++++++++++++++++----------
> --
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0=C2=A0 3 +
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 19 +++-
> =C2=A05 files changed, 182 insertions(+), 74 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..99b97bf37c05 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1069,6 +1069,11 @@ static int op_add_deps(struct xe_vm *vm,
> struct xe_vma_op *op,
> =C2=A0{
> =C2=A0	int err =3D 0;
> =C2=A0
> +	/*
> +	 * No need to check for is_cpu_addr_mirror here as
> vma_add_deps is a
> +	 * NOP if VMA is_cpu_addr_mirror
> +	 */
> +
> =C2=A0	switch (op->base.op) {
> =C2=A0	case DRM_GPUVA_OP_MAP:
> =C2=A0		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> @@ -1646,6 +1651,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> =C2=A0	int err;
> =C2=A0
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> =C2=A0	xe_bo_assert_held(xe_vma_bo(vma));
> =C2=A0
> =C2=A0	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> @@ -1713,6 +1719,7 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0	if (!((vma->tile_present | vma->tile_staged) & BIT(tile-
> >id)))
> =C2=A0		return 0;
> =C2=A0
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> =C2=A0	xe_bo_assert_held(xe_vma_bo(vma));
> =C2=A0
> =C2=A0	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> @@ -1759,15 +1766,21 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0
> =C2=A0	switch (op->base.op) {
> =C2=A0	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm))
> ||
> +		=C2=A0=C2=A0=C2=A0 op->map.is_cpu_addr_mirror)
> =C2=A0			break;
> =C2=A0
> =C2=A0		err =3D bind_op_prepare(vm, tile, pt_update_ops, op-
> >map.vma);
> =C2=A0		pt_update_ops->wait_vm_kernel =3D true;
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> -		err =3D unbind_op_prepare(tile, pt_update_ops,
> -					gpuva_to_vma(op-
> >base.remap.unmap->va));
> +	{
> +		struct xe_vma *old =3D gpuva_to_vma(op-
> >base.remap.unmap->va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(old))
> +			break;
> +
> +		err =3D unbind_op_prepare(tile, pt_update_ops, old);
> =C2=A0
> =C2=A0		if (!err && op->remap.prev) {
> =C2=A0			err =3D bind_op_prepare(vm, tile,
> pt_update_ops,
> @@ -1780,15 +1793,28 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0			pt_update_ops->wait_vm_bookkeep =3D true;
> =C2=A0		}
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> -		err =3D unbind_op_prepare(tile, pt_update_ops,
> -					gpuva_to_vma(op-
> >base.unmap.va));
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			break;
> +
> +		err =3D unbind_op_prepare(tile, pt_update_ops, vma);
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> -		err =3D bind_op_prepare(vm, tile, pt_update_ops,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.prefetch.va));
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.prefetch.va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			break;
> +
> +		err =3D bind_op_prepare(vm, tile, pt_update_ops, vma);
> =C2=A0		pt_update_ops->wait_vm_kernel =3D true;
> =C2=A0		break;
> +	}
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> @@ -1858,6 +1884,8 @@ static void bind_op_commit(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0 struct xe_vma *vma, struct dma_fence
> *fence,
> =C2=A0			=C2=A0=C2=A0 struct dma_fence *fence2)
> =C2=A0{
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> +
> =C2=A0	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> =C2=A0		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> fence,
> =C2=A0				=C2=A0=C2=A0 pt_update_ops->wait_vm_bookkeep ?
> @@ -1891,6 +1919,8 @@ static void unbind_op_commit(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma, struct dma_fence
> *fence,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *fence2)
> =C2=A0{
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> +
> =C2=A0	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> =C2=A0		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> fence,
> =C2=A0				=C2=A0=C2=A0 pt_update_ops->wait_vm_bookkeep ?
> @@ -1925,16 +1955,21 @@ static void op_commit(struct xe_vm *vm,
> =C2=A0
> =C2=A0	switch (op->base.op) {
> =C2=A0	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm))
> ||
> +		=C2=A0=C2=A0=C2=A0 op->map.is_cpu_addr_mirror)
> =C2=A0			break;
> =C2=A0
> =C2=A0		bind_op_commit(vm, tile, pt_update_ops, op->map.vma,
> fence,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence2);
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> -		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.remap.unmap-
> >va), fence,
> -				 fence2);
> +	{
> +		struct xe_vma *old =3D gpuva_to_vma(op-
> >base.remap.unmap->va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(old))
> +			break;
> +
> +		unbind_op_commit(vm, tile, pt_update_ops, old,
> fence, fence2);
> =C2=A0
> =C2=A0		if (op->remap.prev)
> =C2=A0			bind_op_commit(vm, tile, pt_update_ops, op-
> >remap.prev,
> @@ -1943,14 +1978,25 @@ static void op_commit(struct xe_vm *vm,
> =C2=A0			bind_op_commit(vm, tile, pt_update_ops, op-
> >remap.next,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence, fence2);
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> -		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.unmap.va),
> fence, fence2);
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> +
> +		if (!xe_vma_is_cpu_addr_mirror(vma))
> +			unbind_op_commit(vm, tile, pt_update_ops,
> vma, fence,
> +					 fence2);
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> -		bind_op_commit(vm, tile, pt_update_ops,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op->base.prefetch.v=
a),
> fence, fence2);
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.prefetch.va);
> +
> +		if (!xe_vma_is_cpu_addr_mirror(vma))
> +			bind_op_commit(vm, tile, pt_update_ops, vma,
> fence,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence2);
> =C2=A0		break;
> +	}
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 690330352d4c..dff10dfa9c69 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -901,9 +901,10 @@ static void xe_vma_free(struct xe_vma *vma)
> =C2=A0		kfree(vma);
> =C2=A0}
> =C2=A0
> -#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
> -#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
> -#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> +#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
> +#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
> +#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
> +#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
> =C2=A0
> =C2=A0static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct xe_bo *bo,
> @@ -917,6 +918,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0	bool read_only =3D (flags & VMA_CREATE_FLAG_READ_ONLY);
> =C2=A0	bool is_null =3D (flags & VMA_CREATE_FLAG_IS_NULL);
> =C2=A0	bool dumpable =3D (flags & VMA_CREATE_FLAG_DUMPABLE);
> +	bool is_cpu_addr_mirror =3D
> +		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
> =C2=A0
> =C2=A0	xe_assert(vm->xe, start < end);
> =C2=A0	xe_assert(vm->xe, end < vm->size);
> @@ -925,7 +928,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0	 * Allocate and ensure that the xe_vma_is_userptr() return
> =C2=A0	 * matches what was allocated.
> =C2=A0	 */
> -	if (!bo && !is_null) {
> +	if (!bo && !is_null && !is_cpu_addr_mirror) {
> =C2=A0		struct xe_userptr_vma *uvma =3D kzalloc(sizeof(*uvma),
> GFP_KERNEL);
> =C2=A0
> =C2=A0		if (!uvma)
> @@ -937,6 +940,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0		if (!vma)
> =C2=A0			return ERR_PTR(-ENOMEM);
> =C2=A0
> +		if (is_cpu_addr_mirror)
> +			vma->gpuva.flags |=3D XE_VMA_SYSTEM_ALLOCATOR;
> =C2=A0		if (is_null)
> =C2=A0			vma->gpuva.flags |=3D DRM_GPUVA_SPARSE;
> =C2=A0		if (bo)
> @@ -979,7 +984,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0		drm_gpuva_link(&vma->gpuva, vm_bo);
> =C2=A0		drm_gpuvm_bo_put(vm_bo);
> =C2=A0	} else /* userptr or null */ {
> -		if (!is_null) {
> +		if (!is_null && !is_cpu_addr_mirror) {
> =C2=A0			struct xe_userptr *userptr =3D
> &to_userptr_vma(vma)->userptr;
> =C2=A0			u64 size =3D end - start + 1;
> =C2=A0			int err;
> @@ -1029,7 +1034,7 @@ static void xe_vma_destroy_late(struct xe_vma
> *vma)
> =C2=A0		 */
> =C2=A0		mmu_interval_notifier_remove(&userptr->notifier);
> =C2=A0		xe_vm_put(vm);
> -	} else if (xe_vma_is_null(vma)) {
> +	} else if (xe_vma_is_null(vma) ||
> xe_vma_is_cpu_addr_mirror(vma)) {
> =C2=A0		xe_vm_put(vm);
> =C2=A0	} else {
> =C2=A0		xe_bo_put(xe_vma_bo(vma));
> @@ -1068,7 +1073,7 @@ static void xe_vma_destroy(struct xe_vma *vma,
> struct dma_fence *fence)
> =C2=A0		spin_lock(&vm->userptr.invalidated_lock);
> =C2=A0		list_del(&to_userptr_vma(vma)-
> >userptr.invalidate_link);
> =C2=A0		spin_unlock(&vm->userptr.invalidated_lock);
> -	} else if (!xe_vma_is_null(vma)) {
> +	} else if (!xe_vma_is_null(vma) &&
> !xe_vma_is_cpu_addr_mirror(vma)) {
> =C2=A0		xe_bo_assert_held(xe_vma_bo(vma));
> =C2=A0
> =C2=A0		drm_gpuva_unlink(&vma->gpuva);
> @@ -1968,6 +1973,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> struct xe_bo *bo,
> =C2=A0			op->map.read_only =3D
> =C2=A0				flags &
> DRM_XE_VM_BIND_FLAG_READONLY;
> =C2=A0			op->map.is_null =3D flags &
> DRM_XE_VM_BIND_FLAG_NULL;
> +			op->map.is_cpu_addr_mirror =3D flags &
> +				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> =C2=A0			op->map.dumpable =3D flags &
> DRM_XE_VM_BIND_FLAG_DUMPABLE;
> =C2=A0			op->map.pat_index =3D pat_index;
> =C2=A0		} else if (__op->op =3D=3D DRM_GPUVA_OP_PREFETCH) {
> @@ -2160,6 +2167,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct drm_gpuva_ops *ops,
> =C2=A0				VMA_CREATE_FLAG_IS_NULL : 0;
> =C2=A0			flags |=3D op->map.dumpable ?
> =C2=A0				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |=3D op->map.is_cpu_addr_mirror ?
> +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR
> : 0;
> =C2=A0
> =C2=A0			vma =3D new_vma(vm, &op->base.map, op-
> >map.pat_index,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags);
> @@ -2167,7 +2176,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct drm_gpuva_ops *ops,
> =C2=A0				return PTR_ERR(vma);
> =C2=A0
> =C2=A0			op->map.vma =3D vma;
> -			if (op->map.immediate ||
> !xe_vm_in_fault_mode(vm))
> +			if ((op->map.immediate ||
> !xe_vm_in_fault_mode(vm)) &&
> +			=C2=A0=C2=A0=C2=A0 !op->map.is_cpu_addr_mirror)
> =C2=A0				xe_vma_ops_incr_pt_update_ops(vops,
> =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op-
> >tile_mask);
> =C2=A0			break;
> @@ -2176,21 +2186,24 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0		{
> =C2=A0			struct xe_vma *old =3D
> =C2=A0				gpuva_to_vma(op->base.remap.unmap-
> >va);
> +			bool skip =3D xe_vma_is_cpu_addr_mirror(old);
> =C2=A0
> =C2=A0			op->remap.start =3D xe_vma_start(old);
> =C2=A0			op->remap.range =3D xe_vma_size(old);
> =C2=A0
> -			if (op->base.remap.prev) {
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_READ_ONLY ?
> -					VMA_CREATE_FLAG_READ_ONLY :
> 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					DRM_GPUVA_SPARSE ?
> -					VMA_CREATE_FLAG_IS_NULL : 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_DUMPABLE ?
> -					VMA_CREATE_FLAG_DUMPABLE :
> 0;
> +			flags |=3D op->base.remap.unmap->va->flags &
> +				XE_VMA_READ_ONLY ?
> +				VMA_CREATE_FLAG_READ_ONLY : 0;
> +			flags |=3D op->base.remap.unmap->va->flags &
> +				DRM_GPUVA_SPARSE ?
> +				VMA_CREATE_FLAG_IS_NULL : 0;
> +			flags |=3D op->base.remap.unmap->va->flags &
> +				XE_VMA_DUMPABLE ?
> +				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |=3D xe_vma_is_cpu_addr_mirror(old) ?
> +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR
> : 0;
> =C2=A0
> +			if (op->base.remap.prev) {
> =C2=A0				vma =3D new_vma(vm, op-
> >base.remap.prev,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old->pat_index,
> flags);
> =C2=A0				if (IS_ERR(vma))
> @@ -2202,9 +2215,10 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0				 * Userptr creates a new SG mapping
> so
> =C2=A0				 * we must also rebind.
> =C2=A0				 */
> -				op->remap.skip_prev =3D
> !xe_vma_is_userptr(old) &&
> +				op->remap.skip_prev =3D skip ||
> +					(!xe_vma_is_userptr(old) &&
> =C2=A0					IS_ALIGNED(xe_vma_end(vma),
> -						=C2=A0=C2=A0
> xe_vma_max_pte_size(old));
> +						=C2=A0=C2=A0
> xe_vma_max_pte_size(old)));
> =C2=A0				if (op->remap.skip_prev) {
> =C2=A0					xe_vma_set_pte_size(vma,
> xe_vma_max_pte_size(old));
> =C2=A0					op->remap.range -=3D
> @@ -2220,16 +2234,6 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0			}
> =C2=A0
> =C2=A0			if (op->base.remap.next) {
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_READ_ONLY ?
> -					VMA_CREATE_FLAG_READ_ONLY :
> 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					DRM_GPUVA_SPARSE ?
> -					VMA_CREATE_FLAG_IS_NULL : 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_DUMPABLE ?
> -					VMA_CREATE_FLAG_DUMPABLE :
> 0;
> -
> =C2=A0				vma =3D new_vma(vm, op-
> >base.remap.next,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old->pat_index,
> flags);
> =C2=A0				if (IS_ERR(vma))
> @@ -2241,9 +2245,10 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0				 * Userptr creates a new SG mapping
> so
> =C2=A0				 * we must also rebind.
> =C2=A0				 */
> -				op->remap.skip_next =3D
> !xe_vma_is_userptr(old) &&
> +				op->remap.skip_next =3D skip ||
> +					(!xe_vma_is_userptr(old) &&
> =C2=A0					IS_ALIGNED(xe_vma_start(vma)
> ,
> -						=C2=A0=C2=A0
> xe_vma_max_pte_size(old));
> +						=C2=A0=C2=A0
> xe_vma_max_pte_size(old)));
> =C2=A0				if (op->remap.skip_next) {
> =C2=A0					xe_vma_set_pte_size(vma,
> xe_vma_max_pte_size(old));
> =C2=A0					op->remap.range -=3D
> @@ -2256,14 +2261,27 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0					xe_vma_ops_incr_pt_update_op
> s(vops, op->tile_mask);
> =C2=A0				}
> =C2=A0			}
> -			xe_vma_ops_incr_pt_update_ops(vops, op-
> >tile_mask);
> +			if (!skip)
> +				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> =C2=A0			break;
> =C2=A0		}
> =C2=A0		case DRM_GPUVA_OP_UNMAP:
> +		{
> +			struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> +
> +			if (!xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> +			break;
> +		}
> =C2=A0		case DRM_GPUVA_OP_PREFETCH:
> +		{
> +			struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.prefetch.va);
> +
> =C2=A0			/* FIXME: Need to skip some prefetch ops */
> -			xe_vma_ops_incr_pt_update_ops(vops, op-
> >tile_mask);
> +			if (!xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> =C2=A0			break;
> +		}
> =C2=A0		default:
> =C2=A0			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0		}
> @@ -2665,10 +2683,12 @@ static void vm_bind_ioctl_ops_fini(struct
> xe_vm *vm, struct xe_vma_ops *vops,
> =C2=A0	}
> =C2=A0	if (ufence)
> =C2=A0		xe_sync_ufence_put(ufence);
> -	for (i =3D 0; i < vops->num_syncs; i++)
> -		xe_sync_entry_signal(vops->syncs + i, fence);
> -	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -	dma_fence_put(fence);
> +	if (fence) {
> +		for (i =3D 0; i < vops->num_syncs; i++)
> +			xe_sync_entry_signal(vops->syncs + i,
> fence);
> +		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> fence);
> +		dma_fence_put(fence);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> @@ -2691,6 +2711,8 @@ static int vm_bind_ioctl_ops_execute(struct
> xe_vm *vm,
> =C2=A0		fence =3D ops_execute(vm, vops);
> =C2=A0		if (IS_ERR(fence)) {
> =C2=A0			err =3D PTR_ERR(fence);
> +			if (err =3D=3D -ENODATA)
> +				vm_bind_ioctl_ops_fini(vm, vops,
> NULL);
> =C2=A0			goto unlock;
> =C2=A0		}
> =C2=A0
> @@ -2707,7 +2729,8 @@
> ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> =C2=A0	(DRM_XE_VM_BIND_FLAG_READONLY | \
> =C2=A0	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> =C2=A0	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> =C2=A0
> =C2=A0#ifdef TEST_VM_OPS_ERROR
> =C2=A0#define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB |
> FORCE_OP_ERROR)
> @@ -2718,7 +2741,7 @@
> ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> =C2=A0#define XE_64K_PAGE_MASK 0xffffull
> =C2=A0#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> =C2=A0
> -static int vm_bind_ioctl_check_args(struct xe_device *xe,
> +static int vm_bind_ioctl_check_args(struct xe_device *xe, struct
> xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct drm_xe_vm_bind *args,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct drm_xe_vm_bind_op
> **bind_ops)
> =C2=A0{
> @@ -2763,9 +2786,23 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0		u64 obj_offset =3D (*bind_ops)[i].obj_offset;
> =C2=A0		u32 prefetch_region =3D
> (*bind_ops)[i].prefetch_mem_region_instance;
> =C2=A0		bool is_null =3D flags & DRM_XE_VM_BIND_FLAG_NULL;
> +		bool is_cpu_addr_mirror =3D flags &
> +			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> =C2=A0		u16 pat_index =3D (*bind_ops)[i].pat_index;
> =C2=A0		u16 coh_mode;
> =C2=A0
> +		/* FIXME: Disabling CPU address mirror for now */
> +		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
> +			err =3D -EOPNOTSUPP;
> +			goto free_bind_ops;
> +		}
> +
> +		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
> +				 !xe_vm_in_fault_mode(vm))) {
> +			err =3D -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
> =C2=A0		if (XE_IOCTL_DBG(xe, pat_index >=3D xe-
> >pat.n_entries)) {
> =C2=A0			err =3D -EINVAL;
> =C2=A0			goto free_bind_ops;
> @@ -2786,13 +2823,14 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0
> =C2=A0		if (XE_IOCTL_DBG(xe, op >
> DRM_XE_VM_BIND_OP_PREFETCH) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> -		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj && is_null) ||
> -		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj_offset && is_null) ||
> +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj && (is_null ||
> is_cpu_addr_mirror)) ||
> +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj_offset && (is_null ||
> +						=C2=A0=C2=A0=C2=A0
> is_cpu_addr_mirror)) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, op !=3D DRM_XE_VM_BIND_OP_MAP=
 &&
> -				 is_null) ||
> +				 (is_null || is_cpu_addr_mirror)) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, !obj &&
> =C2=A0				 op =3D=3D DRM_XE_VM_BIND_OP_MAP &&
> -				 !is_null) ||
> +				 !is_null && !is_cpu_addr_mirror) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, !obj &&
> =C2=A0				 op =3D=3D DRM_XE_VM_BIND_OP_UNMAP_ALL)
> ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, addr &&
> @@ -2934,15 +2972,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	int err;
> =C2=A0	int i;
> =C2=A0
> -	err =3D vm_bind_ioctl_check_args(xe, args, &bind_ops);
> +	vm =3D xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	err =3D vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
> =C2=A0	if (err)
> -		return err;
> +		goto put_vm;
> =C2=A0
> =C2=A0	if (args->exec_queue_id) {
> =C2=A0		q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> =C2=A0		if (XE_IOCTL_DBG(xe, !q)) {
> =C2=A0			err =3D -ENOENT;
> -			goto free_objs;
> +			goto put_vm;
> =C2=A0		}
> =C2=A0
> =C2=A0		if (XE_IOCTL_DBG(xe, !(q->flags &
> EXEC_QUEUE_FLAG_VM))) {
> @@ -2951,15 +2993,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	vm =3D xe_vm_lookup(xef, args->vm_id);
> -	if (XE_IOCTL_DBG(xe, !vm)) {
> -		err =3D -EINVAL;
> -		goto put_exec_queue;
> -	}
> -
> =C2=A0	err =3D down_write_killable(&vm->lock);
> =C2=A0	if (err)
> -		goto put_vm;
> +		goto put_exec_queue;
> =C2=A0
> =C2=A0	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> =C2=A0		err =3D -ENOENT;
> @@ -3116,12 +3152,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0		xe_bo_put(bos[i]);
> =C2=A0release_vm_lock:
> =C2=A0	up_write(&vm->lock);
> -put_vm:
> -	xe_vm_put(vm);
> =C2=A0put_exec_queue:
> =C2=A0	if (q)
> =C2=A0		xe_exec_queue_put(q);
> -free_objs:
> +put_vm:
> +	xe_vm_put(vm);
> =C2=A0	kvfree(bos);
> =C2=A0	kvfree(ops);
> =C2=A0	if (args->num_binds > 1)
> @@ -3178,6 +3213,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	xe_assert(xe, !xe_vma_is_null(vma));
> +	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> =C2=A0	trace_xe_vma_invalidate(vma);
> =C2=A0
> =C2=A0	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 23adb7442881..0e54a0e8768d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -150,6 +150,11 @@ static inline bool xe_vma_is_null(struct xe_vma
> *vma)
> =C2=A0	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
> =C2=A0}
> =C2=A0
> +static inline bool xe_vma_is_cpu_addr_mirror(struct xe_vma *vma)
> +{
> +	return vma->gpuva.flags & XE_VMA_SYSTEM_ALLOCATOR;
> +}
> +
> =C2=A0static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> =C2=A0{
> =C2=A0	return !xe_vma_bo(vma);
> @@ -157,7 +162,8 @@ static inline bool xe_vma_has_no_bo(struct xe_vma
> *vma)
> =C2=A0
> =C2=A0static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> =C2=A0{
> -	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> +	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma) &&
> +		!xe_vma_is_cpu_addr_mirror(vma);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7f9a303e51d8..f6855e4fb9e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -42,6 +42,7 @@ struct xe_vm_pgtable_update_op;
> =C2=A0#define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 6)
> =C2=A0#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
> =C2=A0#define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
> +#define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
> =C2=A0
> =C2=A0/** struct xe_userptr - User pointer */
> =C2=A0struct xe_userptr {
> @@ -294,6 +295,8 @@ struct xe_vma_op_map {
> =C2=A0	bool read_only;
> =C2=A0	/** @is_null: is NULL binding */
> =C2=A0	bool is_null;
> +	/** @is_cpu_addr_mirror: is CPU address mirror binding */
> +	bool is_cpu_addr_mirror;
> =C2=A0	/** @dumpable: whether BO is dumped on GPU hang */
> =C2=A0	bool dumpable;
> =C2=A0	/** @pat_index: The pat index to use for this operation. */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e2160330ad01..b86dc1b4c2fe 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -933,6 +933,12 @@ struct drm_xe_vm_destroy {
> =C2=A0 *=C2=A0=C2=A0=C2=A0 will only be valid for DRM_XE_VM_BIND_OP_MAP o=
perations, the
> BO
> =C2=A0 *=C2=A0=C2=A0=C2=A0 handle MBZ, and the BO offset MBZ. This flag i=
s intended to
> =C2=A0 *=C2=A0=C2=A0=C2=A0 implement VK sparse bindings.
> + *=C2=A0 - %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR - When the CPU address
> mirror flag is
> + *=C2=A0=C2=A0=C2=A0 set, no mappings are created rather the range is re=
served for
> CPU address
> + *=C2=A0=C2=A0=C2=A0 mirroring which will be populated on GPU page fault=
s or
> prefetches. Only
> + *=C2=A0=C2=A0=C2=A0 valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE =
set. The
> CPU address
> + *=C2=A0=C2=A0=C2=A0 mirror flag are only valid for DRM_XE_VM_BIND_OP_MA=
P
> operations, the BO
> + *=C2=A0=C2=A0=C2=A0 handle MBZ, and the BO offset MBZ.
> =C2=A0 */
> =C2=A0struct drm_xe_vm_bind_op {
> =C2=A0	/** @extensions: Pointer to the first extension struct, if
> any */
> @@ -985,7 +991,9 @@ struct drm_xe_vm_bind_op {
> =C2=A0	 * on the @pat_index. For such mappings there is no actual
> memory being
> =C2=A0	 * mapped (the address in the PTE is invalid), so the
> various PAT memory
> =C2=A0	 * attributes likely do not apply.=C2=A0 Simply leaving as zero
> is one
> -	 * option (still a valid pat_index).
> +	 * option (still a valid pat_index). Same applies to
> +	 * DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR bindings as for such
> mapping
> +	 * there is no actual memory being mapped.
> =C2=A0	 */
> =C2=A0	__u16 pat_index;
> =C2=A0
> @@ -1001,6 +1009,14 @@ struct drm_xe_vm_bind_op {
> =C2=A0
> =C2=A0		/** @userptr: user pointer to bind on */
> =C2=A0		__u64 userptr;
> +
> +		/**
> +		 * @cpu_addr_mirror_offset: Offset from GPU @addr to
> create
> +		 * CPU address mirror mappings. MBZ with current
> level of
> +		 * support (e.g. 1 to 1 mapping between GPU and CPU
> mappings
> +		 * only supported).
> +		 */
> +		__s64 cpu_addr_mirror_offset;
> =C2=A0	};
> =C2=A0
> =C2=A0	/**
> @@ -1023,6 +1039,7 @@ struct drm_xe_vm_bind_op {
> =C2=A0#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> =C2=A0#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> =C2=A0#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 4)
> =C2=A0	/** @flags: Bind flags */
> =C2=A0	__u32 flags;
> =C2=A0

