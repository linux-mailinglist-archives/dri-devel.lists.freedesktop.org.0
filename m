Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B93D1F47
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2EF6EEB9;
	Thu, 22 Jul 2021 07:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C156EEB9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:49:44 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id dj21so5673625edb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 00:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KPQFSQf3nlrjEsJEPlZkN2daacpxsZVC+klKaSukPf8=;
 b=WF/xA/hhluJ+pU9zw+7lBXxAB6tCYov6J3krRERm2arX0Nd7/KmM6oISsZYv6NV9J3
 nRUM4If+T6AAOJ4LgS41DGdGb48ES0ToVKq17VaLwgF1EuOB/Zksl8uWM2+eQ2MtkY2h
 nvjR9R1HBUtJKhfcf4D4tIYz3I+Cl5QUYD2dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KPQFSQf3nlrjEsJEPlZkN2daacpxsZVC+klKaSukPf8=;
 b=jqU7LWe1l3QPXexXC+oNAxMGN1ggx0iJKN32bP6k8xOU7AtI9zWUm94zMd9QRxUJwd
 V0p+yGswRz/qKOFewUTo6XU6MjPf5vxG1qDhxOfIKrhuMeqPcODcRkTpQq8gw/lKpKif
 QR9tK8Ib6CC12RKl1wjOhMMJYuRBksQiwZFJtUpOj866rz0xk61W27/jjkKrg4ZC+FOL
 1y5ryjPzGQOZH0sgJxYP2wTUT0P3b9mSxIWgp3/AF7n8+djeaLTY+hfEQZdQGS6wuHpW
 pQX07YWv58WlN9rGIKPFbaudPMhQn5hYoGtquWmx8SCeoeCzBCawy7V/nkibdjxSq+Jj
 BeMg==
X-Gm-Message-State: AOAM532j7EvX/VP95uYdCEFHM6e/IzTjCuflouf1BArprNzYfgkZqEMQ
 s3NwmFRyIctniFcfpPU6aJpQVP0Cn8+sv/5x6kKRcA==
X-Google-Smtp-Source: ABdhPJygKu1uwg7BzaDUKWzWMhft+67s/9BUHvwyKUaEEQ9QD+jeD/hR2MopCQjh4WNWI6xSd/GTv6lIRV8AWtsJ5W4=
X-Received: by 2002:a05:6402:51c7:: with SMTP id
 r7mr54673740edd.150.1626940183480; 
 Thu, 22 Jul 2021 00:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-3-maxime@cerno.tech>
In-Reply-To: <20210720134525.563936-3-maxime@cerno.tech>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 22 Jul 2021 13:19:32 +0530
Message-ID: <CAMty3ZAK58-xn_5=h=NDH0+TkKjkoHFBPGpP+jY3UEJwN7tamQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/bridge: Add a function to abstract away panels
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, Jul 20, 2021 at 7:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Display drivers so far need to have a lot of boilerplate to first
> retrieve either the panel or bridge that they are connected to using
> drm_of_find_panel_or_bridge(), and then either deal with each with ad-hoc
> functions or create a drm panel bridge through drm_panel_bridge_add.

Correct, but drm_of_find_panel_or_bridge is still required in some DSI
drivers where the panel pointer required separately.

>
> In order to reduce the boilerplate and hopefully create a path of least
> resistance towards using the DRM panel bridge layer, let's create the
> function devm_drm_of_get_next to reduce that boilerplate.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_bridge.c | 62 +++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/drm_of.c     |  3 ++
>  include/drm/drm_bridge.h     |  2 ++
>  3 files changed, 63 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 044acd07c153..aef8c9f4fb9f 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -24,10 +24,12 @@
>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of_graph.h>
>
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_panel.h>
>
>  #include "drm_crtc_internal.h"
>
> @@ -50,10 +52,8 @@
>   *
>   * Display drivers are responsible for linking encoders with the first bridge
>   * in the chains. This is done by acquiring the appropriate bridge with
> - * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
> - * panel with drm_panel_bridge_add_typed() (or the managed version
> - * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
> - * attached to the encoder with a call to drm_bridge_attach().
> + * drm_of_get_next(). Once acquired, the bridge shall be attached to the
> + * encoder with a call to drm_bridge_attach().
>   *
>   * Bridges are responsible for linking themselves with the next bridge in the
>   * chain, if any. This is done the same way as for encoders, with the call to
> @@ -1223,6 +1223,60 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>         return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * devm_drm_of_get_next - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any, or creates and returns a
> + * drm panel bridge instance if a panel is connected.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_next(struct device *dev,
> +                                       struct device_node *np,
> +                                       unsigned int port,
> +                                       unsigned int endpoint)
> +{
> +       struct device_node *remote;
> +       struct drm_bridge *bridge;
> +       struct drm_panel *panel;
> +
> +       /*
> +        * of_graph_get_remote_node() produces a noisy error message if port
> +        * node isn't found and the absence of the port is a legit case here,
> +        * so at first we silently check whether graph presents in the
> +        * device-tree node.
> +        */
> +       if (!of_graph_is_present(np))
> +               return ERR_PTR(-ENODEV);
> +
> +       remote = of_graph_get_remote_node(np, port, endpoint);
> +       if (!remote)
> +               return ERR_PTR(-ENODEV);
> +
> +       bridge = of_drm_find_bridge(remote);
> +       if (bridge) {
> +               of_node_put(remote);
> +               return bridge;
> +       }
> +
> +       panel = of_drm_find_panel(remote);
> +       if (IS_ERR(panel)) {
> +               of_node_put(remote);
> +               return ERR_CAST(panel);
> +       }
> +
> +       of_node_put(remote);
> +
> +       return devm_drm_panel_bridge_add(dev, panel);
> +}

This is ideally similar to drm_of_find_panel_or_bridge followed by
panel_bridge_add. Can we reuse drm_of_find_panel_or_bridge for now
till it deprecated?

Thanks,
Jagan.
