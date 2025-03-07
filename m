Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E5A56C50
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 16:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D647F10EBDA;
	Fri,  7 Mar 2025 15:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDWIrHri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F93810E0F0;
 Fri,  7 Mar 2025 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741362044; x=1772898044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GXDcZvki36ESnPVxTVGxacMvaqhNKKe7sqrnT9FJhVQ=;
 b=QDWIrHriYI2HyPfqxKV+HnGb0blNl4QJVUHi3kORNvVCz+Meq/SQCJ1T
 TaMNjLbl/XlEz+UwJ4MZMUMFmqiq7DtkHhGp1y47SX20eJasPSk+SToZo
 QvZnvef/3pi+2okZaG6obiExNToyp7tD9YEUbELYwoxGuaaPuj/djG1Mu
 ESQKUu0CDXj7v4flg3Vw3q4beFa+6b5ib4bK/cnPwCJgsMtJh54GAoauf
 wiC3j9oGCN61ZnUXBQl3i5k6oztf6z6WrXF49yVfL3qjm9E/vEilM6maw
 TOP1/PK01U1wMaPbh2+mRg5IQUNd1CzM3w4uwz8P3T4CZwbwHQc5rIBOW g==;
X-CSE-ConnectionGUID: zENbUDURTtafapBainrcxg==
X-CSE-MsgGUID: WQdLIRG0ST6vqIQIXSrTPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42121672"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42121672"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:40:44 -0800
X-CSE-ConnectionGUID: ebhlliuOTkqz7CviCeObZQ==
X-CSE-MsgGUID: NMIcPpeqSK24fJ5uTlkKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124443218"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:40:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/gpusvm: Fix kernel-doc
Date: Fri,  7 Mar 2025 07:40:28 -0800
Message-ID: <20250307-fix-svm-kerneldoc-v1-1-c786f73ae910@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Change-ID: 20250307-fix-svm-kerneldoc-8a4051e25d44
Content-Transfer-Encoding: 8bit
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

Due to wrong `.. kernel-doc` directive in Documentation/gpu/rfc/gpusvm.rst
the documentation was actually not parsing anything from
drivers/gpu/drm/drm_gpusvm.c. This fixes the kernel-doc include and all
warnings/errors created when doing so.

Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/intel-xe/20250307195239.57abcd2d@canb.auug.org.au/
Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/rfc/gpusvm.rst |  15 +++--
 drivers/gpu/drm/drm_gpusvm.c     | 138 +++++++++++++++++++++------------------
 2 files changed, 86 insertions(+), 67 deletions(-)

diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
index 073e46065d9c6ce7de48aadd7d1cc5e57c0a9e21..bcf66a8137a64404cd559d0cf6cd6cb4548e2098 100644
--- a/Documentation/gpu/rfc/gpusvm.rst
+++ b/Documentation/gpu/rfc/gpusvm.rst
@@ -67,14 +67,19 @@ Agreed upon design principles
 Overview of baseline design
 ===========================
 
-Baseline design is simple as possible to get a working basline in which can be
-built upon.
-
-.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
    :doc: Overview
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
    :doc: Locking
-   :doc: Migrataion
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
+   :doc: Migration
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
    :doc: Partial Unmapping of Ranges
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
    :doc: Examples
 
 Possible future design features
diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index f314f5c4af0f309e899bedace52c3eb9ad82e0ac..d7ec12483554791b513a1587b87071759cb53943 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -23,54 +23,63 @@
  * DOC: Overview
  *
  * GPU Shared Virtual Memory (GPU SVM) layer for the Direct Rendering Manager (DRM)
- *
- * The GPU SVM layer is a component of the DRM framework designed to manage shared
- * virtual memory between the CPU and GPU. It enables efficient data exchange and
- * processing for GPU-accelerated applications by allowing memory sharing and
+ * is a component of the DRM framework designed to manage shared virtual memory
+ * between the CPU and GPU. It enables efficient data exchange and processing
+ * for GPU-accelerated applications by allowing memory sharing and
  * synchronization between the CPU's and GPU's virtual address spaces.
  *
  * Key GPU SVM Components:
