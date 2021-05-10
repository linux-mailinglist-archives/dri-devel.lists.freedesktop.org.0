Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54033780B4
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 11:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B4B6E0E5;
	Mon, 10 May 2021 09:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC9C6E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:58:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h4so15916467wrt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A79oiLzY2ev0Vas9dqmhMeavf+nM1V+Mhc8bDQ7Vu4U=;
 b=DmT7neAPPRNvXL6W75uVkyrdIrX8KbLYtyvCQRTI3THJIGKEXhVeA3Ihjpb1P8iZ/Q
 JItStKj3AuaHgEtfhI4wACvIwi/qtxUW2+TD63HmVpVit2eSsV8P8n3mb0WhDRKq8mJH
 N7dtocLNc/QKeiHXjCXAQ+irUZJZikRiXjPbX4xD3vkjVOoyGUwsVfvHu7ZqhI8iCFe2
 0WPRUqI+VB6T8MBGcvYu6cHyBRF+8QcGhkjEe7mM0w+mcbhVJkt0Ei8yJG4c+iMJMZdV
 C3rHjF05LRTYfAWaIz5wUhu8Eg/PATku51Zp2CZ9PQbZ/dv/cXX07K07oUaF3jmVS8uq
 a2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A79oiLzY2ev0Vas9dqmhMeavf+nM1V+Mhc8bDQ7Vu4U=;
 b=dofUTlYdl1fNZMiBndTtJjcN5FP84VaH7n4Aen1OGCFQVckXyQYxy3rkkBWRobM7JZ
 pWWYnXDEYIvyBloxEc2/wwOOcyRWgzP0E5xEydz16+OiFch7PyrqODOm3hKgvEuME3ve
 Jf3ILYMkBdpuhuOsHH4lg/GsVG9St7dFHby1iOOOQR8iln0LLisfA93N4idL1yssLFQW
 gybTtrPxwcNat2XI1nl3ROjPPq+QHxrNDJkxdd1nf3HpE8oZHB2DdA3CpG6YrFiuyG0V
 G2XlgxJ+74emVz8r8ZOo+WRdomsXrb2+POBhQynD7rjtMuADWeCCR2jlpbFuM5qU7qSB
 tBoQ==
X-Gm-Message-State: AOAM532GgBN4sqtQ8a9aug6qQmROZmURDnKD4/wnS2bDoE9X8zfWRoCb
 QUOWXICr/e+GZo1P6/96sqUnAUaFNspOLy8PFLfewA==
X-Google-Smtp-Source: ABdhPJztTr8pZrMvORkb5tNpdx+6Glt1odfwme1w5ubgeViTZ1yr4zjPzswMFsl5uhPqQgGW7XeEpwHzyrpdKrA1Y4s=
X-Received: by 2002:a5d:4351:: with SMTP id u17mr29129599wrr.47.1620640730360; 
 Mon, 10 May 2021 02:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntCzu6=uBqRfQ+9QJWH-zqy0K9FD8XWdC8NZxJZiUBfYfg@mail.gmail.com>
 <8d2fbc9b-fb3e-aac9-566a-033c4bb218d7@denx.de>
In-Reply-To: <8d2fbc9b-fb3e-aac9-566a-033c4bb218d7@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 10 May 2021 10:58:33 +0100
Message-ID: <CAPY8ntDMJyUHvKn=4fXZK2tYTQ9Lj_QTY-zk_1h+oZ-fQ80E+w@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 8 May 2021 at 21:26, Marek Vasut <marex@denx.de> wrote:
>
> On 5/7/21 2:48 PM, Dave Stevenson wrote:
>
> [...]
>
> >> +static void sn65dsi83_enable(struct drm_bridge *bridge)
> >> +{
> >> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> >> +       unsigned int pval;
> >> +       u16 val;
> >> +       int ret;
> >> +
> >> +       /* Clear reset, disable PLL */
> >> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> >> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> >
> > Sorry, a further thread of discussion coming from the investigations
> > I've been involved with.
> >
> > You've powered up in pre_enable, and are sending the I2C writes in enable.
> >
> >>From the docs for drm_bridge_funcs->enable[1]
> >
> >   * The bridge can assume that the display pipe (i.e. clocks and timing
> >   * signals) feeding it is running when this callback is called. This
> >   * callback must enable the display link feeding the next bridge in the
> >   * chain if there is one.
> >
> > So video is running when enable is called, and the DSI data lanes may
> > be HS. (Someone correct me if that is an incorrect reading of the
> > text).
> >
> > The SN65DSI84 datasheet table 7-2 Initialization Sequence gives init
> > seq 8 as being "Change DSI data lanes to HS state and start DSI video
> > stream", AFTER all the I2C has been completed except reading back
> > registers and checking for errors.
> > With video running you don't fulfil the second part of init seq 2 "the
> > DSI data lanes MUST be driven to LP11 state"
> >
> > My investigations have been over delaying starting the DSI video
> > stream until after enable, but reading the descriptive text for enable
> > I believe the Pi is correct to be sending video at that point.
> > I guess there is some ambiguity as to whether the clock lane is going
> > to be in HS mode during pre_enable. On the Pi the PHY and clocks will
> > be enabled prior to pre_enable to allow for sending DSI commands
> > during pre_enable, but it may not be true on other platforms.
>
> You have to make sure the clock lane is running and in HS mode when
> configuring the DSI83, otherwise the internal DSI83 state machine won't
> be able to operate.

Indeed, but my reading of the documentation says that neither
pre_enable nor enable give you the state that you require.
You need a hook in the middle, an option to ask for clock lanes during
pre_enable or no video during enable, or an amendment to the docs over
the state during enable.

Having the data lanes in HS mode does appear to stop the DSI83
accepting the I2C setup commands.

  Dave
