Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6236FC912
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6693C10E269;
	Tue,  9 May 2023 14:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A161E10E269
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:32:54 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-77d049b9040so31106452241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1683642773; x=1686234773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zUvAZSKV3HL8Tg9bmt9WAOkdplE7glNRTewuJl7q9Q=;
 b=Ff8NxoxpEyfjWvW0Jo/P2xjEjOxHqMA6a6Ch2fFYH02Q/tM4mTlJ2BuDDqf7lul2nj
 x66jWZiJmmGb2LA2jWaE4sy5xxyDe0OS+aCjQa3mhrD+XOJPJIoQMZPHWvkUT1wZlSkR
 LZDGF/gAOJqGmeZSfRhVmyCDLBaa3g+CPWgM1ypHWA0nSa67tIRW/oldCCQrGcxbYHru
 zhyDt/kOxePGqpK7x7sjvh4IZhuZOecuJecUq4BKqwVhvT6LJ36o3JxVM/GRicuGsRfo
 zNzHf23qTPdypuOqKcDrcUFl0OMqskwLeFVg29DRn8EQyUkp3lHZ8uv7XbiSSZ2kulJV
 tuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642773; x=1686234773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zUvAZSKV3HL8Tg9bmt9WAOkdplE7glNRTewuJl7q9Q=;
 b=VnDjJkI9r2bkbZ/MNE1VHtNhrcL/e6J/Ne1pliQvt1aXoX4xhZnM7R16GXPfZMVFtP
 o9rxUr8SmjTfOWNQNHdCiPJYxZ3Ot+8gYXaK5GpFdze89oJ1lbGTBdT6mmQbmzJ13jI2
 S+hLVK9onka4jiR9Td4/LXtO96V9aY26op33gTAGGNhfLO+NjVauSZxru+oVK6UUruUB
 DHx1zGWCwjI9bo1tgkyODTVFy3QFJEGYA/WAZ+L4Px1O131qulo/Hyuu3NEX2VLsddK9
 o3jcEHlNIiUdAcTj97Xb2SKwUmdbIR4p9NG9MM3zp6RrCfpuNgz5L3dqGVgV2cZ8zW55
 jjMA==
X-Gm-Message-State: AC+VfDw0eQIVMGPVV7Bo0Hws3K39mGLnHAfFBMGbupNeVF+NV8w01Fxw
 RhjQeqsuSEZAzOAHbgi4kDxppMCi+oBaXmalvmGjJQ==
X-Google-Smtp-Source: ACHHUZ4ddQfLLDgVaMl3/dUW8UZP6kzqIRZ8R10/7XGHInET9nkqOd9v9SffrsUpwwT+gkj69Hx/hXrd87BZTDHg3Uw=
X-Received: by 2002:a1f:bf49:0:b0:44f:e32a:148 with SMTP id
 p70-20020a1fbf49000000b0044fe32a0148mr4356906vkf.8.1683642772960; Tue, 09 May
 2023 07:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-53-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-53-u.kleine-koenig@pengutronix.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 9 May 2023 15:32:37 +0100
