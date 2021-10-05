Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53AA421C32
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 03:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912BA6F4CD;
	Tue,  5 Oct 2021 01:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238226F4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 01:50:26 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n64so24175153oih.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 18:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=gln0TUvtfntk/v2j5OU8Axp9+f/QLM3/5Mczb5vtBog=;
 b=ldgwGedcNpZwDatAHIrtl7FhHi1DIRJT0OxO+fUmtrDBubzir6t05tNfO0imhZfWCz
 fcGzuK/Mx47IRLuftgDv40yOz26MSR0RYOb7nYnEGnBuhIMrqcqOhVeshQhG1THDfOjB
 R3AE/7JMcmBkUQQifHgbjc8XVPZkZIB/GvLd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=gln0TUvtfntk/v2j5OU8Axp9+f/QLM3/5Mczb5vtBog=;
 b=6tE039oHGYx9G/pX2U2EByetMbqU/KBqhoQ7qwO5TBETzXb6pEsx3tlYh4x71tKPlD
 9mKlRPOEHYu3a0D8DfNXqHns1kNUMLq+UuoFWYRxZ2luzDE+U2z465xcgBwQ+ahgd/BF
 vhj0WLC0nK+DmxP02/d2cIC6uMpDlOeyegtsxoH390LDFnBLg/0YUzr5SxRnJsapYoyk
 YUDKzdcxKZ5WCZZWC8PH/aGEH5mZdox85aoxcalrMz0bbII72IsQk0LrAYWQMfND+Var
 bxlAPGVjEs9MwqUcunOdvICWjAuQl9xRTJl6iM1bGtwPjlxuULqKp6ca5l5IsS6bxxme
 ALAw==
X-Gm-Message-State: AOAM5338ZAFhhKzIDDw6yGpgOvl42R7nLGywXwsMG9zoPtMDdCaPtR68
 qUAernnDy7Z/Z+jAb47BbARvoLjyp60L5mZv2WWZjg==
X-Google-Smtp-Source: ABdhPJzVOWtCy6VAUOHLaodkX2H+dAER8V+kmRjYYGmS0C2GIJPhCRlhZYHx7Qs5ynPokiEmbU36h3ag0x+hG8iIuFQ=
X-Received: by 2002:a05:6808:f8f:: with SMTP id
 o15mr355536oiw.164.1633398625292; 
 Mon, 04 Oct 2021 18:50:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 21:50:24 -0400
MIME-Version: 1.0
In-Reply-To: <YVumL1lHLqtb/HKS@ripper>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 4 Oct 2021 21:50:24 -0400
Message-ID: <CAE-0n51nP7c5VziUMMoOrE2THK0xdA3A_EiJTquYc0+8KhAWAQ@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Doug Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
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

