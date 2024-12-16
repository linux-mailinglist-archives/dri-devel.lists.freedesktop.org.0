Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24DF9F37CA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 18:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92DB10E1D7;
	Mon, 16 Dec 2024 17:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tqml11iO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EF310E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 17:47:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso36565091fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734371257; x=1734976057; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oJRLQvoiM2uK9G/IvN+jPx+hGzx5GhhUNmirbsQlJV8=;
 b=Tqml11iOCdVuwsSXNG0F5OqDy6/jmUBHdpOpH4CmiRGkMmXkEe6cQu5cdZetxouuNV
 MRpzEL0YLVHEWObvHPjlYjMIiycGaYx32Q8BRyGdo/yqrPQQ+zfbZb5gNUjkaXpgFJYd
 Xz2P7F6kvj/jhsW8FRNzFMouOY29X5TQH/tQRjHjUnug6j+VOWc3a+QDXohM+wjac6H2
 xVRZmEvdFxM8s88W/lrYxc/qRlp13L0XQTZKHg/L4ZxXe7v2bfvsR0q2AB8m0dOV94Rb
 ApfHZyN2yscN0XarrSA+F0erU2fOg5EKL+D/ybgM1QonhJPv2VYOzj0WxmJgRO12H9RB
 Ge+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734371257; x=1734976057;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oJRLQvoiM2uK9G/IvN+jPx+hGzx5GhhUNmirbsQlJV8=;
 b=itDd4TIg4CXRD62smmVTOOpJ/DlHf4APTed+uJhWG3yj1JDjdAOPB+6KMEwg6FTHp6
 vCmHIJpVFTrPG2YQXfneYTmox2cMTulteTz/2bzWd+6BiD/RuUL2sqhq/8E44DeEwKlb
 XgPMkFm3xXr0mpDhZT5Axst2wJmKrptT4vUjfDSw9qv8GUTLXthY8akaXSEXacYD2wmS
 8xxMjJ1zWmgJDlEXR9JHecP40UfFe69V2Qy9Dae3P4ws9UyL2rOA7HlK6u8Dhgm/yjQl
 LPwDHyvHjNkPwhGvloPo0HfZFW+kSoVqeVHqGobSJdFBF8NFHQGOyQTtT1x/wPXBLAY3
 Lp0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEoRWIXnNmNYhtSnY+lqZWfM80qB3bE7MmnKnjntO+tLJfW/ss7gGcmBV5CfjP/jCq9aALBjU76L0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdQZEvph3IFKxDFhH7C3+FOauFqPQ6MYL/uCkeOBXVjsH5GOMG
 CDeM2bxHg/NzExw0EUrcqdXnT0xzidMtcxMxzArGQmX9cA85wZOjbCinFIbjHxQ=
X-Gm-Gg: ASbGnct4NJJ5KAbHL8IW0Pfu/zDVlJ8fyUdjgqSEl8aBRO+5zo+GY+2MxKf6EQmcZqN
 JyXq8CgAn/G1LcsjIDrjoNiZU4zGexo3c/lLCO8tE+W8SeG0zUxX+z4LRHSIeMKqjyfBUnTHNEv
 TRG17lEx2n1s4eAzUuJlSajmG1mMHUi8ugEQBH54ysWmXqXlncNOA51/60g/WFCnb9Jf2sun889
 ES+G+71gmQfMYxuL+Z3J8Uap10RiHl3RmWga/7RgyYaDKMthFBk4xaDwV9N070H2e0luqBDoek0
 YOOGrcHEUE0Ss1VmPZsMfvD+yZFlUjb7LK0s
X-Google-Smtp-Source: AGHT+IE7Nu2UZ05CbJ5TijHkK7V7tWXZvLvPyH+Y6uLbXlSNImUM95D3nGxGooUa/clMhfRqrHaYLA==
X-Received: by 2002:a05:651c:501:b0:302:34da:ac30 with SMTP id
 38308e7fff4ca-302544617f2mr44913431fa.18.1734371256503; 
 Mon, 16 Dec 2024 09:47:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344062bd3sm9649911fa.66.2024.12.16.09.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 09:47:35 -0800 (PST)
Date: Mon, 16 Dec 2024 19:47:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
 <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
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

