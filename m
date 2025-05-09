Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC83AB0E04
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9110E9DA;
	Fri,  9 May 2025 08:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dx0Z83RS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A57610E9DA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:59:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so12402915e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746781186; x=1747385986; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LL0SI7hRp64EoC4NuU/ZcmxBzSY7mUI9jIp63c+PSfE=;
 b=Dx0Z83RSRk+WTmbaQxJc+6zkAfS+Tuq1uPrLIG8LluJAiUiUqPDhqYNr1lB8Okmps3
 1rxR0vqwQFxV+afJcTNUK7Q688TdJ0snoqJoBnDbwxC8xTBa4v6Z8JcgtlBBpeLiu6N2
 JWaLUmnOXokhLEdJXqiQfUvTZrNcEv+wnl2tMsFFBpeLgm7iUJfXPGlbYJ5CZJbT/ITT
 o6b9x2mwjl9aDFhE3HTqtZSUHfMO8D7mYpFCPxajgIfYLzcwWed+daaEU/MF8D8X33xJ
 iBDz0YVFjdw56UOadaMn3qKDkHTmvQlVMlZ0+IZLR6LuTP6QN5FSufKudWPXUPMoo9m2
 kc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746781186; x=1747385986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LL0SI7hRp64EoC4NuU/ZcmxBzSY7mUI9jIp63c+PSfE=;
 b=dMqATRIi7JkB2zusraT2sg1nkgJWx1XWLI7bM1zVPTZEeh8ifl/70uiIa9kOnigUUP
 MKA8X9VM6jWqn+r5qRBrNu2CGbbXION2SSzJZQ1Lb+YwTRgwAmwZHyhe5tY8f6gNF3eY
 t9mIixZv5n0ml8aHXeBqxsNGYN15gTAY4tm7pu6vNqljvk08LLF5o4Me1VVcMoYJhHe3
 xkmcs9sWj+fEmcXMnsnr1aLximXlHk7dFE56ABWxFJbtWSHn3i1DhHyD06tscf4iBXm6
 mxk9WblaNX5hGfESk0QFmuv7iKg4Uxnf4LOQ8eC8GzQWLPb1vDvETr1BW2FM5bJ63NeE
 ZzOw==
X-Gm-Message-State: AOJu0YzEkNyRtF62KTNtykI5OoGDqxcEeRgxGV/Slb+ne7GZbQRWY9yl
 LyEpwkZwmVmsdOXSFxtZynz29encuFr1ST3fzR4ttF0kMbSYpFmN4uDewcGW8nY=
X-Gm-Gg: ASbGncttEJCUY2kXfiL4sT1U/tZ+e+auOZnKbi84FXEi7GRftm/MLwd9hTDND5wn+qy
 M6NSGQNB1lDM7tGMC1k7FlFQbfQtBsSk7M3zMK6dRWuDI+BEvbTDJtuKrGgdXrFxorqzhZH8EqT
 K8+Oh09YVkwrktWDKUmm0hqkaudBkrsJj7sTJDIc2KlIHVuseUe32Hh6/3L7ShQdr4t/tiR1FFO
 JBXcHkAmPIxFBCHEMLyW0C9fJkH6geIgHLeZS/kHfEa/h7XDfZM9uCrrNm0aahSolcHXEfYhIAb
 iyE2QtuAyfjSwsl1hJDxcz1WXEBb+YvjwH3BslJONXwtkfWRZXqg2u2NvXPJ2w==
X-Google-Smtp-Source: AGHT+IF+OYkKTDmCWEB33fkMtV2Hs1Fyo+S5yTgPcYID1gXQGcB5imZPQroRvLjP1qNq1NuqZ7b1LQ==
X-Received: by 2002:a05:600c:37c6:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-442d6c39d19mr25831495e9.0.1746781186524; 
 Fri, 09 May 2025 01:59:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:59:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:40 +0200
