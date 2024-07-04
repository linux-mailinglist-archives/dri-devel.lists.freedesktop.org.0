Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B092776B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 15:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29310E055;
	Thu,  4 Jul 2024 13:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hlOxrj7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E0D10E055
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 13:48:16 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a77b4387302so86554866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720100895; x=1720705695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iI+L0uJTfei+H4iOkc8eBSpcQ6o2OxpGILgPP/6lgdA=;
 b=hlOxrj7wKefe8WbxdLzAa2wjn4BIRfaauu1cMwI5LucK0InM+wIncNRPqOCHGTp8b/
 vrOUcip6EUMPOui0WQaTaG0iUXmaB6bIvr+EqtbZkrXjAIDuRdJ0fzFffhKvVVnUW2c5
 DE6JkcWoJshbuyiQPWdY8fY9mM6rkScDwKa2k/irih1fk28C2jJWZP2gjftOKaYr2NpJ
 pWbVaKihWbydw8y0Vk0c3L47UHKvD7wneXe3BoJmOA5ncwL+X8wDZ8OkdbuoYVL+GRfi
 PUvYE4MpMeoninDWM+S8SfBjuSsdnVu7ZA3/eUvqz8ZHUOg8jq8HqxFL2WTYpE9P5SJq
 PACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720100895; x=1720705695;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iI+L0uJTfei+H4iOkc8eBSpcQ6o2OxpGILgPP/6lgdA=;
 b=WpUDrKAYrM4K+Ui5K3lzNb4qL6FbTGSM/mfrQzW4ncM/XZfYltkKSvzRFt+mRycRCg
 boDHm3iv3Y363uZ19Nd2R7abyhbeLRo3QU7HL5wJUk8sqYB6m5MfXgwEIDuKyjkuBZ7q
 UiE9wb7envpAuWhXTVrDInkbV4SRtAJih4oCZ3poCegRyGH5H5AVhiShng28KY4jAco/
 4fTpEkjmlGKbF4wzjtBOhCJpx14Ba0PkGXWE7GheTgexYGk0clqaFJhzMRUTUHoJzXfV
 RA2O3l1uyIGpmc4WKza6L8bTNI0b4yKKEzb0H4Qv2jwaNDcUeoNexOhqpL1dkpPQJ8xd
 SFVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaPsBayxU1jaNBNhiEa+h/VfGWpnoN1s+m4BDA8qf7Dc8Cu72KVDbXhR3F+Gpy5J5G3ffRfRp+klFBHzgVGqRjxv+qpxTOgs7aNnepW749
X-Gm-Message-State: AOJu0Yx+WExShS2JMU8PJFIuqm3Q50FaYRd/pdDQpak2fL0N8bmnxfO/
 rH1/fhms7V37DGpvf0+WWl5CdPkn0hR0h/f3QNTr/o79mNysm5b+
X-Google-Smtp-Source: AGHT+IGYzrdYiH/Ow9cpga56hgcUYflT97C20uUsJxefko/mreRxTqvROdAf5Hix7M06ph6/Rpqu0Q==
X-Received: by 2002:a17:906:2689:b0:a72:b1b1:eb3a with SMTP id
 a640c23a62f3a-a77ba46ce71mr103049466b.19.1720100894615; 
 Thu, 04 Jul 2024 06:48:14 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:1:32d0:42ff:fe10:6983?
 (2a02-a449-4071-1-32d0-42ff-fe10-6983.fixed6.kpn.net.
 [2a02:a449:4071:1:32d0:42ff:fe10:6983])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b033f3a3sm572244266b.187.2024.07.04.06.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 06:48:14 -0700 (PDT)
Message-ID: <9f55fa12-51d9-4c85-a34f-0c42c61678e0@gmail.com>
Date: Thu, 4 Jul 2024 15:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v10] drm/rockchip: rk3066_hdmi: add sound support
To: heiko@sntech.de
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
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

