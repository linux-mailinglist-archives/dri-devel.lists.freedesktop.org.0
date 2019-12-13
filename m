Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F611E8B9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED73F6E2E6;
	Fri, 13 Dec 2019 16:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A02C6E2E3;
 Fri, 13 Dec 2019 16:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGEVdoGqpPScPY7B3nARUKrufw543XMc4ESEqXE2f7pdD7q2OrMF2fy/4p6rnVUJAIaHghz6H0EN6qOUrnv36IuX5aHymQ5CiX7ouEx/fe63M9liazAxdLbEocVa1C9njURJJwD6vse7PkYG3BTRtWvHgSCIhUUbgGwKAByKTS4J2oWWuMrHODDZkAHvQll1Vw4tv9uBmej3MmwBZUPPQ+Y+Qg8rosgkMaARGVWG8qYLsDJJYeSkbJ7NgS7O7DKGN/sulf9gX/6oTOLESyoqjXUW6i52y7WHbRUvVCwJIOxTuOWY+4IAaFG22F0O6slz1BLrjGQ2sZLrOV1JlIfWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDwg+b2cbwvlRGEvcobvo1+FkdCcR9r5kl2HPayfpko=;
 b=jh95sHBu5SEpFZ0WIHvXbHpNFGeRRY7qH9uzllvxJTmlaG0whQl5p1VPzSuFcqiA0LjV60iMeqj4OYuyAHGgFg8s21cua65srGnDDkHZjAancMCLwJC3kgI1OlSBz1HIw6ciVKdcBHuJTq6ztdck7/+2dgOAbEJcxWOIWFJgBwe1OU0wjW7tFLnRFLKVbgEbeMo0AQBetjFoDM5ZPa1TsqzTH2lQXzrygppO8gh1qV+rg65Vc4BdOs6VDOxwFduaayTtMUjWTnQ21GXgq1Hn9vzAzMUjssJ0OhAKNeMiAmLWpU8iGN/3fDfgdK+tki+xn4ncz4W9dLOQGyqO9WPjwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDwg+b2cbwvlRGEvcobvo1+FkdCcR9r5kl2HPayfpko=;
 b=NLIwunO75JdFdWRmsjhlKns9b61l8YT45/Y6KgD6u/Yrv0QwznwaXQH+l0/lM91XxDJwjbwWbVdYG+hN/4bMsCP/LtvOTtAZEQuvnQlRQAddqMKcqTnFvevZhNEjjBgdN6sSH1gZ2Npnf+674O1zNU0Jg0NQkm+X4k6hNJQabpY=
Received: from DM3PR12CA0115.namprd12.prod.outlook.com (2603:10b6:0:51::11) by
 MN2PR12MB3389.namprd12.prod.outlook.com (2603:10b6:208:ca::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Fri, 13 Dec 2019 16:54:17 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by DM3PR12CA0115.outlook.office365.com
 (2603:10b6:0:51::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 16:54:16 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 16:54:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:15 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:14 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 13 Dec 2019 10:54:14 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/5] drm/amdgpu: reverts commit
 b01245ff54db66073b104ac9d9fbefb7b264b36d.
Date: Fri, 13 Dec 2019 11:54:05 -0500
Message-ID: <1576256049-12838-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(428003)(189003)(199004)(81166006)(2616005)(316002)(54906003)(44832011)(8936002)(86362001)(26005)(5660300002)(81156014)(110136005)(2906002)(186003)(356004)(6666004)(426003)(478600001)(450100002)(8676002)(336012)(36756003)(7696005)(4326008)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9706983-3f69-45ec-014d-08d77fed16ad
X-MS-TrafficTypeDiagnostic: MN2PR12MB3389:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3389782362E26777A8166A8FEA540@MN2PR12MB3389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXgTabTY+ZWYrQG1aSUaQuan1LdugeExtgCPHgCW4/tvodrrZb769Fn4y06yVJ1nkRwtMfcauTY3pGgob91BwXox+DUenSwJDnB1IoBTtQlg+JJGPdqUL1+FsibkvDS1fTeBzg9r6uPwsVmeZoIIwMnbvfn93MvpqIA/UOwz7F4VcXCNruDWM6CXyEZrEtf/NNPuT2PIAz7aHisFMyFHot9hBnpop6JWYYzQHJjVEpKokTeNmRm7s2c22w6xgtiOkVjh65ypKZYe4xMv0oQFU4m8n/IZ89f+iFo2x9E4SwUY+mbdopfszngcn+NO1GNksgEmnB52uZltCS9p/h+edjGuUTem+mJPEFXqoN06xnYDcQlTF+mM55p3+sv1dJksLSr7aT+YQySS1WHeM/qO72BwQnx5dyk8iQzQbORyxmsMiyRLGGBTq0LqnXRVUy0n
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 16:54:15.9006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9706983-3f69-45ec-014d-08d77fed16ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
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

In preparation for doing XGMI reset synchronization using task barrier.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Le Ma <Le.Ma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 76 +++++-------------------------
 2 files changed, 12 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a78a363..50bab33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1001,8 +1001,6 @@ struct amdgpu_device {
 
 	bool                            pm_sysfs_en;
 	bool                            ucode_sysfs_en;
-
-	bool				in_baco;
 };
 
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7324a5f..1d19edfa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2667,7 +2667,7 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 	if (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO)
 		adev->asic_reset_res = (adev->in_baco == false) ?
 				amdgpu_device_baco_enter(adev->ddev) :
-				amdgpu_device_baco_exit(adev->ddev);
+				qamdgpu_device_baco_exit(adev->ddev);
 	else
 		adev->asic_reset_res = amdgpu_asic_reset(adev);
 
@@ -3796,18 +3796,13 @@ static int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 	return r;
 }
 
