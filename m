Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDE1B1F21
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D276E8B3;
	Tue, 21 Apr 2020 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57C56E7EC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 18:04:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d24so4233998pll.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3nSryLwb98zZAjfCEWjgsvC4E8D3p5K3f0vNefyGRkI=;
 b=V5SCUoFMovvZNEbQG8KAyyyDydNJES6Jax83o8tsmaMCdgKvVvKxwZhd+Wgn+wLgy/
 /p5yXeL7QrFL+D4fuurJEVBlfsOycq3iabdzj4LFmCdMeFZqcqrX3x/QLe3o0d0Ui9zd
 NAOBYPGXGUABcThAaxPVhasKrjw8SrdyWAcqxq4pYDTgG9E0j0kiSjVHupqQCV9HSiTO
 +Mp085pycZmJv6HKeUu3EksmhMhvxurANwL0F7/+hw87un5WWqKmj5btOGW5oy9ZZ+0T
 lvI9M1gHEyYcRAHr7L4d0DPU+zbbSCSuYc+hfOWWkG3oCZTi2l7i7amfue9cAiWOlvpn
 sOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3nSryLwb98zZAjfCEWjgsvC4E8D3p5K3f0vNefyGRkI=;
 b=fWVaqEcfGayz+fVe/4sb/L9UxZ3ecKHv+AS/bd6/ZAU+PDrYbjl4niTasTPkfQ+/SH
 aCPWvWipLMuhLrCHgB/DJLhO6d9sGQMKUECDEXo/wp4WKQaLDz+mLK4u01TnPsjFHqxw
 R7vKrVWU5bCVBJfs2IMocf9X9aVJx+vRrvQmJ3xEwoEYMiMt2JIWtS+4fgrgP9XdupdM
 /MJuFVVgT7VIvYEyJy+dDAcMkelcNnWIkaGtdGXFF/YlheNeNVH5MbJ3ZaqWC1zqm7TQ
 dgOMSDMCnCqwOcIl+k7fJt6bhdIfmkrv0VlACfuRZJI2dmA3bwkISs1yNdiWVF+Ojsk/
 pBRw==
X-Gm-Message-State: AGi0PuadyIweH06v6Y+cxLBvcAbL7p0lZnEpfUN5GxE+np6RlG5vETft
 TlFPzhVcya6JMLUGwoqC3Sw=
X-Google-Smtp-Source: APiQypLcpOzRYqIsUY5TIUzVRBz9wZF0rQbC4uhGbFmCpXe39ds5hBZT9C4Z/Y/UvPiZIifyTYsPwA==
X-Received: by 2002:a17:90a:23a3:: with SMTP id
 g32mr752709pje.78.1587405881141; 
 Mon, 20 Apr 2020 11:04:41 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.182.233.24])
 by smtp.gmail.com with ESMTPSA id l30sm1748491pgu.29.2020.04.20.11.04.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 11:04:40 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: Remove dead code
Date: Mon, 20 Apr 2020 23:42:17 +0530
Message-Id: <1587406337-32317-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are dead code since 3.7. If there is no plan to use them further,
these can be removed forever.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c        | 31 +--------
 drivers/gpu/drm/gma500/cdv_intel_lvds.c      | 83 -----------------------
 drivers/gpu/drm/gma500/mdfld_intel_display.c | 31 ---------
 drivers/gpu/drm/gma500/psb_intel_sdvo.c      | 99 ----------------------------
 4 files changed, 1 insertion(+), 243 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 5772b2d..a9ed372 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1271,37 +1271,8 @@ static void cdv_intel_dp_commit(struct drm_encoder *encoder)
 	return ((l >> s) & 3) << DP_TRAIN_PRE_EMPHASIS_SHIFT;
 }
 
-
-#if 0
-static char	*voltage_names[] = {
-	"0.4V", "0.6V", "0.8V", "1.2V"
-};
-static char	*pre_emph_names[] = {
-	"0dB", "3.5dB", "6dB", "9.5dB"
-};
-static char	*link_train_names[] = {
-	"pattern 1", "pattern 2", "idle", "off"
-};
-#endif
-
 #define CDV_DP_VOLTAGE_MAX	    DP_TRAIN_VOLTAGE_SWING_LEVEL_3
-/*
-static uint8_t
-cdv_intel_dp_pre_emphasis_max(uint8_t voltage_swing)
-{
-	switch (voltage_swing & DP_TRAIN_VOLTAGE_SWING_MASK) {
-	case DP_TRAIN_VOLTAGE_SWING_400:
-		return DP_TRAIN_PRE_EMPHASIS_6;
-	case DP_TRAIN_VOLTAGE_SWING_600:
-		return DP_TRAIN_PRE_EMPHASIS_6;
-	case DP_TRAIN_VOLTAGE_SWING_800:
-		return DP_TRAIN_PRE_EMPHASIS_3_5;
-	case DP_TRAIN_VOLTAGE_SWING_1200:
-	default:
-		return DP_TRAIN_PRE_EMPHASIS_0;
-	}
-}
-*/
+
 static void
 cdv_intel_get_adjust_train(struct gma_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index ea0a5d9..dffb86e 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -72,89 +72,6 @@ static u32 cdv_intel_lvds_get_max_backlight(struct drm_device *dev)
 	return retval;
 }
 
