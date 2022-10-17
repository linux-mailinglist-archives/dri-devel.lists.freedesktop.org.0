Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B983F60055E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 04:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5810EBFD;
	Mon, 17 Oct 2022 02:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CD110EBFA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 02:44:59 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 v40-20020a056830092800b00661e37421c2so2892021ott.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 19:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LmH89IUcaYlrwD88iPkBjg8x6KStQTFJ+TjkiaHza3U=;
 b=VwmXs9RpTvuZJwb1Jl08m2IDi1KhQGmNCXP+O/yrOWqg3ee21bbvSowi5nsY4sdwCb
 DSX5CktAytaykP6A+gXxkusNw+a7KycuXo4lyErN6VYPoa4hhzdDOnp+6lCTqXwqDzOY
 c4zrvDsxq5dScpiMZtjVaq01wGBLXUsG/aWyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmH89IUcaYlrwD88iPkBjg8x6KStQTFJ+TjkiaHza3U=;
 b=kqBn+wolwlY9Kft/47kT0kqvY6+hhSvUZlKQnm2ePAUmuu+cg3I15eE+S19KqUaW5W
 L4wvpC1Xogx2DSBk+Bt9rwPOh+lZoXoIm0n1DL41tstug1vCju7YHAWb8nJZDlRjCi7a
 WSNNuTELcwuyk9pzMKTzmHVFQ3PGK6YRpBqWbZUS5vkniUQKAMIBEVV4aI2XyzZZV2tk
 W+C1ZbiKZAvi0wKbmcMhkMRTExisSiVv9XosFQv1hmiR7CiNZJMfApyqA1NndYdrS3y3
 A/PpZO7KWqzzWztmKkISR/Y6xinp25GZnjwpr+G9ZSnjFzrfoog6ewN0selco8wwToNm
 ZfkA==
X-Gm-Message-State: ACrzQf2O0ta4v3wXYN+tUiWfyvIll3X+eXxnRagNpFD3sUBKOjBmAKln
 qOT+7P2D9K5gHV3hI9s28Zy2iTrtXkIi4qQvy9rwwA==
X-Google-Smtp-Source: AMsMyM75aLqtkFjdrbVLCThTPPdwNT4+ukwLG65czOZID3lYq4+gjL6XZmAP5Cksf+R0iSX+o2XXErxqtg5TInmsuQQ=
X-Received: by 2002:a9d:7002:0:b0:661:caa8:5fab with SMTP id
 k2-20020a9d7002000000b00661caa85fabmr4137560otj.274.1665974698323; Sun, 16
 Oct 2022 19:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAMty3ZAGX-tJyQCOrE3SYAD6EiGSexGfU1-Q3Ow294XOpxnY4w@mail.gmail.com>
 <CAPY8ntAsWkgC0oMsNm0DzzQ_AZRyG-jUjnUOP=q04humv7SDcw@mail.gmail.com>
In-Reply-To: <CAPY8ntAsWkgC0oMsNm0DzzQ_AZRyG-jUjnUOP=q04humv7SDcw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Oct 2022 08:14:47 +0530
Message-ID: <CAMty3ZANdQvghZzdXcK1cKvmFVC5XPVFhUg11BGFHxK9VTdsyg@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] drm/panel: Add prepare_upstream_first flag to
 drm_panel
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

Hi Dave,

On Fri, Oct 7, 2022 at 6:26 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan
>
> On Thu, 6 Oct 2022 at 15:25, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > On Fri, Mar 4, 2022 at 8:48 PM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Mapping to the drm_bridge flag pre_enable_upstream_first,
> > > add a new flag prepare_upstream_first to drm_panel to allow
> > > the panel driver to request that the upstream bridge should
> > > be pre_enabled before the panel prepare.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c |  3 +++
> > >  include/drm/drm_panel.h        | 10 ++++++++++
> > >  2 files changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > index 5be057575183..2ea08b3ba326 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -234,6 +234,9 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> > >         panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
> > >         panel_bridge->bridge.type = connector_type;
> > >
> > > +       panel_bridge->bridge.pre_enable_upstream_first =
> > > +                                               panel->prepare_upstream_first;
> > > +
> >
> > panel_bridge is common for bridge users who used panel and those who
> > might not need upstream first, so better to handle per bridge user
> > whoever needs this.
>
> Sorry, I don't follow you.

panel_bridge driver is a common bridge for drm_panel_bridge_add
registered bridges. If we enable pre_enable_upstream_first globally in
panel_bridge driver then it affects panes that don't require
pre_enable first for that bridge chain. Hope you understand.

Thanks,
Jagan.
