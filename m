Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD04875737
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 20:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA43D112066;
	Thu,  7 Mar 2024 19:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ubR2DQJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801AC11229E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 19:31:19 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-609ff069a40so1671327b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 11:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709839878; x=1710444678; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PCETR6xATNNqCCnkCbkWB2goU+g4Ke4A3ZOjvnBM1l4=;
 b=ubR2DQJOw83+f7uFwnEGFhRnVMs4NQqMmHDnvHTxu2Ovkj94anVPaZ42i7GijpltpO
 KulNFXEMwLFO6/7g8qGMlNusgyr4GE9r7rMmuSWTg3juE8Nb4f7piEVrNDm2JfeKzNUQ
 MB85fbXYo3MZNlbLr7TseLvd+GjFZe+PjJeYr2oqF537DgvNve1OVU2naNXb0N3plbo1
 sxdX5Q3cJg183ggEKyhrEHqOEGNubDN6LFDuV8FXtK6A4aU9vx1fH30Tsbjw+fRGkSXf
 /ISMoSZSiABy/Bk1hoWsKoTqGvjfcLSav8UspvvwodqKFV1UMDUG3a6yP5umV/wkrI3m
 B+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709839878; x=1710444678;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PCETR6xATNNqCCnkCbkWB2goU+g4Ke4A3ZOjvnBM1l4=;
 b=QqwZcmV6rwJqXfEcDXCOqy/TXQIYM3QdYhbp8qef3PlqU0c1h49tj/zpLriTO4eySn
 vsRT5ioWbTep6RO4NtYfRyCHOnKh5hxq+a6Pb+vZ/eFkD0v1CqVV6pQlrbAD1jnqXJDg
 66J+fZsNnznJi9XO6vPizYYtXdF1qtMpLc7EeFMsomeC7VjLnVcaWvAiRUq9ZQI1hgiX
 TxXjEYFuJt/If2mPDzLb1+R/EwakvgN8wRvlyy59970bAQA/YyuHpjOQbDQczFZCM7zv
 6gTxUw1UAllxV/Twz7OLsII28+TkNiD+fpUzGP1FvYU72FKP+S24SX4kb2hEFlwItHOX
 36sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmBkjXkRUetniLNMGyHL2Yt+qwiuj5d0UZJEVFPwqycEjSxyNJtOFRBfftb+brLsm0mRBDTWA7+3bRzMdjuR0OBsGsrr7j63sPuBTKs0fR
X-Gm-Message-State: AOJu0YzcQlHn+mW/ucSIw2k3z8XIRSylKlXvfzfNnxy2E3sKiCW1kYQb
 6MMm2iKQ84oskTmx3Fopm5w/LUlwgBNtrMI0OUL8S3BknurleKDM6+x+km6tuFSO9m5jEoDdInA
 sUdclb4Xg3BLJgQIh5me5OciROD+3WyCqYctF0Q==
X-Google-Smtp-Source: AGHT+IG/lG/+9pIjKimGHVPHBUoVUFsLKcsfXtMQ9jFwKu2z17RjD9mEueX+OHf6CusgAmcRzq+qXYbJlHF7JWFlHEg=
X-Received: by 2002:a0d:f6c3:0:b0:609:8719:b935 with SMTP id
 g186-20020a0df6c3000000b006098719b935mr20208837ywf.8.1709839878122; Thu, 07
 Mar 2024 11:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-5-sui.jingfeng@linux.dev>
