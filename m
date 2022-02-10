Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CFE4B0CBA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF2710E81A;
	Thu, 10 Feb 2022 11:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06E510E81C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644493665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voWjPDpl6rgnyPEWRLZY/zlAv4le197CBv6xEpGwtjU=;
 b=i+g+GBulB4XUI4pyp4AEZsk7701h3zr2ZWaStjypfaIfBwrdynMfFtR89rSmCi4KT5zjUB
 5r5G6kbzdTioKDAhAPLnpKrdy27HL6GG6p6VHRrYO2ZrleOydq6Ggh7vafrjD0Z3HA8Jx7
 1GJq/UdEeXFjL6Hi1I6ddVWcltSzekU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-tiqDlq63PCafRzDGgXcARQ-1; Thu, 10 Feb 2022 06:47:38 -0500
X-MC-Unique: tiqDlq63PCafRzDGgXcARQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 b8-20020adfc748000000b001e333edbe40so2392567wrh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 03:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=voWjPDpl6rgnyPEWRLZY/zlAv4le197CBv6xEpGwtjU=;
 b=ggawnl9HYgVIpqBHlY5UJRUtDryHyq7TkFR3u2FGgiH6BxZG0WyE+BXwEcHpkwVLl7
 3svoCTXJCcSTuzEXlt3opqA54jy5ocCDQy905h5CkvS1znzVy+i1fEKAQlR5BW6pLTFj
 4vsY1x2YlNEFDsCIYFkcDXgVvsOj/k8ju1M/0CQsj50mzWym5gNMWRb/kE5MZMySBFj7
 1b0DceqdADD9N+YGt+yEJK56abmPVwUS2WzVxPHullRwAZPAOOtTnwJ1kjJs9n8ssUoh
 duPKb52GUMGTHb1S7VjrzMsbkzaTwKtaLhoadNhLV9g/RGG5zGxqtjJiWh7mp1mNIT+1
 s7Ug==
X-Gm-Message-State: AOAM531MKYonWFN45xOBOYHra2sNZKeqmPEqH1AZvJSsye29loA6u/IQ
 Q2oya6zeYT7qfvvp3/wqROV9lm7J5ZgiIjZFBtBWn+EQ+VXV1qkgV6D5xC3OopED5HJKZ6BXUIE
 DufMdmLp609V5/tfGUUhoRXAvaXLa
X-Received: by 2002:a7b:c778:: with SMTP id x24mr1808298wmk.181.1644493657673; 
 Thu, 10 Feb 2022 03:47:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6UoEwYIvoo+UYxUGhTbqYutAgt1KtSHP64o6sBNKHzXr+dVyYnHTL0HD0CFRSHfFSJsuJrw==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr1808265wmk.181.1644493657358; 
 Thu, 10 Feb 2022 03:47:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:f900:7b04:69ec:2caf:3b42?
 (p200300cbc70bf9007b0469ec2caf3b42.dip0.t-ipconnect.de.
 [2003:cb:c70b:f900:7b04:69ec:2caf:3b42])
 by smtp.gmail.com with ESMTPSA id h6sm1323620wmq.26.2022.02.10.03.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:47:36 -0800 (PST)
Message-ID: <fb557284-bcab-6d95-ac60-acd7459e9e80@redhat.com>
Date: Thu, 10 Feb 2022 12:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
 <9117b387-3c73-0236-51d1-9e6baf43b34e@redhat.com>
 <1894939.704c7Wv018@nvdebian>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <1894939.704c7Wv018@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.02.22 12:39, Alistair Popple wrote:
