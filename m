Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51885912F3D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 23:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CD410E165;
	Fri, 21 Jun 2024 21:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YBwN3vji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478EB10E165;
 Fri, 21 Jun 2024 21:10:13 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso25976281fa.0; 
 Fri, 21 Jun 2024 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719004211; x=1719609011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iyb8hSYVKKM/r+VcpqNlS7PyezuJWmc+CZRduY6w58=;
 b=YBwN3vji9Vmyncd2BwTupjAj1vloL6grN618VjaO9xRqthLz9GuNm7LJU4D64tJSsu
 AWQxt+xWi9C39/gw6pwBhNEIioA9fMtGIqcoddkTEIu1x4qe3wsTdOuXKRaya/ZjKqfj
 YyowQDHwG/0C80VwDlueZEcitc1YwR+bBHImUrdxHVt7zPUNPsOoTqQ1oHgtyP0EK+E4
 WSzh9UcirqnPk3sjApaznF4JEl3C9TzrhX3LKPTGdeM7/lDnuU7fB0aBFB7uB9JLvCYL
 5UQ5w3m9if9cWHR1KVKlkbFpf15xd3YvlNGHmrLqPDbZ82LzhqaoDHBKQyp6Bc+5GiJM
 YJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719004211; x=1719609011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iyb8hSYVKKM/r+VcpqNlS7PyezuJWmc+CZRduY6w58=;
 b=eZO62bisp75vdEUQr1a2LWitZzdWTsN9VGEUVyAZn3JenB9n7dlSJ00H8WEmJwC7Ga
 YNhDMRzw1a+daZAFVOXaOTqxNl+qKz/VROhOQdv8dDZ0Tvfnb/pUgpEbJrzBdZqA6gUG
 ziqZWWGz0c0c07k1GZ+BwYiLFx+VOQ1eITIu4Un7GxFsYzuZW691zv+Hfcvj8ugt1h1H
 XleSRvjNxnpvO1exja94YT0I8rjZJ5u42wL8UnMiCkfN8hwxVYRIuX/COCrfpMSMe3Is
 3niE3ElSzzpliYGon/Mn9cRABaZqPiUZQ2aKnNzVf/PUu+k1ix046itN5RXTDhuv5z7x
 TbIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUsAuiPbCy1IRHkoph3O2U+qdB8woGLr4kI2PAhdkcz8GU61S13SIZ6LdSr39s2KSybAbAbQW7eOrvvmu0kWqyxUyZlEfj6aCPSzs7EtRVWjtjC9YNBs3U1SeYDJvKaI3GpU1/puwt5FCJTGMfwWuA
X-Gm-Message-State: AOJu0YwmQ+OHQMLirpIbhE2Hwu34KbqXw52STFLD0hg/pW1T+fqmncHg
 rKuMH8xwtDRTLGcu1fyhxwb+Qv2UJQMhGzUfOzo8DxB5YOn/6b9g6ZmiLDi1nW7xL//K5Dxa6CF
 MxmUZlyVufzl3m3Rr9uMwx+D+EYQ=
X-Google-Smtp-Source: AGHT+IFTUdQNhFX9z3HzVsP6p8XRuwLWasMMpz6XtrH6ITxmXMhIMxrau9yHHT5d8uO3N60DhYAXORX55VBi/l3TcOk=
X-Received: by 2002:a2e:7818:0:b0:2ec:3bc4:3e36 with SMTP id
 38308e7fff4ca-2ec3ceb6a56mr60042591fa.14.1719004210910; Fri, 21 Jun 2024
 14:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
In-Reply-To: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Jun 2024 14:09:58 -0700
Message-ID: <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 8, 2024 at 8:44=E2=80=AFAM Kiarash Hajian
<kiarash8112hajian@gmail.com> wrote:
>
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
>
> Implement the region-request through the corresponding managed
> devres-function.
>
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> Changes in v6:
>     -Fix compile error
>     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1-8664f52=
fc2a1@gmail.com
>
> Changes in v5:
>     - Fix error hanlding problems.
>     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-re=
gion-v4-1-3881a64088e6@gmail.com
>
> Changes in v4:
>     - Combine v3 commits into a singel commit
>     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-re=
gion-v3-0-0a728ad45010@gmail.com
>
> Changes in v3:
>     - Remove redundant devm_iounmap calls, relying on devres for automati=
c resource cleanup.
>
> Changes in v2:
>     - update the subject prefix to "drm/msm/a6xx:", to match the majority=
 of other changes to this file.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++------------------=
