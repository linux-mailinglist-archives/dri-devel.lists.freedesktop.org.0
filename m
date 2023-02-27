Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C503A6A4307
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 14:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4735610E1E9;
	Mon, 27 Feb 2023 13:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754C110E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 13:39:19 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-536be69eadfso177071617b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GmDvuWeWwR1NfTB5MwjhYnmbSux+pOX0H7za+hpaPLg=;
 b=NYLFE9QpI+0UnHrnmum3H+Z7MQOatraF7RCS4fwhXBrS6vpY43tQsG2CNLmYnJv7JN
 ve3bYddDFBod3aRtKXLyVr0TJtKrOqqhLcF7LrHqWG0DxYVIq6WDVS3f3z2zxESU0A08
 vYhTQk46TdqUV9UVl1a+6XwF0XIIIL9OaBziU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GmDvuWeWwR1NfTB5MwjhYnmbSux+pOX0H7za+hpaPLg=;
 b=WNTxTsOPdLEtD2avRw7Pr73Iwk6yQ9ObHlO+OwksgaOpg4gHyJLpCfUkbxXDdm4d+c
 w9RPFaxnjnzf6+uLkM2BaEVMNQqVxOL7zc3cW1hGwpBNNv4atCF34A8xjDF4WSvrdpsZ
 p6IPHm96tuSxZe1QPFasIdmT2Hn8DuEs0RMwBnj67C0G98xFIrgfpb2YojcatClhFoM6
 7dj+1ZN9gwWjaLhVzsnQ/Ut+TB8lYIpXOeYaUKBsuP8rvjXVfzPd6aESQOamSa49Odj1
 q07w4yn1O+uQaQaZ/XWb2dYU5kduoY9x41KT8Fd20osLtMJZYpFu5smZZI8iSjVo/QLe
 P8Mw==
X-Gm-Message-State: AO0yUKVrgkEq8mjqVC07X3eW0HRaMsD7kNdb+9jbuSzNcoHRUCGRSwNA
 6uqSlrDBZpeUbJLjHSpo2WwDfSMEm873A71JIfXQ3A==
X-Google-Smtp-Source: AK7set8kFQgyTHGcP27mh+pe13xESHXkPJJaZW2zuDBhNZwK1lNafr9AeRkeW2rudQd4w7lKwVWCT8HMCW4XhjocZsQ=
X-Received: by 2002:a81:ac5c:0:b0:533:9b80:a30e with SMTP id
 z28-20020a81ac5c000000b005339b80a30emr10095336ywj.10.1677505158600; Mon, 27
 Feb 2023 05:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-3-jagan@amarulasolutions.com>
 <20230227121149.c3ibajgog3i2s2ek@houat>
In-Reply-To: <20230227121149.c3ibajgog3i2s2ek@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 Feb 2023 19:09:07 +0530
Message-ID: <CAMty3ZAnJHabRrdV+ndzYhLaMPXBTYvhC=XP5=Gv2KvwTxxQNQ@mail.gmail.com>
Subject: Re: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for
 drmm_panel_bridge_add
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 5:41 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Feb 27, 2023 at 05:09:09PM +0530, Jagan Teki wrote:
> > drmm_panel_bridge_add DRM-managed action helper is useful for the bridge
> > which automatically removes the bridge when drm pointer is cleaned.
> >
> > Supporting the same on non-component bridges like host DSI bridge requires
> > a drm pointer which is indeed available only when a panel-bridge is found.
> >
> > For these use cases, the caller would call the drmm_panel_bridge_add by
> > passing NULL to drm pointer.
> >
> > So, assign the bridge->dev to drm pointer for those cases.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v13:
> > - new patch
> >
> > Note: use case on
> > "[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find helper"
> >
> >  drivers/gpu/drm/bridge/panel.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index d4b112911a99..45a0c6671000 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
> >       if (IS_ERR(bridge))
> >               return bridge;
> >
> > +     /*
> > +      * For non-component bridges, like host DSI bridge the DRM pointer
> > +      * can be available only when a panel-bridge is found.
> > +      */
> > +     if (!drm)
> > +             drm = bridge->dev;
> > +
>
> Why can't the caller use bridge->dev?
>
> Also, where did the devm_drm_of_dsi_get_bridge go? I thought you were
> going to convert it to a drm-managed version?

I found another solution that supports DRM-managed action common
across dsi and normal bridges, can I send those patches alone by
excluding them from this series?

Please let me know.

Jagan.
