Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1FA4F3438
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA9010E90A;
	Tue,  5 Apr 2022 13:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428DD10E911
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:25:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bh17so26698790ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hlvhRtrbYAkZ4RW6N8x4lHYBrbADIlZPAmoHdYXBywQ=;
 b=MptVvcEQ2l85hd8VSHtZiQH8ZT9YB/PxebeLp5/xLuquEmopZaZsewmHKYAxhhbB9Q
 JRgPJP0ncab5QujkP0zn07Bzzb9Ca+WMiWaLONEU2i8cgi/hjAlLHfFUGdsFnHyk79Qf
 rv69eWfZLVGgdQ6ifL1P0AeKL+ap43oWr2PikE1e1ojtBdp2jajA/bkVB6nVHEZ5wz0S
 cSAmav0qtSJ0ecYQqZt0mJF/F7mJVPLHB6GOkZu3u9I48BU/RGVQfdkjfyBK7ykeYl/d
 ZyjkYOkbZqy/uIyqgQNZJ1SU6xnY35Ivvqg2C7ZXcE5hjekdzvlsVlseBhCJ1jfeSrSo
 /c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hlvhRtrbYAkZ4RW6N8x4lHYBrbADIlZPAmoHdYXBywQ=;
 b=C7Ew4YRVkWHxTNzVcRDWJYpRS8yoDd0F9MjBdcvPake8NzScLc9Oeu4FqIkSjTa9tb
 6vyoXL4VJBtC3XjpwPOwbr+K3seO07iKvRde/aYpMUjUtDWFrRmYHdLxepMa6MD737Rp
 VyfKRKmEaO2T6xPLgQ22Zp7AiCQEGtRdKW4ppND0XPd7SWRg21IvGUcpXF+39/dTu9Ke
 /kH6at1sS4YU6h5IXV5ib8hvadHQ33Oz/DySr2AtwRMYLKTInlQ85PZl/bq0qcZXaHfP
 GOeWo4dxgwdEp7NoUaufTX/ghUXacu41K/WetmHJjeCorq6rwsLDlu0UuxY1M/QBKiFB
 vgLA==
X-Gm-Message-State: AOAM532mB6AaScGX48kRO4WklAUckSPU5akGc+zNbm2Uy6i4rvSiwjwu
 gGuXLZMsO/atiqatFj/9dsXwa41LRCmm88W0+l04cg==
X-Google-Smtp-Source: ABdhPJwjzTydAfcHpcX0EwKn8vsrAwHeo+2mpUAWwGsrSALt5An0jZV7ti9GjnsOxkxp8IGG5cOGeO05r7r9SMaQGbI=
X-Received: by 2002:a17:907:1624:b0:6db:8caa:d71 with SMTP id
 hb36-20020a170907162400b006db8caa0d71mr3612137ejc.723.1649165150641; Tue, 05
 Apr 2022 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
 <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
 <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
In-Reply-To: <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Apr 2022 14:25:34 +0100
Message-ID: <CAPY8ntC5RQ4pq=Bf5Z+Vi-NhD6boGnEixjporJSKgR=AaUrEpw@mail.gmail.com>
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
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
Cc: Marek Vasut <marex@denx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 at 14:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Tue, Apr 05, 2022 at 01:00:28PM +0100, Dave Stevenson wrote:
> > On Tue, 5 Apr 2022 at 12:42, Laurent Pinchart wrote:
> > > On Sun, Feb 13, 2022 at 03:26:48AM +0100, Marek Vasut wrote:
> > > > In rare cases, the bridge may not start up correctly, which usually
> > > > leads to no display output. In case this happens, warn about it in
> > > > the kernel log.
> > >
> > > Do you know what this is caused by ? It's a bit annoying to add a 10+ms
> > > delay at start time just to be notified of rare cases.
> >
> > The datasheet [1] section 7.4.2 Initialization Sequence states in step 2
> > "After power is applied and stable, the DSI CLK lanes MUST be in HS
> > state and the DSI data lanes MUST be driven
> > to LP11 state"
> > Data lanes shouldn't go to HS until step 8 after the DSI83 has been configured.
> >
> > Configuration from the driver is being done from atomic_enable,
> > therefore the data lanes are likely in HS mode and sending video, not
> > LP11.
> >
> > Deviate from the specified initialisation sequence at your peril!
> >
> > The SN65DSI8[3|4|5] is one of the DSI devices that I'd been looking at
> > with the DSI ordering patches [2] so that we could initialise it in
> > the way specified in the datasheet. I've had no responses to v2 of
> > those patches though.
>
> Sounds like I need to review that :-) It's still in my queue, I'll try
> to push it to the top.
>
> Do you think this patch could then be reverted ?

If we can initialise the DSI host before the bridge for the
pre_enable, then all the configuration moves to the atomic_pre_enable
and there should be no need to have the delay.

I can't 100% guarantee that, but one of the folks on the Pi forums is
using [1] which does that, and is reporting it working well. (He's
also using the DSI85 to take 2 DSI links and drive 2 LVDS single link
panels)

  Dave

[1] https://github.com/6by9/linux/commits/rpi-5.15.y-sn65dsi8x

> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> > [2] https://patchwork.freedesktop.org/series/100252/#rev2
> >
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Robert Foss <robert.foss@linaro.org>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > index 19daaddd29a41..1d7c154ea1d79 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > @@ -488,6 +488,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> > > >       /* Clear all errors that got asserted during initialization. */
> > > >       regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> > > >       regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> > > > +
> > > > +     usleep_range(10000, 12000);
> > > > +     regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> > > > +     if (pval)
> > > > +             dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
> > > >  }
> > > >
> > > >  static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
>
> --
> Regards,
>
> Laurent Pinchart
