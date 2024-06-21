Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B991C912305
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 13:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48F610F152;
	Fri, 21 Jun 2024 11:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gAWWaBf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08BD10F152
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 11:09:14 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-627e3368394so18841667b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 04:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718968154; x=1719572954; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xRLVc5TCu6wN/R9dMvr02w+IQHwox0gQtpMbrPnpg5k=;
 b=gAWWaBf/aQAxtl2a2Pe9pu1xojrDe7EK8BwIgtoUsDQJpsoxLD26YG1GsGTq3Y390M
 cmxUyf5DSGyMReqjpy6fEACMYRwaiFosPrjUHCyB5/ouciOOfdhAw+zWntmeNGyZrgoY
 0SbtuivlS6/CxW9fd6k1eeU9QQYd9filByJUL+WWOUZ4PXWI0GTrVzbY4Bx/7ln7iTPm
 X16Vv+LLgdzBmUV8dH0tpyXaTEQtQNTY43YZcbXcsva+/bwDBsbb0HM+EVD7a56PQ4Ex
 1LXc/NZVppka3tCqyNosr2fowb+oBQ1OAtAM5acYLFdS0ew11rF15Mg19eOCW+mHQRt/
 r6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718968154; x=1719572954;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xRLVc5TCu6wN/R9dMvr02w+IQHwox0gQtpMbrPnpg5k=;
 b=hQGZTuvMMfusZYZjtZcGLn0ptL/7OXlOjEcupuIsMVM/ADkHi+zTHl6ytE0r3o8TxK
 ZPMBgkLUl77TDBCAe2mnPq9S3v7EoH669gI1sSl3i7iIJdk9pcdnRI3cG1qV6QX+3hNL
 Ayt5q2WE50gP3df5qMr/6TQYJt9g8ZFg5hqmoz08wA4h79p3lZV3EUiNgHT561AhNKJw
 ythNnivRpok9HtufosIep9A7pcnzQCWjleuvvd4jRAOD+5iUFi1ghVqrNfRAzY9XeURy
 72abZ0dFQCvcGyIkPtPwDaOFres6ayq3NbuFVmURSmzibaNeV0ydBZiN+GmFVkiPT+EF
 Dt0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0JrHLJiQKcyD9iCCo2eyyjMYIWgMu60VUD93e2CcqoOk+mBYBcEdG6GP1KOuYN/hqTPtI7oLhN4HI0+J/arA09D7Unl9BZRZKeinyFNBH
X-Gm-Message-State: AOJu0YzbhPINvL1+L/CySsymqHFO514ICJ7GP8/aDfUHTuE5OchZcdJE
 byZzt4Cf5UewYW9UjiSE0PEe9z13zdWxqtbwSW6CDGR8xsa3j5lROTRrRFYRwtAW7/r6RwVDTp1
 9HGuCub1k9iS7WyGqAX0vFaC1ADQg4q4/r8dLR0EvvxhPVgPYb+BTGg==
X-Google-Smtp-Source: AGHT+IGaR8g5BCLnJVI/fWoOYymz9UAn7WT9LLFsDuAWjwUJ/+IxKD0nVxrzGaC+xG2VU8eq+L4LL5SeCIkD0WEzAmU=
X-Received: by 2002:a81:4305:0:b0:617:c578:332c with SMTP id
 00721157ae682-63a8d73689dmr86764497b3.4.1718968153601; Fri, 21 Jun 2024
 04:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
 <20240621-glorious-oryx-of-expression-1ad75f@houat>
In-Reply-To: <20240621-glorious-oryx-of-expression-1ad75f@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 14:09:04 +0300
Message-ID: <CAA8EJpr=ervT-KD+tYphPeTfrFGDfSaxNaYC5hfzmtVch5v10g@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] drm/connector: implement generic HDMI codec
 helpers
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

On Fri, 21 Jun 2024 at 12:27, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> Sorry for taking some time to review this series.

No problem, that's not long.

