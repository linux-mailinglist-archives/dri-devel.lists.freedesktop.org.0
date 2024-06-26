Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38401918834
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 19:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EB310E974;
	Wed, 26 Jun 2024 17:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Zc1yVt8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131A610E979
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 17:08:08 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6439f6cf79dso35754907b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1719421688; x=1720026488;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hug4wgAXnhxoD24e1k6r+oEcnYqVVDIHW/ISTyq7kVE=;
 b=Zc1yVt8cnP6mPm9cOsmFIP2XVXLd7cTsrrt2ZJP/I3waT0kWDYpB2SUiW3niWQFcoD
 TC6GibCjiRCDQYvuXUqF5MPfVDKWHyZrDk2nan0Up9WqR1OOl+1YV5mR3V8MBFHpWA7B
 X0Y00Vctz8ENAQbpJO/CXN2CBu7QJq14kVKWXl0dwlNfdbKlAoWn6llKR+lBf6KC5xtk
 Np4wM1b2u9sbuDvirGyjAZliugkuU95fliV3LLARSeeSUQ2IYaZyPgk2YqdU5zNRE5rc
 kCtrH7aRyGD2aU+pEcV7n0fSptJoPvJi2X20Nke6ml4vnXs482WXBVo/AXxwB7URNu5z
 gxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719421688; x=1720026488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hug4wgAXnhxoD24e1k6r+oEcnYqVVDIHW/ISTyq7kVE=;
 b=mZm9TNu0YCm7jZ99ghkTVVMN3L72YKcxs9shcYffqWrC8WRYTRdKU9ZAyS3MT9uYG+
 LAdUK12rIUVa7SKY1waENWA+3mm5KxS5uLLhrw0R7ceOIQdp7C8hiX9YRB2t7I+YRYYp
 fq2fUnN6cPJNjxukRFrPFs98L0VqJj3tKpxSPaPKDPMvEWgYiWyPnPOW/VlA+PGkgy6k
 /ZCjBDXeWKlknn5i9JfTfMIMTB0BeFeMM7FoqvnH2fJ7HUChVrxhG+HdVUJlA6bCz31h
 CtUdW4Fh325K1lLxeFtXTIJR0f5MILdN5QQiPVpI48RuC31feoH3zNaSmrKAY+9AOb95
 C3Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV82GbgyBKrviuj0fxJDM9n3A3to+NzI8n11v1eC9E3MS+4tHgkm55md9ThyvWnGCqHO2UUO5nZCKb2sgLzhmA0gZk5TWdATmQk3LUeEtjO
X-Gm-Message-State: AOJu0Yyt6kwiWDsDDwnRXiwMe88zrmGH8Fj7v20ibfeSF3pQO5KCO5zh
 VfcfzbTfJhTY3PB61GmYexxNdFV7njA+gKARaKJdcRme0lCFHMViDdP0m5lVaBjS032wZMjEaOo
 Cxkb7A0RxnwY7asAA/P6dhKPgSYHc7Ktm8sEUCA==
X-Google-Smtp-Source: AGHT+IGef53wQZYV8SIpLnPVQeM5KXZdDLHxp6Fi7FuyKkognl/w8npkNrMsRe8fOdyILv2/6zKWDIJ7ZgCQJdIVkLM=
X-Received: by 2002:a81:f105:0:b0:622:df58:2cf6 with SMTP id
 00721157ae682-643ac42da63mr86845067b3.50.1719421687834; Wed, 26 Jun 2024
 10:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
 <20240621-glorious-oryx-of-expression-1ad75f@houat>
 <CAA8EJpr=ervT-KD+tYphPeTfrFGDfSaxNaYC5hfzmtVch5v10g@mail.gmail.com>
 <20240626-spiked-heavenly-kakapo-1dafce@houat>
 <CAPY8ntAn3y5Su+SLJPv7FLq_aUhCv=vaATt4jLs4VUu4Xnd6aA@mail.gmail.com>
 <r5226a5zzbp2d7zmxbskll6ed7coy4qbxhd6aaqulqzyuom6sp@dliwhreaqmtl>
In-Reply-To: <r5226a5zzbp2d7zmxbskll6ed7coy4qbxhd6aaqulqzyuom6sp@dliwhreaqmtl>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Jun 2024 18:07:50 +0100
Message-ID: <CAPY8ntAtxsdbOKDt3oT87iexXHPw3aHhi=3T-rVX8BfOt5hFfg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] drm/connector: implement generic HDMI codec
 helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Dmitry

