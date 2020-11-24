Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769ED2C1B5F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 03:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49E6E19B;
	Tue, 24 Nov 2020 02:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4122C6E19B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 02:19:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y7so16900287pfq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 18:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gED05o6qM6JYcgzJSGphWESgZ2iZtaePZaZE1VI8plA=;
 b=C5gtRUcIioc273NDlKhZJg7LPyfXhsHvAMgkxlNKOvZGDGAlKMmZ/adtk2QLe7GAgx
 3C6dAxOsyvRbaA7OUQdURQ3X3UcEx+L0Pt6SB1H5yfXjBD5J6id0U81+qzf6BRRhZ4ZF
 jNEDUwvlRyXJ6oiSwaBTcSduOqwOXbs/kwkDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gED05o6qM6JYcgzJSGphWESgZ2iZtaePZaZE1VI8plA=;
 b=bSFPGx9pZJnbceuVExPdKOhq0N5MMJzvxl6jeNnjlUFGhUEYLP0HA6Tf2j4JqG5Pd4
 ri0PK1OFp8wfw0/3Ri2rRTlpLQcuT/4apYysKzSBpG1zKumHHJIE9E/+B1xjL9tJYPoP
 sXctMuxS3OELOGvkc7gHG9u6lAN1Eb79iNBCc9rkDKrP4ZLJ3d0nA3FP9ceKOe9OMEfG
 gZpVWTDr4GtrIR+MXdJGh+mlIYGFfGMF2CNsD/GuKOdOEy5SS78K4MigEIgeWbb2/mbB
 gctCGNLu9TIRkyXmJqjhielxZc2IxFOjA3BG30eQZxQa0hca5aPNXwhMV5TLWfhvBCxI
 BKMQ==
X-Gm-Message-State: AOAM530/HJ9p5EX1l4qu0zb5XzdxVvbKQbAqkcr6fFTaTxyH6odb3smK
 SXhcfnBOLYOLsHfXGR21InqWSiKzIAksmA==
X-Google-Smtp-Source: ABdhPJxGizH2ecoSD65/W25MPMXcCa032bnpiBtuxUnCiDOt1g80uHeFuq7rSHCng9oH7SRubLnAxQ==
X-Received: by 2002:a17:90a:5404:: with SMTP id
 z4mr2107046pjh.198.1606184345521; 
 Mon, 23 Nov 2020 18:19:05 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o198sm6209642pfg.102.2020.11.23.18.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 18:19:04 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/virtio: virtio_{blah} --> virtio_gpu_{blah}
Date: Mon, 23 Nov 2020 18:19:00 -0800
Message-Id: <20201124021902.407-1-gurchetansingh@chromium.org>
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
Cc: anthoine.bourgeois@gmail.co, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio_gpu typically uses the prefix virtio_gpu, but there are
a few places where the virtio prefix is used.  Modify this for
consistency.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
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
