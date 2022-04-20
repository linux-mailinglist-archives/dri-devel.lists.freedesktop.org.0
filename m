Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854F507DD7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 02:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCB710E2F8;
	Wed, 20 Apr 2022 00:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93C10E2F8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:56:37 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id t15so459410oie.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 17:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hVEPnBu0Zu/ktIgSxLqc7mfzyihWduhfE5hDRQn+N0g=;
 b=Gr4CoDRooITKFEiWjK/U6lh/SMjCRVo3HReq2DoF8lJGkBoc6x0LyypOK+oMTmbb34
 lqCav2wpMmH+USSHkRN1GChTQPz7xmaQh+LkILXqWT2PgAyO7aHnw0uu9PHjjX0tnClM
 nkRSPOiFThBvmYkSjqv0cBQGR9HyXybrZK3KkbE7Ak/FYaKTko2frOtqCuGk35bxPFlm
 XHW+3PrFU3qnuQRwZCjRO1Cq35LtYr0mmJ4MUBnLF+0MMZcF9i0G0ozJ2wvAMajHgLMq
 57wqpvbGmWFlLishYhwyPtKJbfaW/2eeiWp8RWhqaqWT4vQnzhgdbr4V+8OOYLHyya7H
 8IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hVEPnBu0Zu/ktIgSxLqc7mfzyihWduhfE5hDRQn+N0g=;
 b=ccjPGnbNJMmjegK5BzwiUJbXoQXXAvZ2Ta2i406Cjx5LUGIIQYygY7BZvSwjUXruTQ
 GE+fKCwh8OgrOtsLizLN7xtjyqk/0p1hhZgHPZhx6s7rGEjp77HqLvbU2T7fCQiMTN2X
 Ijm81pMyFracO6uonxgYHO41ewrzf/fYqZWLP2sVP04v1UrWua+O/OwFNkoT8gSmdbkZ
 pgTyO45a8w3+Bn/Z6Ic6tgrEZTh02MiIR3DbKAFYao0V7oLKN1iv81UCk2zLPMhkniNT
 s5Sqft+GnC5AU7cdoMc3GEy4czAUmmUXnwX7Rdv1uhYvwzMR/LmuUtrvdrDxsGfnOMN4
 NMmA==
X-Gm-Message-State: AOAM530wrPZnHwxngBrjnZkF91YqZFPFvRIp3xZBdpH9mud1YX15IxpK
 QMeM6UsGTd9l/iq1zOzNYoo=
X-Google-Smtp-Source: ABdhPJxyAY//CA63y9KSujIt5321ChuohW5AYxB3hErWeX0WC6PZPr/vkFPZBuGuT4aKRp1GaD5ogg==
X-Received: by 2002:aca:c284:0:b0:322:8702:331c with SMTP id
 s126-20020acac284000000b003228702331cmr629366oif.188.1650416197082; 
 Tue, 19 Apr 2022 17:56:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:cae2:6d6c:7abc:9c1e])
 by smtp.gmail.com with ESMTPSA id
 i28-20020a9d4a9c000000b005ce06a77de2sm6227328otf.48.2022.04.19.17.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 17:56:36 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH 2/2] drm/panel: simple: Add Startek KD070WVFPA043-C069A panel
 support
Date: Tue, 19 Apr 2022 21:56:25 -0300
Message-Id: <20220420005625.990999-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420005625.990999-1-festevam@gmail.com>
References: <20220420005625.990999-1-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Schocher <hs@denx.de>

Add Startek KD070WVFPA043-C069A 7" TFT LCD panel support.

Signed-off-by: Heiko Schocher <hs@denx.de>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..ca8cd017821d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3311,6 +3311,36 @@ static const struct panel_desc tsd_tst043015cmhx = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct display_timing startek_kd070wvfpa_mode = {
+	.pixelclock = { 25200000, 27200000, 30500000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 19, 44, 115 },
+	.hback_porch = { 5, 16, 101 },
+	.hsync_len = { 1, 2, 100 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 5, 43, 67 },
+	.vback_porch = { 5, 5, 67 },
+	.vsync_len = { 1, 2, 66 },
+};
+
+static const struct panel_desc startek_kd070wvfpa = {
+	.timings = &startek_kd070wvfpa_mode,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.delay = {
+		.prepare = 20,
+		.enable = 200,
+		.disable = 200,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode tfc_s9700rtwv43tr_01b_mode = {
 	.clock = 30000,
 	.hdisplay = 800,
@@ -3990,6 +4020,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "starry,kr070pe2t",
 		.data = &starry_kr070pe2t,
+	}, {
+		.compatible = "startek,kd070wvfpa",
+		.data = &startek_kd070wvfpa,
 	}, {
 		.compatible = "team-source-display,tst043015cmhx",
 		.data = &tsd_tst043015cmhx,
-- 
2.25.1

