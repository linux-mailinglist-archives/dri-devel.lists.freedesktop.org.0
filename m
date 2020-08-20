Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63024C44F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 19:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09AD6E991;
	Thu, 20 Aug 2020 17:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553656E991
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 17:15:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so2294263wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 10:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eX00c0ckm8hT0A0C/n4MyfX4EjjAaDz31mN/Lb//fY=;
 b=Z11Hdhb8fIf+RWDsfZYkftMhqk7M2OXy0n6MgA0ETp9jr3pQV8ulNcpRKj/wKp+Jcb
 TJydKyyk8agCFCKNNVnmf/LSzwt5bkfqxPoBrJfk9wIeWsj3ZxeZ0ypZrs1MtkVmxRRX
 x81JDHis0hoohcY0Q6Ywz9FkA4+uo/uBfiR3m6br16gLBDZ0jm2DrQuA5qDaLjy/F60S
 V1fg+5A7e4NKYugc3e5Xg2R7tNWQTDUK4LztV5U6/Rt21jkXnI9pXAOnIuQyz923d1dR
 HzHV5ev7gLhj5R1KTo733m06xj4N6pqkhAWVg59VKP5cboJK1OKaF5Gqsjv4rsSG1r1h
 /zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eX00c0ckm8hT0A0C/n4MyfX4EjjAaDz31mN/Lb//fY=;
 b=nB+pg4T9m/8IiXHydNfdTnxRsOw/WFqAqzJxFJm768jN8AyR5fC58g1rvNuNKdRSRX
 AUlGI3NixmIUwwOOzIiIipjgINPvpbU4hGfcPOWmIoHGucYBo3itLpoqTI4L/U9uON96
 OY1AIiWYQHomR8RfFXQs/T8TJH/h8SRY5inEZ6BNnKTfBWe4ytdhfc4+5xTCKMi6DpEE
 /0JKEymoJNdGRAz5cZznFWX2mhPIpbKiZ37OhjJqSuVh1Vdrmb+5kdgYnhTbBj3P+8i9
 MybejTp/3GuJIuOl4q1vilDQ4nvxztgEwpQXnpTpq8PmadCFsT+J1qPK3bp/QxR+Q7H1
 K9DQ==
X-Gm-Message-State: AOAM532Oq5FBYRmZkWP8dAPBWX1x7olrAEg+V8fk008whG36sIDcQP0L
 ZrDNQswWtWJQHTP+KjIcqIJH8j6JuKWlH8XvKR5+s+lAq6gy/gOF
X-Google-Smtp-Source: ABdhPJyyd8HHoirSU/WeVEZLJyRDkczRjPGF9/eWaPA4wGBOVGhOy7ejxlGod+q0XjTYTyGC7MJSrAGP/V2HLxQLL8g=
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr4638247wmf.49.1597943137022; 
 Thu, 20 Aug 2020 10:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597931875.git.robin.murphy@arm.com>
 <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
 <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
 <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
In-Reply-To: <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Aug 2020 10:05:25 -0700
Message-ID: <CAF6AEGs1JyZqNYyHC6DsjZa2wbHVhP-M=ZVJxHqYjeFQPZ3APA@mail.gmail.com>
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
 Joerg Roedel <joro@8bytes.org>, Magnus Damm <magnus.damm@gmail.com>,
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

On Thu, Aug 20, 2020 at 9:58 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-08-20 16:55, Rob Clark wrote:
> > Side note, I suspect we'll end up needing something like
> > 0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
> > device out of the closet and dust it off, the fix is easy enough.
> > Just wanted to mention that here so anyone with a 32b device could
> > find what is needed.
>
> FWIW there shouldn't be any material change here - the generic default
> domain is installed under the same circumstances as the Arm
> dma_iommu_mapping was, so if any platform does have an issue, then it
> should already have started 4 years with f78ebca8ff3d ("iommu/msm: Add
> support for generic master bindings").

ok, it has, I guess, been a while since playing with 32b things..
someone on IRC had mentioned a problem that sounded like what
0e764a01015dfebff8a8ffd297d74663772e248a solved, unless they disabled
some ARCH_HAS_xyz thing (IIRC), which I guess is related..

BR,
-R

> Robin.
>
> >
> > BR,
> > -R
> >
> > On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> Now that arch/arm is wired up for default domains and iommu-dma,
> >> implement the corresponding driver-side support for DMA domains.
> >>
> >> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >> ---
> >>   drivers/iommu/msm_iommu.c | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> >> index 3615cd6241c4..f34efcbb0b2b 100644
> >> --- a/drivers/iommu/msm_iommu.c
> >> +++ b/drivers/iommu/msm_iommu.c
> >> @@ -8,6 +8,7 @@
> >>   #include <linux/kernel.h>
> >>   #include <linux/init.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/dma-iommu.h>
> >>   #include <linux/errno.h>
> >>   #include <linux/io.h>
> >>   #include <linux/io-pgtable.h>
> >> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
> >>   {
> >>          struct msm_priv *priv;
> >>
> >> -       if (type != IOMMU_DOMAIN_UNMANAGED)
> >> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
> >>                  return NULL;
> >>
> >>          priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> >>          if (!priv)
> >>                  goto fail_nomem;
> >>
> >> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
> >> +               goto fail_nomem;
> >> +
> >>          INIT_LIST_HEAD(&priv->list_attached);
> >>
> >>          priv->domain.geometry.aperture_start = 0;
> >> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
> >>          struct msm_priv *priv;
> >>          unsigned long flags;
> >>
> >> +       iommu_put_dma_cookie(domain);
> >>          spin_lock_irqsave(&msm_iommu_lock, flags);
> >>          priv = to_msm_priv(domain);
> >>          kfree(priv);
> >> --
> >> 2.28.0.dirty
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
