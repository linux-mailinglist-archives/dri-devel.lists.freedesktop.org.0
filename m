Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95133C96173
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E036D10E2EF;
	Mon,  1 Dec 2025 08:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dxEq43Yf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8CE10E039
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 02:43:47 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-640e065991dso2922722d50.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 18:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764557026; x=1765161826; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FgKmQ565+fVLpdIyWDHQSOr7KTCq34T31zq3f1iCjns=;
 b=dxEq43Yflf9+JDocvge/ZTfIc0tgPifiABrNyE2qjo5Q31huZ5nWu83HaYakcA7WxR
 rFW3vkuc9PPhWDBN8Ev1/W2z4yNzXXkGvyBvUogNLvuwVlok7+CwI/7jtuY32NEP+T3A
 qar5oolaRT/szufEWJ7eFWsuBUHSISPN/OFtEa7jzsJb4RWqlhYqHbdcOz2fIU6wFW48
 LFbg5c/A7nFchHQu0D1gIoC8+xFCBpqLBypBtg6JAibL0GdDhzHE9w0Z/4jo1D9OUULH
 xKB2ZwDUMhATSAuStC67Z2iDm1OXvIr/cm/dPIetirWqLRw8264GxNBFYgbz1eEVbVZl
 fdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764557026; x=1765161826;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgKmQ565+fVLpdIyWDHQSOr7KTCq34T31zq3f1iCjns=;
 b=uJZKy/+EIncw89gg6HXFNns/qWcyGScVhiU4CsKa+YLH0pnLGoi3rBY85qxRMq76Qj
 q7TIPJRiHq4qtf4j6JnVydZSJjL0nWWddKi8OkChLa5OBUbwrNT/sGo6U/tOVSkHj2uP
 PoBcDJuUxiTihZb2X1VbjfWgvCebazWJ4wWmDTq3MsmFTh47u5TbjSSWm88h65dAo7SP
 K2acsYXuOnELA0PnS4Oadp4x/MT7XGWD/a77BqQnORLWoCpzxGr4IuDC0GlyXP8MP4JD
 faj9673svd3PdMLwz0zxfS+p6EyOdmv2FEyCTNOzCU2Iat2YwKZ/GAeM7tIq8ndloFdr
 GDNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb8bg8NHEO5vcJnSFDZcBjHTS7MN1HOCvcXlToLn1sPW1W41o2gvK3Xv/us4TTlK+abT8LHTeQuQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRGNDwxCPq5cAn+5p+2yjT6Rzndl7DThdsis3tAiCVpEPzpKyx
 YQXFR7zymo/VC2YAXyAinIbjmmmj4Q+VaJRxy6ns4f+SX0eBv7TNAIaH
X-Gm-Gg: ASbGncuWdpLEva1w/zd9snVh+rFd37AIdcOnuq7YkzqFMQ9ubvzlN1gWr5Xaqw9HvqB
 qcZAZ4Tz372aFl1PRaoAeHGQpy4e0+Frh33EO1xT1VJjpHA2MnfwkJA+hjYKJOlsR1Dh2tYRlaR
 CHBYBQ3QLtUQuPQhK5P4wkNyU6bVojsrVMGpfz4NbyvvcAakL/MshW3Uadu4oTUlpb2CxCltXjb
 NJd6xDSb14FrLXS5zXRTpPb73nYqNEYhjCKLhRVzBlf1b0gzad2G0mt2pqOmmIizb0vXFMetHpX
 EU0/8P4zv4IbsOnP7A9be0oHFyLNUd7H7ufTryhLYgS3QWyOvLVAwH4vvmZOu6YMIaSc87bdIx/
 irGEic3ekhQVhejoprSzk8kGKN5owLKNaeNpKrJG/jAZZyDSBKwXJGymKJnK2DT+1VQtEym11N0
 8tB9lP/6+bjnnVmliEjPQnIOaNpsxsU9VqSZskGxRF9VXN75sLbtnUd/k=
