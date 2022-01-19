Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7561493D58
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6269910E355;
	Wed, 19 Jan 2022 15:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAB710E3A8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:38:54 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so6839543pja.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ca2VVrnwlbvkOz2O67u7fxspTtkKF37Zaj8dip0NjTQ=;
 b=D1jpejDpd9SMLs89An6WE28gBHy6FegBK7DonnMALByufJSIEcSb5p5hKjTI5MLl+4
 iVi34d4vAd5Nc6xAEQk+tXbttiqJpqF6nCwqpIuEpUTyiLzHiGd3XGWYfJnvmAiyWs+h
 ZAJ+N06nw7rDTplqkQnap/3m0bVd3LFKDRasAYV1DjbPbey3+1usvZABiFJKJUeCQI4i
 m+l2ERGlwqscy0w1cWO0EuBZ6/y+S3+X4pAFCn0F3lw1ezfdKJdNhvva0shcKaiwqfSe
 oLbLxHsWF06qBzzDvKZ1j1VZlyckuV3Eyf698jGbB1s6DmBpBA+btW+abEGT+nG9FPML
 iCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ca2VVrnwlbvkOz2O67u7fxspTtkKF37Zaj8dip0NjTQ=;
 b=4qqoyJO7d0KogWS8N8fDX1Bz9vWUL84M1GYyUs89UnvHx5ZXQmjCOvmMZv8Bh9lxeP
 hsAEMSL850myga/aiab0/evxuUIvw68uo59WgM0Ef5I8xLfedHiDm6eFTBaYigFnaYOG
 ZepSVfC/NT9yygiHHeiiPPQQ7u9ZQnkt2V1Jy0V6YR4ojKS8Ay6ygEK7uOyEnTXZ6gse
 TzTRkqNhHBM0GFL0TAdqq2EiukcTJ3+myownW/oHDbpQL7hQ44jpmnNj2OC588iUBiJ7
 RO02qLLXNIKcisYxCpYLQyjjlOclDt1APlk6aZucgzw7fSH7XFedcBtByWcAXwwid/B5
 LrJg==
X-Gm-Message-State: AOAM531zd8SndmlkLEgqYTQ43SbrHbwHfFCiZtD0WRw3sbL4z3dAIKIL
 n93Mj2pZRg20NbNuJuaGFMtAUYzKN3UKD/wGeOs/FQ==
X-Google-Smtp-Source: ABdhPJyckmQwC/qNjWRRotvjJu/qG2q60dVDPU3XeJd75TWb7Jx+auxcDK3Hpfc+XfNGFfDj++T0IN+8JFs6IuRIuqk=
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr5020906pjb.179.1642606733843; 
 Wed, 19 Jan 2022 07:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20220119151751.986185-1-hsinyi@chromium.org>
In-Reply-To: <20220119151751.986185-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 19 Jan 2022 16:38:42 +0100
Message-ID: <CAG3jFys5_jo68Arot=qYXjk0yL-5Z9-ybTipOTrS1Aa-C4PrNQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: anx7625: send DPCD command to
 downstream
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jan 2022 at 16:17, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> From: Xin Ji <xji@analogixsemi.com>
>
> Send DPCD command to downstream before anx7625 power down,
> let downstream monitor enter into standby mode.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Hsin-Yi: Can you supply a r-b tag to this patch if it looks good to you?

> ---
> v3->v4:
> Use common DP_AUX_NATIVE_READ/WRITE
>
> Previously in:
> https://patchwork.kernel.org/project/dri-devel/patch/1f36f8bf0a48fb2bba17bacec23700e58c1d407d.1641891874.git.xji@analogixsemi.com/
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 42 +++++++++++++++++++----
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  2 --
>  2 files changed, 35 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 76662fce4ce61d..17b23940549a42 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -129,6 +129,23 @@ static int anx7625_reg_write(struct anx7625_data *ctx,
>         return ret;
>  }
>
> +static int anx7625_reg_block_write(struct anx7625_data *ctx,
> +                                  struct i2c_client *client,
> +                                  u8 reg_addr, u8 len, u8 *buf)
> +{
> +       int ret;
> +       struct device *dev = &client->dev;
> +
> +       i2c_access_workaround(ctx, client);
> +
> +       ret = i2c_smbus_write_i2c_block_data(client, reg_addr, len, buf);
> +       if (ret < 0)
> +               dev_err(dev, "write i2c block failed id=%x\n:%x",
> +                       client->addr, reg_addr);
> +
> +       return ret;
> +}
> +
>  static int anx7625_write_or(struct anx7625_data *ctx,
>                             struct i2c_client *client,
>                             u8 offset, u8 mask)
> @@ -214,8 +231,8 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
>         return 0;
>  }
>
> -static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> -                                u32 address, u8 len, u8 *buf)
> +static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
> +                                 u32 address, u8 len, u8 *buf)
>  {
>         struct device *dev = &ctx->client->dev;
>         int ret;
> @@ -231,8 +248,7 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
>         addrm = (address >> 8) & 0xFF;
>         addrh = (address >> 16) & 0xFF;
>
> -       cmd = DPCD_CMD(len, DPCD_READ);
> -       cmd = ((len - 1) << 4) | 0x09;
> +       cmd = DPCD_CMD(len, op);
>
>         /* Set command and length */
>         ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> @@ -246,6 +262,9 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
>         ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
>                                  AP_AUX_ADDR_19_16, addrh);
>
> +       if (op == DP_AUX_NATIVE_WRITE)
> +               ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
> +                                              AP_AUX_BUFF_START, len, buf);
>         /* Enable aux access */
>         ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
>                                 AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> @@ -255,14 +274,17 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
>                 return -EIO;
>         }
>
> -       usleep_range(2000, 2100);
> -
>         ret = wait_aux_op_finish(ctx);
>         if (ret) {
>                 dev_err(dev, "aux IO error: wait aux op finish.\n");
>                 return ret;
>         }
>
> +       /* Write done */
> +       if (op == DP_AUX_NATIVE_WRITE)
> +               return 0;
> +
> +       /* Read done, read out dpcd data */
>         ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
>                                      AP_AUX_BUFF_START, len, buf);
>         if (ret < 0) {
> @@ -845,7 +867,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>         }
>
>         /* Read downstream capability */
> -       anx7625_aux_dpcd_read(ctx, 0x68028, 1, &bcap);
> +       anx7625_aux_dpcd_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
>         if (!(bcap & 0x01)) {
>                 pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
>                 return 0;
> @@ -918,6 +940,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
>         int ret;
> +       u8 data;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "stop dp output\n");
>
> @@ -929,6 +952,11 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
>         ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, 0x08, 0x7f);
>
>         ret |= anx7625_video_mute_control(ctx, 1);
> +
> +       dev_dbg(dev, "notify downstream enter into standby\n");
> +       /* Downstream monitor enter into standby mode */
> +       data = 2;
> +       ret |= anx7625_aux_dpcd_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
>         if (ret < 0)
>                 DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 56165f5b254c14..64a8ab56529404 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -242,8 +242,6 @@
>
>  #define AP_AUX_COMMAND 0x27  /* com+len */
>  #define LENGTH_SHIFT   4
> -#define DPCD_READ      0x09
> -#define DPCD_WRITE     0x08
>  #define DPCD_CMD(len, cmd)     ((((len) - 1) << LENGTH_SHIFT) | (cmd))
>
>  /* Bit 0&1: 3D video structure */
> --
> 2.34.1.703.g22d0c6ccf7-goog
>
