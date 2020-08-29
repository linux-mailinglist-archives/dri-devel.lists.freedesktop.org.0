Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09C256912
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 18:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7377A6E201;
	Sat, 29 Aug 2020 16:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80FE6E201
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 16:33:43 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id p15so1065568pli.6
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Apxjtlu8DYBDOF5mldDa/gPEeAR1t60BoMeYHKIoGuI=;
 b=QZJ5dKdac4Iext8grWZXs2y4cw4TLAIJ5uwUqWQbVwvaB0e4B2EsAdU1WMAEIaY5yN
 TkBdXfv0fRy2cNPT9oxVhO7lVKy0/J75cWH7rKQTNkFwPF+ocKMRuULK7ZFhaFD81+Gn
 x14+rHmYqf887takLFZxTv/h0bPlGQhVFhTS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Apxjtlu8DYBDOF5mldDa/gPEeAR1t60BoMeYHKIoGuI=;
 b=cgGr0e7d0QJW7igZ2OoeSfM7uHfyc4j6D/pcEFF/BYEJaSzSFw0rOCsnLv+SY3nH++
 cTSrogGL33pjNGW5wfjMm1wMV9L6ivqAbvF0gZ//g3QR7bQE017C5lklpirbsGn3MYQ0
 3smie5kcqUVHe1SwjMhEbeaHhYfWd4CMa+5QoDmfzw4gntYpJ5635duSIiEQBjILhzuu
 3hcGB7OEO6oXfdIiXzppyiMUcdJ3ZNb2vcdcI7NdNXLteuqMYwcJPPiqWHmBYfxNGw9m
 yRSZ8IyxOuqwkRD15JUBm58oO6ivJoofNqmqwiRgr2y3ANDFjX6s9Zp37C1bnWap9Dn1
 1wfA==
X-Gm-Message-State: AOAM533Mf8tMotQsvKoVhKjPBFj3g74k/oybwyqBFamvie3FUvQixkUo
 /TJCzJeyNkw91P2bvYafrSPMPw==
X-Google-Smtp-Source: ABdhPJwLaZtmSHF9YHYi8bPVvMaHNOSSExLBplTYuQJomtWyYkJ+P/fuI8rH8h/DDRreztBdRuphdg==
X-Received: by 2002:a17:902:7606:: with SMTP id
 k6mr3125530pll.171.1598718823329; 
 Sat, 29 Aug 2020 09:33:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:9460:cfb8:90a:fedd])
 by smtp.gmail.com with ESMTPSA id
 o6sm2457934pju.25.2020.08.29.09.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 09:33:42 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/panel: simple: Add AM-1280800N3TZQW-T00H
Date: Sat, 29 Aug 2020 22:03:28 +0530
Message-Id: <20200829163328.249211-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829163328.249211-1-jagan@amarulasolutions.com>
References: <20200829163328.249211-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Ampire, AM-1280800N3TZQW-T00H 10.1" TFT LCD panel timings.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- dropped vrefresh
- add bus_flags, connector_type

 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b6ecd1552132..b106142b11ca 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -592,6 +592,32 @@ static void panel_simple_shutdown(struct device *dev)
 	drm_panel_unprepare(&panel->base);
 }
 
+static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
+	.clock = 71100,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 40,
+	.hsync_end = 1280 + 40 + 80,
+	.htotal = 1280 + 40 + 80 + 40,
+	.vdisplay = 800,
+	.vsync_start = 800 + 3,
+	.vsync_end = 800 + 3 + 10,
+	.vtotal = 800 + 3 + 10 + 10,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
+	.modes = &ampire_am_1280800n3tzqw_t00h_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3637,6 +3663,9 @@ static const struct panel_desc arm_rtsm = {
 
 static const struct of_device_id platform_of_match[] = {
 	{
+		.compatible = "ampire,am-1280800n3tzqw-t00h",
+		.data = &ampire_am_1280800n3tzqw_t00h,
+	}, {
 		.compatible = "ampire,am-480272h3tmqw-t01h",
 		.data = &ampire_am_480272h3tmqw_t01h,
 	}, {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
