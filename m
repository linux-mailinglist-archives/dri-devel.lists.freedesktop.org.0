Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734490F1D4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD0210ECF7;
	Wed, 19 Jun 2024 15:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="m4cL2qVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21310ECFC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:12:59 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5b97a9a9b4bso3213454eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718809978; x=1719414778; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QlJ0YGq/uQqUf811AzhVaKREy5VQopM9S0iNxCm0jic=;
 b=m4cL2qVKUA3ofhNAoWAPkFZHkdtaDhoiMje4uahFrlN1P1pEcsVUJfTDsogsHk+8Ac
 oVvHyJ3pVip5HEEf347DUTPU3ojVkfIklfXzLLhsxqxXIx/DZqfR//PTH45xyOys0uL+
 F0TIh2VT6g4HIOvB82ir4VgnEN8Pibkkg6MdlCtPn1nDm0DRKJMm/928/tufy2QU3O1T
 RSoKSJgIL3iKh2iXXsWDIZmuwg9e+cZWUg24QH/DNXUvZbNAj+tClnzXXuhgq9CE/YqU
 EtVphbKfJvcECprXbYBLQUlWqbTK+PJ2BnbMF0NOTS9+BewGIZefndrVyxmu8rbu4/8i
 uoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718809978; x=1719414778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlJ0YGq/uQqUf811AzhVaKREy5VQopM9S0iNxCm0jic=;
 b=JmE4ZwxR3R5q7pPLzTBcl/0cuIrys3ItwFw6bqWVp/4Ppwd0IX1QuyeN2BmfozsZYH
 2dIgve0ZnGLXpNEe34opqhifZgfFvBlB0A5BUaC7zJz8nHbjwUITdlE8qO7G7Mq+3iZf
 yfpFmq4ouyHIbnQ7+K/OwOmHdPVQjlVADMVrULb3Fa3X6dqwpaBuiW83pUUVozCOZc15
 i6bcuQDkTMqPMNfaUWaeVVuIeOHyi16AZo/Da1v0XVaA8u5DRn3ZyLE31TO/X2/bISNd
 udTpznmaRspeUg4Cp/PyDsoaVZNuQYK9T0f38siTxgvWV/DdBMBzb2ZnGR+4goLmfGwp
 IhtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj9NQrO4DS7HU3CARANEBwrHkVzdDkW1M8NgkGKIKtHmcdt5xo+DVK9PsJeiSpMbcp516VPUe8b5/sEBXqZoDWoiBT0qPM4g2Df2RJQisD
X-Gm-Message-State: AOJu0YxUnpPQJkLX15P3C/ArE18WBuPopDlHydLqq2DvFNsw1aOmxYOt
 0puxAJccTWRwOfksMQPqAgcSLYFQUPPo3K3UOU/TNnUFbA4+UbQwGUlgCT70BYc=
X-Google-Smtp-Source: AGHT+IFeMMh1MCvYS1yX1hUJEbWMiIeodyR3LLOeXWWow0gzjafVlyBklU57KB2trj16/I1ogvctnA==
X-Received: by 2002:a05:6358:9886:b0:19f:4c1b:f0fe with SMTP id
 e5c5f4694b2df-1a1fd45a708mr299401955d.18.1718809976550; 
 Wed, 19 Jun 2024 08:12:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc0719fsm613804685a.83.2024.06.19.08.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:12:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwzW-004nFq-WF;
 Wed, 19 Jun 2024 12:12:55 -0300
Date: Wed, 19 Jun 2024 12:12:54 -0300
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
Subject: Re: [PATCH v3 15/21] iommu/vt-d: Add helper to allocate paging domain
Message-ID: <20240619151254.GI1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-16-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-16-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:49PM +0800, Lu Baolu wrote:
> The domain_alloc_user operation is currently implemented by allocating a
> paging domain using iommu_domain_alloc(). This is because it needs to fully
> initialize the domain before return. Add a helper to do this to avoid using
> iommu_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 87 +++++++++++++++++++++++++++++++++----
>  1 file changed, 78 insertions(+), 9 deletions(-)

It seems Ok, but I have some small thoughts

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 2e9811bf2a4e..ccde5f5972e4 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -3633,6 +3633,79 @@ static struct iommu_domain blocking_domain = {
>  	}
>  };
>  
> +static int iommu_superpage_capability(struct intel_iommu *iommu, bool first_stage)
> +{
> +	if (!intel_iommu_superpage)
> +		return 0;
> +
> +	if (first_stage)
> +		return cap_fl1gp_support(iommu->cap) ? 2 : 1;
> +
> +	return fls(cap_super_page_val(iommu->cap));
> +}
> +
> +static struct dmar_domain *paging_domain_alloc(struct device *dev, bool first_stage)
> +{
> +	struct device_domain_info *info = dev_iommu_priv_get(dev);
> +	struct intel_iommu *iommu = info->iommu;
> +	struct dmar_domain *domain;
> +	int addr_width;
> +
> +	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +	if (!domain)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&domain->devices);
> +	INIT_LIST_HEAD(&domain->dev_pasids);
> +	INIT_LIST_HEAD(&domain->cache_tags);
> +	spin_lock_init(&domain->lock);
> +	spin_lock_init(&domain->cache_lock);
> +	xa_init(&domain->iommu_array);

You should probably split more, with an 'alloc struct dmar_domain'
function that can be used by SVA and others too.

> +	domain->nid = dev_to_node(dev);
> +	domain->has_iotlb_device = info->ats_enabled;
> +	domain->use_first_level = first_stage;
> +
> +	/* calculate the address width */
> +	addr_width = agaw_to_width(iommu->agaw);
> +	if (addr_width > cap_mgaw(iommu->cap))
> +		addr_width = cap_mgaw(iommu->cap);
> +	domain->gaw = addr_width;
> +	domain->agaw = iommu->agaw;
> +	domain->max_addr = __DOMAIN_MAX_ADDR(addr_width);
> +
> +	/* iommu memory access coherency */
> +	domain->iommu_coherency = iommu_paging_structure_coherency(iommu);
> +
> +	/* pagesize bitmap */
> +	domain->domain.pgsize_bitmap = SZ_4K;
> +	domain->iommu_superpage = iommu_superpage_capability(iommu, first_stage);
> +	domain->domain.pgsize_bitmap |= domain_super_pgsize_bitmap(domain);

Then some of this stuff is really just paging only. Like
SVA/identity/etc don't have pgszie and other things.

Jason
