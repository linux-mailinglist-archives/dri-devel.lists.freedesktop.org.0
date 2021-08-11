Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D772E3E99C9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 22:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9B689177;
	Wed, 11 Aug 2021 20:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41E28951B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 20:39:49 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so4921197oth.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=0Nc4dbze1UiRTeZtZjRzQEhvFahux2f34ScECRTRd14=;
 b=RaTKJI59CC3c94oNFMBO58g1w0ZmdBqkPUdbPlK6zt9Gkak5R/qNpzAFj48JK131Bo
 +AzvfX4Z7IWCJsztRlZJLgQvT7Sy7FtQ21+0f62yj6dVuhUw4j7KhTFD9PtiiyP5kjLn
 P990wx6of1F/4W/uG+IiXIEqqF0qdHFyWnk3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=0Nc4dbze1UiRTeZtZjRzQEhvFahux2f34ScECRTRd14=;
 b=X1cttzSwga7sMUkCr+pwy2JLfKmN7mk0WnIl6fedbeH6QtKXvQ7z9n1n4GiAMl8nWJ
 FnU3qRItVLLf0Zn8tOMrIwnXFc5piVgVx183W+me2RTF4OP3dW7GU4FFGSxglLT7xCOy
 z0K5+39fwUd6Nz1vLXuebFU5824qsRLJl2XzrPdP43uPyaZ47mog7e0mYiWu4FvvMU0t
 yIGPIaqgv8b3cFHtIHfJb34HYzM3pk5ic0KyA2dVhZ2tOKHxfTlWVCOGA+3XbF+rd+V/
 D+lf/Stj8aUDmDSmgAegu6xr5YM5XkJATmKSTgpRcWbj+spW+mVvqz9MTdW5cLmBkt3/
 lZlg==
X-Gm-Message-State: AOAM531u8VkWlwhHqemlAcBNsY9+IRNTEmr5P0boKk9rms/WNryt5fCB
 gJf6pmUJU/XLR9Q8w86zzAVZdGnltO38NDt5fmdGIw==
X-Google-Smtp-Source: ABdhPJyimh1HTNJBFXXZHBBvKyYLkEHxV+CSvaHtv2RWM31z94v7y8gMhzWxEOHfwUnawB+tq2ZdiW77ofdWu+RJ9H0=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr628380otq.233.1628714389030; 
 Wed, 11 Aug 2021 13:39:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 13:39:48 -0700
MIME-Version: 1.0
In-Reply-To: <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
 <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com>
 <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 13:39:48 -0700
Message-ID: <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
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

Quoting Rob Clark (2021-08-11 09:20:30)
> On Wed, Aug 11, 2021 at 5:15 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Stephen,
> >
> > On Tue, Aug 10, 2021 at 10:26:33PM -0700, Stephen Boyd wrote:
> > > Quoting Laurent Pinchart (2021-06-23 17:03:02)
> > > > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > > > let the DRM bridge helpers handle chaining of operations.
> > > >
> > > > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > > > requires all components in the display pipeline to be represented by
> > > > bridges.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > >
> > > With this patch applied I get two eDP devices on Lazor sc7180 (it is the
> > > arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
> > > looking for more info). As far as I can tell, we should only have one
> > > eDP device on the board, for the bridge.
> > >
> > > localhost ~ # ls -l /sys/class/drm/card1-eDP*
> > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
> > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
> > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
> > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
> >
> > Indeed.
> >
> > Does the display driver use the DRM connector bridge helper and
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR on that platform ?
> >
>
> There haven't been any recent changes about how we attach the bridge,
> it doesn't pass DRM_BRIDGE_ATTACH_NO_CONNECTOR.. tbh I've not been
> having time to follow too closely the recent changes with bridge stuff
> myself.
>
> But now with this patch we have both the ti bridge and the panel
> bridge creating a connector..  removing the connector created by the
> ti bridge "fixes" things, but not sure if that would break something
> on other platforms.  I guess there should now always be a panel
> bridge, so removing ti_sn_bridge_connector_init() would be a sane
> thing to do?
>

So this patch works. We don't want to make the connector in this driver
for the next bridge because this driver is making the connector. I guess
eventually we'll drop this flag when this driver stops making the
connector here?

---8<---
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index cd0fccdd8dfd..a8d4818484aa 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -741,7 +741,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,

 	/* Attach the next bridge */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_dsi_detach;
