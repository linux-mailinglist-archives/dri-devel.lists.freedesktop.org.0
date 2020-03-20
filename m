Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0E18DA82
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 22:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8331C6EB6F;
	Fri, 20 Mar 2020 21:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9F89F07;
 Fri, 20 Mar 2020 21:46:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7539730003>; Fri, 20 Mar 2020 14:45:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Mar 2020 14:46:14 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Mar 2020 14:46:14 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 20 Mar 2020 21:46:12 +0000
Subject: Re: [PATCH hmm 3/6] mm/hmm: remove unused code and tidy comments
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <20200320164905.21722-4-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <7d7e5bad-8956-775b-1a4c-c927b2464459@nvidia.com>
Date: Fri, 20 Mar 2020 14:46:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200320164905.21722-4-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584740724; bh=+X1JGG4+QMXK6G9/IAxJDpgA8uR55yF4OsGYSCBJdFQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ktMIhEZRV7Nhp96Xmyyq8bdJDe638gC4klq7PflP6NiRhM/teulzQa0IpAp0Lrp2h
 +Q5OEwusEXrxkbtU1hadGh73+wku0//yzkHIPjyST++/MleaCT+jBDc2C3Mi6dRmNW
 d4PIvhpDc8zPfNWvBLvqOfp2FDFyaCQ4yjdNdDFkddPCKPd55ffZl4TYwSKOOwzDF+
 2IEihBxWwAke7G7DogpOK1htMg8kfKqnkxRevcVpC28swpXekssUahC2ry+Ja3op+j
 FXT2FriabKuUiKWN9Q/p2AAMha4tDzFi6TjoelBxLCHazhlQ2o3xhiDsMD8zalAVjc
 xbFd0aH+sGU4Q==
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/20/20 9:49 AM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> Delete several functions that are never called, fix some desync between
> comments and structure content, remove an unused ret, and move one
> function only used by hmm.c into hmm.c
> 
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   include/linux/hmm.h | 50 ---------------------------------------------
>   mm/hmm.c            | 12 +++++++++++
>   2 files changed, 12 insertions(+), 50 deletions(-)
> 
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index bb6be4428633a8..184a8633260f9d 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -120,9 +120,6 @@ enum hmm_pfn_value_e {
>    *
>    * @notifier: a mmu_interval_notifier that includes the start/end
>    * @notifier_seq: result of mmu_interval_read_begin()
> - * @hmm: the core HMM structure this range is active against
> - * @vma: the vm area struct for the range
> - * @list: all range lock are on a list
>    * @start: range virtual start address (inclusive)
>    * @end: range virtual end address (exclusive)
>    * @pfns: array of pfns (big enough for the range)
> @@ -131,7 +128,6 @@ enum hmm_pfn_value_e {
>    * @default_flags: default flags for the range (write, read, ... see hmm doc)
>    * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
>    * @pfn_shifts: pfn shift value (should be <= PAGE_SHIFT)

s/pfn_shifts/pfn_shift

> - * @valid: pfns array did not change since it has been fill by an HMM function
>    * @dev_private_owner: owner of device private pages
>    */
>   struct hmm_range {
> @@ -171,52 +167,6 @@ static inline struct page *hmm_device_entry_to_page(const struct hmm_range *rang
>   	return pfn_to_page(entry >> range->pfn_shift);
>   }
>   
> -/*
> - * hmm_device_entry_to_pfn() - return pfn value store in a device entry
> - * @range: range use to decode device entry value
> - * @entry: device entry to extract pfn from
> - * Return: pfn value if device entry is valid, -1UL otherwise
> - */
> -static inline unsigned long
> -hmm_device_entry_to_pfn(const struct hmm_range *range, uint64_t pfn)
> -{
> -	if (pfn == range->values[HMM_PFN_NONE])
> -		return -1UL;
> -	if (pfn == range->values[HMM_PFN_ERROR])
> -		return -1UL;
> -	if (pfn == range->values[HMM_PFN_SPECIAL])
> -		return -1UL;
> -	if (!(pfn & range->flags[HMM_PFN_VALID]))
> -		return -1UL;
> -	return (pfn >> range->pfn_shift);
> -}
> -
> -/*
> - * hmm_device_entry_from_page() - create a valid device entry for a page
> - * @range: range use to encode HMM pfn value
> - * @page: page for which to create the device entry
> - * Return: valid device entry for the page
> - */
> -static inline uint64_t hmm_device_entry_from_page(const struct hmm_range *range,
> -						  struct page *page)
> -{
> -	return (page_to_pfn(page) << range->pfn_shift) |
> -		range->flags[HMM_PFN_VALID];
> -}
> -
> -/*
> - * hmm_device_entry_from_pfn() - create a valid device entry value from pfn
> - * @range: range use to encode HMM pfn value
> - * @pfn: pfn value for which to create the device entry
> - * Return: valid device entry for the pfn
> - */
> -static inline uint64_t hmm_device_entry_from_pfn(const struct hmm_range *range,
> -						 unsigned long pfn)
> -{
> -	return (pfn << range->pfn_shift) |
> -		range->flags[HMM_PFN_VALID];
> -}
> -
>   /* Don't fault in missing PTEs, just snapshot the current state. */
>   #define HMM_FAULT_SNAPSHOT		(1 << 1)
>   
> diff --git a/mm/hmm.c b/mm/hmm.c
> index b4f662eadb7a7c..687d21c675ee60 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -37,6 +37,18 @@ enum {
>   	NEED_WRITE_FAULT = 1 << 1,
>   };
>   
> +/*
> + * hmm_device_entry_from_pfn() - create a valid device entry value from pfn
> + * @range: range use to encode HMM pfn value
> + * @pfn: pfn value for which to create the device entry
> + * Return: valid device entry for the pfn
> + */
> +static uint64_t hmm_device_entry_from_pfn(const struct hmm_range *range,
> +					  unsigned long pfn)
> +{
> +	return (pfn << range->pfn_shift) | range->flags[HMM_PFN_VALID];
> +}
> +
>   static int hmm_pfns_fill(unsigned long addr, unsigned long end,
>   		struct hmm_range *range, enum hmm_pfn_value_e value)
>   {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
