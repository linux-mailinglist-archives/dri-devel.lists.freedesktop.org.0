Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013FB4CADDF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73B810E1C7;
	Wed,  2 Mar 2022 18:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D0C10E1C7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 18:47:43 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bq11so3552971edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=temVCJmzY6jHTpKmuU3c4b6mCQisMR2DA6PE6kC7kMs=;
 b=RJ4WEvVXkmlBdMHWpfpv9z4K05AI8z7gPWwv+6LTDgX3FjJxLrblupDd1YPYPbvG8Y
 IwXWseCCKq/3W1dcmdVe0O2ha62Niax3KG+DokPvU4Gtg2khj8v0W1PBMcFsat/gCUuW
 LK4Cg4GAkL/N2DD4mERCrNX6WAShCuH8MgRUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=temVCJmzY6jHTpKmuU3c4b6mCQisMR2DA6PE6kC7kMs=;
 b=Vmjn8dtkGtc6EsAdVzo0ynF9QqKPRYyZKFttfWYTBSkJfBNFvQrML8AJ9ieN6zlpdt
 fLY6UE3itM+KcLKOO6DunOtR92McnXAjq2syaGYmXRwvKZxooOrq6lj1HN2wgiX0Xqi6
 dBQ+DDVK05NkPcEOIQeTBPeZ47ENXc6opv9lRyHZiY0OxAzAtqWBqCOjXWFN9svPlBRP
 IlMNEhEcLmNQwCXHp3NjfHs0mAS81jfnE8nhk6odtMX0+QFbXN48A59/3VoReJagufsh
 aboLsRbF0B5ygnkoqQ6TsgYPhQJ95VS8ng+aU/w/tPz663fEjvdKrn9L3OgtCi175XyO
 MVzQ==
X-Gm-Message-State: AOAM531puigXQVMz0sDqa6ENiHP7pzvRj1ZxxtVojb5r6rsXhj7PiN13
 SvHqbnTZxWuTf/e29m510Y+jc3e5VLIPwhbT
X-Google-Smtp-Source: ABdhPJw8MNf+QQsWIFA3zFW0g9kZLbyXgpzQJHjWblQbmM9X8lNS3qyrUZEOILbAr3JG6rexpjILog==
X-Received: by 2002:a05:6402:c10:b0:40f:33cd:a39 with SMTP id
 co16-20020a0564020c1000b0040f33cd0a39mr30830300edb.234.1646246862028; 
 Wed, 02 Mar 2022 10:47:42 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 t14-20020a170906608e00b006d1455acc62sm6617769ejj.74.2022.03.02.10.47.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 10:47:40 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so3434096wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 10:47:40 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr1005017wms.88.1646246859458; Wed, 02 Mar
 2022 10:47:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <CAD=FV=WX3i+6yubPVry8KUkO_14P94HTXv_uU8Pd5yPpw+iPRQ@mail.gmail.com>
 <CAPY8ntDX-XfpxQyLfZhW_jy=5nuG+znaufScHOBX9pNGGcE+bg@mail.gmail.com>
In-Reply-To: <CAPY8ntDX-XfpxQyLfZhW_jy=5nuG+znaufScHOBX9pNGGcE+bg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Mar 2022 10:47:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WsGe=THJdSjK0eMR3mfFrzqQMHNy=YzN4geMYc2a8fdg@mail.gmail.com>
Message-ID: <CAD=FV=WsGe=THJdSjK0eMR3mfFrzqQMHNy=YzN4geMYc2a8fdg@mail.gmail.com>
Subject: Re: [PATCH 0/2] DSI host and peripheral initialisation ordering
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

Hi,

