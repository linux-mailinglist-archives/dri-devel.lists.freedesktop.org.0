Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC16E9E20
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 23:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C159310ECEF;
	Thu, 20 Apr 2023 21:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004C310ECEF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 21:51:47 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1a6c5acf6ccso13229415ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682027507; x=1684619507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVE01ylZkiaFGup+LhU1TXOAFtn7Qpb50IDlJ/jgNDc=;
 b=r5QSxx7KROfLSvjDZ1attNdLGBbIm9pVYlB1kuCGkaOpXX+YY9XdQGLVyFse5Hkqx2
 e3NmozoV7tU7qSx1On2idzSnkMyz48GQ1if2bTVyySEiXj7sVowIoyS5gPtAfumTPhlQ
 BQChZ2rmvHPok1sieKW6qXHmMePkVJPgPMuMcuhdcu+J5SIT9+S0stRpV9qEKW05qrPY
 XpGNOauhzVNFtaM8GRvnqZ704XlfCiPVsghT7kft3FzZx+OpRfu38axGJ27sHtFCW0qy
 rFHHjY2vwVjNZRvHPA7lxI900DY5gd3/3JG1FTkqjPuOZQpaanRQEUTnJD18Fo3Ox7Ar
 eBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682027507; x=1684619507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVE01ylZkiaFGup+LhU1TXOAFtn7Qpb50IDlJ/jgNDc=;
 b=Moekve5hsyvRCGYMpRhvp89jVEXwWq+GQvXTIAXsOUWm6YyQlChaWORPtsH7XW1ggX
 9J5GeheNh0LladAId0Ks/rzgizH5SHRHKRHtEUeJhkgm+j96AsQUI5ZBJdnApRTX1mIX
 GTt4J04xwU+U91Hh4econog9EMeIQkxvUKcyjxwMFcRK1IS7iAV6nSZiLW0dsHgxNera
 ui1hUpx60vzwFAZ6D33G9+4XEQuIeph4fkCXCb53p4s/z/qDBN+o7S433/HjXxhaDF4H
 8RHsrEV3jz4eTQyLyHawXJNs3+tq63vi9O9OrJ5R4ssWnlkInK3tFON9ZBUdyZwhIO3m
 oBmg==
X-Gm-Message-State: AAQBX9dbHlRkcguPMv5hk1kqsjHVFIFWTzR/DYZxHW/GdH/nVWqxTodv
 Xddqhd+EJefjjvxnoY9DMEq61vYbiNykWKx4gkQ=
X-Google-Smtp-Source: AKy350ZmmeQF+mHZjkmjNw9SKtantBJ3NorHQzjJ4xVPb0uEfo7oV30t7YnZZbsWD3PmqKjJH5YbsDwLAbUCjEGDsi0=
X-Received: by 2002:a17:902:c3cd:b0:1a6:de48:c9b9 with SMTP id
 j13-20020a170902c3cd00b001a6de48c9b9mr2898495plj.47.1682027506996; Thu, 20
 Apr 2023 14:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
 <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
 <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
 <f42a2a11c1a2df4d773b61a449e8f4d5a9a010d1.camel@pengutronix.de>
 <CAHCN7x+bZHZHxYk=qC3QFS07kLO85w_rj1tOuX1Y3fJXekmvMQ@mail.gmail.com>
 <19d2c40180d0b9176e17aa6e91c1e7f36f77f626.camel@pengutronix.de>
In-Reply-To: <19d2c40180d0b9176e17aa6e91c1e7f36f77f626.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 20 Apr 2023 16:51:35 -0500
Message-ID: <CAHCN7x+HYmGoxZ107OdY1aJYtjNWB4p3fqJ1tGjOAK2eO356yA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 m.szyprowski@samsung.com, marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 8:43=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Am Donnerstag, dem 20.04.2023 um 08:24 -0500 schrieb Adam Ford:
> > On Thu, Apr 20, 2023 at 8:06=E2=80=AFAM Lucas Stach <l.stach@pengutroni=
x.de> wrote:
> > >
> > > Hi Adam,
> > >
> > > Am Mittwoch, dem 19.04.2023 um 05:47 -0500 schrieb Adam Ford:
> > > > On Mon, Apr 17, 2023 at 6:55=E2=80=AFAM Adam Ford <aford173@gmail.c=
om> wrote:
> > > > >
> > > > > On Mon, Apr 17, 2023 at 3:43=E2=80=AFAM Lucas Stach <l.stach@peng=
utronix.de> wrote:
> > > > > >
> > > > > > Hi Adam,
> > > > > >
> > > > > > Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
> > > > > > > If there is more than one lane, the HFP, HBP, and HSA is calc=
ulated in
> > > > > > > bytes/pixel, then they are divided amongst the different lane=
s with some
> > > > > > > additional overhead. This is necessary to achieve higher reso=
lutions while
> > > > > > > keeping the pixel clocks lower as the number of lanes increas=
e.
> > > > > > >
> > > > > >
> > > > > > In the testing I did to come up with my patch "drm: bridge: sam=
sung-
> > > > > > dsim: fix blanking packet size calculation" the number of lanes=
 didn't
