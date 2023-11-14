Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19E7EB482
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C18C10E46B;
	Tue, 14 Nov 2023 16:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4CD10E46B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:10:12 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-dae7cc31151so5743733276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699978211; x=1700583011; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3NZgVf3mTInsrRVqgIvOMR7QMPkoKdJpiVaybWg4PMs=;
 b=L3Es8Gk+35RnMcDfxZI3s0Bpi4OTVdoob3b5F7+RXtGzRwoLJHoZg8XUGFmwGWVHHo
 dE7Mvo5urqKyvqwtWHqCBkiMfKynUXVVSCmLbfiSvINB9R7jnwmluvhCAc8KMOYsb0rb
 4ebWtdcVhtPxADCBv2JR2zI0UyV0qOpDDr8qC/Riz9YrWkM5fEzl2dZ8UWD4FmVag6c3
 V0uylKqTpylA3JytJ3KjO3g1O0OJ3lRleTkvlCpaHpE5f2Z++arojlgY/DYuG0z7zDZ5
 kKNKlDUjQFOmA0dGHx07ChaOaMhFOq+zwLmMAhi5/NHjc5JC9FqG12FP8F9r95/uZaUL
 2mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699978211; x=1700583011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3NZgVf3mTInsrRVqgIvOMR7QMPkoKdJpiVaybWg4PMs=;
 b=l3jekJXypZ78QjPb2LbZPOhjZ/qCZOyfglElj9DUur3SPN2PNZYAjyci5jvTZTgj8G
 ZS2inoIjpg9Xi35Lju1/3KO+yyInwkqZ+UCtgCbTBwlfETEuNXQDNKRQ8M+1lTkru9VX
 JscAS3huUC7lat9H1rbLs5AQneqOnqrw0nM7y/F2HqK4Gz3fzy1lg0tr05vMrgrwIlxh
 OydLYrNsdzLd2FZ5TTHvfMT8xuKLhOxGROMBnU0kOKgX3UBYRa0hH7s1pH+S0kWPjxz+
 ygDQGF9ZqbWuSwsM8NX9TzL9boDepef+lKqFyWcyjmQsbW3yElfYb9AKj471k+5QvIL5
 eKAg==
X-Gm-Message-State: AOJu0Yzf8w1gxDE5lNutdXnpt/enmLJDQiJ+Ib8gbpGXvO2PpA3b19P0
 hj/zZrEQblTrUtliRFDmvlERRDFDl5jqJFzkl1kxsQ==
X-Google-Smtp-Source: AGHT+IGsphBbtZCg5/tRs4yy3MUn3QTlPYZ+xdX/yMSogol2QvpwBWrufvRV4l421M3zeDbGqyePnqqeo0Gvd2ckuqM=
X-Received: by 2002:a25:3624:0:b0:da0:6a55:b4d5 with SMTP id
 d36-20020a253624000000b00da06a55b4d5mr10138459yba.46.1699978211508; Tue, 14
 Nov 2023 08:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-7-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-7-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 18:10:00 +0200
Message-ID: <CAA8EJpoQFZjSbJ+nENH7Zcrg_0RZLTxxgdqFzoF7hb11ge_LOQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/bridge: it66121: Add a helper to initialize the
 DRM bridge structure
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Helps the it66121_probe() function to reduce weight, no functional change.

This is not a proper commit message.

>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index f36d05331f25..2f7f00f1bedb 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1004,6 +1004,21 @@ static const struct drm_bridge_funcs it66121_bridge_funcs = {
>         .hpd_disable = it66121_bridge_hpd_disable,
>  };
>
> +static void it66121_bridge_init_base(struct drm_bridge *bridge,
> +                                    struct device_node *of_node,
> +                                    bool hpd_support)

At this point there is no reason for the bridge to miss HPD support.

> +{
> +       bridge->funcs = &it66121_bridge_funcs;
> +       bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> +       bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +       if (hpd_support)
> +               bridge->ops |= DRM_BRIDGE_OP_HPD;
> +
> +       bridge->of_node = of_node;
> +
> +       drm_bridge_add(bridge);
> +}
> +
>  static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
>  {
>         int ret;
> @@ -1637,11 +1652,6 @@ static int it66121_probe(struct i2c_client *client)
>             ctx->device_id != ctx->info->pid)
>                 return -ENODEV;
>
> -       ctx->bridge.funcs = &it66121_bridge_funcs;
> -       ctx->bridge.of_node = dev->of_node;
> -       ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> -       ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> -
>         ret = devm_request_threaded_irq(dev, client->irq, NULL, it66121_irq_threaded_handler,
>                                         IRQF_ONESHOT, dev_name(dev), ctx);
>         if (ret < 0) {
> @@ -1649,9 +1659,9 @@ static int it66121_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> -       it66121_audio_codec_init(ctx, dev);
> +       it66121_bridge_init_base(&ctx->bridge, dev->of_node, true);
>
> -       drm_bridge_add(&ctx->bridge);
> +       it66121_audio_codec_init(ctx, dev);
>
>         dev_info(dev, "IT66121 probed, chip id: 0x%x:0x%x, revision: %u\n",
>                  ctx->vender_id, ctx->device_id, ctx->revision);
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
