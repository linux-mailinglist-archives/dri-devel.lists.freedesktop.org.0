Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E2895691
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E617210F6C4;
	Tue,  2 Apr 2024 14:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JzT/y9nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7487510F6C4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712067993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HXRnD9lfEKmNnojFdS56xW3Fz8f99DyVSqoVxzJi32k=;
 b=JzT/y9nfe1tDyCmKDc4GnMYdL3NLtsMabdE0slN3MdMu+RXGa8W1ryfV5D5lIjvV+GaoaQ
 NwHmh3PqTXfXz+U5LwAilSlPZlULB0dH1izFOTTDBraCntaGTAoDGIUy8Sm3xo70+nG0+U
 jw29N9FFN7BQmJBwiCNYVkn2GX1J/r4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-RJZrhlvLMR2qZ1Hczy0_vA-1; Tue, 02 Apr 2024 10:26:31 -0400
X-MC-Unique: RJZrhlvLMR2qZ1Hczy0_vA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41493ba3fcbso23334385e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 07:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067990; x=1712672790;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HXRnD9lfEKmNnojFdS56xW3Fz8f99DyVSqoVxzJi32k=;
 b=TflvN9UnYaL7UP5539aDuB6azOsDj6vE+vhSFFcWJX83uMLTc5lO1W7fdcpqcfJlNU
 uXvLYFwepotK7tu2Q6uAH8dWZw+rpY2WFdBxyuXep3EX1Wp8VzJLCC7D82pjp2RVfSoz
 st26e61i2JKogmfEXBolQGj5ivYRbxL+znaTpphxVP+M6GbSamc7xrMtANFFtetMfYkB
 /+Ra3/fLDqHaSFfzdKtauI4Rol/pXVhOYyXYCILTgZMCOTu5jNvk1Pp9SQCMtRn6ahfz
 ksyr0MeIYFiDeMzpL0Df5hZ20+uHiiyI8MvQ5/qkVDjkdJI36r87Er8HFO5iIGy7lOmJ
 tLRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTxVP1rqiW45GprfT2mMnBUehWze8S6Yo0kTYjl9+g/20z4zEdrAo8EU70MCyUStef+LfI9IKCQjAfV/7WAD1CS/1O7TTvjCuLTrLyXEOh
X-Gm-Message-State: AOJu0Yx3C/u8e5HJOI9NuJYEcNWQlJeL/YxlQjSU6MV5JDgtiPC86UGN
 jS7SDdAMC/jJ6jXcVIkzhAg31khhEzAp0gx6wemhxNTpQlGFo9I/IBCRieKYXxyJ/yGzro0hvk5
 1kmI+nkhzeDmQItM7dwFse0zRJjlixtAkf9aVM/wqNqoJScMXqykBpmsfcadoEZHV7r2Dpcr8TA
 ==
X-Received: by 2002:a05:600c:1f85:b0:414:5ec3:8fcb with SMTP id
 je5-20020a05600c1f8500b004145ec38fcbmr10818621wmb.23.1712067990655; 
 Tue, 02 Apr 2024 07:26:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdWLqQJKk60fsFxov4KZYdp9krKsAU0iQGX4o7aTOoHflRqJNldmdVgf0ZbaTGScE21RvLZA==
