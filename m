Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F958FB986
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D141210E568;
	Tue,  4 Jun 2024 16:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="XR2289dQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC62610E568
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:51:49 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-79517ff527dso62418685a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 09:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1717519908; x=1718124708; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rHa4rdBij7iNJpe66g86f477UY9nlCjL0qAGcR/g8E0=;
 b=XR2289dQytF4+MBt1iBs3W1JIrfEahgIBJu2H8pxpuUiVkmxFwf+gPJa9iA8F14ve2
 tHpaNP8mpYFkIVKW2+k/6nBD1rRQ5yssRH7StxfAXWc6G3ZleniJtAjtOYXkN4LuPwJM
 WVl9AqYIC2WDENjvUIpxtOFcKBFxRwtpH7IlxFpjgS3ymEUniba/ePApsIqaC9NuqTlq
 riEsZ64yr1lEKpKhKpSAMXZgul6VJATUE0giabSuF3XlQF7HzO2kkuTtYHAPzozHGw4b
 ccB+J/Y7hqPwEOq/0CTVODsMwhlB0AQL3Ac2nGeX731q1TRXSIrrI+mSQjMC5gMdhzsB
 LsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717519908; x=1718124708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHa4rdBij7iNJpe66g86f477UY9nlCjL0qAGcR/g8E0=;
 b=TOcuH5Ry6MdlpRBONdFAvHmFYcr8695YLvQBSlDZjRgyFI9lab20yvp4+5nzRBXWUZ
 MKEYCaFhnTGV2wNpFKhfom3auzoWlzKKvg6sf03x0oYuCg+n9OlGgJ3o3M6kuO7BfOsc
 DJTs+CGGpL6Zaya+DCvtUI78YVQ/hTN9f8RtqatKVrJCtn7dOPMEL8ehWUgBtRMRtJQd
 EiMUT+Sowt/N0EwsXk5fQm02JHmOuVtY5acCbbZcYiGwKNxo5ql174h+wByK+YaiBCl5
 o5IasfZysV1p2lxB8WYM1/qXFjSETq2tjFnxHCwgfCO7V0w0AtaZN13PX58G7vp2JW5H
 6KHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTmuANUYYHbtNdy0iQ8YDu6V4nj+nszR2cZPDRMXVlnznsqwntCz0Arw96lejhxOZaSMnL5WacDenDRD6MB3W3+Xn2WldplOlWekSHRTaf
X-Gm-Message-State: AOJu0YxN9usDcv0il3Ry/ucpRXkOkTdqYe+zrtCkXG3rzD8RhuXl/HWG
 bJPczioowcQjJryOHpP/HsdpJ8e0O/9rzCGdiJKdWzi04HWHCAd0Zpk2r/+8olA=
X-Google-Smtp-Source: AGHT+IGwn1k8sp+tDvJPbmVwjnFqtNhVBCqRYzi+miJGltF4eG+Bl2fD0Av2bC2c9STAhnkW1l81RA==
X-Received: by 2002:a05:6214:3906:b0:6af:c6bc:bdc2 with SMTP id
 6a1803df08f44-6afc6bcc442mr50551886d6.28.1717519908248; 
 Tue, 04 Jun 2024 09:51:48 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6af3d644efbsm29212786d6.19.2024.06.04.09.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:51:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sEXNx-002u7o-KW;
 Tue, 04 Jun 2024 13:51:45 -0300
Date: Tue, 4 Jun 2024 13:51:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/22] iommufd: Use iommu_user_domain_alloc()
Message-ID: <20240604165145.GD21513@ziepe.ca>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604015134.164206-3-baolu.lu@linux.intel.com>
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

On Tue, Jun 04, 2024 at 09:51:14AM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_user_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/iommufd/hw_pagetable.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index 33d142f8057d..ada05fccb36a 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -127,21 +127,11 @@ iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
>  	hwpt_paging->ioas = ioas;
>  	hwpt_paging->nest_parent = flags & IOMMU_HWPT_ALLOC_NEST_PARENT;
>  
> -	if (ops->domain_alloc_user) {
> -		hwpt->domain = ops->domain_alloc_user(idev->dev, flags, NULL,
> -						      user_data);
                                                     ^^^^^^^^^^^^

> -		if (IS_ERR(hwpt->domain)) {
> -			rc = PTR_ERR(hwpt->domain);
> -			hwpt->domain = NULL;
> -			goto out_abort;
> -		}
> -		hwpt->domain->owner = ops;
> -	} else {
> -		hwpt->domain = iommu_domain_alloc(idev->dev->bus);
> -		if (!hwpt->domain) {
> -			rc = -ENOMEM;
> -			goto out_abort;
> -		}
> +	hwpt->domain = iommu_user_domain_alloc(idev->dev, flags);
> +	if (IS_ERR(hwpt->domain)) {

Where did the user_data go???

If you are going to wrapper the op function then all the args need to
be provided.

I'm not sure there is value in having vfio and vdpa call this
variation since they won't pass a user_data or flags?

Do you imagine there will ever be a difference between what
domain_alloc_user(dev, 0, NULL, NULL) returns from
domain_alloc_paging(dev) ?

That seems like questionable driver behavior to me.

Jason
