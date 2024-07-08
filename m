Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B452292A762
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 18:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663410E063;
	Mon,  8 Jul 2024 16:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="AchK49PN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B7C10E063
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 16:34:09 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-7036ab4a2acso946004a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1720456449; x=1721061249; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RFoxv2StTkAy81FUVFoM8zRGh/jhofwCwoDeHKUmFcQ=;
 b=AchK49PNeq8Nmn3aKp5sgHSJV2EdgjQYmX2XcPcnVBmLXI5MAtmKpjk9qP10zefa1s
 FDSR+ZGtB4lSihRQMeR7H6a6xBQ8EnCaV/d7/lOUV0R8PrhQOuM7bX0bFC7VLP+/iHz4
 0m0h01Y0gsMfgMkuZm2/S8Q1HC47fqfODkVz74u2hGCi/RUS9jB5mxqMONI6bZ4Tyla0
 qKvzc80/Ny+SVOSve+V8BvHPMoDuNl7o85vHkEq9bVsmKnOSBfMq2nQRRTNn+gNFIcth
 5xVA/ZRqnpvMcRpEJMAzSiikiUnTSj1ADc4LaIFPy1MsxXuTyN/i81KVNw4h5V9VMX7x
 g6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720456449; x=1721061249;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFoxv2StTkAy81FUVFoM8zRGh/jhofwCwoDeHKUmFcQ=;
 b=MvQ52sLvd5jBIb7aHqwdJ7nlIgHmEkj/IbcY7oj6yHghAZ7TLGPjb87bVk6vG4bvNY
 XdHWeevCWf3WJjPhUGbapc01CsfrBR3niUFFjy+sJa1lmYSfjaS+JWy+FJQ2eMtsWLxb
 8/rFvw2rNchn5PUlLPN/nwG7pIiiOrRuew+C/94f7eID6WZmrDSlccCZVftiyv00gzux
 JQUgOEj0GaO/1Pkes6emREpui6ATNc7npur2rUSHi83OHv6P9OPyh5Z6DAuaaLAu6zvL
 +YnSe57Onl81rI5WGmifbCP2ApWK1kefR5c5ys+UkXirMZ6Pceq5C3H4ua8p3NZqEmMX
 oqKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTQDWswkQlIK8ciWyjqFwU0LmDQ/JpvhLI6mvIp5yPEYDRWGbGQGHhGlpAEnkvF0YNlHTdZiTcT8SFv7Cc6qSB9t8yqG9blgD52mKSS/Lh
X-Gm-Message-State: AOJu0YyxHGHvEAVobpZuVlia4yWx3IQ37H4e5VHUKJiX2KCSLuCPCvXu
 rA09AJBr2sfneLDEsr/KkUC/4PKWNIXcof0z6rEgpA0LU1fUqNk1LsGuCiC4fo8=
X-Google-Smtp-Source: AGHT+IH+SY7z9YUcEZHvm3NIhA2HWB3anmidOCwHHCYQdqIO1Nns+4jOSBLNnwnl/BLk4XULUJpMlg==
X-Received: by 2002:a9d:7996:0:b0:703:60b7:5de6 with SMTP id
 46e09a7af769-70360b761b0mr6939936a34.27.1720456448709; 
 Mon, 08 Jul 2024 09:34:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f1900f2bcsm7175785a.32.2024.07.08.09.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 09:34:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sQrJX-000TAF-N5;
 Mon, 08 Jul 2024 13:34:07 -0300
Date: Mon, 8 Jul 2024 13:34:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, catalin.marinas@arm.com,
 kernel-team@android.com, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
Message-ID: <20240708163407.GC14050@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
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

On Thu, Jul 04, 2024 at 03:18:56PM +0100, Will Deacon wrote:
> On Mon, 10 Jun 2024 16:55:34 +0800, Lu Baolu wrote:
> > The IOMMU subsystem has undergone some changes, including the removal
> > of iommu_ops from the bus structure. Consequently, the existing domain
> > allocation interface, which relies on a bus type argument, is no longer
> > relevant:
> >
> >     struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
> >
> > [...]
> 
> Applied a few of these to iommu (iommufd/paging-domain-alloc), thanks!
> 
> [01/21] iommu: Add iommu_paging_domain_alloc() interface
>         https://git.kernel.org/iommu/c/a27bf2743cb8
> [02/21] iommufd: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/26a581606fab
> [03/21] vfio/type1: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/60ffc4501722
> [04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/9c159f6de1ae
> [05/21] drm/msm: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/45acf35af200
> 
> [10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/d5b7485588df
> [11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/ef50d41fbf1c
> 
> [14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/3b10f25704be
> [15/21] iommu/vt-d: Add helper to allocate paging domain
>         https://git.kernel.org/iommu/c/9e9ba576c259

Great, Lu can you please split the remaining by subsystem and try to
get them to go through subsystem trees? Joerg can take the leftovers
at rc6/7 or something like that so we can finish this.

I think this is enough that Intel and AMD could now assert that dev is
non-null?

Jason
