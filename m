Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17522DF52A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8100B6E16F;
	Sun, 20 Dec 2020 11:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A3F893A8
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 12:44:51 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id j22so7081528eja.13
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 04:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NkMmsvTcFvgCKGh0W4qI91nkVM/LPyxlJYr5p+foOoc=;
 b=XdHmS1KVx7mnaH5egFpezUrxOQUtD9wgaYneo4d/472nDXjDq88dsVPgxAsnC1Xxv+
 hI9xA2ZFKJZI02FmHoNOEMpyjSpGFdH1AtTqz0+QHon0rOzqAu33qjXLae9FqKA0oQ2D
 y04j0M4iRxyNhxOiO27eI4FbXkaIUdWGcakUum99lIwuoqC/29Sgq0FFhNMa4SUoSHY0
 FJTtea7vd3F5YBnpGfKdZtvT5KSC3DZpf8RFHP4pPdFmuMaN9q3g2foe7gQ+s9cof0DQ
 cogIMy+Wp7yXMPifPbvjYErq7ufYr0ZNEymt9tOHb0LYHrcyeeWIgNhBgUXGAumWzjjk
 0BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NkMmsvTcFvgCKGh0W4qI91nkVM/LPyxlJYr5p+foOoc=;
 b=JW86d6q2EWG5v37DbryBn+1xOF1lK3Oh7uL9bUdVS8nbtoXo5Cd077f4KnZ6OkNsPu
 s8nk/JOLI0VAF0w7VcYYWfxUEGAHJ4Ob5ZhY2F4jGDWdROj3C5uBpBR8Hotdkb7ZzuHw
 +6A+6fWS3Xq1XCt2UyaoB0kijWSyWaRhb1kn0Fhust9ou7v4oXQpu7cyhCRSEldZ+zPD
 +nC/9a/0+LdIryhDDqoQsAn/dr/3r6N249xE2OfBBNPTlzXCnfdsqMq391GNVM5i8bxl
 +sl4dOjDB4idzwS68gf/Lk7raJSoiAGNpZpHaz0tFd8xgARTgvCU9BotXf1IvtDzqEq/
 EFhA==
X-Gm-Message-State: AOAM530JnXOQWWZcoKm63jGMv2YAf7sYotWz7Ss8Tha0VYp4bkM4XiCA
 u9rqcu8uaPgDm0EDD2O37lk=
X-Google-Smtp-Source: ABdhPJwfs8eWqjjbyDLxo+NBP7Q7yexeknWwqJhrVwWI2Vj+bUabe8y4HZst6LMPV+DrX7JqSxp13g==
X-Received: by 2002:a17:906:d152:: with SMTP id
 br18mr4575862ejb.297.1608381890210; 
 Sat, 19 Dec 2020 04:44:50 -0800 (PST)
Received: from localhost (124-155-N1.p43.customer.vsm.sh. [91.106.155.124])
 by smtp.gmail.com with ESMTPSA id be6sm26278815edb.29.2020.12.19.04.44.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Dec 2020 04:44:49 -0800 (PST)
From: Oliver Graute <oliver.graute@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Date: Sat, 19 Dec 2020 13:44:12 +0100
Message-Id: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: David Airlie <airlied@linux.ie>, sam@ravnborg.org, m.felsch@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Oliver Graute <oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
to panel-simple.

The panel spec from Variscite can be found at:
https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf

Signed-off-by: Oliver Graute <oliver.graute@gmail.com>
---

panel-timing {
		clock-frequency = <35000000>;
		hactive = <800>;
		vactive = <480>;
		hback-porch = <39>;
		hfront-porch = <39>;
		vback-porch = <29>;
		vfront-porch = <13>;
		hsync-len = <48>;
		vsync-len = <3>;
		hsync-active = <0>;
		vsync-active = <0>;
		de-active = <1>;
		pixelclk-active = <0>;
	};

 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c1374be..c2f20ac 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3139,6 +3139,29 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing sgd_gktw70sdad1sd_timing = {
+	.pixelclock = {35000000, 35000000, 35000000},
+	.hactive = { 800, 800, 800},
+	.hfront_porch = {39, 39, 39},
+	.hback_porch = {39, 39, 39},
+	.hsync_len = {48, 48, 48},
+	.vactive = {480, 480, 480},
+	.vfront_porch = {13, 13, 13},
+	.vback_porch = {29, 29, 29},
+	.vsync_len = {3, 3, 3},
+};
+
+static const struct panel_desc sgd_gktw70sdad1sd = {
+	.timings = &sgd_gktw70sdad1sd_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 153,
+		.height = 86,
+	},
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
 	.clock = 168480,
 	.hdisplay = 1920,
@@ -3999,6 +4022,9 @@ static const struct of_device_id platform_of_match[] = {
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
