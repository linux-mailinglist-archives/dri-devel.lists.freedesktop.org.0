Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155DACCDB6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 21:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D19710E0D9;
	Tue,  3 Jun 2025 19:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="he2m68um";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C5810E60D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:42:02 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-60bd30dd387so3016916eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748979721; x=1749584521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIVqz2dRGfkeXaVkRfMlKjXlMd9pJR9pSIQQIKcgCz8=;
 b=he2m68ume07IDa+esu1grk9gINbszSne5lRs2AVRYYXKtUmlmAxWDkCy3AA1aNyNGe
 8JmhNKIcZNwXMqmSX5ZYlY8UJXL6YAfAH8Olm1b+aW3vydH4Vc1Eu7uwe6r/T2Ct8qSK
 MpanSaG2mPD+Fb4lhPHAy39CBskpl0pZG9ZoSJpDJyP54FV80CTaVBYWOtBZKijOkE9X
 ozo6FQF/PeXI5BfdO1yUtnmoru+faZTjbTh+TMiFnVyvuxmOfQoC1lbGQzJPekhCl6fW
 QcPiWNnfxxYtk0OGcIjvigQWkGhUPlZrhNlEiYOuGPQzil+CLZ4ttVk7VVkDYvbJCBOM
 CDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748979721; x=1749584521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIVqz2dRGfkeXaVkRfMlKjXlMd9pJR9pSIQQIKcgCz8=;
 b=sYfNH9dcG7Xy3Xokfh1xMDOXRRwfTUqw8IYM2Y+wii2sJk8AsW3Yj+kMup2qBTn4oP
 dSOm49NqykvH1Asa2Y8O8rwHZfPgDDf8Qf0/yDOtFb+qrk5kS8OC1oNp1MfW4kpbNpBC
 sTfHRXou8GDNyfksPJY2HzVPCNBfjjZl/qSullQMAW/Tp1i5suUD846yu37J7fS4k5sr
 bMQPoAL93mwQbastBZ5Swuy9+zvpildqsd/xJykNIOvvBRp/ecvfGntYBUYuuW5cWV1L
 ErPPG/yThOMXpD/nQuCmpivgyRPthaFROGalKeciMV/AhhfOSxZMXmvyPLPFuQVVZrzc
 tYxw==
X-Gm-Message-State: AOJu0YxhOeopIm7uO8xnKpGNRYa8a+Lk9HuW/PoW0BmMJC9WoPIV55/z
 EswtAk/Nv//DdlDjbF5eAZNGf+4nEHcbIqL/zrntdpLvekq4+WBRj5YbbdS/yQ==
X-Gm-Gg: ASbGncv+yFiPc1Pr0WVmkJy/ZVtsHciztpO9YiPHadD3mxsbZcA+uXBTb1kQJdEVMQb
 rHZTgL3QNRDOEKSgOqtckKuUb04YOaR1AfVZKA/yjIi5ru5kX0EM8+nK0PhBn3rEfAtMPiX9wf5
 0Kh8httYqzAxTOcprFnzgQwltDFWJAlMSrvUYToUxgqEojhYAx9pHp6ZbxOGVjiAXyCHrkiczUQ
 0+m7BGjmdboza61VoaTErf+J1WTOn3IHJrVK+of0ubP0R1I0Jaqnx548y31X+Fh9cjPnsx46VoR
 Rl19om6Kk5EYFw76vVIMxoOLfDqAmh8YeZR0miZE0WyHs81j2e30UbtHY7EMzGkukjKySmo=
X-Google-Smtp-Source: AGHT+IEPHZuFkTYXQCTkJo5Ym0ylfV4pxcvfbfHQSSmEIozDMoZD4JWFzvzgmrQ3ty+jtqiGY0g7Aw==
X-Received: by 2002:a05:6820:2901:b0:60e:e75c:5ef2 with SMTP id
 006d021491bc7-60ee75c6b78mr6812635eaf.7.1748979721192; 
 Tue, 03 Jun 2025 12:42:01 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d19a:d10c:4358:1346])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-60c14c88f96sm1967615eaf.17.2025.06.03.12.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 12:42:00 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 javierm@redhat.com, megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/4] drm/panel: himax-hx8394: Add Support for Huiling
 hl055fhav028c
Date: Tue,  3 Jun 2025 14:39:29 -0500
Message-ID: <20250603193930.323607-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603193930.323607-1-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Huiling hl055fhav028c panel as used on the
Gameforce Ace handheld gaming console. This panel uses a Himax HX8399C
display controller and requires a sparsely documented vendor provided
init sequence. The display resolution is 1080x1920 and is 70mm by 127mm
as stated in the manufacturer's documentation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 142 +++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index ff994bf0e3cc..16e450b156b7 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -477,6 +477,147 @@ static const struct hx8394_panel_desc mchp_ac40t08a_desc = {
 	.init_sequence = mchp_ac40t08a_init_sequence,
 };
 