Quoting Bjorn Andersson (2021-10-04 18:11:11)
> On Mon 04 Oct 17:36 PDT 2021, Doug Anderson wrote:
>
> > Hi,
> >
> > On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
> > >
> > > > Hi,
> > > >
> > > > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > > > +{
> > > > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > > > +       int rc;
> > > > > +
> > > > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > > >
> > > > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > > > port 1 is "Output endpoint of the controller". We should just use port
> > > > 1 here, right?
> > > >
> > >
> > > Finally got back to this, changed it to 1 and figured out why I left it
> > > at 2.
> > >
> > > drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> > > reference to the USB-C controller, scan through the registered panels
> > > and conclude that the of_node of the USB-C controller isn't a registered
> > > panel and return -EPROBE_DEFER.
> >
> > I'm confused, but maybe it would help if I could see something
> > concrete. Is there a specific board this was happening on?
> >
>
> Right, let's make this more concrete with a snippet from the actual
> SC8180x DT.

Where is this DT? Is it in the kernel tree?

>
> > Under the DP node in the device tree I expect:
> >
> > ports {
> >   port@1 {
> >     reg = <1>;
> >     edp_out: endpoint {
> >       remote-endpoint = <&edp_panel_in>;
> >     };
> >   };
> > };
> >
>
> /* We got a panel */
> panel {
>     ...
>     ports {
>         port {
>             auo_b133han05_in: endpoint {
>                 remote-endpoint = <&mdss_edp_out>;
>             };
>         };
>     };
> };
>
> /* And a 2-port USB-C controller */
> type-c-controller {
>     ...
>     connector@0 {
>         ports {
>             port@0 {
>                 reg = <0>;
>                 ucsi_port_0_dp: endpoint {
>                     remote-endpoint = <&dp0_mode>;
>                 };
>             };
>
>             port@1 {
>                 reg = <1>;
>                 ucsi_port_0_switch: endpoint {
>                     remote-endpoint = <&primary_qmp_phy>;
>                 };
>             };
>         };
>     };
>
>         connector@1 {
>         ports {
>             port@0 {
>                 reg = <0>;
>                 ucsi_port_1_dp: endpoint {
>                     remote-endpoint = <&dp1_mode>;
>                 };
>             };
>
>             port@1 {
>                 reg = <1>;
>                 ucsi_port_1_switch: endpoint {
>                     remote-endpoint = <&second_qmp_phy>;
>                 };
>             };
>         };
>         };
> };
>
> /* And then our 2 DP and single eDP controllers */
> &mdss_dp0 {
>     ports {
>         port@1 {
>             reg = <1>;
>             dp0_mode: endpoint {
>                 remote-endpoint = <&ucsi_port_0_dp>;
>             };
>         };
>     };
> };
>
> &mdss_dp1 {
>     ports {
>         port@1 {
>             reg = <1>;
>             dp1_mode: endpoint {
>                 remote-endpoint = <&ucsi_port_1_dp>;
>             };
>         };
>     };
> };
>
> &mdss_edp {
>     ports {
>         port@1 {
>             reg = <1>;
>             mdss_edp_out: endpoint {
>                 remote-endpoint = <&auo_b133han05_in>;
>             };
>         };
>     };
> };
>
> > If you have "port@1" pointing to a USB-C controller but this instance
> > of the DP controller is actually hooked up straight to a panel then
> > you should simply delete the "port@1" that points to the typeC and
> > replace it with one that points to a panel, right?
> >
>
> As you can see, port 1 on &mdss_dp0 and &mdss_dp1 points to the two UCSI
> connectors and the eDP points to the panel, exactly like we agreed.
>
> So now I call:
>     drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>
> which for the two DP nodes will pass respective UCSI connector to
> drm_find_panel() and get EPROBE_DEFER back - because they are not on
> panel_list.

That's "good" right?

>
> There's nothing indicating in the of_graph that the USB connectors
> aren't panels (or bridges), so I don't see a way to distinguish the two
> types remotes.
>

I'd like to create a bridge, not panel, for USB connectors, so that we
can push sideband HPD signaling through to the DP driver. But either way
this should work, right? If drm_of_find_panel_or_bridge() returns
-EPROBE_DEFER, then assume the connector is DP. Otherwise if there's a
valid pointer then treat it as eDP. We can't go too crazy though because
once we attach a bridge we're assuming eDP which may not actually be
true.

If we make a bridge for type-C USB connectors then we'll be able to use
the drm_bridge_connector code to automatically figure out the connector
type (eDP vs. DP vs. whatever else is chained onto the end of the DP
connector). That would require updating the bridge connector code to
treat DP as a connector type though. And then the eDP path would need to
be handled when there's no bridge really involved, like in your case
where the eDP hardware is directly connected to the eDP panel.

In this case I think we're supposed to make a bridge in this DP driver
itself that does pretty basic stuff and assumes the connector is eDP or
DP based on the hardware type it is. Then if we wire a type-c connector
up to the eDP hardware the eDP bridge we make in this driver will see a
type-c connector that makes a bridge saying "I'm a DP connector" and the
drm_bridge_connector code will look at the last bridge in the chain to
see that it's actually a DP connector.
