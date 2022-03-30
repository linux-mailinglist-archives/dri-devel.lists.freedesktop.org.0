Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B907C4EBDA7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D48010F8E7;
	Wed, 30 Mar 2022 09:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0C910F8E7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:29:06 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id pv16so40303131ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDLRFx5mxIzoPHSfeymwltkH5Nt9k76Fbb7ihji+01Y=;
 b=a4YF5Ld3iw9BkuBYAv0+RcBnvrt15qDb5kLzpNOfwpCXWqsl0GaLhBUm0a5J9V6H6y
 SMhd1kOqfFiARx/J7Z5N5dob7Km7y4vt6yNW6MF0SEqBThuVoR0yUjnTftybV8isXeau
 NEYqz1UvZRroAf2KHpmmjiQIXozm1Gh8p0QEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDLRFx5mxIzoPHSfeymwltkH5Nt9k76Fbb7ihji+01Y=;
 b=OzvTl8vb2Dytk/qf94TcxNKPrmXcwbOx1OyKyKDNMkZJkrxMsmy9V7sQlpzB9agU1N
 9k0yNr/vVDHl/SK/A+2PLwXBODX2WphtvNBwZAcPlB1yxb1uipXPuCJfPGgvd0vWu3IB
 yLe1Hs1p5pSJU1QcYtJ3RFaX+sWHYmWEJPoo+PssWURbTtxJz8VlNSc0Mgg4SqacBFtj
 f9sQ9GhieLcGriwSBElvgEdev/KYrsJb+4992Qe6fxVDcfNCysKM28qqVOxPUh7R57KN
 1xXIVvSW+wB88QA9dAB7RkKmzx9Nf+IEbUcZqECFvQXMhsQ2RfIrwxdlPZ8xBl9pjZbA
 zdxA==
X-Gm-Message-State: AOAM533QjpRMwW7EOLnq30aoYjb3LN0P3WrX/sFCyB5n/BV9snXKzBxa
 YvxcMRQ9g/SvzHnNXP3K7cAWCARPQ+r8lg6l1uRt9g==
X-Google-Smtp-Source: ABdhPJwHL8WqYty+4ts4yMdzsA001tjjYKRGDzWOOuCjnvz9DfLMcuf+QCdActdwxR4L3gr89NDdI0lKWWIWJc70wo0=
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr39263360ejc.123.1648632545277; Wed, 30
 Mar 2022 02:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
 <CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=QpWj44KPw@mail.gmail.com>
 <CAMty3ZCnSZxMOMyd00z24a_dH0AmUE=5tEwARVB1vX2JMGkS3A@mail.gmail.com>
 <CAHCN7xLgKeRACM0kvC1kGBOd0KxNFYPSLesRvfgXRU5tV-gqFQ@mail.gmail.com>
 <20220310103504.7bcvex7liwy3lsxu@houat>
 <CAMty3ZBnu-23akY_nda_nKJfj8xN0F_Wch3fu5_cNDJ2Rc6_FA@mail.gmail.com>
 <20220330085045.omtrq255gtwqeozd@houat>
In-Reply-To: <20220330085045.omtrq255gtwqeozd@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 30 Mar 2022 14:58:54 +0530
Message-ID: <CAMty3ZAPdFZNOMKoFgXbKz6-qcjn_YNg5P3hwJfNHUcK1QXsyA@mail.gmail.com>
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

