Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B2A170D2B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607946EBE2;
	Thu, 27 Feb 2020 00:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF26EBDF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:20 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n7so655342pfn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ww+uz+S6C1KDilL0b1IS/2zPzHHUATM43DEZ5GdBvf4=;
 b=QB69JretXECLCSW6jx9qR5OjjPPVOtsoyMQmBUXIwiBI/Cn/yPLTGCufYkDRbIbI7q
 VtMLAXmtKdTBhiFgqM5os5Kk8tx+cakqE2MLNwz0wr+c3yZ6XE5iuTHVlEvsGRfENpvu
 RZ8nlJqZqrQXwP/BPQ7jJUmSANQ2hdO9twP0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ww+uz+S6C1KDilL0b1IS/2zPzHHUATM43DEZ5GdBvf4=;
 b=OTNr1SJfLXcIeKu4pGL+4Mvk86T2LwTUVAWIgaXyiklRlL56CKy3SW47MuS76TbXeB
 v80VnTnAp/Kxj0r1e3Qn8NUT/qaNbeDPFb4SHnHu+pajziII4Ci6d+YTAIpydMkKh3QK
 wZ0ynKR0SVHuMQx6tFeED9LguzVWxpEg/wcvBLeo2cB7lZBYP7/7nB/5TBMMml4Xj4BP
 GjSLOu4mpJxpIcR2c5VoPaZXKGqe/92fNVFEw+wcQekvXVt7kPu4vPERXFB115eLvU6n
 yoNTZ8pSuAIZtjTCvTO0tk5VMwO0XkZWrdVLIE7OO4sfEmzVhkRvYm6LfZaTr62+MSeZ
 Fk+Q==
X-Gm-Message-State: APjAAAV5C0SWZ+OkAXrzEwNdZ80hN57ntldQobhHt0pmdgyzZGxPUL5u
 aEDaxRUuM01h8fjnt05L1EnZ43OlKJI=
X-Google-Smtp-Source: APXvYqxMYo09kQzpNlNo7CPF2WfuyDNfMCu2FconNCL43tEwGNtgdM15zhfeG+2werJz20k58PAjBA==
X-Received: by 2002:a63:5818:: with SMTP id m24mr1399593pgb.358.1582763179571; 
 Wed, 26 Feb 2020 16:26:19 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:18 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 8/8] drm/virtio: rename virtio_gpu_object to
 virtio_gpu_shmem
Date: Wed, 26 Feb 2020 16:26:01 -0800
Message-Id: <20200227002601.745-9-gurchetansingh@chromium.org>
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

This renames struct virtio_gpu_object to struct virtio_gpu_shmem.
This will go in line with the planned struct virtio_gpu_vram.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  22 ++---
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  12 +--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  16 ++--
 drivers/gpu/drm/virtio/virtgpu_object.c | 110 ++++++++++++------------
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  32 +++----
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  36 ++++----
 6 files changed, 114 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4399a782b05e..f62e036f7c40 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -66,7 +66,7 @@ struct virtio_gpu_create_params {
 	uint32_t flags;
 };
 
-struct virtio_gpu_object {
+struct virtio_gpu_shmem {
 	struct drm_gem_shmem_object base;
 	uint32_t hw_res_handle;
 
@@ -76,8 +76,8 @@ struct virtio_gpu_object {
 	bool dumb;
 	bool created;
 };
-#define gem_to_virtio_gpu_obj(gobj) \
-	container_of((gobj), struct virtio_gpu_object, base.base)
+#define to_virtio_gpu_shmem(gobj) \
+	container_of((gobj), struct virtio_gpu_shmem, base.base)
 
 struct virtio_gpu_gem_array {
 	struct ww_acquire_ctx ticket;
@@ -262,7 +262,7 @@ void virtio_gpu_array_put_free_work(struct work_struct *work);
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
-				    struct virtio_gpu_object *bo,
+				    struct virtio_gpu_shmem *bo,
 				    struct virtio_gpu_create_params *params,
 				    struct virtio_gpu_gem_array *array,
 				    struct virtio_gpu_fence *fence);
@@ -283,7 +283,7 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object *obj,
+			     struct virtio_gpu_shmem *shmem,
 			     struct virtio_gpu_mem_entry *ents,
 			     unsigned int nents);
 int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
@@ -325,7 +325,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					struct virtio_gpu_fence *fence);
 void
 virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
