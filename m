Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341DA4EAF14
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1811810E915;
	Tue, 29 Mar 2022 14:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4332C10E915
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 14:09:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a8so35276774ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oVMkVSSEdf+StgkeXxg5NfB8DZGL8o+lpZsS8PyBmpk=;
 b=TKcASfDRKmi2FOBuvdgM8euSlZMmBtgOzvtTH1hlEE538nN5TgVQzvEdIvcmmUOPP1
 +TGPYPnl7grO3YByVuYzZhho5lXgFN90W3FGNw14qRdVk5YKV3LQltI9BtgQsfAVncSl
 d/zyCxVgplE8b8mZJOKaT12fD2bsDLwRl9EdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oVMkVSSEdf+StgkeXxg5NfB8DZGL8o+lpZsS8PyBmpk=;
 b=rK1ouviyhMvXjyvptticfhZS2J/s6eulc16suB8/ui/lgPqHM2EuXNOqp4mrM04fpz
 6MaHrNlhwTyKVoygu7m3ljkJIrc2Yqpy9k1gb+Y0sbksmbi7CxWBjkDam4/WlquUXWa/
 XtOiREsJu07teSvXKthKohLlf3T1oKotI+A06IUxEtmcswk132d04oNXy4t0gIjA0FAR
 4oYFiig6z8vr1mccochbzJx151SivqF2XO1TmcgYuGit1tKFTLHpXl0rQbSCkoP9SPK5
 Rrvaj4nvTYlSXdWLEjLj3tqnsFDTHlvTOmBDHN99sY8czfuorI2ZiYChpMMjwTbhfNL3
 d/hA==
X-Gm-Message-State: AOAM533JayvR8S7JrFraCac3uNZi344tzc4rjq45vlDfjChu+7ZbcHDg
 l0isA69zVBwGw6KkY3RoD3LFPi5uhqGgK0G5BysHTw==
X-Google-Smtp-Source: ABdhPJzKN6taM2QCZDHYwO1nGOHCgdvdHDz0JZIMjx1pAm9jIduT6cbB35hblupFoZvb/xFfvhoOt2QCdEHul3OXH4Q=
X-Received: by 2002:a17:907:1ca8:b0:6df:f192:cf4a with SMTP id
 nb40-20020a1709071ca800b006dff192cf4amr35449065ejc.620.1648562972678; Tue, 29
 Mar 2022 07:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
 <CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=QpWj44KPw@mail.gmail.com>
 <CAMty3ZCnSZxMOMyd00z24a_dH0AmUE=5tEwARVB1vX2JMGkS3A@mail.gmail.com>
 <CAHCN7xLgKeRACM0kvC1kGBOd0KxNFYPSLesRvfgXRU5tV-gqFQ@mail.gmail.com>
 <20220310103504.7bcvex7liwy3lsxu@houat>
