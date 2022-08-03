Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88981588D67
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 15:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A7414A361;
	Wed,  3 Aug 2022 13:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087718A824
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 13:41:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r4so13786642edi.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G1ZD0h2YWrR0hMjVozSrbot3VwSQIRL5ULo1ojHt/wI=;
 b=pQXBP9zB/5FoJoNLS/7/ZY55/FGlmxrPg/TLdHOBr63hmDFhK5qhq4im/D7R9m2qqm
 6SgfKoPXBurhnCZ2DbbKJyxsioz7A9niypOjNU46BgcwsIilqTIJUuWFfLtoqAF34+Ks
 BZGVVB8nca+7awkw7PhHa30On+19lUmhOhE5ZT1yvd1dSE2ECleSdEBs7aHkk5FpFDdS
 m1LeaGSylWpmIhDeNq4rriuNpVNhc7/EYQumlueInxlCE4Geb3e1gwdFMOuG7hBhm/O7
 fSOAhKDenBg6/eaGfcqBwFk7l1gx+chgePmp2xKQlCeTque5Vn2MV1UHzU0njHtd9ba2
 9ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G1ZD0h2YWrR0hMjVozSrbot3VwSQIRL5ULo1ojHt/wI=;
 b=t2Di7sGnaGh20vhDqtS2/a8FnX4//tdr0LRHmATk2eDRQM/b1BUEnEz1KUdzLefnTx
 5YJfclV0RChKDlTz6OGqK66pIaWHX+6c15MLuLCOJkj/H7m9cbuzLwDTZA/fDFdfMQMZ
 wkAhoFizmVfIDZHE/oaXgmOHGUGoc3BK+tE7c1xmFGtJv7UR0jKa2QdzcB+FL3IJqde5
 B9aX9Rel9Cu8FaPIiZqgjtmoPZ4wbYNE2WPTmGi6zoxhbo3ehUGEzbkoIAwcTZ3bv7Ee
 oOEa/h6TDnblgXS/Aa+Vm1H+8v1i05R7k6YSMnKAYEsFiDS4AvgJ6sx3SCv1radJITYq
 DNZw==
X-Gm-Message-State: AJIora/+HV/3qAD4CTXEJIznE1Jhbm9DKaI+K/+divGbFZpeSY+lpgtY
 W5XIKl/yMQJPCzDFLD9EmatnSM3A/BZOqvuGBGx3rA==
X-Google-Smtp-Source: AGRyM1seWScXiWZMavg3EsgpzdbrT3+jpm6LSsu2M8qVNr3eC/2rjrG3Fxr0Mrrn6er3AkGl4oLgu7SJU7bTicpn3K8=
X-Received: by 2002:aa7:d60b:0:b0:43c:f7ab:3c8f with SMTP id
 c11-20020aa7d60b000000b0043cf7ab3c8fmr25516672edr.6.1659534095310; Wed, 03
 Aug 2022 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
 <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
 <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
 <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
 <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <CAHCN7x+HSPJpYYDgV_F91ZsPHW9Uwze8KRAqWE-XAyp5yzB9Hw@mail.gmail.com>
In-Reply-To: <CAHCN7x+HSPJpYYDgV_F91ZsPHW9Uwze8KRAqWE-XAyp5yzB9Hw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 3 Aug 2022 14:41:18 +0100
Message-ID: <CAPY8ntCeUXRqNVyxU7ey6P99pZ3XAXcVHL65bdb3f0qbcK+rBA@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, robert.chiras@nxp.com,
 NXP Linux Team <linux-imx@nxp.com>, laurentiu.palcu@nxp.com,
 Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Aug 2022 at 13:31, Adam Ford <aford173@gmail.com> wrote:
>
> On Wed, Aug 3, 2022 at 7:17 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Adam
> >
> > On Wed, 3 Aug 2022 at 12:03, Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Wed, Aug 3, 2022 at 1:20 AM Marco Felsch <m.felsch@pengutronix.de>=
 wrote:
> > > >
> > > > On 22-08-02, Adam Ford wrote:
> > > >
> > > > ...
> > > >
> > > > > > I did some reading about the internal timing generator.  It app=
ears
> > > > > > that it's required when video formats use fractional bytes, and=
 it's
