Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9AC458FD8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6546E171;
	Mon, 22 Nov 2021 13:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8EE6E171
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 13:59:35 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x6so65524221edr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gx+h/+sm0KoaxO7G+DGb4PI8HWycR4NaLW8XwhqLHdM=;
 b=oJy0jS3+n9iIL1tRu2bBn+JI2tk3VpdnMXzlpkqzVxNc80J9bu89rM4xx8fflF2MvN
 Eqfp1HaFKsAqV0Clwroxqv4c9TmbW703bMiwWooZ34wm/8P0bqBLuK22Yag+6vdFMzvA
 uPIbRKkupRefzT1T2z4bctA2Cgio51cHMTXwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gx+h/+sm0KoaxO7G+DGb4PI8HWycR4NaLW8XwhqLHdM=;
 b=r0sMk6FWWar1XK7xZc1JJ3sfNpdfakU57UiQXuxsYc5huWBrqpULaqWb2ulfRQIV9P
 db3RTxHB/Egv5ddsk53PNd1swiT3VdMxluevuL/2dWazQbz/+RsqOKyvJ5r0AHnuuEHv
 qxgLDoM2s/OndPkZ9/O8FTc0x8RCkR0MJyYJ7pQyLOIb41sozrGDytnRv/Y3zY7hwJBL
 yPVf1vNodd7T0kRcO2WinP1Uc+1DYBmVQxxQXnEMBBfzl/Ryc5ZKEfBQhA7J4IeXpxhf
 cJ5LD3wRwUNWCUgEA4QpeveybkKK3focjuvQ810M4NFoYnrneqgYAu6HnDVuKE46i70s
 wIBw==
X-Gm-Message-State: AOAM5303iWVt6fkVaPUog2RH49e191/K0UIClfBV2BBa1j66L8kPUQOn
 CWlt4Qp6uLqkpZ8SgP8wVaOSE+qIM/u5INEU35BWxw==
X-Google-Smtp-Source: ABdhPJwn1vjMIA7aaVmVEFIbOg0DzNgBF0U/aaOFy5d26OD6+ex6OXz76Vw+KmDVLEK3WM4xTY640fTha96sHkZwx2I=
X-Received: by 2002:a17:906:e115:: with SMTP id
 gj21mr40406219ejb.348.1637589568845; 
 Mon, 22 Nov 2021 05:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
