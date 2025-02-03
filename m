Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8DA2615F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B37A10E0FD;
	Mon,  3 Feb 2025 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i44XDiSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B3B10E0FD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:28:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso4289974e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738603699; x=1739208499; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i3fVXrmH/qGkzWjMJiCN0C4GgXBWo9nKcw7EhTBNUO8=;
 b=i44XDiSHCiWRiIysND6TQ6Up17P+zFmWWL9W2erDKOK8WACiOnf26H2NMeqvnxOnHi
 6JsoWe9kDo05so4E85KJmrUHY8QgwiX/K69Ln207pvVhNAgK2WGDgGpRodmSzAV8nsSC
 b2zlQa41YLw7DZZorq9orpy8cisvuJVDGoaPsImnA+yotUrRW6Maf+t8oveNI5vv3rgN
 fT4o+RQnYq7pwE5NdPUpNgPVQj8EU5C8E2gSewUAs57zm0VeMohdESR9H2G+jDrt4uz7
 E4kgK65OCPM/pkYyn0+DXfrxTJEhifuAFmLu/IkGCMFkD/AFqZ8mYU9097EHSP/aUFiR
 Oshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603699; x=1739208499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3fVXrmH/qGkzWjMJiCN0C4GgXBWo9nKcw7EhTBNUO8=;
 b=viByapUnGOQbl8iWtKTVwRhuVIPRPCEIu/6Jakb5ISVQOh8NXYuQ90oR7tKEqnXD1g
 5KvsZppXgR2X9PA7r0aNIOnY/QSpI4CdzRNrLEmDVUWBHdF2xdXOjwCLZxOYYVpuvRs0
 bK8crHP3npjrEwdYsOsLlc+BPVFL7nngV7HkXvLpMCuTuztBliEO4X7bEYunBGGbXM0R
 Rs6Ulh6GxwrvPEXGNPBVdZkn9rs8ZG/OxBoIUQl/4/pBTbPnU2oy/hS6D3ECWQjP0hc6
 MzTg18lts+YEikoIjHramE3cBnj1M8ab413zskbuVE7qHRjGjyB4jypwmGhhwumnrvTw
 dSgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeeb2AeN0o7yERpeIA5U7N/oE1kg/swq4XRxFZwYe0E5oPUvoHnebmCKtYTK9MraMx2MQ7QY5sdhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwKK6Vi/GNvcccuCOOB6X4XnNQdlK/a2rQib/C42p4ApAcqGIp
 0uWTkh3crFhfO399+QMCcHsxrV6dERf1AbOpaQmCH1M5YA4C4orkHnayH3CEb+g=
X-Gm-Gg: ASbGncv/4lpcDMjFEhQ2ZhXKBfVIasGpH9BIr+COK0bgAyCkMHm/tY88eIS+cz04HFr
 xjuJmkD0RYXyy6jkWXWBbWCbdIXunT666kIN3XbUeKguzEfm8zxa6I8Q18Pu2g0s8vtZh/MBiLg
 EsDs8NXM0Y/j51Ie8tRqpOdBCXaEQXrMGL2onNDM5BXcKlaJnd0cyqafGpTWSasE8/Uhg1Z+9Af
 jyDJD0aWOHW85ZG+ArYsBU82msUUG3l3gJFqfxmsjuO7g6GyqUtgPoOLcCeFkym4P9vY6nNn5zj
 zfpAnP4SXyy8TfJPhfHGepAakG0S0vQZSBw6w0zWZ4o3+Kki3AFBJcen1oYtgjfNyV+Bo6M=
X-Google-Smtp-Source: AGHT+IF5KNedZT8kKbhDozYoVEzgkJbe1L364Pto4w0G8KSG3sxEE/SDw3PceZNld0nlxIBd/5AnVg==
X-Received: by 2002:a05:6512:3b2b:b0:540:2fbb:22fe with SMTP id
 2adb3069b0e04-543ffb5bc16mr49941e87.26.1738603699045; 
 Mon, 03 Feb 2025 09:28:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb7d0esm1358472e87.200.2025.02.03.09.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:28:18 -0800 (PST)
Date: Mon, 3 Feb 2025 19:28:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw
Subject: Re: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for audio
 stream setup
