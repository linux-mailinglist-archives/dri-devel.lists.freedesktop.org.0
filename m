Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE3C0AF44
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78A910E374;
	Sun, 26 Oct 2025 17:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xTsZF27q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D5B10E384
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 17:40:05 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-592fcf7a1ceso2738126e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761500404; x=1762105204; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VqCmjsHTJC75H5UBIE0qcq4Q32midQqpIB4uY3GeThg=;
 b=xTsZF27qGx55XprlE3LeBaBo0RNChvtV5a8aMKKRNx1nUDCDIA6z/s4jRaDoVYva2f
 JTSDiZ2BYcxv4PvL+EkG8CjR3Sj3JK83Jh+VWSSJcp1ioFI+XWHVCyZB4q7nkKo91qb0
 wm1WW8B0VV0Xf63Q7xG+09pOJTF0qGH7GcSJ8un9hXvVvi1bS8CXy8YCbglW654kAffA
 S9xhTwbHpqDAM8BNNsv9xifm1ykTn5E7QiwMcvfWFmNQIEUSEcl87Zcu860lsx+tPbMX
 1C0+VnQ6vThYyQcOfrQfVBehrgBSVKr98QQbCH/ZHBVOeTpEt7m7eUf2nYsSKGU7pDoR
 AJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761500404; x=1762105204;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqCmjsHTJC75H5UBIE0qcq4Q32midQqpIB4uY3GeThg=;
 b=s7zxSnjYvkGE6fxrnVVdrlDXpO7pRNwb3ofrJv1KgZM4VaPg3LbJoXo5sP60NsO3T6
 dNuIfLipMhek5+n/GDTH1F9AvJY4YAdtQlBjE8mZGpOBHGA6lfUSiAeXtFvKC71uLNM4
 FkHs8dF3A2Y0CoaS20H34xsWrzmnwvpm1iyixG9gaNSHvrWjlhv1Yh9DmQKyVg64L/GH
 1ad6D7k3Kezre+GOOCoT1aDV3MUe5fkI/bmb7M/Ee7lYji+N5EsA2b2fmU9byDn0GLj7
 zfhyYXjA/6pbzR57ACvzcM+VkuIwuzTPBIp2jYYvnXnwl/dw0gYkhjbwykDSa+nmrTe2
 a9MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBw0DfjPGwmo8mPDzS+rumii9T1xUTUlskhNYhthkXF6HIq7o3cCmByUjpKprqkzWyqoqrdavcw4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqT5da2j5uWAiKyyV2CQ8ja02Y741VX6RD2Fg4/vN2ghisT8aw
 DwLEYrrgYtfA0ouAcTKKezeSTdox4bvBCz9PBZU3eI2/ImnuWKeXXD7NMa0r/62wmqw=
X-Gm-Gg: ASbGncuJzFa55d6HDcTXqje7ASKuRmv012+CvFFtV5pYL7SNmEhNnw7plYQBo/V31A4
 +fitY1MiJbgAFSHtBdkYxe0+ldNWzODZebeaN/fBNiORuqAT1nwvlhUBzxjgupDIE6VP5h/zWjR
 PodlfTrTdpOn5OcSKXlG3Hv5gJeV4s8Qg9naKYQ3ISxszJFRBwH25cUTgshu7SIFbFZ43OW0DMI
 QRULGMEbx+hW8Vr5756q08Nefomi4QyHwdYOD1sesbI6DV5VecUMvTh+bVe8rZORq/Rt7nTjLfi
 uHZHotycJhMsIM6OHNAw7fuJ6zWwcq68f3+Ap//tnsN0xSkYNzFbA4/4FwpuNzG6lCl+nReViJT
 trKmFThvtVNiwRfFq/UahItBX6bdQmaCIbvSk+rpYtAFHF5m/fGNxjuAjX4DY7+uijXr/jbNNuc
 NKSnFxCaymBfEqxqolgybgLh5rhqZOpU5vdyMcEQceEwsWj2UlEQKsWeo=
X-Google-Smtp-Source: AGHT+IHIyKfkUalRF5nt9PKAT8o/apzsgPT/ZK7fGM6Xb53Mv8atA6Ns6Pe1lEMTIaeNusMeJutl3w==
X-Received: by 2002:a05:6512:b9a:b0:592:fb96:2af8 with SMTP id
 2adb3069b0e04-592fca7d036mr3108988e87.51.1761500404167; 
 Sun, 26 Oct 2025 10:40:04 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm1713620e87.20.2025.10.26.10.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 10:40:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Oct 2025 18:40:01 +0100
Subject: [PATCH v2 2/4] drm: panel: s6d16d0: Move DSI commands to
 enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-fix-mcde-drm-regression-v2-2-8d799e488cf9@linaro.org>
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
In-Reply-To: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

Due to semantic changes in the bridge core, panels cannot send
any DSI commands in the prepare/unprepare callbacks: there is
no guarantee that the DSI transmitter is available at this
point.

Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 35 ++++++++++++---------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index ba1a02000bb9..0b343e627500 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -48,15 +48,6 @@ static inline struct s6d16d0 *panel_to_s6d16d0(struct drm_panel *panel)
 static int s6d16d0_unprepare(struct drm_panel *panel)
 {
 	struct s6d16d0 *s6 = panel_to_s6d16d0(panel);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(s6->dev);
-	int ret;
-
-	/* Enter sleep mode */
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret) {
-		dev_err(s6->dev, "failed to enter sleep mode (%d)\n", ret);
-		return ret;
-	}
 
 	/* Assert RESET */
 	gpiod_set_value_cansleep(s6->reset_gpio, 1);
@@ -68,7 +59,6 @@ static int s6d16d0_unprepare(struct drm_panel *panel)
 static int s6d16d0_prepare(struct drm_panel *panel)
 {
 	struct s6d16d0 *s6 = panel_to_s6d16d0(panel);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(s6->dev);
 	int ret;
 
 	ret = regulator_enable(s6->supply);
@@ -84,6 +74,15 @@ static int s6d16d0_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(s6->reset_gpio, 0);
 	msleep(120);
 
+	return 0;
+}
+
+static int s6d16d0_enable(struct drm_panel *panel)
+{
+	struct s6d16d0 *s6 = panel_to_s6d16d0(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(s6->dev);
+	int ret;
+
 	/* Enabe tearing mode: send TE (tearing effect) at VBLANK */
 	ret = mipi_dsi_dcs_set_tear_on(dsi,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
@@ -98,15 +97,6 @@ static int s6d16d0_prepare(struct drm_panel *panel)
 		return ret;
 	}
 
-	return 0;
-}
-
-static int s6d16d0_enable(struct drm_panel *panel)
-{
-	struct s6d16d0 *s6 = panel_to_s6d16d0(panel);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(s6->dev);
-	int ret;
-
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret) {
 		dev_err(s6->dev, "failed to turn display on (%d)\n", ret);
@@ -128,6 +118,13 @@ static int s6d16d0_disable(struct drm_panel *panel)
 		return ret;
 	}
 
+	/* Enter sleep mode */
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret) {
+		dev_err(s6->dev, "failed to enter sleep mode (%d)\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 

-- 
2.51.0

