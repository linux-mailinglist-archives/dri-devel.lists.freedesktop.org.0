Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818DA4760E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 07:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5427210EA58;
	Thu, 27 Feb 2025 06:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ejttHyfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8210EA3B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 06:47:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54838cd334cso673115e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 22:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740638838; x=1741243638; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uXLsGNXwM63LVmn4MvDLtpepLIPBf52F5maI2gCJVyo=;
 b=ejttHyfCtxcz6heqh1ZHw+V4yoLLf3gYb7xrl20zVlUodF5zawc+A0++Hobs+FgofE
 NQ1nf4S3yBNZAIAzshJZ3PkzLUVTW2gZicx/yeiJCuwzkUg1/6VoQjA8yAVZyzomNF0B
 HRiz+rFWWJc+XmUxxQiNHi/sszOcKJVgf7VCUy3OcyXBPvvlQh6tlaKCwi2forxDbb8d
 qAYIv1e739BW9X84/8J1vAfMih2p5WHJ6kcEfKtAdD0nfAZ9xIveij9uRjRMbZXPjfTF
 f6W7CVsOj+lDwPzOCPHJIK4wMxXZsRP14Pv3J+4jgF/IEeZz75YOCRUoAKCjkUs9qut0
 HePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740638838; x=1741243638;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXLsGNXwM63LVmn4MvDLtpepLIPBf52F5maI2gCJVyo=;
 b=scBShcfva0nmeD3dk/NWvdqACm8fz7nC4f7ZEeDvbrMiot8zqKAhVOG2iYjDkJwR3V
 vcIiwOTcPPLvEW953m4dAbD6jDMMn/OKOtGpJ9rNIAZhVJA6ECmiO9ye1r26BZVgVoLw
 Qr0c+HkcakYxE4VKcqxnGaW42FVXSE2pOAxVAt3Xc0SD+uIl6F4lYrmJxrxeLLrTIqlr
 ByhRoX1MlHv2HrvW30vpIiJgYG5oS5oQSkIN/Nj7O24W+SYKyAJUXOhB/zdvl/erZqbn
 /HToq6tiJLTLo8qaYUF8aMqJVYd0sb/gyVBM4YUwMDC7T8Kkhc7mPZjQ356IMEGBkHXn
 yXFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhDT0PA0uiVrrS451Xyw6PN6JwohmZXfh0t8SRcqg19XcbZ9lwaiQYPRe5R76LrON/6JkpW7my5rY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCAk7INTodJnZwjiIXuCLYT7OHUZ7i+/P9rnKqS7DpVYyb2g4l
 kgjOHDm5K3tw54wjlATuSSsqiV9phQM0+dWcOfKUGcnRDD0NMAgcy6ZQ3MdRVvc=
X-Gm-Gg: ASbGncvJL+e19+pbZwZ8jgmicRCdD3aRVdS/3rUEFxqUeqF0gxDlwIOaeHDMMjovhLm
 ZokIE+ZokySFugLSVNeTUVbDBLsPlEPjmjYXrPla4arifr6rbCWfSbbKyKv2Ev/Y76Exg5Urh1/
 6i7w0uRxgdT11t8IECZ3pdXD+g0hfZkQb2j2FH5Ev3idZNzAhkbEX/6+I93Ky7CFlbAjZvg9MQM
 fAn3L7Tj2jyNhJeuUm4uhnC5xTmf10fRgZ3eKcuc+NMpzKk650KG0PkFDR+NAAp9UiwQ7snh6H+
 ktDbRiigV22hWhPqEYhhaj5w5qRTqNM2G5327499pvSNh1iR3Xrx0+lYP7kSL8/xurRHe6KOCt0
 4W9p0WA==
X-Google-Smtp-Source: AGHT+IG9t70T74qBx7CnC8jbRQLKhKqSlCT5clW047lLHMojYBxAlx+j31tvWwzmtDkV/C7tQU0QOQ==
X-Received: by 2002:a05:6512:15a6:b0:545:b28:2fa9 with SMTP id
 2adb3069b0e04-5493c56f238mr3743928e87.16.1740638838376; 
 Wed, 26 Feb 2025 22:47:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443be5c1sm89087e87.175.2025.02.26.22.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 22:47:17 -0800 (PST)