On Wed, Mar 2, 2022 at 9:20 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Doug
>
> On Wed, 2 Mar 2022 at 00:13, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Feb 16, 2022 at 9:00 AM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi All
> > >
> > > Hopefully I've cc'ed all those that have bashed this problem around previously,
> > > or are otherwise linked to DRM bridges.
> > >
> > > There have been numerous discussions around how DSI support is currently broken
> > > as it doesn't support initialising the PHY to LP-11 and potentially the clock
> > > lane to HS prior to configuring the DSI peripheral. There is no op where the
> > > interface is initialised but HS video isn't also being sent.
> > > Currently you have:
> > > - peripheral pre_enable (host not initialised yet)
> > > - host pre_enable
> > > - encoder enable
> > > - host enable
> > > - peripheral enable (video already running)
> > >
> > > vc4 and exynos currently implement the DSI host as an encoder, and split the
> > > bridge_chain. This fails if you want to switch to being a bridge and/or use
> > > atomic calls as the state of all the elements split off are not added by
> > > drm_atomic_add_encoder_bridges.
> > >
> > > dw-mipi-dsi[1] and now msm[2] use the mode_set hook to initialise the PHY, so
> > > the bridge/panel pre_enable can send commands. In their post_disable they then
> > > call the downstream bridge/panel post_disable op manually so that shutdown
> > > commands can be sent before shutting down the PHY. Nothing handles that fact,
> > > so the framework then continues down the bridge chain and calls the post_disable
> > > again, so we get unbalanced panel prepare/unprepare calls being reported [3].
> > >
> > > There have been patches[4] proposing reversing the entire direction of
> > > pre_enable and post_disable, but that risks driving voltage into devices that
> > > have yet to be powered up.
> > > There have been discussions about adding either a pre_pre_enable, or adding a
> > > DSI host_op to initialise the host[5]. Both require significant reworking to all
> > > existing drivers in moving initialisation phases.
> > > We have patches that look like they may well be addressing race conditions in
> > > starting up a DSI peripheral[6].
> >
> > In general I'm happy to let the more senior people in DRM set the
> > direction here so I probably won't do lots of review, but I will point
> > out that I did have another proposal that sorta got lost in the noise
> > of the whole "reversing the entire direction". That's basically:
> >
> > https://lists.freedesktop.org/archives/dri-devel/2021-October/328934.html
> >
> > I have no idea if something like that would work for your use case,
> > but after analyzing it it felt like a surprisingly clean proposal even
> > if my first instinct when I thought about it was that it was a hack.
> > ;-) I suspect (but haven't analyzed your code) that it might be
> > equivalent to your proposal of using a flag but maybe easier to wrap
> > ones head around?
>
> If I'm reading that right, then you're proposing adding
> after_pre_enable and before_post_disable hooks.
> That's almost the same as the power_up() and power_down() ops that
> Dmitry suggested earlier, or pre_pre_enable / post_post_disable that
> had also been considered.
>
> Neither of those options handles the case of a longer chain in which
> two non-consecutive links want their upstream bridge enabled first.
> As per the clarification in patch 1/2, considering the chain
> - Panel
>  - Bridge 1
>  - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
>  - Bridge 3
>  - Bridge 4 DRM_BRIDGE_OP_UPSTREAM_FIRST
>  - Bridge 5
>  - Encoder
> With the flag option we call pre_enables as Panel, Bridge 1, Bridge 3,
> Bridge 2, Bridge 5, Bridge 4, Encoder.
> If adding after_pre_enable, then we end up with Panel, Bridge 1,
> Bridge 3, Bridge 5, Bridge 4 (after_pre_enable), Bridge 2
> (after_pre_enable), Encoder.
> (power_on / pre_pre_enable from encoder to connector would end up with
> Bridge 5 (power_on), Bridge 3 (power_on), Bridge 1 (power_on), Panel,
> Bridge 2, Bridge 4, Encoder).
> Those potentially work, but it seems a less logical order compared to
> using a flag to swap only the bridges of interest. I think power_on /
> pre_pre_enable covers DSI better than after_pre_enable.
>
> Adding the extra ops requires the source bridge (eg DSI host) to know
> the behaviour the sink bridge/panel wants. So do all DSI hosts have to
> implement power_on to power up and enter LP-11. Some DSI peripherals
> may be quite happy or even prefer to have the bus totally idle /
> powered down at pre_enable, but there would be no way of implementing
> that.

Ah, that makes it super clear, thanks! :-) If the local swap of just
two components that you're doing is more useful to you than the two
stage approach and everyone likes it then I have no objections.


> You seem to be looking at DP, which I have very little knowledge of,
> and I don't quite understand your comments about the AUX bus and how
> ordering should be configured. If your panel isn't a generic driver,
> couldn't it request that the upstream bridge is pre_enabled first?

I basically ended up solving my problem in a different way, so I have
no immediate need of swapping the order right now. I am happy you are
tackling it, though, and I can definitely see myself needing something
like this in the future. :-)

-Doug