+/*
+ * HL055FHAV028C is based on Himax HX8399, so datasheet pages are
+ * slightly different than HX8394 based panels.
+ */
+static void hl055fhav028c_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	/* 6.3.6 SETEXTC: Set extension command (B9h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x99);
+
+	/* 6.3.17 SETOFFSET: Set offset voltage (D2h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETOFFSET,
+				     0x77);
+
+	/* 6.3.1 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x02, 0x04, 0x74, 0x94, 0x01, 0x32,
+				     0x33, 0x11, 0x11, 0xab, 0x4d, 0x56,
+				     0x73, 0x02, 0x02);
+
+	/* 6.3.2 SETDISP: Set display related register (B2h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x80, 0xae, 0x05, 0x07,
+				     0x5a, 0x11, 0x00, 0x00, 0x10, 0x1e,
+				     0x70, 0x03, 0xd4);
+
+	/* 6.3.3 SETCYC: Set display waveform cycles (B4h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x00, 0xff, 0x02, 0xc0, 0x02, 0xc0,
+				     0x00, 0x00, 0x08, 0x00, 0x04, 0x06,
+				     0x00, 0x32, 0x04, 0x0a, 0x08, 0x21,
+				     0x03, 0x01, 0x00, 0x0f, 0xb8, 0x8b,
+				     0x02, 0xc0, 0x02, 0xc0, 0x00, 0x00,
+				     0x08, 0x00, 0x04, 0x06, 0x00, 0x32,
+				     0x04, 0x0a, 0x08, 0x01, 0x00, 0x0f,
+				     0xb8, 0x01);
+
+	/* 6.3.18 SETGIP0: Set GIP Option0 (D3h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x06, 0x00, 0x00, 0x10, 0x04, 0x00,
+				     0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
+				     0x00, 0x05, 0x05, 0x07, 0x00, 0x00,
+				     0x00, 0x05, 0x40);
+
+	/* 6.3.19 Set GIP Option1 (D5h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
+				     0x21, 0x20, 0x01, 0x00, 0x07, 0x06,
+				     0x05, 0x04, 0x03, 0x02, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x2f, 0x2f,
+				     0x30, 0x30, 0x31, 0x31, 0x18, 0x18,
+				     0x18, 0x18);
+
+	/* 6.3.20 Set GIP Option2 (D6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x18, 0x18, 0x19, 0x19, 0x40, 0x40,
+				     0x20, 0x21, 0x02, 0x03, 0x04, 0x05,
+				     0x06, 0x07, 0x00, 0x01, 0x40, 0x40,
+				     0x40, 0x40, 0x40, 0x40, 0x2f, 0x2f,
+				     0x30, 0x30, 0x31, 0x31, 0x40, 0x40,
+				     0x40, 0x40);
+
+	/* 6.3.21 Set GIP Option3 (D8h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
+				     0xa2, 0xaa, 0x02, 0xa0, 0xa2, 0xa8,
+				     0x02, 0xa0, 0xb0, 0x00, 0x00, 0x00,
+				     0xb0, 0x00, 0x00, 0x00);
+
+	/* 6.3.9 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
+
+	/* 6.3.21 Set GIP Option3 (D8h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
+				     0xb0, 0x00, 0x00, 0x00, 0xb0, 0x00,
+				     0x00, 0x00, 0xe2, 0xaa, 0x03, 0xf0,
+				     0xe2, 0xaa, 0x03, 0xf0);
+
+	/* 6.3.9 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x02);
+
+	/* 6.3.21 Set GIP Option3 (D8h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
+				     0xe2, 0xaa, 0x03, 0xf0, 0xe2, 0xaa,
+				     0x03, 0xf0);
+
+	/* 6.3.9 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
+
+	/* 6.3.4 SETVCOM: Set VCOM voltage (B6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x7a, 0x7a);
+
+	/* 6.3.26 SETGAMMA: Set gamma curve related setting (E0h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x00, 0x18, 0x27, 0x24, 0x5a, 0x68,
+				     0x79, 0x78, 0x81, 0x8a, 0x92, 0x99,
+				     0x9e, 0xa7, 0xaf, 0xb4, 0xb9, 0xc3,
+				     0xc7, 0xd1, 0xc6, 0xd4, 0xd5, 0x6c,
+				     0x67, 0x71, 0x77, 0x00, 0x00, 0x18,
+				     0x27, 0x24, 0x5a, 0x68, 0x79, 0x78,
+				     0x81, 0x8a, 0x92, 0x99, 0x9e, 0xa7,
+				     0xaf, 0xb4, 0xb9, 0xc3, 0xc7, 0xd1,
+				     0xc6, 0xd4, 0xd5, 0x6c, 0x67, 0x77);
+
+	/* Unknown command, not listed in the HX8399-C datasheet (C6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN2,
+				     0xff, 0xf9);
+
+	/* 6.3.16 SETPANEL (CCh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x08);
+}
+
+static const struct drm_display_mode hl055fhav028c_mode = {
+	.hdisplay	= 1080,
+	.hsync_start	= 1080 + 32,
+	.hsync_end	= 1080 + 32 + 8,
+	.htotal		= 1080 + 32 + 8 + 32,
+	.vdisplay	= 1920,
+	.vsync_start	= 1920 + 16,
+	.vsync_end	= 1920 + 16 + 2,
+	.vtotal		= 1920 + 16 + 2 + 14,
+	.clock		= 134920,
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm	= 70,
+	.height_mm	= 127,
+};
+
+static const struct hx8394_panel_desc hl055fhav028c_desc = {
+	.mode = &hl055fhav028c_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = hl055fhav028c_init_sequence,
+};
+
 static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
@@ -683,6 +824,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
 
 static const struct of_device_id hx8394_of_match[] = {
 	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
+	{ .compatible = "huiling,hl055fhav028c", .data = &hl055fhav028c_desc },
 	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
 	{ .compatible = "microchip,ac40t08a-mipi-panel", .data = &mchp_ac40t08a_desc },
 	{ /* sentinel */ }
-- 
2.43.0

