Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20B59C9A6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F48D14A465;
	Mon, 22 Aug 2022 20:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91416A1817;
 Mon, 22 Aug 2022 20:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZA/83YKjpI66T2/mOa93cN9N1SzL1IJAdd0p6HZCajgiFCNqDj0eCYFSTyXcZPN/dRf+kSWjx353SBNcnE1FTQwcmd5r6iUElE/pu6zlfD9ATt/L7RHhVgmXX1QMiN2hCRZjolNZjbn53ro8KcBfvaRUp3nljnBfU7rziL3WSFEDFDWXN4zZt85+CVwNNO2lT4foNsaRsJ68pCMRw+5/wZVi0CXACZFr/pxkNXD55VN7aMbzIJUQ/yexihmCHLRvI9TyEOP0wpo/+1pnJ8tJLL6QM5WLNRy0HamROKf9EcdVdDo40YMH3rHJVaRNY8fhCWPz2r3+h/v5ooSF/IgqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lli4GmsaketVPG3bpiidqnKTatWmjiZC8PDZcjqh8U=;
 b=iokjaEcQQ2mjTn5m1rb0ptml6smV5owwp8HpUiaSHBmtCLD1mL5+0vTIeJRY0utFdNNrRvuJWEu+Ma1txNOQFfzGlYxrvA55nWVX3a4W0crecicMBGgnDe+TED2M+BvnjsPbDoNKwsMit7Ng0rZ2C98pZiC7Q0a4RXPkPS0/0pcdNSBcSgcVLc+8DSFakhCnJ3F+JbB8iKXmUSw6q1YAKkIDXcBwNloGw1GmRxQdebBeFMLqjDHnoTVPyx08uYB0GL/eQTt8QNpo7oFSZvxRaI+X2RiT5wxp7QVnAl4Y86u9B7aZGOvQLPYeDhat35q6e8j8guewuKAc/GG5nGRaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lli4GmsaketVPG3bpiidqnKTatWmjiZC8PDZcjqh8U=;
 b=cIp9oyU7/Gc4sagS4iBq+CTQPio6kdXI7APGb0lw3OC55qYzU6nNqmMWvKMffnvK6fUE3fklAG5cvU3M4crL47LkoaVANHtWI+1h4tQ35q4XphzqWs73t8T089hvdj/aXGbcaHn2nhnmNH+bvd/EPZKvqyss4V+Pl5nK76HvGOU=
