Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94EE170D29
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2473B6EBE4;
	Thu, 27 Feb 2020 00:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1156EBDF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:17 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b22so362495pls.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EIlYRYGhIf+QMnBb1jhifA/zzI5e2fnp8oI0ZA32j8E=;
 b=NqFlCcZ/x2pLnG97d65ObEtDPFmHk4IrI51mhKcC0BQmXNMz9jRz2DoA9Ezgz5wPhk
 7L/paYzNi8Gy9OajZ1DAa+EVncre014GoTxhMJaxsshn/wJ1p3naDwyugDGfo9ZcZWHW
 awsqVUlkcIn0xnEu5A36dt8/dsO/8Us3PtF54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EIlYRYGhIf+QMnBb1jhifA/zzI5e2fnp8oI0ZA32j8E=;
 b=gK40vbTlR2dJLGvSG47mHbevbI+fP2rW6WRvwKBuUunbWCw/oWP1gwBZaOmASNN5fR
 d6r9M4ohBEE/WLqfvMJgvCTEo/0Dhpm5fCtPP+RrAjfqHfxJhQ0x8Cw1h92R5kfweRJl
 hmsb5znEO0RowNUIrGh6I8mk1O6cpjMIprZBxBQFzRwr4Ddt88Xxxy++ioyAX3IA/eGH
 rNXOw8WuHUIyr9EkoGepgFQkKOv/ywXduLKXGv2d0uM6L7Lesc0byEL0+xDeDgLBoPo8
 BwKxYJtviPbFIIVDSAHf+ZADoMWOJpPwYlNS8PhlKA0xy9+UpY0AD50WhocDdAd0jhkd
 sgVw==
X-Gm-Message-State: APjAAAXhnKafkXtrqFw3p6WuWRwaxjjL6BjlF0dKXW9YY0m10Jbt7WF7
 xPSfdZI99ZahmevfikDIcYnEanJArMM=
X-Google-Smtp-Source: APXvYqyOpnuqtkoAcXDW5gu5Hv/ZEtVj6Z/QEckOVXU63ba5RTRNOPsoc1lnEfCm/8B9UNxB5my76g==
X-Received: by 2002:a17:902:8bc9:: with SMTP id
 r9mr1885475plo.48.1582763176295; 
 Wed, 26 Feb 2020 16:26:16 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:15 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 6/8] drm/virtio: rename virtio_gpu_object_array to
 virtio_gpu_gem_array
Date: Wed, 26 Feb 2020 16:25:59 -0800
Message-Id: <20200227002601.745-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plan is to use this array with VRAM objects too.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  36 ++++----
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 116 ++++++++++++------------
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  32 +++----
 drivers/gpu/drm/virtio/virtgpu_object.c |  20 ++--
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  22 ++---
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  62 +++++++------
 6 files changed, 145 insertions(+), 143 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0e99487f2105..a1888a20d311 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -79,7 +79,7 @@ struct virtio_gpu_object {
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
 
-struct virtio_gpu_object_array {
+struct virtio_gpu_gem_array {
 	struct ww_acquire_ctx ticket;
 	struct list_head next;
 	u32 nents, total;
@@ -118,7 +118,7 @@ struct virtio_gpu_vbuffer {
 	virtio_gpu_resp_cb resp_cb;
 	void *resp_cb_data;
 
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 	struct list_head list;
 };
 
@@ -244,18 +244,18 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 			      struct drm_device *dev,
 			      uint32_t handle, uint64_t *offset_p);
 
-struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
-struct virtio_gpu_object_array*
+struct virtio_gpu_gem_array *virtio_gpu_array_alloc(u32 nents);
+struct virtio_gpu_gem_array*
 virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
-void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
+void virtio_gpu_array_add_obj(struct virtio_gpu_gem_array *array,
 			      struct drm_gem_object *obj);
-int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
-void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
-void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
+int virtio_gpu_array_lock_resv(struct virtio_gpu_gem_array *array);
+void virtio_gpu_array_unlock_resv(struct virtio_gpu_gem_array *array);
+void virtio_gpu_array_add_fence(struct virtio_gpu_gem_array *array,
 				struct dma_fence *fence);
-void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
+void virtio_gpu_array_put_free(struct virtio_gpu_gem_array *array);
 void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
-				       struct virtio_gpu_object_array *objs);
+				       struct virtio_gpu_gem_array *array);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
 
 /* virtio vg */
