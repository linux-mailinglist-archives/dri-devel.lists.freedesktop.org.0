Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4C9BE5EC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 12:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EB910E6BE;
	Wed,  6 Nov 2024 11:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OSZZRoX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8AF10E6BD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730893820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EDWhiglNUQPSn7bgg++EDpDvLTxJWbDEqAy3UyXkmFg=;
 b=OSZZRoX0GBpdbU2zJIeMywP+XwEx60VBDcPeKl7DeMZtnjeV3hQEDo6Nwn3tXV6PArv2di
 6oQ71Xa6gtsEA0ftnMVHRo7/amlsMRo85lez6GLX98fAfigBjMwlTwXGwkX3UVVUBoZtwF
 41zhtPTlq7ctORZw724j6qUtB+Z+dYI=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-OYT9Wm-8M0Sju5JJhK9ePQ-1; Wed, 06 Nov 2024 06:50:19 -0500
X-MC-Unique: OYT9Wm-8M0Sju5JJhK9ePQ-1
X-Mimecast-MFC-AGG-ID: OYT9Wm-8M0Sju5JJhK9ePQ
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-7ee22af5bb7so4381812a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 03:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730893818; x=1731498618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EDWhiglNUQPSn7bgg++EDpDvLTxJWbDEqAy3UyXkmFg=;
 b=FMTTXEks3HtrW5MyqgABoj47OUJ/0u7ColNGChuTHo4ry1ZJkQyUQzz9qiVQDnmdvG
 yYozF0u6Y1wqxvVkM5rq42fesHd/Uh4RzHjSd8nK6+inzXbJhiyoVVuQdcEaZmoSef7w
 kcEeltBpPg5I6gEerj4yOYD+wmnE4UsIXoq6u4ipxP8Ekyu+a24GVrWd60GJ/Ec6gNGK
 keIc35AZhLUgPnONShRC4CrSaXIF4d8bf/Mu7dmqAQsQeTGMMNItCrSIwaHBuSvaEK4o
 6agDAFIRxJaoreWnNMFyXfhgtS3zJNQ67wAYnJIzATcj95v6Zr0zaGsfhMwVBVOwlJLw
 VjBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQz+8GRyLbafJKL+AIPweuhJt8jQxle6681J5VpxDWkgbN8wi19ovlAoTRINDJKNBmgjZIdUi4B4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEO8Jo5GaNAffvlpesEER1dF1AzzhNWrLu+iBTDnPXa3s5OuHt
 vwQ+sUcqxEMAGorQo175gPRSTVbX1xr/ShwTLFtLDe7hmNYTc8+RHA6Q4buSIKXjIa+c+UQeesa
 qmPMoMw7l6P6qK5AKvQbHFpjHOxlFRJv9xtCZNf4GNhFMx9j01ur7LUkpYJlRMkmRjg==
X-Received: by 2002:a05:6a20:a10e:b0:1db:e49a:d54a with SMTP id
 adf61e73a8af0-1dbe49ad638mr11623636637.19.1730893818086; 
 Wed, 06 Nov 2024 03:50:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ4NHYzrKOuzafalO/cfCzYDktHeaun5/P/vqpAOwScrzpmHRIKuDnFJb8atnKyyBh8D9x2Q==
X-Received: by 2002:a05:6a20:a10e:b0:1db:e49a:d54a with SMTP id
 adf61e73a8af0-1dbe49ad638mr11623617637.19.1730893817648; 
 Wed, 06 Nov 2024 03:50:17 -0800 (PST)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc20f50esm11771071b3a.94.2024.11.06.03.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 03:50:16 -0800 (PST)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, simona@ffwll.ch
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ryosuke Yasuoka <ryasuoka@redhat.com>
Subject: [PATCH v2] drm/virtio: Add drm_panic support
Date: Wed,  6 Nov 2024 20:49:30 +0900
Message-ID: <20241106114932.3101891-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CP7Bqmtijs6w9aT2nPBxoMF9sdApJ3N34vtLEkSKLwc_1730893818
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

From: Jocelyn Falempe <jfalempe@redhat.com>

Virtio gpu supports the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
v2:
- Remove unnecessary virtio_gpu_vbuffer_inline
- Remove reclaim_list and just call drm_gem_object_put() if there is an
  obj
- Don't wait for an event in virtio_gpu_panic_queue_ctrl_sgs and just
  return -ENOMEM. Also add error handlers for this error.
- Use virtio_gpu_panic_queue_fenced_ctrl_buffer() in
virtio_gpu_panic_cmd_resource_flush
- Remove fence and objs arguments because these are always NULL in panic
  handler. 
- Rename virtio_gpu_panic_queue_fenced_ctrl_buffer to
  ..._queue_ctrl_buffer