-#if 0
-/*
- * Set LVDS backlight level by I2C command
- */
-static int cdv_lvds_i2c_set_brightness(struct drm_device *dev,
-					unsigned int level)
-{
-	struct drm_psb_private *dev_priv = dev->dev_private;
-	struct psb_intel_i2c_chan *lvds_i2c_bus = dev_priv->lvds_i2c_bus;
-	u8 out_buf[2];
-	unsigned int blc_i2c_brightness;
-
-	struct i2c_msg msgs[] = {
-		{
-			.addr = lvds_i2c_bus->slave_addr,
-			.flags = 0,
-			.len = 2,
-			.buf = out_buf,
-		}
-	};
-
-	blc_i2c_brightness = BRIGHTNESS_MASK & ((unsigned int)level *
-			     BRIGHTNESS_MASK /
-			     BRIGHTNESS_MAX_LEVEL);
-
-	if (dev_priv->lvds_bl->pol == BLC_POLARITY_INVERSE)
-		blc_i2c_brightness = BRIGHTNESS_MASK - blc_i2c_brightness;
-
-	out_buf[0] = dev_priv->lvds_bl->brightnesscmd;
-	out_buf[1] = (u8)blc_i2c_brightness;
-
-	if (i2c_transfer(&lvds_i2c_bus->adapter, msgs, 1) == 1)
-		return 0;
-
-	DRM_ERROR("I2C transfer error\n");
-	return -1;
-}
-
-
-static int cdv_lvds_pwm_set_brightness(struct drm_device *dev, int level)
-{
-	struct drm_psb_private *dev_priv = dev->dev_private;
-
-	u32 max_pwm_blc;
-	u32 blc_pwm_duty_cycle;
-
-	max_pwm_blc = cdv_intel_lvds_get_max_backlight(dev);
-
-	/*BLC_PWM_CTL Should be initiated while backlight device init*/
-	BUG_ON((max_pwm_blc & PSB_BLC_MAX_PWM_REG_FREQ) == 0);
-
-	blc_pwm_duty_cycle = level * max_pwm_blc / BRIGHTNESS_MAX_LEVEL;
-
-	if (dev_priv->lvds_bl->pol == BLC_POLARITY_INVERSE)
-		blc_pwm_duty_cycle = max_pwm_blc - blc_pwm_duty_cycle;
-
-	blc_pwm_duty_cycle &= PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR;
-	REG_WRITE(BLC_PWM_CTL,
-		  (max_pwm_blc << PSB_BACKLIGHT_PWM_CTL_SHIFT) |
-		  (blc_pwm_duty_cycle));
-
-	return 0;
-}
-
-/*
- * Set LVDS backlight level either by I2C or PWM
- */
-void cdv_intel_lvds_set_brightness(struct drm_device *dev, int level)
-{
-	struct drm_psb_private *dev_priv = dev->dev_private;
-
-	if (!dev_priv->lvds_bl) {
-		DRM_ERROR("NO LVDS Backlight Info\n");
-		return;
-	}
-
-	if (dev_priv->lvds_bl->type == BLC_I2C_TYPE)
-		cdv_lvds_i2c_set_brightness(dev, level);
-	else
-		cdv_lvds_pwm_set_brightness(dev, level);
-}
-#endif
-
 /**
  * Sets the backlight level.
  *
diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
index 4fff110..aae2d35 100644
--- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
+++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
@@ -658,16 +658,6 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 
 	dev_dbg(dev->dev, "pipe = 0x%x\n", pipe);
 
-#if 0
-	if (pipe == 1) {
-		if (!gma_power_begin(dev, true))
-			return 0;
-		android_hdmi_crtc_mode_set(crtc, mode, adjusted_mode,
-			x, y, old_fb);
-		goto mrst_crtc_mode_set_exit;
-	}
-#endif
-
 	ret = check_fb(crtc->primary->fb);
 	if (ret)
 		return ret;
@@ -918,14 +908,6 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 		}
 		dpll = 0;
 
-#if 0 /* FIXME revisit later */
-		if (ksel == KSEL_CRYSTAL_19 || ksel == KSEL_BYPASS_19 ||
-						ksel == KSEL_BYPASS_25)
-			dpll &= ~MDFLD_INPUT_REF_SEL;
-		else if (ksel == KSEL_BYPASS_83_100)
-			dpll |= MDFLD_INPUT_REF_SEL;
-#endif /* FIXME revisit later */
-
 		if (is_hdmi)
 			dpll |= MDFLD_VCO_SEL;
 
@@ -935,20 +917,7 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 		/* compute bitmask from p1 value */
 		dpll |= (1 << (clock.p1 - 2)) << 17;
 
