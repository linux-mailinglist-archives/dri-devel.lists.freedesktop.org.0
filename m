Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB93C3DB8
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 17:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5388899A7;
	Sun, 11 Jul 2021 15:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7CE899A7
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 15:49:58 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gb6so28337323ejc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eIvRill5LnmjWkouRCFhqrQjOtTIYxe1H69dV2Y1RJo=;
 b=nYR/kijdCRfoSH0anbcD7Ksf0sA/5Cru2dsChJu6Koh2lwuEzSDX5c2pqRoBlsQ8y4
 uCdaurizOuDYQzGN/kEDE35OwaP+teKRaX9JJzvj/M64WwoxCmRIBxtaiqe/PD0GcGwI
 lk7ESvwIr3mk8MNpoa0tZo9Lriu63q3dxCAY1X1E1csj/D4ZTsyiuyu2mTWzRXrKNSjn
 2K9qMiJxUp7PVZfAD+RICNaUuey2kL/OlQYeii3MV9F1TrS1ed3vxckETnK8CvAnVWJF
 HpwsRd0vL5Ex3M8eHc2qmg9C8u35Ichx1PtNsd1tS6dG7aeNUeLBQAVtjprX1kM5oIyn
 zhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eIvRill5LnmjWkouRCFhqrQjOtTIYxe1H69dV2Y1RJo=;
 b=X/Lks9Ei/iqzrWjWhgnq2c2mvci9AXjv2iKtqqjDczr0175VGQ3tHMyzM/cM+qL+5f
 SOKg9/bfreWI2+3s5kZsO7GzCBziysuVfxvZtVF5XGc2aLcwylpzCel5AYgYX2eVuT15
 9SWrvNeBQrn9AG5XYHAoHlffPYyYBLRKPJjYxcjmqGTVOHPuEgucWDfXpF8Zl9RYuUJM
 Mb6XioXx/gfZYChl6X3PZOQZpL4ptqmNeDM0KKJinIZ0w/qNOqwO+md7S28s659xcORf
 2GXoUhDDGA6J65g7Yv9d9miSG0pffbp+gQfgrgkizT7MsRfAu3HB6TbTlZArOfc7PscK
 8gkg==
X-Gm-Message-State: AOAM530KZs8N2jxbxvi8wy/PXrPpOc83RpBLoZQr1zkHKG116MgUfO8F
 vkvh3Kkawslx73IfIv4kdkbalJTuMR458Q==
X-Google-Smtp-Source: ABdhPJzemHfd+kKpEnJol0TcY0b6gw8pRCoDSLO+bRTi9CfgjKUrTviIdMyCDV6UnEKSj5rkca9dlQ==
X-Received: by 2002:a17:906:6acd:: with SMTP id
 q13mr41925654ejs.377.1626018596844; 
 Sun, 11 Jul 2021 08:49:56 -0700 (PDT)
Received: from localhost
 (ipv6-39dbcbd9b111821c.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:39db:cbd9:b111:821c])
 by smtp.gmail.com with ESMTPSA id n3sm2873293edd.53.2021.07.11.08.49.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Jul 2021 08:49:56 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
To: thierry.reding@gmail.com
Subject: [RESEND PATCH v4] drm/panel: simple: add SGD GKTW70SDAD1SD
Date: Sun, 11 Jul 2021 17:49:29 +0200
Message-Id: <1626018569-25963-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
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
 dri-devel@lists.freedesktop.org, oliver.graute@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
to panel-simple.

The panel spec from Variscite can be found at:
https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf

Signed-off-by: Oliver Graute <oliver.graute@gmail.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---

v4:

- added the datasheet labels
- added Reviewed-by

v3:

- added flags
- added delay

v2:

- changed bpc to 6
- set max value of pixelclock
- increased hfront_porch and hback_porch
- dropped connector-type

adding of bus_format = MEDIA_BUS_FMT_RGB666_1X18 results in wrong colors.
omitting bus_format and using some default is better (Tux Pinguin is colored
fine)

 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2be358f..c63f6a8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3336,6 +3336,36 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing sgd_gktw70sdad1sd_timing = {
+	.pixelclock = {30000000, 30000000, 40000000},
+	.hactive = { 800, 800, 800},
+	.hfront_porch = {40, 40, 40},
+	.hback_porch = {40, 40, 40},
+	.hsync_len = {48, 48, 48},
+	.vactive = {480, 480, 480},
+	.vfront_porch = {13, 13, 13},
+	.vback_porch = {29, 29, 29},
+	.vsync_len = {3, 3, 3},
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+			DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_NEGEDGE,
+};
+
+static const struct panel_desc sgd_gktw70sdad1sd = {
+	.timings = &sgd_gktw70sdad1sd_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 153,
+		.height = 86,
+	},
+	.delay = {
+		.prepare = 20 + 20 + 10 + 10, /* T0 + T2 + T3 + T4 */
+		.enable = 50, /* T5 */
+		.disable = 50, /* T5 */
+		.unprepare =  10 + 10 + 20 + 20, /* T4 + T3 + T2 + T0 */
+	},
+};
+
 static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
 	.clock = 168480,
 	.hdisplay = 1920,
@@ -4222,6 +4252,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "satoz,sat050at40h12r2",
 		.data = &satoz_sat050at40h12r2,
 	}, {
+		.compatible = "sgd,gktw70sdad1sd",
+		.data = &sgd_gktw70sdad1sd,
+	}, {
 		.compatible = "sharp,ld-d5116z01b",
 		.data = &sharp_ld_d5116z01b,
 	}, {
-- 
2.7.4

