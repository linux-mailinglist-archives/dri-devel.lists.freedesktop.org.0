Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42CF9FE92C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8938E10E533;
	Mon, 30 Dec 2024 16:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FhKtURaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB9410E387
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kT0XbtSflQtuyxcgxu6kI7eT6t8AoXrR3GQEO7NchIQ=; b=FhKtURaSfz3VgYYYptcdJGG9lZ
 KLzjKQ6dDxotWqZdtC45pt9U7VTpaPx6OkI7iG3cqaQl8BG6GGUHU2MeVp5C8cJ7BD2T+EVLWnlJi
 9x/1ziVh+M+j4S159FfKslv5xgGNlO2Lj4A1yUw3FOya96vJrDogLj2jMtCrWe4xiiqjMiQ0suplJ
 oHm0QLI8fRsSC+wBdrt6+wkpC+aj9kMfjLRJG4grjr0CMJF+OyiGE8o1bXc5Yt96BFDWjZYR4fqCf
 N7ah4H75b6+Tpm7PHZ8OTOcx6aOyhqFWJF16XvfmsgGQtXkRGt2WNrZCYHrluruAhW9GPb+GwNaZh
 okjBJ4LA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0q-009ZvH-Ig; Mon, 30 Dec 2024 17:53:04 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 01/14] drm/sched: Delete unused update_job_credits
Date: Mon, 30 Dec 2024 16:52:46 +0000
Message-ID: <20241230165259.95855-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

No driver is using the update_job_credits() schduler vfunc
so lets remove it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 13 -------------
 include/drm/gpu_scheduler.h            | 13 -------------
 2 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7ce25281c74c..1734c17aeea5 100644
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

