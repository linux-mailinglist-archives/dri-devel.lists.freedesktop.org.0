Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9148365C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA6789F73;
	Mon,  3 Jan 2022 17:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C16089F6B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:41:17 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w7so35170630oiw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdtXppYqsetXpW/uTb4lADvDktzu31SRTwb5UgROFro=;
 b=HTvd/0eoSMO64/CqOjjXMwPDjVWr7Pvf5LW/l14oLAP8b8DlP5d9hOfHwxP9uCDaVT
 cFQitwzw+5L/HxCe0FD8sn68DeaRCGmbgHXhVht81Y0+0jsBecg5DYKp6R3TXRkaTFcc
 b70BzZqYIw7z7sw19Yk56uI3LrJdoRDYKqHy4cOIJLiArV3jaDM+Mk7HtiiXXXOuC4ME
 Y2H6OOBGfLUwE/UtwwLfB9rLfmP4/ysRSVSOFHsDgrjX6afFd/Zy7CRnR74d7p9pe721
 ceb3lcxDDsEDWq/WepVbLjj2MUIpAZ4PH8rP/eZlc76Xgv4NX8nnzEdtvCxr82aDd4Wf
 2cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdtXppYqsetXpW/uTb4lADvDktzu31SRTwb5UgROFro=;
 b=e31KtOxS1B+RCd5F6HuK7hD44dT7oqIId6xci4o13fVEcLjYXWEE6LHD9t4fp0Srph
 OFFEhGmqy8rJeVH+4BtECZ7+cPjkcHVQ369DUFWfTpbZR5Y0t0eDu3WB+rwv6VLv6wji
 w1b2cQKErL7609m4suFOJnISWftYcLr6Qz/UZmzOj7DftDxTkNIbjBSR9vnTWSBYiM4O
 2Of/yQs+OHzAP2Itj9bc53a3lc2AQ8C85tg/tl2tFJqQT8uEe87NK/u8lH09GwkzxTR2
 /obptkQYKyU1G6rxpI3U4pLp7oohwh1j2315PBEDt+E8YOTOp69LB0wmYwJ3yTTMJIeC
 z0AQ==
X-Gm-Message-State: AOAM531fl5R0G4cFDW4EKM9VR/Zo+TM/W4Mk3mWn+imxzvXK8WgX2RJ6
 ZxTKn4lIbRHR+WGsU7ktpxYCJpSpKG0=
X-Google-Smtp-Source: ABdhPJxv12SBhIQegsP8WBo7Udu7BUNWbG0MjTL0nrGxkn9RYsLEGc8l03LxlMyDJxQzvpOH/Ag5Vw==
X-Received: by 2002:a05:6808:1202:: with SMTP id
 a2mr36469392oil.57.1641231675781; 
 Mon, 03 Jan 2022 09:41:15 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:41:15 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/panel: simple: add Geekworm MZP280 Panel
Date: Mon,  3 Jan 2022 11:41:05 -0600
Message-Id: <20220103174106.907-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
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
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Geekworm MZP280 Panel

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index eb475a3a774b..f40f4e9a0e08 100644
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
@@ -3713,6 +3739,9 @@ static const struct of_device_id platform_of_match[] = {
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