In-Reply-To: <20240307172334.1753343-5-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 21:31:06 +0200
Message-ID: <CAA8EJpqtPRfe1VL_ACYEOSq=iNMkZ03-fwVv3XdVrpTObZFu1w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm-bridge: it66121: Use fwnode API to acquire
 device properties
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Mar 2024 at 19:24, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Make this driver less DT-dependent by calling the freshly created helpers,
> should be no functional changes for DT based systems. But open the door for
> otherwise use cases. Even though there is no user emerged yet, this still
> do no harms. In fact, we reduce some boilerplate across drm bridge drivers.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 63 ++++++++++++++++------------
>  1 file changed, 36 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 1c3433b5e366..a2cf2be86065 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -15,7 +15,6 @@
>  #include <linux/bitfield.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
> -#include <linux/of_graph.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/regulator/consumer.h>
> @@ -1480,7 +1479,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
>
>         dev_dbg(dev, "%s\n", __func__);
>
> -       if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +       if (!fwnode_property_present(dev_fwnode(dev), "#sound-dai-cells")) {
>                 dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
>                 return 0;
>         }
> @@ -1503,13 +1502,37 @@ static const char * const it66121_supplies[] = {
>         "vcn33", "vcn18", "vrf12"
>  };
>
> +static int it66121_read_bus_width(struct fwnode_handle *fwnode, u32 port,
> +                                 u32 *bus_width)
> +{
> +       struct fwnode_handle *endpoint;
> +       u32 val;
> +       int ret;
> +
> +       endpoint = fwnode_graph_get_endpoint_by_id(fwnode, port, 0, 0);
> +       if (!endpoint)
> +               return -EINVAL;
> +
> +       ret = fwnode_property_read_u32(endpoint, "bus-width", &val);
> +       fwnode_handle_put(endpoint);
> +       if (ret)
> +               return ret;
> +
> +       if (val != 12 && val != 24)
> +               return -EINVAL;
> +
> +       *bus_width = val;
> +
> +       return 0;
> +}
> +
>  static int it66121_probe(struct i2c_client *client)
>  {
>         u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> -       struct device_node *ep;
>         int ret;
>         struct it66121_ctx *ctx;
>         struct device *dev = &client->dev;
> +       struct fwnode_handle *fwnode = dev_fwnode(dev);
>
>         if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>                 dev_err(dev, "I2C check functionality failed.\n");
> @@ -1520,37 +1543,23 @@ static int it66121_probe(struct i2c_client *client)
>         if (!ctx)
>                 return -ENOMEM;
>
> -       ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> -       if (!ep)
> -               return -EINVAL;
> -
>         ctx->dev = dev;
>         ctx->client = client;
>         ctx->info = i2c_get_match_data(client);
>
> -       of_property_read_u32(ep, "bus-width", &ctx->bus_width);
> -       of_node_put(ep);
> -
> -       if (ctx->bus_width != 12 && ctx->bus_width != 24)
> -               return -EINVAL;
> -
> -       ep = of_graph_get_remote_node(dev->of_node, 1, -1);
> -       if (!ep) {
> -               dev_err(ctx->dev, "The endpoint is unconnected\n");
> -               return -EINVAL;
> -       }
> -
> -       if (!of_device_is_available(ep)) {
> -               of_node_put(ep);
> -               dev_err(ctx->dev, "The remote device is disabled\n");
> -               return -ENODEV;
> -       }
> +       /* Endpoint of port@0 contains the bus-width property */
> +       ret = it66121_read_bus_width(fwnode, 0, &ctx->bus_width);

There is no need to pass port as an argument to that function.


> +       if (ret)
> +               return ret;
>
> -       ctx->next_bridge = of_drm_find_bridge(ep);
> -       of_node_put(ep);
> +       ctx->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
>         if (!ctx->next_bridge) {
>                 dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
>                 return -EPROBE_DEFER;
> +       } else if (IS_ERR(ctx->next_bridge)) {
> +               ret = PTR_ERR(ctx->next_bridge);
> +               dev_err(dev, "Error in founding the next bridge: %d\n", ret);
> +               return ret;

Nit: I'd usually expect this part to be in a different order: first
check for error, then check for absence. But that's a minor thing.

>         }
>
>         i2c_set_clientdata(client, ctx);
> @@ -1584,9 +1593,9 @@ static int it66121_probe(struct i2c_client *client)
>         }
>
>         ctx->bridge.funcs = &it66121_bridge_funcs;
> -       ctx->bridge.of_node = dev->of_node;
>         ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>         ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> +       drm_bridge_set_node(&ctx->bridge, fwnode);
>
>         ret = devm_request_threaded_irq(dev, client->irq, NULL, it66121_irq_threaded_handler,
>                                         IRQF_ONESHOT, dev_name(dev), ctx);
> --
> 2.34.1
>


--
With best wishes
Dmitry