- Rename virtio_gpu_panic_alloc_cmd to ..._panic_init_cmd

v1:
https://lore.kernel.org/lkml/20241031032101.2836264-1-ryasuoka@redhat.com/T/


 drivers/gpu/drm/virtio/virtgpu_drv.h   |  18 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 168 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 148 +++++++++++++++++++++-
 3 files changed, 328 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db8..5387e3fd9dee 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -125,6 +125,12 @@ struct virtio_gpu_object_array {
 	struct drm_gem_object *objs[] __counted_by(total);
 };
 
+#define MAX_INLINE_CMD_SIZE   96
+#define MAX_INLINE_RESP_SIZE  24
+#define VBUFFER_SIZE	      (sizeof(struct virtio_gpu_vbuffer) \
+			      + MAX_INLINE_CMD_SIZE		 \
+			      + MAX_INLINE_RESP_SIZE)
+
 struct virtio_gpu_vbuffer;
 struct virtio_gpu_device;
 
@@ -329,12 +335,23 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_object *bo);
+int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+					     uint64_t offset,
+					     uint32_t width, uint32_t height,
+					     uint32_t x, uint32_t y,
+					     struct virtio_gpu_object_array *objs,
+					     struct virtio_gpu_vbuffer *vbuf);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
 					uint32_t x, uint32_t y,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
+int virtio_gpu_panic_cmd_resource_flush(struct virtio_gpu_device *vgdev,
+					struct virtio_gpu_vbuffer *vbuf,
+					uint32_t resource_id,
+					uint32_t x, uint32_t y,
+					uint32_t width, uint32_t height);
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
@@ -399,6 +416,7 @@ void virtio_gpu_ctrl_ack(struct virtqueue *vq);
 void virtio_gpu_cursor_ack(struct virtqueue *vq);
 void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
+void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev);
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
 int
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a72a2dbda031..056d1e7877c1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -26,6 +26,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 
 #include "virtgpu_drv.h"
 
@@ -108,6 +110,30 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	return ret;
 }
 
+/* For drm panic */
+static int virtio_gpu_panic_update_dumb_bo(struct virtio_gpu_device *vgdev,
+					   struct drm_plane_state *state,
+					   struct drm_rect *rect,
+					   struct virtio_gpu_object_array *objs,
+					   struct virtio_gpu_vbuffer *vbuf)
+{
+	int ret;
+	struct virtio_gpu_object *bo =
+		gem_to_virtio_gpu_obj(state->fb->obj[0]);
+	uint32_t w = rect->x2 - rect->x1;
+	uint32_t h = rect->y2 - rect->y1;
+	uint32_t x = rect->x1;
+	uint32_t y = rect->y1;
+	uint32_t off = x * state->fb->format->cpp[0] +
+		y * state->fb->pitches[0];
+
+	virtio_gpu_array_add_obj(objs, &bo->base.base);
+
+	ret = virtio_gpu_panic_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
+						       objs, vbuf);
+	return ret;
+}
+
 static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 				      struct drm_plane_state *state,
 				      struct drm_rect *rect)
@@ -131,6 +157,26 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 					   objs, NULL);
 }
 
+/* For drm_panic */
+static int virtio_gpu_panic_resource_flush(struct drm_plane *plane,
+					   struct virtio_gpu_vbuffer *vbuf,
+					   uint32_t x, uint32_t y,
+					   uint32_t width, uint32_t height)
+{
+	int ret;
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object *bo;
+
+	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+
+	ret = virtio_gpu_panic_cmd_resource_flush(vgdev, vbuf, bo->hw_res_handle, x, y,
+						  width, height);
+	return ret;
+}
+
 static void virtio_gpu_resource_flush(struct drm_plane *plane,
 				      uint32_t x, uint32_t y,
 				      uint32_t width, uint32_t height)
@@ -359,11 +405,126 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	virtio_gpu_cursor_ping(vgdev, output);
 }
 
