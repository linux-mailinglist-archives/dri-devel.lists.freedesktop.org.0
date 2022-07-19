Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B5157A04B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB7818B7FB;
	Tue, 19 Jul 2022 14:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DF518B7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 14:03:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id fy29so26229854ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rsrPg7hNziGYnKEMeRo9/Xmgr6YPnnv44viQ9ITtKBs=;
 b=hcrWa6vWZpuZeT/weDaTEGbN3DEpdRro7xoVb4o+uwLjgB56NzRAi9aBxJOiXo46i8
 GuWJcq1fTmIxp/+3QbJwr6o2ybN7NhTGX3XkgM6ytZnIjW4ACTOWHNjnCqzUDkI2Dh4b
 C+f5LKxSjA1g5Kv2ajS/hMk7Bw85wXsXPtZyyBcvlerTzUzmGSvhv4HsmNZHCzS95Npr
 4J5L862bdMERC4am/H8+8cfLIM2mPz8PcOSQB6wsAZXXkHiNOIEpL1lNjDmVojXCA6rH
 SnL1eqoIwEphGJ1he9YKX+meZw8/YjBICdb5/EPQyamTZIiJ7v/TLgrFLjO9Sz/jZb5S
 n1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rsrPg7hNziGYnKEMeRo9/Xmgr6YPnnv44viQ9ITtKBs=;
 b=x6avRTXOc6iJ/et1/GMOc5iYLIu9bybldhxAVpU3YBVI++xnRbKcCIRgeUrwTIpG7z
 jldINUld3pyMeE4fQtGFZ31XeM0rQvLJjqeVnMxjYqvkkvmQEabxIeSv8QRGnRYluE3R
 tB5mWVRnMwrPOcjWOd83i2v2Ljoq4WLpXBv9Qr8E26WBfs1glIFR7wf04873qdgJv/f4
 5KmRrHBtWhYbwCR9ocim1V6cq+fyFmf0vOkrjrdGRxSeyNKGgufM1d5IWW6wSJZby4iP
 a2aUaT4gz+ga+qg026VHvVxcRAGye6zoK0Iyrpes0uwNeZV0B8vaKXHno4CEdRVe9emP
 a4dw==
X-Gm-Message-State: AJIora+bqVVSY9d+AgH8vp+d+94hsvz6ElrJuIoDTj2JiZbE1fmpuXCP
 9OlMHYJre++xlFAhgSYrIoumxR/UBm+0NRCQYj4rdg==
X-Google-Smtp-Source: AGRyM1usGvb/5X/2EHmga3QTDIzhjHhcpsEt1FiyvphTnQ1PPKWozSvoBeBm+WGVDP7skJ/Yhj3i8y0QB3PUqHMHIA4=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr31426400ejc.294.1658239436732; Tue, 19
 Jul 2022 07:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-7-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-7-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:03:40 +0100
Message-ID: <CAPY8ntAUS0GMik2=PGeg8209yWjqUxmWV8az=YQczkE-tAw0XQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/12] drm/bridge: cros-ec-anx7688: Use
 drm_bridge_funcs.atomic_check
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 Jul 2022 at 18:45, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
>
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: chrome-platform@lists.linux.dev
> ---
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c | 28 +++++++++++++++---------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> index 0f6d907432e3..fc19ea87926f 100644
> --- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> +++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> @@ -5,6 +5,7 @@
>   * Copyright 2020 Google LLC
>   */
>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_print.h>
>  #include <linux/i2c.h>
> @@ -45,9 +46,10 @@ bridge_to_cros_ec_anx7688(struct drm_bridge *bridge)
>         return container_of(bridge, struct cros_ec_anx7688, bridge);
>  }
>
> -static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                             const struct drm_display_mode *mode,
> -                                             struct drm_display_mode *adjusted_mode)
> +static int cros_ec_anx7688_bridge_atomic_check(struct drm_bridge *bridge,
> +                                              struct drm_bridge_state *bridge_state,
> +                                              struct drm_crtc_state *crtc_state,
> +                                              struct drm_connector_state *conn_state)
>  {
>         struct cros_ec_anx7688 *anx = bridge_to_cros_ec_anx7688(bridge);
>         int totalbw, requiredbw;
> @@ -56,13 +58,13 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>         int ret;
>
>         if (!anx->filter)
> -               return true;
> +               return 0;
>
>         /* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
>         ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
>         if (ret < 0) {
>                 DRM_ERROR("Failed to read bandwidth/lane count\n");
> -               return false;
> +               return ret;
>         }
>         dpbw = regs[0];
>         lanecount = regs[1];
> @@ -71,28 +73,34 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>         if (dpbw > 0x19 || lanecount > 2) {
>                 DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
>                           lanecount);
> -               return false;
> +               return -EINVAL;
>         }
>
>         /* Compute available bandwidth (kHz) */
>         totalbw = dpbw * lanecount * 270000 * 8 / 10;
>
>         /* Required bandwidth (8 bpc, kHz) */
> -       requiredbw = mode->clock * 8 * 3;
> +       requiredbw = crtc_state->mode.clock * 8 * 3;
>
>         DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
>                       totalbw, dpbw, lanecount, requiredbw);
>
>         if (totalbw == 0) {
>                 DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
> -               return true;
> +               return 0;
>         }
>
> -       return totalbw >= requiredbw;
> +       if (totalbw < requiredbw)
> +               return -EINVAL;
> +
> +       return 0;
>  }
>
>  static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
> -       .mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
> +       .atomic_check = cros_ec_anx7688_bridge_atomic_check,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>
>  static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
> --
> 2.34.1
>
