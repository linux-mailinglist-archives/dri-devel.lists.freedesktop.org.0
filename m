Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28F49E045C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5C010E740;
	Mon,  2 Dec 2024 14:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AnM9tJs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB8C10E740
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:06:24 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so639177366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733148382; x=1733753182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XOw5aKer918R+GPLPrMDEaNawIu96Hv3OhcGYY02/sE=;
 b=AnM9tJs/5iqVBhKaI3VdRKAWEzmqUfGc2kyqdoS/Qg06ZCVwhMXGQcsLIvU/Q5WWJL
 gS7PI6DdV71LZL5MU9gG9UG1P5MmbP7v+b8uMuaqWexu8zMhSPEqGaF4npDJf/7/x4uu
 VS+wakiu/y9ciqc8zOFvDPNoxrObCYYzPONMQgDldNWldMrs+Q29oXcGrQJN4S/2Ok3u
 TuxTnMMLkAZgdIEoxUW/uA+Kirrli3bQcbJ0lkH4vVqHatR9T61JtnVQjL5ppEz19+gp
 ZCZfyHsLiAeIwa/oCv5mU+yYWMI8hacDBSc4LT7oJYGmTUQrxEMxdSaa1aCq7+M35+OU
 ireA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733148382; x=1733753182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOw5aKer918R+GPLPrMDEaNawIu96Hv3OhcGYY02/sE=;
 b=wkNwTN1MdAz9Gk2PKxr9A0lauwODtbot0y1cRA2kp6OdA295RgkiZvq9WBKKbWaZg3
 j6sHyvzuBwhJPn4hSJboqfw0pKTtwbwMZgSsYgRnwdWgn7l4lVvC9A6ZRTgok9mj5tEF
 yWMgnNF/TH4ecpuiUhWRR+BCz5L3VLKY3roVuOCbj9+yRZY3zhq3ZBX6B6oWnjV0wfOz
 5oy/rmg2Ls+azvg0jedxur7i468UoQMWCPk6lzJ1gVDT5rDALvADPsCOsWQhXQ7FPlHA
 I/F3KMjZn3bYDszrghbCEjIXJD6tSfP/EFjEk00rxuWsFo2btzBEoF0kWQOAQ+q4/5KR
 yaNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlE6sxWmYoNhZ5Rqg15RWrPcBfAlCXl1gYfHGr4E9PHh3F+9s8aOUL3eWm99OctSQ1GYAe+pnNfm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwErCF29SQGEPLujyq93rCnKb635Q9PPQ758dNF/QAOq4sclboE
 L+qNq6DgWINzJ2vKhtPX/9d9l/0I5nx2hTp/lA+h4pcbXjRDafMh
X-Gm-Gg: ASbGncu4V6eZIoHcqQYxFMz0v8wNXDYMCCT6KMhMNv3CG2RTlfap3JB0QNIxw1sfogQ
 1o4n2ix4CTVsYr3QJg9ktY6swJ76LTtrDBMTy1alh5xdGjL5DJMIc+cgG98KbaLZkweauh5Zfkx
 rp+EAgiGIa11q1AofnPhkcow34Sz7bH9iRxZyU6+rLqcMlgauImmHKjACEMfleVHRqxL4hBzfUw
 uKgv7F9OYLWzJeDYmKN5yP43k4wfmLoh2783BTN/okMhNhetff69hBu8MlaGV25QA7WM19TkR/T
 HLnifIVxJvkSHUVYVSlqeC/NATlDlp9RCqw=
X-Google-Smtp-Source: AGHT+IH6ZCzkk1EA5lX0p1IOT+zymQfHxPv08GrP+s5FRfXJK4c5xSbCNlJ5zk2biFUBJY/zGu21vA==
X-Received: by 2002:a17:906:9d2:b0:aa5:451c:ce29 with SMTP id
 a640c23a62f3a-aa58102b501mr1859891366b.39.1733148381190; 
 Mon, 02 Dec 2024 06:06:21 -0800 (PST)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c11b4sm510616766b.7.2024.12.02.06.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:06:18 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
Date: Mon,  2 Dec 2024 15:06:13 +0100
Message-ID: <20241202140615.74802-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.47.1
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
Changes in v4:
- Rebased on drm-misc-next.
- Factored out a small change as separate patch.
- Fixed some grammar mistakes: s/job/jobs.

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
 drivers/gpu/drm/v3d/v3d_drv.c     |  1 +
 drivers/gpu/drm/v3d/v3d_drv.h     |  8 +++++++
 drivers/gpu/drm/v3d/v3d_perfmon.c | 37 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c   | 14 +++++++++---
 drivers/gpu/drm/v3d/v3d_submit.c  | 10 +++++++++
 include/uapi/drm/v3d_drm.h        | 15 +++++++++++++
 6 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index fb35c5c3f1a7..8e5cacfa38d3 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -224,6 +224,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl, DRM_RENDER_ALLOW | DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_COUNTER, v3d_perfmon_get_counter_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(V3D_PERFMON_SET_GLOBAL, v3d_perfmon_set_global_ioctl, DRM_RENDER_ALLOW),
 };

 static const struct drm_driver v3d_drm_driver = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index de73eefff9ac..dc1cfe2e14be 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -183,6 +183,12 @@ struct v3d_dev {
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
@@ -594,6 +600,8 @@ int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv);
 int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv);
+int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv);

 /* v3d_sysfs.c */
 int v3d_sysfs_init(struct device *dev);
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index b4c3708ea781..a1429b9684e0 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -313,6 +313,9 @@ static int v3d_perfmon_idr_del(int id, void *elem, void *data)
 	if (perfmon == v3d->active_perfmon)
 		v3d_perfmon_stop(v3d, perfmon, false);

+	/* If the global perfmon is being destroyed, set it to NULL */
+	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
+
 	v3d_perfmon_put(perfmon);

 	return 0;
@@ -398,6 +401,9 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 	if (perfmon == v3d->active_perfmon)
 		v3d_perfmon_stop(v3d, perfmon, false);

+	/* If the global perfmon is being destroyed, set it to NULL */
+	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
+
 	v3d_perfmon_put(perfmon);

 	return 0;
@@ -457,3 +463,34 @@ int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,

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
index 99ac4995b5a1..a6c3760da6ed 100644
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
index 2376c73abca1..97b1faf04fc4 100644
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
@@ -766,6 +769,18 @@ struct drm_v3d_perfmon_get_counter {
 	__u8 reserved[7];
 };

+#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
+
+/**
+ * struct drm_v3d_perfmon_set_global - ioctl to define a global performance
+ * monitor that is used for all jobs. If a global performance monitor is
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
2.47.1

