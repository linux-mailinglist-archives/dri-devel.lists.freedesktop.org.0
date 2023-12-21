Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100AB81ADF0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C198310E656;
	Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B385110E646;
 Thu, 21 Dec 2023 04:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132901; x=1734668901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IgTg5rpRtePLupWg3aD5I7Gh2zRaE7GKcIVij7uNhNM=;
 b=iJJRmQ+grismCWu3m4V90GuY5CmNHN4eowfWIHaAF+AVpbL8wzOik/vH
 p9nSHW0vDLf+9iGXKe26O4OvFzmiRS2nSiSeR6dQu3W3chUa1JKHe5uIR
 U8aLzXCkmgFTMbcmkkRxQglbujE+ujotvpgdiCnJtpf9wua9F/8KQEKHX
 AKCWr82AfaKS4mZuzoW48TYO1LcIuOEjMgUsgIOhyoBrdH1UAnjFY7ScF
 t1kvuy344bdVHR4hJgLPdLH9GXpbUR8YTxqIk9PoM5Gjum339sAlHVjQs
 UfbNXRHVjO6Dr6NZgTEifjmswxM3ub86tlV1o5jewPBpqNdyweNMvf5cy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069760"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481340"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481340"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 01/22] drm/xe/svm: Add SVM document
Date: Wed, 20 Dec 2023 23:37:51 -0500
Message-Id: <20231221043812.3783313-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add shared virtual memory document.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 Documentation/gpu/xe/index.rst  |   1 +
 Documentation/gpu/xe/xe_svm.rst |   8 +++
 drivers/gpu/drm/xe/xe_svm_doc.h | 121 ++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_svm.rst
 create mode 100644 drivers/gpu/drm/xe/xe_svm_doc.h

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index c224ecaee81e..106b60aba1f0 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -23,3 +23,4 @@ DG2, etc is provided to prototype the driver.
    xe_firmware
    xe_tile
    xe_debugging
