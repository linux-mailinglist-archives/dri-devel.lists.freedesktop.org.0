Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE35A4FAF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C1110EE0A;
	Mon, 29 Aug 2022 14:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242D110F37B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 14:54:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lx1so16175607ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=yBRBRHo8yZeHzV7+MoMTg9wUZfL9GXCxYX2MsVtvWEQ=;
 b=lGA9WUx6qN9TUsAaa2MLVyxa2Q0RPNBGywlVu0zHbywW/CMSo1l6HpOIKicqk/7sbQ
 fB+1/YPwRw5j6iiCI7CEWIdlT8VtZc1szzY9dDtC99Cd3S/9DozUJjjgALf1Vvp9mWQg
 Fiiw9YCelTBs1yCOzTzn53bfYT7xgfP7Cj6lBpkCJw8zCj82VHsx/3ltcBUMjC335PtN
 CqipfVNm/12qaJGAurSM6Mr8X/LpNX5XH5a03TNhkrDAsjol7bmW3n77mHJ60N5W2uC2
 RdGDr4+wnQicY1FOs9d3wLatmUw6voeOisrYwp8iyaQowf86Xf60J3HWtYjH1o77bhmD
 STww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=yBRBRHo8yZeHzV7+MoMTg9wUZfL9GXCxYX2MsVtvWEQ=;
 b=wZAJBBixpWJmBi56yC37JcoMWBq7CRqC/BpRILGqmqry9IW9Z0L1v2+1AV0KtIZelt
 9ahk81XTw/hdNVq/SXL5fVVX3nyl/3IM8feCVN2mefmfxO9eQ6fRQ6RzVPEMioS/mQyu
 lcj+bPNT4cLDLZBbSLEwob2A9rww/5/yUJxNDlv5X8KeblXbOZtBEyklSai2iKIyklJM
 b3ti2bkPNsVoXCx4gvg4Q8UoNNsvcQDSXqqF68ILP8BkzQP5oeN2vqpla9SsaFo2W4an
 X+wjWu42H+rsoLmE2LEtVIkS8yMORW1+AS5towcxkG2EJQ4RVDaH4tPi5mK7+YK1nhav
 aZVA==
X-Gm-Message-State: ACgBeo37KE8ZkTM1UCHlDMKjcpLXh6rEVzgVO9juINFYPl/R07Jtc+hi
 y0JFPT2hkHwXWQxROu9yEy3O88GPibATGe5xpZfugCvpQTA=
X-Google-Smtp-Source: AA6agR6v5r/etDXMo42PQzwTbSkv12vw/4I5NWpXROamvhjLjWr92EdUqIuvMpnAyPGFzOYET+vj52460/YNsXjbxSg=
X-Received: by 2002:a17:907:6092:b0:731:59f0:49ac with SMTP id
 ht18-20020a170907609200b0073159f049acmr13803889ejc.383.1661784890598; Mon, 29
 Aug 2022 07:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220801131747.183041-1-marex@denx.de>
 <20220801131747.183041-2-marex@denx.de>
In-Reply-To: <20220801131747.183041-2-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 16:54:39 +0200
Message-ID: <CAG3jFysY96ocbVBadmNYh6G=CxxYg+fiEK3aeQ9XSVjdwm_oYQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: bridge: icn6211: Add support for external REFCLK
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Marek,

