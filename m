Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D796EA977
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114B110E319;
	Fri, 21 Apr 2023 11:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30EB10E319
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:42:05 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a6bc48aec8so17371755ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 04:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682077325; x=1684669325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+QzXOowBk6zMAvVRHRGMTmto6TQPv6FzbyS50fs0HGw=;
 b=mzbKHm0khz7tDrCEjsD2ozL+ocWl2vnK2eEKOD5Xnas4zNqxdMfIGRc5I6eAXIV2Ck
 D1VIHErtUzhHk5bB8TRw/QdGWP8V3PCXVvSYcZzxDUiD/GsJcNpfsIzhpdf4beV1R+Da
 VD2ZqnF/SnbPdNUIpQBXvIrbxF/ebD/+mmb435cpCxcV7Cb2b7mr5lg95SG8Tt5hvLwp
 ifGNLZZQJoGgjGJst8QI+RHM0fVlgD111kJpVzS1eh6mcT3W/FqWBsWEtxBm3FqYCv6a
 ZTcVA83HUGU/3VtZMmLVuPP1uiFYcI/nuCdR8kXLmBXuk1qNOvVRC1iobXQs+soOecbn
 Rjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682077325; x=1684669325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QzXOowBk6zMAvVRHRGMTmto6TQPv6FzbyS50fs0HGw=;
 b=l1SeS4qfgN+cEbrSbx2XdY45l7mjNYsJgHsBeXw4Q6ACQo8onN2SXjp3H1f4dKGtLj
 gncOsaokejl5Q2xa8IsSDE+aoU9kTxuWUK76llbjB5unRnpVy6LXsPQwFA1Ix7KQCrIA
 I+m0jXQILrEk7SqqXwg2fdXIWW/Q1LFFJ01SOfPT/HO8G3wz5sOkfeTIR3VhIN4HymSC
 +kcN7DqPuyLj1gkI9giKAYo80k+66+vazeSs47a7P3OnanMmIBnE0OjkSZg/q5qbOaMa
 TEFXAUZMBdqSet50r1zYiysM/GnuWB/by2Uy7fbZCxklh32RHJgvJW2z1i7DH5F/V2lq
 9fqQ==
X-Gm-Message-State: AAQBX9dGMxl07HLUtuHbFb7vUbjJO1BWQoiSOeUzuOUaxhrb/+KJgBDq
 Zr877mHc7G3t0eGMGkW05LebMLZuMwQ8J0P80Mo=
X-Google-Smtp-Source: AKy350YeDB/pe50NcsvczdvPWP5Yftu6/H9TF0P1oFddZ/bS8uMvJSuHQK5TxWWa7pqU17OFm4oumJeeTi+i/NuKQFQ=
X-Received: by 2002:a17:902:d48b:b0:1a6:5fa2:aa50 with SMTP id
 c11-20020a170902d48b00b001a65fa2aa50mr6649243plg.1.1682077324621; Fri, 21 Apr
 2023 04:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
 <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
 <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
 <f42a2a11c1a2df4d773b61a449e8f4d5a9a010d1.camel@pengutronix.de>
 <CAHCN7x+bZHZHxYk=qC3QFS07kLO85w_rj1tOuX1Y3fJXekmvMQ@mail.gmail.com>
 <19d2c40180d0b9176e17aa6e91c1e7f36f77f626.camel@pengutronix.de>
 <CAHCN7x+HYmGoxZ107OdY1aJYtjNWB4p3fqJ1tGjOAK2eO356yA@mail.gmail.com>
 <CGME20230421084034eucas1p14b1bcf83a86f7a2a828eac2d42eb1449@eucas1p1.samsung.com>
 <56a805b4a74f620f7948f57d416b135effb6e52d.camel@pengutronix.de>
 <8cdb2f0d-f6a2-a04c-2cf4-c0762a47c050@samsung.com>
