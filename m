Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F236C8543DD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0CA10E4F1;
	Wed, 14 Feb 2024 08:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dkqoq/D/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B6D10E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898400; x=1739434400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rvns5rNiH1ThenXfY3DtxJX0hHKtbgUADPkv7qsIZkI=;
 b=Dkqoq/D/deCjggMNwtdvlvrBnEOVBnrUn05EGVeP5OutCIvI6OnbCci2
 q+oc9K/qZODYoPFgEVmrXT2WfMhKmIG0KXrVk63jSbkdOqBli8vIFXmpR
 5C8a+q1zag/9guwWqFhxjKpxNWDBnExdNTtHmCH9c5DEhB8irNZzYHMjZ
 U4zooLA31ewHH7Ygg0VgSevLNVzVXjAI5mzar3ngGDMnID+BSm+tYuFRr
 3xTCpSXekRNCQ774tyzli9mfLOirc7KjWgYxw/90tExsCIu+u4nriIEw/
 0NG4XPqJb5kuuopddom1+8pkyB8FgRKFOpJZ0IiA0x8AlezBpiqjzzgcz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651677"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651677"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407435"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:18 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 8/8] accel/ivpu: Rename VPU to NPU in message strings
Date: Wed, 14 Feb 2024 09:13:05 +0100
Message-ID: <20240214081305.290108-9-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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

VPU was renamed to NPU but due to large overhead of renaming
all the sources only user visible messages are being updated.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     |  8 ++++----
 drivers/accel/ivpu/ivpu_drv.h     |  2 +-
 drivers/accel/ivpu/ivpu_fw.c      |  2 +-
 drivers/accel/ivpu/ivpu_fw_log.c  |  6 +++---
 drivers/accel/ivpu/ivpu_hw_37xx.c |  6 +++---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 10 +++++-----
 drivers/accel/ivpu/ivpu_pm.c      | 10 +++++-----
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index a0461e3caeec..3f2439117582 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -45,11 +45,11 @@ MODULE_PARM_DESC(test_mode, "Test mode mask. See IVPU_TEST_MODE_* macros.");
 
 u8 ivpu_pll_min_ratio;
 module_param_named(pll_min_ratio, ivpu_pll_min_ratio, byte, 0644);
-MODULE_PARM_DESC(pll_min_ratio, "Minimum PLL ratio used to set VPU frequency");
+MODULE_PARM_DESC(pll_min_ratio, "Minimum PLL ratio used to set NPU frequency");
 
 u8 ivpu_pll_max_ratio = U8_MAX;
 module_param_named(pll_max_ratio, ivpu_pll_max_ratio, byte, 0644);
-MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set VPU frequency");
+MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
 
 bool ivpu_disable_mmu_cont_pages;
 module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0644);
@@ -328,13 +328,13 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 	ivpu_ipc_consumer_del(vdev, &cons);
 
 	if (!ret && ipc_hdr.data_addr != IVPU_IPC_BOOT_MSG_DATA_ADDR) {
-		ivpu_err(vdev, "Invalid VPU ready message: 0x%x\n",
+		ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n",
 			 ipc_hdr.data_addr);
 		return -EIO;
 	}
 
 	if (!ret)
-		ivpu_dbg(vdev, PM, "VPU ready message received successfully\n");
+		ivpu_dbg(vdev, PM, "NPU ready message received successfully\n");
 
 	return ret;
 }
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 03454f16a535..7be0500d9bb8 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -194,7 +194,7 @@ static inline int ivpu_hw_gen(struct ivpu_device *vdev)
 	case PCI_DEVICE_ID_LNL:
 		return IVPU_HW_40XX;
 	default:
-		ivpu_err(vdev, "Unknown VPU device\n");
+		ivpu_err(vdev, "Unknown NPU device\n");
 		return 0;
 	}
 }
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 21c4082ea68c..dfa91d48f901 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -46,7 +46,7 @@
 
 static char *ivpu_firmware;
 module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
-MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
+MODULE_PARM_DESC(firmware, "NPU firmware binary in /lib/firmware/..");
 
 static struct {
 	int gen;
diff --git a/drivers/accel/ivpu/ivpu_fw_log.c b/drivers/accel/ivpu/ivpu_fw_log.c
index f6770f5e82a2..ef0adb5e0fbe 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.c
+++ b/drivers/accel/ivpu/ivpu_fw_log.c
@@ -20,7 +20,7 @@
 unsigned int ivpu_log_level = IVPU_FW_LOG_ERROR;
 module_param(ivpu_log_level, uint, 0444);
 MODULE_PARM_DESC(ivpu_log_level,
-		 "VPU firmware default trace level: debug=" __stringify(IVPU_FW_LOG_DEBUG)
+		 "NPU firmware default trace level: debug=" __stringify(IVPU_FW_LOG_DEBUG)
 		 " info=" __stringify(IVPU_FW_LOG_INFO)
 		 " warn=" __stringify(IVPU_FW_LOG_WARN)
 		 " error=" __stringify(IVPU_FW_LOG_ERROR)
@@ -121,11 +121,11 @@ void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_
 	u32 next = 0;
 
 	while (fw_log_ptr(vdev, vdev->fw->mem_log_crit, &next, &log_header) == 0)
-		fw_log_print_buffer(vdev, log_header, "VPU critical", only_new_msgs, p);
+		fw_log_print_buffer(vdev, log_header, "NPU critical", only_new_msgs, p);
 
 	next = 0;
 	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
-		fw_log_print_buffer(vdev, log_header, "VPU verbose", only_new_msgs, p);
+		fw_log_print_buffer(vdev, log_header, "NPU verbose", only_new_msgs, p);
 }
 
 void ivpu_fw_log_clear(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 0e7cde1bb422..be91c6744b12 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -228,7 +228,7 @@ static int ivpu_pll_drive(struct ivpu_device *vdev, bool enable)
 
 		ret = ivpu_hw_37xx_wait_for_vpuip_bar(vdev);
 		if (ret) {
-			ivpu_err(vdev, "Timed out waiting for VPUIP bar\n");
+			ivpu_err(vdev, "Timed out waiting for NPU IP bar\n");
 			return ret;
 		}
 	}
@@ -742,10 +742,10 @@ static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
 	ivpu_hw_37xx_save_d0i3_entry_timestamp(vdev);
 
 	if (!ivpu_hw_37xx_is_idle(vdev))
-		ivpu_warn(vdev, "VPU not idle during power down\n");
+		ivpu_warn(vdev, "NPU not idle during power down\n");
 
 	if (ivpu_hw_37xx_reset(vdev)) {
-		ivpu_err(vdev, "Failed to reset VPU\n");
+		ivpu_err(vdev, "Failed to reset NPU\n");
 		ret = -EIO;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 704288084f37..d4663a42416b 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -80,11 +80,11 @@ static char *ivpu_platform_to_str(u32 platform)
 {
 	switch (platform) {
 	case IVPU_PLATFORM_SILICON:
-		return "IVPU_PLATFORM_SILICON";
+		return "SILICON";
 	case IVPU_PLATFORM_SIMICS:
-		return "IVPU_PLATFORM_SIMICS";
+		return "SIMICS";
 	case IVPU_PLATFORM_FPGA:
-		return "IVPU_PLATFORM_FPGA";
+		return "FPGA";
 	default:
 		return "Invalid platform";
 	}
@@ -773,7 +773,7 @@ static int ivpu_hw_40xx_reset(struct ivpu_device *vdev)
 	int ret = 0;
 
 	if (ivpu_hw_40xx_ip_reset(vdev)) {
-		ivpu_err(vdev, "Failed to reset VPU IP\n");
+		ivpu_err(vdev, "Failed to reset NPU IP\n");
 		ret = -EIO;
 	}
 
@@ -931,7 +931,7 @@ static int ivpu_hw_40xx_power_down(struct ivpu_device *vdev)
 	ivpu_hw_40xx_save_d0i3_entry_timestamp(vdev);
 
 	if (!ivpu_hw_40xx_is_idle(vdev) && ivpu_hw_40xx_ip_reset(vdev))
-		ivpu_warn(vdev, "Failed to reset the VPU\n");
+		ivpu_warn(vdev, "Failed to reset the NPU\n");
 
 	if (ivpu_pll_disable(vdev)) {
 		ivpu_err(vdev, "Failed to disable PLL\n");
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index f501f27ebafd..280fd3936f60 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -22,7 +22,7 @@
 
 static bool ivpu_disable_recovery;
 module_param_named_unsafe(disable_recovery, ivpu_disable_recovery, bool, 0644);
-MODULE_PARM_DESC(disable_recovery, "Disables recovery when VPU hang is detected");
+MODULE_PARM_DESC(disable_recovery, "Disables recovery when NPU hang is detected");
 
 static unsigned long ivpu_tdr_timeout_ms;
 module_param_named(tdr_timeout_ms, ivpu_tdr_timeout_ms, ulong, 0644);
@@ -112,11 +112,11 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
 	char *evt[2] = {"IVPU_PM_EVENT=IVPU_RECOVER", NULL};
 	int ret;
 
-	ivpu_err(vdev, "Recovering the VPU (reset #%d)\n", atomic_read(&vdev->pm->reset_counter));
+	ivpu_err(vdev, "Recovering the NPU (reset #%d)\n", atomic_read(&vdev->pm->reset_counter));
 
 	ret = pm_runtime_resume_and_get(vdev->drm.dev);
 	if (ret)
-		ivpu_err(vdev, "Failed to resume VPU: %d\n", ret);
+		ivpu_err(vdev, "Failed to resume NPU: %d\n", ret);
 
 	ivpu_fw_log_dump(vdev);
 
@@ -255,10 +255,10 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 
 	ret = ivpu_suspend(vdev);
 	if (ret)
-		ivpu_err(vdev, "Failed to set suspend VPU: %d\n", ret);
+		ivpu_err(vdev, "Failed to suspend NPU: %d\n", ret);
 
 	if (!hw_is_idle) {
-		ivpu_err(vdev, "VPU failed to enter idle, force suspended.\n");
+		ivpu_err(vdev, "NPU failed to enter idle, force suspended.\n");
 		ivpu_fw_log_dump(vdev);
 		ivpu_pm_prepare_cold_boot(vdev);
 	} else {
-- 
2.43.0

