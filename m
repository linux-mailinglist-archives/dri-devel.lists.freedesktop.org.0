Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E021A322D62
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751BE6E9B5;
	Tue, 23 Feb 2021 15:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B206E9B5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 15:23:21 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id v200so538522pfc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 07:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BS3pCRX5Z7JbSvWaVr5WdMtid9oF4IO16PyoAmTAdYs=;
 b=umiXC0bwlKvnb4qm9BVVyHZqGMk6C4GQfUWno0FK4eLXjmZJ/JeTjWqxbWHsJHtn23
 KlyxaDSGc3R+G4Xy+zMV5Vvsxl6xzRnpMbp5D5YAyk5xS0NOQvKvqwoVwlmKVxLN8XkY
 0KD0xinoz5uDPczB/zl1Am4TwLFcFZR4L1zE/r61IBRfb/XTF808c8yffbvo03BKypcL
 7Nr5zKRg5hulJXmVHEHCQH70gvHrCqpN7vBLIAc6PZPHeUbvRd0cEMVvlj4VPyfSb7gH
 QJ0E48z1iFhd2gdHmwJNYzaUT2HHfPIuUuH303O9irfl4Xtl6uArkYi9EOKp3Rf6yQRY
 BC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BS3pCRX5Z7JbSvWaVr5WdMtid9oF4IO16PyoAmTAdYs=;
 b=EVhtiKtt1mUytwzIDyQlAkFOHHHUXUFizK9sUC3bdFY2c3WhgzJf9Xh80l54pjUOnx
 Vh9MLOajG8xVUDrMY2FNTUYEnwbBQSAH5Z65P6qWiANCsmmz/vteD8cWUvHXBAm16WhE
 XhKiUxID6YppzhJEnEqLoaBcek4if4FyKn9aEPWxtBVPtHgnwhWMX9Ld3FjYi9nmjeou
 rxKxzTJ64t9KTw2SZoRqIeYujxRifi0o9Cc59lc5nsOwFf6xk9jag4afj9NU5H7leeIn
 cEhUMfEmF2bEjeWLV2ZmGvAZslLUolWPoVtnvnEPE3MJxq1ZY665yjRGnyJB03SiKDE4
 81bg==
X-Gm-Message-State: AOAM530+SHwekEr5M9Znc7OBNfgHkAlM1Xa08+kFX1NQ+1AXBblTBVkS
 8uc8HxFROEn7qhefpHt4Bsk/sz2nEXu1AtvINx/aEA==
X-Google-Smtp-Source: ABdhPJybS9amQzmPHnSi0zL+AAlY+4Lgs5kmZTEVwWrd5xts9iyiJyU9q2MiRJdEbUzBM33b45DsnKD2LSIlUlSrzNY=
X-Received: by 2002:aa7:9281:0:b029:1ec:48b2:811c with SMTP id
 j1-20020aa792810000b02901ec48b2811cmr27116567pfa.18.1614093801409; Tue, 23
 Feb 2021 07:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20210115070250.2271571-1-hsinyi@chromium.org>
 <20210115070250.2271571-2-hsinyi@chromium.org>
In-Reply-To: <20210115070250.2271571-2-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 23 Feb 2021 16:23:10 +0100
Message-ID: <CAG3jFytPDLWygTGeyCYEqJYcwD=UDAe6hagL5zTjrSKXoN5aMA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: anx7625: disable regulators when power
 off
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Hsin-Yi,

This patch looks good to me, feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 15 Jan 2021 at 08:05, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> When suspending the driver, anx7625_power_standby() will be called to
> turn off reset-gpios and enable-gpios. However, power supplies are not
> disabled. To save power, the driver can get the power supply regulators
> and turn off them in anx7625_power_standby().
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change:
> v3: add delays between regulators power on
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 34 +++++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc05982f82..23283ba0c4f9 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> @@ -875,12 +876,25 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>  static void anx7625_power_on(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
> +       int ret, i;
>
>         if (!ctx->pdata.low_power_mode) {
>                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
>                 return;
>         }
>
> +       for (i = 0; i < ARRAY_SIZE(ctx->pdata.supplies); i++) {
> +               ret = regulator_enable(ctx->pdata.supplies[i].consumer);
> +               if (ret < 0) {
> +                       DRM_DEV_DEBUG_DRIVER(dev, "cannot enable supply %d: %d\n",
> +                                            i, ret);
> +                       goto reg_err;
> +               }
> +               usleep_range(2000, 2100);
> +       }
> +
> +       usleep_range(4000, 4100);
> +
>         /* Power on pin enable */
>         gpiod_set_value(ctx->pdata.gpio_p_on, 1);
>         usleep_range(10000, 11000);
> @@ -889,11 +903,16 @@ static void anx7625_power_on(struct anx7625_data *ctx)
>         usleep_range(10000, 11000);
>
>         DRM_DEV_DEBUG_DRIVER(dev, "power on !\n");
> +       return;
> +reg_err:
> +       for (--i; i >= 0; i--)
> +               regulator_disable(ctx->pdata.supplies[i].consumer);
>  }
>
>  static void anx7625_power_standby(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
> +       int ret;
>
>         if (!ctx->pdata.low_power_mode) {
>                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> @@ -904,6 +923,12 @@ static void anx7625_power_standby(struct anx7625_data *ctx)
>         usleep_range(1000, 1100);
>         gpiod_set_value(ctx->pdata.gpio_p_on, 0);
>         usleep_range(1000, 1100);
> +
> +       ret = regulator_bulk_disable(ARRAY_SIZE(ctx->pdata.supplies),
> +                                    ctx->pdata.supplies);
> +       if (ret < 0)
> +               DRM_DEV_DEBUG_DRIVER(dev, "cannot disable supplies %d\n", ret);
> +
>         DRM_DEV_DEBUG_DRIVER(dev, "power down\n");
>  }
>
> @@ -1742,6 +1767,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         platform->client = client;
>         i2c_set_clientdata(client, platform);
>
> +       pdata->supplies[0].supply = "vdd10";
> +       pdata->supplies[1].supply = "vdd18";
> +       pdata->supplies[2].supply = "vdd33";
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pdata->supplies),
> +                                     pdata->supplies);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "fail to get power supplies: %d\n", ret);
> +               return ret;
> +       }
>         anx7625_init_gpio(platform);
>
>         atomic_set(&platform->power_status, 0);
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 193ad86c5450..e4a086b3a3d7 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -350,6 +350,7 @@ struct s_edid_data {
>  struct anx7625_platform_data {
>         struct gpio_desc *gpio_p_on;
>         struct gpio_desc *gpio_reset;
> +       struct regulator_bulk_data supplies[3];
>         struct drm_bridge *panel_bridge;
>         int intp_irq;
>         u32 low_power_mode;
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