>
> On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrote:
> > Several DRM drivers implement HDMI codec support (despite its name it
> > applies to both HDMI and DisplayPort drivers). Implement generic
> > framework to be used by these drivers. This removes a requirement to
> > implement get_eld() callback and provides default implementation for
> > codec's plug handling.
> >
> > The framework is integrated with the DRM HDMI Connector framework, but
> > can be used by DisplayPort drivers.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/Makefile                   |   1 +
> >  drivers/gpu/drm/drm_connector.c            |   8 ++
> >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++++++++++++++++++++++
> >  include/drm/drm_connector.h                |  33 ++++++
> >  4 files changed, 199 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 68cc9258ffc4..e113a6eade23 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -45,6 +45,7 @@ drm-y := \
> >       drm_client_modeset.o \
> >       drm_color_mgmt.o \
> >       drm_connector.o \
> > +     drm_connector_hdmi_codec.o \
> >       drm_crtc.o \
> >       drm_displayid.o \
> >       drm_drv.o \
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 3d73a981004c..66d6e9487339 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -279,6 +279,7 @@ static int __drm_connector_init(struct drm_device *dev,
> >       mutex_init(&connector->mutex);
> >       mutex_init(&connector->edid_override_mutex);
> >       mutex_init(&connector->hdmi.infoframes.lock);
> > +     mutex_init(&connector->hdmi_codec.lock);
> >       connector->edid_blob_ptr = NULL;
> >       connector->epoch_counter = 0;
> >       connector->tile_blob_ptr = NULL;
> > @@ -529,6 +530,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> >
> >       connector->hdmi.funcs = hdmi_funcs;
> >
> > +     if (connector->hdmi_codec.i2s || connector->hdmi_codec.spdif) {
> > +             ret = drmm_connector_hdmi_codec_alloc(dev, connector, hdmi_funcs->codec_ops);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       return 0;
> >  }
> >  EXPORT_SYMBOL(drmm_connector_hdmi_init);
> > @@ -665,6 +672,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >               connector->funcs->atomic_destroy_state(connector,
> >                                                      connector->state);
> >
> > +     mutex_destroy(&connector->hdmi_codec.lock);
> >       mutex_destroy(&connector->hdmi.infoframes.lock);
> >       mutex_destroy(&connector->mutex);
> >
> > diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> > new file mode 100644
> > index 000000000000..a3a7ad117f6f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> > @@ -0,0 +1,157 @@
> > +/*
> > + * Copyright (c) 2024 Linaro Ltd
> > + *
> > + * Permission to use, copy, modify, distribute, and sell this software and its
> > + * documentation for any purpose is hereby granted without fee, provided that
> > + * the above copyright notice appear in all copies and that both that copyright
> > + * notice and this permission notice appear in supporting documentation, and
> > + * that the name of the copyright holders not be used in advertising or
> > + * publicity pertaining to distribution of the software without specific,
> > + * written prior permission.  The copyright holders make no representations
> > + * about the suitability of this software for any purpose.  It is provided "as
> > + * is" without express or implied warranty.
> > + *
> > + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> > + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> > + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> > + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> > + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> > + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> > + * OF THIS SOFTWARE.
> > + */
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_managed.h>
> > +
> > +#include <sound/hdmi-codec.h>
> > +
> > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
> > +                                         uint8_t *buf, size_t len)
> > +{
> > +     struct drm_connector *connector = data;
> > +
> > +     //  FIXME: locking against drm_edid_to_eld ?
> > +     memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> > +
> > +     return 0;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> > +                                                 void *data,
> > +                                                 hdmi_codec_plugged_cb fn,
> > +                                                 struct device *codec_dev)
> > +{
> > +     struct drm_connector *connector = data;
> > +
> > +     mutex_lock(&connector->hdmi_codec.lock);
> > +
> > +     connector->hdmi_codec.plugged_cb = fn;
> > +     connector->hdmi_codec.plugged_cb_dev = codec_dev;
> > +
> > +     fn(codec_dev, connector->hdmi_codec.last_state);
> > +
> > +     mutex_unlock(&connector->hdmi_codec.lock);
> > +
> > +     return 0;
> > +}
> > +
> > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
> > +                                          bool plugged)
> > +{
> > +     mutex_lock(&connector->hdmi_codec.lock);
> > +
> > +     connector->hdmi_codec.last_state = plugged;
> > +
> > +     if (connector->hdmi_codec.plugged_cb &&
> > +         connector->hdmi_codec.plugged_cb_dev)
> > +             connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> > +                                              connector->hdmi_codec.last_state);
> > +
> > +     mutex_unlock(&connector->hdmi_codec.lock);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
>
> I think we should do this the other way around, or rather, like we do
> for drm_connector_hdmi_init. We'll need a hotplug handler for multiple
> things (CEC, HDMI 2.0, audio), so it would be best to have a single
> function to call from drivers, that will perform whatever is needed
> depending on the driver's capabilities.

