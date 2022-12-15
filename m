Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E419B64D9DA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A4210E529;
	Thu, 15 Dec 2022 10:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDDC10E529
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:57:26 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id s186so4974104oia.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cE0w9xgEjMljOCPv33TnVayfiC3WQ0tcp3W8ibF5YK0=;
 b=JjoFEhyGbUz5iHCYXIHv9MEz+h8zXHL2F54n/f1bLmGx1WpQd9dlRfS+UtzelmgIgp
 fu8/2a8/Va3xCRBv+L5650Ku4x5TWtGSLBVVW+4R1czE9hqW52Eoj985bj/JN+JDRCD9
 b1nQPbqvxpM+rOYoTZqq0HKd6doJFbc+bpZEzT+NvUd7GmNA4/SncQyhrIPi3WU4KcdI
 xdYvKXZPf+StcaTgLR/NrDd7qj9+N1OOoRg68X7J8+v//xpvBswLcNfhbMSoWEXuMNRi
 4Eu4mHhXrxwd2Ufow6Jz11n3pOMipaPbZ7s7nqu8fdkNAPky1uTp4zb7tXAdCQ0Vw5bX
 SBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cE0w9xgEjMljOCPv33TnVayfiC3WQ0tcp3W8ibF5YK0=;
 b=rAeyWHbEwTgxwtKiGFNZHwGb2RfCJNsGNW23qT+Wj17X6LysI8nlqcByYVO8E7Hgls
 6GyoYsdXFK1FI9ofRZNbQinut8UFLaOh9Sh+VaHMojwxV5NYRNwct3eeCqpfQ5kEPJZX
 fgiQDMYvbnq789X8P/Vf1yZT3sXUQBDS6PivBOUkndW7QG7hwjh/VmrjCx6eP2Zwledl
 u1RDPU/k+FaC7cfVhPMdD/8tyV+63QFt7v4nNmxDrS7kN2JDa8bSqkHMFGVNVOpUWkl3
 hJNHtniEMI+n2p6J4GUoW00TdnIH7JkK7iq/GFVpm3oEm/sDoxiyzrUClCXpAEpAJEHV
 vh+Q==
X-Gm-Message-State: ANoB5pmn9xlafq5Gz/tezuTqt9xgZs0StnD21en0XlUE6SWFVJnQl7AN
 XnVqxFquZxUuhp+ypfbNuOaLC3u72fch4LB+r0CALw==
X-Google-Smtp-Source: AA0mqf48qVOI8iwEeLCYnMUppEbhTLEMuuU4/Z8ArNNlFiM0qDElF4HZav6ZhX4Xmlzhgux3D8iUesBlax7dE2eWa5g=
X-Received: by 2002:aca:1c07:0:b0:359:ef86:2f4f with SMTP id
 c7-20020aca1c07000000b00359ef862f4fmr306021oic.14.1671101845335; Thu, 15 Dec
 2022 02:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-3-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-3-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 11:57:14 +0100
Message-ID: <CAG3jFyu_9PLoHtE1qUcYuYGdt3RmuR-TmJHxVeTZfGLyvudxMA@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm: bridge: it66121: Use
 devm_regulator_bulk_get_enable()
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 13:58, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Simplify the code of the driver by using
> devm_regulator_bulk_get_enable(), which will handle powering up the
> regulators, and disabling them on probe error or module removal.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 34 +++++++---------------------
>  1 file changed, 8 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 7476cfbf9585..a698eec8f250 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -301,7 +301,6 @@ struct it66121_ctx {
>         struct device *dev;
>         struct gpio_desc *gpio_reset;
>         struct i2c_client *client;
> -       struct regulator_bulk_data supplies[3];
>         u32 bus_width;
>         struct mutex lock; /* Protects fields below and device registers */
>         struct hdmi_avi_infoframe hdmi_avi_infoframe;
> @@ -342,16 +341,6 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
>         gpiod_set_value(ctx->gpio_reset, 0);
>  }
>
> -static inline int ite66121_power_on(struct it66121_ctx *ctx)
> -{
> -       return regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -}
> -
> -static inline int ite66121_power_off(struct it66121_ctx *ctx)
> -{
> -       return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -}
> -
>  static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)
>  {
>         return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG, IT66121_MASTER_SEL_HOST);
> @@ -1512,6 +1501,10 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
>         return PTR_ERR_OR_ZERO(ctx->audio.pdev);
>  }
>
> +static const char * const it66121_supplies[] = {
> +       "vcn33", "vcn18", "vrf12"
> +};
> +
>  static int it66121_probe(struct i2c_client *client)
>  {
>         u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> @@ -1564,26 +1557,18 @@ static int it66121_probe(struct i2c_client *client)
>         i2c_set_clientdata(client, ctx);
>         mutex_init(&ctx->lock);
>
> -       ctx->supplies[0].supply = "vcn33";
> -       ctx->supplies[1].supply = "vcn18";
> -       ctx->supplies[2].supply = "vrf12";
> -       ret = devm_regulator_bulk_get(ctx->dev, 3, ctx->supplies);
> +       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it66121_supplies),
> +                                            it66121_supplies);
>         if (ret) {
> -               dev_err(ctx->dev, "regulator_bulk failed\n");
> +               dev_err(dev, "Failed to enable power supplies\n");
>                 return ret;
>         }
>
> -       ret = ite66121_power_on(ctx);
> -       if (ret)
> -               return ret;
> -
>         it66121_hw_reset(ctx);
>
>         ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
> -       if (IS_ERR(ctx->regmap)) {
> -               ite66121_power_off(ctx);
> +       if (IS_ERR(ctx->regmap))
>                 return PTR_ERR(ctx->regmap);
> -       }
>
>         regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
>         regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
> @@ -1596,7 +1581,6 @@ static int it66121_probe(struct i2c_client *client)
>
>         if (vendor_ids[0] != IT66121_VENDOR_ID0 || vendor_ids[1] != IT66121_VENDOR_ID1 ||
>             device_ids[0] != IT66121_DEVICE_ID0 || device_ids[1] != IT66121_DEVICE_ID1) {
> -               ite66121_power_off(ctx);
>                 return -ENODEV;
>         }
>
> @@ -1609,7 +1593,6 @@ static int it66121_probe(struct i2c_client *client)
>                                         IRQF_ONESHOT, dev_name(dev), ctx);
>         if (ret < 0) {
>                 dev_err(dev, "Failed to request irq %d:%d\n", client->irq, ret);
> -               ite66121_power_off(ctx);
>                 return ret;
>         }
>
> @@ -1626,7 +1609,6 @@ static void it66121_remove(struct i2c_client *client)
>  {
>         struct it66121_ctx *ctx = i2c_get_clientdata(client);
>
> -       ite66121_power_off(ctx);
>         drm_bridge_remove(&ctx->bridge);
>         mutex_destroy(&ctx->lock);
>  }
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
