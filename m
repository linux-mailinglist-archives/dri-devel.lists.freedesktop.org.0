Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6468732E5B9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 11:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27836EB40;
	Fri,  5 Mar 2021 10:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC56E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 10:08:09 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id u18so1146813plc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 02:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GXPv2DXPXjrXg5fyChY0npbP53+5naub4cxs5k8FnjE=;
 b=pC44tl0rO91OEFPNhRVDMTM6V4bjAQpk3j1s4O9rkPpAb3WOc3nF94AG8Vgi6Un2yb
 JL9spn0uwW/aLo4pW+juYvNj5eoiph4HKeIycUsBaXosTnigcaRAZuotJX0aa1N7AL/I
 AHwDKbWNxqAFKumtdZ+UtjjkZsRR7Ha675B2vYAezFHcgR5gt9q9ie/dFSMBp6/uJnPm
 dltcrnSInzCYR+X5nhJjc+zTykLP5P8EI8FZ6uNMTy2wFqFZ8pLnBl9pMq7ldCnN+REI
 ZvzsQBh6XqqzuByvWzyokAdAWAYeQ+sUbn5W3bv6/TM/b1zx9MPMdD18q65D6OyjUY27
 +LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GXPv2DXPXjrXg5fyChY0npbP53+5naub4cxs5k8FnjE=;
 b=WITAhc09MtTkTsAWK8yeLP3jt2xY5h+AN6g8rX/u4XDGFNBN2to9d7XyBwSY9rZFu4
 Cc9SrA+mdoc9nDTpra/bI0Ub/nb12xnV2YQn87cV17PNUkuRkJQmmcaOQkJKzYQtHKPl
 k5lPT5X4cmlvN/xQGAZRek/QwKoJ6Has36S3AIP39KnFvNZjoPRl7ZCCg2q/75qh4tfP
 nPv6MJSvd4UbfzCsJ8RNFOY1BjdZPriZKczcT5ZVbhA2Infxfjfrw7Y8ctzVyoq7tBec
 HHGEemQq+ykHWwNb9KejdPEpSy89H2jClwELQWNqbYotz+g+OkBd7IhOsDFdhdtLnOYu
 Y8uQ==
X-Gm-Message-State: AOAM53315gckmJjiJ+c2GynFKUGchPIzcicjyErCMC7n5YqxbyCgtNPI
 4GXK6l+078lf896q+E0mNbcw7bg48b+bPuQRuW+Mow==
X-Google-Smtp-Source: ABdhPJy0Xh5JWTm6MhpMfyWTy9/YLhz+WdZKD5ObOM3STrYtUVh+b6JCcjgEyJhfaCbBdAEL5dvq++X32GQGRbWwKyg=
X-Received: by 2002:a17:902:b610:b029:e3:2b1e:34ff with SMTP id
 b16-20020a170902b610b02900e32b1e34ffmr7875516pls.69.1614938889597; Fri, 05
 Mar 2021 02:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
In-Reply-To: <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 5 Mar 2021 11:07:58 +0100
Message-ID: <CAG3jFyveF9rbMDT7DEjwndutEW54O_wQTVDe_FW=QeAvfpvADw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Move code in prep for EDID
 read fix
To: Douglas Anderson <dianders@chromium.org>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Douglas,