I see, this API is probably misnamed. The hdmi_codec_ops use the
'plugged' term, but most of the drivers notify the ASoC / codec during
atomic_enable / atomic_disable path, because usually the audio path
can not work with the video path being disabled. I'll rename this
function to something like ..hdmi_codec_enable. or ...
hdmi_codec_set_enabled.

>
> So something like drm_connector_hdmi_handle_hotplug, which would then do
> the above if there's audio support.
>
> > +static void drm_connector_hdmi_codec_cleanup_action(struct drm_device *dev,
> > +                                                 void *ptr)
> > +{
> > +     struct platform_device *pdev = ptr;
> > +
> > +     platform_device_unregister(pdev);
> > +}
> > +
> > +/**
> > + * drmm_connector_hdmi_alloc - Allocate HDMI Codec device for the DRM connector
> > + * @dev: DRM device
> > + * @connector: A pointer to the connector to allocate codec for
> > + * @ops: callbacks for this connector
> > + *
> > + * Create a HDMI codec device to be used with the specified connector.
> > + *
> > + * Cleanup is automatically handled with in a DRM-managed action.
> > + *
> > + * The connector structure should be allocated with drmm_kzalloc().
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int drmm_connector_hdmi_codec_alloc(struct drm_device *dev,
> > +                                 struct drm_connector *connector,
> > +                                 const struct hdmi_codec_ops *base_ops)
> > +{
> > +     struct hdmi_codec_pdata codec_pdata = {};
> > +     struct platform_device *pdev;
> > +     struct hdmi_codec_ops *ops;
> > +     int ret;
> > +
> > +     ops = drmm_kmalloc(dev, sizeof(*ops), GFP_KERNEL);
> > +     if (!ops)
> > +             return -ENOMEM;
>
> Do we actually need to allocate a new structure here?

I didn't want to change the hdmi-codec's logic too much. But maybe
it's really better to have generic ops implementation here that calls
into the driver-specific callbacks.

> > +     *ops = *base_ops;
> > +
> > +     ops->get_eld = drm_connector_hdmi_codec_get_eld;
> > +     ops->hook_plugged_cb = drm_connector_hdmi_codec_hook_plugged_cb;
> > +
> > +     codec_pdata.ops = ops;
> > +     codec_pdata.i2s = connector->hdmi_codec.i2s,
> > +     codec_pdata.spdif = connector->hdmi_codec.spdif,
> > +     codec_pdata.max_i2s_channels = connector->hdmi_codec.max_i2s_channels,
> > +     codec_pdata.data = connector;
> > +
> > +     pdev = platform_device_register_data(connector->hdmi_codec.parent_dev,
> > +                                          HDMI_CODEC_DRV_NAME,
> > +                                          PLATFORM_DEVID_AUTO,
> > +                                          &codec_pdata, sizeof(codec_pdata));
>
> I think parent_dev should be setup by drm_connector_hdmi_init. I guess
> what I'm trying to say is that the reason HDMI support has been so
> heterogenous is precisely because of the proliferation of functions they
> needed to call, and so most drivers were doing the bare minimum until it
> worked (or they encountered a bug).
>
> What I was trying to do with the HDMI connector stuff was to make the
> easiest approach the one that works according to the spec, for
> everything.
>
> Audio is optional, so it should be a togglable thing (either by an
> additional function or parameter), but the drivers shouldn't have to set
> everything more than what the function requires.

I'll see what I can do. I had more or less the same goals, being hit
by the lack of the plugged_cb and get_eld support in the bridge's
implementation.

> Also, parent_dev is going to be an issue there. IIRC, ASoC will set its
> structure as the device data and overwrite whatever we put there.

It registers driver_data for the created device, it doesn't touch parent_dev.

>
> We worked around it in vc4 by making sure that snd_soc_card was right at
> the start of the driver structure and thus both pointers would be equal,
> but we have to deal with it here too.

Hmm, maybe I'm missing something. The snd_soc_card is a different
story. The bridges just provide the hdmi_codec_ops, the card itself is
handled by the other driver.

>
> > +     if (IS_ERR(pdev))
> > +             return PTR_ERR(pdev);
> > +
> > +     ret = drmm_add_action_or_reset(dev, drm_connector_hdmi_codec_cleanup_action, pdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     connector->hdmi_codec.codec_pdev = pdev;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drmm_connector_hdmi_codec_alloc);
> > +
> > +/**
> > + * drmm_connector_hdmi_codec_free - rollback drmm_connector_hdmi_codec_alloc
> > + * @dev: DRM device
> > + * @hdmi_codec: A pointer to the HDMI codec data
> > + *
> > + * Rollback the drmm_connector_hdmi_codec_alloc() and free allocated data.
> > + * While this function should not be necessary for a typical driver, DRM bridge
> > + * drivers have to call it from the remove callback if the bridge uses
> > + * Connector's HDMI Codec interface.
> > + */
> > +void drmm_connector_hdmi_codec_free(struct drm_device *dev,
> > +                                 struct drm_connector_hdmi_codec *hdmi_codec)
> > +{
> > +     drmm_release_action(dev, drm_connector_hdmi_codec_cleanup_action,
> > +                         hdmi_codec->codec_pdev);
> > +}
>
> What would it be useful for?

