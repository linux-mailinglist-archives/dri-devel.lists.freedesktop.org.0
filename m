Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C5823CAB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 08:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BA410E3BA;
	Thu,  4 Jan 2024 07:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3810E3BA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 07:24:26 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5542a7f1f3cso245764a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 23:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704353065; x=1704957865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWXC08AomogX9fJjDHe3MxBIDHnKEfsu8+LOFUoPPqY=;
 b=XZIqKjJMx6ZbLu/jp6j3Ms8gNAVFiyHfd8XusJ4gdRMhi3QA2olrFs71rT5BMcKuaL
 WF3lENSyeXYIy18KwxFlWj6gKCdnhPXz2/G+OjiaQxQpXpXHFKLKlEXO9SyJhYPxPpXR
 Z1Yu7wO2+DnsgKiZSmY01N6/JnQsL4kJeiSro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704353065; x=1704957865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWXC08AomogX9fJjDHe3MxBIDHnKEfsu8+LOFUoPPqY=;
 b=ZWFGrQ418sysoO9x6JJSL6xZHpl9qlxfEhiL3KcVoxFCcJeC1f3CsOvpg3Yxio8nXG
 3CRnwX0oR7px1fCR1GDJQjUAujRHzyFPhVYlQPH/K4AZC4hWBmrNt+aYZgoiAsuvRSdx
 sDEhUG9b/D7kC6eHEKS832JWWwgw2AAcQnEF5+DMhATIMsbRej8oP/+FRWkbr1ZajYVN
 Hx0NAWslsUA+VtzY3IcP8867VCvdOH9MXuHS+bxnl8Da6I6E9nyL+eMwieyXK6jUYdLE
 LejWpzv6gDAghsZ7o+EmD6IbYht6QhkGWP/FcNmuMDu8p4I41pvRupdJjw9oKZIWtzoh
 XBdQ==
X-Gm-Message-State: AOJu0YxfwNIEq+wPleWGh8XpZQpt8IbSe3OlsexQzAo4hAFx6fbwDK+Y
 f0om3iNb9/eSCpNpRLHABBu+5niSaTohiQ==
X-Google-Smtp-Source: AGHT+IGPMbdQfMOH07dDXotaO9QeIhqPnUIlXjQuWZ5LXIvkJSyIt5BiMSytKGKOzq3rwMMYXESNOA==
X-Received: by 2002:a50:c01e:0:b0:557:b8f:3f3a with SMTP id
 r30-20020a50c01e000000b005570b8f3f3amr71951edb.75.1704353065121; 
 Wed, 03 Jan 2024 23:24:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056402000300b00553772c2968sm18530735edu.82.2024.01.03.23.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:24:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
Date: Thu,  4 Jan 2024 08:23:44 +0100
Message-ID: <20240104072407.41290-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
References: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initialization commands are taken from the STMicroelectronics driver
found at [1].
To ensure backward compatibility, flags have been added to enable gamma
correction setting and display control. In other cases, registers have
been set to their default values according to the specifications found
in the datasheet.

[1] https://github.com/STMicroelectronics/STM32CubeF7/blob/master/Drivers/BSP/Components/nt35510/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Re-write the patch [8/8] "drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK"
  in the same style as the original driver.

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 282 ++++++++++++++++--
 1 file changed, 251 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index ce8969f48286..c85dd0d0829d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -36,6 +36,9 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+#define NT35510_CMD_CORRECT_GAMMA BIT(0)
+#define NT35510_CMD_CONTROL_DISPLAY BIT(1)
+
 #define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
 #define MCS_CMD_READ_ID1	0xDA
 #define MCS_CMD_READ_ID2	0xDB
@@ -112,18 +115,33 @@
 /* AVDD and AVEE setting 3 bytes */
 #define NT35510_P1_AVDD_LEN 3
 #define NT35510_P1_AVEE_LEN 3
+#define NT35510_P1_VCL_LEN 3
 #define NT35510_P1_VGH_LEN 3
 #define NT35510_P1_VGL_LEN 3
 #define NT35510_P1_VGP_LEN 3
 #define NT35510_P1_VGN_LEN 3
