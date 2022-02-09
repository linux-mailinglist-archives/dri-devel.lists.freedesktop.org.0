Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A974AE5EB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E6710E584;
	Wed,  9 Feb 2022 00:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8782F10E4D9;
 Wed,  9 Feb 2022 00:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6Zc3Rc6DaJ/ckSlUkRfbI9rkmyIjzBWS0/YhaJRFmB+fjpBF49esU6X9MnIlphpsN/Ibzq6XWY0ulU2Bl5cP8gitwGCT7Pk58aZpyx2lw5QmY0t1VJbXW7yqTTwuTcIIx2B1RQpxNNXCVtGR9fuPEnWo/amp+9V8LbnqfKx7QvHlVnePbd2d1PE7Ou2DBJPC56pi8g3cpyI46nlSsxqxhZkiDFZ0GG4de8A/RtwCzuSTAfN5Sqa6FdMz6VUAeb7YOwjms6FzB04YUHZe9Y+5wuWI8ZKsyhVud8VHeBOuJX6WsEJPHQn+3x/4sdflXfkpwITqKG0IW/fpLh8Bq+MFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3P27UBIGKASGLjBVZZ/j0Cxj3M/atwBK6bk7amh+J8=;
 b=efFYIY5ZlDSCfkjP9rvvgVZs+0J++0MhFZhngWiYTlOf7XqRNWHrIi8C6/QJkED5va6Y//7bCneS/Wa7YJ8SsaXD0zpN2DWvc66MpP+wTpHXrSdPBSYRuca6c+7bcmaBMkLRNF1W/IR/BFAV65FXdr1hFOzHGB3DnZGMXBxwNADkLLto+lxVwOPFUWacISxpHJtrd3XOoo64ymmdV6DgucYHhE432VDGCWmeZqEfFxNdGboZcmWWs6BQx8zWw/Vt18/TrGpjgM2aZ63oziA9GYhz1YvAQuFZ8E6Ib1hmwP11h+GYhLNaMEELl5V+DXc1T0akjg2JYSA2x1Sx/I2vQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3P27UBIGKASGLjBVZZ/j0Cxj3M/atwBK6bk7amh+J8=;
 b=ebbFJGXVq4fMGDXLjg8umdZidTIwztFQHpVEeqsq5B+zuj8zo2rTbdgKRKpv0eGKOOhaWJu7SfMojF7xt2JTZMpgW4Wtbd1WkC9xx5bE1KzpQ3G5kY2YHRSPo+m0Imw2BCYYZYKVa/QSEFRetjhcsWXubssLs0e/9kUzNSE9GtM=
Received: from CO2PR04CA0072.namprd04.prod.outlook.com (2603:10b6:102:1::40)
 by CH0PR12MB5268.namprd12.prod.outlook.com (2603:10b6:610:d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 00:23:50 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::9c) by CO2PR04CA0072.outlook.office365.com
 (2603:10b6:102:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:49 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:47 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 04/11] drm/amd/virt: For SRIOV send GPU reset directly to TDR
 queue.
Date: Tue, 8 Feb 2022 19:23:13 -0500
Message-ID: <20220209002320.6077-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c6a49a5-78fc-451a-3fbd-08d9eb6271e2
X-MS-TrafficTypeDiagnostic: CH0PR12MB5268:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB52686951F93340BDF62893ECEA2E9@CH0PR12MB5268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I0zCH7WqmLSQns2yV2f1HfFQPPaL1demk34V5n6dHzrDXwnXbjTuk3o4dHMlL01V00F220rOGQToptaKXsO/CWBDb1kwWN5Nd6CD5lYghbvh3/NSwei6opQiB6/f6ZNlMOXimcAyFy97dlTF8TFwjZIq4Wj9x297nsAPC5MeALXAAf9OGrPyRT3xU4+nPBbQn2gfblXn/rJfZl4N273kGVpD+wj/S0REjq3qmWZcyGyeOYoUYySBqQ1atmuqI5AoZopCXwSBAoZ1fPGUTZBkHDfAyFH26qOmcKZKHxhpS1m7zJAe82av5kAfYGH0E+5YVeXYOaBhCTIRTsCXxwwuVXjODwFIK8Dbmh3SscDehE9UPW1NfVgmwrueamGfIn/uUwd02VIO55hwDZsHlECw/S+GfS68NyuQ77rVYqT//sYvAW7AaUznhH3sayTHFer/CXIHBze7HGs+Qj384K9+4VAHG3AhgrKUnOMVi6ohE3z/fQIyTRIZLC5R6+vIQANFswV00HaI9tf8xyVIMJ3XGY86INAJ4VnChKVCPdIsV3OT/tF2/4OZ+NzRihi1wRRz0AFF1OmpbMJF4fZKD7mernL0r8jwEw+ZCCOvb9cj2XVgQMSlpFILlvt3+xKFYeceUtHMAPAVkNl3IZ0mdfl84wy1RroFCL63n4ghSGkmE/YptupmP1f0S+tt0TDRhSddOBa/V/Uusca7WYS+SUlm4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6666004)(44832011)(36756003)(5660300002)(83380400001)(8676002)(40460700003)(4326008)(1076003)(7696005)(47076005)(186003)(2906002)(86362001)(81166007)(2616005)(356005)(16526019)(426003)(508600001)(336012)(70586007)(110136005)(316002)(70206006)(54906003)(8936002)(26005)(36860700001)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:49.7736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6a49a5-78fc-451a-3fbd-08d9eb6271e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5268
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com, Liu Shaoyun <Shaoyun.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to to trigger another work queue inside the work queue.

v3:

Problem:
Extra reset caused by host side FLR notification
following guest side triggered reset.
Fix: Preven qeuing flr_work from mailbox irq if guest
already executing a reset.

Suggested-by: Liu Shaoyun <Shaoyun.Liu@amd.com>
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 9 ++++++---
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 9 ++++++---
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 9 ++++++---
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 56da5ab82987..5869d51d8bee 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -282,7 +282,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
 		adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_ai_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -307,8 +307,11 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 	switch (event) {
 		case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 		break;
 		case IDH_QUERY_ALIVE:
 			xgpu_ai_mailbox_send_ack(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 477d0dde19c5..5728a6401d73 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -309,7 +309,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 		adev->gfx_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->compute_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->video_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_nv_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -337,8 +337,11 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 	switch (event) {
 	case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 		break;
 		/* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ can ignore
 		 * it byfar since that polling thread will handle it,
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index aef9d059ae52..02290febfcf4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -521,7 +521,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
 
 	/* Trigger recovery due to world switch failure */
 	if (amdgpu_device_should_recover_gpu(adev))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_vi_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -550,8 +550,11 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
 		r = xgpu_vi_mailbox_rcv_msg(adev, IDH_FLR_NOTIFICATION);
 
 		/* only handle FLR_NOTIFY now */
-		if (!r)
-			schedule_work(&adev->virt.flr_work);
+		if (!r && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 	}
 
 	return 0;
-- 
2.25.1

