Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855767EB46F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429710E469;
	Tue, 14 Nov 2023 16:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D984110E469
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:06:49 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5a87ac9d245so68059117b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699978009; x=1700582809; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Y7pSbHxAeptPMpbGtw1Nyu9tRet4KDB8iz60TRRUZY=;
 b=dB3NDRco9xizWhAEB3pCZsNC8nixjwX315vUqBRdX/rE3hjzCc9rdvlOHTu5suAmYO
 1rRb521B6Xn683Hc/Ux5FjPZXnYmE/Nx/BwgSDb2aXbBj1vdnv/denKGkN5HrM9d4/lR
 KNHW56cr7F7MLn7foEGNCmEFS/iLOzXAmEblgKju/4agNauCrClTcoASjO6Wc51Tr9F9
 arSeP/v2rwVX7PsjO5qDReI/ULnsJlHFCS6xaNFokStQ3ASUD7BnMPFgHb4qQaB+oNJr
 pEkBaC1lE5Lqg4FcgdiZGEnJf2SiDkwkdooFwKyfnpqBFJvOFSZNSQRKuV1TjZPnzQ9x
 lyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699978009; x=1700582809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Y7pSbHxAeptPMpbGtw1Nyu9tRet4KDB8iz60TRRUZY=;
 b=iItkdgljUv/L0D/ugt3mwb+IQCJY6z4DfugABfoZV5ssTzaR9evfAw2LmiIj1dhk+I
 iFSkEl07x20U33G69wKFRWpNKUbZhu/lfwwmCzHL+xqtRDggOo80t+QEqJgEIPvSZ2Ua
 YJMb2qQtlOzHfY9CJ2vsDfW5wx3137iRvU5dpI5dx+sIwMHu/9HA3F5W7/XRA+TAQV33
 44YVN3vmx2nikI1obeW7J8d+pwfoI0FpPKVB6RLIYznWR/KdWSivaG9FEDDxIdOBpigG
 nrFOhR/n74wzW2eHlQIvwVYnEsyc0nJugIjzMnSMUkIRYLAHDKPk2JXXqdRarNNiJgIJ
 Kv8w==
X-Gm-Message-State: AOJu0Yx0DtyHdAybRgQQcAHO9JuU3TDEDu0Jkrz5XYVGtR8YFkR6vBOm
 RsW+alnIcZUFyMUO6/oDwneg8wqcYLOdB0nQxyCjaw==
X-Google-Smtp-Source: AGHT+IGKnxLbqMi0TPe5TBa4FgaIVmyvb8hFukBEwfaro0b+XieoQDT5QEOxlHajv9JhlfHFixRwD7rpQSLkUUFt1qM=
X-Received: by 2002:a81:49c2:0:b0:5b3:23f7:4254 with SMTP id
 w185-20020a8149c2000000b005b323f74254mr10635050ywa.25.1699978008914; Tue, 14
 Nov 2023 08:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-6-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-6-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 18:06:37 +0200
Message-ID: <CAA8EJprkDpjuHEi5R01p4XNvFBr94BvXhr7AZCLr6dC8Mk=yPw@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/bridge: it66121: Add a helper function to read
 chip id
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
> Read the required chip id data back by calling regmap_bulk_read() once,
> reduce the number of local variables needed in it66121_probe() function.
> And store its values into struct it66121_ctx, as it will be used latter.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 47 ++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 7e473beefc79..f36d05331f25 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -313,6 +313,9 @@ struct it66121_ctx {
>                 bool auto_cts;
>         } audio;
>         const struct it66121_chip_info *info;
> +       u16 vender_id;
> +       u16 device_id;
> +       u8 revision;

There is no need to store them, they are not used by the driver anywhere.

>  };
>
>  static inline struct it66121_ctx *bridge_to_it66121(struct drm_bridge *bridge)
> @@ -399,6 +402,30 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
>         gpiod_set_value(ctx->gpio_reset, 0);
>  }
>
> +static int it66121_read_chip_id(struct it66121_ctx *ctx, bool verbose)
> +{
> +       u8 id[4];
> +       int ret;
> +
> +       ret = regmap_bulk_read(ctx->regmap, IT66121_VENDOR_ID0_REG, id, 4);
> +       if (ret < 0) {
> +               dev_err(ctx->dev, "Failed to read chip ID: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ctx->vender_id = (u16)id[1] << 8 | id[0];
> +       ctx->device_id = ((u16)(id[3] & IT66121_DEVICE_ID1_MASK) << 8 | id[2]);
> +       /* Revision is shared with DEVICE_ID1 */
> +       ctx->revision = FIELD_GET(IT66121_REVISION_MASK, id[3]);
> +
> +       if (verbose) {
> +               dev_info(ctx->dev, "Found ITE66121: 0x%x%x, revision: %u\n",
> +                        ctx->vender_id, ctx->device_id, ctx->revision);
> +       }
> +
> +       return 0;
> +}
> +
>  static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)
>  {
>         return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG, IT66121_MASTER_SEL_HOST);
> @@ -1561,7 +1588,6 @@ static const char * const it66121_supplies[] = {
>
>  static int it66121_probe(struct i2c_client *client)
>  {
> -       u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>         int ret;
>         struct it66121_ctx *ctx;
>         struct device *dev = &client->dev;
> @@ -1603,19 +1629,13 @@ static int it66121_probe(struct i2c_client *client)
>         if (IS_ERR(ctx->regmap))
>                 return PTR_ERR(ctx->regmap);
>
> -       regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
> -       regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
> -       regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
> -       regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
> -
> -       /* Revision is shared with DEVICE_ID1 */
> -       revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
> -       device_ids[1] &= IT66121_DEVICE_ID1_MASK;
> +       ret = it66121_read_chip_id(ctx, false);
> +       if (ret)
> +               return ret;
>
> -       if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
> -           (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
> +       if (ctx->vender_id != ctx->info->vid ||
> +           ctx->device_id != ctx->info->pid)
>                 return -ENODEV;
> -       }
>
>         ctx->bridge.funcs = &it66121_bridge_funcs;
>         ctx->bridge.of_node = dev->of_node;
> @@ -1633,7 +1653,8 @@ static int it66121_probe(struct i2c_client *client)
>
>         drm_bridge_add(&ctx->bridge);
>
> -       dev_info(dev, "IT66121 revision %d probed\n", revision_id);
> +       dev_info(dev, "IT66121 probed, chip id: 0x%x:0x%x, revision: %u\n",
> +                ctx->vender_id, ctx->device_id, ctx->revision);
>
>         return 0;
>  }
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