> On Thursday, 10 February 2022 9:53:38 PM AEDT David Hildenbrand wrote:
>> On 07.02.22 05:26, Alistair Popple wrote:
>>> Currently any attempts to pin a device coherent page will fail. This is
>>> because device coherent pages need to be managed by a device driver, and
>>> pinning them would prevent a driver from migrating them off the device.
>>>
>>> However this is no reason to fail pinning of these pages. These are
>>> coherent and accessible from the CPU so can be migrated just like
>>> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
>>> them first try migrating them out of ZONE_DEVICE.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> ---
>>>
>>> Changes for v2:
>>>
>>>  - Added Felix's Acked-by
>>>  - Fixed missing check for dpage == NULL
>>>
>>>  mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
>>>  1 file changed, 95 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 56d9577..5e826db 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -1861,6 +1861,60 @@ struct page *get_dump_page(unsigned long addr)
>>>  
>>>  #ifdef CONFIG_MIGRATION
>>>  /*
>>> + * Migrates a device coherent page back to normal memory. Caller should have a
>>> + * reference on page which will be copied to the new page if migration is
>>> + * successful or dropped on failure.
>>> + */
>>> +static struct page *migrate_device_page(struct page *page,
>>> +					unsigned int gup_flags)
>>> +{
>>> +	struct page *dpage;
>>> +	struct migrate_vma args;
>>> +	unsigned long src_pfn, dst_pfn = 0;
>>> +
>>> +	lock_page(page);
>>> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
>>> +	args.src = &src_pfn;
>>> +	args.dst = &dst_pfn;
>>> +	args.cpages = 1;
>>> +	args.npages = 1;
>>> +	args.vma = NULL;
>>> +	migrate_vma_setup(&args);
>>> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
>>> +		return NULL;
>>> +
>>> +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
>>> +
>>> +	/*
>>> +	 * get/pin the new page now so we don't have to retry gup after
>>> +	 * migrating. We already have a reference so this should never fail.
>>> +	 */
>>> +	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
>>> +		__free_pages(dpage, 0);
>>> +		dpage = NULL;
>>> +	}
>>> +
>>> +	if (dpage) {
>>> +		lock_page(dpage);
>>> +		dst_pfn = migrate_pfn(page_to_pfn(dpage));
>>> +	}
>>> +
>>> +	migrate_vma_pages(&args);
>>> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
>>> +		copy_highpage(dpage, page);
>>> +	migrate_vma_finalize(&args);
>>> +	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
>>> +		if (gup_flags & FOLL_PIN)
>>> +			unpin_user_page(dpage);
>>> +		else
>>> +			put_page(dpage);
>>> +		dpage = NULL;
>>> +	}
>>> +
>>> +	return dpage;
>>> +}
>>> +
>>> +/*
>>>   * Check whether all pages are pinnable, if so return number of pages.  If some
>>>   * pages are not pinnable, migrate them, and unpin all pages. Return zero if
>>>   * pages were migrated, or if some pages were not successfully isolated.
>>> @@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>>>  			continue;
>>>  		prev_head = head;
>>>  		/*
>>> -		 * If we get a movable page, since we are going to be pinning
>>> -		 * these entries, try to move them out if possible.
>>> +		 * Device coherent pages are managed by a driver and should not
>>> +		 * be pinned indefinitely as it prevents the driver moving the
>>> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
>>> +		 * migrating page out of device memory.
>>>  		 */
>>>  		if (is_dev_private_or_coherent_page(head)) {
>>> +			/*
>>> +			 * device private pages will get faulted in during gup
>>> +			 * so it shouldn't be possible to see one here.
>>> +			 */
>>>  			WARN_ON_ONCE(is_device_private_page(head));
>>> -			ret = -EFAULT;
>>> -			goto unpin_pages;
>>> +			WARN_ON_ONCE(PageCompound(head));
>>> +
>>> +			/*
>>> +			 * migration will fail if the page is pinned, so convert
>>> +			 * the pin on the source page to a normal reference.
>>> +			 */
>>> +			if (gup_flags & FOLL_PIN) {
>>> +				get_page(head);
>>> +				unpin_user_page(head);
>>> +			}
>>> +
>>> +			pages[i] = migrate_device_page(head, gup_flags);
>>
>> For ordinary migrate_pages(), we'll unpin all pages and return 0 so the
>> caller will retry pinning by walking the page tables again.
>>
>> Why can't we apply the same mechanism here? This "let's avoid another
>> walk" looks unnecessary complicated to me, but I might be wrong.
> 
> There's no reason we couldn't. I figured we have the page in the right spot
> anyway so it was easy to do, and looking at this rebased on top of Christoph's
> ZONE_DEVICE refcount simplification I'm not sure it would be any simpler
> anyway.
> 
> It would remove the call to try_grab_page(), but we'd still have to return an
> error on migration failures whilst also ensuring we putback any non-device
> pages that may have been isolated. I might have overlooked something though,
> so certainly happy for suggestions.

Staring at the code, I was wondering if we could either

* build a second list of device coherent pages to migrate and call a
  migrate_device_pages() bulk function
* simply use movable_page_list() and teach migrate_pages() how to handle
  them.

I'd really appreciate as little special casing as possible for the ever
growing list of new DEVICE types all over the place. E.g., just staring
at fork even before the new device coherent made my head spin.

-- 
Thanks,

David / dhildenb

