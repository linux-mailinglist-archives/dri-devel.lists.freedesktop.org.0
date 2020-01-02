Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51C12E828
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 16:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09336E10A;
	Thu,  2 Jan 2020 15:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79676E10A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 15:40:42 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id t17so34321553ilm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3572HIPczR9cTuPFxrESBoTgrX4d6H7x5Q/kXXuy428=;
 b=CsMdcshBDPMrQufZIZxdudBJtg7H5PXirvxIzG5GX86qw5BbrHfL3WRLl1u9msmugU
 4nlFujipIJd3har00SH658ONwyUzVLsynUhsbUkj7VjUYMY7VSo+tJ+VQS+oXCOGBFNH
 WPaOFGHhMYzcCPVHv/6ulHwsoyYUumKyKR21c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3572HIPczR9cTuPFxrESBoTgrX4d6H7x5Q/kXXuy428=;
 b=cBo+sS/RHi1vTE8Bp39rcshfTh/ippslYPVKc69lmbhV88mZ8GChmulqsMzBdA2MBy
 KMEu55Th2t9/V6HfJLrJk53bAxZp9mE8ELAxS08s/8OXJ3lPBr3BYsILhiaFW9LwodMx
 IGCgqviRxPd36AybNmK2H9R4l9VZwLHhssFEtk6D5yU8D8s3iDFFYq80WQFa+py59+cM
 kXHTptlcEGhiQ/NHXgnO7tpKCj7SfkpeULrMoLe7clsF2J/eehNRfSBwygxmeH4kcLgX
 XLSBLsrwRaTGGlSCtjwfgK9e3CFI5X3DZpaYMEp/7OH+UArmHHU3I9Wfd3SWKcD7ziCQ
 lR8w==
X-Gm-Message-State: APjAAAUCt19uL/+J775V0+3hWjHadL+pmZHMxe7DGlAaS4xv0qetzqpL
 fU6THOEMYHLSxsTntDY0YDPoYVt+Y518b6qhoiqzAA==
X-Google-Smtp-Source: APXvYqyktr3CqCCGml7EeAho4GJqaINKtZEGl5yX5r/Y5VF4lK9Mx3hwHRBbOa/ZWlGpatq+4kooSat9lPiBhJb0M/8=
X-Received: by 2002:a92:c647:: with SMTP id 7mr71931846ill.28.1577979642064;
 Thu, 02 Jan 2020 07:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-3-jagan@amarulasolutions.com>
 <20200102105424.kmte7aooh2gkrcnu@gilmour.lan>
In-Reply-To: <20200102105424.kmte7aooh2gkrcnu@gilmour.lan>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 2 Jan 2020 21:10:31 +0530
Message-ID: <CAMty3ZA0e8eJZWvAh0x=KGAZVL3apdao3COvR6j3-ckv0cdvcg@mail.gmail.com>
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

On Thu, Jan 2, 2020 at 4:24 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Dec 31, 2019 at 06:35:21PM +0530, Jagan Teki wrote:
> > TCON LCD0, LCD1 in allwinner R40, are used for managing
> > LCD interfaces like RGB, LVDS and DSI.
> >
> > Like TCON TV0, TV1 these LCD0, LCD1 are also managed via
> > tcon top.
> >
> > Add support for it, in tcon driver.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - none
> >
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > index fad72799b8df..69611d38c844 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -1470,6 +1470,13 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
> >       .has_channel_1          = true,
> >  };
> >
> > +static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
> > +     .supports_lvds          = true,
> > +     .has_channel_0          = true,
> > +     /* TODO Need to support TCON output muxing via GPIO pins */
> > +     .set_mux                = sun8i_r40_tcon_tv_set_mux,
>
> What is this muking about? And why is it a TODO?

Muxing similar like how TCON TOP handle TV0, TV1 I have reused the
same so-that it would configure de port selection via
sun8i_tcon_top_de_config

TCON output muxing have gpio with GPIOD and GPIOH bits, which select
which of LCD or TV TCON outputs to the LCD function pins. I have
marked these has TODO for further support as mentioned by Chen-Yu in
v1[1].

[1] https://patchwork.freedesktop.org/patch/310210/?series=62062&rev=1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
