Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F09C0AF4D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E2F10E380;
	Sun, 26 Oct 2025 17:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ptabKna2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67110E380
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 17:40:07 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-592f5736693so4006221e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761500405; x=1762105205; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PT2hY47s1RjHjMjR+FqOEH03YMoMMWni/+Svf2+bi04=;
 b=ptabKna2mJu1H/nWeWa62PLeLzoiXEU2JerEfPiuNAMpKxdvonWJxoKhxrkLmM5wPQ
 UlOe4tJ2gsNMn9sHZQGcoDa+ClG6ZL+VESebTgALDwlPCu63WgUPxyVL/UcF3SkpN3XP
 lxiSuvIiNnZwPP/xJWOzXtwRCXGB1NkzW/neUa+xVNKwXKuKQZoQgf9wwT+rnMf6U9Eo
 8Smj1oEU87FrOrQ9w6YWVkB3bcClOeTeqKfqu8xkKKODfAkIwO0+k5IU0QcyMMwENw8u
 hvWuall0un0NORXHAGR5vA4sPuyWDxnPouJ++eeTqoUoS52M13sVWTV06rV7HlsmnL5Y
 cIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761500405; x=1762105205;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PT2hY47s1RjHjMjR+FqOEH03YMoMMWni/+Svf2+bi04=;
 b=eSzmQizsPshZyX40Ur7w7SdXFBBfeWQT70HfWGae+3JDHNnwar1fgTvRc4A4cXhs5L
 FaEQMKNkxJMdSaNBb2N0JLyw1LhjGvXTOEq9mGed67V0zNd2THGEjhJp3LOndkJzHi5V
 ZJZOiN9/9HVBvcDg0u8vDXceje9AMSfX67Bgmy76jdRSP9XUYKmZZh4G1svzfRcwM+h2
 4zqAJcKlBHgvASu7LKAh1d51vAYfxiwOjg7iVW5Y2WyLEr8oBHwrePnTpxfUNFNYz6ou
 x+BEVGWu0fRX7+hvW2JcuktFEdWExDZOknWT9t1uqaRIUsevQd/afiN3H0unbdaAeVuD
 cAFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvUS6DR2qEqc57JP0FG6Cqop0gQ5cQW3kLpzMR1icYkvwk5ASB1pnlty4nGb8qM5xi/KlAo2FPeeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDe5rMyuhIbvRw7yEqflgkf9Txx/+27I095+167JkppsSPZNNl
 k0FhxqtK657qIoqeUHZUYI5tpdn+O99h1HpBovPUBtlUohRaRiYhscViDXYFd97Ggd8=
X-Gm-Gg: ASbGnct8w5ASa04bHT9Bob9myikcpSSiT1Bwe+3yPhoEwaDOcDk1FCLnw8x3fxJXnkq
 Mv1SuM/16njWQ7y1HYnh1grDi4UnfuoWKoI4Zwn8eGRa9BzgoQ1RqHsKZf2e8Vp02h+r2+KpEbI
 Q+ZM2BrPUUqRAn6mf8di99wb3y4RaafjCUnGdeNBrSeps7cTIBfPotqaGliYzxEovzGItTPse3t
 oD4nPlh9kAd4swOrGNtsQxwY4UVVXclsJJLraUGtKYCaGcOGKoxIiq7r4LDLQCEfLhs/LKoTbHv
 OsnfEeRzysWepW2TJpSJmwMsGriKxChhtjhwWOHRpWtL9qk3pw6vCLXhc/xtCp62cXXn87G06+W
 l4U3knfx1RcjoM6cMBX+Xo00roNqXpBfOD3nfzrYSNumdicuI1bCjik8g+WUkQ4mc9LTc7Qj+aW
 /tw4hnPYXITNKajoEoZIP7QchJdTWSVgeol3PJP9uVpHZJ1llcsc0QOKdsieMiiwFtGQ==
X-Google-Smtp-Source: AGHT+IHHYkOSRLQTcu4pKXAB6vP6lq14xe8rGXzjr9k/3hlfRzAUy3gSbW6FpnfCWeD0/i3DIqOFzA==
X-Received: by 2002:a05:6512:318d:b0:57f:7baa:b9bf with SMTP id
 2adb3069b0e04-592fc9fe79fmr2179687e87.23.1761500405345; 
 Sun, 26 Oct 2025 10:40:05 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm1713620e87.20.2025.10.26.10.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 10:40:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Oct 2025 18:40:02 +0100
Subject: [PATCH v2 3/4] drm: panel: nt35560: Move DSI commands to
 enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-fix-mcde-drm-regression-v2-3-8d799e488cf9@linaro.org>
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
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 561e6643dcbb..b0b11d3e26fe 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -278,16 +278,18 @@ static void nt35560_power_off(struct nt35560 *nt)
 }
 
 static int nt35560_prepare(struct drm_panel *panel)
+{
+	struct nt35560 *nt = panel_to_nt35560(panel);
+
+	return nt35560_power_on(nt);
+}
+
+static int nt35560_enable(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
 	struct mipi_dsi_multi_context dsi_ctx = {
 		.dsi = to_mipi_dsi_device(nt->dev)
 	};
-	int ret;
-
-	ret = nt35560_power_on(nt);
-	if (ret)
-		return ret;
 
 	nt35560_read_id(&dsi_ctx);
 
@@ -317,7 +319,7 @@ static int nt35560_prepare(struct drm_panel *panel)
 	return dsi_ctx.accum_err;
 }
 
-static int nt35560_unprepare(struct drm_panel *panel)
+static int nt35560_disable(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
 	struct mipi_dsi_multi_context dsi_ctx = {
@@ -332,12 +334,18 @@ static int nt35560_unprepare(struct drm_panel *panel)
 
 	msleep(85);
 
+	return 0;
+}
+
+static int nt35560_unprepare(struct drm_panel *panel)
+{
+	struct nt35560 *nt = panel_to_nt35560(panel);
+
 	nt35560_power_off(nt);
 
 	return 0;
 }
 
-
 static int nt35560_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -369,6 +377,8 @@ static int nt35560_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs nt35560_drm_funcs = {
 	.unprepare = nt35560_unprepare,
 	.prepare = nt35560_prepare,
+	.enable = nt35560_enable,
+	.disable = nt35560_disable,
 	.get_modes = nt35560_get_modes,
 };
 

-- 
2.51.0

