Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263E94126B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB32C10E50D;
	Tue, 30 Jul 2024 12:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E7ZrgN84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2035A10E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42803bbf842so34250845e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343835; x=1722948635;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+llf/AzXlKp78omF5xhKmy0SCTLK8xhdI8HSdAi9g1k=;
 b=E7ZrgN8437iZxGCYeBZBURBAEf8XZmzcyRHBN7uicBbz5wjx0LIE3ouPx2R852em+d
 wvYGJ+ln0n7FhHeQEwMhnWQkx7Tf0iorW1F31ZpUxbA3aFyl1DrPaGuVuGCoo765nr7a
 f801+LbjawNT9Y1/lE3rw9MwSBCMdoW11dgKSXGcY3+MrS/MZpGqyROorIILbZlfJiC5
 z6XeOYvzNhNUrxRkPhpbxz/zlrKX6sZFazv2nvqw6ePUWbicBrkbWJXe9URTt3/o8B70
 dlsC6/kIXencbd9mqco37Gt9h6vSiJ72J7Wh6P+CxpKBSn73hD4KdVz0gHqwK4aADvfc
 jehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343835; x=1722948635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+llf/AzXlKp78omF5xhKmy0SCTLK8xhdI8HSdAi9g1k=;
 b=i8ZDpNa8UWyWwpsddIFIu02AdLpP8qlYECuXmc51bwuvVkvOKN7lz4QrsSPZsvLNVu
 VO+B7mdv1VOLi4dBxnbTpmoXTy0cTRl0cJfHPFYFE2UESjF6S5ErpOXhDaEIyof4z7gP
 V+RrKVyVZL2fGIPmctsqOk0gHy9ealNlX/7rVNBAuQJc+wRU7dxHPZFsrJ2g1jFA0f0y
 mRsxdxovl8Lm+iqT6zfK+qr0KEUfvgVNnDbDwjEHb556LX0qU/1Eu0f1KIJ4blDRK5gf
 w7i84gOBZ1Q1+lQYIkA/WH7YfUGIS8qkhSQmYbCyYK334HcEhfPeQE99POj5L9sRyNKQ
 xlEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUToD8Md6aZLMhZ7nkIyv9lzQqhfZIGi6+Hde8cTytSuCTHnD0SD60sggtHZjNN1Ck7yPCsMUT9ERRY/4MPxVoR52GnAajxGYXvI7zDpEXR
X-Gm-Message-State: AOJu0YyYeKgvQfdlV97AbjsEJ5Alj3Dc+MzLCSknx3PWYBK/y30A8p6h
 meWElPHeQXGoYuYDKv2Z0qJu6GlZNSPiFEmGcLXxQYSrQ1Bd8z9LvcyEdEKe8kY=
X-Google-Smtp-Source: AGHT+IHNrX2bheZchsP7m4fuUtkC/sP1H3A6/6koS/47y+kuPZKBI5FQcJ6s4Qb6HTNFzzD3vSexkg==
X-Received: by 2002:a05:600c:1c8f:b0:426:5269:982c with SMTP id
 5b1f17b1804b1-42811dd3c2bmr85628895e9.28.1722343835329; 
 Tue, 30 Jul 2024 05:50:35 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] drm/meson: hdmi: move encoder settings out of phy driver
Date: Tue, 30 Jul 2024 14:50:11 +0200
Message-ID: <20240730125023.710237-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

This relocates register pokes of the HDMI VPU encoder out of the
HDMI phy driver. As far as HDMI is concerned, the sequence in which
the setup is done remains mostly the same.

This was tested with modetest, cycling through the following resolutions:
  #0 3840x2160 60.00
  #1 3840x2160 59.94
  #2 3840x2160 50.00
  #3 3840x2160 30.00
  #4 3840x2160 29.97
  #5 3840x2160 25.00
  #6 3840x2160 24.00
  #7 3840x2160 23.98
  #8 1920x1080 60.00
  #9 1920x1080 60.00
  #10 1920x1080 59.94
  #11 1920x1080i 30.00
  #12 1920x1080i 29.97
  #13 1920x1080 50.00
  #14 1920x1080i 25.00
  #15 1920x1080 30.00
  #16 1920x1080 29.97
  #17 1920x1080 25.00
  #18 1920x1080 24.00
  #19 1920x1080 23.98
  #20 1280x1024 60.02
  #21 1152x864 59.97
  #22 1280x720 60.00
  #23 1280x720 59.94
  #24 1280x720 50.00
  #25 1024x768 60.00
  #26 800x600 60.32
  #27 720x576 50.00
  #28 720x480 59.94

