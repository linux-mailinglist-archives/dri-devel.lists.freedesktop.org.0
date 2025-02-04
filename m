Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10355A269D4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 02:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D55910E229;
	Tue,  4 Feb 2025 01:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LmYXIdIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FF010E229
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 01:30:13 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so5698377e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 17:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738632612; x=1739237412; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gXyRLcRnrHDXw+uDSpc+tXQVEDzlnC2DqRvS/DZvxY8=;
 b=LmYXIdIov6Sjjaqq8TXtA8xDFKeANdI+Tw2ZCosk49o0Yqos6oRgSc1Z0MtEV4pOsR
 4aQtsYw7nL1SpjFtuZDRogZwT+daBi0FEksXwh8+2kkz453NbCDEZNKbqGMEzPWS6mni
 aX77h9f9EOGBpZpDsb9m4UeHOaWvFY1gl3dSeh3TlR5Pu7k/yx+8wC6PkUVvM2Es+OPN
 xRxGZuFUYrKeLuh7bm2HnG4noT6ac6fdAoDLRrv+Mcnf97jOcru9hd12y7mgsBLDWNhJ
 wN8hqGUgUhU5gnWxvEFc54yR2QSBWUc0ivLsPyJwojNyw9FqRDQv5JVvVBDqc5z8SAIq
 jOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738632612; x=1739237412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXyRLcRnrHDXw+uDSpc+tXQVEDzlnC2DqRvS/DZvxY8=;
 b=YD0B0kysvLbnmAOXHmPJG/pmtnfhwDqxa1mgQZezrdpt4dCWRnDF+cwTVTszHG3E6Y
 DgyGEeKL60XQmLxkNuSPnVR443lm3oOwcpxU/py7hLo9F3cu4g/J7RIkA0AaIz9lGLFG
 c1BHsNpeau7ygDiusp7fZW2+nsMhdj6MDXRX7ZNLS3dh3K0EP0+7kwXV7Ea9eTa3oXvQ
 USh8Gwf3R4svkSYDGQtnHxi8en/qY4hkOHK9SGj6NlrWB/ShbJuZGfu32SK4y9/l4/sT
 YANE06CN0bH7dPnlhJglS+a1Qz+Kqn81SmA1xSn8cNnb3C0YactLdgAY4B+53JoIX8bJ
 K1KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWffqudyJS4UnMMSqSOM1AMcB2KvgPDrn5bZfXS8h3lAS9l1zAVhYO6zXBGaFOAkAM8QltUSWmQTfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+GZ5G9R9/g8ZGFW7ATKsf7nCe0vn0SwLwIIQOsZCsPlCO3o/M
 axTxhCTzidtbosbr9cvLpVgzGg1DzIXIJJm4USVtoo0wk53igXM4TUp2hv+Ji3I=
X-Gm-Gg: ASbGnctIh4JMMfMVAFdLRtpC6mlJVV0b+ObvOSYMMvBQ11IZzoCn9oKviggjZmp4QUG
 XvJ/B6J/HQ/szfUMdqW+v5E5TGxzHfEJUD6hSTowbWieD9LlqVvhlx67YxTcvwSJ3waEDG5yGQh
 TpkuBCiztJo+HNBB54FA/i4SZGBgFerC/VtzE+eUZpzd8B2tSvHxmPG6FtUdaN2km+kOBlHGiBf
 ZKh3q6Uqp2YKT2d8rO7O0Zv2CsOAllvLKsHKx6PdkZLRkW95EPgKMvNOQG107WNFovoICzNSPAh
 UF0pnV0m1rqgGn12Ag9sgOtdSXxHNafaI4HO0gWPRI2Dk4N1GxaHV56tEqYfcmO2RLO3bYE=
X-Google-Smtp-Source: AGHT+IGKujN0yEkt6uxZnNKPg9uwcCMXbHJXWjaCU94hEe3xgmhio0k6ukU8lteuV2W0H6TwRWsHlQ==
X-Received: by 2002:ac2:4895:0:b0:53a:1a81:f006 with SMTP id
 2adb3069b0e04-543e4bfbb8bmr7047889e87.31.1738632611490; 
 Mon, 03 Feb 2025 17:30:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb077dsm1460978e87.120.2025.02.03.17.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 17:30:10 -0800 (PST)
