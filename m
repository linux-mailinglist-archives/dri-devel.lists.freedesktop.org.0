Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A33694B5D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50C10E061;
	Mon, 13 Feb 2023 15:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C410E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 15:38:30 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id lf10so1015226ejc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 07:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9M5VRC01DAZPfI0s5I19MARMALNHk/O6/g2Mh8se6M=;
 b=qkMhLPhzCZRP+Kg8axvET9mrQ237GB/fcdTwnPTNJN4EA6Fr3uLo0nY646HWldsNT4
 WXqk7xo+zqsTd3X9Oai9oDgtK9joKgh3E11UvqB4dnFcGiNTvRo7VH1t11+WYNw8RmYk
 v94I8VoF+u4CZBag1ftBsrZHGCDZ1yGAKfe0VP20LdABlipG17eaZmp7rbF3Zjn7+gkW
 A3YNMFRtV7f7L4Rjm1MqMDO3rjS8TXLgmBvdhEV3rHoQR+9KVKDDwjiQY8zwI5REAiFN
 IFZvhaqMrIzGng4C4pOstGicZzenNLAS+W/ZWp7JQ/u+eDDoACw1G/CcHEnpHWWr1GEp
 1FWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9M5VRC01DAZPfI0s5I19MARMALNHk/O6/g2Mh8se6M=;
 b=wS0/1xW/FT/CYXp6r1Fk2CgW0TjAUvyC56MS0wN3oHq8HUTB8sFQTNqCj6K1XwZfIW
 0gBxcnZiBUbioIpzS1DA+GJVLDYTtB2JMHebfCrXlLOZD/WW/UeAYiQUZVdPqF/eEE4E
 M2AX8yBwqPWcuh+KkW/sCl1OBl8vHZ4zDS3H5kT10hMWn7uQeOlHVhySzUM5LR6/qaEJ
 1+9wFJwEqzd0L/zXiolNC4nOglkURXVs1pSnSbPvOJJXNWNmuXSu9rv9M3ltSJTS1aB1
 5Cz4TaZXMBWDug2BnrSoBiNyLkZUAT3Npo7IbrMzlsuwhohYRBK7lqOnXTcG/PbJt3F6
 BOpg==
X-Gm-Message-State: AO0yUKWlba2VNsaT+bcCO1xOail64ERjLYQWgpJS3hjuhk8kYrHOzH87
 ZpG5Yg39tR3MhX4nIcGn9uw=
X-Google-Smtp-Source: AK7set+0pvPDwSKeSvc4z5iKWPYmf8jb9T8DhubJY/8Y5VbUp9JLiMw2FgmaOcmpf6bdBIPMuY9TdA==
X-Received: by 2002:a17:906:f74b:b0:8b1:22af:b39f with SMTP id
 jp11-20020a170906f74b00b008b122afb39fmr613157ejb.13.1676302708753; 
 Mon, 13 Feb 2023 07:38:28 -0800 (PST)
Received: from localhost.localdomain (83.24.145.108.ipv4.supernova.orange.pl.
 [83.24.145.108]) by smtp.gmail.com with ESMTPSA id
 gf17-20020a170906e21100b008b12614ee06sm115901ejb.161.2023.02.13.07.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 07:38:28 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: heiko@sntech.de, Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/4] drm: panel: Add Elida KD50T048A to Sitronix ST7701
 driver
Date: Mon, 13 Feb 2023 16:38:14 +0100
Message-Id: <20230213153816.213526-3-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213153816.213526-1-maccraft123mc@gmail.com>
References: <20230213153816.213526-1-maccraft123mc@gmail.com>
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add KD50T048A MIPI-DSI panel, which is based on ST7701 chip.
Not sure what else to add to this commit message.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 0b8cf65172ff..660c3f435008 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -397,6 +397,31 @@ static void dmt028vghmcmi_1a_gip_sequence(struct st7701 *st7701)
 	ST7701_DSI(st7701, 0x3A, 0x70);
 }
 