> > > > > > preconfigured to run at 720p by default, but registers 28h thro=
ugh 37h
> > > > > > configure it for other video modes.
> > > > >
> > > > > I think there may still be some issues with the DSIM since some o=
f the
> > > > > clock frequencies are set in the device tree.
> > > > >
> > > > > From what I can tell, the pixel rate is calculated based on the
> > > >
> > > > By pixel rate you mean the HDMI pixel rate from the ADV? If so then=
 yes.
> > > > The ADV has an divider which is already configured by the driver bu=
t
> > > > meaningless since the driver is lacking of setting the "manual-divi=
der"
> > > > bit within the same register.
> > >
> > > I was thinking about the pixel clock from the DSI to the ADV.  I did
> > > see the manual-divider bit was missing.  I tried enabling that bit,
> > > but it didn't appear to make much difference.
> > > >
> > > > > burst-clock-frequency and that generates a byte clock.  For 89100=
0000,
> > > > > the byte clock is 111375000.
> > > >
> > > > The burst-clock-frequency is the hs-clk and DDR. So the MIPI-DSI cl=
ock
> > > > is burst-clock-frequency/2 which is in your case: 891000000/2 =3D
> > > > 445500000. This clock is than divided by 3 within the ADV and you g=
et
> > > > your 148500000 pixel clock. This divide by 3 is detected automatica=
lly
> > > > by the ADV due to the missing bit (see above).
> > > >
> > > > > Modetest timings for 1080p show:
> > > > >
> > > > > index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
> > > > >   #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 1485=
00
> > > > > flags: nhsync, nvsync; type: driver
> > > > >
> > > > >
> > > > > When looking at modetest, there is a clock for 1080p which appear=
s to be 148500.
> > > > > 111375000/148500 =3D 750.
> > > >
> > > > Please see above.
> > > >
> > > > > The rest of the entries in my table do not divide evenly.  I don;=
t
> > > > > know if that explains the lack of display, but it's something to =
note.
> > > > > It seems to me that instead of fixing the
> > > > > samsung,burst-clock-frequency to 891000000, we should make the de=
sired
> > > > > PLL related to the desired pixel clock so it divides evenly.
> > > >
> > > > Please see above.
> > > >
> > > > > Looking at NXP's kernel, I also noticed that their esc_prescaler =
is
> > > > > based on the byte clock divided by 20MHz.  With some small code
> > > > > changes to get the PLL based on the desired pixel clock instead o=
f
> > > > > hard-coded,  I was able to set
> > > > >
> > > > > samsung,burst-clock-frequency =3D <1500000000>;
> > > >
> > > > This is not correct since the burst-clock-freq. specifies the hs-cl=
ock
> > > > for the data lanes (see above).
> > >
> > > But I don't think the clock should be fixed. I think it should vary a=
s
> > > the resolution changes.  From what I can tell, NXP's DSI code doesn't
> > > hard code this value, but it does appear to cap it at 1.5G.  I did
> > > soom looking into the NXP frequency calculation and it is capable of
> > > adjusting resolutions to some extent and from what I can see the
> > > 891MHz clock is only set when 1080p.  At 720p, thier kernel shows the
> > > output frequency at  445.5 MHz.  The way the DSIM is currently
> > > configured, it's fixed at 891MHz, so I don't expect the output feedin=
g
> > > the adv7535 to be correct for the different resolutions.
> > >
> > >
> > > >
> > > > > samsung,esc-clock-frequency =3D <20000000>;
> > > >
> > > > This is correct, we also use a esc-clock of 20MHz.
> > > >
> > > > > With these settings and the above mentioned code changes, 1080p s=
till
> > > > > appears, however when attempting other modes, the display still f=
ails
> > > > > to load.  I also noticed that the phy ref clock is set to 27MHz
> > > > > instead of NXP's 12MHz.
> > > >
> > > > That's interesting, I didn't noticed that NXP uses 12 MHz as refclo=
ck
> > > > but I don't think that this is the problem. Since we have other
> > > > converter chips using the bridge driver and they work fine. I still
> > > > think that the main problem is within the ADV driver.
> > >
> > > Do the other converter chips work fine at different resolutions?
> > >
> > > >
> > > > > I attempted to play with that setting, but I couldn't get 1080p t=
o
> > > > > work again, so I backed it out.
> > > > >
> > > > > Maybe I am headed in the wrong direction, but I'm going to examin=
e the
> > > > > P/M/S calculation of the timing on NXP's kernel to see how the DS=
IM in
> > > > > this code compares.
> > > >
> > > > I think the pms values are fine.
> > >
> > > I compared the P/M/S values between this driver and NXP's and they
> > > calculate different values of PMS when running at 1080P.
> > > NXP @ 1080p:
> > > fout =3D 891000, fin =3D 12000, m =3D 297, p =3D 2, s =3D 1, best_del=
ta =3D 0
> > >
> > > This kernel @ 1080p:
> > >
> > > PLL freq 891000000, (p 3, m 99, s 0)
> > >
> > > at 720P, the NXP Kernel
> > > fout =3D 445500, fin =3D 12000, m =3D 297, p =3D 2, s =3D 2, best_del=
ta =3D 0
> > > (working)
> > >
> > > at 720P, this kernel:
> > > PLL freq 891000000, (p 3, m 99, s 0)
> > > hs_clk =3D 891000000, byte_clk =3D 111375000, esc_clk =3D 18562500
> > > (not working)
> > >
> > >
> > > >
> > > > > If someone who understands the interactions between these differe=
nt
> > > > > components has suggestions, I'm willing to run some experiments.
> > > >
> > > > Did managed to get access to the ADV7535 programming guide? This is=
 the
