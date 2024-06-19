Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004C790F03C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4563010ECB8;
	Wed, 19 Jun 2024 14:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="jQ43UUm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BFB10ECB8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:21:10 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4405e343dd8so27376451cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718806869; x=1719411669; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=;
 b=jQ43UUm1P7kgGpudSihv1p1qcZqFZgUPSNLzLLzJ+AA5ATJT2IYZ1WQR9XgNJdptAn
 QVKan8aGPB8T6UF1iy9DoevOuvaSA4u0UuQESberuOjrON9LTSylxLIHRqwfByvClUi+
 pf4qy6taws3ml2BuXhRMPtXT0pRxFRozIUgpYBTfxngLJbFkuoiyic9uUtCStZYoDz3k
 SrPEaMKMEF6OwOgwgwgVxS5otXaVl82sxi69FGM0Xy5j7SYysZsauzYgUQzJvxZnYDzD
 dGOypDbL/RIm5rC+2DYKYLZyNotnWoe/ITag4ArWPk4egvApnqglWdzRwx2HpdV8laPf
 4XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718806869; x=1719411669;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=;
 b=sH4xe382sxRv9NdkF0FZe2u86frIeTJHPcAPR3vuA1GQgBYcXlVA//4v9HAjvRank8
 jgBiExkHLR4WJLMqM+yO3s24Ub4WJmvV7HaEwU4JJlX0pwRbA+qEeqv/H4/YSrO3sYJ7
 ny5pJb9iQkvmF0JkB8FIpTxN77MmsllgQE8Nxms/TtG5F3Y2cIcI/F/RPVE8YyBXbTzv
 vgyUb5Am97drUbTsQ8muzeD+Y78C6IZWEbLjMeatKMAgUgec2wRHNUVUCkr8RYXMGCMX
 RmSoYUL46qrDhufbOHSrdZ3Vd4ZyHE6oYMsQ5rkDmYSPExbafyagav5AqJyNKSv9h6LB
 HLLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQPks51XnQJ4e892dxrhIa5uUOkmFTaUq1HozNASN9+AmYe6Xkz38bTy8TyapY0LMIau2fBxACnRjmJrf/FjHpq5Ri3DVGkgIpgsswHbh2
X-Gm-Message-State: AOJu0YyWCL6jIENO/+GSHvXtUplvE7UX+2IyD3dEF9OQJMuMioO4A+lk
 B1qZqmO28WIFCtCsvycm6217IRXg9OdRFkEKZt71nZDkdhsVDYHKhK5xEeaio64=
X-Google-Smtp-Source: AGHT+IFditz4+ndDJELnqBk6Tg5RVcppmA3k0NZASSXMhXG6oxi/4ZiVAiLFkBd54vQUHLyqIQAFrg==
X-Received: by 2002:a05:622a:11c1:b0:43a:ac99:4bb5 with SMTP id
 d75a77b69052e-444a7a4a90amr26916401cf.51.1718806869361; 
 Wed, 19 Jun 2024 07:21:09 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444b1e112a7sm2007311cf.97.2024.06.19.07.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:21:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwBQ-004YYo-D3;
 Wed, 19 Jun 2024 11:21:08 -0300
Date: Wed, 19 Jun 2024 11:21:08 -0300
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
Subject: Re: [PATCH v3 02/21] iommufd: Use iommu_paging_domain_alloc()
Message-ID: <20240619142108.GH791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-3-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:36PM +0800, Lu Baolu wrote:
> If the iommu driver doesn't implement its domain_alloc_user callback,
> iommufd_hwpt_paging_alloc() rolls back to allocate an iommu paging domain.
> Replace iommu_domain_alloc() with iommu_user_domain_alloc() to pass the
> device pointer along the path.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/iommufd/hw_pagetable.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
