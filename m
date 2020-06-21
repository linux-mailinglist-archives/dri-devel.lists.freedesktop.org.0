Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E620290F
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58FD6E451;
	Sun, 21 Jun 2020 06:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A73D6E454;
 Sun, 21 Jun 2020 06:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFGqpcmZNiX2t1bqDxUgIQIUPgNy/A+chp8ZPSD0/TofcvrByQhDbEmnwVLstgWp+RD/dedUH+zMXiLGhjI4UQUXcl44VlMSbzVbF34jKsoRV3j5CK7gjtLpiSxKVfnpLli7e9BOY3Xo/9puUa6Lf66EUTUjAD2mTSg6FGV2XHgo+9ExkWJ6Is04mnDiOKRx8tAQy+2/l9Ng6Isr9JRFJgIjMYgsEfEBRqBrTfzzBvuOm//kOiIhGDSGglQkIeRoIkShzUeEqmyFj1j8yUbjbNP2cxHURCN28WCfDOblyHfxOy+DS8/N782xSzFqrIph6lyjNUk+sb218FNR0O3q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92+us9FlJ1/JudX1QA0Ie+34DqI2ZMNc/GGMAzsjoGU=;
 b=Su6xaNGddKFfrPJ0nVTSKSf7Bk2Ods5Y0azR2e0cs0d51dMl2FjoVDx55f98UsxBDk5Mlrb+zDiGvuxexGawKyolS9MZ5KcuQmPCg87jRWDSNCFSb9C1V+Lg5QKPh94/VGYMnHxWb/+fkcKOd+ExxDfDFXBXGYiIcz02zXr7gSQN9d/sySly2Mt6cro5W7Up9QK/gjzHhSBhYBAH3AhuICjnpfm4c6oM9FzH1v8flrtET3IQXGMeGsC2uFxd1EYDdXpbrvc/m6bqM+9x51379VKeiPNQm4Wp2oPAf9gAsFTWBgnTRdVTVXSV+gA1tHRTAnzeF7dkhKKb2VTh5A9ZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92+us9FlJ1/JudX1QA0Ie+34DqI2ZMNc/GGMAzsjoGU=;
 b=Ct1SPv6xTA2Vk+7FVxOkVKF+otujiwFID3Uj6xGQz9as+YTMCoM3GoDhjdyTPweENldqGipJWOYXiXtVwyqNoIniBJ4j8Ke8pOl4U9+9jw5u/pTT5aqpu3w6rQ+6tRyLC8DFMomVK0OoFXhsQiV4Ab8rb4rQdGjZyGo6NDeAg6o=
Received: from DM5PR12CA0011.namprd12.prod.outlook.com (2603:10b6:4:1::21) by
 DM5PR12MB1643.namprd12.prod.outlook.com (2603:10b6:4:11::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22; Sun, 21 Jun 2020 06:05:49 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::a6) by DM5PR12CA0011.outlook.office365.com
 (2603:10b6:4:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:49 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:48 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:47 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:47 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after device is
 unplugged.
Date: Sun, 21 Jun 2020 02:03:08 -0400
Message-ID: <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(46966005)(8676002)(4326008)(2906002)(186003)(82310400002)(26005)(44832011)(54906003)(8936002)(82740400003)(2616005)(36756003)(7696005)(81166007)(5660300002)(6666004)(110136005)(47076004)(478600001)(426003)(70206006)(86362001)(70586007)(316002)(356005)(336012);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 827b7709-5374-468b-0c69-08d815a92522
X-MS-TrafficTypeDiagnostic: DM5PR12MB1643:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1643B0B31589E2CACFE306FBEA960@DM5PR12MB1643.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0yyy/m/DNc7Wk102HbS3TV0GywUXYskp04+2XfTWvF9KPBuo00enr3F1Q27r/X+tqYZ33TcWBiRpRGZECrM8LLSsnTCWE2C8cfLIKSNeLhc1328hsb2A6sLuwCnwKqJGqpeQz52j8X6juqK9klU6+8PEwcZ84715ntZIuE3vrGS2sLEMYjjEurgBZg+0FftGRSmohaDhGkEHUJ+x06r6SoQfxHDXKMWUDtpmCHwB1aDwqT7n5+xwujUpXJzMnvkGFHYLvBrrxr9t/iVck5rC/L70Ga7IYQNOoGKrTcZoBXUtsxM2VzhkIlugjZergUKpBH7IdQTN6YpbLvjbMT8TtWQ1tDhW4mY9eAnNhKQ1zlucZbEIe1WL0DI8w/QqKMxxSrDjAOe/dz1Z4fA4nGycUA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:48.8740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 827b7709-5374-468b-0c69-08d815a92522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1643
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

No point to try recovery if device is gone, just messes up things.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  8 ++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6932d75..5d6d3d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1129,12 +1129,28 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	return ret;
 }
 
+static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
+{
+	int i;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		if (!ring || !ring->sched.thread)
+			continue;
+
+		cancel_delayed_work_sync(&ring->sched.work_tdr);
+	}
+}
+
 static void
 amdgpu_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = dev->dev_private;
 
 	drm_dev_unplug(dev);
+	amdgpu_cancel_all_tdr(adev);
 	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
 	amdgpu_driver_unload_kms(dev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 4720718..87ff0c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -28,6 +28,8 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 
+#include <drm/drm_drv.h>
+
 static void amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
@@ -37,6 +39,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
+	if (drm_dev_is_unplugged(adev->ddev)) {
+		DRM_INFO("ring %s timeout, but device unplugged, skipping.\n",
+					  s_job->sched->name);
+		return;
+	}
+
 	if (amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
 		DRM_ERROR("ring %s timeout, but soft recovered\n",
 			  s_job->sched->name);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
