Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A59E1BF3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 13:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C884E10E346;
	Tue,  3 Dec 2024 12:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XSqLfwPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8759C10E346
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 12:19:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53df1e0641fso6213176e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 04:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733228384; x=1733833184; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5n+OPgKd4OeVfRcOdyszAmWQAYwYUA33KJvbyrKBpj8=;
 b=XSqLfwPYkEj3IHF0LL04S3ieTVJkA//vGE9B2RDcnu/PJjdTc9gyPyuW+ZJe5XHA4L
 Zaf9LsGs3EXZ1+/zSUiSZwWIJ36e75Av6BVi7uG/dwgsgIrpclmEXSlR8RQD9yUkPWCR
 7iEGXzch7+Uj7CxPfqtYcXJZi3Jpm8OUNE4HKWrIVYY/ehgt4vzRQ3AG0v9Z9t4KRPDN
 MK6F0i3FMpTDnCbGbzjk+cpywMdDsYx9mJd3scQSKsDu3VUXssmx7Gdz6oWE43x3EIg7
 Lj0Z0muCDxxyT/fcDnr7Fmi3w5TXui62wyy0UlMedFpucAgRJCaZBDRdtLf5a2TZe5pw
 cbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733228384; x=1733833184;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5n+OPgKd4OeVfRcOdyszAmWQAYwYUA33KJvbyrKBpj8=;
 b=QNigu0YS3u2aN5X/CLpRTQ9cWsTlgK15GbXY1xoaHedtVAfi2vu5nS8fQf+hLMJu2J
 M5erh1/Us3GIKRDH4ap8tC+rebXvBQr9/k33gJKL9dHI09NGuopH1fBwvUSksZ0Urqby
 4NhxzjTpGUPJZcgEl2Qe3n7Li+DcV2vXHCX3xLd8DgonT2+fHzaTpaC9/6cUpstznlhe
 u+uxIxo89yrp3m+8nD0aBpXrSrFtKWoZ7iFmsNqZ5KgPFK+OaXcW0xOGJ7JCDPyRa5Sn
 cDU81a7Si63kulWfgsQ1UM+krtnRuABVqUR7VNuVo2YVoFWQZeJSnO0eAqI6BiaX254o
 Yd3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMBhHM+Rdj5I5UnyQlBGaQlZ8qXGMUqrpQcwwp1TL4dkT2WcNI3e0hZuwIE0s0oXPMauP+9zTQOQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEvfs/okR9TvQ0woIeVygSyZ6ZKuGB8ZOBQQ4d7y1s7OySRHmm
 gAO9rP3MFyHAY4GA56QEo1hOGWX+qqpxnolWEUElwrcT9MSHnb1ZrtTcyKHWTSg=
X-Gm-Gg: ASbGnctwU2CtpEkPJx49wnlSoTBxYqF0rC1bIJB44Xuqlczew5zj3rcuBg+zcypiAY0
 dDrLsAfsxc6LA9sHUPLc7qe4rdxJ4u7MDA4361z3pDrIkEohiNj0m5Aiwqo6Rz45AGSsoJ0h5Tb
 /qqQXqA96Bf5N48KwfMpsbWLhrGJeWuDoedewVmC/07bW0y8/rPWf8iYAzmC1zyX0htVEnLkVpT
 tPeZTmh8Yjxy5YMtbmprkes+HmC+tX6+riyDNIKO1Rc2bKsmZi+shpf7tkUWKHTZDyTHu75DVgV
 7vr3Qo3DRfsOIwMHwob9dlHrqg3PeA==
X-Google-Smtp-Source: AGHT+IGqrNK3/JV3p7HUHgNYWUEc9ZkYpw0A4baw1aq7D6bW6M82dv1dR6gPJHjyZhTW0XLXbh3VUg==
X-Received: by 2002:a05:6512:32c9:b0:53d:e43c:9c5d with SMTP id
 2adb3069b0e04-53e12a06a29mr1124957e87.27.1733228384467; 
 Tue, 03 Dec 2024 04:19:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df643149asm1854312e87.37.2024.12.03.04.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 04:19:43 -0800 (PST)
Date: Tue, 3 Dec 2024 14:19:41 +0200
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
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Message-ID: <e7jngrc4nljdsksekinbkir2h76ztsth2xj4yqcyapfv43uryh@356yrxv3j4x6>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
 <20241202-industrious-unnatural-beagle-7da5d4@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-industrious-unnatural-beagle-7da5d4@houat>
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

On Mon, Dec 02, 2024 at 02:20:04PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Sorry, I've been drowning under work and couldn't review that series before.

No worries, at this point I'm more concerned about my IGT series rather
than this one.

> 
> I'll review the driver API for now, and we can focus on the exact
> implementation later on.
> 
> On Sun, Dec 01, 2024 at 02:44:12AM +0200, Dmitry Baryshkov wrote:
> > Drop driver-specific implementation and use the generic HDMI Codec
> > framework in order to implement the HDMI audio support.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++--------------------------------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
> >  2 files changed, 15 insertions(+), 55 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493263c00d593296a1e3ad 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
> >  	if (vc4_hdmi->variant->supports_hdr)
> >  		max_bpc = 12;
> >  
> > +	connector->hdmi_codec.max_i2s_channels = 8;
> > +	connector->hdmi_codec.i2s = 1;
> > +
> 
> I guess it's a similar discussion than we had with HDMI2.0+ earlier
> today, but I don't really like initializing by structs. Struct fields
> are easy to miss, and can be easily uninitialized by mistake.
> 
> I think I'd prefer to have them as argument to the init function. And if
> they are optional, we can explicitly mark them as unused.

Do you mean drm_connector_hdmi_init()? I think it's overloaded already,
but I defintely can think about:

drmm_connector_hdmi_init(..., max_bpc, HDMI_CODEC_I2S_PLAYBACK(8) |
HDMI_CODEC_NO_CAPTURE | HDMI_CODEC_DAI_ID(4));

or

... | HDMI_CODEC_NO_DAI_ID)

The default (0) being equivalent to:

HDMI_CODEC_NO_I2S | HDMI_CODEC_NO_SPDIF | HDMI_CODEC_NO_CAPTURE | HDMI_CODEC_NO_DAI_ID

WDYT?

> 
> Like, it looks like the get_dai_id implementation relies on it being set
> to < 0 for it to be ignored, but it's not here, so I'd assume it's used
> with an ID of 0, even though the driver didn't support get_dai_id so
> far?


-- 
With best wishes
Dmitry
