Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FA6544E9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 17:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B1B10E0CA;
	Thu, 22 Dec 2022 16:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F10610E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 16:10:28 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id k79so1538729pfd.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 08:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5LbHWQm/nCfihTHW8c/djSdKPRylgW1zq/mA/hxAzNU=;
 b=faSTzKUXYjlhyqwbeSVyJWqAK7VjdTNPOelw5Sg8T5Ojs6uhhI73zCRE5vapbz+uhQ
 tomGemoBo/ndRpkOr81fq0fBk1iM4mAaFh14Ru1Nt9P/Z+boBe+zYtkvk0ExAo6v1IiI
 3QHMofV0UzIlVflXoGFIc3iVzCxAh7J/zCWI+SXJ3Jt53oOKOIuTpyadKR2YEx17Twct
 qJpgr171j/bF9jfogd7hr13n95BxGyPVeaGLhH2kaGXYtKt9CZ9ZFfSpQlAickXUyZiZ
 ttl4TIQle4SdU1l7pAt9me8nTrnlwbaMIAPq356HpNOGpKCAEsrBnWGgaojbL14fhDSS
 knkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LbHWQm/nCfihTHW8c/djSdKPRylgW1zq/mA/hxAzNU=;
 b=Sd7jDoPjpgHadCpG1FjtYzKswFbZV1mtexDSMj9JQkqPHIcnSNHsWwUhuPwGbAR4nM
 kShgXVh0O9P1O6+SLs4GJl1IR38x8WguMdvti77oprbM3sqLKCMlJyzFu8/xZS8cyaX8
 NlsGe/G3j/WNa1f1+PZ4VxfkB0rAzQ8ev6SVdjVQKSGoPaD4sijwAbWlgAzrutHbf+7T
 GChKs40h77uUV9gwscO+IdeNmMSO9mGhu7bWQYMtUjEZfD+AJf0RqIvjVcV1i8edjl0f
 r26DY9VwubDLfEw8ONBhiWxLKty6sSu2bRze+cMi035woVW4yRr291yTOd58O69HvWhg
 voUw==
X-Gm-Message-State: AFqh2koq8TL0zOaPoMxn6pR7okgTACLYPtHbdUC1izZdoKFuiLLXcZ1l
 ouPxnxz/AmM6yJ7fj4ODoHdSnu/MyCmuAgcuwVW+sQ==
X-Google-Smtp-Source: AMrXdXt4MWTAT4avILmrBPNnvEVTV9+/DvSwBqeCnt+KkZos6X5NyTCN5Ad7ZtQz21CLieDITrVE70FplYJZIEgH+zU=
X-Received: by 2002:a62:ed04:0:b0:577:3e5e:7a4 with SMTP id
 u4-20020a62ed04000000b005773e5e07a4mr448901pfh.57.1671725427726; Thu, 22 Dec
 2022 08:10:27 -0800 (PST)
MIME-Version: 1.0
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221221224338.v4.3.I7f545d8494dcdbe6e96a15fbe8aaf5bb0c003d50@changeid>
In-Reply-To: <20221221224338.v4.3.I7f545d8494dcdbe6e96a15fbe8aaf5bb0c003d50@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Dec 2022 17:09:51 +0100
Message-ID: <CAPDyKFqFrf5qVpsQs-cwYnazBBjG-QkKxFL1szNmz+x3hq27gg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/msm/a6xx: Vote for cx gdsc from gpu driver
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022 at 18:14, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> When a device has multiple power domains, dev->power_domain is left
> empty during probe. That didn't cause any issue so far because we are
> freeloading on smmu driver's vote on cx gdsc. Instead of that, create
> a device_link between cx genpd device and gmu device to keep a vote from
> gpu driver.
>
> Before this patch:
> localhost ~ # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> gx_gdsc         on              0
>     /devices/genpd:1:3d6a000.gmu                active          0
> cx_gdsc         on              0
>     /devices/platform/soc@0/3da0000.iommu       active          0
>
> After this patch:
> localhost ~ # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> gx_gdsc         on              0
>     /devices/genpd:1:3d6a000.gmu                active          0
> cx_gdsc         on              0
>     /devices/platform/soc@0/3da0000.iommu       active          0
>     /devices/genpd:0:3d6a000.gmu                active          0
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 31 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  2 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 6484b97c5344..1580d0090f35 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1479,6 +1479,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>
>         pm_runtime_force_suspend(gmu->dev);
>
> +       /*
> +        * Since cxpd is a virt device, the devlink with gmu-dev will be removed
> +        * automatically when we do detach
> +        */
> +       dev_pm_domain_detach(gmu->cxpd, false);
> +
>         if (!IS_ERR_OR_NULL(gmu->gxpd)) {
>                 pm_runtime_disable(gmu->gxpd);
>                 dev_pm_domain_detach(gmu->gxpd, false);
> @@ -1605,8 +1611,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>
>         if (adreno_is_a650_family(adreno_gpu)) {
>                 gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
> -               if (IS_ERR(gmu->rscc))
> +               if (IS_ERR(gmu->rscc)) {
> +                       ret = -ENODEV;
>                         goto err_mmio;
> +               }
>         } else {
>                 gmu->rscc = gmu->mmio + 0x23000;
>         }
> @@ -1615,8 +1623,22 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
>         gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
>
> -       if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
> +       if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> +               ret = -ENODEV;
> +               goto err_mmio;
> +       }
> +
> +       gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
> +       if (IS_ERR(gmu->cxpd)) {
> +               ret = PTR_ERR(gmu->cxpd);
>                 goto err_mmio;
> +       }
> +
> +       if (!device_link_add(gmu->dev, gmu->cxpd,
> +                                       DL_FLAG_PM_RUNTIME)) {
> +               ret = -ENODEV;
> +               goto detach_cxpd;
> +       }
>
>         /*
>          * Get a link to the GX power domain to reset the GPU in case of GMU
> @@ -1634,6 +1656,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>
>         return 0;
>
> +detach_cxpd:
> +       dev_pm_domain_detach(gmu->cxpd, false);
> +
>  err_mmio:
>         iounmap(gmu->mmio);
>         if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> @@ -1641,8 +1666,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         free_irq(gmu->gmu_irq, gmu);
>         free_irq(gmu->hfi_irq, gmu);
>
> -       ret = -ENODEV;
> -
>  err_memory:
>         a6xx_gmu_memory_free(gmu);
>  err_put_device:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index e034935b3986..5a42dd4dd31f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -56,6 +56,7 @@ struct a6xx_gmu {
>         int gmu_irq;
>
>         struct device *gxpd;
> +       struct device *cxpd;
>
>         int idle_level;
>
> --
> 2.7.4
>
