Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114B93F460
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 13:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118BC10E0DA;
	Mon, 29 Jul 2024 11:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sHOj2PVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C10E10E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 11:45:36 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-427fc9834deso56895e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722253535; x=1722858335;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Po1n89LJvram5HEqYwMALsMwnThZhO0DVQ6rc50fxBE=;
 b=sHOj2PVW3SYtSNjGulrhORQCtSbkOvYy6TXGpziDtm6uyGN8RhtbP1tr+OqYWnk4Ou
 I3ewphKYBqxSFtlO37BA9qAlvuFBe7C8L5lnFO4vYDjKK84XZp6Vbka63ae/88TCKwUp
 +VtwcoLMOYQaXk2wsTTBTFnQwxUFCl26VF3y1RRTCA/PJQt2X08DAsmUPjP/O/AsSLqn
 AthE8/1uFe537bC4sTpVB0CpV3ecOv5pW2X+I4xbtDEa86zxZf2HzpUW+4btRUwMDURE
 7W9H/WV0iqegOo4H77P+umWYhOxnzFyDh5vCT+jq/p8Knoka3oj9K9bt6YSqNJvuLkHV
 3iQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722253535; x=1722858335;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Po1n89LJvram5HEqYwMALsMwnThZhO0DVQ6rc50fxBE=;
 b=Ozo+i4fEEoRPBawdo9uxel5wTyGlS3xdwxMPYQn1IatP+FESGGcely6K/STZibxkn2
 8oskbtDvvd3iiL/cBGJCUhA18lOGYf0VAF4k3PC0EYFbj9hUg32Q7O74AeBtVUMt/739
 RpgLPQy+ZDRGfZRWbs3syzQQfGpns2l28jiuzWGJbCtkZdijTOa+nlt2XVOEd+rO3UO7
 jDWPwyaoC66E3LjpQLVH8EFdFtVvfbySTGFlYJ3dY4AuzYT/pg55NPdtCf/SWbc2b4SV
 5HFQvGGXdHs+QFNZBwJzH7pSfgjawcMbF/hYw6iaKWDE/KQpJimp8pQxNtN/UvALf0mU
 DpMQ==
X-Gm-Message-State: AOJu0Yy6c9+J1mRav2vQQ0HO1ovzKTLn1WvWEQ/8lZoqVAg6CJLxCzMk
 dk7YY5c+P0EUDk8/oQn80w/p/ZiKwvK1sTBwZI78Wjp2rjSBqD+gXlYycDpDXG/rJlFrdYH9FJv
 XiA==
X-Google-Smtp-Source: AGHT+IF9lmrrr4mU6SQTATPg4BGae20+2RN2oYvd82uqtDRGSOWYN9hk+RN/G33dubnGu66mSB8E8A==
X-Received: by 2002:a05:600c:3c96:b0:426:8ee5:3e9c with SMTP id
 5b1f17b1804b1-4280b142f23mr4818455e9.6.1722253534535; 
 Mon, 29 Jul 2024 04:45:34 -0700 (PDT)
Received: from google.com (180.232.140.34.bc.googleusercontent.com.
 [34.140.232.180]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280574003bsm171998655e9.17.2024.07.29.04.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 04:45:34 -0700 (PDT)
Date: Mon, 29 Jul 2024 11:45:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Joerg Roedel <jroedel@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Message-ID: <ZqeA2tq5Nw4zvqwD@google.com>
References: <20240717163627.43423-1-robdclark@gmail.com>
 <20240717163627.43423-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717163627.43423-2-robdclark@gmail.com>
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

Hi Rob,

On Wed, Jul 17, 2024 at 09:36:21AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Joerg Roedel <jroedel@suse.de>
> 
> ---
>  drivers/iommu/io-pgtable-arm.c | 36 +++++++++++++++++++++++++---------
>  include/linux/io-pgtable.h     | 17 ++++++++++++++++
>  2 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 3d23b924cec1..e70803940b46 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -690,9 +690,11 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>  				data->start_level, ptep);
>  }
>  
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops,
> +				 unsigned long iova,
> +				 void *_wd)
>  {
> +	struct arm_lpae_io_pgtable_walk_data *wd = _wd;
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	arm_lpae_iopte pte, *ptep = data->pgd;
>  	int lvl = data->start_level;
> @@ -700,7 +702,7 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  	do {
>  		/* Valid IOPTE pointer? */
>  		if (!ptep)
> -			return 0;
> +			return -ENOENT;
>  
>  		/* Grab the IOPTE we're interested in */
>  		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> @@ -708,22 +710,37 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  
>  		/* Valid entry? */
>  		if (!pte)
> -			return 0;
> +			return -ENOENT;
>  
> -		/* Leaf entry? */
> +		wd->ptes[wd->level++] = pte;
> +
> +		/* Leaf entry?  If so, we've found the translation */
>  		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> +			return 0;
>  
>  		/* Take it to the next level */
>  		ptep = iopte_deref(pte, data);
>  	} while (++lvl < ARM_LPAE_MAX_LEVELS);
>  
>  	/* Ran out of page tables to walk */
> -	return 0;
> +	return -ENOENT;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct arm_lpae_io_pgtable_walk_data wd = {};
> +	int ret, lvl;
> +
> +	ret = arm_lpae_pgtable_walk(ops, iova, &wd);
> +	if (ret)
> +		return 0;
> +
> +	lvl = wd.level + data->start_level;
>  
> -found_translation:
>  	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> +	return iopte_to_paddr(wd.ptes[wd.level - 1], data) | iova;
>  }
>  
>  static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> @@ -804,6 +821,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  		.map_pages	= arm_lpae_map_pages,
>  		.unmap_pages	= arm_lpae_unmap_pages,
>  		.iova_to_phys	= arm_lpae_iova_to_phys,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>  	};
>  
>  	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86cf1f7ae389..df6f6e58310c 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -171,12 +171,28 @@ struct io_pgtable_cfg {
>  	};
>  };
>  
> +/**
> + * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
> + *
> + * @ptes:     The recorded PTE values from the walk
> + * @level:    The level of the last PTE
> + *
> + * @level also specifies the last valid index in @ptes
> + */
> +struct arm_lpae_io_pgtable_walk_data {
> +	u64 ptes[4];

I don’t see a reason to save the whole walk for iova_to_phys,
I see that the DRM driver uses those next, but I am worried that
won’t scale, a callback mechanism sounds better.

Also, there is a page table walker recently added to io-pagtable-arm,
for dirty bit tracking:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/io-pgtable-arm.c?id=4fe88fd8b4aecb7f9680bf898811db76b94095a9

I’d suggest consolidating those into one walker where each caller
has its own logic in a callback.

Thanks,
Mostafa

> +	int level;
> +};
> +
>  /**
>   * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
>   *
>   * @map_pages:    Map a physically contiguous range of pages of the same size.
>   * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
>   * @iova_to_phys: Translate iova to physical address.
> + * @pgtable_walk: (optional) Perform a page table walk for a given iova.  The
> + *                type for the wd parameter is specific to pgtable type, as
> + *                the PTE size and number of levels differs per pgtable type.
>   *
>   * These functions map directly onto the iommu_ops member functions with
>   * the same names.
> @@ -190,6 +206,7 @@ struct io_pgtable_ops {
>  			      struct iommu_iotlb_gather *gather);
>  	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
>  				    unsigned long iova);
> +	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
>  	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
>  				    unsigned long iova, size_t size,
>  				    unsigned long flags,
> -- 
> 2.45.2
> 
