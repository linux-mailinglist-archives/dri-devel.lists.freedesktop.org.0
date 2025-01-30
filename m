Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5FA22DFB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7496D10E988;
	Thu, 30 Jan 2025 13:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="R6Ry2UGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419610E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:43:54 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so8117185e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738244633; x=1738849433; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ha66Iu6lse0aeaZq4IXkBsImhaaLmQUiLrfjz5cfLcs=;
 b=R6Ry2UGNXqPV9u8DTgBRWSouKxtfkx9hTmStoN9i7wCwoS0LZZWSI7vck8lsn693w2
 c2lQfEOfvff4Vfar3NvN8rVYJ+urC2+zFAg2RjbgZsWyiS0NZ2Z8REuuFqTlfcXYPfVz
 Hoqxgstiu9UDS9Z8BMy4ugDoK6tv+6spZEbg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738244633; x=1738849433;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ha66Iu6lse0aeaZq4IXkBsImhaaLmQUiLrfjz5cfLcs=;
 b=a/ArBOy7SaOVc72ncOFrRhYa9x7YbbnI5PTZGFckYTMUJQAAFhQbHO5jQVN8hbwCQK
 fwHgNE/vtn+pMqC5mTELpAiPsnif0qyR2pl9M1U39AE/Ic0SZYgCVxnFj+O1626W8TG2
 18U/73+HoOB0ISNeIJsEG4uhX7ASPxm8SZvrFiH+2ikw7XoCtlz6NcelJ+Gw8/LyOEcE
 50aZ1edlmPumgBG7zLW1RnoQ+EK5Hj4B/LvbKAu15gShP1nxBr9F5KQlqg9Wqp6W32Oq
 0GYg1kFJ+L4kev0FYSoWeYcsOAh61LmrTNNDqwXakmbPZ+LEMydHl4O0kozRs6HKfryS
 ontw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHTtlY5dUMHtB3XIXOI2G7sLSi5HowWD631qcCC6E+xsVLidrCwCYxuRN+HDQruUs08ilLbp8zkzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDtpbb4m+SS3hQrnsRZRtfvdV2b1vcrXigQLV3cJwPLnTZ8+sB
 QO9jPIe7SdC56EXqDojMrr5vYKsONOFQjOQi/qPkq5Zd+hrGGedZ5mA7NwlY2tA=
X-Gm-Gg: ASbGncsrS/RDB0Xslm81pL863fuIztgT2hW72XyLr/jsTpzyjSfeCfQUJPoUjD8cVLe
 eZC0IJJajp7CLc2cFazpCMbX9CSrgl4xjqfoMtgwlp6Jf82MsxwHJvj1TuYIg7g6/VMa7wfQm17
 hJtorzjgKMR9UoRVy4jZaDhjR1nAumADRD9gUNvaK+dASlJTNmliexziuWMnSYPXsmUxz+xgoax
 tz1q7Us7Cbedx+zgYSe/O5J4vHJYcKp5FfaYWNLRDChBfsAvvGESjKm5ECf1yfin+0IRFrSC0Y6
 rUeyn9gSXadualWcXm0hmG+CdRo=
X-Google-Smtp-Source: AGHT+IGPwbF4Ytpnf417QGIV7aWx0XKtwsuKOqBPTmJvh2JEm7/wX2JzW1AoBcF90cds5JkZfLV8kw==
X-Received: by 2002:a05:600c:4f83:b0:436:713b:cb31 with SMTP id
 5b1f17b1804b1-438dc3a904cmr60626675e9.3.1738244632903; 
 Thu, 30 Jan 2025 05:43:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2e384sm61161085e9.19.2025.01.30.05.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:43:52 -0800 (PST)
Date: Thu, 30 Jan 2025 14:43:50 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 06/12] mm: use single SWP_DEVICE_EXCLUSIVE entry type
Message-ID: <Z5uCFtyaDpcbHRoF@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-7-david@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Jan 29, 2025 at 12:54:04PM +0100, David Hildenbrand wrote:
> There is no need for the distinction anymore; let's merge the readable
> and writable device-exclusive entries into a single device-exclusive
> entry type.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Yeah I really don't think there's a need to track that on the cpu ptes.
Device should have write/dirty bits (which nouveau really should forward)
or defensively assume the page is always dirtied when clearing a pte.

