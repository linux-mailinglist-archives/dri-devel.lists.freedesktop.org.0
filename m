Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7407147E7A5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 19:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5542310E3D1;
	Thu, 23 Dec 2021 18:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2CA10E3CD;
 Thu, 23 Dec 2021 18:30:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6cyg21A6w1dZNJwFOdV3/fQ3+9pTcqmIxWI8CSDAGwEsNGFka/FloR9y5Q83Smfb0gGvsklOr8iOTVbRCinMaL8pbJaJUYdqwlRhndMrC3uUmJCbCAa/ZorMD5iV14ag05JURdjyltiSVrFwNatTYJ8n1fIo62XpWnaV/1yY9Qcs2gUssKu+l/iqxg8vg9DpA0IZK36mN5dSBN++rnlaLDI9YZtXohcr77XaRIw70Ccvmbw7/JrSUlOOfN9QHSJzbmV7xfxT0grSzLP8FUnrtSY51JMixxC0imzLw8Q+4i2/wQTdZINXbRXDE7SsnfWrxrpYNcKu/EpjAB24iX8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq2jRNRBrpwYU8ec+80aMIQEmOil0YelJUm2JCFwr98=;
 b=C4A01qjqDQ4uLn4SDvnz2E3ZnzV6iFX1NRHmBOknBknQSk1+4Gv1dPpm9E0S94QnV6xwPVu6WmpX3e3VNCQBJ4QyHMERcIWqiqzshaXtgxWBaOBARatFx/DBGk7ogjprqaJ42pc15uyBK2+6rDDiPvRy84p048S6FTOs12pBqo8vz5DUhUo7pk0KS43ehfjx4gnwIs/86ZJbauyQhDuXddiqd5X8iwXOIW5phgpanSBaYJjd2u6HsLwvmi0Eed/Bx0PlvIL15rwP2oPkVMMmtpBLc/02ef2DPgRPC7cjKuqjaAE6U6HHqZLj1WXYjB8QyFXJfzVqGwViHHWLkpeMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq2jRNRBrpwYU8ec+80aMIQEmOil0YelJUm2JCFwr98=;
 b=tKpZPnZDFt0/6P+jZhWK4tKvXfxHNCPYaQPSDmYr6NKlFIbWbHk351GSKS1Jn4Za91A3mwfjkom3nXCO5btvxSIkjWtfO3jOX9TjfEmvoHzsrfdUK5UDSN7jQXVeSLlDLE2Fb3kOKp+csDa41ltNu8CYxImuBaGffvfcroXRLj4=
Received: from MW4PR04CA0162.namprd04.prod.outlook.com (2603:10b6:303:85::17)
 by BN6PR12MB1873.namprd12.prod.outlook.com (2603:10b6:404:102::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 18:30:00 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::58) by MW4PR04CA0162.outlook.office365.com
 (2603:10b6:303:85::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17 via Frontend
 Transport; Thu, 23 Dec 2021 18:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 18:30:00 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 12:29:58 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 5/8] drm/amd/virt: For SRIOV send GPU reset directly to TDR
 queue.
Date: Thu, 23 Dec 2021 13:29:41 -0500
Message-ID: <20211223182941.888367-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222221400.790842-1-andrey.grodzovsky@amd.com>
References: <20211222221400.790842-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9ab07d-b525-4f47-7388-08d9c6423a97
X-MS-TrafficTypeDiagnostic: BN6PR12MB1873:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB18737B6CBFF5CF9EE8B5BD98EA7E9@BN6PR12MB1873.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhIOf2Ah0LSFn/MZcLkVeUrVaH/cCgj215TZc1CdMXkBTPdYlPrOLY2IUn+QPWzCt57kaBKQjcjE0EdInekw72DD+neeSBr3CRZazzZzvwtEYBjomjnhBim3cHilSvRToNZdKXT++iRpVi+kGgDEIKUQCIeaJoqUfTVqufq+IKB1vGZ3mlNNoVsAJM37zdoK0GCz8MdWht21hrh6Y4OGUqENPDYgfAKbbjXJRclwkQrSM32jBoZ5zxpm7NM728Lq1pqU5otTSrZg46VlugjMdX5F8uJiSW9tjCzEUKXzAoDr6uXjHcc2eS9Dq0dukhFM4mc0AoO3ET5SyPloNgQBctypdIQfZxUQXrnjUpRv5ngOOmNdy4C3XLtTovzgiyx3HCmkTf/SkHygSgzVNwj5o8lF6/TsCzBVggAEASNbHmWOKXwDRJxR0gu1XfO3C7KdpXlawSyuvS1JGEx/WU37L7Lk6C2pYF0RHMLLvdvRorX3/bF09Dxn2+sP2/XvS629UTCRwbTSAwRpP8IygynP+WNWebx+G6et04H2JY0umXEPGWPnDkYGGS/vrqbS0skNB94b5HMslgsSug0UOg57GLOwoUB3hhemahCgY86P9nYwLiYEiGbekjIlX3LadNt1jqAAyJi7aCCd3X8rln9lZHXBcm183/h04SBf4V/x4waahMeGivBJmZrQmpoW+fKBF8oez9KkY5Ti8svfKMIgx/0T7adXZOShY+1UIcOxjjPFzXM9H2L9/VJ87U2WGDntqOk7L5pW2CSldGdE4YzprQ9tOJQpowA3KfuVhPk2hg0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(7696005)(110136005)(47076005)(70206006)(2616005)(70586007)(86362001)(54906003)(16526019)(36860700001)(186003)(336012)(8676002)(426003)(44832011)(81166007)(316002)(356005)(26005)(2906002)(82310400004)(6666004)(83380400001)(1076003)(8936002)(36756003)(508600001)(40460700001)(4326008)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 18:30:00.1062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9ab07d-b525-4f47-7388-08d9c6423a97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1873
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com, Liu
 Shaoyun <Shaoyun.Liu@amd.com>
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
index 23b066bcffb2..bdeb8e933bb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -276,7 +276,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
 		adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_ai_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -301,8 +301,11 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 	switch (event) {
 		case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __FUNCTION__ );
 		break;
 		case IDH_QUERY_ALIVE:
 			xgpu_ai_mailbox_send_ack(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index a35e6d87e537..dd8dc0f6028c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -308,7 +308,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 		adev->gfx_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->compute_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->video_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_nv_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -336,8 +336,11 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 	switch (event) {
 	case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __FUNCTION__ );
 		break;
 		/* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ can ignore
 		 * it byfar since that polling thread will handle it,
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index aef9d059ae52..c2afb72f97ac 100644
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
+				  __FUNCTION__ );
 	}
 
 	return 0;
-- 
2.25.1