Date: Thu, 27 Feb 2025 08:47:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: kernel-list@raspberrypi.com, 
 David Turner <david.turner@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Add jack detection to HDMI audio driver
Message-ID: <kyoyebkotesmmwtonp3xp5tl6m5rd7bcmceaebbwsazmos5t2j@jh3yzmoaoi5z>
References: <20250222102921.75496-1-wahrenst@gmx.net>
 <3jyp24gystyet326exnbudsprwlpswacmcnvllumgapxlzz7n3@toysyujvsqwq>
 <2585e14d-bb91-4d0a-b0e0-39e60b0b88bd@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2585e14d-bb91-4d0a-b0e0-39e60b0b88bd@gmx.net>
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

On Wed, Feb 26, 2025 at 12:04:56PM +0100, Stefan Wahren wrote:
> Hi Dmitry,
> 
> Am 24.02.25 um 04:15 schrieb Dmitry Baryshkov:
> > On Sat, Feb 22, 2025 at 11:29:21AM +0100, Stefan Wahren wrote:
> > > From: David Turner <david.turner@raspberrypi.com>
> > > 
> > > Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> > > when to add/remove HDMI audio devices.
> > > 
> > > Signed-off-by: David Turner <david.turner@raspberrypi.com>
> > > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > > ---
> > >   drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++--
> > >   drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > >   2 files changed, 31 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index 47d9ada98430..d24ae86d799e 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -51,6 +51,7 @@
> > >   #include <linux/reset.h>
> > >   #include <sound/dmaengine_pcm.h>
> > >   #include <sound/hdmi-codec.h>
> > > +#include <sound/jack.h>
> > >   #include <sound/pcm_drm_eld.h>
> > >   #include <sound/pcm_params.h>
> > >   #include <sound/soc.h>
> > > @@ -386,6 +387,12 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> > >   	struct drm_connector *connector = &vc4_hdmi->connector;
> > >   	int ret;
> > > 
> > > +	/*
> > > +	 * Needs to be called for both connects and disconnects for HDMI
> > > +	 * audio hotplug to work correctly.
> > > +	 */
> > > +	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> > > +
> > >   	/*
> > >   	 * NOTE: This function should really be called with vc4_hdmi->mutex
> > >   	 * held, but doing so results in reentrancy issues since
> > > @@ -405,8 +412,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> > >   		return;
> > >   	}
> > > 
> > > -	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> > > -
> > >   	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > >   			connector->display_info.source_physical_address, false);
> > > 
> > > @@ -2203,6 +2208,22 @@ static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
> > >   	.shutdown = vc4_hdmi_audio_shutdown,
> > >   };
> > > 
> > > +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> > > +{
> > > +	struct vc4_hdmi *vc4_hdmi = snd_soc_card_get_drvdata(rtd->card);
> > > +	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> > > +	int ret;
> > > +
> > > +	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> > > +				    &vc4_hdmi->hdmi_jack);
> > > +	if (ret) {
> > > +		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL);
> > PLease excuse my ignorance, but dows this work. In other words, how is
> > the driver exporting the plugged state through this jack?
> there is no ignorance just a valid question. Unfortunately my knowledge
> here is very limited and I just wanted to minimize the delta between
> vendor and mainline tree. That's why I marked it as RFC.
> 
> Can someone from Raspberry Pi helps here?

Okay, I found it, the hdmi-codec calls snd_soc_jack_report() when
plugged_cb() is called by the HDMI driver.

Please split the patch into two pieces:
- one which moves a call to drm_atomic_helper_connector_hdmi_hotplug()
  to a proper place. The "Needs to be called" comment should go to the
  commit message insteads of the source code.

- another one which adds a jack to the sound card.

> 
> The patch seems to fix an issue? But I don't know the broader context.
> 
> Regards

-- 
With best wishes
Dmitry
