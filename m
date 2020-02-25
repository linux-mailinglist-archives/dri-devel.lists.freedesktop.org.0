Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730B16B642
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 01:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79876E9C0;
	Tue, 25 Feb 2020 00:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25FE6E9C0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:08:08 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id p14so6214010pfn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 16:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6cGDtzog5jGf7Xvkz8zuqICmjUpB6ZzZVYgeybAqIU=;
 b=Rriqp/h8G66tTXvgGMCo5hMlpGT0Eyhebh5v8E1vdLYIJSgh2IAWmGqT2mFAWg6Gdk
 IsqlXcT0HyExDmlsJ1uUh5tVwKA0qnX1TNhb0EKcbqXs9phWVpCqjwZJ9kkdfHKyhpIJ
 gEm7ltBkyyHYysKAaAb74RN+QWsr3FVjet0Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6cGDtzog5jGf7Xvkz8zuqICmjUpB6ZzZVYgeybAqIU=;
 b=KhEw5fmFBT3AHZPfs9/rGaECaHMLqCmuTZhpwQDVLNL5kPaHR077m30HuigMJ4q6G5
 fsrpMXbWKZgE3/EDl16vv/5xL2BnxvPARI7E7z5uxIzfpvoBcmwkcZSzde64IvZjMW1r
 U2K+UUQZqr1fOywpX1eCqEEiRx0q+9uUQDKBaywHnWpRPD7ChcjdV3G2u6FM4XQdekyR
 BL54P8w6ZSPDF/xRfy1wvEygpjlmiUTWcq71z8qmdHyOZYjqlf/abU0bFKY1veXBYmg6
 3SWoCCBaqtbfgiuXYzL/FylzWMpDZxGmTChaX0Kw1hSVvPeSQU2HspdCQ7QG/J3eg6FN
 Dr4A==
X-Gm-Message-State: APjAAAWKOWEzfeX9OGsTX9Cf/UtSIMNdDbOetalCsm4zHZB3Y7AbrEGH
 cOVuKc1kOfuD2SJLEY6OE3UFkWMf8Pc=
X-Google-Smtp-Source: APXvYqwXH5gGYTTyfzwRhlP85qeLJvTYQE+n/InT26yGkjAQwRHzrGk1BQCNxmMkashHPpO+UDQ3BA==
X-Received: by 2002:a63:3581:: with SMTP id c123mr4477684pga.159.1582589287973; 
 Mon, 24 Feb 2020 16:08:07 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 18sm14501512pfj.20.2020.02.24.16.08.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Feb 2020 16:08:07 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/4] drm/virtio: use consistent names for drm_files
Date: Mon, 24 Feb 2020 16:07:57 -0800
Message-Id: <20200225000800.2966-1-gurchetansingh@chromium.org>
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
Cc: emil.l.velikov@gmail.com, Gurchetan Singh <gurchetansingh@chromium.org>,
 kraxel@redhat.com, jbates@chromium.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Minor cleanup, change:

- file_priv--> file,
- drm_file --> file.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
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
