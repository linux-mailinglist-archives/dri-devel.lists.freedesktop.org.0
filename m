Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3536F6A7F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0123B10E23E;
	Thu,  4 May 2023 11:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D7E10E150;
 Thu,  4 May 2023 11:52:17 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so655790a12.2; 
 Thu, 04 May 2023 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201135; x=1685793135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pL05CiVZGpeThWJV8BVucF8BWFdzSNtbuhLRd8OqZPI=;
 b=XVcdevnJRId488yDisfdvgHJhxIxg6voqnJhK21R8pWbr388bsLvG3OJH9C7UvvFcN
 7t6y6JR4QjWiuyr8/Gx7JV4huShDfYgkCCAt34wNcapKXKzieKBjG0kKyEa/iaiLtyuK
 bOF3G4ylYGqGtUFvrUsvMqKgLv/J2jb87tq7x4lbs0CRbuP1PKu0uPbIAsLLwxjjS7DK
 03kVBGLIMslAhHxGEQaprXl7oHbQuZ1I16XMfqQwc9KGrgbfZjBHNTtt+e3pZSlI5SvO
 GTzcNUrDXQS9J4hjdau/WSbVYKm8uVtDR+034gNE9kd1W6wF42v0+GeQ5g7jgwT5ysVq
 RsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201135; x=1685793135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pL05CiVZGpeThWJV8BVucF8BWFdzSNtbuhLRd8OqZPI=;
 b=P+oopIUCFszYKRe3kE/mZXDwEBiRTJQtSezHY2aOvhnHsX1bwjvt8Q9Br958mz2uTb
 gz3lKPPj9lbedZfSZ6GfMGDnhqHkbs5KPajXhvByG00vm6bn6+Yiuh0TPo77P34HaFl1
 WzH2G6lLP4pHzoLnZnJA5zzJeBs7FnYn04udJD1LeGS9poFRZpsDhfKDV676Ew2JoGj6
 Vy4diW5CWsEAqkKJWDw3D1oR2DaTGK022GCGyFmIfMIYBeu5Aeo1pTrSw/KD03r2bn1r
 fjePdRRuP7grI1Qq/8P5IuklNj92sWSFCyW284FZ2zFeZmTaXnesoFIzq50Rr7+9FsV6
 YCLg==
X-Gm-Message-State: AC+VfDyvywxgRbzLr4TpLHR8XeYxPaJqveR4DCr68xTeWv+ELpYno6uK
 0T7MOMRObX8wpSQR30wxBzU=
X-Google-Smtp-Source: ACHHUZ69ISvKVVr13V9bs7G2oKuBEjv+oDzyoK4Doolv5YY9Xxkd8EvuTguJRXKh4eG5MMCT+gZb8g==
X-Received: by 2002:a17:907:3e22:b0:931:6921:bdb7 with SMTP id
 hp34-20020a1709073e2200b009316921bdb7mr6701971ejc.60.1683201135129; 
 Thu, 04 May 2023 04:52:15 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 10/13] drm/virtgpu: switch to using drm_exec
Date: Thu,  4 May 2023 13:51:56 +0200
Message-Id: <20230504115159.2245-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/virtio/Kconfig       |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h |  3 ++-
 drivers/gpu/drm/virtio/virtgpu_gem.c | 29 +++-------------------------
 3 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index ea06ff2aa4b4..a24a1ce5e666 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -5,6 +5,7 @@ config DRM_VIRTIO_GPU
 	select VIRTIO
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
+	select DRM_EXEC
 	select VIRTIO_DMA_SHARED_BUFFER
 	help
 	   This is the virtual GPU driver for virtio.  It can be used with
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af6ffb696086..c12434222e51 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -35,6 +35,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
@@ -116,7 +117,7 @@ struct virtio_gpu_object_vram {
 	container_of((virtio_gpu_object), struct virtio_gpu_object_vram, base)
 
 struct virtio_gpu_object_array {
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 	struct list_head next;
 	u32 nents, total;
 	struct drm_gem_object *objs[];
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..bcab407074f4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -171,6 +171,7 @@ struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
 
 	objs->nents = 0;
 	objs->total = nents;
+	drm_exec_init(&objs->exec, true);
 	return objs;
 }
 
@@ -214,36 +215,12 @@ void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
 
 int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
 {
-	unsigned int i;
-	int ret;
-
-	if (objs->nents == 1) {
-		ret = dma_resv_lock_interruptible(objs->objs[0]->resv, NULL);
-	} else {
-		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
-						&objs->ticket);
-	}
-	if (ret)
-		return ret;
-
-	for (i = 0; i < objs->nents; ++i) {
-		ret = dma_resv_reserve_fences(objs->objs[i]->resv, 1);
-		if (ret) {
-			virtio_gpu_array_unlock_resv(objs);
-			return ret;
-		}
-	}
-	return ret;
+	return drm_exec_prepare_array(&objs->exec, objs->objs, objs->nents, 1);
 }
 
 void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
 {
-	if (objs->nents == 1) {
-		dma_resv_unlock(objs->objs[0]->resv);
-	} else {
-		drm_gem_unlock_reservations(objs->objs, objs->nents,
-					    &objs->ticket);
-	}
+	drm_exec_fini(&objs->exec);
 }
 
 void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
-- 
2.34.1

