Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11165121203
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 18:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6DB6E84F;
	Mon, 16 Dec 2019 17:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD7C6E84E;
 Mon, 16 Dec 2019 17:44:07 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e10so5702010edv.9;
 Mon, 16 Dec 2019 09:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dotsp4hlrRRgAJ8KtDm+ECaZ4Cv3RzpcnEOHjwNyGY4=;
 b=XuMhWcCBF/5Ytd0QFb2aWT2ZjIhuShrmxVGkMOWEHF4GTXo/JJO3tpKzaYezLulgtb
 ymJn6D9SihsyvAj/EkVlj+aj0p9Ywx+4WTU8EuNhn01x+niEpzjpq4vjuYeRmoNeByn4
 PJZ0QlMrGdlv1Ma6updVH0Q6orL1dTU2clAJaH8wkau3kwvAj6eTD5Tpe4oSrym6hJ9Q
 7eNQp6O33KdXkmOj224psFuq5lGg+mHv/9oIs69Uqb+zT1cnAuC1Iuw/itukC1gfD577
 fUSzQTCBMpZ6lVtgzcUx0NJlloH5c2qOEvZWhWWlxw7dbGyvfsGEpCpyfTXO1vkLURHr
 uZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dotsp4hlrRRgAJ8KtDm+ECaZ4Cv3RzpcnEOHjwNyGY4=;
 b=OtIGx9HzXZ4e5+mbjrVuylKT40ro7u6ZUOz6aeOI3INquRz8+exnkf1S0T+tmbkass
 862/3khrU6OHSJNoVRsIdFCD1rvWW9u2At3K0K7NOYNa9fdl7PygWBKLl/V1NORrk1tH
 B35Qd+EESnH6EEiOhXNiAts+jUbLLdTLwJEnb1M3APoZcPTV4sYGNIgqh/pi3r+f39He
 ayzu78DyJgG3o5vLRX+l3grT2mHJOnWCnMPP+aN+oB2KK+X7vQAU6AyHzpoIWy04wrOB
 6g7o+D8pEvu54yc5LX0RAZxvi6kTEHTkWneNAWjwQ52XWkVMHxnoX0dxmefvwShb5kwG
 JKaQ==
X-Gm-Message-State: APjAAAW2QEx++3btURhP96oPz8xNruE4/hgIDNPm/icWBTNIUogq2Btx
 SVqQ/0f2/TC+10C+FFs0TuTRA3yTHa7LSpoa/fs=
X-Google-Smtp-Source: APXvYqzMZmKG4O0FupZLieU7MkUuk6V2ElDf+PeLMM9q5q0SW8+Pb9iyDBHD9J+QeQV1ICnDIpyJSoUw51ELTZ5J+Xk=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr365496edr.57.1576518246192;
 Mon, 16 Dec 2019 09:44:06 -0800 (PST)
MIME-Version: 1.0
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
 <1576514271-15687-6-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1576514271-15687-6-git-send-email-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Dec 2019 09:43:55 -0800
Message-ID: <CAF6AEGsWAjgcsqMQEtCfUn9smqfVyOcf-Nn1+eJGrMuLkjgwRA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/msm/a6xx: Support split pagetables
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 8:38 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Attempt to enable split pagetables if the arm-smmu driver supports it.
> This will move the default address space from the default region to
> the address range assigned to TTBR1. The behavior should be transparent
> to the driver for now but it gets the default buffers out of the way
> when we want to start swapping TTBR0 for context-specific pagetables.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

(my previous r-b's on the other patches from v2 carries over to v3)

> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 52 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5dc0b2c..1c6da93 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -811,6 +811,56 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>         return (unsigned long)busy_time;
>  }
>
> +static struct msm_gem_address_space *
> +a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
> +{
> +       struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> +       struct msm_gem_address_space *aspace;
> +       struct msm_mmu *mmu;
> +       u64 start, size;
> +       u32 val = 1;
> +       int ret;
> +
> +       if (!iommu)
> +               return ERR_PTR(-ENOMEM);
> +
> +       /*
> +        * Try to request split pagetables - the request has to be made before
> +        * the domian is attached
> +        */
> +       iommu_domain_set_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
> +
> +       mmu = msm_iommu_new(&pdev->dev, iommu);
> +       if (IS_ERR(mmu)) {
> +               iommu_domain_free(iommu);
> +               return ERR_CAST(mmu);
> +       }
> +
> +       /*
> +        * After the domain is attached, see if the split tables were actually
> +        * successful.
> +        */
> +       ret = iommu_domain_get_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
> +       if (!ret && val) {
> +               /*
> +                * The aperture start will be at the beginning of the TTBR1
> +                * space so use that as a base
> +                */
> +               start = iommu->geometry.aperture_start;
> +               size = 0xffffffff;
> +       } else {
> +               /* Otherwise use the legacy 32 bit region */
> +               start = SZ_16M;
> +               size = 0xffffffff - SZ_16M;
> +       }
> +
> +       aspace = msm_gem_address_space_create(mmu, "gpu", start, size);
> +       if (IS_ERR(aspace))
> +               iommu_domain_free(iommu);
> +
> +       return aspace;
> +}
> +
>  static const struct adreno_gpu_funcs funcs = {
>         .base = {
>                 .get_param = adreno_get_param,
> @@ -832,7 +882,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>                 .gpu_state_get = a6xx_gpu_state_get,
>                 .gpu_state_put = a6xx_gpu_state_put,
> -               .create_address_space = adreno_iommu_create_address_space,
> +               .create_address_space = a6xx_create_address_space,
>  #endif
>         },
>         .get_timestamp = a6xx_get_timestamp,
> --
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
