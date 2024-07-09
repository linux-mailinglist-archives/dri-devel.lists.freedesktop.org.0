Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A305192C300
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 20:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E560410E619;
	Tue,  9 Jul 2024 18:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FHhHGdbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532D10E619
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 18:01:30 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a77e5929033so421993166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720548089; x=1721152889; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lHcM64Au+uukg6AKO5/ac3ojku0QylaKpSDeXCzgSS0=;
 b=FHhHGdbHw+EIWRQAqqcCrTXj3C7ymTsiJmcR9fr1GHADmtB+DmiQP+nzkztzQx3+k7
 7e7M/hE95FLSafhMJUxkn0Cp0mocSTXE8ygxP2YqsKRS7SYOn/qOBX682cfsgxgCy/r9
 xElyOhoKqS3ssUoY9ulJbtq5+tSxvupaoXv/ay8tBilHdw7Ve6CB0OtnxXvbUlFt96xX
 OC2s7Q84o1F0Qzq/K1voG/0dKaK2xyzvQDHbJ64ls5dCf8tgzValhLC7A8i9cykaNOij
 fqoHt/gJHpPseZITDGKLce7JZQOdz4HPzSyI79NaTTa8eJffEnp9wRiAoN8riTDsw/O/
 n1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720548089; x=1721152889;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lHcM64Au+uukg6AKO5/ac3ojku0QylaKpSDeXCzgSS0=;
 b=H0q3oDWOhueD3vNTM44UUPUy4VeEsxdlua+rc5dh9YYzjcPebQYp2uG/HQASKScSRz
 22goMzi/In5O6CMRP5UET7IBVNS/xKEpYqUCVcNLrWsu/9vKfygb4heF5gr7sT0k5l8V
 Ql/O8CfPY/uTJjSmH08kY6eXknwROsC3YIQ3RWJSR70NjJqC2g0+5PKxgRNuGMaoMZiI
 CfW0zWrWGETprKHVPdZPdUi9jSWpjClLxVlqwD7q0+42V0dGATsZJ54sn0hJZbeYSTeD
 Xo9hApOd9G7NBzpcmIM+VeZKLAER+RMbp0QFuPSpAZYJ7AMh3IQIiO8ErlHk2lj7WyJg
 LaSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2dTQekypjTEmEvIiBLBX+fr09ETkFlcR1cVUJ/FzrOuq6sjnEiGgunyT7EZ5g1eS3rCuzm+snKNADUgx18NlAiC2uE8n34bkglJ4S/tC8
X-Gm-Message-State: AOJu0Yyt1Z9kBN/tSnIMcspvuq3TN+KEQLCHLUP3aryPuzfhoLFS58Oy
 z3lMrWAe5JNqxrHeGPs3Kci1VLwekdcWoTsLJqIKLIC/VqyYlUyT
X-Google-Smtp-Source: AGHT+IGHnxUIy3UqvjM1PIAFlH6BhOsBrwOgYKayKYOWy9A1UhFCbK+GgVdUKoX1SN0bbqF8JK0xwA==
X-Received: by 2002:a17:906:3497:b0:a72:7b86:5bfc with SMTP id
 a640c23a62f3a-a780b89c98amr203946766b.64.1720548088145; 
 Tue, 09 Jul 2024 11:01:28 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:1:32d0:42ff:fe10:6983?
 (2a02-a449-4071-1-32d0-42ff-fe10-6983.fixed6.kpn.net.
 [2a02:a449:4071:1:32d0:42ff:fe10:6983])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7fefaasm96509666b.140.2024.07.09.11.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 11:01:27 -0700 (PDT)
Message-ID: <08fc2878-722e-4884-94f3-19ec4717cccd@gmail.com>
Date: Tue, 9 Jul 2024 20:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] drm/rockchip: rk3066_hdmi: change to bridge driver mode
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Change rk3066_hdmi.c to bridge driver mode.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Apply after:
[PATCH v10] drm/rockchip: rk3066_hdmi: add sound support
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 293 ++++++++++++++-----------
 1 file changed, 161 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index e3b8faf89ae2..905610a10549 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -5,12 +5,15 @@
  */

 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>

 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -53,7 +56,8 @@ struct rk3066_hdmi {
 	struct clk *hclk;
 	void __iomem *regs;

-	struct drm_connector connector;
+	struct drm_bridge bridge;
+	struct drm_connector *connector;
 	struct rockchip_encoder encoder;

 	struct rk3066_hdmi_i2c *i2c;
@@ -75,11 +79,6 @@ static struct rk3066_hdmi *encoder_to_rk3066_hdmi(struct drm_encoder *encoder)
 	return container_of(rkencoder, struct rk3066_hdmi, encoder);
 }

