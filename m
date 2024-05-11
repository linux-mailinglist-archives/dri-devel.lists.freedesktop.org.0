Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41278C34A7
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 01:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BAE10E19E;
	Sat, 11 May 2024 23:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NXhSm97W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5710E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 23:00:31 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e43c481b53so38810521fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 16:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715468429; x=1716073229; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/qHpoqYTUuOwsjGMAXRWRB1z/cT96H3/x5oO5XeWouE=;
 b=NXhSm97WZtjsXhkR6S696odQtHLaoCLbVsq6PD2SPfa2Y0n4ZT5q10ZEzGs8MoThzH
 Sxqml+LokEDaVsjLFUhaw8z75SSUhFctr/MexocU7LhFwOrToOSWAjrN2fxyWCyO5Qu0
 v62oeslOCgQl0+Kj4p2SaOvr6XDqWfr/CDZTvsYCOIu7p+uflovNwMhge/WgVe0jLiA2
 T8rlAaahWG6LMUCAw2pKqIqSLqe4rpu8ubXIKJlzVPK3z3AQwkGzn47lL8jkHoeOvTg6
 6GJ0KTYZzWiWaYxHPGZpoH41H8XBuxMitcPD8uD1VZAsapBQM9LOox9IkoFma5nvvmY0
 CBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715468429; x=1716073229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qHpoqYTUuOwsjGMAXRWRB1z/cT96H3/x5oO5XeWouE=;
 b=Q7BkbSii7GsTl3GU8HMgY7Yu4owm0DJOic4jWcz21kHkKD2EAJkMqVXPnbCDVFQnMg
 venluXZ8iWa5nkf3qkyDFuxwMy6LAf7M4CljRbHg334TUB0D4IJm8Xtt7G4eCBgjIs2S
 EYfosY5rUx6TZjFXjSabspBTIvV0X016Ji/qaeNEuJ18MgkJ9aZ7kOBSFIftf4ODQZ6Z
 mpYdMaP5YE4HSvqQvjuQXUpUF0SzN/OvNrDShOdifnsPiTOljG4WcsEshA6nbzzEqvqB
 iQLLE2AYimQkwEdIoocd7hhvZEqjd0Xhyi4sSg9OtNOkvzdNzg1BhRc9emT1+qUXx3I7
 2MmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwSjK02lKqWodkHH2mvBSxWLQk8zbF81AXzZQ9WE7KGAf0M8uN7nZVadowI21sy+tlaAJOIRe33jSrI7171yilO2y65EtOb8lU7bbwFrJ6
X-Gm-Message-State: AOJu0YwxKZjZgfccB+zw4SpbqDVOcM19RJWOddhdx54S/7YmV6xlr66S
 Cc/HgO3wfjO4/dKHlW4XQP8BdJyk3+wYMHv0gKO+RK3VHoD5TwvErJCGLccm510=
X-Google-Smtp-Source: AGHT+IE59BTbplb1hjthCMm6iJl5mfrsnrvXEpw54uV1KjAjRpehYXJtF5g8OLkmTkJPEP9brZ7nKA==
X-Received: by 2002:ac2:454b:0:b0:51d:8283:cf72 with SMTP id
 2adb3069b0e04-5221017e670mr3705647e87.57.1715468429712; 
 Sat, 11 May 2024 16:00:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3717sm1134222e87.173.2024.05.11.16.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 16:00:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 02:00:21 +0300
Subject: [PATCH v2 4/7] drm/panel: ilitek-ili9882t: use wrapped MIPI DCS
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-dsi-panels-upd-api-v2-4-e31ca14d102e@linaro.org>
References: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
In-Reply-To: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2547;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DOHrqeOiwanjV11JDXphoCFUegn+i/jlXSehEJEsJf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP/iJCMI0EmGQFpfABnhOIgzvW0Z2hfEur/bwd
 ugzH9cTMtOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/4iQAKCRCLPIo+Aiko
 1dm6B/9UyHT0uKo3SGYHl3YEsREl/QK/u8yxWXXZGGKUeL6QEasG5JyllkZFtnO+imD5Ymx3bp0
 qDxkn2q9eZXR15gVxhb6zBJo2I7vwAcY8iANJFj8e2Pb33sUuH7xK7WaAsC4fHTQ8TrCB0foybd
 AXinWoceTGIIzNIAG2YcxkdD7c9LCgNsXa1L60Id9fx6sO2rzZTs2EypVKAM7Jl7cTx0vuOSHp0
 sdupSoLMb0KAfvMc6kykz1/IsflTSETD0/ajwNsvk4jceIGjbYFsMWrve54LRZBczwLnqUm9Q+q
 EzQ+nDtBl+of7NvZPFyDPxftwjiqewsCCf20OlCe6uhIxVou
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
simplify driver's init/exit code.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 48 ++++++---------------------
 1 file changed, 11 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 58fc1d799371..830d7cfbe857 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -402,19 +402,15 @@ static int starry_ili9882t_init(struct ili9882t *ili)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
 
 	ili9882t_switch_page(&ctx, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_EXIT_SLEEP_MODE);
-	if (ctx.accum_err)
-		return ctx.accum_err;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
-	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_ON);
-	if (ctx.accum_err)
-		return ctx.accum_err;
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
 
-	msleep(20);
+	mipi_dsi_msleep(&ctx, 20);
 
-	return 0;
+	return ctx.accum_err;
 };
 
 static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
@@ -422,43 +418,21 @@ static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
 	return container_of(panel, struct ili9882t, base);
 }
 
-static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
-{
-	struct mipi_dsi_device *dsi = ili->dsi;
-	int ret;
-
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		return ret;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static int ili9882t_disable(struct drm_panel *panel)
 {
 	struct ili9882t *ili = to_ili9882t(panel);
 	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
-	int ret;
 
 	ili9882t_switch_page(&ctx, 0x00);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	ret = ili9882t_enter_sleep_mode(ili);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
-		return ret;
-	}
+	ili->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	msleep(150);
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
-	return 0;
+	mipi_dsi_msleep(&ctx, 150);
+
+	return ctx.accum_err;
 }
 
 static int ili9882t_unprepare(struct drm_panel *panel)

-- 
2.39.2

