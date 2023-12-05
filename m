Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA3805457
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 13:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4FE10E519;
	Tue,  5 Dec 2023 12:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9AA10E523
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:36:57 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6cde104293fso4310953b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701779816; x=1702384616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOvPvtu46u4UOqUjrecGBF7nnETON0pxtXhiq+u9N/g=;
 b=G1hllLl+OUkzNWmk3zc01Ozgq2VQmwGAoWoWjzjPPl52x+rN2w4+VnaL3CVV11leP5
 GkAOvLOozyrkFiVQ18yWc0Xg06is0QE/uyUji2ITXj9Rn9M6uwIMrv1k5tS7l8x1q+e9
 CgPEBAt/dgHwdjHrTD7VgIF8IS8EpTN5zYoh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701779816; x=1702384616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOvPvtu46u4UOqUjrecGBF7nnETON0pxtXhiq+u9N/g=;
 b=J9Qr6g0imqC0dl4vs9xyjvDSO1zX5GlaIL9JkkBduTkQhyLemBNNoMNEYE2afj1Uf0
 jo7PqaOk4Splo/7EaYRrYW2U9rvGjjWLQnAaUTQYGbjNu1LMh9dQ/00jK4QtQuIrJd68
 bC1bEqrZ/HClgX+z9/JGIyMbP4d/sq3aKzrb5sJHw2vsh/7laHPNF15DGiQEcQqBUa+i
 rvhoAx0SMieqmYm0e65/ctMual3l8DjWgqjxRr+vGj1QFLV8vU2ulRL4NBQ6dJDtsaLg
 4t7L3FuNFV7Zw/VmtLgkXIfcmJtlyRu3b4uHZq85IPyt6TR093ck1XINXlA181X6pQhH
 lnxQ==
X-Gm-Message-State: AOJu0YyEGz3LSwe6KXSPvpZzfts0YYOr0ayp+lBAQz7Q5Se3P+HWyF5t
 WBkZB3YEvafmaqT7RaosuLlNrlWJ2y+6S5LssN8=
X-Google-Smtp-Source: AGHT+IGen2/zadmoyP1Ym+0e626ml05xL330t/M3LHeA5G08eLiDQzA8yXdGrOiTSYtc2wy0RTsEfA==
X-Received: by 2002:aa7:88c9:0:b0:6ce:4853:beaf with SMTP id
 k9-20020aa788c9000000b006ce4853beafmr876561pff.56.1701779816519; 
 Tue, 05 Dec 2023 04:36:56 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:433d:45a7:8d2c:be0e])
 by smtp.gmail.com with ESMTPSA id
 p26-20020aa7861a000000b006ce7abe91dasm285115pfn.195.2023.12.05.04.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 04:36:56 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/4] drm/panel-edp: Add some panels with conservative timings
Date: Tue,  5 Dec 2023 20:35:37 +0800
Message-ID: <20231205203536.4.Iaa6257fcf9e7fe3ca88c50ab6e5aa3fbf55266d0@changeid>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231205123630.988663-1-treapking@chromium.org>
References: <20231205123630.988663-1-treapking@chromium.org>
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
Cc: Guenter Roeck <groeck@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These panels are used by Mediatek MT8173 Chromebooks but we can't find
the corresponding data sheets, and these panels used to work on v4.19
kernel without any specified delays.

Therefore, instead of having them use the default conservative timings,
update them with less-conservative timings from other panels of the same
vendor. The panels should still work under those timings, and we can
save some delays and suppress the warnings.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 475257fe1ddc..55e747715178 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1955,6 +1955,7 @@ static const struct panel_delay delay_200_500_e50_po2e200 = {
 static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x105c, &delay_200_500_e50, "B116XTN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x125c, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
@@ -1965,6 +1966,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
 	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
 			 &auo_b116xa3_mode),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1",
 			 &auo_b116xa3_mode),
@@ -1974,18 +1976,34 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0668, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x068f, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x06e5, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0705, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0715, &delay_200_150_e200, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0717, &delay_200_500_e50_po2e200, "NV133FHM-N42"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0731, &delay_200_500_e80, "NT116WHM-N42"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0741, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0744, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x074c, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0751, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0754, &delay_200_500_e50_po2e200, "NV116WHM-N45"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0771, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0797, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d3, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07f6, &delay_200_500_e200, "NT140FHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07f8, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0813, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0827, &delay_200_500_e50_p2e80, "NT140WHM-N44 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0843, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x08b2, &delay_200_500_e200, "NT140WHM-N49"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0848, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0849, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
@@ -1997,6 +2015,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09ad, &delay_200_500_e80, "NV116WHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09ae, &delay_200_500_e200, "NT140FHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a36, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
@@ -2007,11 +2026,14 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1138, &innolux_n116bca_ea1.delay, "N116BCA-EA1-RC4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1139, &delay_200_500_e80_d50, "N116BGE-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1141, &delay_200_500_e80_d50, "Unknown"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1145, &delay_200_500_e80_d50, "N116BCN-EB1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114a, &delay_200_500_e80_d50, "Unknown"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, "N116BCN-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1153, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1156, &delay_200_500_e80_d50, "Unknown"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
@@ -2023,6 +2045,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 
+	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x048e, &delay_200_500_e200_d10, "M116NWR6 R5"),
@@ -2031,6 +2055,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x8c4d, &delay_200_150_e200, "R140NWFM R1"),
 
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x044f, &delay_200_500_e80_d50, "Unknown"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
@@ -2038,9 +2063,15 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1118, &delay_200_500_e50, "KD116N29-30NK-A005"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0000, &delay_200_500_e200_d200, "Unknown"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x048d, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0497, &delay_200_500_e200_d200, "LP116WH7-SPB1"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x052c, &delay_200_500_e200_d200, "LP133WF2-SPL7"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0537, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x054a, &delay_200_500_e200_d200, "LP116WH8-SPC1"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0567, &delay_200_500_e200_d200, "Unknown"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &sharp_lq140m1jw46.delay, "LQ140M1JW46"),
-- 
2.43.0.rc2.451.g8631bc7472-goog