Date: Tue, 4 Feb 2025 03:30:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/7] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
Message-ID: <e4ro5wjaormqvzp6l4wyw4wbpjujwdzyvyr2rvqboubhtskhnl@62ygkdvfiwk5>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-3-1592632327f7@linaro.org>
 <c8022a2c-4ed2-494c-808e-eaff3eb5e2ba@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8022a2c-4ed2-494c-808e-eaff3eb5e2ba@quicinc.com>
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

On Mon, Feb 03, 2025 at 04:25:59PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > atomic_check hook and of the provided Infoframe infrastructure.
> > 
> 
> By atomic_check are you referring to the
> msm_hdmi_bridge_tmds_char_rate_valid()?

No, I mean drm_atomic_helper_connector_hdmi_check() being called from
drm_bridge_connector (inthe previous versions it was called from this
driver).

> 
> Also please confirm if HDMI audio was re-tested with these changes.

Yes, although not the channels allocation for the multi-channel audio. I
don't have corresponding equipment. If you think that we should start
testing that, I will check if I can get the 6.1 or 8.1 receiver and the
speakers :-)

> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/Kconfig            |   2 +
> >   drivers/gpu/drm/msm/hdmi/hdmi.c        |  45 ++-------
> >   drivers/gpu/drm/msm/hdmi/hdmi.h        |  16 +--
> >   drivers/gpu/drm/msm/hdmi/hdmi_audio.c  |  74 ++++----------
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 180 +++++++++++++++++++++++----------
> >   5 files changed, 162 insertions(+), 155 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 7ec833b6d8292f8cb26cfe5582812f2754cd4d35..974bc7c0ea761147d3326bdce9039d6f26f290d0 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -170,6 +170,8 @@ config DRM_MSM_HDMI
> >   	bool "Enable HDMI support in MSM DRM driver"
> >   	depends on DRM_MSM
> >   	default y
> > +	select DRM_DISPLAY_HDMI_HELPER
> > +	select DRM_DISPLAY_HDMI_STATE_HELPER
> >   	help
> >   	  Compile in support for the HDMI output MSM DRM driver. It can
> >   	  be a primary or a secondary display on device. Note that this is used
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 37b3809c6bdd7c35aca6b475cb1f41c0ab4d3e6d..b14205cb9e977edd0d849e0eafe9b69c0da594bd 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -12,6 +12,7 @@
> >   #include <drm/drm_bridge_connector.h>
> >   #include <drm/drm_of.h>
> > +#include <drm/display/drm_hdmi_state_helper.h>
> >   #include <sound/hdmi-codec.h>
> >   #include "hdmi.h"
> > @@ -165,8 +166,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >   	hdmi->dev = dev;
> >   	hdmi->encoder = encoder;
> > -	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
> > -
> >   	ret = msm_hdmi_bridge_init(hdmi);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
> > @@ -254,40 +253,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
> >   				    struct hdmi_codec_params *params)
> >   {
> >   	struct hdmi *hdmi = dev_get_drvdata(dev);
> > -	unsigned int chan;
> > -	unsigned int channel_allocation = 0;
> >   	unsigned int rate;
> > -	unsigned int level_shift  = 0; /* 0dB */
> > -	bool down_mix = false;
> > +	int ret;
> >   	DRM_DEV_DEBUG(dev, "%u Hz, %d bit, %d channels\n", params->sample_rate,
> >   		 params->sample_width, params->cea.channels);
> > -	switch (params->cea.channels) {
> > -	case 2:
> > -		/* FR and FL speakers */
> > -		channel_allocation  = 0;
> > -		chan = MSM_HDMI_AUDIO_CHANNEL_2;
> > -		break;
> > -	case 4:
> > -		/* FC, LFE, FR and FL speakers */
> > -		channel_allocation  = 0x3;
> > -		chan = MSM_HDMI_AUDIO_CHANNEL_4;
> > -		break;
> > -	case 6:
> > -		/* RR, RL, FC, LFE, FR and FL speakers */
> > -		channel_allocation  = 0x0B;
> > -		chan = MSM_HDMI_AUDIO_CHANNEL_6;
> > -		break;
> > -	case 8:
> > -		/* FRC, FLC, RR, RL, FC, LFE, FR and FL speakers */
> > -		channel_allocation  = 0x1F;
> > -		chan = MSM_HDMI_AUDIO_CHANNEL_8;
> > -		break;
> > -	default:
> > -		return -EINVAL;
> > -	}
> 
> This mapping table was doing two things:
> 
> 1) drop the conversion of channels to an index to nchannels[] and use the
> channels directly. This part is fine but could have been a separate change
> by itself to show the redundancy.
> 
> 2) drop the mapping table of channels to channel_allocation.
> I am not fully sure of this. Was this done because
> hdmi_codec_channel_alloc[] table in hdmi-codec does this for us?
> hdmi_codec_get_ch_alloc_table_idx() uses channels and the flags to come up
> with the idx into this table. But it seems like current MSM HDMI code did
> not consider the flags. So for example, it seems like for 6 channels, we
> could return any of the below based on the flags but MSM HDMI always used
> 0x0B so will the values match?

