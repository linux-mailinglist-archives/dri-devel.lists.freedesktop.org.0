Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C147D923
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4550F10E36C;
	Wed, 22 Dec 2021 22:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDCB10E358;
 Wed, 22 Dec 2021 22:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AouePaZimgzTkaA8wMYX1HFeho7B69G5Jz5Ob5zJCXBlQWl756BbSazDINPmL4RYL8m6BFK4mRWvqYaxa5R43FeOZKcLWLlQH5Sy6JxUGT58jmx6qtL0fQPV1t07GXtN3IAjxz2uRB5z1LeAUyvreu00xRmGQBSMDRhAepckg//ASqRiCL0pxTmDK4AhWMm/xqHXviwW8qIMIm7uJYWXSrqb1kMOPz17oDRDpzdqXlVduS7hyUzt0NL5jFSi9+3cfSPF6P6YTo0HHjPwU6x77GK/3VsxoYP04ZV5Shau6epCDzuN8Nis4mVSYu62nOiG+1hcVv1oex6xNQGv6uGBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyA1VG+BInqqmQxbYmju2Jwx5aQAVEWxUBLEsgB3INo=;
 b=SdUv/YKozBpwqdRl1hXzxU9j44Xr1gMKYxnKCtZUMzOLfFt9SUVGPLT6Q3G49fdQoEVdzjdOSKSoMr6UQGSfA3keibD4EeG0u4qhtb3OJbcwSw8/L0h91GEMNzC7Mhc+tGsqSHxYjMEdH83EmSQh7cdV84HqYaKduywUiEX0wIH9VixEDSr2bEk1hNxbdbxuiM2wbzlN5QiGiZLEoJsbY57MobmQqVcXPCKHo639Bmah2Y5qTjbosYy+oLgJ6R2s3HvzEw2uhm4jQTU7V9YXhOGPY3+GjIwdts5ixXUHXA/c3/8W4GCQxOtZBCTyL4FRo5uqSg8gqTneNTNs7ICVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyA1VG+BInqqmQxbYmju2Jwx5aQAVEWxUBLEsgB3INo=;
 b=jVzN8dQwWpsdpTBsltQguy4VoDrJf86GuXo1C6GtBVdo+fOfKhyRpcUIFpZVLSJQrsD+Cb+q5AclukFCjidYPuD9wp+74n2/PBJc7MQ+uz6eIBeKIdOe3STLd4FnB6BSKlElVcQCEkkh+nQVmO0/S4j+wFK0Eo63qRmAC2mRIFA=
Received: from CO2PR04CA0203.namprd04.prod.outlook.com (2603:10b6:104:5::33)
 by DM6PR12MB4484.namprd12.prod.outlook.com (2603:10b6:5:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 22 Dec
 2021 22:05:58 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::28) by CO2PR04CA0203.outlook.office365.com
 (2603:10b6:104:5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Wed, 22 Dec 2021 22:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:05:57 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:05:56 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Date: Wed, 22 Dec 2021 17:05:02 -0500
Message-ID: <20211222220506.789133-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da855d0d-ea99-4bc5-05eb-08d9c5973b8a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4484:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4484B39D35F8055064E8C5CFEA7D9@DM6PR12MB4484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGNbYsEsZuBdRDgqzklT5reNyh/fIHxLTvH60CKX0IErdJzYIg4EDvMjNdBRYCNRqj1+8R61h6RbAIskoackOH4/g7xy62jwY/zJF5mNPCCmahgtZavJ2U5vs2g38lxCnCJInSfi6SDY5jlitWOxW+ZwYjE8SmcNa4FZMuNcQpxwwM+JhnIxVd4B70U4+GGNvHRaqhs01XrNVoibEdyYcuJBOtAw1l1QCMS2nhbpOla3OcVL/n1Niu2JKeMLKIH7RDNywHxagfNmlxT7DdneZJav7CZQleCy45Vx60+LBkA6RF6MP3MHktbiSin62OHkwD7/hKUAUZfs1o+4dMqr03NgcumE8R1LcRz458Q+EWtUi0ttR/0vUlT4UR+7JIa9FL7F3cYYjua6PwkrKC/pnt1h9dJ0nU78hEgjKUjBTxpaf+O1G+xMkmQzRkFk4oPVjtTEWNgUH0EkbkqH+i5tcyq+UE6kLLb6BxknMsOQ/Up40oWBfXo98MNYxmnqCHOIb/dc+y7Ze70XxKEaRrWUcU0sVqBB9n4QtetWeRx9JkE/lFS91Ulo25hM2VNHj/vzT52NxHmmK1jqk6s9+BTAs07NdxmCmz+JUFbQuPAmdcBh7jtwvIuFpTqRMRmDrOOEivYM4yODAWiln7f/TEH8DH27elvFiLiHrH9gFyOzyB6Ren/9XAA/regOaHZPkR9p3DSVTt3+KtMPhABkx3MQytaUON1o7uzIajr1STA+NKVnWStMyr4HNWAw2agVN0waCGvsk2p08ZL2hELL1MBmDW2Il02wykCqOAnE/hh0bOw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(47076005)(54906003)(6666004)(8676002)(110136005)(82310400004)(2906002)(40460700001)(36860700001)(316002)(86362001)(2616005)(44832011)(508600001)(81166007)(70206006)(4326008)(1076003)(5660300002)(7696005)(16526019)(426003)(70586007)(336012)(186003)(8936002)(36756003)(356005)(26005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:05:57.7708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da855d0d-ea99-4bc5-05eb-08d9c5973b8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4484
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use reset domain wq also for non TDR gpu recovery trigers
such as sysfs and RAS. We must serialize all possible
GPU recoveries to gurantee no concurrency there.
For TDR call the original recovery function directly since
it's already executed from within the wq. For others just
use a wrapper to qeueue work and wait on it to finish.

v2: Rename to amdgpu_recover_work_struct

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index b5ff76aae7e0..8e96b9a14452 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev);
 bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
 int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			      struct amdgpu_job* job);
+int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
+			      struct amdgpu_job *job);
 void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
 int amdgpu_device_pci_reset(struct amdgpu_device *adev);
 bool amdgpu_device_need_post(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7c063fd37389..258ec3c0b2af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
  * Returns 0 for success or an error on failure.
  */
 
-int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
+int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 			      struct amdgpu_job *job)
 {
 	struct list_head device_list, *device_list_handle =  NULL;
@@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	return r;
 }
 
+struct amdgpu_recover_work_struct {
+	struct work_struct base;
+	struct amdgpu_device *adev;
+	struct amdgpu_job *job;
+	int ret;
+};
+
+static void amdgpu_device_queue_gpu_recover_work(struct work_struct *work)
+{
+	struct amdgpu_recover_work_struct *recover_work = container_of(work, struct amdgpu_recover_work_struct, base);
+
+	recover_work->ret = amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
+}
+/*
+ * Serialize gpu recover into reset domain single threaded wq
+ */
+int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
+				    struct amdgpu_job *job)
+{
+	struct amdgpu_recover_work_struct work = {.adev = adev, .job = job};
+
+	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
+
+	if (!queue_work(adev->reset_domain.wq, &work.base))
+		return -EAGAIN;
+
+	flush_work(&work.base);
+
+	return work.ret;
+}
+
 /**
  * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index bfc47bea23db..38c9fd7b7ad4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
-		amdgpu_device_gpu_recover(ring->adev, job);
+		amdgpu_device_gpu_recover_imp(ring->adev, job);
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
-- 
2.25.1

