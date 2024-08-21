Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED05959C45
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339010E13F;
	Wed, 21 Aug 2024 12:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="baL5WiaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031210E13F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 12:46:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-714287e4083so355504b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724244371; x=1724849171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GrQlo1ZtzHZaU3Kc2gC/GsCtOWVGIzkRZAXPXF1JDAc=;
 b=baL5WiaLF0d/yn17nSa5ny8h6ucG+C//pdmBwzrvtUvMp4+iM3+Atj5DLMnwG2sCDk
 L8BGrdonGtewZgK35/2IuJIUk53RAP+WPY7R6NBYttOkdwSHeVxe/G6PssfmHaWMPMqG
 lU1V7/q4umJ2DIjp0JMD4c018Hb9NafzILjw4M5OZv9RN7gIuKn4ofYUhZI7GxZ/YET0
 EkYm2OTgBaLUM/nbQFSMZeEEd9GojcoQAUuga+rcoG9dsxwLzw2nGQmR2kkh84ZnhMLx
 ETUfjLMz50uH39WyZFAcjH1ur83zJLoFzJZWT0ADExBhelXoQBP3m1UStVj28wEeL2s/
 gRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724244371; x=1724849171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GrQlo1ZtzHZaU3Kc2gC/GsCtOWVGIzkRZAXPXF1JDAc=;
 b=b8NeqB7ykXGI/kQ25HSkO33Ogk0r/yHGsFzSDitsKkpf9/KFTRjxBxlrD9yAetbEyE
 Mmlq3vzgi5c4KYH2NuhJytzf6NjQRmr7s/qLH5FVLriC/cBtwUiviPhtHyeE8Fy/WcR4
 dj2JaxHOKgulrw1lmIoX9nSc/qK4nLenOx8paNRCR8dfGB5PvvOMdqPurmWoJGi0yqnA
 teNlGLgw/zpypkNbqx/Oa14h/ZLftyvqJ3uJqz6f9l2RHAv62AbFs4ysUXXyLsu1jnGC
 jaamiLUt3tji4/jpb9DoAUQn5aJhzV2DftCbHqDnYkzbg4GxD83ECMMlf6x1H/93kI+q
 pcVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4r3nMKiTmUj1KP/TqEit+yvBMrBycZ3kSccRHZdb78u1jJfXS1XBPl2hORxqxe7tNuc4okv4rOCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1hHOozSN3lq04vxhRQit89iOA6PQVaBy0vh83zVCfn1Al+qXr
 bg3ld64rgY2oWGVWbKfDrypvULWCeHjYdHGLLWr95f0KhcmtrN/ypcOYeDQmo3GFfDDQnhANY7p
 U6P53Nzl7EHd1U3ipuMQ10K+Pfmk=
X-Google-Smtp-Source: AGHT+IHKfU539ztIPvH6FNOLr/tKtolhQJBELB1tBOi+TgcP0/C3jIsojq1Lyrzv/S9i+Tdl/qwVHeal4WeR8hByttU=
X-Received: by 2002:a05:6a21:9214:b0:1c6:fa4b:3648 with SMTP id
 adf61e73a8af0-1cad7f962b8mr3248581637.22.1724244370398; Wed, 21 Aug 2024
 05:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
 <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
 <ZsVluV50NvuGGHFX@atmark-techno.com>
In-Reply-To: <ZsVluV50NvuGGHFX@atmark-techno.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 21 Aug 2024 07:45:58 -0500
Message-ID: <CAHCN7xJnjfjr7HfKF+4pwbENP+p2=vvMXWW1AQShNy87vfQ=-A@mail.gmail.com>
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

