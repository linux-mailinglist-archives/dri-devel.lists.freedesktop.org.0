Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDFA47DC1C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B2410E156;
	Thu, 23 Dec 2021 00:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A670710E155;
 Thu, 23 Dec 2021 00:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCgIEOyLC/q7gtCQp/bsjtJs5DHm7xiVYkePVutPr4KG0xASAByXVfhgGoF8Ycplt4NRLaf49cXKI02zQGfE9cy8L818uePwI9uSlEJzh/gHOjJDhr/30hbGukOCvWGHEhFi+AIKxdXUHKobXHbesQWk0VKGChwxPuD+8rFjufVJO14vhkESx5VqNLTyWDZdo4/Qnx6BPythEM3kBqMTN0cJSR9LzJvbhWyePcTG4xUXtUHBJZQZ+D2WjGlfNW8R9kFfhsvpeH+mYo2SChI5jF45XgdmXqF2Oh2frxuephPgLmYNfzf7RLZU+on0++Clq80bNLgRf8Kq5NpUVjolxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf4u5PXWRHZuyRGbEKtrz67/HmAZRHH64rKG/om1584=;
 b=G2ZW/gjq3mNLGufkjrDfJRb8Ur+1Ras7vM8fwKAiO9zp2jVm2OALAA7ff1QZDClDgIukVJkf9p7IATi/Up49Cier8RrvD9J7x09xqaXc57dc+V9jlxBHrH9uKHQbCAhCag3KT/2e/Z3UQyoj5cM+nmwLKBM8gW54lnjg4FNBFnSUOCD4bRFslFWtt2sLwqbL3kiefBTMlFOCZEb8GR6hLPjQGRGv2oxwOncxtQRYRbTogWl0FXdn1uDmBKowEXN9Li8/RH0sQwFq4z3UNcxFv3PgRjGZfVlCLLUyMvOkXLKcwBzym2qAhVpSt58P7sD6A9rcG3KB8Ug1785pO8dPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf4u5PXWRHZuyRGbEKtrz67/HmAZRHH64rKG/om1584=;
 b=q7wKyGDY4J1U1tdBrMz67a1kCi1acJfQqVZ7ZU51veudW0N/tUzxuhwFtD/5axtytmtHI+BVXWQm7WNBnf3XePZ8DY4YzUEyx75iwOfEZ/x/Dm4AXRs87eGNzssjVAUXeikU7c5PPIaCja2fggCYcebR2f+vS7rvQ83jkzdwTWU=
Received: from BN0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:408:e8::13)
 by MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 00:37:30 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::c0) by BN0PR04CA0038.outlook.office365.com
 (2603:10b6:408:e8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:30 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:29 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 08/24] drm/amdkfd: CRIU Implement KFD unpause operation
