Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69228416467
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 19:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7579D6ED94;
	Thu, 23 Sep 2021 17:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECC86ED94;
 Thu, 23 Sep 2021 17:27:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i24so3419534wrc.9;
 Thu, 23 Sep 2021 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8P/N3nWO0xQm62MFlmAAZqgDHsYeso9viJ+hbtMyd4=;
 b=hy7aVkeaLnbUmjeFX+DYjMGNVNYriACYfGZQyjwmls49RYDUYd3/HoBrjRYAUBcP5u
 WdQnR73JdNER1uCzMJocK1HW91vlAVMxtZcESqP1i97xaJzjUhusfzOq5bZNIb/07u6O
 PHxp1L2be2L6LFSHWSN2hvDKWp6O/aFYzk04ao59UCgXZo4CfdQEz43ubxVEWZ+YhSyY
 7DAnjTjddx0gG8gorwAX2HMRpSZH3Xlg2biA8xt0TZ6xAl7dHMTaGxRx/P/jgPE9K9hy
 Aecwnh8Zc8otTWFXx6czDnJzLZ1teitLwEa8ByCIXrXn0AkpK3BAr9sNL8x0FgN0bPVR
 X+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8P/N3nWO0xQm62MFlmAAZqgDHsYeso9viJ+hbtMyd4=;
 b=S5nkrLeGDEzu5UIRWmThsU+0DuYqxoxSssigb2Xmx+nSqF5Ulq+v1iwzs5DfjIUWoD
 DThAk7py1piVr3u2xUJorudqz8HTOEIf1v9tYXiiZGJ8FnAaLgU5ZD6KnxGT8tmrVp2g
 rJfTTPy55UHkWbsLnhIeHtMp+5yrFcSzSz/fTZZbwcusdns/LdRMbWZCL0Pvnv43slKw
 +bUBcZzf8G42uxlpSO622PasyyEVP1rxuxjkvkdZJX5IF7H9BeFClVIE678JalvxPHw7
 NFx/8xxr3Y+d4k3gkGHU/IAcvpxRST+W86oxZaehZPY7MogvEkSpnGcBTbFC+CBOdSpA
 RQ4A==
X-Gm-Message-State: AOAM530LRFxOcRBpBL1+1X0MT7eU1dvX+DyHzjRDHOCXIHpOYAeSCoCk
 P684IITYRSG5KBcRpi5YSFHgahImq9NDTamwR+E=
X-Google-Smtp-Source: ABdhPJx6UeLUNJEg4ECtZTPmdRdNxeNfodeUo9giXcpmLiqe3uXJ23JEPIV7y6k3ETipKna4LRADAw7g7juNd7bi/Bg=
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr5668001wmr.168.1632418040015; 
 Thu, 23 Sep 2021 10:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-4-robdclark@gmail.com>
 <YUvN3j0v+8NMjNte@pendragon.ideasonboard.com>
In-Reply-To: <YUvN3j0v+8NMjNte@pendragon.ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 23 Sep 2021 10:31:52 -0700
Message-ID: <CAF6AEGviyfX6+c-CB5gMXqRQfHhvb5L8t++-VkZpvS3r9qDNoA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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

On Wed, Sep 22, 2021 at 5:44 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Mon, Sep 20, 2021 at 03:58:00PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Slightly awkward to fish out the display_info when we aren't creating
> > own connector.  But I don't see an obvious better way.
> >
> > v2: Remove error return with NO_CONNECTOR flag
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 ++++++++++++++++++++-------
> >  1 file changed, 29 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 6154bed0af5b..94c94cc8a4d8 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -667,11 +667,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> >                                                  .node = NULL,
> >                                                };
> >
> > -     if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > -             DRM_ERROR("Fix bridge driver to make connector optional!");
> > -             return -EINVAL;
> > -     }
> > -
> >       pdata->aux.drm_dev = bridge->dev;
> >       ret = drm_dp_aux_register(&pdata->aux);
> >       if (ret < 0) {
> > @@ -679,9 +674,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> >               return ret;
> >       }
> >
> > -     ret = ti_sn_bridge_connector_init(pdata);
> > -     if (ret < 0)
> > -             goto err_conn_init;
> > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +             ret = ti_sn_bridge_connector_init(pdata);
> > +             if (ret < 0)
> > +                     goto err_conn_init;
> > +     }
> >
> >       /*
> >        * TODO: ideally finding host resource and dsi dev registration needs
> > @@ -743,7 +740,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> >  err_dsi_attach:
> >       mipi_dsi_device_unregister(dsi);
> >  err_dsi_host:
> > -     drm_connector_cleanup(&pdata->connector);
> > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> > +             drm_connector_cleanup(&pdata->connector);
>
> I wonder if we actually need this. The connector gets attached to the
> encoder, won't it be destroyed by the DRM core in the error path ?

This does not appear to be the case, we leak the connector if I remove
this (and add a hack to trigger the error path)

> >  err_conn_init:
> >       drm_dp_aux_unregister(&pdata->aux);
> >       return ret;
> > @@ -792,9 +790,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> >       regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> >  }
> >
> > +/*
> > + * Find the connector and fish out the bpc from display_info.  It would
> > + * be nice if we could get this instead from drm_bridge_state, but that
> > + * doesn't yet appear to be the case.
>
> You already have a bus format in the bridge state, from which you can
> derive the bpp. Could you give it a try ?

Possibly the bridge should be converted to ->atomic_enable(), etc..
I'll leave that for another time

BR,
-R

> > + */
> >  static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> >  {
> > -     if (pdata->connector.display_info.bpc <= 6)
> > +     struct drm_bridge *bridge = &pdata->bridge;
> > +     struct drm_connector_list_iter conn_iter;
> > +     struct drm_connector *connector;
> > +     unsigned bpc = 0;
> > +
> > +     drm_connector_list_iter_begin(bridge->dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > +             if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
> > +                     bpc = connector->display_info.bpc;
> > +                     break;
> > +             }
> > +     }
> > +     drm_connector_list_iter_end(&conn_iter);
> > +
> > +     WARN_ON(bpc == 0);
> > +
> > +     if (bpc <= 6)
> >               return 18;
> >       else
> >               return 24;
>
> --
> Regards,
>
> Laurent Pinchart
