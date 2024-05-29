Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589568D30EE
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E466D10E0B5;
	Wed, 29 May 2024 08:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cSpQdxVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DCC10E0B5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:21:06 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2e968e77515so21666061fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 01:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716970864; x=1717575664; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NlPH0P994GSLr65I7MtbS6ikre4n5vkaipn9KH2517g=;
 b=cSpQdxVfLGZ/DjfXkAcy67dOGaqnzbmWGEsVN3Op9ci47ayKFXx8dEhP8IGxzkzooK
 vzrUFy/UI1vXqs8o2NvIbtdOzRDWklLyLeMnW+1zjiXHBP85sWAVUq02RFGw1TwFUin+
 M1Y5tzI56EzlkE42MwsXVJLbRXrpICp2yEUQChibUW8qrxJoWV3dRSotw8RYISRS5YCH
 U9aYVCFZ3ArCs2D/SiBFLpsm39UCw3Z4usfPXoNWQa0+8wRyC/aRcSLkrW5wAukKQNsa
 2WFGUWqFuWq46EBl7ULQ97VsF2l+anNPz9890DTH7K0Ljhj9nVvWad10tlP/pdWWLQxe
 1EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716970864; x=1717575664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlPH0P994GSLr65I7MtbS6ikre4n5vkaipn9KH2517g=;
 b=gSjc6JGX7Z8AN4pmk601mY6E4FxShOpiMvZLuSe+hYUsNjANe1CQc9i8Jy5lg5WUuR
 hU7K4QankLNYy9t+5dOUjCOeHslPHLeUOFK9mQOE8sKWDNPYRi9AvkNjA0ISDGY1eDuR
 na3ePXheDHTTy7VZxQtF7hilOjgG/6VBPjsYCkD3W6mw5Q+MZy1T7O7WX6sZS/7g1Z44
 df1uJONqT69kYATCAdOXJmkaEuzS5Jz47dY1Q9E1yYIByukVmxCxA2SH00f9AijsQL8w
 0+xBQSCw0AS7DBi9kZYZCIvvveusZSYits0KA1OetPqybsG9w2bpe7We1JxWlr5Gu9hz
 3+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1/Y5ENjvi38BCN8BqVQDjSSOVpjXF4XJTPfnjxWRufDIMsk9XV43a4qmENPFq1fohriQUa56MR428Dl4Sft7qmWTaCg0Qw7l2aphfwURs
X-Gm-Message-State: AOJu0Yx9Hlt2SXv3+U0eO6EVwcCYy5+uq7wW5CJ6U4NfFYTkw5rqlRe2
 I+ykK5ppOwEK/hDLQFkOb7314haOg386iPOrrX+VGfP0iApolNAtUmYx0gNjVlI=
X-Google-Smtp-Source: AGHT+IGHFRFnp+MyYG+YuWo3CGNhxr5zVQkELmm+9aSx5PbZeqdQ7lHk7UJdLwxeRsOL0b9TVbrimQ==
X-Received: by 2002:a2e:99c2:0:b0:2df:e0c4:8429 with SMTP id
 38308e7fff4ca-2e95b0c22abmr100784511fa.18.1716970864023; 
 Wed, 29 May 2024 01:21:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcc48c8sm25085331fa.14.2024.05.29.01.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 01:21:03 -0700 (PDT)
Date: Wed, 29 May 2024 11:21:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
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
Message-ID: <jd7df7jshswukstxwbfoxuswyltyemdmkx272i5mpldlfsk4t7@ad36olyvmw27>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <20240529053250.91284-7-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529053250.91284-7-baolu.lu@linux.intel.com>
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

On Wed, May 29, 2024 at 01:32:36PM +0800, Lu Baolu wrote:
> The domain allocated in msm_iommu_new() is for the @dev. Replace
> iommu_domain_alloc() with iommu_paging_domain_alloc() to make it explicit.
> 
> Update msm_iommu_new() to always return ERR_PTR in failure cases instead
> of NULL.

Please don't mix unrelated changes, because ...

> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index d5512037c38b..f7e28d4b5f62 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -407,9 +407,9 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>  	struct msm_iommu *iommu;
>  	int ret;
>  
> -	domain = iommu_domain_alloc(dev->bus);
> -	if (!domain)
> -		return NULL;
> +	domain = iommu_paging_domain_alloc(dev);
> +	if (IS_ERR(domain))
> +		return ERR_CAST(domain);
>  
>  	iommu_set_pgtable_quirks(domain, quirks);
>  
> @@ -441,7 +441,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
>  	struct msm_mmu *mmu;
>  
>  	mmu = msm_iommu_new(dev, quirks);
> -	if (IS_ERR_OR_NULL(mmu))
> +	if (IS_ERR(mmu))
>  		return mmu;

NAK, not having an IOMMU is a poor but legit usecase for some of devices
which don't have IOMMU support yet (for example because of the buggy
implementation for which we were not able to get all the hooks in).

Please don't break compatibility for existing platforms.

>  
>  	iommu = to_msm_iommu(mmu);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
