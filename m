Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CE3DA3D3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 15:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2E86E125;
	Thu, 29 Jul 2021 13:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C33E6E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:20:30 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so15645061pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dn16VRGzINjpK5hTkcROYonwyO77GNzKhrw6QPtb+WU=;
 b=UGHYkoDL7+nEZ+Ici1GVaiIpoD7un33lWWCEf4TVNKpJZjvFUFTBaCsYxSYJMq7F7t
 kjEuDYUfGdm2Y6esFw8K58f+EtxqDY5JhVZLQ7fzcMwehxZ/F3219Hp4LfVIgxqlvVUl
 BPRICJBCxma317as9WmiDNoqXmVh6wgIbhnpN4smFb3XFiVF3Def2iBGIsnHGWpMY6xf
 NzTuG6Px+qvjkyin3DpjfFz7pinhGGfhL88FXiVFxz3uo6Bv2AleoBCaTbdqm8SWUL4T
 hDwnFgPcmBMW6URS35QlFCYGwuYjDtVuMcuWY2k65CTNCOt16N46Hcd0YWKwDp23uB7b
 q4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dn16VRGzINjpK5hTkcROYonwyO77GNzKhrw6QPtb+WU=;
 b=LoK7rZjG3OjYjveO6u2oDWB+kUqEyhev5DsOm2oxeSlvqoxjjLWspeMxWio+ge/ir8
 L9Ah302o+LWh82NiPOu3VGvcAZV7yuPJpEgsQiLiZPqZBEbCm99AJdobV7B+Haa+DLa6
 uWsRUwyIEQotgmBvaL0qmyrMr4kCMBOTVq4Ncua0uXau8yN63pxvjIKRxhqkG556at8r
 LKU24VEJOI0oP860CGvYnK90YUCylwl5eWxldjwEtfjNMeBrw+7OLTQipkBlss/wYb2N
 H4uD6vKvwtAQe0w8LGVkkJyZp1zyTgtNwBgfVEK7e13FjJ1V4BADNl2EYvajTAzF+FOk
 HxeQ==
X-Gm-Message-State: AOAM532wjn9cn8kAmVdGIGvYz5auUkjNKG6vdpRf6YyymbVSSdobgDRZ
 82BMq+O81erwjOT/lZlX2JmGZZWR7fSpYqFFXKmiVA==
X-Google-Smtp-Source: ABdhPJwZGMBeDDIs8OW6egcQktP4OuNjLmCnf0s9q2ER3N5wFGSw0h4xjwRmt/xhkYeiRPsvGus7PV8t11L557Z5dnY=
X-Received: by 2002:a63:494f:: with SMTP id y15mr3798897pgk.185.1627564829264; 
 Thu, 29 Jul 2021 06:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-6-jagan@amarulasolutions.com>
In-Reply-To: <20210704090230.26489-6-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 29 Jul 2021 15:20:17 +0200
Message-ID: <CAG3jFytHb=iOc6CHy47iGwvxuSg1UMqnpE7oFZL9tfcPUB22eA@mail.gmail.com>
Subject: Re: [RFC PATCH 05/17] drm/exynos: dsi: Get the mode from bridge
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Jagan,

On Sun, 4 Jul 2021 at 11:04, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Now the exynos dsi driver is fully aware of bridge
> handling, so get the display mode from bridge, mode_set
> API instead of legacy encoder crtc.
>
> This makes bridge usage more efficient instead of relying
> on encoder stack.
>
> Add mode_set in drm_bridge_funcs.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d828be07c325..99a1b8c22313 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -275,6 +275,7 @@ struct exynos_dsi {
>         u32 format;
>
>         int state;
> +       struct drm_display_mode mode;
>         struct drm_property *brightness;
>         struct completion completed;
>
> @@ -881,7 +882,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>
>  static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
>  {
> -       struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
> +       struct drm_display_mode *m = &dsi->mode;
>         unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
>         u32 reg;
>
> @@ -1411,6 +1412,15 @@ static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(dsi->dev);
>  }
>
> +static void exynos_dsi_bridge_mode_set(struct drm_bridge *bridge,
> +                                      const struct drm_display_mode *mode,
> +                                      const struct drm_display_mode *adjusted_mode)
> +{
> +       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +
> +       drm_mode_copy(&dsi->mode, adjusted_mode);
> +}
> +
>  static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
>                                       struct device_node *node)
>  {
> @@ -1451,6 +1461,7 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
>         .enable = exynos_dsi_bridge_enable,
>         .disable = exynos_dsi_bridge_disable,
> +       .mode_set = exynos_dsi_bridge_mode_set,

As far as I understand it, .enable(), .disable() &.mode_set() are
deprecated[1] and should be replaced by atomic_enable(),
atomic_disable() & atomic_enable() respectively.

[1] https://lore.kernel.org/dri-devel/20210722062246.2512666-8-sam@ravnborg.org/

>         .attach = exynos_dsi_bridge_attach,
>  };
>
> --
> 2.25.1
>
