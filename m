Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320A95FDF5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 02:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5610C10E253;
	Tue, 27 Aug 2024 00:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D7QDn0GK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0199010E253
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 00:26:00 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2d3c05dc63eso3868072a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 17:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724718360; x=1725323160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMuK4QV7muDMO7BeRVXLHq2wn2REnj0hYpjl+5UTMFw=;
 b=D7QDn0GK+5qWTozCjPvWUwulH3bWXuKf9qv/G/jWwoRDEgjBsYnBNIIJbX7im5fx/o
 DDhDdY14OmcCVqSVn8ejdyhGGiot9pK5qL8DidPLqWTQ7cAtUiQ+WSbPVODqshIo5Dgr
 eqTzC3/6r7iqR4/1cMh401NArKjopUVQzRlU3C4Y9WH1F7IOvqKCcHaabVJR0VgzX7Mu
 ZNB6HZp8qO1JAXrKWiLvXol5B/NyOmwWWPmDMl/i4G4VywJccmtcu25umdExN1PPy+TG
 kHmfj7C/sZllzPHdIiXXtCjKrsAo19ynrKKln6X13Z1nG1ARm988m2gxmP6i8uVfr7DI
 RpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724718360; x=1725323160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMuK4QV7muDMO7BeRVXLHq2wn2REnj0hYpjl+5UTMFw=;
 b=taC9YS6lDfyzQR+zL6AmT0hixJci6sxvPV14PY1y6JNHTH3viQYFCv7AONSCz5V2q2
 G3VbRR2IOMgUtENpqM1GKlMc1M45mvpXpD+17xVkHAOVX01x2o4Li3nBE6dMfUO62jfv
 LcIDsPHVk8WDS1PcQubf9Mj+Tyo3d3rZhLiG7fVAOR7TxkPqafcQ58vQERaBfsWeU0EI
 Bkj8XLx6BGaBi5X5nRW+1fD0WqeIL8uJoz7Zq+lMCaedQYTkRJ9jd+xI2Q95obKvzRlX
 HvUsOJnJiFiZ0R7VZNrS50rm3Cc/m0jUUxrHDq177bv1blCrK+fZFW6AQsYMAfGjXkLv
 WysQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpyAOYouF6t0LM+bAnNtlha9ANHLEPZ6bBnMKN1SEv7/xnM/Q0Y2NG7QLoOEGW8cQ6IfZNqyo21Pw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/ykacgtuFJVQ4sM9T5cZ3Q4ZmYavFtkJ3WHitxoPlvzI7V6oj
 JlgCtYlluMVL5ghM80dbP/VsU/1GZ4Kz5shaolblJbwBKWI8U/MCRnM/UUbCXb3Yy8s+LsKvMYf
 /bo6aVyg+wTEbL88InksMvEThsU0=
X-Google-Smtp-Source: AGHT+IF9ukgQuMvAr/GjcVBuxn1oYZRmrYIyg5G2T1pM3qcAaFAE5umL+maJA4tmjtlrYSAjwgQ9CQ+7oxLU/YQYR/k=
X-Received: by 2002:a17:90b:3804:b0:2c8:53be:fa21 with SMTP id
 98e67ed59e1d1-2d646d382b4mr14410300a91.34.1724718360295; Mon, 26 Aug 2024
 17:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
 <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
 <ZsVluV50NvuGGHFX@atmark-techno.com>
 <CAHCN7xJnjfjr7HfKF+4pwbENP+p2=vvMXWW1AQShNy87vfQ=-A@mail.gmail.com>
 <CAHCN7xKgpqfRf_2p1z5NyKiOYubbcDA7YE5ML8G56pVmcV+1xA@mail.gmail.com>
In-Reply-To: <CAHCN7xKgpqfRf_2p1z5NyKiOYubbcDA7YE5ML8G56pVmcV+1xA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 26 Aug 2024 19:25:48 -0500
Message-ID: <CAHCN7x+HgasGG_v-PdtmRszhJn5odHzfV6ddeeT10_1yCOS+DQ@mail.gmail.com>
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Lucas Stach <l.stach@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, marex@denx.de, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Makoto Sato <makoto.sato@atmark-techno.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 21, 2024 at 8:59=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Wed, Aug 21, 2024 at 7:45=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > On Tue, Aug 20, 2024 at 10:58=E2=80=AFPM Dominique MARTINET
> > <dominique.martinet@atmark-techno.com> wrote:
> > >
> > > Adam Ford wrote on Tue, Aug 20, 2024 at 09:49:03PM -0500:
> > > > > > However, this check is a bit overcautious in that it only allow=
s exact
> > > > > > rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so t=
his
> > > > > > check could be relaxed quite a bit to allow for that.
> > > > >
> > > > > I checked with a 1080p display that reports 23 possible modes via=
 EDID.
