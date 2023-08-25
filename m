Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F27887A8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8520610E672;
	Fri, 25 Aug 2023 12:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFC010E66B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967307; x=1724503307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEGVIwUkXTLPLnzdlLr+qvvsCi4QAcrExdkGWfJBxYk=;
 b=Xzu5adw790KslXcCGoHQX71XU9dCdZLwLIjO2wuMeOTpfpRRItyhnIpz
 P68yyTpm5nn4jEBlqX8d9OfrZfMyP4GyT+DN1PSIAtDryRUyi9emdG32O
 wEtO86LZnxYXCWQIUVfVmqf1i6aUZMXpckXkHzvNFS04gN7GfwiPyfuHh
 6SFk2DTzpGrOnrAgybKFAyn9DQWm29/BtTyjnRnjUfEjQhO8/dTdz0gEm
 f5WMkOkZVeT8WTfyUplFb0EeMkODqRe5qJco1F3k5wdXl/VbnX86fBIQI
 TvASeaDCULBLkZe3nJvrwSmmV7QWqKOV0ujEkB7cawnHknTNx50IKoS+h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373573888"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373573888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911272257"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911272257"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:45 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] accel/ivpu: Remove duplicated error messages
Date: Fri, 25 Aug 2023 14:41:28 +0200
Message-Id: <20230825124135.4086628-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
References: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reduce the number of error messages per single failure in
ivpu_dev_init(). Error messages are already printed by functions
called from ivpu_dev_init().

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c         | 54 +++++++--------------------
 drivers/accel/ivpu/ivpu_fw.c          |  2 +-
 drivers/accel/ivpu/ivpu_ipc.c         | 13 +++++--
 drivers/accel/ivpu/ivpu_mmu_context.c |  6 ++-
 drivers/accel/ivpu/ivpu_pm.c          |  4 +-
 drivers/accel/ivpu/ivpu_pm.h          |  2 +-
 6 files changed, 29 insertions(+), 52 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ba79f397c9e8..b10b2909f05f 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -518,78 +518,52 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
 
 	ret = ivpu_pci_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize PCI device: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	ret = ivpu_irq_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize IRQs: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	/* Init basic HW info based on buttress registers which are accessible before power up */
 	ret = ivpu_hw_info_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize HW info: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	/* Power up early so the rest of init code can access VPU registers */
 	ret = ivpu_hw_power_up(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to power up HW: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	ret = ivpu_mmu_global_context_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize global MMU context: %d\n", ret);
+	if (ret)
 		goto err_power_down;
-	}
 
 	ret = ivpu_mmu_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize MMU device: %d\n", ret);
+	if (ret)
 		goto err_mmu_gctx_fini;
-	}
 
 	ret = ivpu_fw_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize firmware: %d\n", ret);
+	if (ret)
 		goto err_mmu_gctx_fini;
-	}
 
 	ret = ivpu_ipc_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
+	if (ret)
 		goto err_fw_fini;
-	}
 
-	ret = ivpu_pm_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize PM: %d\n", ret);
-		goto err_ipc_fini;
-	}
+	ivpu_pm_init(vdev);
 
 	ret = ivpu_job_done_thread_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize job done thread: %d\n", ret);
+	if (ret)
 		goto err_ipc_fini;
-	}
 
 	ret = ivpu_fw_load(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
+	if (ret)
 		goto err_job_done_thread_fini;
-	}
 
 	ret = ivpu_boot(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to boot: %d\n", ret);
+	if (ret)
 		goto err_job_done_thread_fini;
-	}
 
 	ivpu_pm_enable(vdev);
 
@@ -651,10 +625,8 @@ static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_set_drvdata(pdev, vdev);
 
 	ret = ivpu_dev_init(vdev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize VPU device: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = drm_dev_register(&vdev->drm, 0);
 	if (ret) {
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 9827ea4d7b83..9b6ecd3e9537 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -78,7 +78,7 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
 		}
 	}
 
-	ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
+	ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index fa0af59e39ab..6b2e9dbb284a 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -426,15 +426,20 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 int ivpu_ipc_init(struct ivpu_device *vdev)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
-	int ret = -ENOMEM;
+	int ret;
 
 	ipc->mem_tx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
-	if (!ipc->mem_tx)
-		return ret;
+	if (!ipc->mem_tx) {
+		ivpu_err(vdev, "Failed to allocate mem_tx\n");
+		return -ENOMEM;
+	}
 
 	ipc->mem_rx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
-	if (!ipc->mem_rx)
+	if (!ipc->mem_rx) {
+		ivpu_err(vdev, "Failed to allocate mem_rx\n");
+		ret = -ENOMEM;
 		goto err_free_tx;
+	}
 
 	ipc->mm_tx = devm_gen_pool_create(vdev->drm.dev, __ffs(IVPU_IPC_ALIGNMENT),
 					  -1, "TX_IPC_JSM");
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 1d2e554e2c4a..1144d6eb5120 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -427,8 +427,10 @@ ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u3
 	INIT_LIST_HEAD(&ctx->bo_list);
 
 	ret = ivpu_mmu_pgtable_init(vdev, &ctx->pgtable);
-	if (ret)
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize pgtable for ctx %u: %d\n", context_id, ret);
 		return ret;
+	}
 
 	if (!context_id) {
 		start = vdev->hw->ranges.global.start;
@@ -488,7 +490,7 @@ int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context
 
 	ret = ivpu_mmu_context_init(vdev, ctx, ctx_id);
 	if (ret) {
-		ivpu_err(vdev, "Failed to initialize context: %d\n", ret);
+		ivpu_err(vdev, "Failed to initialize context %u: %d\n", ctx_id, ret);
 		return ret;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index b3a422305141..54c59f9cbae7 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -282,7 +282,7 @@ void ivpu_pm_reset_done_cb(struct pci_dev *pdev)
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
-int ivpu_pm_init(struct ivpu_device *vdev)
+void ivpu_pm_init(struct ivpu_device *vdev)
 {
 	struct device *dev = vdev->drm.dev;
 	struct ivpu_pm_info *pm = vdev->pm;
@@ -301,8 +301,6 @@ int ivpu_pm_init(struct ivpu_device *vdev)
 		pm_runtime_set_autosuspend_delay(dev, vdev->timeout.autosuspend);
 
 	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
-
-	return 0;
 }
 
 void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index fd4eada1290f..f41c30a14a40 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -19,7 +19,7 @@ struct ivpu_pm_info {
 	u32 suspend_reschedule_counter;
 };
 
-int ivpu_pm_init(struct ivpu_device *vdev);
+void ivpu_pm_init(struct ivpu_device *vdev);
 void ivpu_pm_enable(struct ivpu_device *vdev);
 void ivpu_pm_disable(struct ivpu_device *vdev);
 void ivpu_pm_cancel_recovery(struct ivpu_device *vdev);
-- 
2.25.1