Date: Wed, 22 Dec 2021 19:36:55 -0500
Message-ID: <20211223003711.13064-9-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bbee66a-6251-4f23-70c2-08d9c5ac6700
X-MS-TrafficTypeDiagnostic: MN2PR12MB4582:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4582472EACBE4E7D54F1DC8DFE7E9@MN2PR12MB4582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgKX2NAHfcUyPM7miaoTL1/yYJFuLvNVMb+KzYU5SYP/ju6DfdXJWgm/9Q17HDLH5ZwntJPXYhL388p70APhbkwudOmA8ylsKc53B98uaDvnepIZfEy46E33Bm8yKUjMG6O3bs4SQco48/6tZI7wZe2kByO+0w2l59uQq9wnIVGEBS2KzjcFL3hmYrc3Ld0eFkZOotfVkSaCk73DCeoK5Ea9zor+zQ/2eRp6Od+f7r4ovu3jhaWxea1oI711/6VHqYDADje2lo7dMJe+bhr4qrupGbk2s3fCiwIBIX4rADlNeoVCkbND8TXenBKlHA3nsbOIC5W1mLaLcckKlxBJbXNcubi9f9vLfQvv6XT+aaT9h164yqDCiNGeDupIVUXGICSD2KhZ0xmbEXnLdvcF2HyHQh+v91viXur2u5Uu/p/88aO7D3dsqJmzMViuJzd5dwccEykgN5NZrhbWMVuPt/HaaZdYuL5oBWIRVGNvu6+f+g5cBuSg7MtpwLAuxO7AwuokdzNqCaZnjAeuSCkoKkVsrkcSdQYjecExJzARejpCftwwYYTvpWRCKFuZWiCFfrt4z/++YOjDizm6xNNQRXY3K4GuHBJNxbgF/8A2uqubrG4h3E5CgDZc/gK17rjJaV71YHAuu+nR0yTtut8CLootsfysQZuY2GEzWTYqNAR/10KEAEme8J34ro6oBvVBEWwQGHaIrrT7Du9mzP9EoSaV93lS7NlQvUmdehKGPseutJ/Bqh1ryWwL+p0OH0bx1GjsAnvnTppHNqbsZOdoTHObFlyN8a2YewV7HU9R7as=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(36860700001)(70586007)(8676002)(8936002)(26005)(83380400001)(70206006)(47076005)(1076003)(2906002)(54906003)(7696005)(36756003)(86362001)(316002)(110136005)(4326008)(82310400004)(40460700001)(186003)(16526019)(2616005)(426003)(81166007)(508600001)(44832011)(5660300002)(6666004)(356005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:30.2295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbee66a-6251-4f23-70c2-08d9c5ac6700
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4582
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

Introducing UNPAUSE op. After CRIU amdgpu plugin performs a PROCESS_INFO
op the queues will be stay in an evicted state. Once the plugin is done
draining BO contents, it is safe to perform an UNPAUSE op for the queues
to resume.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 37 +++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  1 +
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 87b9f019e96e..db2bb302a8d4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2040,6 +2040,14 @@ static int criu_checkpoint(struct file *filep,
 		goto exit_unlock;
 	}
 
+	/* Confirm all process queues are evicted */
+	if (!p->queues_paused) {
+		pr_err("Cannot dump process when queues are not in evicted state\n");
+		/* CRIU plugin did not call op PROCESS_INFO before checkpointing */
+		ret = -EINVAL;
+		goto exit_unlock;
+	}
+
 	criu_get_process_object_info(p, &num_bos, &priv_size);
 
 	if (num_bos != args->num_bos ||
@@ -2382,7 +2390,24 @@ static int criu_unpause(struct file *filep,
 			struct kfd_process *p,
 			struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	int ret;
+
+	mutex_lock(&p->mutex);
+
+	if (!p->queues_paused) {
+		mutex_unlock(&p->mutex);
+		return -EINVAL;
+	}
+
+	ret = kfd_process_restore_queues(p);
+	if (ret)
+		pr_err("Failed to unpause queues ret:%d\n", ret);
+	else
+		p->queues_paused = false;
+
+	mutex_unlock(&p->mutex);
+
+	return ret;
 }
 
 static int criu_resume(struct file *filep,
@@ -2434,6 +2459,12 @@ static int criu_process_info(struct file *filep,
 		goto err_unlock;
 	}
 
+	ret = kfd_process_evict_queues(p);
+	if (ret)
+		goto err_unlock;
+
+	p->queues_paused = true;
+
 	args->pid = task_pid_nr_ns(p->lead_thread,
 					task_active_pid_ns(p->lead_thread));
 
@@ -2441,6 +2472,10 @@ static int criu_process_info(struct file *filep,
 
 	dev_dbg(kfd_device, "Num of bos:%u\n", args->num_bos);
 err_unlock:
+	if (ret) {
+		kfd_process_restore_queues(p);
+		p->queues_paused = false;
+	}
 	mutex_unlock(&p->mutex);
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index cd72541a8f4f..f3a9f3de34e4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -875,6 +875,9 @@ struct kfd_process {
 	struct svm_range_list svms;
 
 	bool xnack_enabled;
+
+	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
+	bool queues_paused;
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d2fcdc5e581f..e20fbb7ba9bb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1364,6 +1364,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	process->mm = thread->mm;
 	process->lead_thread = thread->group_leader;
 	process->n_pdds = 0;
+	process->queues_paused = false;
 	INIT_DELAYED_WORK(&process->eviction_work, evict_process_worker);
 	INIT_DELAYED_WORK(&process->restore_work, restore_process_worker);
 	process->last_restore_timestamp = get_jiffies_64();
-- 
2.17.1

