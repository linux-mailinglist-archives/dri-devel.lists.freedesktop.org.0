Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80817421C6B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 04:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BBB6EB1D;
	Tue,  5 Oct 2021 02:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246F66EB1D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 02:12:01 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id x124so24140609oix.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 19:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VIaEqT/nVfMB1pHC7VOlUsmGSY6hy6pziPPpqp42D2M=;
 b=YSxdwaK1+PQfuu8Awt7Ozm/Z00dxjmTP0pWrSJ4Z9a+7VBZpO9niYk/mKbIa6E6lW4
 9cJiLJiKOq8Vxbdv5cxILBuqjxq2wdOiJKYNcb8YPPlrAKYrGjbvvT4sFKygh5XEeSTy
 14GZZSxLii3u0g5VnQnyuOiIGPtlUwJk4AgDIfYDdavbW7pSXnFpe08lDqwKmM+yFCn0
 CW9GHt9HGGWmJfsQMmeaYbioPKClqT1yl876elHDa0hePgb1lTPHNOj1OzcPPTC5PCtQ
 qFJBZ/Cl6+omxf0G0NRoh9A5zjfjO+qjz24ovf5Nm3CSdPlrFc9btOfDqAUh3pFyX/M+
 /XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VIaEqT/nVfMB1pHC7VOlUsmGSY6hy6pziPPpqp42D2M=;
 b=c35AwZKGh4Fw8k5uJzlyBceWhNu5rZAdNAcjndidaEU42BeBoi4Rg/CelCpZu70Ega
 3XRsFsDsMyo0Iyt4gPe2loh2DRVGgJmb+7BHbsk6S4agbRbBlZMCQVZXmZqNNW/lR2R2
 qG6QofLqljvDaDxb+JldUfADoLAndjAUud18RbdYAITrWxtv13GopxSxO3EMQHSD7lge
 ruj6/iORQuUZ+CWxkPd3BCz1vqY7FnDm9BUCmyRuMkvo4UJtYBguFZWve6hnrUNgifrL
 J3PKexILHwq8bWgC+ijmyC0R4CpFIzX+fvchKgTjWidX1nWW4EqjhKGNHqswWq786dka
 M3OQ==
X-Gm-Message-State: AOAM531t1TVpUscePQ8F+z7DBVPiGzWiAiUncAfn8yEReIluyW9Y3Tzg
 nXd3gWds3I+HS65pK3TPnz+CxQ==
X-Google-Smtp-Source: ABdhPJxy057VcLa+dxq8bjpZFGDFAWzNr3c3pXtBMdVSjJYnJO1rE/74i+ewykcyKToocVJJTarQpg==
X-Received: by 2002:a05:6808:308e:: with SMTP id
 bl14mr420423oib.31.1633399920203; 
 Mon, 04 Oct 2021 19:12:00 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:c84c:8eff:fe1e:256f])
 by smtp.gmail.com with ESMTPSA id 18sm3259381otj.10.2021.10.04.19.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 19:11:59 -0700 (PDT)
Date: Mon, 4 Oct 2021 21:11:57 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YVu0bRtDtVW8iLfI@yoga>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAE-0n51nP7c5VziUMMoOrE2THK0xdA3A_EiJTquYc0+8KhAWAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51nP7c5VziUMMoOrE2THK0xdA3A_EiJTquYc0+8KhAWAQ@mail.gmail.com>
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

