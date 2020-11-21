Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35F2BBD37
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B269C6E97C;
	Sat, 21 Nov 2020 05:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D379E6E97A;
 Sat, 21 Nov 2020 05:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLzesN2OqJq+t7ehQsXq5FCC1JfFi0hKZzGZ7BatolT9b0ToGStFAdlTGpKOvCl6qqwkUX7DKFY9k+vwoKS05+fqQp7X/hD81SzWjTHLL4h+llSbUCzT/rhf1kxIkSJKNFjQ0DtVfgsnLVmDhsYlwrGJ9Y3Cl6Ujio2iBhklV6P6Xvlm5HpMuQ/DXNgZV767tt1Wxx4EgixBb9dnnvb+TZnJGuBK72zmJkO4AfQHoZ/h0dkiOTEDLwfQPWne7QxCA6I6amahKZyRYvgpeR2QUf0dVyi5x7v1kdtavCOdHkNyCc3/bjuw0GJr3P+F0Xe3gF69kKKn6u55H/DwdzdxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgMWi3xYrccwsvDiW7z6LfUJ5lt/aTxWV05VaBGMssI=;
 b=EkhPmwB9j4mOXTxJFHl/urmhpaZFnRn4It+AuMd4TzGjNDa5dgpWTyLV0Lwwt1gq1Wrhw3rmZ+gCpDZ0Pfo2S0919npBchkBHbiugSJp4o3Y9jwCS+rBPdpc3DxsBMCysCGmELkbLSfZxr2a9PTeu6P8nWybK4xyeKB9AbBNWE9VeZnsrEAIftcxSI2Tbd7c3exePBNS3gvmxwNIZi/pv1/b/EW0iE90/mviEBdYW4RZBLUI92vIDXxopy4HMhrRXYYIu/K1xRHALkESrK3knTFSPn3XRkiXg7PKJ65pLkvz5GgR5vM/kqoHp6iEG255L74yKB22WDTxsNro00l+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgMWi3xYrccwsvDiW7z6LfUJ5lt/aTxWV05VaBGMssI=;
 b=tlrjOG0zrjC2k6p6EfUcMM8XP98Cip3vV13UAMl3Qr8XTwmq2CdGEjmVpvRK9BkZBH+BTCzySQIVKC8GKSsyGUx0nO2IblhdNY/0vIF63E7OQx7sUWm5v5YeYkMGv3Y7CiYAKJIcMF4IeaSewCis6SoOW5PyAXLCJuG4A1yJ8os=
Received: from BN6PR07CA0007.namprd07.prod.outlook.com (2603:10b6:404:8c::17)
 by BL0PR12MB5012.namprd12.prod.outlook.com (2603:10b6:208:1ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Sat, 21 Nov
 2020 05:21:42 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:8c:cafe::a5) by BN6PR07CA0007.outlook.office365.com
 (2603:10b6:404:8c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:41 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:40 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:40 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 08/12] drm/amdgpu: Split amdgpu_device_fini into early and
 late
