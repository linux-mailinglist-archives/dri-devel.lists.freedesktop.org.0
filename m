Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AADFA08EEB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD6410E056;
	Fri, 10 Jan 2025 11:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UNUDvMjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB2910E056
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qlaO7xSorsp0kw0r8nkABq3JTIDGrEz8ZtZZ4+W17qM=; b=UNUDvMjXhNj/zMNTuWVncWQGOw
 Wx8dv/BDnEZYiiYPsAMWEVQpsuXg2vRICqqUq0xDr7j8zyhbSZmu7woyQJ1g70KZC7XZsCuhj7Uwe
 0v93x/Hv+FY7/7K5On/DUtyCaDgarCWrXWrrXRr8kvUpRkG8scCVv2rE8CuLkzJZgNB9YsUkqV1zi
 dIjx48EhzzGyZHLcHTmDJmhgOmwiTeBc1QMe1FLwNbMQOr3A1112TnfA4wPaqATptuSJGr3P7maOt
 bTI0FzH067wvF9pZo/ZOOjCIxu8ZSvDU31Q9Y3jQKjD2umOs806B6A9Jz10pKtUOhYadg1gLhKIor
 rjuI19qw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tWCww-00DvkP-Rz; Fri, 10 Jan 2025 12:13:10 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH] drm/sched: Delete unused update_job_credits
Date: Fri, 10 Jan 2025 11:13:01 +0000
Message-ID: <20250110111301.76909-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

No driver is using the update_job_credits() schduler vfunc
so lets remove it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 13 -------------
 include/drm/gpu_scheduler.h            | 13 -------------
 2 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 57da84908752..81d69c2ff6ab 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -64,12 +64,6 @@
  * credit limit, the job won't be executed. Instead, the scheduler will wait
  * until the credit count has decreased enough to not overflow its credit limit.
  * This implies waiting for previously executed jobs.
- *
- * Optionally, drivers may register a callback (update_job_credits) provided by
- * struct drm_sched_backend_ops to update the job's credits dynamically. The
- * scheduler executes this callback every time the scheduler considers a job for
- * execution and subsequently checks whether the job fits the scheduler's credit
- * limit.
  */
 
 #include <linux/wait.h>
@@ -133,13 +127,6 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 	if (!s_job)
 		return false;
 
-	if (sched->ops->update_job_credits) {
-		s_job->credits = sched->ops->update_job_credits(s_job);
-
-		drm_WARN(sched, !s_job->credits,
-			 "Jobs with zero credits bypass job-flow control.\n");
-	}
-
 	/* If a job exceeds the credit limit, truncate it to the credit limit
 	 * itself to guarantee forward progress.
 	 */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 95e17504e46a..e2e6af8849c6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -476,19 +476,6 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
-
-	/**
-	 * @update_job_credits: Called when the scheduler is considering this
-	 * job for execution.
-	 *
-	 * This callback returns the number of credits the job would take if
-	 * pushed to the hardware. Drivers may use this to dynamically update
-	 * the job's credit count. For instance, deduct the number of credits
-	 * for already signalled native fences.
-	 *
-	 * This callback is optional.
-	 */
-	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
 };
 
 /**
-- 
2.47.1

