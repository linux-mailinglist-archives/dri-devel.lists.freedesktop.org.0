Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA9E601127
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 16:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387010E7DB;
	Mon, 17 Oct 2022 14:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C816D10E7A6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 14:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9SUpivJlrD3OsAWGDFpr2EV4vM/ahcYt6GWFHBeQ8KhMOCsu0+zSvcmAa7mrp15yzszURARVTCVrvOJjj+Tgas8XuYhC8Iq11ena4gyeLJVBLK5ZmXTKO+rj0Sr85UjtegalJC6Dri2yDK6xHOEQozxouJzoXF4FT2ROeIuV05aZIBNmLR7bB9AZVtRYFK7pFH0QupWD/PuZTF0MulNJXqVRc5UEvLvomrf7TvCVK7Xu3hi6I1/fQw4s3/Vldo0HtDETkdqxkR5DWWDO6VxGHotpICOh9U2rs3FaGYveVIsbmMAdL7o3u0n778EnixTg8Awn9r6APtxMoCMUNo1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIpHjgteY66lASbjM9lptHFAYmuSsEEa3G5EgPNB0Bg=;
 b=ISGG3SlgXZxTb+t2oxkuQtANtJjYJLWXuVXrm/NR5wj4frtuHlDjmZHf9xjZ/qyUawwJAt+LIgWc313wT/rpmvHgHjTM6TtsKaxrhYKGS7qXRYwMye30ZNLjIUcZ0QXG7Gs2Sa/xbpX6Is5nuqXnwZ1i1KGa/NMF3OwFgVPinlxPzgX4cp6Rtgoqix5gUunBabGglKnKBaPb16dtTS7oJ+Na4duFbOPKVzpJg6Z4jobFsw3CFq4vkEQ4fLcB3h+4TuyT2vtexfuibq2uYhJWV6SGMyRFgs//HHjk784a2BLNFkfzl8agSC41AylJNXnSSwqoZGnqQvAU4CO9HDz1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIpHjgteY66lASbjM9lptHFAYmuSsEEa3G5EgPNB0Bg=;
 b=s+18xf3iM3vMIa7AAQpmH9972Wr+VNv64XmRO0xsiwS3siC2p4Wgkb4K7PqDwyL7LULcca/okxESZ0YW8a81imYG2JsMmNsEDEpiK86aS87qBUx3XcadSUuENdiHVfa0+pgJeFUyVFcNAwU6X+nkvQ5MsmrDQpQ/LVwiNWW0A7s=
Received: from BN9PR03CA0217.namprd03.prod.outlook.com (2603:10b6:408:f8::12)
 by MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 14:30:48 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::24) by BN9PR03CA0217.outlook.office365.com
 (2603:10b6:408:f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 14:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 14:30:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 09:30:44 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <steven.price@arm.com>
Subject: [PATCH v3] drm/sched: Fix kernel NULL pointer dereference error
Date: Mon, 17 Oct 2022 20:00:06 +0530
Message-ID: <20221017143006.2419-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT020:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: e29cba0d-cea2-4da8-fa97-08dab04c2f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7JstLCWQn5nlis2vdsm1YkC0QVKaXlGRE12JXfGc9VEULXUWxcRm7nZNwq8iLRZMN27V+zqQeHD30m5c7OgMyShs2z8v+tqa7JMH4ezO9Z3nEZoL+74qbdq2vfmpnO5+ChaymAsjHrTchgwFkmLUeLnNwtadrLw5DAKSZnMA677s0Y19XBX2cjoUSRxU+jg4F+jFe230ZtH3wFrXyjURdrhxzR1HqAoJQ8+2p4g5hOAHrlsw3OlmvWFcsUddl9tVtNkYEFpoor6LYl679ipdnIPJIfnMMWIYZVXGsExqe6nkLQcmw6JpCbuUmib2LAARdxRHj8QGm/mtm2up3rdyRDc19O1LHQMHdEM0QBQA9jg5NEHTRpkI/egY3RGDoYXDtkBKElrFTUMVOzCXhS/5KnLObXvrDeqGn9b9TRnYzTgqy4dQgKCoiNBYgzjpnomwOh/zMInQsqKk5Kt2qB7o3lcnHmWF6+MUvmgqSIwsF3otCPLjFeN7oTKEQNs0slro41pEW74SN6zqdmYy/6ISxkXTE6GSgBlizvwqvLuanqetAGZC+acPxL+cdhE5EIOVz3S3kIx7ChlYcgQNfUIgwtGsRuPMvQboFKC4AnZUMDCLiIDSs0lFnQ34SrVWeiX7WirqH4dgpY0wywSur8ZfLMUvlsT1ZiqyXTNZyLaihsekJfpBih1m0qHpLx4H18dKScE7sl7RqKwNSTBgsOQT6qSh2HRTVm/7Eyz7rXjwYeRl1/Tlgn9HCLWJ2nM1BW6AKupv8zOUVDCcMlM4OytfsDrkD34oNzUmZcRg4ZZQODXhV/tm1Uq6u68nD2gjufK07o1GELwwfmwuhGsp5Vc6wuKqCrR1cYcLPsLIpvjiEhI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(86362001)(356005)(81166007)(921005)(82740400003)(16526019)(1076003)(186003)(47076005)(40460700003)(2906002)(5660300002)(40480700001)(36860700001)(6666004)(26005)(2616005)(7696005)(478600001)(336012)(83380400001)(316002)(426003)(82310400005)(110136005)(70586007)(70206006)(4326008)(41300700001)(8676002)(8936002)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 14:30:48.5486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e29cba0d-cea2-4da8-fa97-08dab04c2f6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668
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

-This is purely a timing issue. Here, sometimes Job free
is happening before the job is done.
To fix this issue moving 'dma_fence_cb' callback from
job(struct drm_sched_job) to scheduler fence (struct drm_sched_fence).

- Added drm_sched_fence_set_parent() function(and others *_parent_cb)
in sched_fence.c. Moved parent fence intilization and callback 
installation into this (this just cleanup).


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

Changes in v3: Added drm_sched_fence_set_parent() function(and others *_parent_cb)
in sched_fence.c. Moved parent fence intilization and callback
installation into this (this just cleanup).

---
 drivers/gpu/drm/scheduler/sched_fence.c | 53 +++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  | 38 +++++-------------
 include/drm/gpu_scheduler.h             | 12 +++++-
 3 files changed, 72 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 7fd869520ef2..f6808f363261 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -77,6 +77,59 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
 	if (!WARN_ON_ONCE(!fence))
 		kmem_cache_free(sched_fence_slab, fence);
 }
