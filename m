Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4990F0D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ECD10E09D;
	Wed, 19 Jun 2024 14:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="HYr77k0T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5A810ECDD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:37:45 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-440609dd118so30659581cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718807865; x=1719412665; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wxs6Ot1v7OOmYh1fi+h7d0RjfC3rXsdWHEMpoOwqcEg=;
 b=HYr77k0TeEvTApd8lgcJn2QJP+p2pNxyEnCkbKVBVlnQeXJTaXv2GASzgE2ORxJp0+
 SvDOXiIFq6lzWSqqSgweJ5AnD76nDcezt7higD8yeU3/oj+6KacYAHHzJN42Ad6vdCgp
 EIqOjRafeJKnQNo3XGwzc3YSk1G5g6ZLDIUfFVH23RXr5hoeqxwZi8Km53D+wK2dym86
 L+O2TflXz/Pg5+Ho/RaMYWfmnqGfFv798EhXJ8v3DYUWBjDmm010HCfOESHaEuCDnvfY
 cI9uSjxi2zw/wmP56a2U9lVuK+CmR6B55DA34DpbLZi4A2CXS8ZUIdZLQuPqqHhcUkHs
 9Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807865; x=1719412665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxs6Ot1v7OOmYh1fi+h7d0RjfC3rXsdWHEMpoOwqcEg=;
 b=giTIeBYVuIJ9JwkMg18/OFhSEJJCrN4/qXDEDrBfMTihwanzNO/qzxHLDP73+GbIEe
 gpc0XBJ27PTxDJQyfhDqHC1gCHDrI54ZORsUMnpYQ81z9QhspXBYTJBvmgufOp5prqra
 wFkpSaHPWpl/AYHHVyfd8rhS3//1wYNDzZXdPz/EGJF3IZ8/Ky1CY9JpUO1N/zRDVGdz
 KFeyaPQtrTfeANd3A0PR3uRDzBVXVCT7xot59ed/ZeIoDMQRdjRuqVX50CSw/cKcrF9W
 q4Ky3yNomjDFGvSDVAZg6dxRVkK9BGs5HtApd6oOeARUrQMeckFqYtszPC2XQ/FCk2DR
 BkjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZHffV1TjLckzB/m2vhgTnZe01X4FTTjWGz47K6d8v9RZjbMwY/G4gC13epMlN8AIZGdG7JsishpBqIe8NKlBDUvUDToOPyuEIGWMtAmhD
X-Gm-Message-State: AOJu0Yx0B8zboSgicJNIp3Q5eLfEUgLO8f4HJuhhneb+OUKMHHo2P57t
 jZVXyiscHB9h/yf5YO0qpnRcKx63iNlTuC1z+biNw5MypVm10cv8SdbPpt19xLo=
X-Google-Smtp-Source: AGHT+IE1Mf08qWZZKoMXC3XLTPx+dWna8s01o0jSerjkNHzkfpY1WyFHeXhpxUdgnTBTf9fhG5DGtQ==
X-Received: by 2002:a05:622a:1985:b0:441:57b3:2d76 with SMTP id
 d75a77b69052e-444a79c1e37mr30313091cf.23.1718807864728; 
 Wed, 19 Jun 2024 07:37:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f2fcc297sm65510081cf.63.2024.06.19.07.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:37:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwRT-004dJu-Li;
 Wed, 19 Jun 2024 11:37:43 -0300
Date: Wed, 19 Jun 2024 11:37:43 -0300
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
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
Message-ID: <20240619143743.GJ791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:34PM +0800, Lu Baolu wrote:
> Lu Baolu (20):
>   iommu: Add iommu_paging_domain_alloc() interface
>   iommufd: Use iommu_paging_domain_alloc()
>   vfio/type1: Use iommu_paging_domain_alloc()
>   drm/msm: Use iommu_paging_domain_alloc()
>   wifi: ath10k: Use iommu_paging_domain_alloc()
>   wifi: ath11k: Use iommu_paging_domain_alloc()
>   RDMA/usnic: Use iommu_paging_domain_alloc()

Joerg, can you pick at least the above patches for this cycle?
Hopefully more will get tags and can go as well.

If you want to try for more tags on the rest I suggest Lu can send
patches to the subsystem trees and hope the maintainers merge them. At
v6.11-rc5 we declare the remainder unmaintained and you take anything
that hasn't been merged so we can finish the iommu core work.

Thanks,
Jason
