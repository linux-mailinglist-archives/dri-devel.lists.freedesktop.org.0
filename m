Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F229338633
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 07:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762C06F42D;
	Fri, 12 Mar 2021 06:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9CC6F42D;
 Fri, 12 Mar 2021 06:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiCKFZYKrdi32vb1YWTzB7l0wQCnMW58/RdsTflhMx4TwRXrF9vciFOXZLrYiH9mxmL37fX2w4RWq7T6Lv0CvAOYAthhMd47mNATR5LQRgFK2XND/SqFOxDZTt7h87mS1lpl99ZmzR6HSt9Hl0qK4gP43EgoSMQZf6b3okQ8ATaMgM1lVAPwkzFhi52dvFwdpXtXyowdcp4ETSzs2ODerKaAPFcrDty6xjR1kCjMuqaOWs8wlwYTPzqJy6VbbeCe+wnYaQhMNngw2TW6g1BAWzjxQLaGpYwejzuwIZ81vvUJcV7JAwE+WYilRAhQ9iAOoTsOhOEf8XQShTkpuU6rLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xssKLqjlYQp/hEqdHZOnsRlQ/K0Wo1grLxSkd/Jy8ws=;
 b=Gy9ceJQA6WJX+C0Yxh95j4cz1sgHNN7fLIHhj35ftDJ/I3Fv+to5NdUz6NPUiQhCdAxbnAdkx1cwVFipYy4unNjdSQVrqccaU5UTuO2T0wDD8xEGZJl1NMPhP1eQHRmDXZzZTYg3UhQE5FWMlAuxd4dQxWipyrPr1ZZocDdpcjQt04Ja2H/53aJ7i+E4DnbfTFq5l+EurlGh+B5NA8BOZefFOpn7SZv72wR2XnXxP3gfViFw6H7UgIkCruDIdZdVykSHAI0zDDG0dnVg7j/eg050vdgNIpqJCu60kejYywh2BW8SrXhjXXCDLzdnR3wiwIwRge0NOh5J0EBD3/qDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xssKLqjlYQp/hEqdHZOnsRlQ/K0Wo1grLxSkd/Jy8ws=;
 b=jqmz9XzaOKGHhfzqI8tcn04Lg2kouFaRKQYvOAezwpv1oPG/7nBgb56nOJJwKBIKjCDQmSzsEf6Fdf5xOF0RRzX5ZKQuO9xjoVA2LAahmLIhk61j9rQ4KnpJqzv0vkEd5TYFv7R+Zp3yw1Z6DO/29IoSHovDnG+5hkrBJhJz5TM=
Received: from DM5PR16CA0015.namprd16.prod.outlook.com (2603:10b6:3:c0::25) by
 DM6PR12MB3500.namprd12.prod.outlook.com (2603:10b6:5:11d::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Fri, 12 Mar 2021 06:50:31 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::8d) by DM5PR16CA0015.outlook.office365.com
 (2603:10b6:3:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 06:50:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB01.amd.com;
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 06:50:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 00:50:30 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 00:50:30 -0600
Received: from ubuntuBBNew.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Fri, 12 Mar 2021 00:50:28 -0600
From: Jack Zhang <Jack.Zhang1@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <Christian.Koenig@amd.com>, <Andrey.Grodzovsky@amd.com>, <Monk.Liu@amd.com>,
 <Emily.Deng@amd.com>
Subject: [PATCH v2] drm/scheduler re-insert Bailing job to avoid memleak
Date: Fri, 12 Mar 2021 14:50:25 +0800
Message-ID: <20210312065025.1094934-1-Jack.Zhang1@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fbb0dce-872c-4d28-7251-08d8e52320e7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3500:
X-Microsoft-Antispam-PRVS: <DM6PR12MB350083DA05AED634530C5C89BB6F9@DM6PR12MB3500.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lh+QQeUXoWm7IRXRQmEQeycQkVSkUECN6Itnoy/Lj9bi2Tl1pgR+aCcgJU8RuVDDf4GXzxtplNvLv1zYldbld8Wipa9yLTjpZ2glXMKqacEiuKDH72oh3AWKto0U+HBWiUlrTdQf1qV8OIpKGSXOtAqcN5Gme5ihx0VcczlhoNm+5UTzoUjbpePX/mLhluOB0hMfbwPoHeYnxejhaemgZ22a1hJBik8A3hdz03TovVDBVyywrop/MDESyRL54LUh9LfEFABhq3R4XeNKKMop5TD1QpNij5PTXRqG+fgX8NGOVCmIizLqdp3JcD72FiJTqtfAZP+0c2BtDaES6WAIaS902WK/u0DFIKQH7nSQoDyKeq9jwXS5WmcZT/w1HuglkErIssXkjm90EMHuSrDInGyX7owI2dMfw2CiFCvM9kfvRyq4vyu9mnHoxahaMEZiWkgAzCJdBuwiUdopbRXaOoF/WrFGd2zdxvopEMsC5Z9/+VhD3PT6zZuybTJ+LKnQuhD8bLpimwFlZE7VACdYThQjQrspLFi8MspiBrLlg3qFHc7tu3FtdxlerfYIgW9+mbYmGp/tVYF7TE/XFfD8nV2kMV2kLDk1XDCSx0f3D4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966005)(7696005)(316002)(110136005)(47076004)(6666004)(426003)(336012)(2616005)(2906002)(450100002)(478600001)(86362001)(4326008)(70586007)(70206006)(36756003)(186003)(26005)(8936002)(8676002)(1076003)(356005)(82740400003)(6636002)(81166007)(5660300002)(82310400002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 06:50:31.0590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbb0dce-872c-4d28-7251-08d8e52320e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3500
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

re-insert Bailing jobs to avoid memory leak.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
 include/drm/gpu_scheduler.h                | 1 +
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 79b9cc73763f..86463b0f936e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 					job ? job->base.id : -1);
 
 		/* even we skipped this reset, still need to set the job to guilty */
-		if (job)
+		if (job) {
 			drm_sched_increase_karma(&job->base);
+			r = DRM_GPU_SCHED_STAT_BAILING;
+		}
 		goto skip_recovery;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 759b34799221..41390bdacd9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct amdgpu_task_info ti;
 	struct amdgpu_device *adev = ring->adev;
+	int ret;
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
@@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
-		amdgpu_device_gpu_recover(ring->adev, job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		ret = amdgpu_device_gpu_recover(ring->adev, job);
+		if (ret == DRM_GPU_SCHED_STAT_BAILING)
+			return DRM_GPU_SCHED_STAT_BAILING;
+		else
+			return DRM_GPU_SCHED_STAT_NOMINAL;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..c372f4a38736 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	/* Scheduler is already stopped, nothing to do. */
 	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	/* Schedule a reset if there's no reset in progress. */
 	if (!atomic_xchg(&pfdev->reset.pending, 1))
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 92d8de24d0a1..a44f621fb5c4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	int ret;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
@@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
-		job->sched->ops->timedout_job(job);
+		ret = job->sched->ops->timedout_job(job);
 
+		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
+			spin_lock(&sched->job_list_lock);
+			list_add(&job->node, &sched->ring_mirror_list);
+			spin_unlock(&sched->job_list_lock);
+		}
 		/*
 		 * Guilty job did complete and hence needs to be manually removed
 		 * See drm_sched_stop doc.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 4ea8606d91fe..8093ac2427ef 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_BAILING,
 };
 
 /**
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
