Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC1F9A56BB
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 22:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1943810E06F;
	Sun, 20 Oct 2024 20:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M/WSQh0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2111610E06F
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 20:42:33 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4315baec681so37772815e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729456951; x=1730061751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8z6k5gcgBfK5BYhJ2+SYUSDJQfyxy7WFQ5tTc1JAmM8=;
 b=M/WSQh0ptjjPvZVx1yFcLi1z1J9IdUoR1t5l/eIqKEp5X8LLYaST84FABaby1eeEq5
 Su09aWmY+YOI/QlCjUKbId9d/PjwtBdu/pU2Cz1EUo6i/gjPvveHmDYXyToCh9aixNGi
 PozF+ivc2zgzA2teCihvMYZFhnj2BIa6vMovWcEbzoyYIny0uZkrcBJ9FU6Whe/q3uud
 f2FspkLuHcKQ5b7zmizhgF5MxpQ8a0AR1Bgmop6+21xv+e+bk2NmGqe75Z/NxXGcetwy
 KEdfsroJSXM8nQHFyFyD5B587vDFmlwzw9RJCQ6XiD/k34Jz1SOD9XdDLQ9IFkGLdGDB
 sC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729456951; x=1730061751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8z6k5gcgBfK5BYhJ2+SYUSDJQfyxy7WFQ5tTc1JAmM8=;
 b=nHPfrkjpiL1ET0fGJdXWu1YhiKBKNqRyutWJLSpcSGhIOclBxutSeMUiylrVCAXtRf
 dNq6GbDDsrxS68bKBPJBb1bS7c6fiTXhQVZ/YDRp12/e9MAA43wNuCFT84wjv5FRnk+Q
 juQKYtvdxJIIHGkC2K5Hp/UbdlkCLjWr7MEr3DR1plRXFqbfwezu4p3hVCHR0Tr4cDEG
 x/LCOlVAAcGojRZme41wfWe8JCW5si/2ZWEhOntEuUSAn62Rk8dfsn9xRvvN0ov/UFhD
 SFymZIofMXUFPKNjN0b0gdOGAJ//9omqRpZnXXpSj1Mc5zFAowzf1HVfYAEaGSiniGsk
 CCWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGyTWIfCVafSN9NJ0zgChlHIx3ORY6iWKiYVavnsfwDxkKSRhM7c7LGnKBhyoJHbfWlsf5mVh/Uys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6T+YOj/U37Y5WYcbD95A6SI8WLN/7LTMTPJefXJ2xwJiJwJUs
 wdLef01R8ztNh/bT5z063nxDyN99QJBYaOOm9Vdsg/jOIu1e0hAA
X-Google-Smtp-Source: AGHT+IFPOY29Zo6ocXgfbSp6/u866c5z1N1qj2+mDanJi6lpCWBnWiqKXOWEmuEQhbnZY+6ZBFQ8/Q==
X-Received: by 2002:a05:600c:3503:b0:42c:c003:edd1 with SMTP id
 5b1f17b1804b1-431616484dbmr68798385e9.10.1729456950877; 
 Sun, 20 Oct 2024 13:42:30 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57e66asm33519445e9.13.2024.10.20.13.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 13:42:30 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
Date: Sun, 20 Oct 2024 22:41:55 +0200
Message-ID: <20241020204156.113853-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.47.0
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

From: Christian Gmeiner <cgmeiner@igalia.com>

