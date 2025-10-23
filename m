Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA37C00F77
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA0010E3E7;
	Thu, 23 Oct 2025 12:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cZLN1pWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476B610E3E6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:05:15 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37777912161so7624721fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221113; x=1761825913; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VqCmjsHTJC75H5UBIE0qcq4Q32midQqpIB4uY3GeThg=;
 b=cZLN1pWKTyWhZsaqddO8SRXkVhpnJm5PQh0sMvfPOPdjVqxCIFzD1hjr3rmvigOAFA
 lyaYTkj3qZ5tAz7bsVRu+FCSLfWsf5upOd06CaeAQ6a+/v2zZRN5+ZyCh+MRdGAp+HSH
 piRtNXCNCCtYvw8IAulct0HODVEvrNnKT0g9mKMkzb4sCi+GGgWTgRSU4+zoOQMYgVIc
 QlTweUCcalACJoOC8JdQBLZ1KES4cudln6YHlkJ6b+G4gLS1jVHstFrH6Glpp8eC+gJ/
 ucUh+sD8dBegDMIp2T5aYyj/hU3v3oWfU6peDn4cvu2wPLDY5GOBrrUDqXZCmpXLcW9A
 jQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221113; x=1761825913;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqCmjsHTJC75H5UBIE0qcq4Q32midQqpIB4uY3GeThg=;
 b=Nh95DTAIODJSeR1+wm37SuTcSWKKkWRvIUXQJepawKYMB75IMRds4YE0cSB8eAfpTv
 vxHNBhrhZEmsontYVcs50UzVBdYxVzPMmg6SiLwuM45VAk1N4x3PaOhMrceFAHpfUGEj
 4A/O5t5rQQSlhGPKxDHSpvnnqL8Ubc/BETEhdLRXaXw3mQDOFn9VPyGX1EiS1ZyK+ZRl
 jsah6wXi03rXXEfGeun62ybNhrSivi/mUtnyQEnqxYqN0Rqjic6A+jQTl/9LAEceN7yx
 vgmqRmPH7Vkf70JMtMW5eOdbQgrPG41gcBLLSWr1Y5EV9/SciohgeBldPBNyRURqi6cg
 zb2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7Tr5QGAwjUoTn8JIL4f2yd0uE4uK5L6qgSGTtcLLyZ770YS7KkuzaccVGue0AlbeoG7CU8C9svYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3mpPG5GsMlqlP4KtVKojHS5dGYEU69g0uVS124N7p4jKlNLFy
 ZKzHB5++AG8UrVxEdAcoaKOzbAutGWlNEDmA8KZqLoYFP+kTOxRZj0HX9Ionmq4CTiM=
X-Gm-Gg: ASbGncvws35TbxK1MD8Q0sm+AAkjt3uCLceqeEZcemJIoFUP8RT0wfSRB5I96xQDxW+
 mzpouPU6wny0uG+kvwCMgGwCb2kH3ziE8uW3TX1bNWQr3/aggp6ldh1RE4CzfpzzjF1ZQD038Oe
 yq+gGnvMORtVexAkTxDjn4iXgeofVc82ysnh8e1FspfPJQps5HaIYviNGIm8lsxurzQybLx9quc
 7ifWitfN+dHlcHDUjXT+tVqIIqZxbgYZ6GP815Zio10expdT20HXzyI07YxvOrSc5SjLEQVuUUb
 NLRJhpOtq7vZbU26gJK87zWeuQ0XME2wGtzvJUzS8XSIFpg+pT7sewhzLnMpjrfPMZcFfN2Kin+
 4ZKUKXJY7fS2ygEfJo81gFRGiSERPzctjWRRMwguyl06z1Vd7Ca71+CWcH+p3LI1AJ98Q885pxW
 m4FTfsyAzJSbu9w8Zb+Y/hDL1mr7JNQ/GlQ6qv7dCEzhL0JFMYBaho4XA=
X-Google-Smtp-Source: AGHT+IEmox/Sin+Rpy+0PTZOO9GCto/z284GSdU0TlCKbo8TpGAOtOnckqMbKiwkMzrwMFfQ/5/Q0w==
X-Received: by 2002:a05:651c:3257:10b0:378:d63b:9d29 with SMTP id
 38308e7fff4ca-378d63ba1ccmr5956941fa.47.1761221113535; 
 Thu, 23 Oct 2025 05:05:13 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d680322dsm4070701fa.47.2025.10.23.05.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:05:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 14:05:10 +0200
Subject: [PATCH 2/4] drm: panel: s6d16d0: Move DSI commands to enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-fix-mcde-drm-regression-v1-2-ed9a925db8c7@linaro.org>
References: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
In-Reply-To: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
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

