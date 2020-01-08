Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C5135036
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 00:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB176E359;
	Wed,  8 Jan 2020 23:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7F26E35D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 23:58:24 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f20so1769527plj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 15:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=st0ckcOqaRV+ZvHstV7I6k7aAc3QTXy2/XaWGPv2J64=;
 b=NPF9IFGSgMgntYLD6eWINkS4FKHUSk00e/FB68oqFvCSHcAakBezDXHUmFl6VYX6g8
 P2S8OwhJpgLtI3zEIzpifr7SprtaswE5E0UT/3kAU9EZO+2dAayA9AIcabxaZSb97/TU
 tTQ8WFonFasx12Yg/WorXmtif23vQWiQVPa1v8YhyPLwOyi6V6zz7LqBofcU2hP3cp+T
 fJWgtSriHjZkyUjNz43jDTJi0s2WDsSot9zwI8q8zbagZtBYkmzDy8NeH9v+bsXRgESM
 DT+dUw5uwy4Resyzl6LgkzzTfg3LNDZzfRfQrsecipDNFwhTI6J/KtXff+ys8SniwTUI
 /0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=st0ckcOqaRV+ZvHstV7I6k7aAc3QTXy2/XaWGPv2J64=;
 b=DFj3bNWERG7DGEOV7mixHbrJevpQ2AOf0HcCPG6l5eXN9/c3RVuHuLEwwNaa3ZinHp
 V1BcfsnH5B2W/sL3EcSUmmdF+KBv+Vx/PpKwK+AN1L0JyrAVEiEXDacSqQUzSKjccaiz
 Fwl/o+w7FQU7k7FyL+6jzvLh//ipMuN9SGhfEjMexIyis3Iu76YcYLCW0SGuP4jYcdS+
 IzAA+VNOXMtN/ItnRhhyK2nMJba9eGlfokcFJzqTsI4MwX9bcgGTpidJReg/E9wkONQk
 XqhEcNSBYZtth5mBQ4jdHdq+nDZEZp7ae6Qg3+S9CC9E0KDg20gsi8YLL6xkokbWulkn
 HVRw==
X-Gm-Message-State: APjAAAXQibBW1RQ/NuCTU9FbDGH3bo9jRbUIr/xDYsmXCRIHaBVGl0sP
 F1HHsVNG6UHNnUtxRf5a2IBNULievBM=
X-Google-Smtp-Source: APXvYqy+t3SaP+IB09BU86n962/2WWP+4/lU9dArW8bBU/fPKZ26xI0HntnvHYQAgnvnpjp4sKLdIg==
X-Received: by 2002:a17:90a:8a0c:: with SMTP id
 w12mr1558940pjn.61.1578527904251; 
 Wed, 08 Jan 2020 15:58:24 -0800 (PST)
Received: from localhost ([100.118.89.215])
 by smtp.gmail.com with ESMTPSA id e14sm5202366pfm.97.2020.01.08.15.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 15:58:23 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/panel: Add support for AUO B116XAK01 panel
Date: Wed,  8 Jan 2020 15:53:56 -0800
Message-Id: <20200108235356.918189-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108235356.918189-1-robdclark@gmail.com>
References: <20200108235356.918189-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ba3f85f36c2f..0c3444c62014 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -629,6 +629,35 @@ static const struct panel_desc auo_b101xtn01 = {
 	},
 };
 
+static const struct drm_display_mode auo_b116xak01_mode = {
+	.clock = 69300,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 48,
+	.hsync_end = 1366 + 48 + 32,
+	.htotal = 1366 + 48 + 32 + 10,
+	.vdisplay = 768,
+	.vsync_start = 768 + 4,
+	.vsync_end = 768 + 4 + 6,
+	.vtotal = 768 + 4 + 6 + 15,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc auo_b116xak01 = {
+	.modes = &auo_b116xak01_mode,
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
 static const struct drm_display_mode auo_b116xw03_mode = {
 	.clock = 70589,
 	.hdisplay = 1366,
@@ -3125,6 +3154,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b101xtn01",
 		.data = &auo_b101xtn01,
+	}, {
+		.compatible = "auo,b116xa01",
+		.data = &auo_b116xak01,
 	}, {
 		.compatible = "auo,b116xw03",
 		.data = &auo_b116xw03,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