On Mon, Dec 16, 2024 at 06:04:41PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Dec 06, 2024 at 12:15:57PM +0200, Dmitry Baryshkov wrote:
> > Several DRM drivers implement HDMI codec support (despite its name it
> > applies to both HDMI and DisplayPort drivers). Implement generic
> > framework to be used by these drivers. This removes a requirement to
> > implement get_eld() callback and provides default implementation for
> > codec's plug handling.
> > 
> > The framework is integrated with the DRM HDMI Connector framework, but
> > can be used by DisplayPort drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/Makefile                   |   1 +
> >  drivers/gpu/drm/drm_connector.c            |   5 +
> >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 185 +++++++++++++++++++++++++++++
> >  include/drm/drm_connector.h                |  80 +++++++++++++
> >  4 files changed, 271 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 1677c1f335fbb0c6114bdb4cc0b12eb407d84564..afdd9268ca23ac7602e73bbe45f3f9cd090a3afd 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -42,6 +42,7 @@ drm-y := \
> >  	drm_cache.o \
> >  	drm_color_mgmt.o \
> >  	drm_connector.o \
> > +	drm_connector_hdmi_codec.o \
> >  	drm_crtc.o \
> >  	drm_displayid.o \
> >  	drm_drv.o \
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index bbdaaf7022b62d84594a29f1b60144920903a99a..4abfbded962bf45b793a2bd5b1b5c4d9f478a1f7 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -33,6 +33,7 @@
> >  #include <drm/drm_sysfs.h>
> >  #include <drm/drm_utils.h>
> >  
> > +#include <linux/platform_device.h>
> >  #include <linux/property.h>
> >  #include <linux/uaccess.h>
> >  
> > @@ -280,6 +281,7 @@ static int __drm_connector_init(struct drm_device *dev,
> >  	mutex_init(&connector->eld_mutex);
> >  	mutex_init(&connector->edid_override_mutex);
> >  	mutex_init(&connector->hdmi.infoframes.lock);
> > +	mutex_init(&connector->hdmi_codec.lock);
> >  	connector->edid_blob_ptr = NULL;
> >  	connector->epoch_counter = 0;
> >  	connector->tile_blob_ptr = NULL;
> > @@ -632,6 +634,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >  		    DRM_CONNECTOR_REGISTERED))
> >  		drm_connector_unregister(connector);
> >  
> > +	platform_device_unregister(connector->hdmi_codec.codec_pdev);
> > +
> >  	if (connector->privacy_screen) {
> >  		drm_privacy_screen_put(connector->privacy_screen);
> >  		connector->privacy_screen = NULL;
> > @@ -670,6 +674,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >  		connector->funcs->atomic_destroy_state(connector,
> >  						       connector->state);
> >  
> > +	mutex_destroy(&connector->hdmi_codec.lock);
> >  	mutex_destroy(&connector->hdmi.infoframes.lock);
> >  	mutex_destroy(&connector->mutex);
> >  
> > diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1934fb53b4d128434559970c9fea548bbc4bedda
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> > @@ -0,0 +1,185 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2024 Linaro Ltd
> > + */
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_device.h>
> > +
> > +#include <sound/hdmi-codec.h>
> > +
> > +static int drm_connector_hdmi_codec_audio_startup(struct device *dev, void *data)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	if (funcs->audio_startup)
> > +		return funcs->audio_startup(connector);
> > +
> > +	return 0;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_prepare(struct device *dev, void *data,
> > +					    struct hdmi_codec_daifmt *fmt,
> > +					    struct hdmi_codec_params *hparms)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	return funcs->prepare(connector, fmt, hparms);
> > +}
> > +
> > +static void drm_connector_hdmi_codec_audio_shutdown(struct device *dev, void *data)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	return funcs->audio_shutdown(connector);
> > +}
> > +
> > +static int drm_connector_hdmi_codec_mute_stream(struct device *dev, void *data,
> > +						bool enable, int direction)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	if (funcs->mute_stream)
> > +		return funcs->mute_stream(connector, enable, direction);
> > +
> > +	return -ENOTSUPP;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_get_dai_id(struct snd_soc_component *comment,
> > +		  struct device_node *endpoint,
> > +		  void *data)
> > +{
> > +	struct drm_connector *connector = data;
> > +	struct of_endpoint of_ep;
> > +	int ret;
> > +
> > +	if (connector->hdmi_codec.dai_port < 0)
> > +		return -ENOTSUPP;
> > +
> > +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (of_ep.port == connector->hdmi_codec.dai_port)
> > +		return 0;
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
> > +					    uint8_t *buf, size_t len)
> > +{
> > +	struct drm_connector *connector = data;
> > +
> > +	mutex_lock(&connector->eld_mutex);
> > +	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> > +	mutex_unlock(&connector->eld_mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> > +						    void *data,
> > +						    hdmi_codec_plugged_cb fn,
> > +						    struct device *codec_dev)
> > +{
> > +	struct drm_connector *connector = data;
> > +
> > +	mutex_lock(&connector->hdmi_codec.lock);
> > +
> > +	connector->hdmi_codec.plugged_cb = fn;
> > +	connector->hdmi_codec.plugged_cb_dev = codec_dev;
> > +
> > +	fn(codec_dev, connector->hdmi_codec.last_state);
> > +
> > +	mutex_unlock(&connector->hdmi_codec.lock);
> > +
> > +	return 0;
> > +}
> > +
> > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
> > +					     bool plugged)
> > +{
> > +	mutex_lock(&connector->hdmi_codec.lock);
> > +
> > +	connector->hdmi_codec.last_state = plugged;
> > +
> > +	if (connector->hdmi_codec.plugged_cb &&
> > +	    connector->hdmi_codec.plugged_cb_dev)
> > +		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> > +						 connector->hdmi_codec.last_state);
> > +
> > +	mutex_unlock(&connector->hdmi_codec.lock);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > +
> > +static const struct hdmi_codec_ops drm_connector_hdmi_codec_ops = {
> > +	.audio_startup = drm_connector_hdmi_codec_audio_startup,
> > +	.prepare = drm_connector_hdmi_codec_prepare,
> > +	.audio_shutdown = drm_connector_hdmi_codec_audio_shutdown,
> > +	.mute_stream = drm_connector_hdmi_codec_mute_stream,
> > +	.get_eld = drm_connector_hdmi_codec_get_eld,
> > +	.get_dai_id = drm_connector_hdmi_codec_get_dai_id,
> > +	.hook_plugged_cb = drm_connector_hdmi_codec_hook_plugged_cb,
> > +};
> > +
> > +/**
> > + * drm_connector_hdmi_codec_init - Initialize HDMI Codec device for the DRM connector
> 
> I think it'd be better to call it drm_connector_hdmi_audio_init over
> drm_connector_hdmi_codec_init (feature over implementation).
> 
> > + * @connector: A pointer to the connector to allocate codec for
> > + * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
> > + * @max_i2s_playback_channels: maximum number of playback I2S channels
> > + * @spdif_playback: set if HDMI codec has S/PDIF playback port
> > + * @dai_port: sound DAI port, -1 if it is not enabled
> > + *
> > + * Create a HDMI codec device to be used with the specified connector.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int drm_connector_hdmi_codec_init(struct drm_connector *connector,
> > +				  struct device *hdmi_codec_dev,
> > +				  unsigned int max_i2s_playback_channels,
> > +				  bool spdif_playback,
> > +				  int dai_port)
> > +{
> > +	struct hdmi_codec_pdata codec_pdata = {
> > +		.ops = &drm_connector_hdmi_codec_ops,
> > +		.max_i2s_channels = max_i2s_playback_channels,
> > +		.i2s = !!max_i2s_playback_channels,
> > +		.spdif = spdif_playback,
> > +		.no_i2s_capture = true,
> > +		.no_spdif_capture = true,
> > +		.data = connector,
> > +	};
> > +	struct platform_device *pdev;
> > +
> > +	connector->hdmi_codec.dai_port = dai_port;
> > +
> > +	if (!connector->hdmi.funcs->codec_funcs->prepare ||
> > +	    !connector->hdmi.funcs->codec_funcs->audio_shutdown)
> > +		return -EINVAL;
> > +
> > +	pdev = platform_device_register_data(hdmi_codec_dev,
> > +					     HDMI_CODEC_DRV_NAME,
> > +					     PLATFORM_DEVID_AUTO,
> > +					     &codec_pdata, sizeof(codec_pdata));
> > +	if (IS_ERR(pdev))
> > +		return PTR_ERR(pdev);
> > +
> > +	connector->hdmi_codec.codec_pdev = pdev;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_codec_init);
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 1e2b25e204cb523d61d30f5409faa059bf2b86eb..1d113c0ceec7ce8196a412d7c00a1737175c6fbe 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -46,6 +46,8 @@ struct drm_property_blob;
> >  struct drm_printer;
> >  struct drm_privacy_screen;
> >  struct edid;
> > +struct hdmi_codec_daifmt;
> > +struct hdmi_codec_params;
> >  struct i2c_adapter;
> >  
> >  enum drm_connector_force {
> > @@ -1141,6 +1143,52 @@ struct drm_connector_state {
> >  	struct drm_connector_hdmi_state hdmi;
> >  };
> >  
> > +struct drm_connector_hdmi_codec_funcs {
> > +	/**
> > +	 * @audio_startup:
> > +	 *
> > +	 * Called when ASoC starts an audio stream setup. The
> > +	 * @hdmi_audio_startup is optional.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code otherwise
> > +	 */
> > +	int (*audio_startup)(struct drm_connector *connector);
> > +
> > +	/**
> > +	 * @prepare:
> > +	 * Configures HDMI-encoder for audio stream. Can be called
> > +	 * multiple times for each setup. Mandatory.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code otherwise
> > +	 */
> > +	int (*prepare)(struct drm_connector *connector,
> > +		       struct hdmi_codec_daifmt *fmt,
> > +		       struct hdmi_codec_params *hparms);
> 
> Missing newline
> 
> > +	/**
> > +	 * @audio_shutdown:
> > +	 *
> > +	 * Shut down the audio stream. Mandatory.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code otherwise
> > +	 */
> > +	void (*audio_shutdown)(struct drm_connector *connector);
> 
> And thus we can probably just call that one shutdown?

It should be called automatically by the sound system. I'd rather not
call items directly that we are not supposed to call.

-- 
With best wishes
Dmitry
