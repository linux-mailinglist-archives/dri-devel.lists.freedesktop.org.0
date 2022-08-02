Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57988587C1F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 14:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040408BD73;
	Tue,  2 Aug 2022 12:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7768B8BD75
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 12:14:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a7so12602609ejp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kHhoRx/ka0EpIFy/pWjymvtNViMFXpw0odHJay66ZOg=;
 b=GJ8JCx8PY/wZG4ScSuHIpNRuNQ7+kailZr5JV6d8dX/R+9ZS6bnt+zOZMq8NH5s4Hf
 VaVooVH6fHbWCuuOnq9FkUffehnCj2j8n5Jb5CpV6IDa5AB6oQLmTgR0Vz6+bRPBDOR7
 jEIKJAoS1vmyL5kd+XSdtQXaW/Fb2E1HRoLTuU77+8QOUORY4LI+9eO5lNGS+0HDtnZG
 RuRZq/mID4yDKGuHEx0K8tqfG2IqWaTTgg+LnD9QiSGcSB+/MlMSZ+zAD62hK0o7KoPr
 wZJzUGU02MlRX6pqn31w5Frew+XMoctXAd9QS5ER+55PEeWBuDOzHsP3o3R/9/yPAar7
 Dn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kHhoRx/ka0EpIFy/pWjymvtNViMFXpw0odHJay66ZOg=;
 b=Baag8llyxXYoIX24CtZ9NQ9czIEMbfJbn442XR8V3I4FLg3gh5AxYNyvaRiOT8FyzC
 NWzHSOm0euCNonXt1TJ3De6HlAOKgPsbxkpHgKLrPX9wrA3kCibiouqt9o+r201X8i3d
 UqsoAVIiHpv/OnWm8EGnucnsEmRlBvK8wZSVH1Sp8sfAdUOuIHRIoy5k0zl1sYMk26xD
 KZAkoM6B/fbMdCdEpNt79DJ17GQ41Te1jOh0oaBXnpYhrjtvTDAWj/d6V1t2lpsmJJE8
 kOLlzdRSy8KnZ+TKre0ANfnoT5K/SKC8dJFw6Heg18GJ2QVXBHOfgb9n4/+PxsXnq3fH
 pa1A==
X-Gm-Message-State: AJIora99v/KxmV8D3puOJ1oSloyZ/oMyaZW1/wj88sKtN/vpVVwZJCZi
 giBCD9FVS2Yb6RD6sDOA6xgVyGMsIHM0CM/b2Oc=
X-Google-Smtp-Source: AGRyM1vKkOzYSW6yOGHLgZ1aOUI4fb6KwfcFbkingnFNMdQCStDY9kzKwIwM2piTY0aQ3dL2oJmsiq7aj/DcsuruQpM=
X-Received: by 2002:a17:907:7241:b0:72b:347b:17a1 with SMTP id
 ds1-20020a170907724100b0072b347b17a1mr16607892ejc.32.1659442446751; Tue, 02
 Aug 2022 05:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
 <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
 <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
 <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
 <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
In-Reply-To: <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 2 Aug 2022 07:13:55 -0500
Message-ID: <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Marco Felsch <m.felsch@pengutronix.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, robert.chiras@nxp.com,
 laurentiu.palcu@nxp.com, NXP Linux Team <linux-imx@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 2, 2022 at 3:08 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi Adam, Fabio,
>
> On 22-08-01, Adam Ford wrote:
> > On Mon, Aug 1, 2022 at 8:53 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > On Mon, Aug 1, 2022 at 10:39 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > > I managed to get my HDMI output working. I had the lanes set to 2
> > > > instead of 4.  Once I switched to 4-lanes, the monitor came up in
> > > > 1080p.  I haven't yet been able to get other modes to work.
> > >
> > > Ok, good. On another thread, you mentioned that you were also trying
> > > to get LVDS to work via SN65DSI83.
> > >
> > > Does LVDS work for you on this branch?
> >
> > I haven't tried with Marek's latest suggestion.  In the other thread
> > he mentioned a burst mode and setting the DSI speeds to higher
> > frequencies, but the patch he had didn't look like it would apply
> > cleanly, so I will need to dig into that a bit further.
>
> Can you provide me a link to this thread?

Sure,

https://www.spinics.net/lists/dri-devel/msg358301.html

>
> > Since my company doesn't really ship the LVDS displays with the kits,
> > the HDMI is the default video, so I've been focusing on it.
> >
> > To answer Marco's question, I was able to revert "MLK-21958-13:
> > drm/bridge: adv7511: Limit supported clocks" and still get a display
> > at 1080p, but all the other resolutions I tried appear to come up
> > blank.
>
> Cool so now you have the same state as we are.

I have a couple patches applied to mine which mimic some of the stuff
that NXP did.  Since I have access to a programmer manual, i was able
to confirm some of the 7535 specific stuff and the low-refresh rate
changes in their kernel appear appropriate and I also created a second
table of default settings for the 7535 and if the type is set
properly, i'll use the newer table instead of the older one. If anyone
wants any of these patches, I can certainly share them, but I am not
certain they make any difference.

There are a few other items in the programmer manual that I want to
attempt to implement once I have a chance to further review the
document.

>
> I think that the most important one is the blanking calc. Can you try to
> revert "drm/bridge: adv7511: Repair bus_flags and bus_format" and check
> if you can get a output still? Also something to try would be to disable
> the internal timing generator by specifying
> 'adi,disable-timing-generator'. Also if you have an oscilloscope for
> such frequencies you can check the hdmi clk-lane. I noticed that this is
> sometimes wrong.

I am doing this from my home office as a side project, so I don't have
a scope, but I can try to revert the other patch and try to disable
the internal timing generator when I get home tonight.  I'll report my
findings.

>
> Regards,
>   Marco
>
> > I didn't try every one.  With that revert, more options come
> > available, but 1440x900 and 800x600 were options I tried
> > unsuccessfullyl.
>
> >
> > adam
> >
