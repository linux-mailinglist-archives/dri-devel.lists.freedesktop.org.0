Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96AD30D4D2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417646E9EB;
	Wed,  3 Feb 2021 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CEB6E1EC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 17:35:50 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id p20so11904178ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 09:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mX9ypY+omwlKGZ2kXIDWnnuce1UHcRhtfE/HnoiDjQE=;
 b=u4vBN3nj0jYBDFgioAFwhhfQeq2M9O0v2vttHGfK/tH3lAYdkKXKqvOHhphpgFs2XW
 APmvMAHZAxj8iqB7++LPYQoNOQekVcdGN+yrTU31FwGwwf5JndF016URWoX7Gz5fB/sg
 CGsx/9BTg8agG5Np6EMW4lHrkHfk8o7UEmpO/xJQq0ACG8lF+MxG9c0Hez+ciAmX4WgB
 9UcMo3/80r/yOCijrUk/Qo+II3PxgtUyeTgHjMhfT7TUx0rB8fmv4fpPuRB099VjZU79
 hA7xntZTIO7kpFNU/+n8PfZj3zTnbcFao5JnHNAexv3A2Eu2dEQdqOb4hCgDOTjb51/z
 Uq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mX9ypY+omwlKGZ2kXIDWnnuce1UHcRhtfE/HnoiDjQE=;
 b=MvSTjMgesfznPHHH0DKcSPh0ePC2H+Go1Jv1LKe1BYpRGc4O0HF0ZzGGTORmOGzzwa
 vAIBM75uEy0VedrEAq2l9TSixhSisMVgsDEVBiwJ9Bxo/YspzXJO/ru2vqGsg+7vxhmU
 fd+i89za11y2xKyo+Ttv0X3t4lGHc69m6LVQwQqpqcFiKI89/Ufv8jCJzGjRwdTZoEez
 7HvVrmonDbqjiNhHvtu72SUCu6yZeqF2tq2pxTYPhxpE0885BhLmNZxd1mR2xzBjiTIx
 Y1QVYnyg4dDuVlbxku5xZTtnXLwYTmTsWXc42GRxR+1iOzmybm32XtD3zEyLK/MVs0EX
 KEBQ==
X-Gm-Message-State: AOAM530QUDpBVpMTicnnuzEdGJtfVu9F//QHGYENy97YSufcpMVQvFMG
 3YJHrixTjhc06HU9f2SyAJ8=
X-Google-Smtp-Source: ABdhPJxMJuJ9mxj/PxCc9WurBPmTp5rXdXihx94U7jV0P9z23NVV02prdxOwEvGzhTcOY2bPtmCqgg==
X-Received: by 2002:a17:906:5846:: with SMTP id
 h6mr23072480ejs.521.1612287348469; 
 Tue, 02 Feb 2021 09:35:48 -0800 (PST)
Received: from localhost
 (ipv6-95d4aa31e260cdb5.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:95d4:aa31:e260:cdb5])
 by smtp.gmail.com with ESMTPSA id o4sm10375211edw.78.2021.02.02.09.35.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 09:35:47 -0800 (PST)
From: Oliver Graute <oliver.graute@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v3] drm/panel: simple: add SGD GKTW70SDAD1SD
Date: Tue,  2 Feb 2021 18:35:13 +0100
Message-Id: <1612287314-5384-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, oliver.graute@gmail.com
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
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
---

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
+		.prepare = 20 + 20 + 10 + 10,
+		.enable = 50,
+		.disable = 50,
+		.unprepare =  10 + 10 + 20 + 20,
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
