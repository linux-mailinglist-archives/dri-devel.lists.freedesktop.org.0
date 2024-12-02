Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7CC9DFAAA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 07:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1C910E2FE;
	Mon,  2 Dec 2024 06:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="T4iXfiVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886DB10E1B8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 06:24:56 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so33953295ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Dec 2024 22:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733120696; x=1733725496;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sDOn1kgP9dyN0sCNSB66ae9hZxj03s1PKGEuQOpzwTg=;
 b=T4iXfiVQh7ai90AzC0hqMoWG+zha6Jup7NIlxpMGVjWFfEUk+0GiMOqkKOZM8plt+J
 BoinHmBOgqIpw1B+LhIJC5NzMToXY258vVlONpoJSNEwrm+47GMRsnEBFRJNMTNfUDyf
 0t/kb9HTf8zVRZZWDm6IvQh+94yV1qzWdc5m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733120696; x=1733725496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sDOn1kgP9dyN0sCNSB66ae9hZxj03s1PKGEuQOpzwTg=;
 b=NwIshWcj3z3s/4enWxgF0E+FWJuhb9zHAS0rkAKhzUFQIQRooa+JX8J56G1jQiU5Ub
 wJ46J4AQ4+F7Y0vTa2YLvnIlGO1prJbe1naUDGMc/KyoyAezMXU9ka6PM9ZFdC+Okdbl
 6DiU8EqR1i7auzIV0R1xXvCAfl4PiTr+9jAJ7iGW6l53YXE7putawp7zxP26HRYhAcQ3
 GGTbGnpIg33yTQcIg+eqOaA6KSg0W/Da3nZga8Wn1bsYjFdFfAQukiQV5ioLm7N62uyZ
 vPCib2ugJcWGf7/hF0hLcT7zJ8+D1SkXKkaAo+XROXuCL5qeQaP6fC2pVlEKe8MbcU8U
 JsBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTIEOGMvX8StFlNXQn7iWT88F7HiDP2guQLkPit3AMNnuRraEpOsJBoMxqz7e/CXo8QNizf6eOP+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEuK1AuKdPp/iuT20ozm9d8odeHCIr29GzKh5VJY6xrBRwX+cl
 8R2dEXniog7jFx83baPDAOOk66dVLfnquhIuOw8RP77ptDlI/mRgSepduMQ+H6X4metR2b1dkM4
 =
X-Gm-Gg: ASbGnctxeqSAqbX3rFZ6v3830qNDeCBUTZXKvYSNuoaxEaaa4G4J7GD8FYGcKgiq9An
 CIAV4dGa//g9z6Y3hPBFioL66hK1RROmXNYJjMEN1RmdzC0tOFNemRf2+YlRg+uXZQVKzgJe0S0
 bcp7yalgkIjr5UKL/SdejkmafxZsL2rbouSnuUFIkvLoxNraxdVvUr/KjpLGfqRo/9VefXaay1i
 oPRwAKWSM2Ezv6+PNuxr7rspZbQjXYLd510fC3iXRM1N0AIxw3SZYukhQhZbchd7lkc
X-Google-Smtp-Source: AGHT+IH19cjrOJsKhhiX1zQY7ljL7c7Kq2UdIjzaEbH/YJzqCavSW6LNG02QJO6bH/EaQUV6TDaNAw==
X-Received: by 2002:a17:902:fc8d:b0:215:5ea2:6548 with SMTP id
 d9443c01a7336-2155ea26782mr107540785ad.8.1733120695956; 
 Sun, 01 Dec 2024 22:24:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:94c8:21f5:4a03:8964])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2155337b660sm37724055ad.69.2024.12.01.22.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 22:24:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: visionox-rm69299: Remove redundant assignments of
 panel fields
Date: Mon,  2 Dec 2024 14:24:48 +0800
Message-ID: <20241202062449.65593-1-wenst@chromium.org>
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

Drop the separate assignments that are redundant.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index 272490b9565b..1df5303eb57c 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -193,7 +193,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
-	ctx->panel.dev = dev;
 	ctx->dsi = dsi;
 
 	ctx->supplies[0].supply = "vdda";
@@ -215,8 +214,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-	ctx->panel.dev = dev;
-	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
 	drm_panel_add(&ctx->panel);
 
 	dsi->lanes = 4;
-- 
2.47.0.338.g60cca15819-goog

