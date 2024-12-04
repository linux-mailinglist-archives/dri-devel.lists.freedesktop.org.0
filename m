Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B39E36CC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AB810E12E;
	Wed,  4 Dec 2024 09:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WNl+woxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930ED10E12E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:39:49 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7fbbe0fb0b8so4948648a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 01:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733305189; x=1733909989;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LmKQFaFDxD0Y+gWKKpkjZY/jkt1D47sAd7yQDFNQk7s=;
 b=WNl+woxw3BnxWj/GgTfAcbbpS+esddwzHHuIyhtl80zQ7Qm/tLyKU6wCitYzG15RxK
 Wfu7GIrWx8lA1Z/LM0D35xkgbJV+CJwVypo3IKMgNmP19rztVvwlUlSVRfncCEBooQsY
 mwDIlzb5gs4DS7Ka1UedsiC1JpRhBVC49CDdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733305189; x=1733909989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmKQFaFDxD0Y+gWKKpkjZY/jkt1D47sAd7yQDFNQk7s=;
 b=aix0bajCc4emnOtZiEOOW9xeid14U292rBeC2vaHf1RVtSxyDfGaFTBBum6w78R7q0
 UYUOj+WAv3N8XWbItEGb9MKfAjLxqjmVzdPKdSDMOG2qd0iRM7zFw09LtSX5uXZqTMu/
 7S0VAwuVLYoKzMYQj9+IVuo/JfiEVY3G+tnIQdjQ1n0OiRcGzCp/HQ1Vtp6QmR200X8T
 Ckm15zqh0QcgTPLqZZPZSlE4eX7vLcdM5fzgIW8j88qA4ZuPqJO5lSv4awIdiY7JEQ/I
 1N3pr72c/VYd1zFgp6gJTKfxA7bPWOv6K1FnU/VsEV1HpuodmohcPxHQ6xIv0ds0t2lh
 PTYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk3nZ6gddc7BCqPVTPLwvdrc1IM9RlLKKEKyhUi+Bcq9zbYiDmZSgeMGVJAcvKPePEEafNrl2FYEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXWLIy6qMXFF7/Sq4YlICP/nct9yZoinUSGaPWqQ87yJJINomQ
 VLAseluBiRLXI14pmRCO1uB9/eCwKtxkfpmktZhonvCcGAdzplFnCQS6nhnAUA==
X-Gm-Gg: ASbGncvNdiBpEl4ROY+z8X8gYkIj4WGGRsX5/s7kQQZcjB9UfILfZM9mO+1cSbEhjGG
 Bijzhpg4FNT4guP+de5nAz8/7Iv+QxJhSVDerSn/nQySbXCZsywB0Zul4aMwXqQWsUxFOLSS6hY
 sv2rcfM2wMnx8SLasQzoDaErg9RR4nwrBku4p1Z9uJlkVhFraYUiaRfudrLiV6IEnZhOvWvlVse
 07EhRqPNDN8XT5WMSlxFuoUderLTu2JNToGHDPs1QfIFH78WoOE519vGM/VIT8dBegM
X-Google-Smtp-Source: AGHT+IEXmsp2Cw7/pay6uwf+WDn2jkrMrMPX/IyvfyMp5biRmOor0cpwmgHeDuThnXWYu9lRSdyKkQ==
X-Received: by 2002:a05:6a20:6a28:b0:1e0:d0ac:133b with SMTP id
 adf61e73a8af0-1e1653f2f2fmr7945090637.33.1733305189083; 
 Wed, 04 Dec 2024 01:39:49 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:2eb1:a68a:2625:b944])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72541814a57sm11910814b3a.167.2024.12.04.01.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 01:39:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panel: visionox-rm69299: Remove redundant assignments
 of panel fields
Date: Wed,  4 Dec 2024 17:39:41 +0800
Message-ID: <20241204093942.1374693-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_panel_init() was made to initialize the fields in |struct drm_panel|.
There is no need to separately initialize them again.

Drop the separate assignments that are redundant. Also fix up any uses
of `ctx->panel.dev` to use `dev` directly.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Also fix uses of `ctx->panel.dev`

 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index 272490b9565b..be3a9797fbce 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -193,7 +193,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
-	ctx->panel.dev = dev;
 	ctx->dsi = dsi;
 
 	ctx->supplies[0].supply = "vdda";
@@ -201,13 +200,11 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	ctx->supplies[1].supply = "vdd3p3";
 	ctx->supplies[1].init_load_uA = 13200;
 
-	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
-				      ctx->supplies);
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies), ctx->supplies);
 	if (ret < 0)
 		return ret;
 
-	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev,
-					 "reset", GPIOD_OUT_LOW);
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio)) {
 		dev_err(dev, "cannot get reset gpio %ld\n", PTR_ERR(ctx->reset_gpio));
 		return PTR_ERR(ctx->reset_gpio);
@@ -215,8 +212,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-	ctx->panel.dev = dev;
-	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
 	drm_panel_add(&ctx->panel);
 
 	dsi->lanes = 4;
-- 
2.47.0.338.g60cca15819-goog

