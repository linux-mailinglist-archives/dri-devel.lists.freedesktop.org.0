Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4EF1EA027
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A261C89E3E;
	Mon,  1 Jun 2020 08:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B3489E3B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:33:20 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 82so3455397lfh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TwIdJUbQRxeqgtfvfIoF0Z04UMl01JB2vKoyScmExkg=;
 b=cWvgi00RcFiHrv8DMigp7mhttjy/GxX1b+1+aUakQwMf0Gj0QkzZHpTXM6xL7Ya/NO
 p1Lk8Jn+tayq731Hx/VVy48CozlRtRpPToJHNmmxY6yD5QxaNR62nrubajaORG7a9bK/
 TtpCQUJhiAFbmC97Pc/q1yVyCf4FOioozKy8hoCrLURJ2/qz2OfWtufoZ0tEPNGEQI0p
 ayV6wHLzNY3QLtBHC4b5vxlpX9IvEwu/a9fMDsgCAuJ3vI58HJ2AQo5iPwddcOW88QRh
 ln9Na41BlaQJegNLkKXLJwK0gN4CoC0eWPP1fBptj4w1tmuBDN3102mDyos7OMtZm//r
 Elfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TwIdJUbQRxeqgtfvfIoF0Z04UMl01JB2vKoyScmExkg=;
 b=R8mtaUMuq7cweOUPcdrOmFBTjwWpLd/KC6/xEN49rfjkJ5XWTd9iC1BP9W54Vv0REQ
 2bqznwRU1uPczbiY8u9RCLOJB5MhWU+8CjVLQq7B2H0Fj1pR73aFbqYLH+m48VTQ3PvL
 oLEQDuzqDC7G2zM1xqEozX0ziZ8LPQe+5Ne8rMcIjYjDz8bxs7bbwEZ3MBRi3nMAs14t
 T/JbtHzu93j8PNSYNVBY18E/3l8WN2gAK7a3SGIWyLtnpQ1rRa2SGGF+q3beVWUgZYY5
 k2o9l6vqfri7JSRAJnziLfeUyuerKgmlc00ZbeaSe4282Wh24yGee+r0q52cWE7vqo9r
 HGsw==
X-Gm-Message-State: AOAM530xkd32c2Yv7+DdLMv+bMpKrCXNWzOysnFXsgBbnwowXH2UauC7
 fcyTbp62DaHRQhK9mlztXuwTudC1sh4=
X-Google-Smtp-Source: ABdhPJw1TnIeYLkuBYxj66EjSh8MTVLLPvYHyksj6de8G3CqLKAXHsCGGH66LzgSdD1ort9SjcODWQ==
X-Received: by 2002:a05:6512:3214:: with SMTP id
 d20mr10856801lfe.203.1591000398752; 
 Mon, 01 Jun 2020 01:33:18 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:33:18 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 4/6] drm: panel-simple: add Hitachi 3.5" QVGA panel
Date: Mon,  1 Jun 2020 10:33:07 +0200
Message-Id: <20200601083309.712606-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is used on evaluation boards for Atmel at91sam9261 and
at91sam6263.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8624bb80108c..25c96639631f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1813,6 +1813,32 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode hitachi_tx09d71vm1cca_mode = {
+	.clock = 4965000,
+	.hdisplay = 240,
+	.hsync_start = 240 + 0,
+	.hsync_end = 240 + 0 + 5,
+	.htotal = 240 + 0 + 5 + 1,
+	.vdisplay = 320,
+	.vsync_start = 320 + 0,
+	.vsync_end = 320 + 0 + 1,
+	.vtotal = 320 + 0 + 1 + 1,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc hitachi_tx09d71vm1cca = {
+	.modes = &hitachi_tx09d71vm1cca_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 54,
+		.height = 72,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -3737,6 +3763,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "hannstar,hsd100pxn1",
 		.data = &hannstar_hsd100pxn1,
+	}, {
+		.compatible = "hit,tx09d71vm1cca",
+		.data = &hitachi_tx09d71vm1cca,
 	}, {
 		.compatible = "hit,tx23d38vm0caa",
 		.data = &hitachi_tx23d38vm0caa
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
