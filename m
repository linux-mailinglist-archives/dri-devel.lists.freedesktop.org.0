Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77FA2D190
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 00:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D07410E34E;
	Fri,  7 Feb 2025 23:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SuQRPqfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543BB10E348
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 23:43:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5440efe97baso2936639e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 15:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738971808; x=1739576608; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7omtj4vQorY0d7O453kNd4Bi51wiKwJE7hE/whtb6OE=;
 b=SuQRPqfAAUh6cAuWXJlgX4qGLSdBQff3rrtgphgcDeA8MI4cKL3SzjDnfbxgxMx2jr
 bktFFMRCxDu1VB687KWZp6zUBncoupvG2T3+9NcnbhkEFcAs4SgeuKmuFcZ5StGf0IoK
 yjFJ1JHxDNl46U8y+eXCyLYkKFBIWZJ7NRAWftwP9zkd3TWAWCFf51KSsTz7L8/U2aK8
 5S1wVG6ItncrT6dL8Wz7IJIBfWam+9oaNreRGciooDyK/m1pQ27OQ4VUPDIik+Y4wKFk
 xZqN/eqGEL0PYxZ35d49vefxCPkJvCW+Upy7k+xcFD77NhWB6KRGlFQW8sYwgD/NQMeF
 i48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738971808; x=1739576608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7omtj4vQorY0d7O453kNd4Bi51wiKwJE7hE/whtb6OE=;
 b=jA9PbMmHECm66bYwhtzdRV1YBTLKs1G+5dtszu9JyK1YasVRZK1C9trJXtXavRu9gX
 t9pExhpOO2DV4NyLPLDQjvRHOjJfBIqVsFY3450xrRg6hxGsc2lNl6RQjmy5SAFpheL8
 agCirLWxCYgCKoSpZylF4Tdx7HmMuUP1zW2NxbDiZLyID/6AU0rilVaQoLQoGi1/nDfJ
 5tVth7jEqvUKQgx2079+WTxPvReraZtMRxjSq0sIus9+1XQNYEZp8k4YwxQzWuXRZOr8
 n/jDPGduFc3B4BEEvfrIYEFkPtKm204EB/uNdvhQyd1G3nZP1MNZIfnq05dZavShg1qF
 pKKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZLPrMY0IhEvOlX2V1E91fimdAg5h+op2kmBo+ghmvy1tNXP5Tglk0pRHwuVur5DLF/KASF0nySHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Rf/DLYqg8P9K1JtDxhQoq0bZFinKhCuyCmvNCJc2J5cCzyp2
 W7AJNlbAlI4HGEr9KuSIxhhOCUwtDZTvsxFn97In72rURC/DxloEWs5zqonjzKg=
X-Gm-Gg: ASbGncuvmsFtEG4i3DlwNOJQC/RPXlqcVPBLKtFwstpVo5BMfwkBcYHMmtg555yZmXA
 NVsluq5FNi8zdEfBMVRocXow8YfShzbHdSpQrVl84Mrvq7s2d9wRIThGF1mCMEdTpaPPB8iCzEa
 34lxVTAA2+WNrnRhmTjt37kxuKPumfyxj7Cs+E/8oW72kbRZJoE1S08Pwv2WK28DBXLkiXtek/x
 rowUMHqZ6NKiJsaRJ0ArfMbNVDjuf2isaFoKwNNC0z3D/xHle5HG+tVH63ZvD5trHqJZR9WLPkf
 qmSZJujO3zVdwTWIVZNM2zDsNubz01EJtazIA16QqmTIKSrcWUpP25+808n4vyNf/aQDEDc=
X-Google-Smtp-Source: AGHT+IHnNcEPRYlbB0nhQgF6mdPzV/aYyzl1kN+PVPwHCU79sNC7EGjlOimXq3FgMjsyJnj0ruKm/g==
X-Received: by 2002:a05:6512:b90:b0:542:8cf5:a384 with SMTP id
 2adb3069b0e04-54414a962damr1584030e87.8.1738971808045; 
 Fri, 07 Feb 2025 15:43:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105f3098sm584119e87.176.2025.02.07.15.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 15:43:26 -0800 (PST)
