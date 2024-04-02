Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555B8955CE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 15:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2CB10FD49;
	Tue,  2 Apr 2024 13:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PY5i6MYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC2610FD49
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712065935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0GvwTxmJS57usHRlKpbQjFbgE7SCS/lY2Gqtlc0/Ecs=;
 b=PY5i6MYjTZmfgyvdem6a7I8Sja7DFJVnDtyai2EwdygUnMzzJ+yXkS28f/Dti2pzV32F2K
 +6ZMK03VGvtYRfSsB7AYxc7FNtcvHX0Tv4UGsKRY0erT3JdEcg9/GL21VVWRhb0TFSTIdz
 DwOzKsK/3tDkV7xA75c7q5/NEnRCl+U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-cIJPhwzKNr2ULN8bh8q6Hg-1; Tue, 02 Apr 2024 09:52:12 -0400
X-MC-Unique: cIJPhwzKNr2ULN8bh8q6Hg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-41401f598cfso25564095e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 06:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712065931; x=1712670731;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0GvwTxmJS57usHRlKpbQjFbgE7SCS/lY2Gqtlc0/Ecs=;
 b=UD0YBVlqCAhJPMwCvH/rca9QztAKin/wcRLHmxpaNNeBEB417MuhchF1khHRLzDNPs
 xloV7TDrj7TjUnemZf+uO8zIItf7ptgAtzlejuPOLgA4bl2htqT4mkhWPjlhhJKasO/P
 FqHQHGvLHXTS1Jdt6VXPUp0oCuO3SovElGsGnJF8ZcA4YDdMk1cxwA0sr6FrkLCrgsci
 4K8P87vrwzSZTpCvRmG8+f0uig5ym203ZLIPBLp20db3Mk2s87uxSTVhPNvzOiYTfRlp
 gdpOebKu0SHN2pj5sxC/+QWQnl6F1AVbmLEAgsd7tKxPzFGhay/X9QejjI09+lHjyaHK
 djlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4O+OHljbjTayZEdmbamCx7esUJ6uXKfsdBuxuvfk51ZvfJCHLZxrsRwKZY5OnjktUY/WUrx0JB6z4AEU43yb3/YpO5ZZ/jYnsFdcKxnkT
X-Gm-Message-State: AOJu0Yy5Y6/CAZXmoMe7c3q1Ht3dEEyqBVJe7BRfuzD/J36zTA1mSgHq
 r8BG7ReIs4/U5+pMN60QSQcB903YUYYFrUjTvKx/nlW9EC0jiHuEaqVkmze7ypLyWZovcUGGSun
 86T8+ms/h4fBMUhTsw9SOA1uKURge+Te44cXfVyPdt4LRRdZTCLcQ4CcrDJABVmrAD8ZoZBuM4g
 ==
X-Received: by 2002:a05:6000:1241:b0:343:7b45:5f16 with SMTP id
 j1-20020a056000124100b003437b455f16mr402454wrx.23.1712065930958; 
 Tue, 02 Apr 2024 06:52:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiDU0F0IJAIlLQMZJmJdlSkWmNfSlJamuTPOAOyih4al9YKyqG25zWAqa5Z1M66awxFH0xIg==
X-Received: by 2002:a05:6000:1241:b0:343:7b45:5f16 with SMTP id
 j1-20020a056000124100b003437b455f16mr402432wrx.23.1712065930552; 
 Tue, 02 Apr 2024 06:52:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c732:e600:4982:2903:710f:f20a?
 (p200300cbc732e60049822903710ff20a.dip0.t-ipconnect.de.
 [2003:cb:c732:e600:4982:2903:710f:f20a])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adffa89000000b003435e1c0b78sm1970762wrr.28.2024.04.02.06.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 06:52:09 -0700 (PDT)
Message-ID: <54381897-35bc-442d-951d-b9a89f16b1a5@redhat.com>
Date: Tue, 2 Apr 2024 15:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/8] mm/gup: Introduce unpin_folio/unpin_folios helpers
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>
References: <20240225080008.1019653-1-vivek.kasireddy@intel.com>
 <20240225080008.1019653-2-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240225080008.1019653-2-vivek.kasireddy@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 25.02.24 08:56, Vivek Kasireddy wrote:
