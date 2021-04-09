Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69216359896
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 11:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CF96EBA2;
	Fri,  9 Apr 2021 09:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231A36EBA2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 09:06:06 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id m11so3806552pfc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jBFt7hCrEED4DsJn/9ZDSGXx+J7qlQtOTDSK460XmiI=;
 b=qhVVkziSC7x1hcssW43FRmDyNiuqo7qvZ8oZqJw0yJAZPFQIuG9YngIGR+LUaqB6Ep
 gA0gy1rtKXR6pUe+/fTk+cRdVip2NDRJfYqPp4N7Nar3zdZAVXnNb0gqTgh9lrCKFh6S
 87iGSlbqb92KPO4K/jLdHRgCSCmVYSxcOz55ychgqVAz+N8EYxu//WImHLTU2LXA803m
 KcAvG1kJ1zioKENp2TW5WlpVumZkM3qHnwtZWDc0P6zLrHsqQKTqCgypr7ay8QtV2k+S
 x8sIo+8i8SkHHAtQZp25m/v+3lJoRrbuTW8PGi9pJrKLQPpUkY48wUMyFX93oaC9ZQ5D
 Mo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jBFt7hCrEED4DsJn/9ZDSGXx+J7qlQtOTDSK460XmiI=;
 b=JXMfpc39AvNz0j/Xi5+OCTCrL8M8EYAYK52ysmanjb/v5xyHPxTYwkdxemK9zu/wdT
 F4uxLlvy7Guef4vMH3R69VOn44Fez1/DrwUfhyazL+XRxHTM/lLgt8KCLN1e/YuBLRtd
 qtjtdfC2gdw6tvXU1OQ1mMMyL/lspr450tBTzbOt6QuyiUqmX83CO7kWmTUqC6tw7en8
 M/noARwjM1OaZjBOP0KE/bXFXNhw8lu9DiNqzPLsBZj/ggiyxMNZPT4wHc4q6AfQOJMY
 dLkwBR7A3IhZjFA3ZcwYKxzlAmn2B6TmBloAul/dWR3S7yF4F1yci9LLbJMzu3AEUQlc
 JTEA==
X-Gm-Message-State: AOAM530XBm28MfB1H6ecHjnUJF1sy7rqfzdEltBlab8zhlgKuROXSKTp
 VyH/n8vlAh6OMeTnklhdMTmG2kcwmlY0PfPsgmzSiA==
X-Google-Smtp-Source: ABdhPJw6b7uVfLhRrscIOQJPJ0QlL2htq5lncrLazsCVv7TsysUlRSUnImwq7MxuBdaWbKATQsStIfCBvkPZ76tCudc=
X-Received: by 2002:a63:530d:: with SMTP id h13mr12113445pgb.120.1617959165470; 
 Fri, 09 Apr 2021 02:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <18ec1a440eb71e4f91c0932cd0fadddd2e9a4c0f.1617937551.git.xji@analogixsemi.com>
In-Reply-To: <18ec1a440eb71e4f91c0932cd0fadddd2e9a4c0f.1617937551.git.xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 9 Apr 2021 11:05:54 +0200
Message-ID: <CAG3jFyuisQe1RZXx8GpQjwPczak+PBXA084i9euuREeV_w55Rw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/bridge: anx7625: send DPCD command to downstream
To: Xin Ji <xji@analogixsemi.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Xin,


On Fri, 9 Apr 2021 at 07:35, Xin Ji <xji@analogixsemi.com> wrote:
>
> Send DPCD command to downstream before anx7625 power down,
> tell downstream into standby mode.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 75 +++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc05982f82..53d2f0d0ee30 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -124,6 +124,23 @@ static int anx7625_reg_write(struct anx7625_data *ctx,
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
> +               DRM_DEV_ERROR(dev, "write i2c block failed id=%x\n:%x",
> +                             client->addr, reg_addr);
> +
> +       return ret;
> +}
> +
>  static int anx7625_write_or(struct anx7625_data *ctx,
>                             struct i2c_client *client,
>                             u8 offset, u8 mask)
> @@ -195,6 +212,55 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
>         return val;
>  }
>
> +static int anx7625_aux_dpcd_write(struct anx7625_data *ctx,
> +                                 u8 addrh, u8 addrm, u8 addrl,
> +                                 u8 len, u8 *buf)
> +{
> +       struct device *dev = &ctx->client->dev;
> +       int ret;
> +       u8 cmd;
> +
> +       if (len > MAX_DPCD_BUFFER_SIZE) {
> +               DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> +               return -EINVAL;
> +       }
> +
> +       cmd = ((len - 1) << 4) | 0x08;
> +
> +       /* Set command and length */
> +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                               AP_AUX_COMMAND, cmd);
> +
> +       /* Set aux access address */
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                                AP_AUX_ADDR_7_0, addrl);
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                                AP_AUX_ADDR_15_8, addrm);
> +       ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +                                AP_AUX_ADDR_19_16, addrh);
> +
> +       /* Set write data */
> +       ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
> +                                      AP_AUX_BUFF_START, len, buf);
> +       /* Enable aux access */
> +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +                               AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> +               return -EIO;
> +       }
> +
> +       usleep_range(2000, 2100);
> +
> +       ret = wait_aux_op_finish(ctx);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int anx7625_video_mute_control(struct anx7625_data *ctx,
>                                       u8 status)
>  {
> @@ -617,6 +683,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
>         int ret;
> +       u8 data;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "stop dp output\n");
>
> @@ -628,8 +695,16 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
>         ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, 0x08, 0x7f);
>
>         ret |= anx7625_video_mute_control(ctx, 1);
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "notify downstream enter into standby\n");
> +
> +       /* Downstream monitor enter into standby mode */
> +       data = 2;
> +       ret |= anx7625_aux_dpcd_write(ctx, 0x00, 0x06, 0x00, 1, &data);
>         if (ret < 0)
>                 DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
> +
> +       return;
>  }

Reviewed-by: Robert Foss <robert.foss@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
