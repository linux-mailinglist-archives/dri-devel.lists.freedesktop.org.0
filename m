Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B411C4B05
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 02:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA686E113;
	Tue,  5 May 2020 00:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888486E10C;
 Tue,  5 May 2020 00:23:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eb0b1940000>; Mon, 04 May 2020 17:21:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 17:23:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 May 2020 17:23:48 -0700
Received: from [10.2.56.198] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 00:23:47 +0000
Subject: Re: [PATCH hmm v2 4/5] mm/hmm: remove HMM_PFN_SPECIAL
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>, Ralph Campbell
 <rcampbell@nvidia.com>
References: <4-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <11e39f2e-e244-a75f-15f4-83d2f5dd2f26@nvidia.com>
Date: Mon, 4 May 2020 17:23:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588638100; bh=LbTFGAO939OtgC3J478q1/lLZNcOmbmZm/bb6JPA+3g=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=qw4J8O9R40LD/qwoUcwvvA/9rtpnX8IImDRS9vHOyZrJtm90MVganf/mHpIZLk1G2
 TAaZxWVsiQD4LfvXhom5hDALdA1n9rwzM/TX7FVswoGDDHCxrarRiboHsnvtRGwfaB
 XKUfU9+NeTQ12kJUC1MpdFE2FpDUzqsBAAJ2qH76Gr+U2Wn+OGtNJBOQeTAFsxD7Xb
 hzwEziNt+xMaVGWJ2xKZIj1gPJ5+BVHFfaGuaAaky5NcasEmrfLU4+U+l+TVi4bLUh
 O7o5uuDV8EwCSq3Qst8WqzmyAaKwQMM7ipuSr9hNn9vnKmA4K1RyrTUleAA0KmoAm6
 HX5++tYtaWNGw==
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
Cc: amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-01 11:20, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> This is just an alias for HMM_PFN_ERROR, nothing cares that the error was
> because of a special page vs any other error case.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA
> 
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 -
>   drivers/gpu/drm/nouveau/nouveau_svm.c   | 1 -
>   include/linux/hmm.h                     | 8 --------
>   mm/hmm.c                                | 2 +-
>   4 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 41ae7f96f48194..76b4a4fa39ed04 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -775,7 +775,6 @@ static const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] = {
>   static const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] = {
>   	0xfffffffffffffffeUL, /* HMM_PFN_ERROR */
>   	0, /* HMM_PFN_NONE */
> -	0xfffffffffffffffcUL /* HMM_PFN_SPECIAL */
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index c68e9317cf0740..cf0d9bd61bebf9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -379,7 +379,6 @@ static const u64
>   nouveau_svm_pfn_values[HMM_PFN_VALUE_MAX] = {
>   	[HMM_PFN_ERROR  ] = ~NVIF_VMM_PFNMAP_V0_V,
>   	[HMM_PFN_NONE   ] =  NVIF_VMM_PFNMAP_V0_NONE,
> -	[HMM_PFN_SPECIAL] = ~NVIF_VMM_PFNMAP_V0_V,
>   };
>   
>   /* Issue fault replay for GPU to retry accesses that faulted previously. */
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 0df27dd03d53d7..81c302c884c0e3 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -44,10 +44,6 @@ enum hmm_pfn_flag_e {
>    * Flags:
>    * HMM_PFN_ERROR: corresponding CPU page table entry points to poisoned memory
>    * HMM_PFN_NONE: corresponding CPU page table entry is pte_none()
> - * HMM_PFN_SPECIAL: corresponding CPU page table entry is special; i.e., the
> - *      result of vmf_insert_pfn() or vm_insert_page(). Therefore, it should not
> - *      be mirrored by a device, because the entry will never have HMM_PFN_VALID
> - *      set and the pfn value is undefined.
>    *
>    * Driver provides values for none entry, error entry, and special entry.
>    * Driver can alias (i.e., use same value) error and special, but
> @@ -56,12 +52,10 @@ enum hmm_pfn_flag_e {
>    * HMM pfn value returned by hmm_vma_get_pfns() or hmm_vma_fault() will be:
>    * hmm_range.values[HMM_PFN_ERROR] if CPU page table entry is poisonous,
>    * hmm_range.values[HMM_PFN_NONE] if there is no CPU page table entry,
> - * hmm_range.values[HMM_PFN_SPECIAL] if CPU page table entry is a special one
>    */
>   enum hmm_pfn_value_e {
>   	HMM_PFN_ERROR,
>   	HMM_PFN_NONE,
> -	HMM_PFN_SPECIAL,
>   	HMM_PFN_VALUE_MAX
>   };
>   
> @@ -110,8 +104,6 @@ static inline struct page *hmm_device_entry_to_page(const struct hmm_range *rang
>   		return NULL;
>   	if (entry == range->values[HMM_PFN_ERROR])
>   		return NULL;
> -	if (entry == range->values[HMM_PFN_SPECIAL])
> -		return NULL;
>   	if (!(entry & range->flags[HMM_PFN_VALID]))
>   		return NULL;
>   	return pfn_to_page(entry >> range->pfn_shift);
> diff --git a/mm/hmm.c b/mm/hmm.c
> index f06bcac948a79b..2e975eedb14f89 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -301,7 +301,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   			pte_unmap(ptep);
>   			return -EFAULT;
>   		}
> -		*pfn = range->values[HMM_PFN_SPECIAL];
> +		*pfn = range->values[HMM_PFN_ERROR];
>   		return 0;
>   	}
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