-				  struct virtio_gpu_object *bo,
+				  struct virtio_gpu_shmem *shmem,
 				  struct virtio_gpu_create_params *params,
 				  struct virtio_gpu_gem_array *array,
 				  struct virtio_gpu_fence *fence);
@@ -358,13 +358,13 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
 				    u64 last_seq);
 
 /* virtio_gpu_object */
-void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
+void virtio_gpu_cleanup_shmem(struct virtio_gpu_shmem *shmem);
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size);
-int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_create_params *params,
-			     struct virtio_gpu_object **bo_ptr,
-			     struct virtio_gpu_fence *fence);
+int virtio_gpu_shmem_create(struct virtio_gpu_device *vgdev,
+			    struct virtio_gpu_create_params *params,
+			    struct virtio_gpu_shmem **shmem_ptr,
+			    struct virtio_gpu_fence *fence);
 
 bool virtio_gpu_is_shmem(struct drm_gem_object *obj);
 uint32_t virtio_gpu_get_handle(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 569416dd00e6..d8429798613a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -35,24 +35,24 @@ int virtio_gpu_gem_create(struct drm_file *file,
 			  uint32_t *handle_p)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct virtio_gpu_object *obj;
+	struct virtio_gpu_shmem *shmem;
 	int ret;
 	u32 handle;
 
-	ret = virtio_gpu_object_create(vgdev, params, &obj, NULL);
+	ret = virtio_gpu_shmem_create(vgdev, params, &shmem, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_gem_handle_create(file, &obj->base.base, &handle);
+	ret = drm_gem_handle_create(file, &shmem->base.base, &handle);
 	if (ret) {
-		drm_gem_object_release(&obj->base.base);
+		drm_gem_object_release(&shmem->base.base);
 		return ret;
 	}
 
-	*obj_p = &obj->base.base;
+	*obj_p = &shmem->base.base;
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(&obj->base.base);
+	drm_gem_object_put_unlocked(&shmem->base.base);
 
 	*handle_p = handle;
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index ec97e18d104d..cf1639219bb0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -229,7 +229,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_virtgpu_resource_create *rc = data;
 	struct virtio_gpu_fence *fence;
 	int ret;
-	struct virtio_gpu_object *qobj;
+	struct virtio_gpu_shmem *shmem;
 	struct drm_gem_object *obj;
 	uint32_t handle = 0;
 	struct virtio_gpu_create_params params = { 0 };
@@ -268,11 +268,11 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	fence = virtio_gpu_fence_alloc(vgdev);
 	if (!fence)
 		return -ENOMEM;
-	ret = virtio_gpu_object_create(vgdev, &params, &qobj, fence);
+	ret = virtio_gpu_shmem_create(vgdev, &params, &shmem, fence);
 	dma_fence_put(&fence->f);
 	if (ret < 0)
 		return ret;
-	obj = &qobj->base.base;
+	obj = &shmem->base.base;
 
 	ret = drm_gem_handle_create(file, obj, &handle);
 	if (ret) {
@@ -281,7 +281,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	}
 	drm_gem_object_put_unlocked(obj);
 
-	rc->res_handle = qobj->hw_res_handle; /* similiar to a VM address */
+	rc->res_handle = shmem->hw_res_handle; /* similar to a VM address */
 	rc->bo_handle = handle;
 	return 0;
 }
@@ -291,16 +291,16 @@ static int virtio_gpu_resource_info_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_virtgpu_resource_info *ri = data;
 	struct drm_gem_object *gobj = NULL;
-	struct virtio_gpu_object *qobj = NULL;
+	struct virtio_gpu_shmem *shmem = NULL;
 
 	gobj = drm_gem_object_lookup(file, ri->bo_handle);
 	if (gobj == NULL)
 		return -ENOENT;
 
-	qobj = gem_to_virtio_gpu_obj(gobj);
+	shmem = to_virtio_gpu_shmem(gobj);
 
-	ri->size = qobj->base.base.size;
-	ri->res_handle = qobj->hw_res_handle;
+	ri->size = shmem->base.base.size;
+	ri->res_handle = shmem->hw_res_handle;
 	drm_gem_object_put_unlocked(gobj);
 	return 0;
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 312c5bf4950a..d95c6e93e90b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -65,51 +65,51 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 uint32_t virtio_gpu_get_handle(struct drm_gem_object *obj)
 {
 	if (virtio_gpu_is_shmem(obj)) {
-		struct virtio_gpu_object *bo;
+		struct virtio_gpu_shmem *shmem;
 
-		bo = gem_to_virtio_gpu_obj(obj);
-		return bo->hw_res_handle;
+		shmem = to_virtio_gpu_shmem(obj);
+		return shmem->hw_res_handle;
 	}
 
 	DRM_ERROR("resource handle not found\n");
 	return 0;
 }
 
-void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
+void virtio_gpu_cleanup_shmem(struct virtio_gpu_shmem *shmem)
 {
-	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_device *vgdev = shmem->base.base.dev->dev_private;
 
-	if (bo->pages) {
-		if (bo->mapped) {
+	if (shmem->pages) {
+		if (shmem->mapped) {
 			dma_unmap_sg(vgdev->vdev->dev.parent,
-				     bo->pages->sgl, bo->mapped,
+				     shmem->pages->sgl, shmem->mapped,
 				     DMA_TO_DEVICE);
-			bo->mapped = 0;
+			shmem->mapped = 0;
 		}
-		sg_free_table(bo->pages);
-		bo->pages = NULL;
-		drm_gem_shmem_unpin(&bo->base.base);
+		sg_free_table(shmem->pages);
+		shmem->pages = NULL;
+		drm_gem_shmem_unpin(&shmem->base.base);
 	}
-	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
-	drm_gem_shmem_free_object(&bo->base.base);
+	virtio_gpu_resource_id_put(vgdev, shmem->hw_res_handle);
+	drm_gem_shmem_free_object(&shmem->base.base);
 }
 
-static void virtio_gpu_free_object(struct drm_gem_object *obj)
+static void virtio_gpu_shmem_free(struct drm_gem_object *obj)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_shmem *shmem = to_virtio_gpu_shmem(obj);
+	struct virtio_gpu_device *vgdev = shmem->base.base.dev->dev_private;
 
-	if (bo->created) {
+	if (shmem->created) {
 		virtio_gpu_cmd_unref_resource(vgdev, obj);
 		virtio_gpu_notify(vgdev);
-		/* completion handler calls virtio_gpu_cleanup_object() */
+		/* completion handler calls virtio_gpu_cleanup_shmem() */
 		return;
 	}
-	virtio_gpu_cleanup_object(bo);
+	virtio_gpu_cleanup_shmem(shmem);
 }
 
 static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
-	.free = virtio_gpu_free_object,
+	.free = virtio_gpu_shmem_free,
 	.open = virtio_gpu_gem_object_open,
 	.close = virtio_gpu_gem_object_close,
 
@@ -130,42 +130,42 @@ bool virtio_gpu_is_shmem(struct drm_gem_object *obj)
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size)
 {
-	struct virtio_gpu_object *bo;
+	struct virtio_gpu_shmem *shmem;
 
-	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
-	if (!bo)
+	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+	if (!shmem)
 		return NULL;
 
-	bo->base.base.funcs = &virtio_gpu_shmem_funcs;
-	return &bo->base.base;
+	shmem->base.base.funcs = &virtio_gpu_shmem_funcs;
+	return &shmem->base.base;
 }
 
-static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_object *bo,
-					struct virtio_gpu_mem_entry **ents,
-					unsigned int *nents)
+static int virtio_gpu_shmem_init(struct virtio_gpu_device *vgdev,
+				 struct virtio_gpu_shmem *shmem,
+				 struct virtio_gpu_mem_entry **ents,
+				 unsigned int *nents)
 {
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 	struct scatterlist *sg;
 	int si, ret;
 
-	ret = drm_gem_shmem_pin(&bo->base.base);
+	ret = drm_gem_shmem_pin(&shmem->base.base);
 	if (ret < 0)
 		return -EINVAL;
 
-	bo->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
-	if (!bo->pages) {
-		drm_gem_shmem_unpin(&bo->base.base);
+	shmem->pages = drm_gem_shmem_get_sg_table(&shmem->base.base);
+	if (!shmem->pages) {
+		drm_gem_shmem_unpin(&shmem->base.base);
 		return -EINVAL;
 	}
 
 	if (use_dma_api) {
-		bo->mapped = dma_map_sg(vgdev->vdev->dev.parent,
-					bo->pages->sgl, bo->pages->nents,
+		shmem->mapped = dma_map_sg(vgdev->vdev->dev.parent,
+					shmem->pages->sgl, shmem->pages->nents,
 					DMA_TO_DEVICE);
-		*nents = bo->mapped;
+		*nents = shmem->mapped;
 	} else {
-		*nents = bo->pages->nents;
+		*nents = shmem->pages->nents;
 	}
 
 	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
@@ -175,7 +175,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 		return -ENOMEM;
 	}
 
-	for_each_sg(bo->pages->sgl, sg, *nents, si) {
+	for_each_sg(shmem->pages->sgl, sg, *nents, si) {
 		(*ents)[si].addr = cpu_to_le64(use_dma_api
 					       ? sg_dma_address(sg)
 					       : sg_phys(sg));
@@ -185,38 +185,38 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
-int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
+int virtio_gpu_shmem_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_create_params *params,
-			     struct virtio_gpu_object **bo_ptr,
+			     struct virtio_gpu_shmem **shmem_ptr,
 			     struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_gem_array *array = NULL;
 	struct drm_gem_shmem_object *shmem_obj;
-	struct virtio_gpu_object *bo;
+	struct virtio_gpu_shmem *shmem;
 	struct virtio_gpu_mem_entry *ents;
 	unsigned int nents;
 	int ret;
 
-	*bo_ptr = NULL;
+	*shmem_ptr = NULL;
 
 	params->size = roundup(params->size, PAGE_SIZE);
 	shmem_obj = drm_gem_shmem_create(vgdev->ddev, params->size);
 	if (IS_ERR(shmem_obj))
 		return PTR_ERR(shmem_obj);
-	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
+	shmem = to_virtio_gpu_shmem(&shmem_obj->base);
 
-	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
+	ret = virtio_gpu_resource_id_get(vgdev, &shmem->hw_res_handle);
 	if (ret < 0)
 		goto err_free_gem;
 
-	bo->dumb = params->dumb;
+	shmem->dumb = params->dumb;
 
 	if (fence) {
 		ret = -ENOMEM;
 		array = virtio_gpu_array_alloc(1);
 		if (!array)
 			goto err_put_id;
-		virtio_gpu_array_add_obj(array, &bo->base.base);
+		virtio_gpu_array_add_obj(array, &shmem->base.base);
 
 		ret = virtio_gpu_array_lock_resv(array);
 		if (ret != 0)
@@ -224,33 +224,33 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	}
 
 	if (params->virgl) {
-		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
+		virtio_gpu_cmd_resource_create_3d(vgdev, shmem, params,
 						  array, fence);
 	} else {
-		virtio_gpu_cmd_create_resource(vgdev, bo, params,
+		virtio_gpu_cmd_create_resource(vgdev, shmem, params,
 					       array, fence);
 	}
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	ret = virtio_gpu_shmem_init(vgdev, shmem, &ents, &nents);
 	if (ret != 0) {
-		virtio_gpu_free_object(&shmem_obj->base);
+		virtio_gpu_shmem_free(&shmem_obj->base);
 		return ret;
 	}
 
-	ret = virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	ret = virtio_gpu_object_attach(vgdev, shmem, ents, nents);
 	if (ret != 0) {
-		virtio_gpu_free_object(&shmem_obj->base);
+		virtio_gpu_shmem_free(&shmem_obj->base);
 		return ret;
 	}
 
 	virtio_gpu_notify(vgdev);
-	*bo_ptr = bo;
+	*shmem_ptr = shmem;
 	return 0;
 
 err_put_array:
 	virtio_gpu_array_put_free(array);
 err_put_id:
-	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
+	virtio_gpu_resource_id_put(vgdev, shmem->hw_res_handle);
 err_free_gem:
 	drm_gem_shmem_free_object(&shmem_obj->base);
 	return ret;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index fcff5d7a4cee..3f6a2ba8909f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -107,8 +107,8 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 				      struct drm_plane_state *state,
 				      struct drm_rect *rect)
 {
-	struct virtio_gpu_object *bo =
-		gem_to_virtio_gpu_obj(state->fb->obj[0]);
+	struct virtio_gpu_shmem *shmem =
+		to_virtio_gpu_shmem(state->fb->obj[0]);
 	struct virtio_gpu_gem_array *array;
 	uint32_t w = rect->x2 - rect->x1;
 	uint32_t h = rect->y2 - rect->y1;
@@ -120,7 +120,7 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 	array = virtio_gpu_array_alloc(1);
 	if (!array)
 		return;
-	virtio_gpu_array_add_obj(array, &bo->base.base);
+	virtio_gpu_array_add_obj(array, &shmem->base.base);
 
 	virtio_gpu_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
 					   array, NULL);
@@ -132,7 +132,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
-	struct virtio_gpu_object *bo;
+	struct virtio_gpu_shmem *shmem;
 	struct drm_rect rect;
 
 	if (plane->state->crtc)
@@ -155,8 +155,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
 		return;
 
-	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
-	if (bo->dumb)
+	shmem = to_virtio_gpu_shmem(plane->state->fb->obj[0]);
+	if (shmem->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
 
 	if (plane->state->fb != old_state->fb ||
@@ -165,7 +165,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	    plane->state->src_x != old_state->src_x ||
 	    plane->state->src_y != old_state->src_y) {
 		DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
-			  bo->hw_res_handle,
+			  shmem->hw_res_handle,
 			  plane->state->crtc_w, plane->state->crtc_h,
 			  plane->state->crtc_x, plane->state->crtc_y,
 			  plane->state->src_w >> 16,
@@ -173,14 +173,14 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 			  plane->state->src_x >> 16,
 			  plane->state->src_y >> 16);
 		virtio_gpu_cmd_set_scanout(vgdev, output->index,
-					   bo->hw_res_handle,
+					   shmem->hw_res_handle,
 					   plane->state->src_w >> 16,
 					   plane->state->src_h >> 16,
 					   plane->state->src_x >> 16,
 					   plane->state->src_y >> 16);
 	}
 
-	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
+	virtio_gpu_cmd_resource_flush(vgdev, shmem->hw_res_handle,
 				      rect.x1,
 				      rect.y1,
 				      rect.x2 - rect.x1,
@@ -194,14 +194,14 @@ static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
-	struct virtio_gpu_object *bo;
+	struct virtio_gpu_shmem *shmem;
 
 	if (!new_state->fb)
 		return 0;
 
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
-	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (bo && bo->dumb && (plane->state->fb != new_state->fb)) {
+	shmem = to_virtio_gpu_shmem(vgfb->base.obj[0]);
+	if (shmem && shmem->dumb && (plane->state->fb != new_state->fb)) {
 		vgfb->fence = virtio_gpu_fence_alloc(vgdev);
 		if (!vgfb->fence)
 			return -ENOMEM;
@@ -232,7 +232,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_framebuffer *vgfb;
-	struct virtio_gpu_object *bo = NULL;
+	struct virtio_gpu_shmem *shmem = NULL;
 	uint32_t handle;
 
 	if (plane->state->crtc)
@@ -244,13 +244,13 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 
 	if (plane->state->fb) {
 		vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
-		bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-		handle = bo->hw_res_handle;
+		shmem = to_virtio_gpu_shmem(vgfb->base.obj[0]);
+		handle = shmem->hw_res_handle;
 	} else {
 		handle = 0;
 	}
 
-	if (bo && bo->dumb && (plane->state->fb != old_state->fb)) {
+	if (shmem && shmem->dumb && (plane->state->fb != old_state->fb)) {
 		/* new cursor -- update & wait */
 		struct virtio_gpu_gem_array *array;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 878d07b75b7f..9f92943af97e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -498,7 +498,7 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 
 /* create a basic resource */
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
-				    struct virtio_gpu_object *bo,
+				    struct virtio_gpu_shmem *shmem,
 				    struct virtio_gpu_create_params *params,
 				    struct virtio_gpu_gem_array *array,
 				    struct virtio_gpu_fence *fence)
@@ -511,13 +511,13 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_2D);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(shmem->hw_res_handle);
 	cmd_p->format = cpu_to_le32(params->format);
 	cmd_p->width = cpu_to_le32(params->width);
 	cmd_p->height = cpu_to_le32(params->height);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	bo->created = true;
+	shmem->created = true;
 }
 
 static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
@@ -529,9 +529,9 @@ static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
 	vbuf->resp_cb_data = NULL;
 
 	if (obj && virtio_gpu_is_shmem(obj)) {
-		struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+		struct virtio_gpu_shmem *shmem = to_virtio_gpu_shmem(obj);
 
-		virtio_gpu_cleanup_object(bo);
+		virtio_gpu_cleanup_shmem(shmem);
 	}
 }
 
@@ -603,14 +603,14 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					struct virtio_gpu_gem_array *array,
 					struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(array->objs[0]);
+	struct virtio_gpu_shmem *shmem = to_virtio_gpu_shmem(array->objs[0]);
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 
 	if (use_dma_api)
 		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       bo->pages->sgl, bo->pages->nents,
+				       shmem->pages->sgl, shmem->pages->nents,
 				       DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
@@ -618,7 +618,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(shmem->hw_res_handle);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->r.width = cpu_to_le32(width);
 	cmd_p->r.height = cpu_to_le32(height);
@@ -980,7 +980,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 
 void
 virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
-				  struct virtio_gpu_object *bo,
+				  struct virtio_gpu_shmem *shmem,
 				  struct virtio_gpu_create_params *params,
 				  struct virtio_gpu_gem_array *array,
 				  struct virtio_gpu_fence *fence)
@@ -993,7 +993,7 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	vbuf->array = array;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_3D);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(shmem->hw_res_handle);
 	cmd_p->format = cpu_to_le32(params->format);
 	cmd_p->width = cpu_to_le32(params->width);
 	cmd_p->height = cpu_to_le32(params->height);
@@ -1008,7 +1008,7 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 
-	bo->created = true;
+	shmem->created = true;
 }
 
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
@@ -1018,14 +1018,14 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					struct virtio_gpu_gem_array *array,
 					struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(array->objs[0]);
+	struct virtio_gpu_shmem *shmem = to_virtio_gpu_shmem(array->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 
 	if (use_dma_api)
 		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       bo->pages->sgl, bo->pages->nents,
+				       shmem->pages->sgl, shmem->pages->nents,
 				       DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
@@ -1035,7 +1035,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(shmem->hw_res_handle);
 	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
@@ -1050,7 +1050,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  struct virtio_gpu_gem_array *array,
 					  struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(array->objs[0]);
+	struct virtio_gpu_shmem *shmem = to_virtio_gpu_shmem(array->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
@@ -1061,7 +1061,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(shmem->hw_res_handle);
 	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
@@ -1093,11 +1093,11 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 }
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object *obj,
+			     struct virtio_gpu_shmem *shmem,
 			     struct virtio_gpu_mem_entry *ents,
 			     unsigned int nents)
 {
-	virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
+	virtio_gpu_cmd_resource_attach_backing(vgdev, shmem->hw_res_handle,
 					       ents, nents, NULL);
 	return 0;
 }
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