On Mon 04 Oct 20:50 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-04 18:11:11)
> > On Mon 04 Oct 17:36 PDT 2021, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > >
> > > > > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > > > > +{
> > > > > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > > > > +       int rc;
> > > > > > +
> > > > > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > > > >
> > > > > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > > > > port 1 is "Output endpoint of the controller". We should just use port
> > > > > 1 here, right?
> > > > >
> > > >
> > > > Finally got back to this, changed it to 1 and figured out why I left it
> > > > at 2.
> > > >
> > > > drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> > > > reference to the USB-C controller, scan through the registered panels
> > > > and conclude that the of_node of the USB-C controller isn't a registered
> > > > panel and return -EPROBE_DEFER.
> > >
> > > I'm confused, but maybe it would help if I could see something
> > > concrete. Is there a specific board this was happening on?
> > >
> >
> > Right, let's make this more concrete with a snippet from the actual
> > SC8180x DT.
> 
> Where is this DT? Is it in the kernel tree?
> 

Still missing a bunch of driver pieces, so I haven't yet pushed any of
this upstream.

But if you're interested you can find some work-in-progress here:
https://github.com/andersson/kernel/commits/wip/sc8180x-next-20210819

> >
> > > Under the DP node in the device tree I expect:
> > >
> > > ports {
> > >   port@1 {
> > >     reg = <1>;
> > >     edp_out: endpoint {
> > >       remote-endpoint = <&edp_panel_in>;
> > >     };
> > >   };
> > > };
> > >
> >
> > /* We got a panel */
> > panel {
> >     ...
> >     ports {
> >         port {
> >             auo_b133han05_in: endpoint {
> >                 remote-endpoint = <&mdss_edp_out>;
> >             };
> >         };
> >     };
> > };
> >
> > /* And a 2-port USB-C controller */
> > type-c-controller {
> >     ...
> >     connector@0 {
> >         ports {
> >             port@0 {
> >                 reg = <0>;
> >                 ucsi_port_0_dp: endpoint {
> >                     remote-endpoint = <&dp0_mode>;
> >                 };
> >             };
> >
> >             port@1 {
> >                 reg = <1>;
> >                 ucsi_port_0_switch: endpoint {
> >                     remote-endpoint = <&primary_qmp_phy>;
> >                 };
> >             };
> >         };
> >     };
> >
> >         connector@1 {
> >         ports {
> >             port@0 {
> >                 reg = <0>;
> >                 ucsi_port_1_dp: endpoint {
> >                     remote-endpoint = <&dp1_mode>;
> >                 };
> >             };
> >
> >             port@1 {
> >                 reg = <1>;
> >                 ucsi_port_1_switch: endpoint {
> >                     remote-endpoint = <&second_qmp_phy>;
> >                 };
> >             };
> >         };
> >         };
> > };
> >
> > /* And then our 2 DP and single eDP controllers */
> > &mdss_dp0 {
> >     ports {
> >         port@1 {
> >             reg = <1>;
> >             dp0_mode: endpoint {
> >                 remote-endpoint = <&ucsi_port_0_dp>;
> >             };
> >         };
> >     };
> > };
> >
> > &mdss_dp1 {
> >     ports {
> >         port@1 {
> >             reg = <1>;
> >             dp1_mode: endpoint {
> >                 remote-endpoint = <&ucsi_port_1_dp>;
> >             };
> >         };
> >     };
> > };
> >
> > &mdss_edp {
> >     ports {
> >         port@1 {
> >             reg = <1>;
> >             mdss_edp_out: endpoint {
> >                 remote-endpoint = <&auo_b133han05_in>;
> >             };
> >         };
> >     };
> > };
> >
> > > If you have "port@1" pointing to a USB-C controller but this instance
> > > of the DP controller is actually hooked up straight to a panel then
> > > you should simply delete the "port@1" that points to the typeC and
> > > replace it with one that points to a panel, right?
> > >
> >
> > As you can see, port 1 on &mdss_dp0 and &mdss_dp1 points to the two UCSI
> > connectors and the eDP points to the panel, exactly like we agreed.
> >
> > So now I call:
> >     drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> >
> > which for the two DP nodes will pass respective UCSI connector to
> > drm_find_panel() and get EPROBE_DEFER back - because they are not on
> > panel_list.
> 
> That's "good" right?
> 

Well, it's expected that the connectors aren't panels...

> >
> > There's nothing indicating in the of_graph that the USB connectors
> > aren't panels (or bridges), so I don't see a way to distinguish the two
> > types remotes.
> >
> 
> I'd like to create a bridge, not panel, for USB connectors, so that we
> can push sideband HPD signaling through to the DP driver. But either way
> this should work, right? If drm_of_find_panel_or_bridge() returns
> -EPROBE_DEFER, then assume the connector is DP. Otherwise if there's a
> valid pointer then treat it as eDP. We can't go too crazy though because
> once we attach a bridge we're assuming eDP which may not actually be
> true.
> 

How will I be able to distinguish this from "the eDP panel is not yet
probed"? Unless we first implement the rest of this suggestion to make
sure drm_of_find_panel_or_bridge() has something to find in both cases.

> If we make a bridge for type-C USB connectors then we'll be able to use
> the drm_bridge_connector code to automatically figure out the connector
> type (eDP vs. DP vs. whatever else is chained onto the end of the DP
> connector). That would require updating the bridge connector code to
> treat DP as a connector type though. And then the eDP path would need to
> be handled when there's no bridge really involved, like in your case
> where the eDP hardware is directly connected to the eDP panel.
> 
> In this case I think we're supposed to make a bridge in this DP driver
> itself that does pretty basic stuff and assumes the connector is eDP or
> DP based on the hardware type it is. Then if we wire a type-c connector
> up to the eDP hardware the eDP bridge we make in this driver will see a
> type-c connector that makes a bridge saying "I'm a DP connector" and the
> drm_bridge_connector code will look at the last bridge in the chain to
> see that it's actually a DP connector.

This is rather far from how I do handle USB, and its HPD interrupts
today. But perhaps I'm missing something there...

Let me get that patch on the list as well then.

Regards,
Bjorn