No regression to report.

This is part of an effort to clean up Amlogic HDMI related drivers which
should eventually allow to stop using the component API and HHI syscon.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c      | 38 ----------------------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 16 +++++++++
 2 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5565f7777529..bcf4f83582f2 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -115,12 +115,6 @@
 
 static DEFINE_SPINLOCK(reg_lock);
 
-enum meson_venc_source {
-	MESON_VENC_SOURCE_NONE = 0,
-	MESON_VENC_SOURCE_ENCI = 1,
-	MESON_VENC_SOURCE_ENCP = 2,
-};
-
 struct meson_dw_hdmi;
 
 struct meson_dw_hdmi_data {
@@ -376,8 +370,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
 	bool is_hdmi2_sink = display->hdmi.scdc.supported;
 	struct meson_drm *priv = dw_hdmi->priv;
-	unsigned int wr_clk =
-		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
 	bool mode_is_420 = false;
 
 	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
@@ -421,36 +413,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	meson_dw_hdmi_phy_reset(dw_hdmi);
 	meson_dw_hdmi_phy_reset(dw_hdmi);
 
-	/* Temporary Disable VENC video stream */
-	if (priv->venc.hdmi_use_enci)
-		writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
-	else
-		writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
-
-	/* Temporary Disable HDMI video stream to HDMI-TX */
-	writel_bits_relaxed(0x3, 0,
-			    priv->io_base + _REG(VPU_HDMI_SETTING));
-	writel_bits_relaxed(0xf << 8, 0,
-			    priv->io_base + _REG(VPU_HDMI_SETTING));
-
-	/* Re-Enable VENC video stream */
-	if (priv->venc.hdmi_use_enci)
-		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
-	else
-		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
-
-	/* Push back HDMI clock settings */
-	writel_bits_relaxed(0xf << 8, wr_clk & (0xf << 8),
-			    priv->io_base + _REG(VPU_HDMI_SETTING));
-
-	/* Enable and Select HDMI video source for HDMI-TX */
-	if (priv->venc.hdmi_use_enci)
-		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCI,
-				    priv->io_base + _REG(VPU_HDMI_SETTING));
-	else
-		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCP,
-				    priv->io_base + _REG(VPU_HDMI_SETTING));
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0593a1cde906..1c3e3e5526eb 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -45,6 +45,12 @@ struct meson_encoder_hdmi {
 	struct cec_notifier *cec_notifier;
 };
 
+enum meson_venc_source {
+	MESON_VENC_SOURCE_NONE = 0,
+	MESON_VENC_SOURCE_ENCI = 1,
+	MESON_VENC_SOURCE_ENCP = 2,
+};
+
 #define bridge_to_meson_encoder_hdmi(x) \
 	container_of(x, struct meson_encoder_hdmi, bridge)
 
@@ -247,6 +253,14 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
 		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
 	else
 		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
+
+	/* Enable and Select HDMI video source for HDMI-TX */
+	if (priv->venc.hdmi_use_enci)
+		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCI,
+				    priv->io_base + _REG(VPU_HDMI_SETTING));
+	else
+		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCP,
+				    priv->io_base + _REG(VPU_HDMI_SETTING));
 }
 
 static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
@@ -257,6 +271,8 @@ static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
 
 	writel_bits_relaxed(0x3, 0,
 			    priv->io_base + _REG(VPU_HDMI_SETTING));
+	writel_bits_relaxed(0xf << 8, 0,
+			    priv->io_base + _REG(VPU_HDMI_SETTING));
 
 	writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
 	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
-- 
2.43.0

