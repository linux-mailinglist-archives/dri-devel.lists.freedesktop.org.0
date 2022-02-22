Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC74BF412
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC3310EAA6;
	Tue, 22 Feb 2022 08:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F95E10EAA6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:51:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id i11so33467108eda.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NSd6kzZlDG4BxsQ6z28t583bHcYr6jM/sa6f4R478vc=;
 b=UJQInGkBXB/yJNkgVzQwllJjpqmd87myB59YfOc4qxChC081V2pRTuIyVhXJOmW6nX
 l6Qnc2iZf+IFpFwuAGe0bi5SKl4AvE67+HB0sxs7l+AelPnHWvaxtwXrxLlYLSCyERk4
 tzaysle84bR1iYyfXEFPQg+Ff+1mj4Y8Qfw30uYnELXCGokDi6mesqmLOKWqoiS4Qq0F
 rmcNAgMwWaDHmeEt9AMUXmx7jF8gbdWMgHq48X8V9Q/suRgg0elS1M8sqvjMQCBMYaAy
 i3TgI8tjOsqxMw6NlFpb0R0Wr8mUzM1jlHgmLS7iFrMaUDJ4fNbGJBOQd9shL0AMV1ob
 uphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSd6kzZlDG4BxsQ6z28t583bHcYr6jM/sa6f4R478vc=;
 b=496GX8s9gQepV7gwHhTDV6nciki3NzVBB9yGVtwLGdX2I+j6+MahWyAw++8YBcGNJQ
 wjyLd9VIUc+qht114eq+buD6uz968fC7dm6jv94fVXVtWejvnvPjl9DPOMLTnl7Cg7Xt
 wt0pSGmPNV+zz4QRTus8inCLuUv91nldM3MyfQz4KBgmjzI521zWl8bYvORHQJuYXhbX
 RV1GyqhQTaDErffMO7eynuWmZYeExptH2rDA4v3RtjBXssn/ckn0OLESG81cyl7W8tzh
 Ao6/lNK0Lo2/+rFLFTNQQq2Z+4otVH0G4CXQlat3fopepoQh5wSZIPsOZmHcZdtALw01
 ur6Q==
X-Gm-Message-State: AOAM530UG5c8QCUD6OoEKk/Qsg3lZlvV3lAX42t/2qH1uWQktwqpAHUq
 Bhu1KaYrRqYrcxqz9tIe2WLp//c6d9MHSZMUc6rIFA==
X-Google-Smtp-Source: ABdhPJwmt6/I5M2wqWoIhXsUbWzSoxmwx9nH7Q9+1btrl0izCtpoQ7aiqKHw1n9NtO5a9hjVpmu3BKJhD6xYio9U32E=
X-Received: by 2002:aa7:de84:0:b0:40f:db98:d0f9 with SMTP id
 j4-20020aa7de84000000b0040fdb98d0f9mr24831985edv.366.1645519907039; Tue, 22
 Feb 2022 00:51:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <31201578-6427-d580-4655-24d40dc22494@intel.com>
 <YhSGGAvRKwiabDsp@pendragon.ideasonboard.com>
In-Reply-To: <YhSGGAvRKwiabDsp@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 22 Feb 2022 08:51:31 +0000
Message-ID: <CAPY8ntAQJHyNXgbV8o8KZDBxw_aavQQOA6vR12FeHcBBLr+kmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] DSI host and peripheral initialisation ordering
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Tue, 22 Feb 2022 at 06:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Fri, Feb 18, 2022 at 02:20:19PM +0100, Andrzej Hajda wrote:
> > On 16.02.2022 17:59, Dave Stevenson wrote:
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
> > >
> > > This patch takes a hybrid of the two: an optional reversing of the order for
> > > specific links within the bridge chain within pre_enable and post_disable done
> > > within the drm_bridge framework.
> > > I'm more than happy to move where the flag exists in structures (currently as
> > > DRM_BRIDGE_OP_UPSTREAM_FIRST in drm_bridge_ops, but it isn't an op),
>
> API-wise that's my only concern, the flag should go somewhere else.

Ah, the million dollar question then - where does it go? It is only
true or false, so a bool in struct drm_bridge, same as
interlace_allowed?

I've had the realisation that this needs to be accessible from the
panel drivers so DSI panel drivers such as panel-ilitek-ili9881 can
set it too. I'll have a slight rethink over that one, but it is
probably a similar extra flag in struct drm_panel.

  Dave

