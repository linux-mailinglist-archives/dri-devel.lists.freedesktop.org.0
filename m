Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E263192E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 05:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07D10E11B;
	Mon, 21 Nov 2022 04:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F3410E11B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 04:25:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z20so13081570edc.13
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 20:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ReurV23zqxFAQpVH5XpEtAwbdqpUE/kktBTRXt1Dfo=;
 b=DwDcMZQ1wR6vPK13KBCETkQf7tEJd0LLJjEsI23T6CeMntVivQ8NFjBbMy85u9Tg4b
 gHcNSCXosxXw7+aQvGCYMl4ZQPQDaRHnVVuxEyEeUNsGdbz0G+T9L/ci7mHJUmWzs5zC
 AN1ivWOGDiIYT7zxVD42b9CadFlZsDdhcCX4g8LraJCIbwnJoAn5xs5++/WB8zbrNajr
 xPmDhTkoDvqdZDnINNYJK/WrNzwsF2eL99NnPM2RjE/AsD3Rhy5JBpX7MWn2iCHRvgdk
 jaUginSeM+/hGUEzqF1yNYHqJG7ql4ab4SKJY2Ifwb/xXEguXgBFd571/MOOzQ89Xx2v
 Y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ReurV23zqxFAQpVH5XpEtAwbdqpUE/kktBTRXt1Dfo=;
 b=wVcIpuAoczDxsphQlOXx+mqJDrofhiugGT4B8BH6UcGw5maRopTl1vpmYKS5fRGS1u
 I3Wkpsw7Hf08zaQcNu88zRzRLHtLtaZDbrfEnnv4TIy/zFE7xZIuX0T1ZLugYBUT6AX/
 HG7VAgDAWtqXG+AhQT3ABtTeNO/KthFPSmRGT9TcBdbB4A9OK6FpHddqH6smg2WAfAoV
 2Q37T3HF/9cnJn69uyQugeGzNfrcq4I2E/cNvXMpH6lZbUx97VkMXs2ck2ES0YXGvWSx
 CEL/ghF+S8PkP9ElzXNfIN3A52EoqFA4923BfK5HiG1X1yx/bVcvfuCgIFIG4acA67fW
 1sHw==
X-Gm-Message-State: ANoB5pnY6rpK5HbRjlfwgZJ9fdS7DB9+m5oELoZDok8DoDaow6aXVZ/R
 rVzgZGQ7YEdXvWBZdlLnHa5/sXh+XUuCZw+HdAA=
X-Google-Smtp-Source: AA0mqf5GqEUNnAsHOq8uuGGuPwJWPmODtsLNSv8IEGzdt6rPH68uWBxiv7EiL6uCMMyhhEk8bjKakQEhpDJ2FBT0zoE=
X-Received: by 2002:a05:6402:548a:b0:468:e8e2:31c9 with SMTP id
 fg10-20020a056402548a00b00468e8e231c9mr13602090edb.310.1669004747129; Sun, 20
 Nov 2022 20:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175106.360578-10-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-10-paul@crapouillou.net>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 21 Nov 2022 13:25:09 +0900
Message-ID: <CAAQKjZM7MGmrvrRvpiRHeWurn-8csa+gwe4xek80m8Grd39_tA@mail.gmail.com>
Subject: Re: [PATCH 09/26] drm: exynos: Remove #ifdef guards for PM related
 functions
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: linux-samsung-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

2022=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 2:52, P=
aul Cercueil <paul@crapouillou.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Use the DEFINE_RUNTIME_DEV_PM_OPS(), SYSTEM_SLEEP_PM_OPS(),
> RUNTIME_PM_OPS() and pm_ptr() macros to handle the runtime and suspend
> PM callbacks.
>
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_PM is disabled, without having
> to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks for cleanup,
Inki Dae

