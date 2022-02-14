Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0984B5087
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386D710E2D1;
	Mon, 14 Feb 2022 12:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5BE10E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:46:07 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c3so10434116pls.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0X10fqVg5ykSsl0oa12K6qvRRlEqIFV+m6yNZED4E7A=;
 b=rKKxy2R8fGUZxy4yN6sE3nZA0tl06MCzW2Ls++PHOTDVrPXLzygCzac8nZSMCDQyrM
 CprDceB4vcha58qMi6w99egwcMY599n+6rvJIdQ9zM76OCGOGZY9Mdkm/vTmQ2UNLxyS
 3ETiLInfrZfB/IgOhZ8Fd6PRzRQz917hIRlcakTbWCl9LLEF3Oval4zMV11mkhjXR5Eg
 oMpcmm8mwP07qi2AScrsM2z3ft9FLxi+qRE+Fkq7FzDUDWd3S3YaTRZ4v/bhju5gQXi9
 bk7AyOTUc2/elIt8DFwxUniVxI292uGSKGYnnqVP8mToeF278huGYKjGU5y3xKJ0xqBK
 8fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0X10fqVg5ykSsl0oa12K6qvRRlEqIFV+m6yNZED4E7A=;
 b=j+kp62qBEqhgi+mjIaJnkOLT4w/TVin9M5ZFvU6YbCpTE+26abgmJHyFCcachZ49fJ
 QwUj8i2PdZVt+xdNUEh0lTsooeTyW4zgB9AfgLQHQxZzY+bw9imDNRZJBBB9FyOGAibN
 tfdr00wWigS90cs3t9Q+7HMdelhoYE/5vjNeiqHcnTKgvjZra7TlCjgfSSkYTzdZtj5X
 tY6QP7dHfBi8MPPBNpjiZCt1PgCkhMFA7EPDc0lA6G50wcDrd6QPnWAAF9MF8IhrtXdi
 XXJ/cEFsLamrIdk6OpWWJY28ew9GgHjJWRYXhKZUaW/eY79ESi9Q6zRGVC+fdXUB4nP8
 mxLw==
X-Gm-Message-State: AOAM5322ZB8AVBKcNK0SVhO0J6uTKUkHcO5lTZp+PorfkJMJ3kz49vPY
 nJoWjiAYEnZjPUMm+3qMBWeA76/9tVoo8GtlnyFpvQ==
X-Google-Smtp-Source: ABdhPJwpYiRviXzPnHiXUbMl+Aq+C5W/r9mv9wpZCvcR0to900oGyukQ6bFi7DWaKdzFRE6/qBHINfbErKMGwwx7t/8=
X-Received: by 2002:a17:902:714a:: with SMTP id
 u10mr14145494plm.21.1644842766711; 
 Mon, 14 Feb 2022 04:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20220213103437.3363848-1-hsinyi@chromium.org>
In-Reply-To: <20220213103437.3363848-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 14 Feb 2022 13:45:55 +0100
Message-ID: <CAG3jFyuZ4mm0UEE79vXgNoed5Z7C5-3gBzK_RCpoaYssu=KgHA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm/bridge: anx7625: send DPCD command to
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 13 Feb 2022 at 11:34, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> From: Xin Ji <xji@analogixsemi.com>
>
> Send DPCD command to downstream before anx7625 power down,
> let downstream monitor enter into standby mode.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
> 2.35.1.265.g69c8d7142f-goog
>

Applied series to drm-misc-next.
