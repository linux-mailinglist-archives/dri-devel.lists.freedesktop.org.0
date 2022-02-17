Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CA64BA767
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7D010E2B9;
	Thu, 17 Feb 2022 17:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCAF10E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 17:46:23 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id p7so9692397qvk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 09:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=waJ9BielP36PasfQ70Ww7q8lwS43d8T+GQ8xxjTw3BU=;
 b=Hf/SUUEHcfxPliOuuurs05M9UPLqk/6qZJdwdOKvcp33F7VYuwyuQtC78XYsHj+uUQ
 G59gcEKALVSJomwmBJQBG5jTWcPBJ40/rOLgR28bXWWjyDcTHqRj97JyUHyxscV6cEZQ
 Voiqo26adsqfq40W1t8P2Bj3CGoBorY4tdxrL3lQ4xn91m+38VQxM/i3ZU6If8gra8wg
 oXhOfk1qNWXiC5TbcTUHBzUzbZ/4wyUfAlw5wS/v23SxntvnERgxY2/gPE63gAbvRXMD
 YQ8C6LdPP8ucZwoNq62Wl+RvWPLrWTTY6smDx33eSRUtOAh4OU7WeoHDqy9GsNWgA0GM
 PYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=waJ9BielP36PasfQ70Ww7q8lwS43d8T+GQ8xxjTw3BU=;
 b=K/XfnYXcKZiG88kbYqhK66xAt3ghXZ4xq4oYcVABtvBYOv9sJ8W9OBwdlPifctCL64
 za/stYymhZwj/uVSiah5ipWyah45hhqRd6Xtu6Icnx95ROQ/7b91lkHhHcca9+LqIvIz
 itnGZjZOWnn6REZ8pBS5deJ122993FcUElH2jl9SKVhxcbhTTtBY3MLiW4td/2SAQrR+
 DQ/IN3NOXGBjvBvwrNm74FnDiLujcI4Q+vtC1611sSlG3Kepby2sr7mjnnTLT2K+vcW7
 7ndWAEo3jW29UVump1nST8XOPaDJbTVvcIh70h+w1E/J3dkRbEmjnFBTrX1r1E/rPujF
 zuoA==
X-Gm-Message-State: AOAM530UA5bHBE44WIiVQpK2xgCmFTYxyP5gx2f2Dzwr5FRwYO+Dh/mn
 qLD9PyEePW3StR9DWFRg92Cv/LER4UOUCJdwq+wPaA==
X-Google-Smtp-Source: ABdhPJydlZ1PbhBhj+o9jQrrDEwbypwB5r7YBoFY30H7xJLML+ffKNZGz8s75DofO9MGSN+8fTSQGpI1PWeD9qrdngA=
X-Received: by 2002:ac8:58cb:0:b0:2d2:966f:34fe with SMTP id
 u11-20020ac858cb000000b002d2966f34femr3366390qta.295.1645119982047; Thu, 17
 Feb 2022 09:46:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Feb 2022 20:46:11 +0300
Message-ID: <CAA8EJpqxbeasMQg6KSMbh4K=q_Ctk9QFq=dGjRcaRcRCeh=XEg@mail.gmail.com>
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
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022 at 20:00, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi All
>
> Hopefully I've cc'ed all those that have bashed this problem around previously,
> or are otherwise linked to DRM bridges.
>
> There have been numerous discussions around how DSI support is currently broken
> as it doesn't support initialising the PHY to LP-11 and potentially the clock
> lane to HS prior to configuring the DSI peripheral. There is no op where the
> interface is initialised but HS video isn't also being sent.
> Currently you have:
> - peripheral pre_enable (host not initialised yet)
> - host pre_enable
> - encoder enable
> - host enable
> - peripheral enable (video already running)
>
> vc4 and exynos currently implement the DSI host as an encoder, and split the
> bridge_chain. This fails if you want to switch to being a bridge and/or use
> atomic calls as the state of all the elements split off are not added by
> drm_atomic_add_encoder_bridges.
>
> dw-mipi-dsi[1] and now msm[2] use the mode_set hook to initialise the PHY, so
> the bridge/panel pre_enable can send commands. In their post_disable they then
> call the downstream bridge/panel post_disable op manually so that shutdown
> commands can be sent before shutting down the PHY. Nothing handles that fact,
> so the framework then continues down the bridge chain and calls the post_disable
> again, so we get unbalanced panel prepare/unprepare calls being reported [3].
>
> There have been patches[4] proposing reversing the entire direction of
> pre_enable and post_disable, but that risks driving voltage into devices that
> have yet to be powered up.
> There have been discussions about adding either a pre_pre_enable, or adding a
> DSI host_op to initialise the host[5]. Both require significant reworking to all
> existing drivers in moving initialisation phases.
> We have patches that look like they may well be addressing race conditions in
> starting up a DSI peripheral[6].

