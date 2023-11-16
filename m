Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B47EE275
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FE410E5E5;
	Thu, 16 Nov 2023 14:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A08E10E5F4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:15:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso7370595e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 06:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700144154; x=1700748954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJkgQ1OJRs5LsTCMU1Pt2paZ+8GmyKa7Yny7C8WgprY=;
 b=HA3gO29WHqyYqdC/hLN0jJaSMtUtTzlWUtmbFqsa7N68vU+fH11lrc+ZO5GqpTrtTf
 S4q+Tadxh4iG5cL3vicvIZco7m3ofgI5PZbgZz5Mh2VNLPZdoYDKcU4V9VX3jrpMAUDl
 sshtnE2smVqur+eLS4+oZqdofTU7oRFItlZG1NtR/scEGynlbjQ6F+WF3A1w465lqjVG
 YS1OmlLdm8F/q9r9ka8msE3KEeI2XHxxp/eK7f6FWDQevnwCfIG15xdAEZ3ZtuHTC424
 y4pbMNDEeFOr2QCIVEqw0jofuFTXRl8RBSBOFlcFOIxSdWe0fL2SMhvQsN/FpuuxYc9M
 bLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700144154; x=1700748954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJkgQ1OJRs5LsTCMU1Pt2paZ+8GmyKa7Yny7C8WgprY=;
 b=NN8Dq4IRZqBeypG3IHWcy9bxq5MrCd6Q/xL/a1hhasotVzVcy5+AGasDilDm1a8zfm
 B9MLNretzphLOskME1wPgbwfY18VFImUIY8wNtdg2uHY1k6SsWojd0LxyNr39PFGIvxX
 h8yK7xXjBGPw4XXBWsdoucqNsu1KilzCZ8i60hWTm+WbGIBgnBLIu+IBagSRIm3/8V5M
 7HGRYOPyl3YrgGBdZUnfScJhBm02V1pcrBbNh7uDlTGZd2rJVwy6VbsganmnjOxzpDCD
 pVN+8GUOGKC9M971P3kg1a0w3dAnHyxAjZiQrPObq7un6URpehv0j5LR8wiJu4e2BmZX
 nobg==
X-Gm-Message-State: AOJu0YzzpbcudeaWVWSbus/Z1JM28GMuMK6oW8hQekps+pa4sfQLxmjC
 Zw66BQQjsQTtVHGwJvHENjk=
X-Google-Smtp-Source: AGHT+IGUAjoGod1waxWcwy+cqKtsJfn7TYL99fm3e0bugBpFazerr/XtshiFCHn0bDP1LHHCCwyEVg==
X-Received: by 2002:a05:600c:1d81:b0:409:404e:5ba6 with SMTP id
 p1-20020a05600c1d8100b00409404e5ba6mr12168175wms.35.1700144154207; 
 Thu, 16 Nov 2023 06:15:54 -0800 (PST)
Received: from EliteBook.amd.com (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a7bce0a000000b004083a105f27sm3709072wmc.26.2023.11.16.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 06:15:53 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dakr@redhat.com, airlied@gmail.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/scheduler: improve timedout_job wording a bit
Date: Thu, 16 Nov 2023 15:15:47 +0100
Message-Id: <20231116141547.206695-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116141547.206695-1-christian.koenig@amd.com>
References: <20231116141547.206695-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the reference to the deprecated re-submission of jobs.

Mention that it isn't the job which times out, but the hardware fence.
Mention that drivers can try a context based reset as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/drm/gpu_scheduler.h | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1d60eab747de..ac1d7222f5b2 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -418,8 +418,8 @@ struct drm_sched_backend_ops {
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
 	/**
-	 * @timedout_job: Called when a job has taken too long to execute,
-	 * to trigger GPU recovery.
+	 * @timedout_job: Called when a hardware fence didn't signal in a
+	 * configurable amount of time to trigger GPU recovery.
 	 *
 	 * This method is called in a workqueue context.
 	 *
@@ -430,9 +430,8 @@ struct drm_sched_backend_ops {
 	 *    scheduler thread and cancel the timeout work, guaranteeing that
 	 *    nothing is queued while we reset the hardware queue
 	 * 2. Try to gracefully stop non-faulty jobs (optional)
-	 * 3. Issue a GPU reset (driver-specific)
-	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
-	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
+	 * 3. Issue a GPU or context reset (driver-specific)
+	 * 4. Restart the scheduler using drm_sched_start(). At that point, new
 	 *    jobs can be queued, and the scheduler thread is unblocked
 	 *
 	 * Note that some GPUs have distinct hardware queues but need to reset
@@ -448,16 +447,14 @@ struct drm_sched_backend_ops {
 	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
 	 *    the reset (optional)
 	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
-	 * 4. Re-submit jobs on all schedulers impacted by the reset using
-	 *    drm_sched_resubmit_jobs()
-	 * 5. Restart all schedulers that were stopped in step #1 using
+	 * 4. Restart all schedulers that were stopped in step #1 using
 	 *    drm_sched_start()
 	 *
 	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
 	 * and the underlying driver has started or completed recovery.
 	 *
 	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
-	 * available, i.e. has been unplugged.
+	 * available, i.e. has been unplugged or failed to recover.
 	 */
 	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
 
-- 
2.34.1

