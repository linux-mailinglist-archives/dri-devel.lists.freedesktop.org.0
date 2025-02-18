Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4FBA39856
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9EC10E654;
	Tue, 18 Feb 2025 10:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NaogcbvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4C10E650
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f31f7731fso1787888f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873543; x=1740478343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
 b=NaogcbvEfC3ReeWmA02tR53MqeYpXf1vlryglQR1ugkFE/R0V1xzmnjI9qWYlGtClH
 ngUtjuEOyMsRxGzpJDdX7quKnZ+ZSOI1F275mRcUUHky7RJ2LFefLzTOqbV5X5xU56j2
 gPf/kX3y6Spu9Y9+ly6B/aIqGFMNaJqCZppcnjDGWJWz9mAhyTQ/T6OtqExJKYHusLd4
 y3RbOIzgzaOC1YtI+j4uWeuzfy8/qKxQXr7nBaRhE3cBUfacsu7mPk+SNW6nM5ZN5MNL
 j4yzG09YHbXp0mpOZkqzsc9gO6e92klnje2OqrNZhRLMHK9AvMWDZjqIXbgfJLdB2yVQ
 gh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873543; x=1740478343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
 b=mvGRtF6ueTkVAgRZAXTgTLLhKPFWlToCbQO8ZiDJ1Sa9+9QUdLt34eGwNoHP6NcA/p
 d/tS83z+GUNbjXxzYsem+Z9X1NXqQG9cyNHDysR6keASJ+RDo0De61wJS+41IMxVJviZ
 7hLGraRe3+nUMkq9S0nr7IOXTnUrOHNsYMHx3spmEFBF1TStuuxtiXVoJtm8SyMaVXVD
 c1XiVRmNYOhV5fZqd1PDu88f46K3Lgn0d1OK9iCvrERXp8UBcL2bv6fc2uajNDOKBmap
 k5sIcvupCySN+QA7ohBGvnIA2nciEZX1fqd19ht4aCxIn14WvQiKjjfrRW0z0Q9FKE/W
 X5rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAAvDzrzLnI2Ebu8O0TMD/A7fQraO+TYadM60HhwCYWeYKTDnkycoSh/smaPz/9FYJzqXbZ1rrRNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbEEeCM/xl7JHtxLLzUg/4OiP0muNYcJhVmytNowQc+NMULmUN
 E74UfYBb0EzeYMFel4mlzPjQOVe01oc5iGwJ3g/jtIUGzZY/3iwF
X-Gm-Gg: ASbGncugKGHH4N7dZHG9zAF2JVxLribGlZPcyPEpsEsth7afp1VSXA+E7yFpA88IMO4
 +X2JCYTZkKvxKrtKkvl7qh7TzmPsvVr+7yLRUwMynYbrZMrlIg4FsvklUosApAIvZngo3OyoBwv
 fdmJfhZ5CE0zLAv2GFc2vm2y6wtxp2hVornfkhuXVKjAu4Tl+9GJxpD8vW1Yi5wGSuOe8uV30RE
 odQD0iBpIm2D2ieVdRRKpOuQhE0irtrDhoEnZZjPw4sr/E9fTwOY5OXLp3TezxB6qiMZf9LEhUE
 oYTiriEnLEzHxAokew==
X-Google-Smtp-Source: AGHT+IFbin/USp6H333KqF9l8q+i0XsBIi470gaQiS/hfbI+WonrzTOhvv1P6C8lRFRMzjHR/pnPIQ==
X-Received: by 2002:a05:6000:1a8e:b0:38f:260f:b319 with SMTP id
 ffacd0b85a97d-38f33f533edmr11356657f8f.44.1739873543136; 
 Tue, 18 Feb 2025 02:12:23 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:22 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 02/14] drm/vkms: Create vkms_connector struct
Date: Tue, 18 Feb 2025 11:12:02 +0100
Message-ID: <20250218101214.5790-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218101214.5790-1-jose.exposito89@gmail.com>
References: <20250218101214.5790-1-jose.exposito89@gmail.com>
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

Create a structure wrapping the drm_connector.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c |  8 ++++----
 drivers/gpu/drm/vkms/vkms_connector.h | 11 ++++++++++-
 drivers/gpu/drm/vkms/vkms_output.c    |  4 ++--
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index fc97f265dea6..ab8b52a84151 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -29,22 +29,22 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
-struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector;
+	struct vkms_connector *connector;
 	int ret;
 
 	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
 	if (!connector)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret)
 		return ERR_PTR(ret);
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
 
 	return connector;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index beb5ebe09155..c9149c1b7af0 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -5,6 +5,15 @@
 
 #include "vkms_drv.h"
 
+/**
+ * struct vkms_connector - VKMS custom type wrapping around the DRM connector
+ *
+ * @drm: Base DRM connector
+ */
+struct vkms_connector {
+	struct drm_connector base;
+};
+
 /**
  * vkms_connector_init() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
@@ -12,6 +21,6 @@
  * Returns:
  * The connector or an error on failure.
  */
-struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
 #endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index b01c3e9289d0..4b5abe159add 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -7,7 +7,7 @@
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector;
+	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -69,7 +69,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
 
 	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(&connector->base, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
 		return ret;
-- 
2.48.1

