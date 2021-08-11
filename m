Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA923E99DA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 22:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F31A6E1B4;
	Wed, 11 Aug 2021 20:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD866E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 20:47:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r7so4948851wrs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xkYKW1aYIWHZ7gLFcO7kToTpFwBuB09fXFKaH6RjOzY=;
 b=P7aF6vq8kBrIoi62jLzHWiyPVjgxLqJHCgY82rrIERX2GhJ2tBIoQTZGIgH4CJKiUf
 rnsWqUu/OmKcZGmti0RRNHjFAOAOTGJB5s7OtKd/HrJ5wbhZ0fB0eoB8A7LcZ6ARV0Tw
 pK3+dGmZYqXN4Jp+TiA0yK5VCjhGYr2fr6WXElDwB0Ux6gTzg7Ag3Sw/68lC/9GH3ZJh
 fkiqLcWa0Nknf6ZE7T75kEQXIo5lCsrpxLuIRT4QHjqmIEuS7vDxqwAe7TJuIluu/IsT
 LTrCWiaBHemlfs/DeDe7+lLJmfZpdbJ0HuvBHpqNNOjKfanVQW1jMG3a0T4XwqcysN+8
 B2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xkYKW1aYIWHZ7gLFcO7kToTpFwBuB09fXFKaH6RjOzY=;
 b=t9X3u4xLDzWtPI4vriDEmSw2f226WoUHzuBpfzYdSuUiDqC1RrFsVZ3wivR2ezfCk3
 KThTiMrM9cJ4Sf5AQQF5zG/l8182NK3CB5dHcX6rnMXAU6L9x8Q+O8p1y5qCG2yk2sKa
 X9PX6Z5xQ9oQgJ/hbGNMFUCWZ5ZPoaOCDLmnIBUizdJ01f2IgNgWCleX0eGFEeToo5DC
 u5/yNNGmcjUKq7CM7YuydIOc2M4AHovruV4OZYlEzG9GzZI/ViG15yLvQfygdeRjUboD
 8OWFa1lo4D7hXVqSxFGePnJWvuLVlLz5V4NpJlNQ1DokWmhTdNN1Z0lRWK7GaoNqa8qr
 L55A==
X-Gm-Message-State: AOAM533BfFOGObPYIjm9AvXwrCZIygYbN2BD+8VyAzXI7q+fqwnW9tYL
 9hkTHSDLdjTnSeChfFbV+Aj14iagDnQLA/8Uvfo=
X-Google-Smtp-Source: ABdhPJw9CIgtsJLgu45cy9t9XnlzP3E8grnHn9hXS61kbJw9a221HmJeQHlx9moYCweYDGCBebImyxu5h7/CiUDOr+U=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr285330wrm.327.1628714833663;
 Wed, 11 Aug 2021 13:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
 <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com>
 <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
 <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
In-Reply-To: <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 Aug 2021 13:51:28 -0700
Message-ID: <CAF6AEGs=uOC7Fb0sHJG+iR=d7ORnRhRn-K_ogrKDwzuN=9qAhA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
To: Stephen Boyd <swboyd@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 11, 2021 at 1:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-08-11 09:20:30)
> > On Wed, Aug 11, 2021 at 5:15 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Stephen,
> > >
> > > On Tue, Aug 10, 2021 at 10:26:33PM -0700, Stephen Boyd wrote:
> > > > Quoting Laurent Pinchart (2021-06-23 17:03:02)
> > > > > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > > > > let the DRM bridge helpers handle chaining of operations.
> > > > >
> > > > > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > > > > requires all components in the display pipeline to be represented by
> > > > > bridges.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > ---
> > > >
> > > > With this patch applied I get two eDP devices on Lazor sc7180 (it is the
> > > > arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
> > > > looking for more info). As far as I can tell, we should only have one
> > > > eDP device on the board, for the bridge.
> > > >
> > > > localhost ~ # ls -l /sys/class/drm/card1-eDP*
> > > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
> > > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
> > > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
> > > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
> > >
> > > Indeed.
> > >
> > > Does the display driver use the DRM connector bridge helper and
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR on that platform ?
> > >
> >
> > There haven't been any recent changes about how we attach the bridge,
> > it doesn't pass DRM_BRIDGE_ATTACH_NO_CONNECTOR.. tbh I've not been
> > having time to follow too closely the recent changes with bridge stuff
> > myself.
> >
> > But now with this patch we have both the ti bridge and the panel
> > bridge creating a connector..  removing the connector created by the
> > ti bridge "fixes" things, but not sure if that would break something
> > on other platforms.  I guess there should now always be a panel
> > bridge, so removing ti_sn_bridge_connector_init() would be a sane
> > thing to do?
> >
>
> So this patch works. We don't want to make the connector in this driver
> for the next bridge because this driver is making the connector. I guess
> eventually we'll drop this flag when this driver stops making the
> connector here?
>
> ---8<---
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index cd0fccdd8dfd..a8d4818484aa 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -741,7 +741,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>
>         /* Attach the next bridge */
>         ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> -                               &pdata->bridge, flags);
> +                               &pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>         if (ret < 0)
>                 goto err_dsi_detach;


I kinda think *all* bridges that create a connector (whether optional
or not) should OR in NO_CONNECTOR when attaching the next downstream
bridge.. since you never want multiple connectors

BR,
-R