Date: Sat, 21 Nov 2020 00:21:18 -0500
Message-ID: <1605936082-3099-9-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6427a973-ae48-4cb2-42f2-08d88ddd5463
X-MS-TrafficTypeDiagnostic: BL0PR12MB5012:
X-Microsoft-Antispam-PRVS: <BL0PR12MB501278EAE76E029169B09242EAFE0@BL0PR12MB5012.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f+sbQqnsCNoDcRxlLva0w31a65T0e0/2i3YxWESi19jDlEuwwIfQBuqqIPQD+2XqisGuic+EVrhlfBjoa94CYOSktx/gotCgylZzxocI7LTJV7lVQLQuwhy0q8or6ljTzXhHDEvrTdk2et9OSuqalR5+igQo37q1poq2P3mx/kk+HSN1VJdtykPzCK8yTQhREdcsG5L2lf0lpzdWi3FnF0HDrB1TiaDQV5I52rFqwwj/dcareGQ6GSpSIXTL3/TiXot+fkYzu6wI3vKeHLGBH9iflaNSkJsoUXjGjiPT9TXu5Uic1vyVyWf/kdGaJ7/bsGjBFycJ6mfmBMu+VwjqzB9na0NgbfqsWoMsg7fObOut3XNg+3Mk5OOU6y2GGnjZgB5eu/t5xf3Hho/SeBg2sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(82740400003)(54906003)(426003)(7696005)(8676002)(6666004)(110136005)(47076004)(36756003)(316002)(4326008)(2906002)(8936002)(70206006)(70586007)(86362001)(2616005)(5660300002)(186003)(356005)(7416002)(336012)(82310400003)(478600001)(81166007)(83380400001)(26005)(44832011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:41.5555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6427a973-ae48-4cb2-42f2-08d88ddd5463
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5012
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the stuff in amdgpu_device_fini such as HW interrupts
disable and pending fences finilization must be done right away on
pci_remove while most of the stuff which relates to finilizing and
releasing driver data structures can be kept until
drm_driver.release hook is called, i.e. when the last device
reference is dropped.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 ++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 15 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 24 +++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  3 ++-
 9 files changed, 65 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 83ac06a..6243f6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1063,7 +1063,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
 
 int amdgpu_device_init(struct amdgpu_device *adev,
 		       uint32_t flags);
-void amdgpu_device_fini(struct amdgpu_device *adev);
+void amdgpu_device_fini_early(struct amdgpu_device *adev);
+void amdgpu_device_fini_late(struct amdgpu_device *adev);
+
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
 
 void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
@@ -1275,6 +1277,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
+void amdgpu_driver_release_kms(struct drm_device *dev);
+
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2f60b70..797d94d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3557,14 +3557,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
  * Tear down the driver info (all asics).
  * Called at driver shutdown.
  */
-void amdgpu_device_fini(struct amdgpu_device *adev)
+void amdgpu_device_fini_early(struct amdgpu_device *adev)
 {
 	dev_info(adev->dev, "amdgpu: finishing device.\n");
 	flush_delayed_work(&adev->delayed_init_work);
 	adev->shutdown = true;
 
-	kfree(adev->pci_state);
-
 	/* make sure IB test finished before entering exclusive mode
 	 * to avoid preemption on IB test
 	 * */
@@ -3581,11 +3579,18 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 		else
 			drm_atomic_helper_shutdown(adev_to_drm(adev));
 	}
-	amdgpu_fence_driver_fini(adev);
+	amdgpu_fence_driver_fini_early(adev);
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
 	amdgpu_fbdev_fini(adev);
+
+	amdgpu_irq_fini_early(adev);
+}
+
+void amdgpu_device_fini_late(struct amdgpu_device *adev)
+{
 	amdgpu_device_ip_fini(adev);
+	amdgpu_fence_driver_fini_late(adev);
 	release_firmware(adev->firmware.gpu_info_fw);
 	adev->firmware.gpu_info_fw = NULL;
 	adev->accel_working = false;
@@ -3621,6 +3626,9 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 		amdgpu_pmu_fini(adev);
 	if (adev->mman.discovery_bin)
 		amdgpu_discovery_fini(adev);
+
+	kfree(adev->pci_state);
+
 }
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 7f98cf1..3d130fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1244,14 +1244,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-#ifdef MODULE
-	if (THIS_MODULE->state != MODULE_STATE_GOING)
-#endif
-		DRM_ERROR("Hotplug removal is not supported\n");
 	drm_dev_unplug(dev);
 	amdgpu_driver_unload_kms(dev);
+
 	pci_disable_device(pdev);
-	pci_set_drvdata(pdev, NULL);
 	drm_dev_put(dev);
 }
 