+#define NT35510_P1_VCMOFF_LEN 2
 /* BT1CTR thru BT5CTR setting 3 bytes */
 #define NT35510_P1_BT1CTR_LEN 3
 #define NT35510_P1_BT2CTR_LEN 3
+#define NT35510_P1_BT3CTR_LEN 3
 #define NT35510_P1_BT4CTR_LEN 3
 #define NT35510_P1_BT5CTR_LEN 3
 /* 52 gamma parameters times two per color: positive and negative */
 #define NT35510_P1_GAMMA_LEN 52
 
+#define NT35510_WRCTRLD_BCTRL BIT(5)
+#define NT35510_WRCTRLD_A BIT(4)
+#define NT35510_WRCTRLD_DD BIT(3)
+#define NT35510_WRCTRLD_BL BIT(2)
+#define NT35510_WRCTRLD_DB BIT(1)
+#define NT35510_WRCTRLD_G BIT(0)
+
+#define NT35510_WRCABC_OFF 0
+#define NT35510_WRCABC_UI_MODE 1
+#define NT35510_WRCABC_STILL_MODE 2
+#define NT35510_WRCABC_MOVING_MODE 3
+
 /**
  * struct nt35510_config - the display-specific NT35510 configuration
  *
@@ -175,6 +193,10 @@ struct nt35510_config {
 	 * @mode_flags: DSI operation mode related flags
 	 */
 	unsigned long mode_flags;
+	/**
+	 * @cmds: enable DSI commands
+	 */
+	u32 cmds;
 	/**
 	 * @avdd: setting for AVDD ranging from 0x00 = 6.5V to 0x14 = 4.5V
 	 * in 0.1V steps the default is 0x05 which means 6.0V
@@ -224,6 +246,25 @@ struct nt35510_config {
 	 * The defaults are 4 and 3 yielding 0x34
 	 */
 	u8 bt2ctr[NT35510_P1_BT2CTR_LEN];
+	/**
+	 * @vcl: setting for VCL ranging from 0x00 = -2.5V to 0x11 = -4.0V
+	 * in 1V steps, the default is 0x00 which means -2.5V
+	 */
+	u8 vcl[NT35510_P1_VCL_LEN];
+	/**
+	 * @bt3ctr: setting for boost power control for the VCL step-up
+	 * circuit (3)
+	 * bits 0..2 in the lower nibble controls CLCK, the booster clock
+	 * frequency, the values are the same as for PCK in @bt1ctr.
+	 * bits 4..5 in the upper nibble controls BTCL, the boosting
+	 * amplification for the step-up circuit.
+	 * 0 = Disable
+	 * 1 = -0.5 x VDDB
+	 * 2 = -1 x VDDB
+	 * 3 = -2 x VDDB
+	 * The defaults are 4 and 2 yielding 0x24
+	 */
+	u8 bt3ctr[NT35510_P1_BT3CTR_LEN];
 	/**
 	 * @vgh: setting for VGH ranging from 0x00 = 7.0V to 0x0B = 18.0V
 	 * in 1V steps, the default is 0x08 which means 15V
@@ -277,6 +318,19 @@ struct nt35510_config {
 	 * same layout of bytes as @vgp.
 	 */
 	u8 vgn[NT35510_P1_VGN_LEN];
