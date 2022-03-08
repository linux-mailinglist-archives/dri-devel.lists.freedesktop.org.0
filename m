Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33D4D117E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119810ECD6;
	Tue,  8 Mar 2022 08:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B575F10ECD4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:03:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id p15so37328945ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d84PRrLcWTRtmhq1j3C8/qZ9GUK7KCHj6DYkpNSx1Cw=;
 b=RpCjSJiMaRy19A+3HMfO1R0Tc46x8i0gcax2P5kIlCgJs5WgD3Dndzrcz2kr0uHCMh
 orpGN7ya5/cwTBdtoskS7C2by3GCoJcE5TstH1BlX+FzZzzRQN7rGwRi/i5GknGYbVrl
 zO27L3uWz3AuvM+j0jMDULLzp91JWIf6yyRPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d84PRrLcWTRtmhq1j3C8/qZ9GUK7KCHj6DYkpNSx1Cw=;
 b=LlRiD/OItORXTk98/Lsw2J9Z4/C1F7AvMDbQVndFZRezq+Kwh2u9QUtZ9Y3QJxpMKu
 FHw4yVf/1F4LaFnAXyXkJD7tIiL0JJ/IWtcQTwJeQOhmCT03xxWF3AmLqFErochyZjd/
 3R9MC7Uy55LFhAujaZCzBb9mFJa3ueZs+y9N/fyt5kA5LffUaPI2Q3TaCfcs1uOU5fQE
 WfaqzBmC4eQEhtOd+kusG7OhIdCEPQjUR3xjifney0R6jDrzBmslMKIrX3L4TSkRnpSJ
 H7oKoYTasMl/OW/YAiobFZpf1els8v9jYVQPUc5tAD1SSSN6s/OiwFAbINlyeE8YoCIM
 c9Dg==
X-Gm-Message-State: AOAM53070dYz9rn3hOnvn2urLo5ypzY1hk8TDy9DbdBodj7H/CQ9oylg
 dvTFxlLPnUlRRT4tsIS/OFt7jHnKSS8GfPL2KU+PPg==
X-Google-Smtp-Source: ABdhPJyUVSt8kJTL1AVAVyer2xEUmfTrSKKUo2k0tsL7ut6/4m8sINaDNQOjp3i987CKqqmSQ5He6loRLrX5n5LklO8=
X-Received: by 2002:a17:906:c59:b0:6b9:59d8:263e with SMTP id
 t25-20020a1709060c5900b006b959d8263emr12456325ejf.770.1646726606183; Tue, 08
 Mar 2022 00:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
In-Reply-To: <20220304002508.75676-6-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 8 Mar 2022 13:33:15 +0530
Message-ID: <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Fri, Mar 4, 2022 at 5:55 AM Marek Vasut <marex@denx.de> wrote:
>
> The driver currently hard-codes DSI lane count to two, however the chip
> is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
> property and program the result into DSI_CTRL register.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Rebase on next-20220214
> V3: Default to 4 data lanes unless specified otherwise
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 45 +++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 2ac8eb7e25f52..df8e75a068ad0 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -136,10 +136,12 @@ struct chipone {
>         struct drm_bridge bridge;
>         struct drm_display_mode mode;
>         struct drm_bridge *panel_bridge;
> +       struct device_node *host_node;
>         struct gpio_desc *enable_gpio;
>         struct regulator *vdd1;
>         struct regulator *vdd2;
>         struct regulator *vdd3;
> +       int dsi_lanes;
>  };
>
>  static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
> @@ -212,6 +214,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>         /* dsi specific sequence */
>         ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
>         ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
> +
> +       /* DSI data lane count */
> +       ICN6211_DSI(icn, DSI_CTRL,
> +                   DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi_lanes - 1));
> +
>         ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
>         ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
>
> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>  static int chipone_parse_dt(struct chipone *icn)
>  {
>         struct device *dev = icn->dev;
> +       struct device_node *endpoint;
>         struct drm_panel *panel;
> +       int dsi_lanes;
>         int ret;
>
>         icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
>                 return PTR_ERR(icn->enable_gpio);
>         }
>
> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
> +       of_node_put(endpoint);
> +
> +       if (!icn->host_node)
> +               return -ENODEV;

The non-ports-based OF graph returns a -19 example on the Allwinner
Display pipeline in R16 [1].

We need to have a helper to return host_node for non-ports as I have
done it for drm_of_find_bridge.

[1] https://patchwork.amarulasolutions.com/patch/1805/

Thanks,
Jagan.
