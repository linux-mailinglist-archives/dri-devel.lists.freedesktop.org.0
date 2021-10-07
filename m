Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A269425773
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 18:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604846F898;
	Thu,  7 Oct 2021 16:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1039A6F891
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 16:13:34 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id a3so9672489oid.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hb67njsJqIq3sq/4tT7STYAM27g6n4IB/C49A/fpg9Y=;
 b=tli/T9LJgWtff/X2L6LOoEspmpU2GqB2ZNhpXVL9fz2aSVuh6JxJsDU6PQp+ypfvt0
 tNulk9mRuEAg6TUgjedNJXePu/Eu8VDvD4atEkIzmzuCZYzaG7CArUY3D4V749BKolFx
 91p17GEGDOBDqJF1CXiha0US82d41kU4x6lQR+isM4xvsgggrDqaWmgMHbhDACIvsl8X
 Ep1xfBbVNX0eWTihYXf77naimyiW+svqtFzhxAojsY5JNyqFdxivbpR+M4zuzUEiS1te
 S4vBhq7Zo9AorUqbNrUFoZPFkKHd+QegTJOr7Ql94WYY+uh4s3Q+nXpz07RMH6vBP2gL
 BLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hb67njsJqIq3sq/4tT7STYAM27g6n4IB/C49A/fpg9Y=;
 b=klTyijOvl+3R8SDhZc+xj9vbRIbuUJGoA9BoQp4YaRJFs1yqwldpnPhmdkgllnGDGR
 7z3ovteLDu76vMZK9bep8AWb5ZDGyXMGXL+HqQEKS3N/mKPuDJLalWlPGMKWDCN3Rtsp
 Lv4ZP7rq+TiITjWsgp2vk0/yNW5cVPN4vwXPaoTCEqtGwtBEB6D1TVQAe84+etbQWJQJ
 PXI3kSOGoahfwoyQcujktLkLzKiVA0GIDBHkklkQDDPj/DaTfFanLaz71GJVOz44lKr+
 9SP++OIdDysGlJ2yulBdicUXdGeD1X0a4Vs6VIVKq1Acy7XxS6wzwco4cRDi06QCBsu7
 yNCw==
X-Gm-Message-State: AOAM530agSgUXwtjDxj/2RKWatP8lKO7BMaXXhcbMyzfzQ+2Jnr6PE8H
 X8DlpI9GCJxJxCBH4zVI2UPC/Q==
X-Google-Smtp-Source: ABdhPJw7uTUTANA3ePTr3Q+K3DC12nBFseX4KCyWMCqHpXAeqo4nQd/MrXsXMDv32+GT1hLmFpQAKg==
X-Received: by 2002:aca:4303:: with SMTP id q3mr5723697oia.9.1633623213049;
 Thu, 07 Oct 2021 09:13:33 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id l25sm8175oic.54.2021.10.07.09.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:13:32 -0700 (PDT)
Date: Thu, 7 Oct 2021 09:15:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Prashant Malani <pmalani@chromium.org>,
 Doug Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YV8dEKMhNKKl20j6@ripper>
References: <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV7JNH9QvI4cBz5s@kuha.fi.intel.com>
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

On Thu 07 Oct 03:17 PDT 2021, Heikki Krogerus wrote:

