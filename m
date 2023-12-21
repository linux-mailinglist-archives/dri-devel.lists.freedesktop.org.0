Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CE81AE00
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3610E673;
	Thu, 21 Dec 2023 04:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E6810E65E;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAifNztFGJdHbvn7TBEiRLW9QX1gnP6AASCF9p0qNJc=;
 b=PZ+EeN4Wafeq/LNKrq2cFodB+ZWIBzEZ9YLI7SLVmKxMaey6LmSL8JI0
 CqzWejMMylM9u71g+KrAWBMdmWVrJzjHsm1eL6ymgSLgqYq1Rf68eOQo1
 GVSiNtvHEXQLjOCFeGOUf2T9tj2hNYwdoRCjMGQlSxNQtSlK2VlQZZvMd
 CmaT+p3U/93hGHJXqVhzn9e0l7b+NU/gQUIDYFwQg+WBoSnbWBsLpxLo2
 rOm2HNWtC/ke7+PxIZkO0878nqyjkTDiH7ZRGb1etnuQpNqn7/U+KP/ZA
 5iuQVGn+OkWDG5bshbBi+hG+icRxiIj/vd86Psd3JgMyQAlujGTE5dySz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069782"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069782"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481402"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481402"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 22/22] drm/xe/svm: Add DRM_XE_SVM kernel config entry
Date: Wed, 20 Dec 2023 23:38:12 -0500
Message-Id: <20231221043812.3783313-23-oak.zeng@intel.com>
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

DRM_XE_SVM kernel config entry is added so
xe svm feature can be configured before kernel
compilation.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/Kconfig   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/Makefile  |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c |  5 +++++
 drivers/gpu/drm/xe/xe_vm.c   |  2 ++
 4 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 5b3da06e7ba3..a57f0972e9ae 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -83,6 +83,28 @@ config DRM_XE_FORCE_PROBE
 
 	  Use "!*" to block the probe of the driver for all known devices.
 
+config DRM_XE_SVM
+    bool "Enable Shared Virtual Memory support in xe"
+    depends on DRM_XE
+    depends on ARCH_ENABLE_MEMORY_HOTPLUG
+    depends on ARCH_ENABLE_MEMORY_HOTREMOVE
+    depends on MEMORY_HOTPLUG
+    depends on MEMORY_HOTREMOVE
+    depends on ARCH_HAS_PTE_DEVMAP
+    depends on SPARSEMEM_VMEMMAP
+    depends on ZONE_DEVICE
+    depends on DEVICE_PRIVATE
+    depends on MMU
+    select HMM_MIRROR
+    select MMU_NOTIFIER
+    default y
+    help
+      Choose this option if you want Shared Virtual Memory (SVM)
+      support in xe. With SVM, virtual address space is shared
+	  between CPU and GPU. This means any virtual address such
+	  as malloc or mmap returns, variables on stack, or global
+	  memory pointers, can be used for GPU transparently.
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index df8601d6a59f..b75bdbc5e42c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -282,6 +282,11 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/skl_universal_plane.o \
 	i915-display/skl_watermark.o
 
+xe-$(CONFIG_DRM_XE_SVM) += xe_svm.o \
+						   xe_svm_devmem.o \
+						   xe_svm_range.o \
+						   xe_svm_migrate.o
+
 ifeq ($(CONFIG_ACPI),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_acpi.o \
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index cfe25a3c7059..7c95f675ed92 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -286,7 +286,9 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
+#if IS_ENABLED(CONFIG_DRM_XE_SVM)
 		xe_svm_devm_add(tile, &tile->mem.vram);
+#endif
 	}
 
 	xe->mem.vram.actual_physical_size = total_size;
@@ -361,8 +363,11 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	if (xe->mem.vram.mapping)
 		iounmap(xe->mem.vram.mapping);
+
+#if IS_ENABLED(CONFIG_DRM_XE_SVM)
 	for_each_tile(tile, xe, id) {
 		xe_svm_devm_remove(xe, &tile->mem.vram);
+#endif
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3c301a5c7325..12d82f2fc195 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1376,7 +1376,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe->usm.num_vm_in_non_fault_mode++;
 	mutex_unlock(&xe->usm.lock);
 
+#if IS_ENABLED(CONFIG_DRM_XE_SVM)
 	vm->svm = xe_create_svm(vm);
+#endif
 	trace_xe_vm_create(vm);
 
 	return vm;
-- 
2.26.3

