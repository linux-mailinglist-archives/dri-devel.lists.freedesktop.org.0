Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADBF4D3997
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 20:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119010E3AF;
	Wed,  9 Mar 2022 19:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93D910E3AF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 19:11:06 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2dc28791ecbso34284027b3.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 11:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrNTm/IGJyh9+81izfy2s0NsEjDJq0TR5un3o7YIctA=;
 b=h8orMrMKMxHWdCBpSadF6WJO4RUuDrnqJR8aIxUYaVfwDeMp+P9dIdUCJ4OzNTrpjJ
 xgmMbmWc/e9Ww9fUCmswDEXVAU3dDiWdkDePLUI+Tbdsb+MoyxhLcwE+QO97LHwrPK8D
 B+wqYyOg0Rvv+Mr4BCTrwj0pFypB6hm1Ss8o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrNTm/IGJyh9+81izfy2s0NsEjDJq0TR5un3o7YIctA=;
 b=1KqwAe3cQKGZGwz/rIP8JJW5V6VjTfOkWkCeu/UR+KR2a2cbMCDYkUIeNlnFP9GF9X
 v637mCxmYcvqy53j5UO3jmrRTDIB3KnB9leutqLgkEvzyJvg6iWOP3hqDgpgdIIoBZx0
 8Q9e4+AJfK6ejWEjyuS+rKTv9KhSspj+/8TqHRVSJYr6+uT5H0W9Q5gO+kIBSGSp9GcE
 t7CjSuvQSeT3ghmr3bsH4wSm1CBp3niQGcWgnMIDMknP7f0evf2WoVkJLSQhBNZS3QNf
 2HmwJ8faR3+UwcndbLEyjcsCUzCpd1lWFw43PUOCljzMt7KXe22ciseXPJ/TEhN+AQu4
 m/lQ==
X-Gm-Message-State: AOAM531O4MEayRMHGyqPPlobpD64mQDdLKo1ghqXRtOcFc40Pc66gRMC
 4wBHXbIcf0Y9pJg6k/XgHqKP4Ii08Jju9bloLYj6Iw==
X-Google-Smtp-Source: ABdhPJy3r+628B3syZ2xtq1XjMNlZZuymoTqrUqNWKkKw0htj8WIzmOAtOkmDY5rOFc5IQPd454JlrAaupgqVDqo6B0=
X-Received: by 2002:a81:7c7:0:b0:2db:f50a:4b02 with SMTP id
 190-20020a8107c7000000b002dbf50a4b02mr1118053ywh.350.1646853065882; Wed, 09
 Mar 2022 11:11:05 -0800 (PST)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
 <CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=QpWj44KPw@mail.gmail.com>
In-Reply-To: <CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=QpWj44KPw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 10 Mar 2022 00:40:52 +0530
Message-ID: <CAMty3ZCnSZxMOMyd00z24a_dH0AmUE=5tEwARVB1vX2JMGkS3A@mail.gmail.com>
Subject: Re: DSI Bridge switching
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 or a Hi All,

On Thu, Oct 14, 2021 at 6:45 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Laurent,
>
> On Fri, Oct 8, 2021 at 7:07 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello,
> >
> > On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > > Hi,
> > >
> > > Removed my invalid email (I will update files next week).
> > >
> > > On 08.10.2021 13:14, Jagan Teki wrote:
> > > > Hi,
> > > >
> > > > I think this seems to be a known use case for industrial these days with i.mx8m.
> > > >
> > > > The host DSI would configure with two bridges one for DSI to LVDS
> > > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > > > can use only one bridge at a time as host DSI support single out port.
> > > > So we can have two separate device tree files for LVDS and HDMI and
> > > > load them static.
> > > >
> > > > But, one of the use cases is to support both of them in single dts, and
> > > > - Turn On LVDS (default)
> > > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> > >
> > > Are you sure it will work from hardware PoV? Do you have some demuxer?
> > > isolation of pins?
> >
> > It may be in the category of "you shouldn't do this, but it actually
> > works". I've seen the same being done with two CSI-2 camera sensors
> > connected to the same receiver, with one of them being held in reset at
> > all times.
>
> Yes. Here the design has 2 MIPI D-PHY switches. Each switch take 2
> input data lanes and 1 clock lane from SoC and produces 4 data lanes
> and 2 clock lanes and from switch output 2 lanes and 1 clock are
> inputting to HDMI bridge and other 2 lanes and 1 clock is inputting to
> LVDS. So 1st pair of 1st switch and 1st pair of 2nd switch goes to
> HDMI and 2nd pair of 1st switch and 2nd pair of 2nd switch does to
> LVDS.
>
> However, routing of these lanes are controlled by SEL, OE GPIO pins.
> So at a time we can access only single bridge.
>
> >
> > > > The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> > > >
> > > > The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> > > > port 2 in the DSI host node, and trying to attach the respective
> > > > bridge based on HDMI-INT like repeating the bridge attachment cycle
> > > > based on the HDMI-INT.
> > >
> > > I think more appropriate would be to share the same port, but provide
> > > two endpoints inside this port - we have two hardware sharing the same
> > > physical port.
> >
> > That sounds like the correct DT description to me.
> >
> > > > Can it be possible to do bridge attachment at runtime? something like
> > > > a bridge hotplug event? or any other possible solutions?
> > > >
> > > > Any suggestions?
> > >
> > > Practically it is possible, see exynos_dsi + panels, or exynos_dsi +
> > > some toshiba bridge - panel and bridge are dynamically 'plugged' and
> > > 'unplugged' from exynos_drm, but they do not use bridge chain for this
> > > and some other reasons. (un|re|)plugging should be performed of course
> > > when pipeline is off (connector disconnected). I am not sure about
> > > bridges added to bridge chain - you need to inspect all opses to ensure
> > > it can be done safely.
> > >
> > > And the main issue: Daniel does not like it :)
> >
> > Neither do I :-) Could it be handled with two DRM connectors that are
> > mutually exclusive ?
>
> How about adding lvds-connector, hdmi-connector on the pipeline and
> select them based on the switch SEL GPIO? does it make sense to do
> this implementation via display-connector.c

I have somehow managed to make runtime switching possible between LVDS
and HDMI with the help of DRM bridges.

                                                  | => ADV7535    =>
HDMI-A Connector
DSI Host => display-switch => |
                                                  |=> SN65DSI83 => Panel-Simple

display-switch here is a bridge driver that can switch or attach the
downstream bridge flow based on HDMI HPD here. One potential problem
is that when we switch from LVDS to HDMI Out the HDMI Out is displayed
with the resolution that LVDS has and it is unable to display higher
HDMI resolutions even though it supports it. Does anyone aware of
changing the resolution at runtime, please let me know?

Technically, the display-switch hardware does available in various forms
1. MIPI Switch PI3WVR626
2. Conventional Mux Switch
3. Converter bridge DSI to LVDS/HDMI (from Lontium).

Overall I believe this can be a potential possible feature and good to
support on Mainline as the hardware is intended to design for it.

Any thoughts on this please let me know?

Thanks,
Jagan.