> > > > > > make any difference. My testing might be flawed, as I could onl=
y
> > > > > > measure the blanking after translation from MIPI DSI to DPI, so=
 I'm
> > > > > > interested to know what others did here. How did you validate t=
he
> > > > > > blanking with your patch? Would you have a chance to test my pa=
tch and
> > > > > > see if it works or breaks in your setup?
> > > >
> > > > Lucas,
> > > >
> > > > I tried your patch instead of mine.  Yours is dependent on the
> > > > hs_clock being always set to the burst clock which is configured by
> > > > the device tree.  I unrolled a bit of my stuff and replaced it with
> > > > yours.  It worked at 1080p, but when I tried a few other resolution=
s,
> > > > they did not work.  I assume it's because the DSI clock is fixed an=
d
> > > > not changing based on the pixel clock.  In the version I did, I onl=
y
> > > > did that math when the lanes were > 1. In your patch, you divide by=
 8,
> > > > and in mine, I fetch the bits-per-pixel (which is 8) and I divide b=
y
> > > > that just in case the bpp ever changes from 8.  Overall,  I think o=
ur
> > > > patches basically do the same thing.
> > >
> > > The calculations in your and my patch are quite different. I'm not
> > > taking into account the number of lanes or the MIPI format. I'm basin=
g

I was taking the number of lanes into account in order to calculate
the clock rate, since 4-lanes can run slower.

> >
> > I was looking more at the division by 8 and the overhead correction of =
6.
> > This number 6 also appears in the NXP downstream kernel [1].  I know
> > Marek V had some concerns about that.
> >
> Yea, I don't fully remember the details about the overhead. Need to
> page that back in. The division by 8 in my patch is just to get from
> the bit to a byte clock, nothing to do with the MIPI format bits per
> channel or something like that.
>
> > > the blanking size purely on the ratio between MIPI DSI byte clock and
> > > the DPI interface clock. It's quite counter-intuitive that the host
> > > would scale the blanking to the number of lanes automatically, but
> > > still require the MIPI packet offset removed, but that's what my
> > > measurements showed to produce the correct blanking after translation
> > > to DPI by the TC358767 bridge chip.
> >
> > How many lanes is your DSI interface using?
> >
> When I did the measurements to come up with the patch, I varied the
> number of lanes between 1 and 4. Different number of lanes didn't make
> a difference. In fact trying to compensate for the number of lanes when
> calculating the blanking size to program into the controller lead to
> wildly wrong blanking on the DPI side of the external bridge.
>
> > >
> > > If you dynamically scale the HS clock, then you would need to input t=
he
> > > real used HS clock to the calculation in my patch, instead of the fix=
ed
> > > burst mode rate.
> >
> > I think what you're saying makes sense.
> >
> > The code I originally modeled this from was from the NXP downstream
> > kernel where they define the calculation as being in words [2]. I am
> > not saying the NXP code is perfect, but the NXP code works.  With this
> > series, my monitors are able to sync a bunch of different resolutions
> > from 1080p down to 640x480 and a bunch in between with various refresh
> > rates too. That was the goal of this series.
> >
> > Instead of just using your patch as-is, I will adapt yours to use the
> > scaled clock to see how it behaves and get back to you.
> >
>
> Thanks, that would be very much appreciated.

Lucas,

I took your patch and added a dsi state variable named "hs_clock"  to
keep track of the output of samsung_dsim_set_pll which should be the
active high-speed clock.

I then replaced one line in your code to reference the hs_clock
instead of the burst clock:

@@ -960,7 +962,7 @@ static void samsung_dsim_set_display_mode(struct
samsung_dsim *dsi)
        u32 reg;

        if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
+               int byte_clk_khz =3D dsi->hs_clock / 1000 / 8;
                int hfp =3D (m->hsync_start - m->hdisplay) *
byte_clk_khz / m->clock;

With that change, your patch works with the rest of my code, and I
think it's easier to read, and it doesn't involve recalculating the
clock speed each time since it's cached.  If you're OK with that, I'll
incorporate your code into V2 of my series, and I'll apply my changes
as a subsequent patch.  I hope to be able to send out V2 this weekend.

I would be curious to know frm Marek Szyprowski what the impact is on
the Samsung devices, if any.

adam

>
> I also don't assert that my calculation is perfect, as I also don't
> have any more information and needed to resort to observing the
> blanking after translation by the external bridge, so I hope we could
> get some better understanding of how things really work by checking
> what works for both our systems.
>
> >   I have
> > finished reworking the dynamic DPHY settings, and I've fixed up making
> > the PLL device tree optional. If your patch works, I'll drop my
> > calculation and just build off what you have to use the scaled HS
> > clock when I submit the V2 and I'll make sure I CC you.
> >
> Thanks, I'm open to re-do my measurements with your new patches.
>
> Regards,
> Lucas
>
> > adam
> >
> > [1] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/dr=
m/bridge/sec-dsim.c#L270
> > [2] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/dr=
m/bridge/sec-dsim.c#L914
> >
> > >
> > > Regards,
> > > Lucas
>
