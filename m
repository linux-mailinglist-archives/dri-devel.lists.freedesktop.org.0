Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23873AE268F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 01:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A6610E253;
	Fri, 20 Jun 2025 23:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ijWN5qJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219CB10E23F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 23:51:14 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-23649faf69fso23344765ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 16:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750463473; x=1751068273; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5vvox43cD9NYrsjyf5GKXqlmstOaekHhc5zLK9+dlWE=;
 b=ijWN5qJDK+u71EEqsfgMNjx1DJcYBluKl6TPswVDMl2tS4dn3uKy9ny+WiK1dU+Skk
 /Eyx6520e4usYX9Mv4+45LgzGq6afSG9Cyy3EklHaRDvhH7gUWelGRK2n26s/LNHQYNj
 KTgaltvp9ancZole1LG9PTetizu3IfXEDNysaN73nIKxDLG4ZqK87BO7K6OXmKiFmDHE
 72zg590HurJ+ciJ6BZKNhPtvjzt/UxJlggQDbFuGLkhbBf7XK3sMotyi82sOSj5XbFWu
 Le3cUn+Srgf726GjKa4RyTUNnatMEwgN68IcD6+uvgrvXSSOaTkx0y9cdk5+b1lznfBN
 kqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750463473; x=1751068273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vvox43cD9NYrsjyf5GKXqlmstOaekHhc5zLK9+dlWE=;
 b=OG16nZDxRiw/eswAx4QcNl+t8aK7pGT2rAHwd60osSbAIQySWcvXsqasHcrii3kzi9
 sPkoFucTEKIsegbOWFA1Xo7exllwcKOnzNbvE5EkVBzFW4vj02sqhs7uX9k+kj8M0OCk
 ltaiJBBvsWdf1XRaw+adExNUEvW7SdFIQJG6nIRn1uxIVLy6MoJcARTuVv/ytqYXFBM0
 uRSscT6to8YOtbhPeffkqAedd90tGKOfy6A878LjZmncSMvh+d1XCJSI0ieC5NXIPjPu
 qJuljQt5R1fvHJuZJgdGpgj+u1nwPEuWt+8NuiGC+Dm4P1Q29wGUx9c2r8j7VybtE/Bs
 1bug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnIdXD9ENEbYkURwrJwDcH5ZR5DxuNIRdaloFWVeE03IrkHHL967syFWC2Yfwg3OyId4wTVRoUZiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkIsFXGa6nvqIxKvtHnB0bFmkoMctNBlHFAk5ZI+Q8VTONCi8E
 DaiGZIQIbZ9KDQ3jW33TR7aRKBpcmk2+ZgR1nVIclhKJKzvn9Bb0d+vr
X-Gm-Gg: ASbGncsTBOGMqSKFbblSg6TF2dPz0rDwqhts6eIIR+a3L/WFrKSKe+k1KE/lRfPS+fB
 xqHjr4kOYHxgEIVA6yBX/mV3PmbfKexiD43GvJJHNqb/kGgFlinG8jRjRyZsI4PzyVVhmqQqdR9
 zuZlhOcoJkP0hLdTTlFPc6SCfmkURWg2Z5CJ0naeUBT0Zv5wJEBij3QmfRqCVIvAVVWcMTHu848
 Luj0DbkVEqH+jHI0+69IZWcL9DxkhNMND8yoShbdc6X7BDkgio01hv95+L+WxlaR34UI7m5LNRm
 n4qokcJNe8ZUoJia6xp5pTxzf6kQ8wjrNXx/lN4mVZOj1uzrroi5J1SIYQb9oSmRqX3clLYL+QK
 aYNPaXhmFQm7KeoGLZYwsA0pbx0MbfAU=
X-Google-Smtp-Source: AGHT+IEG79oOLnu9PJ+AZ0fBSiD3lvfh6w0jAZd3L7P7KwYuJo5rGFZkWrNOQGbpSZwQOidQim91Kg==
X-Received: by 2002:a17:902:ea0c:b0:235:e71e:a37b with SMTP id
 d9443c01a7336-237d99bcf92mr70013385ad.34.1750463473536; 
 Fri, 20 Jun 2025 16:51:13 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-237d86d5ea7sm26670035ad.206.2025.06.20.16.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 16:51:13 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] panthor: dump task pid and comm on gpu errors
Date: Fri, 20 Jun 2025 16:50:53 -0700
Message-ID: <20250620235053.164614-5-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <20250620235053.164614-1-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
MIME-Version: 1.0
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

It is useful to know which tasks cause gpu errors.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 485072904cd7d..f44cf95e8f1d1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1359,8 +1359,12 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 	fatal = cs_iface->output->fatal;
 	info = cs_iface->output->fatal_info;
 
-	if (group)
+	if (group) {
+		drm_warn(&ptdev->base, "CS_FATAL: pid=%d, comm=%s\n",
+			 group->pfile->pid, group->pfile->comm);
+
 		group->fatal_queues |= BIT(cs_id);
+	}
 
 	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {
 		/* If this exception is unrecoverable, queue a reset, and make
@@ -1420,6 +1424,11 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 		spin_unlock(&queue->fence_ctx.lock);
 	}
 
+	if (group) {
+		drm_warn(&ptdev->base, "CS_FAULT: pid=%d, comm=%s\n",
+			 group->pfile->pid, group->pfile->comm);
+	}
+
 	drm_warn(&ptdev->base,
 		 "CSG slot %d CS slot: %d\n"
 		 "CS_FAULT.EXCEPTION_TYPE: 0x%x (%s)\n"
@@ -1636,11 +1645,16 @@ csg_slot_process_progress_timer_event_locked(struct panthor_device *ptdev, u32 c
 
 	lockdep_assert_held(&sched->lock);
 
-	drm_warn(&ptdev->base, "CSG slot %d progress timeout\n", csg_id);
-
 	group = csg_slot->group;
-	if (!drm_WARN_ON(&ptdev->base, !group))
+	if (!drm_WARN_ON(&ptdev->base, !group)) {
+		drm_warn(&ptdev->base,
+			 "CSG_PROGRESS_TIMER_EVENT: pid=%d, comm=%s\n",
+			 group->pfile->pid, group->pfile->comm);
+
 		group->timedout = true;
+	}
+
+	drm_warn(&ptdev->base, "CSG slot %d progress timeout\n", csg_id);
 
 	sched_queue_delayed_work(sched, tick, 0);
 }
@@ -3222,7 +3236,8 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_queue *queue = group->queues[job->queue_idx];
 
-	drm_warn(&ptdev->base, "job timeout\n");
+	drm_warn(&ptdev->base, "job timeout: pid=%d, comm=%s, seqno=%llu\n",
+		 group->pfile->pid, group->pfile->comm, job->done_fence->seqno);
 
 	drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
 
-- 
2.50.0.714.g196bf9f422-goog

