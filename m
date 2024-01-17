Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D1C830F05
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA32610E8BD;
	Wed, 17 Jan 2024 22:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2761B10E898;
 Wed, 17 Jan 2024 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528907; x=1737064907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MY8pJHnVMgBM7aazDRdEB2C96Ve/RDJicoR6dcBJDcA=;
 b=KRc22RFWV23GNUr4uacRs3VGDGZt71Mw9jWJnTEHkgBogfsLPlaB4Bey
 +wIBBQKisRWV/YOSDhVBd3fh4jD9FpgXHUVlWNYxDh1EA8OlMveuxVPP1
 ScxcNUdYB+D6PKO/4uXUdN4rrS1NoSTnkhnQEaU0O7YKEHYwnrqUQjNTW
 tAg/pAW1rNAGbHVn9pls03UyL4hhwOX4MqwNlZ3et/QeCTTuK+G5kC12G
 vTdPlIo5LW9ZGzWQUdjeGMMPaptB7xEPw9XP1ZHIbQc/3n0WprbYuarPJ
 c5RvbugUkMP+evM1gx6oofEn56mE/yT1EUFe+O1FuPbS5QiS1wEOWLukS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657635"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657635"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089282"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089282"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 22/23] drm/xe/svm: Add DRM_XE_SVM kernel config entry
Date: Wed, 17 Jan 2024 17:12:22 -0500
Message-Id: <20240117221223.18540-23-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
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
index 1b57ae38210d..6f498095a915 100644
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
index e16b84f79ddf..ae503f7c1f94 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -283,6 +283,11 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
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
index 3d34dcfa3b3a..99810794bd94 100644
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
index 712fe49d8fb2..3bf19c92e01f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1377,7 +1377,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe->usm.num_vm_in_non_fault_mode++;
 	mutex_unlock(&xe->usm.lock);
 
+#if IS_ENABLED(CONFIG_DRM_XE_SVM)
 	vm->svm = xe_create_svm(vm);
+#endif
 	trace_xe_vm_create(vm);
 
 	return vm;
-- 
2.26.3

