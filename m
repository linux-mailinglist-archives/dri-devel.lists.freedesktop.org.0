Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB524D8AF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 17:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F026E85B;
	Fri, 21 Aug 2020 15:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E486E859
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 15:35:36 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id r4so1041005pls.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soERAZs9Qqj0stxZ21kcyBQ2mrcQaIYycZ2RGXP4UCc=;
 b=OfV+SpGv14O8eiiPmbak3/VqcCOP9Svc+4+NW66iyBfeZw0VYn9jzvZx5zJ/Si9JoT
 ie98uM6X+4gO7ltkaWyLLJ/ZLfDpilz/pNVH+ptOfmPx16/pJ4DFURvLiqHs+sgbLep8
 BzoHATwNhB5btbStuIJQ9WkhhES9xSiuZ6+1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soERAZs9Qqj0stxZ21kcyBQ2mrcQaIYycZ2RGXP4UCc=;
 b=F3O7Jfb6gXL/6Rlg8sbrK16oGgy2Pw/rSygEDRTMMzdJZpciiqhI3elb1CKZB3+GtU
 LjOP50nhRdtX7T8iuXZ8bpNQwZ46uzb/cPDiEXU9bLv14eKtzOO12qNeg0+XKV9DR7by
 0kC5Errnz+E5HeEnWaoNhnQW07xzdzCsCPfMHC8iABvi9Ezl/mgLgOLLlIheDTJ8FKZi
 IZ96ZJLoxmrBZ0uI3NwPk7WvzztVZoq1x8cO/XL7ZF9R3A4fZN6slPrSzsB8jX9UDmzZ
 ySl1TsVO8bqwELcsUaPHnjedrgkEwhbtUYna2GduQZtM6F/DQANt6NDIRGhx0Ql0bPza
 eMTg==
X-Gm-Message-State: AOAM532REJ4bdaybeJ8SrqfqO0UUdOtY2Q3iViRiR/cMJT3f6xc62EeV
 WkRIt2UGUxTitFdcM3SjMLMPCg==
X-Google-Smtp-Source: ABdhPJz5/8mxA1qiicGG2N+7IOeZNeMhwEcpWMGEM59KuhuEqOcUCsU/8VVBUQ8LHzl67/I3gKACyw==
X-Received: by 2002:a17:90a:de83:: with SMTP id
 n3mr2784787pjv.62.1598024136533; 
 Fri, 21 Aug 2020 08:35:36 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id u8sm2200720pjy.35.2020.08.21.08.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:35:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/2] drm: panel: simple: Add KD116N21-30NV-A010
Date: Fri, 21 Aug 2020 08:35:15 -0700
Message-Id: <20200821083454.2.Idf25356dff4b36c62704188c3e3d39a2010d6f6a@changeid>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821083454.1.I61e6248813d797c9eeebfbb7019c713aa71c4419@changeid>
References: <20200821083454.1.I61e6248813d797c9eeebfbb7019c713aa71c4419@changeid>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Values come from the vendor and have been tested on hardware.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4eabfdd3be2d..f499de71ab3d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2341,6 +2341,34 @@ static const struct panel_desc ivo_m133nwf4_r0 = {
 	.connector_type = DRM_MODE_CONNECTOR_eDP,
 };
 
+static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
+	.clock = 81000,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 40,
+	.hsync_end = 1366 + 40 + 32,
+	.htotal = 1366 + 40 + 32 + 62,
+	.vdisplay = 768,
+	.vsync_start = 768 + 5,
+	.vsync_end = 768 + 5 + 5,
+	.vtotal = 768 + 5 + 5 + 122,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc kingdisplay_kd116n21_30nv_a010 = {
+	.modes = &kingdisplay_kd116n21_30nv_a010_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct display_timing koe_tx14d24vm1bpa_timing = {
 	.pixelclock = { 5580000, 5850000, 6200000 },
 	.hactive = { 320, 320, 320 },
@@ -4047,6 +4075,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "ivo,m133nwf4-r0",
 		.data = &ivo_m133nwf4_r0,
+	}, {
+		.compatible = "kingdisplay,kd116n21-30nv-a010",
+		.data = &kingdisplay_kd116n21_30nv_a010,
 	}, {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,
-- 
2.28.0.297.g1956fa8f8d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
