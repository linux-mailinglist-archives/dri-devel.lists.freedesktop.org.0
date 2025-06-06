Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E2AD14D1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E920C10EC9F;
	Sun,  8 Jun 2025 21:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I67zRuUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65A010E306
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 11:46:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so1749126f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749210408; x=1749815208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MgYf6F6fSeBu27ICRv37PYa/jAKP+hUr2B7udbzNrM=;
 b=I67zRuUYfOMACNPuWxHMjkKORK8zpmXuI+D5p1NSOwpfUr4tnnpQkHnoA6AObbgEmW
 /kWlr+++CncUjYPP4ro5Cbq6zCk/hV6z4Wr+x34ZX/6+saPOrQuXwXLwcF/ZnqqnC684
 RLMjb6NoqReOj3DD+sOKLfVo1Q7r8I1OoCWdH/ZOnL0VaMi5ynsZ0oGblPgkdt4dxsPW
 2LIexDABM6CqT0ZjH8A3pkkrUZGErH2PV585G4m0Rw9TUef2nmjRYpUiMAfXAEnSKv8+
 gLWkGhX/IGmX6/qj18H91OGG1vvT3sJvFgioipeaSZIt0E+dprYfl13h2Z75puItnfyB
 D3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749210408; x=1749815208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3MgYf6F6fSeBu27ICRv37PYa/jAKP+hUr2B7udbzNrM=;
 b=pjuDtomA0O4Nor+jVf9o8zoQKP4iOrF2l0iTmlJcz2f53ta9MH1i4I/YzorYb0YONP
 ZkBjZsa0wjRdGunNfqFI/IOW/I7q5VImlof4rmX0Qq75DKrEjO6pnbjCuUIUk+9pbc8a
 h3Z4GmoFS3NNt6GwDd3s2lpljHQUYC/OGsoJ8Qpns6/3wLX9MMXyTverv9AL+vF0HINy
 yhUl84yDsaYD90/dc0ntyF16RV7r/5iFQeqvxnhdH3in5QJe0juh054sf1tuQrbEUSfq
 PnwnfOvRoSmDu1ODKMK+6zatRcTDVuucAfGOh/URbPV1mfE0BXNzOXW6EWHIfCp8tjqs
 o5Ng==
X-Gm-Message-State: AOJu0YyB+KBiHT7Rveunk2dRe+atx1Iy5nmwepjmeDtFypEKY4NRogLp
 ij4LlDOSe8HywMHgSte3TsIeWO7sfSisByFJs8iVxA1jy6jNdPoELYTr
X-Gm-Gg: ASbGncsVaRp351vx8kQLqe9tQ19NcFbKM4xOd+vbxwi5wMpsaUNHmQPO7UiZ8PssD+X
 QYv5b01xxHk/1pNg91AJwiyTxvI6CdkzY21Wp+i5jxfVFg+9Zxd80bEfL6ILXAerc9WglfCc+9s
 amZBojHzIMAzI1n4q0fKSbQI4pAuP2pRP9Cf+whEGJMbBQc+cp6jBwsKrKLx8z5sAK6zxW/vTFy
 24NNS2/0EmZNQ6D5ZruyU1Po/2Dh6oD7pacbwp3UkYONXFA6du2hfL0CVE61/kMvFjgUHPDvxbN
 yfgSCFTEoB4iHZVwpl9RxJhExM6EAmz/HPNVpOkYTFHNbbEfiMpv8NmTaM9yhaUk4BU=
X-Google-Smtp-Source: AGHT+IGJaCJqb8KgeLF+rp7LU0psHMN4qsWCIeq3F4/Z7k4HlVzv4f/iLX3p/I7NH5Akoj/6fgTWEQ==
X-Received: by 2002:a5d:6a90:0:b0:3a4:e667:9242 with SMTP id
 ffacd0b85a97d-3a53188da6bmr2153482f8f.3.1749210407660; 
 Fri, 06 Jun 2025 04:46:47 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:4223:e58c:4c9a:459b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532464e7fsm1630480f8f.96.2025.06.06.04.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 04:46:46 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: jagan@amarulasolutions.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel
 support
Date: Fri,  6 Jun 2025 13:45:50 +0200
Message-ID: <20250606114644.105371-2-eichest@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606114644.105371-1-eichest@gmail.com>
References: <20250606114644.105371-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Winstar wf40eswaa6mnn0 panel is a square 4.0" TFT LCD with a
resolution of 480x480 pixels.

