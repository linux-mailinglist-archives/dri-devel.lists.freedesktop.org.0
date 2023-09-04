Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C810C791115
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 07:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D348810E292;
	Mon,  4 Sep 2023 05:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B7710E0A0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 05:45:20 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4bdso1345950a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 22:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693806319; x=1694411119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MglyBahDCvrWMJ2RZEEmrN2FTqQO/eyX7/1BX76JNMA=;
 b=M6vcsz7EJgo386uQBtOlqpMO3aVbBxsr+7pzhROe4fsCrjWSvM+j/6dIfxWZbtNM4L
 HF0yGodGSRS82YnVe4luYH4el1i+nrNAgHF4IhgB/VHvc39sYGV/wPI/kwrXypJF5ML0
 eyP77dH1OA3BfFOXeUjAVD5zzt0NrSgvf9zMcr/yzT2HdZQJQQDdx6rsjzgtye0MsrOo
 57cFjABcA24EVJ6cuFJaYedmF2KsDmr3uCaEdMRl98mzBSxusvZ4qBIxR8jDZMVeHwAu
 NsHnsH+PqibKEeh8hNgAmvyKQi1epz0dC4VwOZD/kpQkSnjZ8boSq2ggy8ou3aCcdf8a
 XQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693806319; x=1694411119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MglyBahDCvrWMJ2RZEEmrN2FTqQO/eyX7/1BX76JNMA=;
 b=AJiWeyKF71D6qdjVOKF31omoj1Cv0Ph0I85yk9TbDXZAbN66xmbNQiLDhk+z7w7KeY
 GUkfOhZD3YM9Ks7zY5Kngp4Ff+2RkcxHlT6hKqTUKUGTYPPNqSuRJ1gLz7+zIiGtedzx
 E1So1WgWFgfoeGpWkAFWxlHqhqPP/RfArL1ZM3//6KR/e7XB4ukxKyT1MtLFA5BPvuow
 jL7v5/c024VUhQA9Cu34eo/urjtBLGSKBrV9KS/pVtnaAFazgSiPZPvsY+hsLhFo0Hyv
 2MMr9q4aNt/fQ3JT3JF3etQWQjECcpRJptWdcWPwe4yA0vUW1dOZUjghv+RWSz/NugaC
 CXNw==
X-Gm-Message-State: AOJu0Yzrf+qsGvrFEqKXxmCfIGcUEzKzpNkf/4r2iUR/0gYM3iDWqPjo
 qjNS2sl8dtUlHJzrOjnEjUIcUzEA3MCIrHZ6LEg=
X-Google-Smtp-Source: AGHT+IG8tkv3pgHLNQ+rbiqbFKIwSquIDVoNlAEQrDK2dlMnSMPK/remu92+rFnzLCkgMUq5HYBCs2xuIIn8MuDrXac=
X-Received: by 2002:a05:6402:1206:b0:523:2df6:395e with SMTP id
 c6-20020a056402120600b005232df6395emr6418956edw.31.1693806318816; Sun, 03 Sep
 2023 22:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-3-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-3-b39716db6b7a@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 4 Sep 2023 14:44:41 +0900
Message-ID: <CAAQKjZODcKE_O-Nb_qym0BqAZymUu9j24d+8-UXFsFQekJ=unw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference clock
To: Michael Tretter <m.tretter@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, kernel@pengutronix.de,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:59, =
Michael Tretter <m.tretter@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> The PLL requires a clock between 2 MHz and 30 MHz after the pre-divider.
> The reference clock for the PLL may change due to changes to it's parent
> clock. Thus, the frequency may be out of range or unsuited for
> generating the high speed clock for MIPI DSI.
>
> Try to keep the pre-devider small, and set the reference clock close to
> 30 MHz before recalculating the PLL configuration. Use a divider with a
> power of two for the reference clock as this seems to work best in
> my tests.

Clock frequency is specific to SoC architecture so we have to handle
it carefully because samsung-dsim.c is a common module for I.MX and
Exynos series.
You mentioned "The PLL requires a clock between 2 MHz and 3MHz after
pre-divider", and the clock means that fin_pll - PFD input frequency -
which can be calculated with oscillator clock frequency / P value?
According to Exynos datasheet, the fin_pll should be 6 ~ 12Mhz.

For example,
In case of Exyhos, we use 24MHz as oscillator clock frequency, so
fin_pll frequency, 8MHz =3D 24MHz / P(3).

Can you tell me the source of the constraint that clocks must be
between 2MHz and 30MHz?

To other I.MX and Exynos engineers, please do not merge this patch
until two SoC platforms are tested correctly.

Thanks,
Inki Dae

>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index da90c2038042..4de6e4f116db 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -611,10 +611,21 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
>         u16 m;
>         u32 reg;
>
> -       if (dsi->pll_clk)
> +       if (dsi->pll_clk) {
> +               /*
> +                * Ensure that the reference clock is generated with a po=
wer of
> +                * two divider from its parent, but close to the PLLs upp=
er
> +                * limit of the valid range of 2 MHz to 30 MHz.
> +                */
> +               fin =3D clk_get_rate(clk_get_parent(dsi->pll_clk));
> +               while (fin > 30 * MHZ)
> +                       fin =3D fin / 2;
> +               clk_set_rate(dsi->pll_clk, fin);
> +
>                 fin =3D clk_get_rate(dsi->pll_clk);
> -       else
> +       } else {
>                 fin =3D dsi->pll_clk_rate;
> +       }
>         dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
>
>         fout =3D samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
>
> --
> 2.39.2
>