> Hi guys,
> 
> On Wed, Oct 06, 2021 at 01:26:35PM -0700, Prashant Malani wrote:
> > (CC+ Heikki)
> > 
> > Hi,
> > 
> > On Wed, Oct 6, 2021 at 8:19 AM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Oct 5, 2021 at 7:27 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > > > For reference, this is how I thought one is supposed to tie the Type-C
> > > > > > controller to the display driver:
> > > > > > https://lore.kernel.org/all/20211005022451.2037405-1-bjorn.andersson@linaro.org/
> > > > >
> > > > > OK, so I looked at that a bit. Fair warning that I've never looked at
> > > > > the type C code before today so anything I say could be totally wrong!
> > > > > :-)
> > > > >
> > > > > ...but I _think_ you're abusing the "mux" API for this. I think a type
> > > > > C port can have exactly 1 mux, right? Right now you are claiming to be
> > > > > _the_ mux in the DP driver, but what about for other alt modes? If
> > > > > those wanted to be notified about similar things it would be
> > > > > impossible because you're already _the_ mux, right?
> > > > >
> > > >
> > > > I actually don't think so, because I acquire the typec_mux handle by the
> > > > means of:
> > > >
> > > > mux_desc.svid = USB_TYPEC_DP_SID;
> > > > mux_desc.mode = USB_TYPEC_DP_MODE;
> > > > alt_port->mux = fwnode_typec_mux_get(fwnode, &mux_desc);
> > >
> > > Hrm, I guess I need to go find that code. Ah, I see it in your WIP
> > > tree, but not posted anywhere. :-P The only code I can see calling
> > > fwnode_typec_mux_get() is `drivers/platform/chrome/cros_ec_typec.c`.
> > > In that code it passes NULL for the mux_desc and I'm nearly certain
> > > that it just handles one "mux" per connector despite the fact that it
> > > handles lots of different types of alternate modes. That doesn't mean
> > > that the cros_ec implementation is correct / finalized, but it's a
> > > reference point.
> > >
> > >
> > > > And in the DisplayPort node I provide svid = /bits/ 16 <0xff01>;
> > > >
> > > > So I will be able to reference multiple different altmode
> > > > implementors using this scheme.
> > >
> > > OK, so I'm trying to grok this more. Let's see.
> > >
> > > I'm looking at ucsi_glink_probe() and looking at the matching dts in
> > > your WIP tree [1] in "sc8180x-lenovo-flex-5g.dts" OK, so:
> > >
> > > 1. It's looping once per _connector_ by looping with
> > > `device_for_each_child_node(dev, fwnode)`.
> > >
> > > 2. For each connector, it has exactly one `alt_port` structure.
> > >
> > > 3. For each `alt_port` structure it has exactly one `mux`.
> > >
> > > ...so currently with your WIP tree there is one "mux" per type C connector.
> > >
> > >
> > > Perhaps what you're saying, though, is that the UCSI code in your WIP
> > > tree can/should be changed to support more than one mux per port. Then
> > > I guess it would have logic figuring out what muxes to notify about
> > > which things? ...and I guess that would mean that it's currently a bug
> > > that the ucsi_altmode_enable_usb() notifies "the DP type C mux" about
> > > USB changes?
> > >
> > >
> > > > > I _think_ a mux is supposed to be something more like
> > > > > `drivers/phy/rockchip/phy-rockchip-typec.c` (though that code predates
> > > > > the type C framework we're looking at here). There the phy can do all
> > > > > the work of remuxing things / flipping orientation / etc. I don't
> > > > > think it's a requirement that every SoC be able to do this remuxing
> > > > > itself but (if memory serves) rk3399 implemented it so we didn't have
> > > > > to do it on the TCPC and could use a cheaper solution there.
> > > > >
> > > >
> > > > I'm afraid I don't see how this interacts with a display controller.
> > >
> > > This was actually kinda my point. ;-) Specifically I think
> > > `phy-rockchip-typec.c` is the thing that's supposed to be a "mux". I
> > > think your display controller isn't a mux. Yeah, it's handy that muxes
> > > get told about DP HPD status, but that doesn't mean it's the right
> > > abstraction for you to implement. In my mental model, it's the same as
> > > implementing your "i2c" controller with a "pinctrl" driver. :-P
> > >
> > >
> > > > It
> > > > seems more like it's the phy side of things, what we have split between
> > > > the Type-C controller and the QMP phy to set the pins in the right
> > > > state.
> > > >
> > > > > In any case, my point is that I think there is supposed to be a
> > > > > _single_ mux per port that handles reassigning pins and that's what
> > > > > this API is for.
> > > > >
> > > >
> > > > If that's the case things such as typec_mux_match() is just completely
> > > > backwards.
> > >
> > > Yeah, I have no explanation for typec_mux_match(). Let me see if I can
> > > lure some type C folks into this discussion.
> > 
> > This aligns with the model I have in my mind (not that that is
> > necessarily the right one).
> > I took that matching code to be meant to handle cases where the
> > firmware doesn't explicitly
> > define a "mode-switch" for the port (and so we look at the SVIDs
> > listed in the Mux fwnode descriptor).
> > 
> > The matcher code does suggest there could be a mux for each alternate
> > mode. But then, how does the
> > bus code know which mux to set [2] ? In that code, the struct altmode
> > has a pointer to the struct typec_mux, but I
> > don't see where that pointer is assigned. I assumed that it was set to
> > whatever the mux node of the
> > Type C port was whenever the port driver registered its altmodes for
> > each port, but I can't substantiate
> > that assumption in code.
> > 
> > Heikki, do you have any guidance regarding what the expected usage is
> > here? One typec_mux struct per type C port? Or
> > 1 typec_mux per altmode per port?
> 
> I didn't go over the whole thread, so I may have misunderstood
> something, but I don't think this has anything to do with muxes. The
> mux should not be a problem for the DRM side under no circumstance.
> Like Doug said, the mux API is being abused here.
> 

