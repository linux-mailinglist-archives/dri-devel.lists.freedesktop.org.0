Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA4515197
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CED610ED64;
	Fri, 29 Apr 2022 17:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B77A10ED64
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 17:21:16 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id r1so9001238oie.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 10:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JujFyyZhvM4XOXVsYz78/GtAJG0bR0liSI3QGaDbkow=;
 b=HaGjDDZ99AMi0OWYgvKPimL2aWVGOgMgM/KXY5LrO5hP03zoADF928VEreD+A+R09A
 snh77iR0n8MSzKQytLiTiaOtMcDO2RcUkbdrf8niOYZEaiPCeI4Rm3FtPDxFsHcNRrxf
 Ymsa5GI56jSz1cmzlRfhnxpoSKPmxBA+2ZWd/VE6c5GD9ixQIPIXRuRKyRnPIOEHbbuk
 Yf2xqs9wxYPsmTp2301XetFvO5l4QDAupZnQfLQ1NqR2u7rZcZB9Nx/oEzI7T/E71ViC
 EDgODrVnNoc3Nt/ajhLxlMVuSuDojEtugpmH3rtMx1BPqrz1l+vigkHIqLtiPl+b3YLH
 4tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JujFyyZhvM4XOXVsYz78/GtAJG0bR0liSI3QGaDbkow=;
 b=X0E2wkmEOK89UoB73UayL7RGo57kcbkdYJmsYeaDtL8t0mpaQBErk12xz6Hqcazt7K
 NC8MY7qjZUS87Gtvm+Y6sBehe3KXM+Iw+dctgexhHdzo26MM5e6EzfThKED1fy1wSNoK
 zd6JZ6dy32Fh/Altj9E4mZVWcEsRq7L24bF8NN+v4Mz1NivE7HQApe4++2Hsz9Cy2H1B
 Hch0WLzZzdVTMURbpjaxoSZDnUQs5QDVkzRSg7zzmv9c1lIqrwFfZRvTYuN5rMBfSWGM
 ccyse9xK1JnZeA2kPxySV26aAZ2GAq/XVtyG7ld7IEBmHNz4cYYZ12jum9Nk6if71sh+
 6EHA==
X-Gm-Message-State: AOAM5318GQGlFbcgBha/mMrBsrXBf22MfCAayn12T5kDFiBOQWH/+9uq
 9BKiUAro3/tdqLy2kRcM8Dk=
X-Google-Smtp-Source: ABdhPJyE2LcK0HrcmxW1Eh6+2wv8OOKioUST747y5swXm3Ts0xmS4XVM7pTpNaanUq0jHqFEExdkWw==
X-Received: by 2002:aca:3403:0:b0:322:82c5:2ef5 with SMTP id
 b3-20020aca3403000000b0032282c52ef5mr1934097oia.38.1651252875427; 
 Fri, 29 Apr 2022 10:21:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:5013:a749:adb3:2bea])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a056870d58300b000e686d1389csm3509288oao.54.2022.04.29.10.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 10:21:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH v3 2/2] drm/panel: simple: Add Startek KD070WVFPA043-C069A
 panel support
Date: Fri, 29 Apr 2022 14:20:56 -0300
Message-Id: <20220429172056.3499563-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429172056.3499563-1-festevam@gmail.com>
References: <20220429172056.3499563-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, hs@denx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Schocher <hs@denx.de>

Add Startek KD070WVFPA043-C069A 7" TFT LCD panel support.

Signed-off-by: Heiko Schocher <hs@denx.de>
[fabio: passed .flags and .bus_flags]
Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v2:
- Pass the full flags and bus_flags.

 drivers/gpu/drm/panel/panel-simple.c | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 595396f57632..8c9fae298d9b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3310,6 +3310,41 @@ static const struct panel_desc starry_kr070pe2t = {
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
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
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
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+};
+
 static const struct display_timing tsd_tst043015cmhx_timing = {
 	.pixelclock = { 5000000, 9000000, 12000000 },
 	.hactive = { 480, 480, 480 },
@@ -4019,6 +4054,9 @@ static const struct of_device_id platform_of_match[] = {
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

