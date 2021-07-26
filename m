Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08E3D65D8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE216E8CC;
	Mon, 26 Jul 2021 17:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82C06E85C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 17:34:50 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so6031786ota.11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vcmdJW0PQwHX3N7q/LEirUpgpEmrk9ZWnfdjvnD6Jk=;
 b=nLHtI5JJvX9xtd7elYmv5mrwhLNRE1SFbDt8Hzb3bV4/IjlXMW+HUjFbztwqRDg363
 gdppbsUhRFsLlctiHkM+9XscRrpYT+/xmXJO65+5z5dQi7huKXI8i1OWIAE1r4/bcIev
 XYw9AY5CApf+ZA9ZIYNfN/UTclla7SICAY006mFZhWEW+VTP6gET/enl5BnAP9MwW0CS
 J8YOa2K8dUvHygM/dlLe0v/T5TZCGqU0cT/VAhXIUR4xRlkk8ToBBBMdbNVIHnvB4SFv
 2wnBmb5fUSkBJo+KnX25L+lZWUBHgjU8w9We1btPimzVKy2VnfLf023t/NlnU/eejiAF
 fT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vcmdJW0PQwHX3N7q/LEirUpgpEmrk9ZWnfdjvnD6Jk=;
 b=RrjfXRCMunwbNCGo/Bvj1LVT6yY0lJ2FOeKXGu3KRumQUGP3LcnXSV44djCoTL9sGR
 /99TKuYFPMUtKU3lbjI+Kx6aclxi2ON+5pjJatC3cwtyGoFPHMVpb1jcb4i4wOKa7HgN
 1rftypsLja9TJeOPAx4YiYR4+VQ5Of9hiX8+uBarmkWeLS8mdOM5ckSw2cUEZWwNFF3x
 t15VvFHjEkO2wEupLgTicSgJ8jLaopdpKI7tvu5F+fMJRhZBOuebEwc9x5UpZW/tnL+K
 OQbp6QaSOX93daV52/8btWQvWZHoIKMp0UoIjjfXIXONhJN7gtqjeDfgoqhwplPVPYV5
 WjXA==
X-Gm-Message-State: AOAM531K9U3h5K6g1GY2W60TQmq0bo1ATiQFkfDY6Sm9xxAsTZXo1Wb+
 qFg8KXKz+gdtJsV74SvenzROQw==
X-Google-Smtp-Source: ABdhPJztOzkgX+7urD2V90sFSZLX88MlP0aAgAWiiwYZyalCxrrj2COGktvlJXnrIRyp4ra/dedq4Q==
X-Received: by 2002:a9d:448:: with SMTP id 66mr7390470otc.345.1627320890170;
 Mon, 26 Jul 2021 10:34:50 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s24sm69328ooq.37.2021.07.26.10.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 10:34:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] drm/panel: simple: Add support for two more AUO panels
Date: Mon, 26 Jul 2021 10:33:00 -0700
Message-Id: <20210726173300.432039-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210726173300.432039-1-bjorn.andersson@linaro.org>
References: <20210726173300.432039-1-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add definition of the AUO B133HAN05.4 13.3" FHD panel and the
B140HAN06.4 14.0" FHD panel.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 66 ++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 21939d4352cf..fcf6cbbfdedb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1080,6 +1080,36 @@ static const struct panel_desc auo_b133xtn01 = {
 	},
 };
 
+static const struct drm_display_mode auo_b133han05_mode = {
+	.clock = 142600,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 58,
+	.hsync_end = 1920 + 58 + 42,
+	.htotal = 1920 + 58 + 42 + 60,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 5,
+	.vtotal = 1080 + 3 + 5 + 54,
+};
+
+static const struct panel_desc auo_b133han05 = {
+	.modes = &auo_b133han05_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 293,
+		.height = 165,
+	},
+	.delay = {
+		.prepare = 100,
+		.enable = 20,
+		.unprepare = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct drm_display_mode auo_b133htn01_mode = {
 	.clock = 150660,
 	.hdisplay = 1920,
@@ -1107,6 +1137,36 @@ static const struct panel_desc auo_b133htn01 = {
 	},
 };
 
+static const struct drm_display_mode auo_b140han06_mode = {
+	.clock = 141000,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 16,
+	.hsync_end = 1920 + 16 + 16,
+	.htotal = 1920 + 16 + 16 + 152,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 14,
+	.vtotal = 1080 + 3 + 14 + 19,
+};
+
+static const struct panel_desc auo_b140han06 = {
+	.modes = &auo_b140han06_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+	.delay = {
+		.prepare = 100,
+		.enable = 20,
+		.unprepare = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct display_timing auo_g070vvn01_timings = {
 	.pixelclock = { 33300000, 34209000, 45000000 },
 	.hactive = { 800, 800, 800 },
@@ -4233,9 +4293,15 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b116xw03",
 		.data = &auo_b116xw03,
+	}, {
+		.compatible = "auo,b133han05",
+		.data = &auo_b133han05,
 	}, {
 		.compatible = "auo,b133htn01",
 		.data = &auo_b133htn01,
+	}, {
+		.compatible = "auo,b140han06",
+		.data = &auo_b140han06,
 	}, {
 		.compatible = "auo,b133xtn01",
 		.data = &auo_b133xtn01,
-- 
2.29.2

