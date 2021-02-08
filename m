Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D32313BB4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C9C6E981;
	Mon,  8 Feb 2021 17:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2176E981
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 17:56:13 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id i8so26337597ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eIvRill5LnmjWkouRCFhqrQjOtTIYxe1H69dV2Y1RJo=;
 b=Z+8ub28Zc877Pt3iUCoMvDNPaJsrXh10MSL/Htr5fZnmT9sDqNYGWIA92NYP8wUkwG
 6sUQ5mjKsmbtW3q1hgNLs4kkdiatEzj3ViGcu+C66NedPgM3ZHzLFTsR7m/JzicFZfZr
 ZfTaxMCILPGJT0TfA1QnKj1piYN02qr78DMVTKVx3+vw9tNR3nHPXIDGZjO/riotJPGA
 0Dp0RiNeBw0VxvgEOgdDU8IVFlhmAGjh+B83Lsnxw+dxPaou8sqYsf7fTHIyc2OeNf0V
 ProGLWe3MaVH8aj/VrocXxi/I2X99APsROzCEMHbzkv3u+KB3aUT/JoaZgiGkUov+NRJ
 vvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eIvRill5LnmjWkouRCFhqrQjOtTIYxe1H69dV2Y1RJo=;
 b=gPq2xORXWlQYbbHf+bQooqRYahYl+nvhLGoiQpdVrqHDRYGnEDzUh/wsY876hA5NkD
 CvCcfSYpMEnNenN7pT5gojuLMea2zyamyaa8j4egv9CkR+CQ3QdOTLUCX+mYxryVGGgF
 GKL5/mlsoMqNNiOC5DtF+rdziVK9IbUj0x+A2OozRd1c6JGwQOkE+SsG+MdkTvf7omSm
 uQ1y0Mk0WstifgltELLxuiwqm8w7ziC4L2D4To1uTxY5NeBYwYykly/nWTSzf2DYysP0
 PQU0fSFe9pLbjxMydahGIstwelIdHOSdAGpKlBGFkeyTokqVSC1vOumItQrAYV/D2wac
 8X/g==
X-Gm-Message-State: AOAM5306nT0p4dnP6wn1VbK+3YVz3+Xbpe/Rt3QLf8OOOBWUH9TyxUuI
 jW1N8EriEvnn6OCSNFccTxk=
X-Google-Smtp-Source: ABdhPJxVjghMsHAgz3SHuB2JxQEmEp2rDupvZv4O3wJGYmCO9N3ol3mc8yYNf4U9NkufmFR9PuJ7qA==
X-Received: by 2002:a17:907:770d:: with SMTP id
 kw13mr10452650ejc.219.1612806971864; 
 Mon, 08 Feb 2021 09:56:11 -0800 (PST)
Received: from localhost
 (ipv6-8b5f7baafbe9cd6e.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:8b5f:7baa:fbe9:cd6e])
 by smtp.gmail.com with ESMTPSA id p15sm9020856eja.61.2021.02.08.09.56.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:56:10 -0800 (PST)
From: Oliver Graute <oliver.graute@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v4] drm/panel: simple: add SGD GKTW70SDAD1SD
Date: Mon,  8 Feb 2021 18:53:04 +0100
Message-Id: <1612806785-12464-1-git-send-email-oliver.graute@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 m.felsch@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Oliver Graute <oliver.graute@gmail.com>
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