-static int amdgpu_do_asic_reset(struct amdgpu_device *adev,
-			       struct amdgpu_hive_info *hive,
+static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
 			       struct list_head *device_list_handle,
 			       bool *need_full_reset_arg)
 {
 	struct amdgpu_device *tmp_adev = NULL;
 	bool need_full_reset = *need_full_reset_arg, vram_lost = false;
 	int r = 0;
-	int cpu = smp_processor_id();
-	bool use_baco =
-		(amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) ?
-		true : false;
 
 	/*
 	 * ASIC reset has to be done on all HGMI hive nodes ASAP
@@ -3815,62 +3810,22 @@ static int amdgpu_do_asic_reset(struct amdgpu_device *adev,
 	 */
 	if (need_full_reset) {
 		list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
-			/*
-			 * For XGMI run all resets in parallel to speed up the
-			 * process by scheduling the highpri wq on different
-			 * cpus. For XGMI with baco reset, all nodes must enter
-			 * baco within close proximity before anyone exit.
-			 */
+			/* For XGMI run all resets in parallel to speed up the process */
 			if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-				if (!queue_work_on(cpu, system_highpri_wq,
-						   &tmp_adev->xgmi_reset_work))
+				if (!queue_work(system_highpri_wq, &tmp_adev->xgmi_reset_work))
 					r = -EALREADY;
-				cpu = cpumask_next(cpu, cpu_online_mask);
 			} else
 				r = amdgpu_asic_reset(tmp_adev);
-			if (r)
-				break;
-		}
-
-		/* For XGMI wait for all work to complete before proceed */
-		if (!r) {
-			list_for_each_entry(tmp_adev, device_list_handle,
-					    gmc.xgmi.head) {
-				if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-					flush_work(&tmp_adev->xgmi_reset_work);
-					r = tmp_adev->asic_reset_res;
-					if (r)
-						break;
-					if (use_baco)
-						tmp_adev->in_baco = true;
-				}
-			}
-		}
 
-		/*
-		 * For XGMI with baco reset, need exit baco phase by scheduling
-		 * xgmi_reset_work one more time. PSP reset and sGPU skips this
-		 * phase. Not assume the situation that PSP reset and baco reset
-		 * coexist within an XGMI hive.
-		 */
-
-		if (!r && use_baco) {
-			cpu = smp_processor_id();
-			list_for_each_entry(tmp_adev, device_list_handle,
-					    gmc.xgmi.head) {
-				if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-					if (!queue_work_on(cpu,
-						system_highpri_wq,
-						&tmp_adev->xgmi_reset_work))
-						r = -EALREADY;
-					if (r)
-						break;
-					cpu = cpumask_next(cpu, cpu_online_mask);
-				}
+			if (r) {
+				DRM_ERROR("ASIC reset failed with error, %d for drm dev, %s",
+					 r, tmp_adev->ddev->unique);
+				break;
 			}
 		}
 
-		if (!r && use_baco) {
+		/* For XGMI wait for all PSP resets to complete before proceed */
+		if (!r) {
 			list_for_each_entry(tmp_adev, device_list_handle,
 					    gmc.xgmi.head) {
 				if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
@@ -3878,21 +3833,15 @@ static int amdgpu_do_asic_reset(struct amdgpu_device *adev,
 					r = tmp_adev->asic_reset_res;
 					if (r)
 						break;
-					tmp_adev->in_baco = false;
 				}
 			}
 		}
-
-		if (r) {
-			DRM_ERROR("ASIC reset failed with error, %d for drm dev, %s",
-				 r, tmp_adev->ddev->unique);
-			goto end;
-		}
 	}
 
 	if (!r && amdgpu_ras_intr_triggered())
 		amdgpu_ras_intr_cleared();
 
+
 	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
 		if (need_full_reset) {
 			/* post card */
@@ -4181,8 +4130,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		if (r)
 			adev->asic_reset_res = r;
 	} else {
-		r  = amdgpu_do_asic_reset(adev, hive, device_list_handle,
-					  &need_full_reset);
+		r  = amdgpu_do_asic_reset(hive, device_list_handle, &need_full_reset);
 		if (r && r == -EAGAIN)
 			goto retry;
 	}
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