Add sound support to the RK3066 HDMI driver.
The HDMI TX audio source is connected to I2S_8CH.

Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V10:
  s/audio_enable/audio_enabled
  hook to encoder->funcs->late_register
  move audio functions up to avoid adding a declaration

Changed V9:
  Use late_register and early_unregister hooks to
  (un)register the "hdmi-audio-codec" driver.
  restyle

Changed V8:
  return -EPROBE_DEFER as early as possible
  move rk3066_hdmi_audio_codec_init() function after rk3066_hdmi_register()
  restyle

Changed V7:
  rebase
---
 drivers/gpu/drm/rockchip/Kconfig       |   2 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 330 +++++++++++++++++++++++--
 2 files changed, 306 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 1bf3e2829cd0..a32ee558408c 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -102,6 +102,8 @@ config ROCKCHIP_RGB
 config ROCKCHIP_RK3066_HDMI
 	bool "Rockchip specific extensions for RK3066 HDMI"
 	depends on DRM_ROCKCHIP
+	select SND_SOC_HDMI_CODEC if SND_SOC
+	select SND_SOC_ROCKCHIP_I2S if SND_SOC
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the RK3066 HDMI driver. If you want to enable
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 784de990da1b..e3b8faf89ae2 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -15,12 +15,20 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>

+#include <sound/hdmi-codec.h>
+
 #include "rk3066_hdmi.h"

 #include "rockchip_drm_drv.h"

 #define DEFAULT_PLLA_RATE 30000000

+struct rk3066_hdmi_audio_info {
+	int channels;
+	int sample_rate;
+	int sample_width;
+};
+
 struct hdmi_data_info {
 	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
 	unsigned int enc_out_format;
@@ -40,7 +48,6 @@ struct rk3066_hdmi_i2c {

 struct rk3066_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;
 	struct regmap *grf_regmap;
 	int irq;
 	struct clk *hclk;
@@ -54,6 +61,10 @@ struct rk3066_hdmi {

 	unsigned int tmdsclk;

+	struct platform_device *audio_pdev;
+	struct rk3066_hdmi_audio_info audio;
+	bool audio_enabled;
+
 	struct hdmi_data_info hdmi_data;
 };

@@ -214,6 +225,241 @@ static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
 					HDMI_INFOFRAME_AVI, 0, 0, 0);
 }

