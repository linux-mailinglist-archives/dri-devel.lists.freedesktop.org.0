Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E9D7E4FAE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 05:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613F710E374;
	Wed,  8 Nov 2023 04:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C7510E374
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 04:16:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so10836995a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 20:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699416991; x=1700021791; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/F3YLB8Ab2Lca3ggdA+C4E9/O+Kp/oWXjmVuCqcwOo=;
 b=gYjkygYexn66F3M/uaPur9KdNIxG89hWrg/sBZL4nkXUt4meEtZCtn9QysafjzYp79
 q5CMI8p8mLh5gJifHZcmQH9aOOIsR2rE1RIaHGDoxreVAJ/Ut9BZQ/8wXxkuRyBF4dnr
 MyLruROL0VeNrjq9XjOWiM6YgedBVwdc6qoZ/MonF3c7jrL97HmBfHrC2eczi6q2XOcM
 lHJXI9yfQg8cwME7chFIcyEReQuIqZ1+n/60A7onVJo86tsKZ280w3TOeBSwfdJ7pSF6
 P7GolWlKfENhX6hJd71NVn2Rbm2OhdfL50fmv+mL/4vGDU+8u3rsK5DEAU1iZ5UZKZPb
 vKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699416991; x=1700021791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y/F3YLB8Ab2Lca3ggdA+C4E9/O+Kp/oWXjmVuCqcwOo=;
 b=JW9gs/MbRF6r3453vEaqjIoNnVEaxJGIvJUxMm63hhC/BXns6cPrD2M4CvTZcRbXqQ
 IFNyKeYKgtHAE9NFo8rPaBiE/9Ub3RdJps10k3KsdRbVE/UxlyELzWItbS6JZYPWi+4x
 qhDaHzwYuooDyeg9W1x9dEfdkSkf4gatbjOUMGteWbduWqZ6BN5y3CEkN3cuU7rf6LLO
 TOxMJyjMJ76sYHYbj+2WBk47eyEVDDEoYnImaPt9/4P7UIg/5vyw4jFWqUVTFT2iuQ3D
 P6/IMqnioRlO7gyGsIJCwaud0y5pjmV0umeOVDDYVF081pl7HPC0W6UbwOODsgIW7sUZ
 5cWA==
X-Gm-Message-State: AOJu0YzjJ7HrXz3XbCEQyIOZWPdycJZdQX6k15AghGklC9cc4zv92X7E
 uifneTEA4ed7T6aLObT7hH/XcNl3tTlfKAplttw=
X-Google-Smtp-Source: AGHT+IER0mAxps22TfwIJ0i8G70IHWQd6LE8yscAiSiXBE3yX9/490crGqmm21FSu2w73gtbTJITf93hqgzClugyPIk=
X-Received: by 2002:a50:9f82:0:b0:540:54ef:43fd with SMTP id
 c2-20020a509f82000000b0054054ef43fdmr552444edf.34.1699416990791; Tue, 07 Nov
 2023 20:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 8 Nov 2023 13:16:18 +0900
Message-ID: <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: multipart/alternative; boundary="0000000000000fbc5206099c5a25"
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
Cc: linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000fbc5206099c5a25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for late. There was a merge conflict so I fixed it manually and
merged. And seems your patch description is duplicated so dropped
duplicated one.

Thanks,
Inki Dae

