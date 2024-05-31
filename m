Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C38D5CB6
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CBF10E570;
	Fri, 31 May 2024 08:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wDHsd4cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438B910EB41
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 08:30:08 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52b8bb0c059so219972e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717144206; x=1717749006; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HcAJw5T3D3kyswsNGvVslEG9tp9kD/iRcABuGT3i7lY=;
 b=wDHsd4cgBNMNVsEhOdP9G2lG94KcpGxrO9rZXyy8ezcZd+qqGNnFpROHiJDMoP/V3b
 qBwns8gT3eYgBG8vgva5Uy4yzgMyPMRa576w3f3H4GjytqbWRIAnYs2HevSdMPl//j4t
 TD+JVCF1I9+ZNRDQnIWPAYJ91Wbs0z+SP3VsoT5SzwgutRPGvxx/GGN57DjESNK98Efd
 D3/K+nZ9hrygJzX8Afo7GuXWyPnP0J14n+mn+LEKKMfKiXITLzWu4wh9euOXYpO8s8vX
 bB5TLITeJnOI6QnWj2vdA8Lm7DefLlQLIRlnDwRYG7gNy2EzGo4JO8zARYsnatZCzRRQ
 JbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717144206; x=1717749006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcAJw5T3D3kyswsNGvVslEG9tp9kD/iRcABuGT3i7lY=;
 b=edeRkrtFfVbw7Sgch+5SKYjGprGxvtpPvOFlx7ZXDj7lpb/AogVyXaDlyrcwWwry1y
 Ji1KPA8snco24XJ5M+0AO1a1GXFuzNBtulkBE6HZSdIOdxVU1CohVjCpYshcU/7x5BIF
 O3Mjl2P7KMAejbhEn+gj7bt3VjhUytA3+0OPOQZAnEr1z2IlbIhEEK46kNlRpsaq+ImY
 FE4kYU6Nj50m6jekNuhLAdGXxRfPH6ypli4g7KWEjlYtkEuptzVw+FDT5vOtVJ/fZ8X7
 1gKX066oXPVL3yH0CMC8JaUaPlD7IOJ7IVAdP0JQBRTMPyM1inL5xrouL1FlyhSY1huX
 2h5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7MswN9HM92lrQv2FosgnFhfVWnqDhQ4OecMGwU1XYoDcB4HfxzBvq4CFa8bG52Jaiho6r0mX3g1FXM/dXCUkFZb1GzNkX2fEOQgksCq5l
X-Gm-Message-State: AOJu0Ywx33z9iZA11EuHjkJfsmF6QxLCYPfPNWRpxfQb3gi2TBZGJN/C
 iCYFUQAEpiL21Q6/D/qkgVtd1Szbi7FP6ybDaOBL3AfxxhYt8sm1aLhqnMDBANY=
X-Google-Smtp-Source: AGHT+IF3eVe9jEydIDWHlerWPOn8og1StxlgIvlxcfACNv4BlCP8zs9gy4BRbJwlet+sV0prmpPQJA==
X-Received: by 2002:ac2:4d92:0:b0:52b:3f91:fa62 with SMTP id
 2adb3069b0e04-52b8958c003mr794238e87.30.1717144205906; 
 Fri, 31 May 2024 01:30:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d8974esm253556e87.256.2024.05.31.01.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 01:30:04 -0700 (PDT)
Date: Fri, 31 May 2024 11:30:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/20] drm/msm: Use iommu_paging_domain_alloc()
Message-ID: <nxd4bnlpu75fdpbehufdorl43ehwkhshah3q5dqjktqfy74yco@55vueuzpaakn>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <20240529053250.91284-7-baolu.lu@linux.intel.com>
 <jd7df7jshswukstxwbfoxuswyltyemdmkx272i5mpldlfsk4t7@ad36olyvmw27>
 <960bfc23-22b3-48d1-baa6-2707767875c5@linux.intel.com>
 <CAA8EJppZU5yy4g85oMWzV_O9Qo91-Cr6d+W9Rz+K+mS6tfU8kw@mail.gmail.com>
 <dda59cd5-b227-4f42-a7f2-b9fe03e1b020@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dda59cd5-b227-4f42-a7f2-b9fe03e1b020@linux.intel.com>
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

On Fri, May 31, 2024 at 09:57:54AM +0800, Baolu Lu wrote:
> On 5/30/24 3:58 PM, Dmitry Baryshkov wrote:
> > On Thu, 30 May 2024 at 04:59, Baolu Lu<baolu.lu@linux.intel.com>  wrote:
> > > On 5/29/24 4:21 PM, Dmitry Baryshkov wrote:
> > > > On Wed, May 29, 2024 at 01:32:36PM +0800, Lu Baolu wrote:
> > > > > The domain allocated in msm_iommu_new() is for the @dev. Replace
> > > > > iommu_domain_alloc() with iommu_paging_domain_alloc() to make it explicit.
> > > > > 
> > > > > Update msm_iommu_new() to always return ERR_PTR in failure cases instead
> > > > > of NULL.
> > > > Please don't mix unrelated changes, because ...
> > > > 
> > > > > Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/msm_iommu.c | 8 ++++----
> > > > >    1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > > > > index d5512037c38b..f7e28d4b5f62 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > > > > @@ -407,9 +407,9 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
> > > > >       struct msm_iommu *iommu;
> > > > >       int ret;
> > > > > 
> > > > > -    domain = iommu_domain_alloc(dev->bus);
> > > > > -    if (!domain)
> > > > > -            return NULL;
> > > > > +    domain = iommu_paging_domain_alloc(dev);
> > > > > +    if (IS_ERR(domain))
> > > > > +            return ERR_CAST(domain);
> > > > > 
> > > > >       iommu_set_pgtable_quirks(domain, quirks);
> > > > > 
> > > > > @@ -441,7 +441,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
> > > > >       struct msm_mmu *mmu;
> > > > > 
> > > > >       mmu = msm_iommu_new(dev, quirks);
> > > > > -    if (IS_ERR_OR_NULL(mmu))
> > > > > +    if (IS_ERR(mmu))
> > > > >               return mmu;
> > > > NAK, not having an IOMMU is a poor but legit usecase for some of devices
> > > > which don't have IOMMU support yet (for example because of the buggy
> > > > implementation for which we were not able to get all the hooks in).
> > > > 
> > > > Please don't break compatibility for existing platforms.
> > > Sure. I will remove this line of change. Though I have no idea in which
> > > case msm_iommu_new() could return NULL after this patch.
> > So, even without this chunk you are going to break the no-IOMMU case.
> > Please don't. This will result in a regression report and a revert.
> > 
> > Instead please provide a way for the existing drivers to continue
> > working. For example, something like:
> > 
> > if (IS_ERR(mmu) && ERR_PTR(mmu) == -ENODEV))
> >      return NULL;
> 
> Oh I see. msm_iommu_new() returning NULL indicates a no-IOMMU case,
> right? So perhaps we can make it explicit like below?
> 
>         if (!device_iommu_mapped(dev))
>                 return NULL;
> 
>         domain = iommu_paging_domain_alloc(dev);
>         if (IS_ERR(domain))
>                 return ERR_CAST(domain);

Yes, this should work, thank you.

-- 
With best wishes
Dmitry