> > > but does
> > > this solve the problem posed? If not, then can you describe the actual scenario
> > > it doesn't cover?
> > > A DSI peripheral can set the flag to get the DSI host initialised first, and
> > > therefore it has a stable LP-11 state before pre_enable. Likewise the peripheral
> > > can still send shutdown commands prior to the DSI host being shut down in
> > > post_disable. It also handles the case where there are multiple devices in the
> > > chain that all want their upstream bridge enabled first, so should there be a
> > > DSI mux between host and peripheral, then it can still get the host to the
> > > correct state.
> > >
> > > An example tree is at [7] which is drm-misc-next with these patches and then a
> > > conversion of vc4_dsi to use the atomic bridge functions (will be upstreamed
> > > once we're over this hurdle). It is working happily with the Toshiba TC358762 on
> > > a Raspberry Pi 7" panel.
> > > The same approach but on our vendor 5.15 tree[8] has also been tested
> > > successfully on a TI SN65DSI83 and LVDS panel.
> > >
> > > Whilst here, I've also documented the expected behaviour of DSI hosts and
> > > peripherals to aid those who come along after.
> >
> > Good summary, of multiple attempts of solving the issue (however I still
> > could add some more :) ).
>
> Definitely good, thank you very much Dave for tackling this issue.
>
> > I think the main issue is that we try to squeeze different hardware
> > protocol requirements into one quite restrictive framework - whole
> > crtc->encoder->bridges->(panel ||connector) is managed directly by drm core.
> > No place to negotiate configuration directly between players
> > (bridges/panels).
> > This patchset slightly looses the restrictions, so hopefully will help
> > for some time, but still every developer needs to solve riddles what to
> > put into callbacks, to allow driver working in different pipelines.
>
> That's true, but documentation can help a lot there. Patch 2/2 turns the
> riddle-solving task into documentation reading. Granted, not everybody
> will read the documentation (and we should probably link to it from the
> documentation of the pre_enable and post_disable operations), but the
> behaviour is now defined, which is a major step forward.
>
> > <DREAM MODE ON>
> > Ideally I would like to drop idea of the bridge/panel and build
> > abstraction on data links.
> > So for example DSI/EDP bridge during probe would register DSI sink with
> > their ops, and EDP source with their ops or just look for EDP sink (what
> > will suit better).
> > To establish data link they could use their ops and helpers to provide
> > two-way conversation.
> > This way if we need add support for new data link type or extend
> > existing one we do not need to touch whole framework and pray to not
> > break some strange bridge, or to add ops which will not be used by most
> > of users.
> > <DREAM MODE OFF>
>
> Protocol-specific operations can help, but I don't think they will
> fundamentally change the problem. Yes, in some case, we can have
> hardware requirements that are hard to express through generic
> operations, but in most case the issue is more about defining the
> semantic of the generic operations for a particular protocol than about
> a need for a specific operation.
>
> The core issue, in my opinion, is that we have a mechanism that
> essentially works from source to sink, with the source controlling the
> sink. With some protocols (DSI in particular), the start sequence
> requires more fine-grained control of the operations, and the sink
> should be in control. We should ideally start a pipeline by calling the
> enable operation on the last element (connector or panel), whose driver
> will then call operations on its source, and interleave those calls with
> control of the local device, in the exact sequence required by the
> device. That's how the omapdrm driver operated before I ported it to
> drm_bridge. Reversing the order of the pipeline enable was a huge piece
> of work for a single driver. Doing it again in the other direction for
> *all* drivers seems like an even bigger dream (or nightmare) than yours
> Andrzej :-)
>
> > Putting dreams off, I think this patchset can add some value, at the
> > price of call chain complication. Lets see opinion of others.
>
> I agree, I think it's a reasonable middleground. It improves the
> situation, adds very little complexity in the API, has documentation to
> specifies how the operations are meant to be implemented, and has a
> reasonable increase of complexity for the pre_enable and post_disable
> helpers (and the implementation could probably be simplified by moving
> to recursive calls). I like this.
>
> > > [1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L940
> > > [2] https://lists.freedesktop.org/archives/dri-devel/2022-January/337769.html
> > > [3] https://lists.freedesktop.org/archives/dri-devel/2021-December/333908.html
> > > [4] https://lists.freedesktop.org/archives/dri-devel/2021-October/328476.html
> > > [5] https://lists.freedesktop.org/archives/dri-devel/2021-October/325853.html
> > > [6] https://lists.freedesktop.org/archives/dri-devel/2022-February/341852.html
> > > [7] https://github.com/6by9/linux/tree/drm-misc-next-vc4_dsi
> > > [8] https://github.com/6by9/linux/tree/rpi-5.15.y-sn65dsi83
> > >
> > >
> > > Dave Stevenson (2):
> > >    drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter bridge init order
> > >    drm/bridge: Document the expected behaviour of DSI host controllers
> > >
> > >   Documentation/gpu/drm-kms-helpers.rst |   7 +
> > >   drivers/gpu/drm/drm_bridge.c          | 235 ++++++++++++++++++++++++++++++----
> > >   include/drm/drm_bridge.h              |   8 ++
> > >   3 files changed, 225 insertions(+), 25 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