This patch adds a new ioctl, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, which
allows the configuration of a global performance monitor (perfmon).
The global perfmon is used for all jobs, ensuring consistent performance
tracking across submissions.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c                 |  3 ++
 drivers/gpu/drm/v3d/v3d_drv.h                 | 10 ++++
 drivers/gpu/drm/v3d/v3d_perfmon.c             | 49 +++++++++++++++++++
 .../gpu/drm/v3d/v3d_performance_counters.h    |  6 +++
 drivers/gpu/drm/v3d/v3d_sched.c               | 10 +++-
 include/uapi/drm/v3d_drm.h                    | 15 ++++++
 6 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index d7ff1f5fa481..f1753ee2af25 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -214,6 +214,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl, DRM_RENDER_ALLOW | DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_COUNTER, v3d_perfmon_get_counter_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(V3D_PERFMON_SET_GLOBAL, v3d_perfmon_set_global_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver v3d_drm_driver = {
@@ -350,6 +351,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto drm_unregister;
 
+	atomic_set(&v3d->num_perfmon, 0);
+
 	return 0;
 
 drm_unregister:
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index cf4b23369dc4..9491d730d99f 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -61,6 +61,8 @@ struct v3d_queue_state {
 	struct v3d_stats stats;
 };
 
+struct v3d_dev;
+
 /* Performance monitor object. The perform lifetime is controlled by userspace
  * using perfmon related ioctls. A perfmon can be attached to a submit_cl
  * request, and when this is the case, HW perf counters will be activated just
@@ -68,6 +70,9 @@ struct v3d_queue_state {
  * done. This way, only events related to a specific job will be counted.
  */
 struct v3d_perfmon {
+	/* Pointer back to v3d instance this perfmon belongs. */
+	struct v3d_dev *v3d;
+
 	/* Tracks the number of users of the perfmon, when this counter reaches
 	 * zero the perfmon is destroyed.
 	 */
@@ -179,6 +184,9 @@ struct v3d_dev {
 		u32 num_allocated;
 		u32 pages_allocated;
 	} bo_stats;
+
+	/* Keep track of current number of allocated perfmons. */
+	atomic_t num_perfmon;
 };
 
 static inline struct v3d_dev *
@@ -584,6 +592,8 @@ int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv);
 int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv);
+int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv);
 
 /* v3d_sysfs.c */
 int v3d_sysfs_init(struct device *dev);
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 156be13ab2ef..15ccdbf2c4d6 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -221,6 +221,7 @@ void v3d_perfmon_get(struct v3d_perfmon *perfmon)
 void v3d_perfmon_put(struct v3d_perfmon *perfmon)
 {
 	if (perfmon && refcount_dec_and_test(&perfmon->refcnt)) {
+		atomic_dec(&perfmon->v3d->num_perfmon);
 		mutex_destroy(&perfmon->lock);
 		kfree(perfmon);
 	}
@@ -312,6 +313,9 @@ static int v3d_perfmon_idr_del(int id, void *elem, void *data)
 	if (perfmon == v3d->active_perfmon)
 		v3d_perfmon_stop(v3d, perfmon, false);
 
+	/* If this perfmon is global one, set global_perfmon to NULL */
+	cmpxchg(&v3d->perfmon_info.global_perfmon, perfmon, NULL);
+
 	v3d_perfmon_put(perfmon);
 
 	return 0;
@@ -349,6 +353,12 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	/* If there is a global perfmon. block the creation of perfmons. */
+	if (v3d->perfmon_info.global_perfmon) {
+		dev_info_ratelimited(dev->dev, "global perfmon is active\n");
+		return -EAGAIN;
+	}
+
 	perfmon = kzalloc(struct_size(perfmon, values, req->ncounters),
 			  GFP_KERNEL);
 	if (!perfmon)
@@ -358,6 +368,7 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 		perfmon->counters[i] = req->counters[i];
 
 	perfmon->ncounters = req->ncounters;
+	perfmon->v3d = v3d;
 
 	refcount_set(&perfmon->refcnt, 1);
 	mutex_init(&perfmon->lock);
@@ -373,6 +384,7 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 		return ret;
 	}
 
+	atomic_inc(&perfmon->v3d->num_perfmon);
 	req->id = ret;
 
 	return 0;
@@ -451,3 +463,40 @@ int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
 
 	return 0;
 }