Subject: [PATCH v2 2/6] drm/panel: visionox-rm69299: add plumbing to
 support panel variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-2-c2c2d52abd51@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4412;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gDQq96GGiawbb69OmbCZK5wRVJLN5w3DnUGh97vmrJE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP9+2WSCKMk4dRAWq2StiDl4binZHitA1jTM0EM
 nFNOI0+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/QAKCRB33NvayMhJ0ZznD/
 9WaRCwSPExe05+IQ9+4rP+3qkRLnLQn2WKQoVrOoVkk3Eq8BBHrUde2QOxoFiz67RaFd1+P/Ez/BM2
 RaOtY5IlvbL+Kc510TtJLW8DC45FKcEld1jZH1D58G6celPL7nr7I5WnYtWRqNhtUtdZ24IxAjK/Oh
 fyHslpFpHYSzMKsf7J8oboTfX49BU9VWRz5WvgitFIq9XjEoPFQxLfRfk4khsfUVgkjXyGXvrY6q2N
 huT+JcJUNxovJJMMwkwUF2WWBoNB8+bulebASPtgU2qaViHgwmVz27f2+tpFmDof1YFOXxV2iodGeC
 O1SCmq9aRNy2Ze9D3nMKMe3snEZT8B++8b3vvxwMxhLkU84jomwL9j+9b3Krn4udH1fXYd5bKv2/OH
 9zu7sBW/P+bGkdVogM3JwWhb3FELf66ylNzToxgvgE1s5eDea3ae/FwkbnTwYAaDvyuoRW/YGMqC7j
 fXBEfZAzOntkTrPdlTM6eI0UQWH/naD/BNxNm0l1Uog2MYTdsaLY7trvI9G5+P+wT0ScpsxjHn/wps
 nCdH80zuU3XaHbARsgym2+ZnGif4F6DpjkikYP7DoVRgtY8uMTRl5JG8rVc4YDyLQ2Or//4A1wEVJu
 +cvSnfFmyvVP+F6hS3DLTqm/H78QLXx9TotJYutdkonY2JyLx1s6Bcn1cTiA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

In order to support a panel variant, add plumbing code to pass
init sequence and mode as compatible data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 58 ++++++++++++++------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index be3a9797fbced5222b313cf83f8078b919e2c219..156bca0197481b470fa85b2eab7c979b76e489b6 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -5,6 +5,7 @@
 
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
@@ -15,11 +16,22 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+struct visionox_rm69299_panel_desc {
+	const struct drm_display_mode *mode;
+	const u8 *init_seq;
+	unsigned int init_seq_len;
+};
+
 struct visionox_rm69299 {
 	struct drm_panel panel;
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
 	struct mipi_dsi_device *dsi;
+	const struct visionox_rm69299_panel_desc *desc;
+};
+
+static const u8 visionox_rm69299_1080x2248_60hz_init_seq[][2] = {
+	{ 0xfe, 0x00 }, { 0xc2, 0x08 }, { 0x35, 0x00 }, { 0x51, 0xff },
 };
 
 static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
@@ -84,7 +96,7 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
 static int visionox_rm69299_prepare(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
-	int ret;
+	int ret, i;
 
 	ret = visionox_rm69299_power_on(ctx);
 	if (ret < 0)
@@ -92,28 +104,12 @@ static int visionox_rm69299_prepare(struct drm_panel *panel)
 
 	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xfe, 0x00 }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 0 failed, ret = %d\n", ret);
-		goto power_off;
-	}
-
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xc2, 0x08 }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 1 failed, ret = %d\n", ret);
-		goto power_off;
-	}
-
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x35, 0x00 }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 2 failed, ret = %d\n", ret);
-		goto power_off;
-	}
-
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x51, 0xff }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 3 failed, ret = %d\n", ret);
-		goto power_off;
+	for (i = 0; i < ctx->desc->init_seq_len; i++) {
+		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, &ctx->desc->init_seq[i * 2], 2);
+		if (ret < 0) {
+			dev_err(ctx->panel.dev,	"cmd tx failed, ret = %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
@@ -160,8 +156,7 @@ static int visionox_rm69299_get_modes(struct drm_panel *panel,
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev,
-				  &visionox_rm69299_1080x2248_60hz);
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
 	if (!mode) {
 		dev_err(ctx->panel.dev, "failed to create a new display mode\n");
 		return 0;
@@ -191,6 +186,10 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->desc = device_get_match_data(dev);
+	if (!ctx->desc)
+		return -EINVAL;
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dsi = dsi;
@@ -239,8 +238,15 @@ static void visionox_rm69299_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&ctx->panel);
 }
 
+const struct visionox_rm69299_panel_desc visionox_rm69299_1080p_display_desc = {
+	.mode = &visionox_rm69299_1080x2248_60hz,
+	.init_seq = (const u8 *)visionox_rm69299_1080x2248_60hz_init_seq,
+	.init_seq_len = ARRAY_SIZE(visionox_rm69299_1080x2248_60hz_init_seq),
+};
+
 static const struct of_device_id visionox_rm69299_of_match[] = {
-	{ .compatible = "visionox,rm69299-1080p-display", },
+	{ .compatible = "visionox,rm69299-1080p-display",
+	  .data = &visionox_rm69299_1080p_display_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);

-- 
2.34.1