Do they have to match? The correct value is being calculated by the HDMI
code in ASoC and then being written into the Audio InfoFrame. If the MSM
HDMI code wasn't taking ELD data into account, then it's a bug. But... I
don't think it's worth spending too much time on fixing it separately.

In the end, that is exactly the purpose of the frameworks - to make code
error prone and to remove the need to reimplement same things over and
over again, making differnt kinds of mistakes. For example, MSM HDMI
code also doesn't implement plugged_cb support. It doesn't provide ELD
to the HDMI codec code, etc. All of that is being fixed by using the
framework. It's not worth implementing those functions in the MSM HDMI
code first only to drop them in the next commit.

> 
> 202 	{ .ca_id = 0x0b, .n_ch = 6,
> 203 	  .mask = FL | FR | LFE | FC | RL | RR},
> 204 	/* surround40 */
> 205 	{ .ca_id = 0x08, .n_ch = 6,
> 206 	  .mask = FL | FR | RL | RR },
> 207 	/* surround41 */
> 208 	{ .ca_id = 0x09, .n_ch = 6,
> 209 	  .mask = FL | FR | LFE | RL | RR },
> 210 	/* surround50 */
> 211 	{ .ca_id = 0x0a, .n_ch = 6,
> 212 	  .mask = FL | FR | FC | RL | RR },
> 213 	/* 6.1 */
> 
> 
> > -
> >   	switch (params->sample_rate) {
> >   	case 32000:
> >   		rate = HDMI_SAMPLE_RATE_32KHZ;
> > @@ -316,9 +287,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
> >   		return -EINVAL;
> >   	}
> > -	msm_hdmi_audio_set_sample_rate(hdmi, rate);
> > -	msm_hdmi_audio_info_setup(hdmi, 1, chan, channel_allocation,
> > -			      level_shift, down_mix);
> > +	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(hdmi->connector,
> > +								      &params->cea);
> > +	if (ret)
> > +		return ret;
> > +
> > +	msm_hdmi_audio_info_setup(hdmi, rate, params->cea.channels);
> >   	return 0;
> >   }
> > @@ -327,7 +301,8 @@ static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
> >   {
> >   	struct hdmi *hdmi = dev_get_drvdata(dev);
> > -	msm_hdmi_audio_info_setup(hdmi, 0, 0, 0, 0, 0);
> > +	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(hdmi->connector);
> > +	msm_hdmi_audio_disable(hdmi);
> >   }
> >   static const struct hdmi_codec_ops msm_hdmi_audio_codec_ops = {
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > index a62d2aedfbb7239d37c826c4f96762f100a2be4a..53b52351d0eddf4a5c87a5290016bb53ed4d29f7 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > @@ -24,8 +24,8 @@ struct hdmi_platform_config;
> >   struct hdmi_audio {
> >   	bool enabled;
> > -	struct hdmi_audio_infoframe infoframe;
> >   	int rate;
> > +	int channels;
> >   };
> >   struct hdmi_hdcp_ctrl;
> > @@ -207,12 +207,6 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
> >   /*
> >    * audio:
> >    */
> > -/* Supported HDMI Audio channels and rates */
> > -#define	MSM_HDMI_AUDIO_CHANNEL_2	0
> > -#define	MSM_HDMI_AUDIO_CHANNEL_4	1
> > -#define	MSM_HDMI_AUDIO_CHANNEL_6	2
> > -#define	MSM_HDMI_AUDIO_CHANNEL_8	3
> > -
> >   #define	HDMI_SAMPLE_RATE_32KHZ		0
> >   #define	HDMI_SAMPLE_RATE_44_1KHZ	1
> >   #define	HDMI_SAMPLE_RATE_48KHZ		2
> > @@ -221,12 +215,8 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
> >   #define	HDMI_SAMPLE_RATE_176_4KHZ	5
> >   #define	HDMI_SAMPLE_RATE_192KHZ		6
> > -int msm_hdmi_audio_update(struct hdmi *hdmi);
> > -int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
> > -	uint32_t num_of_channels, uint32_t channel_allocation,
> > -	uint32_t level_shift, bool down_mix);
> > -void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
> > -
> > +int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels);
> > +int msm_hdmi_audio_disable(struct hdmi *hdmi);
> >   /*
> >    * hdmi bridge:
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> > index 4c2058c4adc1001a12e10f35e88a6d58f3bd2fdc..924654bfb48cf17feadea1c0661ee6ee4e1b4589 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> > @@ -7,9 +7,6 @@
> >   #include <linux/hdmi.h>
> >   #include "hdmi.h"
> > -/* maps MSM_HDMI_AUDIO_CHANNEL_n consts used by audio driver to # of channels: */
> > -static int nchannels[] = { 2, 4, 6, 8 };
> > -
> >   /* Supported HDMI Audio sample rates */
> >   #define MSM_HDMI_SAMPLE_RATE_32KHZ		0
> >   #define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
> > @@ -71,19 +68,20 @@ static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
> >   	return NULL;
> >   }
> > -int msm_hdmi_audio_update(struct hdmi *hdmi)
> > +static int msm_hdmi_audio_update(struct hdmi *hdmi)
> >   {
> >   	struct hdmi_audio *audio = &hdmi->audio;
> > -	struct hdmi_audio_infoframe *info = &audio->infoframe;
> >   	const struct hdmi_msm_audio_arcs *arcs = NULL;
> >   	bool enabled = audio->enabled;
> >   	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
> > -	uint32_t infofrm_ctrl, audio_config;
> > +	uint32_t audio_config;
> > +
> > +	if (!hdmi->connector->display_info.is_hdmi)
> > +		return -EINVAL;
> > +
> > +	DBG("audio: enabled=%d, channels=%d, rate=%d",
> > +	    audio->enabled, audio->channels, audio->rate);
> > -	DBG("audio: enabled=%d, channels=%d, channel_allocation=0x%x, "
> > -		"level_shift_value=%d, downmix_inhibit=%d, rate=%d",
> > -		audio->enabled, info->channels,  info->channel_allocation,
> > -		info->level_shift_value, info->downmix_inhibit, audio->rate);
> >   	DBG("video: power_on=%d, pixclock=%lu", hdmi->power_on, hdmi->pixclock);
> >   	if (enabled && !(hdmi->power_on && hdmi->pixclock)) {
> > @@ -104,7 +102,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> >   	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
> >   	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
> >   	aud_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_AUDIO_PKT_CTRL1);
> > -	infofrm_ctrl = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
> >   	audio_config = hdmi_read(hdmi, REG_HDMI_AUDIO_CFG);
> >   	/* Clear N/CTS selection bits */
> > @@ -113,7 +110,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> >   	if (enabled) {
> >   		uint32_t n, cts, multiplier;
> >   		enum hdmi_acr_cts select;
> > -		uint8_t buf[14];
> >   		n   = arcs->lut[audio->rate].n;
> >   		cts = arcs->lut[audio->rate].cts;
> > @@ -155,20 +151,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> >   				HDMI_ACR_1_N(n));
> >   		hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL2,
> > -				COND(info->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
> > +				COND(audio->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
> >   				HDMI_AUDIO_PKT_CTRL2_OVERRIDE);
> >   		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_CONT;
> >   		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_SEND;
> > -		/* configure infoframe: */
> > -		hdmi_audio_infoframe_pack(info, buf, sizeof(buf));
> > -		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
> > -				(buf[3] <<  0) | (buf[4] <<  8) |
> > -				(buf[5] << 16) | (buf[6] << 24));
> > -		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
> > -				(buf[7] <<  0) | (buf[8] << 8));
> > -
> >   		hdmi_write(hdmi, REG_HDMI_GC, 0);
> >   		vbi_pkt_ctrl |= HDMI_VBI_PKT_CTRL_GC_ENABLE;
> > @@ -176,11 +164,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> >   		aud_pkt_ctrl |= HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
> > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
> > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
> > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
> > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
> > -
> >   		audio_config &= ~HDMI_AUDIO_CFG_FIFO_WATERMARK__MASK;
> >   		audio_config |= HDMI_AUDIO_CFG_FIFO_WATERMARK(4);
> >   		audio_config |= HDMI_AUDIO_CFG_ENGINE_ENABLE;
> > @@ -190,17 +173,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> >   		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_ENABLE;
> >   		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_EVERY_FRAME;
> >   		aud_pkt_ctrl &= ~HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
> > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
> > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
> > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
> > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
> >   		audio_config &= ~HDMI_AUDIO_CFG_ENGINE_ENABLE;
> >   	}
> >   	hdmi_write(hdmi, REG_HDMI_ACR_PKT_CTRL, acr_pkt_ctrl);
> >   	hdmi_write(hdmi, REG_HDMI_VBI_PKT_CTRL, vbi_pkt_ctrl);
> >   	hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL1, aud_pkt_ctrl);
> > -	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, infofrm_ctrl);
> >   	hdmi_write(hdmi, REG_HDMI_AUD_INT,
> >   			COND(enabled, HDMI_AUD_INT_AUD_FIFO_URUN_INT) |
> > @@ -214,41 +192,29 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> >   	return 0;
> >   }
> > -int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
> > -	uint32_t num_of_channels, uint32_t channel_allocation,
> > -	uint32_t level_shift, bool down_mix)
> > +int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels)
> >   {
> > -	struct hdmi_audio *audio;
> > -
> >   	if (!hdmi)
> >   		return -ENXIO;
> > -	audio = &hdmi->audio;
> > -
> > -	if (num_of_channels >= ARRAY_SIZE(nchannels))
> > +	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
> >   		return -EINVAL;
> > -	audio->enabled = enabled;
> > -	audio->infoframe.channels = nchannels[num_of_channels];
> > -	audio->infoframe.channel_allocation = channel_allocation;
> > -	audio->infoframe.level_shift_value = level_shift;
> > -	audio->infoframe.downmix_inhibit = down_mix;
> > +	hdmi->audio.rate = rate;
> > +	hdmi->audio.channels = channels;
> > +	hdmi->audio.enabled = true;
> >   	return msm_hdmi_audio_update(hdmi);
> >   }
> > -void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate)
> > +int msm_hdmi_audio_disable(struct hdmi *hdmi)
> >   {
> > -	struct hdmi_audio *audio;
> > -
> >   	if (!hdmi)
> > -		return;
> > -
> > -	audio = &hdmi->audio;
> > +		return -ENXIO;
> > -	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
> > -		return;
> > +	hdmi->audio.rate = 0;
> > +	hdmi->audio.channels = 2;
> > +	hdmi->audio.enabled = false;
> > -	audio->rate = rate;
> > -	msm_hdmi_audio_update(hdmi);
> > +	return msm_hdmi_audio_update(hdmi);
> >   }
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index d5ab1f74c0e6f47dc59872c016104e9a84d85e9e..168b4104e705e8217f5d7ca5f902d7557c55ae24 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -7,6 +7,8 @@
> >   #include <linux/delay.h>
> >   #include <drm/drm_bridge_connector.h>
> >   #include <drm/drm_edid.h>
> > +#include <drm/display/drm_hdmi_helper.h>
> > +#include <drm/display/drm_hdmi_state_helper.h>
> >   #include "msm_kms.h"
> >   #include "hdmi.h"
> > @@ -68,23 +70,17 @@ static void power_off(struct drm_bridge *bridge)
> >   #define AVI_IFRAME_LINE_NUMBER 1
> > -static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> > +static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
> > +					 const u8 *buffer, size_t len)
> >   {
> > -	struct drm_crtc *crtc = hdmi->encoder->crtc;
> > -	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> > -	union hdmi_infoframe frame;
> > -	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
> > +	u32 buf[4] = {};
> >   	u32 val;
> > -	int len;
> > +	int i;
> > -	drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
> > -						 hdmi->connector, mode);
> > -
> > -	len = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
> > -	if (len < 0) {
> > +	if (len != HDMI_INFOFRAME_SIZE(AVI) || len - 3 > sizeof(buf)) {
> >   		DRM_DEV_ERROR(&hdmi->pdev->dev,
> >   			"failed to configure avi infoframe\n");
> > -		return;
> > +		return -EINVAL;
> >   	}
> >   	/*
> > @@ -93,37 +89,118 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> >   	 * written to the LSB byte of AVI_INFO0 and the version is written to
> >   	 * the third byte from the LSB of AVI_INFO3
> >   	 */
> > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(0),
> > +	memcpy(buf, &buffer[3], len - 3);
> > +
> > +	buf[3] |= buffer[1] << 24;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(buf); i++)
> > +		hdmi_write(hdmi, REG_HDMI_AVI_INFO(i), buf[i]);
> > +
> > +	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > +	val |= HDMI_INFOFRAME_CTRL0_AVI_SEND |
> > +		HDMI_INFOFRAME_CTRL0_AVI_CONT;
> > +	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > +
> > +	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > +	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
> > +	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
> > +	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
> > +					   const u8 *buffer, size_t len)
> > +{
> > +	u32 val;
> > +
> > +	if (len != HDMI_INFOFRAME_SIZE(AUDIO)) {
> > +		DRM_DEV_ERROR(&hdmi->pdev->dev,
> > +			"failed to configure audio infoframe\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
> >   		   buffer[3] |
> >   		   buffer[4] << 8 |
> >   		   buffer[5] << 16 |
> >   		   buffer[6] << 24);
> > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(1),
> > +	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
> >   		   buffer[7] |
> >   		   buffer[8] << 8 |
> >   		   buffer[9] << 16 |
> >   		   buffer[10] << 24);
> > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(2),
> > -		   buffer[11] |
> > -		   buffer[12] << 8 |
> > -		   buffer[13] << 16 |
> > -		   buffer[14] << 24);
> > +	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > +	val |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
> > +		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
> > +		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
> > +		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
> > +	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
> > +					   enum hdmi_infoframe_type type)
> > +{
> > +	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > +	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > +	u32 val;
> > +
> > +	switch (type) {
> > +	case HDMI_INFOFRAME_TYPE_AVI:
> > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
> > +		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
> > +			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
> > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(3),
> > -		   buffer[15] |
> > -		   buffer[16] << 8 |
> > -		   buffer[1] << 24);
> > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > +		val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
> > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > -	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0,
> > -		   HDMI_INFOFRAME_CTRL0_AVI_SEND |
> > -		   HDMI_INFOFRAME_CTRL0_AVI_CONT);
> > +		break;
> > -	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > -	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
> > -	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
> > -	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > +	case HDMI_INFOFRAME_TYPE_AUDIO:
> > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
> > +		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
> > +			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
> > +			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
> > +			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
> > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > +
> > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > +		val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
> > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > +
> > +		break;
> > +
> > +	default:
> > +		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
> > +					   enum hdmi_infoframe_type type,
> > +					   const u8 *buffer, size_t len)
> > +{
> > +	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > +	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > +
> > +	msm_hdmi_bridge_clear_infoframe(bridge, type);
> > +
> > +	switch (type) {
> > +	case HDMI_INFOFRAME_TYPE_AVI:
> > +		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
> > +	case HDMI_INFOFRAME_TYPE_AUDIO:
> > +		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
> > +	default:
> > +		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
> > +		return 0;
> > +	}
> >   }
> >   static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > @@ -146,16 +223,16 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	conn_state = drm_atomic_get_new_connector_state(state, connector);
> >   	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > +	hdmi->pixclock = conn_state->hdmi.tmds_char_rate;
> > +
> >   	if (!hdmi->power_on) {
> >   		msm_hdmi_phy_resource_enable(phy);
> >   		msm_hdmi_power_on(bridge);
> >   		hdmi->power_on = true;
> > -		if (hdmi->hdmi_mode) {
> > -			msm_hdmi_config_avi_infoframe(hdmi);
> > -			msm_hdmi_audio_update(hdmi);
> > -		}
> >   	}
> > +	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> > +
> >   	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> >   	msm_hdmi_set_mode(hdmi, true);
> > @@ -184,8 +261,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	if (hdmi->power_on) {
> >   		power_off(bridge);
> >   		hdmi->power_on = false;
> > -		if (hdmi->hdmi_mode)
> > -			msm_hdmi_audio_update(hdmi);
> >   		msm_hdmi_phy_resource_disable(phy);
> >   	}
> >   }
> > @@ -196,8 +271,6 @@ static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> >   	int hstart, hend, vstart, vend;
> >   	uint32_t frame_ctrl;
> > -	hdmi->pixclock = mode->clock * 1000;
> > -
> >   	hstart = mode->htotal - mode->hsync_start;
> >   	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
> > @@ -241,9 +314,6 @@ static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> >   		frame_ctrl |= HDMI_FRAME_CTRL_INTERLACED_EN;
> >   	DBG("frame_ctrl=%08x", frame_ctrl);
> >   	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
> > -
> > -	if (hdmi->hdmi_mode)
> > -		msm_hdmi_audio_update(hdmi);
> >   }
> >   static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridge,
> > @@ -275,18 +345,16 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
> >   	return drm_edid;
> >   }
> > -static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> > -		const struct drm_display_info *info,
> > -		const struct drm_display_mode *mode)
> > +static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
> > +								 const struct drm_display_mode *mode,
> > +								 unsigned long long tmds_rate)
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	const struct hdmi_platform_config *config = hdmi->config;
> >   	struct msm_drm_private *priv = bridge->dev->dev_private;
> >   	struct msm_kms *kms = priv->kms;
> > -	long actual, requested;
> > -
> > -	requested = 1000 * mode->clock;
> > +	long actual;
> >   	/* for mdp5/apq8074, we manage our own pixel clk (as opposed to
> >   	 * mdp4/dtv stuff where pixel clk is assigned to mdp/encoder
> > @@ -294,15 +362,16 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
> >   	 */
> >   	if (kms->funcs->round_pixclk)
> >   		actual = kms->funcs->round_pixclk(kms,
> > -			requested, hdmi_bridge->hdmi->encoder);
> > +						  tmds_rate,
> > +						  hdmi_bridge->hdmi->encoder);
> >   	else if (config->pwr_clk_cnt > 0)
> > -		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
> > +		actual = clk_round_rate(hdmi->pwr_clks[0], tmds_rate);
> >   	else
> > -		actual = requested;
> > +		actual = tmds_rate;
> > -	DBG("requested=%ld, actual=%ld", requested, actual);
> > +	DBG("requested=%lld, actual=%ld", tmds_rate, actual);
> > -	if (actual != requested)
> > +	if (actual != tmds_rate)
> >   		return MODE_CLOCK_RANGE;
> >   	return 0;
> > @@ -314,9 +383,11 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >   	.atomic_reset = drm_atomic_helper_bridge_reset,
> >   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> >   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> > -	.mode_valid = msm_hdmi_bridge_mode_valid,
> >   	.edid_read = msm_hdmi_bridge_edid_read,
> >   	.detect = msm_hdmi_bridge_detect,
> > +	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
> > +	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
> > +	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
> >   };
> >   static void
> > @@ -348,8 +419,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> >   	bridge->funcs = &msm_hdmi_bridge_funcs;
> >   	bridge->ddc = hdmi->i2c;
> >   	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > +	bridge->vendor = "Qualcomm";
> > +	bridge->product = "Snapdragon";
> >   	bridge->ops = DRM_BRIDGE_OP_HPD |
> >   		DRM_BRIDGE_OP_DETECT |
> > +		DRM_BRIDGE_OP_HDMI |
> >   		DRM_BRIDGE_OP_EDID;
> >   	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
> > 

-- 
With best wishes
Dmitry
