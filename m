Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F19D065A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 22:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F6810E0BA;
	Sun, 17 Nov 2024 21:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ImOXgtPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B6610E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 21:41:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5cf7567f369so3369698a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 13:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731879681; x=1732484481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7QhgHhDq9UM5kwsDpNieVyeNit+/tY8NdIt6P3NvHSo=;
 b=ImOXgtPMX8r1M8XBzi2S9k9Hrmiv45g7939ie4IF7dAJj4sY8pD+UkYPv616NU9eDd
 DFp16qC9NB+KDplk8Ghaqgs8ldQm7iPwJ8W+7ALhpKj588pWBiRT/Prbr57BsEZsIU0o
 lsCsTO7h7CgIXHJNRYn4QPcUnAaLuNwnlXIaYzXZ6IBKvWc1MSN3NZKqqByFjYlda2o6
 dKMSIquIj3PihCrwsLMGCmtViHi0/KNJvjmkAEvcs+hopXaoKD2vDUhnhTj+1QKbhHVV
 OI2GDYHkhAhDKE+Nlv78y38cjUJTbBQzuopzIWraYoXWeWdBV6ek6o1jM57XC2XngG9w
 W0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731879681; x=1732484481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7QhgHhDq9UM5kwsDpNieVyeNit+/tY8NdIt6P3NvHSo=;
 b=G23l6SckY4P26s4EQd7Uz7M1frQKmRM9HQqLCeNPb/WvWgDikujxTaHaJ22LSvfzj4
 MAhO9x0sWtK6pBHkhJEpzhNAzs/d58fetjc88hqd/yB0cL6sUraHmxy81ITkveKq3xXc
 qJXfuaE3tCqTw8eQafHDhuIii3EKdsWoyZIOlYLVMvhqjabKbyAC9tu9oZLD0W5NBRsO
 vfs1I4KgWnnihPM0a+I4R/LrJkBeD2Nv3mdPS1+MZBpiAjlJG/j3SORQcU2+hfPeE6uO
 pc9//6lnMqe0tvdk47/tqQLFgW1qC8B/Cn5DpuNkcwdJ9L55+GHxdgiLBTpaPuuUoyWc
 lh7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGwTXtjzfsrAouXS/YOEukVxoJmMAhpeorrTM43MIv+iGBui9XqEwQgls2RVVm345jV8yXUqOmeNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8iWRWAwsVv5/bwo+PiRY+mF500JeL8gp060YhsxzDQJ69fwRs
 Y0LsJ2j1ot2eTD5E1O2WvKXRoRVHe9rbm6MIGmgNkkqJNSWxzSEk
X-Google-Smtp-Source: AGHT+IHLO8CjTNvg5Ey8wF5T2MNa4RjkrrHgz2YWo/58Bo8BwvrPaau4iiFlMHnFiTnxWwXwQjr2NQ==
X-Received: by 2002:a17:907:d29:b0:a9a:294:cb30 with SMTP id
 a640c23a62f3a-aa4834122e4mr903810766b.16.1731879681020; 
 Sun, 17 Nov 2024 13:41:21 -0800 (PST)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfc8a3c139sm488079a12.50.2024.11.17.13.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 13:41:19 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
Date: Sun, 17 Nov 2024 22:41:08 +0100
Message-ID: <20241117214110.162547-1-christian.gmeiner@gmail.com>
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

Add a new ioctl, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, to allow
configuration of a global performance monitor (perfmon).
Use the global perfmon for all jobs to ensure consistent
performance tracking across submissions. This feature is
needed to implement a Perfetto datasources in user-space.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Changes in v3:
- Reworked commit message.
- Refined some code comments.
- Added missing v3d_perfmon_stop(..) call to v3d_perfmon_destroy_ioctl(..).

Changes in v2:
- Reworked commit message.
- Removed num_perfmon counter for tracking perfmon allocations.
- Allowing allocation of perfmons when the global perfmon is active.
- Return -EAGAIN for submissions with a per job perfmon if the global perfmon is active.
---