X-Received: by 2002:a05:600c:1f85:b0:414:5ec3:8fcb with SMTP id
 je5-20020a05600c1f8500b004145ec38fcbmr10818593wmb.23.1712067990142; 
 Tue, 02 Apr 2024 07:26:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c732:e600:4982:2903:710f:f20a?
 (p200300cbc732e60049822903710ff20a.dip0.t-ipconnect.de.
 [2003:cb:c732:e600:4982:2903:710f:f20a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c470e00b00415f496b9b7sm2516777wmo.39.2024.04.02.07.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:26:29 -0700 (PDT)
Message-ID: <ef35a210-199e-44db-8361-d2d7a5d5b950@redhat.com>
Date: Tue, 2 Apr 2024 16:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/8] mm/gup: Introduce
 check_and_migrate_movable_folios()
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>
References: <20240225080008.1019653-1-vivek.kasireddy@intel.com>
 <20240225080008.1019653-3-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240225080008.1019653-3-vivek.kasireddy@intel.com>
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
> This helper is the folio equivalent of check_and_migrate_movable_pages().
> Therefore, all the rules that apply to check_and_migrate_movable_pages()
> also apply to this one as well. Currently, this helper is only used by
> memfd_pin_folios().
> 
> This patch also includes changes to rename and convert the internal
> functions collect_longterm_unpinnable_pages() and
> migrate_longterm_unpinnable_pages() to work on folios. Since they
> are also used by check_and_migrate_movable_pages(), a temporary
> array is used to collect and share the folios with these functions.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   mm/gup.c | 129 +++++++++++++++++++++++++++++++++++++++----------------
>   1 file changed, 92 insertions(+), 37 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 0a45eda6aaeb..1410af954a4e 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2099,20 +2099,24 @@ struct page *get_dump_page(unsigned long addr)
>   
>   #ifdef CONFIG_MIGRATION
>   /*
> - * Returns the number of collected pages. Return value is always >= 0.
> + * Returns the number of collected folios. Return value is always >= 0.
>    */
> -static unsigned long collect_longterm_unpinnable_pages(
> -					struct list_head *movable_page_list,
> -					unsigned long nr_pages,
> +static unsigned long collect_longterm_unpinnable_folios(
> +					struct list_head *movable_folio_list,
> +					unsigned long nr_folios,
> +					struct folio **folios,
>   					struct page **pages)

This function really shouldn't consume both folios and pages.

Either use "folios" and handle the conversion from pages->folios in the 
caller, or handle it similar to release_pages() where we can pass either 
and simply always do page_folio() on the given pointer, using 
essentially an abstracted pointer type and always calling page_folio() 
on that thing.

The easiest is likely to just do the page->folio conversion in the 
caller by looping over the arrays once more. See below.

Temporary memory allocation can be avoided by using an abstracted 
pointer type.

[...]

>   
> +		folio = folios[i];
>   		if (folio == prev_folio)
>   			continue;
>   		prev_folio = folio;
> @@ -2126,7 +2130,7 @@ static unsigned long collect_longterm_unpinnable_pages(
>   			continue;
>   
>   		if (folio_test_hugetlb(folio)) {
> -			isolate_hugetlb(folio, movable_page_list);
> +			isolate_hugetlb(folio, movable_folio_list);
>   			continue;
>   		}
>   
> @@ -2138,7 +2142,7 @@ static unsigned long collect_longterm_unpinnable_pages(
>   		if (!folio_isolate_lru(folio))
>   			continue;
>   
> -		list_add_tail(&folio->lru, movable_page_list);
> +		list_add_tail(&folio->lru, movable_folio_list);
>   		node_stat_mod_folio(folio,
>   				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
>   				    folio_nr_pages(folio));
> @@ -2148,27 +2152,28 @@ static unsigned long collect_longterm_unpinnable_pages(
>   }
>   
>   /*
> - * Unpins all pages and migrates device coherent pages and movable_page_list.
> - * Returns -EAGAIN if all pages were successfully migrated or -errno for failure
> - * (or partial success).
> + * Unpins all folios and migrates device coherent folios and movable_folio_list.
> + * Returns -EAGAIN if all folios were successfully migrated or -errno for
> + * failure (or partial success).
>    */
> -static int migrate_longterm_unpinnable_pages(
> -					struct list_head *movable_page_list,
> -					unsigned long nr_pages,
> -					struct page **pages)
> +static int migrate_longterm_unpinnable_folios(
> +					struct list_head *movable_folio_list,
> +					unsigned long nr_folios,
> +					struct folio **folios)
>   {
>   	int ret;
>   	unsigned long i;
>   
> -	for (i = 0; i < nr_pages; i++) {
> -		struct folio *folio = page_folio(pages[i]);
> +	for (i = 0; i < nr_folios; i++) {
> +		struct folio *folio = folios[i];
>   
>   		if (folio_is_device_coherent(folio)) {
>   			/*
> -			 * Migration will fail if the page is pinned, so convert
> -			 * the pin on the source page to a normal reference.
> +			 * Migration will fail if the folio is pinned, so
> +			 * convert the pin on the source folio to a normal
> +			 * reference.
>   			 */
> -			pages[i] = NULL;
> +			folios[i] = NULL;
>   			folio_get(folio);
>   			gup_put_folio(folio, 1, FOLL_PIN);
>   
> @@ -2181,23 +2186,23 @@ static int migrate_longterm_unpinnable_pages(
>   		}
>   
>   		/*
> -		 * We can't migrate pages with unexpected references, so drop
> +		 * We can't migrate folios with unexpected references, so drop
>   		 * the reference obtained by __get_user_pages_locked().
> -		 * Migrating pages have been added to movable_page_list after
> +		 * Migrating folios have been added to movable_folio_list after
>   		 * calling folio_isolate_lru() which takes a reference so the
> -		 * page won't be freed if it's migrating.
> +		 * folio won't be freed if it's migrating.
>   		 */
> -		unpin_user_page(pages[i]);
> -		pages[i] = NULL;
> +		unpin_folio(folios[i]);

Aha, that's where you call unpin_folio() on an anon folio. Then simply 
drop the sanity check from inside unpin_folio() in patch #1.

> +		folios[i] = NULL;
>   	}
>   
> -	if (!list_empty(movable_page_list)) {
> +	if (!list_empty(movable_folio_list)) {
>   		struct migration_target_control mtc = {
>   			.nid = NUMA_NO_NODE,
>   			.gfp_mask = GFP_USER | __GFP_NOWARN,
>   		};
>   
> -		if (migrate_pages(movable_page_list, alloc_migration_target,
> +		if (migrate_pages(movable_folio_list, alloc_migration_target,
>   				  NULL, (unsigned long)&mtc, MIGRATE_SYNC,
>   				  MR_LONGTERM_PIN, NULL)) {
>   			ret = -ENOMEM;
> @@ -2205,15 +2210,15 @@ static int migrate_longterm_unpinnable_pages(
>   		}
>   	}
>   
> -	putback_movable_pages(movable_page_list);
> +	putback_movable_pages(movable_folio_list);

This really needs a cleanup (independent of your work). We should rename 
it to putback_movable_folios: it only operates on folios.

>   
>   	return -EAGAIN;
>   
>   err:
> -	for (i = 0; i < nr_pages; i++)
> -		if (pages[i])
> -			unpin_user_page(pages[i]);
> -	putback_movable_pages(movable_page_list);
> +	for (i = 0; i < nr_folios; i++)
> +		if (folios[i])
> +			unpin_folio(folios[i]);

Can unpin_folios() be used?

> +	putback_movable_pages(movable_folio_list);
>   
>   	return ret;
>   }
> @@ -2237,16 +2242,60 @@ static int migrate_longterm_unpinnable_pages(
>   static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   					    struct page **pages)
>   {
> +	unsigned long nr_folios = nr_pages;
>   	unsigned long collected;
> -	LIST_HEAD(movable_page_list);
> +	LIST_HEAD(movable_folio_list);
> +	struct folio **folios;
> +	long ret;
>   
> -	collected = collect_longterm_unpinnable_pages(&movable_page_list,
> -						nr_pages, pages);
> +	folios = kmalloc_array(nr_folios, sizeof(*folios), GFP_KERNEL);
> +	if (!folios)
> +		return -ENOMEM;
> +
> +	collected = collect_longterm_unpinnable_folios(&movable_folio_list,
> +						       nr_folios, folios,
> +						       pages);
> +	if (!collected) {
> +		kfree(folios);
> +		return 0;
> +	}
> +
> +	ret = migrate_longterm_unpinnable_folios(&movable_folio_list,
> +						 nr_folios, folios);
> +	kfree(folios);
> +	return ret;


This function should likely be a pure rapper around 
check_and_migrate_movable_folios(). For example:

static long check_and_migrate_movable_pages(unsigned long nr_pages,
					    struct page **pages)
{
	struct folio **folios;
	long ret;

	folios = kmalloc_array(nr_folios, sizeof(*folios), GFP_KERNEL);
	if (!folios)
		return -ENOMEM;

	/* TODO, convert all pages to folios. */

	ret = check_and_migrate_movable_folios(nr_folios, folios);

	kfree(folios);
	return ret;
}

> +}
> +
> +/*
> + * Check whether all folios are *allowed* to be pinned. Rather confusingly, all

... "to be pinned possibly forever ("longterm")".

> + * folios in the range are required to be pinned via FOLL_PIN, before calling
> + * this routine.
> + *
> + * If any folios in the range are not allowed to be pinned, then this routine
> + * will migrate those folios away, unpin all the folios in the range and return
> + * -EAGAIN. The caller should re-pin the entire range with FOLL_PIN and then
> + * call this routine again.
> + *


[...]

-- 
Cheers,

David / dhildenb

