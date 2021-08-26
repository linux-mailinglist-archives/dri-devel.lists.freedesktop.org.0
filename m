Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E718A3F8209
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 07:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65A6E4CA;
	Thu, 26 Aug 2021 05:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2065.outbound.protection.outlook.com [40.107.100.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D856E4CA;
 Thu, 26 Aug 2021 05:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5q/oc5JDULbwOAVSKYazU1kQtCIhx5fBYL1dbkBHSHs90C1hqye7EUAwxthjYTPCu8+wV7YnyfA5zArlNaovmg5FGV592CwoyhV92HNdrVprsv5zcH54gM4GWVrqTZWDIbysCIjttvkYL/9oqItZF8DZLjuGCN4f8H/I1LW87xlJk4YNh67swiokQoFD6l9Al3iY+OkhyidQi4qNtZbzzXX+IFw1bcfzaO9lBA3109XB8eV9BFD32yG+qfclO4VS0phLWdSSn2uAqFY9Rx013Adnn038LIMkaGPa8rq+gfMWn+QgrWu6QvOyc6vPJEw400idTQlSJ81xPtxKz0y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M4YgFX2txwAwR9VBMG0ZHG8PlfgXJ7498rcXOADotc=;
 b=XHMl9+BtYijX/H4Jv6PtITPkB7jAVxZIz/7OBjEw4O265nQfseHoxm/4mcv91DRY5NWufKOb7IgwoxBDlwKSYwRY/Fb5+Vi+8ju7NnbQEJzRziz76af7AwbF9q6Q5uHnICPAZ1CtYNYzhF1zZII9pG3+sIReSlX5dLhDuKIDCTl2ratUZm6qvA23zlOfJ0cPYiK7zoJB/D1mjWI85pIe9ObZAJ8cy0F2UYovq2ycN5gd7lS71G8U579JIB1jIdRFlh/P5b6pGMzIgBBzg871HSHbl7HWIorkEp+lPN4ovDdLZcZcm7DzYZWK3BZeo4oG70ShMZggKDvHcD/unuRHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M4YgFX2txwAwR9VBMG0ZHG8PlfgXJ7498rcXOADotc=;
 b=iZ2rkVqkS7yzDIyxUWrr2zFkH1bNyj9avKNs8HNyhV7nt2SGngBzD04Np2PRw1UBWHh2CgBY6/wKedmPpiuvy3qnou1BkIreu0BpxZJvoHW1IBIjt0DK23nvKq492AAYHkSikh3TzGBRxJwH3H2uaGiiAGWnwGO3KLMpxpvQHrA=
Received: from CO1PR15CA0087.namprd15.prod.outlook.com (2603:10b6:101:20::31)
 by MWHPR12MB1517.namprd12.prod.outlook.com (2603:10b6:301:10::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 04:55:35 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::86) by CO1PR15CA0087.outlook.office365.com
 (2603:10b6:101:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Thu, 26 Aug 2021 04:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 04:55:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 25 Aug
 2021 23:55:34 -0500
Received: from monk-build.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Wed, 25 Aug 2021 23:55:33 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Monk Liu <Monk.Liu@amd.com>
Subject: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Date: Thu, 26 Aug 2021 12:55:31 +0800
Message-ID: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc309a85-716e-4059-396d-08d9684dbded
X-MS-TrafficTypeDiagnostic: MWHPR12MB1517:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15172341212DA8779812783984C79@MWHPR12MB1517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qYPBWrUIFyqlD9gn3WabGlYTLwEh5b/9NQHEOfm5zXrmojdrkNDHGX3r8jNYQ0P2midEAP+8aKsWVQ7cnkggS8QFruUf5MTCjEpDYfWIsos6zIWDbQiAwnPjxeG2dtHm22JyW3dMKceyiFgxbP9vFLShxr6Pox1HaFnDsk94B8HwQ3Ar74NrMui/FonDbGSvZ+y7YPFi2ncOU0MSa5yU09yiHA38qJty4Zs73z7kunkVxliK4/7+T6NH1E/ktfrD0ztwAroXxjUWpF0uCe+VBEHF2u8mEWHKevKrAvSEd4QyeQAF6gFtRHZjGF4ZnwyYT6u3OK99QFslUWdEujE0iIIk7KydYufGmasRpa8N7MejQKFvmI8ia6cGs0EcVUDbRiGiJzRnPlG/5e6Uf2706wIICrTjhoRKNb1PebLoWofJh2WZcNyUPwXM/G7tTeI7klSKo/DlfwrygF6Xr5RZqc/TiXzlVMKvJofpRJ/uNMAT6LGsYDl+N5QRj1oise76vfiNkGQ+b22fyUzNjPbCvGau3PH1tZC/mQf+lqwKKtIBlcBnSbMB98Dh/0Crikt1xV8riLpyv5EigewIXV1ezfxt2KAM7zodp/HfvpcbR6R/bgsoffuk/WsfPq4yPOk+3PutNe9GPUou5sYa3BNKesSD6uTmIwCFSAIle7eYwCB/0BSnDx8TeDz/2tfpvUI0AuSXbWgPQr7JTJpVkB8NPOje/um9zg9VA5sNE4eQc8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36756003)(54906003)(83380400001)(82310400003)(4326008)(336012)(508600001)(2616005)(6916009)(47076005)(8676002)(26005)(8936002)(356005)(426003)(36860700001)(7696005)(186003)(2906002)(81166007)(5660300002)(70206006)(70586007)(450100002)(86362001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 04:55:35.6197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc309a85-716e-4059-396d-08d9684dbded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1517
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

issue:
in cleanup_job the cancle_delayed_work will cancel a TO timer
even the its corresponding job is still running.

fix:
do not cancel the timer in cleanup_job, instead do the cancelling
only when the heading job is signaled, and if there is a "next" job
we start_timeout again.

v2:
further cleanup the logic, and do the TDR timer cancelling if the signaled job
is the last one in its scheduler.

v3:
change the issue description
remove the cancel_delayed_work in the begining of the cleanup_job
recover the implement of drm_sched_job_begin.

TODO:
1)introduce pause/resume scheduler in job_timeout to serial the handling
of scheduler and job_timeout.
2)drop the bad job's del and insert in scheduler due to above serialization
(no race issue anymore with the serialization)

