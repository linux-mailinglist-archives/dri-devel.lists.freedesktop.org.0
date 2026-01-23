Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBtKD4bKc2mQygAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:22:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68877A1E5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EAE10EBBA;
	Fri, 23 Jan 2026 19:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E87F10EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:22:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 519D81476;
 Fri, 23 Jan 2026 11:22:36 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D8583F632;
 Fri, 23 Jan 2026 11:22:41 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] drm/panel-edp: Move FriendlyELEC HD702E
Date: Fri, 23 Jan 2026 19:22:21 +0000
Message-Id: <a00a59dcef3693efb02a8ee942848fbeaeaf05ba.1769191673.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,lists.infradead.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[sntech.de,linaro.org,chromium.org,gmail.com,ravnborg.org];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_SPAM(0.00)[0.058];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: B68877A1E5
X-Rspamd-Action: no action

FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
to the eDP driver, also resolving the warning about the missing bpc
value in the process.

The unfortunate combination of HPD not being wired up and the RK3399 eDP
controller's behaviour seems to result in the EDID not being readable
over DP-AUX without probing the panel first, thus the hard-coded mode is
still needed to get things going.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
v2: Clarify issue with the generic binding
---
 drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..dd53ccc209ce 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1256,6 +1256,29 @@ static const struct panel_desc boe_nv140fhmn49 = {
 	},
 };
 
+static const struct drm_display_mode friendlyarm_hd702e_mode = {
+	.clock		= 67185,
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 20,
+	.hsync_end	= 800 + 20 + 24,
+	.htotal		= 800 + 20 + 24 + 20,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 4,
+	.vsync_end	= 1280 + 4 + 8,
+	.vtotal		= 1280 + 4 + 8 + 4,
+	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc friendlyarm_hd702e = {
+	.modes = &friendlyarm_hd702e_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width	= 94,
+		.height	= 151,
+	},
+};
+
 static const struct drm_display_mode innolux_n116bca_ea1_mode = {
 	.clock = 76420,
 	.hdisplay = 1366,
@@ -1663,6 +1686,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv140fhmn49",
 		.data = &boe_nv140fhmn49,
+	}, {
+		.compatible = "friendlyarm,hd702e",
+		.data = &friendlyarm_hd702e,
 	}, {
 		.compatible = "innolux,n116bca-ea1",
 		.data = &innolux_n116bca_ea1,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b26b682826bc..3ea52667b858 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2359,28 +2359,6 @@ static const struct panel_desc frida_frd350h54004 = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
-static const struct drm_display_mode friendlyarm_hd702e_mode = {
-	.clock		= 67185,
-	.hdisplay	= 800,
-	.hsync_start	= 800 + 20,
-	.hsync_end	= 800 + 20 + 24,
-	.htotal		= 800 + 20 + 24 + 20,
-	.vdisplay	= 1280,
-	.vsync_start	= 1280 + 4,
-	.vsync_end	= 1280 + 4 + 8,
-	.vtotal		= 1280 + 4 + 8 + 4,
-	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc friendlyarm_hd702e = {
-	.modes = &friendlyarm_hd702e_mode,
-	.num_modes = 1,
-	.size = {
-		.width	= 94,
-		.height	= 151,
-	},
-};
-
 static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -5235,9 +5213,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "frida,frd350h54004",
 		.data = &frida_frd350h54004,
-	}, {
-		.compatible = "friendlyarm,hd702e",
-		.data = &friendlyarm_hd702e,
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
-- 
2.34.1

