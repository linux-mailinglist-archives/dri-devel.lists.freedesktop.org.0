Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9B68CB7C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 01:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB6B10E1B0;
	Tue,  7 Feb 2023 00:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A71610E1B0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 00:53:46 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id l128so5131972iof.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 16:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aEtqJJ1FY1ObITl4dNJzd/qmyd/g7h+9E+qPocWbOcU=;
 b=VLH0TE3DMUlUIxrO96yRhkgVwidsNUonTl9hBhz5ngNedkHdLZTyLDc9qSHC39k4Yj
 6jLBiNCf8E+2GXCTFwxz6GlmudCiCFB9nBusRbtMGKl4z33lHQlHE/Q+a0cOx7YU7yAQ
 n1MvwRPCD/xn5eisPmLbi1LNOtvQib+cAK5CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aEtqJJ1FY1ObITl4dNJzd/qmyd/g7h+9E+qPocWbOcU=;
 b=f1kXRyL3new8SkL5LYriinAeDqBSfcMZBln7wM4u90sg8utDYDCfal7QcHu5TcremC
 oXqhiVXOQB4L6CtSTbWd3H5xF/J0wIzj4gMIJZB4Xo2GJrLbOvpZLYZ6Ke1Rn05mV9GV
 8TFMC4OrVe2WFd8X+AVU2aHTqHFqMidjowA80M6D+0nLzkEow7sl1bO/YbqTxrGxH8Us
 XxWlehQo5WdkYmKpruvKUOS5paO7rlFop/EHdmciEU5vK5Khplx5Lp/5PRinfR5igBoI
 i/dZEKvw3LzilFTy2zMciYzzm98RedTZ2wKmbihzfjNcna7in5qKfPB4aFO08SIHpL/E
 y9UA==
X-Gm-Message-State: AO0yUKXhEjpSKoUj6x2jDIYde5HhuF41CAAUfgO6lbFPhwg8AO41GcE3
 SdZIoUb/UiOnNA9xsHtaekDX+TycUDOLA2YR
X-Google-Smtp-Source: AK7set+1uP14miFxg2fPe0NC6vWglEXUtqeZNSgQgiVT61+bZhsoeawIu3Ry08K3HvDhCMVCQj8vWg==
X-Received: by 2002:a6b:ed0f:0:b0:707:ad8d:c0ab with SMTP id
 n15-20020a6bed0f000000b00707ad8dc0abmr816330iog.10.1675731224996; 
 Mon, 06 Feb 2023 16:53:44 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49]) by smtp.gmail.com with ESMTPSA id
 i33-20020a056638382100b003a22298d014sm4095193jav.25.2023.02.06.16.53.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 16:53:42 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id e204so5133796iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 16:53:42 -0800 (PST)
X-Received: by 2002:a05:6638:5af:b0:3b1:4f93:69b8 with SMTP id
 b15-20020a05663805af00b003b14f9369b8mr659871jar.117.1675731222122; Mon, 06
 Feb 2023 16:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20230120114313.2087015-1-john@metanate.com>
 <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
 <Y8uo7vIcQ6caH9pu@ravnborg.org> <Y8wnswk++tvr9xMe@donbot>
 <Y81Px74OUYt21nj4@pendragon.ideasonboard.com>
 <Y856rWmtA4tQCcZz@donbot> <Y86wO8nvFbC81b1S@pendragon.ideasonboard.com>
 <CAD=FV=UwMS86RKR9dqzOnjEhKxh=d=EJPfjcCOvWZMjVVQsmKw@mail.gmail.com>
