Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A407611BE14
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 21:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765DF6EBCA;
	Wed, 11 Dec 2019 20:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0876EB8B;
 Wed, 11 Dec 2019 20:39:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLNGVzucE1XUvZ4/T/gEXYGnXUnLfzJcOrczCkiHCIvChM3h+1s+ahGovIZPm5tNuOIrch5xQahGixOPpD3EnmSScahgqbDy83Kqv58jrpnbhw+Hme3WjJuszEK24xmQJ2hxEShnWNYGzv5DNxy7JhJl1dqCCq6OouPtZQ/r2y71YYuBCysuXYgU0B//ZZV/56KALg7oV5BRzOE2URgr/NNMHPBrkxGR3qGoQAhZFR5c1vYXMpxm+5rYcv3KE5G67o+1EkN2WdEMxNguzCaWDC6H40fy4JBbz0038WWhNarBo98nNs/39aA99y0kwyipGV1g5T7X40KOlAXXrhuWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSTWVqIEOuFNnA5my3jMbtcRLRuG7+9bv97JjVHbz8I=;
 b=i8qoGNUEnUp8DYePI9vG+YcBCXsRfpA2U80GJvHxYkd9KtppTTMELx0834DETt8QdxuAxTtKAR7GxHLajijfnMwnysWiLgPFuNudduFl3Ly1bmjcq8iJR10cczEF9Th9lK8uoRZuJnJbhiY8UHdqkCOnXHGAaRJIsTHWdEeFRhSsBam43VXGbX2nSeunMMOpB4WsQRVyBQrxqLIETJOBO38lJW3ZyMDcFlhH0AN0b6cUnCo9CfEY9rtMeyTqE0zm9XFKxWrEqzDbJg4e75mzYsWKDutN0ZC1UojvR48HDMclnuFYkXRx9wPOPg97U1+Mi2ICUkZg13C02OMhQ4BHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSTWVqIEOuFNnA5my3jMbtcRLRuG7+9bv97JjVHbz8I=;
 b=mXGGHrOh50TTQELBvuEFpcXKTjpktiOZiIApYj25rtS+n4PHjI3zV6gt/U1JIMB6sjiNFozoR0fg4PfWB0ezcy4gL0lJzu+BzKw38aP2/1IDBVynMbGhfKXj0tiYki8jyfXqh2yRAKmhFIigRPsWvlcDIxVC40QiEqJ9tRhDDfw=
Received: from BN6PR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:405:4c::16) by MN2PR12MB4048.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Wed, 11 Dec
 2019 20:39:07 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::202) by BN6PR1201CA0006.outlook.office365.com
 (2603:10b6:405:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Wed, 11 Dec 2019 20:39:07 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 11 Dec 2019 20:39:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 14:39:05 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 14:39:05 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 11 Dec 2019 14:39:05 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RESEND PATCH 1/5] drm/amdgpu: reverts commit
 b01245ff54db66073b104ac9d9fbefb7b264b36d.
Date: Wed, 11 Dec 2019 15:38:48 -0500
Message-ID: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(428003)(189003)(199004)(7696005)(8676002)(54906003)(70586007)(70206006)(498600001)(110136005)(2906002)(8936002)(81166006)(5660300002)(26005)(36756003)(336012)(6666004)(44832011)(356004)(2616005)(4326008)(86362001)(186003)(426003)(81156014)(450100002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4048; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a0c617-bf4f-40f0-2458-08d77e7a2afb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4048FE3367E8B49AD351F78DEA5A0@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlDw6DoZxiF5M21DepCqaQlS0bB6pChwd+LLs9buErNCAWdYv4sKOwh2E18OSLMpt/9b6EWjKmAULSxZKVO5Z+bgm1IzPcfKy5tzC78A9/k/lfixD3IqPMkzgLaE+3Ozx94FCt477ZS4zDvEq9vuCui+eK276pcmb/rbuxGTxcG5SLajbRjzIXicmJiWas778OjYJBs9KJrmIBTZpNrkPhQeTEEe2mvXy64OZ2LCs8x0iRid0FaEiiDM/ov9bCDTw80AmY7ywGdJQ25nhj2uxWSwdEJbXvMl0CVIjrXEVrZ18G40/4k/sYSN3cga3zl+frkCYe8Ha9Nly5ZhIVDLm6GwT4DUNqDbnGTWO2+oT6xnHgCTCsX94836/T7FT2l475cYsyCZ9SCE6bDgsv8EvntZ3TUQ8G+GhAbZm8pJRXxMDGrw0roHE++hFjpJ6g/u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 20:39:06.6812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a0c617-bf4f-40f0-2458-08d77e7a2afb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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
