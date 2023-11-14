Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A002D7EB465
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D5710E464;
	Tue, 14 Nov 2023 16:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37F10E468
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:05:40 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5a90d6ab962so67071227b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699977939; x=1700582739; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WfkIhYLDN5Q40p/hrse+654ByEaL28KAMyC20ym6eww=;
 b=pdlkadtCnL9k+7QNIyOfeqro1jq/Q1Yt9St7P8eGz8Hqd6K60E0FY36jsxvg3JKWYw
 g5LdSZzdL+IYOM12bddCA7JKDd+J/A3O1NrBjpK1NjppgCArOk9tnlCdRRGceTtlE8j4
 ep/Zg0ViKq3vl3f0KWc4TyGWAWPkJGaodvLaRAKfIPYzs3XNCpxXUbULr5y+aGb4/Emc
 512M/eMFdKDBW5yhjyR3RXzRJI4+dgV7/78PiJEY2n8MGvOyoGCFlaxNohhKrkan/J8p
 YVKvJHzXSJv8+V7VkGvXz4fm87RTCzhwACeONepCSIvaWzSddBKPUvLmTv8CFxUz+BpM
 z/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699977939; x=1700582739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WfkIhYLDN5Q40p/hrse+654ByEaL28KAMyC20ym6eww=;
 b=BbkON2JeL47e/DxccmW+JFUS1iosYXHLJP7jz5O94+eX5Z7cS5Uo71N85rG6AMcBJ4
 6GwosMK4ikGEcSmKbJm1sc3ldd1fEhnke3MOk/rpWNeyXCJ/21wfR4ZG3vJdCue4qqZl
 0Co2+Z2i+TJKOqZMsuLXFoN/pPVp+iZSgTUIJRyZzsAMJ4+9CXva25rfXhNhyBQIoeIj
 B2HLn7o+MKtovgTR/e7GuNk1gEg4SVgeRCZUIdjBl45YhPmjN5EMqCj4WWdaWGMIeqFe
 V/hafK2Zwor9MjH9GwZKSCCZtajwx5br3Zlo99JeB/6WVRU5Y/GjQEsSYZGZ1XFodgvk
 +tWw==
X-Gm-Message-State: AOJu0YyvPdaRKu0SLA7dk3q7tN7Ne/ezquFqUP0xK7hDlmXnuRp4/8LY
 3bSta2c36i0voajit3JXIZOUR2dxdEOuAxgURKYFNOt3FjWc0Z3SkHk=
X-Google-Smtp-Source: AGHT+IE2uFa8wpPES/znVeDKECxvMLpftVWkcswHyO5DEGPZytjv38tdoGHKEukoT+EL/XJ0A+CoxJaO//giNxlpFCo=
X-Received: by 2002:a81:840b:0:b0:5be:ae23:c002 with SMTP id
 u11-20020a81840b000000b005beae23c002mr9935221ywf.26.1699977939348; Tue, 14
 Nov 2023 08:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-5-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-5-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 18:05:28 +0200
Message-ID: <CAA8EJpp0HY=PsCVFk4S3OERNUcin73c5w6ihnoY6aFg83+NhkA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: it66121: Add a helper function to get the
 next bridge
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
> Group the code lines(which with the same functional) into one dedicated
> function, which reduce the weight of it66121_probe() function. Just trivial
> cleanuo, no functional change.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 53 ++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 0f78737adc83..7e473beefc79 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -340,6 +340,37 @@ static int it66121_of_read_bus_width(struct device *dev, u32 *bus_width)
>         return 0;
>  }
>
> +static int it66121_of_get_next_bridge(struct device *dev,
> +                                     struct drm_bridge **next_bridge)

it already exists and it is called drm_of_find_panel_or_bridge(),
could you please use it instead?

> +{
> +       struct device_node *np;
> +       struct drm_bridge *bridge;
> +
> +       np = of_graph_get_remote_node(dev->of_node, 1, -1);
> +       if (!np) {
> +               dev_err(dev, "The endpoint is unconnected\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!of_device_is_available(np)) {
> +               of_node_put(np);
> +               dev_err(dev, "The remote device is disabled\n");
> +               return -ENODEV;
> +       }
> +
> +       bridge = of_drm_find_bridge(np);
> +       of_node_put(np);
> +
> +       if (!bridge) {
> +               dev_dbg(dev, "Next bridge not found, deferring probe\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       *next_bridge = bridge;
> +
> +       return 0;
> +}
> +
>  static const struct regmap_range_cfg it66121_regmap_banks[] = {
>         {
>                 .name = "it66121",
> @@ -1531,7 +1562,6 @@ static const char * const it66121_supplies[] = {
>  static int it66121_probe(struct i2c_client *client)
>  {
>         u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> -       struct device_node *ep;
>         int ret;
>         struct it66121_ctx *ctx;
>         struct device *dev = &client->dev;
> @@ -1553,24 +1583,9 @@ static int it66121_probe(struct i2c_client *client)
>         if (ret)
>                 return ret;
>
> -       ep = of_graph_get_remote_node(dev->of_node, 1, -1);
> -       if (!ep) {
> -               dev_err(dev, "The endpoint is unconnected\n");
> -               return -EINVAL;
> -       }
> -
> -       if (!of_device_is_available(ep)) {
> -               of_node_put(ep);
> -               dev_err(dev, "The remote device is disabled\n");
> -               return -ENODEV;
> -       }
> -
> -       ctx->next_bridge = of_drm_find_bridge(ep);
> -       of_node_put(ep);
> -       if (!ctx->next_bridge) {
> -               dev_dbg(dev, "Next bridge not found, deferring probe\n");
> -               return -EPROBE_DEFER;
> -       }
> +       ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
> +       if (ret)
> +               return ret;
>
>         i2c_set_clientdata(client, ctx);
>         mutex_init(&ctx->lock);
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
