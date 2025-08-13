Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F279FB246D0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B911210E6D9;
	Wed, 13 Aug 2025 10:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DLXB3mh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060FE10E1C4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:21:39 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso7901151b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 23:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755066099; x=1755670899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9ST3OBHUDmupawOhRPYNVodoxTLlNYfnl/2sDqaHKqM=;
 b=DLXB3mh9kELptlQHZ6lo9X/BoiksRkMryb9rSUFSpjmICLDxmNoFjs8YEcCKjiP5OK
 cOW3MH58N97Z244s2uPaBn7EBM0S+bIw6tuOkjG94skZKYkk6B5OIQhgf4XHN61FGFBL
 gupue+8klW/BV4yfdI5bzbLnXZpBQSEOptTQ4MgOXf5Z0rRwUIUjWEGDts7InndI9WCP
 h2hZE7OKpS9gI0Wr8SlcAM8w4F3rvTE088Ka/9K9jBOCNXtDp7xsKnLbMeOKMqu5bO7K
 /67YSlznI6bmDE8shhLiScYMYW8xLJfEcuKWwQ5NYx6qM2jelEukkz4TaS1N8Yw/IWyt
 u/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755066099; x=1755670899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ST3OBHUDmupawOhRPYNVodoxTLlNYfnl/2sDqaHKqM=;
 b=CwDwpW4DcGsT/fPsfDEMBkq8j9rO1nJ9HxPQPPaF59hAwhgnRaNRrO1MbFLSw3eayp
 VZiu/ulty6CI9NwX+9L/ZAhDWYtfEikBSMOPeRuMnDT1x7R+lpcJMa5DBfH7bLTA5rLA
 IgoY3tssJzlDMOPX62QAVrTK0wsEeFWM42iFcNZ/kAQbhbAkTr/eM7a9KPM1FaMznKg5
 ypNp9yiZuXIwtGfWH32Uyyb8MLg2AMHqIPl3T7vl001Q2oNHoxsADozjzlTWmgGBhxTv
 8yB+iK20/Xxf9DHEZigMaE59xUSIcKTLycGymUSvsA6CbmbDjMJCCLMbXZREfhTwSSS8
 pJoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIqaolFmMn6wKcfis0SwkjF0+L6WAfRv0v2pWOV089N40V64ceShzj0IE5f13tvQjk5fRJtFBu21E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlwYXPxCOzUtWzhcxjxz0SLBBb4SqwQznEKTn5LtAEG3rqDjEW
 A/4kFt1V0GLuAPSpsqB7Eu2E2cscYbX1YSzoWK1P3OmkLmnaFtfzLrgF
X-Gm-Gg: ASbGncs9sHXInt6xOHbsDFOj+HLLrv2FvhI8asNArxeO2lRfGOgY9SX9cQBvdNiFaVg
 Ehuzdnx6Pcv9SJL0Y8JDP8hL+Zd+/AvDhjGicqCEbxmXZC0FL39g/XsJAGPRPPyhL8Rqn2ufTZe
 es3KllRdfI/x0k2axXwnf/xmWkX2AkRkfTBnzmoKyE420lVrJZt7tuu8/SCYtoPL1xcNdJxjH6D
 tENzoa521ljZ3Xawo544mR8VaLc5/Ts6IjJcdULv1jPdZoW/8WJhmepohvskkYCPJGaaj1P1U2s
 fDF2iuELoWZDM9iHNqoeEVdO0q+Evuww1GG8aFL5fBkRQ2qCczBt1xfSe5XHmZfyZPRPFS+auaL
 BtCTdiut33zLHmfrtJuM=
X-Google-Smtp-Source: AGHT+IEcTztVLi+UwZHZ0a2lGY69Y011yXfIdJLL6J3nKQcw2Coh7E6JYmUMTFdAFtBh6CYhcaokWw==
X-Received: by 2002:a05:6a20:244b:b0:240:7ed:402b with SMTP id
 adf61e73a8af0-240a8b76ba5mr3616066637.33.1755066099386; 
 Tue, 12 Aug 2025 23:21:39 -0700 (PDT)
Received: from Terra ([2001:df0:b240:417c:391a:2d23:2970:dee9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce89132sm31303296b3a.29.2025.08.12.23.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 23:21:39 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: airlied@redhat.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org
Cc: Athul Raj Kollareth <krathul3152@gmail.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: clean up minor codestyle issues
Date: Wed, 13 Aug 2025 11:51:05 +0530
Message-ID: <20250813062109.5326-1-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 Aug 2025 10:15:00 +0000
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

Fix codestyle warnings and errors generated by CHECKPATCH in virtio
source files.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c |  3 +--
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 20 ++++++++++----------
 drivers/gpu/drm/virtio/virtgpu_object.c  |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c      |  2 ++
 5 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index e5805ca646c7..c3315935d8bc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -131,9 +131,8 @@ static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	 * in the plane update callback, and here we just check
 	 * whenever we must force the modeset.
 	 */
-	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+	if (drm_atomic_crtc_needs_modeset(crtc_state))
 		output->needs_modeset = true;
-	}
 }
 
 static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 7dfb2006c561..1c15cbf326b7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -162,18 +162,18 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
 		vgdev->has_virgl_3d = true;
 #endif
-	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID))
 		vgdev->has_edid = true;
-	}
-	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
+
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC))
 		vgdev->has_indirect = true;
-	}
-	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
+
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID))
 		vgdev->has_resource_assign_uuid = true;
-	}
-	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
+
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB))
 		vgdev->has_resource_blob = true;
-	}
+
 	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
 				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
@@ -193,9 +193,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 			    (unsigned long)vgdev->host_visible_region.addr,
 			    (unsigned long)vgdev->host_visible_region.len);
 	}
-	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_CONTEXT_INIT)) {
+
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_CONTEXT_INIT))
 		vgdev->has_context_init = true;
-	}
 
 	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible",
 		 vgdev->has_virgl_3d    ? '+' : '-',
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 5517cff8715c..e6363c887500 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -47,6 +47,7 @@ int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
 		*resid = handle + 1;
 	} else {
 		int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
+
 		if (handle < 0)
 			return handle;
 		*resid = handle + 1;
@@ -56,9 +57,8 @@ int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
 
 static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t id)
 {
-	if (!virtio_gpu_virglrenderer_workaround) {
+	if (!virtio_gpu_virglrenderer_workaround)
 		ida_free(&vgdev->resource_ida, id - 1);
-	}
 }
 
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 698ea7adb951..29e4b458ae57 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -120,7 +120,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
-                return PTR_ERR(crtc_state);
+		return PTR_ERR(crtc_state);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 55a15e247dd1..8181b22b9b46 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -248,6 +248,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 		if (resp->type != cpu_to_le32(VIRTIO_GPU_RESP_OK_NODATA)) {
 			if (le32_to_cpu(resp->type) >= VIRTIO_GPU_RESP_ERR_UNSPEC) {
 				struct virtio_gpu_ctrl_hdr *cmd;
+
 				cmd = virtio_gpu_vbuf_ctrl_hdr(entry);
 				DRM_ERROR_RATELIMITED("response 0x%x (command 0x%x)\n",
 						      le32_to_cpu(resp->type),
@@ -468,6 +469,7 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	if (vbuf->data_size) {
 		if (is_vmalloc_addr(vbuf->data_buf)) {
 			int sg_ents;
+
 			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
 					     &sg_ents);
 			if (!sgt) {
-- 
2.50.1

