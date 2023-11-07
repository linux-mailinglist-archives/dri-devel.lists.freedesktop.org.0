Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A54647E4A05
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 21:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB9010E6A9;
	Tue,  7 Nov 2023 20:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F93610E037
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 20:46:19 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so6242125b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 12:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699389979; x=1699994779;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfxpAYOWmleR8K355O3R14aCnteWRdFE5O9l2OhvQSo=;
 b=iILZlEqyEgXTYCFtxA0JFiYknbtBoiyxrxnCa4X+iI1ZaZN9IO+k4+TY8lR+mtEQJE
 SR96CkAHAfFhouNWlMSowyzGpsvglWEvnBy1Xu4MsZHq24qd9y4H4vut0TUuqtUa2z1r
 cborDecCxUbJISZHdFgdIIuz5Q/dJpxKtuOOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699389979; x=1699994779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfxpAYOWmleR8K355O3R14aCnteWRdFE5O9l2OhvQSo=;
 b=aei81FBUYxn9TUBIWyahpIYnvxSPp0DM+YxpFYunwNngIDMBnTQthXH+kmEDbzr4ti
 mY+nHfSJ5Dp4XBuYx5m8fwFd9zj8nck4Tu73pqysyMqxwhHirW5+2X54FRLBr2FbaCWO
 A9PDxo2nK9Z2pNDPBnTj9HwuxdXDDPipNq73j9R51Kzm0uaUnT4wB/mG20cp4XGSouPD
 7B6w69EI+cuNVWQ8FtxwyG/hGeo33SbLKSqR+Jfw09DlmdV5D+irUoWzoBVY71m4qjeq
 8V3zIS7VXzdove4kAYqNDfE8Qyk+rGEYD7j/ZnmdliSOppeh036j2pbxc8N2fZPd6ygq
 Quuw==
X-Gm-Message-State: AOJu0Yyb36ANTHE+EFpDbaooHle8fRDE+0Kpj9xga2SAy1fMPLAWCE4A
 /UZ5A3DbVZZaO2SXo2RjSa52uw==
X-Google-Smtp-Source: AGHT+IGsveKs3LwTQ3bVZb/XOA2HeSV60NxgDj9v7CvUPzNo+vvUKGEt1p5IB2LltiYD/vVyUmpTdQ==
X-Received: by 2002:a05:6a00:234f:b0:68a:5cf8:dac5 with SMTP id
 j15-20020a056a00234f00b0068a5cf8dac5mr129018pfj.22.1699389978852; 
 Tue, 07 Nov 2023 12:46:18 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a630f07000000b005ab46970aaasm1750211pgl.17.2023.11.07.12.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 12:46:18 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 1/5] drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name
 and timing
Date: Tue,  7 Nov 2023 12:41:51 -0800
Message-ID: <20231107204611.3082200-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231107204611.3082200-1-hsinyi@chromium.org>
References: <20231107204611.3082200-1-hsinyi@chromium.org>
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

Rename AUO 0x405c B116XAK01 to B116XAK01.0 and adjust the timing of
auo_b116xak01: T3=200, T12=500, T7_max = 50 according to decoding edid
and datasheet.

Fixes: da458286a5e2 ("drm/panel: Add support for AUO B116XAK01 panel")
Cc: stable@vger.kernel.org
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v5->v6: split to 2 patches.
---
 drivers/gpu/drm/panel/panel-edp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9dce4c702414..2fba7c1f49ce 100644
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
 
@@ -1870,7 +1872,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.42.0.869.gea05f2083d-goog

