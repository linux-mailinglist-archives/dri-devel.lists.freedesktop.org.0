Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BA3EEF9D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 17:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16E26E1EE;
	Tue, 17 Aug 2021 15:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B9E6E1EE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 15:54:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i22so13452481edq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPVxIIYJMTAKAHkD7g8fS9aJ8RhBft7CiFNnTlXmcMk=;
 b=CEX2uMQl1Es2j48M4bpAu8pwcPofi/4shuRHG1C7Y6f8/SydLf0eFWV39lObiTbvt/
 LYAGN7AG/iADsItx2zwyLknQVPhPLe+icGygMnVFUBo/pLrzkJPpYyrR5l+cHc+7ewv8
 ej4xSv1/QPmPRkG1knX0YAfsquy10AS/jM301s3JX8VwUxxhnX2RXxWelHabAwzmZWHF
 eHMWyCarIsxMNzFlLFPilAG6CnY7tZZf7RY5i4FS5XZTfGH4V0ima1sOstPZ2d1C0UPd
 XPd8F9nKkGYkubCLZRm+IThPuwpsY8HzXDZAFP+MR9W+UIuwpXrQTRS1K/3vmZjq87Rt
 TMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPVxIIYJMTAKAHkD7g8fS9aJ8RhBft7CiFNnTlXmcMk=;
 b=b8teE3f65ftt+fiVt54i1eneQCGxhOu8S90Ycxg0PD7DqkC0cHMT0EH9YeghS6EeBI
 uz1r/TC9FNxvFOJscoy/nrwpC8I+WoaiKpZRFyU2P29NLbqmyGMknB8ZE99bTg1WSUez
 F7JficN5c2FgklCbTtYuzB71K8Y45zugTbk0XCSse4ci8Qjt7xFnOvIAwg0KRBN9Pi3/
 CZBy3TF6zgyTWULbT9IT1Di8d6VRpCsaxbGhG7Vb0KtYRzcagFOYxcovsX9G/Bb/pDEw
 rJb3BYQ9vY6wlzM60PpBgFzeHRkcACUmU3DPbfNRNCYN/k95y5Vd0ZIEVrAMj0KZYUJx
 qegA==
X-Gm-Message-State: AOAM530Emb/sUrDyGmAxHb5sG1OL2QAHgWrq3s4bCiJTS++AZrr2kbjo
 n5K3Ma70qwMhij8/JXj2aD5LlNQSc2FSxw==
X-Google-Smtp-Source: ABdhPJxy0HY2v5O50hYmO13eRTAGRQwTB2VT9OMXIqIlOtPKgMIMn6Xn+EAWqPjWa8zaWD7LdQ0LfQ==
X-Received: by 2002:aa7:da4a:: with SMTP id w10mr4813168eds.206.1629215646702; 
 Tue, 17 Aug 2021 08:54:06 -0700 (PDT)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id u2sm934555ejc.61.2021.08.17.08.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 08:54:05 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v2
Date: Tue, 17 Aug 2021 17:53:43 +0200
Message-Id: <20210817155343.1063402-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
hence the panel settings that were retrieved with a FEX dump are named
after the device NOT the actual panel.

The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
1024x600 used by the aforementioned device.

Version 2, as Thierry kindly suggested that I fix the order in which the
panel was ordered compared to others.

Thanks,
Nikola

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..9f6080e57771 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3989,6 +3989,30 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode vivax_tpc9150_panel_mode = {
+	.clock = 60000,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1024 + 160 + 100,
+	.htotal = 1024 + 160 + 100 + 60,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 10,
+	.vtotal = 600 + 12 + 10 + 13,
+};
+
+static const struct panel_desc vivax_tpc9150_panel = {
+	.modes = &vivax_tpc9150_panel_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 223,
+		.height = 125,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
+
 static const struct drm_display_mode vl050_8048nt_c01_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -4490,6 +4514,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "urt,umsh-8596md-20t",
 		.data = &urt_umsh_8596md_parallel,
+	}, {
+		.compatible = "vivax,tpc9150-panel",
+		.data = &vivax_tpc9150_panel,
 	}, {
 		.compatible = "vxt,vl050-8048nt-c01",
 		.data = &vl050_8048nt_c01,
-- 
2.32.0

