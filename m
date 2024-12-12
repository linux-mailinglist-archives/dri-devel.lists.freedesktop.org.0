Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7904B9EE6B5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDD610ED98;
	Thu, 12 Dec 2024 12:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="AcEFiVzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1023 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2024 12:27:28 UTC
Received: from mx.denx.de (mx.denx.de
 [IPv6:2a03:4000:64:cc:545d:19ff:fe05:8172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5671C10ED98
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:27:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AB5B1048AF4C; Thu, 12 Dec 2024 13:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734006446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHcwm2VnyijozizWEdk9YvkCDMsezL1mm+SRcqgwyTI=;
 b=AcEFiVzIZnhFKRflGmQpq2rJGJHR0Eq0tOC7A/hJLm5NzlfgZ+GWU3fKDeeZb6PiiyrpPz
 d0ihkVK5J5dTmgjB9hs3de4oaoxdXPC3JsRpEN8b/y7nXuXF/TsY1NaQ6W0piDY5M9y7NU
 3RwwSNFBruThL9kGDwk2ilUgBMBgvKG0vAaxWQaDqULlyS3N1C8qHMc0rjqTeVDWYBwuRU
 pc57uFR0FUqhy3w32hku2/4BlSbgCpwuVYTAg3yaJ3C31dZWczIPB32O1TMkIn9SWMbskP
 XBOLhyjIDxYTlfUb4C97W6GQpkXRUucdFnHO0M0jnAh63R4PnCDKwDsB4hpYKQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: simple: add Multi-Inno Technology
 MI1010Z1T-1CP11
Date: Thu, 12 Dec 2024 13:26:29 +0100
Message-ID: <20241212122701.25305-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212122701.25305-1-marex@denx.de>
References: <20241212122701.25305-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Add Multi-Inno Technology MI1010Z1T-1CP11 10.1" 1024x600 LVDS panel support.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d5bb850df9d20..d68662b7265ae 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3340,6 +3340,33 @@ static const struct panel_desc multi_inno_mi1010ait_1cp = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing multi_inno_mi1010z1t_1cp11_timing = {
+	.pixelclock = { 40800000, 51200000, 67200000 },
+	.hactive = { 1024, 1024, 1024 },
+	.hfront_porch = { 30, 110, 130 },
+	.hback_porch = { 30, 110, 130 },
+	.hsync_len = { 30, 100, 116 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 4, 13, 80 },
+	.vback_porch = { 4, 13, 80 },
+	.vsync_len = { 2, 9, 40 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc multi_inno_mi1010z1t_1cp11 = {
+	.timings = &multi_inno_mi1010z1t_1cp11_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 260,
+		.height = 162,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing nec_nl12880bc20_05_timing = {
 	.pixelclock = { 67000000, 71000000, 75000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -4944,6 +4971,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "multi-inno,mi1010ait-1cp",
 		.data = &multi_inno_mi1010ait_1cp,
+	}, {
+		.compatible = "multi-inno,mi1010z1t-1cp11",
+		.data = &multi_inno_mi1010z1t_1cp11,
 	}, {
 		.compatible = "nec,nl12880bc20-05",
 		.data = &nec_nl12880bc20_05,
-- 
2.45.2

