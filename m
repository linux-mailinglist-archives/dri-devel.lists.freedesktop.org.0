Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768789F1D25
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 08:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C5910E29C;
	Sat, 14 Dec 2024 07:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="exW7/Nb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6633B10E373
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 07:32:05 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-27d0e994ae3so1080633fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734161524; x=1734766324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wooyMz6V69rOWgXVqv8x+ga9QCy693idFla4iIf30yA=;
 b=exW7/Nb2JMqdbQh/jAtccqsv44iHLVVbNxoLl9Sd7V0ycSPJIv88nFi/fNxKGMS1YC
 N0gWQpq0BYeCPqenjshNpurjuwMEJlDKKDLruBm66rSBL8+s7ggeWccVP/7zAn2CG3bo
 /bzZxiQccuwZgMdy2+SWPR9qYlW1eQzWfHo9n7X+2tV5xTHJ7UdwaXO764lsNXJPeG9x
 ayI9cw/b4Z9mhmHZFG7ns42UKQ0IoylJ4bnwtOkyj0xYH89qMwG3g7bWLRDhJaSA/qqv
 EzffgOCwRiMdr1j2o/qi5pQqfyiIzeg11Jj85AYTGJDCfG3zFAfSi3GnxQG02u2XqYVn
 L2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734161524; x=1734766324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wooyMz6V69rOWgXVqv8x+ga9QCy693idFla4iIf30yA=;
 b=XEqYRA7K0QRRw4Jb02u3TAwZk+oWx38BG7XpfdR+q39ZvVAmQ7o3K1UJTy6Q0Up7zM
 qQ49FHFQet3Rcnn7S5AB/G8vjoCo+xsgr2XuZsL9yjQtF8NXWlbTMJg/wBDcXtc6jfSC
 YRSFXYJd+ZOT4DHYcZZeSOsW8f5NCS3CI+vwP/lkvd5uuR5XcDGVFddmMvWy9/2nei3N
 1WeRcdmWDYKwQquPrejM7NRmyNm6eTs+EqyOkj1IGEA6ecs3ceRht4NlyWtSPWgyZvG7
 0sxYc6ntxztEVnwQ7/8mXIe4xVoGevvpETYz5E/o4L03Xb3Sdux7/FW0Jc3OfDTCuD5p
 S43Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6nEXz1qKuv2OU4w6zyxGrs8FhcUjRnrQLQF3RUTBxdtw8pwLC34ZC0MeeQrxyawrli3Q0+WcP5wE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3RmpQ6OBTGir9OQhEhlqeBiT8IutViNJ/atQcZm1Z5ZKje8Gk
 3IRxxxV5d34lplwuhAijIHmeqZKwopqMI0F9sWCU3pKlMoisbjsc/p5QovRadUFjb+Z2gzCbfmz
 nPIjx4qfW8hLWv43O0zyJXXoGZIA=
X-Gm-Gg: ASbGncsdCJ0sywa2rjHsqKxEFZjcbufVjO6ILHADoouOz7Ynyn2vgqgbnq9r2yIUchf
 KeQyxCnPqnlk9KFKXW8JkEWDfje9B2nc9MfdE3qEWhHMmSW/qaO9G1QItl8xu6G1TeFpNyfnK
X-Google-Smtp-Source: AGHT+IGmFywcjc7izrlDXgnkzLIqMiL0MnGMAOEArWH0D15iqh0keA0TjPRq8hM4SyuuwLNun7DH3X+llzzdV2xoAhI=
X-Received: by 2002:a05:6870:7011:b0:29e:3d0b:834 with SMTP id
 586e51a60fabf-2a3ac614135mr3251697fac.5.1734161524360; Fri, 13 Dec 2024
 23:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-2-me@crly.cz>
 <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
In-Reply-To: <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 13 Dec 2024 23:31:38 -0800
Message-ID: <CA+E=qVeroOt_L-r--K7uYrS+039x-BtgciVqoez5CmOtmYyqVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in TCON0
 mux
To: Roman Beranek <me@crly.cz>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Oltmanns <frank@oltmanns.dev>, 
 Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megi@xff.cz>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Dec 13, 2024 at 10:29=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.=
com> wrote:
>
> On Thu, May 4, 2023 at 10:34=E2=80=AFPM Roman Beranek <me@crly.cz> wrote:
> >
> > TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X)=
,
> > however MIPI DSI output only seems to work when PLL_MIPI is selected an=
d
> > thus the choice must be hardcoded in.
> >
> > Currently, this driver can't propagate rate change from N-K-M clocks
> > (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> > in setting of the TCON0 data clock rate, limiting the precision with
> > which a target pixel clock can be matched.
> >
> > For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotcloc=
k
> > can deviate up to 8% off target.
>
> Hi Roman,
>
> I'm a bit late, but this patch breaks the LCD on Pine64 Pinebook. When
> TCON0 parent is pll-mipi, the panel is blank and I get vblank timeouts.
>
> With this patch reverted it works if I force pll-video-2x as a parent for=
 TCON0.

And changing TCON0 parent in runtime by poking CCU registers also
fixes the issue (even though pll-video-2x is *much* slower than
pll-mipi), i.e. if I do "devmem2 0x01c20118 w 0x82000000" the picture
appears on the screen.

> So for me RGB output doesn't seem to work with PLL_MIPI, but works
> only with PLL_VIDEO0_2X. Any ideas on how to fix it?
>
> Regards,
> Vasily
>
>
>
> > Signed-off-by: Roman Beranek <me@crly.cz>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-=
ng/ccu-sun50i-a64.c
> > index 41519185600a..eb36f8f77d55 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > @@ -528,11 +528,18 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de=
_parents,
> >                                  0x104, 0, 4, 24, 3, BIT(31),
> >                                  CLK_SET_RATE_PARENT);
> >
> > +/*
> > + * DSI output seems to work only when PLL_MIPI selected. Set it and pr=
event
> > + * the mux from reparenting.
> > + */
> > +#define SUN50I_A64_TCON0_CLK_REG       0x118
> > +
> >  static const char * const tcon0_parents[] =3D { "pll-mipi", "pll-video=
0-2x" };
> >  static const u8 tcon0_table[] =3D { 0, 2, };
> >  static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents=
,
> >                                      tcon0_table, 0x118, 24, 3, BIT(31)=
,
> > -                                    CLK_SET_RATE_PARENT);
> > +                                    CLK_SET_RATE_PARENT |
> > +                                    CLK_SET_RATE_NO_REPARENT);
> >
> >  static const char * const tcon1_parents[] =3D { "pll-video0", "pll-vid=
eo1" };
> >  static const u8 tcon1_table[] =3D { 0, 2, };
> > @@ -953,6 +960,11 @@ static int sun50i_a64_ccu_probe(struct platform_de=
vice *pdev)
> >
> >         writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> >
> > +       /* Set PLL MIPI as parent for TCON0 */
> > +       val =3D readl(reg + SUN50I_A64_TCON0_CLK_REG);
> > +       val &=3D ~GENMASK(26, 24);
> > +       writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
> > +
> >         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_d=
esc);
> >         if (ret)
> >                 return ret;
> > --
> > 2.32.0 (Apple Git-132)
> >
> >
