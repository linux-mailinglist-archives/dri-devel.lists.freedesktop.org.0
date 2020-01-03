Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E3312FC9F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 19:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1E36E323;
	Fri,  3 Jan 2020 18:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EF06E323
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 18:34:53 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a6so18597966plm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 10:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Dusf/4KDqcrQi/VonO+4x5vUuCsxZgl6QQ8UNNQfZ0=;
 b=DNo7kR9vKKDTlqoxQ8AOGZwUhmfVgoLHQ/GJPi8L8/TwGW9RmPmJL3RgsmW5koUk8r
 R13GnTuZM90xCE8Td4Cj1s74JKKQD/0CXRns0wHW9qEDaGQfv4l8UUkoQN1PgbUafQdP
 4KrO4C/jJz9b0nSPejTbElePBzrFPvWA73N5k5hticNG4TCmzfuMEu8ivh336xtVYlNV
 3GYOnZrarUvl+QyQF7seSqhB1dTmW2jVYjKpIGuNkvSh2LB59qj/ufaKl/BgY+7KUH+d
 hD25nntUoYn5dkFq40YOucrUbpMlAeHiI+6MmUxt8KOlqfpTjLzkE6f7cLQT0f3zw4Bl
 f4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Dusf/4KDqcrQi/VonO+4x5vUuCsxZgl6QQ8UNNQfZ0=;
 b=j32jSKm/ZGuLxAMWfRVT5wfX2PiAZJwRr6YAvsuYGWzIgQBQH0PmfEYbzw3qV5xlZT
 kLqOZf6CncdsXOnBEhMprUuWecoWdck582cmEd6oj6IWcXlxbuDnTqK3ncham8mDe0sb
 2boFMfoAVAUI9xhP0oPmBevbaU+CKtJyKMs33h83G2I/VQoqVSG57CoGUeSM4ZW1TSLw
 PxHIUN8VJBQJGOazmi7Gto+SoL7tZRNi1jCR1GULQe2xR3SKhGSVfdnpGiLNtlstRj2c
 6o5GXYrdEMKYXedGoezeoLJheBX/Bb39crRzEjUcpcA6S3VZnceo2wEOg224q/RD9EGq
 qIDg==
X-Gm-Message-State: APjAAAVLIZCP4DjAalVCbFn3Wv6J3CHRj2FvXj0UKlUrTwCWNDJfJMji
 WncbcBt/rJKRo/QakY6QFEavNlILPvc=
X-Google-Smtp-Source: APXvYqx9m7oZjNsk+KdmrE/zTv6Qh85g23ksK74cqcggdeWZztPomG0rZabNyWSNWbmvPGqxpCDWYg==
X-Received: by 2002:a17:902:8342:: with SMTP id
 z2mr89565186pln.181.1578076492887; 
 Fri, 03 Jan 2020 10:34:52 -0800 (PST)
Received: from localhost ([100.118.89.215])
 by smtp.gmail.com with ESMTPSA id r14sm68677143pfh.10.2020.01.03.10.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 10:34:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: Add support for AUO B116XAK01 panel
Date: Fri,  3 Jan 2020 10:30:24 -0800
Message-Id: <20200103183025.569201-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200103183025.569201-1-robdclark@gmail.com>
References: <20200103183025.569201-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
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
index 5d487686d25c..895a25cfc54f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -680,6 +680,35 @@ static const struct panel_desc auo_b116xw03 = {
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
 static const struct drm_display_mode auo_b133xtn01_mode = {
 	.clock = 69500,
 	.hdisplay = 1366,
@@ -3125,6 +3154,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b133htn01",
 		.data = &auo_b133htn01,
+	}, {
+		.compatible = "auo,b116xa01",
+		.data = &auo_b116xak01,
 	}, {
 		.compatible = "auo,b133xtn01",
 		.data = &auo_b133xtn01,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
