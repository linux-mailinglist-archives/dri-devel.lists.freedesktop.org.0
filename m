Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE631268F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 19:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DDF6E1F8;
	Sun,  7 Feb 2021 18:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C5B6E0A1
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 12:34:53 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id t8so13199899ljk.10
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Feb 2021 04:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gcz7v6DZPhAi4AtZZ5PbRFe7Gq35BWRB6p1i50/BrZA=;
 b=hK7VGPueDt+vV+Hg2FEDM4yqc4L/2MZxWWnvgohvnx7FkEGIxHYgs0cLQolRXI61RY
 ZBtUmv95HFkhYUTZwTHWHzP1BVCl/36ok/eMDq8GvFb0fxZwviZjKK6qxms/9FMJaQd9
 cx1qoQopB0lr+Cd5ORcmh11pLtd0+mf7PC5Og8qTsSXYSkmDN2oBJR/Iy8qrcUVdjIQk
 t9F4gd7Gcgp0BQGY1BYV0IfNxe5v0D+umaTr1wXhdas328GeSu195GdpmCMt33g3Tm4P
 txPk8TwOoee6cwj5DVFFzHhKqYjwtWxl01iCcofxtKTYWGfXFtAPDY6ZMxKq9AIi2qaU
 Kc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gcz7v6DZPhAi4AtZZ5PbRFe7Gq35BWRB6p1i50/BrZA=;
 b=Q21MONzgtcjnaZKdl9kVOp6q9LXOOIvxVIoaDa4R92FLdUC6qwtoceP7mOzssbbLnA
 HFZgFWkz2ZQZHrek92jLWljF75zl0jlibseuQnBByS1kvUzo1QvN8/GcCBuWkXSBl98q
 RLu9WkuBxHdgtvWI3qtU3NCLafwM3INEIy+59ptlUiDb2r3stjokjFVWph8WstTlKZyK
 W+FDS+W8mWqiEaggp8tzaDJQQVNjTzkN1WDa2Iz59eiqoOeGpdTwFu2maeWcHPB/xA4h
 SoOhVTR7LU/3yJdhW0dpKK1/YVBwHiwcBmZwHclr6yf6EuaJejILY+98VdBcKPlcv1ZA
 XFDQ==
X-Gm-Message-State: AOAM532nIKdDPua9lnupmH5JJjrHgySQdEyPqLmxQLkwIDcjP+HUuBPF
 w96pJ8OZ7I7zpuAjIUvVJqStkynv2E+Y7g==
X-Google-Smtp-Source: ABdhPJzOk4YDMTm0qa0+xpmWoaXorgKYiyJ+MzLw2Hvevl6hZI9n4bhRXMXGSJwEkS2+sb4Fv937DA==
X-Received: by 2002:a2e:b522:: with SMTP id z2mr7548668ljm.137.1612701291543; 
 Sun, 07 Feb 2021 04:34:51 -0800 (PST)
Received: from raszit-komputer-amd.raszit-server.ovh ([62.122.232.191])
 by smtp.gmail.com with ESMTPSA id b25sm121612ljk.74.2021.02.07.04.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 04:34:51 -0800 (PST)
From: Marcin Raszka <djraszit@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] radeon: added support for 2560x1080 resolution
Date: Sun,  7 Feb 2021 13:33:42 +0100
Message-Id: <20210207123341.5944-1-djraszit@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Feb 2021 18:13:33 +0000
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
Cc: Marcin Raszka <djraszit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was wondering why I can't set the resolution to 2560x1080,
 while in windows 7 I can without a problem. I looked at the radeon driver
 code and found it doesn't support this resolution. So I made some changes. I
 added the hdmi_mhz parameter. In cmdline I set radeon.hdmi_mhz=190
 Only tested on the Radeon HD 5830

---
 drivers/gpu/drm/radeon/radeon_benchmark.c  |  5 +++--
 drivers/gpu/drm/radeon/radeon_connectors.c | 25 +++++++++++++---------
 drivers/gpu/drm/radeon/radeon_drv.c        |  5 +++++
 drivers/gpu/drm/radeon/radeon_encoders.c   |  6 ++++--
 4 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_benchmark.c b/drivers/gpu/drm/radeon/radeon_benchmark.c
index ac9a5ec481c3..c283b6b15925 100644
--- a/drivers/gpu/drm/radeon/radeon_benchmark.c
+++ b/drivers/gpu/drm/radeon/radeon_benchmark.c
@@ -30,7 +30,7 @@
 #define RADEON_BENCHMARK_COPY_DMA  0
 
 #define RADEON_BENCHMARK_ITERATIONS 1024
