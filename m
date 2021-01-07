Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402472ED575
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F576E48C;
	Thu,  7 Jan 2021 17:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D886E48C;
 Thu,  7 Jan 2021 17:24:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id e25so6235714wme.0;
 Thu, 07 Jan 2021 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KMvmEFBpjy2So792rxW7fyxN8VfuxztLpgDX8jgcy6g=;
 b=ry1v3bCYDlpd2lmszzoxlNXPjCZ2xQdciyO/IvfSSz4lAU8CddtrK78CtbZxzYt8Lk
 52R/W8yqwNTtRPdn/lWQ+/H7BRfL+fe37DtNZA3XuXZr4+78RJRnKOTx3aKlW7MdCeaU
 y4JZYt+SrOXX0QsJKEGyRoP6UsYmjY1ocGDHdXyNE3iz2Dal+e5npt/tUOQAQgq3Siim
 kLaGP0wdqbWZEABtmAYctA43t9R8LyMGurVvvKLuha9R+SZe72SouUEyQGVlYUkYMWeD
 /3gPrWRa5B9FFU6H1M99v5jawKbG50WZmrmnZhhI55f13Crxz70f5x2b9JxXFYJ3nY0o
 PG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KMvmEFBpjy2So792rxW7fyxN8VfuxztLpgDX8jgcy6g=;
 b=D7l0dSmPYUiBlOvEPkYnntHU7ynTBNQYKqrxao6H2/VzDdWDXeiq8LC1e2XwezUjEC
 DkzZiHa7ELYU8TKENr11n+f5AGSHhkTSYf587LscS4n0xqrSDuiMxyyImoT1T9uQQuVb
 1D51kbw1eFg3VKiwb8oQcdPQq3qChYvDpzDfpwgXfcS8jy6rewGDpclEu1WEEHVrbn9C
 o4qkKm+5AYXmycGY1eKXkbztVQbRsT24JZL0JkabGAhBQn1GsrF4YP3Opargc9MBK16K
 beJlzGYjvZBkG++xiVu6vwycr1+RGiVYbM15PbRTHbVcjqW9PX4gYnv9ukixpFGlUnNU
 0rtg==
X-Gm-Message-State: AOAM530lHKQBRQoW3Ew+RkgG1LJILVRhu2R9UdUVq5BdccQMrI6PNyyi
 GK8gUT+FtXgxwrq8EZ6NLxb1uTNP3yde1yAy5cI=
X-Google-Smtp-Source: ABdhPJxy4Gz9DrRlqVSC+vptof6zKhnSJC7xeTi8iOASRVcGnhavBZazzRnX/a1jbGitOVKzKmABDLKRQXJLlyuiuAw=
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr8930405wmh.123.1610040276433; 
 Thu, 07 Jan 2021 09:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20210104193044.80591-1-konrad.dybcio@somainline.org>
 <8847b190c9d03afd731881689d9b28d3@codeaurora.org>
In-Reply-To: <8847b190c9d03afd731881689d9b28d3@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Jan 2021 09:26:54 -0800
Message-ID: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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
 Dave Airlie <airlied@redhat.com>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 6, 2021 at 8:50 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2021-01-05 01:00, Konrad Dybcio wrote:
> > Using this code on A5xx (and probably older too) causes a
> > smmu bug.
> >
> > Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system
> > cache(LLC)")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > Tested-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org>
> > ---
>
> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++---------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
> >  2 files changed, 17 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 6cf9975e951e..f09175698827 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -191,8 +191,6 @@ adreno_iommu_create_address_space(struct msm_gpu
> > *gpu,
> >               struct platform_device *pdev)
> >  {
> >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > -     struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > -     struct io_pgtable_domain_attr pgtbl_cfg;
> >       struct iommu_domain *iommu;
> >       struct msm_mmu *mmu;
> >       struct msm_gem_address_space *aspace;
> > @@ -202,13 +200,18 @@ adreno_iommu_create_address_space(struct msm_gpu
> > *gpu,
> >       if (!iommu)
> >               return NULL;
> >
> > -     /*
> > -      * This allows GPU to set the bus attributes required to use system
> > -      * cache on behalf of the iommu page table walker.
> > -      */
> > -     if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> > -             pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> > -             iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG,
> > &pgtbl_cfg);
> > +
> > +     if (adreno_is_a6xx(adreno_gpu)) {
> > +             struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > +             struct io_pgtable_domain_attr pgtbl_cfg;
> > +             /*
> > +             * This allows GPU to set the bus attributes required to use system
> > +             * cache on behalf of the iommu page table walker.
> > +             */
> > +             if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> > +                     pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> > +                     iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG,
> > &pgtbl_cfg);
> > +             }

I'm applying for -fixes as this is an obvious problem..  But kinda
thinking that we should try to move it into an a6xx specific
create_address_space() (or wrapper for the generic fxn)

Sai/Jordan, could I talk one of you into trying to clean this up
better for next cycle?

BR,
-R

> >       }
> >
> >       mmu = msm_iommu_new(&pdev->dev, iommu);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index 4574d85c5680..08421fa54a50 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -226,6 +226,11 @@ static inline int adreno_is_a540(struct adreno_gpu
> > *gpu)
> >       return gpu->revn == 540;
> >  }
> >
> > +static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
> > +{
> > +     return ((gpu->revn < 700 && gpu->revn > 599));
> > +}
> > +
> >  static inline int adreno_is_a618(struct adreno_gpu *gpu)
> >  {
> >         return gpu->revn == 618;
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