Message-ID: <btzdguakskos2gogmwjkz6zoquiut63kmirvdsh4yjoqqvzpin@um4hcrlnecxh>
References: <20250203-add-audio-codec-v2-1-5c8cd72ee5bb@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-add-audio-codec-v2-1-5c8cd72ee5bb@ite.com.tw>
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

On Mon, Feb 03, 2025 at 02:04:30PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> For supporting audio form I2S to DP audio data sub stream.
> Add hdmi_audio callbacks to drm_bridge_funcs for the
> HDMI codec framework. The DRM_BRIDGE_OP_HDMI flag in bridge.ops
> must be set, and hdmi_write_infoframe and hdmi_clear_infoframe
> are necessary for the drm_bridge_connector to enable the HDMI codec.

Please split this into two commits: one adding OP_HDMI, second one
adding audio support.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Changes in v2:
> - Use DRM HDMI codec framewrok for audio stream setup.
> - Link to v1: https://lore.kernel.org/r/20250121-add-audio-codec-v1-1-e3ff71b3c819@ite.com.tw
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 151 +++++++++++++++++++++++++++++++-----
>  1 file changed, 132 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6accacdd343839ff2569b31b18ceb..361e2412b8e8f040cf4254479b60588d99e8c99a 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1414,32 +1414,43 @@ static void it6505_variable_config(struct it6505 *it6505)
>  	memset(it6505->bksvs, 0, sizeof(it6505->bksvs));
>  }
>  
> +static int it6505_write_avi_infoframe(struct it6505 *it6505,
> +				      const u8 *buffer, size_t len)
> +{
> +	struct device *dev = it6505->dev;
> +
> +	if (len - HDMI_INFOFRAME_HEADER_SIZE > 13) {
> +		DRM_DEV_DEBUG_DRIVER(dev, "AVI size fail %d", len);
> +		return -EINVAL;
> +	}
> +
> +	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0);
> +	regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
> +			  buffer + HDMI_INFOFRAME_HEADER_SIZE,
> +			  len - HDMI_INFOFRAME_HEADER_SIZE);
> +
> +	it6505_write(it6505, REG_AVI_INFO_SUM, buffer[3]);
> +	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT,
> +			EN_AVI_PKT);
> +
> +	return 0;
> +}
> +
>  static int it6505_send_video_infoframe(struct it6505 *it6505,
>  				       struct hdmi_avi_infoframe *frame)
>  {
>  	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
> -	int err;
> +	int err, length;
>  	struct device *dev = it6505->dev;
>  
> -	err = hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
> -	if (err < 0) {
> -		dev_err(dev, "Failed to pack AVI infoframe: %d", err);
> -		return err;
> +	length = hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
> +	if (length < 0) {
> +		dev_err(dev, "Failed to pack AVI infoframe: %d", length);
> +		return length;
>  	}
>  
> -	err = it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0x00);
> -	if (err)
> -		return err;
> -
> -	err = regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
> -				buffer + HDMI_INFOFRAME_HEADER_SIZE,
> -				frame->length);
> -	if (err)
> -		return err;
> -
> -	err = it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT,
> -			      EN_AVI_PKT);
> -	if (err)
> +	err = it6505_write_avi_infoframe(it6505, buffer, length);

You mustn't to do this. Please instead call
drm_atomic_helper_connector_hdmi_update_infoframes() from your
.atomic_enable instead.

