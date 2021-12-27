Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D4480343
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 19:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7F310EEEE;
	Mon, 27 Dec 2021 18:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F67F10EEEC;
 Mon, 27 Dec 2021 18:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyUr+ohCYHoMUXLFkqHMoBMueLI0XrfTjGVRe1mfDz6MuVJG3+yJkz7/PW7jjSUl2InRhEjGL8/5fIlZbtXsHat77BNJcmhSENL20tUo5BWPmBWFmuQ/y4DnkZO05U5TK/FNUzgyyf0RM1yCBWkFp/8QiWvgv0zLLnxCSpURXQPSZs3wOn/DxV9mi01awfV/wjFDrGcCuG+UzxstGsTRUYe4wKOT5ARw0LUWYXrCMUkZraF+Buk1ZkfhA3yp27vd1BDDwGG16Y9/5nOFhNQA0iapIuns967lNOgeHEk3EQf03JK6YYZSquXjfjcYKKSow7unP/Zg6+72f3pbrTK76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdWhkNxtd9/J4K14eZk1dhGVPdbC5d4CyzIHw0T9AxI=;
 b=CTzVuqbTEUNaCT0iSJ24k8HR0lER3cQWLwjxgtcgjTjID94ci2FmDKLoO70Mv1cPJpEq0pkO6Mt87k/4fOe7LKnzl3SA+arDfMxNldAaCQZ6RWl7LEIZ3p1KwwFWiBUAMzVjD9Db0nkrganpo5mDOlq9CIgKLayrTR0hA2ohtDzguYbmToCv0pz9X5a62m9C0h5EKz2xZiAR2Fx7kN7U8BK1jOjxsIOH7I/WvZY+OhRgoyTHpSIxPnrZNI+eZ8mAaC4smptF01stOb8H6qJPplrRaL2/nIIYpjmu7VNUpL0eoJ8t/LnqpWRPbzhB7BbJ4wLlIbq3ueTTLUiFUY/RBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdWhkNxtd9/J4K14eZk1dhGVPdbC5d4CyzIHw0T9AxI=;
 b=3L5W7u9qcJr7MJl8ggHQJJOsEPuU+i6mBNlBAZ4HFYaRGwmfWqvKrpLpwBgjVAuEcvfBVENP6UBUwhf0LcJ0t2m3edJbS3EXRLDrehZT2z9YYJ6AlOM2q+FMlqICX0WbP2T1FDD9nhphgzlpyWPJfcS5CzyxEej8VHJC+VYpvUA=
