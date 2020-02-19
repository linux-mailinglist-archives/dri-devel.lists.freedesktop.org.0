Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1007164D16
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABD16E844;
	Wed, 19 Feb 2020 17:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F2A6E844
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:56:47 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u12so456674pgb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRm5pCWJ5SqgcYDjnqqphKFQ5kdEr3Yh1XennvVMnrY=;
 b=NjWYkMhOakoWjuh2oCI5lX0YEriBVrKKS8DlSsDWNzfgapeoXPEDZZcXg88+4TRwZt
 V4PiOz+tcpa13KymkuQNQs2kPB3lBamlqvAYos6N51M0EueIAkRFLi6a9A1CLeOoRzPg
 dibnLl3PFpnh1GxUZFrYjhpNU9qrx2xgBwT/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRm5pCWJ5SqgcYDjnqqphKFQ5kdEr3Yh1XennvVMnrY=;
 b=YHMAD58DN9KY+0ODZ2NIVFhTTsMDR7o7pE8ioyhFEBnM57DmRIMOalZMLlDLcKeWnt
 ngspys4g+mmQyM373hB5UJXyM7wyI0ICNvpm5cOM5oyUvgcnNtH0eMfNJ5FT29I4k0AI
 z4BhIf4Idb9QzMGT/UUNBKpMBz/zjA0vqLr1NTDHJ8q9lvFWa68bwNWw9bPllBU0THZv
 qdHhKPy3m97Xfo24c5k/36mY9nzYIqdSgEvFbN4lqv4hqnrWmuRGmh4XWaQtGu+y4wQ1
 cT0BMZYAvOywVt7WQ/KjdkYCY5MWetFncD1e3iLIsxEePKOM7k1uFtGTKwR4Uk4uK3nv
 S0Gg==
X-Gm-Message-State: APjAAAXh9OzCIsjZA8k3qwEt9SK8/h/jY3y73KGamWj2wV/hW5Pea+XD
 hxy8RnKW7HADUan6TxXl0stO6r+XLN4=
X-Google-Smtp-Source: APXvYqzjFBzpaZaGrJ79ZR3zlZCtHQ5W4fNrSUOMpVkEISnsbeBVOgEJ4fI7NtqyTUXsQfHuVvlffQ==
X-Received: by 2002:a63:df02:: with SMTP id u2mr27487119pgg.403.1582135007077; 
 Wed, 19 Feb 2020 09:56:47 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id b6sm286930pfg.17.2020.02.19.09.56.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:56:46 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5 v5] drm/virtio: use consistent names for drm_files
Date: Wed, 19 Feb 2020 09:56:36 -0800
Message-Id: <20200219175640.809-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
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
