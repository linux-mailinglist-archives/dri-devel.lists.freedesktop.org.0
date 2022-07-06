Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EEF568CBC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F59210F60F;
	Wed,  6 Jul 2022 15:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476610F594
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:28:30 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x10so12394392edd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=95Ju5UIU+ZXf/lt0FXANvssZp/y8xQPFfz+5+9Ct3/4=;
 b=GGtC41CAfn/GeCePBFjSObb0ylVIV5m2PkwnBx/zIZB+21J0ei2UlYs+KiiLbdUt7b
 NPjRfNPXuzFvR3ifSE28IYgjDE90Ec/er/uN7xwb9JZ22fYYeFdahi9fAG6mxfNk3KNK
 vyH+OFvCp0u6o1xD03X9IHQDyTE5mRmIbCGduW/KCvuidbnTcLrpeM55sTsB1PXpFx98
 sMVAxEzsjSWBfyuZrhRbil14GXZEVpEHxSHJYbpP844JmS4iJyPnPvNA+34JQ8YMJc8p
 eEincwX85t9qYQW5kjWFqbWxaUdTPwD+UK3/QXjEjBok0CXha4L0OwfhVNv73wkj5qIX
 78OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=95Ju5UIU+ZXf/lt0FXANvssZp/y8xQPFfz+5+9Ct3/4=;
 b=PzWEy9gbgioQS1JRBZXLluKw887Hx+0hYLXMNZ3WDHtgS4jyaS+DrGAAEomDVv0Qcn
 aN96BYLl0xxH/Uwp95xllapxoLuUUM1jb33X5Zj+Ao/EmV45mbMS0j5RA6CIn0YtJeOb
 28VwOvOZDd3E0k2HOhujwPL+EQlVYl5IKVUYexzAwMBnHWkPZ4fqEYuDcs6X9RqEWyvr
 B4IqQ1kY6noiVZ6TYANbJxCEC+VweJBGpJGu4TXplK+KtXsUW26nHP/ddYN4XSU3pivL
 HqX9rJiAbD3Ogf1co+8zdYuV5orw7pg9JoIQqnQIo1GUDDpYem1f+cQT2qhqk9JkXdCx
 HtNQ==
X-Gm-Message-State: AJIora8y90oKhXYzp/Qz9k1Bna7Fi64IAFmUYenIt0mPfyvYJNPeNuvU
 uPr6x/IweUtnlqPfKYVDur7AjsXxV8XMf5QXOLCoiQ==
X-Google-Smtp-Source: AGRyM1uVEA4yw0Exi9OmZEIfu7Ap3SqKz+HAwInt/zz+dF7RZwcmi4KbBye2QcNgVh/T3qyx9CFk1GyK3VzhORcvwFU=
X-Received: by 2002:a05:6402:194f:b0:43a:298f:f39c with SMTP id
 f15-20020a056402194f00b0043a298ff39cmr26356529edz.106.1657121308848; Wed, 06
 Jul 2022 08:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220703184007.3488567-1-sam@ravnborg.org>
 <20220703184007.3488567-2-sam@ravnborg.org>
In-Reply-To: <20220703184007.3488567-2-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 6 Jul 2022 16:28:12 +0100
Message-ID: <CAPY8ntDf5AYsL8biCd_=wHZ=sN2WJxvWm_GVosJERQrTt5Q1BA@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam

On Mon, 4 Jul 2022 at 17:18, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Move away from the deprecated enable/disable operations in
> drm_bridge_funcs and enable atomic use.

If you're moving to the atomic API, shouldn't you also be getting the
mode from the provided state, rather than
ti_sn_bridge_set_video_timings() having a rummage to find the crtc and
encoder state via &pdata->bridge.encoder->crtc->state->adjusted_mode?

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/ti-sn65dsi86.c#L904

  Dave

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
