Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F30568C5A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F1111B7C5;
	Wed,  6 Jul 2022 15:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8D011B7C5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:09:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id fd6so19671797edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWkPAvso+ZOY5J8m11tm/D33qCyCvXMXIKAra4EHeoQ=;
 b=Ul3PKAfjjUI3een1wMpx82e0JWlIoNp6SACtn929e6XH1v+tLcuoBHS20ZPHavPmTJ
 owOy3ATFv3bBf3EkeLWvjyEHtapBIITsqw2PBSzi8BuBM4t7FC1cr57KK5G0BxjxK87H
 7BYg/HKZyMk3qc4JUILB+ciIjjsFWRyd8xmH/IQW5EfBl5sucZknFy5u+nKU/9mNqLH7
 40Uo8ZNQ237yq8efoNXOttqV8nGZA9UCLAjy3z9rNuIXOXNJgKxXh6MWhaZkaA89dktc
 SBPmA56oCaxH9kv7m/9N3k9Dz39SF8f2am/XbIz5cvK7RtayYwDe+ObwicChiz/o8Er6
 8gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWkPAvso+ZOY5J8m11tm/D33qCyCvXMXIKAra4EHeoQ=;
 b=sGIkDRcBmVNNcaWyjyx8YH4LYWEEu5z0Tnh1G5cNtfmKT9Cqfq8UwNAnzzKgUCeRrD
 M6GsiAMUJ30fQlNYBR678wILRXdDl9mdG0GpxnoRPNou+d9qwFk8zC1DcHEyXeI2NDkr
 MAMi9wbb5gncTREebQJx3uWLNyOsN4SXh277R0FG5JQku0NDajzp8+qq0c2+kkyywf28
 t8upbZEbWoxRs35OE6nrCdzpQYRW5DN3LYzD4Nm5cEHv7L/6otaMAjArVdVfsIeisxki
 PUcP9Jn8RXjXjIhd0izPY+zxTWYxcRZHdScMovAxWjWcDkzvqSx10GFfEYocECKpm9qv
 AsNQ==
X-Gm-Message-State: AJIora/TIAq1m2c1BlR6QLn37F/ZmIDCH2Ryc+E24tUsWyG7seNB80tJ
 cxHeAqOpMQVrmVYaUKxeCk0yv0prxGORIiC8D7MrNA==
X-Google-Smtp-Source: AGRyM1tkptQtQ/hm9yp8mb1+Q6DRIbca8Q8vdZkFVa0SM0coRxgvEgzd94Ct1G0VXK9IXYeqB7jbG/DS5b6tI2+o1Z8=
X-Received: by 2002:a05:6402:248c:b0:437:afe7:818b with SMTP id
 q12-20020a056402248c00b00437afe7818bmr54139444eda.239.1657120158562; Wed, 06
 Jul 2022 08:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220703184007.3488567-1-sam@ravnborg.org>
 <20220703184007.3488567-2-sam@ravnborg.org>
In-Reply-To: <20220703184007.3488567-2-sam@ravnborg.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Jul 2022 17:09:07 +0200
Message-ID: <CAG3jFyvmMoi7iFaVi00XoXx71rE7WJ9oFcDfF7SiFOo1RPExng@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/bridge: ti-sn65dsi86: Use atomic variants of
 drm_bridge_funcs
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 3 Jul 2022 at 20:40, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Move away from the deprecated enable/disable operations in
> drm_bridge_funcs and enable atomic use.
>
> v3:
>  - Drop use of DRM_BRIDGE_STATE_OPS
>
> v2:
>  - fix build (kernel test robot <lkp@intel.com>)
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c2b9227f7042..d6dd4d99a229 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>         return MODE_OK;
>  }
>
> -static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>
> @@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>         return ret;
>  }
>
> -static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> +                                      struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>         const char *last_err_str = "No supported DP rate";
> @@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>                            VSTREAM_ENABLE);
>  }
>
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +                                          struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>
> @@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>         usleep_range(100, 110);
>  }
>
> -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +                                            struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>
> @@ -1114,10 +1118,13 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .attach = ti_sn_bridge_attach,
>         .detach = ti_sn_bridge_detach,
>         .mode_valid = ti_sn_bridge_mode_valid,
> -       .pre_enable = ti_sn_bridge_pre_enable,
> -       .enable = ti_sn_bridge_enable,
> -       .disable = ti_sn_bridge_disable,
> -       .post_disable = ti_sn_bridge_post_disable,
> +       .atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> +       .atomic_enable = ti_sn_bridge_atomic_enable,
> +       .atomic_disable = ti_sn_bridge_atomic_disable,
> +       .atomic_post_disable = ti_sn_bridge_atomic_post_disable,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  };
>
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> --
> 2.34.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
