Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7C20290A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE9B6E44E;
	Sun, 21 Jun 2020 06:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0660A6E434;
 Sun, 21 Jun 2020 06:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaHCOixe+7dMbtkcQ+oMAJHmyNkhxQ/a6MSG8R0yZ0MmIsj1Xq1nIvdO1VijA+iI3lkvkw6y1Ydv7MTixtA22hc381swdDcOSVuFbLJD7z9H3BCl6UmKNcqFECPLPJKjp6EheWchAhohGYLZYGvtqn2gZ8DA/DPL665SODHzBJ7289W3iDKdC5e7w2sjmOEda9+AzOT/hnxP9S6RUDvmMVzkP/kMXWwGp+7o0SEERC4c1CQxEvKYNwtcqAE2XX0RlHdJ9eBZoj0A8v7TGgb8XxL31rTmoMzlnP35oETxRPjnC+6Wjb+eGSRlzehRU5q55wIMWX700Oz0hnhPexKoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niIOCFMpu2oNBW0pdWe+HP447O4g0QE+eF2dIelQ4Nw=;
 b=ICNEU3K5ampEJy4mnNW3iUHSRxhOE5SpiYHmkz7oKunGFBL1PyivTxRvreVJiLTBmNRnq/h54NHvj1BvbpvENA/n0FZEje4mmX5Hn+EktDHt8hsr+lIYY9UhR0yeW7X3ZwcW+niwOUR76MhcyybZ3jImr8+eaapqO6JfNm0gbPQoiDdrrP/fM7zHMXLUdv1kH3g4RJ49jyIVraxoKTkjUDhIJW5TMFC/DeCXODDI71GC3yrL9rxybpqsoIdm0hQtq9dxdXDfw83U8/yh2ki4iHu3yuIbQOYHFy0pt1CDrIrPOFN0XrDH2O7K8xW+fCAkv26svD60l2oVlZERVVLBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niIOCFMpu2oNBW0pdWe+HP447O4g0QE+eF2dIelQ4Nw=;
 b=GKTN4/0fErQOdiFSqkARFZANW8zI/dtjUhjLgL8wv+IiZ6EODBuQ1MEY64svM84eiM0bmghfswjKUQKDJJ6DgvQUxUnF+e4I+Gsaoc+mFcoxGTulzQZO7MnbH6zToYNKYdNUwTz2ZL6yKmC5vRLe2ElACSbwrZZ8A7VL7gxZ8Zo=
Received: from DM6PR17CA0025.namprd17.prod.outlook.com (2603:10b6:5:1b3::38)
 by BYAPR12MB3160.namprd12.prod.outlook.com (2603:10b6:a03:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Sun, 21 Jun
 2020 06:05:43 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::96) by DM6PR17CA0025.outlook.office365.com
 (2603:10b6:5:1b3::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:43 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:42 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:42 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:42 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/8] drm/amdgpu: Split amdgpu_device_fini into early and
 late
Date: Sun, 21 Jun 2020 02:03:04 -0400
Message-ID: <1592719388-13819-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(70586007)(336012)(478600001)(7696005)(86362001)(26005)(186003)(8936002)(36756003)(5660300002)(8676002)(6666004)(2616005)(4326008)(426003)(70206006)(44832011)(356005)(316002)(54906003)(2906002)(82740400003)(82310400002)(47076004)(83380400001)(110136005)(81166007);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35af6b8a-e9c2-4037-9979-08d815a9219c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3160:
X-Microsoft-Antispam-PRVS: <BYAPR12MB31608530E01B7F9902406D3EEA960@BYAPR12MB3160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiyI5WrApFYPTU+u9BTKmZ+dG9qbjvK4UrGcBMg3z85DKsPYO1t07hdX62VZIiOAyGzr1CCS5ijf13DN7htTDnviz5fvTNctXjeaKpD5pACV7RI9iOtbnLbJ5hD20ZZdsIYKAhlVaGuR6wXaLhUHOognC1LrhH0AgdSueCSi1bpHQs1iRnxT+SQNcUT1jUHod+XN5w3RAB4AmVJckW3OLyDsLOXT9z+mDaDQmOVpEvg8uiQvQ42yFvucKPgqusfCUTH/t1zigrsQBtdGnxOzljUzFWM6yq4NaaveJqylHtmde8DQzq/PJS2GNxgkwkcV5SRmGb4MaA/vAJIhHdF5Kj0pc+s+KjzA0aJwvNpSAv6gjcSSDCm8Heav7jDPq72mdoH6BWyWd1kPwisI2Dsp2Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:42.9652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35af6b8a-e9c2-4037-9979-08d815a9219c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3160
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the stuff in amdgpu_device_fini such as HW interrupts
disable and pending fences finilization must be done right away on
pci_remove while most of the stuff which relates to finilizing and releasing
driver data structures can be kept until drm_driver.release hook is called, i.e.
when the last device reference is dropped.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 24 +++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 23 +++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  3 +++
 7 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 2a806cb..604a681 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1003,7 +1003,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		       struct drm_device *ddev,
 		       struct pci_dev *pdev,
 		       uint32_t flags);
