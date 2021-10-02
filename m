Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8341FE0A
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 22:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7306E02E;
	Sat,  2 Oct 2021 20:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529F36E02E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 20:30:33 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id dj4so49000656edb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 13:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DBU/eugVLHJnNv/7vjHoBSC9sRWw65Q/giAQQj/u/t8=;
 b=b/CeJaD8yfh+cEsjmwl996oH73CaUi75zCCE5VRa8F7nxP/NxkraOciEGvbiJoNEzp
 +oW6Xd34ERPYyf1qY+bn+kXN8izgZqdQNv8jEPQoQ87L0vZdofYPrLK/y3bphrL0OiVW
 1SNwWoSHkW0V3gYlLZTI7Ifk+PnSgGegB0JeCcXeN6mamZnypQMns9t4GzwadKTtVOW/
 2AleWrGdSz/Kir3eWbCyo6/sKMdpFGKUPD7AyS+06/5PIqrKHtZxRSr7ItlRWHaCeu/v
 WF3NlwF9wbkfYUXM2uv4igcA1dWJgXv0ItKsBr3r7Kvg4Igr1T4qUCyOoulYlZj/Vj5s
 pDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DBU/eugVLHJnNv/7vjHoBSC9sRWw65Q/giAQQj/u/t8=;
 b=YhvZsA2AaUvzolSVAWcn7VZz2yi5tvHLwdDASUryqrM7zu1gi9UAPQoVL39G3eLzJC
 5qGu5UYG1lGsumIXfsaDyb0RosCLvlgINC6rXOqddgQhK6ToXWUDwpvO/dVX41tYcDVj
 UcgZgKRKAtae2Yug6kreIEXuqx1617AvdKIYxiZOM9uexMDZQhzw0EOsvkT6WlRi49+0
 ncausFCXiEvBTQ+i4Ku2dNYhEydRDfI4Owv2hEDnrfiEZULA3x16b0ZNZbkEj+bSjq4F
 qs6yRkCbkkVYj+hAZ2IGs9k63sJrBhTPUMP1AovicSmENifZDtG7SJTsdxPKmmC6IBWj
 Q5jg==
X-Gm-Message-State: AOAM533pkn/QQVWuaA22haS7hmQiGTDP7oKDk8OdZHsO0k/hb1c9/ou8
 jEYigi1CnxLAQOQkUDBwiGA+YROZ2I6A0Q==
X-Google-Smtp-Source: ABdhPJx0S0kiFv98tbJRmbvSsqgbY9akIIk3ZoTQPW1J2YwdvOXC+1NnMakIZPRfscPxkErwSk9PnA==
X-Received: by 2002:a05:6402:713:: with SMTP id
 w19mr6484692edx.366.1633206631522; 
 Sat, 02 Oct 2021 13:30:31 -0700 (PDT)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.gmail.com with ESMTPSA id dt4sm4615804ejb.27.2021.10.02.13.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 13:30:31 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v5
Date: Sat,  2 Oct 2021 22:30:17 +0200
Message-Id: <20211002203017.509940-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.33.0
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

Version 3, filling in the required info suggested by Sam. Plus some
factual issues that I've corrected myself (tested working)

Version 4, rearranged the display parameters and fix invalid bit format
issue. (Thanks Sam)

Version 5, referred to FEX file instead of manual debugging for
information.

NOTE: Seperate dt-binding patch has been sent to THAT mailing list. So
that's why they're NOT included here. Advise freely if that's not how
you're supposed to do it.

Thanks,
Nikola

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b6c4e6c3..680fd3f72 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4363,6 +4363,32 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
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
+	.bpc = 6,
+	.size = {
+		.width = 200,
+		.height = 115,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
+
 static const struct drm_display_mode vl050_8048nt_c01_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -4891,6 +4917,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.33.0

