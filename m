Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F15901751
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 19:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B326610E1D4;
	Sun,  9 Jun 2024 17:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4NCrsjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65FC10E1D4
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 17:41:25 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2bda9105902so2667942a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717954884; x=1718559684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TU6uzy6Znj21ZkzrxgGT3l5nBGIbu+NflqZO4C9QeU8=;
 b=J4NCrsjIWHiTVMs17HviWgSazWJA91crc5nhgIuXw5b1LaO1Hr1TEfOiPAGx15skhE
 pNLzaf1MsA9U0o4k4FBYnfH+0+q2uI2PvF2j1EfXH5dGOfoYIebnrMJ1Q2ALKIu2rwce
 4evGoxH1k+0j6VYGSPUfIBt6Lr79THvi8IoJy4/e9PaNklLodXDIUcz3Tj1RU0gFTkZP
 pWbPNfMObA3H/rhttpffeZ9p7ZE7TWhWh/fe5gSB2SuVXDMcdvq/V/1KszCWE7qJyRSd
 VVeRQ/kPRuGNvd7PNab+FIXkadnpm59BDax+VzxEnD2Xmk9lv8bDED3jpiBAK974U1B/
 h8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717954884; x=1718559684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TU6uzy6Znj21ZkzrxgGT3l5nBGIbu+NflqZO4C9QeU8=;
 b=Bpep9Umwwb4Vlx4OhzNyLC+0UBO02acNBqt+RUAljvApDqhhdnqMG7Vu/YT9Ab9EoP
 js+ywSUMooalVLns79pUGXHzF5YzaOyYuin1TP9rDUztd1CKD2YjKRlsgxVcNtRL5xWv
 yo2YMJRshi9bkLQJmAVUxHGoO+Nl1lPOVg6Uu8Cdwxi8ZQ4jNwe6KfhUF4AixNKwdXbu
 fanyB+SIXpRpjG+q9v3MNzkI57/vdmO/BLX5DbpOGoal9IDAkK5TdLYlXJM4fu/ICIOZ
 r9D9QvoEpK0L2/LmpwzpWsS/ky98i4h/tGlnLsp70ZnpA///V3l+e1jtCPLkJUKJKlIp
 Z2sg==
X-Gm-Message-State: AOJu0YwmJSa5BXWlFu8alqdDCUdTLaEnr4+Puwla1YElVJ+CiEkVRygT
 DITjKEKzbIg5cLQE78oP9EFgAzJJKQSvVrjlUPD4Aa+Ejn3dfENtwikCHt3RtoQP3neZB4w7Wqz
 +z6hDaXHXawBr7Kvp2gwPALc3dVP72Q==
X-Google-Smtp-Source: AGHT+IGBA2o2mU7yH6Ev7JEO8G+3z4qUuZ8QKX9g9LD1fV6N+OLe1etE1oCNgxpSMpEY1SEYkQe/lE7ygEyABBAozbY=
X-Received: by 2002:a17:90a:bf0a:b0:2c2:d732:3bc8 with SMTP id
 98e67ed59e1d1-2c2d7323ef4mr3816893a91.21.1717954884398; Sun, 09 Jun 2024
 10:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240601132459.81123-1-aford173@gmail.com>
In-Reply-To: <20240601132459.81123-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 9 Jun 2024 12:41:13 -0500
Message-ID: <CAHCN7x+WaHvWk7-nHURy+PA0+9voYNd+RJewm5ie_niBFTAFyA@mail.gmail.com>
Subject: Re: [PATCH V2] drm/bridge: adv7511: Fix Intermittent EDID failures
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, victor.liu@nxp.com, sui.jingfeng@linux.dev, 
 aford@beaconembedded.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 1, 2024 at 8:25=E2=80=AFAM Adam Ford <aford173@gmail.com> wrote=
:
>
> In the process of adding support for shared IRQ pins, a scenario
> was accidentally created where adv7511_irq_process returned
> prematurely causing the EDID to fail randomly.
>
> Since the interrupt handler is broken up into two main helper functions,
> update both of them to treat the helper functions as IRQ handlers. These
> IRQ routines process their respective tasks as before, but if they
> determine that actual work was done, mark the respective IRQ status
> accordingly, and delay the check until everything has been processed.
>
> This should guarantee the helper functions don't return prematurely
> while still returning proper values of either IRQ_HANDLED or IRQ_NONE.
>
> Reported-by: Liu Ying <victor.liu@nxp.com>
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID retri=
eval w/o IRQ

