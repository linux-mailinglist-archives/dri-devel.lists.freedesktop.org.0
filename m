Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777FF9D5E3F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 12:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427A10E2FC;
	Fri, 22 Nov 2024 11:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lDt0nymv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42410E2FC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 11:35:25 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539f2b95775so3002367e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732275323; x=1732880123; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
 b=lDt0nymvH2l5Lxfbh7iLAMw8+/WHzTm9MOjZYhPnY+ZYZE1kSJIrjGMeMwYXsULL/E
 3tNeX1J9l2vAmwl2y97P7oUUsq45EMUnOqIERZuDtHdrllj+K1sK6cfv1EBg9ZMEf0MM
 dAPtbVn72NqbII25IGSDpBwXQNzQTUwajiAQbpGMuAkX7AlxHNBmCzy7IBG2xdfmJqqP
 +GTXR9Ry2Q+nPlc4tibnoHZXAPrlkdjIXOx/mro8vs2L9VrCnEA0tenVSGw/D4vC3qJG
 VMyQavFoSIoHVUolWzmnDFWBvUt5AB3XisvbfGbnnR6TxIEsZ0exAChxJ4sr0tWBk2GO
 CUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732275323; x=1732880123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
 b=LdTEzy6EyFYY6aHiV49Qm1494tnQiQHx4xm+LJE24jZvTs/F/2a2/SZxbHLwLf4fgU
 Goh+gbkc0FuleES6YCLUny8DZPvkKsTrwiw5IU5qczgTtOHH3fOcUEz8YiTRsTvyiyMn
 jkQLCjfrOzsbOaT6mxpY4E1dMqOtS6nwSlFtZLqAMW0XQ59FpsLIx+yS+zlKp0B9oa0H
 aC93z/vOjxPiQn7G7jDpEAiSrl/UyIUgvU0AjoqMJy0sCrhCNoDJMJCWXzh+DMrOsPPd
 wr2gAFJCmcqDoSR/1mQML+IUhts45P7L7b15kIXJ4hJ3StPr3eYcJ48kifqsXtqBNuWs
 f4Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpI4tmZkGRPsEh3tvuS5up1bN+oAskw6CbuL1EtgIB8SN9etaE/bTce6CuQ4GhmUUleBuZtZTXsbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM03oYZ+S3D6aFf52S1iWqjeZJRTzGRkswyKs8D9+DM5xnKaC6
 2HxcIH2GIrpn+haswZ6tX0W7mcP1HR9Vj7i5pWC9/DMZkdTAr4KS7y+g3ca7TsU=
X-Gm-Gg: ASbGncv8dKxUHMUKtIRSzVprVwqLRHdBisS3PKRQRHUEDRL/27jx5n4R2btyfMaoGM7
 P2qlSpH0i+f1tpiEW146yP3wQDrq9hRDDKgr/kvOb6NcdM+wFUMWTFFWIlRpNHZwwt3vaVGZuAl
 yFmbYrA2RK+ggZiJsBlAGXttlY+38Jr2q7CdICMfmkwhsEUrIjT6y4UATlfZe5RCT8aoEXeGXMw
 Z1XxD/4R96Z53rVyvfLSyVEdsDFbADGYJ03KBsJsjknmAkejcJkE63DuMAn3QuOR9tK5iQ0MMdv
 ObBDZjMjVB3Q31d1XBc9GXhkjFV+zA==
X-Google-Smtp-Source: AGHT+IHcS5D0tQAmLEPHu7UajYtNpfZvhiuBwDM25QDIUqbvD9w+ge3SD7yoJlUUHrhodq7JCz8ehA==
X-Received: by 2002:ac2:5eda:0:b0:53d:d3ff:7874 with SMTP id
 2adb3069b0e04-53dd3ff78e0mr1407682e87.29.1732275323001; 
 Fri, 22 Nov 2024 03:35:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd3f12809sm270502e87.38.2024.11.22.03.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 03:35:21 -0800 (PST)
Date: Fri, 22 Nov 2024 13:35:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/7] drm/connector: implement generic HDMI codec helpers
Message-ID: <altuhp26ntnpltvfdmikggdmibyizdwnrmwshte7sa2btmbgvj@mbhlvwb4xrzj>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
 <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
 <87ed33zf5e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed33zf5e.fsf@intel.com>
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

On Fri, Nov 22, 2024 at 01:22:53PM +0200, Jani Nikula wrote:
> On Fri, 22 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
> >  				const struct drm_framebuffer *fb);
> >  void drm_framebuffer_debugfs_init(struct drm_device *dev);
> >  
> > +/* drm_connector_hdmi_codec.c */
> > +
> > +int drm_connector_hdmi_codec_init(struct drm_connector *connector);
> > +void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
> > +
> >  #endif /* __DRM_INTERNAL_H__ */
> 
> Better fit in drm_crtc_internal.h or drm_crtc_helper_internal.h?
> 
> Maybe we could use an internal header inside display/. Or just 1:1
> drm_foo_internal.h for every drm_foo.c to keep things simple and have
> fewer interdependencies.

Sounds like drm_connector_hdmi_codec_internal.h. Most likely we should
also split or rename drm_crtc_*_internal.h, but that's a separate topic.

-- 
With best wishes
Dmitry
