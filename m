Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F501639C5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 03:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DE46EAF9;
	Wed, 19 Feb 2020 02:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74D46EAF9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:03:07 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u12so11539242pgb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRm5pCWJ5SqgcYDjnqqphKFQ5kdEr3Yh1XennvVMnrY=;
 b=EYfxftx9V92dgWcGwIKgyh2pgx0dSNf+paT7+JSGm9TRSybHo7WF1BrBG62UH+xNkO
 biV4Z//O0JwqUxfldQmuLmchIoHUzRuQFh7VFVY7AQaTNJCRMy2arC+J+iVhBIyJSEi3
 KCQ1pk0ERFdiKAU8KhzBct9kPIlmVx/pPalo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRm5pCWJ5SqgcYDjnqqphKFQ5kdEr3Yh1XennvVMnrY=;
 b=a8/qTfGUSKggvNdKzxCxSE5Jx5tpcuVfWxXPKMVJ6GO9ccFiFv99fmQrBEV3AnDOBj
 7sX1MHXLmphJpbWPTbWXrMHuAV8B0vA78oGeVO21p6pcGKhHSnkjNuE6FbvcfPfQWE6B
 LQkG52Ptr5Kxnse5TRdt8fqe75AQkeyAa5RKLXU9EA9rLhPw0JaQt5Q4wLfKg2S4oRcT
 b4DmxAnes8pi1idKCIzbUC+OgpxDtiWdH270VIT8IOJvJ2A+hd/JW+COIZUXg3hrcXH9
 B/1oPVjWL7qP4NMNTavHIzlL5WNdyfo+yzoRWNCaZpomhc7gBFrnmgnhNVmsr0KWmE5j
 iYFQ==
X-Gm-Message-State: APjAAAWKRc0e4x3tP8qSA6KXvc3y3hv+AeJa6cupdUWT2JaU7OFtMMnK
 6ioy3wKLz+080I/mQd+AjXaZUWgbiWE=
X-Google-Smtp-Source: APXvYqwIPNgp5CgkGbAkWhvmm2mNSIgEMIoTpUjrPjhupyUybyKLNpPdfL/vF+SQjqLglLV6tMp4FQ==
X-Received: by 2002:aa7:95a9:: with SMTP id a9mr23995796pfk.15.1582077786990; 
 Tue, 18 Feb 2020 18:03:06 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 3sm216430pjg.27.2020.02.18.18.03.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 18:03:06 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5 v3] drm/virtio: use consistent names for drm_files
Date: Tue, 18 Feb 2020 18:02:57 -0800
Message-Id: <20200219020301.1424-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Minor cleanup, change:

- file_priv--> file,
- drm_file --> file.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index bbc31aef51f1..baad7e1c9505 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -34,12 +34,12 @@
 #include "virtgpu_drv.h"
 
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
-				struct drm_file *file_priv)
+				struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_map *virtio_gpu_map = data;
 
-	return virtio_gpu_mode_dumb_mmap(file_priv, vgdev->ddev,
+	return virtio_gpu_mode_dumb_mmap(file, vgdev->ddev,
 					 virtio_gpu_map->handle,
 					 &virtio_gpu_map->offset);
 }
@@ -51,11 +51,11 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
  * VIRTIO_GPUReleaseInfo struct (first XXX bytes)
  */
 static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
-				 struct drm_file *drm_file)
+				 struct drm_file *file)
 {
 	struct drm_virtgpu_execbuffer *exbuf = data;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_fence *out_fence;
 	int ret;
 	uint32_t *bo_handles = NULL;
@@ -116,7 +116,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_unused_fd;
 		}
 
-		buflist = virtio_gpu_array_from_handles(drm_file, bo_handles,
+		buflist = virtio_gpu_array_from_handles(file, bo_handles,
 							exbuf->num_bo_handles);
 		if (!buflist) {
 			ret = -ENOENT;
@@ -178,7 +178,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 }
 
 static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
-				     struct drm_file *file_priv)
+				     struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_getparam *param = data;
@@ -201,7 +201,7 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 }
 
 static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
-					    struct drm_file *file_priv)
+					    struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_resource_create *rc = data;
@@ -252,7 +252,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 		return ret;
 	obj = &qobj->base.base;
 
-	ret = drm_gem_handle_create(file_priv, obj, &handle);
+	ret = drm_gem_handle_create(file, obj, &handle);
 	if (ret) {
 		drm_gem_object_release(obj);
 		return ret;
@@ -265,13 +265,13 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 }
 
 static int virtio_gpu_resource_info_ioctl(struct drm_device *dev, void *data,
-					  struct drm_file *file_priv)
+					  struct drm_file *file)
 {
 	struct drm_virtgpu_resource_info *ri = data;
 	struct drm_gem_object *gobj = NULL;
 	struct virtio_gpu_object *qobj = NULL;
 
-	gobj = drm_gem_object_lookup(file_priv, ri->bo_handle);
+	gobj = drm_gem_object_lookup(file, ri->bo_handle);
 	if (gobj == NULL)
 		return -ENOENT;
 
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
