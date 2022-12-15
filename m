Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9C64DA3D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EA310E52C;
	Thu, 15 Dec 2022 11:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBCC10E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:26:06 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so20537651fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vzBu09mDNq5od2QDqdPk1lAEX0XPtU9krf/GwA+RPJY=;
 b=v2m4kc2iGSRRt6ZRKPEIUlectgou5queRkEGL01awAIbkgCEaqvbvAxEkYhItFmPMp
 7eUXUQqZ2/L5JqxNrVK6z86qAEprHOgQhs56OT5JKnYK5gQulYFG0lp/Ek0cGB6e+kC6
 bXklXxjbxepwEnHaaqRFpMae+jxdL5DLKMZFJjvUw9xYZx7ABdoN9tHd3Mpu4GCJ9vSA
 tkM2aVe36dNnW5kBz97UxFuNz39KRiUqP2z+uAMHoXJSSl1G/hNXaCK2GEsIMgcJAFRY
 3tNKrknSWLnQRqkVnY9VhxKHnde18lnjyXkg+7abkEe0hGYRoKENtb7C486z78pV3/+7
 IPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vzBu09mDNq5od2QDqdPk1lAEX0XPtU9krf/GwA+RPJY=;
 b=LEtrZuFp7484BM6FtrN0dgqx+EvhZJHm9zS3J7kG0A6dgSD5JPOS0V8OXrla/+PsOy
 V0jkhz6kyABPZkMxtdmDbIj57GmSvzhGrfCJUNamMnjGhe0UDjhv3+2Jp46Ev8XzDYKx
 5NAMQ/Uz1XIyWmlWz/GD6lkHlc7mMDZno5xLvQlVP2w5FOg7kaITKJ32uRDWaNdWauYb
 SeXXF8UiUBBGFvoIKmRBdb9CTAWTTGtoX2lb3JgI5Z0LgOS8XxRUDTvMEW2BF6hnrdKd
 DZAO4XAxDN35Magq8Wm0kUMoQg1605+UlZvGHg7OfBiKXVyrEF9Nvsbl2Ggwl+0tL71t
 0d2w==
X-Gm-Message-State: AFqh2krXjoangdVhikI0AFMTLS+dgrA4K9orb7H6Zji0AZQZ8KFBPx0C
 gkDssw3nM3dg81JfR5g+8YkzR50I0kNCdXH7BqUXlg==
X-Google-Smtp-Source: AA0mqf45eNjcBDqYyjIy3WCWWUrekvaEjIMVCLmAAlhDuVxeAdYM+pNqRVSpZsJGArT7JNtrZpNNeiQ8znox2+ggghU=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr594661oab.14.1671103565499; Thu, 15
 Dec 2022 03:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214130122.12911-1-paul@crapouillou.net>
In-Reply-To: <20221214130122.12911-1-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:25:54 +0100
Message-ID: <CAG3jFysF_i0ycn8AADJsq6+SOpwwP0-CTp04gXuD6sV=FYzE=w@mail.gmail.com>
Subject: Re: [PATCH 09/10] drm: bridge: it66121: Move VID/PID to new
 it66121_chip_info structure
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

On Wed, 14 Dec 2022 at 14:01, Paul Cercueil <paul@crapouillou.net> wrote:
>
> This will make it easier later to introduce support for new chips in
> this driver.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 7972003d4776..43b027b85b8e 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -35,10 +35,6 @@
>  #define IT66121_DEVICE_ID0_REG                 0x02
>  #define IT66121_DEVICE_ID1_REG                 0x03
>
> -#define IT66121_VENDOR_ID0                     0x54
> -#define IT66121_VENDOR_ID1                     0x49
> -#define IT66121_DEVICE_ID0                     0x12
> -#define IT66121_DEVICE_ID1                     0x06
>  #define IT66121_REVISION_MASK                  GENMASK(7, 4)
>  #define IT66121_DEVICE_ID1_MASK                        GENMASK(3, 0)
>
> @@ -286,13 +282,12 @@
>  #define IT66121_AUD_SWL_16BIT                  0x2
>  #define IT66121_AUD_SWL_NOT_INDICATED          0x0
>
> -#define IT66121_VENDOR_ID0                     0x54
> -#define IT66121_VENDOR_ID1                     0x49
> -#define IT66121_DEVICE_ID0                     0x12
> -#define IT66121_DEVICE_ID1                     0x06
> -#define IT66121_DEVICE_MASK                    0x0F
>  #define IT66121_AFE_CLK_HIGH                   80000 /* Khz */
>
> +struct it66121_chip_info {
> +       u16 vid, pid;
> +};
> +
>  struct it66121_ctx {
>         struct regmap *regmap;
>         struct drm_bridge bridge;
> @@ -311,6 +306,7 @@ struct it66121_ctx {
>                 u8 swl;
>                 bool auto_cts;
>         } audio;
> +       const struct it66121_chip_info *info;
>  };
>
>  static const struct regmap_range_cfg it66121_regmap_banks[] = {
> @@ -1451,6 +1447,7 @@ static const char * const it66121_supplies[] = {
>
>  static int it66121_probe(struct i2c_client *client)
>  {
> +       const struct i2c_device_id *id = i2c_client_get_device_id(client);
>         u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>         struct device_node *ep;
>         int ret;
> @@ -1472,6 +1469,7 @@ static int it66121_probe(struct i2c_client *client)
>
>         ctx->dev = dev;
>         ctx->client = client;
> +       ctx->info = (const struct it66121_chip_info *) id->driver_data;
>
>         of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>         of_node_put(ep);
> @@ -1523,8 +1521,8 @@ static int it66121_probe(struct i2c_client *client)
>         revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
>         device_ids[1] &= IT66121_DEVICE_ID1_MASK;
>
> -       if (vendor_ids[0] != IT66121_VENDOR_ID0 || vendor_ids[1] != IT66121_VENDOR_ID1 ||
> -           device_ids[0] != IT66121_DEVICE_ID0 || device_ids[1] != IT66121_DEVICE_ID1) {
> +       if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
> +           (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
>                 return -ENODEV;
>         }
>
> @@ -1563,8 +1561,13 @@ static const struct of_device_id it66121_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, it66121_dt_match);
>
> +static const struct it66121_chip_info it66121_chip_info = {
> +       .vid = 0x4954,
> +       .pid = 0x0612,
> +};
> +
>  static const struct i2c_device_id it66121_id[] = {
> -       { "it66121", 0 },
> +       { "it66121", (kernel_ulong_t) &it66121_chip_info },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, it66121_id);
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