+static int rk3066_hdmi_config_aai(struct rk3066_hdmi *hdmi)
+{
+	union hdmi_infoframe frame;
+	int rc;
+
+	rc = hdmi_audio_infoframe_init(&frame.audio);
+
+	frame.audio.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	frame.audio.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+	frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	frame.audio.channels = hdmi->audio.channels;
+
+	return rk3066_hdmi_upload_frame(hdmi, rc, &frame,
+					HDMI_INFOFRAME_AAI, 0, 0, 0);
+}
+
+static int rk3066_hdmi_audio_config(struct rk3066_hdmi *hdmi)
+{
+	u32 rate, channel, word_length, N, CTS;
+	struct rk3066_hdmi_audio_info *audio = &hdmi->audio;
+	u64 tmp;
+
+	if (audio->channels < 3)
+		channel = HDMI_AUDIO_I2S_CHANNEL_1_2;
+	else if (audio->channels < 5)
+		channel = HDMI_AUDIO_I2S_CHANNEL_3_4;
+	else if (audio->channels < 7)
+		channel = HDMI_AUDIO_I2S_CHANNEL_5_6;
+	else
+		channel = HDMI_AUDIO_I2S_CHANNEL_7_8;
+
+	switch (audio->sample_rate) {
+	case 32000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_32000;
+		N = N_32K;
+		break;
+	case 44100:
+		rate = HDMI_AUDIO_SAMPLE_FRE_44100;
+		N = N_441K;
+		break;
+	case 48000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_48000;
+		N = N_48K;
+		break;
+	case 88200:
+		rate = HDMI_AUDIO_SAMPLE_FRE_88200;
+		N = N_882K;
+		break;
+	case 96000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_96000;
+		N = N_96K;
+		break;
+	case 176400:
+		rate = HDMI_AUDIO_SAMPLE_FRE_176400;
+		N = N_1764K;
+		break;
+	case 192000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_192000;
+		N = N_192K;
+		break;
+	default:
+		DRM_DEV_ERROR(hdmi->dev, "no support for sample rate %d\n",
+			      audio->sample_rate);
+		return -ENOENT;
+	}
+
+	switch (audio->sample_width) {
+	case 16:
+		word_length = 0x02;
+		break;
+	case 20:
+		word_length = 0x0a;
+		break;
+	case 24:
+		word_length = 0x0b;
+		break;
+	default:
+		DRM_DEV_ERROR(hdmi->dev, "no support for word length %d\n",
+			      audio->sample_width);
+		return -ENOENT;
+	}
+
+	tmp = (u64)hdmi->tmdsclk * N;
+	do_div(tmp, 128 * audio->sample_rate);
+	CTS = tmp;
+
+	/* Set_audio source I2S. */
+	hdmi_writeb(hdmi, HDMI_AUDIO_CTRL1, 0x00);
+	hdmi_writeb(hdmi, HDMI_AUDIO_CTRL2, 0x40);
+	hdmi_writeb(hdmi, HDMI_I2S_AUDIO_CTRL,
+		    HDMI_AUDIO_I2S_FORMAT_STANDARD | channel);
+	hdmi_writeb(hdmi, HDMI_I2S_SWAP, 0x00);
+	hdmi_modb(hdmi, HDMI_AV_CTRL1, HDMI_AUDIO_SAMPLE_FRE_MASK, rate);
+	hdmi_writeb(hdmi, HDMI_AUDIO_SRC_NUM_AND_LENGTH, word_length);
+
+	/* Set N value. */
+	hdmi_modb(hdmi, HDMI_LR_SWAP_N3,
+		  HDMI_AUDIO_N_19_16_MASK, (N >> 16) & 0x0F);
+	hdmi_writeb(hdmi, HDMI_N2, (N >> 8) & 0xFF);
+	hdmi_writeb(hdmi, HDMI_N1, N & 0xFF);
+
+	/* Set CTS value. */
+	hdmi_writeb(hdmi, HDMI_CTS_EXT1, CTS & 0xff);
+	hdmi_writeb(hdmi, HDMI_CTS_EXT2, (CTS >> 8) & 0xff);
+	hdmi_writeb(hdmi, HDMI_CTS_EXT3, (CTS >> 16) & 0xff);
+
+	if (audio->channels > 2)
+		hdmi_modb(hdmi, HDMI_LR_SWAP_N3,
+			  HDMI_AUDIO_LR_SWAP_MASK,
+			  HDMI_AUDIO_LR_SWAP_SUBPACKET1);
+	rate = (~(rate >> 4)) & 0x0f;
+	hdmi_writeb(hdmi, HDMI_AUDIO_STA_BIT_CTRL1, rate);
+	hdmi_writeb(hdmi, HDMI_AUDIO_STA_BIT_CTRL2, 0);
+
+	return rk3066_hdmi_config_aai(hdmi);
+}
+
+static int rk3066_hdmi_audio_hw_params(struct device *dev, void *d,
+				       struct hdmi_codec_daifmt *daifmt,
+				       struct hdmi_codec_params *params)
+{
+	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
+	struct drm_display_info *display = &hdmi->connector.display_info;
+
+	if (!display->has_audio) {
+		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
+		return -ENODEV;
+	}
+
+	if (!hdmi->encoder.encoder.crtc)
+		return -ENODEV;
+
+	switch (daifmt->fmt) {
+	case HDMI_I2S:
+		break;
+	default:
+		DRM_DEV_ERROR(dev, "invalid format %d\n", daifmt->fmt);
+		return -EINVAL;
+	}
+
+	hdmi->audio.channels = params->channels;
+	hdmi->audio.sample_rate = params->sample_rate;
+	hdmi->audio.sample_width = params->sample_width;
+
+	return rk3066_hdmi_audio_config(hdmi);
+}
+
+static void rk3066_hdmi_audio_shutdown(struct device *dev, void *d)
+{
+	/* Do nothing. */
+}
+
+static int rk3066_hdmi_audio_mute_stream(struct device *dev, void *d, bool mute, int direction)
+{
+	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
+	struct drm_display_info *display = &hdmi->connector.display_info;
+
+	if (!display->has_audio) {
+		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
+		return -ENODEV;
+	}
+
+	hdmi->audio_enabled = !mute;
+
+	if (mute)
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_DISABLE, HDMI_AUDIO_DISABLE);
+	else
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2, HDMI_AUDIO_DISABLE, 0);
+
+	/*
+	 * Under power mode E we need to reset the audio capture logic to
+	 * make the audio setting update.
+	 */
+	if (rk3066_hdmi_get_power_mode(hdmi) == HDMI_SYS_POWER_MODE_E) {
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK,
+			  HDMI_AUDIO_CP_LOGIC_RESET);
+		usleep_range(900, 1000);
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK, 0);
+	}
+
+	return 0;
+}
+
+static int rk3066_hdmi_audio_get_eld(struct device *dev, void *d, u8 *buf, size_t len)
+{
+	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
+	struct drm_mode_config *config = &hdmi->encoder.encoder.dev->mode_config;
+	struct drm_connector *connector;
+	int ret = -ENODEV;
+
+	mutex_lock(&config->mutex);
+	list_for_each_entry(connector, &config->connector_list, head) {
+		if (&hdmi->encoder.encoder == connector->encoder) {
+			memcpy(buf, connector->eld,
+			       min(sizeof(connector->eld), len));
+			ret = 0;
+		}
+	}
+	mutex_unlock(&config->mutex);
+
+	return ret;
+}
+
+static const struct hdmi_codec_ops rk3066_hdmi_audio_codec_ops = {
+	.hw_params       = rk3066_hdmi_audio_hw_params,
+	.audio_shutdown  = rk3066_hdmi_audio_shutdown,
+	.mute_stream     = rk3066_hdmi_audio_mute_stream,
+	.get_eld         = rk3066_hdmi_audio_get_eld,
+	.no_capture_mute = 1,
+};
+
+static int rk3066_hdmi_audio_codec_init(struct rk3066_hdmi *hdmi)
+{
+	struct hdmi_codec_pdata rk3066_hdmi_codec_data = {
+		.i2s = 1,
+		.ops = &rk3066_hdmi_audio_codec_ops,
+		.max_i2s_channels = 8,
+	};
+
+	hdmi->audio.channels = 2;
+	hdmi->audio.sample_rate = 48000;
+	hdmi->audio.sample_width = 16;
+	hdmi->audio_enabled = false;
+	hdmi->audio_pdev = platform_device_register_data(hdmi->dev,
+							 HDMI_CODEC_DRV_NAME,
+							 PLATFORM_DEVID_NONE,
+							 &rk3066_hdmi_codec_data,
+							 sizeof(rk3066_hdmi_codec_data));
+
+	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -364,6 +610,7 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK,
 			  HDMI_VIDEO_MODE_HDMI);
 		rk3066_hdmi_config_avi(hdmi, mode);