@@ -1557,6 +1553,7 @@ static struct drm_driver kms_driver = {
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
+	.release = &amdgpu_driver_release_kms,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index d0b0021..c123aa6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -523,7 +523,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
  *
  * Tear down the fence driver for all possible rings (all asics).
  */
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
+void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev)
 {
 	unsigned i, j;
 	int r;
@@ -544,6 +544,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
 		if (!ring->no_scheduler)
 			drm_sched_fini(&ring->sched);
 		del_timer_sync(&ring->fence_drv.fallback_timer);
+	}
+}
+
+void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		if (!ring || !ring->fence_drv.initialized)
+			continue;
+
 		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
 			dma_fence_put(ring->fence_drv.fences[j]);
 		kfree(ring->fence_drv.fences);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 300ac73..a833197 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -49,6 +49,7 @@
 #include <drm/drm_irq.h>
 #include <drm/drm_vblank.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_ih.h"
 #include "atom.h"
@@ -297,6 +298,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 	return 0;
 }
 
+
+void amdgpu_irq_fini_early(struct amdgpu_device *adev)
+{
+	if (adev->irq.installed) {
+		drm_irq_uninstall(&adev->ddev);
+		adev->irq.installed = false;
+		if (adev->irq.msi_enabled)
+			pci_free_irq_vectors(adev->pdev);
+
+		if (!amdgpu_device_has_dc_support(adev))
+			flush_work(&adev->hotplug_work);
+	}
+}
+
 /**
  * amdgpu_irq_fini - shut down interrupt handling
  *
@@ -310,15 +325,6 @@ void amdgpu_irq_fini(struct amdgpu_device *adev)
 {
 	unsigned i, j;
 
-	if (adev->irq.installed) {
-		drm_irq_uninstall(adev_to_drm(adev));
-		adev->irq.installed = false;
-		if (adev->irq.msi_enabled)
-			pci_free_irq_vectors(adev->pdev);
-		if (!amdgpu_device_has_dc_support(adev))
-			flush_work(&adev->hotplug_work);
-	}
-
 	for (i = 0; i < AMDGPU_IRQ_CLIENTID_MAX; ++i) {
 		if (!adev->irq.client[i].sources)
 			continue;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
index c718e94..718c70f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
@@ -104,6 +104,7 @@ irqreturn_t amdgpu_irq_handler(int irq, void *arg);
 
 int amdgpu_irq_init(struct amdgpu_device *adev);
 void amdgpu_irq_fini(struct amdgpu_device *adev);
+void amdgpu_irq_fini_early(struct amdgpu_device *adev);
 int amdgpu_irq_add_id(struct amdgpu_device *adev,
 		      unsigned client_id, unsigned src_id,
 		      struct amdgpu_irq_src *source);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index a0af8a7..9e30c5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -29,6 +29,7 @@
 #include "amdgpu.h"
 #include <drm/drm_debugfs.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu_sched.h"
 #include "amdgpu_uvd.h"
 #include "amdgpu_vce.h"
@@ -94,7 +95,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	}
 
 	amdgpu_acpi_fini(adev);
-	amdgpu_device_fini(adev);
+	amdgpu_device_fini_early(adev);
 }
 
 void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
@@ -1147,6 +1148,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
+
+void amdgpu_driver_release_kms(struct drm_device *dev)
+{
+	struct amdgpu_device *adev = drm_to_adev(dev);
+
+	amdgpu_device_fini_late(adev);
+	pci_set_drvdata(adev->pdev, NULL);
+}
+
 /*
  * VBlank related functions.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 9d11b84..caf828a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2142,9 +2142,12 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 
+	//DRM_ERROR("adev 0x%llx", (long long unsigned int)adev);
+
 	if (!con)
 		return 0;
 
+
 	/* Need disable ras on all IPs here before ip [hw/sw]fini */
 	amdgpu_ras_disable_all_features(adev, 0);
 	amdgpu_ras_recovery_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 7112137..074f36b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -107,7 +107,8 @@ struct amdgpu_fence_driver {
 };
 
 int amdgpu_fence_driver_init(struct amdgpu_device *adev);
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev);
+void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev);
+void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev);
 void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);
 
 int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
