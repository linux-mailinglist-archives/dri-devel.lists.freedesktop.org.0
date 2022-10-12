Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AAB5FC653
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815C710E4F9;
	Wed, 12 Oct 2022 13:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C7910E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 13:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOrTKnlC6Ysz90vTljg+Dw/1kNbkSA47qr6uxuTaK9aa8G0yOAhCju+luThP/TPhDf1UkKKgioR2AMuKuJglLmdy15Xv6G1pdhUlXPzbgbHMpRS2RNGHZnAA1t2Xlsh+goGJC00kBZNkjtNY6vNXJsQH/JpxYBzguWnfjqg3jiX7Ott7V+qW1bliOmXAwsrGW6sifyxYPUwRKGVH3FAu8/510X+Gxyge9S3gQYc3bGnQjmUBfuVfUp+uLzO6UihYo1DSjptXbTbUgP+Ya668e7bwY6UpRxtZg/tB6mfqaYbU/HBBAk+bSvUps41hUvoRvqTpBMBhiQE2I08w4PMlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wEDab7qHqzAJ6/Q++fysSh76DlXf3/D+WICRnB2suE=;
 b=kYZ0IU/elzoAGJ7f1CqLWUC7a/+9uihwUFF3UhujNxy05SO7CYbU6FwioXnAwGDNOk1xR3Eak70lJHpFSczHjYwPIILUmEE42tup/BzoZAsgaxARIaJfn+n1WyF4jEZX9A0CBdGGkD9E1Lc9iQGvbZG/qKk/iJsOdEavMeiaBBOr2B60/Q6C1qNMLDS8Oclfe90O7p/9TwW035HaB3YzzfeaqlzRnBMr+bdrtdXSz2rYEpADPPZl3PLnk6mi6P4I5PdqWXoHcYdfybfOOp5pPnFcQ+49cbeAlQ8bnLujDuiHJQ8GO4xl5KchgUViiaWyMXmFT+b3pBNawYfFP7u95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wEDab7qHqzAJ6/Q++fysSh76DlXf3/D+WICRnB2suE=;
 b=nWUO5XNOKJ3YyyU7wgQDPzQBRkD3XXXO2TTlmSZq5qsD9i5fpHAE7bDxMLBKdT//nn9AsZPtSxk9dlOyrpJ/OdZ2IzOVu5FdswwefYl1SeqrcdJqawMgOmIp0hiRXzK8MyjElwaUT4PWmHy5mMmSe/ghKKv/6nxIN+b7JuexGvc=
