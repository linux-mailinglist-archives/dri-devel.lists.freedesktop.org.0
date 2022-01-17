Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B0E49059B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 11:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F6110E3F3;
	Mon, 17 Jan 2022 10:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50310E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:01:57 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h23so20736283iol.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 02:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9lyJAGqBofRWo1qK7fgotoHTB1vgALbZgFQ2+TVR5Y=;
 b=JuVKl79n/s23IizN3xfCg3JeY7hrC5wEZ2x4dgs6UIjrKGOKqIXzOLnpogXm7vh6If
 guRkJjUNSEe1rCp1FpjVIdWkhPXjJLlEA835HeaPhC0rALd4NrFOV2z7vINZhm6EPYHZ
 IPayOp/VG01aeYtKg40rHqvNAELu9SBPBkg3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9lyJAGqBofRWo1qK7fgotoHTB1vgALbZgFQ2+TVR5Y=;
 b=YgkdUrabrINe0dZH5/1AOjIl287lW+yrTAf9Ej9KDkMBQmImUt9sWV8WxUX2GxwWWg
 6T2s17fDTT2PcFJyGVru7tufDM2dNgQG9nU5fXEyesfCSuVqueUdJ8IZ2hyikjDsaC5D
 c2Qapg01KAOQmRgcfBAPr4z8Y4Knj93/T8TB0ElK81q8BrGJnaIAc3Ioi2RhOgktdd1D
 vNdb/xXx8Ffr6C+907WytI6E5E52A8jf9J0yAMggmIk+rDny1K7srO4Ay2T9+Z0ID+5q
 dgTgdsWDvkcG31K9jV5+8Fpy6nnEl04iPrYa5OZjzJA0jby5EJugujge79PYk1tecqYv
 w7Gw==
X-Gm-Message-State: AOAM531g9MbeVLZ5aOxVcfqvm1WSTE/aeJqf/gRHjqtk7rlgQ5dqyzPU
 g1API8MhQEJ6nMoXpSXaAjx2M4FeCBxc2apTGPtjcw==
X-Google-Smtp-Source: ABdhPJwJ9zat7Em6wxplug+Yiv5wzgO+WyvU9/pTxXHBiFvKKNnQxxBiG2M3jcSdX5PNBZ7t0jz+f7m3tpctKzZHlIc=
X-Received: by 2002:a05:6602:490:: with SMTP id
 y16mr9854850iov.162.1642413716553; 
 Mon, 17 Jan 2022 02:01:56 -0800 (PST)
MIME-Version: 1.0
References: <1f36f8bf0a48fb2bba17bacec23700e58c1d407d.1641891874.git.xji@analogixsemi.com>
In-Reply-To: <1f36f8bf0a48fb2bba17bacec23700e58c1d407d.1641891874.git.xji@analogixsemi.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 17 Jan 2022 18:01:30 +0800
Message-ID: <CAJMQK-gjUtJ4Lo35iR5Y2Pi=Dm7mX=O05BwoTpwxbFEuDVvfvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/bridge: anx7625: send DPCD command to
 downstream
To: Xin Ji <xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 5:06 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> Send DPCD command to downstream before anx7625 power down,
> let downstream monitor enter into standby mode.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 42 +++++++++++++++++++----
>  1 file changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 33383f83255d..0b858c78abe8 100644
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
> +       if (op == DPCD_WRITE)
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
> +       if (op == DPCD_WRITE)
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
> +       anx7625_aux_dpcd_trans(ctx, DPCD_READ, 0x68028, 1, &bcap);
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
> +       ret |= anx7625_aux_dpcd_trans(ctx, DPCD_WRITE, 0x000600, 1, &data);

Is DPCD_READ/WRITE used for the same purpose as
DP_AUX_NATIVE_WRITE/READ? If so, maybe you can just use
DP_AUX_NATIVE_WRITE/READ and we don't need to define these values
again in the driver?

>         if (ret < 0)
>                 DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
>
> --
> 2.25.1
>