+		rk3066_hdmi_audio_config(hdmi);
 	} else {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK, 0);
 	}
@@ -380,9 +627,20 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	 */
 	rk3066_hdmi_i2c_init(hdmi);

-	/* Unmute video output. */
+	/* Unmute video and audio output. */
 	hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
 		  HDMI_VIDEO_AUDIO_DISABLE_MASK, HDMI_AUDIO_DISABLE);
+	if (hdmi->audio_enabled) {
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2, HDMI_AUDIO_DISABLE, 0);
+		/* Reset audio capture logic. */
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK,
+			  HDMI_AUDIO_CP_LOGIC_RESET);
+		usleep_range(900, 1000);
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK, 0);
+	}
+
 	return 0;
 }

@@ -431,6 +689,7 @@ static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder,
 			  HDMI_AUDIO_CP_LOGIC_RESET);
 		usleep_range(500, 510);
 	}
+
 	rk3066_hdmi_set_power_mode(hdmi, HDMI_SYS_POWER_MODE_A);
 }

@@ -447,6 +706,26 @@ rk3066_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }

+static int rk3066_hdmi_encoder_late_register(struct drm_encoder *encoder)
+{
+	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+
+	return rk3066_hdmi_audio_codec_init(hdmi);
+}
+
+static void rk3066_hdmi_encoder_early_unregister(struct drm_encoder *encoder)
+{
+	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+
+	platform_device_unregister(hdmi->audio_pdev);
+}
+
+static const struct drm_encoder_funcs rk3066_hdmi_encoder_funcs = {
+	.destroy          = drm_encoder_cleanup,
+	.late_register    = rk3066_hdmi_encoder_late_register,
+	.early_unregister = rk3066_hdmi_encoder_early_unregister,
+};
+
 static const
 struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
 	.atomic_check   = rk3066_hdmi_encoder_atomic_check,
