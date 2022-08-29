Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54755A4FB9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C311E10F349;
	Mon, 29 Aug 2022 14:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602E210F349
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 14:58:53 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z41so3091373ede.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8ikX97noJRXPruPyp1njHOVXEcZRTncuymAMeJZfpGI=;
 b=LkMV+1lJeQXZ3P10N9o4emgdK188gWQgFXyyvMLzoZTcS9dC/JKLzDYc7AbPmgILbO
 eCLjG+KCHigfNxVbXewmJ8zyMdhYJ/kF3pvmnklFbDqeWE6ebxNgPUkC+gTjLekvLHcp
 M/VJ5q8lVBHisIdR0B7CYTlFL1TtXKfYKPWsqDycBNOamSyPgwrNiVJnfLj9yFem7kmm
 AzVL4H5J8tWam730cXXjay5WEeD172YKKx2bT4gu24svFBwp35FAxzFju/R/diWqqHSm
 tGXLlqIBATJnpqG/pzUIQuZMpgirFK2uylyCehHzISZeHotpZRs9FdHBUTH9qebflGeU
 Ax8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8ikX97noJRXPruPyp1njHOVXEcZRTncuymAMeJZfpGI=;
 b=xGkgX8mBLyO8TUTKxK9bplTdgBIFLN7ogwhO4qN83DOcZEiCHiqPnlo7v/DdAl8CUa
 yxd0p+HZYV1B7nkAwEYRoiOEinlsZyYbIk8hW9gG/464RoCGZ1h3Rdgtpjn6ebgYjhwv
 f7NFou/FsHYx47uQj3rGHcw54uRomk736qba+aVa7MzLd3xa5zzOUb4Rlf4LFjzWEoVC
 fLVy5sXTEV1hG9v4JPS0qU1rxggSpu3EkTz1z/YpQOWA9q5c+kFGH6jVN00PMw5GvIYQ
 11Fv6Uua35tD0bl3/+UML1a1lqDb0jVHyOeNd9UNX7DTVQ1ryuzkWq4VLZLchu/AJUvG
 xJ6w==
X-Gm-Message-State: ACgBeo2EK3VTBF1qP+lsyMqJc2qLAQJOS1lIWbe23czMntD0Dd7T22Eb
 Fw3Qyg+gYKR1MjhIHbsVaijWpRLeX7FHSBJiRwgcKA==
X-Google-Smtp-Source: AA6agR5jZAH4gn+77pAado9w76SrSAaoLUBE2Fq1pfVzbKVukhl7iDFh1Nzp9Z01tG0XndsiDO56lJuIpwKCu5HmEvY=
X-Received: by 2002:a05:6402:e98:b0:441:a982:45bc with SMTP id
 h24-20020a0564020e9800b00441a98245bcmr16281935eda.239.1661785131928; Mon, 29
 Aug 2022 07:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220724224317.288727-1-marex@denx.de>
In-Reply-To: <20220724224317.288727-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 16:58:41 +0200
Message-ID: <CAG3jFyu3GUbbrVUV3SZs5-WfRV5OOJzMH0UvWwkQyVkLtePh_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358767: Handle bridge past DPI output
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, 25 Jul 2022 at 00:43, Marek Vasut <marex@denx.de> wrote:
>
> Currently the driver only handles panel directly connected to the DPI output.
> Handle the case where a bridge is connected past DPI output of this bridge.
> This could be e.g. DPI to LVDS encoder chip.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index f8c1cd711753b..814ab206fe7ef 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1926,22 +1926,23 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
>  static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
>  {
>         struct device *dev = tc->dev;
> +       struct drm_bridge *bridge;
>         struct drm_panel *panel;
>         int ret;
>
>         /* port@1 is the DPI input/output port */
> -       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
>         if (ret && ret != -ENODEV)
>                 return ret;
>
>         if (panel) {
> -               struct drm_bridge *panel_bridge;
> -
> -               panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -               if (IS_ERR(panel_bridge))
> -                       return PTR_ERR(panel_bridge);
> +               bridge = devm_drm_panel_bridge_add(dev, panel);
> +               if (IS_ERR(bridge))
> +                       return PTR_ERR(bridge);
> +       }
>
> -               tc->panel_bridge = panel_bridge;
> +       if (bridge) {
> +               tc->panel_bridge = bridge;
>                 tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
>                 tc->bridge.funcs = &tc_dpi_bridge_funcs;
>
> --
> 2.35.1

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