Date: Sat, 8 Feb 2025 01:43:24 +0200
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
Message-ID: <f4yvj4mrnyeuftmgqjax3poxlyj4o4xqzva24526wipcgw2tbk@7uewtadxatye>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-3-1592632327f7@linaro.org>
 <c8022a2c-4ed2-494c-808e-eaff3eb5e2ba@quicinc.com>
 <e4ro5wjaormqvzp6l4wyw4wbpjujwdzyvyr2rvqboubhtskhnl@62ygkdvfiwk5>
 <472d8eae-10a6-4b3b-ba1c-f04419cbd202@quicinc.com>
 <6fzkeepidld3wogklg64xmjjqcp5t2u5v7calncvdiqbhusmr5@yw6nbjcelwwm>
 <18be3d32-c643-42de-bb7d-165b409c8b24@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18be3d32-c643-42de-bb7d-165b409c8b24@quicinc.com>
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

On Fri, Feb 07, 2025 at 02:27:41PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 2:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 07, 2025 at 01:34:35PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/3/2025 5:30 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 03, 2025 at 04:25:59PM -0800, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > > > > > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > > > > > atomic_check hook and of the provided Infoframe infrastructure.
> > > > > > 
> > > > > 
> > > > > By atomic_check are you referring to the
> > > > > msm_hdmi_bridge_tmds_char_rate_valid()?
> > > > 
> > > > No, I mean drm_atomic_helper_connector_hdmi_check() being called from
> > > > drm_bridge_connector (inthe previous versions it was called from this
> > > > driver).
> > > > 
> > > 
> > > Ack.
> > > > > 
> > > > > Also please confirm if HDMI audio was re-tested with these changes.
> > > > 
> > > > Yes, although not the channels allocation for the multi-channel audio. I
> > > > don't have corresponding equipment. If you think that we should start
> > > > testing that, I will check if I can get the 6.1 or 8.1 receiver and the
> > > > speakers :-)
> > > > 
> > > 
> > > We should but I am fine with basic audio validation for now.
> > > 
> > > > > 
> > > > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/Kconfig            |   2 +
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi.c        |  45 ++-------
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi.h        |  16 +--
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi_audio.c  |  74 ++++----------
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 180 +++++++++++++++++++++++----------
> > > > > >     5 files changed, 162 insertions(+), 155 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > > > > > index 7ec833b6d8292f8cb26cfe5582812f2754cd4d35..974bc7c0ea761147d3326bdce9039d6f26f290d0 100644
> > > > > > --- a/drivers/gpu/drm/msm/Kconfig
> > > > > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > > > > @@ -170,6 +170,8 @@ config DRM_MSM_HDMI
> > > > > >     	bool "Enable HDMI support in MSM DRM driver"
> > > > > >     	depends on DRM_MSM
> > > > > >     	default y
> > > > > > +	select DRM_DISPLAY_HDMI_HELPER
> > > > > > +	select DRM_DISPLAY_HDMI_STATE_HELPER
> > > > > >     	help
> > > > > >     	  Compile in support for the HDMI output MSM DRM driver. It can
> > > > > >     	  be a primary or a secondary display on device. Note that this is used
> > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > > > > index 37b3809c6bdd7c35aca6b475cb1f41c0ab4d3e6d..b14205cb9e977edd0d849e0eafe9b69c0da594bd 100644
> > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > > > > @@ -12,6 +12,7 @@
> > > > > >     #include <drm/drm_bridge_connector.h>
> > > > > >     #include <drm/drm_of.h>
> > > > > > +#include <drm/display/drm_hdmi_state_helper.h>
> > > > > >     #include <sound/hdmi-codec.h>
> > > > > >     #include "hdmi.h"
> > > > > > @@ -165,8 +166,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> > > > > >     	hdmi->dev = dev;
> > > > > >     	hdmi->encoder = encoder;
> > > > > > -	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
> > > > > > -
> > > > > >     	ret = msm_hdmi_bridge_init(hdmi);
> > > > > >     	if (ret) {
> > > > > >     		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
> > > > > > @@ -254,40 +253,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
> > > > > >     				    struct hdmi_codec_params *params)
> > > > > >     {
> > > > > >     	struct hdmi *hdmi = dev_get_drvdata(dev);
> > > > > > -	unsigned int chan;
> > > > > > -	unsigned int channel_allocation = 0;
> > > > > >     	unsigned int rate;
> > > > > > -	unsigned int level_shift  = 0; /* 0dB */
> > > > > > -	bool down_mix = false;
> > > > > > +	int ret;
> > > > > >     	DRM_DEV_DEBUG(dev, "%u Hz, %d bit, %d channels\n", params->sample_rate,
> > > > > >     		 params->sample_width, params->cea.channels);
> > > > > > -	switch (params->cea.channels) {
> > > > > > -	case 2:
> > > > > > -		/* FR and FL speakers */
> > > > > > -		channel_allocation  = 0;
> > > > > > -		chan = MSM_HDMI_AUDIO_CHANNEL_2;
> > > > > > -		break;
> > > > > > -	case 4:
> > > > > > -		/* FC, LFE, FR and FL speakers */
> > > > > > -		channel_allocation  = 0x3;
> > > > > > -		chan = MSM_HDMI_AUDIO_CHANNEL_4;
> > > > > > -		break;
> > > > > > -	case 6:
> > > > > > -		/* RR, RL, FC, LFE, FR and FL speakers */
> > > > > > -		channel_allocation  = 0x0B;
> > > > > > -		chan = MSM_HDMI_AUDIO_CHANNEL_6;
> > > > > > -		break;
> > > > > > -	case 8:
> > > > > > -		/* FRC, FLC, RR, RL, FC, LFE, FR and FL speakers */
> > > > > > -		channel_allocation  = 0x1F;
> > > > > > -		chan = MSM_HDMI_AUDIO_CHANNEL_8;
> > > > > > -		break;
> > > > > > -	default:
> > > > > > -		return -EINVAL;
> > > > > > -	}
> > > > > 
> > > > > This mapping table was doing two things:
> > > > > 
> > > > > 1) drop the conversion of channels to an index to nchannels[] and use the
> > > > > channels directly. This part is fine but could have been a separate change
> > > > > by itself to show the redundancy.
> > > > > 
> > > > > 2) drop the mapping table of channels to channel_allocation.
> > > > > I am not fully sure of this. Was this done because
> > > > > hdmi_codec_channel_alloc[] table in hdmi-codec does this for us?
> > > > > hdmi_codec_get_ch_alloc_table_idx() uses channels and the flags to come up
> > > > > with the idx into this table. But it seems like current MSM HDMI code did
> > > > > not consider the flags. So for example, it seems like for 6 channels, we
> > > > > could return any of the below based on the flags but MSM HDMI always used
> > > > > 0x0B so will the values match?
> > > > 
> > > > Do they have to match? The correct value is being calculated by the HDMI
> > > > code in ASoC and then being written into the Audio InfoFrame. If the MSM
> > > > HDMI code wasn't taking ELD data into account, then it's a bug. But... I
> > > > don't think it's worth spending too much time on fixing it separately.
> > > > 
> > > 
> > > Its a change in values which are passed to the audio infoframe but I dont
> > > know if it will change the behavior of what has been working so far (I hope
> > > not).
> > > 
> > > I agree, that msm hdmi driver not considering the flags in the mask is a bug
> > > so for that reason, we should use the channels and channel allocation
> > > supplied to us by hdmi_codec.
> > > 
> > > If it does result in an issue (due to it incorrectly working today), we will
> > > atleast know where to look at.
> > > 
> > > Some more questions below.
> > 
> > Ack
> > 
> > > 
> > > > In the end, that is exactly the purpose of the frameworks - to make code
> > > > error prone and to remove the need to reimplement same things over and
> > > > over again, making differnt kinds of mistakes. For example, MSM HDMI
> > > > code also doesn't implement plugged_cb support. It doesn't provide ELD
> > > > to the HDMI codec code, etc. All of that is being fixed by using the
> > > > framework. It's not worth implementing those functions in the MSM HDMI
> > > > code first only to drop them in the next commit.
> > > > 
> > > > > 
> > > > > 202 	{ .ca_id = 0x0b, .n_ch = 6,
> > > > > 203 	  .mask = FL | FR | LFE | FC | RL | RR},
> > > > > 204 	/* surround40 */
> > > > > 205 	{ .ca_id = 0x08, .n_ch = 6,
> > > > > 206 	  .mask = FL | FR | RL | RR },
> > > > > 207 	/* surround41 */
> > > > > 208 	{ .ca_id = 0x09, .n_ch = 6,
> > > > > 209 	  .mask = FL | FR | LFE | RL | RR },
> > > > > 210 	/* surround50 */
> > > > > 211 	{ .ca_id = 0x0a, .n_ch = 6,
> > > > > 212 	  .mask = FL | FR | FC | RL | RR },
> > > > > 213 	/* 6.1 */
> > > > > 
> > > > > 
> > > > > > -
> > > > > >     	switch (params->sample_rate) {
> > > > > >     	case 32000:
> > > > > >     		rate = HDMI_SAMPLE_RATE_32KHZ;
> > > > > > @@ -316,9 +287,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
> > > > > >     		return -EINVAL;
> > > > > >     	}
> > > > > > -	msm_hdmi_audio_set_sample_rate(hdmi, rate);
> > > > > > -	msm_hdmi_audio_info_setup(hdmi, 1, chan, channel_allocation,
> > > > > > -			      level_shift, down_mix);
> > > > > > +	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(hdmi->connector,
> > > > > > +								      &params->cea);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	msm_hdmi_audio_info_setup(hdmi, rate, params->cea.channels);
> > > > > >     	return 0;
> > > > > >     }
> > > > > > @@ -327,7 +301,8 @@ static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
> > > > > >     {
> > > > > >     	struct hdmi *hdmi = dev_get_drvdata(dev);
> > > > > > -	msm_hdmi_audio_info_setup(hdmi, 0, 0, 0, 0, 0);
> > > > > > +	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(hdmi->connector);
> > > > > > +	msm_hdmi_audio_disable(hdmi);
> > > > > >     }
> > > > > >     static const struct hdmi_codec_ops msm_hdmi_audio_codec_ops = {
> > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > > > > index a62d2aedfbb7239d37c826c4f96762f100a2be4a..53b52351d0eddf4a5c87a5290016bb53ed4d29f7 100644
> > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > > > > @@ -24,8 +24,8 @@ struct hdmi_platform_config;
> > > > > >     struct hdmi_audio {
> > > > > >     	bool enabled;
> > > > > > -	struct hdmi_audio_infoframe infoframe;
> > > > > >     	int rate;
> > > > > > +	int channels;
> > > > > >     };
> > > > > >     struct hdmi_hdcp_ctrl;
> > > > > > @@ -207,12 +207,6 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
> > > > > >     /*
> > > > > >      * audio:
> > > > > >      */
> > > > > > -/* Supported HDMI Audio channels and rates */
> > > > > > -#define	MSM_HDMI_AUDIO_CHANNEL_2	0
> > > > > > -#define	MSM_HDMI_AUDIO_CHANNEL_4	1
> > > > > > -#define	MSM_HDMI_AUDIO_CHANNEL_6	2
> > > > > > -#define	MSM_HDMI_AUDIO_CHANNEL_8	3
> > > > > > -
> > > > > >     #define	HDMI_SAMPLE_RATE_32KHZ		0
> > > > > >     #define	HDMI_SAMPLE_RATE_44_1KHZ	1
> > > > > >     #define	HDMI_SAMPLE_RATE_48KHZ		2
> > > > > > @@ -221,12 +215,8 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
> > > > > >     #define	HDMI_SAMPLE_RATE_176_4KHZ	5
> > > > > >     #define	HDMI_SAMPLE_RATE_192KHZ		6
> > > > > > -int msm_hdmi_audio_update(struct hdmi *hdmi);
> > > > > > -int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
> > > > > > -	uint32_t num_of_channels, uint32_t channel_allocation,
> > > > > > -	uint32_t level_shift, bool down_mix);
> > > > > > -void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
> > > > > > -
> > > > > > +int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels);
> > > > > > +int msm_hdmi_audio_disable(struct hdmi *hdmi);
> > > > > >     /*
> > > > > >      * hdmi bridge:
> > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> > > > > > index 4c2058c4adc1001a12e10f35e88a6d58f3bd2fdc..924654bfb48cf17feadea1c0661ee6ee4e1b4589 100644
> > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> > > > > > @@ -7,9 +7,6 @@
> > > > > >     #include <linux/hdmi.h>
> > > > > >     #include "hdmi.h"
> > > > > > -/* maps MSM_HDMI_AUDIO_CHANNEL_n consts used by audio driver to # of channels: */
> > > > > > -static int nchannels[] = { 2, 4, 6, 8 };
> > > > > > -
> > > > > >     /* Supported HDMI Audio sample rates */
> > > > > >     #define MSM_HDMI_SAMPLE_RATE_32KHZ		0
> > > > > >     #define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
> > > > > > @@ -71,19 +68,20 @@ static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
> > > > > >     	return NULL;
> > > > > >     }
> > > > > > -int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > > +static int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > >     {
> > > > > >     	struct hdmi_audio *audio = &hdmi->audio;
> > > > > > -	struct hdmi_audio_infoframe *info = &audio->infoframe;
> > > > > >     	const struct hdmi_msm_audio_arcs *arcs = NULL;
> > > > > >     	bool enabled = audio->enabled;
> > > > > >     	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
> > > > > > -	uint32_t infofrm_ctrl, audio_config;
> > > > > > +	uint32_t audio_config;
> > > > > > +
> > > > > > +	if (!hdmi->connector->display_info.is_hdmi)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	DBG("audio: enabled=%d, channels=%d, rate=%d",
> > > > > > +	    audio->enabled, audio->channels, audio->rate);
> > > > > > -	DBG("audio: enabled=%d, channels=%d, channel_allocation=0x%x, "
> > > > > > -		"level_shift_value=%d, downmix_inhibit=%d, rate=%d",
> > > > > > -		audio->enabled, info->channels,  info->channel_allocation,
> > > > > > -		info->level_shift_value, info->downmix_inhibit, audio->rate);
> > > > > >     	DBG("video: power_on=%d, pixclock=%lu", hdmi->power_on, hdmi->pixclock);
> > > > > >     	if (enabled && !(hdmi->power_on && hdmi->pixclock)) {
> > > > > > @@ -104,7 +102,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > >     	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
> > > > > >     	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
> > > > > >     	aud_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_AUDIO_PKT_CTRL1);
> > > > > > -	infofrm_ctrl = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
> > > > > >     	audio_config = hdmi_read(hdmi, REG_HDMI_AUDIO_CFG);
> > > > > >     	/* Clear N/CTS selection bits */
> > > > > > @@ -113,7 +110,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > >     	if (enabled) {
> > > > > >     		uint32_t n, cts, multiplier;
> > > > > >     		enum hdmi_acr_cts select;
> > > > > > -		uint8_t buf[14];
> > > > > >     		n   = arcs->lut[audio->rate].n;
> > > > > >     		cts = arcs->lut[audio->rate].cts;
> > > > > > @@ -155,20 +151,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > >     				HDMI_ACR_1_N(n));
> > > > > >     		hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL2,
> > > > > > -				COND(info->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
> > > > > > +				COND(audio->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
> > > > > >     				HDMI_AUDIO_PKT_CTRL2_OVERRIDE);
> > > > > >     		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_CONT;
> > > > > >     		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_SEND;
> > > > > > -		/* configure infoframe: */
> > > > > > -		hdmi_audio_infoframe_pack(info, buf, sizeof(buf));
> > > > > > -		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
> > > > > > -				(buf[3] <<  0) | (buf[4] <<  8) |
> > > > > > -				(buf[5] << 16) | (buf[6] << 24));
> > > > > > -		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
> > > > > > -				(buf[7] <<  0) | (buf[8] << 8));
> > > > > > -
> > > > > >     		hdmi_write(hdmi, REG_HDMI_GC, 0);
> > > > > >     		vbi_pkt_ctrl |= HDMI_VBI_PKT_CTRL_GC_ENABLE;
> > > > > > @@ -176,11 +164,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > >     		aud_pkt_ctrl |= HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
> > > > > > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
> > > > > > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
> > > > > > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
> > > > > > -		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
> > > > > > -
> > > > > >     		audio_config &= ~HDMI_AUDIO_CFG_FIFO_WATERMARK__MASK;
> > > > > >     		audio_config |= HDMI_AUDIO_CFG_FIFO_WATERMARK(4);
> > > > > >     		audio_config |= HDMI_AUDIO_CFG_ENGINE_ENABLE;
> > > > > > @@ -190,17 +173,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > >     		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_ENABLE;
> > > > > >     		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_EVERY_FRAME;
> > > > > >     		aud_pkt_ctrl &= ~HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
> > > > > > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
> > > > > > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
> > > > > > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
> > > > > > -		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
> > > > > >     		audio_config &= ~HDMI_AUDIO_CFG_ENGINE_ENABLE;
> > > > > >     	}
> > > > > >     	hdmi_write(hdmi, REG_HDMI_ACR_PKT_CTRL, acr_pkt_ctrl);
> > > > > >     	hdmi_write(hdmi, REG_HDMI_VBI_PKT_CTRL, vbi_pkt_ctrl);
> > > > > >     	hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL1, aud_pkt_ctrl);
> > > > > > -	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, infofrm_ctrl);
> > > > > >     	hdmi_write(hdmi, REG_HDMI_AUD_INT,
> > > > > >     			COND(enabled, HDMI_AUD_INT_AUD_FIFO_URUN_INT) |
> > > > > > @@ -214,41 +192,29 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
> > > > > >     	return 0;
> > > > > >     }
> > > > > > -int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
> > > > > > -	uint32_t num_of_channels, uint32_t channel_allocation,
> > > > > > -	uint32_t level_shift, bool down_mix)
> > > > > > +int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels)
> > > > > >     {
> > > > > > -	struct hdmi_audio *audio;
> > > > > > -
> > > > > >     	if (!hdmi)
> > > > > >     		return -ENXIO;
> > > > > > -	audio = &hdmi->audio;
> > > > > > -
> > > > > > -	if (num_of_channels >= ARRAY_SIZE(nchannels))
> > > > > > +	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
> > > > > >     		return -EINVAL;
> > > > > > -	audio->enabled = enabled;
> > > > > > -	audio->infoframe.channels = nchannels[num_of_channels];
> > > > > > -	audio->infoframe.channel_allocation = channel_allocation;
> > > > > > -	audio->infoframe.level_shift_value = level_shift;
> > > > > > -	audio->infoframe.downmix_inhibit = down_mix;
> > > > > > +	hdmi->audio.rate = rate;
> > > > > > +	hdmi->audio.channels = channels;
> > > > > > +	hdmi->audio.enabled = true;
> > > > > >     	return msm_hdmi_audio_update(hdmi);
> > > > > >     }
> > > > > > -void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate)
> > > > > > +int msm_hdmi_audio_disable(struct hdmi *hdmi)
> > > > > >     {
> > > > > > -	struct hdmi_audio *audio;
> > > > > > -
> > > > > >     	if (!hdmi)
> > > > > > -		return;
> > > > > > -
> > > > > > -	audio = &hdmi->audio;
> > > > > > +		return -ENXIO;
> > > > > > -	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
> > > > > > -		return;
> > > > > > +	hdmi->audio.rate = 0;
> > > > > > +	hdmi->audio.channels = 2;
> > > > > > +	hdmi->audio.enabled = false;
> > > > > > -	audio->rate = rate;
> > > > > > -	msm_hdmi_audio_update(hdmi);
> > > > > > +	return msm_hdmi_audio_update(hdmi);
> > > > > >     }
> > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > index d5ab1f74c0e6f47dc59872c016104e9a84d85e9e..168b4104e705e8217f5d7ca5f902d7557c55ae24 100644
> > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > @@ -7,6 +7,8 @@
> > > > > >     #include <linux/delay.h>
> > > > > >     #include <drm/drm_bridge_connector.h>
> > > > > >     #include <drm/drm_edid.h>
> > > > > > +#include <drm/display/drm_hdmi_helper.h>
> > > > > > +#include <drm/display/drm_hdmi_state_helper.h>
> > > > > >     #include "msm_kms.h"
> > > > > >     #include "hdmi.h"
> > > > > > @@ -68,23 +70,17 @@ static void power_off(struct drm_bridge *bridge)
> > > > > >     #define AVI_IFRAME_LINE_NUMBER 1
> > > > > > -static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> > > > > > +static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
> > > > > > +					 const u8 *buffer, size_t len)
> > > > > >     {
> > > > > > -	struct drm_crtc *crtc = hdmi->encoder->crtc;
> > > > > > -	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> > > > > > -	union hdmi_infoframe frame;
> > > > > > -	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
> > > > > > +	u32 buf[4] = {};
> > > > > >     	u32 val;
> > > > > > -	int len;
> > > > > > +	int i;
> > > > > > -	drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
> > > > > > -						 hdmi->connector, mode);
> > > > > > -
> > > > > > -	len = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
> > > > > > -	if (len < 0) {
> > > > > > +	if (len != HDMI_INFOFRAME_SIZE(AVI) || len - 3 > sizeof(buf)) {
> > > > > >     		DRM_DEV_ERROR(&hdmi->pdev->dev,
> > > > > >     			"failed to configure avi infoframe\n");
> > > > > > -		return;
> > > > > > +		return -EINVAL;
> > > > > >     	}
> > > > > >     	/*
> > > > > > @@ -93,37 +89,118 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> > > > > >     	 * written to the LSB byte of AVI_INFO0 and the version is written to
> > > > > >     	 * the third byte from the LSB of AVI_INFO3
> > > > > >     	 */
> > > > > > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(0),
> > > > > > +	memcpy(buf, &buffer[3], len - 3);
> > > > > > +
> > > > > > +	buf[3] |= buffer[1] << 24;
> > > > > > +
> > > > > > +	for (i = 0; i < ARRAY_SIZE(buf); i++)
> > > > > > +		hdmi_write(hdmi, REG_HDMI_AVI_INFO(i), buf[i]);
> > > > > > +
> > > > > > +	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > > > > > +	val |= HDMI_INFOFRAME_CTRL0_AVI_SEND |
> > > > > > +		HDMI_INFOFRAME_CTRL0_AVI_CONT;
> > > > > > +	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > > > > > +
> > > > > > +	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > > > > > +	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
> > > > > > +	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
> > > > > > +	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
> > > > > > +					   const u8 *buffer, size_t len)
> > > > > > +{
> > > > > > +	u32 val;
> > > > > > +
> > > > > > +	if (len != HDMI_INFOFRAME_SIZE(AUDIO)) {
> > > > > > +		DRM_DEV_ERROR(&hdmi->pdev->dev,
> > > > > > +			"failed to configure audio infoframe\n");
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
> > > > > >     		   buffer[3] |
> > > > > >     		   buffer[4] << 8 |
> > > > > >     		   buffer[5] << 16 |
> > > > > >     		   buffer[6] << 24);
> > > > > > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(1),
> > > > > > +	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
> > > > > >     		   buffer[7] |
> > > > > >     		   buffer[8] << 8 |
> > > > > >     		   buffer[9] << 16 |
> > > > > >     		   buffer[10] << 24);
> > > > > > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(2),
> > > > > > -		   buffer[11] |
> > > > > > -		   buffer[12] << 8 |
> > > > > > -		   buffer[13] << 16 |
> > > > > > -		   buffer[14] << 24);
> > > > > > +	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > > > > > +	val |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
> > > > > > +		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
> > > > > > +		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
> > > > > > +		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
> > > > > > +	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
> > > > > > +					   enum hdmi_infoframe_type type)
> > > > > > +{
> > > > > > +	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > > > > > +	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > > > > > +	u32 val;
> > > > > > +
> > > > > > +	switch (type) {
> > > > > > +	case HDMI_INFOFRAME_TYPE_AVI:
> > > > > > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
> > > > > > +		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
> > > > > > +			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
> > > > > > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > > > > > -	hdmi_write(hdmi, REG_HDMI_AVI_INFO(3),
> > > > > > -		   buffer[15] |
> > > > > > -		   buffer[16] << 8 |
> > > > > > -		   buffer[1] << 24);
> > > > > > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > > > > > +		val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
> > > > > > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > > > > -	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0,
> > > > > > -		   HDMI_INFOFRAME_CTRL0_AVI_SEND |
> > > > > > -		   HDMI_INFOFRAME_CTRL0_AVI_CONT);
> > > > > > +		break;
> > > > > > -	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > > > > > -	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
> > > > > > -	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
> > > > > > -	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > > > > +	case HDMI_INFOFRAME_TYPE_AUDIO:
> > > > > > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
> > > > > > +		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
> > > > > > +			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
> > > > > > +			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
> > > > > > +			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
> > > > > > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
> > > > > > +
> > > > > > +		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
> > > > > > +		val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
> > > > > > +		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > > > > +
> > > > > > +		break;
> > > > > > +
> > > > > > +	default:
> > > > > > +		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
> > > > > > +					   enum hdmi_infoframe_type type,
> > > > > > +					   const u8 *buffer, size_t len)
> > > > > > +{
> > > > > > +	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > > > > > +	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > > > > > +
> > > > > > +	msm_hdmi_bridge_clear_infoframe(bridge, type);
> > > > > > +
> > > > > > +	switch (type) {
> > > > > > +	case HDMI_INFOFRAME_TYPE_AVI:
> > > > > > +		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
> > > > > > +	case HDMI_INFOFRAME_TYPE_AUDIO:
> > > > > > +		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
> > > > > > +	default:
> > > > > > +		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
> > > > > > +		return 0;
> > > > > > +	}
> > > > > >     }
> > > > > >     static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > > > > > @@ -146,16 +223,16 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > > > >     	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > > >     	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > > > > > +	hdmi->pixclock = conn_state->hdmi.tmds_char_rate;
> > > > > > +
> > > > > >     	if (!hdmi->power_on) {
> > > > > >     		msm_hdmi_phy_resource_enable(phy);
> > > > > >     		msm_hdmi_power_on(bridge);
> > > > > >     		hdmi->power_on = true;
> > > > > > -		if (hdmi->hdmi_mode) {
> > > > > > -			msm_hdmi_config_avi_infoframe(hdmi);
> > > > > > -			msm_hdmi_audio_update(hdmi);
> > > > > > -		}
> > > > > >     	}
> > > > > > +	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> > > > > > +
> > > > > >     	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> > > > > >     	msm_hdmi_set_mode(hdmi, true);
> > > > > > @@ -184,8 +261,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> > > > > >     	if (hdmi->power_on) {
> > > > > >     		power_off(bridge);
> > > > > >     		hdmi->power_on = false;
> > > > > > -		if (hdmi->hdmi_mode)
> > > > > > -			msm_hdmi_audio_update(hdmi);
> > > > > >     		msm_hdmi_phy_resource_disable(phy);
> > > > > >     	}
> > > > > >     }
> > > > > > @@ -196,8 +271,6 @@ static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > > > > >     	int hstart, hend, vstart, vend;
> > > > > >     	uint32_t frame_ctrl;
> > > > > > -	hdmi->pixclock = mode->clock * 1000;
> > > > > > -
> > > > > >     	hstart = mode->htotal - mode->hsync_start;
> > > > > >     	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
> > > > > > @@ -241,9 +314,6 @@ static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > > > > >     		frame_ctrl |= HDMI_FRAME_CTRL_INTERLACED_EN;
> > > > > >     	DBG("frame_ctrl=%08x", frame_ctrl);
> > > > > >     	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
> > > > > > -
> > > > > > -	if (hdmi->hdmi_mode)
> > > > > > -		msm_hdmi_audio_update(hdmi);
> > > > > >     }
> > > 
> > > Overall, I would like to know how the sequence was broken up:
> > > 
> > > HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND/CONT/UPDATE was moved from
> > > msm_hdmi_audio_update() to msm_hdmi_config_audio_infoframe() which is
> > > involed by drm_atomic_helper_connector_hdmi_update_infoframes() /
> > > drm_atomic_helper_connector_hdmi_clear_audio_infoframe().
> > > 
> > > But,HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND bit of REG_HDMI_AUDIO_PKT_CTRL1
> > > remained in msm_hdmi_audio_update().
> > 
> > This is correct, this bit controls sending of audio data, not the Audio
> > InfoFrame.
> > 
> > The strategy is very simple: Audio InfoFames are controlled centrally
> > via the DRM HDMI framework. Correct InfoFrame data is programmed at the
> > atomic_pre_enable() time (if it was set before) or during
> > msm_hdmi_bridge_audio_prepare() when the new stream is started.
> > 
> > All audio data frame management is deferred to
> > msm_hdmi_bridge_audio_prepare().
> > 
> 
> Thats in the last patch of the series not this one. But I understand the
> split.
> 
> > > If this is correct, are we not missing msm_hdmi_audio_update() in some
> > > places like pre_enable() / post_disable()?
> > 
> > drm_atomic_helper_connector_hdmi_update_infoframes() takes care of
> > writing all InfoFrames, including the Audio one.
> > 
> > > 
> > > Was this done because those calls were anyway bailing out audio->enabled was
> > > not set by then?
> > > 
> > > This seems to be another change which could have been done by itself to drop
> > > those calls first and then make this change to make it more clear.
> > > 
> > > OR atleast please explain these things better in the commit text.
> > 
> > If the above text is fine to you, I'll add it to the commit message.
> > 
> 
> This is fine, but the dropping of msm_hdmi_audio_update() from
> msm_hdmi_bridge_atomic_pre_enable() seems unrelated to the split OR using
> the DRM HDMI framework. It seems more because that call by itself without
> audio->enabled which is set in msm_hdmi_audio_info_setup() will not do
> anything.
> 
> So this is actually an independent fix and was just combined with this
> change? Thats the part I am trying to be more explicit about.

Ah, I see. I will bring it back.

> 
> > 
> 

-- 
With best wishes
Dmitry
