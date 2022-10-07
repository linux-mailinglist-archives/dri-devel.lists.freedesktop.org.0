Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6F5F785F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1722A10E1B5;
	Fri,  7 Oct 2022 12:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436F010E1B5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:56:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id m15so6864995edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/tmXk9EUY4SYPSyGQ5gArFjplMmcqtNIJY8WXfCp0cc=;
 b=DpGkhS5bMe7YjFrVWVLi5FrUcqPn+W6SRd3klFkhkZ2MPaYxdstHd8LngHr57mYKu4
 nTSlLgVrpQvPsu/K3cDBKV+cL3WL1++Q11dL/MPv7SXw7ALtPKIw7BmnDz/be4xOHEzs
 nAyDbqBtG15S1CgetubuuzDbDfXEHyJFV37JFT81twgrPPhZk9oWh9pybwOFxiZQ3Gvu
 QmXJLSiiDPxKnJB+oqgB1KOymeyd+gODPvol/5VYoVjPklG3koDVqCP4PNVIQ8cgRuK7
 /qyTc8fL80VVFetMmIq9335iegolmXyapPgg+PuRaxzheGgmGMsDdiYkK4nWRtUgn3uK
 TEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tmXk9EUY4SYPSyGQ5gArFjplMmcqtNIJY8WXfCp0cc=;
 b=JGurn24fnE3nuY1+L9V+9llLngrM1w/5FUZvs0bxyzEV01nYwWkLEYw5ju06VeZ5Ah
 5COZCWXOw4f5vAuUu+2KkDSbkItO/kbyTIV/LJpTYZRduCV85ugIxa08B7Qthu9EgYYE
 eLLyb+Mmz+yvE+rQg6g5zAzTGt/t9qdZDMpW16GitS4OxOaXkKlO7DvtBoKFlMyvMO0N
 vBw8cMG3jslb3MyZcc6aQYiR+Wz535DOXuNI8d/xs/9OggXS2EvPQSmuOGqqqhoDDOlM
 bddjbFTsIiQgwWvhaQAF3n0GIdOo9JLITEr+Jj13muUq0efwYJKEiEK+n58vomLCPhZG
 Qqxg==
X-Gm-Message-State: ACrzQf3hoBNX7xAjCu7GNkms4DVFcrKSqgzGcgsXKv4WsADPste4zFuJ
 wHL4bwBc60Rg6tOuURZj8SLIZhJmvUcoFd+0pPYY8Q==
X-Google-Smtp-Source: AMsMyM65oZsoWr2XjP5QuQ4OaoRQUM6hx/fpPnQi0vlvp2juG7KwXME/SoK554ysM3+AlEFnO68CcXyIU4kImvvOV0w=
X-Received: by 2002:a05:6402:3552:b0:451:2037:639e with SMTP id
 f18-20020a056402355200b004512037639emr4495452edd.136.1665147360784; Fri, 07
 Oct 2022 05:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAMty3ZAGX-tJyQCOrE3SYAD6EiGSexGfU1-Q3Ow294XOpxnY4w@mail.gmail.com>
In-Reply-To: <CAMty3ZAGX-tJyQCOrE3SYAD6EiGSexGfU1-Q3Ow294XOpxnY4w@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 7 Oct 2022 13:55:43 +0100
Message-ID: <CAPY8ntAsWkgC0oMsNm0DzzQ_AZRyG-jUjnUOP=q04humv7SDcw@mail.gmail.com>
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

On Thu, 6 Oct 2022 at 15:25, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Mar 4, 2022 at 8:48 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Mapping to the drm_bridge flag pre_enable_upstream_first,
> > add a new flag prepare_upstream_first to drm_panel to allow
> > the panel driver to request that the upstream bridge should
> > be pre_enabled before the panel prepare.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/gpu/drm/bridge/panel.c |  3 +++
> >  include/drm/drm_panel.h        | 10 ++++++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index 5be057575183..2ea08b3ba326 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -234,6 +234,9 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> >         panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
> >         panel_bridge->bridge.type = connector_type;
> >
> > +       panel_bridge->bridge.pre_enable_upstream_first =
> > +                                               panel->prepare_upstream_first;
> > +
>
> panel_bridge is common for bridge users who used panel and those who
> might not need upstream first, so better to handle per bridge user
> whoever needs this.

Sorry, I don't follow you.

prepare_upstream_first is coming from a struct drm_panel, generally
for DSI panels are still panel drivers. An example would be Ilitek
ILI9881C.
It's a feature of the panel that would dictate that they want their
source initialised first.

The source bridge for the panel will call devm_drm_of_get_bridge,
which will call devm_drm_panel_bridge_add. Nothing outside of those
two functions have both the panel and bridge handles, so are you
proposing that the assignment should be done in devm_drm_of_get_bridge
[1]? That would leave the behaviour of drivers calling
drm_panel_bridge_add(_typed) directly as they were.

Thanks.
  Dave

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/panel.c#L418