-static struct rk3066_hdmi *connector_to_rk3066_hdmi(struct drm_connector *connector)
-{
-	return container_of(connector, struct rk3066_hdmi, connector);
-}
-
 static inline u8 hdmi_readb(struct rk3066_hdmi *hdmi, u16 offset)
 {
 	return readl_relaxed(hdmi->regs + offset);
@@ -208,8 +207,7 @@ static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
 	union hdmi_infoframe frame;
 	int rc;

-	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						      &hdmi->connector, mode);
+	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi, hdmi->connector, mode);

 	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
 		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
@@ -347,7 +345,7 @@ static int rk3066_hdmi_audio_hw_params(struct device *dev, void *d,
 				       struct hdmi_codec_params *params)
 {
 	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
-	struct drm_display_info *display = &hdmi->connector.display_info;
+	struct drm_display_info *display = &hdmi->connector->display_info;

 	if (!display->has_audio) {
 		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
@@ -380,7 +378,7 @@ static void rk3066_hdmi_audio_shutdown(struct device *dev, void *d)
 static int rk3066_hdmi_audio_mute_stream(struct device *dev, void *d, bool mute, int direction)
 {
 	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
-	struct drm_display_info *display = &hdmi->connector.display_info;
+	struct drm_display_info *display = &hdmi->connector->display_info;

 	if (!display->has_audio) {
 		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
@@ -515,8 +513,7 @@ static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 	return 0;
 }

-static void
-rk3066_hdmi_phy_write(struct rk3066_hdmi *hdmi, u16 offset, u8 value)
+static void rk3066_hdmi_phy_write(struct rk3066_hdmi *hdmi, u16 offset, u8 value)
 {
 	hdmi_writeb(hdmi, offset, value);
 	hdmi_modb(hdmi, HDMI_SYS_CTRL,
@@ -572,7 +569,7 @@ static void rk3066_hdmi_config_phy(struct rk3066_hdmi *hdmi)
 static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 			     struct drm_display_mode *mode)
 {
-	struct drm_display_info *display = &hdmi->connector.display_info;
+	struct drm_display_info *display = &hdmi->connector->display_info;

 	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
 	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
@@ -644,15 +641,16 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	return 0;
 }

-static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
-				       struct drm_atomic_state *state)
+static void rk3066_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state)
 {
-	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+	struct drm_atomic_state *state = bridge_state->base.state;
+	struct rk3066_hdmi *hdmi = bridge->driver_private;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	int mux, val;

-	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
+	conn_state = drm_atomic_get_new_connector_state(state, hdmi->connector);
 	if (WARN_ON(!conn_state))
 		return;

@@ -660,7 +658,7 @@ static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
 	if (WARN_ON(!crtc_state))
 		return;

-	mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
+	mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, bridge->encoder);
 	if (mux)
 		val = (HDMI_VIDEO_SEL << 16) | HDMI_VIDEO_SEL;
 	else
@@ -674,10 +672,10 @@ static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
 	rk3066_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
 }

-static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder,
-					struct drm_atomic_state *state)
+static void rk3066_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *bridge_state)
 {
-	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+	struct rk3066_hdmi *hdmi = bridge->driver_private;

 	DRM_DEV_DEBUG(hdmi->dev, "hdmi encoder disable\n");

@@ -693,148 +691,146 @@ static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder,
 	rk3066_hdmi_set_power_mode(hdmi, HDMI_SYS_POWER_MODE_A);
 }

-static int
-rk3066_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_connector_state *conn_state)
+static enum drm_connector_status rk3066_hdmi_bridge_detect(struct drm_bridge *bridge)
 {
-	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
-
-	s->output_mode = ROCKCHIP_OUT_MODE_P888;
-	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+	struct rk3066_hdmi *hdmi = bridge->driver_private;

-	return 0;
+	return (hdmi_readb(hdmi, HDMI_HPG_MENS_STA) & HDMI_HPG_IN_STATUS_HIGH) ?
+		connector_status_connected : connector_status_disconnected;
 }

-static int rk3066_hdmi_encoder_late_register(struct drm_encoder *encoder)
+static enum drm_mode_status rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+							  const struct drm_display_info *info,
+							  const struct drm_display_mode *mode)
 {
-	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+	if ((mode->flags & DRM_MODE_FLAG_DBLCLK) ||
+	    (mode->flags & DRM_MODE_FLAG_INTERLACE))
+		return MODE_BAD;

-	return rk3066_hdmi_audio_codec_init(hdmi);
-}
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;