On Wed, 26 Jun 2024 at 17:11, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Jun 26, 2024 at 04:10:05PM GMT, Dave Stevenson wrote:
> > Hi Maxime and Dmitry
> >
> > On Wed, 26 Jun 2024 at 15:05, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Fri, Jun 21, 2024 at 02:09:04PM GMT, Dmitry Baryshkov wrote:
> > > > On Fri, 21 Jun 2024 at 12:27, Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Sorry for taking some time to review this series.
> > > >
> > > > No problem, that's not long.
> > > >
> > > > >
> > > > > On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrote:
> > > > > > Several DRM drivers implement HDMI codec support (despite its name it
> > > > > > applies to both HDMI and DisplayPort drivers). Implement generic
> > > > > > framework to be used by these drivers. This removes a requirement to
> > > > > > implement get_eld() callback and provides default implementation for
> > > > > > codec's plug handling.
> > > > > >
> > > > > > The framework is integrated with the DRM HDMI Connector framework, but
> > > > > > can be used by DisplayPort drivers.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/Makefile                   |   1 +
> > > > > >  drivers/gpu/drm/drm_connector.c            |   8 ++
> > > > > >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++++++++++++++++++++++
> > > > > >  include/drm/drm_connector.h                |  33 ++++++
> > > > > >  4 files changed, 199 insertions(+)
> > > > > >
>
> [...]
>
> > > > > > +
> > > > > > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
> > > > > > +                                         uint8_t *buf, size_t len)
> > > > > > +{
> > > > > > +     struct drm_connector *connector = data;
> > > > > > +
> > > > > > +     //  FIXME: locking against drm_edid_to_eld ?
> > > > > > +     memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> > > > > > +                                                 void *data,
> > > > > > +                                                 hdmi_codec_plugged_cb fn,
> > > > > > +                                                 struct device *codec_dev)
> > > > > > +{
> > > > > > +     struct drm_connector *connector = data;
> > > > > > +
> > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > +
> > > > > > +     connector->hdmi_codec.plugged_cb = fn;
> > > > > > +     connector->hdmi_codec.plugged_cb_dev = codec_dev;
> > > > > > +
> > > > > > +     fn(codec_dev, connector->hdmi_codec.last_state);
> > > > > > +
> > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
> > > > > > +                                          bool plugged)
> > > > > > +{
> > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > +
> > > > > > +     connector->hdmi_codec.last_state = plugged;
> > > > > > +
> > > > > > +     if (connector->hdmi_codec.plugged_cb &&
> > > > > > +         connector->hdmi_codec.plugged_cb_dev)
> > > > > > +             connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> > > > > > +                                              connector->hdmi_codec.last_state);
> > > > > > +
> > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > +}
> > > > > > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > > > >
> > > > > I think we should do this the other way around, or rather, like we do
> > > > > for drm_connector_hdmi_init. We'll need a hotplug handler for multiple
> > > > > things (CEC, HDMI 2.0, audio), so it would be best to have a single
> > > > > function to call from drivers, that will perform whatever is needed
> > > > > depending on the driver's capabilities.
> > > >
> > > > I see, this API is probably misnamed. The hdmi_codec_ops use the
> > > > 'plugged' term,
> > >
> > > Is it misnamed?
> > >
> > > It's documented as:
> > >
> > >   Hook callback function to handle connector plug event. Optional.
> > >
> > > > but most of the drivers notify the ASoC / codec during atomic_enable /
> > > > atomic_disable path, because usually the audio path can not work with
> > > > the video path being disabled.
> > >
> > > That's not clear to me either:
> > >
> > >   - rockchip/cdn-dp, msm/dp/dp-audio, dw-hdmi, seem to call it at
> > >     enable/disable
> > >
> > >   - anx7625, mtk_hdmi and mtk_dp calls it in detect
> > >
> > >   - adv7511, ite-it66121, lontium-lt9611, lontium-lt9611uxc, sii902x,
> > >     exynos, tda998x, msm_hdmi, sti, tegra, vc4 don't call it at all.
> >
> > FWIW I have a patch in the next set that adds the call to vc4. The
> > downstream version of the patch is at [1].
>
> Nice!
>
> > > So it doesn't look like there's a majority we can align with, and
> > > neither should we: we need to figure out what we *need* to do and when,
> > > and do that.
> > >
> > > From the documentation and quickly through the code though, handling it
> > > in detect looks like the right call.
> >
> > We concluded that hotplug detect appeared to be the right place as well.
>
> Probably you also stumbled upon hotplug vs enable/disable. Could you
> please comment, why you made your decision towards hotplug path?

We hit it in trying to get Pipewire to do the right thing on
hotplugging HDMI cables, and updating the lists of available audio
destinations in desktop plugins.
My memory is a little hazy, but I seem to recall the logic was that
whilst changing audio destination when you unplug the currently
selected HDMI output is reasonable, but doing so because you changed
resolution or the screen saver kicked in was less user friendly.
mtk_hdmi was used as a basis for the patch, although it's all largely
boilerplate anyway.

Yes the audio has to stop on enable/disable as HDMI video dictates all
the timings.
I've just checked with aplay playing audio and kmstest to change video
mode - audio pauses as it is disabled and resumes when the new mode is
selected.
One observation that I can't immediately explain is that if I use
kmstest to disable the HDMI display that is playing the audio, aplay
still completes without any errors logged. Using "time" on aplay is
returning the same duration for the playback whether the HDMI output
is enabled or not. That may be down to the vc4 hardware with the HDMI
FIFO accepting the data at the correct rate whether the video side is
enabled or not, but that is just a guess.

  Dave

> >
> >   Dave
> >
> > [1] https://github.com/raspberrypi/linux/commit/051392bfdc6dc54563ed9909cc1164e8d734af43
> >
>
>
> --
> With best wishes
> Dmitry