-#define RADEON_BENCHMARK_COMMON_MODES_N 17
+#define RADEON_BENCHMARK_COMMON_MODES_N 18
 
 static int radeon_benchmark_do_move(struct radeon_device *rdev, unsigned size,
 				    uint64_t saddr, uint64_t daddr,
@@ -184,7 +184,8 @@ void radeon_benchmark(struct radeon_device *rdev, int test_number)
 		1680 * 1050 * 4,
 		1600 * 1200 * 4,
 		1920 * 1080 * 4,
-		1920 * 1200 * 4
+		1920 * 1200 * 4,
+		2560 * 1080 * 4
 	};
 
 	switch (test_number) {
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 607ad5620bd9..182f1e364cbd 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -37,6 +37,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
 
+extern int hdmimhz;
+
 static int radeon_dp_handle_hpd(struct drm_connector *connector)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
@@ -503,7 +505,7 @@ static void radeon_add_common_modes(struct drm_encoder *encoder, struct drm_conn
 	struct mode_size {
 		int w;
 		int h;
-	} common_modes[17] = {
+	} common_modes[] = {
 		{ 640,  480},
 		{ 720,  480},
 		{ 800,  600},
@@ -520,10 +522,11 @@ static void radeon_add_common_modes(struct drm_encoder *encoder, struct drm_conn
 		{1680, 1050},
 		{1600, 1200},
 		{1920, 1080},
-		{1920, 1200}
+		{1920, 1200},
+		{2560, 1080}
 	};
 
-	for (i = 0; i < 17; i++) {
+	for (i = 0; i < ARRAY_SIZE(common_modes); i++) {
 		if (radeon_encoder->devices & (ATOM_DEVICE_TV_SUPPORT)) {
 			if (common_modes[i].w > 1024 ||
 			    common_modes[i].h > 768)
@@ -1491,25 +1494,27 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
 	    (mode->clock > 135000))
 		return MODE_CLOCK_HIGH;
 
-	if (radeon_connector->use_digital && (mode->clock > 165000)) {
+	if (radeon_connector->use_digital && (mode->clock > (hdmimhz * 1000))) {
 		if ((radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_I) ||
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
-		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
+		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B)){
 			return MODE_OK;
-		else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		}else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
 			/* HDMI 1.3+ supports max clock of 340 Mhz */
-			if (mode->clock > 340000)
+			if (mode->clock > 340000){
 				return MODE_CLOCK_HIGH;
-			else
+			}else{
 				return MODE_OK;
+			}
 		} else {
 			return MODE_CLOCK_HIGH;
 		}
 	}
 
 	/* check against the max pixel clock */
-	if ((mode->clock / 10) > rdev->clock.max_pixel_clock)
+	if ((mode->clock / 10) > rdev->clock.max_pixel_clock){
 		return MODE_CLOCK_HIGH;
+	}
 
 	return MODE_OK;
 }
@@ -1809,7 +1814,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
 				if (mode->clock > 340000)
 					return MODE_CLOCK_HIGH;
 			} else {
-				if (mode->clock > 165000)
+				if (mode->clock > (hdmimhz * 1000))
 					return MODE_CLOCK_HIGH;
 			}
 		}
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index e45d7344ac2b..fce8f9ab8018 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -281,6 +281,11 @@ int radeon_cik_support = 1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled (default), 0 = disabled)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
+int hdmimhz = 165;
+MODULE_PARM_DESC(hdmi_mhz, "set HDMI max frequency, default is 165");
+module_param_named(hdmi_mhz, hdmimhz, int, 0444);
+
+
 static struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 46549d5179ee..6b805bcd5726 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -35,6 +35,8 @@
 #include "radeon_legacy_encoders.h"
 #include "atom.h"
 
+extern int hdmimhz;
+
 static uint32_t radeon_encoder_clones(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
@@ -389,7 +391,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
 				else
 					return false;
 			} else {
-				if (pixel_clock > 165000)
+				if (pixel_clock > (hdmimhz * 1000))
 					return true;
 				else
 					return false;
@@ -414,7 +416,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
 				else
 					return false;
 			} else {
-				if (pixel_clock > 165000)
+				if (pixel_clock > (hdmimhz * 1000))
 					return true;
 				else
 					return false;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