This panel is driven by the Sitronix ST7701 controller and uses a MIPI
DSI interface. The settings are based on the panel's datasheet and the
init sequence provided by Winstar.

It was tested on a Verdin iMX8MP from Toradex with a Carrier Board
providing a MIPI DSI interface.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 1f72ef7ca74c9..cf42281393dd9 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -520,6 +520,28 @@ static void rg28xx_gip_sequence(struct st7701 *st7701)
 	st7701_switch_cmd_bkx(st7701, false, 0);
 }
 
+static void wf40eswaa6mnn0_gip_sequence(struct st7701 *st7701)
+{
+	ST7701_WRITE(st7701, 0xE0, 0x00, 0x28, 0x02);
+	ST7701_WRITE(st7701, 0xE1, 0x08, 0xA0, 0x00, 0x00, 0x07, 0xA0, 0x00,
+		   0x00, 0x00, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE2, 0x11, 0x11, 0x44, 0x44, 0xED, 0xA0, 0x00,
+		   0x00, 0xEC, 0xA0, 0x00, 0x00);
+	ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x11, 0x11);
+	ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE5, 0x0A, 0xE9, 0xD8, 0xA0, 0x0C, 0xEB, 0xD8,
+		   0xA0, 0x0E, 0xED, 0xD8, 0xA0, 0x10, 0xEF, 0xD8, 0xA0);
+	ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x11, 0x11);
+	ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE8, 0x09, 0xE8, 0xD8, 0xA0, 0x0B, 0xEA, 0xD8,
+		   0xA0, 0x0D, 0xEC, 0xD8, 0xA0, 0x0F, 0xEE, 0xD8, 0xA0);
+	ST7701_WRITE(st7701, 0xEB, 0x00, 0x00, 0xE4, 0xE4, 0x88, 0x00, 0x40);
+	ST7701_WRITE(st7701, 0xEC, 0x3C, 0x00);
+	ST7701_WRITE(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x02, 0xFF, 0xFF,
+		   0xFF, 0xFF, 0xFF, 0xFF, 0x20, 0x45, 0x67, 0x98, 0xBA);
+	ST7701_WRITE(st7701, MIPI_DCS_SET_ADDRESS_MODE, 0);
+}
+
 static int st7701_prepare(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
@@ -1135,6 +1157,107 @@ static const struct st7701_panel_desc rg28xx_desc = {
 	.gip_sequence = rg28xx_gip_sequence,
 };
 
+static const struct drm_display_mode wf40eswaa6mnn0_mode = {
+	.clock		= 18306,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 2,
+	.hsync_end	= 480 + 2 + 45,
+	.htotal		= 480 + 2 + 45  + 13,
+
+	.vdisplay	= 480,
+	.vsync_start	= 480 + 2,
+	.vsync_end	= 480 + 2 + 70,
+	.vtotal		= 480 + 2 + 70 + 13,
+
+	.width_mm	= 72,
+	.height_mm	= 70,
+
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc wf40eswaa6mnn0_desc = {
+	.mode = &wf40eswaa6mnn0_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.panel_sleep_delay = 0,
+
+	.pv_gamma = {
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC0_MASK, 0x1),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x08),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x10),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0c),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x08),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x10),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x0c),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x08),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x22),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x04),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0x14),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x12),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0xb3),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x3a),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x13),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x19),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x1f),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0f),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x14),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x07),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x07),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x08),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x07),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x22),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x02),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0xf),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x0f),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0xa3),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x0d)
+	},
+	.nlinv = 3,
+	.vop_uv = 4737500,
+	.vcom_uv = 662500,
+	.vgh_mv = 15000,
+	.vgl_mv = -10170,
+	.avdd_mv = 6600,
+	.avcl_mv = -4600,
+	.gamma_op_bias = OP_BIAS_MIDDLE,
+	.input_op_bias = OP_BIAS_MIDDLE,
+	.output_op_bias = OP_BIAS_MIN,
+	.t2d_ns = 1600,
+	.t3d_ns = 10400,
+	.eot_en = true,
+	.gip_sequence = wf40eswaa6mnn0_gip_sequence,
+};
+
 static void st7701_cleanup(void *data)
 {
 	struct st7701 *st7701 = (struct st7701 *)data;
@@ -1265,6 +1388,7 @@ static const struct of_device_id st7701_dsi_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
+	{ .compatible = "winstar,wf40eswaa6mnn0", .data = &wf40eswaa6mnn0_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
-- 
2.48.1

