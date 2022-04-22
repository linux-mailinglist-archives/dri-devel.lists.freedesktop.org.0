Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1850BA0C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549F510E9BB;
	Fri, 22 Apr 2022 14:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067EF10E9B7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:25:34 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id h12so7518861plf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5U1B+r5dI91eemQbNmhtpBG76v/tJF367OhTyEiuJYw=;
 b=aIiFPoXxKaRqwY4PN/p53d++Od8n971gwUb5Qwv32WBGZ1JABPxmiOaa2YJNNpddT9
 jsy45X/7nMzEn3m/hka/6NnPJxXfER6mrL4f/ioq3sc/5cFUINalDi1dH++EsCmEqqQ6
 2/rZaT5xl/Q949cLFCwddI8iYP/9ylb/EcRnFVSCW81TVeXG5VnRM11TgTboXdHa8LLF
 nTO4Mz9qOJlyBhvGeDkea/HHZbMWsdW0EvSQ9M68jC0+RvkN8yxOmVDuSJO7KN1sLZ7l
 YPf9MVT7NqVOsfaDxaVyqmb5PBfe4MjQRRXQdFfzZk9snchZs73vjGhAjJRWhhKPYKJQ
 kS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5U1B+r5dI91eemQbNmhtpBG76v/tJF367OhTyEiuJYw=;
 b=Yk5E1uXJ/49dB7++8DHwn/LsC3ZUwyWhkF6RTpPkpYb1haymNBAByaPsfEjAx+vReV
 YC8U3zdTK20q8szJT53X5XMLTF0gikdUnvuozzqRyD6yEz+xPkWliJ11k2Uxxp1uRyya
 Rj/6h7cBFHZjtguebifSHuhWttWK91lM7YofbkXTjsyAdGdePafTAq2foGGQxMDjc5od
 vJtkcvUzjAluXM/6OF1RLMNhjHYSPAlKw/fRqVCSha9xaA3bO3OER9T5e2mz707DCdWr
 eVZlGMEpDGiOc+Ogk87mFotVZzvW5PX8edPfV9G7yO6TZt/UOMKmMIW6Di8Y/YhxGSvu
 L27w==
X-Gm-Message-State: AOAM533TT3/3VYj5o9BQiMLpBlQmLlb5jzvQTrPAxt7vtqd1dY80HpOy
 HCilF4Yvl0olsab9UB9kkl2aTL3KNaso9ch9Agx9SCbvVf4=
X-Google-Smtp-Source: ABdhPJx/OfLk811aAN+8jtFmfQSWVem5/nbH09MwqtRr2Dkk615n62FowreIEGeQZ0W3gmtsFGf/7S96ds0mB32bXhE=
X-Received: by 2002:a17:903:2352:b0:159:3fa:261 with SMTP id
 c18-20020a170903235200b0015903fa0261mr4673732plh.21.1650637533559; Fri, 22
 Apr 2022 07:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220319151016.983348-1-alvin@pqrs.dk>
 <20220319151016.983348-2-alvin@pqrs.dk>
