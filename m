Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A884CAB6A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5636C10EDD8;
	Wed,  2 Mar 2022 17:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2823C10ED1C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:20:29 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p15so5165581ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 09:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fp8Y0aDLoUe+DH2fgkyBlmdv7Y4+jYVsy+4arRjQfos=;
 b=huJB9FLr6glLVeu4hvhrBj1hsbJqWU4/WsVtIRFZkkk7fvorFNA7N6fB++co1ruBXj
 Kn8fmvj89RUbt6bUJ9uC1vWQyX8L6OcMrASsme1lqpnEER79VhkiDGw8nFnLeLs1i01j
 rkdZvfBsM/s0dLwg1iqScRjX5fv5oaTxrwXoifGouT0gnQOXZqkC21iNW8uIx8Z0EBkz
 xlT4btaQTBmFfQUHaoVZ8tAixRGIYqwQ+m0/nFtLrus5FJRWtsJrb/BlaQrMhcyM/uwb
 8ZAlas5w5VrvUmssfNcmmobBAz6Vd97+3u+lP2+UyTiGygk4kl8C/Dl1n77JELmaNTw+
 SakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fp8Y0aDLoUe+DH2fgkyBlmdv7Y4+jYVsy+4arRjQfos=;
 b=ePXMQcG4pz/B+AS0K03qvN03HfU3Y/GQFbArUMhvqEVqWfCf7NjbU/IdP+4iDKoyi3
 OqXs4ah6YwXAxdyLY8c+KdRAZPc3WhST2OO0RyUs+rT7kLHboI4fBrVVUEu/CgTdRqXi
 wXf+xVBfgebFobo5/ovTk5EkW503rUKT1kEn+2vFXikRyvEssuhHw0Um/Q8jXzTNjqLV
 G2RDNS78YtYGoRNWT/J3jUVu42FPLYUHaFm/aCHS4Um7fnmXpilQDx5j76gHKF/jWuQe
 kGZaZz31Gg8aSuxVbZm3WHQwFQXaLBYq28NDjVsfap/TnBkndrD/hlYmfy6SE4+AX8Wb
 52bg==
X-Gm-Message-State: AOAM533qX6rYvSuYoZTZagjbJ1MPeaSuHM/gsjufS5RukiAk+/aINXk5
 6AQNsz75ObLkSEwATjW7/9Fs2hGfspSK2BvUwPaUZA==
X-Google-Smtp-Source: ABdhPJwF/HGlB49/EWAaDtJpLO7rdVUW8JHTBIwl462dkY+gCKqxYCVv/h/XgEol5/SQKHkvhFAh7MsJ/88l92pjjhA=
X-Received: by 2002:a17:906:7f09:b0:6d6:daee:566f with SMTP id
 d9-20020a1709067f0900b006d6daee566fmr9615015ejr.294.1646241626567; Wed, 02
 Mar 2022 09:20:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <CAD=FV=WX3i+6yubPVry8KUkO_14P94HTXv_uU8Pd5yPpw+iPRQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WX3i+6yubPVry8KUkO_14P94HTXv_uU8Pd5yPpw+iPRQ@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 2 Mar 2022 17:20:10 +0000