+	/**
+	 * @vcmoff: setting the DC VCOM offset voltage
+	 * The first byte contains bit 8 of VCM in bit 0 and VCMOFFSEL in bit 4.
+	 * The second byte contains bits 0..7 of VCM.
+	 * VCMOFFSEL the common voltage offset mode.
+	 * VCMOFFSEL 0x00 = VCOM .. 0x01 Gamma.
+	 * The default is 0x00.
+	 * VCM the VCOM output voltage (VCMOFFSEL = 0) or the internal register
+	 * offset for gamma voltage (VCMOFFSEL = 1).
+	 * VCM 0x00 = 0V/0 .. 0x118 = 3.5V/280 in steps of 12.5mV/1step
+	 * The default is 0x00 = 0V/0.
+	 */
+	u8 vcmoff[NT35510_P1_VCMOFF_LEN];
 	/**
 	 * @dopctr: setting optional control for display
 	 * ERR bits 0..1 in the first byte is the ERR pin output signal setting.
@@ -441,6 +495,43 @@ struct nt35510_config {
 	 * @gamma_corr_neg_b: Blue gamma correction parameters, negative
 	 */
 	u8 gamma_corr_neg_b[NT35510_P1_GAMMA_LEN];
+	/**
+	 * @wrdisbv: write display brightness
+	 * 0x00 value means the lowest brightness and 0xff value means
+	 * the highest brightness.
+	 * The default is 0x00.
+	 */
+	u8 wrdisbv;
+	/**
+	 * @wrctrld: write control display
+	 * G bit 0 selects gamma curve: 0 = Manual, 1 = Automatic
+	 * DB bit 1 selects display brightness: 0 = Manual, 1 = Automatic
+	 * BL bit 2 controls backlight control: 0 = Off, 1 = On
+	 * DD bit 3 controls display dimming: 0 = Off, 1 = On
+	 * A bit 4 controls LABC block: 0 = Off, 1 = On
+	 * BCTRL bit 5 controls brightness block: 0 = Off, 1 = On
+	 */
+	u8 wrctrld;
+	/**
+	 * @wrcabc: write content adaptive brightness control
+	 * There is possible to use 4 different modes for content adaptive
+	 * image functionality:
+	 * 0: Off
+	 * 1: User Interface Image (UI-Mode)
+	 * 2: Still Picture Image (Still-Mode)
+	 * 3: Moving Picture Image (Moving-Mode)
+	 * The default is 0
+	 */
+	u8 wrcabc;
+	/**
+	 * @wrcabcmb: write CABC minimum brightness
+	 * Set the minimum brightness value of the display for CABC
+	 * function.
+	 * 0x00 value means the lowest brightness for CABC and 0xff
+	 * value means the highest brightness for CABC.
+	 * The default is 0x00.
+	 */
+	u8 wrcabcmb;
 };
 
 /**
@@ -584,6 +675,16 @@ static int nt35510_setup_power(struct nt35510 *nt)
 				nt->conf->bt2ctr);
 	if (ret)
 		return ret;
+	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
+				NT35510_P1_VCL_LEN,
+				nt->conf->vcl);
+	if (ret)
+		return ret;
+	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
+				NT35510_P1_BT3CTR_LEN,
+				nt->conf->bt3ctr);
+	if (ret)
+		return ret;
 	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
 				NT35510_P1_VGH_LEN,
 				nt->conf->vgh);
@@ -620,6 +721,12 @@ static int nt35510_setup_power(struct nt35510 *nt)
 	if (ret)
 		return ret;
 
+	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
+				NT35510_P1_VCMOFF_LEN,
+				nt->conf->vcmoff);
+	if (ret)
+		return ret;
+
 	/* Typically 10 ms */
 	usleep_range(10000, 20000);
 