On Wed, Mar 30, 2022 at 2:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Mar 29, 2022 at 07:39:21PM +0530, Jagan Teki wrote:
> > On Thu, Mar 10, 2022 at 4:05 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Wed, Mar 09, 2022 at 06:45:10PM -0600, Adam Ford wrote:
> > > > On Wed, Mar 9, 2022 at 1:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > >
> > > > >  or a Hi All,
> > > > >
> > > > > On Thu, Oct 14, 2021 at 6:45 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > > >
> > > > > > Hi Laurent,
> > > > > >
> > > > > > On Fri, Oct 8, 2021 at 7:07 PM Laurent Pinchart
> > > > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > Removed my invalid email (I will update files next week).
> > > > > > > >
> > > > > > > > On 08.10.2021 13:14, Jagan Teki wrote:
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > I think this seems to be a known use case for industrial these days with i.mx8m.
> > > > > > > > >
> > > > > > > > > The host DSI would configure with two bridges one for DSI to LVDS
> > > > > > > > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > > > > > > > > can use only one bridge at a time as host DSI support single out port.
> > > > > > > > > So we can have two separate device tree files for LVDS and HDMI and
> > > > > > > > > load them static.
> > > > > > > > >
> > > > > > > > > But, one of the use cases is to support both of them in single dts, and
> > > > > > > > > - Turn On LVDS (default)
> > > > > > > > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> > > > > > > >
> > > > > > > > Are you sure it will work from hardware PoV? Do you have some demuxer?
> > > > > > > > isolation of pins?
> > > > > > >
> > > > > > > It may be in the category of "you shouldn't do this, but it actually
> > > > > > > works". I've seen the same being done with two CSI-2 camera sensors
> > > > > > > connected to the same receiver, with one of them being held in reset at
> > > > > > > all times.
> > > > > >
> > > > > > Yes. Here the design has 2 MIPI D-PHY switches. Each switch take 2
> > > > > > input data lanes and 1 clock lane from SoC and produces 4 data lanes
> > > > > > and 2 clock lanes and from switch output 2 lanes and 1 clock are
> > > > > > inputting to HDMI bridge and other 2 lanes and 1 clock is inputting to
> > > > > > LVDS. So 1st pair of 1st switch and 1st pair of 2nd switch goes to
> > > > > > HDMI and 2nd pair of 1st switch and 2nd pair of 2nd switch does to
> > > > > > LVDS.
> > > > > >
> > > > > > However, routing of these lanes are controlled by SEL, OE GPIO pins.
> > > > > > So at a time we can access only single bridge.
> > > > > >
> > > > > > >
> > > > > > > > > The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> > > > > > > > >
> > > > > > > > > The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> > > > > > > > > port 2 in the DSI host node, and trying to attach the respective
> > > > > > > > > bridge based on HDMI-INT like repeating the bridge attachment cycle
> > > > > > > > > based on the HDMI-INT.
> > > > > > > >
> > > > > > > > I think more appropriate would be to share the same port, but provide
> > > > > > > > two endpoints inside this port - we have two hardware sharing the same
> > > > > > > > physical port.
> > > > > > >
> > > > > > > That sounds like the correct DT description to me.
> > > > > > >
> > > > > > > > > Can it be possible to do bridge attachment at runtime? something like
> > > > > > > > > a bridge hotplug event? or any other possible solutions?
> > > > > > > > >
> > > > > > > > > Any suggestions?
> > > > > > > >
> > > > > > > > Practically it is possible, see exynos_dsi + panels, or exynos_dsi +
> > > > > > > > some toshiba bridge - panel and bridge are dynamically 'plugged' and
> > > > > > > > 'unplugged' from exynos_drm, but they do not use bridge chain for this
> > > > > > > > and some other reasons. (un|re|)plugging should be performed of course
> > > > > > > > when pipeline is off (connector disconnected). I am not sure about
> > > > > > > > bridges added to bridge chain - you need to inspect all opses to ensure
> > > > > > > > it can be done safely.
> > > > > > > >
> > > > > > > > And the main issue: Daniel does not like it :)
> > > > > > >
> > > > > > > Neither do I :-) Could it be handled with two DRM connectors that are
> > > > > > > mutually exclusive ?
> > > > > >
> > > > > > How about adding lvds-connector, hdmi-connector on the pipeline and
> > > > > > select them based on the switch SEL GPIO? does it make sense to do
> > > > > > this implementation via display-connector.c
> > > > >
> > > > > I have somehow managed to make runtime switching possible between LVDS
> > > > > and HDMI with the help of DRM bridges.
> > > > >
> > > > >                                                   | => ADV7535    =>
> > > > > HDMI-A Connector
> > > > > DSI Host => display-switch => |
> > > > >                                                   |=> SN65DSI83 => Panel-Simple
> > > > >
> > > > > display-switch here is a bridge driver that can switch or attach the
> > > > > downstream bridge flow based on HDMI HPD here. One potential problem
> > > > > is that when we switch from LVDS to HDMI Out the HDMI Out is displayed
> > > > > with the resolution that LVDS has and it is unable to display higher
> > > > > HDMI resolutions even though it supports it. Does anyone aware of
> > > > > changing the resolution at runtime, please let me know?
> > > > >
> > > > > Technically, the display-switch hardware does available in various forms
> > > > > 1. MIPI Switch PI3WVR626
> > > > > 2. Conventional Mux Switch
> > > > > 3. Converter bridge DSI to LVDS/HDMI (from Lontium).
> > > > >
> > > > > Overall I believe this can be a potential possible feature and good to
> > > > > support on Mainline as the hardware is intended to design for it.
> > > > >
> > > > > Any thoughts on this please let me know?
> > > >
> > > > I wonder if it would be possible to trigger a hot plug event similar
> > > > to what is done when an HDMI cable is inserted/disconnected.
> > > >
> > > > If one switches, force a disconnect event, then triggle the connection
> > > > event to force the video system to rescan/attach. I am not sure how to
> > > > go about implementing such a thing, but that's my first thought
> > >
> > > Nothing prevents the DRM Master to just ignore the hotplug event though :)
> > > Kodi does that for example.
> >
> > Does it mean the DRM master unlocks the kodi if we switch the display?
>
> What do you mean by "the DRM master unlocks the Kodi"? Kodi is the DRM
> master in that case.

The QT apps that I'm running seem to hold the master
(drm_master_internal_acquire returns 0) so, hotplug event is not
happing. Does Kodi unlock the master like drm_master_internal_acquire
returns 1 so that hotplug event happing?

>
> > In my use-case QT is holding the DRM master so
> > drm_master_internal_acquire returns 0 in drm_fb_helper_hotplug_event
> > so it indeed not able to switch. But for non-qt and normal DRM console
> > applications I can see drm_fb_helper_hotplug_event return properly in
> > order to do the proper switching.
>
> I don't see what QT has to do with it, but like I said, nothing requires
> the DRM master to just ignore that hotplug event. So whatever you do,
> you can't rely on the master reacting to the hotplug event.

This is what I thought, but with

QT app,
I can see drm_master_internal_acquire returns 0 - so
drm_fb_helper_hotplug_event returns early, so hotplug is breaking.

non-QT (console)
I can see drm_master_internal_acquire returns 1 - so
drm_fb_helper_hotplug_event done smoothly and switched to another
display.

Do drm applications (like QT) have any control over DRM master
acquisition via some IOCTL or any other mechanism from userspace? if
yes, maybe my QT apps are doing that.

>
> > > I think we could simply create two connectors, one for LVDS, one for
> > > HDMI, with atomic_check making sure only one of them is enabled at the
> > > same time?
> >
> > How can we create two connectors at the same time? You mean try to
> > attach LVDS and HDMI bridge one after another in display-switch
> > attach. does it create two different bridge lists?
>
> Not two lists, but the bridge list would become a tree yes

Okay. Just to clarify. The connectors are going to create at the end
of the bridge list (in my case - panel-bridge for LVDS and adv7511 for
HDMI) and connectors will create during the bridge attachment. I'm
attaching the bridge during hotplug so only one connector create at a
time.

Thanks,
Jagan.
