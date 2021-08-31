Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FC3FC5B1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 12:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4A189AF3;
	Tue, 31 Aug 2021 10:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA5289A76;
 Tue, 31 Aug 2021 10:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gClb1cyd+JI+VyyqlIShsnscHMUWDEc0s9ZnRvMFtKpARNAAxwzkKJAriphbRoaGHZlsp5QfaLWn1sw0Diw+QOJGBZZjA7UZsfF3LEvIqf81vyY4OUxJidEIU4Dg48ij8GvWZIBzpI0oZS82h3y1bl4TLGH4vZI6D42ygZ8JyR2gtR4T7E/resAmSUMp2kSwZ1jbYR7m1rJL52Y+SDkj+IFq9MGiN7WaSry9AC2mT/Q++pxDxJ9+A22owfKo4+L5eR5akCp9Ko75KeT1k1akt7DWCnZyXuOU8Gx/2J33lp/t6Gnx3h737F6XhsCHNul48Uo3eWnzA6sX2kDu5Oqyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hfU2lFbTyWfIjkrWVPJwBFQGH/b/4syvDRFIkT8Wc0=;
 b=CVGnX3aOxCGUjDYKCKoVNyZPGblE9C4+kAUnDM1t2aFKQHokN5BldkGgYJLt++RZbVmKcn93G7M/Og6Vq/UxihggF67esqq0ObQ03q+q4fk0DU3pWmPGz+7sEjKtFG/4gOmtHqxtFV+yiFKEQw+gyjcwwjnSLnb0HFrjnEg/r5rObWamYF6RfvKA7aSgNA3lYp+0933Z1axyzftV1THiEhx4BFhA3Es+wcDdyB48dWrLDQfW9E66GJVcG98annDgtgQlMDNDoEEL2keifDUFXBZ+EWGBYKC3aEaGPqgO7B2fgefMgMxul5v13+LKUZIt3a4Vd46UkPv3Syk9EPbTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hfU2lFbTyWfIjkrWVPJwBFQGH/b/4syvDRFIkT8Wc0=;
 b=T8hpViN/8I/FCy9jgAFaAsu8IR21xgNtNse22d5F3E2XF453OJ8BAp7MRe+oHqfUvE8cirapk9SA9Kp7A9OvCv4BxKdByGeF95OA7XibCvkBQb4L8PzYw1Vi5aSlZvNauZaEAptgw/75nqJyOgc6QDVeuS2amEmHzHbLM4h4U7w=
Received: from MWHPR01CA0041.prod.exchangelabs.com (2603:10b6:300:101::27) by
 DM5PR12MB1932.namprd12.prod.outlook.com (2603:10b6:3:10e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18; Tue, 31 Aug 2021 10:35:49 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:101:cafe::1) by MWHPR01CA0041.outlook.office365.com
 (2603:10b6:300:101::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Tue, 31 Aug 2021 10:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 10:35:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 05:35:46 -0500
Received: from monk-build.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Tue, 31 Aug 2021 05:35:45 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Monk Liu <Monk.Liu@amd.com>, "jingwen
 chen" <jingwen.chen@amd.com>
Subject: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Date: Tue, 31 Aug 2021 18:35:39 +0800
Message-ID: <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44b2abc8-a0b5-4a5e-6fb3-08d96c6b1919
X-MS-TrafficTypeDiagnostic: DM5PR12MB1932:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1932E006B2E7ABFA82FD206584CC9@DM5PR12MB1932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ehIoXFVAPR7vECwngjFOPE/ZLQhN59e/YD0ydRhVdbii89Jm7OzQhSIol9IcfSs+w4/NxqOLL0Eytg5UVSq83v4XITAa12+gUcDYf3fqsX3Q9/jUd2Ptm+LVGKBHAqsHJAs+71ad2x9MR44Jf41vb1W44om2sc74dIPjHWSsIi4tgMChj+ZoEopXaPft76Co7ke6/b1JjGsOCGl1w2vl9gDJ88Aski3xnDU+/fy1JyEuDeTQuZZ9y5A8z1Tw60SG6FLx9wNYHJOpPoSm+PB3wPIAWaUZA+gKhgbrdIWal2AKEYfnAKkTY7PF32iBLfNo2PKXadtlHLB8qz5fzKlOYMFT2f90HXyGz7v5cqByA8GYhZ5MUYuHIGi3tnfiSWQcPd/4iLh4nE0cRsigm3SurvqvaAoson+EQtvw76hHp5spi5mDNE3jn8z8idfF3RViDawldFLHttB8OgJkVsSnlOr23fLctkIr+iln6uhdKXOD8s56lk1kKK7aXP9HeMQQahpZ+Vw7W1a8L2Elt9wL7Lws5T4u2OXsiMjhfRnfy57ir6J3R7bIzNAjC4biTJ+9gqnMLBdZip4sGMd6Yff426jnpg26+m7QmqpvQt8ELIH+ynLTZNm6PKUK7Uhu5eKmPdkl7mGXYSk/FitgxEDk+ktTo7G68xXPIUa134Zj+ZDdtBI8XMWjy7qSf0zAlU+j7f1ItkyIuaMc7JxluaoFbS5oQSw6Wxcp+9bGYhofLIw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(4326008)(81166007)(186003)(2906002)(356005)(82310400003)(478600001)(36860700001)(2616005)(8936002)(6666004)(26005)(82740400003)(426003)(336012)(83380400001)(47076005)(8676002)(70586007)(70206006)(6916009)(7696005)(450100002)(36756003)(86362001)(316002)(5660300002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 10:35:48.6324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b2abc8-a0b5-4a5e-6fb3-08d96c6b1919
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
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

tested-by: jingwen chen <jingwen.chen@amd.com>
Signed-off-by: Monk Liu <Monk.Liu@amd.com>
Signed-off-by: jingwen chen <jingwen.chen@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ecf8140..894fdb24 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
 	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
+	if (!__kthread_should_park(sched->thread))
+		kthread_park(sched->thread);
+
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
 	if (job) {
-		/*
-		 * Remove the bad job so it cannot be freed by concurrent
-		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
-		 * is parked at which point it's safe.
-		 */
-		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
+		/* vendor's timeout_job should call drm_sched_start() */
 		status = job->sched->ops->timedout_job(job);
 
 		/*
@@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	kthread_park(sched->thread);
 
 	/*
-	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_cleanup_job cannot race against us and release the
-	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
-	 * now until the scheduler thread is unparked.
-	 */
-	if (bad && bad->sched == sched)
-		/*
-		 * Add at the head of the queue to reflect it was the earliest
-		 * job extracted.
-		 */
-		list_add(&bad->list, &sched->pending_list);
-
-	/*
 	 * Iterate the job list from later to  earlier one and either deactive
 	 * their HW callbacks or remove them from pending list if they already
 	 * signaled.
-- 
2.7.4