+
+int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv)
+{
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
+	struct drm_v3d_perfmon_set_global *req = data;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+	struct v3d_perfmon *perfmon;
+
+	if (req->flags & ~DRM_V3D_PERFMON_CLEAR_GLOBAL)
+		return -EINVAL;
+
+	/* If the request is to clear the global performance monitor. */
+	if (req->flags & DRM_V3D_PERFMON_CLEAR_GLOBAL) {
+		if (cmpxchg(&v3d->perfmon_info.global_perfmon, v3d->perfmon_info.global_perfmon, NULL))
+			return 0;
+		else
+			return -EINVAL;
+	}
+
+	guard(mutex)(&v3d_priv->perfmon.lock);
+
+	perfmon = idr_find(&v3d_priv->perfmon.idr, req->id);
+	if (!perfmon)
+		return -EINVAL;
+
+	/* Only permit this ioctl(..) if there is exactly one perfmon - the one
+	 * we want to make global.
+	 */
+	if (atomic_read(&v3d->num_perfmon) != 1)
+		return -EPERM;
+
+	if (cmpxchg(&v3d->perfmon_info.global_perfmon, NULL, perfmon))
+		return -EBUSY;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/v3d/v3d_performance_counters.h b/drivers/gpu/drm/v3d/v3d_performance_counters.h
index d919a2fc9449..3d1c64eeb2da 100644
--- a/drivers/gpu/drm/v3d/v3d_performance_counters.h
+++ b/drivers/gpu/drm/v3d/v3d_performance_counters.h
@@ -30,6 +30,12 @@ struct v3d_perfmon_info {
 	 * Array of counters valid for the platform.
 	 */
 	const struct v3d_perf_counter_desc *counters;
+
+	/*
+	 * For some performance analysis tool in user space, we need
+	 * to use one global configured perfmon for all jobs.
+	 */
+	struct v3d_perfmon *global_perfmon;
 };
 
 #endif
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 08d2a2739582..686248d15329 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -120,11 +120,17 @@ v3d_cpu_job_free(struct drm_sched_job *sched_job)
 static void
 v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
 {
+	struct v3d_perfmon *perfmon = v3d->perfmon_info.global_perfmon;
+
+	if (!perfmon)
+		perfmon = job->perfmon;
+
 	if (job->perfmon != v3d->active_perfmon)
 		v3d_perfmon_stop(v3d, v3d->active_perfmon, true);
 
-	if (job->perfmon && v3d->active_perfmon != job->perfmon)
-		v3d_perfmon_start(v3d, job->perfmon);
+	if (perfmon && v3d->active_perfmon != perfmon)
+		v3d_perfmon_start(v3d, perfmon);
+
 }
 
 static void
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 87fc5bb0a61e..960d392d75a3 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -43,6 +43,7 @@ extern "C" {
 #define DRM_V3D_PERFMON_GET_VALUES                0x0a
 #define DRM_V3D_SUBMIT_CPU                        0x0b
 #define DRM_V3D_PERFMON_GET_COUNTER               0x0c
+#define DRM_V3D_PERFMON_SET_GLOBAL                0x0d
 
 #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
 #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
@@ -61,6 +62,8 @@ extern "C" {
 #define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
 #define DRM_IOCTL_V3D_PERFMON_GET_COUNTER DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_COUNTER, \
 						   struct drm_v3d_perfmon_get_counter)
+#define DRM_IOCTL_V3D_PERFMON_SET_GLOBAL  DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_PERFMON_SET_GLOBAL, \
+						   struct drm_v3d_perfmon_set_global)
 
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 #define DRM_V3D_SUBMIT_EXTENSION		  0x02
@@ -765,6 +768,18 @@ struct drm_v3d_perfmon_get_counter {
 	__u8 reserved[7];
 };
 
+/**
+ * struct drm_v3d_perfmon_set_global - ioctl to define a
+ * global performance counter that is used if a job has
+ * not assigned one on its own.
+ */
+
+#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
+struct drm_v3d_perfmon_set_global {
+	__u32 flags;
+	__u32 id;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.0

