Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED88A43447
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9510F10E53D;
	Tue, 25 Feb 2025 04:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Da8/A+Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F4410E54B;
 Tue, 25 Feb 2025 04:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458537; x=1771994537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sEFYYZFPWSv0M5bffEY6q5bDZ5mMdHFDyeGr0UeoetI=;
 b=Da8/A+HcP7zfk6tA7tx/pS6ie0b/iWQVnnitjh9EMHdpzBkkbyCG7YHM
 rrxON9or1H/p70tMsfdbdljFopCZ99YB2/t0RZTq4+SgY+TROJ85gStOs
 +XChz+0453CqNlxVQu4Dk5mOis9ZvE9k7da4gai0cD6aeay1REsTwheYH
 bO+v5R6dOe8VdA5xFzMCKatuu4/Z0WkHzVc6d9j1Vli93xCoGRlGmrVni
 hEoWC0mQ/ppUFOhOq0hvvow9nk19Gi8btM0YAfoX6X1wros3L4HEvQTJ0
 X/hJzSBO0++mwV4QDFdMj7kFrK32SD5x6ZZM7VS6AA+wYndBZKsAttDFi g==;
X-CSE-ConnectionGUID: q6w33kZvTliU4BY6gPubhw==
X-CSE-MsgGUID: VtQtfkKnSRS16tKwvt4XZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885098"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
X-CSE-ConnectionGUID: X+1qXagASz+8+U64PQTHWw==
X-CSE-MsgGUID: jtwhWM7XTWW6DrmOvAnUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290341"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Date: Mon, 24 Feb 2025 20:43:11 -0800
Message-Id: <20250225044311.3178695-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add documentation for agree upon GPU SVM design principles, current
status, and future plans.

v4:
 - Address Thomas's feedback
v5:
 - s/Current/Basline (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 Documentation/gpu/rfc/gpusvm.rst | 84 ++++++++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst  |  4 ++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst

diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
new file mode 100644
index 000000000000..063412160685
--- /dev/null
+++ b/Documentation/gpu/rfc/gpusvm.rst
@@ -0,0 +1,84 @@
+===============
+GPU SVM Section
+===============
+
+Agreed upon design principles
+=============================
+
+* migrate_to_ram path
+	* Rely only on core MM concepts (migration PTEs, page references, and
+	  page locking).
+	* No driver specific locks other than locks for hardware interaction in
+	  this path. These are not required and generally a bad idea to
+	  invent driver defined locks to seal core MM races.
+	* Partial migration is supported (i.e., a subset of pages attempting to
+	  migrate can actually migrate, with only the faulting page guaranteed
+	  to migrate).
+	* Driver handles mixed migrations via retry loops rather than locking.
+* Eviction
+	* Only looking at physical memory data structures and locks as opposed to
+	  looking at virtual memory data structures and locks.
+	* No looking at mm/vma structs or relying on those being locked.
+* GPU fault side
+	* mmap_read only used around core MM functions which require this lock
+	  and should strive to take mmap_read lock only in GPU SVM layer.
+	* Big retry loop to handle all races with the mmu notifier under the gpu
+	  pagetable locks/mmu notifier range lock/whatever we end up calling
+          those.
+	* Races (especially against concurrent eviction or migrate_to_ram)
+	  should not be handled on the fault side by trying to hold locks;
+	  rather, they should be handled using retry loops. One possible
+	  exception is holding a BO's dma-resv lock during the initial migration
+	  to VRAM, as this is a well-defined lock that can be taken underneath
+	  the mmap_read lock.
+* Physical memory to virtual backpointer
+	* Does not work, no pointers from physical memory to virtual should
+	  exist.
+	* Physical memory backpointer (page->zone_device_data) should be stable
+	  from allocation to page free.
+* GPU pagetable locking
+	* Notifier lock only protects range tree, pages valid state for a range
+	  (rather than seqno due to wider notifiers), pagetable entries, and
+	  mmu notifier seqno tracking, it is not a global lock to protect
+          against races.
+	* All races handled with big retry as mentioned above.
+
+Overview of current design
+==========================
+
+Baseline design is simple as possible to get a working basline in which can be
+built upon.
+
+.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
+   :doc: Overview
+   :doc: Locking
+   :doc: Migrataion
+   :doc: Partial Unmapping of Ranges
+   :doc: Examples
+
+Possible future design features
+===============================
+
+* Concurrent GPU faults
+	* CPU faults are concurrent so makes sense to have concurrent GPU
+	  faults.
+	* Should be possible with fined grained locking in the driver GPU
+	  fault handler.
+	* No expected GPU SVM changes required.
+* Ranges with mixed system and device pages
+	* Can be added if required to drm_gpusvm_get_pages fairly easily.
+* Multi-GPU support
+	* Work in progress and patches expected after initially landing on GPU
+	  SVM.
+	* Ideally can be done with little to no changes to GPU SVM.
+* Drop ranges in favor of radix tree
+	* May be desirable for faster notifiers.
+* Compound device pages
+	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
+	  migrate device layer are a performance bottleneck, having compound
+	  device pages should help increase performance by reducing the number
+	  of these expensive calls.
+* Higher order dma mapping for migration
+	* 4k dma mapping adversely affects migration performance on Intel
+	  hardware, higher order (2M) dma mapping should help here.
+* Build common userptr implementation on top of GPU SVM
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 476719771eef..396e535377fb 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -16,6 +16,10 @@ host such documentation:
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
 
+.. toctree::
+
+    gpusvm.rst
+
 .. toctree::
 
     i915_gem_lmem.rst
-- 
2.34.1

