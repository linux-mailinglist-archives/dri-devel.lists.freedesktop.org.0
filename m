Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BCF5885AC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 04:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98AB8D162;
	Wed,  3 Aug 2022 02:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24428D162
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 02:14:27 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gb36so3408787ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 19:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5PfzgdkwKk8vgPVTM9VmmwC+o/EB6JpB4y6rlRNyThM=;
 b=WCDL7VdJKYamc04OZNM6Emi960roLI1Wg4lQOCL0k/GRrVSiXxLCr80L/Ph/kx8A6p
 4eGb8Pr9BLTO0N5mIr8IRNe3C3QdpoG5mPykccOhVJxOXIpQBuCuFFsIg2qUtqFxV68C
 SYyxbuwZFgo5g+0TtO0f+UCDzwQX/QJMReXFaQirKgGcvwmINj0WIuDd4AQvXGMlUEmR
 BvuG7/BQa3OKK8m3Wm4XuesWDIF2w7qTRMoTnqiEnGIt99frrPl/f4QXsz2L5L/1bK0j
 3vlR2t3JVUHmA2aISWQl9g+XofaUjZeNzB2pY3QqvOw5G9Wjs2HptoleurtoOm3b0ZCV
 yIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5PfzgdkwKk8vgPVTM9VmmwC+o/EB6JpB4y6rlRNyThM=;
 b=ss6w4EqWn+AntT5YoExU90Dka+A9YX8DS0WtOUorNTl1KIMNbxR8Onog8ykuxpKWJM
 irjG/Ix9GcMlnX/XeQjiaKVxFuCoboUxEVniabfBwm796uZr/ctm90gnpK/Df9G6Kzxl
 ruM2QLKYhwGxnUKut/dTOmn5W8+IssSVyVKjF9urUPbGlgM//i882c+S1eLE8J0Szbi6
 B8lEqIC+FQL36A8X+JMibGVa93ZklHWhWZbe3YAfgISW7R7SR2cG/UUUE0HK+8rNnJfB
 AwlgPfrsUXP0/UtplNZwtEv08FxpkbbPjRtrmsMJ3Hrd7nEAk3sGhS9VpTHIiZSt3BhQ
 0R5Q==
X-Gm-Message-State: ACgBeo0+qyXX3pv5reFPqoozrZz6+n8Tmy4BmcGoyZT8q+x9q2oChOLY
 1TG009VlM5kC3FbqNBKRO0L7vqV97n9zjhEHw+M=
X-Google-Smtp-Source: AA6agR4LB+/dYGmRzWqiOBOhzTd/1zOEZINeD17iFmHGwgfAGxP61hT2stDKtnxOlK9eu6dglwUMUEXjaXegPG5nVMU=
X-Received: by 2002:a17:907:a428:b0:730:aee3:2da7 with SMTP id
 sg40-20020a170907a42800b00730aee32da7mr828489ejc.613.1659492866192; Tue, 02
 Aug 2022 19:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
 <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
 <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
 <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
 <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
In-Reply-To: <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 2 Aug 2022 21:14:15 -0500
Message-ID: <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
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