2023=EB=85=84 11=EC=9B=94 3=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 1:57, U=
we Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert the exynos drivers from always returning zero in the
> remove callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> drivers/gpu/drm/exynos/exynos_mixer.c :: Convert to platform remove
> callback returning void
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 6 ++----
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 6 ++----
>  drivers/gpu/drm/exynos/exynos_dp.c            | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       | 5 ++---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_mic.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 6 ++----
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 6 ++----
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 6 ++----
>  14 files changed, 28 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 4d986077738b..776f2f0b602d 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -862,18 +862,16 @@ static int exynos5433_decon_probe(struct
> platform_device *pdev)
>         return ret;
>  }
>
> -static int exynos5433_decon_remove(struct platform_device *pdev)
> +static void exynos5433_decon_remove(struct platform_device *pdev)
>  {
>         pm_runtime_disable(&pdev->dev);
>
>         component_del(&pdev->dev, &decon_component_ops);
> -
> -       return 0;
>  }
>
>  struct platform_driver exynos5433_decon_driver =3D {
>         .probe          =3D exynos5433_decon_probe,
> -       .remove         =3D exynos5433_decon_remove,
> +       .remove_new     =3D exynos5433_decon_remove,
>         .driver         =3D {
>                 .name   =3D "exynos5433-decon",
>                 .pm     =3D pm_ptr(&exynos5433_decon_pm_ops),
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index 0156a5e94435..0d185c0564b9 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -765,7 +765,7 @@ static int decon_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static int decon_remove(struct platform_device *pdev)
> +static void decon_remove(struct platform_device *pdev)
>  {
>         struct decon_context *ctx =3D dev_get_drvdata(&pdev->dev);
>
> @@ -774,8 +774,6 @@ static int decon_remove(struct platform_device *pdev)
>         iounmap(ctx->regs);
>
>         component_del(&pdev->dev, &decon_component_ops);
> -
> -       return 0;
>  }
>
>  static int exynos7_decon_suspend(struct device *dev)
> @@ -840,7 +838,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops=
,
> exynos7_decon_suspend,
>
>  struct platform_driver decon_driver =3D {
>         .probe          =3D decon_probe,
> -       .remove         =3D decon_remove,
> +       .remove_new     =3D decon_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-decon",
>                 .pm     =3D pm_ptr(&exynos7_decon_pm_ops),
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c
> b/drivers/gpu/drm/exynos/exynos_dp.c
> index 3404ec1367fb..ca31bad6c576 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -250,14 +250,12 @@ static int exynos_dp_probe(struct platform_device
> *pdev)
>         return component_add(&pdev->dev, &exynos_dp_ops);
>  }
>
> -static int exynos_dp_remove(struct platform_device *pdev)
> +static void exynos_dp_remove(struct platform_device *pdev)
>  {
>         struct exynos_dp_device *dp =3D platform_get_drvdata(pdev);
>
>         component_del(&pdev->dev, &exynos_dp_ops);
>         analogix_dp_remove(dp->adp);
> -
> -       return 0;
>  }
>
>  static int exynos_dp_suspend(struct device *dev)
> @@ -285,7 +283,7 @@ MODULE_DEVICE_TABLE(of, exynos_dp_match);
>
>  struct platform_driver dp_driver =3D {
>         .probe          =3D exynos_dp_probe,
> -       .remove         =3D exynos_dp_remove,
> +       .remove_new     =3D exynos_dp_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-dp",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 8399256cb5c9..a6bff29fc254 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -344,15 +344,14 @@ static int exynos_drm_platform_probe(struct
> platform_device *pdev)
>                                                match);
>  }
>
> -static int exynos_drm_platform_remove(struct platform_device *pdev)
> +static void exynos_drm_platform_remove(struct platform_device *pdev)
>  {
>         component_master_del(&pdev->dev, &exynos_drm_ops);
> -       return 0;
>  }
>
>  static struct platform_driver exynos_drm_platform_driver =3D {
>         .probe  =3D exynos_drm_platform_probe,
> -       .remove =3D exynos_drm_platform_remove,
> +       .remove_new =3D exynos_drm_platform_remove,
>         .driver =3D {
>                 .name   =3D "exynos-drm",
>                 .pm     =3D &exynos_drm_pm_ops,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 8de2714599fc..e81a576de398 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1367,7 +1367,7 @@ static int fimc_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static int fimc_remove(struct platform_device *pdev)
> +static void fimc_remove(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct fimc_context *ctx =3D get_fimc_context(dev);
> @@ -1377,8 +1377,6 @@ static int fimc_remove(struct platform_device *pdev=
)
>         pm_runtime_disable(dev);
>
>         fimc_put_clocks(ctx);
> -
> -       return 0;
>  }
>
>  static int fimc_runtime_suspend(struct device *dev)
> @@ -1410,7 +1408,7 @@ MODULE_DEVICE_TABLE(of, fimc_of_match);
>
>  struct platform_driver fimc_driver =3D {
>         .probe          =3D fimc_probe,
> -       .remove         =3D fimc_remove,
> +       .remove_new     =3D fimc_remove,
>         .driver         =3D {
>                 .of_match_table =3D fimc_of_match,
>                 .name   =3D "exynos-drm-fimc",
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 8dde7b1e9b35..a9f1c5c05894 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1277,13 +1277,11 @@ static int fimd_probe(struct platform_device *pde=
v)
>         return ret;
>  }
>
> -static int fimd_remove(struct platform_device *pdev)
> +static void fimd_remove(struct platform_device *pdev)
>  {
>         pm_runtime_disable(&pdev->dev);
>
>         component_del(&pdev->dev, &fimd_component_ops);
> -
> -       return 0;
>  }
>
>  static int exynos_fimd_suspend(struct device *dev)
> @@ -1325,7 +1323,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops=
,
> exynos_fimd_suspend,
>
>  struct platform_driver fimd_driver =3D {
>         .probe          =3D fimd_probe,
> -       .remove         =3D fimd_remove,
> +       .remove_new     =3D fimd_remove,
>         .driver         =3D {
>                 .name   =3D "exynos4-fb",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 414e585ec7dd..f3138423612e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -1530,7 +1530,7 @@ static int g2d_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static int g2d_remove(struct platform_device *pdev)
> +static void g2d_remove(struct platform_device *pdev)
>  {
>         struct g2d_data *g2d =3D platform_get_drvdata(pdev);
>
> @@ -1545,8 +1545,6 @@ static int g2d_remove(struct platform_device *pdev)
>         g2d_fini_cmdlist(g2d);
>         destroy_workqueue(g2d->g2d_workq);
>         kmem_cache_destroy(g2d->runqueue_slab);
> -
> -       return 0;
>  }
>
>  static int g2d_suspend(struct device *dev)
> @@ -1609,7 +1607,7 @@ MODULE_DEVICE_TABLE(of, exynos_g2d_match);
>
>  struct platform_driver g2d_driver =3D {
>         .probe          =3D g2d_probe,
> -       .remove         =3D g2d_remove,
> +       .remove_new     =3D g2d_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-drm-g2d",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> index 34cdabc30b4f..6776d3e037c9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1308,15 +1308,13 @@ static int gsc_probe(struct platform_device *pdev=
)
>         return ret;
>  }
>
> -static int gsc_remove(struct platform_device *pdev)
> +static void gsc_remove(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>
>         component_del(dev, &gsc_component_ops);
>         pm_runtime_dont_use_autosuspend(dev);
>         pm_runtime_disable(dev);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused gsc_runtime_suspend(struct device *dev)
> @@ -1421,7 +1419,7 @@ MODULE_DEVICE_TABLE(of, exynos_drm_gsc_of_match);
>
>  struct platform_driver gsc_driver =3D {
>         .probe          =3D gsc_probe,
> -       .remove         =3D gsc_remove,
> +       .remove_new     =3D gsc_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-drm-gsc",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 17bab5b1663f..e2920960180f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -442,7 +442,7 @@ static int exynos_mic_probe(struct platform_device
> *pdev)
>         return ret;
>  }
>
> -static int exynos_mic_remove(struct platform_device *pdev)
> +static void exynos_mic_remove(struct platform_device *pdev)
>  {
>         struct exynos_mic *mic =3D platform_get_drvdata(pdev);
>
> @@ -450,8 +450,6 @@ static int exynos_mic_remove(struct platform_device
> *pdev)
>         pm_runtime_disable(&pdev->dev);
>
>         drm_bridge_remove(&mic->bridge);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id exynos_mic_of_match[] =3D {
> @@ -462,7 +460,7 @@ MODULE_DEVICE_TABLE(of, exynos_mic_of_match);
>
>  struct platform_driver mic_driver =3D {
>         .probe          =3D exynos_mic_probe,
> -       .remove         =3D exynos_mic_remove,
> +       .remove_new     =3D exynos_mic_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-mic",
>                 .pm     =3D pm_ptr(&exynos_mic_pm_ops),
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index ffb327c5139e..5f7516655b08 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -329,15 +329,13 @@ static int rotator_probe(struct platform_device
> *pdev)
>         return ret;
>  }
>
> -static int rotator_remove(struct platform_device *pdev)
> +static void rotator_remove(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>
>         component_del(dev, &rotator_component_ops);
>         pm_runtime_dont_use_autosuspend(dev);
>         pm_runtime_disable(dev);
> -
> -       return 0;
>  }
>
>  static int rotator_runtime_suspend(struct device *dev)
> @@ -453,7 +451,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(rotator_pm_ops,
> rotator_runtime_suspend,
>
>  struct platform_driver rotator_driver =3D {
>         .probe          =3D rotator_probe,
> -       .remove         =3D rotator_remove,
> +       .remove_new     =3D rotator_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-rotator",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> index f2b8b09a6b4e..392f721f13ab 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -539,15 +539,13 @@ static int scaler_probe(struct platform_device *pde=
v)
>         return ret;
>  }
>
> -static int scaler_remove(struct platform_device *pdev)
> +static void scaler_remove(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>
>         component_del(dev, &scaler_component_ops);
>         pm_runtime_dont_use_autosuspend(dev);
>         pm_runtime_disable(dev);
> -
> -       return 0;
>  }
>
>  static int clk_disable_unprepare_wrapper(struct clk *clk)
> @@ -721,7 +719,7 @@ MODULE_DEVICE_TABLE(of, exynos_scaler_match);
>
>  struct platform_driver scaler_driver =3D {
>         .probe          =3D scaler_probe,
> -       .remove         =3D scaler_remove,
> +       .remove_new     =3D scaler_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-scaler",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index f5e1adfcaa51..00382f28748a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -462,7 +462,7 @@ static int vidi_probe(struct platform_device *pdev)
>         return component_add(dev, &vidi_component_ops);
>  }
>
> -static int vidi_remove(struct platform_device *pdev)
> +static void vidi_remove(struct platform_device *pdev)
>  {
>         struct vidi_context *ctx =3D platform_get_drvdata(pdev);
>
> @@ -472,13 +472,11 @@ static int vidi_remove(struct platform_device *pdev=
)
>         }
>
>         component_del(&pdev->dev, &vidi_component_ops);
> -
> -       return 0;
>  }
>
>  struct platform_driver vidi_driver =3D {
>         .probe          =3D vidi_probe,
> -       .remove         =3D vidi_remove,
> +       .remove_new     =3D vidi_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-drm-vidi",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index f3aaa4ea3e68..6dfc8411ef84 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2067,7 +2067,7 @@ static int hdmi_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static int hdmi_remove(struct platform_device *pdev)
> +static void hdmi_remove(struct platform_device *pdev)
>  {
>         struct hdmi_context *hdata =3D platform_get_drvdata(pdev);
>
> @@ -2090,8 +2090,6 @@ static int hdmi_remove(struct platform_device *pdev=
)
>         put_device(&hdata->ddc_adpt->dev);
>
>         mutex_destroy(&hdata->mutex);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused exynos_hdmi_suspend(struct device *dev)
> @@ -2123,7 +2121,7 @@ static const struct dev_pm_ops exynos_hdmi_pm_ops =
=3D {
>
>  struct platform_driver hdmi_driver =3D {
>         .probe          =3D hdmi_probe,
> -       .remove         =3D hdmi_remove,
> +       .remove_new     =3D hdmi_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-hdmi",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c
> b/drivers/gpu/drm/exynos/exynos_mixer.c
> index b302392ff0d7..6822333fd0e6 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1258,13 +1258,11 @@ static int mixer_probe(struct platform_device
> *pdev)
>         return ret;
>  }
>
> -static int mixer_remove(struct platform_device *pdev)
> +static void mixer_remove(struct platform_device *pdev)
>  {
>         pm_runtime_disable(&pdev->dev);
>
>         component_del(&pdev->dev, &mixer_component_ops);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused exynos_mixer_suspend(struct device *dev)
> @@ -1338,5 +1336,5 @@ struct platform_driver mixer_driver =3D {
>                 .of_match_table =3D mixer_match_types,
>         },
>         .probe =3D mixer_probe,
> -       .remove =3D mixer_remove,
> +       .remove_new =3D mixer_remove,
>  };
> --
> 2.42.0
>
>

--0000000000000fbc5206099c5a25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Sorry for late. There was a merge conflict so I fixed it manually and me=
rged. And seems your patch description is duplicated so dropped duplicated =
one.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div d=
ir=3D"auto">Inki Dae<br><br><div class=3D"gmail_quote" dir=3D"auto"><div di=
r=3D"ltr" class=3D"gmail_attr">2023=EB=85=84 11=EC=9B=94 3=EC=9D=BC (=EA=B8=
=88) =EC=98=A4=EC=A0=84 1:57, Uwe Kleine-K=C3=B6nig &lt;<a href=3D"mailto:u=
.kleine-koenig@pengutronix.de">u.kleine-koenig@pengutronix.de</a>&gt;=EB=8B=
=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Th=
e .remove() callback for a platform driver returns an int which makes<br>
many driver authors wrongly assume it&#39;s possible to do error handling b=
y<br>
returning an error code. However the value returned is ignored (apart<br>
from emitting a warning) and this typically results in resource leaks.<br>
<br>
To improve here there is a quest to make the remove callback return<br>
void. In the first step of this quest all drivers are converted to<br>
.remove_new(), which already returns void. Eventually after all drivers<br>
are converted, .remove_new() will be renamed to .remove().<br>
<br>
Trivially convert the exynos drivers from always returning zero in the<br>
remove callback to the void returning variant.<br>
<br>
Signed-off-by: Uwe Kleine-K=C3=B6nig &lt;<a href=3D"mailto:u.kleine-koenig@=
pengutronix.de" target=3D"_blank" rel=3D"noreferrer">u.kleine-koenig@pengut=
ronix.de</a>&gt;<br>
<br>
drivers/gpu/drm/exynos/exynos_mixer.c :: Convert to platform remove callbac=
k returning void<br>
<br>
The .remove() callback for a platform driver returns an int which makes<br>
many driver authors wrongly assume it&#39;s possible to do error handling b=
y<br>
returning an error code. However the value returned is ignored (apart<br>
from emitting a warning) and this typically results in resource leaks.<br>
<br>
To improve here there is a quest to make the remove callback return<br>
void. In the first step of this quest all drivers are converted to<br>
.remove_new(), which already returns void. Eventually after all drivers<br>
are converted, .remove_new() will be renamed to .remove().<br>
<br>
Trivially convert this driver from always returning zero in the remove<br>
callback to the void returning variant.<br>
<br>
Signed-off-by: Uwe Kleine-K=C3=B6nig &lt;<a href=3D"mailto:u.kleine-koenig@=
pengutronix.de" target=3D"_blank" rel=3D"noreferrer">u.kleine-koenig@pengut=
ronix.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 6 ++----<br>
=C2=A0drivers/gpu/drm/exynos/exynos7_drm_decon.c=C2=A0 =C2=A0 | 6 ++----<br=
>
=C2=A0drivers/gpu/drm/exynos/exynos_dp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 6 ++----<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 5=
 ++---<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_fimc.c=C2=A0 =C2=A0 =C2=A0 | 6 ++--=
--<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c=C2=A0 =C2=A0 =C2=A0 | 6 ++--=
--<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_g2d.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6=
 ++----<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_gsc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6=
 ++----<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_mic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6=
 ++----<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_rotator.c=C2=A0 =C2=A0| 6 ++----<br=
>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_scaler.c=C2=A0 =C2=A0 | 6 ++----<br=
>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_vidi.c=C2=A0 =C2=A0 =C2=A0 | 6 ++--=
--<br>
=C2=A0drivers/gpu/drm/exynos/exynos_hdmi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 6 ++----<br>
=C2=A0drivers/gpu/drm/exynos/exynos_mixer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 6 ++----<br>
=C2=A014 files changed, 28 insertions(+), 55 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/dr=
m/exynos/exynos5433_drm_decon.c<br>
index 4d986077738b..776f2f0b602d 100644<br>
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c<br>
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c<br>
@@ -862,18 +862,16 @@ static int exynos5433_decon_probe(struct platform_dev=
ice *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int exynos5433_decon_remove(struct platform_device *pdev)<br>
+static void exynos5433_decon_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(&amp;pdev-&gt;dev, &amp;decon_com=
ponent_ops);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0struct platform_driver exynos5433_decon_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ex=
ynos5433_decon_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ex=
ynos5433_decon_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D exynos5433_d=
econ_remove,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos5433-decon&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm=C2=A0 =C2=A0 =
=C2=A0=3D pm_ptr(&amp;exynos5433_decon_pm_ops),<br>
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/e=
xynos/exynos7_drm_decon.c<br>
index 0156a5e94435..0d185c0564b9 100644<br>
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c<br>
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c<br>
@@ -765,7 +765,7 @@ static int decon_probe(struct platform_device *pdev)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int decon_remove(struct platform_device *pdev)<br>
+static void decon_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct decon_context *ctx =3D dev_get_drvdata(&=
amp;pdev-&gt;dev);<br>
<br>
@@ -774,8 +774,6 @@ static int decon_remove(struct platform_device *pdev)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 iounmap(ctx-&gt;regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(&amp;pdev-&gt;dev, &amp;decon_com=
ponent_ops);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int exynos7_decon_suspend(struct device *dev)<br>
@@ -840,7 +838,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops, =
exynos7_decon_suspend,<br>
<br>
=C2=A0struct platform_driver decon_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D de=
con_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D de=
con_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D decon_remove=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-decon&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm=C2=A0 =C2=A0 =
=C2=A0=3D pm_ptr(&amp;exynos7_decon_pm_ops),<br>
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/ex=
ynos_dp.c<br>
index 3404ec1367fb..ca31bad6c576 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_dp.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_dp.c<br>
@@ -250,14 +250,12 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return component_add(&amp;pdev-&gt;dev, &amp;ex=
ynos_dp_ops);<br>
=C2=A0}<br>
<br>
-static int exynos_dp_remove(struct platform_device *pdev)<br>
+static void exynos_dp_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct exynos_dp_device *dp =3D platform_get_dr=
vdata(pdev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(&amp;pdev-&gt;dev, &amp;exynos_dp=
_ops);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 analogix_dp_remove(dp-&gt;adp);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int exynos_dp_suspend(struct device *dev)<br>
@@ -285,7 +283,7 @@ MODULE_DEVICE_TABLE(of, exynos_dp_match);<br>
<br>
=C2=A0struct platform_driver dp_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ex=
ynos_dp_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ex=
ynos_dp_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D exynos_dp_re=
move,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-dp&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exyn=
os/exynos_drm_drv.c<br>
index 8399256cb5c9..a6bff29fc254 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c<br>
@@ -344,15 +344,14 @@ static int exynos_drm_platform_probe(struct platform_=
device *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0match);<br>
=C2=A0}<br>
<br>
-static int exynos_drm_platform_remove(struct platform_device *pdev)<br>
+static void exynos_drm_platform_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_master_del(&amp;pdev-&gt;dev, &amp;ex=
ynos_drm_ops);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static struct platform_driver exynos_drm_platform_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =3D exynos_drm_platform_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D exynos_drm_platform_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new =3D exynos_drm_platform_remove,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-drm&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm=C2=A0 =C2=A0 =
=C2=A0=3D &amp;exynos_drm_pm_ops,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fimc.c<br>
index 8de2714599fc..e81a576de398 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c<br>
@@ -1367,7 +1367,7 @@ static int fimc_probe(struct platform_device *pdev)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int fimc_remove(struct platform_device *pdev)<br>
+static void fimc_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct fimc_context *ctx =3D get_fimc_context(d=
ev);<br>
@@ -1377,8 +1377,6 @@ static int fimc_remove(struct platform_device *pdev)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fimc_put_clocks(ctx);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int fimc_runtime_suspend(struct device *dev)<br>
@@ -1410,7 +1408,7 @@ MODULE_DEVICE_TABLE(of, fimc_of_match);<br>
<br>
=C2=A0struct platform_driver fimc_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D fi=
mc_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D fi=
mc_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D fimc_remove,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 fimc_of_match,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-drm-fimc&quot;,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fimd.c<br>
index 8dde7b1e9b35..a9f1c5c05894 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
@@ -1277,13 +1277,11 @@ static int fimd_probe(struct platform_device *pdev)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int fimd_remove(struct platform_device *pdev)<br>
+static void fimd_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(&amp;pdev-&gt;dev, &amp;fimd_comp=
onent_ops);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int exynos_fimd_suspend(struct device *dev)<br>
@@ -1325,7 +1323,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops, =
exynos_fimd_suspend,<br>
<br>
=C2=A0struct platform_driver fimd_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D fi=
md_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D fi=
md_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D fimd_remove,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos4-fb&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exyn=
os/exynos_drm_g2d.c<br>
index 414e585ec7dd..f3138423612e 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c<br>
@@ -1530,7 +1530,7 @@ static int g2d_probe(struct platform_device *pdev)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int g2d_remove(struct platform_device *pdev)<br>
+static void g2d_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct g2d_data *g2d =3D platform_get_drvdata(p=
dev);<br>
<br>
@@ -1545,8 +1545,6 @@ static int g2d_remove(struct platform_device *pdev)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 g2d_fini_cmdlist(g2d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_workqueue(g2d-&gt;g2d_workq);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kmem_cache_destroy(g2d-&gt;runqueue_slab);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int g2d_suspend(struct device *dev)<br>
@@ -1609,7 +1607,7 @@ MODULE_DEVICE_TABLE(of, exynos_g2d_match);<br>
<br>
=C2=A0struct platform_driver g2d_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D g2=
d_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D g2=
d_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D g2d_remove,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-drm-g2d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exyn=
os/exynos_drm_gsc.c<br>
index 34cdabc30b4f..6776d3e037c9 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c<br>
@@ -1308,15 +1308,13 @@ static int gsc_probe(struct platform_device *pdev)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int gsc_remove(struct platform_device *pdev)<br>
+static void gsc_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(dev, &amp;gsc_component_ops);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_dont_use_autosuspend(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int __maybe_unused gsc_runtime_suspend(struct device *dev)<br>
@@ -1421,7 +1419,7 @@ MODULE_DEVICE_TABLE(of, exynos_drm_gsc_of_match);<br>
<br>
=C2=A0struct platform_driver gsc_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D gs=
c_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D gs=
c_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D gsc_remove,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-drm-gsc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exyn=
os/exynos_drm_mic.c<br>
index 17bab5b1663f..e2920960180f 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c<br>
@@ -442,7 +442,7 @@ static int exynos_mic_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int exynos_mic_remove(struct platform_device *pdev)<br>
+static void exynos_mic_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct exynos_mic *mic =3D platform_get_drvdata=
(pdev);<br>
<br>
@@ -450,8 +450,6 @@ static int exynos_mic_remove(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_bridge_remove(&amp;mic-&gt;bridge);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static const struct of_device_id exynos_mic_of_match[] =3D {<br>
@@ -462,7 +460,7 @@ MODULE_DEVICE_TABLE(of, exynos_mic_of_match);<br>
<br>
=C2=A0struct platform_driver mic_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ex=
ynos_mic_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ex=
ynos_mic_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D exynos_mic_r=
emove,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-mic&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm=C2=A0 =C2=A0 =
=C2=A0=3D pm_ptr(&amp;exynos_mic_pm_ops),<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/=
exynos/exynos_drm_rotator.c<br>
index ffb327c5139e..5f7516655b08 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c<br>
@@ -329,15 +329,13 @@ static int rotator_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int rotator_remove(struct platform_device *pdev)<br>
+static void rotator_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(dev, &amp;rotator_component_ops);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_dont_use_autosuspend(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int rotator_runtime_suspend(struct device *dev)<br>
@@ -453,7 +451,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(rotator_pm_ops, rotato=
r_runtime_suspend,<br>
<br>
=C2=A0struct platform_driver rotator_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ro=
tator_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ro=
tator_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D rotator_remo=
ve,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-rotator&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/e=
xynos/exynos_drm_scaler.c<br>
index f2b8b09a6b4e..392f721f13ab 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c<br>
@@ -539,15 +539,13 @@ static int scaler_probe(struct platform_device *pdev)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int scaler_remove(struct platform_device *pdev)<br>
+static void scaler_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(dev, &amp;scaler_component_ops);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_dont_use_autosuspend(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int clk_disable_unprepare_wrapper(struct clk *clk)<br>
@@ -721,7 +719,7 @@ MODULE_DEVICE_TABLE(of, exynos_scaler_match);<br>
<br>
=C2=A0struct platform_driver scaler_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sc=
aler_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D sc=
aler_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D scaler_remov=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-scaler&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exy=
nos/exynos_drm_vidi.c<br>
index f5e1adfcaa51..00382f28748a 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c<br>
@@ -462,7 +462,7 @@ static int vidi_probe(struct platform_device *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return component_add(dev, &amp;vidi_component_o=
ps);<br>
=C2=A0}<br>
<br>
-static int vidi_remove(struct platform_device *pdev)<br>
+static void vidi_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vidi_context *ctx =3D platform_get_drvda=
ta(pdev);<br>
<br>
@@ -472,13 +472,11 @@ static int vidi_remove(struct platform_device *pdev)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(&amp;pdev-&gt;dev, &amp;vidi_comp=
onent_ops);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0struct platform_driver vidi_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vi=
di_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D vi=
di_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D vidi_remove,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-drm-vidi&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/=
exynos_hdmi.c<br>
index f3aaa4ea3e68..6dfc8411ef84 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
@@ -2067,7 +2067,7 @@ static int hdmi_probe(struct platform_device *pdev)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int hdmi_remove(struct platform_device *pdev)<br>
+static void hdmi_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct hdmi_context *hdata =3D platform_get_drv=
data(pdev);<br>
<br>
@@ -2090,8 +2090,6 @@ static int hdmi_remove(struct platform_device *pdev)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_device(&amp;hdata-&gt;ddc_adpt-&gt;dev);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_destroy(&amp;hdata-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int __maybe_unused exynos_hdmi_suspend(struct device *dev)<br>
@@ -2123,7 +2121,7 @@ static const struct dev_pm_ops exynos_hdmi_pm_ops =3D=
 {<br>
<br>
=C2=A0struct platform_driver hdmi_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D hd=
mi_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D hd=
mi_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new=C2=A0 =C2=A0 =C2=A0=3D hdmi_remove,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;exynos-hdmi&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =3D TH=
IS_MODULE,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos=
/exynos_mixer.c<br>
index b302392ff0d7..6822333fd0e6 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_mixer.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c<br>
@@ -1258,13 +1258,11 @@ static int mixer_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int mixer_remove(struct platform_device *pdev)<br>
+static void mixer_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(&amp;pdev-&gt;dev, &amp;mixer_com=
ponent_ops);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int __maybe_unused exynos_mixer_suspend(struct device *dev)<br=
>
@@ -1338,5 +1336,5 @@ struct platform_driver mixer_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 mixer_match_types,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe =3D mixer_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D mixer_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new =3D mixer_remove,<br>
=C2=A0};<br>
-- <br>
2.42.0<br>
<br>
</blockquote></div></div></div>

--0000000000000fbc5206099c5a25--