In-Reply-To: <20211122070633.89219-2-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 19:29:17 +0530
Message-ID: <CAMty3ZAPqTJqmjZ4QqOUc7DErAZf+t6BC5sn66gWdD7iPj_PSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, linux-amarula@amarulasolutions.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Mon, Nov 22, 2021 at 12:36 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Some display panels would come up with a non-DSI output, those
> can have an option to connect the DSI host by means of interface
> bridge converter.
>
> This DSI to non-DSI interface bridge converter would requires
> DSI Host to handle drm bridge functionalities in order to DSI
> Host to Interface bridge.
>
> This patch convert the existing to a drm bridge driver with a
> built-in encoder support for compatibility with existing
> component drivers.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note:
> Hi Marek Szyprowski,
>
> Please test this on Panel and Bridge hardware.
>
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 73 +++++++++++++++++--------
>  1 file changed, 51 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 8d137857818c..174590f543c3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -257,6 +257,7 @@ struct exynos_dsi {
>         struct drm_connector connector;
>         struct drm_panel *panel;
>         struct list_head bridge_chain;
> +       struct drm_bridge bridge;
>         struct drm_bridge *out_bridge;
>         struct device *dev;
>
> @@ -287,9 +288,9 @@ struct exynos_dsi {
>  #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
>  #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>
> -static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
> +static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
>  {
> -       return container_of(e, struct exynos_dsi, encoder);
> +       return container_of(b, struct exynos_dsi, bridge);
>  }
>
>  enum reg_idx {
> @@ -1374,9 +1375,10 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>         }
>  }
>
> -static void exynos_dsi_enable(struct drm_encoder *encoder)
> +static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
> +                                    struct drm_bridge_state *old_bridge_state)
>  {
> -       struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>         struct drm_bridge *iter;
>         int ret;
>
> @@ -1399,7 +1401,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>                 list_for_each_entry_reverse(iter, &dsi->bridge_chain,
>                                             chain_node) {
>                         if (iter->funcs->pre_enable)
> -                               iter->funcs->pre_enable(iter);
> +                               iter->funcs->atomic_pre_enable(iter,
> +                                                              old_bridge_state);
>                 }
>         }
>
> @@ -1413,7 +1416,7 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>         } else {
>                 list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>                         if (iter->funcs->enable)
> -                               iter->funcs->enable(iter);
> +                               iter->funcs->atomic_enable(iter, old_bridge_state);
>                 }
>         }
>
> @@ -1429,9 +1432,10 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>         pm_runtime_put(dsi->dev);
>  }
>
> -static void exynos_dsi_disable(struct drm_encoder *encoder)
> +static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
> +                                     struct drm_bridge_state *old_bridge_state)
>  {
> -       struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>         struct drm_bridge *iter;
>
>         if (!(dsi->state & DSIM_STATE_ENABLED))
> @@ -1443,7 +1447,7 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>
>         list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
>                 if (iter->funcs->disable)
> -                       iter->funcs->disable(iter);
> +                       iter->funcs->atomic_disable(iter, old_bridge_state);
>         }
>
>         exynos_dsi_set_display_enable(dsi, false);
> @@ -1451,7 +1455,7 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>
>         list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>                 if (iter->funcs->post_disable)
> -                       iter->funcs->post_disable(iter);
> +                       iter->funcs->atomic_post_disable(iter, old_bridge_state);
>         }
>
>         dsi->state &= ~DSIM_STATE_ENABLED;
> @@ -1494,9 +1498,9 @@ static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs
>         .get_modes = exynos_dsi_get_modes,
>  };
>
> -static int exynos_dsi_create_connector(struct drm_encoder *encoder)
> +static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
>  {
> -       struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +       struct drm_encoder *encoder = &dsi->encoder;
>         struct drm_connector *connector = &dsi->connector;
>         struct drm_device *drm = encoder->dev;
>         int ret;
> @@ -1522,9 +1526,21 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
>         return 0;
>  }
>
> -static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> -       .enable = exynos_dsi_enable,
> -       .disable = exynos_dsi_disable,
> +static int exynos_dsi_attach(struct drm_bridge *bridge,
> +                            enum drm_bridge_attach_flags flags)
> +{
> +       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, 0);
> +}
> +
> +static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> +       .atomic_enable          = exynos_dsi_atomic_enable,
> +       .atomic_disable         = exynos_dsi_atomic_disable,
> +       .attach                 = exynos_dsi_attach,
>  };
>
>  MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
> @@ -1543,7 +1559,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>                 dsi->out_bridge = out_bridge;
>                 list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>         } else {
> -               int ret = exynos_dsi_create_connector(encoder);
> +               int ret = exynos_dsi_create_connector(dsi);
>
>                 if (ret) {
>                         DRM_DEV_ERROR(dsi->dev,
> @@ -1596,7 +1612,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>
>         if (dsi->panel) {
>                 mutex_lock(&drm->mode_config.mutex);
> -               exynos_dsi_disable(&dsi->encoder);
> +               exynos_dsi_atomic_disable(&dsi->bridge, NULL);
>                 dsi->panel = NULL;
>                 dsi->connector.status = connector_status_disconnected;
>                 mutex_unlock(&drm->mode_config.mutex);
> @@ -1702,12 +1718,16 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>
>         drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>
> -       drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
> -
>         ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
>         if (ret < 0)
>                 return ret;
>
> +       ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
> +       if (ret) {
> +               drm_encoder_cleanup(&dsi->encoder);
> +               return ret;
> +       }
> +
>         in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
>         if (in_bridge_node) {
>                 in_bridge = of_drm_find_bridge(in_bridge_node);
> @@ -1723,10 +1743,9 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>                                 void *data)
>  {
>         struct exynos_dsi *dsi = dev_get_drvdata(dev);
> -       struct drm_encoder *encoder = &dsi->encoder;
> -
> -       exynos_dsi_disable(encoder);
>
> +       exynos_dsi_atomic_disable(&dsi->bridge, NULL);
> +       drm_encoder_cleanup(&dsi->encoder);
>         mipi_dsi_host_unregister(&dsi->dsi_host);
>  }
>
> @@ -1819,6 +1838,12 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>
>         pm_runtime_enable(dev);
>
> +       dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> +       dsi->bridge.of_node = dev->of_node;
> +       dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +       drm_bridge_add(&dsi->bridge);
> +
>         ret = component_add(dev, &exynos_dsi_component_ops);
>         if (ret)
>                 goto err_disable_runtime;
> @@ -1833,6 +1858,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>
>  static int exynos_dsi_remove(struct platform_device *pdev)
>  {
> +       struct exynos_dsi *dsi = platform_get_drvdata(pdev);
> +
> +       drm_bridge_remove(&dsi->bridge);
> +
>         pm_runtime_disable(&pdev->dev);
>
>         component_del(&pdev->dev, &exynos_dsi_component_ops);

Can you please test this on Panel and Bridge devices, I've consecutive
patches to move this driver to bridge in order to i.MX8MM, testing
from your side would really helpful.

Thanks,
Jagan.
