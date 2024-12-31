Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA99FEC94
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 04:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B1910E5CB;
	Tue, 31 Dec 2024 03:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dbW3DHjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE1310E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 03:45:28 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa67333f7d2so1399962866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 19:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735616667; x=1736221467; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RI+7nbA0Mzu0ksJ91JaVgtOoMaDibvKyhcyw54LCMU4=;
 b=dbW3DHjHK1UwfyeirjjM+Fv6xSSGkReYQoupVXn5gwemGBTvjqVzbANdi9/EGSKALl
 wDtlhy5hwh1XTI6/4rVxqGadlB5g9E1wR4hFbCq/P8s4oWU+KQeVECGpGG/tvzG9x+lv
 zvA2UaaQcMwubosUVgcsWCFFh+h09HMj8qe1aX/Kyw7laS/iiiitk/0dXde3Y1YqHHQ2
 07iGPHwlITlUhqkt90oLBREvlNaDkS5lwW1REjG+a5PMyceFus4gbyuu7Zx3HBZxUo4G
 lEsu35ZZOyGADflqjrv3G+iA2fiUYKBUaAbsLxcrCifnigcA9VHPljCH+Z2yCBQRODKb
 a3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735616667; x=1736221467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RI+7nbA0Mzu0ksJ91JaVgtOoMaDibvKyhcyw54LCMU4=;
 b=oiBda0C5z+MOXyUZy3sSFylepqbnkpnbcCKb/NQvE5VricUzQAnbiG61Cqln1u8K+G
 YAnlqMSvYaaIjL3Mzgic/J/UNT5EOKNqrPDj7k2KEfYOELIlneUeryBPpuC9PvAfztVv
 zNzGOZ313AEeRfEh/i2jAzEy7f1DgjuMTmSdpSIrv/5KUb6OEKcJgUh/cxEf/6sWAazy
 Xqpn1luZHpf534K24Geu3OoAosx9J/KsMt70hjowU8UGNyDl6EH7gaKE3zIEgV7ycPc9
 /nb6C743wHZQhilSjCwGkamy/7Tp2PtYVJvCoPbowDOgCYxAXVvwHVfdlQPUnPFs4owD
 Yc1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNlx7s4/RmJJElElBpfkJY7LPTIHNjmhasTmLswLI1xnVwzvHyO46yoOqtnAa9ypJvfJlF2sUiQaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgT9GaTKVCeV4XUvh3hqSGy8OTNVxWm3zWBEHofbeYGpy30PMq
 JPwSL9A0I6MgmAXVP0zd99UBHii7RFRuszlq9gJNIKv6VVVJIRTBv885YC6EU3f+Wunsmg8AZpB
 Z
X-Gm-Gg: ASbGncvLM/NJ45GrABYHEwWOYufMuLM6XEYz0XQeRsYLRwNeMD13Em/WxMCT8LLExXZ
 5FAwcKcerrYlKcvA5DmbsNp2R/q4/U4z4CL9TlRrWUs9Be9g02Xiy/8sOUi2ZqmFmOEtHzhOitU
 ZpLEA8fBMAHNlYZH0RpxOz6CnW7Vxdvr2mwkraxKXT22lmOjgYUVo6OvUdn1h6NRsiWcWoh+xca
 gvsC43QzuRwWGSCTJXUxQRGwOq3XY3jBcAiqL7sZaw1IiF67EtY9te+4k8n7hltkoy8TLmY1jeM
 OrtoccpL+HaVslFKXO9ySuG08ndo48d8Tll/
X-Google-Smtp-Source: AGHT+IEQngwlXfM9dt8rjOdrOkpWLx4+BQSwZSDQz+VJSVqmUl9GZRZw3hBdn7Zi64KM99/WDZ1KDg==
X-Received: by 2002:a05:6512:3405:b0:542:2a8b:d56f with SMTP id
 2adb3069b0e04-5422a8bd614mr11921584e87.4.1735612490788; 
 Mon, 30 Dec 2024 18:34:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5424c72cf59sm980707e87.271.2024.12.30.18.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 18:34:49 -0800 (PST)
