Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F878BB09
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969CB10E360;
	Mon, 28 Aug 2023 22:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF75610E360
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:36:47 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1c4cf775a14so2508369fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693262207; x=1693867007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IecrG5N4IH7F6ZerOlqmJsF0xD6JKD/qSd81We10bDU=;
 b=laLBKbFI9+y55DOgGQL3x607LZcw6VJZXmLVKmHiWVK1o1UHmXW6Daa8ozJhypbR4x
 pgcHo3sr+o98/N5XLTba8y2JearQy4qo7oYvvhtg3teCpPoln3bIcUj0kvD96vpXtjpd
 wrlfad+s326GDxJ2PQUyTANgiskiDdnKfJC/G21JYACTcc1qwlWSzpFLU1XVPT6j0Own
 5Pho2Xtdc1avGnb6pEjQvp7e1k/Ym3arqdOiPTZx1eAcnexzC/tf/sgv3XFO/cygCf+A
 COLaeYlr2PewRP6VIAvgr3ffxJ8g7MwQJLMy55Sku8k+PzOno7AwBDynXulUsniezKBf
 iG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693262207; x=1693867007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IecrG5N4IH7F6ZerOlqmJsF0xD6JKD/qSd81We10bDU=;
 b=K1f74HO5yTHxoIJ+Lap8d8sfrfVWv2p03EFgj0yUDPbl4cTCM9W8j1G1StXQEG6Kc1
 XNjEx1ShD9+lF117+Ghpt25MDgas5w0NjZ+16errQL0sJgwtTh5Zkz/6GxeqoQdhNlDT
 uswP8XMUeb52Xn9hTIPF6NlCuFYNzyGwurL3L3J656FZI02chigXMMZRBzHwGad5VQLX
 H8SnuvxZJhAwFK05WEhQlA5oeF1IGnNv9AMUauA5zT2s1i60OjRbQc3hek7FJ4WlhRDG
 606IyYL/2RGg/lxWH3WDljMpsWnAtxyW1WadHYJUykpFUOirhvDGkwfnpofRZ7ffrVVs
 Vfwg==
X-Gm-Message-State: AOJu0YwuT2l5jVysGqGOAfNoBXxneF1SOA9loPDsnLz8/FuSOLP8I6MW
 6t1cIZg7ty3bnwUIKRdHSsgR6lzLU2xosdZSfyo=
X-Google-Smtp-Source: AGHT+IEKPsawjxD9UjcfpuIXDMO/SiaqZJnPfcnQEQCWWQWRxGOKbOGAaBFmNwXYnzuA2RAdCFcR7FT5tLVd92dtdo4=
X-Received: by 2002:a05:6870:c21f:b0:1b0:805:8678 with SMTP id
 z31-20020a056870c21f00b001b008058678mr13652229oae.24.1693262206842; Mon, 28
 Aug 2023 15:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813180512.307418-3-biju.das.jz@bp.renesas.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 28 Aug 2023 17:36:35 -0500
Message-ID: <CAHCN7xLw=PVZh=XfrD8cNXxMopimCja26WJYADtG7VyC=e2pVg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm: adv7511: Add max_mode_clock variable to struct
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 13, 2023 at 1:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7533 supports a maximum pixel clock of 80MHz whereas it is 148.5MH=
z
> for ADV7535.  Add max_mode_clock variable to struct adv7511_chip_info to
> handle this difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

For the series:

Reviewed-by: Adam Ford <aford173@gmail.com>
Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 59e8ef10d72e..f8190442ffca 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -335,6 +335,7 @@ enum adv7511_type {
>
>  struct adv7511_chip_info {
>         enum adv7511_type type;
> +       unsigned long max_mode_clock;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 013d8d640ef4..193b2d5bc7e6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1371,11 +1371,13 @@ static const struct adv7511_chip_info adv7511_chi=
p_info =3D {
>  };
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
> -       .type =3D ADV7533
> +       .type =3D ADV7533,
> +       .max_mode_clock =3D 80000
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
> -       .type =3D ADV7535
> +       .type =3D ADV7535,
> +       .max_mode_clock =3D 148500
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index c452c4dc1c3f..e92b27e0afd1 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,7 +108,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv751=
1 *adv,
>         u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>
>         /* Check max clock for either 7533 or 7535 */
> -       if (mode->clock > (adv->info->type =3D=3D ADV7533 ? 80000 : 14850=
0))
> +       if (mode->clock > adv->info->max_mode_clock)
>                 return MODE_CLOCK_HIGH;
>
>         /* Check max clock for each lane */
> --
> 2.25.1
>