----
>  1 file changed, 11 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.c
> index 8bea8ef26f77..d26cc6254ef9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>         bool pdc_in_aop =3D false;
>
>         if (IS_ERR(pdcptr))
> -               goto err;
> +               return;
>
>         if (adreno_is_a650(adreno_gpu) ||
>             adreno_is_a660_family(adreno_gpu) ||
> @@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>         if (!pdc_in_aop) {
>                 seqptr =3D a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>                 if (IS_ERR(seqptr))
> -                       goto err;
> +                       return;
>         }
>
>         /* Disable SDE clock gating */
> @@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>         wmb();
>
>         a6xx_rpmh_stop(gmu);
> -
> -err:
> -       if (!IS_ERR_OR_NULL(pdcptr))
> -               iounmap(pdcptr);
> -       if (!IS_ERR_OR_NULL(seqptr))
> -               iounmap(seqptr);
>  }
>
>  /*
> @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platf=
orm_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ret =3D ioremap(res->start, resource_size(res));
> +       ret =3D devm_ioremap_resource(&pdev->dev, res);

So, this doesn't actually work, failing in __request_region_locked(),
because the gmu region partially overlaps with the gpucc region (which
is busy).  I think this is intentional, since gmu is controlling the
gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
overlapping region.  Maybe Akhil knows more about GMU.

BR,
-R

>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers=
\n", name);
>                 return ERR_PTR(-EINVAL);
> @@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_g=
pu, struct device_node *node)
>         gmu->mmio =3D a6xx_gmu_get_mmio(pdev, "gmu");
>         if (IS_ERR(gmu->mmio)) {
>                 ret =3D PTR_ERR(gmu->mmio);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
>         if (IS_ERR(gmu->cxpd)) {
>                 ret =3D PTR_ERR(gmu->cxpd);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> @@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu=
, struct device_node *node)
>         gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx");
>         if (IS_ERR(gmu->gxpd)) {
>                 ret =3D PTR_ERR(gmu->gxpd);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         gmu->initialized =3D true;
> @@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu=
, struct device_node *node)
>  detach_cxpd:
>         dev_pm_domain_detach(gmu->cxpd, false);
>
> -err_mmio:
> -       iounmap(gmu->mmio);
> -
> +err_cleanup:
>         /* Drop reference taken in of_find_device_by_node */
>         put_device(gmu->dev);
>
> @@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct=
 device_node *node)
>                 gmu->rscc =3D a6xx_gmu_get_mmio(pdev, "rscc");
>                 if (IS_ERR(gmu->rscc)) {
>                         ret =3D -ENODEV;
> -                       goto err_mmio;
> +                       goto err_cleanup;
>                 }
>         } else {
>                 gmu->rscc =3D gmu->mmio + 0x23000;
> @@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, stru=
ct device_node *node)
>
>         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
>                 ret =3D -ENODEV;
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
>         if (IS_ERR(gmu->cxpd)) {
>                 ret =3D PTR_ERR(gmu->cxpd);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         link =3D device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)=
;
> @@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struc=
t device_node *node)
>  detach_cxpd:
>         dev_pm_domain_detach(gmu->cxpd, false);
>
> -err_mmio:
> -       iounmap(gmu->mmio);
> -       if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -               iounmap(gmu->rscc);
> +err_cleanup:
>         free_irq(gmu->gmu_irq, gmu);
>         free_irq(gmu->hfi_irq, gmu);
>
>
> ---
> base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
> change-id: 20240608-adreno-98c412bfdc03
>
> Best regards,
> --
> Kiarash Hajian <kiarash8112hajian@gmail.com>
>
