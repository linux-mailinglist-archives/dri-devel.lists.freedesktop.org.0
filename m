Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E432F6D7
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0E46ECA0;
	Fri,  5 Mar 2021 23:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15177.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B9FF6EC9A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:51:42 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IK7Ql1dnx4WhhIK7cloTK5; Sat, 06 Mar 2021 00:44:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1614987881; bh=+zQpY2jhtXKwUUUGy/86UUMP9HX7UCOv+4QEftav0SI=;
 h=From:To:Subject:Date:MIME-Version;
 b=mMJMo+gL4/fpfTS12U+6OojswxCms39elle4XYtpyhnwhvlsOnckKOsmHiNSszwWJ
 a1MUX1twn/r6u7Mp7k5TVmRLA+EYBlA1vIX81hUmO1WQd6mNt+P4+iZeuV1znDz67m
 dHY4GlKIubAw1YCYHH+iN6Ue8WUeEe1rJ5DCLcshsnpRtH+FXWJpufTxWAuDLlu0LR
 ZJCCbYDkVopVVck+QOeEl9atrUl6l0GbPVeTiMgyAX/3aJlnrdYIEu66JrDZf30AXv
 eEFboGaKvG8eFNstC8sRrHMdyafRxCZnbpkXkTvOOgrqH+9YugaNWPawdHuVqo5GFA
 HeyjjmESmR/Mg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 6/9] drm/panel: simple: add Jenson JT60245-01
Date: Sat,  6 Mar 2021 00:44:23 +0100
Message-Id: <20210305234427.572114-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
References: <20210305225444.GA792026@robh.at.kernel.org>
 <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPCOCkPvOBOKGUMTsJlxEVnt32KKkdpuFxhtLqJJQP1o86V1u8551zZwk+M50sVVy+PaODpjzXL055h/ShNPQhnXbkJL0Ub5OJctqcWz7LslJa0fPlzh
 AfogSnnjKlFo2/wDUcSYd2PAokrMrvJzf3m8lJN+Ve3gFoI0xy6LToxMzShqN25tY2Al01a0kCmPoi+CUpXghC3Mqoia3vsOKYABX9NnYfJGGR6XW48EhPsQ
 sURGhFS+Z5wJLyoV2/gmaSF4vSac4iCmtkcjn8bBk9m0vX5a+9cFYmGI+SC2GJYOT/dOt7t+Fj5POW2IbdqDMePDKAG5LC3CBBnxzBCiBXq3tm4Occx51OZ9
 meHS0H7zYMfsHqZxo363UkSzWom9eFPKiOyMj1Vo+H/93nErFBmEVM3ZfTK73wJtN0z7ZG3Ab1Q5sR0EESz3S3G+4MV0SLrh1wk5hhgTVL28vkEfGV3euBGb
 mEaNHDHrXJjW/vqWoase7MbO1eNodvPVAZK2OPZ/VAVKlBnhxYEJ4V0ihEpp4jUKPvFPCCHK0cUoD4ad/sPw+aK51izsACFrH50Cn1XA+oCZMHu+Q+Aj+2KS
 1Zn3T4eIgPAB9AWYKXAxOBPtRTSgZNlX6e5v2cid7AXnACqdkIg/hywpN0N3fdDcSSYF7Bs8hqP5rM1QxCkQK+oLKt7VOj+N5coQFpDIHbaBq4440IzuKO84
 VPEClBNt1IoW9nr+yyt130vUS7NsSLxgEnE+ybLx1poTlns9vuItlQ==
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 allen <allen.chen@ite.com.tw>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

This patch adds support for Jenson JT60245-01 800x480 7" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..f63fa75ae4ef 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2532,6 +2532,30 @@ static const struct panel_desc ivo_m133nwf4_r0 = {
 	.connector_type = DRM_MODE_CONNECTOR_eDP,
 };
 
+static const struct drm_display_mode jenson_jt60245_01_mode = {
+	.clock = 35000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 20,
+	.htotal = 800 + 210 + 20 + 46,
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 10,
+	.vtotal = 480 + 22 + 10 + 23,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc jenson_jt60245_01 = {
+	.modes = &jenson_jt60245_01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+};
+
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -4301,6 +4325,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "ivo,m133nwf4-r0",
 		.data = &ivo_m133nwf4_r0,
+	}, {
+		.compatible = "jenson,jt60245-01",
+		.data = &jenson_jt60245_01,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