X-Google-Smtp-Source: AGHT+IEftPLm4wwxMTV5S8HfduywFkxnzNagdp0uZjRVeMizo1texs4FhkEpOIkFK8yvV81AVPnx9A==
X-Received: by 2002:a05:690e:1519:b0:63f:25cc:112a with SMTP id
 956f58d0204a3-64302ab83fbmr26144911d50.54.1764557026026; 
 Sun, 30 Nov 2025 18:43:46 -0800 (PST)
Received: from laptop01 (2045061-002-static.lfytina2.metronetinc.net.
 [149.154.21.178]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad0d3f616sm43906407b3.1.2025.11.30.18.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 18:43:45 -0800 (PST)
Date: Sun, 30 Nov 2025 21:43:43 -0500
From: Chih-En Lin <shiyn.lin@gmail.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 apopple@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com,
 willy@infradead.org
Subject: Re: [RFC PATCH 4/6] mm: Add a new swap type for migration entries
 with device private PFNs
Message-ID: <20251201024343.GA9270@laptop01>
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <20251128044146.80050-5-jniethe@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128044146.80050-5-jniethe@nvidia.com>
X-Mailman-Approved-At: Mon, 01 Dec 2025 08:19:25 +0000
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

On Fri, Nov 28, 2025 at 03:41:44PM +1100, Jordan Niethe wrote:
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> normal PFN and must be handled separately.
> 
> When migrating a device private page a migration entry is created for
> that page - this includes the PFN for that page. Once device private
> PFNs exist in a different address space to regular PFNs we need to be
> able to determine which kind of PFN is in the entry so we can associate
> it with the correct page.
> 
> Introduce new swap types:
> 
>   - SWP_MIGRATION_DEVICE_READ
>   - SWP_MIGRATION_DEVICE_WRITE
>   - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE
> 
> These correspond to
> 
>   - SWP_MIGRATION_READ
>   - SWP_MIGRATION_WRITE
>   - SWP_MIGRATION_READ_EXCLUSIVE
> 
> except the swap entry contains a device private PFN.
> 
> The existing helpers such as is_writable_migration_entry() will still
> return true for a SWP_MIGRATION_DEVICE_WRITE entry.
> 
> Introduce new helpers such as
> is_writable_device_migration_private_entry() to disambiguate between a
> SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.
> 
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/swap.h    |  8 +++-
>  include/linux/swapops.h | 87 ++++++++++++++++++++++++++++++++++++++---
>  mm/memory.c             |  9 ++++-
>  mm/migrate.c            |  2 +-
>  mm/migrate_device.c     | 31 ++++++++++-----
>  mm/mprotect.c           | 21 +++++++---
>  mm/page_vma_mapped.c    |  2 +-
>  mm/pagewalk.c           |  3 +-
>  mm/rmap.c               | 32 ++++++++++-----
>  9 files changed, 161 insertions(+), 34 deletions(-)
> 
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index e818fbade1e2..87f14d673979 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
>   *
>   * When a page is mapped by the device for exclusive access we set the CPU page
>   * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
> + *
> + * Because device private pages do not use regular PFNs, special migration
> + * entries are also needed.
>   */
>  #ifdef CONFIG_DEVICE_PRIVATE
> -#define SWP_DEVICE_NUM 3
> +#define SWP_DEVICE_NUM 6
>  #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>  #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
>  #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
> +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
>  #else
>  #define SWP_DEVICE_NUM 0
>  #endif
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 64ea151a7ae3..7aa3f00e304a 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -196,6 +196,43 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
>  }
>  
> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
> +}
> +
> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
> +}
> +
> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
> +			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
> +			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> +}
> +
> +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
> +}
> +
> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> +}
> +
> +static inline swp_entry_t make_device_migration_readable_exclusive_migration_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
> +}
> +
> +static inline bool is_device_migration_readable_exclusive_entry(swp_entry_t entry)
> +{
> +	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
> +}

The names are inconsistent.

Maybe make_device_migration_readable_exclusive_migration_entry to
make_readable_exclusive_migration_device_private_entry, and
is_device_migration_readable_exclusive_entry to
is_readable_exclusive_device_private_migration_entry?