Plus the entire point of device exclusive access is to support device
atomics, so in practice it's always a write access that dirties anyway.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/swap.h    |  7 +++----
>  include/linux/swapops.h | 27 ++++-----------------------
>  mm/mprotect.c           |  8 --------
>  mm/page_table_check.c   |  5 ++---
>  mm/rmap.c               |  2 +-
>  5 files changed, 10 insertions(+), 39 deletions(-)
> 
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 91b30701274e..9a48e79a0a52 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -74,14 +74,13 @@ static inline int current_is_kswapd(void)
>   * to a special SWP_DEVICE_{READ|WRITE} entry.
>   *
>   * When a page is mapped by the device for exclusive access we set the CPU page
> - * table entries to special SWP_DEVICE_EXCLUSIVE_* entries.
> + * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
>   */
>  #ifdef CONFIG_DEVICE_PRIVATE
> -#define SWP_DEVICE_NUM 4
> +#define SWP_DEVICE_NUM 3
>  #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>  #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
> -#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> -#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> +#define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
>  #else
>  #define SWP_DEVICE_NUM 0
>  #endif
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 96f26e29fefe..64ea151a7ae3 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -186,26 +186,16 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
>  }
>  
> -static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> +static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  {
> -	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
> -}
> -
> -static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> -{
> -	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
> +	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
>  }
>  
>  static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  {
> -	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
> -		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> +	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
>  }
>  
> -static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> -{
> -	return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
> -}
>  #else /* CONFIG_DEVICE_PRIVATE */
>  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>  {
> @@ -227,12 +217,7 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> -static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> -{
> -	return swp_entry(0, 0);
> -}
> -
> -static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> +static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  {
>  	return swp_entry(0, 0);
>  }
> @@ -242,10 +227,6 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> -static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> -{
> -	return false;
> -}
>  #endif /* CONFIG_DEVICE_PRIVATE */
>  
>  #ifdef CONFIG_MIGRATION
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 516b1d847e2c..9cb6ab7c4048 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -225,14 +225,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				newpte = swp_entry_to_pte(entry);
>  				if (pte_swp_uffd_wp(oldpte))
>  					newpte = pte_swp_mkuffd_wp(newpte);
> -			} else if (is_writable_device_exclusive_entry(entry)) {
> -				entry = make_readable_device_exclusive_entry(
> -							swp_offset(entry));
> -				newpte = swp_entry_to_pte(entry);
> -				if (pte_swp_soft_dirty(oldpte))
> -					newpte = pte_swp_mksoft_dirty(newpte);
> -				if (pte_swp_uffd_wp(oldpte))
> -					newpte = pte_swp_mkuffd_wp(newpte);
>  			} else if (is_pte_marker_entry(entry)) {
>  				/*
>  				 * Ignore error swap entries unconditionally,
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 509c6ef8de40..c2b3600429a0 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -196,9 +196,8 @@ EXPORT_SYMBOL(__page_table_check_pud_clear);
>  /* Whether the swap entry cached writable information */
>  static inline bool swap_cached_writable(swp_entry_t entry)
>  {
> -	return is_writable_device_exclusive_entry(entry) ||
> -	    is_writable_device_private_entry(entry) ||
> -	    is_writable_migration_entry(entry);
> +	return is_writable_device_private_entry(entry) ||
> +	       is_writable_migration_entry(entry);
>  }
>  
>  static inline void page_table_check_pte_flags(pte_t pte)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 49ffac6d27f8..65d9bbea16d0 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2470,7 +2470,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	 * do_swap_page() will trigger the conversion back while holding the
>  	 * folio lock.
>  	 */
> -	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
> +	entry = make_device_exclusive_entry(page_to_pfn(page));
>  	swp_pte = swp_entry_to_pte(entry);
>  	if (pte_soft_dirty(fw.pte))
>  		swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
