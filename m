Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968D19B86E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 00:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F756E9B2;
	Wed,  1 Apr 2020 22:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7236E9B5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 22:30:45 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id np9so695178pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nylkiPKo5WUctc3Vw6/X59zIkxdB/2xhIqHvvfzv2CM=;
 b=UpfwS3uXdKQ5+zN9pI1LOXL4r5WODfz11VuFEZVkcyumVOhcaYEy8bA1UpmhX2rEzt
 a+xTxMuKp9rNSa6ra2e55krpkd7EJS4C4lbcoiui3v9vQnI2QH/bVh8V2r6oHBbz2dEY
 cxfZZ2RIaq4HPsNSKVTqw3KuWabECHxuhq2HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nylkiPKo5WUctc3Vw6/X59zIkxdB/2xhIqHvvfzv2CM=;
 b=iSO7bpwraknW0w4wwEeJdq4/EBm7B0BDG5z39+C6RBU7eX/cUrZxcMb4friauk9dig
 XZZheqb2PYrpvPsRSd8ssm3hX/o1XckFw2WzGjzVZiqElvDO5q7fUtMXIjuOunRh8c+o
 PnPtQojtq+M3QeOQIkKxZDV8K9PENIsPWUV6d9purpIyoBz4dDEeqvVlNqb2fgv5xDlJ
 5zVdGX1lEK1g01vQ5+JEJ30gcp5DWBsALFiv+Jzqp+YETon+eV2vDsJtBbZFY39jDmPV
 YztC+hlnWvZ9R6bDy+KwqmHsymB2Jl5V85P8t9H/9XtCSmUIQWN4vgn2a4Lkez7KRIPl
 2V/Q==
X-Gm-Message-State: AGi0PuZELFt0V1SgTrCTml6Cln3d6ZVe6Dl0EvQYg5sC5zyRRUtMJQg6
 wVciKG+l/nQWtT7cfDHvk9ICEXws/1w=
X-Google-Smtp-Source: APiQypJHedTo3CS8M7d3oNquTH9RSTe3AWM5bqqafvPgriqZfCmgG/8M0JKhqG02x6OLleJYbYzZRA==
X-Received: by 2002:a17:90a:5d10:: with SMTP id s16mr296353pji.4.1585780244339; 
 Wed, 01 Apr 2020 15:30:44 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w29sm2167311pge.25.2020.04.01.15.30.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 01 Apr 2020 15:30:43 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/virtio: make virtio_gpu_object_attach void
Date: Wed,  1 Apr 2020 15:30:38 -0700
Message-Id: <20200401223039.2860-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200401223039.2860-1-gurchetansingh@chromium.org>
References: <20200401223039.2860-1-gurchetansingh@chromium.org>
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

It always returns zero.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 8 ++++----
 drivers/gpu/drm/virtio/virtgpu_object.c | 6 +-----
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 9 ++++-----
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 79ad176aca5a8..49bebdee6d91e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -279,10 +279,10 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t scanout_id, uint32_t resource_id,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
-int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object *obj,
-			     struct virtio_gpu_mem_entry *ents,
-			     unsigned int nents);
+void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_mem_entry *ents,
+			      unsigned int nents);
 int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
 int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 51a8da7d5ef3b..6ccbd01cd888c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -235,11 +235,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
-	ret = virtio_gpu_object_attach(vgdev, bo, ents, nents);
-	if (ret != 0) {
-		virtio_gpu_free_object(&shmem_obj->base);
-		return ret;
-	}
+	virtio_gpu_object_attach(vgdev, bo, ents, nents);
 
 	*bo_ptr = bo;
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 73854915ec349..9e663a5d99526 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1087,14 +1087,13 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
-int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object *obj,
-			     struct virtio_gpu_mem_entry *ents,
-			     unsigned int nents)
+void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_mem_entry *ents,
+			      unsigned int nents)
 {
 	virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
 					       ents, nents, NULL);
-	return 0;
 }
 
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