@@ -264,7 +264,7 @@ void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
 				    struct virtio_gpu_object_params *params,
-				    struct virtio_gpu_object_array *objs,
+				    struct virtio_gpu_gem_array *array,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct drm_gem_object *obj);
@@ -272,7 +272,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
 					uint32_t x, uint32_t y,
-					struct virtio_gpu_object_array *objs,
+					struct virtio_gpu_gem_array *array,
 					struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
@@ -302,32 +302,32 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 				    uint32_t id);
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    struct virtio_gpu_object_array *objs);
+					    struct virtio_gpu_gem_array *array);
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    struct virtio_gpu_object_array *objs);
+					    struct virtio_gpu_gem_array *array);
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 			   void *data, uint32_t data_size,
 			   uint32_t ctx_id,
-			   struct virtio_gpu_object_array *objs,
+			   struct virtio_gpu_gem_array *array,
 			   struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
 					  struct drm_virtgpu_3d_box *box,
-					  struct virtio_gpu_object_array *objs,
+					  struct virtio_gpu_gem_array *array,
 					  struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
 					struct drm_virtgpu_3d_box *box,
-					struct virtio_gpu_object_array *objs,
+					struct virtio_gpu_gem_array *array,
 					struct virtio_gpu_fence *fence);
 void
 virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 				  struct virtio_gpu_object *bo,
 				  struct virtio_gpu_object_params *params,
-				  struct virtio_gpu_object_array *objs,
+				  struct virtio_gpu_gem_array *array,
 				  struct virtio_gpu_fence *fence);
 void virtio_gpu_ctrl_ack(struct virtqueue *vq);
 void virtio_gpu_cursor_ack(struct virtqueue *vq);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 0d6152c99a27..53181fe2afe0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -111,18 +111,18 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 {
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 
 	if (!vgdev->has_virgl_3d)
 		return 0;
 
-	objs = virtio_gpu_array_alloc(1);
-	if (!objs)
+	array = virtio_gpu_array_alloc(1);
+	if (!array)
 		return -ENOMEM;
-	virtio_gpu_array_add_obj(objs, obj);
+	virtio_gpu_array_add_obj(array, obj);
 
 	virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
-					       objs);
+					       array);
 	virtio_gpu_notify(vgdev);
 	return 0;
 }
@@ -132,119 +132,119 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 {
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 
 	if (!vgdev->has_virgl_3d)
 		return;
 
-	objs = virtio_gpu_array_alloc(1);
-	if (!objs)
+	array = virtio_gpu_array_alloc(1);
+	if (!array)
 		return;
-	virtio_gpu_array_add_obj(objs, obj);
+	virtio_gpu_array_add_obj(array, obj);
 
 	virtio_gpu_cmd_context_detach_resource(vgdev, vfpriv->ctx_id,
-					       objs);
+					       array);
 	virtio_gpu_notify(vgdev);
 }
 
-struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
+struct virtio_gpu_gem_array *virtio_gpu_array_alloc(u32 nents)
 {
-	struct virtio_gpu_object_array *objs;
-	size_t size = sizeof(*objs) + sizeof(objs->objs[0]) * nents;
+	struct virtio_gpu_gem_array *array;
+	size_t size = sizeof(*array) + sizeof(array->objs[0]) * nents;
 
-	objs = kmalloc(size, GFP_KERNEL);
-	if (!objs)
+	array = kmalloc(size, GFP_KERNEL);
+	if (!array)
 		return NULL;
 
-	objs->nents = 0;
-	objs->total = nents;
-	return objs;
+	array->nents = 0;
+	array->total = nents;
+	return array;
 }
 
