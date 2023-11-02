Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFE7DF9D1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 19:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F150510E978;
	Thu,  2 Nov 2023 18:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4405110E978
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 18:19:16 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SLsb46mJlz9sTD;
 Thu,  2 Nov 2023 19:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
 s=MBO0001; t=1698949152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ch1C2OE4GsP4VOw70dD+1FkWvZafdBex7mS93ycjgzU=;
 b=ihvgnDkn0XDjxG0hnycLz5zGhn1Vor7hxLPbhp0P/tyJv3SJTqGvv6/BRvgkfXlG4VqahG
 bMtvAZJ+NJjeKZU5qxFVV7USQhXHVJ282hhbQhlbjgDG5lOtp/JyQkrGVGUBzpOitbNRJy
 JnXX3s91pXiU4bZ9TMfwBLEOq8NqfsnGobMpWTCK9qdIMvT/13rUj2XF0jDQwal8FI83ET
 D2YnmyKRmglx1A3b/7ULBKxu9HuaVsf9XS3J9jAa5jKc3T45q+sdO6zgmSL2dlpTgXToKr
 pnpCmfRrj0CzP5Os8pZ5y+QAFyCs2M6ZSfWVJsmv2tKF4hSwK3Q45mgnk4/GOg==
From: Clayton Craft <clayton@craftyguy.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel-edp: Add timings for BOE NV133WUM-N63
Date: Thu,  2 Nov 2023 11:19:07 -0700
Message-Id: <20231102181907.10189-1-clayton@craftyguy.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4SLsb46mJlz9sTD
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

This panel is found on laptops e.g., variants of the Thinkpad X13s.
Configuration was collected from the panel's EDID.

Signed-off-by: Clayton Craft <clayton@craftyguy.net>
---

V2: renamed to "*_mode" since there is only 1 mode listed

 drivers/gpu/drm/panel/panel-edp.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 95c8472d878a..e2e4d88a5159 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1204,6 +1204,29 @@ static const struct panel_desc boe_nv133fhm_n61 = {
 	},
 };
 
+static const struct drm_display_mode boe_nv133wum_n63_mode = {
+	.clock = 157760,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 80,
+	.vdisplay = 1200,
+	.vsync_start = 1200 + 3,
+	.vsync_end = 1200 + 3 + 6,
+	.vtotal = 1200 + 3 + 6 + 31,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc boe_nv133wum_n63 = {
+	.modes = &boe_nv133wum_n63_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 286,
+		.height = 179,
+	},
+};
+
 static const struct drm_display_mode boe_nv140fhmn49_modes[] = {
 	{
 		.clock = 148500,
@@ -1723,6 +1746,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv133fhm-n62",
 		.data = &boe_nv133fhm_n61,
+	}, {
+		.compatible = "boe,nv133wum-n63",
+		.data = &boe_nv133wum_n63,
 	}, {
 		.compatible = "boe,nv140fhmn49",
 		.data = &boe_nv140fhmn49,
@@ -1852,6 +1878,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 
-- 
2.40.1

