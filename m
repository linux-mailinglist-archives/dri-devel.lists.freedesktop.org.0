Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095F7BB08D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 05:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36D310E1C3;
	Fri,  6 Oct 2023 03:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEECE10E1C3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 03:40:38 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9b98a699f45so288165566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 20:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696563637; x=1697168437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XpUyWVrE/iHQgC/ozZsC6NYywMSYpJaEzFJPxkfNEQE=;
 b=KDb3KqtMTPJsLQOAkB6smgSEgk/pk06z3ZfPtJVAp7GM2PEDcR8gU321l7RKU9EZsy
 7JyPqCvIBOXh6g7XvnQsfgHRb3dL6+2s6xFE+nMjXuWSDZOmph4KFSBVP98O6DNc0LZE
 OMnRbHXDaC/Zl5UyZrEcC3nYr3q5sYWC9m0gjYRlcMUwdei+rUZwGWRj1+4nBK/T9vki
 sI+WkzjrOyx9YiBcEKYN5sftrw5dMsqZl7sUUI9uOFmvsS8TiosPHqD7k9Fxp0ElhiSL
 jSQPu7HHAe1vK4mlfGSfHmyaiQ2XJK2f+HVpShhW+9NqBy6aha8yHXBHKH221ZR3GRvl
 L4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696563637; x=1697168437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XpUyWVrE/iHQgC/ozZsC6NYywMSYpJaEzFJPxkfNEQE=;
 b=VVgRgLv36755Z4/IamCZVlAX7uTtzB/VsBq7cCJhsIG4DycytcpAHhlI9quOh4SukL
 d7ADrPyUhvmUoN5lpaHJAYiuqSGxC/AerNrjzH6AZc4vWnViYDwvkAhcNM6GnsJ+hUso
 Kg6aoAP4d4HAKzIrYnnhbKRu8i7j0crThtYAFkdmHqAtryNiwaY7YZ5QpOqMO7eOqYQX
 QAAcd1SN7dT2x0FGhABX2gz71t9WIBtw3he0mQY7Z/s4B7S8EvyiWXgrScdBEZNmnkw9
 ZX7fBfP13ZOg03t6lro+gxShfJy4LEAgC41tIS19/h5jjHb1I+M8Xq8p/M/xHYIUcOR3
 blmw==
X-Gm-Message-State: AOJu0Yzr6vA3JC5G2W2TRXCOqOUAn7jzVZ7uZJv1XiAZm79fSheYc7zX
 S+ulRpmzXxV7oh2ZLYu3Tw6teIIwat/Oa0KGMqI=
X-Google-Smtp-Source: AGHT+IEXSarpX4D9K7l62tqeOOFIuirkFViAjyDoJBqx2Dqb2516JHcFfgXOGpgW8/z7+m9+5EETDoyKYs0BcsQRPpY=
X-Received: by 2002:a17:907:7857:b0:9ad:ef31:6efc with SMTP id
 lb23-20020a170907785700b009adef316efcmr5953491ejc.21.1696563636811; Thu, 05
 Oct 2023 20:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Oct 2023 12:39:59 +0900
Message-ID: <CAAQKjZMiM+UwFZ8aN2L8THaHt6O6OZfdT1JXiZLm-QPN=OOwug@mail.gmail.com>
Subject: Re: [PATCH] drm: exynos: dsi: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 kernel@pengutronix.de, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2023=EB=85=84 9=EC=9B=94 19=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 7:40, U=
we Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>
> samsung_dsim_remove() returned 0 unconditionally. Make it return void
> instead to convert the two related platform drivers to use
> .remove_new().
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

It'd be better to go to drm-misc.

Reviewed-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c   | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>  include/drm/bridge/samsung-dsim.h       | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index b1df91e37b1b..2b56a5bfe273 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1998,7 +1998,7 @@ int samsung_dsim_probe(struct platform_device *pdev=
)
>  }
>  EXPORT_SYMBOL_GPL(samsung_dsim_probe);
>
> -int samsung_dsim_remove(struct platform_device *pdev)
> +void samsung_dsim_remove(struct platform_device *pdev)
>  {
>         struct samsung_dsim *dsi =3D platform_get_drvdata(pdev);
>
> @@ -2006,8 +2006,6 @@ int samsung_dsim_remove(struct platform_device *pde=
v)
>
>         if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregis=
ter_host)
>                 dsi->plat_data->host_ops->unregister_host(dsi);
> -
> -       return 0;
>  }
>  EXPORT_SYMBOL_GPL(samsung_dsim_remove);
>
> @@ -2107,7 +2105,7 @@ MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
>
>  static struct platform_driver samsung_dsim_driver =3D {
>         .probe =3D samsung_dsim_probe,
> -       .remove =3D samsung_dsim_remove,
> +       .remove_new =3D samsung_dsim_remove,
>         .driver =3D {
>                    .name =3D "samsung-dsim",
>                    .pm =3D &samsung_dsim_pm_ops,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index 69ea33cae651..2fe0e5f3f638 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -181,7 +181,7 @@ MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
>
>  struct platform_driver dsi_driver =3D {
>         .probe =3D samsung_dsim_probe,
> -       .remove =3D samsung_dsim_remove,
> +       .remove_new =3D samsung_dsim_remove,
>         .driver =3D {
>                    .name =3D "exynos-dsi",
>                    .owner =3D THIS_MODULE,
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 6fc9bb2979e4..3f8050d523eb 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -116,7 +116,7 @@ struct samsung_dsim {
>  };
>
>  extern int samsung_dsim_probe(struct platform_device *pdev);
> -extern int samsung_dsim_remove(struct platform_device *pdev);
> +extern void samsung_dsim_remove(struct platform_device *pdev);
>  extern const struct dev_pm_ops samsung_dsim_pm_ops;
>
>  #endif /* __SAMSUNG_DSIM__ */
>
> base-commit: 0663e1da5ba8e6459e3555ac12c62741668c0d30
> --
> 2.40.1
>
