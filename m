Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489FE688C13
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 01:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4491910E028;
	Fri,  3 Feb 2023 00:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304F810E028
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 00:46:02 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id h24so3982055qta.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 16:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A3ZdY21LXjE3PyX5fpTlE0/f6/GAdOiGr62nnKIP3aI=;
 b=XqmKvE/220WSzs0GhJ44A5LIXEmpXnCvVQd9D5uzyUIT3830BQHAqJwInbX68g1gOX
 48ZWklm9NO4kuHW00FcLFdeIknSgSmyrbbjZgFCCS2Tw2y8QXc0iRIm7jcY7UHd/ABe7
 SQoKqAlY8t5PtyHQkpA6HfrNiOJoTDO6RtgWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A3ZdY21LXjE3PyX5fpTlE0/f6/GAdOiGr62nnKIP3aI=;
 b=28CGPzx/+Bt+JYt8DtPRU+nufHi3U2YQ+noNMsOvX618wncwyZVbOQUVczFQXxNXRG
 NNXNLXFhmzEngSzWGptJJQY2i4+FvZKFr/Ubej7KlVrgzRWKj1a0DmpJ6FZlsSkd0Z97
 Cqoy5V4062icFG6TmbXs54K3350emYTfXA4ZY8CnPoUAU4cLTc7EonSDWhKzvgrrB/Ue
 eeb4lkAlhWq14CVy9h14edCNhMqRYHRdAhKa8IEW76FgjY2DrsU0A/L+3baXa1w8QQ+7
 CfEbMm7VowtyCkY5nG8MKaKEHsSsfd6cNjlP2zNmzWwXdl6KfmJFR9eI4tCD8ZHoUa5F
 mdPg==
X-Gm-Message-State: AO0yUKW2IjuJhJiLJevws1O+XcoP9IjAElKygMI55FZkp1fHYSg4FWd3
 JmlrJ6eOwiFqpX6hkA54P0Dk1f79Z5AeGjhvMkQ=
X-Google-Smtp-Source: AK7set+C8BlFk2nfGmM0fFx7athIOkqr81MfZE5JKa2LINbIPReSrWC7lfuUxD2ak5acwehR68bGtA==
X-Received: by 2002:ac8:5703:0:b0:3b8:2175:fcff with SMTP id
 3-20020ac85703000000b003b82175fcffmr17720524qtw.31.1675385160866; 
 Thu, 02 Feb 2023 16:46:00 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 bb10-20020a05622a1b0a00b003b9a73cd120sm639632qtb.17.2023.02.02.16.45.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 16:45:59 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id m199so4530155ybm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 16:45:58 -0800 (PST)
X-Received: by 2002:a25:9741:0:b0:804:3d1e:68af with SMTP id
 h1-20020a259741000000b008043d1e68afmr1156308ybo.258.1675385158481; Thu, 02
 Feb 2023 16:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20230120114313.2087015-1-john@metanate.com>
 <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
 <Y8uo7vIcQ6caH9pu@ravnborg.org> <Y8wnswk++tvr9xMe@donbot>
 <Y81Px74OUYt21nj4@pendragon.ideasonboard.com>
 <Y856rWmtA4tQCcZz@donbot> <Y86wO8nvFbC81b1S@pendragon.ideasonboard.com>
In-Reply-To: <Y86wO8nvFbC81b1S@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Feb 2023 16:45:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UwMS86RKR9dqzOnjEhKxh=d=EJPfjcCOvWZMjVVQsmKw@mail.gmail.com>
Message-ID: <CAD=FV=UwMS86RKR9dqzOnjEhKxh=d=EJPfjcCOvWZMjVVQsmKw@mail.gmail.com>
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

