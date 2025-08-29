Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07454B3BE99
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 16:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA8B10EBF1;
	Fri, 29 Aug 2025 14:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="DQXq2/uj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2181D10EBF0;
 Fri, 29 Aug 2025 14:57:53 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id B5F29BDE9C;
 Fri, 29 Aug 2025 17:57:51 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 1B8C4BCF58;
 Fri, 29 Aug 2025 17:57:51 +0300 (EEST)
Received: from antheas-z13 (x5996a855.customers.hiper-net.dk [89.150.168.85])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 3F50F2067F3;
 Fri, 29 Aug 2025 17:57:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756479470;
 bh=6RKE2eX0bGesXYi+c9kmIa8eVlQw2K/rKlycX1Jf8cs=; h=From:To:Subject;
 b=DQXq2/ujGqWBGmQ+W0N46qaT72q3pW1kP53ZseX35g040qmLvhs2bws0nSDsRjk8x
 yRkiC4wnBY2javTB/TY2h2hbVXN45GtP6CNir7D6p+ZxcO/6OVKTh5eqLcxXF4IoZy
 WnR9Xz2eJ/HvhtE/54xRRrxcDngu6eFEXPWu1BBnbAT2uuaQ8a58ezuA/uu3Lk1jPd
 DhxVq20BMimvnjh6uAEHnNlE/OIt0NsxnIrEIdVxYLUAdizr5FeJ/Gf9nuGO1Ob8+O
 rhXq9v/+rGcezWxAhxurEsuC9UQqfPIgGh0rQDcgDm2m9CKyXu+gSYpMzCca6XWu1e
 ga8XlqzJIJzNg==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 89.150.168.85) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v3 6/6] drm: panel-backlight-quirks: Log applied panel
 brightness quirks
Date: Fri, 29 Aug 2025 16:55:41 +0200
Message-ID: <20250829145541.512671-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829145541.512671-1-lkml@antheas.dev>
References: <20250829145541.512671-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175647947078.278157.16049391296817176052@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

Currently, when a panel brightness quirk is applied, there is no log
indicating that a quirk was applied. Unwrap the drm device on its own
and use drm_info() to log when a quirk is applied.

Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 263f15f6fdea..2a3e17d83d6e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3617,13 +3617,15 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	struct drm_connector *conn_base;
 	struct amdgpu_device *adev;
 	struct drm_luminance_range_info *luminance_range;
+	struct drm_device *drm;
 
 	if (aconnector->bl_idx == -1 ||
 	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
 		return;
 
 	conn_base = &aconnector->base;
-	adev = drm_to_adev(conn_base->dev);
+	drm = conn_base->dev;
+	adev = drm_to_adev(drm);
 
 	caps = &adev->dm.backlight_caps[aconnector->bl_idx];
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
@@ -3659,12 +3661,20 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	panel_backlight_quirk =
 		drm_get_panel_backlight_quirk(aconnector->drm_edid);
 	if (!IS_ERR_OR_NULL(panel_backlight_quirk)) {
-		if (panel_backlight_quirk->min_brightness)
+		if (panel_backlight_quirk->min_brightness) {
+			drm_info(drm,
+				 "Applying panel backlight quirk, min_brightness: %d\n",
+				 panel_backlight_quirk->min_brightness);
 			caps->min_input_signal =
 				panel_backlight_quirk->min_brightness - 1;
-		if (panel_backlight_quirk->brightness_mask)
+		}
+		if (panel_backlight_quirk->brightness_mask) {
+			drm_info(drm,
+				 "Applying panel backlight quirk, brightness_mask: 0x%X\n",
+				 panel_backlight_quirk->brightness_mask);
 			caps->brightness_mask =
 				panel_backlight_quirk->brightness_mask;
+		}
 	}
 }
 
-- 
2.51.0