+static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
+					 struct drm_scanout_buffer *sb)
+{
+	struct virtio_gpu_object *bo;
+
+	if (!plane->state || !plane->state->fb || !plane->state->visible)
+		return -ENODEV;
+
+	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
+
+	/* try to vmap it if possible */
+	if (!bo->base.vaddr) {
+		int ret;
+
+		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
+		if (ret)
+			return ret;
+	} else {
+		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	}
+
+	sb->format = plane->state->fb->format;
+	sb->height = plane->state->fb->height;
+	sb->width = plane->state->fb->width;
+	sb->pitch[0] = plane->state->fb->pitches[0];
+	return 0;
+}
+
+struct virtio_gpu_panic_object_array {
+	struct ww_acquire_ctx ticket;
+	struct list_head next;
+	u32 nents, total;
+	struct drm_gem_object *objs;
+};
+
+static void *virtio_panic_buffer;
+
+static void virtio_gpu_panic_put_vbuf(struct virtqueue *vq,
+				      struct virtio_gpu_vbuffer *vbuf,
+				      struct virtio_gpu_object_array *objs)
+{
+	unsigned int len;
+
+	/* waiting vbuf to be used */
+	while (1) {
+		if (vbuf == virtqueue_get_buf(vq, &len)) {
+			if (objs != NULL && vbuf->objs)
+				drm_gem_object_put(objs->objs[0]);
+			break;
+		}
+	}
+}
+
+static void virtio_panic_flush(struct drm_plane *plane)
+{
+	int ret;
+	struct virtio_gpu_object *bo;
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct drm_rect rect;
+	struct virtio_gpu_vbuffer *vbuf_dumb_bo = virtio_panic_buffer;
+	struct virtio_gpu_vbuffer *vbuf_resource_flush = virtio_panic_buffer + VBUFFER_SIZE;
+
+	rect.x1 = 0;
+	rect.y1 = 0;
+	rect.x2 = plane->state->fb->width;
+	rect.y2 = plane->state->fb->height;
+
+	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
+
+	struct drm_gem_object obj;
+	struct virtio_gpu_panic_object_array objs = {
+		.next = { NULL, NULL },
+		.nents = 0,
+		.total = 1,
+		.objs = &obj
+	};
+
+	if (bo->dumb) {
+		ret = virtio_gpu_panic_update_dumb_bo(vgdev,
+						      plane->state,
+						      &rect,
+						      (struct virtio_gpu_object_array *)&objs,
+						      vbuf_dumb_bo);
+		if (ret) {
+			if (vbuf_dumb_bo->objs)
+				drm_gem_object_put(&objs.objs[0]);
+			return;
+		}
+	}
+
+	ret = virtio_gpu_panic_resource_flush(plane, vbuf_resource_flush,
+					      plane->state->src_x >> 16,
+					      plane->state->src_y >> 16,
+					      plane->state->src_w >> 16,
+					      plane->state->src_h >> 16);
+	if (ret) {
+		virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
+					  vbuf_dumb_bo,
+					  (struct virtio_gpu_object_array *)&objs);
+		return;
+	}
+
+	virtio_gpu_panic_notify(vgdev);
+
+	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
+				  vbuf_dumb_bo,
+				  (struct virtio_gpu_object_array *)&objs);
+	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
+				  vbuf_resource_flush,
+				  NULL);
+}
+
 static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
 	.prepare_fb		= virtio_gpu_plane_prepare_fb,
 	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_primary_plane_update,
+	.get_scanout_buffer	= virtio_drm_get_scanout_buffer,
+	.panic_flush		= virtio_panic_flush,
 };
 
 static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
@@ -383,6 +544,13 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 	const uint32_t *formats;
 	int nformats;
 
+	/* allocate panic buffers */
+	if (index == 0 && type == DRM_PLANE_TYPE_PRIMARY) {
+		virtio_panic_buffer = drmm_kzalloc(dev, 2 * VBUFFER_SIZE, GFP_KERNEL);
+		if (!virtio_panic_buffer)
+			return ERR_PTR(-ENOMEM);
+	}
+
 	if (type == DRM_PLANE_TYPE_CURSOR) {
 		formats = virtio_gpu_cursor_formats;
 		nformats = ARRAY_SIZE(virtio_gpu_cursor_formats);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0d3d0d09f39b..f6e1655458dd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -36,12 +36,6 @@
 #include "virtgpu_drv.h"
 #include "virtgpu_trace.h"
 
-#define MAX_INLINE_CMD_SIZE   96
-#define MAX_INLINE_RESP_SIZE  24
-#define VBUFFER_SIZE          (sizeof(struct virtio_gpu_vbuffer) \
-			       + MAX_INLINE_CMD_SIZE		 \
-			       + MAX_INLINE_RESP_SIZE)
-
 static void convert_to_hw_box(struct virtio_gpu_box *dst,
 			      const struct drm_virtgpu_3d_box *src)
 {
@@ -311,6 +305,34 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 	return sgt;
 }
 
+/* For drm_panic */
+static int virtio_gpu_panic_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
+					   struct virtio_gpu_vbuffer *vbuf,
+					   int elemcnt,
+					   struct scatterlist **sgs,
+					   int outcnt,
+					   int incnt)
+{
+	struct virtqueue *vq = vgdev->ctrlq.vq;
+	int ret;
+
+	if (vgdev->has_indirect)
+		elemcnt = 1;
+
+	if (vq->num_free < elemcnt)
+		return -ENOMEM;
+
+	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
+	WARN_ON(ret);
+
+	vbuf->seqno = ++vgdev->ctrlq.seqno;
+	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
+
+	atomic_inc(&vgdev->pending_commands);
+
+	return 0;
+}
+
 static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 				     struct virtio_gpu_vbuffer *vbuf,
 				     struct virtio_gpu_fence *fence,
