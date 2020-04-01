Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2FE19B869
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 00:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA086E998;
	Wed,  1 Apr 2020 22:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8886E998
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 22:30:42 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ng8so702431pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 15:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1FpEmpyvHXdFRHZjmutAbnfg5IkHeyNnd1rOKAuAT4E=;
 b=eAhofONIHO5bL14mH6hapVDB9yvBv+0Nq1pubCNBsVNQVoOzFfL7cO5t7UFhcvvIb3
 Faa4c62FZxw2RRZ9n0czhNWMfKV4velrCOo0k3KTOUTYse/KNSJTsC2QssAPj0nVV5AM
 2EkQ7blAI5hj2XqIkMaFlFJR5FxKH3/AO0Qnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1FpEmpyvHXdFRHZjmutAbnfg5IkHeyNnd1rOKAuAT4E=;
 b=Kh7ovXcm8Vr6KJRff6wR/t7U1DpHgqA2utMSNlNjSbNo37ixGizBkVDVJDGPrEMaBz
 kI5+DnKVc6t6cWK/GgcwNW45KP8AeCAVcHs5Wub9ZrDRzUe57erduM5+4t0K8LnFWsMy
 EW0lcAEoVdVEaMJqb3Bc8Fg/PZ50QkInkmWvRpWOFEd0TNbjGdv5XWmqQOLhpkiXKXkH
 DH/w77qnmeRKd2DGfXf1Z4lmBtrYMmI7ax7fcRTmQNKD6gkTi0rJwYdmPfZ4vs7kaJ88
 SCS4fdTPMs5EjP4XOW+9fwKTuhT2//sNXUwPsQRPZ3SIsrlTNzqagHfSsUYApZd7+OXD
 lFJg==
X-Gm-Message-State: AGi0PuY29yRr4hPZSu3vRYbNYkD5r9IBasra6xf0uWaAn8bRJeKXe8f2
 0BMx+SXi9YW2fSvE1wXMb0HPLrXNlgs=
X-Google-Smtp-Source: APiQypLqngtDnw9XPMZn9NaiVIkINTZtWHAyBd8a+bIpK1dV2NZNdRtd3kDpi/bRuJMxRLmdU5WVgg==
X-Received: by 2002:a17:90a:368f:: with SMTP id
 t15mr265703pjb.23.1585780241685; 
 Wed, 01 Apr 2020 15:30:41 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w29sm2167311pge.25.2020.04.01.15.30.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 01 Apr 2020 15:30:41 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/virtio: random virtgpu_drv.h cleanups
Date: Wed,  1 Apr 2020 15:30:35 -0700
Message-Id: <20200401223039.2860-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
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

- Static-ify virtio_gpu_gem_create
- Delete unused prototypes
- Point to current implementation files

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 26 +++++++++-----------------
 drivers/gpu/drm/virtio/virtgpu_gem.c | 10 +++++-----
 2 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 824f9f15926cf..79ad176aca5a8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -218,26 +218,18 @@ struct virtio_gpu_fpriv {
 	struct mutex context_lock;
 };
 
-/* virtio_ioctl.c */
+/* virtgpu_ioctl.c */
 #define DRM_VIRTIO_NUM_IOCTLS 10
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 
-/* virtio_kms.c */
+/* virtgpu_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
 
-/* virtio_gem.c */
-void virtio_gpu_gem_free_object(struct drm_gem_object *gem_obj);
-int virtio_gpu_gem_init(struct virtio_gpu_device *vgdev);
-void virtio_gpu_gem_fini(struct virtio_gpu_device *vgdev);
-int virtio_gpu_gem_create(struct drm_file *file,
-			  struct drm_device *dev,
-			  struct virtio_gpu_object_params *params,
-			  struct drm_gem_object **obj_p,
-			  uint32_t *handle_p);
+/* virtgpu_gem.c */
 int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 			       struct drm_file *file);
 void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
@@ -263,7 +255,7 @@ void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 				       struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
 
-/* virtio vg */
+/* virtgpu_vq.c */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
@@ -343,17 +335,17 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
-/* virtio_gpu_display.c */
+/* virtgpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
 
-/* virtio_gpu_plane.c */
+/* virtgpu_plane.c */
 uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc);
 struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 					enum drm_plane_type type,
 					int index);
 
-/* virtio_gpu_fence.c */
+/* virtgpu_fence.c */
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(
 	struct virtio_gpu_device *vgdev);
 void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
@@ -362,7 +354,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
 				    u64 last_seq);
 
-/* virtio_gpu_object */
+/* virtgpu_object.c */
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size);
@@ -378,7 +370,7 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
 
-/* virgl debugfs */
+/* virtgpu_debugfs.c */
 void virtio_gpu_debugfs_init(struct drm_minor *minor);
 
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 0d6152c99a271..90c0a8ea1708c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -28,11 +28,11 @@
 
 #include "virtgpu_drv.h"
 
-int virtio_gpu_gem_create(struct drm_file *file,
-			  struct drm_device *dev,
-			  struct virtio_gpu_object_params *params,
-			  struct drm_gem_object **obj_p,
-			  uint32_t *handle_p)
+static int virtio_gpu_gem_create(struct drm_file *file,
+				 struct drm_device *dev,
+				 struct virtio_gpu_object_params *params,
+				 struct drm_gem_object **obj_p,
+				 uint32_t *handle_p)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_object *obj;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