In-Reply-To: <8cdb2f0d-f6a2-a04c-2cf4-c0762a47c050@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 21 Apr 2023 06:41:53 -0500
Message-ID: <CAHCN7xKydLHoYMJiWyLgmaH5zzA9OSxAma0fHh9vsUEx36ME-A@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, marex@denx.de,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 6:28=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 21.04.2023 10:40, Lucas Stach wrote:
> > Am Donnerstag, dem 20.04.2023 um 16:51 -0500 schrieb Adam Ford:
> >> On Thu, Apr 20, 2023 at 8:43=E2=80=AFAM Lucas Stach <l.stach@pengutron=
ix.de> wrote:
> >>> Am Donnerstag, dem 20.04.2023 um 08:24 -0500 schrieb Adam Ford:
> >>>> On Thu, Apr 20, 2023 at 8:06=E2=80=AFAM Lucas Stach <l.stach@pengutr=
onix.de> wrote:
> >>>>> Hi Adam,
> >>>>>
> >>>>> Am Mittwoch, dem 19.04.2023 um 05:47 -0500 schrieb Adam Ford:
> >>>>>> On Mon, Apr 17, 2023 at 6:55=E2=80=AFAM Adam Ford <aford173@gmail.=
com> wrote:
> >>>>>>> On Mon, Apr 17, 2023 at 3:43=E2=80=AFAM Lucas Stach <l.stach@peng=
utronix.de> wrote:
> >>>>>>>> Hi Adam,
> >>>>>>>>
> >>>>>>>> Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
> >>>>>>>>> If there is more than one lane, the HFP, HBP, and HSA is calcul=
ated in
> >>>>>>>>> bytes/pixel, then they are divided amongst the different lanes =
with some
> >>>>>>>>> additional overhead. This is necessary to achieve higher resolu=
tions while
> >>>>>>>>> keeping the pixel clocks lower as the number of lanes increase.
> >>>>>>>>>
> >>>>>>>> In the testing I did to come up with my patch "drm: bridge: sams=
ung-
> >>>>>>>> dsim: fix blanking packet size calculation" the number of lanes =
didn't
> >>>>>>>> make any difference. My testing might be flawed, as I could only
> >>>>>>>> measure the blanking after translation from MIPI DSI to DPI, so =
I'm
> >>>>>>>> interested to know what others did here. How did you validate th=
e
> >>>>>>>> blanking with your patch? Would you have a chance to test my pat=
ch and
> >>>>>>>> see if it works or breaks in your setup?
> >>>>>> Lucas,
> >>>>>>
> >>>>>> I tried your patch instead of mine.  Yours is dependent on the
> >>>>>> hs_clock being always set to the burst clock which is configured b=
y
> >>>>>> the device tree.  I unrolled a bit of my stuff and replaced it wit=
h
> >>>>>> yours.  It worked at 1080p, but when I tried a few other resolutio=
ns,
> >>>>>> they did not work.  I assume it's because the DSI clock is fixed a=
nd
> >>>>>> not changing based on the pixel clock.  In the version I did, I on=
ly
> >>>>>> did that math when the lanes were > 1. In your patch, you divide b=
y 8,
> >>>>>> and in mine, I fetch the bits-per-pixel (which is 8) and I divide =
by
> >>>>>> that just in case the bpp ever changes from 8.  Overall,  I think =
our
> >>>>>> patches basically do the same thing.
> >>>>> The calculations in your and my patch are quite different. I'm not
> >>>>> taking into account the number of lanes or the MIPI format. I'm bas=
ing
> >> I was taking the number of lanes into account in order to calculate
> >> the clock rate, since 4-lanes can run slower.
> >>
> > Ah that makes sense if you aren't running at full clock burst clock
> > rate.
> >
> >>>> I was looking more at the division by 8 and the overhead correction =
of 6.
> >>>> This number 6 also appears in the NXP downstream kernel [1].  I know
> >>>> Marek V had some concerns about that.
> >>>>
> >>> Yea, I don't fully remember the details about the overhead. Need to
> >>> page that back in. The division by 8 in my patch is just to get from
> >>> the bit to a byte clock, nothing to do with the MIPI format bits per
> >>> channel or something like that.
> >>>
> >>>>> the blanking size purely on the ratio between MIPI DSI byte clock a=
nd
> >>>>> the DPI interface clock. It's quite counter-intuitive that the host
> >>>>> would scale the blanking to the number of lanes automatically, but
> >>>>> still require the MIPI packet offset removed, but that's what my
> >>>>> measurements showed to produce the correct blanking after translati=
on
> >>>>> to DPI by the TC358767 bridge chip.
> >>>> How many lanes is your DSI interface using?
> >>>>
> >>> When I did the measurements to come up with the patch, I varied the
> >>> number of lanes between 1 and 4. Different number of lanes didn't mak=
e
> >>> a difference. In fact trying to compensate for the number of lanes wh=
en
> >>> calculating the blanking size to program into the controller lead to
> >>> wildly wrong blanking on the DPI side of the external bridge.
> >>>
> >>>>> If you dynamically scale the HS clock, then you would need to input=
 the
