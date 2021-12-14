Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B6473E2C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A33510EA1F;
	Tue, 14 Dec 2021 08:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B652E10ECD4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 05:56:25 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so15200696pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 21:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnf8UtW8tsAfiGnrGPH8Vt1nRLJSdbFwyWGFRJOTFBI=;
 b=idUjUUvLEWzkxGzVa7HFgvQWWbjMBMwqDk1r+tiXmQ1EpEgQ04dBTCcLH8o/sepoIz
 WU0pvY+Jh0HuDwLnHFdMZbTfAFPlhrKcWVnWR/z74QiCeLglEdvRTIqa/nEAvv9YGhtX
 zr3VAQWX4k9jCmloeThvubrkg3z8xaY0I0MO4cMGgnj0GAq5C2cJ/N/BDELxnvcpCMIG
 FVNXPMZpM+ve9wMqRpA8vQdxFI0KNTBnAqrM2wGZid4SDCNyAudilaDB5kFH6h9cJIRa
 tW0P5h/ejY6IbAZqWXqUKD02iQu7CxTJo/SOvY1eeXOg2vsvIk4PrmCdgBltiqeBVMK7
 yhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnf8UtW8tsAfiGnrGPH8Vt1nRLJSdbFwyWGFRJOTFBI=;
 b=mzL9Nd3vRNYOpQirIH6dGGR63qXvILW2bO4LydTzc8wj9nRnoABLgZIABnu6CAgdSi
 JxHMl2n/TCYLTg6fCS+49+HjiGSA+LYEeJQvFjAIUBVIxaeyWa+sJ7A2NaN4Dye04tBs
 Iddamsd1UrqfSfqBQ5fHGYa5nSqoYKKS1IMxhLd2fmZ5vD5obKRCLZ5L5xNsSq4zlEB7
 f86w3zVUjK+3JFF2Z6n9/7WC9eyGDKQvEDlRJJyXaI8ls0PKO0bf5evUYLM8aA5ehDlT
 Z9/DXlmbEjmeQQWASSfw/mM27k5JLYQuGNoasZtFlMbH0ujHroInTFC92HvHqowjj9PZ
 hSCw==
X-Gm-Message-State: AOAM5339Y0k0cW1YfItjnkJzr8BChQNEPR55JLun2vCssedlqjGsWJKh
 WGv05RbhlsJZHEaqMRYsK9Wom0uQCo6cFaOh
X-Google-Smtp-Source: ABdhPJzAE0qhBFaLX430qh4tXEn4lUvjgd1YhsiwzLEkSil29kkntkRTASUtupxr81Cw9bn6xnE5Ng==
X-Received: by 2002:a17:903:31d1:b0:141:f14b:6ebd with SMTP id
 v17-20020a17090331d100b00141f14b6ebdmr3608892ple.75.1639461385135; 
 Mon, 13 Dec 2021 21:56:25 -0800 (PST)
Received: from raven-lpc.manila.ammic.com ([130.105.10.165])
 by smtp.googlemail.com with ESMTPSA id a16sm11732884pgm.57.2021.12.13.21.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 21:56:24 -0800 (PST)
From: intersectRaven <rjgolo@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for the 1Netbook
 OneXPlayer
Date: Tue, 14 Dec 2021 13:56:08 +0800
Message-Id: <20211214055608.50223-1-rjgolo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Dec 2021 08:22:11 +0000
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
Cc: rjgolo@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Raymond Jay Golo <rjgolo@gmail.com>

The 1Netbook OneXPlayer uses a panel which has been mounted
90 degrees rotated. Add a quirk for this.

Signed-off-by: Raymond Jay Golo <rjgolo@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index a950d5db211c..2f20f8825619 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -115,6 +115,12 @@ static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_up = {
+	.width = 1600,
+	.height = 2560,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct dmi_system_id orientation_data[] = {
 	{	/* Acer One 10 (S1003) */
 		.matches = {
@@ -255,6 +261,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
 		},
 		.driver_data = (void *)&onegx1_pro,
+	}, {	/* OneXPlayer */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
 	}, {	/* Samsung GalaxyBook 10.6 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-- 
2.34.1