-#if 0 /* 1080p30 & 720p */
-		dpll = 0x00050000;
-		fp = 0x000001be;
-#endif
-#if 0 /* 480p */
-		dpll = 0x02010000;
-		fp = 0x000000d2;
-#endif
 	} else {
-#if 0 /*DBI_TPO_480x864*/
-		dpll = 0x00020000;
-		fp = 0x00000156;
-#endif /* DBI_TPO_480x864 */ /* get from spec. */
-
 		dpll = 0x00800000;
 		fp = 0x000000c1;
 	}
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 264d7ad..68fb3d7 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -864,36 +864,6 @@ static bool psb_intel_sdvo_set_avi_infoframe(struct psb_intel_sdvo *psb_intel_sd
 	DRM_INFO("HDMI is not supported yet");
 
 	return false;
-#if 0
-	struct dip_infoframe avi_if = {
-		.type = DIP_TYPE_AVI,
-		.ver = DIP_VERSION_AVI,
-		.len = DIP_LEN_AVI,
-	};
-	uint8_t tx_rate = SDVO_HBUF_TX_VSYNC;
-	uint8_t set_buf_index[2] = { 1, 0 };
-	uint64_t *data = (uint64_t *)&avi_if;
-	unsigned i;
-
-	intel_dip_infoframe_csum(&avi_if);
-
-	if (!psb_intel_sdvo_set_value(psb_intel_sdvo,
-				  SDVO_CMD_SET_HBUF_INDEX,
-				  set_buf_index, 2))
-		return false;
-
-	for (i = 0; i < sizeof(avi_if); i += 8) {
-		if (!psb_intel_sdvo_set_value(psb_intel_sdvo,
-					  SDVO_CMD_SET_HBUF_DATA,
-					  data, 8))
-			return false;
-		data++;
-	}
-
-	return psb_intel_sdvo_set_value(psb_intel_sdvo,
-				    SDVO_CMD_SET_HBUF_TXRATE,
-				    &tx_rate, 1);
-#endif
 }
 
 static bool psb_intel_sdvo_set_tv_format(struct psb_intel_sdvo *psb_intel_sdvo)
@@ -1227,75 +1197,6 @@ static bool psb_intel_sdvo_get_capabilities(struct psb_intel_sdvo *psb_intel_sdv
 	return true;
 }
 
-/* No use! */
-#if 0
-struct drm_connector* psb_intel_sdvo_find(struct drm_device *dev, int sdvoB)
-{
-	struct drm_connector *connector = NULL;
-	struct psb_intel_sdvo *iout = NULL;
-	struct psb_intel_sdvo *sdvo;
-
-	/* find the sdvo connector */
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		iout = to_psb_intel_sdvo(connector);
-
-		if (iout->type != INTEL_OUTPUT_SDVO)
-			continue;
-
-		sdvo = iout->dev_priv;
-
-		if (sdvo->sdvo_reg == SDVOB && sdvoB)
-			return connector;
-
-		if (sdvo->sdvo_reg == SDVOC && !sdvoB)
-			return connector;
-
-	}
-
-	return NULL;
-}
-
-int psb_intel_sdvo_supports_hotplug(struct drm_connector *connector)
-{
-	u8 response[2];
-	u8 status;
-	struct psb_intel_sdvo *psb_intel_sdvo;
-	DRM_DEBUG_KMS("\n");
-
-	if (!connector)
-		return 0;
-
-	psb_intel_sdvo = to_psb_intel_sdvo(connector);
-
-	return psb_intel_sdvo_get_value(psb_intel_sdvo, SDVO_CMD_GET_HOT_PLUG_SUPPORT,
-				    &response, 2) && response[0];
-}
-
-void psb_intel_sdvo_set_hotplug(struct drm_connector *connector, int on)
-{
-	u8 response[2];
-	u8 status;
-	struct psb_intel_sdvo *psb_intel_sdvo = to_psb_intel_sdvo(connector);
-
-	psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_GET_ACTIVE_HOT_PLUG, NULL, 0);
-	psb_intel_sdvo_read_response(psb_intel_sdvo, &response, 2);
-
-	if (on) {
-		psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_GET_HOT_PLUG_SUPPORT, NULL, 0);
-		status = psb_intel_sdvo_read_response(psb_intel_sdvo, &response, 2);
-
-		psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_SET_ACTIVE_HOT_PLUG, &response, 2);
-	} else {
-		response[0] = 0;
-		response[1] = 0;
-		psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_SET_ACTIVE_HOT_PLUG, &response, 2);
-	}
-
-	psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_GET_ACTIVE_HOT_PLUG, NULL, 0);
-	psb_intel_sdvo_read_response(psb_intel_sdvo, &response, 2);
-}
-#endif
-
 static bool
 psb_intel_sdvo_multifunc_encoder(struct psb_intel_sdvo *psb_intel_sdvo)
 {
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
