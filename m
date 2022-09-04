Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377C5ACA9C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECF010E18B;
	Mon,  5 Sep 2022 06:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A82610E074;
 Sun,  4 Sep 2022 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=oec+S
 Ar3/a821J/02ocnsMHj9THCQ/CcC3l6okIm00E=; b=JzCtvo2Cqo9QlUJidGMz8
 z8CuQmNovpstYShSlxKmOuOHVd/EpcWndS5fD+7YrU0gqNKql7rFC1xWp+Fe4aUj
 WY1c8U6Mi1NeSaBHEVbuKSoJBLfw2SO8klipZEn7UO1Ha7KeT0z3UJ8aEj4yqaHv
 +5ZLtcLCJrfqabw6SQ8fXc=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp8 (Coremail) with SMTP id DMCowADXhx9E+RRjM1kxZA--.19845S4;
 Mon, 05 Sep 2022 03:15:31 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, evan.quan@amd.com,
 mario.limonciello@amd.com, Felix.Kuehling@amd.com,
 andrey.grodzovsky@amd.com, olomon.chiu@amd.com
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_drv.c
Date: Mon,  5 Sep 2022 03:15:13 +0800
Message-Id: <20220904191513.15159-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4362da59f466d8c41c9a3ea91348266280b6a594>
References: <4362da59f466d8c41c9a3ea91348266280b6a594>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowADXhx9E+RRjM1kxZA--.19845S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xry3Ar47tr1UXr4fAw4xJFb_yoW7AF43pF
 4rCr97t3y8Zr47tryDJFn3Wr90ga48XrWxZ3yDZryjgwn7CFn5Ga18tF9YqFnrXrs3Cw4x
 JrykA39rWa4YkFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE6RRZUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/1tbishNyF1UMWQR+bwAAsR
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix something checkpatch.pl complained about in amdgpu_drv.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 31 +++++++++++++------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index de7144b06e93..b50fd27fb6aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
  * All Rights Reserved.
@@ -140,8 +141,8 @@ uint amdgpu_pcie_lane_cap;
 u64 amdgpu_cg_mask = 0xffffffffffffffff;
 uint amdgpu_pg_mask = 0xffffffff;
 uint amdgpu_sdma_phase_quantum = 32;
-char *amdgpu_disable_cu = NULL;
-char *amdgpu_virtual_display = NULL;
+char *amdgpu_disable_cu;
+char *amdgpu_virtual_display;
 
 /*
  * OverDrive(bit 14) disabled by default
@@ -502,7 +503,7 @@ module_param_named(virtual_display, amdgpu_virtual_display, charp, 0444);
  * Set how much time allow a job hang and not drop it. The default is 0.
  */
 MODULE_PARM_DESC(job_hang_limit, "how much time allow a job hang and not drop it (default 0)");
-module_param_named(job_hang_limit, amdgpu_job_hang_limit, int ,0444);
+module_param_named(job_hang_limit, amdgpu_job_hang_limit, int, 0444);
 
 /**
  * DOC: lbpw (int)
@@ -565,8 +566,8 @@ module_param_named(timeout_period, amdgpu_watchdog_timer.period, uint, 0644);
  */
 #ifdef CONFIG_DRM_AMDGPU_SI
 
-#if defined(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
-int amdgpu_si_support = 0;
+#if IS_ENABLED(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
+int amdgpu_si_support;
 MODULE_PARM_DESC(si_support, "SI support (1 = enabled, 0 = disabled (default))");
 #else
 int amdgpu_si_support = 1;
@@ -584,8 +585,8 @@ module_param_named(si_support, amdgpu_si_support, int, 0444);
  */
 #ifdef CONFIG_DRM_AMDGPU_CIK
 
-#if defined(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
-int amdgpu_cik_support = 0;
+#if IS_ENABLED(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
+int amdgpu_cik_support;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled, 0 = disabled (default))");
 #else
 int amdgpu_cik_support = 1;
@@ -772,9 +773,9 @@ module_param(hws_gws_support, bool, 0444);
 MODULE_PARM_DESC(hws_gws_support, "Assume MEC2 FW supports GWS barriers (false = rely on FW version check (Default), true = force supported)");
 
 /**
-  * DOC: queue_preemption_timeout_ms (int)
-  * queue preemption timeout in ms (1 = Minimum, 9000 = default)
-  */
+ * DOC: queue_preemption_timeout_ms (int)
+ * queue preemption timeout in ms (1 = Minimum, 9000 = default)
+ */
 int queue_preemption_timeout_ms = 9000;
 module_param(queue_preemption_timeout_ms, int, 0644);
 MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption timeout in ms (1 = Minimum, 9000 = default)");
@@ -799,7 +800,7 @@ MODULE_PARM_DESC(no_system_mem_limit, "disable system memory limit (false = defa
  * DOC: no_queue_eviction_on_vm_fault (int)
  * If set, process queues will not be evicted on gpuvm fault. This is to keep the wavefront context for debugging (0 = queue eviction, 1 = no queue eviction). The default is 0 (queue eviction).
  */
-int amdgpu_no_queue_eviction_on_vm_fault = 0;
+int amdgpu_no_queue_eviction_on_vm_fault;
 MODULE_PARM_DESC(no_queue_eviction_on_vm_fault, "No queue eviction on VM fault (0 = queue eviction, 1 = no queue eviction)");
 module_param_named(no_queue_eviction_on_vm_fault, amdgpu_no_queue_eviction_on_vm_fault, int, 0444);
 #endif
@@ -1609,7 +1610,7 @@ static const u16 amdgpu_unsupported_pciidlist[] = {
 };
 
 static const struct pci_device_id pciidlist[] = {
-#ifdef  CONFIG_DRM_AMDGPU_SI
+#ifdef CONFIG_DRM_AMDGPU_SI
 	{0x1002, 0x6780, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},
 	{0x1002, 0x6784, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},
 	{0x1002, 0x6788, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},
@@ -2289,7 +2290,6 @@ static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work)
 			amdgpu_amdkfd_device_init(adev);
 		amdgpu_ttm_set_buffer_funcs_status(adev, true);
 	}
-	return;
 }
 
 static int amdgpu_pmops_prepare(struct device *dev)
@@ -2478,6 +2478,7 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 	/* wait for all rings to drain before suspending */
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
+
 		if (ring && ring->sched.ready) {
 			ret = amdgpu_fence_wait_empty(ring);
 			if (ret)
@@ -2600,6 +2601,7 @@ long amdgpu_drm_ioctl(struct file *filp,
 	struct drm_file *file_priv = filp->private_data;
 	struct drm_device *dev;
 	long ret;
+
 	dev = file_priv->minor->dev;
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0)
@@ -2664,9 +2666,8 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 	if (!filp)
 		return -EINVAL;
 
-	if (filp->f_op != &amdgpu_driver_kms_fops) {
+	if (filp->f_op != &amdgpu_driver_kms_fops)
 		return -EINVAL;
-	}
 
 	file = filp->private_data;
 	*fpriv = file->driver_priv;

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

