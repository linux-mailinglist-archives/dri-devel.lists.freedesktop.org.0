Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69F924C29C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109F36E96D;
	Thu, 20 Aug 2020 15:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3E36E96D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:55:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d190so2048485wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4gsAD01Lu/a6HHuOZz2Js+H3gnol7gh8tJ3zMDutdDc=;
 b=ebljxtw8UtQQ032VUUuCGK812jroSyyHZHtTYoOMrud/UydGhZ3UMgBUN9qe9aAvk4
 EHygzdAvntJ9+R/Y3KA0p2V8fSCNXm6RFtsp3+CZNKezVJQ8X2aAKOeBHvVnuXgBzp1O
 Z4mdnxldoQFQbYRJYgGPkdtLHKlnlIzkaDXqkqTa3laBrCC8GM7uy1HvEv9ndhSWNfl7
 gtrl6II21EVeL5x1fdWpBOS2x6s/Ea7ce8pWBuPej62eiBTIeFwATx0cPhjPkPFtdmbp
 cpVIJwigFocq1ZQgZzWrnaG3CAmE48jwTnhO+RO8Uw3CBwiyc46QOxMJqP5MrYAE3v9X
 TZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4gsAD01Lu/a6HHuOZz2Js+H3gnol7gh8tJ3zMDutdDc=;
 b=GwGcunGoQiT0zHFMIpeuEIiKLaxnlQTHEFmrRMAllmIBSlzdC2xPAK6y/msmFwSKEc
 I4yojBMEJEykgQwQTV4qeCIzgilYRvELnQoA90whKI21j//YzRC0QprUNDokknkbX5hm
 QZ3Fze8Et3VWc1E/kFUzJ1EvDyFi9GxFE6/lgJkwn/QGpp+pyjHKnLMqXwXGIucO2IUo
 uNLt/S4KoRyzuORzt7zzfjvi1Hcd8ExE4iyXsb1Rz+90jwXIUB0gUqTevPn7ZI714MIN
 NpNX69zU+e7OxpW2XayFv8SuTW/MV91m9GQSmHsVDkuYuMtZrC+gkGmgr9ciem97okNf
 lVMw==
X-Gm-Message-State: AOAM530qDJuIRAcdKvqsyC050eJ/WttsnXa+jFu7iovSWD7GOgQADz1E
 R9RUZ0mGxGOuWdZTMkGI0hDtHD4oim1TQaCZP0U=
X-Google-Smtp-Source: ABdhPJymrLvmSo2mjxf1P+WzawgnYC5TC99FhFkAg2iJ/mZCttmTx/9BBIkjwyymKsU721sVZprDLyZXm16x0EfQzm0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr3974646wmj.164.1597938913876; 
 Thu, 20 Aug 2020 08:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597931875.git.robin.murphy@arm.com>
 <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
In-Reply-To: <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Aug 2020 08:55:02 -0700
Message-ID: <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
Subject: Re: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, digetx@gmail.com,
 Suman Anna <s-anna@ti.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <joro@8bytes.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Krishna Reddy <vdumpa@nvidia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, t-kristo@ti.com,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Side note, I suspect we'll end up needing something like
0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
device out of the closet and dust it off, the fix is easy enough.
Just wanted to mention that here so anyone with a 32b device could
find what is needed.

BR,
-R

On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/msm_iommu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 3615cd6241c4..f34efcbb0b2b 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -8,6 +8,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> +#include <linux/dma-iommu.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/io-pgtable.h>
> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
>  {
>         struct msm_priv *priv;
>
> -       if (type != IOMMU_DOMAIN_UNMANAGED)
> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>                 return NULL;
>
>         priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 goto fail_nomem;
>
> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
> +               goto fail_nomem;
> +
>         INIT_LIST_HEAD(&priv->list_attached);
>
>         priv->domain.geometry.aperture_start = 0;
> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
>         struct msm_priv *priv;
>         unsigned long flags;
>
> +       iommu_put_dma_cookie(domain);
>         spin_lock_irqsave(&msm_iommu_lock, flags);
>         priv = to_msm_priv(domain);
>         kfree(priv);
> --
> 2.28.0.dirty
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
