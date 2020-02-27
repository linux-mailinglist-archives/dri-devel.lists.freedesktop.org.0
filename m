Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D13170D2A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9D16EBE5;
	Thu, 27 Feb 2020 00:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0F6EBDF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:18 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y5so624848pfb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJlOtYUCCUlKWnE7ZpQ00L3bWemb0nm18JPV6WZXAe4=;
 b=P1qs1anTpDZBkGbtYBfOM+YXu4OiSHFVCYx4Zgv0FCzJC7UWjj8sLyqY+KBhCyuTFe
 mTpattvgowFU7PjPpq3s2Rkdhmj4ppFcLR5eAM48cSdweN+mrY73Q4kaoVbknpDV26qI
 blnW3FWjBlBxdyzJM4t/HajThj6VpPJOX90O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJlOtYUCCUlKWnE7ZpQ00L3bWemb0nm18JPV6WZXAe4=;
 b=NqzB+3ToNYfeYBwZkJ9azZNDyigsNILlHPvFakX5SsJQJm5NRsl6meLhujWH8/NENq
 d7BoNB/+iNs4gcn7BDPOxjODdJLfkd4dWwd/I64ojobBYuXd7oefyTPTaCunWUIzvuN8
 sxJ/yRDNPOI8fR8JTIABf7YofvsMzATO/EyybfwJ0KAm4RGGSNsmEM7agrTOzpJeW+1d
 diOn/zpX3JeM7/13L0r/3MsTV5PwWgngC+zXcKRDjYnpgGXVSo/QBgHhaQHR8TxhISHg
 yNfJdqEtp0UvGkxF/ei5qtGxSCs91HG3vfIv8S1rgrJ0W22OzaQa5rv3ZOt/qwTDRSPp
 ug3A==
X-Gm-Message-State: APjAAAUmaJ5XsZDk9ZizBVMEETPMY96h1Nfge9G8IvKWYOqfG/x2/x5G
 GwPOUEbo2qTxX+P1htTfVXv4tcAhd+o=
X-Google-Smtp-Source: APXvYqwMUVaa1yi13nmlUaF4sovvaUxLkzZTTo+0UI9swshC1IqTkgsXshzBpI0fYNqFL7BKOPr51g==
X-Received: by 2002:a63:2c03:: with SMTP id s3mr1314791pgs.19.1582763177892;
 Wed, 26 Feb 2020 16:26:17 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:17 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 7/8] drm/virtio: rename virtio_gpu_object_params to
 virtio_gpu_create_params
Date: Wed, 26 Feb 2020 16:26:00 -0800
Message-Id: <20200227002601.745-8-gurchetansingh@chromium.org>
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

Currently, struct virtio_gpu_object refers to the SHMEM based object,
which is fair. We want to expand that a bit, so let's expand the
creation params too.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 10 +++++-----
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index a1888a20d311..4399a782b05e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -49,7 +49,7 @@
 #define DRIVER_MINOR 1
 #define DRIVER_PATCHLEVEL 0
 
-struct virtio_gpu_object_params {
+struct virtio_gpu_create_params {
 	uint32_t format;
 	uint32_t width;
 	uint32_t height;
@@ -230,7 +230,7 @@ int virtio_gpu_gem_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_gem_fini(struct virtio_gpu_device *vgdev);
 int virtio_gpu_gem_create(struct drm_file *file,
 			  struct drm_device *dev,
-			  struct virtio_gpu_object_params *params,
+			  struct virtio_gpu_create_params *params,
 			  struct drm_gem_object **obj_p,
 			  uint32_t *handle_p);
 int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
@@ -263,7 +263,7 @@ int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
-				    struct virtio_gpu_object_params *params,
+				    struct virtio_gpu_create_params *params,
 				    struct virtio_gpu_gem_array *array,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
@@ -326,7 +326,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 void
 virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 				  struct virtio_gpu_object *bo,
-				  struct virtio_gpu_object_params *params,
+				  struct virtio_gpu_create_params *params,
 				  struct virtio_gpu_gem_array *array,
 				  struct virtio_gpu_fence *fence);
 void virtio_gpu_ctrl_ack(struct virtqueue *vq);
@@ -362,7 +362,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size);
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object_params *params,
+			     struct virtio_gpu_create_params *params,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 53181fe2afe0..569416dd00e6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -30,7 +30,7 @@
 
 int virtio_gpu_gem_create(struct drm_file *file,
 			  struct drm_device *dev,
-			  struct virtio_gpu_object_params *params,
+			  struct virtio_gpu_create_params *params,
 			  struct drm_gem_object **obj_p,
 			  uint32_t *handle_p)
 {
@@ -63,7 +63,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 				struct drm_mode_create_dumb *args)
 {
 	struct drm_gem_object *gobj;
-	struct virtio_gpu_object_params params = { 0 };
+	struct virtio_gpu_create_params params = { 0 };
 	int ret;
 	uint32_t pitch;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 9a5bb000ccf2..ec97e18d104d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -232,7 +232,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_object *qobj;
 	struct drm_gem_object *obj;
 	uint32_t handle = 0;
-	struct virtio_gpu_object_params params = { 0 };
+	struct virtio_gpu_create_params params = { 0 };
 
 	if (vgdev->has_virgl_3d) {
 		virtio_gpu_create_context(dev, file);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index bc8b5a59f364..312c5bf4950a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -186,7 +186,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 }
 
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object_params *params,
+			     struct virtio_gpu_create_params *params,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence)
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 961371566724..878d07b75b7f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -499,7 +499,7 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 /* create a basic resource */
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
-				    struct virtio_gpu_object_params *params,
+				    struct virtio_gpu_create_params *params,
 				    struct virtio_gpu_gem_array *array,
 				    struct virtio_gpu_fence *fence)
 {
@@ -981,7 +981,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 void
 virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 				  struct virtio_gpu_object *bo,
-				  struct virtio_gpu_object_params *params,
+				  struct virtio_gpu_create_params *params,
 				  struct virtio_gpu_gem_array *array,
 				  struct virtio_gpu_fence *fence)
 {
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