Message-ID: <CAPY8ntDX-XfpxQyLfZhW_jy=5nuG+znaufScHOBX9pNGGcE+bg@mail.gmail.com>
Subject: Re: [PATCH 0/2] DSI host and peripheral initialisation ordering
To: Doug Anderson <dianders@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On Wed, 2 Mar 2022 at 00:13, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Feb 16, 2022 at 9:00 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi All
> >
> > Hopefully I've cc'ed all those that have bashed this problem around previously,
> > or are otherwise linked to DRM bridges.
> >
> > There have been numerous discussions around how DSI support is currently broken
> > as it doesn't support initialising the PHY to LP-11 and potentially the clock
> > lane to HS prior to configuring the DSI peripheral. There is no op where the
> > interface is initialised but HS video isn't also being sent.
> > Currently you have:
> > - peripheral pre_enable (host not initialised yet)
> > - host pre_enable
> > - encoder enable
> > - host enable
> > - peripheral enable (video already running)
> >
> > vc4 and exynos currently implement the DSI host as an encoder, and split the
> > bridge_chain. This fails if you want to switch to being a bridge and/or use
> > atomic calls as the state of all the elements split off are not added by
> > drm_atomic_add_encoder_bridges.
> >
> > dw-mipi-dsi[1] and now msm[2] use the mode_set hook to initialise the PHY, so
> > the bridge/panel pre_enable can send commands. In their post_disable they then
> > call the downstream bridge/panel post_disable op manually so that shutdown
> > commands can be sent before shutting down the PHY. Nothing handles that fact,
> > so the framework then continues down the bridge chain and calls the post_disable
> > again, so we get unbalanced panel prepare/unprepare calls being reported [3].
> >
> > There have been patches[4] proposing reversing the entire direction of
> > pre_enable and post_disable, but that risks driving voltage into devices that
> > have yet to be powered up.
> > There have been discussions about adding either a pre_pre_enable, or adding a
> > DSI host_op to initialise the host[5]. Both require significant reworking to all
> > existing drivers in moving initialisation phases.
> > We have patches that look like they may well be addressing race conditions in
> > starting up a DSI peripheral[6].
>
> In general I'm happy to let the more senior people in DRM set the
> direction here so I probably won't do lots of review, but I will point
> out that I did have another proposal that sorta got lost in the noise
> of the whole "reversing the entire direction". That's basically:
>
> https://lists.freedesktop.org/archives/dri-devel/2021-October/328934.html
>
> I have no idea if something like that would work for your use case,
> but after analyzing it it felt like a surprisingly clean proposal even
> if my first instinct when I thought about it was that it was a hack.
> ;-) I suspect (but haven't analyzed your code) that it might be
> equivalent to your proposal of using a flag but maybe easier to wrap
> ones head around?

If I'm reading that right, then you're proposing adding
after_pre_enable and before_post_disable hooks.
That's almost the same as the power_up() and power_down() ops that
Dmitry suggested earlier, or pre_pre_enable / post_post_disable that
had also been considered.

Neither of those options handles the case of a longer chain in which
two non-consecutive links want their upstream bridge enabled first.
As per the clarification in patch 1/2, considering the chain
- Panel
 - Bridge 1
 - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
 - Bridge 3
 - Bridge 4 DRM_BRIDGE_OP_UPSTREAM_FIRST
 - Bridge 5
 - Encoder
With the flag option we call pre_enables as Panel, Bridge 1, Bridge 3,
Bridge 2, Bridge 5, Bridge 4, Encoder.
If adding after_pre_enable, then we end up with Panel, Bridge 1,
Bridge 3, Bridge 5, Bridge 4 (after_pre_enable), Bridge 2
(after_pre_enable), Encoder.
(power_on / pre_pre_enable from encoder to connector would end up with
Bridge 5 (power_on), Bridge 3 (power_on), Bridge 1 (power_on), Panel,
Bridge 2, Bridge 4, Encoder).
Those potentially work, but it seems a less logical order compared to
using a flag to swap only the bridges of interest. I think power_on /
pre_pre_enable covers DSI better than after_pre_enable.

Adding the extra ops requires the source bridge (eg DSI host) to know
the behaviour the sink bridge/panel wants. So do all DSI hosts have to
implement power_on to power up and enter LP-11. Some DSI peripherals
may be quite happy or even prefer to have the bus totally idle /
powered down at pre_enable, but there would be no way of implementing
that.

You seem to be looking at DP, which I have very little knowledge of,
and I don't quite understand your comments about the AUX bus and how
ordering should be configured. If your panel isn't a generic driver,
couldn't it request that the upstream bridge is pre_enabled first?

  Dave
