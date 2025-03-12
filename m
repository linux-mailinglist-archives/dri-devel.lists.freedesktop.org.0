Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A520DA5DE45
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DDC10E6F8;
	Wed, 12 Mar 2025 13:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ScIDlDaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AF710E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 13:44:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso11523885e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741787044; x=1742391844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=73uRTAi6beMwHyvWny8Wq4267ZNP8zWmJCQ5mpXmlkY=;
 b=ScIDlDawpW3MAVx+adRopTeNOZ6C4hsuhC5s8/vYuXnrH3K7gktp2LxnlnD01e2ow7
 wLB1ncyETKgBnXlVKQAWNO4crmPBl6ju+F1u65nnYq9UocfoTa4rACatzr6ldR8F30Xh
 heOgJsgYu8prLMrGS8mHqQn2rlJg1UVK796cKcO6ql6s8JYO80wQBYJuKoW3WX0IC+td
 XkpFcMy0E/XrOJIC915QzNpI0D4Mwbn4twW/Q5mZOkbOZZyxxt4gC1p8/JbZyQwD1eBC
 WqtC5bXdKsO7IAFLUYzUjEEeCU5tWJ4BltJ5Q6LPMS+dlgO9EYahTrxcJA8l9Bw9j3R+
 hzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741787044; x=1742391844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73uRTAi6beMwHyvWny8Wq4267ZNP8zWmJCQ5mpXmlkY=;
 b=IU5KOUE47Z/sQLFndcpOWMutKGUGG7Ub7dj7h0N+31ZpPuYXKUgWU+5tqcpk0p74Mo
 5vEt7aNj5decWkRFfnKeoXOinFB/bVtGHF9mkvRyzvxAvTE/hQqoh5FoIK7YnheBjyxI
 k/xIPdnuFi2Y+Z6ohpHahCD7sroCm7prBhNKV4gccCeg8qZ2+CIuGH13ebqunviIMtrs
 Bjc/t9ORozo9ibWo5iaZzt8qulLAzMyl3aH+1kbIO7iiib211gvQGGGVsiwpdYvJXVKe
 UbcgrOngy8eD9mCrcjqAaQguTcMbAletxQZYb/rchXBwkAqC8PEAWgsJ15q2qY1HhM+t
 jIfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtRNppkePVckc+cBn9We3UA6o62EPytpFOeBom1D4Uau5BynTuV8Bb5kIBdxmpjPbmeohPJqOu7Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU5oD794r/WKNT2p/Fd1pzoQPaMHh2/hywntIvOkzXydXykDv/
 QnGX2WXFmBAj1+flufYsJRLGn94PIyGMsDeFo8PPGswOmOv5X4Qe
X-Gm-Gg: ASbGnctsdi4TKr5ijNZa5sI9FDX7DDko+4suZmuRjExny3qbWrKaZHKEu0LepEb/zwj
 ppESVeN/nSGV8IR6FvHIu3shd9XGOmgkj+abiQtg+2vd9sgNAEhx80T+NazAWen59rJflSbHoIP
 NE5nfjAp3PxfLx2fPtHjXv2KctgFUereMgYNyxPyePPIW8AiIPLkjOJ/QWwIzhsuyxFBqWJHEws
 yeF/SolETB9yf6BRDRAJYEpUp2qPVYgIo4cDRumAtXM7f76NkyrKjLQK+/wO0S4pWvvUZu9hkmr
 HvsvXfBDS1s5Zd1U9FzAuhRmLrSCcjUmE3W0uMnaFaUwvR8/s8KWntdHs+3hvp3OmA==
X-Google-Smtp-Source: AGHT+IFkIupCzPytkumNPE397SLf2nKz/tXNhzhZjT1K7fcibOD2vhxKGblwc4Qs/1LGI7iBC+8B8A==
X-Received: by 2002:a5d:59a7:0:b0:391:43cb:43fa with SMTP id
 ffacd0b85a97d-39143cb4581mr9986947f8f.51.1741787044138; 
 Wed, 12 Mar 2025 06:44:04 -0700 (PDT)
Received: from EliteBook.amd.com (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfca1sm20735406f8f.22.2025.03.12.06.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 06:44:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	phasta@kernel.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct false doc"
Date: Wed, 12 Mar 2025 14:44:00 +0100
Message-Id: <20250312134400.2176393-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 44d2f310f008613c1dbe5e234c2cf2be90cbbfab.

The function drm_sched_job_arm() is indeed the point of no return. The
background is that it is nearly impossible for the driver to correctly
retract the fence and signal it in the order enforced by the dma_fence
framework.

The code in drm_sched_job_cleanup() is for the purpose to cleanup after
the job was armed through drm_sched_job_arm() *and* processed by the
scheduler.

We can certainly improve the documentation, but removing the warning is
clearly not a good idea.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 53e6aec37b46..4d4219fbe49d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1015,13 +1015,11 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
  * Cleans up the resources allocated with drm_sched_job_init().
  *
  * Drivers should call this from their error unwind code if @job is aborted
- * before it was submitted to an entity with drm_sched_entity_push_job().
+ * before drm_sched_job_arm() is called.
  *
- * Since calling drm_sched_job_arm() causes the job's fences to be initialized,
- * it is up to the driver to ensure that fences that were exposed to external
- * parties get signaled. drm_sched_job_cleanup() does not ensure this.
- *
- * This function must also be called in &struct drm_sched_backend_ops.free_job
+ * After that point of no return @job is committed to be executed by the
+ * scheduler, and this function should be called from the
+ * &drm_sched_backend_ops.free_job callback.
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
@@ -1032,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 		/* drm_sched_job_arm() has been called */
 		dma_fence_put(&job->s_fence->finished);
 	} else {
-		/* aborted job before arming */
+		/* aborted job before committing to run it */
 		drm_sched_fence_free(job->s_fence);
 	}
 
-- 
2.34.1

