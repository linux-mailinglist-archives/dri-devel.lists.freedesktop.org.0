Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068AE7EB45A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0FD10E45F;
	Tue, 14 Nov 2023 16:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117FC10E45F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:03:58 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5bf812041a6so63562667b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699977838; x=1700582638; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=84sMBLOoP3332x+kaQPC6WEmGeMSigBRO9sqFIeWhaw=;
 b=QHVtA9vRhMCkdh7K+xqRHweYQN0FeOX/R/WrDMdiqQ1LwW5blNuh5kQEnnbVddT0IN
 2CRb82lUUpy6TYO8lyUl6hHVuGsnN/1pLneUb4omOXlWqkYOvGYI8beSJlJ8B7MmWaxW
 fbC5RpGo17Xr5CMi2HJXsYrH4288smCDjcQm1i91MM15QWPwfFT9QfaUr2Qx77s2BEDZ
 Pr3FsICPMDmoas61E2r3EONIn1m97mFHhDOBruUb0AdUZMEuiKFkLX8lOtZnZ9cgvk0k
 IGCQ730nyY3jG3kLnb3wtHOZ4mcANPMXrQW2hevffyekmrc9E+EUU/nphz86h+N3hd3x
 wxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699977838; x=1700582638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=84sMBLOoP3332x+kaQPC6WEmGeMSigBRO9sqFIeWhaw=;
 b=dGnLO/2kmmsnJEsaWyGwYyG3Sgz4MXXFckMJpjsliXAUUd6o1JfXQZEUN68rjfJ3Ay
 5dzNOVu3F+K40cDGaYochE1YtZRBDfmgfWnWwyD1tj3XJUFpi0EfXcNYsaSGRUgPtVg2
 sU8HhrQQ1As4PCQs/7ofooam1Ix5EMc4tkhDzlCiwxp1KKVv+xvyuhlMPxmuwMtxrDTm
 QXOpVHO9qtq6aCYtEngp7OARkoHWekd/QXt0mqqo1pE/Pv9dZ+PU6EmYaULBm+yoLB7W
 px5MzcTX7Qn5XbhmyJWvqy53dguYZVs/4XYCYmQ86I03tE47i5Sev+ra9CP0UMyEVD1h
 vizg==
X-Gm-Message-State: AOJu0Yzf28/TU0a1e0ZyZLDwXh533c/yUhNRVkhwLVbwu9bG2VvqHazp
 FbsIxahMO8n/vQo7HN/Z029QGdXw+KVr40od79r1lA==
X-Google-Smtp-Source: AGHT+IFIv/dr950N6/LEfu34S82r9+GhcCMi5FKjW5Jcm5LagL4BVhGWPQCJjXVH0we8WxFPHGlKtF0/97aoe9Dk3L4=
X-Received: by 2002:a0d:f304:0:b0:5a8:2b82:a031 with SMTP id
 c4-20020a0df304000000b005a82b82a031mr9872136ywf.26.1699977837957; Tue, 14 Nov
 2023 08:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-4-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-4-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 18:03:47 +0200
Message-ID: <CAA8EJprhnxx6bS6cn1JAbdzyB_+N1BbajkuO8zs2_OxXPeV84Q@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/bridge: it66121: Add a helper function to read
 bus width
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
> Group those relavent code lines (which with common purpose) into one helper
> function, suppress the dependency on DT to function level. Just trivial
> cleanup, no functional change.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 32 ++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 83dbdbfc9ed8..0f78737adc83 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -320,6 +320,26 @@ static inline struct it66121_ctx *bridge_to_it66121(struct drm_bridge *bridge)
>         return container_of(bridge, struct it66121_ctx, bridge);
>  }
>
> +static int it66121_of_read_bus_width(struct device *dev, u32 *bus_width)

Using a pointer to return int value doesn't look right. Just return a
signed int here and if it is not an error, assign it to ctx->bus_width

> +{
> +       struct device_node *np;
> +       u32 bw;
> +
> +       np = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +       if (!np)
> +               return -EINVAL;
> +
> +       of_property_read_u32(np, "bus-width", &bw);
> +       of_node_put(np);
> +
> +       if (bw != 12 && bw != 24)
> +               return -EINVAL;
> +
> +       *bus_width = bw;
> +
> +       return 0;
> +}
> +
>  static const struct regmap_range_cfg it66121_regmap_banks[] = {
>         {
>                 .name = "it66121",
> @@ -1525,19 +1545,13 @@ static int it66121_probe(struct i2c_client *client)
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
> +       ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
> +       if (ret)
> +               return ret;
>
>         ep = of_graph_get_remote_node(dev->of_node, 1, -1);
>         if (!ep) {
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
