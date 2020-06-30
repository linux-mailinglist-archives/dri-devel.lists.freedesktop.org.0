Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBB20FB5A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4086E0B9;
	Tue, 30 Jun 2020 18:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671A86E091
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:06:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d17so8976834ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEij/FHVrQ+HUl9eTjVepoVKvB3j/avPt20/u3J9TTI=;
 b=ahaKqyYSHfwx+p3Fjo5gbt2x9PbF4vGvv/vEjyjzkfngh5Wsx6QRKOKb1T3868EVPP
 EfuzjwKE918QODp5mcsUmFTn81c7EsBLrJCl9qt0L/cm4qmXln5CDzox/xJ2RZi/gQP8
 KaQ7Lc9zgGoZZHX4LRCAoDnQzOXyFv2bC6TrDRuDP+VBcbTbEcUur0PU8hEvTPhTuLtD
 OyaQzjjhY2JBQCbkfCCx0i8natPlMAtxmoTLZCHOFSMnwKeCHj57U3iUS+Dpiv3T16Th
 GxZeKP2ySdvHRD4GbX9C1Ymqfyw7EE3839dnq3fNa2DthVsFBpsyITBAHTpRMby0VcSZ
 wKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XEij/FHVrQ+HUl9eTjVepoVKvB3j/avPt20/u3J9TTI=;
 b=s+BHYNaIaruVh+brIR4kfdWm0N2A6unPLc/s8dMko2aaq1tP09BN57JN3n63MgKFwL
 Vzcix/RORv7qtuzm36U26ZeJBaIsu/xU9Xtxdmv1DA26Q/dznIKs5R61hg5pPKvVb/tz
 6cLzAUIBq6k+lqpfU7AXqR6hArWI23jXMoLHYz6szKjZe6jZQfezryeLSah4FoycTbF0
 NKuu72b5USMpmBla8/sX3uYbkRkiKh+ww/TGaUALjTauCa0j40rC19ZpuvpoWwJ+aKhP
 hzW6BPKdD00WL+qe+yoZgwTUZiU5xSOGcq20GT3nvc6zommJLCLn+s2zlbQrxTP9hWIQ
 hb3Q==
X-Gm-Message-State: AOAM531L7hkdWjbCAa4/1XjOB7Jo0onrpcBG+Oi4xCOkN1avmgvUTLZd
 PysLVUYNmo8zGOc0f3ocYkgSYDuRUxI=
X-Google-Smtp-Source: ABdhPJzqyQ5J/phwrSSO+vA2lJXRdVrAfRriwF0KBBfnQVxalFi+/gZCUULvQ2X4eLxNHfHnWankUA==
X-Received: by 2002:a2e:9d1:: with SMTP id 200mr10470133ljj.392.1593540361401; 
 Tue, 30 Jun 2020 11:06:01 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:06:00 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 5/7] drm/panel: panel-simple: drop use of legacy
 drm_bus_flags
Date: Tue, 30 Jun 2020 20:05:43 +0200
Message-Id: <20200630180545.1132217-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630180545.1132217-1-sam@ravnborg.org>
References: <20200630180545.1132217-1-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace all uses of the legacy drm_bus_flags with their relevant
_SAMPLE_ variant.
This is a 1:1 replacement, no effort was made to validate the actual
bus flags for the panels.

Note:
DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE = DRM_BUS_FLAG_PIXDATA_NEGEDGE
DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE = DRM_BUS_FLAG_PIXDATA_POSEDGE

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3a35f74d6cb7..4f0ec5e5b0aa 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -681,7 +681,7 @@ static const struct panel_desc armadeus_st0700_adapt = {
 		.height = 86,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
 static const struct drm_display_mode auo_b101aw03_mode = {
@@ -1339,7 +1339,7 @@ static const struct panel_desc cdtech_s070pws19hp_fc21 = {
 		.height = 86,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
@@ -1366,7 +1366,7 @@ static const struct panel_desc cdtech_s070swv29hg_dc44 = {
 		.height = 86,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
@@ -1577,7 +1577,7 @@ static const struct panel_desc edt_et035012dm6 = {
 		.height = 52,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
 static const struct drm_display_mode edt_etm043080dh6gp_mode = {
@@ -1720,7 +1720,7 @@ static const struct panel_desc evervision_vgg804821 = {
 		.height = 64,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
 static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode = {
@@ -1768,7 +1768,7 @@ static const struct panel_desc frida_frd350h54004 = {
 		.height = 64,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
@@ -1839,7 +1839,7 @@ static const struct panel_desc giantplus_gpm940b0 = {
 		.height = 45,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_3X8,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
 static const struct display_timing hannstar_hsd070pww1_timing = {
@@ -2885,7 +2885,7 @@ static const struct panel_desc ortustech_com37h3m = {
 		.height = 75,	/* 74.88mm */
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE |
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
 		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
 };
 
@@ -3184,7 +3184,7 @@ static const struct panel_desc sharp_lq070y3dg3b = {
 		.height = 91,	/* 91.4mm */
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE |
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
 		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
 };
 
@@ -3287,7 +3287,7 @@ static const struct panel_desc sharp_ls020b1dd01d = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH
-		   | DRM_BUS_FLAG_PIXDATA_NEGEDGE
+		   | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE
 		   | DRM_BUS_FLAG_SHARP_SIGNALS,
 };
 
@@ -3386,7 +3386,7 @@ static const struct panel_desc tfc_s9700rtwv43tr_01b = {
 		.height = 90,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
 static const struct display_timing tianma_tm070jdhg30_timing = {
@@ -3475,7 +3475,7 @@ static const struct panel_desc ti_nspire_cx_lcd_panel = {
 		.height = 49,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
 static const struct drm_display_mode ti_nspire_classic_lcd_mode[] = {
@@ -3504,7 +3504,7 @@ static const struct panel_desc ti_nspire_classic_lcd_panel = {
 	},
 	/* This is the grayscale bus format */
 	.bus_format = MEDIA_BUS_FMT_Y8_1X8,
-	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
 static const struct drm_display_mode toshiba_lt089ac29000_mode = {
@@ -3633,7 +3633,7 @@ static const struct panel_desc vl050_8048nt_c01 = {
 		.height = 76,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
 static const struct drm_display_mode winstar_wf35ltiacd_mode = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