- * - Notifiers: Notifiers: Used for tracking memory intervals and notifying the
- *		GPU of changes, notifiers are sized based on a GPU SVM
- *		initialization parameter, with a recommendation of 512M or
- *		larger. They maintain a Red-BlacK tree and a list of ranges that
- *		fall within the notifier interval. Notifiers are tracked within
- *		a GPU SVM Red-BlacK tree and list and are dynamically inserted
- *		or removed as ranges within the interval are created or
- *		destroyed.
- * - Ranges: Represent memory ranges mapped in a DRM device and managed
- *	     by GPU SVM. They are sized based on an array of chunk sizes, which
- *	     is a GPU SVM initialization parameter, and the CPU address space.
- *	     Upon GPU fault, the largest aligned chunk that fits within the
- *	     faulting CPU address space is chosen for the range size. Ranges are
- *	     expected to be dynamically allocated on GPU fault and removed on an
- *	     MMU notifier UNMAP event. As mentioned above, ranges are tracked in
- *	     a notifier's Red-Black tree.
- * - Operations: Define the interface for driver-specific GPU SVM operations
- *               such as range allocation, notifier allocation, and
- *               invalidations.
- * - Device Memory Allocations: Embedded structure containing enough information
- *                              for GPU SVM to migrate to / from device memory.
- * - Device Memory Operations: Define the interface for driver-specific device
- *                             memory operations release memory, populate pfns,
- *                             and copy to / from device memory.
- *
- * This layer provides interfaces for allocating, mapping, migrating, and
- * releasing memory ranges between the CPU and GPU. It handles all core memory
- * management interactions (DMA mapping, HMM, and migration) and provides
- * driver-specific virtual functions (vfuncs). This infrastructure is sufficient
- * to build the expected driver components for an SVM implementation as detailed
- * below.
+ *
+ * - Notifiers:
+ *	Used for tracking memory intervals and notifying the GPU of changes,
+ *	notifiers are sized based on a GPU SVM initialization parameter, with a
+ *	recommendation of 512M or larger. They maintain a Red-BlacK tree and a
+ *	list of ranges that fall within the notifier interval.  Notifiers are
+ *	tracked within a GPU SVM Red-BlacK tree and list and are dynamically
+ *	inserted or removed as ranges within the interval are created or
+ *	destroyed.
+ * - Ranges:
+ *	Represent memory ranges mapped in a DRM device and managed by GPU SVM.
+ *	They are sized based on an array of chunk sizes, which is a GPU SVM
+ *	initialization parameter, and the CPU address space.  Upon GPU fault,
+ *	the largest aligned chunk that fits within the faulting CPU address
+ *	space is chosen for the range size. Ranges are expected to be
+ *	dynamically allocated on GPU fault and removed on an MMU notifier UNMAP
+ *	event. As mentioned above, ranges are tracked in a notifier's Red-Black
+ *	tree.
+ *
+ * - Operations:
+ *	Define the interface for driver-specific GPU SVM operations such as
+ *	range allocation, notifier allocation, and invalidations.
+ *
+ * - Device Memory Allocations:
+ *	Embedded structure containing enough information for GPU SVM to migrate
+ *	to / from device memory.
+ *
+ * - Device Memory Operations:
+ *	Define the interface for driver-specific device memory operations
+ *	release memory, populate pfns, and copy to / from device memory.
+ *
+ *	This layer provides interfaces for allocating, mapping, migrating, and
+ *	releasing memory ranges between the CPU and GPU. It handles all core
+ *	memory management interactions (DMA mapping, HMM, and migration) and
+ *	provides driver-specific virtual functions (vfuncs). This infrastructure
+ *	is sufficient to build the expected driver components for an SVM
+ *	implementation as detailed below.
  *
  * Expected Driver Components:
- * - GPU page fault handler: Used to create ranges and notifiers based on the
- *			     fault address, optionally migrate the range to
- *			     device memory, and create GPU bindings.
- * - Garbage collector: Used to unmap and destroy GPU bindings for ranges.
- *			Ranges are expected to be added to the garbage collector
- *			upon a MMU_NOTIFY_UNMAP event in notifier callback.
- * - Notifier callback: Used to invalidate and DMA unmap GPU bindings for
- *			ranges.
+ *
+ * - GPU page fault handler:
+ *	Used to create ranges and notifiers based on the fault address,
+ *	optionally migrate the range to device memory, and create GPU bindings.
+ *
+ * - Garbage collector:
+ *	Used to unmap and destroy GPU bindings for ranges.  Ranges are expected
+ *	to be added to the garbage collector upon a MMU_NOTIFY_UNMAP event in
+ *	notifier callback.
+ *
+ * - Notifier callback:
+ *	Used to invalidate and DMA unmap GPU bindings for ranges.
  */
 
 /**
@@ -83,9 +92,9 @@
  * range RB tree and list, as well as the range's DMA mappings and sequence
  * number. GPU SVM manages all necessary locking and unlocking operations,
  * except for the recheck range's pages being valid
- * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings. This
- * lock corresponds to the 'driver->update' lock mentioned in the HMM
- * documentation (TODO: Link). Future revisions may transition from a GPU SVM
+ * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings.
+ * This lock corresponds to the ``driver->update`` lock mentioned in
+ * Documentation/mm/hmm.rst. Future revisions may transition from a GPU SVM
  * global lock to a per-notifier lock if finer-grained locking is deemed
  * necessary.
  *
@@ -102,11 +111,11 @@
  * DOC: Migration
  *
  * The migration support is quite simple, allowing migration between RAM and
- * device memory at the range granularity. For example, GPU SVM currently does not
- * support mixing RAM and device memory pages within a range. This means that upon GPU
- * fault, the entire range can be migrated to device memory, and upon CPU fault, the
- * entire range is migrated to RAM. Mixed RAM and device memory storage within a range
- * could be added in the future if required.
+ * device memory at the range granularity. For example, GPU SVM currently does
+ * not support mixing RAM and device memory pages within a range. This means
+ * that upon GPU fault, the entire range can be migrated to device memory, and
+ * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
+ * memory storage within a range could be added in the future if required.
  *
  * The reasoning for only supporting range granularity is as follows: it
  * simplifies the implementation, and range sizes are driver-defined and should
@@ -119,11 +128,11 @@
  * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped by CPU resulting
  * in MMU_NOTIFY_UNMAP event) presents several challenges, with the main one
  * being that a subset of the range still has CPU and GPU mappings. If the
- * backing store for the range is in device memory, a subset of the backing store has
- * references. One option would be to split the range and device memory backing store,
- * but the implementation for this would be quite complicated. Given that
- * partial unmappings are rare and driver-defined range sizes are relatively
- * small, GPU SVM does not support splitting of ranges.
+ * backing store for the range is in device memory, a subset of the backing
+ * store has references. One option would be to split the range and device
+ * memory backing store, but the implementation for this would be quite
+ * complicated. Given that partial unmappings are rare and driver-defined range
+ * sizes are relatively small, GPU SVM does not support splitting of ranges.
  *
  * With no support for range splitting, upon partial unmapping of a range, the
  * driver is expected to invalidate and destroy the entire range. If the range
@@ -144,6 +153,8 @@
  *
  * 1) GPU page fault handler
  *
+ * .. code-block:: c
+ *
  *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct drm_gpusvm_range *range)
  *	{
  *		int err = 0;
@@ -208,7 +219,9 @@
  *		return err;
  *	}
  *
- * 2) Garbage Collector.
+ * 2) Garbage Collector
+ *
+ * .. code-block:: c
  *
  *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
  *					struct drm_gpusvm_range *range)
@@ -231,7 +244,9 @@
  *			__driver_garbage_collector(gpusvm, range);
  *	}
  *
- * 3) Notifier callback.
+ * 3) Notifier callback
+ *
+ * .. code-block:: c
  *
  *	void driver_invalidation(struct drm_gpusvm *gpusvm,
  *				 struct drm_gpusvm_notifier *notifier,
@@ -499,7 +514,7 @@ drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
 	return true;
 }
 
-/**
+/*
  * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
  */
 static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
@@ -2055,7 +2070,6 @@ static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
 
 /**
  * drm_gpusvm_range_evict - Evict GPU SVM range
- * @pagemap: Pointer to the GPU SVM structure
  * @range: Pointer to the GPU SVM range to be removed
  *
  * This function evicts the specified GPU SVM range. This function will not
@@ -2146,8 +2160,8 @@ static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
 	return err ? VM_FAULT_SIGBUS : 0;
 }
 
-/**
- * drm_gpusvm_pagemap_ops() - Device page map operations for GPU SVM
+/*
+ * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
  */
 static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
 	.page_free = drm_gpusvm_page_free,

---
base-commit: 2c4fba1d065427efba4aaed5f80f4664c9f4a729
change-id: 20250307-fix-svm-kerneldoc-8a4051e25d44

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
