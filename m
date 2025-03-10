Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24A4A58D26
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4027F10E064;
	Mon, 10 Mar 2025 07:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YZDMYkKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC10410E064
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:44:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-391211ea598so2151221f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741592658; x=1742197458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UdzhdiThRJbETPGG8Kzj+Pu9zaED3TFBUkZ2Nnvl2nk=;
 b=YZDMYkKMdowA1Zk6vo9tzlkPMhUy+oDqw5g21IphUppGpDgl2e9FXq+upLQg5yTGLW
 yYKGH+WlrKTRCvUI2JLZtLEeIOwdcTcmI07H/7dkEgjWUmCPwonfFLg0HRtgw4IjfI3X
 T9wsH+QxIDYOvEOXKYvdeph4RB5DUifawe84o8CCtOaPI0Lo+ZAGd3IF+ttOzoXiSrce
 nHlGAe4WSBJDRA9MQ9flEIKb0TQM2QNR9y6UuWmvUxK6xlPqlvUuw3EzlUsvVnIcVMv9
 NHgOuuKmEnvT26wZNT8H1a63vmgXJd0SFGX114616AVhr7bEBfkDwN0w+Ci5FkRO51SP
 bt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741592658; x=1742197458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UdzhdiThRJbETPGG8Kzj+Pu9zaED3TFBUkZ2Nnvl2nk=;
 b=dqadROgueHE2dAyFd8NRN4EcqKOeNy82YR+HCkPqVpUN5bwOSQISCrSB3oxkvx23qa
 4cmP3myAbH8D1Gpl1MMDoK5OFCBvnPcX8uSw6pCUv91B3Nw/XVGcYpDEagXPYXXqpK5m
 a1WnXq8D7a/YTotWoLdUZOhvbbs2fkOeByZeTFanUdaa84tGB9jU6J8tXJQ8R1oiLyRa
 FhlMPuTigsf4ElMZYGwguEmyqxL0iB2RUlk4+wwmtdEG2KNcFj+8Na99S/mQ69cA4RRz
 AkAJm6YeWmFRWZG6xqyAHpDAlPHB4eDitqf2vsXz//YiK+AJzMhFvoHYXiHOBRR+L2nO
 Dcwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsy696sJ1Cum/BS9BF14r+5MvOrtEVtWzQkpi9i86dpR5LqVxLXGFH927VTMmKKqkiyVuhuWkuPf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyed/KpFUgx+PZJa+aUGMIYPtY1jf5+ngv/zktPDlm3hfXbkzF
 YNsy60+iSSrEOML8rmhIML8iAmhZvf+SR1HE89HIipkqVRMMqtz2
X-Gm-Gg: ASbGnctRGwe/n9qWlsR/9AnExxDnTm7frYGEmETLDfMJ9M23w5zqX8NelQ05YoLmgAF
 kekuqtPbvrNS7t6NxygSV3kPORifdp491zyAn5EcKtmQAIjohaXHrw+y7Q1SCcpppfZ/B6zHjWc
 Uh+dfilkQNEzDw6NLub1UEL/nbl3TbFi4Onk1Teyde82MBXEDzhQgfdnwGT8FTytl/xl9JiN6Vg
 2u7JP4s7pFrXL3++ogsEj1XSocVbwm8+Jkwa22PZYp11jdT04UEsWrkCLaqZDiVYS9qMoydGG99
 xrTmlZU37DXJlPmSqc1U266pdnQUOGua0DqAwBmaOuHdR6ypWlaLMiRl201y21AFqg==
X-Google-Smtp-Source: AGHT+IHebDWlET/u+P6beGzYSGkjHeI8nA0vwv5+V8ZYrg6etAhuOdBDtAlDyZJecmoNUIgXwKvnTw==
X-Received: by 2002:a05:6000:1564:b0:390:f45e:c84a with SMTP id
 ffacd0b85a97d-39132db77acmr7926279f8f.48.1741592658043; 
 Mon, 10 Mar 2025 00:44:18 -0700 (PDT)
Received: from EliteBook.amd.com (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01957csm13963242f8f.47.2025.03.10.00.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 00:44:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, dakr@kernel.org, phasta@kernel.org,
 tvrtko.ursulin@igalia.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct false doc"
Date: Mon, 10 Mar 2025 08:44:14 +0100
Message-Id: <20250310074414.2129157-1-christian.koenig@amd.com>
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

Sorry for the delayed response, I only stumbled over this now while going
over old mails and then re-thinking my reviewed by for this change.

The function drm_sched_job_arm() is indeed the point of no return. The
background is that it is nearly impossible for the driver to correctly
retract the fence and signal it in the order enforced by the dma_fence
framework.

The code in drm_sched_job_cleanup() is for the purpose to cleanup after
the job was armed through drm_sched_job_arm() *and* processed by the
scheduler.

The correct approach for error handling in this situation is to set the
error on the fences and then push to the entity anyway. We can certainly
improve the documentation, but removing the warning is clearly not a good
idea.

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