Signed-off-by: Monk Liu <Monk.Liu@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a2a9536..ecf8140 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
-	/*
-	 * Don't destroy jobs while the timeout worker is running  OR thread
-	 * is being parked and hence assumed to not touch pending_list
-	 */
-	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
-	    !cancel_delayed_work(&sched->work_tdr)) ||
-	    kthread_should_park())
+	if (kthread_should_park())
 		return NULL;
 
 	spin_lock(&sched->job_list_lock);
@@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
+
+		/* cancel this job's TO timer */
+		cancel_delayed_work(&sched->work_tdr);
 		/* make the scheduled timestamp more accurate */
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
-		if (next)
+
+		if (next) {
 			next->s_fence->scheduled.timestamp =
 				job->s_fence->finished.timestamp;
-
+			/* start TO timer for next job */
+			drm_sched_start_timeout(sched);
+		}
 	} else {
 		job = NULL;
-		/* queue timeout for next job */
-		drm_sched_start_timeout(sched);
 	}
 
 	spin_unlock(&sched->job_list_lock);
@@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
 					  (entity = drm_sched_select_entity(sched))) ||
 					 kthread_should_stop());
 
-		if (cleanup_job) {
+		if (cleanup_job)
 			sched->ops->free_job(cleanup_job);
-			/* queue timeout for next job */
-			drm_sched_start_timeout(sched);
-		}
 
 		if (!entity)
 			continue;
-- 
2.7.4

