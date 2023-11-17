Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8047EFB10
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2153610E795;
	Fri, 17 Nov 2023 21:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014610E1A7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 21:51:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-28039ee1587so1961958a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 13:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700257863; x=1700862663;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDebfVAoPELKTEL528lJwzdi4eZAa8eNlalDXzxQ6JQ=;
 b=SzAOJ0QlhXcH5D4q9ia++B50WIkexLp0Uh3CMhZjOSDMT95DHOY/bh0EjRCpmv564u
 xsRyfGp22WgNVmgj3X1OhpMCMkrFlqQzsBROMUuktb11Vr0PHj7/zZSvJbaF7y1BCojQ
 z/n28a/FDwF0BB5/Mg1E1i9/GItL6Lk/6AUGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700257863; x=1700862663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDebfVAoPELKTEL528lJwzdi4eZAa8eNlalDXzxQ6JQ=;
 b=A0b5VBKl2y6Rdx0fK2qBUyD/zZ15nPlhSQuGVUux+oKikd44G+KmIwDu2juEFoTaJX
 BrhJnuNbFrbFn6r0NwJGKAryDjXVwLEKAZ++skJdEKMa7ZcRQUrdvOriI587pJOaCYaX
 L3+ViiF5cE/szGBBqvnCg0OUuxfSMXiekEXy+GyzzLzGfXU4kED6IoVPqM25mwmK2KRO
 L0lT+WNj2+yYdqGonL0/hySWNkm84MoLQ3osnevjoJVwDpyhu9niHPIyhu9RRLoeIW4W
 K29lD0nPVwMsL0CeuvKDUgsZCulj+8Thy37F7xkay98PDRZvrzrcZPOLBGThwPgS8EIk
 ZETw==
X-Gm-Message-State: AOJu0YxZHQAiCVBuiERXyBMnVY8iIvb25blF1n5GuzPx1UUEpdJ1s5Mx
 S5Eb/tDXAlF6nBdBU86v2fenmw==
X-Google-Smtp-Source: AGHT+IFCO9OAi3+Qkz1XY3PYPDHiJLGt2Jkv4PHzp1qsbAme5ecpdXxOYr8cOAbRQwIJ7CNVwWUjOw==
X-Received: by 2002:a17:90b:1e0f:b0:281:691:e58c with SMTP id
 pg15-20020a17090b1e0f00b002810691e58cmr831673pjb.37.1700257863532; 
 Fri, 17 Nov 2023 13:51:03 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:7ed:b095:f0ba:5801])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a17090aca0700b00256b67208b1sm3639587pjt.56.2023.11.17.13.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 13:51:03 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 2/3] drm/panel-edp: Add auo_b116xa3_mode
Date: Fri, 17 Nov 2023 13:46:33 -0800
Message-ID: <20231117215056.1883314-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
In-Reply-To: <20231117215056.1883314-1-hsinyi@chromium.org>
References: <20231117215056.1883314-1-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add auo_b116xa3_mode to override the original modes parsed from edid
of the panels 0x405c B116XAK01.0 and 0x615c B116XAN06.1 which result
in glitches on panel.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v6->v7: split usecase to another patch.
---
 drivers/gpu/drm/panel/panel-edp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 33535f6de343..3e144145a6bd 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -983,6 +983,19 @@ static const struct panel_desc auo_b101ean01 = {
 	},
 };
 
+static const struct drm_display_mode auo_b116xa3_mode = {
+	.clock = 70589,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 40,
+	.hsync_end = 1366 + 40 + 40,
+	.htotal = 1366 + 40 + 40 + 32,
+	.vdisplay = 768,
+	.vsync_start = 768 + 10,
+	.vsync_end = 768 + 10 + 12,
+	.vtotal = 768 + 10 + 12 + 6,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
 static const struct drm_display_mode auo_b116xak01_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -1908,9 +1921,11 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
+	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
+			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1",
+			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.43.0.rc0.421.g78406f8d94-goog