> > > > black box here. Let me check if I can provide you a link with our r=
epo
> > > > so you can test our current DSIM state if you want.
> > >
> > > I do have access to the programming guide, but it's under NDA, but
> > > I'll try to answer questions if I can.
> >
> > Not meaning to butt in, but I have datasheets for ADV7533 and 7535
> > from previously looking at these chips.
>
> Thanks for the feedback.
>
> > Mine fairly plainly states:
> > "The DSI receiver input supports DSI video mode operation only, and
> > specifically, only supports nonburst mode with sync pulses".
> > Non-burst mode meaning that the DSI pixel rate MUST be the same as the
> > HDMI pixel rate.
>
> Mine also states the DSI source needs to provide correct video timing
> with start and stop sync packets.
>
> If I remember correctly, it seemed like Marek V wanted the hard coded
> samsung,burst-clock-frequency to go away so the clock frequency could
> be set dynamically.

I've never worked with Exynos or imx8, but my view would be that
samsung,burst-clock-frequency should only be used if
MIPI_DSI_MODE_VIDEO_BURST is set in the mode_flags (it isn't for
adv7533/5).
Without that flag the DSI link frequency should be running at the rate
defined by the mode clock, number of lanes, bpp, etc.

From the DSI spec (v 1.1 section 8.11.1):
"Non-Burst Mode with Sync Pulses =E2=80=93 enables the peripheral to
accurately reconstruct original video timing, including sync pulse
widths."
"RGB pixel packets are time-compressed, leaving more time during a
scan line for LP mode (saving power) or for multiplexing other
transmissions onto the DSI link."
How can the peripheral reconstruct the video timing off a quirky link frequ=
ency?

Unless the Exynos DSIM_CONFIG_REG register bit DSIM_BURST_MODE [1]
reconfigures the clock setup of the DSI block, then I don't see how
the Exynos driver can follow the DSI spec in that regard.

Hope that helps.

  Dave

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/exynos/e=
xynos_drm_dsi.c#L803

> I have attempted to do some of this work based on
> what I am seeing in the NXP kernel, and I get get my monitor to sync
> at some resolutions, but the screen is usually all green or all blue,
> so it's not really a success.  The clock part appears to be good
> enough to make the monitor see some sort of signal, so I am going to
> investigate the calculation of the rest of the video timings to see if
> I can fix the color issue.
>
> > Section 6.1.1 "DSI Input Modes" of adv7533_hardware_user_s_guide is
> > even more explicit about the requirement of DSI timing matching
> >
> > The NXP kernel switching down to an hs_clk of 445.5MHz would therefore
> > be correct for 720p operation.
> >
> > If you do program the manual DSI divider register to allow a DSI pixel
> > rate of 148.5MHz vs HDMI pixel rate of 74.25MHz, you'd be relying on
> > the ADV753x having at least a half-line FIFO between DSI rx and HDMI
> > tx to compensate for the differing data rates. I see no reference to
> > such, and I'd be surprised if it was more than a half dozen pixels to
> > compensate for the jitter in the cases where the internal timing
> > generator is mandatory due to fractional bytes.
>
> Thanks Dave!
>
> adam
>
> >
> >   Dave
> >
> > > adam
> > > >
> > > > Regards,
> > > >   Marco