See the last patch,
https://lore.kernel.org/dri-devel/20240615-drm-bridge-hdmi-connector-v1-5-d59fc7865ab2@linaro.org/

if the bridge driver gets unbound, we should also unregister the codec
device. The codec infrastructure uses drmm to allocate data and a drmm
action to unregister the codec device. However the bridge drivers are
not bound by the drmm lifecycle. So we have to do that manually.

>
> > +EXPORT_SYMBOL(drmm_connector_hdmi_codec_free);
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index f750765d8fbc..0eb8d8ed9495 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -46,6 +46,7 @@ struct drm_property_blob;
> >  struct drm_printer;
> >  struct drm_privacy_screen;
> >  struct edid;
> > +struct hdmi_codec_ops;
> >  struct i2c_adapter;
> >
> >  enum drm_connector_force {
> > @@ -1199,6 +1200,8 @@ struct drm_connector_hdmi_funcs {
> >       int (*write_infoframe)(struct drm_connector *connector,
> >                              enum hdmi_infoframe_type type,
> >                              const u8 *buffer, size_t len);
> > +
> > +     const struct hdmi_codec_ops *codec_ops;
>
> I think I'd rather have the HDMI connector framework provide the ASoC
> hooks, and make the needed pointer casts / lookups to provide a
> consistent API to drivers using it.
>
> This will probably also solve the issue mentioned above.

Ack.

>
> >  };
> >
> >  /**
> > @@ -1706,6 +1709,22 @@ struct drm_connector_hdmi {
> >       } infoframes;
> >  };
> >
> > +struct drm_connector_hdmi_codec {
> > +     struct device *parent_dev;
> > +     struct platform_device *codec_pdev;
> > +
> > +     const struct drm_connector_hdmi_codec_funcs *funcs;
> > +
> > +     struct mutex lock; /* protects last_state and plugged_cb */
> > +     void (*plugged_cb)(struct device *dev, bool plugged);
> > +     struct device *plugged_cb_dev;
> > +     bool last_state;
> > +
> > +     int max_i2s_channels;
> > +     uint i2s: 1;
> > +     uint spdif: 1;
> > +};
>
> It would be great to have some documentation on what those are,
> last_state and the mutex especially raise attention :)

Yep, as I wrote in the cover letter, underdocumented.

>
>
> >  /**
> >   * struct drm_connector - central DRM connector control structure
> >   *
> > @@ -2119,6 +2138,12 @@ struct drm_connector {
> >        * @hdmi: HDMI-related variable and properties.
> >        */
> >       struct drm_connector_hdmi hdmi;
> > +
> > +     /**
> > +      * @hdmi_codec: HDMI codec properties and variables. Also might be used
> > +      * for DisplayPort audio.
> > +      */
> > +     struct drm_connector_hdmi_codec hdmi_codec;
>
> I'd rather make this part of drm_connector_hdmi, it cannot work without it.

It can. DisplayPort drivers also use hdmi_codec_ops. They should be
able to benefit from this implementation.



-- 
With best wishes
Dmitry