@@ -368,6 +390,33 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
+/* For drm_panic */
+static int virtio_gpu_panic_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
+					      struct virtio_gpu_vbuffer *vbuf)
+{
+	struct scatterlist *sgs[3], vcmd, vresp;
+	int elemcnt = 0, outcnt = 0, incnt = 0, ret;
+
+	/* set up vcmd */
+	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
+	elemcnt++;
+	sgs[outcnt] = &vcmd;
+	outcnt++;
+
+	/* set up vresp */
+	if (vbuf->resp_size) {
+		sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
+		elemcnt++;
+		sgs[outcnt + incnt] = &vresp;
+		incnt++;
+	}
+
+	ret = virtio_gpu_panic_queue_ctrl_sgs(vgdev, vbuf,
+					      elemcnt, sgs,
+					      outcnt, incnt);
+	return ret;
+}
+
 static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf,
 					       struct virtio_gpu_fence *fence)
@@ -422,6 +471,21 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	return ret;
 }
 
+/* For drm_panic */
+void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev)
+{
+	bool notify;
+
+	if (!atomic_read(&vgdev->pending_commands))
+		return;
+
+	atomic_set(&vgdev->pending_commands, 0);
+	notify = virtqueue_kick_prepare(vgdev->ctrlq.vq);
+
+	if (notify)
+		virtqueue_notify(vgdev->ctrlq.vq);
+}
+
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
 {
 	bool notify;
@@ -567,6 +631,44 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
+/* For drm_panic */
+static void virtio_gpu_panic_init_cmd(struct virtio_gpu_device *vgdev,
+				      struct virtio_gpu_vbuffer *vbuf,
+				      int cmd_size)
+{
+	vbuf->buf = (void *)vbuf + sizeof(*vbuf);
+	vbuf->size = cmd_size;
+	vbuf->resp_cb = NULL;
+	vbuf->resp_size = sizeof(struct virtio_gpu_ctrl_hdr);
+	vbuf->resp_buf = (void *)vbuf->buf + cmd_size;
+}
+
+/* For drm_panic */
+int virtio_gpu_panic_cmd_resource_flush(struct virtio_gpu_device *vgdev,
+					struct virtio_gpu_vbuffer *vbuf,
+					uint32_t resource_id,
+					uint32_t x, uint32_t y,
+					uint32_t width, uint32_t height)
+{
+	int ret;
+	struct virtio_gpu_resource_flush *cmd_p;
+
+	virtio_gpu_panic_init_cmd(vgdev, vbuf,
+				  sizeof(struct virtio_gpu_resource_flush));
+	cmd_p = (void *)vbuf->buf;
+	vbuf->objs = NULL;
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_FLUSH);
+	cmd_p->resource_id = cpu_to_le32(resource_id);
+	cmd_p->r.width = cpu_to_le32(width);
+	cmd_p->r.height = cpu_to_le32(height);
+	cmd_p->r.x = cpu_to_le32(x);
+	cmd_p->r.y = cpu_to_le32(y);
+
+	ret = virtio_gpu_panic_queue_ctrl_buffer(vgdev, vbuf);
+	return ret;
+}
+
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
@@ -591,6 +693,40 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+/* For drm_panic */
+int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+					     uint64_t offset,
+					     uint32_t width, uint32_t height,
+					     uint32_t x, uint32_t y,
+					     struct virtio_gpu_object_array *objs,
+					     struct virtio_gpu_vbuffer *vbuf)
+{
+	int ret;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_transfer_to_host_2d *cmd_p;
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
+
+	if (virtio_gpu_is_shmem(bo) && use_dma_api)
+		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
+					    bo->base.sgt, DMA_TO_DEVICE);
+
+	virtio_gpu_panic_init_cmd(vgdev, vbuf,
+				  sizeof(struct virtio_gpu_transfer_to_host_2d));
+	cmd_p = (void *)vbuf->buf;
+	vbuf->objs = objs;
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->offset = cpu_to_le64(offset);
+	cmd_p->r.width = cpu_to_le32(width);
+	cmd_p->r.height = cpu_to_le32(height);
+	cmd_p->r.x = cpu_to_le32(x);
+	cmd_p->r.y = cpu_to_le32(y);
+
+	ret = virtio_gpu_panic_queue_ctrl_buffer(vgdev, vbuf);
+	return ret;
+}
+
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
-- 
2.47.0

