Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D924A29F33
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 04:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A2710E407;
	Thu,  6 Feb 2025 03:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v9bXwh40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54D710E407
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 03:08:45 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6f678a27787so4556937b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 19:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738811324; x=1739416124; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0IrdqFJIK9pHEJeBBjQmGRdouO7wy9i+RTIEY9ibaQ=;
 b=v9bXwh404tA/PdEkIBYWMvOsHItLnbwZQKzGBE121VVB+o9Ef2FblPmNTYVoyNRoqv
 8ySwRfK/ut/qr23VPgT8VdRXe5L0CtlDmhlU+Pk5vUR5tJNmrvXcGDk0dgkDz29QHHxX
 atvmVHUFPufK/b5a0rCv4oRvF6YEA/jaKbpG2b+sOfFUDqqEr/SBAf5XEdqoSmlBHD6I
 8FXEozZuS90KCYg58Jk+kEVTJXVfgmrLswY3GPXVfddymZ7tVc0iJJODDce7RmFWn1T+
 1VU0ahmPFowPeoICDsJ8I4UoLbO6o/ufW11A0udnZGWXYKSJDEQk7v3y1dtj+JHWvme8
 81aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738811324; x=1739416124;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0IrdqFJIK9pHEJeBBjQmGRdouO7wy9i+RTIEY9ibaQ=;
 b=NcyJdh+Nw+Pq2i5kLrQp1iT1tERa1HAVMtsYPqsBZN7CzXR/xshF6e+kJpxzFIq859
 2g7xshpD24ZEnq1Zu2qvm4LrI247LgZlpI9YVQpO3KqE6gX+Az3sG470GNBrJuZuTZYJ
 JY8gU5n6AzXylPhP5Svlq7+ZQ72C45LO135RhMAfnWu3MzpI3EoXqQe9liooqdbxmRUa
 qrAZ885ddx5GlwNS4jUlIJngtUhR7P6fRRpi0wlk+xqoUnj22uYtkV9b87YH4+E1OelO
 x2w4/7wtOvL8D2HUGA3FtAizMIesRDnv9eidEbQbaeoeRA3S403sx9rskePZk9OCWdmt
 XmJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUE9BzCtfd0IgCY8w0HK0uWjwARZN4ZJmEqZNZpOaP3Vj50JXSEjApQI5N9jlZbHyMMAvBORx/BvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm0WM7Lt+T6CI+127w9+ERbK36jLYo7OBj0UtdSbxBBYUU5o+r
 bzO/GARtvmM10eaYNQt9EmTrxmInseDlfkUoz7pyy23Ku9/aefhYqH1cqEe5eA7lQsb/E6TTjjb
 UfV4ZIiuWftQgzDAcLnEABxNYThev1Ik6UrpuzQ==
X-Gm-Gg: ASbGncuYHWKnSbOlbfwjHlp0vurjsHuKHYG+Vt2ePYHCZfvGclbhSdD0y3rrp7ZQ5ob
 vrQMfaDkiDPiCaYBgCKQfTu1np1LOuLJuvxfOLjhPMxDE1/G+S0kCaaPohfzl17NEjw2a1oQ=
X-Google-Smtp-Source: AGHT+IFEPX9hCQ37/v1Pk0bdptcnsa+EQY/WxVASIRCTOf/ifZHDhvU9xxe9pscbkAdV3OuowrmuPIF57zfJMGu9KWQ=
X-Received: by 2002:a05:690c:7407:b0:6f9:82a8:e5dd with SMTP id
 00721157ae682-6f989f817d1mr51911407b3.29.1738811324572; Wed, 05 Feb 2025
 19:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-1-5b5b2d4956da@linaro.org>
 <wchzy3tnppv5ql7k2juhynqz7kwjjsod3taykw3znxrzoomqdw@fudbksambvat>
 <mtzfnr53hug7ina7hf3s6ihzkdl7xswz6ibf46dgei73khj4ms@cfrxg32vdrbw>
 <20250205-strong-azure-koel-f5b1f1@houat>