On Tue, Aug 2, 2022 at 8:51 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Aug 2, 2022 at 7:13 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Tue, Aug 2, 2022 at 3:08 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > Hi Adam, Fabio,
> > >
> > > On 22-08-01, Adam Ford wrote:
> > > > On Mon, Aug 1, 2022 at 8:53 PM Fabio Estevam <festevam@gmail.com> wrote:
> > > > >
> > > > > On Mon, Aug 1, 2022 at 10:39 PM Adam Ford <aford173@gmail.com> wrote:
> > > > >
> > > > > > I managed to get my HDMI output working. I had the lanes set to 2
> > > > > > instead of 4.  Once I switched to 4-lanes, the monitor came up in
> > > > > > 1080p.  I haven't yet been able to get other modes to work.
> > > > >
> > > > > Ok, good. On another thread, you mentioned that you were also trying
> > > > > to get LVDS to work via SN65DSI83.
> > > > >
> > > > > Does LVDS work for you on this branch?
> > > >
> > > > I haven't tried with Marek's latest suggestion.  In the other thread
> > > > he mentioned a burst mode and setting the DSI speeds to higher
> > > > frequencies, but the patch he had didn't look like it would apply
> > > > cleanly, so I will need to dig into that a bit further.
> > >
> > > Can you provide me a link to this thread?
> >
> > Sure,
> >
> > https://www.spinics.net/lists/dri-devel/msg358301.html
> >
> > >
> > > > Since my company doesn't really ship the LVDS displays with the kits,
> > > > the HDMI is the default video, so I've been focusing on it.
> > > >
> > > > To answer Marco's question, I was able to revert "MLK-21958-13:
> > > > drm/bridge: adv7511: Limit supported clocks" and still get a display
> > > > at 1080p, but all the other resolutions I tried appear to come up
> > > > blank.
> > >
> > > Cool so now you have the same state as we are.
> >
> > I have a couple patches applied to mine which mimic some of the stuff
> > that NXP did.  Since I have access to a programmer manual, i was able
> > to confirm some of the 7535 specific stuff and the low-refresh rate
> > changes in their kernel appear appropriate and I also created a second
> > table of default settings for the 7535 and if the type is set
> > properly, i'll use the newer table instead of the older one. If anyone
> > wants any of these patches, I can certainly share them, but I am not
> > certain they make any difference.
> >
> > There are a few other items in the programmer manual that I want to
> > attempt to implement once I have a chance to further review the
> > document.
> >
> > >
> > > I think that the most important one is the blanking calc. Can you try to
> > > revert "drm/bridge: adv7511: Repair bus_flags and bus_format" and check
> > > if you can get a output still? Also something to try would be to disable
> > > the internal timing generator by specifying
> > > 'adi,disable-timing-generator'. Also if you have an oscilloscope for
>
> I did some reading about the internal timing generator.  It appears
> that it's required when video formats use fractional bytes, and it's
> preconfigured to run at 720p by default, but registers 28h through 37h
> configure it for other video modes.
I think there may still be some issues with the DSIM since some of the
clock frequencies are set in the device tree.

From what I can tell, the pixel rate is calculated based on the
burst-clock-frequency and that generates a byte clock.  For 891000000,
the byte clock is 111375000.

Modetest timings for 1080p show:

index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
  #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
flags: nhsync, nvsync; type: driver


When looking at modetest, there is a clock for 1080p which appears to be 148500.
111375000/148500 = 750.

The rest of the entries in my table do not divide evenly.  I don;t
know if that explains the lack of display, but it's something to note.
It seems to me that instead of fixing the
samsung,burst-clock-frequency to 891000000, we should make the desired
PLL related to the desired pixel clock so it divides evenly.

Looking at NXP's kernel, I also noticed that their esc_prescaler is
based on the byte clock divided by 20MHz.  With some small code
changes to get the PLL based on the desired pixel clock instead of
hard-coded,  I was able to set

samsung,burst-clock-frequency = <1500000000>;
samsung,esc-clock-frequency = <20000000>;

With these settings and the above mentioned code changes, 1080p still
appears, however when attempting other modes, the display still fails
to load.  I also noticed that the phy ref clock is set to 27MHz
instead of NXP's 12MHz.  I attempted to play with that setting, but I
couldn't get 1080p to work again, so I backed it out.

Maybe I am headed in the wrong direction, but I'm going to examine the
P/M/S calculation of the timing on NXP's kernel to see how the DSIM in
this code compares.

If someone who understands the interactions between these different
components has suggestions, I'm willing to run some experiments.

adam



>
> Are you thinking the imx8mm DSI generator would do it better?
>
> > > such frequencies you can check the hdmi clk-lane. I noticed that this is
> > > sometimes wrong.
> >
> > I am doing this from my home office as a side project, so I don't have
> > a scope, but I can try to revert the other patch and try to disable
> > the internal timing generator when I get home tonight.  I'll report my
> > findings.
> >
> > >
> > > Regards,
> > >   Marco
> > >
> > > > I didn't try every one.  With that revert, more options come
> > > > available, but 1440x900 and 800x600 were options I tried
> > > > unsuccessfullyl.
> > >
> > > >
> > > > adam
> > > >