Received: from DM6PR06CA0032.namprd06.prod.outlook.com (2603:10b6:5:120::45)
 by DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 13:23:25 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::69) by DM6PR06CA0032.outlook.office365.com
 (2603:10b6:5:120::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 13:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Wed, 12 Oct 2022 13:23:25 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 12 Oct
 2022 08:22:53 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <steven.price@arm.com>
Subject: [PATCH v2] drm/sched: Fix kernel NULL pointer dereference error
Date: Wed, 12 Oct 2022 18:52:00 +0530
Message-ID: <20221012132200.13011-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT024:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 1403e0a6-265b-4ea5-c32f-08daac54f1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQCSgCHaxIi80wXNrOdgIDQI+21Y0+B2EY6riggfBs+1IkLeMTyNuuCIXHX5NuMokzZQPgGNpAz5WL2Y28qNFk0SDRb2hjV35NjjSEOAR5v/+4Laf3PTqk/0AJwQL0pc0dugGI20LzXRDwLdUOoq30If/QXvPZ+cno6sHfC5FZB58dVv/TkGaS5kEw/vMVEI+UoY4SVmU8KLpyljdwOsSAzRUI9X59od7Se4tqG4/hL0UDrAKmOciBJscKJwQ+zMJuvu8X/JfL6dYahHMjg9729pv0K/t/4RY5yKUhKfqHpz3smx1A+Ll8xcMcCZzM+GZghXTeMOsCtR8iyQKxboehdGPzoHw5djItAtKxvXfjGrtQ3oXyTOyIIwLCXpmIxsvtQmh+Tnwk8l5tZZjxT+8OAh2xNhB0fk4mLyAWeo9WzIwGhvr1PxOPrpra9tmEuUy2omv+YgLQL2+tT0iqUR67VBLuGR5mWZPDdThgpf5Gh0iIdWYsfXg9Qj6va0D3mu3GSz1bBXTpMuIK/OL7CvUQXC2auoQCvy21gSYYczWisocSoW7RwGkwHfvTB8J2x4HsuakEXtDjy8n/YcJKxhjtkqyD6GBERrUlqvkhEJ7uJV3n8GIfseWp49swPaabBLCPEUKP3lly+5FDYJI8lQk6TPkJz8cxCDbKHffhlsclep0VjiwhsAJbvKso9nllIonNjvtqw7MNAbtY2SvQL9kv11MNPK8mMTtTGF6HaFKLEVeoz0J3MgUwOG9Lki42KdWWE47zxJ8FBe+X0cIztkd21PcwUC3gx44o759CmgAzuhqKQtqhIbTRg90zklYBXRwtk36zRjAh4uD68YjJc5t8hsS6pYv1OzuDG8rBP+0kM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(5660300002)(41300700001)(316002)(4326008)(36756003)(36860700001)(7696005)(70206006)(70586007)(6666004)(8676002)(478600001)(2906002)(83380400001)(82310400005)(86362001)(40480700001)(82740400003)(26005)(336012)(16526019)(921005)(1076003)(40460700003)(110136005)(47076005)(2616005)(426003)(81166007)(356005)(186003)(8936002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:23:25.7492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1403e0a6-265b-4ea5-c32f-08daac54f1ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is purely a timing issue. Here, sometimes Job free
is happening before the job is done.
To fix this issue moving 'dma_fence_cb' callback from
job(struct drm_sched_job) to scheduler fence (struct drm_sched_fence).

BUG: kernel NULL pointer dereference, address: 0000000000000088
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.0.0-rc2-custom #1
 Arvind : [dma_fence_default_wait _START] timeout = -1
 Hardware name: AMD Dibbler/Dibbler, BIOS RDB1107CC 09/26/2018
 RIP: 0010:drm_sched_job_done.isra.0+0x11/0x140 [gpu_sched]
 Code: 8b fe ff ff be 03 00 00 00 e8 7b da b7 e3 e9 d4 fe ff ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 <48> 8b 9f 88 00 00 00 f0 ff 8b f0 00 00 00 48 8b 83 80 01 00 00 f0
 RSP: 0018:ffffb1b1801d4d38 EFLAGS: 00010087
 RAX: ffffffffc0aa48b0 RBX: ffffb1b1801d4d70 RCX: 0000000000000018
 RDX: 000036c70afb7c1d RSI: ffff8a45ca413c60 RDI: 0000000000000000
 RBP: ffffb1b1801d4d50 R08: 00000000000000b5 R09: 0000000000000000
 R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
 R13: ffffb1b1801d4d70 R14: ffff8a45c4160000 R15: ffff8a45c416a708
 FS:  0000000000000000(0000) GS:ffff8a48a0a80000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000088 CR3: 000000014ad50000 CR4: 00000000003506e0
 Call Trace:
  <IRQ>
  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
  dma_fence_signal_timestamp_locked+0x7e/0x110
  dma_fence_signal+0x31/0x60
  amdgpu_fence_process+0xc4/0x140 [amdgpu]
  gfx_v9_0_eop_irq+0x9d/0xd0 [amdgpu]
  amdgpu_irq_dispatch+0xb7/0x210 [amdgpu]
  amdgpu_ih_process+0x86/0x100 [amdgpu]
  amdgpu_irq_handler+0x24/0x60 [amdgpu]
  __handle_irq_event_percpu+0x4b/0x190
  handle_irq_event_percpu+0x15/0x50
  handle_irq_event+0x39/0x60
  handle_edge_irq+0xaf/0x210
  __common_interrupt+0x6e/0x110
  common_interrupt+0xc1/0xe0
  </IRQ>
  <TASK>

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v2: Moving 'dma_fence_cb' callback from
job(struct drm_sched_job) to scheduler fence(struct drm_sched_fence)
instead of adding NULL check for s_fence.

---
 drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++------------
 include/drm/gpu_scheduler.h            |  6 ++++--
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4cc59bae38dd..62d8eca05b92 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -253,13 +253,12 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 
 /**
  * drm_sched_job_done - complete a job
- * @s_job: pointer to the job which is done
+ * @s_fence: pointer to the fence of a done job
  *
  * Finish the job's fence and wake up the worker thread.
  */
-static void drm_sched_job_done(struct drm_sched_job *s_job)
+static void drm_sched_job_done(struct drm_sched_fence *s_fence)
 {
-	struct drm_sched_fence *s_fence = s_job->s_fence;
 	struct drm_gpu_scheduler *sched = s_fence->sched;
 
 	atomic_dec(&sched->hw_rq_count);
@@ -280,9 +279,9 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
  */
 static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 {
-	struct drm_sched_job *s_job = container_of(cb, struct drm_sched_job, cb);
+	struct drm_sched_fence *s_fence = container_of(cb, struct drm_sched_fence, cb);
 
-	drm_sched_job_done(s_job);
+	drm_sched_job_done(s_fence);
 }
 
 /**
@@ -506,7 +505,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 					 list) {
 		if (s_job->s_fence->parent &&
 		    dma_fence_remove_callback(s_job->s_fence->parent,
-					      &s_job->cb)) {
+					      &s_job->s_fence->cb)) {
 			dma_fence_put(s_job->s_fence->parent);
 			s_job->s_fence->parent = NULL;
 			atomic_dec(&sched->hw_rq_count);
@@ -576,15 +575,15 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			continue;
 
 		if (fence) {
-			r = dma_fence_add_callback(fence, &s_job->cb,
+			r = dma_fence_add_callback(fence, &s_job->s_fence->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-				drm_sched_job_done(s_job);
+				drm_sched_job_done(s_job->s_fence);
 			else if (r)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
-			drm_sched_job_done(s_job);
+			drm_sched_job_done(s_job->s_fence);
 	}
 
 	if (full_recovery) {
@@ -1053,10 +1052,10 @@ static int drm_sched_main(void *param)
 			/* Drop for original kref_init of the fence */
 			dma_fence_put(fence);
 
-			r = dma_fence_add_callback(fence, &sched_job->cb,
+			r = dma_fence_add_callback(fence, &s_fence->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-				drm_sched_job_done(sched_job);
+				drm_sched_job_done(s_fence);
 			else if (r)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
@@ -1064,7 +1063,7 @@ static int drm_sched_main(void *param)
 			if (IS_ERR(fence))
 				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
 
-			drm_sched_job_done(sched_job);
+			drm_sched_job_done(s_fence);
 		}
 
 		wake_up(&sched->job_scheduled);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1f7d9dd1a444..9a96d49dfd75 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -281,6 +281,10 @@ struct drm_sched_fence {
          * @owner: job owner for debugging
          */
 	void				*owner;
+	/**
+	 * @cb: callback
+	 */
+	struct dma_fence_cb cb;
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
@@ -300,7 +304,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  *         be scheduled further.
  * @s_priority: the priority of the job.
  * @entity: the entity to which this job belongs.
- * @cb: the callback for the parent fence in s_fence.
  *
  * A job is created by the driver using drm_sched_job_init(), and
  * should call drm_sched_entity_push_job() once it wants the scheduler
@@ -325,7 +328,6 @@ struct drm_sched_job {
 	atomic_t			karma;
 	enum drm_sched_priority		s_priority;
 	struct drm_sched_entity         *entity;
-	struct dma_fence_cb		cb;
 	/**
 	 * @dependencies:
 	 *
-- 
2.25.1

