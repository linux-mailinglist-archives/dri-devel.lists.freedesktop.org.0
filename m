Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAD95AAC2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 03:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C98210E042;
	Thu, 22 Aug 2024 01:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eFhqv2wm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076C810E042
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 01:59:17 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2d3d7a1e45fso193149a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 18:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724291957; x=1724896757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFO2kWCGjNOD3FeA4OtRgD3pdjDivL5vvXpR1ohJQTE=;
 b=eFhqv2wmikwnCQuthjZ4HiI9Byls9y47szZ+GdDwrR03UvNWrRMBOaWxuReuB5HA9y
 wvWGjp0WNUX5UrsR2OwDxW68wnv56SVO8QQ1NT6ioNNcB8ZgJYt/+UWkA0AUBZOe123z
 TQ8BN89nC6AVmEuk5gKjzkcn09HeJdnSp/Li9jWW9jJeq682qUIlATPtpVGrMZiv4mI5
 pBDCny6t1wjr95M7CZzWu16Xi5YHZl6cHYdN4qjTz8LRabPXXADDNKMzTrH8x4DpV7oF
 Z8jufkxfed3lq0EawbOL1VH6pbMbPPXUEImpTnTuyaIQV1NjopLBAjpA5a3mN4A18Mho
 v/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724291957; x=1724896757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFO2kWCGjNOD3FeA4OtRgD3pdjDivL5vvXpR1ohJQTE=;
 b=eG2gsDVnsMgfEaxThLGv680hqCZCdq3A5xBskLMY22mXWNqBHB5pzxxwjdflDs3DEU
 3L8X2ZF/M45ViJGa631A7U6bLbuAnuSryGyevb5B1jAmUoCxE31k+P5yL2k8RONiSC31
 EkEh3tMZ8RU9+VkKQkx2YF2bpziuwl+0E3Kaf8O0t5w8v1wOR7BsL7/0uoZjBLtJvwX3
 H0/E2MaIud5xdYPIVF6Yzdh4Khfdw+cFYxj9Uw7K08pdVVAUoOsRKAmiiAO8Emq97yrl
 gVmnHQbzFPQwcCw/K0njaIJJSLUR8d2rr/BzmTEoDC8gd+zyPsvwgMV5pYPD50zKDKlO
 Gvwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FynSSnLj5FOQwtSSmdG5wRidhGQJXfWVkakDGgvGSKn4UFy//OzOXzvR+se2PZ3uUFmng3Pj3BA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDF9MDvm6dsFWIQ+VbXawGKWSPVPKcwCLTDSfMJHOIXasf0afa
 kABtrWk01Fiv5AKQRRR86i2cViKuZmWwMRBx0EoTM29t4GgSbsHCx/Mog+Lw189Wo/qKUviQofo
 5Ltj18pMCyKLA54PvaSjXcG9IFeM=
X-Google-Smtp-Source: AGHT+IHo1XypQ2DhBU9dvxFb47f1VVfuO5TlGuhS61QXHHxtYiys4WJVmwOODJ9pBcwZtDtC4hQnUAZDYgMqTdynFSo=
X-Received: by 2002:a17:90a:4d83:b0:2c9:58dd:e01d with SMTP id
 98e67ed59e1d1-2d5e9a09e2bmr4589896a91.14.1724291957272; Wed, 21 Aug 2024
 18:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
 <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
 <ZsVluV50NvuGGHFX@atmark-techno.com>
 <CAHCN7xJnjfjr7HfKF+4pwbENP+p2=vvMXWW1AQShNy87vfQ=-A@mail.gmail.com>
In-Reply-To: <CAHCN7xJnjfjr7HfKF+4pwbENP+p2=vvMXWW1AQShNy87vfQ=-A@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 21 Aug 2024 20:59:05 -0500
Message-ID: <CAHCN7xKgpqfRf_2p1z5NyKiOYubbcDA7YE5ML8G56pVmcV+1xA@mail.gmail.com>
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

