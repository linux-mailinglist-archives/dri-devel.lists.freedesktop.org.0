Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC6255E51
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 18:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28A6E4D4;
	Fri, 28 Aug 2020 16:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247FC6E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 16:00:04 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y6so686580plk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MbYexE+YeO82ly0FE/zoT/BNz1A0lzD35YNwGzIzVsk=;
 b=hy4l05DsPLpSJW+l89Chi5ub1DjyDJzR+qRlR2IAHcVnaR72U5lE5bCmmkXZpgsXpQ
 1Xh5M59WyQwRpd3r4x2G6+7x+AyVIx/8OE7W4bfJsRaTaOCwsKx1MoDIY28DFdOdyn4F
 CnnDvS4XIZHkU7R3pk74YzfO7F49HRHhBGvd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MbYexE+YeO82ly0FE/zoT/BNz1A0lzD35YNwGzIzVsk=;
 b=UTCypLvpx4bvegvH1SyPYEKU4j/s+CGg/JFzfwwYAd+0vEHYMZFo41//PAks8qrOy6
 UF9M+A6F7z3efCgkatIXuMj76GLUKUUjaM2QmrcrvgQyVO/7LF/c72vkJY/TuR6aTL6L
 Ya58JpABJfie/ALReJJNUk2UbV06QMNOD2MKLtirf2PH2N2H2teIV3OfOM8FezjjS7LG
 /qARg/qjb53RdBcCR3/ETDqy5lUy1coLtRVQpIbjaNRNT1sjlXuACuXnQbl7NgW75U11
 QxfLWAGXtD8i7NPu175xK69g7ErsNUlTNwObDVYBD/sGRM5gfdhG/PDTm8D6Abs3jeKn
 wwNg==
X-Gm-Message-State: AOAM531sYnuTLFx0+OR5ToJYjEKfWwxKAotgdLv4uZ6nLqbitJkvWEg1
 izn+PNI8p1G/ErY+20G6p+688A==
X-Google-Smtp-Source: ABdhPJyUJZm0XVHjwyYxk2tVHNOq6dtmyiZbFYgdzVsyHHd/Nrqh9K35iKvUnQRhhp69kMczmZWtyg==
X-Received: by 2002:a17:90a:15c8:: with SMTP id
 w8mr1837572pjd.179.1598630402968; 
 Fri, 28 Aug 2020 09:00:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:8ce8:955b:ae1b:d6ef])
 by smtp.gmail.com with ESMTPSA id x13sm2195691pfr.69.2020.08.28.08.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 09:00:02 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm: panel: simple: Add AM-1280800N3TZQW-T00H
Date: Fri, 28 Aug 2020 21:29:38 +0530
Message-Id: <20200828155938.328982-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828155938.328982-1-jagan@amarulasolutions.com>
References: <20200828155938.328982-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Ampire, AM-1280800N3TZQW-T00H 10.1" TFT LCD panel timings.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b6ecd1552132..c988fe8094f8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -592,6 +592,31 @@ static void panel_simple_shutdown(struct device *dev)
 	drm_panel_unprepare(&panel->base);
 }
 
+static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
+	.clock = 71100,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 40,
+	.hsync_end = 1280 + 40 + 80,
+	.htotal = 1280 + 40 + 80 + 40,
+	.vdisplay = 800,
+	.vsync_start = 800 + 3,
+	.vsync_end = 800 + 3 + 10,
+	.vtotal = 800 + 3 + 10 + 10,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
+	.modes = &ampire_am_1280800n3tzqw_t00h_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+};
+
 static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3637,6 +3662,9 @@ static const struct panel_desc arm_rtsm = {
 
 static const struct of_device_id platform_of_match[] = {
 	{
+		.compatible = "ampire,am-1280800n3tzqw-t00h",
+		.data = &ampire_am_1280800n3tzqw_t00h,
+	}, {
 		.compatible = "ampire,am-480272h3tmqw-t01h",
 		.data = &ampire_am_480272h3tmqw_t01h,
 	}, {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
