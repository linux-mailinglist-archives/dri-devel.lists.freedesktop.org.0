Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DDB720E5F
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 09:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A197210E225;
	Sat,  3 Jun 2023 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2488510E646
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:21:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1a46ad09fso21268111fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685701301; x=1688293301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVzHDRPJNZ9IK1tuBeqT97BbWRZLa0+X8FPJl3jJUF8=;
 b=mMi7B8OLzoBy0XdAAy57UW6vUUYVs6mZUY0Eqj4wxd1azuZfGhxtdE7mSDOZMCdJVR
 IB2BbJdt79R6mNQXU43ev6H5pDzb6kBJbz06J8MyOaRw5PRn/2IQxDISZtggxt2HmCS0
 YnQ66M5U89s0AEJmmT1tOXh+wO2SEOodTG4jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701301; x=1688293301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVzHDRPJNZ9IK1tuBeqT97BbWRZLa0+X8FPJl3jJUF8=;
 b=CtX6EtVcuKuCZGw8XxGMyPm81qUJfXWviP4InWFsTmq/yPE1tammChtBNy+dA2scMg
 N7C5/rGDtVdyehjcIAWeETxOJ5/1CH9tSspPi96VT9oM1XDXXoYvuNlSMyA5nHl7rjwG
 V4PhEnnRAkHJCNTk0AwyDZq9bxszonvfvPGU78ScVHZjkDiQ07a6tNIku/zKgQljoiiI
 XzXLvLupXuEBbPetHsR/sXMqOz30xUEuxzEk4/+z7eWD6rEAw+Vhj6ui73OgYuJDZ2XN
 w0Z8igW9Y9RcOBY0mdnnE/eLEHJyejuHOKpWayWlv9yAx2Q0TlxYo3z4UMS8gbjW0hAg
 r35w==
X-Gm-Message-State: AC+VfDztXNHFr24QjUU6gy346QZuBgBI1AFFNCgH07XMdOlT04ol+aPi
 GLC6CZu/6tmKmFjWBlOR59XUDA==
X-Google-Smtp-Source: ACHHUZ6Ed45kcIADNWUp9NNVg26d/KpiaFAlx21eReeknhNRdp8zZ84PfjAecQZ4ZkYv7TO8lp7/GA==
X-Received: by 2002:a2e:8e89:0:b0:2ac:d51f:2d60 with SMTP id
 z9-20020a2e8e89000000b002acd51f2d60mr1241778ljk.33.1685701301140; 
 Fri, 02 Jun 2023 03:21:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 x24-20020aa7d398000000b0051499320435sm528887edq.14.2023.06.02.03.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:21:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] drm/panel: simple: add support for Rocktech RK043FN48H
 panel
Date: Fri,  2 Jun 2023 12:21:21 +0200
Message-Id: <20230602102123.3345587-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
References: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Jun 2023 07:02:50 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 kernel test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Rocktech RK043FN48H 4.3" (480x272) LCD-TFT panel.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306020343.jNTWeM0P-lkp@intel.com/

---

Changes in v2:
- Fix build warning reported by kernel test robot.
- Add 'Reported-by' tag of kernel test robot.

 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..3b10e78d07d9 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3188,6 +3188,32 @@ static const struct panel_desc qishenglong_gopher2b_lcd = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing rocktech_rk043fn48h_timing = {
+	.pixelclock = { 6000000, 9000000, 12000000 },
+	.hactive = { 480, 480, 480 },
+	.hback_porch = { 8, 43, 43 },
+	.hfront_porch = { 2, 8, 8 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 272, 272, 272 },
+	.vback_porch = { 2, 12, 12 },
+	.vfront_porch = { 1, 4, 4 },
+	.vsync_len = { 1, 10, 10 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc rocktech_rk043fn48h = {
+	.timings = &rocktech_rk043fn48h_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing rocktech_rk070er9427_timing = {
 	.pixelclock = { 26400000, 33300000, 46800000 },
 	.hactive = { 800, 800, 800 },
@@ -4218,6 +4244,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "qishenglong,gopher2b-lcd",
 		.data = &qishenglong_gopher2b_lcd,
+	}, {
+		.compatible = "rocktech,rk043fn48h",
+		.data = &rocktech_rk043fn48h,
 	}, {
 		.compatible = "rocktech,rk070er9427",
 		.data = &rocktech_rk070er9427,
-- 
2.32.0

