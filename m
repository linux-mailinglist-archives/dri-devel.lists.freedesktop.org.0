Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB649F1D02
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 07:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5347410E0CE;
	Sat, 14 Dec 2024 06:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nq6JFCy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0EF10E0CE
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 06:30:18 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5f2ed0b70d6so1075831eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734157817; x=1734762617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrI8qCQN85qm0XYiJc+jVTuy93Oh6KAdPLxuWkpi6aM=;
 b=Nq6JFCy+al/hjMWXhqUcQtO7ey68BiDcDaOzEbvPSCtSUlShUvkGp+2plG9xAMiMIs
 xHQnEhWnbpsOQA6qw0MZrWYbq+uf6oI9mApt3e4wmnZLO7ZmhmRvvmXQ3LbVrZ1txNIC
 sy7UZ9q1xD4vFwTwr5m2rCxqRXV9/qnG+vPcjEMitxBluiWVJDL9wL8N59gE7otIUEY5
 saXWM4Ao2w0iBeATf8p8WN7C4f12kIkfLNpcrAZZMWoUtCyHsyD4h+mpHqlE2smrrV+2
 467Wo4ehx+/xSd5ZgitnPMypK+o4jskAsDbGTgJJwiEhLCG7YBjhWwrMvQnHgM5CQOY2
 OSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734157817; x=1734762617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrI8qCQN85qm0XYiJc+jVTuy93Oh6KAdPLxuWkpi6aM=;
 b=gaXKr7RqpSu+ZJKAkD78E9FxvXKSkXufAKmABMrV+Nc9tnGADyZe7UdXMi7gkIFtmR
 LZxGofLbhX3sbZXVmgnSgeiTnz17A9Ujtjq1+VtmD5paVok5hPUlXAHaXq7dSPBlvzca
 wp6JBEPs3/b6oF2y1Yd7UaTFjGQryqlzRjhx4k94JanfY1IwLntR2/muK0WWKHjnT3aa
 0eLl0wA95zKYnLtOrrqZ1gSxgVX2SJLTR6y0V5ziMvmYVHj/80GitRCwuAtfQnZsNee5
 6wiTgf1bt+UK28kK1cvvXit+smSTTr4o6ITULXWK3md/qOGRgVlp3HJFqYaEaqPjmAqR
 BHLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZyxrtBobDmjIEYD8qWgcDuO2bHQilHWLh3KpGOixI2kbN2kMe+MLeR6VyZ69Cdn0h8dXNJ8K5R6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmQ1vrObzqqUnXggjSKjOn4WBuTLv+qJsCHB7CWu6ZV/KKy+7g
 MSO6/k5qlL0RM7omxZDgicHO90ezsRNcG2Z9YPkWX+GkvS2eyXI88EsKXuJ7Iqrnv4RJUSpibQS
 0CsBFv+icbMlzGqOvVOqOcSY7Cmw=
X-Gm-Gg: ASbGncuxV6HN7GnNWv8PzfIC+9woL8SAViRBJf8WigVucGXmf4lUay0LBwT9DorOL4c
 HYza83hlXO7XZTtROkYsE1xQ15qrx1CCKs2+hIU06DqL3ThkRxODYqhkY3U0c1JLzu4b8XWgf
X-Google-Smtp-Source: AGHT+IEPJNPA+UMoRL6Nd8OnH+KQK573OcmBMtIxEoDNfscNNNsJvvjIErYdh1Oh7XBBo4k+5gmKzsFAb+yk48Ks7y8=
X-Received: by 2002:a05:6870:828a:b0:29e:255e:9540 with SMTP id
 586e51a60fabf-2a3aca46b43mr2859925fac.35.1734157817408; Fri, 13 Dec 2024
 22:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-2-me@crly.cz>
In-Reply-To: <20230505052110.67514-2-me@crly.cz>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 13 Dec 2024 22:29:51 -0800
Message-ID: <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
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

On Thu, May 4, 2023 at 10:34=E2=80=AFPM Roman Beranek <me@crly.cz> wrote:
>
> TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X),
> however MIPI DSI output only seems to work when PLL_MIPI is selected and
> thus the choice must be hardcoded in.
>
> Currently, this driver can't propagate rate change from N-K-M clocks
> (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> in setting of the TCON0 data clock rate, limiting the precision with
> which a target pixel clock can be matched.
>
> For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotclock
> can deviate up to 8% off target.

Hi Roman,

I'm a bit late, but this patch breaks the LCD on Pine64 Pinebook. When
TCON0 parent is pll-mipi, the panel is blank and I get vblank timeouts.

With this patch reverted it works if I force pll-video-2x as a parent for T=
CON0.

So for me RGB output doesn't seem to work with PLL_MIPI, but works
only with PLL_VIDEO0_2X. Any ideas on how to fix it?

Regards,
Vasily



> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng=
/ccu-sun50i-a64.c
> index 41519185600a..eb36f8f77d55 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -528,11 +528,18 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_p=
arents,
>                                  0x104, 0, 4, 24, 3, BIT(31),
>                                  CLK_SET_RATE_PARENT);
>
> +/*
> + * DSI output seems to work only when PLL_MIPI selected. Set it and prev=
ent
> + * the mux from reparenting.
> + */
> +#define SUN50I_A64_TCON0_CLK_REG       0x118
> +
>  static const char * const tcon0_parents[] =3D { "pll-mipi", "pll-video0-=
2x" };
>  static const u8 tcon0_table[] =3D { 0, 2, };
>  static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,
>                                      tcon0_table, 0x118, 24, 3, BIT(31),
> -                                    CLK_SET_RATE_PARENT);
> +                                    CLK_SET_RATE_PARENT |
> +                                    CLK_SET_RATE_NO_REPARENT);
>
>  static const char * const tcon1_parents[] =3D { "pll-video0", "pll-video=
1" };
>  static const u8 tcon1_table[] =3D { 0, 2, };
> @@ -953,6 +960,11 @@ static int sun50i_a64_ccu_probe(struct platform_devi=
ce *pdev)
>
>         writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
>
> +       /* Set PLL MIPI as parent for TCON0 */
> +       val =3D readl(reg + SUN50I_A64_TCON0_CLK_REG);
> +       val &=3D ~GENMASK(26, 24);
> +       writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
> +
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_des=
c);
>         if (ret)
>                 return ret;
> --
> 2.32.0 (Apple Git-132)
>
>
