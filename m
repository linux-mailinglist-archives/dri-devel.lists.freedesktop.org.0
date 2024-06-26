Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F4919038
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 20:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ABF10E1AA;
	Wed, 26 Jun 2024 18:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hQ4p6PZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636C810E1AA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 18:55:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52db1a5b3f8so945574e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719428125; x=1720032925; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tJk389cbhS/Wnwu2SKLbQMfLrxSdN1oJOWLJySuFjWs=;
 b=hQ4p6PZmz3lnzSv4Q9AdxhQk5WRt+jLqQCGvY1hlhI58ISAqjVfXMiBwRGcHbGnuuU
 0/BG0Vy8hexli+bOAPRWha+DVb8wMTb9DwQ/sYJBMLrhJM8YVxJTx647HM0tpm4N6vol
 6ZTCwAvwrU9Kc0H/o5WHCzOkUFdSn5bmUJktLOys7velTVni7OoeHNQsZMTPauTOfDkZ
 KUYJN07Cjcpx88OCzywnylzuzgfBcPqxA7URimXTvTa65hE/KV0NuYD9pgfDkQRBUAgB
 Q1Db8Ki49+DWyBWAESxk5lFD/FjtkUyooJ+8cIq79ury/D382k/ncMYC+/1V4dxQUSL6
 +Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719428125; x=1720032925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJk389cbhS/Wnwu2SKLbQMfLrxSdN1oJOWLJySuFjWs=;
 b=WvNCUAi1JNx/x8+5My9/6yFZegiNndOHCj4eOtjeGGXxzZkLhl+k2tjpAYUA9hxa8t
 OHG3YwExwwhMG6q2gzXD2dWKucJG0fK6T/T0aiVqEqS0/Xn3E43k9C5m1tVjC7P+bhTB
 lQLu+s3EusWrc0SsSsTjeDhYFcKd+i1ez4NuN0t8becOxNDuQw8E3DvC/Z1EsUUCA8k3
 P+BhRRpsdTi2t3njbJ+GUtfHZmNjF83dWij4cjyUC1CsNneXPBhoxPhuor/aq+Zr9dpU
 RByvBBgItD4s7G51XlxrHgwc9HqRRunxrQrwbL/o4Hm9RmDXptf4FQFbbfOAStxuuPkP
 OPNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX12bkuaIZf8yXd2+fbDVhtEJ4deTOC3VcCcVRO45u/izkiAYmEirlxNjD5ekGF/u3peyLlLyaOh0Ix/Vg7BOPLg0y/4bbDut6nmufpBUXq
X-Gm-Message-State: AOJu0YzfExyOngI1cbkbWGwK45erBVkDSfiifGc7w2LL5d2u9CbCI5ti
 V3SCNIDnKhc5sVZ4a5BE8ObBq/AqOzuYfp/0E58tCp8bMzKp5sPkXA9GSNVxu7k=
X-Google-Smtp-Source: AGHT+IEzgjQank1MiXR1gW8pgsfhfuMw96c/P23XLI5zpWwmahoalDqVZT4vqH5xCd2zyBeSgFZRZw==
X-Received: by 2002:a19:5f5d:0:b0:52c:d7d9:9ba4 with SMTP id
 2adb3069b0e04-52e6ecb87e7mr112336e87.31.1719428123394; 
 Wed, 26 Jun 2024 11:55:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd84b23d9sm1653486e87.202.2024.06.26.11.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 11:55:22 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:55:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
Message-ID: <5j4orksor4gpubn6ck5bq3k7oi6atdww77zsacwv2pdwp6d6xb@x4a5dm7utnqt>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
 <20240621-glorious-oryx-of-expression-1ad75f@houat>
 <CAA8EJpr=ervT-KD+tYphPeTfrFGDfSaxNaYC5hfzmtVch5v10g@mail.gmail.com>
 <20240626-spiked-heavenly-kakapo-1dafce@houat>
 <CAPY8ntAn3y5Su+SLJPv7FLq_aUhCv=vaATt4jLs4VUu4Xnd6aA@mail.gmail.com>
 <r5226a5zzbp2d7zmxbskll6ed7coy4qbxhd6aaqulqzyuom6sp@dliwhreaqmtl>
 <CAPY8ntAtxsdbOKDt3oT87iexXHPw3aHhi=3T-rVX8BfOt5hFfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAtxsdbOKDt3oT87iexXHPw3aHhi=3T-rVX8BfOt5hFfg@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 06:07:50PM GMT, Dave Stevenson wrote:
> Hi Dmitry
> 
> On Wed, 26 Jun 2024 at 17:11, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Jun 26, 2024 at 04:10:05PM GMT, Dave Stevenson wrote:
> > > Hi Maxime and Dmitry
> > >
> > > On Wed, 26 Jun 2024 at 15:05, Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > On Fri, Jun 21, 2024 at 02:09:04PM GMT, Dmitry Baryshkov wrote:
> > > > > On Fri, 21 Jun 2024 at 12:27, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > Sorry for taking some time to review this series.
> > > > >
> > > > > No problem, that's not long.
> > > > >
> > > > > >
> > > > > > On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrote:
> > > > > > > Several DRM drivers implement HDMI codec support (despite its name it
> > > > > > > applies to both HDMI and DisplayPort drivers). Implement generic
> > > > > > > framework to be used by these drivers. This removes a requirement to
> > > > > > > implement get_eld() callback and provides default implementation for
> > > > > > > codec's plug handling.
> > > > > > >
> > > > > > > The framework is integrated with the DRM HDMI Connector framework, but
> > > > > > > can be used by DisplayPort drivers.
> > > > > > >
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/Makefile                   |   1 +
> > > > > > >  drivers/gpu/drm/drm_connector.c            |   8 ++
> > > > > > >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++++++++++++++++++++++
> > > > > > >  include/drm/drm_connector.h                |  33 ++++++
> > > > > > >  4 files changed, 199 insertions(+)
> > > > > > >
> >
> > [...]
> >
> > > > > > > +
> > > > > > > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
> > > > > > > +                                         uint8_t *buf, size_t len)
> > > > > > > +{
> > > > > > > +     struct drm_connector *connector = data;
> > > > > > > +
> > > > > > > +     //  FIXME: locking against drm_edid_to_eld ?
> > > > > > > +     memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> > > > > > > +
> > > > > > > +     return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> > > > > > > +                                                 void *data,
> > > > > > > +                                                 hdmi_codec_plugged_cb fn,
> > > > > > > +                                                 struct device *codec_dev)
> > > > > > > +{
> > > > > > > +     struct drm_connector *connector = data;
> > > > > > > +
> > > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > > +
> > > > > > > +     connector->hdmi_codec.plugged_cb = fn;
> > > > > > > +     connector->hdmi_codec.plugged_cb_dev = codec_dev;
> > > > > > > +
> > > > > > > +     fn(codec_dev, connector->hdmi_codec.last_state);
> > > > > > > +
> > > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > > +
> > > > > > > +     return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
> > > > > > > +                                          bool plugged)
> > > > > > > +{
> > > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > > +
> > > > > > > +     connector->hdmi_codec.last_state = plugged;
> > > > > > > +
> > > > > > > +     if (connector->hdmi_codec.plugged_cb &&
> > > > > > > +         connector->hdmi_codec.plugged_cb_dev)
> > > > > > > +             connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> > > > > > > +                                              connector->hdmi_codec.last_state);
> > > > > > > +
> > > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > > +}
> > > > > > > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > > > > >
> > > > > > I think we should do this the other way around, or rather, like we do
> > > > > > for drm_connector_hdmi_init. We'll need a hotplug handler for multiple
> > > > > > things (CEC, HDMI 2.0, audio), so it would be best to have a single
> > > > > > function to call from drivers, that will perform whatever is needed
> > > > > > depending on the driver's capabilities.
> > > > >
> > > > > I see, this API is probably misnamed. The hdmi_codec_ops use the
> > > > > 'plugged' term,
> > > >
> > > > Is it misnamed?
> > > >
> > > > It's documented as:
> > > >
> > > >   Hook callback function to handle connector plug event. Optional.
> > > >
> > > > > but most of the drivers notify the ASoC / codec during atomic_enable /
> > > > > atomic_disable path, because usually the audio path can not work with
> > > > > the video path being disabled.
> > > >
> > > > That's not clear to me either:
> > > >
> > > >   - rockchip/cdn-dp, msm/dp/dp-audio, dw-hdmi, seem to call it at
> > > >     enable/disable
> > > >
> > > >   - anx7625, mtk_hdmi and mtk_dp calls it in detect
> > > >
> > > >   - adv7511, ite-it66121, lontium-lt9611, lontium-lt9611uxc, sii902x,
> > > >     exynos, tda998x, msm_hdmi, sti, tegra, vc4 don't call it at all.
> > >
> > > FWIW I have a patch in the next set that adds the call to vc4. The
> > > downstream version of the patch is at [1].
> >
> > Nice!
> >
> > > > So it doesn't look like there's a majority we can align with, and
> > > > neither should we: we need to figure out what we *need* to do and when,
> > > > and do that.
> > > >
> > > > From the documentation and quickly through the code though, handling it
> > > > in detect looks like the right call.
> > >
> > > We concluded that hotplug detect appeared to be the right place as well.
> >
> > Probably you also stumbled upon hotplug vs enable/disable. Could you
> > please comment, why you made your decision towards hotplug path?
> 
> We hit it in trying to get Pipewire to do the right thing on
> hotplugging HDMI cables, and updating the lists of available audio
> destinations in desktop plugins.
> My memory is a little hazy, but I seem to recall the logic was that
> whilst changing audio destination when you unplug the currently
> selected HDMI output is reasonable, but doing so because you changed
> resolution or the screen saver kicked in was less user friendly.
> mtk_hdmi was used as a basis for the patch, although it's all largely
> boilerplate anyway.

Hmm, I should check how this is handled on the standard desktops. With
the DisplayPort and link training it might take a significant amount of
time to switch the mode.

> Yes the audio has to stop on enable/disable as HDMI video dictates all
> the timings.
> I've just checked with aplay playing audio and kmstest to change video
> mode - audio pauses as it is disabled and resumes when the new mode is
> selected.
> One observation that I can't immediately explain is that if I use
> kmstest to disable the HDMI display that is playing the audio, aplay
> still completes without any errors logged. Using "time" on aplay is
> returning the same duration for the playback whether the HDMI output
> is enabled or not. That may be down to the vc4 hardware with the HDMI
> FIFO accepting the data at the correct rate whether the video side is
> enabled or not, but that is just a guess.

I guess so. With msm/hdmi and with msm/dp we should be getting an error
when the video is turned off. I don't remember if it is an immediate
error or something that happens at the end of the period. Adding Srini,
our audio expert, he should know it better.

For external HDMI bridges I completely have no idea, but I guess we
don't need to worry too much, as they are just taking I2S or SPDIF audio
from the bus.

In the worst case we conclude that the calling point is driver-dependent
and as such it is not suitable to call the plugged callback from the
drm_bridge_connector.

-- 
With best wishes
Dmitry
