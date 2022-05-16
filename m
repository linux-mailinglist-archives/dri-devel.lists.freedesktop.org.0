Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B417F52B329
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4793C113E60;
	Wed, 18 May 2022 07:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F2810F0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 19:38:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id g6so30654946ejw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MqTQsyrPlGAY3ZVzPHFppwBaFcUmVAxjZ/gLZ8oCIM=;
 b=DR4HwFyZjcgNl9bY9VS/vPVcdS9vGcZ4UcI0exJWuatVr6wqNn14ouE/TU7fKGYxzU
 cUFuYJuiT3d+zuIik3iilAMuRUWnnj7sxuJ7/zGIdXqTrSvdbYMor2TAw0862NfjGKi2
 gvUVdfusJ4TSHv5J3yCLisQ9nsjLQ+XgaiqXcG7uNWYdXAYlOJwOt2hbgKwagC/W5y81
 GG0gSIXNzi5s5rnEfUbNqGOYBvhdh3hqKd3VgcId7RN1V+SWoo4A9F4xoSLklFztd48c
 QJ5QmuYfxQz4foTVEE7QE2EsVgzh2s5LTvDi2SvJ77Q79KE5iApKjIjFqL29Dh2aOOMg
 66gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MqTQsyrPlGAY3ZVzPHFppwBaFcUmVAxjZ/gLZ8oCIM=;
 b=KRSVohp/BgduR6gDGdkHsOjjkxi9OtNZkQWxqH6oieRG0gMqVqk83ivIxyd5nY/Udc
 yIijkxrh7d5x/QToeXqCrBKF7RbsZfaevRKPe4j1BWyopM9uCvMxTwXGh7A8uappOJk6
 WdNlB2ra/Fhfqs+jupy9sWByC7ikIhfv9QaPDW94TKDlhnomxSDhPq5BUCK2UzHIv+OW
 iaWatMk3DgayxbMnZW55AN8FFgp2u4reFdDl1kYOQ2e5HiViXEB9jskt865LIIPco/Zo
 11Up7t0iwFaPigmUsCLhrnRmTD2Gcr/YOo/RVjjfSU7LMldYC1KZgvfawrtihROAwUQm
 Gb/g==
X-Gm-Message-State: AOAM531lXuHFtpSgKePXGCgc7tzgdlCQii5coz+ePb2yUD4ZiAO0qTGB
 9AaLGj6Mtqq//i50VSIdkfw=
X-Google-Smtp-Source: ABdhPJz99o3t2aqzUBbPpB8Umrag5RKOsZT6WcUNWQ0L92iB4gSTkFvsWzRTJzw4xvP5MgncWEnwkQ==
X-Received: by 2002:a17:907:2d11:b0:6f4:7cf0:2275 with SMTP id
 gs17-20020a1709072d1100b006f47cf02275mr16523834ejc.72.1652729935167; 
 Mon, 16 May 2022 12:38:55 -0700 (PDT)
Received: from adroid (102-167-184-091.ip-addr.vsenet.de. [91.184.167.102])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a17090664d900b006f3ef214e41sm92831ejn.167.2022.05.16.12.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 12:38:54 -0700 (PDT)
From: =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/3] drm/panel: simple: add support for the Samsung LTL101AL01
 panel
Date: Mon, 16 May 2022 21:37:08 +0200
Message-Id: <20220516193709.10037-2-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516193709.10037-1-martin.juecker@gmail.com>
References: <20220516193709.10037-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add timings and panel description for the Samsung LTL101AL01 panel.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..e21f304315e4 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3073,6 +3073,37 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing samsung_ltl101al01_timing = {
+	.pixelclock = { 66663000, 66663000, 66663000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 18, 18, 18 },
+	.hback_porch = { 36, 36, 36 },
+	.hsync_len = { 16, 16, 16 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 16, 16, 16 },
+	.vsync_len = { 3, 3, 3 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc samsung_ltl101al01 = {
+	.timings = &samsung_ltl101al01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 135,
+	},
+	.delay = {
+		.prepare = 40,
+		.enable = 300,
+		.disable = 200,
+		.unprepare = 600,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -3966,6 +3997,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "rocktech,rk101ii01d-ct",
 		.data = &rocktech_rk101ii01d_ct,
+	}, {
+		.compatible = "samsung,ltl101al01",
+		.data = &samsung_ltl101al01,
 	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
-- 
2.25.1

