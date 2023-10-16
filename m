Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED647CA304
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D4710E156;
	Mon, 16 Oct 2023 09:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E6710E156
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:00:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0ADD760DDC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7EDC433D9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697446806;
 bh=G9pHPhZGnXWe0N/+8Kyow0xOPj1fYjHp+tDBGOq9iPU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N+sSSRO35ye9ZsIsgBd/gzez49v1Si2/JhvSgck35hEzB3VjEgWmBxLBg3GbQBTpg
 dvQWUBi7i7ytZPn2UMGYknlitDd/urLcimWSrbUy4qJSFMUOQBvscm0mu4sgqt4TYk
 8wkzz162/tVT32bmrgg3ak/oGGPExqKeRi6mNVDIFjEo/0AUFfq6YCsS5hcZsrHmUA
 uiWcXdfhvdA5Zc/0qTPod9cYLL+9eqE1flJa0zuYxVUG8eSRbXybzCDCJfg87oyusk
 Q/VbMVK5jA2e65S3AdnzrIKRZaqSKey+X6C6/NZUEPhyoZ4e8qSKDXXfUDDCJN+oO6
 /rgHiTRtj1A0Q==
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6b1d1099a84so2706617b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 02:00:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzrenlr3OYyDWu4HEfpEKU0yoI7vYY2YVBgMPfiDkpPzzmP4P2B
 4iHbbP1BLebAlpWkS74ZNk4/UnhUfu9EWZyB8Ha+UQ==
X-Google-Smtp-Source: AGHT+IEhKWc1Fx1hpQiTGzrTdOHujArMMfZOid/hgR5LXKF4A2vex79AfUrTILS4RufAQ35zaKMvB6u+gd0Ho6/WyV4=
X-Received: by 2002:a05:6300:8089:b0:17a:284:de50 with SMTP id
 ap9-20020a056300808900b0017a0284de50mr5510387pzc.6.1697446805971; Mon, 16 Oct
 2023 02:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
 <20230830142358.275459-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-8-biju.das.jz@bp.renesas.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 16 Oct 2023 10:59:55 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6J9=vA8D5M1OOzb97-2H7J30T6s8ruEo07udrLvfhtMQ@mail.gmail.com>
Message-ID: <CAN6tsi6J9=vA8D5M1OOzb97-2H7J30T6s8ruEo07udrLvfhtMQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm: adv7511: Add link_config variable to struct
 adv7511_chip_info
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 4:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7511 needs link configuration whereas ADV75{33,35} does not need
> it. Add a variable link_config to struct adv7511_chip_info to handle
> this difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v1->v2:
>  * Add Rb tag from Laurent.
>  * Replaced variable type from unsigned->bool.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 0dd56e311039..0d39e32b0793 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -341,6 +341,7 @@ struct adv7511_chip_info {
>         unsigned int num_supplies;
>         unsigned int reg_cec_offset;
>         bool has_dsi;
> +       bool link_config;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 9d88c29b6f59..e0ec3c098225 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1203,7 +1203,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>
>         memset(&link_config, 0, sizeof(link_config));
>
> -       if (adv7511->info->type =3D=3D ADV7511)
> +       if (adv7511->info->link_config)
>                 ret =3D adv7511_parse_dt(dev->of_node, &link_config);
>         else
>                 ret =3D adv7533_parse_dt(dev->of_node, adv7511);
> @@ -1292,7 +1292,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>
>         i2c_set_clientdata(i2c, adv7511);
>
> -       if (adv7511->info->type =3D=3D ADV7511)
> +       if (adv7511->info->link_config)
>                 adv7511_set_link_config(adv7511, &link_config);
>
>         ret =3D adv7511_cec_init(dev, adv7511);
> @@ -1358,6 +1358,7 @@ static const struct adv7511_chip_info adv7511_chip_=
info =3D {
>         .type =3D ADV7511,
>         .supply_names =3D adv7511_supply_names,
>         .num_supplies =3D ARRAY_SIZE(adv7511_supply_names),
> +       .link_config =3D true,
>  };
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
