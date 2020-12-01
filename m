Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E02C9513
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 03:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4AF89E86;
	Tue,  1 Dec 2020 02:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B18C89E86
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 02:16:27 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id t21so278801pjw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dWrOjJJm+YyZTtHovQRGFSYuwGDLdsJ5Dt5lWzWJOe0=;
 b=Kb3XJaoa7KbkOpm6Fd7t0Ib6Y8zD4YWmLPqQgZztsakkYQkARVK6uMaOGv3Vg9Xxz4
 Gfu+ZE67ud2CZqCLhhXzrTezGPDolNUpHzFbdFV5pD9PBPbDQtVepT24Ksk9isvi1avi
 gxrV05wLek1mMzNahiqG+y7rv+tYe+Dadxrsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dWrOjJJm+YyZTtHovQRGFSYuwGDLdsJ5Dt5lWzWJOe0=;
 b=JC/+Fk5XD02JfUQV9jOD1gh3KRfVJAX0siuaJp1ZNDb7IU5r+Bm8d2etq4jkh/bq1M
 6pZZDRp/bLbQ1Xewoae52RNbiCmp8FBqwvo9RdCTnlOon250JUR9Q1poqtWY4HPOnaNt
 ecriol/71nv/6EwE75XvkZvFXP4KOxNfOjbo3g0lt67486pJGIH7sBUmW1sM9QbAYL3O
 zJ9724TgP7XotzPcv9O47q9uEx2R1VAL3gpEYcrmzmIFI5HCMvJLdeDV7fg+mJXNrMVm
 KRmXHYWta5OLiOW0dy0iJ7N/9AVmquSqypmncxj1ym3IJOa94MPqDxzd1kMznp2sFM2j
 oKuQ==
X-Gm-Message-State: AOAM533CG/L+12bcN5GeqFL076CL/ZPrxzQxFs6/qfXKdb3wqjidZHyl
 Odpgfj5xBX+PUFfSPrR/f/gNPy29DXGwEA==
X-Google-Smtp-Source: ABdhPJweVT97MqbD8WC3lFpK2vUUtBRArfPbn3hJSoNK+U/25FulV0H3wvTI+o/gGXHIwwrNDK+NxQ==
X-Received: by 2002:a17:902:a9c7:b029:d6:da66:253c with SMTP id
 b7-20020a170902a9c7b02900d6da66253cmr561167plr.19.1606788986683; 
 Mon, 30 Nov 2020 18:16:26 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id a5sm313308pfr.199.2020.11.30.18.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 18:16:26 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/virtio: virtio_{blah} --> virtio_gpu_{blah}
Date: Mon, 30 Nov 2020 18:16:21 -0800
Message-Id: <20201201021623.619-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio_gpu typically uses the prefix virtio_gpu, but there are
a few places where the virtio prefix is used.  Modify this for
consistency.

v3: add r-b tags

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 24 ++++++++++--------
 drivers/gpu/drm/virtio/virtgpu_fence.c   | 32 +++++++++++++-----------
 2 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 5fefc88d47e4..c2b20e0ee030 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -28,14 +28,13 @@
 
 #include "virtgpu_drv.h"
 
-static void virtio_add_bool(struct seq_file *m, const char *name,
-				    bool value)
+static void virtio_gpu_add_bool(struct seq_file *m, const char *name,
+				bool value)
 {
 	seq_printf(m, "%-16s : %s\n", name, value ? "yes" : "no");
 }
 
-static void virtio_add_int(struct seq_file *m, const char *name,
-				   int value)
+static void virtio_gpu_add_int(struct seq_file *m, const char *name, int value)
 {
 	seq_printf(m, "%-16s : %d\n", name, value);
 }
@@ -45,13 +44,16 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
 
