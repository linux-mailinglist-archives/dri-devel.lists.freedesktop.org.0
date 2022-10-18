Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E841C60315D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 19:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734F710EF93;
	Tue, 18 Oct 2022 17:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9141910E8F6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 17:10:45 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a13so21527695edj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PE7HrKTmOBBTopGLNGFk1gT4U6V24A9+GOlSEia57W8=;
 b=TCNFju130wA7kdKUpmJYNw5GJFwL8lwyAoW2OcVyQOLbhB/JaqU0Z+SFSw6swAk/Mn
 CP7z4ialgWZUx0OJMoCwYZRQ+BLMx+1hIeY34as79Sj7G3KnWOSPcLk+mLClXuIqen22
 EwoC/tEEuX0sOhOumdG6qirLhJfG7qIoT+oCW1yZ9DoMCh2cqTBG60EzxDIfLX3vOifd
 BRd466Va09eU1z/snYBee8eMP1/5wYINhpHcg9gYQuohJa9My83KptPw75HZYn6w2aAX
 1KkphFW/NkB2vyRwcoDmjl0QkWtDxakASpNFcB2tVEDNfu+nG/FfvQstgscReHAEferT
 o4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PE7HrKTmOBBTopGLNGFk1gT4U6V24A9+GOlSEia57W8=;
 b=VDMkUX16cjQdQrRgLXSgJGjKYFzo6UZUBIMmrGfH/AlPZp5GpYOLmla/1kk4LLvUTg
 1h/Vo1qK7OttjktxIpopXn/jQxE8XJIhG0tz4f96k9j47FIL2Xqmi/tJGkq/FLXoU+yV
 zfJFNZTSYVNUZYMsmysLxR+0v2VyirKpzqeJEGrZ5wiAcxYujHhPGpUaW2F0/jD15h3y
 pVMypNpBsgcAOgVNAS92Mn7WgpNqhAK0T2jRVn6zhJPNzCKsRhiZ61NKC6uMn6Slhgge
 smIfSWxHsNAca8OiGsKzM4+fc15xahdGKMl1X6hmGKZAP3sDt0wi/UlGwR0ruVQu0bdn
 RuCQ==
X-Gm-Message-State: ACrzQf0SpHjaD//cZ3qhwpjsG8oel3/vtIyeRzCSGQRpkGT+5gQV9qL7
 40OOmJeZl9LgTugroIWceWxA8RYZDjQdAOmk7RSE0Q==
X-Google-Smtp-Source: AMsMyM6R7axz0/ADNbMlRlxqbO85iI4BIwpZxS03E7cro1/OEuAA6syavtg1R0nfUguBKXyNT7SYjbag0tVAqDqQlBU=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr3540890edb.86.1666113044025; Tue, 18
 Oct 2022 10:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAMty3ZAGX-tJyQCOrE3SYAD6EiGSexGfU1-Q3Ow294XOpxnY4w@mail.gmail.com>
 <CAPY8ntAsWkgC0oMsNm0DzzQ_AZRyG-jUjnUOP=q04humv7SDcw@mail.gmail.com>
 <CAMty3ZANdQvghZzdXcK1cKvmFVC5XPVFhUg11BGFHxK9VTdsyg@mail.gmail.com>
In-Reply-To: <CAMty3ZANdQvghZzdXcK1cKvmFVC5XPVFhUg11BGFHxK9VTdsyg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 18 Oct 2022 18:10:28 +0100
Message-ID: <CAPY8ntAG-kWS0fPrXsKVjn0--SatjWgPq2jvSgaUgT_4Ciy3mQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] drm/panel: Add prepare_upstream_first flag to
 drm_panel
To: Jagan Teki <jagan@amarulasolutions.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 andrzej.hajda@gmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

On Mon, 17 Oct 2022 at 03:44, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Dave,
>
> On Fri, Oct 7, 2022 at 6:26 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Jagan
> >
> > On Thu, 6 Oct 2022 at 15:25, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > On Fri, Mar 4, 2022 at 8:48 PM Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Mapping to the drm_bridge flag pre_enable_upstream_first,
> > > > add a new flag prepare_upstream_first to drm_panel to allow
> > > > the panel driver to request that the upstream bridge should
> > > > be pre_enabled before the panel prepare.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/panel.c |  3 +++
> > > >  include/drm/drm_panel.h        | 10 ++++++++++
> > > >  2 files changed, 13 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > > index 5be057575183..2ea08b3ba326 100644
> > > > --- a/drivers/gpu/drm/bridge/panel.c
> > > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > > @@ -234,6 +234,9 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> > > >         panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
> > > >         panel_bridge->bridge.type = connector_type;
> > > >
> > > > +       panel_bridge->bridge.pre_enable_upstream_first =
> > > > +                                               panel->prepare_upstream_first;
> > > > +
> > >
> > > panel_bridge is common for bridge users who used panel and those who
> > > might not need upstream first, so better to handle per bridge user
> > > whoever needs this.
> >
> > Sorry, I don't follow you.
>
> panel_bridge driver is a common bridge for drm_panel_bridge_add
> registered bridges. If we enable pre_enable_upstream_first globally in
> panel_bridge driver then it affects panes that don't require
> pre_enable first for that bridge chain. Hope you understand.

No, sorry, I'm still not getting your point.

It is not enabled globally.
If (and only if) the specific panel driver has set
prepare_upstream_first in the struct drm_panel passed to
drm_panel_add(), then that setting is replicated in the associated
struct drm_bridge pre_enable_upstream_first.

Can you give an example of where you see this being an issue?

You proposed handling this on a per bridge user basis? What exactly
are you calling a bridge user in that case? The DSI host (or
equivalent) source to the panel? Because the panel driver has no idea
it is being wrapped into a drm_bridge.
However that source device can't alter the bridge chain call order
(breaking the chain as Exynos and vc4 do does not work with the atomic
API in "entertaining" ways), and it has no knowledge of the behaviour
the attached panel wants, nor does it know that it's going through
panel_bridge.

As per my previous email, devm_drm_of_get_bridge is the only other
place in the callstack that has both the drm_panel and drm_bridge
handles. Does putting the assignment from drm_panel to drm_bridge in
there solve your concern?

Thanks.
  Dave