On Tue, Aug 20, 2024 at 10:58=E2=80=AFPM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
>
> Adam Ford wrote on Tue, Aug 20, 2024 at 09:49:03PM -0500:
> > > > However, this check is a bit overcautious in that it only allows ex=
act
> > > > rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so this
> > > > check could be relaxed quite a bit to allow for that.
> > >
> > > I checked with a 1080p display that reports 23 possible modes via EDI=
D.
> > > Out of these 15 are accepted by the driver with the strict check.
> > >
> > > Two more would be accepted with a relaxed check that allows a 0.5% ma=
rgin.
> > >
> > > For the remaining six modes, the pixel clock would deviate up to ~5%
> > > from what the display expects. Still, if I remove the check altogethe=
r,
> > > all 23 modes seem to work just fine.
>
> I can confirm the displays I tested also seem pretty tolerant in
> practice (up to ~3-4% at least), but I agree with Lucas that this isn't
> something we can rely on for a general purpose driver as having examples
> of things being tolerant doesn't mean all hardware will be as flexible..
>
> > > I'd really like to be able to add more PHY PLL setpoints for displays
> > > that use non-CEA-861 modes. Unfortunately I didn't manage to figure o=
ut
> > > the fractional-n PLL parameter calculation so far.
> > >
> > > The i.MX8MP Reference Manual provides formulas to calculate the
> > > parameters based on the register values and I tried to make sense of =
it
> > > using the existing register values in the driver. But somehow it does=
n't
> > > add up for me.
> > >
> > > Lucas, did you already work with the PLL parameters? By any chance, d=
o
> > > you now how the math behind them works?
> >
> > I spent a little time trying to understand it a bit.  I created a PMS
> > calculator similar to the one used on the DSI controller,
>
> Great! I'll admit this also flies over my head and I don't have the
> time to study this, so this is much appreciated.
>
> > except that
> > the M seems to be fixed at a value of 62 per the data sheet, so it's
> > more of a PS calculator.
>
> Hmm... PHY_REG2 in the datasheet only lists '0011_1110b - 62' as
> example(?) values, but it doesn't say other values are reserved either,
> I'm not sure what to make of it.
> In the current driver PHY_REG_02 (driver macro) is assigned the first
> field of .pll_div_regs, which goes anywhere from 0x4b to 0x7b -- pretty
> far from 62(0x3e)...

OK.  I will experiment with increasing the range of M from being fixed
at 3e to a range of 3b to 7b to see if my PMS integer calculator can
get more accurate.

>
> Since other frequencies have been adjusting this main diviser ratio we
> actually tried copying neighboring values and adjusting only that reg 2
> (so the M if I get this right?), but the end result ended up not
> synchronizing properly every time... We didn't have time to check with a
> scope if the generated signal was ugly or if it just didn't lock
> properly, but the display worked when we just re-used the neighboring
> values without changing anything despite being ~3-4% off, so we took the
> easy way out here and didn't dig much further.
>
> > Anyway, When I run my P-S calculator to generate the 'best rate' I get
> > a value that's usually 0.2% variance from nominal, but I only verified
> > a handful of values:
> >
> > Several which were +0.2%
> > 297600000 vs 297000000 (4k@30)
> > 148800000 vs 148500000 (1080p60)
> > 74400 vs 74200
> >
> > One value was -0.16%
> > 24800000 vs 25200000
> >
> > If the M value was a bit more flexible, we might be able to reduce
> > that variance more.
>
> Yes, I think the M value could be more flexible, but that'd require
> checking if it actually works, whereas having slightly off frequencies
> will most likely be OK so I don't think it's worth the effort -- happy
> to stick to what the datasheet describes.
>
> > If / when I get some time, I might play with trying to disable the
> > fractional mode and just use the PMS calculator for simplicity despite
> > the inaccuracy.  Maybe we could fall back to using the PMS calculator
> > if the desired frequency isn't in the look-up-table.
>
> That'd be greatly appreciated, I don't have any strong opinion on
> whether that should completely replace the table, or only be used if
> there is no exact match in the table as these are values we know will
> work; but we can definitely test any patch you can throw at us here.

I can't promise it'll be quick.  I am not fully certain I understand
how the whole thing works, but as a rule, I don't generally like look
up tables if they can be calculated dynamically.

adam
>
>
> Cheers,
> --
> Dominique
>
>
