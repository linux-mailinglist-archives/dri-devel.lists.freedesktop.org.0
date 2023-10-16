Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEA7CA2F9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820F210E14E;
	Mon, 16 Oct 2023 08:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE4910E14E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:59:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EB942B8119C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFD1C4339A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697446764;
 bh=9iAJTkNE+5/gzF4lcoqzfyyY5K5ufuZmCmkEu7r+S/A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QVzOrrEfYFFXNpYLZiKfPL2hA/1pZQIpqYP/re0UcJ2aFrWYtrOsv4aBQFbPVN/wR
 v79ebgCfwNe5QdClujXglWwGmbY8kndtD8OtReQ34chlJuubHo1jFIv5nP9r7fPHkV
 M8Zrqy9RH0EpetD7sEncWpA7ug7ci0oDQL0VqCb5J75lxsNKtA7ovz6ykFoHR8eqv1
 KdApI9OS2bCAQ376W8/g+SFr1NNKJzlp+/tM9o7vZAxY1h5h/5FITyBS4AtKFJRZhf
 Mjyqu0rFCqmkQudaqVgRJ15UxYHnZcHQwvRYW5cqB8N/urGkniO7Hh8TWinXScS0H0
 rveGU/CFaLkrw==
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6b1e46ca282so2849724b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 01:59:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YyAYwMRalFg7fBaxs7Jn+8I6K5qyzVfFIT0hYsIPY8sROV/4MP3
 P9PuYz+9EV1gfm6IGQOWmseBS7Sx3LyppQUg+N7ukA==
X-Google-Smtp-Source: AGHT+IF1t7lwiVxhcEiQPsmS7cLYAcfnemeM1+gRawN17OPND/2pZ53/ODEmJKWPPyooN10ltrZu2PwpeLVkebRfMnQ=
X-Received: by 2002:a05:6a21:a5a8:b0:152:6b63:f1e5 with SMTP id
 gd40-20020a056a21a5a800b001526b63f1e5mr45763390pzc.38.1697446763501; Mon, 16
 Oct 2023 01:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
 <20230830142358.275459-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-9-biju.das.jz@bp.renesas.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 16 Oct 2023 10:59:12 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6SYdKcJbjiVn1bOFv8O6g_AGM-+Qj_r8tgYgzDMsWHiw@mail.gmail.com>
Message-ID: <CAN6tsi6SYdKcJbjiVn1bOFv8O6g_AGM-+Qj_r8tgYgzDMsWHiw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm: adv7511: Add hpd_override_enable variable to
 struct adv7511_chip_info
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 4:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> As per spec, it is allowed to pulse the HPD signal to indicate that the
> EDID information has changed. Some monitors do this when they wake up
> from standby or are enabled. When the HPD goes low the adv7511 is
> reset and the outputs are disabled which might cause the monitor to
> go to standby again. To avoid this we ignore the HPD pin for the
> first few seconds after enabling the output. On the other hand,
> adv7535 require to enable HPD Override bit for proper HPD.
>
> Add hpd_override_enable variable to struct adv7511_chip_info to handle
> this scenario.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Restored enum adv7511_type as there are users.
>  * Replaced variable type from unsigned->bool.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 0d39e32b0793..39c9ece373b0 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -342,6 +342,7 @@ struct adv7511_chip_info {
>         unsigned int reg_cec_offset;
>         bool has_dsi;
>         bool link_config;
> +       bool hpd_override_enable;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index e0ec3c098225..83ff4206b3b7 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511 *adv751=
1)
>          * first few seconds after enabling the output. On the other hand
>          * adv7535 require to enable HPD Override bit for proper HPD.
>          */
> -       if (adv7511->info->type =3D=3D ADV7535)
> +       if (adv7511->info->hpd_override_enable)
>                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE);
> @@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  static void __adv7511_power_off(struct adv7511 *adv7511)
>  {
>         /* TODO: setup additional power down modes */
> -       if (adv7511->info->type =3D=3D ADV7535)
> +       if (adv7511->info->hpd_override_enable)
>                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
>
> @@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_co=
nnector *connector)
>                         status =3D connector_status_disconnected;
>         } else {
>                 /* Renable HPD sensing */
> -               if (adv7511->info->type =3D=3D ADV7535)
> +               if (adv7511->info->hpd_override_enable)
>                         regmap_update_bits(adv7511->regmap, ADV7511_REG_P=
OWER2,
>                                            ADV7535_REG_POWER2_HPD_OVERRID=
E,
>                                            ADV7535_REG_POWER2_HPD_OVERRID=
E);
> @@ -1379,6 +1379,7 @@ static const struct adv7511_chip_info adv7535_chip_=
info =3D {
>         .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
>         .reg_cec_offset =3D ADV7533_REG_CEC_OFFSET,
>         .has_dsi =3D true,
> +       .hpd_override_enable =3D true,
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> --
> 2.25.1

Reviewed-by: Robert Foss <rfoss@kernel.org>
