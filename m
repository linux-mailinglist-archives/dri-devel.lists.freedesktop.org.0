Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA97DA67B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 12:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A50210E07C;
	Sat, 28 Oct 2023 10:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Sat, 28 Oct 2023 01:57:52 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D19310E146
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 01:57:52 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SHMvr2vjrz9spp;
 Sat, 28 Oct 2023 03:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
 s=MBO0001; t=1698457896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zen0zpTwtmKj4wYW0OPqGBxlljrKRwLGQbr8Akwjp6Y=;
 b=gddzIKGgSWFu3Fv84zJT2vM0xJVxkWm6n8QJ0ZwU68BLRt4EyCI577Rz6UxLT1eqCXhwh9
 X2+yFFhldP8Ks2WxALIz6J1o5u6+GocOtZI+vDvBzi2IYvMUpqID4gZdNZXYOohXngJnT3
 8DKmXkaabTpG+I+TbW2RhtuW2DCxgb01Sl8PUC0ryAeNnwDsEXSXURQCfKuP3xaj2FRrJu
 0Ks6RBt1JXisUhVu5XO6wtagmkPco/N7BL+clEMkS4v8sAycGfjL+rKEEyj2cCPxGYgyFY
 HoGYiv7E4pXzgPgPoTRsjd8GIJ1t+936tby63x3mFgDsfMY2tb5NI7VJNZBMAw==
From: Clayton Craft <clayton@craftyguy.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-edp: Add timings for BOE NV133WUM-N63
Date: Fri, 27 Oct 2023 18:51:31 -0700
Message-Id: <20231028015131.20633-1-clayton@craftyguy.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4SHMvr2vjrz9spp
X-Mailman-Approved-At: Sat, 28 Oct 2023 10:37:10 +0000
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
Cc: clayton@craftyguy.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is found on laptops e.g., variants of the Thinkpad X13s.
Configuration was collected from the panel's EDID.

Signed-off-by: Clayton Craft <clayton@craftyguy.net>
---
 drivers/gpu/drm/panel/panel-edp.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 95c8472d878a..5db283f014f3 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1204,6 +1204,29 @@ static const struct panel_desc boe_nv133fhm_n61 = {
 	},
 };
 
+static const struct drm_display_mode boe_nv133wum_n63_modes = {
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
+	.modes = &boe_nv133wum_n63_modes,
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

