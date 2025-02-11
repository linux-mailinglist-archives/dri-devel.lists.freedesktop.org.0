Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E17A30F71
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 16:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA3910E6E6;
	Tue, 11 Feb 2025 15:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mA8xVGN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4B610E03C;
 Tue, 11 Feb 2025 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739287056; x=1770823056;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xCnLiySKpceoFmJdLSoSM3822rYPheYtT13H0u2Y5JA=;
 b=mA8xVGN/iWvT+1MOBGYjJAgk/McFUEEbm7ndzuIDLPXC9KIrrrgzX8XY
 41lZJR9dAiRcBXI9BbcBsNG37NKl1WT7NOoT1dmcI6kUXe7WEtLx9bQip
 OrtJpA3ybofpnVmbVGUmnmfZe3XovwL1BT+gl6wbyP6++4sFhS5VGm7cd
 lp3yOfzMv6xQWJDd9FFg+9/leRffGQh7SEU5MDLXANA/GwFvj+9j8RHe7
 2I/IEpx9xRxzu5NYAGdyBi/XRiR6/3LULeMRiOwAReXel6wPChqY38uYO
 wh2L0a078FX6BcuPWcr4uzgcoy5dDLy2QkD7gq54/FAJRj+nCv/jFw0/p g==;
X-CSE-ConnectionGUID: YDRs38k8T/Ob2p8VCdPOtg==
X-CSE-MsgGUID: nhg3cStZTfa9Mj5c6o0/Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57321708"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="57321708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 07:17:35 -0800
X-CSE-ConnectionGUID: CfQNSQD1R7mjuG4Aqg+vQQ==
X-CSE-MsgGUID: hpXFfHeXSbqv6QkJMDkg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="112360133"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.71])
 ([10.245.246.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 07:17:32 -0800
Message-ID: <d2c20e3ac7dc2815fb9ff434524fcaa3585d004f.camel@linux.intel.com>
Subject: Re: [PATCH v4 06/33] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 11 Feb 2025 16:17:04 +0100
In-Reply-To: <Z6o37Z6bbz/If3kV@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-7-matthew.brost@intel.com>
 <78ffd1a14e5fc9d5ab3c58ec56dfd5d061947642.camel@linux.intel.com>
 <Z6o37Z6bbz/If3kV@lstrano-desk.jf.intel.com>
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

On Mon, 2025-02-10 at 09:31 -0800, Matthew Brost wrote:
> On Fri, Feb 07, 2025 at 10:06:44AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > > This patch introduces support for GPU Shared Virtual Memory (SVM)
> > > in
> > > the
> > > Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> > > sharing of memory between the CPU and GPU, enhancing performance
> > > and
> > > flexibility in GPU computing tasks.
> > >=20
> > > The patch adds the necessary infrastructure for SVM, including
> > > data
> > > structures and functions for managing SVM ranges and notifiers.
> > > It
> > > also
> > > provides mechanisms for allocating, deallocating, and migrating
> > > memory
> > > regions between system RAM and GPU VRAM.
> > >=20
> > > This is largely inspired by GPUVM.
> > >=20
> > > v2:
> > > =C2=A0- Take order into account in check pages
> > > =C2=A0- Clear range->pages in get pages error
> > > =C2=A0- Drop setting dirty or accessed bit in get pages (Vetter)
> > > =C2=A0- Remove mmap assert for cpu faults
> > > =C2=A0- Drop mmap write lock abuse (Vetter, Christian)
> > > =C2=A0- Decouple zdd from range (Vetter, Oak)
> > > =C2=A0- Add drm_gpusvm_range_evict, make it work with coherent pages
> > > =C2=A0- Export drm_gpusvm_evict_to_sram, only use in BO evict path
> > > (Vetter)
> > > =C2=A0- mmget/put in drm_gpusvm_evict_to_sram
> > > =C2=A0- Drop range->vram_alloation variable
> > > =C2=A0- Don't return in drm_gpusvm_evict_to_sram until all pages
> > > detached
> > > =C2=A0- Don't warn on mixing sram and device pages
> > > =C2=A0- Update kernel doc
> > > =C2=A0- Add coherent page support to get pages
> > > =C2=A0- Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
> > > =C2=A0- Add struct drm_gpusvm_vram and ops (Thomas)
> > > =C2=A0- Update the range's seqno if the range is valid (Thomas)
> > > =C2=A0- Remove the is_unmapped check before hmm_range_fault (Thomas)
> > > =C2=A0- Use drm_pagemap (Thomas)
> > > =C2=A0- Drop kfree_mapping (Thomas)
> > > =C2=A0- dma mapp pages under notifier lock (Thomas)
> > > =C2=A0- Remove ctx.prefault
> > > =C2=A0- Remove ctx.mmap_locked
> > > =C2=A0- Add ctx.check_pages
> > > =C2=A0- s/vram/devmem (Thomas)
> > > v3:
> > > =C2=A0- Fix memory leak drm_gpusvm_range_get_pages
> > > =C2=A0- Only migrate pages with same zdd on CPU fault
> > > =C2=A0- Loop over al VMAs in drm_gpusvm_range_evict
> > > =C2=A0- Make GPUSVM a drm level module
> > > =C2=A0- GPL or MIT license
> > > =C2=A0- Update main kernel doc (Thomas)
> > > =C2=A0- Prefer foo() vs foo for functions in kernel doc (Thomas)
> > > =C2=A0- Prefer functions over macros (Thomas)
> > > =C2=A0- Use unsigned long vs u64 for addresses (Thomas)
> > > =C2=A0- Use standard interval_tree (Thomas)
> > > =C2=A0-
> > > s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_p
> > > age
> > > (Thomas)
> > > =C2=A0- Drop err_out label in drm_gpusvm_range_find_or_insert (Thomas=
)
> > > =C2=A0- Fix kernel doc in drm_gpusvm_range_free_pages (Thomas)
> > > =C2=A0- Newlines between functions defs in header file (Thomas)
> > > =C2=A0- Drop shall language in driver vfunc kernel doc (Thomas)
> > > =C2=A0- Move some static inlines from head to C file (Thomas)
> > > =C2=A0- Don't allocate pages under page lock in
> > > drm_gpusvm_migrate_populate_ram_pfn (Thomas)
> > > =C2=A0- Change check_pages to a threshold
> > > v4:
> > > =C2=A0- Fix NULL ptr deref in drm_gpusvm_migrate_populate_ram_pfn
> > > (Thomas,
> > > Himal)
> > > =C2=A0- Fix check pages threshold
> > > =C2=A0- Check for range being unmapped under notifier lock in get
> > > pages
> > > (Testing)
> > > =C2=A0- Fix characters per line
> > > =C2=A0- Drop WRITE_ONCE for zdd->devmem_allocation assignment (Thomas=
)
> > > =C2=A0- Use completion for devmem_allocation->detached (Thomas)
> > > =C2=A0- Make GPU SVM depend on ZONE_DEVICE (CI)
> > > =C2=A0- Use hmm_range_fault for eviction (Thomas)
> > > =C2=A0- Drop zdd worker (Thomas)
> > >=20
> > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 9 +
> > > =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 1 +
> > > =C2=A0drivers/gpu/drm/drm_gpusvm.c | 2240
> > > ++++++++++++++++++++++++++++++++++
> > > =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 445 ++=
+++++
> > > =C2=A04 files changed, 2695 insertions(+)
> > > =C2=A0create mode 100644 drivers/gpu/drm/drm_gpusvm.c
> > > =C2=A0create mode 100644 include/drm/drm_gpusvm.h
> > >=20
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > index fbef3f471bd0..f03862e379fb 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -278,6 +278,15 @@ config DRM_GPUVM
> > > =C2=A0	=C2=A0 GPU-VM representation providing helpers to manage a
> > > GPUs
> > > virtual
> > > =C2=A0	=C2=A0 address space
> > > =C2=A0
> > > +config DRM_GPUSVM
> > > +	tristate
> > > +	depends on DRM
> > > +	depends on DEVICE_MIGRATION
> > > +	depends on ZONE_DEVICE
> > > +	help
> > > +	=C2=A0 GPU-SVM representation providing helpers to manage a
> > > GPUs
> > > shared
> > > +	=C2=A0 virtual memory
> > > +
> > > =C2=A0config DRM_BUDDY
> > > =C2=A0	tristate
> > > =C2=A0	depends on DRM
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 85af94bb907d..ca03df8d2729 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -104,6 +104,7 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) +=3D
> > > drm_panel_backlight_quirks.o
> > > =C2=A0#
> > > =C2=A0obj-$(CONFIG_DRM_EXEC) +=3D drm_exec.o
> > > =C2=A0obj-$(CONFIG_DRM_GPUVM) +=3D drm_gpuvm.o
> > > +obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm.o
> > > =C2=A0
> > > =C2=A0obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
> > > =C2=A0
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > b/drivers/gpu/drm/drm_gpusvm.c
> > > new file mode 100644
> > > index 000000000000..1c63da4d3cc2
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -0,0 +1,2240 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > +/*
> > > + * Copyright =C2=A9 2024 Intel Corporation
> > > + *
> > > + * Authors:
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0 Matthew Brost <matthew.brost@intel.com>
> > > + */
> > > +
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/hmm.h>
> > > +#include <linux/memremap.h>
> > > +#include <linux/migrate.h>
> > > +#include <linux/mm_types.h>
> > > +#include <linux/pagemap.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_gpusvm.h>
> > > +#include <drm/drm_pagemap.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +/**
> > > + * DOC: Overview
> > > + *
> > > + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct
> > > Rendering Manager (DRM)
> > > + *
> > > + * The GPU SVM layer is a component of the DRM framework
> > > designed to
> > > manage shared
> > > + * virtual memory between the CPU and GPU. It enables efficient
> > > data
> > > exchange and
> > > + * processing for GPU-accelerated applications by allowing
> > > memory
> > > sharing and
> > > + * synchronization between the CPU's and GPU's virtual address
> > > spaces.
> > > + *
> > > + * Key GPU SVM Components:
> > > + * - Notifiers: Notifiers: Used for tracking memory intervals
> > > and
> > > notifying the
> > > + *		GPU of changes, notifiers are sized based on a
> > > GPU
> > > SVM
> > > + *		initialization parameter, with a recommendation
> > > of
> > > 512M or
> > > + *		larger. They maintain a Red-BlacK tree and a
> > > list of
> > > ranges that
> > > + *		fall within the notifier interval. Notifiers are
> > > tracked within
> > > + *		a GPU SVM Red-BlacK tree and list and are
> > > dynamically inserted
> > > + *		or removed as ranges within the interval are
> > > created
> > > or
> > > + *		destroyed.
> > > + * - Ranges: Represent memory ranges mapped in a DRM device and
> > > managed
> > > + *	=C2=A0=C2=A0=C2=A0=C2=A0 by GPU SVM. They are sized based on an a=
rray of
> > > chunk
> > > sizes, which
> > > + *	=C2=A0=C2=A0=C2=A0=C2=A0 is a GPU SVM initialization parameter, a=
nd the CPU
> > > address space.
> > > + *	=C2=A0=C2=A0=C2=A0=C2=A0 Upon GPU fault, the largest aligned chun=
k that fits
> > > within the
> > > + *	=C2=A0=C2=A0=C2=A0=C2=A0 faulting CPU address space is chosen for=
 the range
> > > size. Ranges are
> > > + *	=C2=A0=C2=A0=C2=A0=C2=A0 expected to be dynamically allocated on =
GPU fault
> > > and
> > > removed on an
> > > + *	=C2=A0=C2=A0=C2=A0=C2=A0 MMU notifier UNMAP event. As mentioned a=
bove,
> > > ranges
> > > are tracked in
> > > + *	=C2=A0=C2=A0=C2=A0=C2=A0 a notifier's Red-Black tree.
> > > + * - Operations: Define the interface for driver-specific GPU
> > > SVM
> > > operations
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 such as range allocation, notifier allocation,
> > > and
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 invalidations.
> > > + * - Device Memory Allocations: Embedded structure containing
> > > enough
> > > information
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for GPU SVM to migrate to / from
> > > device memory.
> > > + * - Device Memory Operations: Define the interface for driver-
> > > specific device
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory operations release memory,
> > > populate pfns,
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 and copy to / from device memory.
> > > + *
> > > + * This layer provides interfaces for allocating, mapping,
> > > migrating, and
> > > + * releasing memory ranges between the CPU and GPU. It handles
> > > all
> > > core memory
> > > + * management interactions (DMA mapping, HMM, and migration) and
> > > provides
> > > + * driver-specific virtual functions (vfuncs). This
> > > infrastructure
> > > is sufficient
> > > + * to build the expected driver components for an SVM
> > > implementation
> > > as detailed
> > > + * below.
> > > + *
> > > + * Expected Driver Components:
> > > + * - GPU page fault handler: Used to create ranges and notifiers
> > > based on the
> > > + *			=C2=A0=C2=A0=C2=A0=C2=A0 fault address, optionally migrate
> > > the
> > > range to
> > > + *			=C2=A0=C2=A0=C2=A0=C2=A0 device memory, and create GPU
> > > bindings.
> > > + * - Garbage collector: Used to unmap and destroy GPU bindings
> > > for
> > > ranges.
> > > + *			Ranges are expected to be added to the
> > > garbage collector
> > > + *			upon a MMU_NOTIFY_UNMAP event in
> > > notifier
> > > callback.
> > > + * - Notifier callback: Used to invalidate and DMA unmap GPU
> > > bindings for
> > > + *			ranges.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Locking
> > > + *
> > > + * GPU SVM handles locking for core MM interactions, i.e., it
> > > locks/unlocks the
> > > + * mmap lock as needed.
> > > + *
> > > + * GPU SVM introduces a global notifier lock, which safeguards
> > > the
> > > notifier's
> > > + * range RB tree and list, as well as the range's DMA mappings
> > > and
> > > sequence
> > > + * number. GPU SVM manages all necessary locking and unlocking
> > > operations,
> > > + * except for the recheck range's pages being valid
> > > + * (drm_gpusvm_range_pages_valid) when the driver is committing
> > > GPU
> > > bindings. This
> > > + * lock corresponds to the 'driver->update' lock mentioned in
> > > the
> > > HMM
> > > + * documentation (TODO: Link). Future revisions may transition
> > > from
> > > a GPU SVM
> > > + * global lock to a per-notifier lock if finer-grained locking
> > > is
> > > deemed
> > > + * necessary.
> > > + *
> > > + * In addition to the locking mentioned above, the driver should
> > > implement a
> > > + * lock to safeguard core GPU SVM function calls that modify
> > > state,
> > > such as
> > > + * drm_gpusvm_range_find_or_insert and drm_gpusvm_range_remove.
> > > This
> > > lock is
> > > + * denoted as 'driver_svm_lock' in code examples. Finer grained
> > > driver side
> > > + * locking should also be possible for concurrent GPU fault
> > > processing within a
> > > + * single GPU SVM. The 'driver_svm_lock' can be via
> > > drm_gpusvm_driver_set_lock
> > > + * to add annotations to GPU SVM.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Migration
> > > + *
> > > + * The migration support is quite simple, allowing migration
> > > between
> > > RAM and
> > > + * device memory at the range granularity. For example, GPU SVM
> > > currently does not
> > > + * support mixing RAM and device memory pages within a range.
> > > This
> > > means that upon GPU
> > > + * fault, the entire range can be migrated to device memory, and
> > > upon CPU fault, the
> > > + * entire range is migrated to RAM. Mixed RAM and device memory
> > > storage within a range
> > > + * could be added in the future if required.
> > > + *
> > > + * The reasoning for only supporting range granularity is as
> > > follows: it
> > > + * simplifies the implementation, and range sizes are driver-
> > > defined
> > > and should
> > > + * be relatively small.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Partial Unmapping of Ranges
> > > + *
> > > + * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped
> > > by
> > > CPU resulting
> > > + * in MMU_NOTIFY_UNMAP event) presents several challenges, with
> > > the
> > > main one
> > > + * being that a subset of the range still has CPU and GPU
> > > mappings.
> > > If the
> > > + * backing store for the range is in device memory, a subset of
> > > the
> > > backing store has
> > > + * references. One option would be to split the range and device
> > > memory backing store,
> > > + * but the implementation for this would be quite complicated.
> > > Given
> > > that
> > > + * partial unmappings are rare and driver-defined range sizes
> > > are
> > > relatively
> > > + * small, GPU SVM does not support splitting of ranges.
> > > + *
> > > + * With no support for range splitting, upon partial unmapping
> > > of a
> > > range, the
> > > + * driver is expected to invalidate and destroy the entire
> > > range. If
> > > the range
> > > + * has device memory as its backing, the driver is also expected
> > > to
> > > migrate any
> > > + * remaining pages back to RAM.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Examples
> > > + *
> > > + * This section provides three examples of how to build the
> > > expected
> > > driver
> > > + * components: the GPU page fault handler, the garbage
> > > collector,
> > > and the
> > > + * notifier callback.
> > > + *
> > > + * The generic code provided does not include logic for complex
> > > migration
> > > + * policies, optimized invalidations, fined grained driver
> > > locking,
> > > or other
> > > + * potentially required driver locking (e.g., DMA-resv locks).
> > > + *
> > > + * 1) GPU page fault handler
> > > + *
> > > + *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct
> > > drm_gpusvm_range *range)
> > > + *	{
> > > + *		int err =3D 0;
> > > + *
> > > + *		driver_alloc_and_setup_memory_for_bind(gpusvm,
> > > range);
> > > + *
> > > + *		drm_gpusvm_notifier_lock(gpusvm);
> > > + *		if (drm_gpusvm_range_pages_valid(range))
> > > + *			driver_commit_bind(gpusvm, range);
> > > + *		else
> > > + *			err =3D -EAGAIN;
> > > + *		drm_gpusvm_notifier_unlock(gpusvm);
> > > + *
> > > + *		return err;
> > > + *	}
> > > + *
> > > + *	int driver_gpu_fault(struct drm_gpusvm *gpusvm, unsigned
> > > long fault_addr,
> > > + *			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long gpuva_start, unsigned
> > > long gpuva_end)
> > > + *	{
> > > + *		struct drm_gpusvm_ctx ctx =3D {};
> > > + *		int err;
> > > + *
> > > + *		driver_svm_lock();
> > > + *	retry:
> > > + *		// Always process UNMAPs first so view of GPU
> > > SVM
> > > ranges is current
> > > + *		driver_garbage_collector(gpusvm);
> > > + *
> > > + *		range =3D drm_gpusvm_range_find_or_insert(gpusvm,
> > > fault_addr,
> > > +
> > > *							gpuva_start,
> > > gpuva_end,
> > > + *						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ctx);
> > > + *		if (IS_ERR(range)) {
> > > + *			err =3D PTR_ERR(range);
> > > + *			goto unlock;
> > > + *		}
> > > + *
> > > + *		if (driver_migration_policy(range)) {
> > > + *			devmem =3D driver_alloc_devmem();
> > > + *			err =3D
> > > drm_gpusvm_migrate_to_devmem(gpusvm,
> > > range,
> > > + *							=C2=A0=C2=A0
> > > devmem_allocation,
> > > + *							=C2=A0=C2=A0
> > > &ctx);
> > > + *			if (err)	// CPU mappings may have
> > > changed
> > > + *				goto retry;
> > > + *		}
> > > + *
> > > + *		err =3D drm_gpusvm_range_get_pages(gpusvm, range,
> > > &ctx);
> > > + *		if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err
> > > =3D=3D -
> > > EPERM) {	// CPU mappings changed
> > > + *			if (err =3D=3D -EOPNOTSUPP)
> > > + *				drm_gpusvm_range_evict(gpusvm,
> > > range);
> > > + *			goto retry;
> > > + *		} else if (err) {
> > > + *			goto unlock;
> > > + *		}
> > > + *
> > > + *		err =3D driver_bind_range(gpusvm, range);
> > > + *		if (err =3D=3D -EAGAIN)	// CPU mappings changed
> > > + *			goto retry
> > > + *
> > > + *	unlock:
> > > + *		driver_svm_unlock();
> > > + *		return err;
> > > + *	}
> > > + *
> > > + * 2) Garbage Collector.
> > > + *
> > > + *	void __driver_garbage_collector(struct drm_gpusvm
> > > *gpusvm,
> > > + *					struct drm_gpusvm_range
> > > *range)
> > > + *	{
> > > + *		assert_driver_svm_locked(gpusvm);
> > > + *
> > > + *		// Partial unmap, migrate any remaining device
> > > memory pages back to RAM
> > > + *		if (range->flags.partial_unmap)
> > > + *			drm_gpusvm_range_evict(gpusvm, range);
> > > + *
> > > + *		driver_unbind_range(range);
> > > + *		drm_gpusvm_range_remove(gpusvm, range);
> > > + *	}
> > > + *
> > > + *	void driver_garbage_collector(struct drm_gpusvm *gpusvm)
> > > + *	{
> > > + *		assert_driver_svm_locked(gpusvm);
> > > + *
> > > + *		for_each_range_in_garbage_collector(gpusvm,
> > > range)
> > > + *			__driver_garbage_collector(gpusvm,
> > > range);
> > > + *	}
> > > + *
> > > + * 3) Notifier callback.
> > > + *
> > > + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> > > + *				 struct drm_gpusvm_notifier
> > > *notifier,
> > > + *				 const struct mmu_notifier_range
> > > *mmu_range)
> > > + *	{
> > > + *		struct drm_gpusvm_ctx ctx =3D { .in_notifier =3D
> > > true,
> > > };
> > > + *		struct drm_gpusvm_range *range =3D NULL;
> > > + *
> > > + *		driver_invalidate_device_pages(gpusvm,
> > > mmu_range-
> > > > start, mmu_range->end);
> > > + *
> > > + *		drm_gpusvm_for_each_range(range, notifier,
> > > mmu_range->start,
> > > + *					=C2=A0 mmu_range->end) {
> > > + *			drm_gpusvm_range_unmap_pages(gpusvm,
> > > range,
> > > &ctx);
> > > + *
> > > + *			if (mmu_range->event !=3D
> > > MMU_NOTIFY_UNMAP)
> > > + *				continue;
> > > + *
> > > + *			drm_gpusvm_range_set_unmapped(range,
> > > mmu_range);
> > > + *			driver_garbage_collector_add(gpusvm,
> > > range);
> > > + *		}
> > > + *	}
> > > + */
> > > +
> > > +/**
> > > + * npages_in_range() - Calculate the number of pages in a given
> > > range
> > > + * @start: The start address of the range
> > > + * @end: The end address of the range
> > > + *
> > > + * This macro calculates the number of pages in a given memory
> > > range,
> > > + * specified by the start and end addresses. It divides the
> > > difference
> > > + * between the end and start addresses by the page size
> > > (PAGE_SIZE)
> > > to
> > > + * determine the number of pages in the range.
> > > + *
> > > + * Returns: The number of pages in the specified range.
> > > + */
> > > +static unsigned long
> > > +npages_in_range(unsigned long start, unsigned long end)
> > > +{
> > > +	return (end - start) >> PAGE_SHIFT;
> > > +}
> > > +
> > > +/**
> > > + * struct drm_gpusvm_zdd - GPU SVM zone device data
> > > + *
> > > + * @refcount: Reference count for the zdd
> > > + * @devmem_allocation: device memory allocation
> > > + * @device_private_page_owner: Device private pages owner
> > > + *
> > > + * This structure serves as a generic wrapper installed in
> > > + * page->zone_device_data. It provides infrastructure for
> > > looking up
> > > a device
> > > + * memory allocation upon CPU page fault and asynchronously
> > > releasing device
> > > + * memory once the CPU has no page references. Asynchronous
> > > release
> > > is useful
> > > + * because CPU page references can be dropped in IRQ contexts,
> > > while
> > > releasing
> > > + * device memory likely requires sleeping locks.
> > > + */
> > > +struct drm_gpusvm_zdd {
> > > +	struct kref refcount;
> > > +	struct drm_gpusvm_devmem *devmem_allocation;
> > > +	void *device_private_page_owner;
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_alloc() - Allocate a zdd structure.
> > > + * @device_private_page_owner: Device private pages owner
> > > + *
> > > + * This function allocates and initializes a new zdd structure.
> > > It
> > > sets up the
> > > + * reference count and initializes the destroy work.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated zdd on success, ERR_PTR() on
> > > failure.
> > > + */
> > > +static struct drm_gpusvm_zdd *
> > > +drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd;
> > > +
> > > +	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> > > +	if (!zdd)
> > > +		return NULL;
> > > +
> > > +	kref_init(&zdd->refcount);
> > > +	zdd->devmem_allocation =3D NULL;
> > > +	zdd->device_private_page_owner =3D
> > > device_private_page_owner;
> > > +
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_get() - Get a reference to a zdd structure.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function increments the reference count of the provided
> > > zdd
> > > structure.
> > > + *
> > > + * Returns: Pointer to the zdd structure.
> > > + */
> > > +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct
> > > drm_gpusvm_zdd *zdd)
> > > +{
> > > +	kref_get(&zdd->refcount);
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_destroy() - Destroy a zdd structure.
> > > + * @ref: Pointer to the reference count structure.
> > > + *
> > > + * This function queues the destroy_work of the zdd for
> > > asynchronous
> > > destruction.
> > > + */
> > > +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd =3D
> > > +		container_of(ref, struct drm_gpusvm_zdd,
> > > refcount);
> > > +	struct drm_gpusvm_devmem *devmem =3D zdd-
> > > >devmem_allocation;
> > > +
> > > +	if (devmem) {
> > > +		complete_all(&devmem->detached);
> > > +		if (devmem->ops->devmem_release)
> > > +			devmem->ops->devmem_release(devmem);
> > > +	}
> > > +	kfree(zdd);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_put() - Put a zdd reference.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function decrements the reference count of the provided
> > > zdd
> > > structure
> > > + * and schedules its destruction if the count drops to zero.
> > > + */
> > > +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> > > +{
> > > +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM
> > > notifier
> > > + * @notifier: Pointer to the GPU SVM notifier structure.
> > > + * @start: Start address of the range
> > > + * @end: End address of the range
> > > + *
> > > + * Returns: A pointer to the drm_gpusvm_range if found or NULL
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier,
> > > unsigned
> > > long start,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long end)
> > > +{
> > > +	struct interval_tree_node *itree;
> > > +
> > > +	itree =3D interval_tree_iter_first(&notifier->root, start,
> > > end
> > > - 1);
> > > +
> > > +	if (itree)
> > > +		return container_of(itree, struct
> > > drm_gpusvm_range,
> > > itree);
> > > +	else
> > > +		return NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU
> > > SVM
> > > ranges in a notifier
> > > + * @range__: Iterator variable for the ranges
> > > + * @next__: Iterator variable for the ranges temporay storage
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the range
> > > + * @end__: End address of the range
> > > + *
> > > + * This macro is used to iterate over GPU SVM ranges in a
> > > notifier
> > > while
> > > + * removing ranges from it.
> > > + */
> > > +#define drm_gpusvm_for_each_range_safe(range__, next__,
> > > notifier__,
> > > start__, end__)	\
> > > +	for ((range__) =3D drm_gpusvm_range_find((notifier__),
> > > (start__), (end__)),	\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (next__) =3D
> > > __drm_gpusvm_range_next(range__);				\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) && (range__->itree.start <
> > > (end__));				\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) =3D (next__), (next__) =3D
> > > __drm_gpusvm_range_next(range__))
> > > +
> > > +/**
> > > + * __drm_gpusvm_notifier_next() - get the next
> > > drm_gpusvm_notifier
> > > in the list
> > > + * @notifier: a pointer to the current drm_gpusvm_notifier
> > > + *
> > > + * Returns: A pointer to the next drm_gpusvm_notifier if
> > > available,
> > > or NULL if
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the current notif=
ier is the last one or if the input
> > > notifier is
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL.
> > > + */
> > > +static struct drm_gpusvm_notifier *
> > > +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> > > +{
> > > +	if (notifier && !list_is_last(&notifier->entry,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &notifier->gpusvm-
> > > > notifier_list))
> > > +		return list_next_entry(notifier, entry);
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +static struct drm_gpusvm_notifier *
> > > +notifier_iter_first(struct rb_root_cached *root, unsigned long
> > > start,
> > > +		=C2=A0=C2=A0=C2=A0 unsigned long last)
> > > +{
> > > +	struct interval_tree_node *itree;
> > > +
> > > +	itree =3D interval_tree_iter_first(root, start, last);
> > > +
> > > +	if (itree)
> > > +		return container_of(itree, struct
> > > drm_gpusvm_notifier, itree);
> > > +	else
> > > +		return NULL;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM
> > > notifiers
> > > in a gpusvm
> > > + * @notifier__: Iterator variable for the notifiers
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the notifier
> > > + * @end__: End address of the notifier
> > > + *
> > > + * This macro is used to iterate over GPU SVM notifiers in a
> > > gpusvm.
> > > + */
> > > +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__,
> > > start__,
> > > end__)		\
> > > +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)-
> > > >root,
> > > (start__), (end__) - 1);	\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) && (notifier__->itree.start <
> > > (end__));			\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) =3D
> > > __drm_gpusvm_notifier_next(notifier__))
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU
> > > SVM
> > > notifiers in a gpusvm
> > > + * @notifier__: Iterator variable for the notifiers
> > > + * @next__: Iterator variable for the notifiers temporay storage
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the notifier
> > > + * @end__: End address of the notifier
> > > + *
> > > + * This macro is used to iterate over GPU SVM notifiers in a
> > > gpusvm
> > > while
> > > + * removing notifiers from it.
> > > + */
> > > +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__,
> > > gpusvm__, start__, end__)	\
> > > +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)-
> > > >root,
> > > (start__), (end__) - 1),	\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (next__) =3D
> > > __drm_gpusvm_notifier_next(notifier__);				\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) && (notifier__->itree.start <
> > > (end__));			\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) =3D (next__), (next__) =3D
> > > __drm_gpusvm_notifier_next(notifier__))
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM
> > > notifier.
> > > + * @mni: Pointer to the mmu_interval_notifier structure.
> > > + * @mmu_range: Pointer to the mmu_notifier_range structure.
> > > + * @cur_seq: Current sequence number.
> > > + *
> > > + * This function serves as a generic MMU notifier for GPU SVM.
> > > It
> > > sets the MMU
> > > + * notifier sequence number and calls the driver invalidate
> > > vfunc
> > > under
> > > + * gpusvm->notifier_lock.
> > > + *
> > > + * Returns:
> > > + * true if the operation succeeds, false otherwise.
> > > + */
> > > +static bool
> > > +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier
> > > *mni,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_ra=
nge
> > > *mmu_range,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cur_seq)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier =3D
> > > +		container_of(mni, typeof(*notifier), notifier);
> > > +	struct drm_gpusvm *gpusvm =3D notifier->gpusvm;
> > > +
> > > +	if (!mmu_notifier_range_blockable(mmu_range))
> > > +		return false;
> > > +
> > > +	down_write(&gpusvm->notifier_lock);
> > > +	mmu_interval_set_seq(mni, cur_seq);
> > > +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> > > +	up_write(&gpusvm->notifier_lock);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_ops - MMU interval notifier operations
> > > for
> > > GPU SVM
> > > + */
> > > +static const struct mmu_interval_notifier_ops
> > > drm_gpusvm_notifier_ops =3D {
> > > +	.invalidate =3D drm_gpusvm_notifier_invalidate,
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_init() - Initialize the GPU SVM.
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + * @name: Name of the GPU SVM.
> > > + * @drm: Pointer to the DRM device structure.
> > > + * @mm: Pointer to the mm_struct for the address space.
> > > + * @device_private_page_owner: Device private pages owner.
> > > + * @mm_start: Start address of GPU SVM.
> > > + * @mm_range: Range of the GPU SVM.
> > > + * @notifier_size: Size of individual notifiers.
> > > + * @ops: Pointer to the operations structure for GPU SVM.
> > > + * @chunk_sizes: Pointer to the array of chunk sizes used in
> > > range
> > > allocation.
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Entries should be powers of 2 in descending
> > > order
> > > with last
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 entry being SZ_4K.
> > > + * @num_chunks: Number of chunks.
> > > + *
> > > + * This function initializes the GPU SVM.
> > > + *
> > > + * Returns:
> > > + * 0 on success, a negative error code on failure.
> > > + */
> > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > +		=C2=A0=C2=A0=C2=A0 const char *name, struct drm_device *drm,
> > > +		=C2=A0=C2=A0=C2=A0 struct mm_struct *mm, void
> > > *device_private_page_owner,
> > > +		=C2=A0=C2=A0=C2=A0 unsigned long mm_start, unsigned long
> > > mm_range,
> > > +		=C2=A0=C2=A0=C2=A0 unsigned long notifier_size,
> > > +		=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ops *ops,
> > > +		=C2=A0=C2=A0=C2=A0 const unsigned long *chunk_sizes, int
> > > num_chunks)
> > > +{
> > > +	if (!ops->invalidate || !num_chunks)
> > > +		return -EINVAL;
> > > +
> > > +	gpusvm->name =3D name;
> > > +	gpusvm->drm =3D drm;
> > > +	gpusvm->mm =3D mm;
> > > +	gpusvm->device_private_page_owner =3D
> > > device_private_page_owner;
> > > +	gpusvm->mm_start =3D mm_start;
> > > +	gpusvm->mm_range =3D mm_range;
> > > +	gpusvm->notifier_size =3D notifier_size;
> > > +	gpusvm->ops =3D ops;
> > > +	gpusvm->chunk_sizes =3D chunk_sizes;
> > > +	gpusvm->num_chunks =3D num_chunks;
> > > +
> > > +	mmgrab(mm);
> > > +	gpusvm->root =3D RB_ROOT_CACHED;
> > > +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> > > +
> > > +	init_rwsem(&gpusvm->notifier_lock);
> > > +
> > > +	fs_reclaim_acquire(GFP_KERNEL);
> > > +	might_lock(&gpusvm->notifier_lock);
> > > +	fs_reclaim_release(GFP_KERNEL);
> > > +
> > > +#ifdef CONFIG_LOCKDEP
> > > +	gpusvm->lock_dep_map =3D NULL;
> > > +#endif
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_init);
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_find() - Find GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @fault_addr: Fault address
> > > + *
> > > + * This function finds the GPU SVM notifier associated with the
> > > fault address.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> > > + */
> > > +static struct drm_gpusvm_notifier *
> > > +drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm,
> > > +			 unsigned long fault_addr)
> > > +{
> > > +	return notifier_iter_first(&gpusvm->root, fault_addr,
> > > fault_addr + 1);
> > > +}
> > > +
> > > +/**
> > > + * to_drm_gpusvm_notifier() - retrieve the container struct for
> > > a
> > > given rbtree node
> > > + * @node: a pointer to the rbtree node embedded within a
> > > drm_gpusvm_notifier struct
> > > + *
> > > + * Returns: A pointer to the containing drm_gpusvm_notifier
> > > structure.
> > > + */
> > > +static struct drm_gpusvm_notifier *to_drm_gpusvm_notifier(struct
> > > rb_node *node)
> > > +{
> > > +	return container_of(node, struct drm_gpusvm_notifier,
> > > itree.rb);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_insert() - Insert GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This function inserts the GPU SVM notifier into the GPU SVM
> > > RB
> > > tree and list.
> > > + */
> > > +static void drm_gpusvm_notifier_insert(struct drm_gpusvm
> > > *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	struct rb_node *node;
> > > +	struct list_head *head;
> > > +
> > > +	interval_tree_insert(&notifier->itree, &gpusvm->root);
> > > +
> > > +	node =3D rb_prev(&notifier->itree.rb);
> > > +	if (node)
> > > +		head =3D &(to_drm_gpusvm_notifier(node))->entry;
> > > +	else
> > > +		head =3D &gpusvm->notifier_list;
> > > +
> > > +	list_add(&notifier->entry, head);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_remove() - Remove GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM tructure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This function removes the GPU SVM notifier from the GPU SVM
> > > RB
> > > tree and list.
> > > + */
> > > +static void drm_gpusvm_notifier_remove(struct drm_gpusvm
> > > *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	interval_tree_remove(&notifier->itree, &gpusvm->root);
> > > +	list_del(&notifier->entry);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_fini() - Finalize the GPU SVM.
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + *
> > > + * This function finalizes the GPU SVM by cleaning up any
> > > remaining
> > > ranges and
> > > + * notifiers, and dropping a reference to struct MM.
> > > + */
> > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier, *next;
> > > +
> > > +	drm_gpusvm_for_each_notifier_safe(notifier, next,
> > > gpusvm, 0,
> > > LONG_MAX) {
> > > +		struct drm_gpusvm_range *range, *__next;
> > > +
> > > +		/*
> > > +		 * Remove notifier first to avoid racing with
> > > any
> > > invalidation
> > > +		 */
> > > +		mmu_interval_notifier_remove(&notifier-
> > > >notifier);
> > > +		notifier->flags.removed =3D true;
> > > +
> > > +		drm_gpusvm_for_each_range_safe(range, __next,
> > > notifier, 0,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LONG_MAX)
> > > +			drm_gpusvm_range_remove(gpusvm, range);
> > > +	}
> > > +
> > > +	mmdrop(gpusvm->mm);
> > > +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_alloc() - Allocate GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @fault_addr: Fault address
> > > + *
> > > + * This function allocates and initializes the GPU SVM notifier
> > > structure.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated GPU SVM notifier on success,
> > > ERR_PTR()
> > > on failure.
> > > + */
> > > +static struct drm_gpusvm_notifier *
> > > +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, unsigned
> > > long
> > > fault_addr)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	if (gpusvm->ops->notifier_alloc)
> > > +		notifier =3D gpusvm->ops->notifier_alloc();
> > > +	else
> > > +		notifier =3D kzalloc(sizeof(*notifier),
> > > GFP_KERNEL);
> > > +
> > > +	if (!notifier)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	notifier->gpusvm =3D gpusvm;
> > > +	notifier->itree.start =3D ALIGN_DOWN(fault_addr, gpusvm-
> > > > notifier_size);
> > > +	notifier->itree.last =3D ALIGN(fault_addr + 1, gpusvm-
> > > > notifier_size) - 1;
> > > +	INIT_LIST_HEAD(&notifier->entry);
> > > +	notifier->root =3D RB_ROOT_CACHED;
> > > +	INIT_LIST_HEAD(&notifier->range_list);
> > > +
> > > +	return notifier;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_free() - Free GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This function frees the GPU SVM notifier structure.
> > > + */
> > > +static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> > > +
> > > +	if (gpusvm->ops->notifier_free)
> > > +		gpusvm->ops->notifier_free(notifier);
> > > +	else
> > > +		kfree(notifier);
> > > +}
> > > +
> > > +/**
> > > + * to_drm_gpusvm_range() - retrieve the container struct for a
> > > given
> > > rbtree node
> > > + * @node: a pointer to the rbtree node embedded within a
> > > drm_gpusvm_range struct
> > > + *
> > > + * Returns: A pointer to the containing drm_gpusvm_range
> > > structure.
> > > + */
> > > +static struct drm_gpusvm_range *to_drm_gpusvm_range(struct
> > > rb_node
> > > *node)
> > > +{
> > > +	return container_of(node, struct drm_gpusvm_range,
> > > itree.rb);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_insert() - Insert GPU SVM range
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function inserts the GPU SVM range into the notifier RB
> > > tree
> > > and list.
> > > + */
> > > +static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier
> > > *notifier,
> > > +				=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	struct rb_node *node;
> > > +	struct list_head *head;
> > > +
> > > +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> > > +	interval_tree_insert(&range->itree, &notifier->root);
> > > +
> > > +	node =3D rb_prev(&range->itree.rb);
> > > +	if (node)
> > > +		head =3D &(to_drm_gpusvm_range(node))->entry;
> > > +	else
> > > +		head =3D &notifier->range_list;
> > > +
> > > +	list_add(&range->entry, head);
> > > +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> > > +}
> > > +
> > > +/**
> > > + * __drm_gpusvm_range_remove() - Remove GPU SVM range
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This macro removes the GPU SVM range from the notifier RB
> > > tree
> > > and list.
> > > + */
> > > +static void __drm_gpusvm_range_remove(struct drm_gpusvm_notifier
> > > *notifier,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	interval_tree_remove(&range->itree, &notifier->root);
> > > +	list_del(&range->entry);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_alloc() - Allocate GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @fault_addr: Fault address
> > > + * @chunk_size: Chunk size
> > > + * @migrate_devmem: Flag indicating whether to migrate device
> > > memory
> > > + *
> > > + * This function allocates and initializes the GPU SVM range
> > > structure.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated GPU SVM range on success, ERR_PTR()
> > > on
> > > failure.
> > > + */
> > > +static struct drm_gpusvm_range *
> > > +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier *n=
otifier,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long fault_addr, uns=
igned long
> > > chunk_size,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool migrate_devmem)
> > > +{
> > > +	struct drm_gpusvm_range *range;
> > > +
> > > +	if (gpusvm->ops->range_alloc)
> > > +		range =3D gpusvm->ops->range_alloc(gpusvm);
> > > +	else
> > > +		range =3D kzalloc(sizeof(*range), GFP_KERNEL);
> > > +
> > > +	if (!range)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	kref_init(&range->refcount);
> > > +	range->gpusvm =3D gpusvm;
> > > +	range->notifier =3D notifier;
> > > +	range->itree.start =3D ALIGN_DOWN(fault_addr, chunk_size);
> > > +	range->itree.last =3D ALIGN(fault_addr + 1, chunk_size) -
> > > 1;
> > > +	INIT_LIST_HEAD(&range->entry);
> > > +	range->notifier_seq =3D LONG_MAX;
> > > +	range->flags.migrate_devmem =3D migrate_devmem ? 1 : 0;
> > > +
> > > +	return range;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_check_pages() - Check pages
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @start: Start address
> > > + * @end: End address
> > > + *
> > > + * Check if pages between start and end have been faulted in on
> > > the
> > > CPU. Use to
> > > + * prevent migration of pages without CPU backing store.
> > > + *
> > > + * Returns:
> > > + * True if pages have been faulted into CPU, False otherwise
> > > + */
> > > +static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0=C2=A0 struct drm_gpusvm_notifier
> > > *notifier,
> > > +				=C2=A0=C2=A0 unsigned long start, unsigned
> > > long end)
> > > +{
> > > +	struct hmm_range hmm_range =3D {
> > > +		.default_flags =3D 0,
> > > +		.notifier =3D &notifier->notifier,
> > > +		.start =3D start,
> > > +		.end =3D end,
> > > +		.dev_private_owner =3D gpusvm-
> > > > device_private_page_owner,
> > > +	};
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long *pfns;
> > > +	unsigned long npages =3D npages_in_range(start, end);
> > > +	int err, i;
> > > +
> > > +	mmap_assert_locked(gpusvm->mm);
> > > +
> > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns),
> > > GFP_KERNEL);
> > > +	if (!pfns)
> > > +		return false;
> > > +
> > > +	hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(&notifier-
> > > > notifier);
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +
> > > +	while (true) {
> > > +		err =3D hmm_range_fault(&hmm_range);
> > > +		if (err =3D=3D -EBUSY) {
> > > +			if (time_after(jiffies, timeout))
> > > +				break;
> > > +
> > > +			hmm_range.notifier_seq =3D
> > > +				mmu_interval_read_begin(&notifie
> > > r-
> > > > notifier);
> > > +			continue;
> > > +		}
> > > +		break;
> > > +	}
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	for (i =3D 0; i < npages;) {
> > > +		if (!(pfns[i] & HMM_PFN_VALID)) {
> > > +			err =3D -EFAULT;
> > > +			goto err_free;
> > > +		}
> > > +		i +=3D 0x1 << hmm_pfn_to_map_order(pfns[i]);
> > > +	}
> > > +
> > > +err_free:
> > > +	kvfree(pfns);
> > > +	return err ? false : true;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU
> > > SVM
> > > range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @vas: Pointer to the virtual memory area structure
> > > + * @fault_addr: Fault address
> > > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > > + * @check_pages_threshold: Check CPU pages for present threshold
> > > + *
> > > + * This function determines the chunk size for the GPU SVM range
> > > based on the
> > > + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges,
> > > and
> > > the virtual
> > > + * memory area boundaries.
> > > + *
> > > + * Returns:
> > > + * Chunk size on success, LONG_MAX on failure.
> > > + */
> > > +static unsigned long
> > > +drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier
> > > *notifier,
> > > +			=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vas,
> > > +			=C2=A0=C2=A0=C2=A0 unsigned long fault_addr,
> > > +			=C2=A0=C2=A0=C2=A0 unsigned long gpuva_start,
> > > +			=C2=A0=C2=A0=C2=A0 unsigned long gpuva_end,
> > > +			=C2=A0=C2=A0=C2=A0 unsigned long check_pages_threshold)
> > > +{
> > > +	unsigned long start, end;
> > > +	int i =3D 0;
> > > +
> > > +retry:
> > > +	for (; i < gpusvm->num_chunks; ++i) {
> > > +		start =3D ALIGN_DOWN(fault_addr, gpusvm-
> > > > chunk_sizes[i]);
> > > +		end =3D ALIGN(fault_addr + 1, gpusvm-
> > > >chunk_sizes[i]);
> > > +
> > > +		if (start >=3D vas->vm_start && end <=3D vas->vm_end
> > > &&
> > > +		=C2=A0=C2=A0=C2=A0 start >=3D notifier->itree.start &&
> > > +		=C2=A0=C2=A0=C2=A0 end <=3D notifier->itree.last + 1 &&
> > > +		=C2=A0=C2=A0=C2=A0 start >=3D gpuva_start && end <=3D gpuva_end)
> > > +			break;
> > > +	}
> > > +
> > > +	if (i =3D=3D gpusvm->num_chunks)
> > > +		return LONG_MAX;
> > > +
> > > +	/*
> > > +	 * If allocation more than page, ensure not to overlap
> > > with
> > > existing
> > > +	 * ranges.
> > > +	 */
> > > +	if (end - start !=3D SZ_4K) {
> > > +		struct drm_gpusvm_range *range;
> > > +
> > > +		range =3D drm_gpusvm_range_find(notifier, start,
> > > end);
> > > +		if (range) {
> > > +			++i;
> > > +			goto retry;
> > > +		}
> > > +
> > > +		/*
> > > +		 * XXX: Only create range on pages CPU has
> > > faulted
> > > in. Without
> > > +		 * this check, or prefault, on BMG
> > > 'xe_exec_system_allocator --r
> > > +		 * process-many-malloc' fails. In the failure
> > > case,
> > > each process
> > > +		 * mallocs 16k but the CPU VMA is ~128k which
> > > results in 64k SVM
> > > +		 * ranges. When migrating the SVM ranges, some
> > > processes fail in
> > > +		 * drm_gpusvm_migrate_to_devmem with
> > > 'migrate.cpages
> > > !=3D npages'
> > > +		 * and then upon drm_gpusvm_range_get_pages
> > > device
> > > pages from
> > > +		 * other processes are collected + faulted in
> > > which
> > > creates all
> > > +		 * sorts of problems. Unsure exactly how this
> > > happening, also
> > > +		 * problem goes away if
> > > 'xe_exec_system_allocator --
> > > r
> > > +		 * process-many-malloc' mallocs at least 64k at
> > > a
> > > time.
> > > +		 */
> > > +		if (end - start <=3D check_pages_threshold &&
> > > +		=C2=A0=C2=A0=C2=A0 !drm_gpusvm_check_pages(gpusvm, notifier,
> > > start,
> > > end)) {
> > > +			++i;
> > > +			goto retry;
> > > +		}
> > > +	}
> > > +
> > > +	return end - start;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM
> > > range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @fault_addr: Fault address
> > > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function finds or inserts a newly allocated a GPU SVM
> > > range
> > > based on the
> > > + * fault address. Caller must hold a lock to protect range
> > > lookup
> > > and insertion.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM range on success, ERR_PTR() on
> > > failure.
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
> > > +				unsigned long fault_addr,
> > > +				unsigned long gpuva_start,
> > > +				unsigned long gpuva_end,
> > > +				const struct drm_gpusvm_ctx
> > > *ctx)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +	struct drm_gpusvm_range *range;
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	struct vm_area_struct *vas;
> > > +	bool notifier_alloc =3D false;
> > > +	unsigned long chunk_size;
> > > +	int err;
> > > +	bool migrate_devmem;
> > > +
> > > +	drm_gpusvm_driver_lock_held(gpusvm);
> > > +
> > > +	if (fault_addr < gpusvm->mm_start ||
> > > +	=C2=A0=C2=A0=C2=A0 fault_addr > gpusvm->mm_start + gpusvm->mm_range=
)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	if (!mmget_not_zero(mm))
> > > +		return ERR_PTR(-EFAULT);
> > > +
> > > +	notifier =3D drm_gpusvm_notifier_find(gpusvm, fault_addr);
> > > +	if (!notifier) {
> > > +		notifier =3D drm_gpusvm_notifier_alloc(gpusvm,
> > > fault_addr);
> > > +		if (IS_ERR(notifier)) {
> > > +			err =3D PTR_ERR(notifier);
> > > +			goto err_mmunlock;
> > > +		}
> > > +		notifier_alloc =3D true;
> > > +		err =3D mmu_interval_notifier_insert(&notifier-
> > > > notifier,
> > > +						=C2=A0=C2=A0 mm, notifier-
> > > > itree.start,
> > > +						=C2=A0=C2=A0 notifier-
> > > > itree.last -
> > > +						=C2=A0=C2=A0 notifier-
> > > > itree.start + 1,
> > > +						=C2=A0=C2=A0
> > > &drm_gpusvm_notifier_ops);
> > > +		if (err)
> > > +			goto err_notifier;
> > > +	}
> > > +
> > > +	mmap_read_lock(mm);
> > > +
> > > +	vas =3D vma_lookup(mm, fault_addr);
> > > +	if (!vas) {
> > > +		err =3D -ENOENT;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> > > +		err =3D -EPERM;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	range =3D drm_gpusvm_range_find(notifier, fault_addr,
> > > fault_addr + 1);
> > > +	if (range)
> > > +		goto out_mmunlock;
> > > +	/*
> > > +	 * XXX: Short-circuiting migration based on
> > > migrate_vma_*
> > > current
> > > +	 * limitations. If/when migrate_vma_* add more support,
> > > this
> > > logic will
> > > +	 * have to change.
> > > +	 */
> > > +	migrate_devmem =3D ctx->devmem_possible &&
> > > +		vma_is_anonymous(vas) &&
> > > !is_vm_hugetlb_page(vas);
> > > +
> > > +	chunk_size =3D drm_gpusvm_range_chunk_size(gpusvm,
> > > notifier,
> > > vas,
> > > +						 fault_addr,
> > > gpuva_start,
> > > +						 gpuva_end,
> > > +						 ctx-
> > > > check_pages_threshold);
> > > +	if (chunk_size =3D=3D LONG_MAX) {
> > > +		err =3D -EINVAL;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	range =3D drm_gpusvm_range_alloc(gpusvm, notifier,
> > > fault_addr,
> > > chunk_size,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migrate_devmem);
> > > +	if (IS_ERR(range)) {
> > > +		err =3D PTR_ERR(range);
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	drm_gpusvm_range_insert(notifier, range);
> > > +	if (notifier_alloc)
> > > +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> > > +
> > > +out_mmunlock:
> > > +	mmap_read_unlock(mm);
> > > +	mmput(mm);
> > > +
> > > +	return range;
> > > +
> > > +err_notifier_remove:
> > > +	mmap_read_unlock(mm);
> > > +	if (notifier_alloc)
> > > +		mmu_interval_notifier_remove(&notifier-
> > > >notifier);
> > > +err_notifier:
> > > +	if (notifier_alloc)
> > > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > > +err_mmunlock:
> > > +	mmput(mm);
> > > +	return ERR_PTR(err);
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
> > > +
> > > +/**
> > > + * __drm_gpusvm_range_unmap_pages() - Unmap pages associated
> > > with a
> > > GPU SVM range (internal)
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @npages: Number of pages to unmap
> > > + *
> > > + * This function unmap pages associated with a GPU SVM range.
> > > Assumes and
> > > + * asserts correct locking is in place when called.
> > > + */
> > > +static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm
> > > *gpusvm,
> > > +					=C2=A0=C2=A0 struct
> > > drm_gpusvm_range
> > > *range,
> > > +					=C2=A0=C2=A0 unsigned long npages)
> > > +{
> > > +	unsigned long i, j;
> > > +	struct drm_pagemap *dpagemap =3D range->dpagemap;
> > > +	struct device *dev =3D gpusvm->drm->dev;
> > > +
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	if (range->flags.has_dma_mapping) {
> > > +		for (i =3D 0, j =3D 0; i < npages; j++) {
> > > +			struct drm_pagemap_dma_addr *addr =3D
> > > &range-
> > > > dma_addr[j];
> > > +
> > > +			if (addr->proto =3D=3D
> > > DRM_INTERCONNECT_SYSTEM)
> > > +				dma_unmap_page(dev,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr->addr,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> > > addr-
> > > > order,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr->dir);
> > > +			else if (dpagemap && dpagemap->ops-
> > > > unmap_dma)
> > > +				dpagemap->ops-
> > > >unmap_dma(dpagemap,
> > > +							 dev,
> > > +							 *addr);
> > > +			i +=3D 1 << addr->order;
> > > +		}
> > > +		range->flags.has_devmem_pages =3D false;
> > > +		range->flags.has_dma_mapping =3D false;
> > > +		range->dpagemap =3D NULL;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_free_pages() - Free pages associated with a
> > > GPU
> > > SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function frees the dma address array associated with a
> > > GPU
> > > SVM range.
> > > + */
> > > +static void drm_gpusvm_range_free_pages(struct drm_gpusvm
> > > *gpusvm,
> > > +					struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	if (range->dma_addr) {
> > > +		kvfree(range->dma_addr);
> > > +		range->dma_addr =3D NULL;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_remove() - Remove GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range to be removed
> > > + *
> > > + * This function removes the specified GPU SVM range and also
> > > removes the parent
> > > + * GPU SVM notifier if no more ranges remain in the notifier.
> > > The
> > > caller must
> > > + * hold a lock to protect range and notifier removal.
> > > + */
> > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range)
> > > +{
> > > +	unsigned long npages =3D npages_in_range(range-
> > > >itree.start,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->itree.last
> > > +
> > > 1);
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	drm_gpusvm_driver_lock_held(gpusvm);
> > > +
> > > +	notifier =3D drm_gpusvm_notifier_find(gpusvm, range-
> > > > itree.start);
> > > +	if (WARN_ON_ONCE(!notifier))
> > > +		return;
> > > +
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> > > +	drm_gpusvm_range_free_pages(gpusvm, range);
> > > +	__drm_gpusvm_range_remove(notifier, range);
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +
> > > +	drm_gpusvm_range_put(range);
> > > +
> > > +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> > > +		if (!notifier->flags.removed)
> > > +			mmu_interval_notifier_remove(&notifier-
> > > > notifier);
> > > +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> > > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > > +	}
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_remove);
> > > +
> > > +/**
> > > + * drm_gpusvm_range_get() - Get a reference to GPU SVM range
> > > + * @range: Pointer to the GPU SVM range
> > > + *
> > > + * This function increments the reference count of the specified
> > > GPU
> > > SVM range.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM range.
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> > > +{
> > > +	kref_get(&range->refcount);
> > > +
> > > +	return range;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_get);
> > > +
> > > +/**
> > > + * drm_gpusvm_range_destroy() - Destroy GPU SVM range
> > > + * @refcount: Pointer to the reference counter embedded in the
> > > GPU
> > > SVM range
> > > + *
> > > + * This function destroys the specified GPU SVM range when its
> > > reference count
> > > + * reaches zero. If a custom range-free function is provided, it
> > > is
> > > invoked to
> > > + * free the range; otherwise, the range is deallocated using
> > > kfree().
> > > + */
> > > +static void drm_gpusvm_range_destroy(struct kref *refcount)
> > > +{
> > > +	struct drm_gpusvm_range *range =3D
> > > +		container_of(refcount, struct drm_gpusvm_range,
> > > refcount);
> > > +	struct drm_gpusvm *gpusvm =3D range->gpusvm;
> > > +
> > > +	if (gpusvm->ops->range_free)
> > > +		gpusvm->ops->range_free(range);
> > > +	else
> > > +		kfree(range);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_put() - Put a reference to GPU SVM range
> > > + * @range: Pointer to the GPU SVM range
> > > + *
> > > + * This function decrements the reference count of the specified
> > > GPU
> > > SVM range
> > > + * and frees it when the count reaches zero.
> > > + */
> > > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> > > +{
> > > +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
> > > +
> > > +/**
> > > + * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function determines if a GPU SVM range pages are valid.
> > > Expected be
> > > + * called holding gpusvm->notifier_lock and as the last step
> > > before
> > > committing a
> > > + * GPU binding. This is akin to a notifier seqno check in the
> > > HMM
> > > documentation
> > > + * but due to wider notifiers (i.e., notifiers which span
> > > multiple
> > > ranges) this
> > > + * function is required for finer grained checking (i.e., per
> > > range)
> > > if pages
> > > + * are valid.
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM range has valid pages, False otherwise
> > > + */
> > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0 struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	return range->flags.has_devmem_pages || range-
> > > > flags.has_dma_mapping;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
> > > +
> > > +/**
> > > + * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages
> > > valid unlocked
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function determines if a GPU SVM range pages are valid.
> > > Expected be
> > > + * called without holding gpusvm->notifier_lock.
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM range has valid pages, False otherwise
> > > + */
> > > +static bool
> > > +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	bool pages_valid;
> > > +
> > > +	if (!range->dma_addr)
> > > +		return false;
> > > +
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +	pages_valid =3D drm_gpusvm_range_pages_valid(gpusvm,
> > > range);
> > > +	if (!pages_valid)
> > > +		drm_gpusvm_range_free_pages(gpusvm, range);
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +
> > > +	return pages_valid;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function gets pages for a GPU SVM range and ensures they
> > > are
> > > mapped for
> > > + * DMA access.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *ran=
ge,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx =
*ctx)
> > > +{
> > > +	struct mmu_interval_notifier *notifier =3D &range-
> > > >notifier-
> > > > notifier;
> > > +	struct hmm_range hmm_range =3D {
> > > +		.default_flags =3D HMM_PFN_REQ_FAULT | (ctx-
> > > >read_only
> > > ? 0 :
> > > +			HMM_PFN_REQ_WRITE),
> > > +		.notifier =3D notifier,
> > > +		.start =3D range->itree.start,
> > > +		.end =3D range->itree.last + 1,
> > > +		.dev_private_owner =3D gpusvm-
> > > > device_private_page_owner,
> > > +	};
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	struct drm_gpusvm_zdd *zdd;
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long i, j;
> > > +	unsigned long npages =3D npages_in_range(range-
> > > >itree.start,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->itree.last
> > > +
> > > 1);
> > > +	unsigned long num_dma_mapped;
> > > +	unsigned int order =3D 0;
> > > +	unsigned long *pfns;
> > > +	struct page **pages;
> > > +	int err =3D 0;
> > > +	struct dev_pagemap *pagemap;
> > > +	struct drm_pagemap *dpagemap;
> > > +
> > > +retry:
> > > +	hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(notifier);
> > > +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm,
> > > range))
> > > +		goto set_seqno;
> > > +
> > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns),
> > > GFP_KERNEL);
> > > +	if (!pfns)
> > > +		return -ENOMEM;
> > > +
> > > +	if (!mmget_not_zero(mm)) {
> > > +		err =3D -EFAULT;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +	while (true) {
> > > +		mmap_read_lock(mm);
> > > +		err =3D hmm_range_fault(&hmm_range);
> > > +		mmap_read_unlock(mm);
> > > +
> > > +		if (err =3D=3D -EBUSY) {
> > > +			if (time_after(jiffies, timeout))
> > > +				break;
> > > +
> > > +			hmm_range.notifier_seq =3D
> > > +				mmu_interval_read_begin(notifier
> > > );
> > > +			continue;
> > > +		}
> > > +		break;
> > > +	}
> > > +	mmput(mm);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	pages =3D (struct page **)pfns;
> > > +map_pages:
> > > +	/*
> > > +	 * Perform all dma mappings under the notifier lock to
> > > not
> > > +	 * access freed pages. A notifier will either block on
> > > +	 * the notifier lock or unmap dma.
> > > +	 */
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +
> > > +	if (range->flags.unmapped) {
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +		err =3D -EFAULT;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	if (mmu_interval_read_retry(notifier,
> > > hmm_range.notifier_seq)) {
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +		kvfree(pfns);
> > > +		goto retry;
> > > +	}
> > > +
> > > +	if (!range->dma_addr) {
> > > +		/* Unlock and restart mapping to allocate
> > > memory. */
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +		range->dma_addr =3D kvmalloc_array(npages,
> > > +						 sizeof(*range-
> > > > dma_addr),
> > > +						 GFP_KERNEL);
> > > +		if (!range->dma_addr) {
> > > +			err =3D -ENOMEM;
> > > +			goto err_free;
> > > +		}
> > > +		goto map_pages;
> > > +	}
> > > +
> > > +	zdd =3D NULL;
> > > +	num_dma_mapped =3D 0;
> > > +	for (i =3D 0, j =3D 0; i < npages; ++j) {
> > > +		struct page *page =3D hmm_pfn_to_page(pfns[i]);
> > > +
> > > +		order =3D hmm_pfn_to_map_order(pfns[i]);
> > > +		if (is_device_private_page(page) ||
> > > +		=C2=A0=C2=A0=C2=A0 is_device_coherent_page(page)) {
> > > +			if (zdd !=3D page->zone_device_data && i >
> > > 0)
> > > {
> > > +				err =3D -EOPNOTSUPP;
> > > +				goto err_unmap;
> > > +			}
> > > +			zdd =3D page->zone_device_data;
> > > +			if (pagemap !=3D page->pgmap) {
> > > +				if (i > 0) {
> > > +					err =3D -EOPNOTSUPP;
> > > +					goto err_unmap;
> > > +				}
> > > +
> > > +				pagemap =3D page->pgmap;
> > > +				dpagemap =3D zdd-
> > > >devmem_allocation-
> > > > dpagemap;
> > > +				if (drm_WARN_ON(gpusvm->drm,
> > > !dpagemap)) {
> > > +					/*
> > > +					 * Raced. This is not
> > > supposed to happen
> > > +					 * since
> > > hmm_range_fault()
> > > should've migrated
> > > +					 * this page to system.
> > > +					 */
> > > +					err =3D -EAGAIN;
> > > +					goto err_unmap;
> > > +				}
> > > +			}
> > > +			range->dma_addr[j] =3D
> > > +				dpagemap->ops->map_dma(dpagemap,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpusvm-
> > > >drm-
> > > > dev,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page,
> > > order,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > DMA_BIDIRECTIONAL);
> > > +			if (dma_mapping_error(gpusvm->drm->dev,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range-
> > > > dma_addr[j].addr)) {
> > > +				err =3D -EFAULT;
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			pages[i] =3D page;
> > > +		} else {
> > > +			dma_addr_t addr;
> > > +
> > > +			if (is_zone_device_page(page) || zdd) {
> > > +				err =3D -EOPNOTSUPP;
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			addr =3D dma_map_page(gpusvm->drm->dev,
> > > +					=C2=A0=C2=A0=C2=A0 page, 0,
> > > +					=C2=A0=C2=A0=C2=A0 PAGE_SIZE << order,
> > > +					=C2=A0=C2=A0=C2=A0 DMA_BIDIRECTIONAL);
> > > +			if (dma_mapping_error(gpusvm->drm->dev,
> > > addr)) {
> > > +				err =3D -EFAULT;
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			range->dma_addr[j] =3D
> > > drm_pagemap_dma_addr_encode
> > > +				(addr, DRM_INTERCONNECT_SYSTEM,
> > > order,
> > > +				 DMA_BIDIRECTIONAL);
> > > +		}
> > > +		i +=3D 1 << order;
> > > +		num_dma_mapped =3D i;
> > > +	}
> > > +
> > > +	range->flags.has_dma_mapping =3D true;
> > > +	if (zdd) {
> > > +		range->flags.has_devmem_pages =3D true;
> > > +		range->dpagemap =3D dpagemap;
> > > +	}
> > > +
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +	kvfree(pfns);
> > > +set_seqno:
> > > +	range->notifier_seq =3D hmm_range.notifier_seq;
> > > +
> > > +	return 0;
> > > +
> > > +err_unmap:
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range,
> > > num_dma_mapped);
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +err_free:
> > > +	kvfree(pfns);
> > > +	if (err =3D=3D -EAGAIN)
> > > +		goto retry;
> > > +	return err;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
> > > +
> > > +/**
> > > + * drm_gpusvm_range_unmap_pages() - Unmap pages associated with
> > > a
> > > GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function unmaps pages associated with a GPU SVM range.
> > > If
> > > @in_notifier
> > > + * is set, it is assumed that gpusvm->notifier_lock is held in
> > > write
> > > mode; if it
> > > + * is clear, it acquires gpusvm->notifier_lock in read mode.
> > > Must be
> > > called on
> > > + * each GPU SVM range attached to notifier in gpusvm->ops-
> > > > invalidate for IOMMU
> > > + * security model.
> > > + */
> > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0 struct drm_gpusvm_range
> > > *range,
> > > +				=C2=A0 const struct drm_gpusvm_ctx
> > > *ctx)
> > > +{
> > > +	unsigned long npages =3D npages_in_range(range-
> > > >itree.start,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->itree.last
> > > +
> > > 1);
> > > +
> > > +	if (ctx->in_notifier)
> > > +		lockdep_assert_held_write(&gpusvm-
> > > >notifier_lock);
> > > +	else
> > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > +
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> > > +
> > > +	if (!ctx->in_notifier)
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
> > > +
> > > +/**
> > > + * drm_gpusvm_migration_unlock_put_page() - Put a migration page
> > > + * @page: Pointer to the page to put
> > > + *
> > > + * This function unlocks and puts a page.
> > > + */
> > > +static void drm_gpusvm_migration_unlock_put_page(struct page
> > > *page)
> > > +{
> > > +	unlock_page(page);
> > > +	put_page(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migration_unlock_put_pages() - Put migration pages
> > > + * @npages: Number of pages
> > > + * @migrate_pfn: Array of migrate page frame numbers
> > > + *
> > > + * This function unlocks and puts an array of pages.
> > > + */
> > > +static void drm_gpusvm_migration_unlock_put_pages(unsigned long
> > > npages,
> > > +						=C2=A0 unsigned long
> > > *migrate_pfn)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page;
> > > +
> > > +		if (!migrate_pfn[i])
> > > +			continue;
> > > +
> > > +		page =3D migrate_pfn_to_page(migrate_pfn[i]);
> > > +		drm_gpusvm_migration_unlock_put_page(page);
> > > +		migrate_pfn[i] =3D 0;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_get_devmem_page() - Get a reference to a device
> > > memory
> > > page
> > > + * @page: Pointer to the page
> > > + * @zdd: Pointer to the GPU SVM zone device data
> > > + *
> > > + * This function associates the given page with the specified
> > > GPU
> > > SVM zone
> > > + * device data and initializes it for zone device usage.
> > > + */
> > > +static void drm_gpusvm_get_devmem_page(struct page *page,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_zdd *zdd)
> > > +{
> > > +	page->zone_device_data =3D drm_gpusvm_zdd_get(zdd);
> > > +	zone_device_page_init(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU
> > > SVM
> > > migration
> > > + * @dev: The device for which the pages are being mapped
> > > + * @dma_addr: Array to store DMA addresses corresponding to
> > > mapped
> > > pages
> > > + * @migrate_pfn: Array of migrate page frame numbers to map
> > > + * @npages: Number of pages to map
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function maps pages of memory for migration usage in GPU
> > > SVM. It
> > > + * iterates over each page frame number provided in
> > > @migrate_pfn,
> > > maps the
> > > + * corresponding page, and stores the DMA address in the
> > > provided
> > > @dma_addr
> > > + * array.
> > > + *
> > > + * Returns: 0 on success, -EFAULT if an error occurs during
> > > mapping.
> > > + */
> > > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > > +					dma_addr_t *dma_addr,
> > > +					unsigned long
> > > *migrate_pfn,
> > > +					unsigned long npages,
> > > +					enum dma_data_direction
> > > dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > +			return -EFAULT;
> > > +
> > > +		dma_addr[i] =3D dma_map_page(dev, page, 0,
> > > PAGE_SIZE,
> > > dir);
> > > +		if (dma_mapping_error(dev, dma_addr[i]))
> > > +			return -EFAULT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously
> > > mapped
> > > for GPU SVM migration
> > > + * @dev: The device for which the pages were mapped
> > > + * @dma_addr: Array of DMA addresses corresponding to mapped
> > > pages
> > > + * @npages: Number of pages to unmap
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function unmaps previously mapped pages of memory for
> > > GPU
> > > Shared Virtual
> > > + * Memory (SVM). It iterates over each DMA address provided in
> > > @dma_addr, checks
> > > + * if it's valid and not already unmapped, and unmaps the
> > > corresponding page.
> > > + */
> > > +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > > +					=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > +					=C2=A0=C2=A0 unsigned long npages,
> > > +					=C2=A0=C2=A0 enum
> > > dma_data_direction
> > > dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		if (!dma_addr[i] || dma_mapping_error(dev,
> > > dma_addr[i]))
> > > +			continue;
> > > +
> > > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE,
> > > dir);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_to_devmem() - Migrate GPU SVM range to
> > > device
> > > memory
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @devmem_allocation: Pointer to the device memory allocation.
> > > The
> > > caller
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should hold a refere=
nce to the device
> > > memory
> > > allocation,
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which should be drop=
ped via ops-
> > > > devmem_release or upon
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the failure of this =
function.
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function migrates the specified GPU SVM range to device
> > > memory. It performs the
> > > + * necessary setup and invokes the driver-specific operations
> > > for
> > > migration to
> > > + * device memory. Upon successful return, @devmem_allocation can
> > > safely reference @range
> > > + * until ops->devmem_release is called which only upon
> > > successful
> > > return.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > > +				 struct drm_gpusvm_range *range,
> > > +				 struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > +				 const struct drm_gpusvm_ctx
> > > *ctx)
> > > +{
> > > +	const struct drm_gpusvm_devmem_ops *ops =3D
> > > devmem_allocation-
> > > > ops;
> > > +	unsigned long start =3D range->itree.start, end =3D range-
> > > > itree.last + 1;
> > > +	struct migrate_vma migrate =3D {
> > > +		.start		=3D start,
> > > +		.end		=3D end,
> > > +		.pgmap_owner	=3D gpusvm-
> > > >device_private_page_owner,
> > > +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> > > +	};
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	unsigned long i, npages =3D npages_in_range(start, end);
> > > +	struct vm_area_struct *vas;
> > > +	struct drm_gpusvm_zdd *zdd =3D NULL;
> > > +	struct page **pages;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int err;
> > > +
> > > +	if (!range->flags.migrate_devmem)
> > > +		return -EINVAL;
> > > +
> > > +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> > > +	=C2=A0=C2=A0=C2=A0 !ops->copy_to_ram)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	if (!mmget_not_zero(mm)) {
> > > +		err =3D -EFAULT;
> > > +		goto err_out;
> > > +	}
> > > +	mmap_read_lock(mm);
> > > +
> > > +	vas =3D vma_lookup(mm, start);
> > > +	if (!vas) {
> > > +		err =3D -ENOENT;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > +		err =3D -EINVAL;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	if (!vma_is_anonymous(vas)) {
> > > +		err =3D -EBUSY;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_mmunlock;
> > > +	}
> > > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr))
> > > * npages;
> > > +
> > > +	zdd =3D drm_gpusvm_zdd_alloc(gpusvm-
> > > > device_private_page_owner);
> > > +	if (!zdd) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	migrate.vma =3D vas;
> > > +	migrate.src =3D buf;
> > > +	migrate.dst =3D migrate.src + npages;
> > > +
> > > +	err =3D migrate_vma_setup(&migrate);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	if (!migrate.cpages) {
> > > +		err =3D -EFAULT;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	if (migrate.cpages !=3D npages) {
> > > +		err =3D -EBUSY;
> > > +		goto err_finalize;
> > > +	}
> > > +
> > > +	err =3D ops->populate_devmem_pfn(devmem_allocation,
> > > npages,
> > > migrate.dst);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation-
> > > >dev,
> > > dma_addr,
> > > +					=C2=A0=C2=A0 migrate.src, npages,
> > > DMA_TO_DEVICE);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D pfn_to_page(migrate.dst[i]);
> > > +
> > > +		pages[i] =3D page;
> > > +		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > > +		drm_gpusvm_get_devmem_page(page, zdd);
> > > +	}
> > > +
> > > +	err =3D ops->copy_to_devmem(pages, dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	/* Upon success bind devmem allocation to range and zdd
> > > */
> > > +	zdd->devmem_allocation =3D devmem_allocation;	/* Owns
> > > ref
> > > */
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_gpusvm_migration_unlock_put_pages(npages,
> > > migrate.dst);
> > > +	migrate_vma_pages(&migrate);
> > > +	migrate_vma_finalize(&migrate);
> > > +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> > > dma_addr, npages,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_TO_DEVICE);
> > > +err_free:
> > > +	if (zdd)
> > > +		drm_gpusvm_zdd_put(zdd);
> > > +	kvfree(buf);
> > > +err_mmunlock:
> > > +	mmap_read_unlock(mm);
> > > +	mmput(mm);
> > > +err_out:
> > > +	return err;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_migrate_to_devmem);
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_populate_ram_pfn() - Populate RAM PFNs for
> > > a
> > > VM area
> > > + * @vas: Pointer to the VM area structure, can be NULL
> > > + * @fault_page: Fault page
> > > + * @npages: Number of pages to populate
> > > + * @mpages: Number of pages to migrate
> > > + * @src_mpfn: Source array of migrate PFNs
> > > + * @mpfn: Array of migrate PFNs to populate
> > > + * @addr: Start address for PFN allocation
> > > + *
> > > + * This function populates the RAM migrate page frame numbers
> > > (PFNs)
> > > for the
> > > + * specified VM area structure. It allocates and locks pages in
> > > the
> > > VM area for
> > > + * RAM usage. If vas is non-NULL use alloc_page_vma for
> > > allocation,
> > > if NULL use
> > > + * alloc_page for allocation.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +static int drm_gpusvm_migrate_populate_ram_pfn(struct
> > > vm_area_struct
> > > *vas,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page
> > > *fault_page,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > npages,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > *mpages,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > *src_mpfn,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > *mpfn,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > addr)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> > > +		struct page *page, *src_page;
> > > +
> > > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > +			continue;
> > > +
> > > +		src_page =3D migrate_pfn_to_page(src_mpfn[i]);
> > > +		if (!src_page)
> > > +			continue;
> > > +
> > > +		if (fault_page) {
> > > +			if (src_page->zone_device_data !=3D
> > > +			=C2=A0=C2=A0=C2=A0 fault_page->zone_device_data)
> > > +				continue;
> > > +		}
> > > +
> > > +		if (vas)
> > > +			page =3D alloc_page_vma(GFP_HIGHUSER, vas,
> > > addr);
> > > +		else
> > > +			page =3D alloc_page(GFP_HIGHUSER);
> > > +
> > > +		if (!page)
> > > +			goto free_pages;
> > > +
> > > +		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> > > +	}
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(mpfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		WARN_ON_ONCE(!trylock_page(page));
> > > +		++*mpages;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +free_pages:
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(mpfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		put_page(page);
> > > +		mpfn[i] =3D 0;
> > > +	}
> > > +	return -ENOMEM;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_evict_to_ram() - Evict GPU SVM range to RAM
> > > + * @devmem_allocation: Pointer to the device memory allocation
> > > + *
> > > + * Similar to __drm_gpusvm_migrate_to_ram but does not require
> > > mmap
> > > lock and
> > > + * migration done via migrate_device_* functions.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> > > *devmem_allocation)
> > > +{
> > > +	const struct drm_gpusvm_devmem_ops *ops =3D
> > > devmem_allocation-
> > > > ops;
> > > +	unsigned long npages, mpages =3D 0;
> > > +	struct page **pages;
> > > +	unsigned long *src, *dst;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int i, err =3D 0;
> > > +	unsigned int retry_count =3D 2;
> > > +
> > > +	npages =3D devmem_allocation->size >> PAGE_SHIFT;
> > > +
> > > +retry:
> > > +	if (!mmget_not_zero(devmem_allocation->mm))
> > > +		return -EFAULT;
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*src) +
> > > sizeof(*dma_addr)
> > > +
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_out;
> > > +	}
> > > +	src =3D buf;
> > > +	dst =3D buf + (sizeof(*src) * npages);
> > > +	dma_addr =3D buf + (2 * sizeof(*src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) *
> > > npages;
> > > +
> > > +	err =3D ops->populate_devmem_pfn(devmem_allocation,
> > > npages,
> > > src);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	err =3D migrate_device_pfns(src, npages);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	err =3D drm_gpusvm_migrate_populate_ram_pfn(NULL, NULL,
> > > npages, &mpages,
> > > +						=C2=A0 src, dst, 0);
> > > +	if (err || !mpages)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation-
> > > >dev,
> > > dma_addr,
> > > +					=C2=A0=C2=A0 dst, npages,
> > > DMA_FROM_DEVICE);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i)
> > > +		pages[i] =3D migrate_pfn_to_page(src[i]);
> > > +
> > > +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_gpusvm_migration_unlock_put_pages(npages,
> > > dst);
> > > +	migrate_device_pages(src, dst, npages);
> > > +	migrate_device_finalize(src, dst, npages);
> > > +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> > > dma_addr, npages,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > > +err_free:
> > > +	kvfree(buf);
> > > +err_out:
> > > +	mmput_async(devmem_allocation->mm);
> > > +
> > > +	if (completion_done(&devmem_allocation->detached))
> > > +		return 0;
> > > +
> > > +	if (!err || retry_count--) {
> > > +		cond_resched();
> > > +		goto retry;
> > > +	}
> > > +
> > > +	return err;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_evict_to_ram);
> > > +
> > > +/**
> > > + * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM
> > > (internal)
> > > + * @vas: Pointer to the VM area structure
> > > + * @device_private_page_owner: Device private pages owner
> > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > + * @fault_addr: Fault address
> > > + * @size: Size of migration
> > > + *
> > > + * This internal function performs the migration of the
> > > specified
> > > GPU SVM range
> > > + * to RAM. It sets up the migration, populates + dma maps RAM
> > > PFNs,
> > > and
> > > + * invokes the driver-specific operations for migration to RAM.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct
> > > *vas,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void
> > > *device_private_page_owner,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long fault_addr,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size)
> > > +{
> > > +	struct migrate_vma migrate =3D {
> > > +		.vma		=3D vas,
> > > +		.pgmap_owner	=3D device_private_page_owner,
> > > +		.flags		=3D
> > > MIGRATE_VMA_SELECT_DEVICE_PRIVATE
> > > >=20
> > > +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > > +		.fault_page	=3D page,
> > > +	};
> > > +	struct drm_gpusvm_zdd *zdd;
> > > +	const struct drm_gpusvm_devmem_ops *ops;
> > > +	struct device *dev;
> > > +	unsigned long npages, mpages =3D 0;
> > > +	struct page **pages;
> > > +	dma_addr_t *dma_addr;
> > > +	unsigned long start, end;
> > > +	void *buf;
> > > +	int i, err =3D 0;
> > > +
> > > +	start =3D ALIGN_DOWN(fault_addr, size);
> > > +	end =3D ALIGN(fault_addr + 1, size);
> > > +
> > > +	/* Corner where VMA area struct has been partially
> > > unmapped
> > > */
> > > +	if (start < vas->vm_start)
> > > +		start =3D vas->vm_start;
> > > +	if (end > vas->vm_end)
> > > +		end =3D vas->vm_end;
> > > +
> > > +	migrate.start =3D start;
> > > +	migrate.end =3D end;
> > > +	npages =3D npages_in_range(start, end);
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_out;
> > > +	}
> > > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr))
> > > * npages;
> > > +
> > > +	migrate.vma =3D vas;
> > > +	migrate.src =3D buf;
> > > +	migrate.dst =3D migrate.src + npages;
> > > +
> > > +	err =3D migrate_vma_setup(&migrate);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	/* Raced with another CPU fault, nothing to do */
> > > +	if (!migrate.cpages)
> > > +		goto err_free;
> > > +
> > > +	if (!page) {
> > > +		for (i =3D 0; i < npages; ++i) {
> > > +			if (!(migrate.src[i] &
> > > MIGRATE_PFN_MIGRATE))
> > > +				continue;
> > > +
> > > +			page =3D
> > > migrate_pfn_to_page(migrate.src[i]);
> > > +			break;
> > > +		}
> > > +
> > > +		if (!page)
> > > +			goto err_finalize;
> > > +	}
> > > +	zdd =3D page->zone_device_data;
> > > +	ops =3D zdd->devmem_allocation->ops;
> > > +	dev =3D zdd->devmem_allocation->dev;
> > > +
> > > +	err =3D drm_gpusvm_migrate_populate_ram_pfn(vas, page,
> > > npages,
> > > &mpages,
> > > +						=C2=A0 migrate.src,
> > > migrate.dst,
> > > +						=C2=A0 start);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_gpusvm_migrate_map_pages(dev, dma_addr,
> > > migrate.dst, npages,
> > > +					=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i)
> > > +		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> > > +
> > > +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_gpusvm_migration_unlock_put_pages(npages,
> > > migrate.dst);
> > > +	migrate_vma_pages(&migrate);
> > > +	migrate_vma_finalize(&migrate);
> > > +	drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > > +err_free:
> > > +	kvfree(buf);
> > > +err_out:
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_evict - Evict GPU SVM range
> > > + * @pagemap: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range to be removed
> > > + *
> > > + * This function evicts the specified GPU SVM range. This
> > > function
> > > will not
> > > + * evict coherent pages.
> > > + *
> > > + * Returns:
> > > + * 0 on success, a negative error code on failure.
> > > + */
> > > +int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0 struct drm_gpusvm_range *range)
> > > +{
> > > +	struct mmu_interval_notifier *notifier =3D &range-
> > > >notifier-
> > > > notifier;
> > > +	struct hmm_range hmm_range =3D {
> > > +		.default_flags =3D HMM_PFN_REQ_FAULT,
> > > +		.notifier =3D notifier,
> > > +		.start =3D range->itree.start,
> > > +		.end =3D range->itree.last + 1,
> > > +		.dev_private_owner =3D NULL,
> > > +	};
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long *pfns;
> > > +	unsigned long npages =3D npages_in_range(range-
> > > >itree.start,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->itree.last
> > > +
> > > 1);
> > > +	int err =3D 0;
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +
> > > +	if (!mmget_not_zero(mm))
> > > +		return -EFAULT;
> > > +
> > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns),
> > > GFP_KERNEL);
> > > +	if (!pfns)
> > > +		return -ENOMEM;
> > > +
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +	while (!time_after(jiffies, timeout)) {
> > > +		hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(notifier);
> > > +		if (time_after(jiffies, timeout)) {
> > > +			err =3D -ETIME;
> > > +			break;
> > > +		}
> > > +
> > > +		mmap_read_lock(mm);
> > > +		err =3D hmm_range_fault(&hmm_range);
> > > +		mmap_read_unlock(mm);
> > > +		if (err !=3D -EBUSY)
> > > +			break;
> > > +	}
> > > +
> > > +	kvfree(pfns);
> > > +	mmput(mm);
> > > +
> > > +	return err;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
> > > +
> > > +/**
> > > + * drm_gpusvm_page_free() - Put GPU SVM zone device data
> > > associated
> > > with a page
> > > + * @page: Pointer to the page
> > > + *
> > > + * This function is a callback used to put the GPU SVM zone
> > > device
> > > data
> > > + * associated with a page when it is being released.
> > > + */
> > > +static void drm_gpusvm_page_free(struct page *page)
> > > +{
> > > +	drm_gpusvm_zdd_put(page->zone_device_data);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM
> > > (page
> > > fault handler)
> > > + * @vmf: Pointer to the fault information structure
> > > + *
> > > + * This function is a page fault handler used to migrate a GPU
> > > SVM
> > > range to RAM.
> > > + * It retrieves the GPU SVM range information from the faulting
> > > page
> > > and invokes
> > > + * the internal migration function to migrate the range back to
> > > RAM.
> > > + *
> > > + * Returns:
> > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > + */
> > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault
> > > *vmf)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd =3D vmf->page-
> > > >zone_device_data;
> > > +	int err;
> > > +
> > > +	err =3D __drm_gpusvm_migrate_to_ram(vmf->vma,
> > > +					=C2=A0 zdd-
> > > > device_private_page_owner,
> > > +					=C2=A0 vmf->page, vmf-
> > > >address,
> > > +					=C2=A0 zdd-
> > > >devmem_allocation-
> > > > size);
> > > +
> > > +	return err ? VM_FAULT_SIGBUS : 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_pagemap_ops() - Device page map operations for GPU
> > > SVM
> > > + */
> > > +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops =3D {
> > > +	.page_free =3D drm_gpusvm_page_free,
> > > +	.migrate_to_ram =3D drm_gpusvm_migrate_to_ram,
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_pagemap_ops_get() - Retrieve GPU SVM device page
> > > map
> > > operations
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM device page map operations structure.
> > > + */
> > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > > +{
> > > +	return &drm_gpusvm_pagemap_ops;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_pagemap_ops_get);
> > > +
> > > +/**
> > > + * drm_gpusvm_has_mapping() - Check if GPU SVM has mapping for
> > > the
> > > given address range
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + * @start: Start address
> > > + * @end: End address
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM has mapping, False otherwise
> > > + */
> > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned
> > > long
> > > start,
> > > +			=C2=A0=C2=A0=C2=A0 unsigned long end)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start,
> > > end) {
> > > +		struct drm_gpusvm_range *range =3D NULL;
> > > +
> > > +		drm_gpusvm_for_each_range(range, notifier,
> > > start,
> > > end)
> > > +			return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_has_mapping);
> > > +
> > > +/**
> > > + * drm_gpusvm_range_set_unmapped() - Mark a GPU SVM range as
> > > unmapped
> > > + * @range: Pointer to the GPU SVM range structure.
> > > + * @mmu_range: Pointer to the MMU notifier range structure.
> > > + *
> > > + * This function marks a GPU SVM range as unmapped and sets the
> > > partial_unmap flag
> > > + * if the range partially falls within the provided MMU notifier
> > > range.
> > > + */
> > > +void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range
> > > *range,
> > > +				=C2=A0=C2=A0 const struct
> > > mmu_notifier_range
> > > *mmu_range)
> > > +{
> > > +	lockdep_assert_held_write(&range->gpusvm-
> > > >notifier_lock);
> > > +
> > > +	range->flags.unmapped =3D true;
> > > +	if (range->itree.start < mmu_range->start ||
> > > +	=C2=A0=C2=A0=C2=A0 range->itree.last + 1 > mmu_range->end)
> > > +		range->flags.partial_unmap =3D true;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
> > > +
> > > +/**
> > > + * drm_gpusvm_devmem_init() - Initialize a GPU SVM device memory
> > > allocation
> > > + *
> > > + * @dev: Pointer to the device structure which device memory
> > > allocation belongs to
> > > + * @mm: Pointer to the mm_struct for the address space
> > > + * @ops: Pointer to the operations structure for GPU SVM device
> > > memory
> > > + * @dpagemap: The struct drm_pagemap we're allocating from.
> > > + * @size: Size of device memory allocation
> > > + */
> > > +void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > +			=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_struct
> > > *mm,
> > > +			=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_devmem_ops
> > > *ops,
> > > +			=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > > size)
> > > +{
> > > +	init_completion(&devmem_allocation->detached);
> > > +	devmem_allocation->dev =3D dev;
> > > +	devmem_allocation->mm =3D mm;
> > > +	devmem_allocation->ops =3D ops;
> > > +	devmem_allocation->dpagemap =3D dpagemap;
> > > +	devmem_allocation->size =3D size;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_devmem_init);
> > > +
> > > +MODULE_DESCRIPTION("DRM GPUSVM");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > new file mode 100644
> > > index 000000000000..ea31db0be841
> > > --- /dev/null
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -0,0 +1,445 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> > > +/*
> > > + * Copyright =C2=A9 2024 Intel Corporation
> > > + */
> > > +
> > > +#ifndef __DRM_GPUSVM_H__
> > > +#define __DRM_GPUSVM_H__
> > > +
> > > +#include <linux/kref.h>
> > > +#include <linux/interval_tree.h>
> > > +#include <linux/mmu_notifier.h>
> > > +
> > > +struct dev_pagemap_ops;
> > > +struct drm_device;
> > > +struct drm_gpusvm;
> > > +struct drm_gpusvm_notifier;
> > > +struct drm_gpusvm_ops;
> > > +struct drm_gpusvm_range;
> > > +struct drm_gpusvm_devmem;
> > > +struct drm_pagemap;
> > > +struct drm_pagemap_dma_addr;
> > > +
> > > +/**
> > > + * struct drm_gpusvm_devmem_ops - Operations structure for GPU
> > > SVM
> > > device memory
> > > + *
> > > + * This structure defines the operations for GPU Shared Virtual
> > > Memory (SVM)
> > > + * device memory. These operations are provided by the GPU
> > > driver to
> > > manage device memory
> > > + * allocations and perform operations such as migration between
> > > device memory and system
> > > + * RAM.
> > > + */
> > > +struct drm_gpusvm_devmem_ops {
> > > +	/**
> > > +	 * @devmem_release: Release device memory allocation
> > > (optional)
> > > +	 * @devmem_allocation: device memory allocation
> > > +	 *
> > > +	 * Release device memory allocation and drop a reference
> > > to
> > > device
> > > +	 * memory allocation.
> > > +	 */
> > > +	void (*devmem_release)(struct drm_gpusvm_devmem
> > > *devmem_allocation);
> > > +
> > > +	/**
> > > +	 * @populate_devmem_pfn: Populate device memory PFN
> > > (required for migration)
> > > +	 * @devmem_allocation: device memory allocation
> > > +	 * @npages: Number of pages to populate
> > > +	 * @pfn: Array of page frame numbers to populate
> > > +	 *
> > > +	 * Populate device memory page frame numbers (PFN).
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code on failure.
> > > +	 */
> > > +	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > +				=C2=A0=C2=A0 unsigned long npages,
> > > unsigned
> > > long *pfn);
> > > +
> > > +	/**
> > > +	 * @copy_to_devmem: Copy to device memory (required for
> > > migration)
> > > +	 * @pages: Pointer to array of device memory pages
> > > (destination)
> > > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > > +	 * @npages: Number of pages to copy
> > > +	 *
> > > +	 * Copy pages to device memory.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code on failure.
> > > +	 */
> > > +	int (*copy_to_devmem)(struct page **pages,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages);
> > > +
> > > +	/**
> > > +	 * @copy_to_ram: Copy to system RAM (required for
> > > migration)
> > > +	 * @pages: Pointer to array of device memory pages
> > > (source)
> > > +	 * @dma_addr: Pointer to array of DMA addresses
> > > (destination)
> > > +	 * @npages: Number of pages to copy
> > > +	 *
> > > +	 * Copy pages to system RAM.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code on failure.
> > > +	 */
> > > +	int (*copy_to_ram)(struct page **pages,
> > > +			=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > +			=C2=A0=C2=A0 unsigned long npages);
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm_devmem - Structure representing a GPU SVM
> > > device memory allocation
> > > + *
> > > + * @dev: Pointer to the device structure which device memory
> > > allocation belongs to
> > > + * @mm: Pointer to the mm_struct for the address space
> > > + * @detached: device memory allocations is detached from device
> > > pages
> > > + * @ops: Pointer to the operations structure for GPU SVM device
> > > memory
> > > + * @dpagemap: The struct drm_pagemap of the pages this
> > > allocation
> > > belongs to.
> > > + * @size: Size of device memory allocation
> > > + */
> > > +struct drm_gpusvm_devmem {
> > > +	struct device *dev;
> > > +	struct mm_struct *mm;
> > > +	struct completion detached;
> > > +	const struct drm_gpusvm_devmem_ops *ops;
> > > +	struct drm_pagemap *dpagemap;
> > > +	size_t size;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > > + *
> > > + * This structure defines the operations for GPU Shared Virtual
> > > Memory (SVM).
> > > + * These operations are provided by the GPU driver to manage SVM
> > > ranges and
> > > + * notifiers.
> > > + */
> > > +struct drm_gpusvm_ops {
> > > +	/**
> > > +	 * @notifier_alloc: Allocate a GPU SVM notifier
> > > (optional)
> > > +	 *
> > > +	 * Allocate a GPU SVM notifier.
> > > +	 *
> > > +	 * Returns:
> > > +	 * Pointer to the allocated GPU SVM notifier on success,
> > > NULL on failure.
> > > +	 */
> > > +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > > +
> > > +	/**
> > > +	 * @notifier_free: Free a GPU SVM notifier (optional)
> > > +	 * @notifier: Pointer to the GPU SVM notifier to be
> > > freed
> > > +	 *
> > > +	 * Free a GPU SVM notifier.
> > > +	 */
> > > +	void (*notifier_free)(struct drm_gpusvm_notifier
> > > *notifier);
> > > +
> > > +	/**
> > > +	 * @range_alloc: Allocate a GPU SVM range (optional)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 *
> > > +	 * Allocate a GPU SVM range.
> > > +	 *
> > > +	 * Returns:
> > > +	 * Pointer to the allocated GPU SVM range on success,
> > > NULL
> > > on failure.
> > > +	 */
> > > +	struct drm_gpusvm_range *(*range_alloc)(struct
> > > drm_gpusvm
> > > *gpusvm);
> > > +
> > > +	/**
> > > +	 * @range_free: Free a GPU SVM range (optional)
> > > +	 * @range: Pointer to the GPU SVM range to be freed
> > > +	 *
> > > +	 * Free a GPU SVM range.
> > > +	 */
> > > +	void (*range_free)(struct drm_gpusvm_range *range);
> > > +
> > > +	/**
> > > +	 * @invalidate: Invalidate GPU SVM notifier (required)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 * @notifier: Pointer to the GPU SVM notifier
> > > +	 * @mmu_range: Pointer to the mmu_notifier_range
> > > structure
> > > +	 *
> > > +	 * Invalidate the GPU page tables. It can safely walk
> > > the
> > > notifier range
> > > +	 * RB tree/list in this function. Called while holding
> > > the
> > > notifier lock.
> > > +	 */
> > > +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0 struct drm_gpusvm_notifier *notifier,
> > > +			=C2=A0=C2=A0 const struct mmu_notifier_range
> > > *mmu_range);
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM
> > > notifier
> > > + *
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: MMU interval notifier
> > > + * @itree: Interval tree node for the notifier (inserted in GPU
> > > SVM)
> > > + * @entry: List entry to fast interval tree traversal
> > > + * @root: Cached root node of the RB tree containing ranges
> > > + * @range_list: List head containing of ranges in the same order
> > > they appear in
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 interval tree. This is useful to keep iterating
> > > ranges while
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 doing modifications to RB tree.
> > > + * @flags.removed: Flag indicating whether the MMU interval
> > > notifier
> > > has been
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 removed
> > > + *
> > > + * This structure represents a GPU SVM notifier.
> > > + */
> > > +struct drm_gpusvm_notifier {
> > > +	struct drm_gpusvm *gpusvm;
> > > +	struct mmu_interval_notifier notifier;
> > > +	struct interval_tree_node itree;
> > > +	struct list_head entry;
> > > +	struct rb_root_cached root;
> > > +	struct list_head range_list;
> > > +	struct {
> > > +		u32 removed : 1;
> > > +	} flags;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm_range - Structure representing a GPU SVM
> > > range
> > > + *
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier
> > > + * @refcount: Reference count for the range
> > > + * @itree: Interval tree node for the range (inserted in GPU SVM
> > > notifier)
> > > + * @entry: List entry to fast interval tree traversal
> > > + * @notifier_seq: Notifier sequence number of the range's pages
> > > + * @dma_addr: DMA address array
> > > + * @dpagemap: The struct drm_pagemap of the device pages we're
> > > dma-
> > > mapping.
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Note this is assuming only one drm_pagemap per
> > > range
> > > is allowed.
> > > + * @flags.migrate_devmem: Flag indicating whether the range can
> > > be
> > > migrated to device memory
> > > + * @flags.unmapped: Flag indicating if the range has been
> > > unmapped
> > > + * @flags.partial_unmap: Flag indicating if the range has been
> > > partially unmapped
> > > + * @flags.has_devmem_pages: Flag indicating if the range has
> > > devmem
> > > pages
> > > + * @flags.has_dma_mapping: Flag indicating if the range has a
> > > DMA
> > > mapping
> > > + *
> > > + * This structure represents a GPU SVM range used for tracking
> > > memory ranges
> > > + * mapped in a DRM device.
> > > + */
> > > +struct drm_gpusvm_range {
> > > +	struct drm_gpusvm *gpusvm;
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +	struct kref refcount;
> > > +	struct interval_tree_node itree;
> > > +	struct list_head entry;
> > > +	unsigned long notifier_seq;
> > > +	struct drm_pagemap_dma_addr *dma_addr;
> > > +	struct drm_pagemap *dpagemap;
> > > +	struct {
> > > +		/* All flags below must be set upon creation */
> > > +		u16 migrate_devmem : 1;
> > > +		/* All flags below must be set / cleared under
> > > notifier lock */
> > > +		u16 unmapped : 1;
> > > +		u16 partial_unmap : 1;
> > > +		u16 has_devmem_pages : 1;
> > > +		u16 has_dma_mapping : 1;
> > > +	} flags;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm - GPU SVM structure
> > > + *
> > > + * @name: Name of the GPU SVM
> > > + * @drm: Pointer to the DRM device structure
> > > + * @mm: Pointer to the mm_struct for the address space
> > > + * @device_private_page_owner: Device private pages owner
> > > + * @mm_start: Start address of GPU SVM
> > > + * @mm_range: Range of the GPU SVM
> > > + * @notifier_size: Size of individual notifiers
> > > + * @ops: Pointer to the operations structure for GPU SVM
> > > + * @chunk_sizes: Pointer to the array of chunk sizes used in
> > > range
> > > allocation.
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Entries should be powers of 2 in descending
> > > order.
> > > + * @num_chunks: Number of chunks
> > > + * @notifier_lock: Read-write semaphore for protecting notifier
> > > operations
> > > + * @root: Cached root node of the Red-Black tree containing GPU
> > > SVM
> > > notifiers
> > > + * @notifier_list: list head containing of notifiers in the same
> > > order they
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appear in interval tree. This is useful to
> > > keep
> > > iterating
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 notifiers while doing modifications to RB
> > > tree.
> > > + *
> > > + * This structure represents a GPU SVM (Shared Virtual Memory)
> > > used
> > > for tracking
> > > + * memory ranges mapped in a DRM (Direct Rendering Manager)
> > > device.
> > > + *
> > > + * No reference counting is provided, as this is expected to be
> > > embedded in the
> > > + * driver VM structure along with the struct drm_gpuvm, which
> > > handles reference
> > > + * counting.
> > > + */
> > > +struct drm_gpusvm {
> > > +	const char *name;
> > > +	struct drm_device *drm;
> > > +	struct mm_struct *mm;
> > > +	void *device_private_page_owner;
> > > +	unsigned long mm_start;
> > > +	unsigned long mm_range;
> > > +	unsigned long notifier_size;
> > > +	const struct drm_gpusvm_ops *ops;
> > > +	const unsigned long *chunk_sizes;
> > > +	int num_chunks;
> > > +	struct rw_semaphore notifier_lock;
> > > +	struct rb_root_cached root;
> > > +	struct list_head notifier_list;
> > > +#ifdef CONFIG_LOCKDEP
> > > +	/**
> > > +	 * @lock_dep_map: Annotates
> > > drm_gpusvm_range_find_or_insert
> > > and
> > > +	 * drm_gpusvm_range_remove with a driver provided lock.
> > > +	 */
> > > +	struct lockdep_map *lock_dep_map;
> > > +#endif
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > > + *
> > > + * @check_pages_threshold: Check CPU pages for present if chunk
> > > is
> > > less than or
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 equal to threshold. If not present,
> > > reduce chunk
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 size.
> > > + * @in_notifier: entering from a MMU notifier
> > > + * @read_only: operating on read-only memory
> > > + * @devmem_possible: possible to use device memory
> > > + *
> > > + * Context that is DRM GPUSVM is operating in (i.e. user
> > > arguments).
> > > + */
> > > +struct drm_gpusvm_ctx {
> > > +	unsigned long check_pages_threshold;
> > > +	unsigned int in_notifier :1;
> > > +	unsigned int read_only :1;
> > > +	unsigned int devmem_possible :1;
> > > +};
> > > +
> > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > +		=C2=A0=C2=A0=C2=A0 const char *name, struct drm_device *drm,
> > > +		=C2=A0=C2=A0=C2=A0 struct mm_struct *mm, void
> > > *device_private_page_owner,
> > > +		=C2=A0=C2=A0=C2=A0 unsigned long mm_start, unsigned long
> > > mm_range,
> > > +		=C2=A0=C2=A0=C2=A0 unsigned long notifier_size,
> > > +		=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ops *ops,
> > > +		=C2=A0=C2=A0=C2=A0 const unsigned long *chunk_sizes, int
> > > num_chunks);
> > > +
> > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > > +
> > > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > > +
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
> > > +				unsigned long fault_addr,
> > > +				unsigned long gpuva_start,
> > > +				unsigned long gpuva_end,
> > > +				const struct drm_gpusvm_ctx
> > > *ctx);
> > > +
> > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range);
> > > +
> > > +int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0 struct drm_gpusvm_range *range);
> > > +
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > > +
> > > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> > > +
> > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0 struct drm_gpusvm_range
> > > *range);
> > > +
> > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *ran=
ge,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx
> > > *ctx);
> > > +
> > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0 struct drm_gpusvm_range
> > > *range,
> > > +				=C2=A0 const struct drm_gpusvm_ctx
> > > *ctx);
> > > +
> > > +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > > +				 struct drm_gpusvm_range *range,
> > > +				 struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > +				 const struct drm_gpusvm_ctx
> > > *ctx);
> > > +
> > > +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> > > *devmem_allocation);
> > > +
> > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > > +
> > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned
> > > long
> > > start,
> > > +			=C2=A0=C2=A0=C2=A0 unsigned long end);
> > > +
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier,
> > > unsigned
> > > long start,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long end);
> > > +
> > > +void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range
> > > *range,
> > > +				=C2=A0=C2=A0 const struct
> > > mmu_notifier_range
> > > *mmu_range);
> > > +
> > > +void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > +			=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_struct
> > > *mm,
> > > +			=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_devmem_ops
> > > *ops,
> > > +			=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > > size);
> > > +
> > > +#ifdef CONFIG_LOCKDEP
> > > +/**
> > > + * drm_gpusvm_driver_set_lock() - Set the lock protecting
> > > accesses
> > > to GPU SVM
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + * @lock: the lock used to protect the gpuva list. The locking
> > > primitive
> > > + * must contain a dep_map field.
> > > + *
> > > + * Call this to annotate drm_gpusvm_range_find_or_insert and
> > > + * drm_gpusvm_range_remove.
> > > + */
> > > +#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
> > > +	do { \
> > > +		if (!WARN((gpusvm)->lock_dep_map, \
> > > +			=C2=A0 "GPUSVM range lock should be set only
> > > once."))\
> > > +			(gpusvm)->lock_dep_map =3D &(lock)-
> > > > dep_map;	\
> > > +	} while (0)
> > > +#define drm_gpusvm_driver_lock_held(gpusvm) \
> > > +	do { \
> > > +		if ((gpusvm)->lock_dep_map)	\
> > > +			lock_is_held((gpusvm)-
> > > >lock_dep_map);	\
> > > +	} while (0)
> >=20
> > Could we use static functions for those above
> >=20
>=20
> Static should work. Will change.
>=20
> > Also I don't think the drm_gpusvm_driver_lock_held() does what it's
> > intended to do? There's an assert missing.
> >=20
>=20
> 'lock_is_held' is an assert, right? I based this code existing code
> drm_gem_gpuva_assert_lock_held which uses 'lock_is_held'.

IIRC lock_is_held() is a bool function / macro. The drm_gpuvm version
is including an assert that your version is missing.

/Thomas