Gentile nudge on this.  It would be nice to get this fix applied since
it caused a regression.

adam

> ---
> V2:  Fix uninitialized cec_status
>      Cut back a little on error handling to return either IRQ_NONE or
>      IRQ_HANDLED.
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index ea271f62b214..ec0b7f3d889c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -401,7 +401,7 @@ struct adv7511 {
>
>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)=
;
> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
>  #else
>  static inline int adv7511_cec_init(struct device *dev, struct adv7511 *a=
dv7511)
>  {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_cec.c
> index 44451a9658a3..651fb1dde780 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, i=
nt rx_buf)
>         cec_received_msg(adv7511->cec_adap, &msg);
>  }
>
> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>  {
>         unsigned int offset =3D adv7511->info->reg_cec_offset;
>         const u32 irq_tx_mask =3D ADV7511_INT1_CEC_TX_READY |
> @@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *adv751=
1, unsigned int irq1)
>                                 ADV7511_INT1_CEC_RX_READY3;
>         unsigned int rx_status;
>         int rx_order[3] =3D { -1, -1, -1 };
> -       int i;
> +       int i, ret =3D 0;
> +       int irq_status =3D IRQ_NONE;
>
> -       if (irq1 & irq_tx_mask)
> +       if (irq1 & irq_tx_mask) {
>                 adv_cec_tx_raw_status(adv7511, irq1);
> +               irq_status =3D IRQ_HANDLED;
> +       }
>
>         if (!(irq1 & irq_rx_mask))
> -               return;
> +               return irq_status;
>
> -       if (regmap_read(adv7511->regmap_cec,
> -                       ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
> -               return;
> +       ret =3D regmap_read(adv7511->regmap_cec,
> +                       ADV7511_REG_CEC_RX_STATUS + offset, &rx_status);
> +       if (ret < 0)
> +               return irq_status;
>
>         /*
>          * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of=
 RX
> @@ -172,6 +176,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511,=
 unsigned int irq1)
>
>                 adv7511_cec_rx(adv7511, rx_buf);
>         }
> +
> +       return IRQ_HANDLED;
>  }
>
>  static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable=
)
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 66ccb61e2a66..c8d2c4a157b2 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv751=
1, bool process_hpd)
>  {
>         unsigned int irq0, irq1;
>         int ret;
> +       int cec_status =3D IRQ_NONE;
> +       int irq_status =3D IRQ_NONE;
>
>         ret =3D regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
>         if (ret < 0)
> @@ -478,29 +480,31 @@ static int adv7511_irq_process(struct adv7511 *adv7=
511, bool process_hpd)
>         if (ret < 0)
>                 return ret;
>
> -       /* If there is no IRQ to handle, exit indicating no IRQ data */
> -       if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> -           !(irq1 & ADV7511_INT1_DDC_ERROR))
> -               return -ENODATA;
> -
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
>
> -       if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.enc=
oder)
> +       if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.enc=
oder) {
>                 schedule_work(&adv7511->hpd_work);
> +               irq_status =3D IRQ_HANDLED;
> +       }
>
>         if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERR=
OR) {
>                 adv7511->edid_read =3D true;
>
>                 if (adv7511->i2c_main->irq)
>                         wake_up_all(&adv7511->wq);
> +               irq_status =3D IRQ_HANDLED;
>         }
>
>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> -       adv7511_cec_irq_process(adv7511, irq1);
> +       cec_status =3D adv7511_cec_irq_process(adv7511, irq1);
>  #endif
>
> -       return 0;
> +       /* If there is no IRQ to handle, exit indicating no IRQ data */
> +       if (irq_status =3D=3D IRQ_HANDLED || cec_status =3D=3D IRQ_HANDLE=
D)
> +               return IRQ_HANDLED;
> +
> +       return IRQ_NONE;
>  }
>
>  static irqreturn_t adv7511_irq_handler(int irq, void *devid)
> @@ -509,7 +513,7 @@ static irqreturn_t adv7511_irq_handler(int irq, void =
*devid)
>         int ret;
>
>         ret =3D adv7511_irq_process(adv7511, true);
> -       return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> +       return ret < 0 ? IRQ_NONE : ret;
>  }
>
>  /* ---------------------------------------------------------------------=
--------
> --
> 2.43.0
>