In-Reply-To: <20250205-strong-azure-koel-f5b1f1@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Feb 2025 05:08:33 +0200
X-Gm-Features: AWEUYZk_XPi6NCy5jyqMsGwvKZsHdQsYK-xH8hzJ8BsWLzkccfb-e2uy9WbcVj8
Message-ID: <CAA8EJpoLcgYkKwyXNJtWi_Ym62rCRqnUPgztFXwdpdHv6k3yjQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] drm/connector: add CEC-related fields
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 5 Feb 2025 at 16:28, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Jan 28, 2025 at 03:12:41PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 11:33:05AM +0100, Maxime Ripard wrote:
> > > On Sun, Jan 26, 2025 at 03:29:06PM +0200, Dmitry Baryshkov wrote:
> > > > As a preparation to adding HDMI CEC helper code, add CEC-related fields
> > > > to the struct drm_connector. Include both cec_adapter and cec_notifier,
> > > > allowing drivers to select which one to use. The unregister callback
> > > > is provided to let drivers unregister CEC-related data in a generic way
> > > > without polluting drm_connector.c with dependencies on the CEC
> > > > functions.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_connector.c | 13 ++++++++++++
> > > >  include/drm/drm_connector.h     | 44 +++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 57 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..fffb718b09eaaac200e6abc7524bbfe98c4741f4 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
> > > >   INIT_LIST_HEAD(&connector->probed_modes);
> > > >   INIT_LIST_HEAD(&connector->modes);
> > > >   mutex_init(&connector->mutex);
> > > > + mutex_init(&connector->cec.mutex);
> > > >   mutex_init(&connector->eld_mutex);
> > > >   mutex_init(&connector->edid_override_mutex);
> > > >   mutex_init(&connector->hdmi.infoframes.lock);
> > > > @@ -698,6 +699,16 @@ static void drm_mode_remove(struct drm_connector *connector,
> > > >   drm_mode_destroy(connector->dev, mode);
> > > >  }
> > > >
> > > > +static void drm_connector_cec_unregister(struct drm_connector *connector)
> > > > +{
> > > > + mutex_lock(&connector->cec.mutex);
> > > > +
> > > > + if (connector->cec.funcs->unregister)
> > > > +         connector->cec.funcs->unregister(connector);
> > > > +
> > > > + mutex_unlock(&connector->cec.mutex);
> > > > +}
> > > > +
> > > >  /**
> > > >   * drm_connector_cleanup - cleans up an initialised connector
> > > >   * @connector: connector to cleanup
> > > > @@ -718,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> > > >
> > > >   platform_device_unregister(connector->hdmi_audio.codec_pdev);
> > > >
> > > > + drm_connector_cec_unregister(connector);
> > > > +
> > >
> > > This should either be in a separate patch, or mentioned in the commit title/log
> >
> > I'll mention it in the commit message.
> >
> > >
> > > >   if (connector->privacy_screen) {
> > > >           drm_privacy_screen_put(connector->privacy_screen);
> > > >           connector->privacy_screen = NULL;
> > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > > index f13d597370a30dc1b14c630ee00145256052ba56..6da840673b1209c84bbc396643c6033679a7ec74 100644
> > > > --- a/include/drm/drm_connector.h
> > > > +++ b/include/drm/drm_connector.h
> > > > @@ -46,6 +46,7 @@ struct drm_property_blob;
> > > >  struct drm_printer;
> > > >  struct drm_privacy_screen;
> > > >  struct drm_edid;
> > > > +struct cec_adapter;
> > > >  struct edid;
> > > >  struct hdmi_codec_daifmt;
> > > >  struct hdmi_codec_params;
> > > > @@ -1191,6 +1192,19 @@ struct drm_connector_hdmi_audio_funcs {
> > > >                      bool enable, int direction);
> > > >  };
> > > >
> > > > +/**
> > > > + * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
> > > > + */
> > > > +struct drm_connector_cec_funcs {
> > > > + /**
> > > > +  * @adap_unregister: unregister CEC adapter / notifier.
> > > > +  *
> > > > +  * The callback to unregister CEC adapter or notifier, so that the core
> > > > +  * DRM layer doesn't depend on the CEC_CORE.
> > > > +  */
> > > > + void (*unregister)(struct drm_connector *connector);
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
> > > >   */
> > > > @@ -1832,6 +1846,31 @@ struct drm_connector_hdmi {
> > > >   } infoframes;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > > > + */
> > > > +struct drm_connector_cec {
> > > > + /**
> > > > +  * @mutex: protects all CEC-related fields
> > > > +  */
> > >
> > > All fields? Which fields require to be protected by a specific mutex
> > > here?
> >
> > Yes, all the fields. adapter, notifier and funcs are all protected by
> > the mutex. See the drm_connector_cec_unregister() implementation (and
> > corresponding unregister() callbacks implementations.
>
> That's still surprising to me. Like, what concurrency source / code path
> will need to make sure funcs is updated properly? or the adapter and
> notifier?

I'll have to check, maybe we can lift that and really protect only the
adapter and the notifier. I was using ->funcs != NULL as a way to
check that CEC is registered at all (and thus unsetting it on CEC
unregistration). But maybe that's not that necessary.

>
> Maxime



-- 
With best wishes
Dmitry
