Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4757CB2678B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 15:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0D410E0EC;
	Thu, 14 Aug 2025 13:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m9jrMDMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AAD10E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eSpLzE4MxcGNZZ8g6WTOqFZGQ24ShnpwkFaCUP5dswI=; b=m9jrMDMQF2zfSKUnKBHI9itaj0
 F2vr9RKxfHmqJvhBkeZT137ja2HkyWUq9nyiKUrexpXKWZrydaeNnjO8voKabssy1vWSnUJQY2g/z
 9GDtmyg6s9a+/6Fd0MwWFabPqCU2xN1ErQtCjTStL3WwFgcOu/uJPfCuvbRifbmI4IG9HFbh/XX9s
 bvs7qhXnZlvY5i/w89zpCV48Z8u4LQPjwazQ2drR1nH/5qVV2Ih3lnGA+gjMGVWBmT/gSIJ8K8yEX
 8b6l4aF2zPtbYBUl1u8e+dsUPlNBgREOf87K9L6z7FzEqXOSugrkrsyfYEzt5UiWGF/rsp/dU+KbR
 ZVNId9jA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1umY88-00E80e-VC; Thu, 14 Aug 2025 15:36:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/sched: Remove mention of indirect buffers
Date: Thu, 14 Aug 2025 14:36:27 +0100
Message-ID: <20250814133627.2550-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Indirect buffers are an AMD term describing essentialy a job submitted to
the scheduler, just a lower level one. Since scheduler was promoted to be
generic long ago, lets replace those references with jobs.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 8867b95ab089..254932b9050e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -285,9 +285,9 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 		return 0;
 
 	sched = entity->rq->sched;
-	/**
-	 * The client will not queue more IBs during this fini, consume existing
-	 * queued IBs or discard them on SIGKILL
+	/*
+	 * The client will not queue more jobs during this fini - consume
+	 * existing queued ones, or discard them on SIGKILL.
 	 */
 	if (current->flags & PF_EXITING) {
 		if (timeout)
@@ -300,7 +300,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 				    drm_sched_entity_is_idle(entity));
 	}
 
-	/* For killed process disable any more IBs enqueue right now */
+	/* For a killed process disallow further enqueueing of jobs. */
 	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
 	if ((!last_user || last_user == current->group_leader) &&
 	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
@@ -324,9 +324,9 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
 void drm_sched_entity_fini(struct drm_sched_entity *entity)
 {
 	/*
-	 * If consumption of existing IBs wasn't completed. Forcefully remove
-	 * them here. Also makes sure that the scheduler won't touch this entity
-	 * any more.
+	 * If consumption of existing jobs wasn't completed forcefully remove
+	 * them. Also makes sure that the scheduler won't touch this entity any
+	 * more.
 	 */
 	drm_sched_entity_kill(entity);
 
-- 
2.48.0