In-Reply-To: <20220310103504.7bcvex7liwy3lsxu@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 29 Mar 2022 19:39:21 +0530
Message-ID: <CAMty3ZBnu-23akY_nda_nKJfj8xN0F_Wch3fu5_cNDJ2Rc6_FA@mail.gmail.com>
Subject: Re: DSI Bridge switching
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 4:05 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Wed, Mar 09, 2022 at 06:45:10PM -0600, Adam Ford wrote:
> > On Wed, Mar 9, 2022 at 1:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > >  or a Hi All,
> > >
> > > On Thu, Oct 14, 2021 at 6:45 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > Hi Laurent,
> > > >
> > > > On Fri, Oct 8, 2021 at 7:07 PM Laurent Pinchart
> > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > > > > > Hi,
> > > > > >
> > > > > > Removed my invalid email (I will update files next week).
> > > > > >
> > > > > > On 08.10.2021 13:14, Jagan Teki wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > I think this seems to be a known use case for industrial these days with i.mx8m.
> > > > > > >
> > > > > > > The host DSI would configure with two bridges one for DSI to LVDS
> > > > > > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > > > > > > can use only one bridge at a time as host DSI support single out port.
> > > > > > > So we can have two separate device tree files for LVDS and HDMI and
> > > > > > > load them static.
> > > > > > >
> > > > > > > But, one of the use cases is to support both of them in single dts, and
> > > > > > > - Turn On LVDS (default)
> > > > > > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> > > > > >
> > > > > > Are you sure it will work from hardware PoV? Do you have some demuxer?
> > > > > > isolation of pins?
> > > > >
> > > > > It may be in the category of "you shouldn't do this, but it actually
> > > > > works". I've seen the same being done with two CSI-2 camera sensors
> > > > > connected to the same receiver, with one of them being held in reset at
> > > > > all times.
> > > >
> > > > Yes. Here the design has 2 MIPI D-PHY switches. Each switch take 2
> > > > input data lanes and 1 clock lane from SoC and produces 4 data lanes
> > > > and 2 clock lanes and from switch output 2 lanes and 1 clock are
> > > > inputting to HDMI bridge and other 2 lanes and 1 clock is inputting to
> > > > LVDS. So 1st pair of 1st switch and 1st pair of 2nd switch goes to
> > > > HDMI and 2nd pair of 1st switch and 2nd pair of 2nd switch does to
> > > > LVDS.
> > > >
> > > > However, routing of these lanes are controlled by SEL, OE GPIO pins.
> > > > So at a time we can access only single bridge.
> > > >
> > > > >
> > > > > > > The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> > > > > > >
> > > > > > > The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> > > > > > > port 2 in the DSI host node, and trying to attach the respective
> > > > > > > bridge based on HDMI-INT like repeating the bridge attachment cycle
> > > > > > > based on the HDMI-INT.
> > > > > >
> > > > > > I think more appropriate would be to share the same port, but provide
> > > > > > two endpoints inside this port - we have two hardware sharing the same
> > > > > > physical port.
> > > > >
> > > > > That sounds like the correct DT description to me.
> > > > >
> > > > > > > Can it be possible to do bridge attachment at runtime? something like
> > > > > > > a bridge hotplug event? or any other possible solutions?
> > > > > > >
> > > > > > > Any suggestions?
> > > > > >
> > > > > > Practically it is possible, see exynos_dsi + panels, or exynos_dsi +
> > > > > > some toshiba bridge - panel and bridge are dynamically 'plugged' and
> > > > > > 'unplugged' from exynos_drm, but they do not use bridge chain for this
> > > > > > and some other reasons. (un|re|)plugging should be performed of course
> > > > > > when pipeline is off (connector disconnected). I am not sure about
> > > > > > bridges added to bridge chain - you need to inspect all opses to ensure
> > > > > > it can be done safely.
> > > > > >
> > > > > > And the main issue: Daniel does not like it :)
> > > > >
> > > > > Neither do I :-) Could it be handled with two DRM connectors that are
> > > > > mutually exclusive ?
> > > >
> > > > How about adding lvds-connector, hdmi-connector on the pipeline and
> > > > select them based on the switch SEL GPIO? does it make sense to do
> > > > this implementation via display-connector.c
> > >
> > > I have somehow managed to make runtime switching possible between LVDS
> > > and HDMI with the help of DRM bridges.
> > >
> > >                                                   | => ADV7535    =>
> > > HDMI-A Connector
> > > DSI Host => display-switch => |
> > >                                                   |=> SN65DSI83 => Panel-Simple
> > >
> > > display-switch here is a bridge driver that can switch or attach the
> > > downstream bridge flow based on HDMI HPD here. One potential problem
> > > is that when we switch from LVDS to HDMI Out the HDMI Out is displayed
> > > with the resolution that LVDS has and it is unable to display higher
> > > HDMI resolutions even though it supports it. Does anyone aware of
> > > changing the resolution at runtime, please let me know?
> > >
> > > Technically, the display-switch hardware does available in various forms
> > > 1. MIPI Switch PI3WVR626
> > > 2. Conventional Mux Switch
> > > 3. Converter bridge DSI to LVDS/HDMI (from Lontium).
> > >
> > > Overall I believe this can be a potential possible feature and good to
> > > support on Mainline as the hardware is intended to design for it.
> > >
> > > Any thoughts on this please let me know?
> >
> > I wonder if it would be possible to trigger a hot plug event similar
> > to what is done when an HDMI cable is inserted/disconnected.
> >
> > If one switches, force a disconnect event, then triggle the connection
> > event to force the video system to rescan/attach. I am not sure how to
> > go about implementing such a thing, but that's my first thought
>
> Nothing prevents the DRM Master to just ignore the hotplug event though :)
> Kodi does that for example.

Does it mean the DRM master unlocks the kodi if we switch the display?
 In my use-case QT is holding the DRM master so
drm_master_internal_acquire returns 0 in drm_fb_helper_hotplug_event
so it indeed not able to switch. But for non-qt and normal DRM console
applications I can see drm_fb_helper_hotplug_event return properly in
order to do the proper switching.

>
> I think we could simply create two connectors, one for LVDS, one for
> HDMI, with atomic_check making sure only one of them is enabled at the
> same time?

How can we create two connectors at the same time? You mean try to
attach LVDS and HDMI bridge one after another in display-switch
attach. does it create two different bridge lists?

                                                               sndsi83
=> panel-simple
mxsfb => nwl-dsi =>  display-switch =>
                                                               adv7511
=> display-connector

Thanks,
Jagan.