-static void virtio_gpu_array_free(struct virtio_gpu_object_array *objs)
+static void virtio_gpu_array_free(struct virtio_gpu_gem_array *array)
 {
-	kfree(objs);
+	kfree(array);
 }
 
-struct virtio_gpu_object_array*
+struct virtio_gpu_gem_array*
 virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents)
 {
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 	u32 i;
 
-	objs = virtio_gpu_array_alloc(nents);
-	if (!objs)
+	array = virtio_gpu_array_alloc(nents);
+	if (!array)
 		return NULL;
 
 	for (i = 0; i < nents; i++) {
-		objs->objs[i] = drm_gem_object_lookup(drm_file, handles[i]);
-		if (!objs->objs[i]) {
-			objs->nents = i;
-			virtio_gpu_array_put_free(objs);
+		array->objs[i] = drm_gem_object_lookup(drm_file, handles[i]);
+		if (!array->objs[i]) {
+			array->nents = i;
+			virtio_gpu_array_put_free(array);
 			return NULL;
 		}
 	}
-	objs->nents = i;
-	return objs;
+	array->nents = i;
+	return array;
 }
 
-void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
+void virtio_gpu_array_add_obj(struct virtio_gpu_gem_array *array,
 			      struct drm_gem_object *obj)
 {
-	if (WARN_ON_ONCE(objs->nents == objs->total))
+	if (WARN_ON_ONCE(array->nents == array->total))
 		return;
 
 	drm_gem_object_get(obj);
-	objs->objs[objs->nents] = obj;
-	objs->nents++;
+	array->objs[array->nents] = obj;
+	array->nents++;
 }
 
-int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
+int virtio_gpu_array_lock_resv(struct virtio_gpu_gem_array *array)
 {
 	int ret;
 
-	if (objs->nents == 1) {
-		ret = dma_resv_lock_interruptible(objs->objs[0]->resv, NULL);
+	if (array->nents == 1) {
+		ret = dma_resv_lock_interruptible(array->objs[0]->resv, NULL);
 	} else {
-		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
-						&objs->ticket);
+		ret = drm_gem_lock_reservations(array->objs, array->nents,
+						&array->ticket);
 	}
 	return ret;
 }
 
-void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
+void virtio_gpu_array_unlock_resv(struct virtio_gpu_gem_array *array)
 {
-	if (objs->nents == 1) {
-		dma_resv_unlock(objs->objs[0]->resv);
+	if (array->nents == 1) {
+		dma_resv_unlock(array->objs[0]->resv);
 	} else {
-		drm_gem_unlock_reservations(objs->objs, objs->nents,
-					    &objs->ticket);
+		drm_gem_unlock_reservations(array->objs, array->nents,
+					    &array->ticket);
 	}
 }
 
-void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
+void virtio_gpu_array_add_fence(struct virtio_gpu_gem_array *array,
 				struct dma_fence *fence)
 {
 	int i;
 
-	for (i = 0; i < objs->nents; i++)
-		dma_resv_add_excl_fence(objs->objs[i]->resv, fence);
+	for (i = 0; i < array->nents; i++)
+		dma_resv_add_excl_fence(array->objs[i]->resv, fence);
 }
 
-void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
+void virtio_gpu_array_put_free(struct virtio_gpu_gem_array *array)
 {
 	u32 i;
 
-	for (i = 0; i < objs->nents; i++)
-		drm_gem_object_put_unlocked(objs->objs[i]);
-	virtio_gpu_array_free(objs);
+	for (i = 0; i < array->nents; i++)
+		drm_gem_object_put_unlocked(array->objs[i]);
+	virtio_gpu_array_free(array);
 }
 
 void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
-				       struct virtio_gpu_object_array *objs)
+				       struct virtio_gpu_gem_array *array)
 {
 	spin_lock(&vgdev->obj_free_lock);
-	list_add_tail(&objs->next, &vgdev->obj_free_list);
+	list_add_tail(&array->next, &vgdev->obj_free_list);
 	spin_unlock(&vgdev->obj_free_lock);
 	schedule_work(&vgdev->obj_free_work);
 }