On Mon, Jan 23, 2023 at 8:05 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi John,
>
> On Mon, Jan 23, 2023 at 12:16:45PM +0000, John Keeping wrote:
> > On Sun, Jan 22, 2023 at 05:01:27PM +0200, Laurent Pinchart wrote:
> > > On Sat, Jan 21, 2023 at 05:58:11PM +0000, John Keeping wrote:
> > > > On Sat, Jan 21, 2023 at 09:57:18AM +0100, Sam Ravnborg wrote:
> > > > > On Fri, Jan 20, 2023 at 01:44:38PM -0800, Doug Anderson wrote:
> > > > > > On Fri, Jan 20, 2023 at 3:43 AM John Keeping wrote:
> > > > > > >
> > > > > > > Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
> > > > > > > it") added a helper to set the panel panel orientation early but only
> > > > > > > connected this for drm_bridge_connector, which constructs a panel bridge
> > > > > > > with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.
> > > > > > >
> > > > > > > When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
> > > > > > > panel_bridge creates its own connector the orientation is not set unless
> > > > > > > the panel does it in .get_modes which is too late and leads to a warning
> > > > > > > splat from __drm_mode_object_add() because the device is already
> > > > > > > registered.
> > > > > > >
> > > > > > > Call the necessary function to set add the orientation property when the
> > > > > > > connector is created so that it is available before the device is
> > > > > > > registered.
> > > > > >
> > > > > > I have no huge objection to your patch and it looks OK to me. That
> > > > > > being said, my understanding is that:
> > > > > >
> > > > > > 1. DRM_BRIDGE_ATTACH_NO_CONNECTOR is "the future" and not using the
> > > > > > flag is "deprecated".
> > > > >
> > > > > Correct.
> > > > > Could we take a look at how much is required to move the relevant driver
> > > > > to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> > > > >
> > > > > If this is too much work now we may land this simple patch, but the
> > > > > preference is to move all drivers to the new bridge handling and thus
> > > > > asking display drivers to create the connector.
> > >
> > > I fully agree with Doug and Sam here. Let's see if we can keep the yak
> > > shaving minimal :-)
> > >
> > > > > What display driver are we dealing with here?
> > > >
> > > > This is dw-mipi-dsi-rockchip which uses the component path in
> > > > dw-mipi-dsi (and, in fact, is the only driver using that mode of
> > > > dw-mipi-dsi).
> > > >
> > > > I'm not familiar enough with DRM to say whether it's easy to convert to
> > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR - should dw-mipi-dsi-rockchip be moving
> > > > to use dw-mipi-dsi as a bridge driver or should dw_mipi_dsi_bind() have
> > > > a drm_bridge_attach_flags argument?  But I'm happy to test patches if it
> > > > looks easy to convert to you :-)
> > >
> > > I'd go for the former (use dw_mipi_dsi_probe() and acquire the DSI
> > > bridge with of_drm_find_bridge() instead of using the component
> > > framework) if possible, but I don't know how intrusive that would be.
> >
> > I'm a bit confused about what's required since dw-mipi-dsi-rockchip
> > already uses dw_mipi_dsi_probe(),
>
> Indeed, my bad.
>
> > but I think moving away from the
> > component framework would be significant work as that's how the MIPI
> > subdriver fits in to the overall Rockchip display driver.
>
> It will be some work, yes. It however doesn't mean that the whole
> Rockchip display driver needs to move away from the component framework,
> it can be limited to the DSI encoder. It's not immediately clear to me
> why the DSI encoder uses the component framework in the first place, and
> if it would be difficult to move away from it.
>
> > Any changes / modernisation to the Rockchip MIPI driver look like it
> > will take more time than I have available to spend on this, so I'd
> > really like to see this patch land as it's a simple fix to an existing
> > working code path.
>
> So who volunteers for fixing it properly ? :-)
>
> I'll let Doug and Sam decide regarding mering this patch.

This thread seems to have gone silent.

I'm inclined to merge this patch (removing the "Fixes" tag) since it's
a one-line fix. While we want to encourage people to move to "the
future", it seems like it would be better to wait until someone is
trying to land something more intrusive than a 1-line fix before truly
forcing the issue.

I'll plan to merge the patch to drm-misc-next early next week assuming
there are no objections.

-Doug