-static void rk3066_hdmi_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+	if (mode->clock > 148500)
+		return MODE_CLOCK_HIGH;

-	platform_device_unregister(hdmi->audio_pdev);
+	return MODE_OK;
 }

-static const struct drm_encoder_funcs rk3066_hdmi_encoder_funcs = {
-	.destroy          = drm_encoder_cleanup,
-	.late_register    = rk3066_hdmi_encoder_late_register,
-	.early_unregister = rk3066_hdmi_encoder_early_unregister,
-};
-
-static const
-struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
-	.atomic_check   = rk3066_hdmi_encoder_atomic_check,
-	.atomic_enable  = rk3066_hdmi_encoder_enable,
-	.atomic_disable = rk3066_hdmi_encoder_disable,
-};
-
-static enum drm_connector_status
-rk3066_hdmi_connector_detect(struct drm_connector *connector, bool force)
+static int rk3066_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
 {
-	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct rk3066_hdmi *hdmi = bridge->driver_private;
+	struct drm_display_info *display = &hdmi->connector->display_info;

-	return (hdmi_readb(hdmi, HDMI_HPG_MENS_STA) & HDMI_HPG_IN_STATUS_HIGH) ?
-		connector_status_connected : connector_status_disconnected;
+	s->output_mode = ROCKCHIP_OUT_MODE_P888;
+	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+
+	return  rk3066_hdmi_bridge_mode_valid(bridge, display,
+				&crtc_state->adjusted_mode) == MODE_OK ? 0 : -EINVAL;
 }

-static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
+static const struct drm_edid *rk3066_hdmi_bridge_edid_read(struct drm_bridge *bridge,
+							   struct drm_connector *connector)
 {
-	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
+	struct rk3066_hdmi *hdmi = bridge->driver_private;
 	const struct drm_edid *drm_edid;
-	int ret = 0;

 	if (!hdmi->ddc)
-		return 0;
+		return NULL;

 	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
+	if (!drm_edid) {
+		dev_dbg(hdmi->dev, "failed to get edid\n");
+		return NULL;
+	}

-	return ret;
+	return drm_edid;
 }

-static enum drm_mode_status
-rk3066_hdmi_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *rk3066_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+							 struct drm_bridge_state *bridge_state,
+							 struct drm_crtc_state *crtc_state,
+							 struct drm_connector_state *conn_state,
+							 u32 output_fmt,
+							 unsigned int *num_input_fmts)
 {
-	u32 vic = drm_match_cea_mode(mode);
+	u32 *input_fmts;

-	if (vic > 1)
-		return MODE_OK;
-	else
-		return MODE_BAD;
-}
+	*num_input_fmts = 0;

-static struct drm_encoder *
-rk3066_hdmi_connector_best_encoder(struct drm_connector *connector)
-{
-	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;

-	return &hdmi->encoder.encoder;
+	return input_fmts;
 }

-static int
-rk3066_hdmi_probe_single_connector_modes(struct drm_connector *connector,
-					 uint32_t maxX, uint32_t maxY)
+#define MAX_OUTPUT_SEL_FORMATS	1
+
+static u32 *rk3066_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+							  struct drm_bridge_state *bridge_state,
+							  struct drm_crtc_state *crtc_state,
+							  struct drm_connector_state *conn_state,
+							  unsigned int *num_output_fmts)
 {
-	if (maxX > 1920)
-		maxX = 1920;
-	if (maxY > 1080)
-		maxY = 1080;
+	u32 *output_fmts;

-	return drm_helper_probe_single_connector_modes(connector, maxX, maxY);
-}
+	*num_output_fmts = 0;

-static void rk3066_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
+	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;

-static const struct drm_connector_funcs rk3066_hdmi_connector_funcs = {
-	.fill_modes             = rk3066_hdmi_probe_single_connector_modes,
-	.detect                 = rk3066_hdmi_connector_detect,
-	.destroy                = rk3066_hdmi_connector_destroy,
-	.reset                  = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
-};
+	output_fmts[0] = MEDIA_BUS_FMT_FIXED;
+	*num_output_fmts = 1;
+
+	return output_fmts;
+}

