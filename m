Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA734233EFA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 08:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8057A6E9D7;
	Fri, 31 Jul 2020 06:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196F16E9D7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 06:17:31 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id v13so9235207oiv.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 23:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=66o0OMFmlbFpLFWMFNrEoa+yOxFl93bjoU+tv4t23Nw=;
 b=LXMvrDdAbnjAMTPQL1+TXLcIQnzZOiALJbcpVyb7IcoGbbKn9CBDz8kVcjt8yEHnAt
 2SQCS2Ark4lH/yVr4iq32vXSkGmu7qCx3nUbiJiZS/oUQaN/lZNBZzDF+RzgNwE7QuaO
 RFN92Q6982qO2rilh0mZ56KXTQJnv5hp+r+vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66o0OMFmlbFpLFWMFNrEoa+yOxFl93bjoU+tv4t23Nw=;
 b=pA8DtMjW+az8D5OeH5cJ799ODP2s8KD/QGsBQwEU26QoozyZrpdOT/P7jlBFXpXCtJ
 JhAiajbINjthx3Ag99UuIKl1giNggpV8Lu6L/lqK4FIUcfMJ1LNdpxRDKq3EAaxGGaUB
 AJIWm78+nvj+WFwpj8yqc/nmAx0WpPcawW/GrVFNocCn4dnMk0XgVoJ/seQY1mpygaWI
 fodMwnQ9s71PJVSet77RNfJS1Tgb+t3CLQpKhz/hrniT0lA8ezLHeg9x06S1BNSKpVdE
 Jmrtr0FJeBqYvDpoeYvfQ7ZY032nH5RE23+PGqdBgb/1dJPphzqdv69eC7JCV/HF+4Di
 Aqvg==
X-Gm-Message-State: AOAM531p3wImVJDr2WhJUTsEVrUsRrBn1w1yNnHHbSZW1tp0FAvLDKsZ
 1AXYoiD7VKP7bbPpSEKXvSrSmOl9oknKLH+o9nAWYQ==
X-Google-Smtp-Source: ABdhPJx8PtLtmc2rRopFwO3W50YwSFnbvzJo3D8EAy1O84zrWGMG2bTe22gAmCbwKmvyJGKwez3Mv2EURO6CGn36T60=
X-Received: by 2002:aca:ab87:: with SMTP id u129mr1861262oie.128.1596176250399; 
 Thu, 30 Jul 2020 23:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200703094506.22527-1-andy.yan@rock-chips.com>
 <3359f775-ba70-c116-e9b9-29b9ba692400@rock-chips.com>
In-Reply-To: <3359f775-ba70-c116-e9b9-29b9ba692400@rock-chips.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 31 Jul 2020 08:17:19 +0200
Message-ID: <CAKMK7uFLPOkv_WkBbcJicqEWP9FFqHJ=0xt+SHwgghTSTuXgbg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/connector: Add of_drm_find_connector
To: Andy Yan <andy.yan@rock-chips.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 4:33 AM Andy Yan <andy.yan@rock-chips.com> wrote:
>
> ping
>
> On 7/3/20 5:45 PM, Andy Yan wrote:
> > Add a function to look up a connector by
> > device tree node, like what of_drm_find_bridge/panel
> > does.
> >
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > Reported-by: kernel test robot <lkp@intel.com>

I'm pretty sure the answer is "no", but without a user for this it's
impossible to tell I guess. Always send out the patches using new
stuff together with the new stuff.
-Daniel

> >
> > ---
> >
> > Changes in v2:
> > - Add function declaration
> >
> >   drivers/gpu/drm/drm_connector.c | 33 +++++++++++++++++++++++++++++++++
> >   include/drm/drm_connector.h     | 14 ++++++++++++++
> >   2 files changed, 47 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index d877ddc6dc57..516376cd1868 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -743,6 +743,39 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter)
> >   }
> >   EXPORT_SYMBOL(drm_connector_list_iter_end);
> >
> > +#ifdef CONFIG_OF
> > +/**
> > + * of_drm_find_connector - look up a connector using a device tree node
> > + * @np: device tree node of the connector
> > + *
> > + *
> > + * Return: A pointer to the connector which match the specified device tree
> > + * node or NULL if no panel matching the device tree node can be found, or
> > + * -ENODEV: the device is not available (status != "okay" or "ok")
> > + */
> > +struct drm_connector *of_drm_find_connector(struct drm_device *dev, const struct device_node *np)
> > +{
> > +     struct drm_connector *connector;
> > +     struct drm_connector_list_iter conn_iter;
> > +
> > +     if (!of_device_is_available(np))
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > +             if (connector->of_node == np) {
> > +                     drm_connector_list_iter_end(&conn_iter);
> > +                     return connector;
> > +             }
> > +     }
> > +     drm_connector_list_iter_end(&conn_iter);
> > +
> > +     return NULL;
> > +}
> > +EXPORT_SYMBOL(of_drm_find_connector);
> > +#endif
> > +
> > +
> >   static const struct drm_prop_enum_list drm_subpixel_enum_list[] = {
> >       { SubPixelUnknown, "Unknown" },
> >       { SubPixelHorizontalRGB, "Horizontal RGB" },
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index fd543d1db9b2..d249e0498375 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -1129,6 +1129,9 @@ struct drm_connector {
> >       /** @attr: sysfs attributes */
> >       struct device_attribute *attr;
> >
> > +     /** @of_node: device tree node */
> > +     struct device_node *of_node;
> > +
> >       /**
> >        * @head:
> >        *
> > @@ -1647,6 +1650,17 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
> >   bool drm_connector_has_possible_encoder(struct drm_connector *connector,
> >                                       struct drm_encoder *encoder);
> >
> > +#if defined(CONFIG_OF)
> > +struct drm_connector *
> > +of_drm_find_connector(struct drm_device *dev, const struct device_node *np);
> > +#else
> > +static inline struct drm_connector *
> > +of_drm_find_connector(struct drm_device *dev, const struct device_node *np)
> > +{
> > +     return ERR_PTR(-ENODEV);
> > +}
> > +#endif
> > +
> >   /**
> >    * drm_for_each_connector_iter - connector_list iterator macro
> >    * @connector: &struct drm_connector pointer used as cursor
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
