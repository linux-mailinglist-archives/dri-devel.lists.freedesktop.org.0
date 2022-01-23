Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EDD49725F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 16:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA98210FC7A;
	Sun, 23 Jan 2022 15:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C96310FC79
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 15:19:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so26104806wme.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 07:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=J2UMRvQ9bGDS8m5A2ZaIoatGYf156drXrvbt1E7Y0kM=;
 b=BaPYk3cz5CSp2mXj1dJCLXNrD6ld9SN7PqmiTBuGMhO9jXDLpH0u69DELDSOt4g8tf
 O8Iw/+xk0uV3mc6OMzhxWiCh6GpBtCwZjML8p/y0ljPseJ+cGIaWo33pZiBaLgWXcf7U
 vUswCWNO4u1Dz9RGUwwMzwHpOs3Gwx7YyALZW6wv4YECZ8FzDiZO94QtdvlEYIiE7tfy
 /7hETXh33/UPSrsSt2Ndc2T2fe7iaqo9eo/vjc3UJFrSirKb+Z49xToVdaSx9uUBBpg3
 jHWEJd1FgyQ/8no4eRj3p25be/0ZR3bWU7pKD5altXc0pfG4ZhJKEAXZu9+3ux+H4Ygg
 OPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=J2UMRvQ9bGDS8m5A2ZaIoatGYf156drXrvbt1E7Y0kM=;
 b=xoJNeqvQDOnfRWCMzEezxWoEYUvphhg4JRLlrzZPy2cez3Z9RIeLC25HZFbstjm1fY
 k1X99SCXwtps9qW9S7lleVwecX2Ojo+EtvWEdY+hfvoZXdgrj4Vo7Wq/JqHTWFnG9giD
 Z+ePtO3cPhfFQwurtFzXzm2cUUJA1FNXO/jC6Wk41Idx57ZfpQmL7US/Mgy2SP/o+bke
 TroRCHVmSAxnFxNmYtUX3/+5ou2ancSgENchKIbxDPlOa/dU2pMs2XNB2OoGJq7ARmTK
 Lp06EWG18lkFHwJpepOwiguIL51KcPlghQKOu/JnKVx+pZUqSYy8XXCRtwMVO02bL/gU
 KmYA==
X-Gm-Message-State: AOAM533ARHijUZIMUVihDpaTcD0vvq9VNdB2/HRsJ595NvmBFTLUp+3q
 Y5OCZ3puYl5UhXByu07/kr0=
X-Google-Smtp-Source: ABdhPJyU0Jp2swuxRWeSvuDxkqQvGu61dkGQnafoc7QwAtcUBENwbgpkm1TfePlYVFXx1sgL3WOwow==
X-Received: by 2002:a7b:c0d4:: with SMTP id s20mr8388585wmh.113.1642951144349; 
 Sun, 23 Jan 2022 07:19:04 -0800 (PST)
Received: from localhost
 (ipv6-54ac198c2dcfb6fe.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:54ac:198c:2dcf:b6fe])
 by smtp.gmail.com with ESMTPSA id a24sm9917299wmm.31.2022.01.23.07.19.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 Jan 2022 07:19:03 -0800 (PST)
From: Oliver Graute <oliver.graute@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5] drm/panel: simple: add SGD GKTW70SDAD1SD
Date: Sun, 23 Jan 2022 16:18:31 +0100
Message-Id: <20220123151833.19293-1-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Oliver Graute <oliver.graute@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

v5:
- rebased

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

 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index eb475a3a774b..0fd88c3f752c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3065,6 +3065,36 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
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
 static const struct drm_display_mode sharp_lq070y3dg3b_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -3857,6 +3887,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "satoz,sat050at40h12r2",
 		.data = &satoz_sat050at40h12r2,
+	}, {
+		.compatible = "sgd,gktw70sdad1sd",
+		.data = &sgd_gktw70sdad1sd,
 	}, {
 		.compatible = "sharp,lq035q7db03",
 		.data = &sharp_lq035q7db03,
-- 
2.17.1

