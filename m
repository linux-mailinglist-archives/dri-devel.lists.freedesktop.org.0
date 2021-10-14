Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2542DA1C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F3E6E170;
	Thu, 14 Oct 2021 13:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051096E170
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:16:05 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g10so24317266edj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TsvcIBNVKTgjmPZB5Gf6j5UfC5pBkdmi0U+t87Lf5YM=;
 b=PG3oGNqdwHG44ug1fLat7ZoW1nHHzAZl65IRj9UhFMZklOOopdjpd+t5rgFNBTIOHW
 CqxAmlmpldtJC8oN7GLzZeMO4ALihGfHmSu8158nRdiU95XBaDGzw0aGEfGbzCbx/ozq
 rvqUqgtcrcb0m3nAVDuKjpF1nhAwJyEX5jDsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TsvcIBNVKTgjmPZB5Gf6j5UfC5pBkdmi0U+t87Lf5YM=;
 b=tRQ4BP2uP3HlEuN/XvOUmDvGu1NGR+DFHLlXZi6xu8iPKM1YH1bJQ8K3YxCvEtfahu
 YSS/jXZYSb/yoWJ96bFLctBTz1BhF5owa7CTX6yphi2504hAGERuGW4zLjgzmEUntc3V
 U2nPXGZnMO6EDgEykqtlU6Q63nsv6eMSavyA0RjJF9WM1teXaQlgADmYZ08wSeWZxqxy
 zvGn4kxncdNXzJ2TtVZh7lZQ1uPHlx+mXor/Vk4C7rctKBU693Rh8GkDTncEhY2kwP7a
 CiLodAB/5pZgr5aQ/Xdwhg1SvpZJ3q7zcOAasPhAXLual7JzYKSFomcC0ms8SYbrpo33
 RRIA==
X-Gm-Message-State: AOAM531Dxmn4G6jbnVG9PZB+X8V7TX6lUNDDgiDkyidC6n0ZjlHbdGUW
 sxSvuz7A33nAWC1Cr2TRFHrpNZUYs91NyMrEn1MmCA==
X-Google-Smtp-Source: ABdhPJw0ksYAX9uZ2RzpKe3zb9bUehD5MwSvppC5pf+cWRTCgC4eWFFfdFXbKc6FJGfV0Uruy/7Hug864ulDvQC/+HM=
X-Received: by 2002:a17:906:1815:: with SMTP id
 v21mr3899500eje.218.1634217361716; 
 Thu, 14 Oct 2021 06:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
In-Reply-To: <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 14 Oct 2021 18:45:50 +0530
Message-ID: <CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=QpWj44KPw@mail.gmail.com>
Subject: Re: DSI Bridge switching
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, 
 Maxime Ripard <maxime@cerno.tech>, dri-devel <dri-devel@lists.freedesktop.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>
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

Hi Laurent,

On Fri, Oct 8, 2021 at 7:07 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > Hi,
> >
> > Removed my invalid email (I will update files next week).
> >
> > On 08.10.2021 13:14, Jagan Teki wrote:
> > > Hi,
> > >
> > > I think this seems to be a known use case for industrial these days with i.mx8m.
> > >
> > > The host DSI would configure with two bridges one for DSI to LVDS
> > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > > can use only one bridge at a time as host DSI support single out port.
> > > So we can have two separate device tree files for LVDS and HDMI and
> > > load them static.
> > >
> > > But, one of the use cases is to support both of them in single dts, and
> > > - Turn On LVDS (default)
> > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> >
> > Are you sure it will work from hardware PoV? Do you have some demuxer?
> > isolation of pins?
>
> It may be in the category of "you shouldn't do this, but it actually
> works". I've seen the same being done with two CSI-2 camera sensors
> connected to the same receiver, with one of them being held in reset at
> all times.

Yes. Here the design has 2 MIPI D-PHY switches. Each switch take 2
input data lanes and 1 clock lane from SoC and produces 4 data lanes
and 2 clock lanes and from switch output 2 lanes and 1 clock are
inputting to HDMI bridge and other 2 lanes and 1 clock is inputting to
LVDS. So 1st pair of 1st switch and 1st pair of 2nd switch goes to
HDMI and 2nd pair of 1st switch and 2nd pair of 2nd switch does to
LVDS.

However, routing of these lanes are controlled by SEL, OE GPIO pins.
So at a time we can access only single bridge.

>
> > > The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> > >
> > > The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> > > port 2 in the DSI host node, and trying to attach the respective
> > > bridge based on HDMI-INT like repeating the bridge attachment cycle
> > > based on the HDMI-INT.
> >
> > I think more appropriate would be to share the same port, but provide
> > two endpoints inside this port - we have two hardware sharing the same
> > physical port.
>
> That sounds like the correct DT description to me.
>
> > > Can it be possible to do bridge attachment at runtime? something like
> > > a bridge hotplug event? or any other possible solutions?
> > >
> > > Any suggestions?
> >
> > Practically it is possible, see exynos_dsi + panels, or exynos_dsi +
> > some toshiba bridge - panel and bridge are dynamically 'plugged' and
> > 'unplugged' from exynos_drm, but they do not use bridge chain for this
> > and some other reasons. (un|re|)plugging should be performed of course
> > when pipeline is off (connector disconnected). I am not sure about
> > bridges added to bridge chain - you need to inspect all opses to ensure
> > it can be done safely.
> >
> > And the main issue: Daniel does not like it :)
>
> Neither do I :-) Could it be handled with two DRM connectors that are
> mutually exclusive ?

How about adding lvds-connector, hdmi-connector on the pipeline and
select them based on the switch SEL GPIO? does it make sense to do
this implementation via display-connector.c

Thanks,
Jagan.
