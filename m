Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1EB715712
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84CA10E366;
	Tue, 30 May 2023 07:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58F10E358
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30addbb1b14so2175072f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432309; x=1688024309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YYg3fc69ScJ7fp+A0MjAsWU7xUehEqfWXj7B6hyn3hM=;
 b=JQ04iDdLMSAvRnw33ada0AcNyYSL1kQOGfFyhn38LnU4wNpARK7erpm/jOrY7x1tLF
 059fkGG17a/oJfyafxgI01ct+6kb2OlEEkol2pmtSb6Z+/NcyZcOyNLhLKUOE7zfrK3U
 N92qonlieUJZjdqOZgsvOaZywmmOS9PjRcQbMGhJWnsH5rV6U2ffzJJZqWjNzFdFuYZr
 q+bb3z1lUADWFL3myXY5/fcSXTzNp6ubNdqAQiyLBaQcECl1y0XCFiRMuiyw9Ry6Mzpe
 cPu9fmNoa/wPIE2sj4ZyJWxHfh3GwKO0z8H3dP81ZaumKnEy75iIWyefh2QvFGSFEURu
 mqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432309; x=1688024309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYg3fc69ScJ7fp+A0MjAsWU7xUehEqfWXj7B6hyn3hM=;
 b=UP33hh0hJF1UM5KsELLwpLwUym00ghx/FZXPLFci+9dWKWID23bvyI39NLBRnbCGpO
 DK45YqTgc8icqUrRfN48kYkFL3gzeeGH/SqMYh1S9pjTiwMD7sdjtiFRd3owZ9BDmZmf
 /LFq1ZQFc7NK4IkQk/N+s7MrCrsdFq6WoAMcSaufNN1HY0yfEtwW2RzdXaeVtBnmWlro
 qwu7kWrE2HPmuigv2HoIIyMf6elV7DMVkbgTiWwzy37BbAeYRfsJtZ2MVYak+wVaDXEB
 WQ6BpviZrAiv0e6fbZVvR4cbJXb2nxeIynpUtdPhePfDnJSS7lfQQMAE0LSHvB1fiv66
 Z48w==
X-Gm-Message-State: AC+VfDyzW4TCLxxEZrULGeYPO4SuXegCT3F19zu1LV/ZiCorEWWhundJ
 s80RG+CZugZ16pUbDNScvHHQbA==
X-Google-Smtp-Source: ACHHUZ6R3/5jCvzC/EfbuZ2wl9ps+H31Dyo4EwKtZB12YzdkTlX839WIivh9XGpn75rT6sT0OWR+Zg==
X-Received: by 2002:a5d:5544:0:b0:30a:e86d:17a3 with SMTP id
 g4-20020a5d5544000000b0030ae86d17a3mr831595wrw.46.1685432308830; 
 Tue, 30 May 2023 00:38:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:14 +0200
Subject: [PATCH v5 13/17] drm/panel: khadas-ts050: update timings to
 achieve 60Hz refresh rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-13-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mst4lZ0rnXCLGGf7dowtnVBMlyjZYveMg1KB2R/Nmno=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafiK1ejjQEfL6v/BkAEbC5WdiwOP7ROMvZsKoYw
 Bm0o05iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4gAKCRB33NvayMhJ0TDqEA
 CLl6EorbfHvfwJvkIKiFIEFczCFvIK7+cAt6kXd+MZQMXkMsqn5qPI3QRmk1ZBh7lN3LDRxeDrMoVh
 aFNCHjmTsOZDWCdughiNifGjmHO72l6LnfjHZC34b6H+87IZJboWXpjoYqFoLYf0YjiPJh/Zbcfg1P
 UAS97hEdsPuCrQ7fR/PBtK2gtocZFFBhrASg4BvAo5janiHp/zBFZdiGtahO1mn9/NmbYwysvI0hkX
 /v+ZB9ya+Tp1HwvDvPv3nQbrr6dwbny/i+c2I5MORDsyEKxiNMx5IT8YlHDclQND99GPPeUUWRAmur
 afkVVauiVFDjNvftRtHg+5c8pSRPApTa8jJ+sRidFqfHuxfkEZ/L76QHULozYOseDrx776EgU2s1V7
 hJrlpIxerxu8LLI0coEGyEdqkYxwiSlJJ9qgUCJrVu2ifLbFyk7+v9nTw3Y95dzeJvtbeSZG/b2lqx
 Cwx7FOIZ5xE9N5jmECgXAjFBJvU9TdVQU7NgSt9/y6MWVUBY2sP1JP+PfG2u/9SLBEBFelwpZsletR
 tefrmAF/JJdCOus8SXEBBcaUexGMqhxqQqyJV0jonRCk/IMnxaPyBGdy6aJ145a2NF1AwzGLeyuda9
 N5w7eDepG4GrvedwFQN0epbFI86B/7lVlpf09pz2Q2vM1OdV30aAYfxpK4AA==
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This updates the panel timings to achieve a clean 60Hz refresh rate.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 1ab1ebe30882..b942a0162274 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -568,7 +568,7 @@ static const struct khadas_ts050_panel_cmd init_code[] = {
 	{0xfb, 0x01},
 	/* Select CMD1 */
 	{0xff, 0x00},
-	{0xd3, 0x05}, /* RGBMIPICTRL: VSYNC back porch = 5 */
+	{0xd3, 0x22}, /* RGBMIPICTRL: VSYNC back porch = 34 */
 	{0xd4, 0x04}, /* RGBMIPICTRL: VSYNC front porch = 4 */
 };
 
@@ -717,15 +717,15 @@ static int khadas_ts050_panel_disable(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode default_mode = {
-	.clock = 120000,
-	.hdisplay = 1088,
-	.hsync_start = 1088 + 104,
-	.hsync_end = 1088 + 104 + 4,
-	.htotal = 1088 + 104 + 4 + 127,
+	.clock = 160000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 117,
+	.hsync_end = 1080 + 117 + 5,
+	.htotal = 1080 + 117 + 5 + 160,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 4,
-	.vsync_end = 1920 + 4 + 2,
-	.vtotal = 1920 + 4 + 2 + 3,
+	.vsync_end = 1920 + 4 + 3,
+	.vtotal = 1920 + 4 + 3 + 31,
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 

-- 
2.34.1

