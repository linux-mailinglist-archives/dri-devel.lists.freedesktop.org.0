Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA93790FBF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 03:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD30010E268;
	Mon,  4 Sep 2023 01:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AA510E26C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 01:53:42 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bd0d19a304so14864231fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 18:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693792420; x=1694397220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E45yW3bifAp1XkPk7OUkfMOU/+n3vxTZLRpPxdzCeYo=;
 b=bJuDNqtzWU8MSYIfY7BUhoTwPtSpENXmioIxRIfNuRYqCY6s+XjgS25/3cH52NOssY
 hw8iGwmcApMCuP408c2/farwg2BRD46l0ElarqePp8qBUiRGNbV/FQ4XanKr17lTze02
 pkj1Oe1tlpsDLIAfDrjncs6WsA2Ow5kcV8YJFKzBTosFeYBZc4msFDIsEwg2lCAtJOUH
 WRspWRksPns89Xr/aHHvxugR0mhzH+bXNidZfLw8JtPY13zSFnf0+oJ6w1ZAHcjcUPj0
 ekSCn1qvXa1luAxzD9VZpfXceacsJljsVF1NUpPKRIy8FRmhxEqKIoIHK3KuZXjdfEe2
 v7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693792420; x=1694397220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E45yW3bifAp1XkPk7OUkfMOU/+n3vxTZLRpPxdzCeYo=;
 b=bsF9TFroC8NnIbDXY5BAmVV6vIXfff+paAzSGE40hDipYNfypYNIXhs+p82mk0MlHH
 8zknSRPieJxqsVpjWWMXGJLLea35yN3FshtACqDupGsYDN4CiXriqtkYJiV4qJXcIUh4
 owcYOnIJ3iEsdI1sRc2ql+bdgem3oS6K1TeAAelYJcKMGPTaDm1NMsShqv6Cxv7CzxnH
 eQKqaOyeEFYZXSjja6eotQ5myiJDLsX4xebXC2B4tV7ud9rougCa09yB7Cy+T0t+2tdc
 u6JFOcSXiB54wouz4KGaOfTP4qFTy0tb4O/2g4N0r8ymdz+ckDOeRwk265MLGGvaf9an
 8bgQ==
X-Gm-Message-State: AOJu0YwBh3ZmO8o/GAC14CthseJKIllFDEBWRoYyjNzTK+JezsvODu3X
 E82Ryj3XvUw/epJsDjw75oeDww==
X-Google-Smtp-Source: AGHT+IGCJaqpDmf5lr933nTijKI5ERWTsczglSsdM7jFhGnB9wm95p8OlVpF34wTmwoq36T1Ul3ZIw==
X-Received: by 2002:a2e:b16b:0:b0:2bc:da3e:3bd2 with SMTP id
 a11-20020a2eb16b000000b002bcda3e3bd2mr6125416ljm.29.1693792420425; 
 Sun, 03 Sep 2023 18:53:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a2e9b4e000000b002b6d68b520esm1736657ljj.65.2023.09.03.18.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 18:53:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] drm/encoder: register per-encoder debugfs dir
Date: Mon,  4 Sep 2023 04:53:36 +0300
Message-Id: <20230904015338.2941417-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_encoder.c  |  4 ++++
 drivers/gpu/drm/drm_internal.h |  9 +++++++++
 include/drm/drm_encoder.h      | 16 +++++++++++++++-
 4 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2de43ff3ce0a..cf7f33bdc963 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -603,4 +603,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+void drm_debugfs_encoder_add(struct drm_encoder *encoder)
+{
+	struct drm_minor *minor = encoder->dev->primary;
+	struct dentry *root;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "encoder-%d", encoder->index);
+	if (!name)
+		return;
+
+	root = debugfs_create_dir(name, minor->debugfs_root);
+	kfree(name);
+
+	encoder->debugfs_entry = root;
+
+	if (encoder->funcs->debugfs_init)
+		encoder->funcs->debugfs_init(encoder, root);
+}
+
+void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
+{
+	debugfs_remove_recursive(encoder->debugfs_entry);
+	encoder->debugfs_entry = NULL;
+}
+
 #endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 1143bc7f3252..8f2bc6a28482 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -30,6 +30,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -74,6 +75,8 @@ int drm_encoder_register_all(struct drm_device *dev)
 	int ret = 0;
 
 	drm_for_each_encoder(encoder, dev) {
+		drm_debugfs_encoder_add(encoder);
+
 		if (encoder->funcs && encoder->funcs->late_register)
 			ret = encoder->funcs->late_register(encoder);
 		if (ret)
@@ -90,6 +93,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
 	drm_for_each_encoder(encoder, dev) {
 		if (encoder->funcs && encoder->funcs->early_unregister)
 			encoder->funcs->early_unregister(encoder);
+		drm_debugfs_encoder_remove(encoder);
 	}
 }
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ba12acd55139..173b4d872431 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -189,6 +189,8 @@ void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
 void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
+void drm_debugfs_encoder_add(struct drm_encoder *encoder);
+void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
 #else
 static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 				   struct dentry *root)
@@ -222,6 +224,13 @@ static inline void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc)
 {
 }
 
+static inline void drm_debugfs_encoder_add(struct drm_encoder *encoder)
+{
+}
+static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
+{
+}
+
 #endif
 
 drm_ioctl_t drm_version;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 3a09682af685..977a9381c8ba 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -60,7 +60,7 @@ struct drm_encoder_funcs {
 	 * @late_register:
 	 *
 	 * This optional hook can be used to register additional userspace
-	 * interfaces attached to the encoder like debugfs interfaces.
+	 * interfaces attached to the encoder.
 	 * It is called late in the driver load sequence from drm_dev_register().
 	 * Everything added from this callback should be unregistered in
 	 * the early_unregister callback.
@@ -81,6 +81,13 @@ struct drm_encoder_funcs {
 	 * before data structures are torndown.
 	 */
 	void (*early_unregister)(struct drm_encoder *encoder);
+
+	/**
+	 * @debugfs_init:
+	 *
+	 * Allows encoders to create encoder-specific debugfs files.
+	 */
+	void (*debugfs_init)(struct drm_encoder *encoder, struct dentry *root);
 };
 
 /**
@@ -184,6 +191,13 @@ struct drm_encoder {
 
 	const struct drm_encoder_funcs *funcs;
 	const struct drm_encoder_helper_funcs *helper_private;
+
+	/**
+	 * @debugfs_entry:
+	 *
+	 * Debugfs directory for this CRTC.
+	 */
+	struct dentry *debugfs_entry;
 };
 
 #define obj_to_encoder(x) container_of(x, struct drm_encoder, base)
-- 
2.39.2

