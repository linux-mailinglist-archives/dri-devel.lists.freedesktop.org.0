Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FB7E31CC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A7210E470;
	Tue,  7 Nov 2023 00:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3AA10E46D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:00:30 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-28094a3b760so4783359a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699315230; x=1699920030;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdzwYBIp8oE+FGXK79RX2ZgMcbwotMlBVaAFWxWkmk4=;
 b=cM0XcH4ZX5UTDRm8EOGVjSMeZXiIeHyjvNDWJkabCN/IOJLX285gahmB+mj8hJ+Eqs
 YyBG/cWMUPysYs88kyiqbGKOpbOt6hYMLRxDADlEoXHpGrhy9xLRipxtLiSHordUo78s
 fcUDo2NtMLtGhAINxB60brOhY2ITrd6/uZmw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315230; x=1699920030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdzwYBIp8oE+FGXK79RX2ZgMcbwotMlBVaAFWxWkmk4=;
 b=CHr8S6YhVhD55yBTCauHiyzeIzNZ1vKZ9Jrw1bfapzQWc5XXCvAERRAiboWb98u3LJ
 Y8Qkb2RB7nwySAs+74N5XiAf0J8wanQm1XZEzqT1feU8dZlr1dFrhPr6JZjtpBw7dcul
 Zcdr3To5w0gfqbqsvBmG/4YVPpXPz75our3pTPnxGdvcDDwYdkjXT2WvDKgGLxCaKmxZ
 Krc1RYzTw5ApQL+oX452QYkvTZAAjy15WNlhIpTBUiwad0lkF9O9A9AviI+Ni1cHrZro
 m4a4ikzWA244Ej+aBCkwNMXexsskKeV9hxefPPvjnWCL3nyOjKYZ4LkJMg1NXvrCH+pZ
 BbPA==
X-Gm-Message-State: AOJu0YxJ5/b6iuXSES/YoQFURSfgvxHOawwFHyECxfNuOkoy5ysbKjty
 kkObP05C1Bn84iu9OFQ7/AP6pw==
X-Google-Smtp-Source: AGHT+IGzUaRjR1xfzqURuaVGH3yiuFXLHvoIPG6NQb7hsf2OOZ1zGUrQiOB43Utv8HEaOorrvEYc/g==
X-Received: by 2002:a17:90b:e14:b0:27e:31a:2ab2 with SMTP id
 ge20-20020a17090b0e1400b0027e031a2ab2mr24488613pjb.34.1699315229679; 
 Mon, 06 Nov 2023 16:00:29 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 fw11-20020a17090b128b00b00268b439a0cbsm5852866pjb.23.2023.11.06.16.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:00:29 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 1/4] drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02,
 B116XAK01 name and timing
Date: Mon,  6 Nov 2023 15:51:32 -0800
Message-ID: <20231107000023.2928195-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231107000023.2928195-1-hsinyi@chromium.org>
References: <20231107000023.2928195-1-hsinyi@chromium.org>
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

According to decoding edid and datahseet:
- Rename AUO 0x235c B116XTN02 to B116XTN02.3
- Rename AUO 0x405c B116XAK01 to B116XAK01.0 and adjust the timing of
auo_b116xak01: T3=200, T12=500, T7_max = 50.

Fixes: 3db2420422a5 ("drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49 V8.0")
Fixes: da458286a5e2 ("drm/panel: Add support for AUO B116XAK01 panel")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v4->v5: separate fixes patch.
---
 drivers/gpu/drm/panel/panel-edp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9dce4c702414..d41d205f7f5b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -973,6 +973,8 @@ static const struct panel_desc auo_b116xak01 = {
 	},
 	.delay = {
 		.hpd_absent = 200,
+		.unprepare = 500,
+		.enable = 50,
 	},
 };
 
@@ -1869,8 +1871,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.42.0.869.gea05f2083d-goog

