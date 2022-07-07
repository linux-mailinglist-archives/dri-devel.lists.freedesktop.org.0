Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D956A071
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221E514BE04;
	Thu,  7 Jul 2022 10:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E6414BE01
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 10:53:18 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n4so12445809ejz.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/MdPU7/0LhUESABqOcsJRA8NbvdGq3zsY92OcPiOhSc=;
 b=wEf+WpAM38MWTewyyu9oF3P+XqIq5idiDLfWgfEIJrYheTo8xBuCKSvl9H99kcUTDZ
 kUerrZi0GlhDFjaTQzg544xMdL07XfP77NjR/PlZB66hEvmE08EBIrmso0LEjgVw19QK
 WJeFgRsjGU74J7nz0IKXIXNT2AS9+Nwlfh/Mtwq83/f3f/alfn0rnxEZ3+OjqwEdVywI
 75nAi+HXNi0h5EJBqXBpSBOYZMUgaTOena6exxvQ+vg3ind7cNMS7Nme4F9veyCOAqJd
 xg6fXwSTLm+dpoQxCFDWOMnh2yfVaCCAeNsFXCGAXQqG+ZMfc3SxttsLeGypVm6eHOGf
 wEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/MdPU7/0LhUESABqOcsJRA8NbvdGq3zsY92OcPiOhSc=;
 b=7QX+mOyJyhrwApJ/eoRiBQYC6iCjsVg2DQBaGO8pxw1tvm4hD516tdiB+2XoON5YpU
 xtV+5Esrs9wQK3v//x9wdAQEKs8/EcB6x9Sb+j64/j0IVnOTaGpZXwxmNy32pLaDQGqO
 JhF86Tu5wSgyZWojrFHUsIs56r2B/Q3p0D6k4p3b67obrwJt3eJy6QpPDVRyQ2KsIczd
 pmnuwozNUjyjoe+YoZ+W2t7LOCEiN7JYkyvLpUJwMveNWETSWVmXMfraHg7N/Ox0+oUi
 SKXSmTq4WVzMl3DJbo5Tk7aW1JE/paE9DrT8rP8LVLW2jECGh4yEfpEFlrFEPpRfe1Q9
 5Drg==
X-Gm-Message-State: AJIora9dxkzgy7Pee5H546vlOw/nrmhryqK3gA+1RtyXL3PAXkcupKpH
 2Gyk1TROmZ+mtcOiPYZfLVNR3rYlAt3Euuxosc8VeQ==
X-Google-Smtp-Source: AGRyM1tG+R5xjPewg3TqpK5d5/L3gIH6N57ZzdlDvPbR39hXy+R0tUkD/nSkx2YVxrSf1tB/Ezq9w8FA+u47jlY7iyU=
X-Received: by 2002:a17:907:16a6:b0:726:574d:d31f with SMTP id
 hc38-20020a17090716a600b00726574dd31fmr43051467ejc.514.1657191196466; Thu, 07
 Jul 2022 03:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220612144854.2223873-1-alvin@pqrs.dk>
 <20220612144854.2223873-2-alvin@pqrs.dk>
In-Reply-To: <20220612144854.2223873-2-alvin@pqrs.dk>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 7 Jul 2022 12:53:05 +0200
Message-ID: <CAG3jFysYKJc3Ar99HsoSri+wxW2=KOdSwwsU9qBpypxrNCMaiQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] drm: bridge: adv7511: fix CEC power down
 control register offset
To: alvin@pqrs.dk
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
Cc: Archit Taneja <architt@codeaurora.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 12 Jun 2022 at 16:49, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> The ADV7511_REG_CEC_CTRL =3D 0xE2 register is part of the main register
> map - not the CEC register map. As such, we shouldn't apply an offset to
> the register address. Doing so will cause us to address a bogus register
> for chips with a CEC register map offset (e.g. ADV7533).
>
> Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 5 +----
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 4 ++--
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 9e3bb8a8ee40..46ae6c0d9aa5 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -406,10 +406,7 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511=
, unsigned int irq1);
>  #else
>  static inline int adv7511_cec_init(struct device *dev, struct adv7511 *a=
dv7511)
>  {
> -       unsigned int offset =3D adv7511->type =3D=3D ADV7533 ?
> -                                               ADV7533_REG_CEC_OFFSET : =
0;
> -
> -       regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
> +       regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
>                      ADV7511_CEC_CTRL_POWER_DOWN);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_cec.c
> index 399f625a50c8..6d067fa54bea 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -347,7 +347,7 @@ int adv7511_cec_init(struct device *dev, struct adv75=
11 *adv7511)
>                 goto err_cec_alloc;
>         }
>
> -       regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset, 0);
> +       regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL, 0);
>         /* cec soft reset */
>         regmap_write(adv7511->regmap_cec,
>                      ADV7511_REG_CEC_SOFT_RESET + offset, 0x01);
> @@ -374,7 +374,7 @@ int adv7511_cec_init(struct device *dev, struct adv75=
11 *adv7511)
>         dev_info(dev, "Initializing CEC failed with error %d, disabling C=
EC\n",
>                  ret);
>  err_cec_parse_dt:
> -       regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
> +       regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
>                      ADV7511_CEC_CTRL_POWER_DOWN);
>         return ret =3D=3D -EPROBE_DEFER ? ret : 0;
>  }
> --
> 2.36.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