> >>>>> real used HS clock to the calculation in my patch, instead of the f=
ixed
> >>>>> burst mode rate.
> >>>> I think what you're saying makes sense.
> >>>>
> >>>> The code I originally modeled this from was from the NXP downstream
> >>>> kernel where they define the calculation as being in words [2]. I am
> >>>> not saying the NXP code is perfect, but the NXP code works.  With th=
is
> >>>> series, my monitors are able to sync a bunch of different resolution=
s
> >>>> from 1080p down to 640x480 and a bunch in between with various refre=
sh
> >>>> rates too. That was the goal of this series.
> >>>>
> >>>> Instead of just using your patch as-is, I will adapt yours to use th=
e
> >>>> scaled clock to see how it behaves and get back to you.
> >>>>
> >>> Thanks, that would be very much appreciated.
> >> Lucas,
> >>
> >> I took your patch and added a dsi state variable named "hs_clock"  to
> >> keep track of the output of samsung_dsim_set_pll which should be the
> >> active high-speed clock.
> >>
> >> I then replaced one line in your code to reference the hs_clock
> >> instead of the burst clock:
> >>
> >> @@ -960,7 +962,7 @@ static void samsung_dsim_set_display_mode(struct
> >> samsung_dsim *dsi)
> >>          u32 reg;
> >>
> >>          if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> >> -               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> >> +               int byte_clk_khz =3D dsi->hs_clock / 1000 / 8;
> >>                  int hfp =3D (m->hsync_start - m->hdisplay) *
> >> byte_clk_khz / m->clock;
> >>
> >> With that change, your patch works with the rest of my code, and I
> >> think it's easier to read, and it doesn't involve recalculating the
> >> clock speed each time since it's cached.  If you're OK with that, I'll
> >> incorporate your code into V2 of my series, and I'll apply my changes
> >> as a subsequent patch.  I hope to be able to send out V2 this weekend.
> >>
> > That's good to hear! Seems we are converging here. Feel free to pick up
> > the patch, that's also easier for me as I don't have to resend with CC
> > fixed.
> >
> >> I would be curious to know frm Marek Szyprowski what the impact is on
> >> the Samsung devices, if any.
> >>
> > Since I messed up the list CC you also couldn't see his reply to my
> > patch:
> >
> > | Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > |
> > | Works fine on the Exynos based boards I have in my test farm.
>
> I didn't follow this discussion, I'm a bit busy with other stuff. I've
> just tested this series and patch #3 break Exynos based board. If you
> want me to test anything else (might be a work-in-progress code), just
> let me know by the separate mail.

That's ok. I'm going to drop my patch in favor of Lucas' patch, since
you've already tested his, and it looks cleaner than mine.  Thanks for
your willingness to test.  That really helps us move forward without
breaking your stuff.

adam
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
