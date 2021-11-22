Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F245985D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 00:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D25489CE2;
	Mon, 22 Nov 2021 23:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3832D89CE2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 23:22:14 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r5so16572768pgi.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TXQDsNP6ggxVoKyK4vK1tmi66M133m5TxldB+z39ko=;
 b=V1IGfaO36l7b6mIJghxEVsKnRoa/2W1A0mNZYZOqBiXfaSMbzZpHoJEb/fC/SRLGW8
 aGPRYVtfwVp8wKE4afXByrMGFdIR/URTNmZElTeqW/uqfA1R2/S3+yWrtPMhpLYqTJy3
 3xJWodJwBP1feMXrWMLQOKcmL3LtTJuBrrz14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TXQDsNP6ggxVoKyK4vK1tmi66M133m5TxldB+z39ko=;
 b=GzL1V5J5VVVRJgTXsjvjDF3qrL0Z7WTM1AlpiL6RTh3LPH/lJn0hOLjpVqc13E2Ob+
 F/T68MkvwKRuMbtUCyaupRXaqBK5/bFahVewSlejTOpCbog6Uh5VInptPcw1Dlb0tF40
 lvEdjEmAJ0mujcuC4xXcnLwgtYFeOJkWxzBZJPgpfUMhnx43vKsjIQ9OpqT/r9SOrE40
 9K3r92E+7jGtmZ10b00dgs5XQSONdO1eCARsFrjcEL8U2lSUMEPHRe4+0lFc4Xacr7RH
 WYI26woTeG+zDLQCX/NxA+uwItpZf4OxhnbZO9TxMQJCMy/9iUAkn/4Z/FQiTnsdk+0a
 1C8Q==
X-Gm-Message-State: AOAM531uB9mR7hC6+0iRJc/4KBGBqIMNEdQB9afbizPPmsU+N5kkjuVP
 NMRA+4reUTQlK5LDEY8O7fCPqjE4xF/HJQ==
X-Google-Smtp-Source: ABdhPJyxm4sy7cC7ClenAgAQrYz+rSxeoklwBLkO1GsLpSASOa9jw73KxjdohNFLxtOptcsUtgglJg==
X-Received: by 2002:aa7:8883:0:b0:49f:f87a:95de with SMTP id
 z3-20020aa78883000000b0049ff87a95demr640725pfe.53.1637623333608; 
 Mon, 22 Nov 2021 15:22:13 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:f3a1:7064:7e03:2f0a])
 by smtp.gmail.com with ESMTPSA id b15sm10539045pfl.118.2021.11.22.15.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 15:22:13 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/virtgpu api: define a dummy fence signaled event
Date: Mon, 22 Nov 2021 15:22:09 -0800
Message-Id: <20211122232210.602-2-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211122232210.602-1-gurchetansingh@google.com>
References: <20211122232210.602-1-gurchetansingh@google.com>
MIME-Version: 1.0
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
Cc: kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gurchetan Singh <gurchetansingh@chromium.org>

The current virtgpu implementation of poll(..) drops events
when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is enabled (otherwise
it's like a normal DRM driver).

This is because paravirtualized userspaces receives responses in a
buffer of type BLOB_MEM_GUEST, not by read(..).

To be in line with other DRM drivers and avoid specialized behavior,
it is possible to define a dummy event for virtgpu.  Paravirtualized
userspace will now have to call read(..) on the DRM fd to receive the
dummy event.

Fixes: b10790434cf2 ("drm/virtgpu api: create context init feature")
Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 -
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
 include/uapi/drm/virtgpu_drm.h         | 7 +++++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index e0265fe74aa5..0a194aaad419 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -138,7 +138,6 @@ struct virtio_gpu_fence_driver {
 	spinlock_t       lock;
 };
 
-#define VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL 0x10000000
 struct virtio_gpu_fence_event {
 	struct drm_pending_event base;
 	struct drm_event event;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5618a1d5879c..3607646d3229 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -54,7 +54,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
 	if (!e)
 		return -ENOMEM;
 
-	e->event.type = VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL;
+	e->event.type = VIRTGPU_EVENT_FENCE_SIGNALED;
 	e->event.length = sizeof(e->event);
 
 	ret = drm_event_reserve_init(dev, file, &e->base, &e->event);
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index a13e20cc66b4..0512fde5e697 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -196,6 +196,13 @@ struct drm_virtgpu_context_init {
 	__u64 ctx_set_params;
 };
 
+/*
+ * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is in
+ * effect.  The event size is sizeof(drm_event), since there is no additional
+ * payload.
+ */
+#define VIRTGPU_EVENT_FENCE_SIGNALED 0x90000000
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

