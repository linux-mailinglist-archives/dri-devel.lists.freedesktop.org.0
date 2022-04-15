Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306BD502607
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 09:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD99D10E82F;
	Fri, 15 Apr 2022 07:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BA210E82F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 07:11:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x18so1837736wrc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qT7PnujdHGo5KI+ZS2JlhxL7DxOnY10bAfmuIZqJEtA=;
 b=D0hg9COkS2eKJPKPt6V4hqSEWe67sRJCljrd0HAsD9Qq0phMQNhvy/IfmMSYzF7mKL
 3RVe9FddSjp6/ufE8faTllBP7qCUEXOgAauP5UgdXdI/9f1vWgLQbBPQx/d6d0dGwrIC
 841VlbPGK1TQeoX0ZKOiml5x9OC5XAkrEiuTeKFivEWNoTYHgLxD9m5j168I4GuD3ZD9
 QMK+8GW3iTZdzyADQKjtu4mgUvDNfYBhGeWZRWLCv/NpEnFfD+p3mcfEHFc0o4UZNflN
 /Ngtk3f0fs69/kPNOw6R3/6QJtu/7dQZcaB2OEbItrE7m9+Rl5wdbyjl9q32BRdTLEQ8
 FzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qT7PnujdHGo5KI+ZS2JlhxL7DxOnY10bAfmuIZqJEtA=;
 b=sjP0rOb6nh5KrxGQ/kWkunmYEA1g8g1MZm6yMo0K/eAa571hNCFRllIOLmAPCkVmS8
 mqkiu+PRTvB+ngw5gnIHM2x8XL6hwK69O73VVVrZUHtgCirGloXVuZ6E4kH0nfy41yxD
 ECkwfypDBsjaYtA2S9F9lJVLMpfRg3TeOrBwznzyKPQitXN85UHN2jD/8WFHJMAOetcw
 idaHofAv/ZZTOC8JBKH7ACG92haSNjk4kGLpaOBi2zi0yJas2uUYw958k0ZezoH7JS3i
 LttHniraNH5EE068SQdTR/WRUpmzz9iYyMR3FnY5AtrOhc0tca2/cduP4NfAtMyCO8mm
 S4bQ==
X-Gm-Message-State: AOAM531Latn2vRfmc8WNSUJChZlvBuUzP/t+pDvxFqOQLLkKkooOEj5O
 A/HFVu3LTaxQvOZh+nTWpWviGg==
X-Google-Smtp-Source: ABdhPJz3bsXdKFReT1daQS77IWqfPu1MdhgPHJSgdtJR5PTR3Sfk+Lh2esmnjijl6eFTpRhrJd9IwA==
X-Received: by 2002:a5d:64e7:0:b0:205:8b74:8db7 with SMTP id
 g7-20020a5d64e7000000b002058b748db7mr4514701wri.34.1650006693696; 
 Fri, 15 Apr 2022 00:11:33 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:fc5c:ffc8:c900:53c9?
 ([2001:861:44c0:66c0:fc5c:ffc8:c900:53c9])
 by smtp.gmail.com with ESMTPSA id
 h14-20020adfa4ce000000b0020a7f8aeca8sm440163wrb.16.2022.04.15.00.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 00:11:33 -0700 (PDT)
Message-ID: <a0405e00-efed-d420-16f6-68c3e05e905a@baylibre.com>
Date: Fri, 15 Apr 2022 09:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/4] drm: bridge: dw_hdmi: Audio: Add General Parallel
 Audio (GPA) driver
Content-Language: en-US
To: Sandor.yu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
References: <cover.1649989179.git.Sandor.yu@nxp.com>
 <f21ba3e8c4d9d028ac74c6f3c588ddbffe739399.1649989179.git.Sandor.yu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <f21ba3e8c4d9d028ac74c6f3c588ddbffe739399.1649989179.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2022 04:42, Sandor.yu@nxp.com wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> General Parallel Audio (GPA) interface is one of the supported