On Mon, 1 Aug 2022 at 15:18, Marek Vasut <marex@denx.de> wrote:
>
> The ICN6211 is capable of deriving its internal PLL clock from either
> MIPI DSI HS clock, external REFCLK clock, or even internal oscillator.
> Currently supported is only the first option. Add support for external
> REFCLK clock input in addition to that.
>
> There is little difference between these options, except that in case
> of MIPI DSI HS clock input, the HS clock are pre-divided by a fixed /4
> divider before being fed to the PLL input, while in case of external
> REFCLK, the RECLK clock are fed directly into the PLL input.
>
> Per exceptionally poor documentation, the REFCLK must be in range of
> 10..154 MHz.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 39 +++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 65966f280cf4e..7ee1858bab321 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -11,6 +11,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -151,6 +152,8 @@ struct chipone {
>         struct regulator *vdd1;
>         struct regulator *vdd2;
>         struct regulator *vdd3;
> +       struct clk *refclk;
> +       unsigned long refclk_rate;
>         bool interface_i2c;
>  };
>
> @@ -273,7 +276,10 @@ static void chipone_configure_pll(struct chipone *icn,
>          * It seems the PLL input clock after applying P pre-divider have
>          * to be lower than 20 MHz.
>          */
> -       fin = icn->dsi->hs_rate / 4; /* in Hz */
> +       if (icn->refclk)
> +               fin = icn->refclk_rate;
> +       else
> +               fin = icn->dsi->hs_rate / 4; /* in Hz */
>
>         /* Minimum value of P predivider for PLL input in 5..20 MHz */
>         p_min = clamp(DIV_ROUND_UP(fin, 20000000), 1U, 31U);
> @@ -318,16 +324,18 @@ static void chipone_configure_pll(struct chipone *icn,
>         best_p_pot = !(best_p & 1);
>
>         dev_dbg(icn->dev,
> -               "PLL: P[3:0]=%d P[4]=2*%d M=%d S[7:5]=2^%d delta=%d => DSI f_in=%d Hz ; DPI f_out=%d Hz\n",
> +               "PLL: P[3:0]=%d P[4]=2*%d M=%d S[7:5]=2^%d delta=%d => DSI f_in(%s)=%d Hz ; DPI f_out=%d Hz\n",
>                 best_p >> best_p_pot, best_p_pot, best_m, best_s + 1,
> -               min_delta, fin, (fin * best_m) / (best_p << (best_s + 1)));
> +               min_delta, icn->refclk ? "EXT" : "DSI", fin,
> +               (fin * best_m) / (best_p << (best_s + 1)));
>
>         ref_div = PLL_REF_DIV_P(best_p >> best_p_pot) | PLL_REF_DIV_S(best_s);
>         if (best_p_pot) /* Prefer /2 pre-divider */
>                 ref_div |= PLL_REF_DIV_Pe;
>
> -       /* Clock source selection fixed to MIPI DSI clock lane */
> -       chipone_writeb(icn, PLL_CTRL(6), PLL_CTRL_6_MIPI_CLK);
> +       /* Clock source selection either external clock or MIPI DSI clock lane */
> +       chipone_writeb(icn, PLL_CTRL(6),
> +                      icn->refclk ? PLL_CTRL_6_EXTERNAL : PLL_CTRL_6_MIPI_CLK);
>         chipone_writeb(icn, PLL_REF_DIV, ref_div);
>         chipone_writeb(icn, PLL_INT(0), best_m);
>  }
> @@ -463,6 +471,11 @@ static void chipone_atomic_pre_enable(struct drm_bridge *bridge,
>                                       "failed to enable VDD3 regulator: %d\n", ret);
>         }
>
> +       ret = clk_prepare_enable(icn->refclk);
> +       if (ret)
> +               DRM_DEV_ERROR(icn->dev,
> +                             "failed to enable RECLK clock: %d\n", ret);
> +
>         gpiod_set_value(icn->enable_gpio, 1);
>
>         usleep_range(10000, 11000);
> @@ -473,6 +486,8 @@ static void chipone_atomic_post_disable(struct drm_bridge *bridge,
>  {
>         struct chipone *icn = bridge_to_chipone(bridge);
>
> +       clk_disable_unprepare(icn->refclk);
> +
>         if (icn->vdd1)
>                 regulator_disable(icn->vdd1);
>
> @@ -618,6 +633,20 @@ static int chipone_parse_dt(struct chipone *icn)
>         struct device *dev = icn->dev;
>         int ret;
>
> +       icn->refclk = devm_clk_get_optional(dev, "refclk");
> +       if (IS_ERR(icn->refclk)) {
> +               ret = PTR_ERR(icn->refclk);
> +               DRM_DEV_ERROR(dev, "failed to get REFCLK clock: %d\n", ret);
> +               return ret;
> +       } else if (icn->refclk) {
> +               icn->refclk_rate = clk_get_rate(icn->refclk);
> +               if (icn->refclk_rate < 10000000 || icn->refclk_rate > 154000000) {
> +                       DRM_DEV_ERROR(dev, "REFCLK out of range: %ld Hz\n",
> +                                     icn->refclk_rate);
> +                       return -EINVAL;
> +               }
> +       }
> +
>         icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
>         if (IS_ERR(icn->vdd1)) {
>                 ret = PTR_ERR(icn->vdd1);
> --
> 2.35.1
>

This patch looks good to me, but it doesn't apply on drm-misc-next. Do
you mind re-spinning it?

Rob.