In-Reply-To: <CAD=FV=UwMS86RKR9dqzOnjEhKxh=d=EJPfjcCOvWZMjVVQsmKw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Feb 2023 16:53:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WWH8WBF1sd860Rgyq3xdmYqx9s-DG0+dk8iA=7NyCeDA@mail.gmail.com>
Message-ID: <CAD=FV=WWH8WBF1sd860Rgyq3xdmYqx9s-DG0+dk8iA=7NyCeDA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: panel: Set orientation on panel_bridge
 connector
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 2, 2023 at 4:45 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jan 23, 2023 at 8:05 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi John,
> >
> > On Mon, Jan 23, 2023 at 12:16:45PM +0000, John Keeping wrote:
> > > On Sun, Jan 22, 2023 at 05:01:27PM +0200, Laurent Pinchart wrote:
> > > > On Sat, Jan 21, 2023 at 05:58:11PM +0000, John Keeping wrote:
> > > > > On Sat, Jan 21, 2023 at 09:57:18AM +0100, Sam Ravnborg wrote:
> > > > > > On Fri, Jan 20, 2023 at 01:44:38PM -0800, Doug Anderson wrote:
> > > > > > > On Fri, Jan 20, 2023 at 3:43 AM John Keeping wrote:
> > > > > > > >
> > > > > > > > Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
> > > > > > > > it") added a helper to set the panel panel orientation early but only
> > > > > > > > connected this for drm_bridge_connector, which constructs a panel bridge
> > > > > > > > with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.
> > > > > > > >
> > > > > > > > When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
> > > > > > > > panel_bridge creates its own connector the orientation is not set unless
> > > > > > > > the panel does it in .get_modes which is too late and leads to a warning
> > > > > > > > splat from __drm_mode_object_add() because the device is already
> > > > > > > > registered.
> > > > > > > >
> > > > > > > > Call the necessary function to set add the orientation property when the
> > > > > > > > connector is created so that it is available before the device is
> > > > > > > > registered.
> > > > > > >
> > > > > > > I have no huge objection to your patch and it looks OK to me. That
> > > > > > > being said, my understanding is that:
> > > > > > >
> > > > > > > 1. DRM_BRIDGE_ATTACH_NO_CONNECTOR is "the future" and not using the
> > > > > > > flag is "deprecated".
> > > > > >
> > > > > > Correct.
> > > > > > Could we take a look at how much is required to move the relevant driver
> > > > > > to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> > > > > >
> > > > > > If this is too much work now we may land this simple patch, but the
> > > > > > preference is to move all drivers to the new bridge handling and thus
> > > > > > asking display drivers to create the connector.
> > > >
> > > > I fully agree with Doug and Sam here. Let's see if we can keep the yak
> > > > shaving minimal :-)
> > > >
> > > > > > What display driver are we dealing with here?
> > > > >
> > > > > This is dw-mipi-dsi-rockchip which uses the component path in
> > > > > dw-mipi-dsi (and, in fact, is the only driver using that mode of
> > > > > dw-mipi-dsi).
> > > > >
> > > > > I'm not familiar enough with DRM to say whether it's easy to convert to
> > > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR - should dw-mipi-dsi-rockchip be moving
> > > > > to use dw-mipi-dsi as a bridge driver or should dw_mipi_dsi_bind() have
> > > > > a drm_bridge_attach_flags argument?  But I'm happy to test patches if it
> > > > > looks easy to convert to you :-)
> > > >
> > > > I'd go for the former (use dw_mipi_dsi_probe() and acquire the DSI
> > > > bridge with of_drm_find_bridge() instead of using the component
> > > > framework) if possible, but I don't know how intrusive that would be.
> > >
> > > I'm a bit confused about what's required since dw-mipi-dsi-rockchip
> > > already uses dw_mipi_dsi_probe(),
> >
> > Indeed, my bad.
> >
> > > but I think moving away from the
> > > component framework would be significant work as that's how the MIPI
> > > subdriver fits in to the overall Rockchip display driver.
> >
> > It will be some work, yes. It however doesn't mean that the whole
> > Rockchip display driver needs to move away from the component framework,
> > it can be limited to the DSI encoder. It's not immediately clear to me
> > why the DSI encoder uses the component framework in the first place, and
> > if it would be difficult to move away from it.
> >
> > > Any changes / modernisation to the Rockchip MIPI driver look like it
> > > will take more time than I have available to spend on this, so I'd
> > > really like to see this patch land as it's a simple fix to an existing
> > > working code path.
> >
> > So who volunteers for fixing it properly ? :-)
> >
> > I'll let Doug and Sam decide regarding mering this patch.
>
> This thread seems to have gone silent.
>
> I'm inclined to merge this patch (removing the "Fixes" tag) since it's
> a one-line fix. While we want to encourage people to move to "the
> future", it seems like it would be better to wait until someone is
> trying to land something more intrusive than a 1-line fix before truly
> forcing the issue.
>
> I'll plan to merge the patch to drm-misc-next early next week assuming
> there are no objections.

Pushed to drm-misc-next after removing the "Fixes" tag and also fixing
this warning:

> -:7: WARNING:REPEATED_WORD: Possible repeated word: 'panel'
> #7:
> it") added a helper to set the panel panel orientation early but only

e3ea1806e4ad drm/bridge: panel: Set orientation on panel_bridge connector

-Doug