On Wed, Aug 21, 2024 at 7:45=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Tue, Aug 20, 2024 at 10:58=E2=80=AFPM Dominique MARTINET
> <dominique.martinet@atmark-techno.com> wrote:
> >
> > Adam Ford wrote on Tue, Aug 20, 2024 at 09:49:03PM -0500:
> > > > > However, this check is a bit overcautious in that it only allows =
exact
> > > > > rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so thi=
s
> > > > > check could be relaxed quite a bit to allow for that.
> > > >
> > > > I checked with a 1080p display that reports 23 possible modes via E=
DID.
> > > > Out of these 15 are accepted by the driver with the strict check.
> > > >
> > > > Two more would be accepted with a relaxed check that allows a 0.5% =
margin.
> > > >
> > > > For the remaining six modes, the pixel clock would deviate up to ~5=
%
> > > > from what the display expects. Still, if I remove the check altoget=
her,
> > > > all 23 modes seem to work just fine.
> >
> > I can confirm the displays I tested also seem pretty tolerant in
> > practice (up to ~3-4% at least), but I agree with Lucas that this isn't
> > something we can rely on for a general purpose driver as having example=
s
> > of things being tolerant doesn't mean all hardware will be as flexible.=
.
> >
> > > > I'd really like to be able to add more PHY PLL setpoints for displa=
ys
> > > > that use non-CEA-861 modes. Unfortunately I didn't manage to figure=
 out
> > > > the fractional-n PLL parameter calculation so far.
> > > >
> > > > The i.MX8MP Reference Manual provides formulas to calculate the
> > > > parameters based on the register values and I tried to make sense o=
f it
> > > > using the existing register values in the driver. But somehow it do=
esn't
> > > > add up for me.
> > > >
> > > > Lucas, did you already work with the PLL parameters? By any chance,=
 do
> > > > you now how the math behind them works?
> > >
> > > I spent a little time trying to understand it a bit.  I created a PMS
> > > calculator similar to the one used on the DSI controller,
> >
> > Great! I'll admit this also flies over my head and I don't have the
> > time to study this, so this is much appreciated.
> >
> > > except that
> > > the M seems to be fixed at a value of 62 per the data sheet, so it's
> > > more of a PS calculator.
> >
> > Hmm... PHY_REG2 in the datasheet only lists '0011_1110b - 62' as
> > example(?) values, but it doesn't say other values are reserved either,
> > I'm not sure what to make of it.
> > In the current driver PHY_REG_02 (driver macro) is assigned the first
> > field of .pll_div_regs, which goes anywhere from 0x4b to 0x7b -- pretty
> > far from 62(0x3e)...
>
> OK.  I will experiment with increasing the range of M from being fixed
> at 3e to a range of 3b to 7b to see if my PMS integer calculator can
> get more accurate.
>
> >
> > Since other frequencies have been adjusting this main diviser ratio we
> > actually tried copying neighboring values and adjusting only that reg 2
> > (so the M if I get this right?), but the end result ended up not
> > synchronizing properly every time... We didn't have time to check with =
a
> > scope if the generated signal was ugly or if it just didn't lock
> > properly, but the display worked when we just re-used the neighboring
> > values without changing anything despite being ~3-4% off, so we took th=
e
> > easy way out here and didn't dig much further.
> >
> > > Anyway, When I run my P-S calculator to generate the 'best rate' I ge=
t
> > > a value that's usually 0.2% variance from nominal, but I only verifie=
d
> > > a handful of values:
> > >
> > > Several which were +0.2%
> > > 297600000 vs 297000000 (4k@30)
> > > 148800000 vs 148500000 (1080p60)
> > > 74400 vs 74200
> > >
> > > One value was -0.16%
> > > 24800000 vs 25200000
> > >
> > > If the M value was a bit more flexible, we might be able to reduce
> > > that variance more.
> >
> > Yes, I think the M value could be more flexible, but that'd require
> > checking if it actually works, whereas having slightly off frequencies
> > will most likely be OK so I don't think it's worth the effort -- happy
> > to stick to what the datasheet describes.
> >
> > > If / when I get some time, I might play with trying to disable the
> > > fractional mode and just use the PMS calculator for simplicity despit=
e
> > > the inaccuracy.  Maybe we could fall back to using the PMS calculator
> > > if the desired frequency isn't in the look-up-table.
> >
> > That'd be greatly appreciated, I don't have any strong opinion on
> > whether that should completely replace the table, or only be used if
> > there is no exact match in the table as these are values we know will
> > work; but we can definitely test any patch you can throw at us here.
>
> I can't promise it'll be quick.  I am not fully certain I understand
> how the whole thing works, but as a rule, I don't generally like look
> up tables if they can be calculated dynamically.

I updated my PMS calculator, and I randomly selected 5 resolutions and
they all returned an exact clock match, so I'll attempt to use the PMS
integer clock instead of the fractional one.

It'll be a little while longer before I can do anything with it.

adam
>
> adam
> >
> >
> > Cheers,
> > --
> > Dominique
> >
> >