Message-ID: <CAPY8ntCeMU6eCvNf8XXt54uiEnrfRV8LZ1Uqd2DNM9QKrbtHYQ@mail.gmail.com>
Subject: Re: [PATCH 52/53] drm/vc4: Convert to platform remove callback
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
Cc: Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 7 May 2023 at 17:27, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert the vc4 drm drivers from always returning zero in the
> remove callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for the patch - looks good.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 5 ++---
>  drivers/gpu/drm/vc4/vc4_dpi.c  | 5 ++---
>  drivers/gpu/drm/vc4/vc4_drv.c  | 6 ++----
>  drivers/gpu/drm/vc4/vc4_dsi.c  | 6 ++----
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
>  drivers/gpu/drm/vc4/vc4_hvs.c  | 5 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c  | 5 ++---
>  drivers/gpu/drm/vc4/vc4_v3d.c  | 5 ++---
>  drivers/gpu/drm/vc4/vc4_vec.c  | 5 ++---
>  9 files changed, 18 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crt=
c.c
> index bef9d45ef1df..7610e841ef3c 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -1450,15 +1450,14 @@ static int vc4_crtc_dev_probe(struct platform_dev=
ice *pdev)
>         return component_add(&pdev->dev, &vc4_crtc_ops);
>  }
>
> -static int vc4_crtc_dev_remove(struct platform_device *pdev)
> +static void vc4_crtc_dev_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &vc4_crtc_ops);
> -       return 0;
>  }
>
>  struct platform_driver vc4_crtc_driver =3D {
>         .probe =3D vc4_crtc_dev_probe,
> -       .remove =3D vc4_crtc_dev_remove,
> +       .remove_new =3D vc4_crtc_dev_remove,
>         .driver =3D {
>                 .name =3D "vc4_crtc",
>                 .of_match_table =3D vc4_crtc_dt_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.=
c
> index f518d6e59ed6..e67856ae9d75 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -391,15 +391,14 @@ static int vc4_dpi_dev_probe(struct platform_device=
 *pdev)
>         return component_add(&pdev->dev, &vc4_dpi_ops);
>  }
>
> -static int vc4_dpi_dev_remove(struct platform_device *pdev)
> +static void vc4_dpi_dev_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &vc4_dpi_ops);
> -       return 0;
>  }
>
>  struct platform_driver vc4_dpi_driver =3D {
>         .probe =3D vc4_dpi_dev_probe,
> -       .remove =3D vc4_dpi_dev_remove,
> +       .remove_new =3D vc4_dpi_dev_remove,
>         .driver =3D {
>                 .name =3D "vc4_dpi",
>                 .of_match_table =3D vc4_dpi_dt_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.=
c
> index 0ccaee57fe9a..cee41e318bf9 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -439,11 +439,9 @@ static int vc4_platform_drm_probe(struct platform_de=
vice *pdev)
>         return component_master_add_with_match(dev, &vc4_drm_ops, match);
>  }
>
> -static int vc4_platform_drm_remove(struct platform_device *pdev)
> +static void vc4_platform_drm_remove(struct platform_device *pdev)
>  {
>         component_master_del(&pdev->dev, &vc4_drm_ops);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id vc4_of_match[] =3D {
> @@ -456,7 +454,7 @@ MODULE_DEVICE_TABLE(of, vc4_of_match);
>
>  static struct platform_driver vc4_platform_driver =3D {
>         .probe          =3D vc4_platform_drm_probe,
> -       .remove         =3D vc4_platform_drm_remove,
> +       .remove_new     =3D vc4_platform_drm_remove,
>         .driver         =3D {
>                 .name   =3D "vc4-drm",
>                 .of_match_table =3D vc4_of_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.=
c
> index a5c075f802e4..839d7d682842 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1830,20 +1830,18 @@ static int vc4_dsi_dev_probe(struct platform_devi=
ce *pdev)
>         return 0;
>  }
>
> -static int vc4_dsi_dev_remove(struct platform_device *pdev)
> +static void vc4_dsi_dev_remove(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
>
>         mipi_dsi_host_unregister(&dsi->dsi_host);
>         vc4_dsi_put(dsi);
> -
> -       return 0;
>  }
>
>  struct platform_driver vc4_dsi_driver =3D {
>         .probe =3D vc4_dsi_dev_probe,
> -       .remove =3D vc4_dsi_dev_remove,
> +       .remove_new =3D vc4_dsi_dev_remove,
>         .driver =3D {
>                 .name =3D "vc4_dsi",
>                 .of_match_table =3D vc4_dsi_dt_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index ea22c9bf223a..0c4aef532521 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -3561,10 +3561,9 @@ static int vc4_hdmi_dev_probe(struct platform_devi=
ce *pdev)
>         return component_add(&pdev->dev, &vc4_hdmi_ops);
>  }
>
> -static int vc4_hdmi_dev_remove(struct platform_device *pdev)
> +static void vc4_hdmi_dev_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &vc4_hdmi_ops);
> -       return 0;
>  }
>
>  static const struct vc4_hdmi_variant bcm2835_variant =3D {
> @@ -3660,7 +3659,7 @@ static const struct dev_pm_ops vc4_hdmi_pm_ops =3D =
{
>
>  struct platform_driver vc4_hdmi_driver =3D {
>         .probe =3D vc4_hdmi_dev_probe,
> -       .remove =3D vc4_hdmi_dev_remove,
> +       .remove_new =3D vc4_hdmi_dev_remove,
>         .driver =3D {
>                 .name =3D "vc4_hdmi",
>                 .of_match_table =3D vc4_hdmi_dt_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.=
c
> index 4da66ef96783..04af672caacb 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -1061,10 +1061,9 @@ static int vc4_hvs_dev_probe(struct platform_devic=
e *pdev)
>         return component_add(&pdev->dev, &vc4_hvs_ops);
>  }
>
> -static int vc4_hvs_dev_remove(struct platform_device *pdev)
> +static void vc4_hvs_dev_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &vc4_hvs_ops);
> -       return 0;
>  }
>
>  static const struct of_device_id vc4_hvs_dt_match[] =3D {
> @@ -1075,7 +1074,7 @@ static const struct of_device_id vc4_hvs_dt_match[]=
 =3D {
>
>  struct platform_driver vc4_hvs_driver =3D {
>         .probe =3D vc4_hvs_dev_probe,
> -       .remove =3D vc4_hvs_dev_remove,
> +       .remove_new =3D vc4_hvs_dev_remove,
>         .driver =3D {
>                 .name =3D "vc4_hvs",
>                 .of_match_table =3D vc4_hvs_dt_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.=
c
> index ef5cab2a3aa9..8152c8325c13 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -577,10 +577,9 @@ static int vc4_txp_probe(struct platform_device *pde=
v)
>         return component_add(&pdev->dev, &vc4_txp_ops);
>  }
>
> -static int vc4_txp_remove(struct platform_device *pdev)
> +static void vc4_txp_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &vc4_txp_ops);
> -       return 0;
>  }
>
>  static const struct of_device_id vc4_txp_dt_match[] =3D {
> @@ -590,7 +589,7 @@ static const struct of_device_id vc4_txp_dt_match[] =
=3D {
>
>  struct platform_driver vc4_txp_driver =3D {
>         .probe =3D vc4_txp_probe,
> -       .remove =3D vc4_txp_remove,
> +       .remove_new =3D vc4_txp_remove,
>         .driver =3D {
>                 .name =3D "vc4_txp",
>                 .of_match_table =3D vc4_txp_dt_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.=
c
> index 29a664c8bf44..04ac7805e6d5 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -532,10 +532,9 @@ static int vc4_v3d_dev_probe(struct platform_device =
*pdev)
>         return component_add(&pdev->dev, &vc4_v3d_ops);
>  }
>
> -static int vc4_v3d_dev_remove(struct platform_device *pdev)
> +static void vc4_v3d_dev_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &vc4_v3d_ops);
> -       return 0;
>  }
>
>  const struct of_device_id vc4_v3d_dt_match[] =3D {
> @@ -547,7 +546,7 @@ const struct of_device_id vc4_v3d_dt_match[] =3D {
>
>  struct platform_driver vc4_v3d_driver =3D {
>         .probe =3D vc4_v3d_dev_probe,
> -       .remove =3D vc4_v3d_dev_remove,
> +       .remove_new =3D vc4_v3d_dev_remove,
>         .driver =3D {
>                 .name =3D "vc4_v3d",
>                 .of_match_table =3D vc4_v3d_dt_match,
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.=
c
> index a3782d05cd66..0bbda1872881 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -818,15 +818,14 @@ static int vc4_vec_dev_probe(struct platform_device=
 *pdev)
>         return component_add(&pdev->dev, &vc4_vec_ops);
>  }
>
> -static int vc4_vec_dev_remove(struct platform_device *pdev)
> +static void vc4_vec_dev_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &vc4_vec_ops);
> -       return 0;
>  }
>
>  struct platform_driver vc4_vec_driver =3D {
>         .probe =3D vc4_vec_dev_probe,
> -       .remove =3D vc4_vec_dev_remove,
> +       .remove_new =3D vc4_vec_dev_remove,
>         .driver =3D {
>                 .name =3D "vc4_vec",
>                 .of_match_table =3D vc4_vec_dt_match,
> --
> 2.39.2
>
