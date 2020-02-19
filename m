Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD97165290
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 23:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FFE6E22C;
	Wed, 19 Feb 2020 22:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E036E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 22:34:36 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c23so687902plz.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6cGDtzog5jGf7Xvkz8zuqICmjUpB6ZzZVYgeybAqIU=;
 b=X5k2y587SJ41h8Rsb2Xj7cLyprAhBThWQ2Ldgfe9/hz+YVAiBJXswJKaux03LLWDey
 Fr+aS246ZRBq5fO/EshR/AwXXQiNf70LJBtXNCEnR1xJxTFninn97xMJvsp1uplnMVzW
 J4qiq5daRePwuEE8L4bQZaRDCUnvhxmi2VgbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6cGDtzog5jGf7Xvkz8zuqICmjUpB6ZzZVYgeybAqIU=;
 b=MKOyVTm/hc1ukJmjtqIoO/EqFcVQu/rA4ZMAQpd5psxN1CUiaYH168kHuPtCqZpLkU
 JB1WAh4aQFM9C0yhxWSvsJwk9OWyK30hpm9jUNM2bU5gBZ4Q5amXeytMRdW18XHoOFPr
 K0YWQIRmcp94CybpfP83dTXISasTZ0mKmuaDb+lxtGzf0yVhfmt+lmT0Qwj43g/ZkWqt
 9ObACI8AOSXyOO2cdY+tGl7atkpEzc0aJkqE4YrggdFa2rL/O7+8Xb0HuoH70M7GLukt
 WKDgCVcoK9/k7mmUb392fg6U+wfaqix84/6p8bMySo1ugktMlguE1wAq5pOJSCnbCWDJ
 dTrw==
X-Gm-Message-State: APjAAAVc7LHIv2GVf+tEodwLM7tICB55DROls3A7Mk4YLISYFZTKRYyo
 ihCnWJjeBQBOzrpoJmY9bUdQdA7YPp8=
X-Google-Smtp-Source: APXvYqzPlWEzGspZ4EQPAN9RH2ovDdjTlJEi8+pvIdDFWaWheTS4OeKevnTQUtVvuJFCMbF1luws2Q==
X-Received: by 2002:a17:902:8a91:: with SMTP id
 p17mr26209112plo.75.1582151675405; 
 Wed, 19 Feb 2020 14:34:35 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 70sm626574pfw.140.2020.02.19.14.34.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 14:34:34 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4 v6] drm/virtio: use consistent names for drm_files
Date: Wed, 19 Feb 2020 14:34:20 -0800
Message-Id: <20200219223423.53319-1-gurchetansingh@chromium.org>
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
Cc: Emil Velikov <emil.velikov@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, emil.l.velikov@gmail.com,
 kraxel@redhat.com
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