-void amdgpu_device_fini(struct amdgpu_device *adev);
+void amdgpu_device_fini_early(struct amdgpu_device *adev);
+void amdgpu_device_fini_late(struct amdgpu_device *adev);
+
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
 
 void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
@@ -1188,6 +1190,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
+void amdgpu_driver_release_kms(struct drm_device *dev);
+
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cc41e8f..e7b9065 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2309,6 +2309,8 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 {
 	int i, r;
 
+	//DRM_ERROR("adev 0x%llx", (long long unsigned int)adev);
+
 	amdgpu_ras_pre_fini(adev);
 
 	if (adev->gmc.xgmi.num_physical_nodes > 1)
@@ -3304,10 +3306,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
  * Tear down the driver info (all asics).
  * Called at driver shutdown.
  */
-void amdgpu_device_fini(struct amdgpu_device *adev)
+void amdgpu_device_fini_early(struct amdgpu_device *adev)
 {
-	int r;
-
 	DRM_INFO("amdgpu: finishing device.\n");
 	flush_delayed_work(&adev->delayed_init_work);
 	adev->shutdown = true;
@@ -3330,7 +3330,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
 	amdgpu_fbdev_fini(adev);
-	r = amdgpu_device_ip_fini(adev);
+
+	amdgpu_irq_fini_early(adev);
+}
+
+void amdgpu_device_fini_late(struct amdgpu_device *adev)
+{
+	amdgpu_device_ip_fini(adev);
 	if (adev->firmware.gpu_info_fw) {
 		release_firmware(adev->firmware.gpu_info_fw);
 		adev->firmware.gpu_info_fw = NULL;
@@ -3368,6 +3374,7 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 		amdgpu_pmu_fini(adev);
 	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
 		amdgpu_discovery_fini(adev);
+
 }
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 9e5afa5..43592dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1134,12 +1134,9 @@ amdgpu_pci_remove(struct pci_dev *pdev)
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
 	pci_set_drvdata(pdev, NULL);
 	drm_dev_put(dev);
@@ -1445,6 +1442,7 @@ static struct drm_driver kms_driver = {
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
+	.release = &amdgpu_driver_release_kms,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 0cc4c67..1697655 100644
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
+		drm_irq_uninstall(adev->ddev);
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
-		drm_irq_uninstall(adev->ddev);
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
index c0b1904..9d0af22 100644
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
@@ -86,7 +87,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	amdgpu_unregister_gpu_instance(adev);
 
 	if (adev->rmmio == NULL)
-		goto done_free;
+		return;
 
 	if (adev->runpm) {
 		pm_runtime_get_sync(dev->dev);
@@ -95,11 +96,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 
 	amdgpu_acpi_fini(adev);
 
-	amdgpu_device_fini(adev);
-
-done_free:
-	kfree(adev);
-	dev->dev_private = NULL;
+	amdgpu_device_fini_early(adev);
 }
 
 void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
@@ -1108,6 +1105,20 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
+
+void amdgpu_driver_release_kms (struct drm_device *dev)
+{
+	struct amdgpu_device *adev = dev->dev_private;
+
+	amdgpu_device_fini_late(adev);
+
+	kfree(adev);
+	dev->dev_private = NULL;
+
+	drm_dev_fini(dev);
+	kfree(dev);
+}
+
 /*
  * VBlank related functions.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 7348619..169c2239 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2056,9 +2056,12 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
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
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