Received: from BN9PR03CA0337.namprd03.prod.outlook.com (2603:10b6:408:f6::12)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 20:09:31 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::35) by BN9PR03CA0337.outlook.office365.com
 (2603:10b6:408:f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23 via Frontend
 Transport; Mon, 22 Aug 2022 20:09:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 20:09:31 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 22 Aug 2022 15:09:29 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Date: Mon, 22 Aug 2022 16:09:17 -0400
Message-ID: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36d8a15e-65de-4807-7243-08da847a3998
X-MS-TrafficTypeDiagnostic: SN7PR12MB6958:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 87YbGnaP19G43fA6Wa2aqryo+kn5jLTkHVqsR15PVXAqE8WGpMVDBxdXAnEwXPOD46OG7aQkwz2yVrbCU//2+7qddPTX7TXtwpt3awsF0p+IIuadmN4LC3ktw9U36Pv6uid2JdpKTX32C1RGdV/HrnSHLPj3NN6eOlkHCTLxQpMwG5px3UlV6ghdJmwqsLiSq65UE9fYYMiYO12n02dqP/X3yMue+DxbaQl656tcJX9ZW+1yn4Jx8+/M+fz8zfShicBG8PSAwifiGo+rLj3yz1Xkadqd1ZfJlr9r/ywCJPN0f+/7qmcKaUH+WjwZgKeCixffZmTZ6mP0ozHxF1SPMYLrwNXjiyv94Ny3uhBY6aMY/rC8rtSussQrJZ5tMWXH8UjkWSeSjC3zaEj+HRjajSmK+YzFCNRLqo5/bFHmcR8gGPVwBWCKJqYQdOLLYjgl0K1L5ol2/YZ7zU/6rwQ9opF8dFdzNj4xo0foG1bd8J5foLwRN7Pq+Cg8aOWdbIrRPMWKyypPCI0iDjhlvjEVgalPuWUBGzKUiRvkEHEoVb9slw4GcPc45HcbCCrEfvRLlZA1Q+EP8yGby/hGLkXxjoWn9rJ7xvZ5n40tCF27zxA2yYLMKxR8Pvh+kFe33qAjjuL/2IiBncYM+/M3i1N5tybxwtOpGjAdYnTucaNbB5DvQiVTDHl0dm+hD4lfDUrtdKg+lKb9qlldhyHaFxHuyiK9CKuQLdFdlyYGiGybkhqc74SfC1kC96KsvUAbkQkKHsXBfdE2bIY1MN8fWPsVCP4c2x6s1cCubpi70FQb3nAVzExE/dmJVCdfwdGb3Bfw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(40470700004)(70586007)(8676002)(4326008)(70206006)(82740400003)(40460700003)(86362001)(356005)(44832011)(81166007)(8936002)(2906002)(6666004)(7696005)(41300700001)(82310400005)(26005)(478600001)(40480700001)(5660300002)(83380400001)(316002)(36860700001)(1076003)(186003)(426003)(2616005)(6916009)(336012)(16526019)(54906003)(47076005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 20:09:31.2890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d8a15e-65de-4807-7243-08da847a3998
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958
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
Cc: ckoenig.leichtzumerken@gmail.com, Li
 Yunxiang <Yunxiang.Li@amd.com>, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Poblem: Given many entities competing for same rq on
same scheduler an uncceptabliy long wait time for some
jobs waiting stuck in rq before being picked up are
observed (seen using  GPUVis).
The issue is due to Round Robin policy used by scheduler
to pick up the next entity for execution. Under stress
of many entities and long job queus within entity some
jobs could be stack for very long time in it's entity's
queue before being popped from the queue and executed
while for other entites with samller job queues a job
might execute ealier even though that job arrived later
then the job in the long queue.

Fix:
Add FIFO selection policy to entites in RQ, chose next enitity
on rq in such order that if job on one entity arrived
ealrier then job on another entity the first job will start
executing ealier regardless of the length of the entity's job
queue.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +
 drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
 include/drm/gpu_scheduler.h              |  8 +++
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6b25b2f4f5a3..3bb7f69306ef 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
+	sched_job->submit_ts = ktime_get();
+
 
 	/* first job wakes up scheduler */
 	if (first) {
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 68317d3a7a27..c123aa120d06 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -59,6 +59,19 @@
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
+
+
+int drm_sched_policy = -1;
+
+/**
+ * DOC: sched_policy (int)
+ * Used to override default entites scheduling policy in a run queue.
+ */
+MODULE_PARM_DESC(sched_policy,
+		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
+module_param_named(sched_policy, drm_sched_policy, int, 0444);
+
+
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
@@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 }
 
 /**
- * drm_sched_rq_select_entity - Select an entity which could provide a job to run
+ * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
  *
  * @rq: scheduler run queue to check.
  *
- * Try to find a ready entity, returns NULL if none found.
+ * Try to find a ready entity, in round robin manner.
+ *
+ * Returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 {
 	struct drm_sched_entity *entity;
 
@@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
 	return NULL;
 }
 
+/**
+ * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
+ *
+ * @rq: scheduler run queue to check.
+ *
+ * Try to find a ready entity, based on FIFO order of jobs arrivals.
+ *
+ * Returns NULL if none found.
+ */
+static struct drm_sched_entity *
+drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+{
+	struct drm_sched_entity *tmp, *entity = NULL;
+	ktime_t oldest_ts = KTIME_MAX;
+	struct drm_sched_job *sched_job;
+
+	spin_lock(&rq->lock);
+
+	list_for_each_entry(tmp, &rq->entities, list) {
+
+		if (drm_sched_entity_is_ready(tmp)) {
+			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
+
+			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
+				oldest_ts = sched_job->submit_ts;
+				entity = tmp;
+			}
+		}
+	}
+
+	if (entity) {
+		rq->current_entity = entity;
+		reinit_completion(&entity->entity_idle);
+	}
+
+	spin_unlock(&rq->lock);
+	return entity;
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
+		entity = drm_sched_policy != 1 ?
+				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
+				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
+
 		if (entity)
 			break;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index addb135eeea6..95865881bfcf 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -314,6 +314,14 @@ struct drm_sched_job {
 
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned long			last_dependency;
+
+       /**
+	* @submit_ts:
+	*
+	* Marks job submit time
+	*/
+       ktime_t				submit_ts;
+
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
-- 
2.25.1