Date: Tue, 31 Dec 2024 04:34:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
 andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, 
 chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com,
 dri-devel@lists.freedesktop.org, 
 heiko@sntech.de, hjc@rock-chips.com, inki.dae@samsung.com, 
 jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 kernel-list@raspberrypi.com, krzk@kernel.org, kyungmin.park@samsung.com,
 lgirdwood@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, 
 mcanal@igalia.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 p.zabel@pengutronix.de, perex@perex.cz, ple@baylibre.com, rfoss@kernel.org, 
 rgallaispou@gmail.com, simona@ffwll.ch, sw0312.kim@samsung.com, tiwai@suse.com,
 tzimmermann@suse.de
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
Message-ID: <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
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

On Tue, Dec 31, 2024 at 01:43:11AM +0100, Martin Blumenstingl wrote:
> Hello Dmitry,
> 
> this is great work - thanks for your efforts!
> 
> To give some context:
> I am working on a HDMI controller driver for the Amlogic Meson8/8b/8m2
> SoCs. Unfortunately the driver is not mature enough for upstream
> submission (all I have is the vendor driver which serves as reference).
> That said, my goal is to upstream the driver at some point. I have
> already switched my driver to use hdmi_{clear,write}_infoframe. Now
> I'm trying this series to simplify my code even further - by using
> your audio helper work!
> 
> > --- /dev/null
> > +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > @@ -0,0 +1,190 @@
> > [...]
> > +static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> > +	.audio_startup = drm_connector_hdmi_audio_startup,
> > +	.prepare = drm_connector_hdmi_audio_prepare,
> > +	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> > +	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> > +	.get_eld = drm_connector_hdmi_audio_get_eld,
> > +	.get_dai_id = drm_connector_hdmi_audio_get_dai_id,
> > +	.hook_plugged_cb = drm_connector_hdmi_audio_hook_plugged_cb,
> > +};
> On my platform drm_connector_hdmi_audio_prepare() is never called. As
> a result of that the audio infoframe is never written to my HDMI
> controller hardware (hdmi_write_infoframe() is never called with type
> HDMI_INFOFRAME_TYPE_AUDIO). My hack to make it work is to add the
> following line to drm_connector_hdmi_audio_ops:
>   .hw_params = drm_connector_hdmi_audio_prepare,
> 
> I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> seems that there is only a single driver which uses the .prepare
> callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> implement .hw_params instead.

Yes. However .hw_params don't have access to the infoframe contents, so
I had to settle on implementing .prepare.

> 
> The audio controller code for my platform is already upstream:
> - sound/soc/meson/aiu-codec-ctrl.c
> - sound/soc/meson/aiu-encoder-i2s.c
> - sound/soc/meson/aiu-fifo-i2s.c
> 
> My understanding is that you have a platform with a lontium-lt9611
> HDMI controller available for testing. Can you please help me
> investigate and find out which piece of code is calling
> hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
> your board?

Sure, this is the call trace on my platform (Qualcomm SDM845,
sdm845-db845c.dts):

lt9611_hdmi_audio_prepare+0x1c/0xc0 (P)
drm_bridge_connector_audio_prepare+0x2c/0x40 (L)
drm_bridge_connector_audio_prepare+0x2c/0x40
drm_connector_hdmi_audio_prepare+0x24/0x30
hdmi_codec_prepare+0xec/0x144
snd_soc_pcm_dai_prepare+0x78/0x10c
__soc_pcm_prepare+0x54/0x190
dpcm_be_dai_prepare+0x120/0x1d0
dpcm_fe_dai_prepare+0x9c/0x2a0
snd_pcm_do_prepare+0x30/0x50
snd_pcm_action_single+0x48/0xa4
snd_pcm_action_nonatomic+0xa0/0xa8
snd_pcm_prepare+0x90/0xec
snd_pcm_common_ioctl+0xd94/0x1a24
snd_pcm_ioctl+0x30/0x48
__arm64_sys_ioctl+0xb4/0xec
invoke_syscall+0x48/0x110
el0_svc_common.constprop.0+0x40/0xe0
do_el0_svc+0x1c/0x28
el0_svc+0x48/0x110
el0t_64_sync_handler+0x10c/0x138
el0t_64_sync+0x198/0x19c

Hope, this helps.

-- 
With best wishes
Dmitry
