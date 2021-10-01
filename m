Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39C41F3F6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A239E6EE97;
	Fri,  1 Oct 2021 17:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D2D6EE94;
 Fri,  1 Oct 2021 17:54:22 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id p1so2550839pfh.8;
 Fri, 01 Oct 2021 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vkapvopYf4d5OFUhbMrXMMqppSzZJW52FlsHM4D2c4=;
 b=hmfioFfHp3myRG8xL2Vimz4bhlUsEmsQ5w/5loL8YUFNXitmPoqDKjoJy+eU3BJ0Sm
 UTouiGZf6HsnBUeVP8a5KfgEzUH6Ecvghy2OXopp/wfTuW7ClfI5ICpwh9XtrdkA5F4t
 XtEDXSN7fjA8Q8QzSL3cyh3jtUtx6u4tDyuROQg5QVEAQBUvkMwackCQp60NUy/RYZOX
 Sa3PmtLnYh8vEyRkEZE4CN9f7snYHJXeKCu6p4Pa740XljJmBIs8xn7lC8nSQ8xL4sH3
 XI+679qiA/z2JZ5iJmZunF/NBCmgF0VPtajerE8bF00U459+IAGrxaLv8cgEKUbN22le
 9lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vkapvopYf4d5OFUhbMrXMMqppSzZJW52FlsHM4D2c4=;
 b=QQW6bPPSFZNnVqZr9ONWAHHmHmRvnERhWTsBqWKo0ewXXEVBPIoeZuN6wqMthvxJW+
 V+Nf+23d4d1iF4wTAbE42rme4H/UP6++4p88ar3nGtbBpKxzY1iwii8Su2JOhsjMXSF2
 Jaw+sOF0EUo8IfzyIp75sXiJyfSOAZ03SvuObJ+V8zKr+Pb18btP5bBPdx08HQUSbTC5
 N1gNpFAQnjril5cEzkurhJ0eZb6NkR/4dslSriuQ7dVPQTBpQeZeMWQGNDRnCKFdco0X
 dkmn7YKQbEpBqx7QGws37+XQAkGw1Iqlg1PHsmoeM2OzYeIcVDZlIhm5tSjvUidDDSjO
 d8Qg==
X-Gm-Message-State: AOAM533EJlTQtKQJs2M8UNngURa/29krwkLm3a46k1nFq1Uk1if7X+wH
 DkTsi86O8y8WlpcBeZXzTLTeCekIhhM=
X-Google-Smtp-Source: ABdhPJwFeagFYohF2YDXBtuImhEfzKCFXXvdMI6HiUv534qRyggQdwW9qG5pS90u5G9eQTdTjKY8RA==
X-Received: by 2002:a05:6a00:9a:b0:44b:b8f9:1d72 with SMTP id
 c26-20020a056a00009a00b0044bb8f91d72mr11545734pfj.21.1633110861123; 
 Fri, 01 Oct 2021 10:54:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t23sm2260261pgn.25.2021.10.01.10.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:54:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: A bit more docs + cleanup
Date: Fri,  1 Oct 2021 10:58:55 -0700
Message-Id: <20211001175857.1324712-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211001175857.1324712-1-robdclark@gmail.com>
References: <20211001175857.1324712-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

msm_file_private is more gpu related, and in the next commit it will
need access to other GPU specific #defines.  While we're at it, add
some comments.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 44 --------------------------
 drivers/gpu/drm/msm/msm_gpu.h | 58 ++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8633d0059a3e..31b39c27156d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -53,15 +53,6 @@ struct msm_disp_state;
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
-struct msm_file_private {
-	rwlock_t queuelock;
-	struct list_head submitqueues;
-	int queueid;
-	struct msm_gem_address_space *aspace;
-	struct kref ref;
-	int seqno;
-};
-
 enum msm_mdp_plane_property {
 	PLANE_PROP_ZPOS,
 	PLANE_PROP_ALPHA,
@@ -511,41 +502,6 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
 			   clockid_t clock_id,
 			   enum hrtimer_mode mode);
 
-struct msm_gpu_submitqueue;
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
-		u32 id);
-int msm_submitqueue_create(struct drm_device *drm,
-		struct msm_file_private *ctx,
-		u32 prio, u32 flags, u32 *id);
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
-		struct drm_msm_submitqueue_query *args);
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id);
-void msm_submitqueue_close(struct msm_file_private *ctx);
-
-void msm_submitqueue_destroy(struct kref *kref);
-
-static inline void __msm_file_private_destroy(struct kref *kref)
-{
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
-
-	msm_gem_address_space_put(ctx->aspace);
-	kfree(ctx);
-}
-
-static inline void msm_file_private_put(struct msm_file_private *ctx)
-{
-	kref_put(&ctx->ref, __msm_file_private_destroy);
-}
-
-static inline struct msm_file_private *msm_file_private_get(
-	struct msm_file_private *ctx)
-{
-	kref_get(&ctx->ref);
-	return ctx;
-}
-
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2fcb6c195865..592334cb9a0b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -272,6 +272,26 @@ struct msm_gpu_perfcntr {
  */
 #define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
 
+/**
+ * struct msm_file_private - per-drm_file context
+ *
+ * @queuelock:    synchronizes access to submitqueues list
+ * @submitqueues: list of &msm_gpu_submitqueue created by userspace
+ * @queueid:      counter incremented each time a submitqueue is created,
+ *                used to assign &msm_gpu_submitqueue.id
+ * @aspace:       the per-process GPU address-space
+ * @ref:          reference count
+ * @seqno:        unique per process seqno
+ */
+struct msm_file_private {
+	rwlock_t queuelock;
+	struct list_head submitqueues;
+	int queueid;
+	struct msm_gem_address_space *aspace;
+	struct kref ref;
+	int seqno;
+};
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
@@ -319,6 +339,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
 }
 
 /**
+ * struct msm_gpu_submitqueues - Userspace created context.
+ *
  * A submitqueue is associated with a gl context or vk queue (or equiv)
  * in userspace.
  *
@@ -336,7 +358,7 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @lock:      submitqueue lock
  * @ref:       reference count
- * @entity: the submit job-queue
+ * @entity:    the submit job-queue
  */
 struct msm_gpu_submitqueue {
 	int id;
@@ -436,6 +458,40 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
 
+int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+		u32 id);
+int msm_submitqueue_create(struct drm_device *drm,
+		struct msm_file_private *ctx,
+		u32 prio, u32 flags, u32 *id);
+int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+		struct drm_msm_submitqueue_query *args);
+int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id);
+void msm_submitqueue_close(struct msm_file_private *ctx);
+
+void msm_submitqueue_destroy(struct kref *kref);
+
+static inline void __msm_file_private_destroy(struct kref *kref)
+{
+	struct msm_file_private *ctx = container_of(kref,
+		struct msm_file_private, ref);
+
+	msm_gem_address_space_put(ctx->aspace);
+	kfree(ctx);
+}
+
+static inline void msm_file_private_put(struct msm_file_private *ctx)
+{
+	kref_put(&ctx->ref, __msm_file_private_destroy);
+}
+
+static inline struct msm_file_private *msm_file_private_get(
+	struct msm_file_private *ctx)
+{
+	kref_get(&ctx->ref);
+	return ctx;
+}
+
 void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
-- 
2.31.1

