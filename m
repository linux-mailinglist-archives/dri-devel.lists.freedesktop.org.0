Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972212E8C1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 17:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192366E0EC;
	Thu,  2 Jan 2020 16:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F856E0EC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 16:34:52 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n11so32075626iom.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 08:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n02NZb1q13MC+D+YIZeKacRc8gevOmHNy1haOLJb4io=;
 b=gelJmfqDyUmjwBH/XMMX/bBXaKDVC6YTmAj8rPELVV13MZipjbHUb7JPhFkSuDop1U
 ByiLKjmlDBsd8mhMeRa6Is5L7PN0Wzk2rxFBkZqRfzxyPP1Bgn9Y5J2iih8/libglJ22
 dOtjW3gXu4mZCdjaMzxLU4AnQWrng2RGMawBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n02NZb1q13MC+D+YIZeKacRc8gevOmHNy1haOLJb4io=;
 b=Ad9w4hwyoJr0PLh1SWg8FF9G3ji4r5EOYpM6rdjQosx25TveiF0j+z38qcgKu+HTrR
 zWXhYdi2SGnyJ/INs6oVw+10FxeQh6kxrJ3ZcAYpxyKDUV8LPmqdxWgMwUde1d7omdWU
 2IUvTUk9w5q8rTSEm7+vPPgQ2hCgcuqMoBjZ7EBTNotTQaBiQCfVRrrkjNdfIitYERoD
 RjQzhfr4Gqa0HyvDbGFYmdTtA2QJL2fHPFkpWIqceytJr/EYSSdWTbZ+WDCKmvYSKEXD
 Elz/QwQ3Rmzc3l0y65j6HyWFEOmNyJZQkoJKEOdTlmZrXQP/+04U+1FwMr6Z4fEYZvuP
 UoNQ==
X-Gm-Message-State: APjAAAXgFqOu1rx5RSTa242JjaFy3WyF6PE6Os8qPVT2Ov36iM2hFRg7
 l0dFJmVqfrE16NaRcQ4jVwciwHL1JCJ5s2gVXiKqiA==
X-Google-Smtp-Source: APXvYqz8y/GovnsF0D2tm3lNOpYaS0G7+35htjGwpcyBgB9MdOWIe9CYMW8Ole+deE4SlX9aakNc01/kDuMb4EgOvMg=
X-Received: by 2002:a02:b897:: with SMTP id p23mr67001302jam.58.1577982891338; 
 Thu, 02 Jan 2020 08:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-3-jagan@amarulasolutions.com>
 <20200102105424.kmte7aooh2gkrcnu@gilmour.lan>
 <CAMty3ZA0e8eJZWvAh0x=KGAZVL3apdao3COvR6j3-ckv0cdvcg@mail.gmail.com>
 <20200102154703.3prgwcjyo36g5g5u@gilmour.lan>
In-Reply-To: <20200102154703.3prgwcjyo36g5g5u@gilmour.lan>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 2 Jan 2020 22:04:40 +0530
Message-ID: <CAMty3ZB_6GyK=hhJU-8yAQiom1Uq25ojFbKaGrK1fmW8SnDV_A@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drm/sun4i: tcon: Add TCON LCD support for R40
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 2, 2020 at 9:17 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Jan 02, 2020 at 09:10:31PM +0530, Jagan Teki wrote:
> > On Thu, Jan 2, 2020 at 4:24 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Tue, Dec 31, 2019 at 06:35:21PM +0530, Jagan Teki wrote:
> > > > TCON LCD0, LCD1 in allwinner R40, are used for managing
> > > > LCD interfaces like RGB, LVDS and DSI.
> > > >
> > > > Like TCON TV0, TV1 these LCD0, LCD1 are also managed via
> > > > tcon top.
> > > >
> > > > Add support for it, in tcon driver.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > > > Changes for v3:
> > > > - none
> > > >
> > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > index fad72799b8df..69611d38c844 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > @@ -1470,6 +1470,13 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
> > > >       .has_channel_1          = true,
> > > >  };
> > > >
> > > > +static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
> > > > +     .supports_lvds          = true,
> > > > +     .has_channel_0          = true,
> > > > +     /* TODO Need to support TCON output muxing via GPIO pins */
> > > > +     .set_mux                = sun8i_r40_tcon_tv_set_mux,
> > >
> > > What is this muking about? And why is it a TODO?
> >
> > Muxing similar like how TCON TOP handle TV0, TV1 I have reused the
> > same so-that it would configure de port selection via
> > sun8i_tcon_top_de_config
> >
> > TCON output muxing have gpio with GPIOD and GPIOH bits, which select
> > which of LCD or TV TCON outputs to the LCD function pins. I have
> > marked these has TODO for further support as mentioned by Chen-Yu in
> > v1[1].
>
> It should be in the commit log.

Make sense.

>
> What's the plan to support that when needed? And that means that the
> LCD and TV outputs are mutually exclusive? We should at the very least
> check that both aren't enabled at the same time.

Yes, LCD or TV within the outselect seems to be mutually exclusive.
Like LCD0 or TV0 can output to GPIOD incase of TV0_OUTSEL and LCD1 or
TV1 can output to GPIOH incase of TV1_OUTSEL. I think checking them
before configuring TCON_TOP_PORT_SEL_REG would make sense, let me know
if you have any suggestions?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
