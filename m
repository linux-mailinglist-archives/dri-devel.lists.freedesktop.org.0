Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E7E1CE875
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43B36E7F5;
	Mon, 11 May 2020 22:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458676E57E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:30:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h4so11039654ljg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMcSpmyJogcC7tt9AqfcbnUHz0gSoRGdcJ6Tsc1nWY8=;
 b=lUV5dM4xO5aHkSvoUegV0fg8A42XIs/aUFa36FgskQOfmkHnKOstUafdAmdz6yfddF
 M6uGip4WOd52dX6h0LA6Ez7ZCUyZbmuVOGaHTCptvn0JDJ+tWvttlezwFHztzhSViULc
 8r4McciExQxyoMjB1Wt9CXKdA7eMuI0lwvHJZBI7xDrzN8ZTqpP3OJ0PjetCSV1gDyKQ
 254JfXlNMuTHSiRMyV5T3Q+D1JZaED6f8DzZqkyoZ7liR5W7P7o/yB9ozVqq2AP2wGEr
 KpvUEStg14yWo6vmto7yuYoLUgICwLPDXiNDxrcp/fWpy0vIKgk7rRwhBFpwDl3+CVIV
 oFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMcSpmyJogcC7tt9AqfcbnUHz0gSoRGdcJ6Tsc1nWY8=;
 b=s1wECIF9trVSSbH3wRUhpx3JIgGlqowzgpIC0KARsxq9fdIo2XMhWkN9SuNiYKlqQg
 JhnB3gtvia1j2OMfxU4R+n8u4qI08sgzCAFejBvzPbp/6Sr4CDHmX4q43HpTMNGSq17R
 C+hCmxQWKpKHOeEBN15Pk/v2lMRLPODCfsMDjaYkYxq/7IwTU+dpdZ0KdF9acHAYLkPj
 dYHtoC5bvHaqHPjXrqAWArH+uAhEVdWh9nVFH5P/rUbh5OZ1SavC50VoxapPgKUz69Ww
 lqz9Y5+FSgaKyF+15Bxsy4fOB//vGOV6BZ1ig7Pg7I+2QaraOmzbiOul4Smu2GVldH/y
 dkaQ==
X-Gm-Message-State: AOAM530gNZCOLmToYwDIq34n+xf7RYdx8O9lzvkvBCf7SKyAyJpBuL44
 kv5uSoGlcXrlz3jPI8fgN+KHaLqa1vA=
X-Google-Smtp-Source: ABdhPJwrjmWP1xJQrFy1Tj8DOMZ/l+msV1x1rLca+zW+YrQXSkVYTLrQrEwtXKVuNAaL3ED1Sj0NJw==
X-Received: by 2002:a2e:3508:: with SMTP id z8mr10335024ljz.32.1589229003609; 
 Mon, 11 May 2020 13:30:03 -0700 (PDT)
Received: from arrvl-mmelnikov (chargesoft-1.cust.smartspb.net.
 [80.249.187.146])
 by smtp.gmail.com with ESMTPSA id s27sm10803429ljo.80.2020.05.11.13.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 13:30:03 -0700 (PDT)
From: Maksim Melnikov <approximatenumber@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/panel-simple: add support for NEC NL10276BC13-01C
 panel
Date: Mon, 11 May 2020 23:29:24 +0300
Message-Id: <842736c513b948ee00fdcbe30df3a5a6d0eed9f0.1589226066.git.approximatenumber@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1589226066.git.approximatenumber@gmail.com>
References: <cover.1589226066.git.approximatenumber@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: Maksim Melnikov <approximatenumber@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NL10276BC13-01C is a 6.5" 1024x768 XGA TFT LCD panel with LVDS interface. It is used for industrial purposes in devices such as HMI.

Signed-off-by: Maksim Melnikov <approximatenumber@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ad828eae..7ded13157 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2372,6 +2372,31 @@ static const struct panel_desc nec_nl4827hc19_05b = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
+static const struct display_timing nec_nl10276bc13_01c_timing = {
+	.pixelclock = { 62600000, 68200000, 78100000 },
+	.hactive = { 1024, 1024, 1024 },
+	.hfront_porch = { 15, 64, 159 },
+	.hback_porch = { 5, 5, 5 },
+	.hsync_len = { 1, 1, 256 },
+	.vactive = { 768, 768, 768 },
+	.vfront_porch = { 3, 40, 99 },
+	.vback_porch = { 2, 2, 2 },
+	.vsync_len = { 1, 1, 128 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc nec_nl10276bc13_01c = {
+	.timings = &nec_nl10276bc13_01c_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 132,
+		.height = 99,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode netron_dy_e231732_mode = {
 	.clock = 66000,
 	.hdisplay = 1024,
@@ -3634,6 +3659,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "nec,nl4827hc19-05b",
 		.data = &nec_nl4827hc19_05b,
+	}, {
+		.compatible = "nec,nl10276bc13_01c",
+		.data = &nec_nl10276bc13_01c,
 	}, {
 		.compatible = "netron-dy,e231732",
 		.data = &netron_dy_e231732,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