@@ -253,15 +253,15 @@ void virtio_gpu_array_put_free_work(struct work_struct *work)
 {
 	struct virtio_gpu_device *vgdev =
 		container_of(work, struct virtio_gpu_device, obj_free_work);
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 
 	spin_lock(&vgdev->obj_free_lock);
 	while (!list_empty(&vgdev->obj_free_list)) {
-		objs = list_first_entry(&vgdev->obj_free_list,
-					struct virtio_gpu_object_array, next);
-		list_del(&objs->next);
+		array = list_first_entry(&vgdev->obj_free_list,
+					struct virtio_gpu_gem_array, next);
+		list_del(&array->next);
 		spin_unlock(&vgdev->obj_free_lock);
-		virtio_gpu_array_put_free(objs);
+		virtio_gpu_array_put_free(array);
 		spin_lock(&vgdev->obj_free_lock);
 	}
 	spin_unlock(&vgdev->obj_free_lock);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 336cc9143205..9a5bb000ccf2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -81,7 +81,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	int ret;
 	uint32_t *bo_handles = NULL;
 	void __user *user_bo_handles = NULL;
-	struct virtio_gpu_object_array *buflist = NULL;
+	struct virtio_gpu_gem_array *buflist = NULL;
 	struct sync_file *sync_file;
 	int in_fence_fd = exbuf->fence_fd;
 	int out_fence_fd = -1;
@@ -312,7 +312,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_from_host *args = data;
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 	struct virtio_gpu_fence *fence;
 	int ret;
 	u32 offset = args->offset;
@@ -321,11 +321,11 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		return -ENOSYS;
 
 	virtio_gpu_create_context(dev, file);
-	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
-	if (objs == NULL)
+	array = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
+	if (array == NULL)
 		return -ENOENT;
 
-	ret = virtio_gpu_array_lock_resv(objs);
+	ret = virtio_gpu_array_lock_resv(array);
 	if (ret != 0)
 		goto err_put_free;
 
@@ -336,15 +336,15 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	}
 	virtio_gpu_cmd_transfer_from_host_3d
 		(vgdev, vfpriv->ctx_id, offset, args->level,
-		 &args->box, objs, fence);
+		 &args->box, array, fence);
 	dma_fence_put(&fence->f);
 	virtio_gpu_notify(vgdev);
 	return 0;
 
 err_unlock:
-	virtio_gpu_array_unlock_resv(objs);
+	virtio_gpu_array_unlock_resv(array);
 err_put_free:
-	virtio_gpu_array_put_free(objs);
+	virtio_gpu_array_put_free(array);
 	return ret;
 }
 
@@ -354,23 +354,23 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 	struct virtio_gpu_fence *fence;
 	int ret;
 	u32 offset = args->offset;
 
-	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
-	if (objs == NULL)
+	array = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
+	if (array == NULL)
 		return -ENOENT;
 
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, offset,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
-			 objs, NULL);
+			 array, NULL);
 	} else {
 		virtio_gpu_create_context(dev, file);
-		ret = virtio_gpu_array_lock_resv(objs);
+		ret = virtio_gpu_array_lock_resv(array);
 		if (ret != 0)
 			goto err_put_free;
 
@@ -382,16 +382,16 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		virtio_gpu_cmd_transfer_to_host_3d
 			(vgdev,
 			 vfpriv ? vfpriv->ctx_id : 0, offset,
-			 args->level, &args->box, objs, fence);
+			 args->level, &args->box, array, fence);
 		dma_fence_put(&fence->f);
 	}
 	virtio_gpu_notify(vgdev);
 	return 0;
 
 err_unlock:
-	virtio_gpu_array_unlock_resv(objs);
+	virtio_gpu_array_unlock_resv(array);
 err_put_free:
-	virtio_gpu_array_put_free(objs);
+	virtio_gpu_array_put_free(array);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 84df573e13de..bc8b5a59f364 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -190,7 +190,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object_array *objs = NULL;
+	struct virtio_gpu_gem_array *array = NULL;
 	struct drm_gem_shmem_object *shmem_obj;
 	struct virtio_gpu_object *bo;
 	struct virtio_gpu_mem_entry *ents;
@@ -213,22 +213,22 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	if (fence) {
 		ret = -ENOMEM;
-		objs = virtio_gpu_array_alloc(1);
-		if (!objs)
+		array = virtio_gpu_array_alloc(1);
+		if (!array)
 			goto err_put_id;
-		virtio_gpu_array_add_obj(objs, &bo->base.base);
+		virtio_gpu_array_add_obj(array, &bo->base.base);
 
-		ret = virtio_gpu_array_lock_resv(objs);
+		ret = virtio_gpu_array_lock_resv(array);
 		if (ret != 0)
-			goto err_put_objs;
+			goto err_put_array;
 	}
 
 	if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
-						  objs, fence);
+						  array, fence);
 	} else {
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
-					       objs, fence);
+					       array, fence);
 	}
 
 	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
@@ -247,8 +247,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	*bo_ptr = bo;
 	return 0;
 
-err_put_objs:
-	virtio_gpu_array_put_free(objs);
+err_put_array:
+	virtio_gpu_array_put_free(array);
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_free_gem:
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 52d24179bcec..fcff5d7a4cee 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -109,7 +109,7 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 {
 	struct virtio_gpu_object *bo =
 		gem_to_virtio_gpu_obj(state->fb->obj[0]);
-	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_gem_array *array;
 	uint32_t w = rect->x2 - rect->x1;
 	uint32_t h = rect->y2 - rect->y1;
 	uint32_t x = rect->x1;
@@ -117,13 +117,13 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 	uint32_t off = x * state->fb->format->cpp[0] +
 		y * state->fb->pitches[0];
 
-	objs = virtio_gpu_array_alloc(1);
-	if (!objs)
+	array = virtio_gpu_array_alloc(1);
+	if (!array)
 		return;
-	virtio_gpu_array_add_obj(objs, &bo->base.base);
+	virtio_gpu_array_add_obj(array, &bo->base.base);
 
 	virtio_gpu_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
-					   objs, NULL);
+					   array, NULL);
 }
 
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
@@ -252,18 +252,18 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 
 	if (bo && bo->dumb && (plane->state->fb != old_state->fb)) {
 		/* new cursor -- update & wait */
-		struct virtio_gpu_object_array *objs;
+		struct virtio_gpu_gem_array *array;
 
-		objs = virtio_gpu_array_alloc(1);
-		if (!objs)
+		array = virtio_gpu_array_alloc(1);
+		if (!array)
 			return;
-		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-		virtio_gpu_array_lock_resv(objs);
+		virtio_gpu_array_add_obj(array, vgfb->base.obj[0]);
+		virtio_gpu_array_lock_resv(array);
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, 0,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
-			 0, 0, objs, vgfb->fence);
+			 0, 0, array, vgfb->fence);
 		virtio_gpu_notify(vgdev);
 		dma_fence_wait(&vgfb->fence->f, true);
 		dma_fence_put(&vgfb->fence->f);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 14e64c20eda4..961371566724 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -250,8 +250,8 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 		virtio_gpu_fence_event_process(vgdev, fence_id);
 
 	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
-		if (entry->objs)
-			virtio_gpu_array_put_free_delayed(vgdev, entry->objs);
+		if (entry->array)
+			virtio_gpu_array_put_free_delayed(vgdev, entry->array);
 		list_del(&entry->list);
 		free_vbuf(vgdev, entry);
 	}
@@ -332,8 +332,8 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	int ret, idx;
 
 	if (!drm_dev_enter(vgdev->ddev, &idx)) {
-		if (fence && vbuf->objs)
-			virtio_gpu_array_unlock_resv(vbuf->objs);
+		if (fence && vbuf->array)
+			virtio_gpu_array_unlock_resv(vbuf->array);
 		free_vbuf(vgdev, vbuf);
 		return;
 	}
