Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E869A9FC78
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 23:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA37510E2AA;
	Mon, 28 Apr 2025 21:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventureresearch.com header.i=@ventureresearch.com header.b="d7CWexwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com
 [67.231.154.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CE310EA62
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 21:07:47 +0000 (UTC)
Received: from engine.ppe-hosted.com (unknown [10.110.49.207])
 by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id
 E512660120; Mon, 28 Apr 2025 21:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ventureresearch.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:message-id:message-id:mime-version:mime-version:subject:subject:to:to;
 s=selector-1717781956; bh=rmHbe1rt5BgZPp9mZinZNbVB03QooxBNv/WYL5AAkBI=;
 b=d7CWexwvBHWFPi6whiyB+3nyzRRcqk+XEwR95lS57pbD0FrxQeUtSnVxabNB6m7DgYQyV74gXlxcucZ9HZBbjbKMD+uezmWsWTnipbzhOIdlpCRqgQiH//dSGQ3cO1G+s94AJJu4+hkO1ppQ/RiXjXcjCCPs0UY42MlzBe8zR2dKxAIiLx1xR/5l+NXzVZaUL66A/Kn5+Px0v036eTe14Ij/7JYnU+3o+4WD+5m1g7Kob2AAJ3DsjKYswbQsZ5WCqr/ajXnr7slYrPRNAPKUcIi9i2Jw1yj0LlzA1zIQhAZQGUnQUkI9advrdKKOeWFZ/f9qS1uXlzFjDlM6yN0POQ==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from Mail2019.crm.ventureresearch.com (unknown [67.210.242.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 37DCC24006A;
 Mon, 28 Apr 2025 21:07:45 +0000 (UTC)
Received: from build01-deb.crm.ventureresearch.com (2605:ed00:15b3:1::5:1) by
 mail.ventureresearch.com (2605:ae00:1849:1:733d:6d07:c0da:2dc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Apr
 2025 16:07:44 -0500
From: Kevin Baker <kevinb@ventureresearch.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Kevin
 Baker <kevinb@ventureresearch.com>
Subject: [PATCH] drm/panel: simple: Update timings for AUO G101EVN010
Date: Mon, 28 Apr 2025 16:07:26 -0500
Message-ID: <20250428210726.3395279-1-kevinb@ventureresearch.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MDID: 1745874466-yh445e51p1Fp
X-PPE-STACK: {"stack":"us1"}
X-MDID-O: us1; at1; 1745874466; yh445e51p1Fp; <kevinb@ventureresearch.com>;
 5e6c6d0f4ea4dbaad6972e39b9ca5131
X-PPE-TRUSTED: V=1;DIR=OUT;
X-Mailman-Approved-At: Mon, 28 Apr 2025 21:45:29 +0000
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

Switch to panel timings based on datasheet for the AUO G101EVN01.0
LVDS panel. Default timings were tested on the panel.

Previous mode-based timings resulted in horizontal display shift.

Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index fb8a57afe687..1a3d7ccb328a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -979,27 +979,28 @@ static const struct panel_desc auo_g070vvn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_g101evn010_mode = {
-	.clock = 68930,
-	.hdisplay = 1280,
-	.hsync_start = 1280 + 82,
-	.hsync_end = 1280 + 82 + 2,
-	.htotal = 1280 + 82 + 2 + 84,
-	.vdisplay = 800,
-	.vsync_start = 800 + 8,
-	.vsync_end = 800 + 8 + 2,
-	.vtotal = 800 + 8 + 2 + 6,
+static const struct display_timing auo_g101evn010_timing = {
+	.pixelclock = { 64000000, 68930000, 85000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 8, 64, 256 },
+	.hback_porch = { 8, 64, 256 },
+	.hsync_len = { 40, 168, 767 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 4, 8, 100 },
+	.vback_porch = { 4, 8, 100 },
+	.vsync_len = { 8, 16, 223 },
 };
 
 static const struct panel_desc auo_g101evn010 = {
-	.modes = &auo_g101evn010_mode,
-	.num_modes = 1,
+	.timings = &auo_g101evn010_timing,
+	.num_timings = 1,
 	.bpc = 6,
 	.size = {
 		.width = 216,
 		.height = 135,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.39.5