@@ -519,41 +798,28 @@ static void rk3066_hdmi_connector_destroy(struct drm_connector *connector)
 }

 static const struct drm_connector_funcs rk3066_hdmi_connector_funcs = {
-	.fill_modes = rk3066_hdmi_probe_single_connector_modes,
-	.detect = rk3066_hdmi_connector_detect,
-	.destroy = rk3066_hdmi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes             = rk3066_hdmi_probe_single_connector_modes,
+	.detect                 = rk3066_hdmi_connector_detect,
+	.destroy                = rk3066_hdmi_connector_destroy,
+	.reset                  = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
 };

 static const
 struct drm_connector_helper_funcs rk3066_hdmi_connector_helper_funcs = {
-	.get_modes = rk3066_hdmi_connector_get_modes,
-	.mode_valid = rk3066_hdmi_connector_mode_valid,
+	.get_modes    = rk3066_hdmi_connector_get_modes,
+	.mode_valid   = rk3066_hdmi_connector_mode_valid,
 	.best_encoder = rk3066_hdmi_connector_best_encoder,
 };

-static int
-rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
+static int rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 {
 	struct drm_encoder *encoder = &hdmi->encoder.encoder;
-	struct device *dev = hdmi->dev;
-
-	encoder->possible_crtcs =
-		drm_of_find_possible_crtcs(drm, dev->of_node);
-
-	/*
-	 * If we failed to find the CRTC(s) which this encoder is
-	 * supposed to be connected to, it's because the CRTC has
-	 * not been registered yet.  Defer probing, and hope that
-	 * the required CRTC is added later.
-	 */
-	if (encoder->possible_crtcs == 0)
-		return -EPROBE_DEFER;

 	drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, encoder, &rk3066_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);

 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;

@@ -740,6 +1006,7 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = data;
+	struct drm_encoder *encoder;
 	struct rk3066_hdmi *hdmi;
 	int irq;
 	int ret;
@@ -748,8 +1015,19 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 	if (!hdmi)
 		return -ENOMEM;

+	encoder = &hdmi->encoder.encoder;
+	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
+
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet. Defer probing and hope that
+	 * the required CRTC is added later.
+	 */
+	if (encoder->possible_crtcs == 0)
+		return -EPROBE_DEFER;
+
 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
--
2.39.2

