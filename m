Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C38D468A
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 09:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C0B10E073;
	Thu, 30 May 2024 07:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VyVSZ8W5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D52D10E073
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:58:54 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dfa682a4025so45010276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717055934; x=1717660734; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B+oJ9AQU1WwAFE3BTuASvQX6ynujHPOOLDvZ4IBH4iY=;
 b=VyVSZ8W5fXrr6UqKQIrQkZzVe35/9JRp1Rxg29kUe2If+avk1e5i0oIkAAhsZ9nBsB
 lNV727NLi0ZcyyF5N/FBNtz8X5s5mj190oGH7QBMaTHOhsBgmzRKopXfl0EcI9EPHf9a
 +pfNVLCOygEJzlSlcuodzgTR9VJLpE8XneQjlNxAiuPekjoz8ppEBr2598jq6VYaAQDf
 mdHMKnK7fDvIf38Yl3GACCjIaPF56jRCLh8ALcDP3cwkJh4mOqPk32QzhkUxDn9coFPE
 b3dAa4q2YA3rn84NZQWZQeqvqKStsNRyqDNPI27/8Pj3kcqs9R8San/LF/jMIBepYuy6
 h/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717055934; x=1717660734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+oJ9AQU1WwAFE3BTuASvQX6ynujHPOOLDvZ4IBH4iY=;
 b=PNR60WHa20y1N5FXwqjU73uNRqzvy+UL2usfPSw7rSrAIbW/c1ILWsiY/45Q7cjSsp
 64XmiQuilCakPmJNWVz9tqAcCBJPMsJKALRc0FgtJVmiOF8QN/9vWdk5ASU5tTle2O3w
 u/YG7DA2s4hv0Py3l/Or84kAd9KHLzzd6EeXrv15g+mJOUQ6DIpoghmsdjnyvp/lOir4
 bKR5I8P9F0Tzi0q6Z5INuqFaf45ZjhQFOAWU9ZChWqG1XgmgkDxJ9sBstMc46pcdcnmD
 CTUlHhq79mNff2JImm4SsF391c84LaxzCamPhNNL6uyEBqYehEdEhuwW+HqKAp5imXMe
 xFVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUknJaOTtQFPN71CWgk3JSZGYp+AppFZgKJ6XOtB6REEx5Wv9QkxQ3AgM/eNptJ11WgtIhjHx9EAHT+QU7E+h/WYoiTdZ1zafwTNQBCgBjw
X-Gm-Message-State: AOJu0Ywv+FSFWcsJzvE7cZeCgrZbANm715L0hNGk85N3AqGka2zJEeId
 zIlKzyBoQZLbbPY0wJDoX/So9qyqReAVjVYr7z19etiuY7x0SRz5lHkEZyQbTwqCUV28VcekoyH
 OqFU+/AlBWG1xH+KbEFJG5u/Zrz/I6nBNI2rJgQ==
X-Google-Smtp-Source: AGHT+IHWn8jqCUpUtwn4GZB8DSUWhC0pqZv08o7PmbgCc14pEd89tke9BgPzyPGi5xXBW4hatiPVYSqRFMZI/ea2rj8=
X-Received: by 2002:a25:2e07:0:b0:de5:558c:e9b9 with SMTP id
 3f1490d57ef6-dfa5a5bb588mr1579742276.11.1717055933851; Thu, 30 May 2024
 00:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <20240529053250.91284-7-baolu.lu@linux.intel.com>
 <jd7df7jshswukstxwbfoxuswyltyemdmkx272i5mpldlfsk4t7@ad36olyvmw27>
 <960bfc23-22b3-48d1-baa6-2707767875c5@linux.intel.com>
In-Reply-To: <960bfc23-22b3-48d1-baa6-2707767875c5@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 10:58:42 +0300
Message-ID: <CAA8EJppZU5yy4g85oMWzV_O9Qo91-Cr6d+W9Rz+K+mS6tfU8kw@mail.gmail.com>
Subject: Re: [PATCH 06/20] drm/msm: Use iommu_paging_domain_alloc()
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, 
 Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com, 
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 30 May 2024 at 04:59, Baolu Lu <baolu.lu@linux.intel.com> wrote:
>
> On 5/29/24 4:21 PM, Dmitry Baryshkov wrote:
> > On Wed, May 29, 2024 at 01:32:36PM +0800, Lu Baolu wrote:
> >> The domain allocated in msm_iommu_new() is for the @dev. Replace
> >> iommu_domain_alloc() with iommu_paging_domain_alloc() to make it explicit.
> >>
> >> Update msm_iommu_new() to always return ERR_PTR in failure cases instead
> >> of NULL.
> > Please don't mix unrelated changes, because ...
> >
> >> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
> >> ---
> >>   drivers/gpu/drm/msm/msm_iommu.c | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> >> index d5512037c38b..f7e28d4b5f62 100644
> >> --- a/drivers/gpu/drm/msm/msm_iommu.c
> >> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> >> @@ -407,9 +407,9 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
> >>      struct msm_iommu *iommu;
> >>      int ret;
> >>
> >> -    domain = iommu_domain_alloc(dev->bus);
> >> -    if (!domain)
> >> -            return NULL;
> >> +    domain = iommu_paging_domain_alloc(dev);
> >> +    if (IS_ERR(domain))
> >> +            return ERR_CAST(domain);
> >>
> >>      iommu_set_pgtable_quirks(domain, quirks);
> >>
> >> @@ -441,7 +441,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
> >>      struct msm_mmu *mmu;
> >>
> >>      mmu = msm_iommu_new(dev, quirks);
> >> -    if (IS_ERR_OR_NULL(mmu))
> >> +    if (IS_ERR(mmu))
> >>              return mmu;
> > NAK, not having an IOMMU is a poor but legit usecase for some of devices
> > which don't have IOMMU support yet (for example because of the buggy
> > implementation for which we were not able to get all the hooks in).
> >
> > Please don't break compatibility for existing platforms.
>
> Sure. I will remove this line of change. Though I have no idea in which
> case msm_iommu_new() could return NULL after this patch.

So, even without this chunk you are going to break the no-IOMMU case.
Please don't. This will result in a regression report and a revert.

Instead please provide a way for the existing drivers to continue
working. For example, something like:

if (IS_ERR(mmu) && ERR_PTR(mmu) == -ENODEV))
    return NULL;



-- 
With best wishes
Dmitry