> ---
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 13 ++++---------
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 12 +++---------
>  drivers/gpu/drm/exynos/exynos_dp.c            | 11 +++--------
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 11 +++--------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 11 +++--------
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 10 +++-------
>  drivers/gpu/drm/exynos/exynos_drm_mic.c       | 11 +++--------
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 12 +++---------
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 12 +++---------
>  9 files changed, 28 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/=
drm/exynos/exynos5433_drm_decon.c
> index 8155d7e650f1..2867b39fa35e 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -710,7 +710,6 @@ static irqreturn_t decon_irq_handler(int irq, void *d=
ev_id)
>         return IRQ_HANDLED;
>  }
>
> -#ifdef CONFIG_PM
>  static int exynos5433_decon_suspend(struct device *dev)
>  {
>         struct decon_context *ctx =3D dev_get_drvdata(dev);
> @@ -741,14 +740,10 @@ static int exynos5433_decon_resume(struct device *d=
ev)
>
>         return ret;
>  }
> -#endif
>
> -static const struct dev_pm_ops exynos5433_decon_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(exynos5433_decon_suspend, exynos5433_decon_res=
ume,
> -                          NULL)
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                                    pm_runtime_force_resume)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(exynos5433_decon_pm_ops,
> +                                exynos5433_decon_suspend,
> +                                exynos5433_decon_resume, NULL);
>
>  static const struct of_device_id exynos5433_decon_driver_dt_match[] =3D =
{
>         {
> @@ -881,7 +876,7 @@ struct platform_driver exynos5433_decon_driver =3D {
>         .remove         =3D exynos5433_decon_remove,
>         .driver         =3D {
>                 .name   =3D "exynos5433-decon",
> -               .pm     =3D &exynos5433_decon_pm_ops,
> +               .pm     =3D pm_ptr(&exynos5433_decon_pm_ops),
>                 .of_match_table =3D exynos5433_decon_driver_dt_match,
>         },
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm=
/exynos/exynos7_drm_decon.c
> index 7080cf7952ec..3126f735dedc 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -779,7 +779,6 @@ static int decon_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
>  static int exynos7_decon_suspend(struct device *dev)
>  {
>         struct decon_context *ctx =3D dev_get_drvdata(dev);
> @@ -836,21 +835,16 @@ static int exynos7_decon_resume(struct device *dev)
>  err_pclk_enable:
>         return ret;
>  }
> -#endif
>
> -static const struct dev_pm_ops exynos7_decon_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(exynos7_decon_suspend, exynos7_decon_resume,
> -                          NULL)
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops, exynos7_decon_sus=
pend,
> +                                exynos7_decon_resume, NULL);
>
>  struct platform_driver decon_driver =3D {
>         .probe          =3D decon_probe,
>         .remove         =3D decon_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-decon",
> -               .pm     =3D &exynos7_decon_pm_ops,
> +               .pm     =3D pm_ptr(&exynos7_decon_pm_ops),
>                 .of_match_table =3D decon_driver_dt_match,
>         },
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 4e3d3d5f6866..3404ec1367fb 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -260,7 +260,6 @@ static int exynos_dp_remove(struct platform_device *p=
dev)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
>  static int exynos_dp_suspend(struct device *dev)
>  {
>         struct exynos_dp_device *dp =3D dev_get_drvdata(dev);
> @@ -274,13 +273,9 @@ static int exynos_dp_resume(struct device *dev)
>
>         return analogix_dp_resume(dp->adp);
>  }
> -#endif
>
> -static const struct dev_pm_ops exynos_dp_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(exynos_dp_suspend, exynos_dp_resume, NULL)
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(exynos_dp_pm_ops, exynos_dp_suspend,
> +                                exynos_dp_resume, NULL);
>
>  static const struct of_device_id exynos_dp_match[] =3D {
>         { .compatible =3D "samsung,exynos5-dp" },
> @@ -294,7 +289,7 @@ struct platform_driver dp_driver =3D {
>         .driver         =3D {
>                 .name   =3D "exynos-dp",
>                 .owner  =3D THIS_MODULE,
> -               .pm     =3D &exynos_dp_pm_ops,
> +               .pm     =3D pm_ptr(&exynos_dp_pm_ops),
>                 .of_match_table =3D exynos_dp_match,
>         },
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimc.c
> index 0ee32e4b1e43..8de2714599fc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1381,7 +1381,6 @@ static int fimc_remove(struct platform_device *pdev=
)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
>  static int fimc_runtime_suspend(struct device *dev)
>  {
>         struct fimc_context *ctx =3D get_fimc_context(dev);
> @@ -1398,13 +1397,9 @@ static int fimc_runtime_resume(struct device *dev)
>         DRM_DEV_DEBUG_KMS(dev, "id[%d]\n", ctx->id);
>         return clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
>  }
> -#endif
>
> -static const struct dev_pm_ops fimc_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -       SET_RUNTIME_PM_OPS(fimc_runtime_suspend, fimc_runtime_resume, NUL=
L)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(fimc_pm_ops, fimc_runtime_suspend,
> +                                fimc_runtime_resume, NULL);
>
>  static const struct of_device_id fimc_of_match[] =3D {
>         { .compatible =3D "samsung,exynos4210-fimc" },
> @@ -1420,6 +1415,6 @@ struct platform_driver fimc_driver =3D {
>                 .of_match_table =3D fimc_of_match,
>                 .name   =3D "exynos-drm-fimc",
>                 .owner  =3D THIS_MODULE,
> -               .pm     =3D &fimc_pm_ops,
> +               .pm     =3D pm_ptr(&fimc_pm_ops),
>         },
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimd.c
> index ae6636e6658e..7f4a0be03dd1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1287,7 +1287,6 @@ static int fimd_remove(struct platform_device *pdev=
)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
>  static int exynos_fimd_suspend(struct device *dev)
>  {
>         struct fimd_context *ctx =3D dev_get_drvdata(dev);
> @@ -1321,13 +1320,9 @@ static int exynos_fimd_resume(struct device *dev)
>
>         return 0;
>  }
> -#endif
>
> -static const struct dev_pm_ops exynos_fimd_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(exynos_fimd_suspend, exynos_fimd_resume, NULL)
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops, exynos_fimd_suspend=
,
> +                                exynos_fimd_resume, NULL);
>
>  struct platform_driver fimd_driver =3D {
>         .probe          =3D fimd_probe,
> @@ -1335,7 +1330,7 @@ struct platform_driver fimd_driver =3D {
>         .driver         =3D {
>                 .name   =3D "exynos4-fb",
>                 .owner  =3D THIS_MODULE,
> -               .pm     =3D &exynos_fimd_pm_ops,
> +               .pm     =3D pm_ptr(&exynos_fimd_pm_ops),
>                 .of_match_table =3D fimd_driver_dt_match,
>         },
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_g2d.c
> index 471fd6c8135f..7711cb67b807 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -1549,7 +1549,6 @@ static int g2d_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int g2d_suspend(struct device *dev)
>  {
>         struct g2d_data *g2d =3D dev_get_drvdata(dev);
> @@ -1574,9 +1573,7 @@ static int g2d_resume(struct device *dev)
>
>         return 0;
>  }
> -#endif
>
> -#ifdef CONFIG_PM
>  static int g2d_runtime_suspend(struct device *dev)
>  {
>         struct g2d_data *g2d =3D dev_get_drvdata(dev);
> @@ -1597,11 +1594,10 @@ static int g2d_runtime_resume(struct device *dev)
>
>         return ret;
>  }
> -#endif
>
>  static const struct dev_pm_ops g2d_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(g2d_suspend, g2d_resume)
> -       SET_RUNTIME_PM_OPS(g2d_runtime_suspend, g2d_runtime_resume, NULL)
> +       SYSTEM_SLEEP_PM_OPS(g2d_suspend, g2d_resume)
> +       RUNTIME_PM_OPS(g2d_runtime_suspend, g2d_runtime_resume, NULL)
>  };
>
>  static const struct of_device_id exynos_g2d_match[] =3D {
> @@ -1617,7 +1613,7 @@ struct platform_driver g2d_driver =3D {
>         .driver         =3D {
>                 .name   =3D "exynos-drm-g2d",
>                 .owner  =3D THIS_MODULE,
> -               .pm     =3D &g2d_pm_ops,
> +               .pm     =3D pm_ptr(&g2d_pm_ops),
>                 .of_match_table =3D exynos_g2d_match,
>         },
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_mic.c
> index 09ce28ee08d9..17bab5b1663f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -340,7 +340,6 @@ static const struct component_ops exynos_mic_componen=
t_ops =3D {
>         .unbind =3D exynos_mic_unbind,
>  };
>
> -#ifdef CONFIG_PM
>  static int exynos_mic_suspend(struct device *dev)
>  {
>         struct exynos_mic *mic =3D dev_get_drvdata(dev);
> @@ -369,13 +368,9 @@ static int exynos_mic_resume(struct device *dev)
>         }
>         return 0;
>  }
> -#endif
>
> -static const struct dev_pm_ops exynos_mic_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(exynos_mic_suspend, exynos_mic_resume, NULL)
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(exynos_mic_pm_ops, exynos_mic_suspend,
> +                                exynos_mic_resume, NULL);
>
>  static int exynos_mic_probe(struct platform_device *pdev)
>  {
> @@ -470,7 +465,7 @@ struct platform_driver mic_driver =3D {
>         .remove         =3D exynos_mic_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-mic",
> -               .pm     =3D &exynos_mic_pm_ops,
> +               .pm     =3D pm_ptr(&exynos_mic_pm_ops),
>                 .owner  =3D THIS_MODULE,
>                 .of_match_table =3D exynos_mic_of_match,
>         },
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/dr=
m/exynos/exynos_drm_rotator.c
> index dec7df35baa9..8706f377c349 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -340,7 +340,6 @@ static int rotator_remove(struct platform_device *pde=
v)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
>  static int rotator_runtime_suspend(struct device *dev)
>  {
>         struct rot_context *rot =3D dev_get_drvdata(dev);
> @@ -355,7 +354,6 @@ static int rotator_runtime_resume(struct device *dev)
>
>         return clk_prepare_enable(rot->clock);
>  }
> -#endif
>
>  static const struct drm_exynos_ipp_limit rotator_s5pv210_rbg888_limits[]=
 =3D {
>         { IPP_SIZE_LIMIT(BUFFER, .h =3D { 8, SZ_16K }, .v =3D { 8, SZ_16K=
 }) },
> @@ -450,12 +448,8 @@ static const struct of_device_id exynos_rotator_matc=
h[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, exynos_rotator_match);
>
> -static const struct dev_pm_ops rotator_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -       SET_RUNTIME_PM_OPS(rotator_runtime_suspend, rotator_runtime_resum=
e,
> -                                                                       N=
ULL)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(rotator_pm_ops, rotator_runtime_suspend=
,
> +                                rotator_runtime_resume, NULL);
>
>  struct platform_driver rotator_driver =3D {
>         .probe          =3D rotator_probe,
> @@ -463,7 +457,7 @@ struct platform_driver rotator_driver =3D {
>         .driver         =3D {
>                 .name   =3D "exynos-rotator",
>                 .owner  =3D THIS_MODULE,
> -               .pm     =3D &rotator_pm_ops,
> +               .pm     =3D pm_ptr(&rotator_pm_ops),
>                 .of_match_table =3D exynos_rotator_match,
>         },
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm=
/exynos/exynos_drm_scaler.c
> index 3c049fb658a3..20608e9780ce 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -550,8 +550,6 @@ static int scaler_remove(struct platform_device *pdev=
)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
> -
>  static int clk_disable_unprepare_wrapper(struct clk *clk)
>  {
>         clk_disable_unprepare(clk);
> @@ -584,13 +582,9 @@ static int scaler_runtime_resume(struct device *dev)
>
>         return  scaler_clk_ctrl(scaler, true);
>  }
> -#endif
>
> -static const struct dev_pm_ops scaler_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -       SET_RUNTIME_PM_OPS(scaler_runtime_suspend, scaler_runtime_resume,=
 NULL)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(scaler_pm_ops, scaler_runtime_suspend,
> +                                scaler_runtime_resume, NULL);
>
>  static const struct drm_exynos_ipp_limit scaler_5420_two_pixel_hv_limits=
[] =3D {
>         { IPP_SIZE_LIMIT(BUFFER, .h =3D { 16, SZ_8K }, .v =3D { 16, SZ_8K=
 }) },
> @@ -731,7 +725,7 @@ struct platform_driver scaler_driver =3D {
>         .driver         =3D {
>                 .name   =3D "exynos-scaler",
>                 .owner  =3D THIS_MODULE,
> -               .pm     =3D &scaler_pm_ops,
> +               .pm     =3D pm_ptr(&scaler_pm_ops),
>                 .of_match_table =3D exynos_scaler_match,
>         },
>  };
> --
> 2.35.1
>
