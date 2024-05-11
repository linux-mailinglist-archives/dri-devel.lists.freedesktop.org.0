Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EFC8C339A
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 21:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4A010E1BF;
	Sat, 11 May 2024 19:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NegqGjPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD01F10E1BF
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 19:50:11 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-de462f3d992so3280998276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715457011; x=1716061811; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F3s0BYtwV5QP2poIgqh39ZmRBGGeeft/DMBZxm9dZ+c=;
 b=NegqGjPlOD7R7LS2+I0hM5YzyOb6JYvdQM20rXjVshlz+Jt4z6RBHvW5dbe6WzOLjF
 ADBF6INUlNDnN1aJq8taaR5CjS6Nrr90zHQSJZCmUc5L0fzOo7UpKyFU7+OuDdZ6wobp
 i7GAV6vslu2YEZT8yWsjJ7KtJg2lk/0S8Rx0JTJXlVJanB+aCMs/mOMxkuajWgEciOcX
 2wiwa/jdlzBhNct0ihMXq7jLlPiHh/3QMVrvxBHDf/d9ujvvw0D2YWlICzz5J3txR46U
 vWaw70bY8+EjHi/e9lFjNze345usvlH+06TxzMMcQO1oQM3xsaeEMwJaNQnKuMKQPRyk
 WYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715457011; x=1716061811;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F3s0BYtwV5QP2poIgqh39ZmRBGGeeft/DMBZxm9dZ+c=;
 b=OAxWYuS9aHQo4MXofqGb1oqgEFykSVvyJvIPr6c1fklwcfdl3sk29azKb7wK9PdQ9D
 j3lbJ+jOz0DBzLfE+e03VO0yOx3IweB1Gb23Dcfbp8pn+ze43/Qt/N20+MxDcFpsL4EJ
 nwyJb63BTpce16+ZR5wc0vgGS1ZpqOpHaBVa5ocEwJoHqYfz1tB6PFoM7idN7rhYwj5q
 RgQXZu2wHXk+GJ3u/UsB3XadTlku/xzWQislz45h4zFNb5bA3zkiPA3+opshX6X/rGfV
 hFPq5/yNR2VgKAbfJkYmGYU7+zmrPeAPoc90AzkrfZJGppRGPCAcLZCPdeiaTN3ExjKU
 Lu5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG72PwWQERZuxtvshBArRfYPKSncF2Q5sOeFDIB9iALaJPx6Y967GDW5He8rNs7z00n91swEvIQV2FPbwEDYmv7dpcCq/hNw++icB2jV90
X-Gm-Message-State: AOJu0YxDUuB/9Ndc3QcCT4cnfhuZZqREgrhwXtH6CO5E7TfZWuSkEX7e
 g3S6AUxYbERCxbzTy6ZmdJhmSDMFBWzquP4X9f5x2KEztlnNCjMgbU+L2zm5Av6lH2KCp1IzZNL
 CEtur5qFW4NmojbzPzbN3EseWoysJrCQhSAnh4w==
X-Google-Smtp-Source: AGHT+IH9oytgieimnJ6EUHW02efq8o7XP9X5e1CpiXtKNoPTUQJ83yI9IK5vGxbcwkH+3Dtqr7EKoZaRHYG6zBFUUaY=
X-Received: by 2002:a25:b1a3:0:b0:dee:5cb6:483c with SMTP id
 3f1490d57ef6-dee5cb64977mr4069754276.49.1715457010482; Sat, 11 May 2024
 12:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
In-Reply-To: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 11 May 2024 22:49:59 +0300
Message-ID: <CAA8EJprdnzvhx50DVHBRLZGkk4GNuCXaBiXt3wfNv-xm2AWOvg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 11 May 2024 at 22:35, Kiarash Hajian
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
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..aa83cb461a75 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>
>  err:
>         if (!IS_ERR_OR_NULL(pdcptr))
> -               iounmap(pdcptr);
> +               devm_iounmap(&pdev->dev,pdcptr);
>         if (!IS_ERR_OR_NULL(seqptr))
> -               iounmap(seqptr);
> +               devm_iounmap(&pdev->dev,seqptr);

Is there any reason to keep devm_iounmap calls? IMO with the devres
management in place, there should be no need to unmap them manually.

>  }
>
>  /*
> @@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ret = ioremap(res->start, resource_size(res));
> +       ret = devm_ioremap_resource(&pdev->dev, res);
>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>                 return ERR_PTR(-EINVAL);
> @@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>
>         /* Drop reference taken in of_find_device_by_node */
>         put_device(gmu->dev);
> @@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>         if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -               iounmap(gmu->rscc);
> +               devm_iounmap(gmu->dev ,gmu->rscc);
>         free_irq(gmu->gmu_irq, gmu);
>         free_irq(gmu->hfi_irq, gmu);
>
>
> ---
> base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
> change-id: 20240511-msm-adreno-memory-region-2bcb1c958621
>
> Best regards,
> --
> Kiarash Hajian <kiarash8112hajian@gmail.com>
>


-- 
With best wishes
Dmitry
