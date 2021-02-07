Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D89312367
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 11:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3766E0E6;
	Sun,  7 Feb 2021 10:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DA16E429
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 09:40:06 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c18so12947858ljd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Feb 2021 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oG8UuFWzfJqkv2XW5txDA/xJM4YW9culKt5veHh2BgA=;
 b=d07Sfmdr0dMMF1m60A94qoOnxCI4Ibg8PMS8ENR++ZRhiVhNmzBR9GWeABSz8CbR3N
 l1bRxFrfzBm0Znbaws1P0A5z43C7ANHTeOqU/EkWVG2OX5LTrt1ex78eSpAZ7DSI9U/F
 iz57wZhbnhpw9BYHLz4fyj5oSv4GXePD6gOZDg6MWSDB1n8Qjpu7h5dKgSRmjJzOUhua
 iCRoeihp9cbz0+Im0ZuctCGABErN4knHPmWm8ph7bw3AwIbXk49E0VuodHmxS51Fa9m/
 8gWalfeUQgsaqTU/azWpaqL2hwCBi3X/jdhw2NYLDzSOxkdCLy30BrmxYhUngKPP6w3Y
 QFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oG8UuFWzfJqkv2XW5txDA/xJM4YW9culKt5veHh2BgA=;
 b=ZAe3ONSAPRYIuYOlEff6CUsgpYCgWUoNBDDsiJkAeqmQisUypVGi2i4NuMxlIhY0nk
 OtL+1y9VdHo3Nsi6pd8Rc0d604MAftrCCKWIYXAtyO7m2Xpqru2h56wEIh1sWkJOqtEh
 jDZih6RluEfe8jXutPnE09B6Kgt2RgVwOg5jq/nxUmc9uWzVwywofTwsX6o5Ul9gBRVU
 LsDTx+nEVPA+iQiAQzNIBgvBC25IkUXcKei1fXQAA55nZnKlGjaekMwDzl+llKw4W7G6
 QqtlqPuRsj8Pp+8WnGqXEqoXaHU3CX2DIexayqkT/4c8YmILwFL4zq2JuhKiRM9NWu1l
 D+bQ==
X-Gm-Message-State: AOAM530KTWtNQSw+Vcg+fBgtCKxIRt2yh8+r72d9nrT25l/H28PSUnw/
 T3fjs0/8LMKYkMYbvMG9Mn6WJQfaaa0LxYFU
X-Google-Smtp-Source: ABdhPJyLhltgaKaBwcehjdthljdD9ajYLu2puVCyN/CKvHT9cbR+5spcNhRsW4nU1N+y/mP804mDbg==
X-Received: by 2002:a2e:8883:: with SMTP id k3mr7434504lji.198.1612690804648; 
 Sun, 07 Feb 2021 01:40:04 -0800 (PST)
Received: from raszit-komputer-amd.raszit-server.ovh ([62.122.232.191])
 by smtp.gmail.com with ESMTPSA id y18sm1639118lfe.29.2021.02.07.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 01:40:04 -0800 (PST)
From: Marcin Raszka <djraszit@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] I was wondering why I can't set the resolution to 2560x1080,
 while in windows 7 I can without a problem. I looked at the radeon
 driver code and found it doesn't support this resolution. So I made some
 changes. I added the hdmi_mhz parameter. In cmdline I set radeon.hdmi_mhz=190
 Only tested on the Radeon HD 5830
Date: Sun,  7 Feb 2021 10:39:52 +0100
Message-Id: <20210207093952.7087-1-djraszit@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Feb 2021 10:16:38 +0000
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

---
 drivers/gpu/drm/radeon/radeon_benchmark.c  |  5 ++--
 drivers/gpu/drm/radeon/radeon_connectors.c | 30 ++++++++++++++--------
 drivers/gpu/drm/radeon/radeon_drv.c        |  5 ++++
 drivers/gpu/drm/radeon/radeon_encoders.c   |  6 +++--
 4 files changed, 32 insertions(+), 14 deletions(-)

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
index 607ad5620bd9..37927222f5b3 100644
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
+	} common_modes[18] = {
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
+	for (i = 0; i < 18; i++) {
 		if (radeon_encoder->devices & (ATOM_DEVICE_TV_SUPPORT)) {
 			if (common_modes[i].w > 1024 ||
 			    common_modes[i].h > 768)
@@ -1491,25 +1494,32 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
 	    (mode->clock > 135000))
 		return MODE_CLOCK_HIGH;
 
-	if (radeon_connector->use_digital && (mode->clock > 165000)) {
+	if (radeon_connector->use_digital && (mode->clock > (hdmimhz * 1000))) {
 		if ((radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_I) ||
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
-		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
+		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B)){
+			printk("MODE_CLOCK_HIHG0 %d", hdmimhz);
 			return MODE_OK;
-		else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		}else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
 			/* HDMI 1.3+ supports max clock of 340 Mhz */
-			if (mode->clock > 340000)
+			if (mode->clock > 340000){
+				printk("MODE_CLOCK_HIHG1 %d", hdmimhz);
 				return MODE_CLOCK_HIGH;
-			else
+			}else{
+				printk("MODE_OK1");
 				return MODE_OK;
+			}
 		} else {
+			printk("MODE_CLOCK_HIHG2 %d", hdmimhz);
 			return MODE_CLOCK_HIGH;
 		}
 	}
 
 	/* check against the max pixel clock */
-	if ((mode->clock / 10) > rdev->clock.max_pixel_clock)
+	if ((mode->clock / 10) > rdev->clock.max_pixel_clock){
+		printk("MODE_CLOCK_HIHG3 %d", hdmimhz);
 		return MODE_CLOCK_HIGH;
+	}
 
 	return MODE_OK;
 }
@@ -1809,7 +1819,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
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
