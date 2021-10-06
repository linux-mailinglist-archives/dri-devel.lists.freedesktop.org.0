Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78F4235CC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 04:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034C06E4C1;
	Wed,  6 Oct 2021 02:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39A6E4C5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 02:27:45 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 u20-20020a9d7214000000b0054e170300adso1248538otj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 19:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ctR1cokXAwmItjiMPfDRY881NbdQTs9Vf1LWVT6hHds=;
 b=airbaT/+5STqFzWVU9qMFiytHYONXy4ji+WgSNwUSkY/mvWRsfBeoNjIyhiI46MXBE
 OckyiNIaJO8Wc49P8E6N0kf1wzXra8U6QoJQUhek42tKs6HZdeircNeEohpyZbu92Pqr
 EFomM3kCdRIz5dv1uAFhpHtqOebAB2P30zWs+w3A+XyP4oihfUO06Xan/3jLRNtYOO77
 9cuZEfKRhL8vg38kC9/iw7tZAOSY9vmcVzLq7hkuUf9fLdoN9OXr+Ey/PnkIs+J4ZgQL
 qRfzFB/ip7OOwEhkq616CO6hO208CGD+qgKWHNutGQ2Lbiv645qL1+B2vUQ9WKqxWXWh
 H6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ctR1cokXAwmItjiMPfDRY881NbdQTs9Vf1LWVT6hHds=;
 b=2j8+iBLA6PAISaDIYCLeLFThPWWmxVSZXU+4szb2Uo+UJk5IGTAPGX5z6THHGrZ31Q
 +y1jyHYT+3nbPiw0vIOPCg2oHjM2YncuU2a4NnObli9n4OL6wBBAZ5nmGw19+qI0Ri7q
 xTZe1mgCXiY4XY2vvgL+dHd6R8TzQRNR3aWUuqeKui/iLzfhWUx37oQw7f+NKRqlMqp/
 eQnDxF/MS9r8QunH2Oxqo9tGaxpV/5idgdY5bmemmre7A2qDbVRMR4GvExZu2Gde5/85
 T1h9fWunmT01eyyA5PwYljAWrhBZLJjELqHCD4PLzZ0Pv8ud6L37M4QFgyGapUfOscjH
 zl1w==
X-Gm-Message-State: AOAM532somJVqJmXZYsbsOjH4SyK7lhHFtPlevWIlLzF8h9HWDyOGiiM
 sotKuuJEXPQ8EqqKvBjF7O8QaA==
X-Google-Smtp-Source: ABdhPJwmWDFSgL5ZJyC9eJC71MTzzmXZdmMYZ58H97Zj6PuIBt/AWQl53YgikIpdKcSJfrCaV2gSbQ==
X-Received: by 2002:a05:6830:40b0:: with SMTP id
 x48mr17273031ott.246.1633487264086; 
 Tue, 05 Oct 2021 19:27:44 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id g9sm467239otj.78.2021.10.05.19.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 19:27:43 -0700 (PDT)
Date: Tue, 5 Oct 2021 19:29:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YV0KBWxVtKgOp2Cj@ripper>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
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

