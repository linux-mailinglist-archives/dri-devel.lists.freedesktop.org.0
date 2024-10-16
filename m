Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161299FF77
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF7710E680;
	Wed, 16 Oct 2024 03:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEcintfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1429410E661;
 Wed, 16 Oct 2024 03:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUN4jq1o+rYB1ezfVgEu1kXGEgKTqubBrkkHBcJyFu4=;
 b=LEcintfRxyxDiUqcNXLJPXkcOQi8gxSMCXAJ/0fTzphDPVbcnEPRl3kL
 NTSt8dsCvxQpaleVZo44KN1RAkglODE37j7XiuWZHDgnLoPJmc1QpFNNP
 76knvzpalWjgwqEN/0EbtpMOb1XxTBM776G193ow7JJlbf09cstmbZwtB
 JcR4C/LVrrUzIepAKbmWKC7DMYp8mi0wBvoRsEYomoWI567r/jTXrTZg+
 feKnrKxKcHGVXczfGKua0DJ/NFEqbTGVleWaCO5UpxBBTBm3ZmJYOe2x3
 imqX8pQObGirCAlBH6HE++856vztZ+x3nsrG5HUkEt08KmQbefWqX9Wvl w==;
X-CSE-ConnectionGUID: sj0QVJPWQ8S6SGa1akVmrQ==
X-CSE-MsgGUID: 6v84oK3HT6Km/ZjepOwnfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056497"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: +a5dXW9eTb+VRRfQFvcqJA==
X-CSE-MsgGUID: aEE0CD9RTs2Tg1vKO7mTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930281"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 29/29] drm/doc: gpusvm: Add GPU SVM documentation
Date: Tue, 15 Oct 2024 20:25:18 -0700
Message-Id: <20241016032518.539495-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/rfc/gpusvm.rst | 70 ++++++++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst  |  4 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst

diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
new file mode 100644
index 000000000000..2d3f79a6c30a
--- /dev/null
+++ b/Documentation/gpu/rfc/gpusvm.rst
@@ -0,0 +1,70 @@
+===============
+GPU SVM Section
+===============
+
+Agreed upon design principles
+=============================
+
+* migrate_to_ram path
+	* Rely on core MM concepts (migration ptes, page refs, and page locking)
+	  only
+	* No driver specific locks other than locks for hardware interaction in
+	  this path
+	* Partial migration is supported
+	* Driver handles mixed migrations via retry loops rather than locking
+* Eviction
+	* Only looking at physical memory datastructures and locks
+	* No looking at mm/vma structs or relying on those being locked
+* GPU fault side
+	* mmap_read only used around core MM functions which require this lock
+	* Big retry loop to handle all races with the mmu notifier under the gpu
+	  pagetable locks/mmu notifier range lock/whatever we end up calling
+          those
+	* Races (especially against concurrent eviction/migrate_to_ram) should
+	  not be handled on the fault side by trying to hold locks
+* Physical memory to virtual backpointer
+	* Does not work, no pointers from physical memory to virtual should
+	  exist
+* GPU pagetable locking
+	* Notifier lock only protects range tree, pages, pagetable entries, and
+	  mmu notifier seqno tracking, it is not a global lock to protect
+          against races
+	* All races handled with big retry as mentioned above
+
+Overview of current design
+==========================
+
+Current design is simple as possible to get a working basline in which can built
+upon.
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
+	* CPU faults are concurrent so makes sense to have concurrent GPU faults
+	* Should be possible with fined grained locking in the driver GPU
+	  fault handler
+	* No expected GPU SVM changes required
+* Ranges with mixed system and device pages
+	* Can be added if required to drm_gpusvm_get_pages fairly easily
+* Multi-GPU support
+	* Work in progress and patches expected after initially landing on GPU
+	  SVM
+	* Ideally can be done with little to no changes to GPU SVM
+* Drop ranges in favor of radix tree
+	* May be desirable for faster notifiers
+* Compound device pages
+	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
+	  migrate device layer are a performance bottleneck, having compound
+	  device pages should help increase performance by reducing the number
+	  of these expensive calls
+* Higher order dma mapping for migration
+	* 4k dma mapping adversely affects migration performance on Intel
+	  hardware, higher order (2M) dma mapping should help here
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