+   xe_svm
diff --git a/Documentation/gpu/xe/xe_svm.rst b/Documentation/gpu/xe/xe_svm.rst
new file mode 100644
index 000000000000..62954ba1c6f8
--- /dev/null
+++ b/Documentation/gpu/xe/xe_svm.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=============
+Shared virtual memory
+=============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_svm_doc.h
+   :doc: Shared virtual memory
diff --git a/drivers/gpu/drm/xe/xe_svm_doc.h b/drivers/gpu/drm/xe/xe_svm_doc.h
new file mode 100644
index 000000000000..de38ee3585e4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm_doc.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_SVM_DOC_H_
+#define _XE_SVM_DOC_H_
+
+/**
+ * DOC: Shared virtual memory
+ *
+ * Shared Virtual Memory (SVM) allows the programmer to use a single virtual
+ * address space shared between threads executing on CPUs and GPUs. It abstracts
+ * away from the user the location of the backing memory, and hence simplifies
+ * the user programming model. In a non-SVM memory model, user need to explicitly
+ * decide memory placement such as device or system memory, also user need to
+ * explicitly migrate memory b/t device and system memory.
+ *
+ * Interface
+ * =========
+ *
+ * SVM makes use of default OS memory allocation and mapping interface such as
+ * malloc() and mmap(). The pointer returned from malloc() and mmap() can be
+ * directly used on both CPU and GPU program.
+ *
+ * SVM also provides API to set virtual address range based memory attributes
+ * such as preferred memory location, memory migration granularity, and memory
+ * atomic attributes etc. This is similar to Linux madvise API.
+ *
+ * Basic implementation
+ * ==============
+ *
+ * XeKMD implementation is based on Linux kernel Heterogeneous Memory Management
+ * (HMM) framework. HMM’s address space mirroring support allows sharing of the
+ * address space by duplicating sections of CPU page tables in the device page
+ * tables. This enables both CPU and GPU access a physical memory location using
+ * the same virtual address.
+ *
+ * Linux kernel also provides the ability to plugin device memory to the system
+ * (as a special ZONE_DEVICE type) and allocates struct page for each device memory
+ * page.
+ *
+ * HMM also provides a mechanism to migrate pages from host to device memory and
+ * vice versa.
+ *
+ * More information on HMM can be found here.
+ * https://www.kernel.org/doc/Documentation/vm/hmm.rst
+ *
+ * Unlike the non-SVM memory allocator (such as gem_create, vm_bind etc), there
+ * is no buffer object (BO, such as struct ttm_buffer_object, struct drm_gem_object),
+ * in our SVM implementation. We delibrately choose this implementation option
+ * to achieve page granularity memory placement, validation, eviction and migration.
+ *
+ * The SVM layer directly allocate device memory from drm buddy subsystem. The
+ * memory is organized as many blocks each of which has 2^n pages. SVM subsystem
+ * then mark the usage of each page using a simple bitmap. When all pages in a
+ * block are not used anymore, SVM return this block back to drm buddy subsystem.
+ *
+ * There are 3 events which can trigger SVM subsystem in actions:
+ *
+ * 1. A mmu notifier callback
+ *
+ * Since SVM need to mirror the program's CPU virtual address space from GPU side,
+ * when program's CPU address space changes, SVM need to make an identical change
+ * from GPU side. SVM/hmm use mmu interval notifier to achieve this. SVM register
+ * a mmu interval notifier call back function to core mm, and whenever a CPU side
+ * virtual address space is changed (i.e., when a virtual address range is unmapped
+ * from CPU calling munmap), the registered callback function will be called from
+ * core mm. SVM then mirror the CPU address space change from GPU side, i.e., unmap
+ * or invalidate the virtual address range from GPU page table.
+ *
+ * 2. A GPU page fault
+ *
+ * At the very beginning of a process's life, no virtual address of the process
+ * is mapped on GPU page table. So when GPU access any virtual address of the process
+ * a GPU page fault is triggered. SVM then decide the best memory location of the
+ * fault address (mainly from performance consideration. Some times also consider
+ * correctness requirement such as whether GPU can perform atomics operation to
+ * certain memory location), migrate memory if necessary, and map the fault address
+ * to GPU page table.
+ *
+ * 3. A CPU page fault
+ *
+ * A CPU page fault is usually managed by Linux core mm. But in a CPU and GPU
+ * mix programming environment, the backing store of a virtual address range
+ * can be in GPU's local memory which is not visible to CPU (DEVICE_PRIVATE),
+ * so CPU page fault handler need to migrate such pages to system memory for
+ * CPU to be able to access them. Such memory migration is device specific.
+ * HMM has a callback function (migrate_to_ram function of the dev_pagemap_ops)
+ * for device driver to implement.
+ *
+ *
+ * Memory hints: TBD
+ * =================
+ *
+ * Memory eviction: TBD
+ * ===============
+ *
+ * Lock design
+ * ===========
+ *
+ * https://www.kernel.org/doc/Documentation/vm/hmm.rst section "Address space mirroring
+ * implemenation and API" described the locking scheme that driver writer has to
+ * respect. There are 3 lock mechanism involved in this scheme:
+ *
+ * 1. Use mmp_read/write_lock to protect VMA, cpu page table operations.  Operation such
+ * as munmap/mmap, page table update during numa balance must hold this lock. Hmm_range_fault
+ * is a helper function provided by HMM to populate the CPU page table, so it must be called
+ * with this lock
+ *
+ * 2. Use xe_svm::mutex to protect device side page table operation. Any attempt to bind an
+ * address range to GPU, or invalidate an address range from GPU, should hold this device lock
+ *
+ * 3. In the GPU page fault handler, during device page table update, we hold a xe_svm::mutex,
+ * but we don't hold the mmap_read/write_lock. So programm's address space can change during
+ * the GPU page table update. mmu notifier seq# is used to determine whether unmap happened
+ * during during device page table update, if yes, then retry.
+ *
+ */
+
+#endif
-- 
2.26.3

