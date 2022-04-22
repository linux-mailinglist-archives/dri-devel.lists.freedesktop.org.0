Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27950BFD4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6AB10E5B5;
	Fri, 22 Apr 2022 18:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037E310E5B5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:36:28 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e5e433d66dso9502402fac.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 11:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYDzvgMtPv0Sra3reRjLoO4qoRcfqTmm12kpUHj+OS0=;
 b=H1z1ukKqcayCONXY3N4axNdhGrsSGil5NuQyOE0n43I8ZNeWh3qoP3ubUAU/ZFz3GL
 q6V1bYUHKP7ry5uTl+Nqeiyl0HHGlaAhVyK8gwZ7FHT3WFCt5aTTiOEytuE7qFAsDvz4
 QQK56sHMDhdW77+hcddKWxQvrh61lzW6cp45q6JWRzqvnhxJWd+HsK+2r9V2GisFrg7C
 0sQIqU3RxgEwCJCGQzEOqYyRoWd3eD4T6jUKpVMbzvnLnqAnd8wDFf+oTk05JQsIFHKs
 fr/VhkQiMIaVK+AQAeeHCWTuyFGd5Z2JQJytnGaLsnCNSkYs6QSC9ibC9pJKDUzF3KDN
 GCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYDzvgMtPv0Sra3reRjLoO4qoRcfqTmm12kpUHj+OS0=;
 b=QD5cZ9l8HjKW9IOK4BN6j0772YFRKgjvmIi3vYuViz+WaYeNvBhGPoiO1UJQuPltji
 PMHpTaa2zmAYglijRBWGEHBHK1fJGwGA/uS3LND4QCoMn2x7lLdxTNuMxig8e5TvZ+nn
 SPRMiSb4WaTcoFS7/O5jq9CbpddLUiU/hRjDczgYM9ks/J+ckuklNhtP0pm4REP5/MXu
 RXDFScow50VV67C5xdF1VtUEEU6TjST0RUAaF4rKsbW9mOkescsckgCmuUmkNj8uCLnS
 cBv+MejLpofZEXqbK3t9OpYnoWm7T5jb4y0tx7JpFUy3k27Qa/NIizaHzCPYGD01lTb5
 n+QA==
X-Gm-Message-State: AOAM530pffh4op9mPOEyK9bm7c8UfOK1QtsiunWSY+ckJtXdbn9m9KLd
 jvJXgKUxq9ArrD0b/nubnMuMQcx8VZo=
X-Google-Smtp-Source: ABdhPJzZCTIYiwI+B3EooHwCeHAFkqZ1S/tyC5G9TQ0cxP6AxhE6Y+x+gwqQgIh0rTKh+nbhrRGovQ==
X-Received: by 2002:a05:6870:2425:b0:de:2fb0:1caa with SMTP id
 n37-20020a056870242500b000de2fb01caamr2642796oap.115.1650652587306; 
 Fri, 22 Apr 2022 11:36:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:9f29:454f:1c77:1b6b])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a056808015500b00323c43663e2sm1006651oie.32.2022.04.22.11.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:36:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH v2 2/2] drm/panel: simple: Add Startek KD070WVFPA043-C069A
 panel support
Date: Fri, 22 Apr 2022 15:36:14 -0300
Message-Id: <20220422183614.1762470-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422183614.1762470-1-festevam@gmail.com>
References: <20220422183614.1762470-1-festevam@gmail.com>
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
Changes since v1:
- Put the panel entry in the correct order (Sam).

 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..61d82d7be1ba 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3284,6 +3284,36 @@ static const struct panel_desc starry_kr070pe2t = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
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
 static const struct display_timing tsd_tst043015cmhx_timing = {
 	.pixelclock = { 5000000, 9000000, 12000000 },
 	.hactive = { 480, 480, 480 },
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