> These helpers are the folio versions of unpin_user_page/unpin_user_pages.
> They are currently only useful for unpinning folios pinned by
> memfd_pin_folios() or other associated routines. However, they could
> find new uses in the future, when more and more folio-only helpers
> are added to GUP.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   include/linux/mm.h |  2 ++
>   mm/gup.c           | 81 ++++++++++++++++++++++++++++++++++++++++------
>   2 files changed, 74 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6f4825d82965..36e4c2b22600 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1601,11 +1601,13 @@ static inline void put_page(struct page *page)
>   #define GUP_PIN_COUNTING_BIAS (1U << 10)
>   
>   void unpin_user_page(struct page *page);
> +void unpin_folio(struct folio *folio);
>   void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
>   				 bool make_dirty);
>   void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>   				      bool make_dirty);
>   void unpin_user_pages(struct page **pages, unsigned long npages);
> +void unpin_folios(struct folio **folios, unsigned long nfolios);
>   
>   static inline bool is_cow_mapping(vm_flags_t flags)
>   {
> diff --git a/mm/gup.c b/mm/gup.c
> index df83182ec72d..0a45eda6aaeb 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -30,6 +30,23 @@ struct follow_page_context {
>   	unsigned int page_mask;
>   };
>   
> +static inline void sanity_check_pinned_folios(struct folio **folios,
> +					      unsigned long nfolios)
> +{
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> +		return;
> +
> +	for (; nfolios; nfolios--, folios++) {
> +		struct folio *folio = *folios;
> +
> +		if (is_zero_folio(folio) ||
> +		    !folio_test_anon(folio))
> +			continue;
> +
> +		VM_BUG_ON_FOLIO(!PageAnonExclusive(&folio->page), folio);

That change is wrong (and the split makes the check confusing).

It could be that the first subpage is no longer exclusive, but the given 
(sanity_check_pinned_pages() ) subpage is exclusive for large folios.

I suggest dropping that change, and instead, in 
unpin_folio()/unpin_folios(), reject any anon folios for now.

So, replace the sanity_check_pinned_folios() in unpin_folio() / 
unpin_folios() by a VM_WARN_ON(folio_test_anon(folio));

It will all be better once we have a single anon-exclusive flag per 
folio (which I am working on), but in the meantime, we really don't 
expect code that called pin_user_pages() to call unpin_folios().

[...]

>   
> +/**
> + * unpin_folio() - release a dma-pinned folio
> + * @folio:         pointer to folio to be released
> + *
> + * Folios that were pinned via memfd_pin_folios() or other similar routines
> + * must be released either using unpin_folio() or unpin_folios(). This is so
> + * that such folios can be separately tracked and uniquely handled.

I'd drop the last sentence; no need for apologies/explanations, this is 
simply how ;pinning works :)

> + */
> +void unpin_folio(struct folio *folio)
> +{
> +	sanity_check_pinned_folios(&folio, 1);
> +	gup_put_folio(folio, 1, FOLL_PIN);
> +}
> +EXPORT_SYMBOL(unpin_folio);

Can we restrict that to EXPORT_SYMBOL_GPL for now? memfd_pin_folios() 
uses EXPORT_SYMBOL_GPL...

> +
>   /**
>    * folio_add_pin - Try to get an additional pin on a pinned folio
>    * @folio: The folio to be pinned
> @@ -488,6 +516,41 @@ void unpin_user_pages(struct page **pages, unsigned long npages)
>   }
>   EXPORT_SYMBOL(unpin_user_pages);
>   
> +/**
> + * unpin_folios() - release an array of gup-pinned folios.
> + * @folios:  array of folios to be marked dirty and released.
> + * @nfolios: number of folios in the @folios array.
> + *
> + * For each folio in the @folios array, release the folio using unpin_folio().
> + *
> + * Please see the unpin_folio() documentation for details.
> + */
> +void unpin_folios(struct folio **folios, unsigned long nfolios)
> +{
> +	unsigned long i = 0, j;
> +
> +	/*
> +	 * If this WARN_ON() fires, then the system *might* be leaking folios
> +	 * (by leaving them pinned), but probably not. More likely, gup/pup
> +	 * returned a hard -ERRNO error to the caller, who erroneously passed
> +	 * it here.
> +	 */
> +	if (WARN_ON(IS_ERR_VALUE(nfolios)))
> +		return;
> +
> +	sanity_check_pinned_folios(folios, nfolios);
> +	while (i < nfolios) {
> +		for (j = i + 1; j < nfolios; j++)
> +			if (folios[i] != folios[j])
> +				break;
> +
> +		if (folios[i])
> +			gup_put_folio(folios[i], j - i, FOLL_PIN);
> +		i = j;
> +	}
> +}
> +EXPORT_SYMBOL(unpin_folios);

Same thought here.

-- 
Cheers,

David / dhildenb