@@ -799,36 +906,38 @@ static int nt35510_power_on(struct nt35510 *nt)
 	if (ret)
 		return ret;
 
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_POS,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_pos_r);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_POS,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_pos_g);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_POS,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_pos_b);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_NEG,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_neg_r);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_NEG,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_neg_g);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_NEG,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_neg_b);
-	if (ret)
-		return ret;
+	if (nt->conf->cmds & NT35510_CMD_CORRECT_GAMMA) {
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_POS,
+					NT35510_P1_GAMMA_LEN,
+					nt->conf->gamma_corr_pos_r);
+		if (ret)
+			return ret;
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_POS,
+					NT35510_P1_GAMMA_LEN,
+					nt->conf->gamma_corr_pos_g);
+		if (ret)
+			return ret;
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_POS,
+					NT35510_P1_GAMMA_LEN,
+					nt->conf->gamma_corr_pos_b);
+		if (ret)
+			return ret;
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_NEG,
+					NT35510_P1_GAMMA_LEN,
+					nt->conf->gamma_corr_neg_r);
+		if (ret)
+			return ret;
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_NEG,
+					NT35510_P1_GAMMA_LEN,
+					nt->conf->gamma_corr_neg_g);
+		if (ret)
+			return ret;
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_NEG,
+					NT35510_P1_GAMMA_LEN,
+					nt->conf->gamma_corr_neg_b);
+		if (ret)
+			return ret;
+	}
 
 	/* Set up stuff in  manufacturer control, page 0 */
 	ret = nt35510_send_long(nt, dsi, MCS_CMD_MAUCCTR,
@@ -907,6 +1016,26 @@ static int nt35510_prepare(struct drm_panel *panel)
 	/* Up to 120 ms */
 	usleep_range(120000, 150000);
 
+	if (nt->conf->cmds & NT35510_CMD_CONTROL_DISPLAY) {
+		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+					 &nt->conf->wrctrld,
+					 sizeof(nt->conf->wrctrld));
+		if (ret < 0)
+			return ret;
+
+		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_POWER_SAVE,
+					 &nt->conf->wrcabc,
+					 sizeof(nt->conf->wrcabc));
+		if (ret < 0)
+			return ret;
+
+		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS,
+					 &nt->conf->wrcabcmb,
+					 sizeof(nt->conf->wrcabcmb));
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret) {
 		dev_err(nt->dev, "failed to turn display on (%d)\n", ret);
@@ -1033,7 +1162,10 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 			return PTR_ERR(bl);
 		}
 		bl->props.max_brightness = 255;
-		bl->props.brightness = 255;
+		if (nt->conf->cmds & NT35510_CMD_CONTROL_DISPLAY)
+			bl->props.brightness = nt->conf->wrdisbv;
+		else
+			bl->props.brightness = 255;
 		bl->props.power = FB_BLANK_POWERDOWN;
 		nt->panel.backlight = bl;
 	}
@@ -1112,6 +1244,7 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 		.flags = 0,
 	},
 	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.cmds = NT35510_CMD_CORRECT_GAMMA,
 	/* 0x09: AVDD = 5.6V */
 	.avdd = { 0x09, 0x09, 0x09 },
 	/* 0x34: PCK = Hsync/2, BTP = 2 x VDDB */
@@ -1120,6 +1253,10 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 	.avee = { 0x09, 0x09, 0x09 },
 	/* 0x24: NCK = Hsync/2, BTN =  -2 x VDDB */
 	.bt2ctr = { 0x24, 0x24, 0x24 },
+	/* VBCLA: -2.5V, VBCLB: -2.5V, VBCLC: -2.5V */
+	.vcl = { 0x00, 0x00, 0x00 },
+	/* 0x24: CLCK = Hsync/2, BTN =  -1 x VDDB */
+	.bt3ctr = { 0x24, 0x24, 0x24 },
 	/* 0x05 = 12V */
 	.vgh = { 0x05, 0x05, 0x05 },
 	/* 0x24: NCKA = Hsync/2, VGH = 2 x AVDD - AVEE */
@@ -1132,6 +1269,8 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 	.vgp = { 0x00, 0xA3, 0x00 },
 	/* VGMP: 0x0A3 = 5.0375V, VGSP = 0V */
 	.vgn = { 0x00, 0xA3, 0x00 },
+	/* VCMOFFSEL = VCOM voltage offset mode, VCM = 0V */
+	.vcmoff = { 0x00, 0x00 },
 	/* Enable TE, EoTP and RGB pixel format */
 	.dopctr = { NT35510_DOPCTR_0_DSITE | NT35510_DOPCTR_0_EOTP |
 		    NT35510_DOPCTR_0_N565, NT35510_DOPCTR_1_CTB },
