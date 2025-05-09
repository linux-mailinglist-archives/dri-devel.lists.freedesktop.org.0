Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D12AB0E06
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256B510E9DE;
	Fri,  9 May 2025 08:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V3aSc179";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D58310E9DB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:59:49 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so13903445e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746781187; x=1747385987; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iC1XUrhKoAzfRL3DmpwkS9UkFLx2+etmwcGscfV3g9w=;
 b=V3aSc179rf1UJ/roVLdLBNAf4zUjjPb7xqO1HqjriTAtykRhB1A+IH7C7B7kbiifIh
 J/MINEX46h7kFF3kU7HqmWiqFXpVsos2dppTSPwVa/klT3ZUcbvNHknl10MsV9/JwSLI
 XCgp9/zrnpvCFsGO2eyO+W2gGaiNNCVZ59PDArCmEpiM0zU2ww/Fsy0KFEWwWwSHfW6S
 G9DEwvj1JLe5rSeMucsosQZn5TTRKFYzYGB32EZoiw9bjvuELefWJ1tKzQx0QoLQQTww
 YzVqGu3KhQhC6kN6klkR43f3sVq7O/1zCR40ei0PGSEE3/DtOYZRWAfZj7AFKQjVgcCY
 HtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746781187; x=1747385987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iC1XUrhKoAzfRL3DmpwkS9UkFLx2+etmwcGscfV3g9w=;
 b=l1uLubh+ioVLqbyk4DajCYFBwzTSwkcOR4Z2AQeZpSYt8fWDBsjhnZHbaZkaQhQhlg
 gUyM7KzL27CvFisNphRX6y9FL+G+SRlNLIVajJiH2lUA/fm8fU9gFGukE7yjtFq822UG
 L+zCi47CMcsNpIs2jvPWZfEtYuZkVoG9k3bKx347wiIfhrtD809qYWf7idMA2f5KWDEJ
 ST2Sd9soi2sCd3X7RKT4g6qHDNDj0j0mdpcIbsUlEE5/Pby2rOT/ADrvL13490Xe26cl
 PreAJxZD/C8fFKM1BHbzo4ODDZ57RpkM/qGaSch5z3P0+p4REJ/OQJ6Ri+XYaqVU430N
 n0fA==
X-Gm-Message-State: AOJu0Yzr9UzfJWTEiq6S5iPh1sdJvt08bsnvZFpBCZvBvLCNLC3HIS7w
 X8930qfY2d9DaZoEA2+p10swpSMX1CmFMBGVx8OGsNw+px76Sd5RPnSlSRezaUE=
X-Gm-Gg: ASbGncsS89Jitv+uHM1vk2BLWELFglYd0+joozi6psP7e6rLZRHWqaoiLYa7tlvHLYe
 vksDGikOoCvrQB8wNm8CBzMUWl9QH66znmBmYwdH5gdNl0GgLhP17vOpteRhYYiVPm4kb1VZKFE
 R8A9hP+I35ow6PcoZgw1JvWRqA90Ovox+qtsPYzLYqMcXplTly+ds2R3UoiXq9IqRFysSfzMnmv
 psmtFtvdM1sCg6mNef1YNQ42DkBNCRNJ/pX3xevYiPGhYgEhTDRVfB2VqucFFwUcCKNRZJUFluV
 ShVfs7qzh2HDhqs15t2QiwDrOgMW3duk/MSQLy0dj+elgH1aNTO85zltaYJKcw==
X-Google-Smtp-Source: AGHT+IEwTRbaYhLW+eKsAXK0abPfDBd+lPLDrxQV3TCNwHIkW2G3/B5QrqZiEPvbaIo3GBAyFIokyQ==
X-Received: by 2002:a05:600c:1d8c:b0:43d:683:8caa with SMTP id
 5b1f17b1804b1-442d6d64644mr20786345e9.15.1746781187478; 
 Fri, 09 May 2025 01:59:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:59:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:41 +0200
Subject: [PATCH v2 3/6] drm/panel: visionox-rm69299: switch to _multi variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-3-c2c2d52abd51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3216;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dN37TqGtAW4iOa2jbs7Cudzthti3SyAS+DOD3bmionU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP9zSCgk84BclFuLXnIeyWSCLz/kAsnKXNY/oDo
 1ykb6meJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/QAKCRB33NvayMhJ0W3WD/
 9ZwENFWG05mEkF1pJBoOW+iQOVWmZLuZGgU1955waz/OaskZH1WGIVtXYGLXoK191ocla+lX7p77Sg
 7bMdEFUIxNgBV6JyyQa4AlbruCKX7rj3CcvXRmuQTKFpd8gmHcbEioLhruJ6jaEVzXiEZEbzCVhbvg
 oRtpUtxFf0MXgNLUKOcTK3S5vQDYaAByiyKi8wxtYYy2Wp+lAmz28emu8LnFsM/rD9HGzfSSYJBCIa
 auzZCTnRCvW6MhCbLGSu1TZYiNi4xc+xwFPSHb9uKLwtLBKjci+5gD0Bz2jHpz1bV9y/ieMu4a55o3
 P4L/r2h+MzibJ0wPHsZDiYjlyOGa3MN0angVnI1mG6ea0b+/NPntnLb51ZoDs2OkQ5q4t9jUUzQieV
 YLNsYWzMsKE/GiBLb88VNEa+JS/e4gRL8m2snBJ0tXutTWuA9Z9Kc9CExr1IqKCbRIxT6+zFQLsCgB
 corR5CfVUNFgF0royk2kDYxPl6/E9FgfNcYM2OcGdFPa9byxaUw23pZpqFaKpFY50EFz09kIhvl5m2
 0d+7htI1NDArTki9K/h3BagXPTxpeLrPIV94nbNdsLgbyWsqWLZdq01lBcZxFRSmwl9BVtAseco8c1
 qk5ei8qhofJ10/JiNptsP2FzxB9LG8knt2XwhLyrQ4p3Zxpui27cDWGI1rIw==
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

Switch to the DSI _multi variants to simplify error handling.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 48 +++++++-------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index 156bca0197481b470fa85b2eab7c979b76e489b6..c3c14150a5546512151fb15c8e9a91269ca21c65 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -72,30 +72,24 @@ static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
 static int visionox_rm69299_unprepare(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
 	ctx->dsi->mode_flags = 0;
 
-	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
-	if (ret < 0)
-		dev_err(ctx->panel.dev, "set_display_off cmd failed ret = %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	/* 120ms delay required here as per DCS spec */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "enter_sleep cmd failed ret = %d\n", ret);
-	}
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	ret = visionox_rm69299_power_off(ctx);
-
-	return ret;
+	return visionox_rm69299_power_off(ctx);
 }
 
 static int visionox_rm69299_prepare(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 	int ret, i;
 
 	ret = visionox_rm69299_power_on(ctx);
@@ -104,36 +98,20 @@ static int visionox_rm69299_prepare(struct drm_panel *panel)
 
 	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	for (i = 0; i < ctx->desc->init_seq_len; i++) {
-		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, &ctx->desc->init_seq[i * 2], 2);
-		if (ret < 0) {
-			dev_err(ctx->panel.dev,	"cmd tx failed, ret = %d\n", ret);
-			return ret;
-		}
-	}
+	for (i = 0; i < ctx->desc->init_seq_len; i++)
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, &ctx->desc->init_seq[i * 2], 2);
 
-	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "exit_sleep_mode cmd failed ret = %d\n", ret);
-		goto power_off;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "set_display_on cmd failed ret = %d\n", ret);
-		goto power_off;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
-
-power_off:
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {

-- 
2.34.1