---
 drivers/gpu/drm/v3d/v3d_drv.c     |  1 +
 drivers/gpu/drm/v3d/v3d_drv.h     |  8 ++++++
 drivers/gpu/drm/v3d/v3d_perfmon.c | 42 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c   | 14 ++++++++---
 drivers/gpu/drm/v3d/v3d_submit.c  | 10 ++++++++
 include/uapi/drm/v3d_drm.h        | 15 +++++++++++
 6 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index d7ff1f5fa481..3c89f0daa5b8 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -214,6 +214,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl, DRM_RENDER_ALLOW | DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_COUNTER, v3d_perfmon_get_counter_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(V3D_PERFMON_SET_GLOBAL, v3d_perfmon_set_global_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver v3d_drm_driver = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index cf4b23369dc4..a0d920ec2b1d 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -179,6 +179,12 @@ struct v3d_dev {
 		u32 num_allocated;
 		u32 pages_allocated;
 	} bo_stats;
+
+	/* To support a performance analysis tool in user space, we require
+	 * a single, globally configured performance monitor (perfmon) for
+	 * all jobs.
+	 */
+	struct v3d_perfmon *global_perfmon;
 };
 
 static inline struct v3d_dev *
@@ -584,6 +590,8 @@ int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv);
 int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv);
+int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv);
 
 /* v3d_sysfs.c */
 int v3d_sysfs_init(struct device *dev);
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 156be13ab2ef..df72171d8c80 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -312,6 +312,9 @@ static int v3d_perfmon_idr_del(int id, void *elem, void *data)
 	if (perfmon == v3d->active_perfmon)
 		v3d_perfmon_stop(v3d, perfmon, false);
 
+	/* If the global perfmon is being destroyed, set it to NULL */
+	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
+
 	v3d_perfmon_put(perfmon);
 
 	return 0;
@@ -383,6 +386,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 {
 	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_perfmon_destroy *req = data;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct v3d_perfmon *perfmon;
 
 	mutex_lock(&v3d_priv->perfmon.lock);
@@ -392,6 +396,13 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 	if (!perfmon)
 		return -EINVAL;
 
+	/* If the active perfmon is being destroyed, stop it first */
+	if (perfmon == v3d->active_perfmon)
+		v3d_perfmon_stop(v3d, perfmon, false);
+
+	/* If the global perfmon is being destroyed, set it to NULL */
+	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
+
 	v3d_perfmon_put(perfmon);
 
 	return 0;
@@ -451,3 +462,34 @@ int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
 
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
+	perfmon = v3d_perfmon_find(v3d_priv, req->id);
+	if (!perfmon)
+		return -EINVAL;
+
+	/* If the request is to clear the global performance monitor */
+	if (req->flags & DRM_V3D_PERFMON_CLEAR_GLOBAL) {
+		if (!v3d->global_perfmon)
+			return -EINVAL;
+
+		xchg(&v3d->global_perfmon, NULL);
+
+		return 0;
+	}
+
+	if (cmpxchg(&v3d->global_perfmon, NULL, perfmon))
+		return -EBUSY;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 08d2a2739582..38690740f593 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -120,11 +120,19 @@ v3d_cpu_job_free(struct drm_sched_job *sched_job)
 static void
 v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
 {
-	if (job->perfmon != v3d->active_perfmon)
+	struct v3d_perfmon *perfmon = v3d->global_perfmon;
+
+	if (!perfmon)
+		perfmon = job->perfmon;
+
+	if (perfmon == v3d->active_perfmon)
+		return;
+
+	if (perfmon != v3d->active_perfmon)
 		v3d_perfmon_stop(v3d, v3d->active_perfmon, true);
 
-	if (job->perfmon && v3d->active_perfmon != job->perfmon)
-		v3d_perfmon_start(v3d, job->perfmon);
+	if (perfmon && v3d->active_perfmon != perfmon)
+		v3d_perfmon_start(v3d, perfmon);
 }
 
 static void
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index d607aa9c4ec2..9e439c9f0a93 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -981,6 +981,11 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 
 	if (args->perfmon_id) {
+		if (v3d->global_perfmon) {
+			ret = -EAGAIN;
+			goto fail_perfmon;
+		}
+
 		render->base.perfmon = v3d_perfmon_find(v3d_priv,
 							args->perfmon_id);
 
@@ -1196,6 +1201,11 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 
 	if (args->perfmon_id) {
+		if (v3d->global_perfmon) {
+			ret = -EAGAIN;
+			goto fail_perfmon;
+		}
+
 		job->base.perfmon = v3d_perfmon_find(v3d_priv,
 						     args->perfmon_id);
 		if (!job->base.perfmon) {
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 87fc5bb0a61e..7c2ad9d0270d 100644
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
 
+#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
+
+/**
+ * struct drm_v3d_perfmon_set_global - ioctl to define a global performance
+ * monitor that is used for all job. If a global performance monitor is
+ * defined, jobs with a self-defined performance monitor are not allowed.
+ */
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