> +	if (err < 0)
>  		return err;
>  
>  	return 0;
> @@ -1625,6 +1636,18 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
>  			EN_AUD_CTRL_PKT);
>  }
>  
> +static void it6505_write_audio_infoframe(struct it6505 *it6505,
> +					 const u8 *buffer, size_t len)
> +{
> +	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT, 0);
> +	regmap_bulk_write(it6505->regmap, REG_AUD_INFOFRAM_DB1,
> +			  buffer + HDMI_INFOFRAME_HEADER_SIZE,
> +			  4);
> +	it6505_write(it6505, REG_AUD_INFOFRAM_SUM, buffer[3]);
> +	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT,
> +			EN_AUD_PKT);
> +}
> +
>  static void it6505_disable_audio(struct it6505 *it6505)
>  {
>  	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, EN_AUD_MUTE);
> @@ -3302,6 +3325,85 @@ static const struct drm_edid *it6505_bridge_edid_read(struct drm_bridge *bridge,
>  	return drm_edid_dup(it6505->cached_edid);
>  }
>  
> +static int it6505_bridge_hdmi_audio_startup(struct drm_connector *connector,
> +					    struct drm_bridge *bridge)
> +{
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +	struct device *dev = it6505->dev;
> +
> +	if (!it6505->powered || it6505->enable_drv_hold)
> +		return -EIO;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Audio enable");
> +	it6505_enable_audio(it6505);
> +
> +	return 0;
> +}
> +
> +static int it6505_bridge_hdmi_audio_prepare(struct drm_connector *connector,
> +					    struct drm_bridge *bridge,
> +					    struct hdmi_codec_daifmt *fmt,
> +					    struct hdmi_codec_params *hparms)
> +{
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +
> +	return it6505_audio_setup_hw_params(it6505, hparms);
> +}
> +
> +static void it6505_bridge_hdmi_audio_shutdown(struct drm_connector *connector,
> +					      struct drm_bridge *bridge)
> +{
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +
> +	if (it6505->powered && !it6505->enable_drv_hold)
> +		it6505_disable_audio(it6505);
> +}
> +
> +static int it6505_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
> +					      enum hdmi_infoframe_type type)
> +{
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +	struct device *dev = it6505->dev;
> +
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_AUDIO:
> +		it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT, 0);
> +		break;
> +
> +	case HDMI_INFOFRAME_TYPE_AVI:
> +		it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0);
> +		break;

Are SPD / Vendor InfoFrames not supported by the HW?

> +	default:
> +		dev_dbg(dev, "unsupported HDMI infoframe 0x%x\n", type);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int it6505_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
> +					      enum hdmi_infoframe_type type,
> +					      const u8 *buffer, size_t len)
> +{
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +	struct device *dev = it6505->dev;
> +
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_AUDIO:
> +		it6505_write_audio_infoframe(it6505, buffer, len);
> +		break;
> +
> +	case HDMI_INFOFRAME_TYPE_AVI:
> +		it6505_write_avi_infoframe(it6505, buffer, len);
> +		break;
> +	default:
> +		dev_dbg(dev, "unsupported HDMI infoframe 0x%x\n", type);
> +		break;
> +	}
> +
> +	return 0;
> +}

Please group functions logically, by having all InfoFrame functions next
to each other.

> +
>  static const struct drm_bridge_funcs it6505_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> @@ -3315,6 +3417,12 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
>  	.atomic_post_disable = it6505_bridge_atomic_post_disable,
>  	.detect = it6505_bridge_detect,
>  	.edid_read = it6505_bridge_edid_read,
> +	.hdmi_audio_startup = it6505_bridge_hdmi_audio_startup,
> +	.hdmi_audio_prepare = it6505_bridge_hdmi_audio_prepare,
> +	.hdmi_audio_shutdown = it6505_bridge_hdmi_audio_shutdown,
> +	.hdmi_clear_infoframe = it6505_bridge_hdmi_clear_infoframe,
> +	.hdmi_write_infoframe = it6505_bridge_hdmi_write_infoframe,

No .hdmi_tmds_char_rate_valid?

> +
>  };
>  
>  static __maybe_unused int it6505_bridge_resume(struct device *dev)
> @@ -3700,7 +3808,12 @@ static int it6505_i2c_probe(struct i2c_client *client)
>  	it6505->bridge.funcs = &it6505_bridge_funcs;
>  	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> -			     DRM_BRIDGE_OP_HPD;
> +			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_HDMI;
> +	it6505->bridge.vendor = "iTE";
> +	it6505->bridge.product = "IT6505";
> +	it6505->bridge.hdmi_audio_dev = dev;
> +	it6505->bridge.hdmi_audio_max_i2s_playback_channels = 2;
> +	it6505->bridge.hdmi_audio_dai_port = 1;
>  	drm_bridge_add(&it6505->bridge);
>  
>  	return 0;
> 
> ---
> base-commit: fe003bcb69f7bff9ff2b30b659b004dbafe52907
> change-id: 20250114-add-audio-codec-8c9d47062a6c
> 
> Best regards,
> -- 
> Hermes Wu <Hermes.wu@ite.com.tw>
> 
> 

-- 
With best wishes
Dmitry
