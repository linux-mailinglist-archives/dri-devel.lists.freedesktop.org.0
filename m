Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49127545E70
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFFC11ADC2;
	Fri, 10 Jun 2022 08:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BAA11ADC2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 08:18:02 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 15so23254092pfy.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uigtUS1xIOK2eGjV8S/JA4dIQjxGCEEjBa8iZpFRUZ8=;
 b=jcTu9+80+nCglm5pyAvgjAKE5LzR50EJFbv+JYa1B9q25eDB5bk0CSketGhE35Fen9
 ksicx1kd+d4kBZIrPusTVNBQYXCnVqvBmWj+qiZEz2oez+3Is9S8xhIAkw+Y3DjMInS4
 x/lB1Rkorsd/7Qsih8Bq8YMuP5QJ4TSIw+iKGT58tfyzOEBRYjpV2aXcEU5yX44JYw23
 AHyrma18BteO8IEC8uKIon1Q930VeyHyEh7w3ycumGsy+ekt9a03/NX/IZApSGdM0kzr
 YUQFpnDnmEslro2DVFlO9KNQCkzFXxpjzpgMsLCRluHPn60fWIosQjkJx84GTfWHPWMP
 dKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uigtUS1xIOK2eGjV8S/JA4dIQjxGCEEjBa8iZpFRUZ8=;
 b=hkmIXbUu1BHfxFqIdClbdyXhJzn/nmNpkJ8AOic5/FPn0DFx8VGnS2//L1yoxQNyWS
 rsrr4U1LRaXwaRe+HjTwg7g1OQk90lw5HLbKVe4Fsphli5+FRGgM4r+FE/tJ+YjU1JWn
 /wz2GsDJGla1LmuHUNQ554A2x9zPxpiTnk0AByFjEkyhLO8xBN3A45iicwbLkuo5hYQ6
 AVZJLIgsKa3IrEgv/CjkG3M7hTjMSTUtzqMbtKqRWU+EVLn5wvp5wX+KmjQlqiIU8VR5
 igjJAm3xPSoxYeFhyyQS5YP8awrVEFd8Seqh7WMh2Xtlnhg2gO5ce5a1sRJuN9g9DPnx
 x/Ag==
X-Gm-Message-State: AOAM531IIsORQrFluF10Cnet5s1F+HvJ9zUKbaNKjRWggB9aQIKb6t+V
 dR8MFYKbUWH/7vf5KzV+II4rwbHHrzHtryOJzcC6TQ==
X-Google-Smtp-Source: ABdhPJx5RVqbDB4bxEL1kVn3ZdTR+qKYAp/7L1lm1uQ+DxI0/H0SJ3MghFQhCMEJKNsJSZwoNGUsaIguSVPleHNXWlo=
X-Received: by 2002:a63:91ca:0:b0:3fc:9077:c7c7 with SMTP id
 l193-20020a6391ca000000b003fc9077c7c7mr39163270pge.201.1654849081218; Fri, 10
 Jun 2022 01:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211218182804.208906-1-antonio.borneo@foss.st.com>
 <20220607213144.427177-1-antonio.borneo@foss.st.com>
In-Reply-To: <20220607213144.427177-1-antonio.borneo@foss.st.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 10 Jun 2022 10:17:49 +0200
Message-ID: <CAG3jFyvt8+Tbbx6rT8R72aNgEk40O+V7GE0ZTc4RdWDcQmhwYg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm: adv7511: override i2c address of cec before
 accessing it
To: Antonio Borneo <antonio.borneo@foss.st.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jun 2022 at 23:32, Antonio Borneo <antonio.borneo@foss.st.com> wrote:
>
> Commit 680532c50bca ("drm: adv7511: Add support for
> i2c_new_secondary_device") allows a device tree node to override
> the default addresses of the secondary i2c devices. This is useful
> for solving address conflicts on the i2c bus.
>
> In adv7511_init_cec_regmap() the new i2c address of cec device is
> read from device tree and immediately accessed, well before it is
> written in the proper register to override the default address.
> This can cause an i2c error during probe and a consequent probe
> failure.
>
> Once the new i2c address is read from the device tree, override
> the default address before any attempt to access the cec.
>
> Tested with adv7533 and stm32mp157f.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Fixes: 680532c50bca ("drm: adv7511: Add support for i2c_new_secondary_device")
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> ---
>
> This patch got somehow lost, I'm resending it.
> Added reviewed by Kieran Bingham.
> Rebased on drm-misc-next.
>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 5bb9300040dd..074c2e650cae 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1065,6 +1065,10 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
>                                                 ADV7511_CEC_I2C_ADDR_DEFAULT);
>         if (IS_ERR(adv->i2c_cec))
>                 return PTR_ERR(adv->i2c_cec);
> +
> +       regmap_write(adv->regmap, ADV7511_REG_CEC_I2C_ADDR,
> +                    adv->i2c_cec->addr << 1);
> +
>         i2c_set_clientdata(adv->i2c_cec, adv);
>
>         adv->regmap_cec = devm_regmap_init_i2c(adv->i2c_cec,
> @@ -1271,9 +1275,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>         if (ret)
>                 goto err_i2c_unregister_packet;
>
> -       regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR,
> -                    adv7511->i2c_cec->addr << 1);
> -
>         INIT_WORK(&adv7511->hpd_work, adv7511_hpd_work);
>
>         if (i2c->irq) {
>
> base-commit: dfa687bffc8a4a21ed929c7dececf01b8f1f52ee
> --
> 2.36.1
>

Applied to drm-misc-next.
