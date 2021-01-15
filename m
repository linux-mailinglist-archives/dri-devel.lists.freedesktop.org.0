Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345212F88A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9203D893E8;
	Fri, 15 Jan 2021 22:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A65189113
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:44:54 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id m6so6412550pfk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qS78FZ4W8rqLJokNq5ZcTTS18dyO2G9lo8sgbVdLz2w=;
 b=YBoV0cjHnLMdT8Whco1/3fv7OBbHNm2k319MX/R0wLJYhD6YFdhLQsB5q+WF7XBDXm
 hRpxkUOt7zqvot1S5epP5UBkcggBnmlR9sN3rudAptlzzphIIuA5m0rOrE7BmI2bsSWd
 c54c8vQ6mXLKQ73Ela+dyd8ne2TvUqkDhwPjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qS78FZ4W8rqLJokNq5ZcTTS18dyO2G9lo8sgbVdLz2w=;
 b=bx2FnPRpbymGCewz62dSBLNUr0+/ex1dAmcU9i0KmC63oV5emcw1urc5VW2yExf1LU
 K7Fhqq9bsITR3HC77lDR8trhkRjCqIiEOLkyXYpT6DzY5JpnmO6ePxtL82kpRRFJQNtZ
 8BUE+OeZ1Xm4gRklVfs4tldZbCb8iuXbwrkuScgQHBItyQ3VY8iuaKESR7c8TtTpp/X/
 6IsGjsI8qWAnm3CV1O3C46td8bFjXJQvxISJ6u7XFdUaxdtE3GiWSUq0LgLhyYngwytw
 ZQSxFTi11jzVxKOK0RXiAqJGUAWeJdZ6ffiaqyE5egQnMkD9Rrn7IPngmCm72cHDnvcC
 dfdQ==
X-Gm-Message-State: AOAM532Vzz42XwleK44mS66dWoFJEJ1i1OlcNyeB6ekdUmi7IjeSOujU
 10ufUevPxlgzqJlIVDJMsdWb6A==
X-Google-Smtp-Source: ABdhPJxz7VaGdPquJIeid3tc9J3bmDjLmTag/CY/rmobwMCbN3MNqeLjfBLTBQKNukUJtNI3d/d02Q==
X-Received: by 2002:a63:d446:: with SMTP id i6mr15023966pgj.446.1610750693977; 
 Fri, 15 Jan 2021 14:44:53 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q16sm9131100pfg.139.2021.01.15.14.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:44:53 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 5/5] drm/panel-simple: Add N116BCA-EA1
Date: Fri, 15 Jan 2021 14:44:20 -0800
Message-Id: <20210115144345.v2.5.I3c01f3aab8335cb509da7009d8938c1a27a266dc@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115224420.1635017-1-dianders@chromium.org>
References: <20210115224420.1635017-1-dianders@chromium.org>
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
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is quite similar to the similarly named N116BGE panel (the
nominal timings are, in fact identical).  However, let's add a new
entry because the full range of clocks listed for N116BGE aren't
supported for N116BCA-EA1, at least according to the datasheet.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("drm/panel-simple: Add N116BCA-EA1") new for v2.

 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 823177d89d1b..76a1bebaaaf9 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2407,6 +2407,36 @@ static const struct panel_desc innolux_g121x1_l03 = {
 	},
 };
 
+static const struct drm_display_mode innolux_n116bca_ea1_mode = {
+	.clock = 76420,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 136,
+	.hsync_end = 1366 + 136 + 30,
+	.htotal = 1366 + 136 + 30 + 60,
+	.vdisplay = 768,
+	.vsync_start = 768 + 8,
+	.vsync_end = 768 + 8 + 12,
+	.vtotal = 768 + 8 + 12 + 12,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc innolux_n116bca_ea1 = {
+	.modes = &innolux_n116bca_ea1_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.prepare_to_enable = 80,
+		.unprepare = 500,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 /*
  * Datasheet specifies that at 60 Hz refresh rate:
  * - total horizontal time: { 1506, 1592, 1716 }
@@ -4320,6 +4350,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,g121x1-l03",
 		.data = &innolux_g121x1_l03,
+	}, {
+		.compatible = "innolux,n116bca-ea1",
+		.data = &innolux_n116bca_ea1,
 	}, {
 		.compatible = "innolux,n116bge",
 		.data = &innolux_n116bge,
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
