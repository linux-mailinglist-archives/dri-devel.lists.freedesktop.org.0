Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8FA3B241D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 01:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A5F6E98E;
	Wed, 23 Jun 2021 23:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228ED6E98E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 23:51:26 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id c23so9766243qkc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fiNrfVW4OkS2oRuAQGtv3n1k6FsYY6hgbuTNk8Jiq1Y=;
 b=Hzy2hTa57ImT+jIAndTOvOlNBzjqNS2aDF071yZj/iYidxQX4MPutW4n2ct6cTxJaV
 hQ0myn00i3hPqUM/L9YQNXogeO3ormYbQIJoy33KBTCBB/r3OybDaqLWkVKR8ximv883
 pQg1ulsv73O1tEV5NtnQAnOJadD/9tGgQHj1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fiNrfVW4OkS2oRuAQGtv3n1k6FsYY6hgbuTNk8Jiq1Y=;
 b=q4EdjE8ggr5vKLVkyiq290ye/0w3CPOG2bYSQ5ZsSUH9sHgWokReA4KZ1MGBzUIr7g
 G6SCX+12iy95AerlKv/dq1zE98KZEHC748tfWRoDS7zc0yhcL7aiVAT0ecQ1oAzSC0XW
 J1dG2R/RWuwk4D6CQb8jz9zD8lKcxkl7tj62Ufz0a7DlZOZLdKlLZGUdbo1SqvsyA1XM
 GhwIrfcB6wVaIyFbI5KBAHaTkaNSuirBtuB1UO8hL+P56yan5Fk0VlUVeyZgzknPg5cZ
 O8+Em6+BgEjeJ8O45oFKm5dEtVPeBtLtuq6TMfprQ8+FPbtQlDrLjZqi+AbxktyQvGcC
 oKTw==
X-Gm-Message-State: AOAM533tvaxH7cDjzL+jIYYeX2cChqaI6+cadLYDf8OVIO+vTeXmwJOt
 KnPOxwuMUgAm1BaomBPd6BGXhnzsGEe8FA==
X-Google-Smtp-Source: ABdhPJwGlgggnjJxq3oOZBxi5CaJTtjugX9ayM/QSB419/aiaXQfdUyQbI+lFXIC0s2KfioHZ+8F1Q==
X-Received: by 2002:a37:2712:: with SMTP id n18mr2682041qkn.435.1624492285137; 
 Wed, 23 Jun 2021 16:51:25 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
 [209.85.222.170])
 by smtp.gmail.com with ESMTPSA id x145sm1095145qkb.119.2021.06.23.16.51.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 16:51:24 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id c138so9828814qkg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:51:24 -0700 (PDT)
X-Received: by 2002:a25:bcb:: with SMTP id 194mr1037713ybl.32.1624492283992;
 Wed, 23 Jun 2021 16:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
 <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
In-Reply-To: <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Jun 2021 16:51:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
Message-ID: <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug
 detection
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 23, 2021 at 4:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > > @@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > >
> > >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> > >         pdata->bridge.of_node = client->dev.of_node;
> > > -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT)
> >
> > Checking for "no_hpd" here is not the right test IIUC. You want to
> > check for eDP vs. DP (AKA whether a panel is downstream of you or a
> > connector). Specifically if downstream of you is a panel then (I
> > believe) HPD won't assert until you turn on the panel and you won't
> > turn on the panel (which happens in pre_enable, right?) until HPD
> > fires, so you've got a chicken-and-egg problem. If downstream of you
> > is a connector, though, then by definition HPD has to just work
> > without pre_enable running so then you're OK.
>
> Agreed. It's even more true now that your rework has landed, as in the
> eDP case EDID is handled by the panel driver. I'll rework this.
>
> Should I also condition setting HPD_DISABLE to the presence of a panel
> then ? I could drop of_property_read_bool() and set
>
>         pdata->no_hpd = !!panel;
>
> > I guess then you'd need to figure out what to do if someone wants to
> > use "HPD" on eDP. Do you need to put a polling loop in pre_enable
> > then? Or you could just punt not support this case until someone needs
> > it.
>
> I think I'll stop short of saving the world this time, yes :-) We'll see
> what to do when this case arises.

How about as a compromise you still call of_property_read_bool() but
add some type of warning in the logs if someone didn't set "no-hpd"
but they have a panel?


> > > +                         | DRM_BRIDGE_OP_EDID;
> >
> > IMO somewhere in here if HPD is being used like this you should throw
> > in a call to pm_runtime_get_sync(). I guess in your solution the
> > regulators (for the bridge, not the panel) and enable pin are just
> > left on all the time,
>
> Correct, on my development board the SN65DSI86 is on all the time, I
> can't control that.
>
> > but plausibly someone might want to build a
> > system to use HPD and also have the enable pin and/or regulators
> > controlled by this driver, right?
>
> True. DRM doesn't make this very easy, as, as far as I can tell, there's
> no standard infrastructure for userspace to register an interest in HPD
> that could be notified to bridges. I think it should be fixable, but
> it's out of scope for this series :-) Should I still add a
> pm_runtime_get_sync() at probe time, or leave this to be addressed by
> someone who will need to implement power control ?

IMO if you've detected you're running in DP mode you should add the
pm_runtime_get_sync() in probe to keep it powered all the time and
that seems the simplest. Technically I guess that's not really
required since you're polling and you could power off between polls,
but then you'd have to re-init a bunch of your state each time you
polled too. If you ever transitioned to using an IRQ for HPD then
you'd have to keep it always powered anyway.

-Doug
