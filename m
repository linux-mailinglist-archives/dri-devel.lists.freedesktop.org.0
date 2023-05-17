Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EFE707647
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE3110E2E6;
	Wed, 17 May 2023 23:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BED210E2E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdwgAh48+OEWC7qrYLHpiIa/13Zz9aD0RO9qcTonHxJUQlpv7sqNDAueKSPtg5OAgWuxtcguP9PxqR+4VTrVURlofi1bdaOxcDesWUfiAqr4+J1haX0cnBgmzr7qsxfdYLjRJHlASGQ3HQ49Dwm4tx4UDrQ5RvCGsNuR58JWm46615w8fizeXXQsSq6Z0NvLQKCKGOxfkm7iUwL3HjRR+vwLrnmM3uSpnmNdjVDly6tUqtg3SpuJ1sMs5hYTs6YuhJn1tSR6791+Ppb10qStbtS8Fcq30WAIpBpnM2fyMSsA2yo0vvE0g3yS3RwAhEFcZT1KptCmxarpY2xE88UY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wVF2RuHqdN8mKQ9Ls5+dMNlA/zaYBHuaSrOpwnpxqI=;
 b=itU23RMRqQRTGC6LAaIWVXN9WtbxErO1ALrFWGCIDi/5sm5xAQZSme65c3BjzqRJNJsDAF+mtnonNcqBFNmfEvddFcxlLE8dLKU9I5r0SK8Wpgh4aziUROxeURSYR+pKUlW3hDhO8Fl7LUuhGT8BQuOGgULG6LEppeRPBpJn9PVFG4RWlm6EalgZqYms/8DmwMPu9NVxE2Ao6+HxDHLWgjq/4LD8okruduaAiW9Lat9g9MZktWdeOwLATYBTq3ioQGSiM8b9tEcphOFcbKCBW+BDsYiHuacP8DwKr5qwfmuNfJ/LfmdeU4HeahbQJ8j2pgsbdez7okRS2z1QQ7JhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wVF2RuHqdN8mKQ9Ls5+dMNlA/zaYBHuaSrOpwnpxqI=;
 b=I9j9140GFvQmaCC4Se9L9jONBtU8sONVIB7yMmuWLdyhxkDcy0LI22PURsluDmvjNMJWvHVckPuSVkqM0c7J++ZtE9K8FFMsRiHCmAuVAl3+V2WYXamT13iL2fnRyl1Mt3JnFgAKO86CrSTPREXnGpr04yoasHkZzvcSf8lLHoE=
Received: from MW4PR04CA0122.namprd04.prod.outlook.com (2603:10b6:303:84::7)
 by DM8PR12MB5493.namprd12.prod.outlook.com (2603:10b6:8:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 23:08:48 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::63) by MW4PR04CA0122.outlook.office365.com
 (2603:10b6:303:84::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Wed, 17 May 2023 23:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Wed, 17 May 2023 23:08:47 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 18:08:45 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_can_queue()
Date: Wed, 17 May 2023 19:08:19 -0400
Message-ID: <20230517230820.371572-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517230820.371572-1-luben.tuikov@amd.com>
References: <20230517230820.371572-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|DM8PR12MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3a64ab-b07c-4aee-aace-08db572bab88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZCqSn84dliEg3UKbEvq5Imj4q+vnsZDyIw/DW50lI7DIEWBXVJXkscw/nJY+YpfvH8Bm3sc0zOdP/k2EWpomK3DmoHhVd7zGmMErz+X41bFV2G/NqdF3TGsZY1UwTBJgTU/TEfkVG4yjk7pIQYRKXi/FaP5HT4SX6MntS1twChjx5Gsc60WrdltVzGNLyGPfasXiVe9MAjgjHa7mDzms5sBqvZzNQRP7KL/4N8oad56goThzEWoy8cknoZ/uSpRvymuA8blQwgagX8cSwxvzlCoAPV8fLY6mVs2yWqQBl8iln/SW33FXr+TkIIOrJ46w8QHTcgf8qtuYwCo/NkRHAQ64bthQHrrwzDK9B+Bz2CHQ9vm11ZHbrKZHhFrMzjEIe98YMALQtMbO9LstFgZps2SmCiTOGtcN7VaZWgdCJZTKMJRVbW2aCJUrPtdEZLcWcLzIOuDE9gLV9GwQ9ubt8914MS+R6ERu/apLOwyxGE1gyK5Vz38OBukNXefovDv4PgZaAlO1usW9fzKEUvE8CZqgPrhBKgU9odBLr/PWQwqpbbBUYnW5FqV1iaVfENCvRtdsv5YaWkmf2DIziZ9BLvhZfvY9YOKICPF+0P4nmFJMAbOw6f9mymf4jY1/temOb/+KNJnBjttr0qU6wwQasb/LE+uGW6uhp89PcpHcmVRfkT5JZGCSk8CgILx1AEIrmZKdPmoLQj751fEBVkeMoWze2zAD4E/HEWTxttMwm19JAqdnGdQmG+ATuOnyz7iLO2G+6Afqf01QRnRdYmHqQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(316002)(478600001)(70586007)(70206006)(54906003)(6916009)(4326008)(36756003)(83380400001)(16526019)(186003)(1076003)(26005)(356005)(2616005)(82740400003)(81166007)(336012)(426003)(47076005)(66574015)(36860700001)(40480700001)(8936002)(82310400005)(6666004)(40460700003)(41300700001)(8676002)(86362001)(5660300002)(44832011)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:08:47.4565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3a64ab-b07c-4aee-aace-08db572bab88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5493
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the former
is misleading, as it wakes up the GPU scheduler _only if_ more jobs can be
queued to the underlying hardware.

This distinction is important to make, since the wake conditional in the GPU
scheduler thread wakes up when other conditions are also true, e.g. when there
are jobs to be cleaned. For instance, a user might want to wake up the
scheduler only because there are more jobs to clean, but whether we can queue
more jobs is irrelevant.

v2: Separate "canqueue" to "can_queue". (Alex D.)

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cfb433e9200586..68e807ae136ad8 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup_if_can_queue(entity->rq->sched);
 }
 
 /**
@@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup_if_can_queue(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8739322c30321b..b352227a605538 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_wakeup - Wake up the scheduler when it is ready
- *
+ * drm_sched_wakeup_if_can_queue - Wake up the scheduler
  * @sched: scheduler instance
  *
+ * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
 		wake_up_interruptible(&sched->wake_up_worker);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 31d1f5166c79fe..e95b4837e5a373 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
                                    unsigned int num_sched_list);
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.40.1

