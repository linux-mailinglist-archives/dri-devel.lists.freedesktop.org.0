Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F417370261E
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663DE10E163;
	Mon, 15 May 2023 07:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E371810E161
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:32:39 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bcb00a4c2so18960518a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 00:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684135958; x=1686727958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bqlc7mabYEc3WuKKqQTg0nwVukY71BAWqDftkXtozfc=;
 b=Ax0nRlpBOCHsCU1SaiwCvcYXrrMBwEG6NbjFLZda/rruBkW3C8VDLqxbUWX3gA0MT0
 KdZwxxpwtkEljTqbqiGWlv0B+XHyHjD6yxuJ8ZNh5vDa0jXtjo0NsiPGQKQZQd+aPJ9+
 o2d3tad4pS0Bbmgjp2bpi4dnFzv8UvPjYDam8MJYOi1b30XbI3hONiEcmddKWsIaYxSh
 OTunW7g4o6b8NTzQVdzVxqjcrZudIwLpdmR/qM1DCGQFAPojhoGm5MrG+5FNs4qXJyt2
 SH++AoNu9ev1awE6VWDNa1bcVI7RzY0B91c+eSU6lMhkQqK9W7ukP+YEzynfpIU0jAOK
 4PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684135958; x=1686727958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bqlc7mabYEc3WuKKqQTg0nwVukY71BAWqDftkXtozfc=;
 b=eB/HofSnb2UONvJZVGH+0T/pGlYDK/Mmg6QXblCW07Q9ms32QTeKOI69+9CBmrScNz
 6bFsfXORuB47+/iIdhnOz2H06uu12Tnkt0SXmIQjVZdl1syktSfk5/PAw/vNFsYIeB3t
 zTTjCRlbKR5fSMhfVhxVzNaKRY9t+TTBwxHUqFArr/Apq+NsuMyxtSITqntyK2ajw3By
 TeHjsnXXeSAK4i6v2EBL4UhvZmvKL8NghVXvpj4pYEER8yCpAGgKSLqKRJEzkIm5444n
 LtYMmAm1pR1hjvPf1KYdELOWzBNDCD1Jq+3cC+BsPDQNChWLAvwpuhXduakEUcVB/mpk
 ikWw==
X-Gm-Message-State: AC+VfDwRiznneD+b6oxIBH9bNu+83YCFm6geFlxvbWwW0lTDKe4HmHFw
 GoOrqAAnmQcNSvs8OhpitjM8mn6IgpSIYvzB6CA=
X-Google-Smtp-Source: ACHHUZ5bRkj0h9+Tm3XDGGpOxSM9DjaRs6uCNzFWjStifhOPyHNQZNU7sCT95Bum6LcZnmhFDpuSy7Ka/+ZBIJQsSvc=
X-Received: by 2002:a17:907:7dab:b0:96a:4f89:3916 with SMTP id
 oz43-20020a1709077dab00b0096a4f893916mr12856019ejc.58.1684135957448; Mon, 15
 May 2023 00:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-19-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-19-u.kleine-koenig@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 15 May 2023 16:32:00 +0900
Message-ID: <CAAQKjZN0DpnjpybZaEYz=eS4khTbY7RdS4i0-rC_-O_jk1iY-g@mail.gmail.com>
Subject: Re: [PATCH 18/53] drm/exynos: Convert to platform remove callback
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
Cc: linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

2023=EB=85=84 5=EC=9B=94 8=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:27, Uw=
e Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert the exynos drm drivers from always returning zero in
> the remove callback to the void returning variant.

Could you please update exynos_drm_vidi.c also? Seems you missed.

Thanks,
Inki Dae