> audio interface for synopsys HDMI module, which has verified for
> i.MX8MPlus platform.
> This is initial version for GPA.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/Kconfig       |  10 +
>   drivers/gpu/drm/bridge/synopsys/Makefile      |   1 +
>   .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    | 199 ++++++++++++++++++
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 132 +++++++++++-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  13 +-
>   include/drm/bridge/dw_hdmi.h                  |   7 +
>   6 files changed, 358 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
> index 21a1be3ced0f..a4a31b669b65 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> @@ -25,6 +25,16 @@ config DRM_DW_HDMI_I2S_AUDIO
>   	  Support the I2S Audio interface which is part of the Synopsys
>   	  Designware HDMI block.
>   
> +config DRM_DW_HDMI_GP_AUDIO
> +	tristate "Synopsys Designware GP Audio interface"
> +	depends on DRM_DW_HDMI && SND
> +	select SND_PCM
> +	select SND_PCM_ELD
> +	select SND_PCM_IEC958
> +	help
> +	  Support the GP Audio interface which is part of the Synopsys
> +	  Designware HDMI block.
> +
>   config DRM_DW_HDMI_CEC
>   	tristate "Synopsis Designware CEC interface"
>   	depends on DRM_DW_HDMI
> diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
> index 91d746ad5de1..ce715562e9e5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Makefile
> +++ b/drivers/gpu/drm/bridge/synopsys/Makefile
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
>   obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
> +obj-$(CONFIG_DRM_DW_HDMI_GP_AUDIO) += dw-hdmi-gp-audio.o
>   obj-$(CONFIG_DRM_DW_HDMI_I2S_AUDIO) += dw-hdmi-i2s-audio.o
>   obj-$(CONFIG_DRM_DW_HDMI_CEC) += dw-hdmi-cec.o
>   
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> new file mode 100644
> index 000000000000..8ca401b0dc2b
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * dw-hdmi-gp-audio.c
> + *
> + * Copyright 2020-2022 NXP
> + */
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_connector.h>
> +
> +#include <sound/hdmi-codec.h>
> +#include <sound/asoundef.h>
> +#include <sound/core.h>
> +#include <sound/initval.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_drm_eld.h>
> +#include <sound/pcm_iec958.h>
> +#include <sound/dmaengine_pcm.h>
> +
> +#include "dw-hdmi-audio.h"
> +
> +#define DRIVER_NAME "dw-hdmi-gp-audio"
> +#define DRV_NAME    "hdmi-gp-audio"
> +
> +struct snd_dw_hdmi {
> +	struct dw_hdmi_audio_data data;
> +	struct platform_device  *audio_pdev;
> +	unsigned int pos;
> +};
> +
> +struct dw_hdmi_channel_conf {
> +	u8 conf1;
> +	u8 ca;
> +};
> +
> +/*
> + * The default mapping of ALSA channels to HDMI channels and speaker
> + * allocation bits.  Note that we can't do channel remapping here -
> + * channels must be in the same order.
> + *
> + * Mappings for alsa-lib pcm/surround*.conf files:
> + *
> + *		Front	Sur4.0	Sur4.1	Sur5.0	Sur5.1	Sur7.1
> + * Channels	2	4	6	6	6	8
> + *
> + * Our mapping from ALSA channel to CEA686D speaker name and HDMI channel:
> + *
> + *				Number of ALSA channels
> + * ALSA Channel	2	3	4	5	6	7	8
> + * 0		FL:0	=	=	=	=	=	=
> + * 1		FR:1	=	=	=	=	=	=
> + * 2			FC:3	RL:4	LFE:2	=	=	=
> + * 3				RR:5	RL:4	FC:3	=	=
> + * 4					RR:5	RL:4	=	=
> + * 5						RR:5	=	=
> + * 6							RC:6	=
> + * 7							RLC/FRC	RLC/FRC
> + */
> +static struct dw_hdmi_channel_conf default_hdmi_channel_config[7] = {
> +	{ 0x03, 0x00 },	/* FL,FR */
> +	{ 0x0b, 0x02 },	/* FL,FR,FC */
> +	{ 0x33, 0x08 },	/* FL,FR,RL,RR */
> +	{ 0x37, 0x09 },	/* FL,FR,LFE,RL,RR */
> +	{ 0x3f, 0x0b },	/* FL,FR,LFE,FC,RL,RR */
> +	{ 0x7f, 0x0f },	/* FL,FR,LFE,FC,RL,RR,RC */
> +	{ 0xff, 0x13 },	/* FL,FR,LFE,FC,RL,RR,[FR]RC,[FR]LC */
> +};
> +
> +static int audio_hw_params(struct device *dev,  void *data,
> +			   struct hdmi_codec_daifmt *daifmt,
> +			   struct hdmi_codec_params *params)
> +{
> +	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
> +	int ret = 0;
> +	u8 ca;
> +
> +	dw_hdmi_set_sample_rate(dw->data.hdmi, params->sample_rate);
> +
> +	ca = default_hdmi_channel_config[params->channels - 2].ca;
> +
> +	dw_hdmi_set_channel_count(dw->data.hdmi, params->channels);
> +	dw_hdmi_set_channel_allocation(dw->data.hdmi, ca);
> +
> +	dw_hdmi_set_sample_non_pcm(dw->data.hdmi,
> +				   params->iec.status[0] & IEC958_AES0_NONAUDIO);
> +	dw_hdmi_set_sample_width(dw->data.hdmi, params->sample_width);
> +
> +	return ret;
> +}
> +
> +static void audio_shutdown(struct device *dev, void *data)
> +{
> +}
> +
> +static int audio_mute_stream(struct device *dev, void *data,
> +			      bool enable, int direction)
> +{
> +	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	if (!enable)
> +		dw_hdmi_audio_enable(dw->data.hdmi);
> +	else
> +		dw_hdmi_audio_disable(dw->data.hdmi);
> +
> +	return ret;
> +}
> +
> +static int audio_get_eld(struct device *dev, void *data,
> +			 u8 *buf, size_t len)
> +{
> +	struct dw_hdmi_audio_data *audio = data;
> +	u8 *eld;
> +
> +	eld = audio->get_eld(audio->hdmi);
> +	if (eld)
> +		memcpy(buf, eld, min_t(size_t, MAX_ELD_BYTES, len));
> +	else
> +		/* Pass en empty ELD if connector not available */
> +		memset(buf, 0, len);
> +
> +	return 0;
> +}
> +
> +static int audio_hook_plugged_cb(struct device *dev, void *data,
> +				 hdmi_codec_plugged_cb fn,
> +				 struct device *codec_dev)
> +{
> +	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
> +
> +	return dw_hdmi_set_plugged_cb(dw->data.hdmi, fn, codec_dev);
> +}
> +
> +static const struct hdmi_codec_ops audio_codec_ops = {
> +	.hw_params = audio_hw_params,
> +	.audio_shutdown = audio_shutdown,
> +	.mute_stream = audio_mute_stream,
> +	.get_eld = audio_get_eld,
> +	.hook_plugged_cb = audio_hook_plugged_cb,
> +};
> +
> +static int snd_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct dw_hdmi_audio_data *data = pdev->dev.platform_data;
> +	struct snd_dw_hdmi *dw;
> +
> +	const struct hdmi_codec_pdata codec_data = {
> +		.i2s = 1,
> +		.spdif = 0,
> +		.ops = &audio_codec_ops,
> +		.max_i2s_channels = 8,
> +		.data = data,
> +	};
> +
> +	dw = devm_kzalloc(&pdev->dev, sizeof(*dw), GFP_KERNEL);
> +	if (!dw)
> +		return -ENOMEM;
> +
> +	dw->data = *data;
> +
> +	platform_set_drvdata(pdev, dw);
> +
> +	dw->audio_pdev = platform_device_register_data(&pdev->dev,
> +						       HDMI_CODEC_DRV_NAME, 1,
> +						       &codec_data,
> +						       sizeof(codec_data));
> +
> +	return PTR_ERR_OR_ZERO(dw->audio_pdev);
> +}
> +
> +static int snd_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct snd_dw_hdmi *dw = platform_get_drvdata(pdev);
> +
> +	platform_device_unregister(dw->audio_pdev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver snd_dw_hdmi_driver = {
> +	.probe	= snd_dw_hdmi_probe,
> +	.remove	= snd_dw_hdmi_remove,
> +	.driver	= {
> +		.name = DRIVER_NAME,
> +	},
> +};
> +
> +module_platform_driver(snd_dw_hdmi_driver);
> +
> +MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
> +MODULE_DESCRIPTION("Synopsys Designware HDMI GPA ALSA interface");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ac98605a6811..f51e199a7493 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -191,7 +191,10 @@ struct dw_hdmi {
>   
>   	spinlock_t audio_lock;
>   	struct mutex audio_mutex;
> +	unsigned int sample_non_pcm;
> +	unsigned int sample_width;
>   	unsigned int sample_rate;
> +	unsigned int channels;
>   	unsigned int audio_cts;
>   	unsigned int audio_n;
>   	bool audio_enable;
> @@ -589,6 +592,8 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
>   			n = 4096;
>   		else if (pixel_clk == 74176000 || pixel_clk == 148352000)
>   			n = 11648;
> +		else if (pixel_clk == 297000000)
> +			n = 3072;
>   		else
>   			n = 4096;
>   		n *= mult;
> @@ -601,6 +606,8 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
>   			n = 17836;
>   		else if (pixel_clk == 148352000)
>   			n = 8918;
> +		else if (pixel_clk == 297000000)
> +			n = 4704;
>   		else
>   			n = 6272;
>   		n *= mult;
> @@ -615,6 +622,8 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
>   			n = 11648;
>   		else if (pixel_clk == 148352000)
>   			n = 5824;
> +		else if (pixel_clk == 297000000)
> +			n = 5120;
>   		else
>   			n = 6144;
>   		n *= mult;
> @@ -659,8 +668,8 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
>   
>   	config3 = hdmi_readb(hdmi, HDMI_CONFIG3_ID);
>   
> -	/* Only compute CTS when using internal AHB audio */
> -	if (config3 & HDMI_CONFIG3_AHBAUDDMA) {
> +	/* Compute CTS when using internal AHB audio or General Parallel audio*/
> +	if ((config3 & HDMI_CONFIG3_AHBAUDDMA) || (config3 & HDMI_CONFIG3_GPAUD)) {
>   		/*
>   		 * Compute the CTS value from the N value.  Note that CTS and N
>   		 * can be up to 20 bits in total, so we need 64-bit math.  Also
> @@ -702,6 +711,22 @@ static void hdmi_clk_regenerator_update_pixel_clock(struct dw_hdmi *hdmi)
>   	mutex_unlock(&hdmi->audio_mutex);
>   }
>   
> +void dw_hdmi_set_sample_width(struct dw_hdmi *hdmi, unsigned int width)
> +{
> +	mutex_lock(&hdmi->audio_mutex);
> +	hdmi->sample_width = width;
> +	mutex_unlock(&hdmi->audio_mutex);
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_width);
> +
> +void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm)
> +{
> +	mutex_lock(&hdmi->audio_mutex);
> +	hdmi->sample_non_pcm = non_pcm;
> +	mutex_unlock(&hdmi->audio_mutex);
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_non_pcm);
> +
>   void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate)
>   {
>   	mutex_lock(&hdmi->audio_mutex);
> @@ -717,6 +742,7 @@ void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt)
>   	u8 layout;
>   
>   	mutex_lock(&hdmi->audio_mutex);
> +	hdmi->channels = cnt;
>   
>   	/*
>   	 * For >2 channel PCM audio, we need to select layout 1
> @@ -765,6 +791,89 @@ static u8 *hdmi_audio_get_eld(struct dw_hdmi *hdmi)
>   	return hdmi->curr_conn->eld;
>   }
>   
> +static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
> +{
> +	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
> +	int sample_freq = 0x2, org_sample_freq = 0xD;
> +	int ch_mask = BIT(hdmi->channels) - 1;
> +
> +	switch (hdmi->sample_rate) {
> +	case 32000:
> +		sample_freq = 0x03;
> +		org_sample_freq = 0x0C;
> +		break;
> +	case 44100:
> +		sample_freq = 0x00;
> +		org_sample_freq = 0x0F;
> +		break;
> +	case 48000:
> +		sample_freq = 0x02;
> +		org_sample_freq = 0x0D;
> +		break;
> +	case 88200:
> +		sample_freq = 0x08;
> +		org_sample_freq = 0x07;
> +		break;
> +	case 96000:
> +		sample_freq = 0x0A;
> +		org_sample_freq = 0x05;
> +		break;
> +	case 176400:
> +		sample_freq = 0x0C;
> +		org_sample_freq = 0x03;
> +		break;
> +	case 192000:
> +		sample_freq = 0x0E;
> +		org_sample_freq = 0x01;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
> +	hdmi_enable_audio_clk(hdmi, true);
> +
> +	hdmi_writeb(hdmi, 0x1, HDMI_FC_AUDSCHNLS0);
> +	hdmi_writeb(hdmi, hdmi->channels, HDMI_FC_AUDSCHNLS2);
> +	hdmi_writeb(hdmi, 0x22, HDMI_FC_AUDSCHNLS3);
> +	hdmi_writeb(hdmi, 0x22, HDMI_FC_AUDSCHNLS4);
> +	hdmi_writeb(hdmi, 0x11, HDMI_FC_AUDSCHNLS5);
> +	hdmi_writeb(hdmi, 0x11, HDMI_FC_AUDSCHNLS6);
> +	hdmi_writeb(hdmi, (0x3 << 4) | sample_freq, HDMI_FC_AUDSCHNLS7);
> +	hdmi_writeb(hdmi, (org_sample_freq << 4) | 0xb, HDMI_FC_AUDSCHNLS8);
> +
> +	hdmi_writeb(hdmi, ch_mask, HDMI_GP_CONF1);
> +	hdmi_writeb(hdmi, 0x02, HDMI_GP_CONF2);
> +	hdmi_writeb(hdmi, 0x01, HDMI_GP_CONF0);
> +
> +	hdmi_modb(hdmi,  0x3, 0x3, HDMI_FC_DATAUTO3);
> +
> +	/* hbr */
> +	if (hdmi->sample_rate == 192000 && hdmi->channels == 8 &&
> +			hdmi->sample_width == 32 && hdmi->sample_non_pcm)
> +		hdmi_modb(hdmi, 0x01, 0x01, HDMI_GP_CONF2);
> +
> +	if (pdata->enable_audio)
> +		pdata->enable_audio(hdmi,
> +					    hdmi->channels,
> +					    hdmi->sample_width,
> +					    hdmi->sample_rate,
> +					    hdmi->sample_non_pcm);
> +}
> +
> +static void dw_hdmi_gp_audio_disable(struct dw_hdmi *hdmi)
> +{
> +	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
> +
> +	hdmi_set_cts_n(hdmi, hdmi->audio_cts, 0);
> +
> +	hdmi_modb(hdmi,  0, 0x3, HDMI_FC_DATAUTO3);
> +	if (pdata->disable_audio)
> +		pdata->disable_audio(hdmi);
> +
> +	hdmi_enable_audio_clk(hdmi, false);
> +}
> +
>   static void dw_hdmi_ahb_audio_enable(struct dw_hdmi *hdmi)
>   {
>   	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
> @@ -3258,6 +3367,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   	hdmi->plat_data = plat_data;
>   	hdmi->dev = dev;
>   	hdmi->sample_rate = 48000;
> +	hdmi->channels = 2;
>   	hdmi->disabled = true;
>   	hdmi->rxsense = true;
>   	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
> @@ -3481,6 +3591,24 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   		pdevinfo.size_data = sizeof(audio);
>   		pdevinfo.dma_mask = DMA_BIT_MASK(32);
>   		hdmi->audio = platform_device_register_full(&pdevinfo);
> +	} else if (iores && config3 & HDMI_CONFIG3_GPAUD) {
> +		struct dw_hdmi_audio_data audio;
> +
> +		audio.phys = iores->start;
> +		audio.base = hdmi->regs;
> +		audio.irq = irq;
> +		audio.hdmi = hdmi;
> +		audio.get_eld = hdmi_audio_get_eld;
> +
> +		hdmi->enable_audio = dw_hdmi_gp_audio_enable;
> +		hdmi->disable_audio = dw_hdmi_gp_audio_disable;
> +
> +		pdevinfo.name = "dw-hdmi-gp-audio";
> +		pdevinfo.id = PLATFORM_DEVID_NONE;
> +		pdevinfo.data = &audio;
> +		pdevinfo.size_data = sizeof(audio);
> +		pdevinfo.dma_mask = DMA_BIT_MASK(32);
> +		hdmi->audio = platform_device_register_full(&pdevinfo);
>   	}
>   
>   	if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> index 18df3e119553..af43a0414b78 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> @@ -158,8 +158,17 @@
>   #define HDMI_FC_SPDDEVICEINF                    0x1062
>   #define HDMI_FC_AUDSCONF                        0x1063
>   #define HDMI_FC_AUDSSTAT                        0x1064
> -#define HDMI_FC_AUDSCHNLS7                      0x106e
> -#define HDMI_FC_AUDSCHNLS8                      0x106f
> +#define HDMI_FC_AUDSV                           0x1065
> +#define HDMI_FC_AUDSU                           0x1066
> +#define HDMI_FC_AUDSCHNLS0                       0x1067
> +#define HDMI_FC_AUDSCHNLS1                       0x1068
> +#define HDMI_FC_AUDSCHNLS2                       0x1069
> +#define HDMI_FC_AUDSCHNLS3                       0x106A
> +#define HDMI_FC_AUDSCHNLS4                       0x106B
> +#define HDMI_FC_AUDSCHNLS5                       0x106C
> +#define HDMI_FC_AUDSCHNLS6                       0x106D
> +#define HDMI_FC_AUDSCHNLS7                       0x106E
> +#define HDMI_FC_AUDSCHNLS8                       0x106F
>   #define HDMI_FC_DATACH0FILL                     0x1070
>   #define HDMI_FC_DATACH1FILL                     0x1071
>   #define HDMI_FC_DATACH2FILL                     0x1072
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 70082f80a8c8..f668e75fbabe 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,6 +143,11 @@ struct dw_hdmi_plat_data {
>   					   const struct drm_display_info *info,
>   					   const struct drm_display_mode *mode);
>   
> +	/* Platform-specific audio enable/disable (optional) */
> +	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
> +			     int width, int rate, int non_pcm);
> +	void (*disable_audio)(struct dw_hdmi *hdmi);
> +
>   	/* Vendor PHY support */
>   	const struct dw_hdmi_phy_ops *phy_ops;
>   	const char *phy_name;
> @@ -173,6 +178,8 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
>   
>   int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
>   			   struct device *codec_dev);
> +void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm);
> +void dw_hdmi_set_sample_width(struct dw_hdmi *hdmi, unsigned int width);
>   void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
>   void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt);
>   void dw_hdmi_set_channel_status(struct dw_hdmi *hdmi, u8 *channel_status);

Looks fine for me

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

another review before merging would be great !

Thanks,
Neil
