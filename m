Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9902B15CE90
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA66E34D;
	Thu, 13 Feb 2020 23:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444B96E34D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:18:19 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x185so3845922pfc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 15:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bmYzwj8p15X4MRtIBLt/3i1qZawBy0sR5wgfSYkNHg=;
 b=Kf4xlv2t9foMRNGLiNwubNsnrVsqpS1DttQ/YFBlBC41XU7W+B+yOKz1bc8T45ImEU
 3wyMSJqmpO/BotnGiODZQMHDbGEnrbDg9E4kckPWQlksa5o1yC+4LS6s1pGn83AofBx3
 edLRxZvxSqjGMbDP4midqiAv5JQB+pm8REYV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bmYzwj8p15X4MRtIBLt/3i1qZawBy0sR5wgfSYkNHg=;
 b=Lu4Z09kiOEWZhNcnsiR4fO7AmVbdxi+2Sy3c5utHqlLYkTyHXSEaH1wTaPpxq4A7yC
 zbqzBzy+fd24QDu3r97PnbtKo9pYwHo8JNYf/k4vlqp9GnocNGkKGbmmK00QwqKBR7aP
 LY9C1gZlr3x0NpxX3aZWcGJa9ig7E5AF2PdNFnd9hN2L1xm1Wi1jDg325h3HWPCGO0H5
 yfJLYclBx9bZYjm2EcFoufBawDDBvRRUsZontM/Y4pNbMJKvDFKBs4uGaOW5jPjb2BHj
 7kU81bH2ZPn/R/PT4d81YhOIQMAI8Q+KTlgS/6yTog7jSq8XwXjlLf7Ig5b748GcFIbZ
 XDNg==
X-Gm-Message-State: APjAAAUivXCs9w4TEKYz70K51ICpWSMZsF/uF7mvTmhYJLFnMs1O80K+
 fOCPiBkAUXvAdln0trBqrv2q3ItLuTw=
X-Google-Smtp-Source: APXvYqxnsNxjBk8wwQ4/SwWHhGVKYamhTP9Cd0PWo/e7PFZUQofkTylaK7Ey1fPPQbWs9DW6HMqt3w==
X-Received: by 2002:aa7:8703:: with SMTP id b3mr193595pfo.67.1581635898568;
 Thu, 13 Feb 2020 15:18:18 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w17sm4253495pfi.56.2020.02.13.15.18.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Feb 2020 15:18:18 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/virtio: use consistent names for drm_files
Date: Thu, 13 Feb 2020 15:18:01 -0800
Message-Id: <20200213231805.622-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213231805.622-1-gurchetansingh@chromium.org>
References: <20200213231805.622-1-gurchetansingh@chromium.org>
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
index 467649733d24..b0edf1ca095f 100644
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
@@ -177,7 +177,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 }
 
 static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
-				     struct drm_file *file_priv)
+				     struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_getparam *param = data;
@@ -200,7 +200,7 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 }
 
 static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
-					    struct drm_file *file_priv)
+					    struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_resource_create *rc = data;
@@ -251,7 +251,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 		return ret;
 	obj = &qobj->base.base;
 
-	ret = drm_gem_handle_create(file_priv, obj, &handle);
+	ret = drm_gem_handle_create(file, obj, &handle);
 	if (ret) {
 		drm_gem_object_release(obj);
 		return ret;
@@ -264,13 +264,13 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
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