>  #else /* CONFIG_DEVICE_PRIVATE */
>  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>  {
> @@ -217,6 +254,11 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
>  static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  {
>  	return swp_entry(0, 0);
> @@ -227,6 +269,36 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
> +static inline swp_entry_t make_device_migration_readable_exclusive_migration_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline bool is_device_migration_readable_exclusive_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_DEVICE_PRIVATE */
>  
>  #ifdef CONFIG_MIGRATION
> @@ -234,22 +306,26 @@ static inline int is_migration_entry(swp_entry_t entry)
>  {
>  	return unlikely(swp_type(entry) == SWP_MIGRATION_READ ||
>  			swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE ||
> -			swp_type(entry) == SWP_MIGRATION_WRITE);
> +			swp_type(entry) == SWP_MIGRATION_WRITE ||
> +			is_device_private_migration_entry(entry));
>  }
>  
>  static inline int is_writable_migration_entry(swp_entry_t entry)
>  {
> -	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE ||
> +			is_writable_device_migration_private_entry(entry));
>  }
>  
>  static inline int is_readable_migration_entry(swp_entry_t entry)
>  {
> -	return unlikely(swp_type(entry) == SWP_MIGRATION_READ);
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_READ ||
> +			is_readable_device_migration_private_entry(entry));
>  }
>  
>  static inline int is_readable_exclusive_migration_entry(swp_entry_t entry)
>  {
> -	return unlikely(swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE);
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE ||
> +			is_device_migration_readable_exclusive_entry(entry));
>  }
>  
>  static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
> @@ -525,7 +601,8 @@ static inline bool is_pfn_swap_entry(swp_entry_t entry)
>  	BUILD_BUG_ON(SWP_TYPE_SHIFT < SWP_PFN_BITS);
>  
>  	return is_migration_entry(entry) || is_device_private_entry(entry) ||
> -	       is_device_exclusive_entry(entry) || is_hwpoison_entry(entry);
> +	       is_device_exclusive_entry(entry) || is_hwpoison_entry(entry) ||
> +	       is_device_private_migration_entry(entry);
>  }
>  
>  struct page_vma_mapped_walk;
> diff --git a/mm/memory.c b/mm/memory.c
> index b59ae7ce42eb..f1ed361434ff 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -962,8 +962,13 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  			 * to be set to read. A previously exclusive entry is
>  			 * now shared.
>  			 */
> -			entry = make_readable_migration_entry(
> -							swp_offset(entry));
> +			if (is_device_private_migration_entry(entry))
> +				entry = make_readable_migration_device_private_entry(
> +								swp_offset(entry));
> +			else
> +				entry = make_readable_migration_entry(
> +								swp_offset(entry));
> +
>  			pte = swp_entry_to_pte(entry);
>  			if (pte_swp_soft_dirty(orig_pte))
>  				pte = pte_swp_mksoft_dirty(pte);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index c0e9f15be2a2..3c561d61afba 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -495,7 +495,7 @@ void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
>  		goto out;
>  
>  	entry = pte_to_swp_entry(pte);
> -	if (!is_migration_entry(entry))
> +	if (!(is_migration_entry(entry)))
>  		goto out;
>  
>  	migration_entry_wait_on_locked(entry, ptl);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 82f09b24d913..458b5114bb2b 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -235,15 +235,28 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				folio_mark_dirty(folio);
>  
>  			/* Setup special migration page table entry */
> -			if (mpfn & MIGRATE_PFN_WRITE)
> -				entry = make_writable_migration_entry(
> -							page_to_pfn(page));
> -			else if (anon_exclusive)
> -				entry = make_readable_exclusive_migration_entry(
> -							page_to_pfn(page));
> -			else
> -				entry = make_readable_migration_entry(
> -							page_to_pfn(page));
> +			if (mpfn & MIGRATE_PFN_WRITE) {
> +				if (is_device_private_page(page))
> +					entry = make_writable_migration_device_private_entry(
> +								page_to_pfn(page));
> +				else
> +					entry = make_writable_migration_entry(
> +								page_to_pfn(page));
> +			} else if (anon_exclusive) {
> +				if (is_device_private_page(page))
> +					entry = make_device_migration_readable_exclusive_migration_entry(
> +								page_to_pfn(page));
> +				else
> +					entry = make_readable_exclusive_migration_entry(
> +								page_to_pfn(page));
> +			} else {
> +				if (is_device_private_page(page))
> +					entry = make_readable_migration_device_private_entry(
> +								page_to_pfn(page));
> +				else
> +					entry = make_readable_migration_entry(
> +								page_to_pfn(page));
> +			}
>  			if (pte_present(pte)) {
>  				if (pte_young(pte))
>  					entry = make_migration_entry_young(entry);
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 113b48985834..7d79a0f53bf5 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -365,11 +365,22 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 * A protection check is difficult so
>  				 * just be safe and disable write
>  				 */
> -				if (folio_test_anon(folio))
> -					entry = make_readable_exclusive_migration_entry(
> -							     swp_offset(entry));
> -				else
> -					entry = make_readable_migration_entry(swp_offset(entry));
> +				if (!is_writable_device_migration_private_entry(entry)) {
> +					if (folio_test_anon(folio))
> +						entry = make_readable_exclusive_migration_entry(
> +								swp_offset(entry));
> +					else
> +						entry = make_readable_migration_entry(
> +								swp_offset(entry));
> +				} else {
> +					if (folio_test_anon(folio))
> +						entry = make_device_migration_readable_exclusive_migration_entry(
> +								swp_offset(entry));
> +					else
> +						entry = make_readable_migration_device_private_entry(
> +								swp_offset(entry));
> +				}
> +
>  				newpte = swp_entry_to_pte(entry);
>  				if (pte_swp_soft_dirty(oldpte))
>  					newpte = pte_swp_mksoft_dirty(newpte);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 9146bd084435..e9fe747d3df3 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -112,7 +112,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>  			return false;
>  		entry = pte_to_swp_entry(ptent);
>  
> -		if (!is_migration_entry(entry))
> +		if (!(is_migration_entry(entry)))
>  			return false;
>  
>  		pfn = swp_offset_pfn(entry);
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index 9f91cf85a5be..f5c77dda3359 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -1003,7 +1003,8 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  		swp_entry_t entry = pte_to_swp_entry(pte);
>  
>  		if ((flags & FW_MIGRATION) &&
> -		    is_migration_entry(entry)) {
> +		    (is_migration_entry(entry) ||
> +		     is_device_private_migration_entry(entry))) {
>  			page = pfn_swap_entry_to_page(entry);
>  			expose_page = false;
>  			goto found;
> diff --git a/mm/rmap.c b/mm/rmap.c
> index e94500318f92..9642a79cbdb4 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2535,15 +2535,29 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>  			 * pte. do_swap_page() will wait until the migration
>  			 * pte is removed and then restart fault handling.
>  			 */
> -			if (writable)
> -				entry = make_writable_migration_entry(
> -							page_to_pfn(subpage));
> -			else if (anon_exclusive)
> -				entry = make_readable_exclusive_migration_entry(
> -							page_to_pfn(subpage));
> -			else
> -				entry = make_readable_migration_entry(
> -							page_to_pfn(subpage));
> +			if (writable) {
> +				if (is_device_private_page(subpage))
> +					entry = make_writable_migration_device_private_entry(
> +								page_to_pfn(subpage));
> +				else
> +					entry = make_writable_migration_entry(
> +								page_to_pfn(subpage));
> +			} else if (anon_exclusive) {
> +				if (is_device_private_page(subpage))
> +					entry = make_device_migration_readable_exclusive_migration_entry(
> +								page_to_pfn(subpage));
> +				else
> +					entry = make_readable_exclusive_migration_entry(
> +								page_to_pfn(subpage));
> +			} else {
> +				if (is_device_private_page(subpage))
> +					entry = make_readable_migration_device_private_entry(
> +								page_to_pfn(subpage));
> +				else
> +					entry = make_readable_migration_entry(
> +								page_to_pfn(subpage));
> +			}
> +
>  			if (likely(pte_present(pteval))) {
>  				if (pte_young(pteval))
>  					entry = make_migration_entry_young(entry);
> -- 
> 2.34.1
> 

Thanks,
Chih-En Lin
