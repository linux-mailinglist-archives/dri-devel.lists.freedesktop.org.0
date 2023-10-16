Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C477CA37D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE3410E15C;
	Mon, 16 Oct 2023 09:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D012110E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:06:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1F168B811AF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EC0C433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697447199;
 bh=4dYvQCuf9b3tf3uNXhqNvMXf/odod6VTp5BhZbX80vA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ovnb0OLZa50TrHujRVZYsEjAMfq5a5InPpNjVIhcTfq/NJzWS6YQUNoReDERjSL3+
 Kx7aFRWrKkM/BdWPlHkBBTCBd22XlC1zfElXbbSRESMzPJVXYJpjAk3w3USsOJ2VSr
 52G9aqUZEdZx5eDHXtLSFfI0NuVMWiX8y4l6i2UoZfWmVNIJg8ppY7Ax70Fs5j9Zn8
 x5BsRea8wmh7fNgHXSBx7035xRxC/2uRycVr+HJSlKxsMpd/LTuyjYfoqMG4zIjojJ
 xkCj3t2okNIw+I1JT5zxlOIt9KVvCG7a2/WKGgbg7S4WL3ZRPusHT7Ru33LJgWZuD6
 pVWm0NLTYyhMQ==
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6b1d1099a84so2711880b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 02:06:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyjv+z2wfe/Ah9emc7e2dfiFCdqqMdm7ItP9ju7VCcpsaHwyYyd
 TsoFEVz52/c6NwgxYEKLuamB7Q43FJB/DJbuJWieCg==
X-Google-Smtp-Source: AGHT+IGuyJExJTh3Hz3QKu7cnVZE8okT82PfRYefqKYWYKmexNxw6mhEovZYJO3sgmjIB8eXV0/CRk3sGOen1Z0QN08=
X-Received: by 2002:a05:6a21:6d87:b0:16c:b95c:6d35 with SMTP id
 wl7-20020a056a216d8700b0016cb95c6d35mr33281513pzb.50.1697447199092; Mon, 16
 Oct 2023 02:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
 <20230830142358.275459-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-3-biju.das.jz@bp.renesas.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 16 Oct 2023 11:06:27 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4QH-S8rymoTP_DD2Q3etb26ZiLSqsP2o7+L5sCkgnXaA@mail.gmail.com>
Message-ID: <CAN6tsi4QH-S8rymoTP_DD2Q3etb26ZiLSqsP2o7+L5sCkgnXaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm: adv7511: Add max_mode_clock_khz variable to
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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

On Wed, Aug 30, 2023 at 4:24=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7533 supports a maximum pixel clock of 80MHz whereas it is 148.5MH=
z
> for ADV7535. Add max_mode_clock_khz variable to struct adv7511_chip_info =
to
> handle this difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Adam Ford <aford173@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  * Added Rb tag from Adam and Laurent
>  * Added tested by tag from Adam.
>  * Replaced max_mode_clock->max_mode_clock_khz in struct adv7511_chip_inf=
o
>  * Replaced variable type from unsigned int->unsigned long.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 ++
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 59e8ef10d72e..b9c6c1e8a353 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -335,6 +335,7 @@ enum adv7511_type {
>
>  struct adv7511_chip_info {
>         enum adv7511_type type;
> +       unsigned int max_mode_clock_khz;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index d869dbe41873..12ceffd6a9eb 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1369,10 +1369,12 @@ static const struct adv7511_chip_info adv7511_chi=
p_info =3D {
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
>         .type =3D ADV7533,
> +       .max_mode_clock_khz =3D 80000,
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
>         .type =3D ADV7535,
> +       .max_mode_clock_khz =3D 148500,
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index c452c4dc1c3f..1d113489754c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,7 +108,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv751=
1 *adv,
>         u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>
>         /* Check max clock for either 7533 or 7535 */
> -       if (mode->clock > (adv->info->type =3D=3D ADV7533 ? 80000 : 14850=
0))
> +       if (mode->clock > adv->info->max_mode_clock_khz)
>                 return MODE_CLOCK_HIGH;
>
>         /* Check max clock for each lane */
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