-	virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
-	virtio_add_bool(m, "edid", vgdev->has_edid);
-	virtio_add_bool(m, "indirect", vgdev->has_indirect);
-	virtio_add_bool(m, "resource uuid", vgdev->has_resource_assign_uuid);
-	virtio_add_bool(m, "blob resources", vgdev->has_resource_blob);
-	virtio_add_int(m, "cap sets", vgdev->num_capsets);
-	virtio_add_int(m, "scanouts", vgdev->num_scanouts);
+	virtio_gpu_add_bool(m, "virgl", vgdev->has_virgl_3d);
+	virtio_gpu_add_bool(m, "edid", vgdev->has_edid);
+	virtio_gpu_add_bool(m, "indirect", vgdev->has_indirect);
+
+	virtio_gpu_add_bool(m, "resource uuid",
+			    vgdev->has_resource_assign_uuid);
+
+	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
+	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
+	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
 	if (vgdev->host_visible_region.len) {
 		seq_printf(m, "%-16s : 0x%lx +0x%lx\n", "host visible region",
 			   (unsigned long)vgdev->host_visible_region.addr,
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 728ca36f6327..586034c90587 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -27,22 +27,22 @@
 
 #include "virtgpu_drv.h"
 
-#define to_virtio_fence(x) \
+#define to_virtio_gpu_fence(x) \
 	container_of(x, struct virtio_gpu_fence, f)
 
-static const char *virtio_get_driver_name(struct dma_fence *f)
+static const char *virtio_gpu_get_driver_name(struct dma_fence *f)
 {
 	return "virtio_gpu";
 }
 
-static const char *virtio_get_timeline_name(struct dma_fence *f)
+static const char *virtio_gpu_get_timeline_name(struct dma_fence *f)
 {
 	return "controlq";
 }
 
-static bool virtio_fence_signaled(struct dma_fence *f)
+static bool virtio_gpu_fence_signaled(struct dma_fence *f)
 {
-	struct virtio_gpu_fence *fence = to_virtio_fence(f);
+	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
 
 	if (WARN_ON_ONCE(fence->f.seqno == 0))
 		/* leaked fence outside driver before completing
@@ -53,25 +53,26 @@ static bool virtio_fence_signaled(struct dma_fence *f)
 	return false;
 }
 
-static void virtio_fence_value_str(struct dma_fence *f, char *str, int size)
+static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
 {
 	snprintf(str, size, "%llu", f->seqno);
 }
 
-static void virtio_timeline_value_str(struct dma_fence *f, char *str, int size)
+static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
+					  int size)
 {
-	struct virtio_gpu_fence *fence = to_virtio_fence(f);
+	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
 
 	snprintf(str, size, "%llu",
 		 (u64)atomic64_read(&fence->drv->last_fence_id));
 }
 
-static const struct dma_fence_ops virtio_fence_ops = {
-	.get_driver_name     = virtio_get_driver_name,
-	.get_timeline_name   = virtio_get_timeline_name,
-	.signaled            = virtio_fence_signaled,
-	.fence_value_str     = virtio_fence_value_str,
-	.timeline_value_str  = virtio_timeline_value_str,
+static const struct dma_fence_ops virtio_gpu_fence_ops = {
+	.get_driver_name     = virtio_gpu_get_driver_name,
+	.get_timeline_name   = virtio_gpu_get_timeline_name,
+	.signaled            = virtio_gpu_fence_signaled,
+	.fence_value_str     = virtio_gpu_fence_value_str,
+	.timeline_value_str  = virtio_gpu_timeline_value_str,
 };
 
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
@@ -88,7 +89,8 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
 	 * unknown yet.  The fence must not be used outside of the driver
 	 * until virtio_gpu_fence_emit is called.
 	 */
-	dma_fence_init(&fence->f, &virtio_fence_ops, &drv->lock, drv->context, 0);
+	dma_fence_init(&fence->f, &virtio_gpu_fence_ops, &drv->lock, drv->context,
+		       0);
 
 	return fence;
 }
-- 
2.29.2.454.gaff20da3a2-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
