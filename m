Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C615A2C38C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A711610E31E;
	Fri,  7 Feb 2025 13:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIyO/JrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE6B10E31D;
 Fri,  7 Feb 2025 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738934970; x=1770470970;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qDxl/Yz57zKhcSKSO5wRnzZjxPDb5x83teDe8RXVuPE=;
 b=VIyO/JrJCrS2ynk/Ig/TF+qJhC9aL9H/4RPp2cAtBLpOOLeKZV6qg78M
 wQZIpXf6FuXFd4IqPZLv8FMJF+WnWXj8TE55wdA2rENj58zONgexVso0J
 RZOpU8MS3rxT0kOpSBf6n+F1OP5PQPBbyCp1yTuquoIoMoccvCkSk8Gx+
 +3JI0zApBS6CFYCtv/K3jiyZGeDbIM28/FccM5yHXv0PvjaoByZ35PnuT
 hR/EEA7vc1fIs6uKJjUK54Q+EvBB6F7AaPToKB7YzTFw32Di5AdIBdMLJ
 oiyCvjdnl2Ol00iX+o+bOUSSwV4egO/MBcXihIN9Ub7yK8/Mfibg9mChY g==;
X-CSE-ConnectionGUID: PDzmcJlQTyC3uSrkak3bZw==
X-CSE-MsgGUID: I6DWoiomTbOddc/HzN8J4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39481515"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39481515"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:29:29 -0800
X-CSE-ConnectionGUID: pvQ2ZDGPTumyLNSmDxwpVA==
X-CSE-MsgGUID: d7k9S9MuQw+Was6xQu3WhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112154469"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:29:27 -0800
Message-ID: <0ecac8ea67d7c663766f780f5c96fc9cf4eb1cf0.camel@linux.intel.com>
Subject: Re: [PATCH v4 21/33] drm/xe: Add SVM device memory mirroring
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 14:29:24 +0100
In-Reply-To: <20250129195212.745731-22-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-22-matthew.brost@intel.com>
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
> Add SVM device memory mirroring which enables device pages for
> migration. Enabled via CONFIG_XE_DEVMEM_MIRROR Kconfig. Kconfig
> option
> defaults to enabled. If not enabled, SVM will work sans migration and
> KMD memory footprint will be less.
>=20
> v3:
> =C2=A0- Add CONFIG_XE_DEVMEM_MIRROR
> v4:
> =C2=A0- Fix Kconfig (Himal)
> =C2=A0- Use %pe to print errors (Thomas)
> =C2=A0- Fix alignment issue (Checkpatch)
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++++
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 62
> +++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/xe/xe_tile.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++
> =C2=A05 files changed, 85 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 60b922f75001..4bc03d6f6720 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -74,6 +74,15 @@ config DRM_XE_DP_TUNNEL
> =C2=A0
> =C2=A0	=C2=A0 If in doubt say "Y".
> =C2=A0
> +config DRM_XE_DEVMEM_MIRROR
> +	bool "Enable device memory mirror"
> +	depends on DRM_XE
> +	select GET_FREE_REGION
> +	default y
> +	help
> +	=C2=A0 Disable this option only if you want to compile out
> without device
> +	=C2=A0 memory mirror. Will reduce KMD memory footprint when
> disabled.
> +
> =C2=A0config DRM_XE_FORCE_PROBE
> =C2=A0	string "Force probe xe for selected Intel hardware IDs"
> =C2=A0	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 71151532e28f..da5bf145324b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -104,6 +104,14 @@ struct xe_mem_region {
> =C2=A0	resource_size_t actual_physical_size;
> =C2=A0	/** @mapping: pointer to VRAM mappable space */
> =C2=A0	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index ee150139470f..985ac20c5b07 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -19,6 +19,11 @@ static struct xe_vm *range_to_vm(struct
> drm_gpusvm_range *r)
> =C2=A0	return gpusvm_to_vm(r->gpusvm);
> =C2=A0}
> =C2=A0
> +static void *xe_svm_devm_owner(struct xe_device *xe)
> +{
> +	return xe;
> +}
> +
> =C2=A0static struct drm_gpusvm_range *
> =C2=A0xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> =C2=A0{
> @@ -307,8 +312,8 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0		=C2=A0 xe_svm_garbage_collector_work_func);
> =C2=A0
> =C2=A0	err =3D drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, NULL, 0, vm->size,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SZ_512M, &gpusvm_ops,
> fault_chunk_sizes,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, xe_svm_devm_owner(vm-
> >xe), 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->size, SZ_512M, &gpusvm_ops,
> fault_chunk_sizes,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(fault_chunk_sizes));
> =C2=A0	if (err)
> =C2=A0		return err;
> @@ -443,3 +448,56 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64
> start, u64 end)
> =C2=A0{
> =C2=A0	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> =C2=A0}
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +/**
> + * xe_devm_add: Remap and provide memmap backing for device memory
> + * @tile: tile that the memory region belongs to
> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and
> create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	struct xe_device *xe =3D tile_to_xe(tile);
> +	struct device *dev =3D &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res =3D devm_request_free_mem_region(dev, &iomem_resource,
> +					=C2=A0=C2=A0 mr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret =3D PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start =3D res->start;
> +	mr->pagemap.range.end =3D res->end;
> +	mr->pagemap.nr_range =3D 1;
> +	mr->pagemap.ops =3D drm_gpusvm_pagemap_ops_get();
> +	mr->pagemap.owner =3D xe_svm_devm_owner(xe);
> +	addr =3D devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start,
> resource_size(res));
> +		ret =3D PTR_ERR(addr);
> +		drm_err(&xe->drm, "Failed to remap tile %d memory,
> errno %pe\n",
> +			tile->id, ERR_PTR(ret));
> +		return ret;
> +	}
> +	mr->hpa_base =3D res->start;
> +
> +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to
> devm, remapped to %pr\n",
> +		 tile->id, mr->io_start, mr->io_start + mr-
> >usable_size, res);
> +	return 0;
> +}
> +#else
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index b181c174ca61..63daffdfdbf6 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -11,6 +11,7 @@
> =C2=A0
> =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> =C2=A0
> +struct xe_mem_region;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> =C2=A0struct xe_vma;
> @@ -36,6 +37,8 @@ struct xe_svm_range {
> =C2=A0	u8 tile_invalidated;
> =C2=A0};
> =C2=A0
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> +
> =C2=A0int xe_svm_init(struct xe_vm *vm);
> =C2=A0
> =C2=A0void xe_svm_fini(struct xe_vm *vm);
> diff --git a/drivers/gpu/drm/xe/xe_tile.c
> b/drivers/gpu/drm/xe/xe_tile.c
> index 2825553b568f..6c80a637ded5 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -13,6 +13,7 @@
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_pcode.h"
> =C2=A0#include "xe_sa.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_tile.h"
> =C2=A0#include "xe_tile_sysfs.h"
> =C2=A0#include "xe_ttm_vram_mgr.h"
> @@ -164,6 +165,7 @@ static int tile_ttm_mgr_init(struct xe_tile
> *tile)
> =C2=A0 */
> =C2=A0int xe_tile_init_noalloc(struct xe_tile *tile)
> =C2=A0{
> +	struct xe_device *xe =3D tile_to_xe(tile);
> =C2=A0	int err;
> =C2=A0
> =C2=A0	err =3D tile_ttm_mgr_init(tile);
> @@ -172,6 +174,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> =C2=A0
> =C2=A0	xe_wa_apply_tile_workarounds(tile);
> =C2=A0
> +	if (xe->info.has_usm && IS_DGFX(xe))
> +		xe_devm_add(tile, &tile->mem.vram);
> +
> =C2=A0	err =3D xe_tile_sysfs_init(tile);
> =C2=A0
> =C2=A0	return 0;