Thanks for splitting this out into its own patch.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 5 Mar 2021 at 00:53, Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch is _only_ code motion to prepare for the patch
> ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only if
> refclk") and make it easier to understand.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 196 +++++++++++++-------------
>  1 file changed, 98 insertions(+), 98 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 942019842ff4..491c9c4f32d1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -345,6 +345,104 @@ static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
>                                        pdata->supplies);
>  }
>
> +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> +{
> +       u32 bit_rate_khz, clk_freq_khz;
> +       struct drm_display_mode *mode =
> +               &pdata->bridge.encoder->crtc->state->adjusted_mode;
> +
> +       bit_rate_khz = mode->clock *
> +                       mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +       clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
> +
> +       return clk_freq_khz;
> +}
> +
> +/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
> +static const u32 ti_sn_bridge_refclk_lut[] = {
> +       12000000,
> +       19200000,
> +       26000000,
> +       27000000,
> +       38400000,
> +};
> +
> +/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
> +static const u32 ti_sn_bridge_dsiclk_lut[] = {
> +       468000000,
> +       384000000,
> +       416000000,
> +       486000000,
> +       460800000,
> +};
> +
> +static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
> +{
> +       int i;
> +       u32 refclk_rate;
> +       const u32 *refclk_lut;
> +       size_t refclk_lut_size;
> +
> +       if (pdata->refclk) {
> +               refclk_rate = clk_get_rate(pdata->refclk);
> +               refclk_lut = ti_sn_bridge_refclk_lut;
> +               refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
> +               clk_prepare_enable(pdata->refclk);
> +       } else {
> +               refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
> +               refclk_lut = ti_sn_bridge_dsiclk_lut;
> +               refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
> +       }
> +
> +       /* for i equals to refclk_lut_size means default frequency */
> +       for (i = 0; i < refclk_lut_size; i++)
> +               if (refclk_lut[i] == refclk_rate)
> +                       break;
> +
> +       regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> +                          REFCLK_FREQ(i));
> +}
> +
> +static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +       clk_disable_unprepare(pdata->refclk);
> +
> +       pm_runtime_put_sync(pdata->dev);
> +}
> +
> +static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +       pm_runtime_get_sync(pdata->dev);
> +
> +       /* configure bridge ref_clk */
> +       ti_sn_bridge_set_refclk_freq(pdata);
> +
> +       /*
> +        * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> +        * so the HPD is an internal signal that's only there to signal that
> +        * the panel is done powering up.  ...but the bridge chip debounces
> +        * this signal by between 100 ms and 400 ms (depending on process,
> +        * voltage, and temperate--I measured it at about 200 ms).  One
> +        * particular panel asserted HPD 84 ms after it was powered on meaning
> +        * that we saw HPD 284 ms after power on.  ...but the same panel said
> +        * that instead of looking at HPD you could just hardcode a delay of
> +        * 200 ms.  We'll assume that the panel driver will have the hardcoded
> +        * delay in its prepare and always disable HPD.
> +        *
> +        * If HPD somehow makes sense on some future panel we'll have to
> +        * change this to be conditional on someone specifying that HPD should
> +        * be used.
> +        */
> +       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +                          HPD_DISABLE);
> +
> +       drm_panel_prepare(pdata->panel);
> +}
> +
>  static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>                                enum drm_bridge_attach_flags flags)
>  {
> @@ -443,64 +541,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>         drm_panel_unprepare(pdata->panel);
>  }
>
> -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> -{
> -       u32 bit_rate_khz, clk_freq_khz;
> -       struct drm_display_mode *mode =
> -               &pdata->bridge.encoder->crtc->state->adjusted_mode;
> -
> -       bit_rate_khz = mode->clock *
> -                       mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -       clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
> -
> -       return clk_freq_khz;
> -}
> -
> -/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
> -static const u32 ti_sn_bridge_refclk_lut[] = {
> -       12000000,
> -       19200000,
> -       26000000,
> -       27000000,
> -       38400000,
> -};
> -
> -/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
> -static const u32 ti_sn_bridge_dsiclk_lut[] = {
> -       468000000,
> -       384000000,
> -       416000000,
> -       486000000,
> -       460800000,
> -};
> -
> -static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
> -{
> -       int i;
> -       u32 refclk_rate;
> -       const u32 *refclk_lut;
> -       size_t refclk_lut_size;
> -
> -       if (pdata->refclk) {
> -               refclk_rate = clk_get_rate(pdata->refclk);
> -               refclk_lut = ti_sn_bridge_refclk_lut;
> -               refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
> -               clk_prepare_enable(pdata->refclk);
> -       } else {
> -               refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
> -               refclk_lut = ti_sn_bridge_dsiclk_lut;
> -               refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
> -       }
> -
> -       /* for i equals to refclk_lut_size means default frequency */
> -       for (i = 0; i < refclk_lut_size; i++)
> -               if (refclk_lut[i] == refclk_rate)
> -                       break;
> -
> -       regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> -                          REFCLK_FREQ(i));
> -}
> -
>  static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
>  {
>         unsigned int bit_rate_mhz, clk_freq_mhz;
> @@ -821,46 +861,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>         drm_panel_enable(pdata->panel);
>  }
>
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> -{
> -       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> -
> -       pm_runtime_get_sync(pdata->dev);
> -
> -       /* configure bridge ref_clk */
> -       ti_sn_bridge_set_refclk_freq(pdata);
> -
> -       /*
> -        * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> -        * so the HPD is an internal signal that's only there to signal that
> -        * the panel is done powering up.  ...but the bridge chip debounces
> -        * this signal by between 100 ms and 400 ms (depending on process,
> -        * voltage, and temperate--I measured it at about 200 ms).  One
> -        * particular panel asserted HPD 84 ms after it was powered on meaning
> -        * that we saw HPD 284 ms after power on.  ...but the same panel said
> -        * that instead of looking at HPD you could just hardcode a delay of
> -        * 200 ms.  We'll assume that the panel driver will have the hardcoded
> -        * delay in its prepare and always disable HPD.
> -        *
> -        * If HPD somehow makes sense on some future panel we'll have to
> -        * change this to be conditional on someone specifying that HPD should
> -        * be used.
> -        */
> -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -                          HPD_DISABLE);
> -
> -       drm_panel_prepare(pdata->panel);
> -}
> -
> -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> -{
> -       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> -
> -       clk_disable_unprepare(pdata->refclk);
> -
> -       pm_runtime_put_sync(pdata->dev);
> -}
> -
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .attach = ti_sn_bridge_attach,
>         .pre_enable = ti_sn_bridge_pre_enable,
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
