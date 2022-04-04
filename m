Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328EE4F0E25
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 06:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2580210EC48;
	Mon,  4 Apr 2022 04:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FC310EC48
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 04:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PlXB4itmOX/bUMmwZVnWZIuScE3ZJWedKJZMz7KEZDE=; b=QL1TsZ9ghVahLBnZYRS9Z0QMeW
 QFRN2FRejTqfm5F2OrbI4c7j2nisJGL5W7+OEpngPLLVguvPMkBU00ZBmOah1ymWihy085f/1pOWf
 Q6Wykxv3Lge/oKBkxeLfzmGVZYLFj9+GbV8YzK9nRscj6lYGzDeHwY+sJ1cAkQm9NK1hz8ooW4iHM
 7aORsSHaL2ZhExsk5YZkdLDEmNopQO3WMAUVlvsDw7JkCLMhJdlL17aWuJLApUF0SWSZFXe5oridz
 G9aGFvpd5tYpn9WnuyqSLC9XxKq9SXevMoxzrjtZ7Zca00n7s+yJIVC6QYmtjmS8076J8Uc11jvZv
 TCd00RLA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEH9-00D1qh-27; Mon, 04 Apr 2022 04:25:11 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/scheduler: quieten kernel-doc warnings
Date: Sun,  3 Apr 2022 21:25:09 -0700
Message-Id: <20220404042509.13455-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.

Quashes these warnings:

include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'work' not described in 'drm_sched_job'
include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
 * struct drm_sched_backend_ops
include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
 * struct drm_gpu_scheduler

include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
drivers/gpu/drm/scheduler/sched_main.c:201: warning: missing initial short description on line:
 * drm_sched_dependency_optimized
drivers/gpu/drm/scheduler/sched_main.c:995: warning: Function parameter or member 'dev' not described in 'drm_sched_init'

Fixes: 2d33948e4e00 ("drm/scheduler: add documentation")
Fixes: 8ab62eda177b ("drm/sched: Add device pointer to drm_gpu_scheduler")
Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Jiawei Gu <Jiawei.Gu@amd.com>
Cc: dri-devel@lists.freedesktop.org
---
Feel free to make changes or suggest changes...

 drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
 include/drm/gpu_scheduler.h            |   10 ++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

--- linux-next-20220401.orig/drivers/gpu/drm/scheduler/sched_main.c
+++ linux-next-20220401/drivers/gpu/drm/scheduler/sched_main.c
@@ -198,7 +198,7 @@ static void drm_sched_job_done_cb(struct
 }
 
 /**
- * drm_sched_dependency_optimized
+ * drm_sched_dependency_optimized - test if the dependency can be optimized
  *
  * @fence: the dependency fence
  * @entity: the entity which depends on the above fence
@@ -984,6 +984,7 @@ static int drm_sched_main(void *param)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
+ * @dev: target &struct device
  *
  * Return 0 on success, otherwise error code.
  */
--- linux-next-20220401.orig/include/drm/gpu_scheduler.h
+++ linux-next-20220401/include/drm/gpu_scheduler.h
@@ -270,6 +270,7 @@ struct drm_sched_fence *to_drm_sched_fen
  * @sched: the scheduler instance on which this job is scheduled.
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
+ * @work: scheduler work queue
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
  *         limit of the scheduler then the job is marked guilty and will not
@@ -328,10 +329,10 @@ enum drm_gpu_sched_stat {
 };
 
 /**
- * struct drm_sched_backend_ops
+ * struct drm_sched_backend_ops - Define the backend operations
+ *	called by the scheduler
  *
- * Define the backend operations called by the scheduler,
- * these functions should be implemented in driver side.
+ * These functions should be implemented in the driver side.
  */
 struct drm_sched_backend_ops {
 	/**
@@ -408,7 +409,7 @@ struct drm_sched_backend_ops {
 };
 
 /**
- * struct drm_gpu_scheduler
+ * struct drm_gpu_scheduler - scheduler instance-specific data
  *
  * @ops: backend operations provided by the driver.
  * @hw_submission_limit: the max size of the hardware queue.
@@ -434,6 +435,7 @@ struct drm_sched_backend_ops {
  * @_score: score used when the driver doesn't provide one
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @dev: system &struct device
  *
  * One scheduler is implemented for each hardware ring.
  */