No need to read up on the thread, your answer further confirms the
understanding gained in a lengthy offline chat we had yesterday
afternoon as well.

> HPD was one use case here, so I'll try to explain how that happens...
> 
> If the USB Type-C connector is in DP alt mode, then ideally your USB
> Type-C controller/port driver has registered the partner device DP alt
> mode the moment it detected that the partner supports that mode, and
> that partner DP alt mode will have then been bind to the DP alt mode
> driver:
> 
>         drivers/usb/typec/altmodes/displayport.c
> 
> After that, if the DP alt mode driver sees HPD - HPD is message
> signalled in DP alt mode (in case some of you guys didn't know) - the
> DP alt mode driver notifies the DRM connector about it by calling
> this function:
> 
>         void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
> 
> If your USB Type-C controller/port driver does not yet register the DP
> alt mode, the it's responsible of handling HPD separately by calling
> drm_connector_oob_hotplug_event() on its own.
> 

The drm_connector_oob_hotplug_event() didn't exist when I tried to get
this working earlier this year and I couldn't figure out what the
intended design was to feed the HPD information into our DP driver.

Misplacing the typec_mux made all the pieces fall in place and it looked
good, but I now agree that the typec_mux should be used to mux in/out
the DP PHY on the pads as a result of the PD negotiation and then
separate of that the HPD signals should be sent towards the DRM driver
using drm_connector_oob_hotplug_event() - hopefully by reusing the
displayport altmode driver, but I still need to figure out how to
incorporate that in my custom TypeC controller driver.

> Either way, the only thing needed here is description of the
> connection between the USB Type-C connector and the DisplayPort in
> firmware - the mux is not relevant here. There are no DT bindings
> defined for that AFAIK (or are there?), but presumable you want to use
> OF graph with DT. Right now the DP alt mode driver does not try to
> find the connection from device graph (so OF graph), but it should not
> be a problem to add support for it.
> 

I'll poke around and see what's missing to get
drm_connector_oob_hotplug_event() work in my model.

> 

The one thing that I still don't understand though is, if the typec_mux
is used by the typec controller to inform _the_ mux about the function
to be used, what's up with the complexity in typec_mux_match()? This is
what lead me to believe that typec_mux was enabling/disabling individual
altmodes, rather just flipping the physical switch at the bottom.

Thanks,
Bjorn

> > > > > ...so I will still assert that the right thing to do is to have a
> > > > > drm_bridge for the type c connector and _that's_ what should be
> > > > > sending HPD.
> > > > >
> > > >
> > > > That still implies that all the current typec_mux code got it all wrong
> > > > and should be thrown out. If you instead consider that you have a Type-C
> > > > controller that upon switching DisplayPort on/off calls typec_mux_set()
> > > > to inform the functions that things has changed then all the current
> > > > code makes sense.
> > > >
> > > > It also maps nicely to how the TypeC controller would call
> > > > typec_switch_set() to inform, in our case the QMP phy that the
> > > > orientation has switched.
> > > >
> > > >
> > > > It seems reasonable to have some common helper code that registers the
> > > > typec_mux and turn its notifications into HPD notifications to the
> > > > display code, but I still think that should live in the DRM framework,
> > > > separate from the USB code.
> > >
> > > I think I'm going to step back and hope that the experts can chime in.
> > >
> > >
> > > [1] https://github.com/andersson/kernel/commits/wip/sc8180x-next-20210819
> > [2]: https://elixir.bootlin.com/linux/v5.15-rc4/source/drivers/usb/typec/bus.c#L27
> > 
> > >
> > > -Doug
> 
> thanks,
> 
> -- 
> heikki