I have been thinking about a similar approach:
- Add power_up() and power_down() ops to drm_bridge_ops
- Add separate drm_bridge_chain_power_up() and _power_down() with
power_up being called from encoder to the connector end of the chain
and power_down being called in the opposite direction.
- Make those functions call power_up()/power_down() if it's available
and call pre_enable()/post_disable() if it is not
- Make drm_bridge_chain_pre_enable()/_post_disable() call
pre_enable()/post_disable() only if power_up()/power_down() are not
present.

This removes the immediate need for the rework of the drivers.
On the other hand the DSI hosts can be brought up in the power_up
stage (to the LP-11). Then bridge's pre_enable() can communicate with
the actual hardware in time.
So does bridge's post_disable()


> This patch takes a hybrid of the two: an optional reversing of the order for
> specific links within the bridge chain within pre_enable and post_disable done
> within the drm_bridge framework.
> I'm more than happy to move where the flag exists in structures (currently as
> DRM_BRIDGE_OP_UPSTREAM_FIRST in drm_bridge_ops, but it isn't an op), but does
> this solve the problem posed? If not, then can you describe the actual scenario
> it doesn't cover?

My general feeling is that this makes the chain traversing functions
unnecessarily complex.

> A DSI peripheral can set the flag to get the DSI host initialised first, and
> therefore it has a stable LP-11 state before pre_enable. Likewise the peripheral
> can still send shutdown commands prior to the DSI host being shut down in
> post_disable. It also handles the case where there are multiple devices in the
> chain that all want their upstream bridge enabled first, so should there be a
> DSI mux between host and peripheral, then it can still get the host to the
> correct state.
>
> An example tree is at [7] which is drm-misc-next with these patches and then a
> conversion of vc4_dsi to use the atomic bridge functions (will be upstreamed
> once we're over this hurdle). It is working happily with the Toshiba TC358762 on
> a Raspberry Pi 7" panel.
> The same approach but on our vendor 5.15 tree[8] has also been tested
> successfully on a TI SN65DSI83 and LVDS panel.
>
> Whilst here, I've also documented the expected behaviour of DSI hosts and
> peripherals to aid those who come along after.
>
> Thanks
>   Dave
>
> [1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L940
> [2] https://lists.freedesktop.org/archives/dri-devel/2022-January/337769.html
> [3] https://lists.freedesktop.org/archives/dri-devel/2021-December/333908.html
> [4] https://lists.freedesktop.org/archives/dri-devel/2021-October/328476.html
> [5] https://lists.freedesktop.org/archives/dri-devel/2021-October/325853.html
> [6] https://lists.freedesktop.org/archives/dri-devel/2022-February/341852.html
> [7] https://github.com/6by9/linux/tree/drm-misc-next-vc4_dsi
> [8] https://github.com/6by9/linux/tree/rpi-5.15.y-sn65dsi83
>
>
> Dave Stevenson (2):
>   drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter bridge init order
>   drm/bridge: Document the expected behaviour of DSI host controllers
>
>  Documentation/gpu/drm-kms-helpers.rst |   7 +
>  drivers/gpu/drm/drm_bridge.c          | 235 ++++++++++++++++++++++++++++++----
>  include/drm/drm_bridge.h              |   8 ++
>  3 files changed, 225 insertions(+), 25 deletions(-)
>
> --
> 2.7.4
>


--
With best wishes
Dmitry