On Tue 05 Oct 16:09 PDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Tue, Oct 5, 2021 at 10:33 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 05 Oct 08:39 PDT 2021, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Mon, Oct 4, 2021 at 6:09 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Mon 04 Oct 17:36 PDT 2021, Doug Anderson wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > >
> > > > > > On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
> > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > > > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > > > >
> > > > > > > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > > > > > > +{
> > > > > > > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > > > > > > +       int rc;
> > > > > > > > +
> > > > > > > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > > > > > >
> > > > > > > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > > > > > > port 1 is "Output endpoint of the controller". We should just use port
> > > > > > > 1 here, right?
> > > > > > >
> > > > > >
> > > > > > Finally got back to this, changed it to 1 and figured out why I left it
> > > > > > at 2.
> > > > > >
> > > > > > drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> > > > > > reference to the USB-C controller, scan through the registered panels
> > > > > > and conclude that the of_node of the USB-C controller isn't a registered
> > > > > > panel and return -EPROBE_DEFER.
> > > > >
> > > > > I'm confused, but maybe it would help if I could see something
> > > > > concrete. Is there a specific board this was happening on?
> > > > >
> > > >
> > > > Right, let's make this more concrete with a snippet from the actual
> > > > SC8180x DT.
> > > >
> > > > > Under the DP node in the device tree I expect:
> > > > >
> > > > > ports {
> > > > >   port@1 {
> > > > >     reg = <1>;
> > > > >     edp_out: endpoint {
> > > > >       remote-endpoint = <&edp_panel_in>;
> > > > >     };
> > > > >   };
> > > > > };
> > > > >
> > > >
> > > > /* We got a panel */
> > > > panel {
> > > >     ...
> > > >     ports {
> > > >         port {
> > > >             auo_b133han05_in: endpoint {
> > > >                 remote-endpoint = <&mdss_edp_out>;
> > > >             };
> > > >         };
> > > >     };
> > > > };
> > > >
> > > > /* And a 2-port USB-C controller */
> > > > type-c-controller {
> > > >     ...
> > > >     connector@0 {
> > > >         ports {
> > > >             port@0 {
> > > >                 reg = <0>;
> > > >                 ucsi_port_0_dp: endpoint {
> > > >                     remote-endpoint = <&dp0_mode>;
> > > >                 };
> > > >             };
> > > >
> > > >             port@1 {
> > > >                 reg = <1>;
> > > >                 ucsi_port_0_switch: endpoint {
> > > >                     remote-endpoint = <&primary_qmp_phy>;
> > > >                 };
> > > >             };
> > > >         };
> > > >     };
> > > >
> > > >         connector@1 {
> > > >         ports {
> > > >             port@0 {
> > > >                 reg = <0>;
> > > >                 ucsi_port_1_dp: endpoint {
> > > >                     remote-endpoint = <&dp1_mode>;
> > > >                 };
> > > >             };
> > > >
> > > >             port@1 {
> > > >                 reg = <1>;
> > > >                 ucsi_port_1_switch: endpoint {
> > > >                     remote-endpoint = <&second_qmp_phy>;
> > > >                 };
> > > >             };
> > > >         };
> > > >         };
> > > > };
> > > >
> > > > /* And then our 2 DP and single eDP controllers */
> > > > &mdss_dp0 {
> > > >     ports {
> > > >         port@1 {
> > > >             reg = <1>;
> > > >             dp0_mode: endpoint {
> > > >                 remote-endpoint = <&ucsi_port_0_dp>;
> > > >             };
> > > >         };
> > > >     };
> > > > };
> > > >
> > > > &mdss_dp1 {
> > > >     ports {
> > > >         port@1 {
> > > >             reg = <1>;
> > > >             dp1_mode: endpoint {
> > > >                 remote-endpoint = <&ucsi_port_1_dp>;
> > > >             };
> > > >         };
> > > >     };
> > > > };
> > > >
> > > > &mdss_edp {
> > > >     ports {
> > > >         port@1 {
> > > >             reg = <1>;
> > > >             mdss_edp_out: endpoint {
> > > >                 remote-endpoint = <&auo_b133han05_in>;
> > > >             };
> > > >         };
> > > >     };
> > > > };
> > > >
> > > > > If you have "port@1" pointing to a USB-C controller but this instance
> > > > > of the DP controller is actually hooked up straight to a panel then
> > > > > you should simply delete the "port@1" that points to the typeC and
> > > > > replace it with one that points to a panel, right?
> > > > >
> > > >
> > > > As you can see, port 1 on &mdss_dp0 and &mdss_dp1 points to the two UCSI
> > > > connectors and the eDP points to the panel, exactly like we agreed.
> > > >
> > > > So now I call:
> > > >     drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> > > >
> > > > which for the two DP nodes will pass respective UCSI connector to
> > > > drm_find_panel() and get EPROBE_DEFER back - because they are not on
> > > > panel_list.
> > > >
> > > > There's nothing indicating in the of_graph that the USB connectors
> > > > aren't panels (or bridges), so I don't see a way to distinguish the two
> > > > types remotes.
> 
> To summarize where I think our out-of-band discussion went, I think
> you're OK w/ keeping this at "port@1" for both the DP and eDP case and
> we'll figure out _some_ way to make it work.
> 
> 
> > > As far as I can tell the way this would be solved would be to actually
> > > pass &bridge in and then make sure that a bridge would be in place for
> > > the DP connector. In the full DP case you'll get an -EPROBE_DEFER if
> > > the connector hasn't been probed but once it's probed then it should
> > > register as a bridge and thus give you the info you need (AKA that
> > > this isn't a panel).
> > >
> > > I haven't done the digging to see how all this works, but according to
> > > Laurent [1]: "Physical connectors are already handled as bridges, see
> > > drivers/gpu/drm/bridge/display-connector.c"
> > >
> >
> > All this seems to make sense for both eDP and "native" DP.
> >
> > > So basically I think this is solvable in code and there's no reason to
> > > mess with the devicetree bindings to solve this problem. Does that
> > > sound right?
> > >
> >
> > But I don't have a DisplayPort connector.
> >
> > I have a USB-C connector, that upon determining that it's time to play
> > DisplayPort will use the typec_mux abstraction to tell someone on the
> > other side of the of_graph about DisplayPort events (HPD).
> >
> > So where would I put this drm_bridge in the USB-C case?
> >
> > I don't see that it fits in the Type-C side of things and putting it on
> > the DP side would leave us with exactly the problem we have here. So we
> > would have to put a fake "DP connector" inbetween the DP node and the
> > Type-C controller?
> >
> >
> > For reference, this is how I thought one is supposed to tie the Type-C
> > controller to the display driver:
> > https://lore.kernel.org/all/20211005022451.2037405-1-bjorn.andersson@linaro.org/
> 
> OK, so I looked at that a bit. Fair warning that I've never looked at
> the type C code before today so anything I say could be totally wrong!
> :-)
> 
> ...but I _think_ you're abusing the "mux" API for this. I think a type
> C port can have exactly 1 mux, right? Right now you are claiming to be
> _the_ mux in the DP driver, but what about for other alt modes? If
> those wanted to be notified about similar things it would be
> impossible because you're already _the_ mux, right?
> 

I actually don't think so, because I acquire the typec_mux handle by the
means of:

mux_desc.svid = USB_TYPEC_DP_SID;
mux_desc.mode = USB_TYPEC_DP_MODE;
alt_port->mux = fwnode_typec_mux_get(fwnode, &mux_desc);

And in the DisplayPort node I provide svid = /bits/ 16 <0xff01>;

So I will be able to reference multiple different altmode
implementors using this scheme.

> I _think_ a mux is supposed to be something more like
> `drivers/phy/rockchip/phy-rockchip-typec.c` (though that code predates
> the type C framework we're looking at here). There the phy can do all
> the work of remuxing things / flipping orientation / etc. I don't
> think it's a requirement that every SoC be able to do this remuxing
> itself but (if memory serves) rk3399 implemented it so we didn't have
> to do it on the TCPC and could use a cheaper solution there.
> 

I'm afraid I don't see how this interacts with a display controller. It
seems more like it's the phy side of things, what we have split between
the Type-C controller and the QMP phy to set the pins in the right
state.

> In any case, my point is that I think there is supposed to be a
> _single_ mux per port that handles reassigning pins and that's what
> this API is for.
> 

If that's the case things such as typec_mux_match() is just completely
backwards.

> ...so I will still assert that the right thing to do is to have a
> drm_bridge for the type c connector and _that's_ what should be
> sending HPD.
> 

That still implies that all the current typec_mux code got it all wrong
and should be thrown out. If you instead consider that you have a Type-C
controller that upon switching DisplayPort on/off calls typec_mux_set()
to inform the functions that things has changed then all the current
code makes sense.

It also maps nicely to how the TypeC controller would call
typec_switch_set() to inform, in our case the QMP phy that the
orientation has switched.


It seems reasonable to have some common helper code that registers the
typec_mux and turn its notifications into HPD notifications to the
display code, but I still think that should live in the DRM framework,
separate from the USB code.

Regards,
Bjorn

> 
> > I'm afraid I must be missing something in Laurent and yours proposal
> > (although I think Laurent is talking about the native DP case?).
> >
> > Regards,
> > Bjorn
> >
> > > [1] https://lore.kernel.org/r/YUvMv+Y8tFcWPEHd@pendragon.ideasonboard.com/
