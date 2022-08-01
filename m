Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DC586EBA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 18:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C94113B3C;
	Mon,  1 Aug 2022 16:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF8011AD45
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 16:38:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r4so6763570edi.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=nU1GnPIuVRRBbVgvjKUW8zO6vMC9UQ9iLWl6VrggR6M=;
 b=LRJm3enBK8X/1DDHZ8wd8ir49jVGJ71j3SmUg+hxZ9dlqwbPe6h4VckjyfVv7kHw85
 XwrZOOklZ/risaIPDo5ji97z06bxIOSlQQ6NV8uAvw9FM72yWwpNfHzymv9Z8LaA7YSV
 fnv85kXex1FS76q/lcsOlgjeUR0tPAbSve4A7rW0d9aw1kl8WUCeteCVdCcXPZ6apO0o
 yK1Y2zliHok6+WZeMK1G8ZQULO2WYl2GlAmuumT6MDJPpphjJnmo5dT/f2rkbUxZyZ7n
 UhaVtwaKl515uHSTKhsM5F2do9agh74bMjHEd083TV9Sxy/LkHdmdSBI7omZ27v8wrB5
 zmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nU1GnPIuVRRBbVgvjKUW8zO6vMC9UQ9iLWl6VrggR6M=;
 b=s3Gu20r8iC7TBLv3kZo20jB7Cy85X6SHKIO9v1OvLNTXPvCF68t3a0wK4Fp35gn13U
 ZyN44o1mRBtHPWd9CjQICm8EM9TNVK0USsqRyFe1yzD007WO1q37JL9zIrh7z8B5QZ+S
 ZZmNUgLKg7nN4f0jCDVpGLok5TZ73B7CAAK9dW2fv3NyBpGvzqGHFHDoJ0RexvcPK4l/
 W4PI9yJvMyFYW4iDbdPZMrgoS+WIAxW1Mgv/8C26CkJs81vfRpktjGrWMuJdfpfgOeK8
 wn5luCeD0Vdrsfozcr2qq/dweoZxm3gEaeshV9NBwShZ8r+PJ8oLAdghYyyH/LAXr5pu
 I65w==
X-Gm-Message-State: AJIora/hBYOoP+J5O58c5lBqncOA76DiIP+SbdLinAl50rsKRx3fLES4
 Ztm4YaVHMt05S6hRh12js9enEC/nghcKh1jlONM=
X-Google-Smtp-Source: AGRyM1vLIoWT+glKyXibgKyptZbO+7IYEqyk7if6CMncD99NPJSb3B50Qv4I3vhWlTPNi9kBF94tPj6z+0VVKTgy4uY=
X-Received: by 2002:aa7:da92:0:b0:43c:c5af:d5c9 with SMTP id
 q18-20020aa7da92000000b0043cc5afd5c9mr16808106eds.10.1659371922963; Mon, 01
 Aug 2022 09:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220801131113.182487-1-marex@denx.de>
 <CAPY8ntCowWODtQtSHoPkjL2_XjVQCW8Fduutt3rYAZ=e9MZT_A@mail.gmail.com>
 <f1edd1a3-05d3-2476-f678-298aa145b71e@denx.de>
In-Reply-To: <f1edd1a3-05d3-2476-f678-298aa145b71e@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 1 Aug 2022 11:38:31 -0500
Message-ID: <CAHCN7x+_f4SpXZfdEbdb=v8bYmwHtZU1R1MH7TjAfbky=+qWfw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 11:05 AM Marek Vasut <marex@denx.de> wrote:
>
> On 8/1/22 16:55, Dave Stevenson wrote:
> > Hi Marek
>
> Hi,
>
> > On Mon, 1 Aug 2022 at 14:12, Marek Vasut <marex@denx.de> wrote:
> >>
> >> Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
> >> adjust DSI input frequency calculations such that they expect the DSI host
> >> to configure HS clock according to hs_rate.
> >
> > I think this falls into another of the areas that is lacking in the DSI support.
> > hs_rate is defined as the *maximum* lane frequency in high speed
> > mode[1]. As documented there is no obligation on the DSI host to
> > choose this specific rate, just some frequency below it and above or
> > equal to that required by the pixel clock. At a system level, the link
> > frequency is often prescribed for EMC purposes.
>
> The reduced upper limit could likely be defined by a DT property, but
> that's not hard to add.
>
> > The issue is then that the SN65DSI83 is configured to use the DSI
> > clock lane as the source for the PLL generating the LVDS clock,
> > therefore with no route for the DSI peripheral to query the link
> > frequency chosen by the host, you're stuck.
>
> At least making the host pick the highest supported frequency means we
> have a well defined link frequency which either is accepted by both ends
> or not at all, instead of the current guesswork on both ends, bridge and
> host.
>
> Regarding reduction of the maximum hs_rate, see above, probably use a DT
> property. Regarding check for hs_rate below minimum possible rate,
> likely something the DSI host should do based on desired mode .
>
> If you are looking for some frequency negotiation starter, look at:
> [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host HS clock
> from DSI bridge
>
> > SN65DSI83 also supports non-burst mode (as currently), so how would
> > this be configured now?
> > Does MIPI_DSI_MODE_VIDEO_BURST [2] oblige the DSI host to run in burst
> > mode, or say that burst mode is supported by the peripheral?
>
> My understanding is that it is the former -- if the flag is set, the DSI
> host must operate the device in burst mode.
>
> > What if
> > your DSI host doesn't support burst mode and it is optional on your
> > peripheral?
>
> The limit still applies. In the sync pulses mode, you can still run the
> link at high frequency, it's just that the DSI data lanes won't go into
> LP mode between bursts of data, they would stuff the link with NOPs
> instead, as far as I can tell.
>
> > I raised these questions and others at [3], but largely got no real answers.
> >
> >
> > The patch does exactly what you describe and has value, but without
> > definition in the frameworks of exactly how burst mode must be
> > implemented by the DSI host, I would say that it's going to cause
> > issues.
> > I am aware of users of your driver with the Raspberry Pi, but your
> > expectation isn't currently valid on the Pi as there is no definition
> > of the correct thing for the host to do.
>
> This patch actually helped me deal with stability issues on MX8M . Of

I have a board with the SN65DSI83 and I have been testing Jagan's DSIM
patch series and I noticed the SN65DSI83  throws a PLL timeout error.
What kind of stability issues were you seeing?   I'll try to pull in
this patch, and I'm happy to test and reply with 'Tested-by' if it
works.

adam

> course, the DSIM driver has to handle the case where bridge provides
> hs_rate and configure its PLL accordingly. That's a two-liner patch.