-static const
-struct drm_connector_helper_funcs rk3066_hdmi_connector_helper_funcs = {
-	.get_modes    = rk3066_hdmi_connector_get_modes,
-	.mode_valid   = rk3066_hdmi_connector_mode_valid,
-	.best_encoder = rk3066_hdmi_connector_best_encoder,
+static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
+	.atomic_duplicate_state     = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state       = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset               = drm_atomic_helper_bridge_reset,
+	.atomic_check               = rk3066_hdmi_bridge_atomic_check,
+	.atomic_enable              = rk3066_hdmi_bridge_atomic_enable,
+	.atomic_disable             = rk3066_hdmi_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts  = rk3066_hdmi_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts = rk3066_hdmi_bridge_atomic_get_output_bus_fmts,
+	.mode_valid                 = rk3066_hdmi_bridge_mode_valid,
+	.detect                     = rk3066_hdmi_bridge_detect,
+	.edid_read                  = rk3066_hdmi_bridge_edid_read,
 };

-static int rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
+static int rk3066_hdmi_encoder_late_register(struct drm_encoder *encoder)
 {
-	struct drm_encoder *encoder = &hdmi->encoder.encoder;
-
-	drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &rk3066_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
-
-	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
+	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);

-	drm_connector_helper_add(&hdmi->connector,
-				 &rk3066_hdmi_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, &hdmi->connector,
-				    &rk3066_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
+	return rk3066_hdmi_audio_codec_init(hdmi);
+}

-	drm_connector_attach_encoder(&hdmi->connector, encoder);
+static void rk3066_hdmi_encoder_early_unregister(struct drm_encoder *encoder)
+{
+	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);

-	return 0;
+	platform_device_unregister(hdmi->audio_pdev);
 }

+static const struct drm_encoder_funcs rk3066_hdmi_encoder_funcs = {
+	.destroy          = drm_encoder_cleanup,
+	.late_register    = rk3066_hdmi_encoder_late_register,
+	.early_unregister = rk3066_hdmi_encoder_early_unregister,
+};
+
 static irqreturn_t rk3066_hdmi_hardirq(int irq, void *dev_id)
 {
 	struct rk3066_hdmi *hdmi = dev_id;
@@ -863,7 +859,8 @@ static irqreturn_t rk3066_hdmi_irq(int irq, void *dev_id)
 {
 	struct rk3066_hdmi *hdmi = dev_id;

-	drm_helper_hpd_irq_event(hdmi->connector.dev);
+	if (hdmi->bridge.dev)
+		drm_helper_hpd_irq_event(hdmi->bridge.dev);

 	return IRQ_HANDLED;
 }
@@ -1074,9 +1071,8 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 	hdmi_writeb(hdmi, HDMI_INTR_MASK4, 0);
 	rk3066_hdmi_set_power_mode(hdmi, HDMI_SYS_POWER_MODE_A);

-	ret = rk3066_hdmi_register(drm, hdmi);
-	if (ret)
-		goto err_disable_i2c;
+	drm_encoder_init(drm, encoder, &rk3066_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);

 	dev_set_drvdata(dev, hdmi);

@@ -1085,15 +1081,47 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 					dev_name(dev), hdmi);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to request hdmi irq: %d\n", ret);
-		goto err_cleanup_hdmi;
+		goto err_free_encoder;
+	}
+
+	hdmi->bridge.driver_private = hdmi;
+	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+			 | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.interlace_allowed = false;
+	hdmi->bridge.ddc = hdmi->ddc;
+	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+
+	drm_bridge_add(&hdmi->bridge);
+
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to attach bridge: %d\n", ret);
+		goto err_remove_bridge;
+	}
+
+	hdmi->connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(hdmi->connector)) {
+		DRM_DEV_ERROR(dev, "failed to initialize bridge connector: %pe\n", hdmi->connector);
+		ret = PTR_ERR(hdmi->connector);
+		goto err_remove_bridge;
+	}
+
+	ret = drm_connector_attach_encoder(hdmi->connector, encoder);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "failed to attach connector: %d\n", ret);
+		goto err_free_connector;
 	}

 	return 0;

-err_cleanup_hdmi:
-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_disable_i2c:
+err_free_connector:
+	drm_connector_cleanup(hdmi->connector);
+err_remove_bridge:
+	drm_bridge_remove(&hdmi->bridge);
+err_free_encoder:
+	drm_encoder_cleanup(encoder);
 	i2c_put_adapter(hdmi->ddc);
 err_disable_hclk:
 	clk_disable_unprepare(hdmi->hclk);
@@ -1106,8 +1134,9 @@ static void rk3066_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);

-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
+	drm_connector_cleanup(hdmi->connector);
+	drm_bridge_remove(&hdmi->bridge);
+	drm_encoder_cleanup(&hdmi->encoder.encoder);

 	i2c_put_adapter(hdmi->ddc);
 	clk_disable_unprepare(hdmi->hclk);
--
2.39.2

