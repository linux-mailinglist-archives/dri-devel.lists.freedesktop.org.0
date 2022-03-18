Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405AC4DD9B3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 13:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759C110E1B9;
	Fri, 18 Mar 2022 12:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E010710E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 12:25:54 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g20so10069850edw.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T4cZFs/XnkBtXfyMpwI2NbXxpAEQ7d9eh6QYuf3F9fg=;
 b=t/ZeSC3GwJPU+IVD3CowPDb/n4WRq3HG8V13gWjPkg6UHJsj6VbK4GDpXhbA+Hge1U
 6gN6zMeSXOMJNH/bhYDpJZUfUMlhEAGxdRL5/yvvmPirZq3ntQdN3hYHYLPmP1VR5VL9
 BOPGDesAWnXLfzx1EZg1TqnE9CbwO34XFmRiyv9nBzQ2jAi83xFOiFHAO6zmlnax13GX
 zouWRDXByMOtWzzCD28DUuXe+pZg4kXSmH0myy16ok1Y+cruJtpmXWkAvTmHBHM+zMHT
 zK/Y5XosQf0VfC+UVqL3FcDifm5ZlHN5GebqW3MtnCVounvEdZ2VQ9HmMLaZ+6LTuW5V
 qoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T4cZFs/XnkBtXfyMpwI2NbXxpAEQ7d9eh6QYuf3F9fg=;
 b=KJRHx0tgACqM/befOazUumPU5++xwGeh5qgtsVUiunAo1rcFcVNuVuB10b5tePSAdA
 0Vl268elXQ/KJYftnP641+bm+NcgX7z9RHSG3wGRgRa7fIexfG2kUZvnq9nuSLR9mUOl
 FZUfS1XKrn1cjJ/mi9EN1fMnbHykc8f2DkN6+odCZJlVvlVaPuGcSL+DPzkLog6aKnbS
 ZDpXOF574yYCtB3xHAyOvGgI7ou8vAVOuJx12ZYVGQC4P1fTrDgjBxtPdFY8W0oDptER
 uSB6gf5XfMmIOXNU8XftIj9e939dp71MWFCzQVNv/MEFvOPRqm+AmVru+W4SKFFa0rNA
 g94w==
X-Gm-Message-State: AOAM531UeMwilN9O2a7djRizhWGEm8GiDZIDjUgafPcoEXcVfxcwTyNA
 8W1ms7mHPat3NXAj0CeRXNhpSx5lXW/CdCRyE/Zwn9i8Msg=
X-Google-Smtp-Source: ABdhPJw3nBcbqEP7hrPWCQ6njtM1v3R8xzCO4BXIr4LinH+D8cBi65uunNpP1YgJZJurMwpBpk35Hex7ZAJdm8+HAEU=
X-Received: by 2002:a05:6402:11cc:b0:418:d64d:ccdf with SMTP id
 j12-20020a05640211cc00b00418d64dccdfmr9026526edw.139.1647606353372; Fri, 18
 Mar 2022 05:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Mar 2022 12:25:37 +0000
Message-ID: <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi All

A gentle ping on this series. Any comments on the approach?
Thanks.

> Changes from v1:
> - New patch to refactor drm_bridge_chain_post_disable and drm_bridge_chain_pre_enable
>   to reuse drm_atomic_bridge_chain_post_disable / drm_atomic_bridge_chain_pre_enable
>   but with a NULL state.
> - New patch that adds a pre_enable_upstream_first to drm_panel.
> - changed from an OPS flag to a bool "pre_enable_upstream_first" in drm_bridge.
> - Followed Andrzej's suggestion of using continue in the main loop to avoid
>   needing 2 additional loops (one forward to find the last bridge wanting
>   upstream first, and the second backwards again).
> - Actioned Laurent's review comments on docs patch.
>
> Original cover letter:
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
>
> This patch takes a hybrid of the two: an optional reversing of the order for
> specific links within the bridge chain within pre_enable and post_disable done
> within the drm_bridge framework.
> I'm more than happy to move where the flag exists in structures (currently as
> DRM_BRIDGE_OP_UPSTREAM_FIRST in drm_bridge_ops, but it isn't an op), but does
> this solve the problem posed? If not, then can you describe the actual scenario
> it doesn't cover?
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
> Dave Stevenson (4):
>   drm/bridge: Remove duplication from drm_bridge and drm_atomic_bridge
>     chains
>   drm/bridge: Introduce pre_enable_upstream_first to alter bridge init
>     order
>   drm/panel: Add prepare_upstream_first flag to drm_panel
>   drm/bridge: Document the expected behaviour of DSI host controllers
>
>  Documentation/gpu/drm-kms-helpers.rst |   7 ++
>  drivers/gpu/drm/bridge/panel.c        |   3 +
>  drivers/gpu/drm/drm_bridge.c          | 181 ++++++++++++++++++++++++----------
>  include/drm/drm_bridge.h              |   8 ++
>  include/drm/drm_panel.h               |  10 ++
>  5 files changed, 159 insertions(+), 50 deletions(-)
>
> --
> 2.7.4
>
