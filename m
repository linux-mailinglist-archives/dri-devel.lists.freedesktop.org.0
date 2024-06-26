Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7568A9186E9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE45910E93C;
	Wed, 26 Jun 2024 16:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IMx+ef0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A94510E93C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:11:24 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52cdf2c7454so8324277e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719418282; x=1720023082; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sbhEvjvG0+S0jKL73QhvebbikzYI6KgKKLPFOTW6JQo=;
 b=IMx+ef0rH4DGK6Ap1zXfqpOGfbOLxIPs3Bd6q3wl34socPc7NUgSKNqhjAshLJu1HW
 jgY6HvDJTFVdLgkCXH6/Dov1BUYjg6hllMEUVO8gHQksu+23Pu4XFDXhSMFGsrxfwGQi
 HUSKZlbWPFKgMetLrRr4ZWHe3WntIV4A7efVcdJBydqF93aJOLkPHReA3zJOm3RC9lJv
 bCLa/LAwPyWlG3yEMEK9p5mzOBPJbSgqWjM2GOd3qGuMB2j0IKlrXXOnuP5sPO4dkN3g
 VtwcurCQWhnhLxjqjZlvjsW8hCr4kizsXA3YK9xN++RrGiSWm+7y74xY/d5NpDyIr43m
 aVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719418282; x=1720023082;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sbhEvjvG0+S0jKL73QhvebbikzYI6KgKKLPFOTW6JQo=;
 b=lKZdY4P3l5sD79WGmnyo9djNE+zHDmUPZh02t4nUR3FWIW8hdLmeHF+rP7abzf8S2f
 id7clXU5xCitF6QT+P0RIhBlIpYjngfF61B5OPKzxCqWhjptzfTJiChYTuueBKHrhFNH
 cJuIhb30yhBs0v1aEyMCNL1JTDNvSMUdrY//NcF+LTlpiyOLFpZXU3s1RNFQ4pQ6InbN
 dFRjR19lj+MKC8Qao/o1VJRykb0iLy1QYbGOPdaczEgqxmzIcrZUhDBpMjrUT3l+7x6B
 ZsSKTeX6nV81P+zQoASj4viKu4dT4Mr3zmjHtuy7fBm5UbVbrNzBUx/l6sqGwH99n3Ff
 F38A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDKyOD6gFKread9P4U98MpyctISyw3qMu3iL6uXpPWp6CZBcKFJlRQQwd0nW/TjnApLtNSwboseLUndR7SbCwUk78kOEPa16BN+V5VizbU
X-Gm-Message-State: AOJu0YyPCe60hYHkUi5UPqLbbFpjnUSp/JZnvQqH5cb8Bp4PbbNrnkYm
 1p/cGvv5igsQynVbGdm/jo43KZ0Ip3yuXJ8MNQvXMmwp7yBhKX0Otb5z5x1wEL8=
X-Google-Smtp-Source: AGHT+IFovT/Qkyd3fRnmp87RGtlsQxy3mmsB/6xiCPOtkFo7Oz4ZDoO6+zh5Vt8N6Y6HDfEU10YxmQ==
X-Received: by 2002:ac2:5195:0:b0:52c:e080:6a07 with SMTP id
 2adb3069b0e04-52ce1835949mr8564186e87.39.1719418280199; 
 Wed, 26 Jun 2024 09:11:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cebf46335sm658632e87.132.2024.06.26.09.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:11:19 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:11:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 3/5] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <r5226a5zzbp2d7zmxbskll6ed7coy4qbxhd6aaqulqzyuom6sp@dliwhreaqmtl>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
 <20240621-glorious-oryx-of-expression-1ad75f@houat>
 <CAA8EJpr=ervT-KD+tYphPeTfrFGDfSaxNaYC5hfzmtVch5v10g@mail.gmail.com>
 <20240626-spiked-heavenly-kakapo-1dafce@houat>
 <CAPY8ntAn3y5Su+SLJPv7FLq_aUhCv=vaATt4jLs4VUu4Xnd6aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAn3y5Su+SLJPv7FLq_aUhCv=vaATt4jLs4VUu4Xnd6aA@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 04:10:05PM GMT, Dave Stevenson wrote:
> Hi Maxime and Dmitry
> 
> On Wed, 26 Jun 2024 at 15:05, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Fri, Jun 21, 2024 at 02:09:04PM GMT, Dmitry Baryshkov wrote:
> > > On Fri, 21 Jun 2024 at 12:27, Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Sorry for taking some time to review this series.
> > >
> > > No problem, that's not long.
> > >
> > > >
> > > > On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrote:
> > > > > Several DRM drivers implement HDMI codec support (despite its name it
> > > > > applies to both HDMI and DisplayPort drivers). Implement generic
> > > > > framework to be used by these drivers. This removes a requirement to
> > > > > implement get_eld() callback and provides default implementation for
> > > > > codec's plug handling.
> > > > >
> > > > > The framework is integrated with the DRM HDMI Connector framework, but
> > > > > can be used by DisplayPort drivers.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/Makefile                   |   1 +
> > > > >  drivers/gpu/drm/drm_connector.c            |   8 ++
> > > > >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++++++++++++++++++++++
> > > > >  include/drm/drm_connector.h                |  33 ++++++
> > > > >  4 files changed, 199 insertions(+)
> > > > >

[...]

> > > > > +
> > > > > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
> > > > > +                                         uint8_t *buf, size_t len)
> > > > > +{
> > > > > +     struct drm_connector *connector = data;
> > > > > +
> > > > > +     //  FIXME: locking against drm_edid_to_eld ?
> > > > > +     memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> > > > > +                                                 void *data,
> > > > > +                                                 hdmi_codec_plugged_cb fn,
> > > > > +                                                 struct device *codec_dev)
> > > > > +{
> > > > > +     struct drm_connector *connector = data;
> > > > > +
> > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > +
> > > > > +     connector->hdmi_codec.plugged_cb = fn;
> > > > > +     connector->hdmi_codec.plugged_cb_dev = codec_dev;
> > > > > +
> > > > > +     fn(codec_dev, connector->hdmi_codec.last_state);
> > > > > +
> > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
> > > > > +                                          bool plugged)
> > > > > +{
> > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > +
> > > > > +     connector->hdmi_codec.last_state = plugged;
> > > > > +
> > > > > +     if (connector->hdmi_codec.plugged_cb &&
> > > > > +         connector->hdmi_codec.plugged_cb_dev)
> > > > > +             connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> > > > > +                                              connector->hdmi_codec.last_state);
> > > > > +
> > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > > >
> > > > I think we should do this the other way around, or rather, like we do
> > > > for drm_connector_hdmi_init. We'll need a hotplug handler for multiple
> > > > things (CEC, HDMI 2.0, audio), so it would be best to have a single
> > > > function to call from drivers, that will perform whatever is needed
> > > > depending on the driver's capabilities.
> > >
> > > I see, this API is probably misnamed. The hdmi_codec_ops use the
> > > 'plugged' term,
> >
> > Is it misnamed?
> >
> > It's documented as:
> >
> >   Hook callback function to handle connector plug event. Optional.
> >
> > > but most of the drivers notify the ASoC / codec during atomic_enable /
> > > atomic_disable path, because usually the audio path can not work with
> > > the video path being disabled.
> >
> > That's not clear to me either:
> >
> >   - rockchip/cdn-dp, msm/dp/dp-audio, dw-hdmi, seem to call it at
> >     enable/disable
> >
> >   - anx7625, mtk_hdmi and mtk_dp calls it in detect
> >
> >   - adv7511, ite-it66121, lontium-lt9611, lontium-lt9611uxc, sii902x,
> >     exynos, tda998x, msm_hdmi, sti, tegra, vc4 don't call it at all.
> 
> FWIW I have a patch in the next set that adds the call to vc4. The
> downstream version of the patch is at [1].

Nice!

> > So it doesn't look like there's a majority we can align with, and
> > neither should we: we need to figure out what we *need* to do and when,
> > and do that.
> >
> > From the documentation and quickly through the code though, handling it
> > in detect looks like the right call.
> 
> We concluded that hotplug detect appeared to be the right place as well.

Probably you also stumbled upon hotplug vs enable/disable. Could you
please comment, why you made your decision towards hotplug path?

> 
>   Dave
> 
> [1] https://github.com/raspberrypi/linux/commit/051392bfdc6dc54563ed9909cc1164e8d734af43
> 


-- 
With best wishes
Dmitry
