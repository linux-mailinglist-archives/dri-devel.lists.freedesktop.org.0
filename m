Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D79011BE19
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 21:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F266EBD0;
	Wed, 11 Dec 2019 20:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887936EBCD;
 Wed, 11 Dec 2019 20:39:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS0AgwnY6XTdRcfd+LLWHmxjw4iBL3BT1sfiyVnEhUy7o2DKSRiXXei/BsLyeLJdzFcnvAq82hS71Mg3f0kwW1VbU0PnvT8tOLovygBI6lpbREeqtKjN1xnSxshV7aLI+1NhuY5diVV5ULRbEcVRXKWS5lP6lfn9rnwhe/RVFaT85LqZ9M+NSKYpQIwKluFVKz54lIfeBQDisdTb5lX1bQzAqcEmjNogzdiDsrPTlqQe4RvFe3I/htSpMzr0ucHD0AkTp1nwPn1PqKiFE4jUgdRRSBUqNgJqjVy2RmCV376bQUMpIyTKSEmeQuC5/RCX9fOEt92RO4sYfIuy0p13Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgUn9i8qZ47fjrSZL0crJUhQP0Epe52ppA+OgA4ALuk=;
 b=R9Vwxp6SgSSUrx40KWsG1JmqA9OkDU+4yS8IgsW0ECg3A3bPDj9n5BW6yQggURKpWQddETMhUJI77fh2TY+wTKkxenOykHmaQDTlo7Fd6pcsjHwLUacfy63B5mBQrN2SwkgQwOsfio9YCaPgYBaK0n+9PzEfS12xJOeEMSacC9utCh543x5T4BPcFtpHvT1kPNMrgkyqcAz/RJLxq4MW3NpkXmAP+CpXmLPAWvOWCZg7G3QjG9xbJlhKzjTNOtFjuKBDKnXwYIfiS0MMgJTTMlGbHYaJ72Yn/OVQzr3YUcfImPaKiyZ1FON+p2d2mwP/DGS3ZcvcW/Vj9kSLKwxHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgUn9i8qZ47fjrSZL0crJUhQP0Epe52ppA+OgA4ALuk=;
 b=WklsbscLC7TvgsQX8Sc4RVW+9han2+tga8bBeirD2hvJmLHFg/v6ELpRfjxa9LOnnl/MPDbFkoRpuD6XmgFZXBfnHVv9V1XFgWiCtD7CMkPEm/BtgF0GTDNcpbcvJnh/+YLKjdm+tkHPt2SUfw/y5JAhs1BAjxPNHlYEGQSZHA4=
Received: from BN6PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:405:4c::33) by BY5PR12MB4211.namprd12.prod.outlook.com
 (2603:10b6:a03:20f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Wed, 11 Dec
 2019 20:39:11 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::207) by BN6PR1201CA0023.outlook.office365.com
 (2603:10b6:405:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Wed, 11 Dec 2019 20:39:11 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 11 Dec 2019 20:39:10 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 14:39:09 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 11 Dec 2019 14:39:08 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI reset
 synchronization.
Date: Wed, 11 Dec 2019 15:38:51 -0500
Message-ID: <1576096732-3596-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(428003)(199004)(189003)(336012)(2616005)(6666004)(54906003)(478600001)(186003)(4326008)(26005)(8676002)(356004)(70206006)(70586007)(110136005)(5660300002)(2906002)(86362001)(36756003)(426003)(316002)(7696005)(450100002)(81166006)(81156014)(44832011)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4211; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0942006-dbdb-44e4-fec8-08d77e7a2d75
X-MS-TrafficTypeDiagnostic: BY5PR12MB4211:
X-Microsoft-Antispam-PRVS: <BY5PR12MB421140860F7E42133AFEE440EA5A0@BY5PR12MB4211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWxWiGbX5xbL0uGVj8VB/lIyLxyMC9Fg53j5KXTZyb7O/nufpZXC9zsj6nj7xmKIWaUAnlagmP5qTROyGA2pLKcRfvplfeeS/vPxjkruj39lOphBFxC6WG60dfQPN8QLv95X9cXyUgV4Roc6gmF8Z+/yXgYKqaZbTvZ6tXid3fQ/ADW4GhDYq8vultbwZbWxqpEYJM1SK4Yuz7ZKkvgt16NqgWm8ij+dQuNhEPOhWEDpn2nVXaqrtgjSz4kKykvVLt4pHSUOo6hdbYYokoYjNL+I5EnbHFV2MQ0P6GsZ2vSpXTwqo0TKBkalqyqTlV9wjtdlTven4qlb5B0ao5QYGWD91l0zty0vbmCuAyayYQBVBpB3zwkZtkq8DAyMQrsa4lXfAQK5tcW8jUUKq/0ho3CxsFqtrrOgkJr2BY2fejvzRVP96mLd6XJVv830WK2l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 20:39:10.8440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0942006-dbdb-44e4-fec8-08d77e7a2d75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211
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
Cc: Alexander.Deucher@amd.com, Le.Ma@amd.com, Evan.Quan@amd.com,
 hawking.zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use task barrier in XGMI hive to synchronize ASIC resets
across devices in XGMI hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 42 +++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 1d19edfa..e4089a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -67,6 +67,7 @@
 #include "amdgpu_tmz.h"
 
 #include <linux/suspend.h>
+#include <drm/task_barrier.h>
 
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
@@ -2663,14 +2664,43 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 {
 	struct amdgpu_device *adev =
 		container_of(__work, struct amdgpu_device, xgmi_reset_work);
+	struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev, 0);
 
-	if (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO)
-		adev->asic_reset_res = (adev->in_baco == false) ?
-				amdgpu_device_baco_enter(adev->ddev) :
-				qamdgpu_device_baco_exit(adev->ddev);
-	else
-		adev->asic_reset_res = amdgpu_asic_reset(adev);
+	/*
+	 * Use task barrier to synchronize all xgmi reset works across the
+	 * hive.
+	 * task_barrier_enter and task_barrier_exit will block untill all the
+	 * threads running the xgmi reset works reach those points. I assume
+	 * guarantee of progress here for all the threads as the workqueue code
+	 * creates new worker threads as needed by amount of work items in queue
+	 * (see worker_thread) and also each thread sleeps in the barrir and by
+	 * this yielding the CPU for other work threads to make progress.
+	 */
+	if (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
+
+		if (hive)
+			task_barrier_enter(&hive->tb);
+
+		adev->asic_reset_res = amdgpu_device_baco_enter(adev->ddev);
+
+		if (adev->asic_reset_res)
+			goto fail;
+
+		if (hive)
+			task_barrier_exit(&hive->tb);
+
+		adev->asic_reset_res = amdgpu_device_baco_exit(adev->ddev);
+
+		if (adev->asic_reset_res)
+			goto fail;
+	} else {
+		if (hive)
+			task_barrier_full(&hive->tb);
+
+		adev->asic_reset_res =  amdgpu_asic_reset(adev);
+	}
 
+fail:
 	if (adev->asic_reset_res)
 		DRM_WARN("ASIC reset failed with error, %d for drm dev, %s",
 			 adev->asic_reset_res, adev->ddev->unique);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