+/**
+ * drm_sched_job_done_cb - the callback for a done job
+ * @f: fence
+ * @cb: fence callbacks
+ */
+static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct drm_sched_fence *s_fence = container_of(cb, struct drm_sched_fence,
+						       cb);
+	struct drm_gpu_scheduler *sched = s_fence->sched;
+
+	atomic_dec(&sched->hw_rq_count);
+	atomic_dec(sched->score);
+
+	dma_fence_get(&s_fence->finished);
+	drm_sched_fence_finished(s_fence);
+	dma_fence_put(&s_fence->finished);
+	wake_up_interruptible(&sched->wake_up_worker);
+}
+
+int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
+				  struct drm_sched_fence *s_fence)
+{
+	return dma_fence_add_callback(fence, &s_fence->cb,
+				      drm_sched_job_done_cb);
+}
+
+bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence)
+{
+	return dma_fence_remove_callback(s_fence->parent,
+					 &s_fence->cb);
+}
+
+/**
+ * drm_sched_fence_set_parent - set the parent fence and add the callback
+ * fence: pointer to the hw fence
+ * @s_fence: pointer to the fence
+ *
+ * Set the parent fence and intall the callback for a done job.
+ */
+int drm_sched_fence_set_parent(struct dma_fence *fence,
+			       struct drm_sched_fence *s_fence)
+{
+	if (s_fence->parent &&
+	   dma_fence_remove_callback(s_fence->parent, &s_fence->cb))
+		dma_fence_put(s_fence->parent);
+
+	s_fence->parent = dma_fence_get(fence);
+	/* Drop for original kref_init of the fence */
+	dma_fence_put(fence);
+	return dma_fence_add_callback(fence, &s_fence->cb,
+				      drm_sched_job_done_cb);
+}
 
 /**
  * drm_sched_fence_free - free up an uninitialized fence
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4cc59bae38dd..cfb52e15f5b0 100644
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
@@ -273,18 +272,6 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
 	wake_up_interruptible(&sched->wake_up_worker);
 }
 
-/**
- * drm_sched_job_done_cb - the callback for a done job
- * @f: fence
- * @cb: fence callbacks
- */
-static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
-{
-	struct drm_sched_job *s_job = container_of(cb, struct drm_sched_job, cb);
-
-	drm_sched_job_done(s_job);
-}
-
 /**
  * drm_sched_dependency_optimized - test if the dependency can be optimized
  *
@@ -505,8 +492,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
 					 list) {
 		if (s_job->s_fence->parent &&
-		    dma_fence_remove_callback(s_job->s_fence->parent,
-					      &s_job->cb)) {
+		    drm_sched_fence_remove_parent_cb(s_job->s_fence)) {
 			dma_fence_put(s_job->s_fence->parent);
 			s_job->s_fence->parent = NULL;
 			atomic_dec(&sched->hw_rq_count);
@@ -576,15 +562,14 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			continue;
 
 		if (fence) {
-			r = dma_fence_add_callback(fence, &s_job->cb,
-						   drm_sched_job_done_cb);
+			r = drm_sched_fence_add_parent_cb(fence, s_job->s_fence);
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
@@ -1049,14 +1034,9 @@ static int drm_sched_main(void *param)
 		drm_sched_fence_scheduled(s_fence);
 
 		if (!IS_ERR_OR_NULL(fence)) {
-			s_fence->parent = dma_fence_get(fence);
-			/* Drop for original kref_init of the fence */
-			dma_fence_put(fence);
-
-			r = dma_fence_add_callback(fence, &sched_job->cb,
-						   drm_sched_job_done_cb);
+			r = drm_sched_fence_set_parent(fence, s_fence);
 			if (r == -ENOENT)
-				drm_sched_job_done(sched_job);
+				drm_sched_job_done(s_fence);
 			else if (r)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
@@ -1064,7 +1044,7 @@ static int drm_sched_main(void *param)
 			if (IS_ERR(fence))
 				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
 
-			drm_sched_job_done(sched_job);
+			drm_sched_job_done(s_fence);
 		}
 
 		wake_up(&sched->job_scheduled);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1f7d9dd1a444..7258e2fa195f 100644
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
@@ -559,6 +561,12 @@ void drm_sched_fence_free(struct drm_sched_fence *fence);
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
 void drm_sched_fence_finished(struct drm_sched_fence *fence);
 
+int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
+				  struct drm_sched_fence *s_fence);
+bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence);
+int drm_sched_fence_set_parent(struct dma_fence *fence,
+			       struct drm_sched_fence *s_fence);
+
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
 void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 		                unsigned long remaining);
-- 
2.25.1

