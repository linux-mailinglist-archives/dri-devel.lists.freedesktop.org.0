Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921553094CD
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7106ECA5;
	Sat, 30 Jan 2021 11:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E16F6EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 19:15:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id rv9so14542785ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 11:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cTTnr27KoTM28FV0WElzZDWAloMkTnxUWGWEMvKemNI=;
 b=ouQ+OYCAbmjkG53A7Kh9AhOxgW8pp1Iv/SjpwRKr7JmCh0A+0lDEOPbQFrdVqXpBTq
 5i2aI9UnG+DPOXfhCI/549NPsIooiCAtXcSl1eqcifWU4tVP0DIOwOUHLpi/g/JskLJb
 NY2c73SBJbKOpSmYE8uyb5adVwkhXZzIo3i27wREi/buvNY/3S/DzchR6TRPqyQ2mRyZ
 koQt8L6fkArnOurp4i+FhnW91CBXODvd4NdtUY2GlZKCSarMPEIo1JpZYOX9bzjRV2Vx
 2IOCj8lC1mMMiiQ5DJmflWgPAzVn3A/yNFhBFXxj/I5F8Yz6jKS0LbWaHyliMdqof2qo
 FZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cTTnr27KoTM28FV0WElzZDWAloMkTnxUWGWEMvKemNI=;
 b=mAE7OIjhNx0ldh5PewHO/9enCnE6kvOIRKGqu8jIjXJByEBjWsUkKjxywxzQUPyRf+
 OocSVux/FP0Gv9UGfiHRK5L4DbEJukbYDXbgwsX27eTBHJ55+Dyq5kRGcPzZqsd0oWUo
 fslNRzFLGR6Ik1GPov4giPtjTKumBTHEwugAyAyXZgf5m+iD86ipjelS8xgsXwRX48Gy
 g8CmZEp+Vcf9CO6G1HOF6wIobKIaSFA1oy2mLDtU9gQp9rs32ROP7MUDyljuv8Bho8Sw
 411Sp60piPxwJL4FDwBqn52DQgOPn5Xj43toPYuW8qEPDVNbWNqmcEjFSRoQrwwF5I/w
 QXEA==
X-Gm-Message-State: AOAM533m03u1n6xg8YLLGsbX8UdFt8dG2SS5KIzhrFEw2IBdU94s5gcG
 SfQtGzx0lk5FSWEvIMnhw0c=
X-Google-Smtp-Source: ABdhPJyFygyhSHIzBZV3gEcgJcHYnrJ2+Tij4oZM5edb+/sG2By82GcdMNxrbsd8BJGXHxK9uvyJtA==
X-Received: by 2002:a17:906:1741:: with SMTP id
 d1mr6278342eje.182.1611947712598; 
 Fri, 29 Jan 2021 11:15:12 -0800 (PST)
Received: from localhost
 (ipv6-4a6ad23dae79b927.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:4a6a:d23d:ae79:b927])
 by smtp.gmail.com with ESMTPSA id x16sm4273139ejc.22.2021.01.29.11.15.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 11:15:11 -0800 (PST)
From: Oliver Graute <oliver.graute@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2] drm/panel: simple: add SGD GKTW70SDAD1SD
Date: Fri, 29 Jan 2021 20:09:23 +0100
Message-Id: <1611947364-30688-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:31 +0000
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

v2:

- changed bpc to 6
- set max value of pixelclock
- increased hfront_porch and hback_porch
- dropped connector-type

adding of bus_format = MEDIA_BUS_FMT_RGB666_1X18 results in wrong colors.
omitting bus_format and using some default is good (Tux Pinguin is colored
fine)

 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2be358f..c129a8c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3336,6 +3336,28 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
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
+};
+
 static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
 	.clock = 168480,
 	.hdisplay = 1920,
@@ -4222,6 +4244,9 @@ static const struct of_device_id platform_of_match[] = {
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