In-Reply-To: <20220319151016.983348-2-alvin@pqrs.dk>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 22 Apr 2022 16:25:22 +0200
Message-ID: <CAG3jFyuZuf-yoy42iSbsdaxVXQvV69-XVyf-6bT-7LDpRpQhjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: bridge: adv7511: enable CEC support for ADV7535
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 19 Mar 2022 at 16:10, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> Like the ADV7533, the ADV7535 has an offset for the CEC register map,
> and it is the same value (ADV7533_REG_CEC_OFFSET =3D 0x70).
>
> Rather than testing for numerous chip types in the offset calculations
> throughout the driver, just compute it during driver probe and put it in
> the private adv7511 data structure.
>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 18 ++++++------------
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  5 +++--
>  3 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 6a882891d91c..da6d8ee2cd84 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -335,6 +335,7 @@ struct adv7511 {
>
>         struct regmap *regmap;
>         struct regmap *regmap_cec;
> +       unsigned int reg_cec_offset;
>         enum drm_connector_status status;
>         bool powered;
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_cec.c
> index 28d9becc939c..1f619389e201 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -21,8 +21,7 @@
>
>  static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_sta=
tus)
>  {
> -       unsigned int offset =3D adv7511->type =3D=3D ADV7533 ?
> -                                       ADV7533_REG_CEC_OFFSET : 0;
> +       unsigned int offset =3D adv7511->reg_cec_offset;
>         unsigned int val;
>
>         if (regmap_read(adv7511->regmap_cec,
> @@ -73,8 +72,7 @@ static void adv_cec_tx_raw_status(struct adv7511 *adv75=
11, u8 tx_raw_status)
>
>  void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>  {
> -       unsigned int offset =3D adv7511->type =3D=3D ADV7533 ?
> -                                       ADV7533_REG_CEC_OFFSET : 0;
> +       unsigned int offset =3D adv7511->reg_cec_offset;
>         const u32 irq_tx_mask =3D ADV7511_INT1_CEC_TX_READY |
>                                 ADV7511_INT1_CEC_TX_ARBIT_LOST |
>                                 ADV7511_INT1_CEC_TX_RETRY_TIMEOUT;
> @@ -118,8 +116,7 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511,=
 unsigned int irq1)
>  static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable=
)
>  {
>         struct adv7511 *adv7511 =3D cec_get_drvdata(adap);
> -       unsigned int offset =3D adv7511->type =3D=3D ADV7533 ?
> -                                       ADV7533_REG_CEC_OFFSET : 0;
> +       unsigned int offset =3D adv7511->reg_cec_offset;
>
>         if (adv7511->i2c_cec =3D=3D NULL)
>                 return -EIO;
> @@ -165,8 +162,7 @@ static int adv7511_cec_adap_enable(struct cec_adapter=
 *adap, bool enable)
>  static int adv7511_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
>  {
>         struct adv7511 *adv7511 =3D cec_get_drvdata(adap);
> -       unsigned int offset =3D adv7511->type =3D=3D ADV7533 ?
> -                                       ADV7533_REG_CEC_OFFSET : 0;
> +       unsigned int offset =3D adv7511->reg_cec_offset;
>         unsigned int i, free_idx =3D ADV7511_MAX_ADDRS;
>
>         if (!adv7511->cec_enabled_adap)
> @@ -235,8 +231,7 @@ static int adv7511_cec_adap_transmit(struct cec_adapt=
er *adap, u8 attempts,
>                                      u32 signal_free_time, struct cec_msg=
 *msg)
>  {
>         struct adv7511 *adv7511 =3D cec_get_drvdata(adap);
> -       unsigned int offset =3D adv7511->type =3D=3D ADV7533 ?
> -                                       ADV7533_REG_CEC_OFFSET : 0;
> +       unsigned int offset =3D adv7511->reg_cec_offset;
>         u8 len =3D msg->len;
>         unsigned int i;
>
> @@ -289,8 +284,7 @@ static int adv7511_cec_parse_dt(struct device *dev, s=
truct adv7511 *adv7511)
>
>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>  {
> -       unsigned int offset =3D adv7511->type =3D=3D ADV7533 ?
> -                                               ADV7533_REG_CEC_OFFSET : =
0;
> +       unsigned int offset =3D adv7511->reg_cec_offset;
>         int ret =3D adv7511_cec_parse_dt(dev, adv7511);
>
>         if (ret)
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 005bf18682ff..0be65a1ffc47 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1027,8 +1027,7 @@ static bool adv7511_cec_register_volatile(struct de=
vice *dev, unsigned int reg)
>         struct i2c_client *i2c =3D to_i2c_client(dev);
>         struct adv7511 *adv7511 =3D i2c_get_clientdata(i2c);
>
> -       if (adv7511->type =3D=3D ADV7533 || adv7511->type =3D=3D ADV7535)
> -               reg -=3D ADV7533_REG_CEC_OFFSET;
> +       reg -=3D adv7511->reg_cec_offset;
>
>         switch (reg) {
>         case ADV7511_REG_CEC_RX_FRAME_HDR:
> @@ -1073,6 +1072,8 @@ static int adv7511_init_cec_regmap(struct adv7511 *=
adv)
>                 ret =3D adv7533_patch_cec_registers(adv);
>                 if (ret)
>                         goto err;
> +
> +               adv->reg_cec_offset =3D ADV7533_REG_CEC_OFFSET;
>         }
>
>         return 0;

Reviewed-by: Robert Foss <robert.foss@linaro.org>