Received: from BN8PR07CA0035.namprd07.prod.outlook.com (2603:10b6:408:ac::48)
 by MW3PR12MB4539.namprd12.prod.outlook.com (2603:10b6:303:59::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Mon, 27 Dec
 2021 18:25:20 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::f0) by BN8PR07CA0035.outlook.office365.com
 (2603:10b6:408:ac::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16 via Frontend
 Transport; Mon, 27 Dec 2021 18:25:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Mon, 27 Dec 2021 18:25:20 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 27 Dec
 2021 12:25:19 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: disable runpm if we are the primary adapter
Date: Mon, 27 Dec 2021 13:25:06 -0500
Message-ID: <20211227182506.2110551-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211227182506.2110551-1-alexander.deucher@amd.com>
References: <20211227182506.2110551-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde0ab00-938f-4d15-2cdb-08d9c9663d3e
X-MS-TrafficTypeDiagnostic: MW3PR12MB4539:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4539B47B703950E2646CCE98F7429@MW3PR12MB4539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:68;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/Lvqu/WDk+PugT17eV5z2DCcFpMTEjQt35zjK2iWQ69bJGw7EJsVeUBAPSNnCPmmBtJSXqwxCJWKkPbNgCwv5kkT9B8KRXspNjF+B0GXEoWBKpVtyyH9eCs0NTyAKubtx2/JBpvoFWrjlHSiRzy6zzvcrsku3sTklYJpPCFLVmRU3Awn3bEIgTGdGvDkZpG6oGE6RU5bX/jg9xxl0lfXjYsHrXvINpeeoBjheKvoMtTsOG1zm/I5KUZl9RWr9mNC+GjEh49ddWYKJTpXuyMJClYmwL63rjS0/c5SwTAZgYsh4zMLVTrTAF+qxDf0cL1LN/gsmBHGVQLsH88nzjLpCEoIuCIbhEfdXK5CL9kkvDibdmlVauWfcJqsvdiz3JcwfEIsp1qj/bkAZZMjgu26NUWn0Sen3h4v8gd/sZtnP/WGXItK4hzu712Lyeur3fFMsyoIoqHUqNUWfmXGS3GjY7aZN+PWJBQbLlDlwkPe+JcZ16nCZFkKy+GBLOdNY0ASouA5eZFd+8QPf+rlIi2JLqgIby9xDTsIJqLjREE3ONhfgNyVzkBHuyoF7+9gNAi3Wxswo7ICgj9sVdAOrDYlt8Z935gGhUoSUoVqqpwSr+Dv+AMEEjeJAp2zQsnzLAmIluh1VT6gOh+qdWbuhng2T3yWCAcYfbyVZEEtH8FgWvXkselpmRX2IB66qjSpvvhbBYqwMFkF8vnYlOEQRYpmTqP1o1V0sWlU9We6hi6Qh2HZyVfmWHC7kMXIFE71tTUpTYldjna0eUHEiOJqQwlT2D5v7MpOzmvFew8UKUhRB0vCSfi6JcwD43mrEtQXyM/iwNVvPFAhoJXuroW5CP1hJKB99MIFJzhuf6GfI4yAj0/+710FGr0PPeO5uRmXkdR/3tVS1O9P5oj3f5f2PNxqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(8936002)(36756003)(8676002)(40460700001)(26005)(36860700001)(508600001)(966005)(70206006)(1076003)(70586007)(7696005)(2906002)(426003)(336012)(186003)(82310400004)(83380400001)(4326008)(450100002)(47076005)(2616005)(356005)(5660300002)(6666004)(16526019)(86362001)(316002)(110136005)(81166007)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 18:25:20.0499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde0ab00-938f-4d15-2cdb-08d9c9663d3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4539
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we are the primary adapter (i.e., the one used by the firwmare
framebuffer), disable runtime pm.  This fixes a regression caused
by commit 55285e21f045 which results in the displays waking up
shortly after they go to sleep due to teh device coming out of
runtime suspend and sending a hotplug uevent.

v2: squash in reworked fix from Evan

Fixes: 55285e21f045 ("fbdev/efifb: Release PCI device's runtime PM ref during FB destroy")
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=215203
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1840
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 28 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  6 ++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index b85b67a88a3d..7d67aec6f4a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1077,6 +1077,7 @@ struct amdgpu_device {
 	bool                            runpm;
 	bool                            in_runpm;
 	bool                            has_pr3;
+	bool                            is_fw_fb;
 
 	bool                            pm_sysfs_en;
 	bool                            ucode_sysfs_en;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 86ca80da9eea..99370bdd8c5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -39,6 +39,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/suspend.h>
 #include <linux/cc_platform.h>
+#include <linux/fb.h>
 
 #include "amdgpu.h"
 #include "amdgpu_irq.h"
@@ -1890,6 +1891,26 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static const struct drm_driver amdgpu_kms_driver;
 
+static bool amdgpu_is_fw_framebuffer(resource_size_t base,
+				     resource_size_t size)
+{
+	bool found = false;
+#if IS_REACHABLE(CONFIG_FB)
+	struct apertures_struct *a;
+
+	a = alloc_apertures(1);
+	if (!a)
+		return false;
+
+	a->ranges[0].base = base;
+	a->ranges[0].size = size;
+
+	found = is_firmware_framebuffer(a);
+	kfree(a);
+#endif
+	return found;
+}
+
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
@@ -1898,6 +1919,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	unsigned long flags = ent->driver_data;
 	int ret, retry = 0, i;
 	bool supports_atomic = false;
+	bool is_fw_fb;
+	resource_size_t base, size;
 
 	/* skip devices which are owned by radeon */
 	for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
@@ -1966,6 +1989,10 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	}
 #endif
 
+	base = pci_resource_start(pdev, 0);
+	size = pci_resource_len(pdev, 0);
+	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
+
 	/* Get rid of things like offb */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
 	if (ret)
@@ -1978,6 +2005,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	adev->dev  = &pdev->dev;
 	adev->pdev = pdev;
 	ddev = adev_to_drm(adev);
+	adev->is_fw_fb = is_fw_fb;
 
 	if (!supports_atomic)
 		ddev->driver_features &= ~DRIVER_ATOMIC;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 651c7abfde03..09ad17944eb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -206,6 +206,12 @@ int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
 			adev->runpm = true;
 			break;
 		}
+		/* XXX: disable runtime pm if we are the primary adapter
+		 * to avoid displays being re-enabled after DPMS.
+		 * This needs to be sorted out and fixed properly.
+		 */
+		if (adev->is_fw_fb)
+			adev->runpm = false;
 		if (adev->runpm)
 			dev_info(adev->dev, "Using BACO for runtime pm\n");
 	}
-- 
2.33.1