>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 6 ++----
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 6 ++----
>  drivers/gpu/drm/exynos/exynos_dp.c            | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       | 5 ++---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_mic.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 6 ++----
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 6 ++----
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 6 ++----
>  14 files changed, 28 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/=
drm/exynos/exynos5433_drm_decon.c
> index 2867b39fa35e..dd63418a9fd2 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -862,18 +862,16 @@ static int exynos5433_decon_probe(struct platform_d=
evice *pdev)
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
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm=
/exynos/exynos7_drm_decon.c
> index 3126f735dedc..6fca23e04285 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -766,7 +766,7 @@ static int decon_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static int decon_remove(struct platform_device *pdev)
> +static void decon_remove(struct platform_device *pdev)
>  {
>         struct decon_context *ctx =3D dev_get_drvdata(&pdev->dev);
>
> @@ -775,8 +775,6 @@ static int decon_remove(struct platform_device *pdev)
>         iounmap(ctx->regs);
>
>         component_del(&pdev->dev, &decon_component_ops);
> -
> -       return 0;
>  }
>
>  static int exynos7_decon_suspend(struct device *dev)
> @@ -841,7 +839,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops=
, exynos7_decon_suspend,
>
>  struct platform_driver decon_driver =3D {
>         .probe          =3D decon_probe,
> -       .remove         =3D decon_remove,
> +       .remove_new     =3D decon_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-decon",
>                 .pm     =3D pm_ptr(&exynos7_decon_pm_ops),
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 3404ec1367fb..ca31bad6c576 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -250,14 +250,12 @@ static int exynos_dp_probe(struct platform_device *=
pdev)
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
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 16c539657f73..67f2e68d6e3a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -354,15 +354,14 @@ static int exynos_drm_platform_probe(struct platfor=
m_device *pdev)
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
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index 06d6513ddaae..96aa98945f18 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1744,13 +1744,11 @@ static int exynos_dsi_probe(struct platform_devic=
e *pdev)
>         return ret;
>  }
>
> -static int exynos_dsi_remove(struct platform_device *pdev)
> +static void exynos_dsi_remove(struct platform_device *pdev)
>  {
>         pm_runtime_disable(&pdev->dev);
>
>         component_del(&pdev->dev, &exynos_dsi_component_ops);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused exynos_dsi_suspend(struct device *dev)
> @@ -1825,7 +1823,7 @@ static const struct dev_pm_ops exynos_dsi_pm_ops =
=3D {
>
>  struct platform_driver dsi_driver =3D {
>         .probe =3D exynos_dsi_probe,
> -       .remove =3D exynos_dsi_remove,
> +       .remove_new =3D exynos_dsi_remove,
>         .driver =3D {
>                    .name =3D "exynos-dsi",
>                    .owner =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimc.c
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
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimd.c
> index 7f4a0be03dd1..cab64bc2b332 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1278,13 +1278,11 @@ static int fimd_probe(struct platform_device *pde=
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
> @@ -1326,7 +1324,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops=
, exynos_fimd_suspend,
>
>  struct platform_driver fimd_driver =3D {
>         .probe          =3D fimd_probe,
> -       .remove         =3D fimd_remove,
> +       .remove_new     =3D fimd_remove,
>         .driver         =3D {
>                 .name   =3D "exynos4-fb",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_g2d.c
> index ec784e58da5c..1f327b06645c 100644
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
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index 964dceb28c1e..f9cf4461036c 100644
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
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_mic.c
> index 17bab5b1663f..e2920960180f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -442,7 +442,7 @@ static int exynos_mic_probe(struct platform_device *p=
dev)
>         return ret;
>  }
>
> -static int exynos_mic_remove(struct platform_device *pdev)
> +static void exynos_mic_remove(struct platform_device *pdev)
>  {
>         struct exynos_mic *mic =3D platform_get_drvdata(pdev);
>
> @@ -450,8 +450,6 @@ static int exynos_mic_remove(struct platform_device *=
pdev)
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
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/dr=
m/exynos/exynos_drm_rotator.c
> index 8706f377c349..797424a5d83b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -329,15 +329,13 @@ static int rotator_probe(struct platform_device *pd=
ev)
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
> @@ -453,7 +451,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(rotator_pm_ops, rota=
tor_runtime_suspend,
>
>  struct platform_driver rotator_driver =3D {
>         .probe          =3D rotator_probe,
> -       .remove         =3D rotator_remove,
> +       .remove_new     =3D rotator_remove,
>         .driver         =3D {
>                 .name   =3D "exynos-rotator",
>                 .owner  =3D THIS_MODULE,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm=
/exynos/exynos_drm_scaler.c
> index 20608e9780ce..b5cbb864c0c8 100644
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
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index b7c11bdce2c8..b03cc88f873b 100644
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
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exyn=
os/exynos_mixer.c
> index 8d333db813b7..9aaf62c85cff 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1259,13 +1259,11 @@ static int mixer_probe(struct platform_device *pd=
ev)
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
> @@ -1339,5 +1337,5 @@ struct platform_driver mixer_driver =3D {
>                 .of_match_table =3D mixer_match_types,
>         },
>         .probe =3D mixer_probe,
> -       .remove =3D mixer_remove,
> +       .remove_new =3D mixer_remove,
>  };
> --
> 2.39.2
>
