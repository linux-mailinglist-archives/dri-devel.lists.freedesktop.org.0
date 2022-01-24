Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8A498566
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7233910E281;
	Mon, 24 Jan 2022 16:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE9010E281
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:55:39 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bb37so26425628oib.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
 b=AdjzeW2NDnDC0LsefwAyfMQPHKasi2WEsO/Fefl4/xmruL2S70ZVcO0ICKaF2j3ad5
 zxakJOxR/nCjqfVB5oN10DTfcc3h/Ti9kbJeMNW84IdozV05vwt7h48xPImgwrtbsmNq
 hofA3N783T12xmP8MKxUGCBYm9epa8YSRlI6pdQlrUtKkUkFS/w74Ft0X2D7nRE3B5Gf
 v54YRnWxCfejH7LMSiog3wRcWG20w83Q29e6bGub0+rtmkA/Hfu5EyNbLQ9gtOIKv1a+
 dnW5V7NCK+snzroEchC7oZKymciYuz0iaO7HfidWYnvYlOImtCt7bC3ZPzM9quIX2M0C
 RGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
 b=V5DDSYmUUobtq8H7YUbknre31knhXPYDDAJqfyQx5Mt+OknW+gAGxYNbqXwea1+PjJ
 a9Zs7X2YhZhaxfuNVOaxRFvGQzOeYF44jYBhb74ZM/hr1ctC/gNufjYe+K5PKPNSrbPU
 anIUIsINtDHSm1UAgfR7GkMiKIIosyM/hBMLwVuH/qmPe0cUspnPiY6kTo1CzQanmZaq
 nkKIxk5aPaN/Z0na5JUHeyOI9aZfC7wojoODATC+gbSJwTjFgTt3Q/w6X7C60A84V7i2
 kNa+v5CvHPYAqL937DiV2XyLnun+ljX441cJ2MOMfEJwazBfq+Ua7uBnb85H6VhoapEZ
 +iyQ==
X-Gm-Message-State: AOAM531PqkJQRR3aBzQgIu8zIE20R9LRB7JPRLvcG1HqbVKpsHkG5Ny1
 U6wQOvU/j+0/PMrtpY0osIAcciWkQJY=
X-Google-Smtp-Source: ABdhPJz3j3jrbbEsLcEQEhcnERE5c/L4/UpNrt93QVraysUjeWTOPquNrIwVpJofBqzw/3L+Yj9G9A==
X-Received: by 2002:aca:dac3:: with SMTP id r186mr2148216oig.163.1643043338580; 
 Mon, 24 Jan 2022 08:55:38 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6 v2] drm/panel: simple: add Geekworm MZP280 Panel
Date: Mon, 24 Jan 2022 10:55:25 -0600
Message-Id: <20220124165526.1104-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, Maxime Ripard <maxime@cerno.tech>,
 mchehab@kernel.org, sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Geekworm MZP280 Panel

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e3..cbc1a4fd1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1824,6 +1824,32 @@ static const struct panel_desc friendlyarm_hd702e = {
 	},
 };
 
+static const struct drm_display_mode geekworm_mzp280_mode = {
+	.clock = 32000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 41,
+	.hsync_end = 480 + 41 + 20,
+	.htotal = 480 + 41 + 20 + 60,
+	.vdisplay = 640,
+	.vsync_start = 640 + 5,
+	.vsync_end = 640 + 5 + 10,
+	.vtotal = 640 + 5 + 10 + 10,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc geekworm_mzp280 = {
+	.modes = &geekworm_mzp280_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 47,
+		.height = 61,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X24_CPADHI,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3790,6 +3816,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "friendlyarm,hd702e",
 		.data = &friendlyarm_hd702e,
+	}, {
+		.compatible = "geekworm,mzp280",
+		.data = &geekworm_mzp280,
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
-- 
2.25.1

