Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D055A54A4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE1910E2E9;
	Mon, 29 Aug 2022 19:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8908B10E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 19:42:13 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id og21so17803837ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6cTy6keoa6b646vo8Js7s0CIFmnj1Q2o4aqvygA4K3o=;
 b=DFxjElR5msx7cZgIJRZPd43/YEwRZgLSkWluSuIlAaCJTw3xRblAbfxzDvQ6842Ix7
 lJM5BC5VPvtKp9PDOjeXt1Vnmzjfx095NvtvDOLSh1q2LsieFFZt2W6oFuEFqk/MDV1P
 9s0c1LvOjVKHDYYmeTs18q9039vwHM10Xbmk2o/kXvKcP2Y7spxlh9mSz7JgxBqRS1m/
 mutRWNbZ7eQO6MGyGmXHBTVYPnJ9YHLX6xtlNC7geBZU8Kw2NAHci3irYScaPsiQpzjN
 Lrh82iQHzutGhmJaFb/BuuC7s54OFTIpiFPEVac8/EJghj/RPSjxFHLjcf3KvHYLs5Yl
 /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6cTy6keoa6b646vo8Js7s0CIFmnj1Q2o4aqvygA4K3o=;
 b=xM38LfaO5E0DYZqrrDqHK1kjteHkT6k6Yo0TfQfGXeY9not+fqVjLW+jOLyofKrzE3
 Cii4ibYhYZfoItCz6ROogFGaSwuC99s7Yz3E8JuA1ynxbyVNnNabCRpZaCg3PX+qQPc4
 WJC2F+fv8a5GFCa8wDzcps4u+9PW9Y5bRWOCJ/pIAnHW8aC7NmQqU+4d1mp8v3SGBy+A
 9oT2KAs/TQF/XGCoEC9MeJG1LCEMFKpIubdiw9evihIuyj4nwMkwoluH7okzMT9rKiai
 ehpTM8qN/MaoUyPrvTYdE0wNc0dhy7Z6/egM8C7u6KdiD1Tyo0Yjfhn8GdajbQGO4dkc
 xKXA==
X-Gm-Message-State: ACgBeo0tBVH7XBbx89g83HXlP7uDqhNl3kVHr1bpogBgckJACp79/Uv8
 a9R8OZlqzZ3RRtKHLmZqP+m3OGKN8OmJ1ly1Z+o=
X-Google-Smtp-Source: AA6agR7uH/lREQZQwl9H3i0GUO9N6GrUUJHUai+M6A9pycUtOdBDMUR87TRVuoIcQUVD/Y/8XtDbHmmiKYLJtrvlFIg=
X-Received: by 2002:a17:907:87b0:b0:731:3dfd:bc8d with SMTP id
 qv48-20020a17090787b000b007313dfdbc8dmr14315550ejc.607.1661802131774; Mon, 29
 Aug 2022 12:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <20220829184031.1863663-8-jagan@amarulasolutions.com>
In-Reply-To: <20220829184031.1863663-8-jagan@amarulasolutions.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 29 Aug 2022 14:42:00 -0500
Message-ID: <CAHCN7xKxS6oaX8kGYv_bhWfCFUEMBykN87BwXMPkcCg=OwKXrw@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P)
 offset
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 1:41 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> The i.MX 8M Mini Applications Processor Reference Manual, Rev. 3, 11/2020
> with 13.7.10.1 Master PLL PMS Value setting Register mentioned PMS_P offset
> range from BIT[18-13] and the upstream driver is using the same offset.
>
> However, offset 13 is not working on i.MX8M Mini platforms but downstream
> NXP driver is using 14 [1] and it is working with i.MX8M Mini SoC.

From the line you highlighted in the link, the downstream NXP ones
shows 13 if I'm reading it correctly.

#define PLLCTRL_SET_P(x) REG_PUT(x, 18, 13)

From what I can tell the PMS calculation here needs to be updated for
the Mini because the ranges of the FCO calculator are different.  Took
your series and tweaked it a bit [2] which changes a few settings, and
the PMS calculator appears to more closely match the values I get from
the NXP one.  I think it could be further tweaked because p min and
p_max also have changed.

>
> Not sure about whether it is reference manual documentation or something
> else but this patch trusts the downstream code and fixes the PLL_P offset.
>
> [1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211
>

[2] -https://github.com/aford173/linux/commit/a5fa184160ec9ea45a7546eaa0d8b8fc760cf3d9

> v4, v3, v2:
> * none
>
> v1:
> * updated commit message
> * add downstream driver link
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++++--
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index b6883a6d4681..b6d17c0c9e58 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -168,7 +168,7 @@
>  /* DSIM_PLLCTRL */
>  #define DSIM_FREQ_BAND(x)              ((x) << 24)
>  #define DSIM_PLL_EN                    (1 << 23)
> -#define DSIM_PLL_P(x)                  ((x) << 13)
> +#define DSIM_PLL_P(x, offset)          ((x) << (offset))
>  #define DSIM_PLL_M(x)                  ((x) << 4)
>  #define DSIM_PLL_S(x)                  ((x) << 1)
>
> @@ -368,6 +368,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
>         .max_freq = 1000,
>         .wait_for_reset = 1,
>         .num_bits_resol = 11,
> +       .pll_p_offset = 13,
>         .reg_values = reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
>         .max_freq = 1000,
>         .wait_for_reset = 1,
>         .num_bits_resol = 11,
> +       .pll_p_offset = 13,
>         .reg_values = reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
>         .max_freq = 1000,
>         .wait_for_reset = 1,
>         .num_bits_resol = 11,
> +       .pll_p_offset = 13,
>         .reg_values = reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -404,6 +407,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
>         .max_freq = 1500,
>         .wait_for_reset = 0,
>         .num_bits_resol = 12,
> +       .pll_p_offset = 13,
>         .reg_values = exynos5433_reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -416,6 +420,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
>         .max_freq = 1500,
>         .wait_for_reset = 1,
>         .num_bits_resol = 12,
> +       .pll_p_offset = 13,
>         .reg_values = exynos5422_reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -563,7 +568,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>         writel(driver_data->reg_values[PLL_TIMER],
>                         dsi->reg_base + driver_data->plltmr_reg);
>
> -       reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
> +       reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
> +             DSIM_PLL_M(m) | DSIM_PLL_S(s);
>
>         if (driver_data->has_freqband) {
>                 static const unsigned long freq_bands[] = {
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index e15fbfd49efe..95d3f89aec4f 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -47,6 +47,7 @@ struct samsung_dsim_driver_data {
>         unsigned int max_freq;
>         unsigned int wait_for_reset;
>         unsigned int num_bits_resol;
> +       unsigned int pll_p_offset;
>         const unsigned int *reg_values;
>         enum samsung_dsim_quirks quirks;
>  };
> --
> 2.25.1
>