+static void kd50t048a_gip_sequence(struct st7701 *st7701)
+{
+	/**
+	 * ST7701_SPEC_V1.2 is unable to provide enough information above this
+	 * specific command sequence, so grab the same from vendor BSP driver.
+	 */
+	ST7701_DSI(st7701, 0xE0, 0x00, 0x00, 0x02);
+	ST7701_DSI(st7701, 0xE1, 0x08, 0x00, 0x0A, 0x00, 0x07, 0x00, 0x09,
+		   0x00, 0x00, 0x33, 0x33);
+	ST7701_DSI(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xE3, 0x00, 0x00, 0x33, 0x33);
+	ST7701_DSI(st7701, 0xE4, 0x44, 0x44);
+	ST7701_DSI(st7701, 0xE5, 0x0E, 0x60, 0xA0, 0xA0, 0x10, 0x60, 0xA0,
+		   0xA0, 0x0A, 0x60, 0xA0, 0xA0, 0x0C, 0x60, 0xA0, 0xA0);
+	ST7701_DSI(st7701, 0xE6, 0x00, 0x00, 0x33, 0x33);
+	ST7701_DSI(st7701, 0xE7, 0x44, 0x44);
+	ST7701_DSI(st7701, 0xE8, 0x0D, 0x60, 0xA0, 0xA0, 0x0F, 0x60, 0xA0,
+		   0xA0, 0x09, 0x60, 0xA0, 0xA0, 0x0B, 0x60, 0xA0, 0xA0);
+	ST7701_DSI(st7701, 0xEB, 0x02, 0x01, 0xE4, 0xE4, 0x44, 0x00, 0x40);
+	ST7701_DSI(st7701, 0xEC, 0x02, 0x01);
+	ST7701_DSI(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x01, 0xFF, 0xFF,
+		   0xFF, 0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
+}
+
 static int st7701_prepare(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
@@ -700,6 +725,105 @@ static const struct st7701_panel_desc dmt028vghmcmi_1a_desc = {
 	.gip_sequence = dmt028vghmcmi_1a_gip_sequence,
 };
 
+static const struct drm_display_mode kd50t048a_mode = {
+	.clock          = 27500,
+
+	.hdisplay       = 480,
+	.hsync_start    = 480 + 2,
+	.hsync_end      = 480 + 2 + 10,
+	.htotal         = 480 + 2 + 10 + 2,
+
+	.vdisplay       = 854, // was: 854 12 2 60
+	.vsync_start    = 854 + 2,
+	.vsync_end      = 854 + 2 + 2,
+	.vtotal         = 854 + 2 + 2 + 17,
+
+	.width_mm       = 69,
+	.height_mm      = 139,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc kd50t048a_desc = {
+	.mode = &kd50t048a_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.panel_sleep_delay = 0,
+
+	.pv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xd),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xd),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x2),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x1e),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 2) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x23),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x18)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xc),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xc),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x3),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x7),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x20),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 2) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x24),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x18)
+	},
+	.nlinv = 1,
+	.vop_uv = 4887500,
+	.vcom_uv = 937500,
+	.vgh_mv = 15000,
+	.vgl_mv = -9510,
+	.avdd_mv = 6600,
+	.avcl_mv = -4400,
+	.gamma_op_bias = OP_BIAS_MIDDLE,
+	.input_op_bias = OP_BIAS_MIN,
+	.output_op_bias = OP_BIAS_MIN,
+	.t2d_ns = 1600,
+	.t3d_ns = 10400,
+	.eot_en = true,
+	.gip_sequence = kd50t048a_gip_sequence,
+};
+
 static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct st7701_panel_desc *desc;
@@ -776,6 +900,7 @@ static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
 static const struct of_device_id st7701_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
+	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7701_of_match);
-- 
2.39.1

