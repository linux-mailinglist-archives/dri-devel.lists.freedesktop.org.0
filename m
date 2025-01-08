Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C7A06496
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3E210EC67;
	Wed,  8 Jan 2025 18:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oesfwgi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE45910EC65
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NtoaN9y7NOtSC2Js+/7yYAM7AaGPr1uu+moDAxF92KY=; b=oesfwgi5G/vn1rxomvTGpXi+QE
 eJUKijq6mgbAifhq5ntad6ZQ0waKTyTpiWKMftdXrsTVwzca8L7alYnjCLaQ06kimCWefXFJEefwA
 22bnGkSZ6G4cjxUBPgv2SMOCxGfijcf50A6IHTbAPWi2Z4HyMy5QWYSAjbGwLJkxI8yX68Q7G/3ev
 JWMLxd2T8806vPLzOw9zeeDX8nnjVU0SV1fcWJ1sjRBR1XfzpBCO7gZh8HZdx5ntgPpx/1w/hsUom
 v/LHeztd9vY64Ch+UavdOC/GLH9CVh9oYoAwM8ZTvvKGu+o/1UhKf5mofv85VQVk9sKqXVXGKz5QR
 ehF/Z4pg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVatz-00DFEm-60; Wed, 08 Jan 2025 19:35:35 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 03/18] drm/sched: Remove one local variable
Date: Wed,  8 Jan 2025 18:35:13 +0000
Message-ID: <20250108183528.41007-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
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

It is not helping readability nor it is required to keep the line length
in check.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1734c17aeea5..01e0d6e686d1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1175,7 +1175,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		container_of(w, struct drm_gpu_scheduler, work_run_job);
 	struct drm_sched_entity *entity;
 	struct dma_fence *fence;
-	struct drm_sched_fence *s_fence;
 	struct drm_sched_job *sched_job;
 	int r;
 
@@ -1194,15 +1193,13 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		return;
 	}
 
-	s_fence = sched_job->s_fence;
-
 	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
 	trace_drm_run_job(sched_job, entity);
 	fence = sched->ops->run_job(sched_job);
 	complete_all(&entity->entity_idle);
-	drm_sched_fence_scheduled(s_fence, fence);
+	drm_sched_fence_scheduled(sched_job->s_fence, fence);
 
 	if (!IS_ERR_OR_NULL(fence)) {
 		/* Drop for original kref_init of the fence */
-- 
2.47.1