> > > > > Out of these 15 are accepted by the driver with the strict check.
> > > > >
> > > > > Two more would be accepted with a relaxed check that allows a 0.5=
% margin.
> > > > >
> > > > > For the remaining six modes, the pixel clock would deviate up to =
~5%
> > > > > from what the display expects. Still, if I remove the check altog=
ether,
> > > > > all 23 modes seem to work just fine.
> > >
> > > I can confirm the displays I tested also seem pretty tolerant in
> > > practice (up to ~3-4% at least), but I agree with Lucas that this isn=
't
> > > something we can rely on for a general purpose driver as having examp=
les
> > > of things being tolerant doesn't mean all hardware will be as flexibl=
e..
> > >
> > > > > I'd really like to be able to add more PHY PLL setpoints for disp=
lays
> > > > > that use non-CEA-861 modes. Unfortunately I didn't manage to figu=
re out
> > > > > the fractional-n PLL parameter calculation so far.
> > > > >
> > > > > The i.MX8MP Reference Manual provides formulas to calculate the
> > > > > parameters based on the register values and I tried to make sense=
 of it
> > > > > using the existing register values in the driver. But somehow it =
doesn't
> > > > > add up for me.
> > > > >
> > > > > Lucas, did you already work with the PLL parameters? By any chanc=
e, do
> > > > > you now how the math behind them works?
> > > >
> > > > I spent a little time trying to understand it a bit.  I created a P=
MS
> > > > calculator similar to the one used on the DSI controller,
> > >
> > > Great! I'll admit this also flies over my head and I don't have the
> > > time to study this, so this is much appreciated.
> > >
> > > > except that
> > > > the M seems to be fixed at a value of 62 per the data sheet, so it'=
s
> > > > more of a PS calculator.
> > >
> > > Hmm... PHY_REG2 in the datasheet only lists '0011_1110b - 62' as
> > > example(?) values, but it doesn't say other values are reserved eithe=
r,
> > > I'm not sure what to make of it.
> > > In the current driver PHY_REG_02 (driver macro) is assigned the first
> > > field of .pll_div_regs, which goes anywhere from 0x4b to 0x7b -- pret=
ty
> > > far from 62(0x3e)...
> >
> > OK.  I will experiment with increasing the range of M from being fixed
> > at 3e to a range of 3b to 7b to see if my PMS integer calculator can
> > get more accurate.
> >
> > >
> > > Since other frequencies have been adjusting this main diviser ratio w=
e
> > > actually tried copying neighboring values and adjusting only that reg=
 2
> > > (so the M if I get this right?), but the end result ended up not
> > > synchronizing properly every time... We didn't have time to check wit=
h a
> > > scope if the generated signal was ugly or if it just didn't lock
> > > properly, but the display worked when we just re-used the neighboring
> > > values without changing anything despite being ~3-4% off, so we took =
the
> > > easy way out here and didn't dig much further.
> > >
> > > > Anyway, When I run my P-S calculator to generate the 'best rate' I =
get
> > > > a value that's usually 0.2% variance from nominal, but I only verif=
ied
> > > > a handful of values:
> > > >
> > > > Several which were +0.2%
> > > > 297600000 vs 297000000 (4k@30)
> > > > 148800000 vs 148500000 (1080p60)
> > > > 74400 vs 74200
> > > >
> > > > One value was -0.16%
> > > > 24800000 vs 25200000
> > > >
> > > > If the M value was a bit more flexible, we might be able to reduce
> > > > that variance more.
> > >
> > > Yes, I think the M value could be more flexible, but that'd require
> > > checking if it actually works, whereas having slightly off frequencie=
s
> > > will most likely be OK so I don't think it's worth the effort -- happ=
y
> > > to stick to what the datasheet describes.
> > >
> > > > If / when I get some time, I might play with trying to disable the
> > > > fractional mode and just use the PMS calculator for simplicity desp=
ite
> > > > the inaccuracy.  Maybe we could fall back to using the PMS calculat=
or
> > > > if the desired frequency isn't in the look-up-table.
> > >
> > > That'd be greatly appreciated, I don't have any strong opinion on
> > > whether that should completely replace the table, or only be used if
> > > there is no exact match in the table as these are values we know will
> > > work; but we can definitely test any patch you can throw at us here.
> >
> > I can't promise it'll be quick.  I am not fully certain I understand
> > how the whole thing works, but as a rule, I don't generally like look
> > up tables if they can be calculated dynamically.
>
> I updated my PMS calculator, and I randomly selected 5 resolutions and
> they all returned an exact clock match, so I'll attempt to use the PMS
> integer clock instead of the fractional one.
>
> It'll be a little while longer before I can do anything with it.

Frieder,

Using my PMS calculator and Rev 2 of the Tech Ref Manual, I think I
can generate you a table entry for 51.2MHz.  I don't have the ability
to test it.  I am still working on figuring out an algorithm to
calculate the fractional divider, but 51.2MHz x 5 does not' appear to
need the fractional clock divider, so I think I can just get away with
the standard PMS calculations.

My algorithm showed:
HDMI PHY Best P =3D 1
HDMI PHY Best M =3D 64
HDMI PHY Best S =3D 6
HDMI PHY Best freq =3D 256000000

I'll try to generate a patch to get these values into the table if
you're willing to test it.

All,

I still think it's a good idea to fall back to the PMS calculator if
the fractional stuff isn't found.  We could then determine which clock
frequency is closer between the nearest table entry or the PMS
calculator until someone can come up with an algorithm for it.


adam


>
> adam
> >
> > adam
> > >
> > >
> > > Cheers,
> > > --
> > > Dominique
> > >
> > >