@@ -1163,7 +1302,88 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 	.gamma_corr_neg_b = { NT35510_GAMMA_NEG_DEFAULT },
 };
 
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
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			MIPI_DSI_MODE_LPM,
+	.cmds = NT35510_CMD_CONTROL_DISPLAY,
+	/* 0x03: AVDD = 6.2V */
+	.avdd = { 0x03, 0x03, 0x03 },
+	/* 0x46: PCK = 2 x Hsync, BTP = 2.5 x VDDB */
+	.bt1ctr = { 0x46, 0x46, 0x46 },
+	/* 0x03: AVEE = -6.2V */
+	.avee = { 0x03, 0x03, 0x03 },
+	/* 0x36: PCK = 2 x Hsync, BTP =  2 x VDDB */
+	.bt2ctr = { 0x36, 0x36, 0x36 },
+	/* VBCLA: -2.5V, VBCLB: -2.5V, VBCLC: -3.5V */
+	.vcl = { 0x00, 0x00, 0x02 },
+	/* 0x26: CLCK = 2 x Hsync, BTN =  -1 x VDDB */
+	.bt3ctr = { 0x26, 0x26, 0x26 },
+	/* 0x09 = 16V */
+	.vgh = { 0x09, 0x09, 0x09 },
+	/* 0x36: HCK = 2 x Hsync, VGH = 2 x AVDD - AVEE */
+	.bt4ctr = { 0x36, 0x36, 0x36 },
+	/* 0x08 = -10V */
+	.vgl = { 0x08, 0x08, 0x08 },
+	/* 0x26: LCK = 2 x Hsync, VGL = AVDD + VCL - AVDD */
+	.bt5ctr = { 0x26, 0x26, 0x26 },
+	/* VGMP: 0x080 = 4.6V, VGSP = 0V */
+	.vgp = { 0x00, 0x80, 0x00 },
+	/* VGMP: 0x080 = 4.6V, VGSP = 0V */
+	.vgn = { 0x00, 0x80, 0x00 },
+	/* VCMOFFSEL = VCOM voltage offset mode, VCM = -1V */
+	.vcmoff = { 0x00, 0x50 },
+	.dopctr = { NT35510_DOPCTR_0_RAMKP | NT35510_DOPCTR_0_DSITE |
+		NT35510_DOPCTR_0_DSIG | NT35510_DOPCTR_0_DSIM |
+		NT35510_DOPCTR_0_EOTP | NT35510_DOPCTR_0_N565, 0 },
+	.madctl = NT35510_ROTATE_180_SETTING,
+	/* 0x03: SDT = 1.5 us */
+	.sdhdtctr = 0x03,
+	/* EQ control for gate signals, 0x00 = 0 us */
+	.gseqctr = { 0x00, 0x00 },
+	/* SDEQCTR: source driver EQ mode 2, 1 us rise time on each step */
+	.sdeqctr = { 0x01, 0x02, 0x02, 0x02 },
+	/* SDVPCTR: Normal operation off color during v porch */
+	.sdvpctr = 0x01,
+	/* T1: number of pixel clocks on one scanline: 0x184 = 389 clocks */
+	.t1 = 0x0184,
+	/* VBP: vertical back porch toward the panel */
+	.vbp = 0x1C,
+	/* VFP: vertical front porch toward the panel */
+	.vfp = 0x1C,
+	/* PSEL: divide pixel clock 23MHz with 1 (no clock downscaling) */
+	.psel = 0,
+	/* DPTMCTR12: 0x03: LVGL = VGLX, overlap mode, swap R->L O->E */
+	.dpmctr12 = { 0x03, 0x00, 0x00, },
+	/* write display brightness */
+	.wrdisbv = 0x7f,
+	/* write control display */
+	.wrctrld = NT35510_WRCTRLD_BCTRL | NT35510_WRCTRLD_DD |
+			NT35510_WRCTRLD_BL,
+	/* write content adaptive brightness control */
+	.wrcabc = NT35510_WRCABC_STILL_MODE,
+	/* write CABC minimum brightness */
+	.wrcabcmb = 0xff,
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

