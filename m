Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1298E7E4A09
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 21:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B259310E6AA;
	Tue,  7 Nov 2023 20:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E703510E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 20:46:21 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-581fb6f53fcso3705396eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 12:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699389981; x=1699994781;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PpHS/LBFZbf/UTq/uL6m+esGIqX7QNRVv1WgI8K7Qww=;
 b=QxtMkN3gTJSoqB09xRI4NCd9pfDByaV9/+wYq4z4d0/AB161FvHFWaghnwyb8nVqa8
 vlitV6hPKWJFA08SR3G/f6kN0AlFOsR0hyRPsmdXMe5QG4CvcCJaU9KM3GiJkcSxsjFH
 TGRzuVrKF/2Y0b3KfUX+L8bc+yOxWp5jMHIew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699389981; x=1699994781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PpHS/LBFZbf/UTq/uL6m+esGIqX7QNRVv1WgI8K7Qww=;
 b=bspQuoKKTczddARtZKnGkh+A6MlfDFkfP6wL1Iu/qD9DHVXHYTodWprmBzYMc6yr4e
 1ji1SZzKTOP6nVuha0pidJvbpawhlDf1ma0lCDkyNRsrE0Xf1N3jaE0BWst4hcX6fpoR
 73ho6gBrAcbdSwNx6+mj/lNXD8dnjj9aPxA2IvhWLsZEYTQ6rDZKh/P977PfcMbcu4un
 EpH+DDQZa4po05cuRb7NJYF9T4yS/WhrIB8su19rbld5fRxqHwfsJWwgsEoy1ngA0PpO
 WN2JFeFmDQyLg0LwZ+8jPeEW3FwiKXhrIZigH27IqC+b77mIIxS/mgYLgn6OOq1w//y3
 ap6A==
X-Gm-Message-State: AOJu0Ywv7f6UFLoQeCx5ckC3JIETxNXD/0vYFRnQnpd5cwfPs9ftO8iG
 kpGbbMlM3KltebQKs39PxRwIfg==
X-Google-Smtp-Source: AGHT+IG/myymL9GoL3WEGcL390V5Cd0FJi3fQ1GxDN08NqBDrqQlRbCsP2R41RXdxWywrx7lx90uRQ==
X-Received: by 2002:a05:6870:9597:b0:1e9:c28f:45ba with SMTP id
 k23-20020a056870959700b001e9c28f45bamr4410028oao.16.1699389981125; 
 Tue, 07 Nov 2023 12:46:21 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a630f07000000b005ab46970aaasm1750211pgl.17.2023.11.07.12.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 12:46:20 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 3/5] drm/panel-edp: drm/panel-edp: Add several generic edp
 panels
Date: Tue,  7 Nov 2023 12:41:53 -0800
Message-ID: <20231107204611.3082200-4-hsinyi@chromium.org>
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

Add a few generic edp panels used by mt8186 chromebooks.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
no change.
---
 drivers/gpu/drm/panel/panel-edp.c | 51 +++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d41d205f7f5b..599a949d74d1 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1832,6 +1832,12 @@ static const struct panel_delay delay_200_500_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_200_500_e80 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 80,
+};
+
 static const struct panel_delay delay_200_500_e80_d50 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -1851,6 +1857,19 @@ static const struct panel_delay delay_200_500_e200 = {
 	.enable = 200,
 };
 
+static const struct panel_delay delay_200_500_e200_d10 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 200,
+	.disable = 10,
+};
+
+static const struct panel_delay delay_200_150_e200 = {
+	.hpd_absent = 200,
+	.unprepare = 150,
+	.enable = 200,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.name = _name, \
@@ -1871,37 +1890,69 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x208d, &delay_200_500_e50, "B140HTN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0715, &delay_200_150_e200, "NT116WHM-N21"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0731, &delay_200_500_e80, "NT116WHM-N42"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0741, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07f6, &delay_200_500_e200, "NT140FHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x08b2, &delay_200_500_e200, "NT140WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09ae, &delay_200_500_e200, "NT140FHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1138, &innolux_n116bca_ea1.delay, "N116BCA-EA1-RC4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1139, &delay_200_500_e80_d50, "N116BGE-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1145, &delay_200_500_e80_d50, "N116BCN-EB1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, "N116BCN-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1153, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140HGA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
+
+	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
 
+	EDP_PANEL_ENTRY('I', 'V', 'O', 0x048e, &delay_200_500_e200_d10, "M116NWR6 R5"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "M133NW4J"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
+	EDP_PANEL_ENTRY('I', 'V', 'O', 0x8c4d, &delay_200_150_e200, "R140NWFM R1"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
+	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
-- 
2.42.0.869.gea05f2083d-goog