@@ -357,9 +357,9 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	if (fence) {
 		virtio_gpu_fence_emit(vgdev, virtio_gpu_vbuf_ctrl_hdr(vbuf),
 				      fence);
-		if (vbuf->objs) {
-			virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
-			virtio_gpu_array_unlock_resv(vbuf->objs);
+		if (vbuf->array) {
+			virtio_gpu_array_add_fence(vbuf->array, &fence->f);
+			virtio_gpu_array_unlock_resv(vbuf->array);
 		}
 	}
 
@@ -381,6 +381,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 {
 	struct scatterlist *sgs[3], vcmd, vout, vresp;
 	struct sg_table *sgt = NULL;
+	struct virtio_gpu_gem_array *array = NULL;
 	int elemcnt = 0, outcnt = 0, incnt = 0;
 
 	/* set up vcmd */
@@ -396,8 +397,9 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
 					     &sg_ents);
 			if (!sgt) {
-				if (fence && vbuf->objs)
-					virtio_gpu_array_unlock_resv(vbuf->objs);
+				array = vbuf->array;
+				if (fence && array)
+					virtio_gpu_array_unlock_resv(array);
 				return;
 			}
 
@@ -498,7 +500,7 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
 				    struct virtio_gpu_object_params *params,
-				    struct virtio_gpu_object_array *objs,
+				    struct virtio_gpu_gem_array *array,
 				    struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_resource_create_2d *cmd_p;
@@ -506,7 +508,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_2D);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
@@ -598,10 +600,10 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
 					uint32_t x, uint32_t y,
-					struct virtio_gpu_object_array *objs,
+					struct virtio_gpu_gem_array *array,
 					struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(array->objs[0]);
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
@@ -613,7 +615,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
@@ -942,15 +944,15 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    struct virtio_gpu_object_array *objs)
+					    struct virtio_gpu_gem_array *array)
 {
-	uint32_t handle = virtio_gpu_get_handle(objs->objs[0]);
+	uint32_t handle = virtio_gpu_get_handle(array->objs[0]);
 	struct virtio_gpu_ctx_resource *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
@@ -960,15 +962,15 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    struct virtio_gpu_object_array *objs)
+					    struct virtio_gpu_gem_array *array)
 {
-	uint32_t handle = virtio_gpu_get_handle(objs->objs[0]);
+	uint32_t handle = virtio_gpu_get_handle(array->objs[0]);
 	struct virtio_gpu_ctx_resource *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
@@ -980,7 +982,7 @@ void
 virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 				  struct virtio_gpu_object *bo,
 				  struct virtio_gpu_object_params *params,
-				  struct virtio_gpu_object_array *objs,
+				  struct virtio_gpu_gem_array *array,
 				  struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_resource_create_3d *cmd_p;
@@ -988,7 +990,7 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_3D);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
@@ -1013,10 +1015,10 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
 					struct drm_virtgpu_3d_box *box,
-					struct virtio_gpu_object_array *objs,
+					struct virtio_gpu_gem_array *array,
 					struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(array->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
@@ -1029,7 +1031,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
@@ -1045,17 +1047,17 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
 					  struct drm_virtgpu_3d_box *box,
-					  struct virtio_gpu_object_array *objs,
+					  struct virtio_gpu_gem_array *array,
 					  struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(array->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
@@ -1070,7 +1072,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 			   void *data, uint32_t data_size,
 			   uint32_t ctx_id,
-			   struct virtio_gpu_object_array *objs,
+			   struct virtio_gpu_gem_array *array,
 			   struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_cmd_submit *cmd_p;
@@ -1081,7 +1083,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 
 	vbuf->data_buf = data;
 	vbuf->data_size = data_size;
-	vbuf->objs = objs;
+	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SUBMIT_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
