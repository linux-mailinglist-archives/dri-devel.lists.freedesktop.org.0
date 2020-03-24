Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A6192271
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96996E5B0;
	Wed, 25 Mar 2020 08:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 445 seconds by postgrey-1.36 at gabe;
 Tue, 24 Mar 2020 08:10:30 UTC
Received: from qq.com (smtpbg466.qq.com [59.36.132.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A486E443
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 08:10:29 +0000 (UTC)
X-QQ-mid: bizesmtp24t1585036920t3dbagbr
Received: from localhost.localdomain (unknown [210.242.163.205])
 by esmtp10.qq.com (ESMTP) with 
 id ; Tue, 24 Mar 2020 16:01:58 +0800 (CST)
X-QQ-SSF: 01400000002000I0R620000A0000000
X-QQ-FEAT: uufEM/F0s2N8uiGfkngO9Ju+r05DJfcH+j0Ht91WOul1J8IQwHbW5qfmUhK51
 a3Et8FJ6gcGmsL2u3/UMP0W6a/4EuejlYF1y4irMedAx7hmQF68OpCoAxAfdZ1xDMpfRpaL
 JkqfW3tajXiP4Y87MKPStfOFxHgxD/G/VSrllrXWsJfBUxWtsN3cdjeg5KF74eQq4trNUfc
 iDcBFsYmLObtmLxWUCrcHTV+7NARKV9e65muRePk26qkwF/0cAbZaFn38xLluryUEVP2g+a
 SuWG4u+X5kHSanVrHPUPTQfpPJSDtDAa1iQoWBX2PyYEzmxE8Ygbc0ms5A+Yqh66Kkb3/Zu
 bd8nTDD0s48EBTBkxDVcga0XOqJ+w==
X-QQ-GoodBg: 2
From: David Lu <david.lu@bitland.com.cn>
To: david.lu@bitland.com.cn
Subject: [PATCH] drm/panel: boe-tv101wum-n16: extend LCD support list
Date: Tue, 24 Mar 2020 15:57:34 +0800
Message-Id: <20200324075734.1802-1-david.lu@bitland.com.cn>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bitland.com.cn:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jungle.chiang@bitland.com.cn,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add entries for BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel.

Signed-off-by: David Lu <david.lu@bitland.com.cn>
Change-Id: I5b1cef259de5fb498220dcc47baa035083c41667
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 48a164257d18..f89861c8598a 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -696,6 +696,34 @@ static const struct panel_desc auo_b101uan08_3_desc = {
 	.init_cmds = auo_b101uan08_3_init_cmd,
 };
 
+static const struct drm_display_mode boe_tv105wum_nw0_default_mode = {
+	.clock = 159260,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 80,
+	.hsync_end = 1200 + 80 + 24,
+	.htotal = 1200 + 80 + 24 + 60,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 10,
+	.vsync_end = 1920 + 10 + 2,
+	.vtotal = 1920 + 10 + 2 + 14,
+	.vrefresh = 60,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc boe_tv105wum_nw0_desc = {
+	.modes = &boe_tv105wum_nw0_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 141,
+		.height_mm = 226,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = boe_init_cmd,
+};
+
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -834,6 +862,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "auo,b101uan08.3",
 	  .data = &auo_b101uan08_3_desc
 	},
+	{ .compatible = "boe,tv105wum-nw0",
+	  .data = &boe_tv105wum_nw0_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.24.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
