Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55B81FFCD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 14:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFB810E0BD;
	Fri, 29 Dec 2023 13:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007F610E0BD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 13:52:30 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ccebd0377fso9287301fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857949; x=1704462749;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I04AycXU2gthDovU4fhTPLpGwaRhcBOoWll3dN0DmSw=;
 b=ljzmW+dnhFRZEQXN3IMI0ODFjzqFKy8aYXg0QggCH9fAvEayCNfpubPlnCj46XFagb
 LePqncZSUM4Tdf4riC7nsLnfGF4OvDaAkJwSO1xwT+Lbqas7jfCzdOWQszOkoDAVvCBz
 RTsrvCWI4uWGr5qJkvsfTQdKPkoYeZLAppOSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857949; x=1704462749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I04AycXU2gthDovU4fhTPLpGwaRhcBOoWll3dN0DmSw=;
 b=JPoAg4Mlw2HdK7vVN90JwDxZfbo5nw9+GSesAyXIiCBTys3xFA6waBXbD3ziKPsVFJ
 jESWt3t4592YYTSt+0cjPC+8ivPxMEG170b381sphX7weURsVV8khX29ZHgjpewTDQCn
 lW/Xw+/1u7h3eHVMMSeSmCbyva1lv4ZnrbYqiNY7Sb+S+nKQ0aVPT6XKQiziUYcwdnF4
 p0fdQUB0vegwfkgKJ0RawTFm4RbJZ75NleAg0H4Eo4MvthqiQGvLRPXLfhc0aRWSNBzH
 jRaEDTu9C4McEzUZPKARP6peccuNUPVTg6o0BLfSEUDSLHIOj9bdj1we+XVhn0Pf2bP/
 tyfg==
X-Gm-Message-State: AOJu0YxEfFMfonikzPPU9C6rehnp4OG0lkrrntbIgN9vwL2jUpas8pM8
 /sdNJ/iBF840tkcQpKZl7LipfazzyP2MIw==
X-Google-Smtp-Source: AGHT+IHOtc5IkKmhCbd0Ze1jDDKCs0xUxs7gN1zGo15FKjOCb36qByeeIpxGR4YJYMTK8KBp1srJgg==
X-Received: by 2002:a2e:3c19:0:b0:2cc:df53:5309 with SMTP id
 j25-20020a2e3c19000000b002ccdf535309mr798204lja.91.1703857949279; 
 Fri, 29 Dec 2023 05:52:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
Date: Fri, 29 Dec 2023 14:51:23 +0100
Message-ID: <20231229135154.675946-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initialization commands are taken from the STMicroelectronics driver
found at https://github.com/STMicroelectronics/STM32CubeF7/blob/master/Drivers/BSP/Components/nt35510/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 2a5a624fe447..3cdcc75c4c76 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Novatek NT35510 panel driver
+ * Copyright (C) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Add support to Frida FRD400B25025-A-CTK panel.
+ * Based on code by MCD Application Team (C) 2020 STMicroelectronics
  * Copyright (C) 2020 Linus Walleij <linus.walleij@linaro.org>
  * Based on code by Robert Teather (C) 2012 Samsung
  *
@@ -165,6 +168,49 @@ static const struct panel_init_cmd hydis_hva40wv1_init_cmds[] = {
 	{},
 };
 
+static const struct panel_init_cmd frida_frd400b25025_init_cmds[] = {
+	_INIT_DCS_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x01),
+	_INIT_DCS_CMD(0xB0, 0x03, 0x03, 0x03),
+	_INIT_DCS_CMD(0xB6, 0x46, 0x46, 0x46),
+	_INIT_DCS_CMD(0xB1, 0x03, 0x03, 0x03),
+	_INIT_DCS_CMD(0xB7, 0x36, 0x36, 0x36),
+	_INIT_DCS_CMD(0xB2, 0x00, 0x00, 0x02),
+	_INIT_DCS_CMD(0xB8, 0x26, 0x26, 0x26),
+	_INIT_DCS_CMD(0xBF, 0x01),
+	_INIT_DCS_CMD(0xB3, 0x09, 0x09, 0x09),
+	_INIT_DCS_CMD(0xB9, 0x36, 0x36, 0x36),
+	_INIT_DCS_CMD(0xB5, 0x08, 0x08, 0x08),
+	_INIT_DCS_CMD(0xBA, 0x26, 0x26, 0x26),
+	_INIT_DCS_CMD(0xBC, 0x00, 0x80, 0x00),
+	_INIT_DCS_CMD(0xBD, 0x00, 0x80, 0x00),
+	_INIT_DCS_CMD(0xBE, 0x00, 0x50),
+	_INIT_DCS_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x00),
+	_INIT_DCS_CMD(0xB1, 0xFC, 0x00),
+	_INIT_DCS_CMD(0xB6, 0x03),
+	_INIT_DCS_CMD(0xB5, 0x50),
+	_INIT_DCS_CMD(0xB7, 0x00, 0x00),
+	_INIT_DCS_CMD(0xB8, 0x01, 0x02, 0x02, 0x02),
+	_INIT_DCS_CMD(0xBC, 0x00, 0x00, 0x00),
+	_INIT_DCS_CMD(0xCC, 0x03, 0x00, 0x00),
+	_INIT_DCS_CMD(0xBA, 0x01),
+	_INIT_DCS_CMD(0x35, 0x00),
+	_INIT_DCS_CMD(0x3A, 0x77),
+	_INIT_DELAY_CMD(0xC8),
+	_INIT_DCS_CMD(0x36, 0x00),
+	_INIT_DCS_CMD(0x2A, 0x00, 0x00, 0x01, 0xDF),
+	_INIT_DCS_CMD(0x2B, 0x00, 0x00, 0x03, 0x1F),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(0x78),
+	_INIT_DCS_CMD(0x3A, 0x77),
+	_INIT_DCS_CMD(0x51, 0x7F, 0x00),
+	_INIT_DCS_CMD(0x53, 0x2C),
+	_INIT_DCS_CMD(0x55, 0x02),
+	_INIT_DCS_CMD(0x5E, 0xFF),
+	_INIT_DCS_CMD(0x29),
+	_INIT_DCS_CMD(0x2C),
+	{},
+};
+
 /**
  * struct nt35510 - state container for the NT35510 panel
  */
@@ -606,7 +652,36 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 	.init_cmds = hydis_hva40wv1_init_cmds,
 };
 
+/*
+ * The Frida FRD400B25025-A-CTK panel
+ */
+static const struct nt35510_config nt35510_frida_frd400b25025 = {
+	.width_mm = 52,
+	.height_mm = 86,
+	.mode = {
+		.clock = 23000,
+		.hdisplay = 480,
+		.hsync_start = 480 + 34, /* HFP = 34 */
+		.hsync_end = 480 + 34 + 2, /* HSync = 2 */
+		.htotal = 480 + 34 + 2 + 34, /* HBP = 34 */
+		.vdisplay = 800,
+		.vsync_start = 800 + 15, /* VFP = 15 */
+		.vsync_end = 800 + 15 + 12, /* VSync = 12 */
+		.vtotal = 800 + 15 + 12 + 15, /* VBP = 15 */
+		.flags = 0,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			MIPI_DSI_MODE_LPM,
+	.init_cmds = frida_frd400b25025_init_cmds,
+};
+
 static const struct of_device_id nt35510_of_match[] = {
+	{
+		.compatible = "frida,frd400b25025",
+		.data = &nt35510_frida_frd400b25025,
+	},
 	{
 		.compatible = "hydis,hva40wv1",
 		.data = &nt35510_hydis_hva40wv1,
-- 
2.43.0

