Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028957A0B3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2BE18BF4F;
	Tue, 19 Jul 2022 14:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6691418BF8E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 14:09:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id j22so27429800ejs.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u8sLlbZKcYVwqChBzOR8a7SbN4VOIEkVLaJpmGxf1u8=;
 b=S4sSw4dPG9SoIscVCdBbw23gLQXegfD1TkIApRxUyVaz4Lk+4tqsgVjhX7TOzjd6Is
 /5DnmmmSvRPYTOQnlVzVSdPc/EEPWSixLP80fWE5TRy0sVDHHSidsaUXEDv3dmwvt19n
 wDF6u4wZBZskt7/AQ8kG+73zWr1KFlEQDV/t6r2v/SU5fpBxDgQzRwbhLqatihkNuoQ5
 TreVDvedfrbpmBjJNp8iihxBQWHqaqEFPuBJvNjcZAw/gisZ5vXx5VZESnFkLl2GOCNL
 T8QFk5vB1DXMLTK3C2tSP8Lfs+f5/nSrsh+72N8UWxmFfb4/FrAr/QrEi6e+kV9vpiB6
 mHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u8sLlbZKcYVwqChBzOR8a7SbN4VOIEkVLaJpmGxf1u8=;
 b=bRH7jwUK6FBbsFtrBCiikmg7GT0NREyRtUC2DXuLwHHVGZEbFj5rR988Zbqz7OMD0S
 PZlkqMMFKkf7EqYbkSRDDCjk656BfYfD3hn782z0W+36Ub4aVWOpTEy4WWMcN6hnkR8e
 WlkHRIykphAQsFFGrj7I9mFjHQwsEl+3GXOCDDTVWC4IEZXqoQ9RBNTV8JT7IFLMrLcB
 H6wd9KGh0Y5nFvL6WSt0JC6tTHTYZGZeF7bOWl6U+VFIjEoJ78Orp3XsK1PGtdCenqjf
 ccVbxW8aiYpiRQ639BeKBWKXGQ5ZYS16rlUsIaaL6aPiU2xNb1/cp7qZeYIl+LtYvBIR
 KN2w==
X-Gm-Message-State: AJIora89nItQD/wK9wZIdW3dmP55uRtf5t7mjWczyjLYK5LgYUt3VXFk
 I7BOxz83Cv6l8WetMDyujqBWWpt9nWoU1bsIwB1KtA==
X-Google-Smtp-Source: AGRyM1udjkXGNICxc5l46Ad38az3eGQyrcMk/c2xHDg4URlYogp6zX3h1ScYex5vj2vhyr7QFOwl7+d/nHFljbt8Hdw=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr31450934ejc.294.1658239754935; Tue, 19
 Jul 2022 07:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-8-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-8-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:08:58 +0100
Message-ID: <CAPY8ntCk=q1n+bCwJdv5MXbAc8PeRUUrwZ352BW_Ax6d550GKg@mail.gmail.com>
Subject: Re: [PATCH v1 07/12] drm/bridge: tc358767: Use
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
> When atomic_check() is defined, then mode_fixup() is ignored,
> so it had no effect that drm_bridge_funcs.mode_fixup was assigned.
> Embed the original implementation in the caller and drop the function.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

(There was a point when drm_bridge_chain_mode_fixup still existed, but
that's gone/going now).

> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 02bd757a8987..b2ab967504af 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1496,26 +1496,18 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
>                 dev_err(tc->dev, "main link disable error: %d\n", ret);
>  }
>
> -static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                const struct drm_display_mode *mode,
> -                                struct drm_display_mode *adj)
> -{
> -       /* Fixup sync polarities, both hsync and vsync are active low */
> -       adj->flags = mode->flags;
> -       adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> -       adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> -
> -       return true;
> -}
> -
>  static int tc_common_atomic_check(struct drm_bridge *bridge,
>                                   struct drm_bridge_state *bridge_state,
>                                   struct drm_crtc_state *crtc_state,
>                                   struct drm_connector_state *conn_state,
>                                   const unsigned int max_khz)
>  {
> -       tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> -                            &crtc_state->adjusted_mode);
> +       struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +
> +       /* Fixup sync polarities, both hsync and vsync are active low */
> +       adj->flags = crtc_state->mode.flags;
> +       adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +       adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>
>         if (crtc_state->adjusted_mode.clock > max_khz)
>                 return -EINVAL;
> @@ -1783,7 +1775,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>         .atomic_check = tc_edp_atomic_check,
>         .atomic_enable = tc_edp_bridge_atomic_enable,
>         .atomic_disable = tc_edp_bridge_atomic_disable,
> -       .mode_fixup = tc_bridge_mode_fixup,
>         .detect = tc_bridge_detect,
>         .get_edid = tc_get_edid,
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> --
> 2.34.1
>
