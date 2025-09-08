Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0391B48E28
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA7B10E50E;
	Mon,  8 Sep 2025 12:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bnu3yxtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B42810E50D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757335987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nqKqSNT26uK0ctF10EJrKeCsL0Ppf+8ee2pPXGgNN7Q=;
 b=bnu3yxtYkcXe0OTHnBYCpKPzE1C2Gc7e/GNrWQNvBTQcyE7ZNNyJdqOtasldnxG/Ucf1Ob
 mfnOV4ty6PYeO/2mHnSGM50ucwErdOUzgHs7Gyc2AXNfGnuuPrzn1O67mBkAk62huBdsfE
 qUmTERAHqyD5VVZ7VjUFjq7HdvFCdMA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-F53ypsyzMtWWo5j6O0uxfA-1; Mon, 08 Sep 2025 08:53:06 -0400
X-MC-Unique: F53ypsyzMtWWo5j6O0uxfA-1
X-Mimecast-MFC-AGG-ID: F53ypsyzMtWWo5j6O0uxfA_1757335985
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3e38ae5394aso2512561f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757335985; x=1757940785;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nqKqSNT26uK0ctF10EJrKeCsL0Ppf+8ee2pPXGgNN7Q=;
 b=J4UheSoxuKX3zJ9YXPDvegfEnISWx4/kDsbuRYTSxKwZkmoqvMEJrHf1AOxcWcMpkj
 TUUOPmcz+wa+fTDaIgYT/KWasMd3Skj1G0UkejvLncuGzJM/Ddz73fCcU4FQgwFa9UgL
 2+Z8xNNmVVQVlnPAc9g7IRP2po5R2NTypMMkeA6tvePt3taklK7FFbb8R4r/uRX/q9V4
 yyanmfKR3sKT+UEQF9cE1dwkg9xz7+fhmVhtKCMwprnlf3T54rJ5BxHCPrcCGsBL9ogA
 h1R8N8y111U4BD+RNWN1ClVl9SrAMSBE/rQjiO5Ho8YW4GIV+/tDmFjPCL2A/6zU4K9+
 Qc6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy/x/IfYByFwG36O8Izl337CJz+fGirqmgN0o+1WToaOJmaWcqGZ72YWHil1XGLIltSQdYiiKo3/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+psF3YbWqjX0vYXxst3vsfgBHrkDQlLlIoxQfn8WyvmFLnWrV
 1KP80uDsg4j3DS8fB8D7wdH4GJkUnzdbozxjijStZa8va2E3ksTYgv8j+y0oNpL0TS4XEmDWlzw
 aCBxnMIAaLm7IGlS+n6Tzbl29CPNpcO5xXBaBu+XMdVV1XjRmNHLeHrJaV/6O5bEAXE5nUQ==
X-Gm-Gg: ASbGnct6DgpWw6PZgSz/kyHYTcgd69WcnPZ8MN7KFO9UrmDakkx0HaHr056Jj8mI1Eg
 H62X6DDwf7ORZfgHjiqbvqEFh0YjcrAD5YDS6HTyLZ0xvARoRcf1rHkYfrAx4ptGDrzu81wqjTm
 1oHWjAnfsiFVcFcV9y0rEu9lAf49UYC4phLaTQRrMDrH/3BQ6B7NhQWgckkBtWs8knTHKRNcRtZ
 3wqTW4YoBv5grsHjYV22duGZHIdgq3HSFhGcfjf1xnwNnCelQemz3nXygt/TrTvtzWWHVhZYssu
 adfdqZo9k2negyBPpbxNygoSQX3l0UIgwR3BcbZu49y8onfqA2gTEBBf8/WINTvfpk1NmIuivkd
 x3QfLP8za7h9JbvhL0dvv/61Evf2WbZu5M6BiVZUdeJasIWjuWDf55sIg/0T6J4zB
X-Received: by 2002:a5d:64e4:0:b0:3df:58c5:efd1 with SMTP id
 ffacd0b85a97d-3e6427d6e15mr6188425f8f.25.1757335984540; 
 Mon, 08 Sep 2025 05:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCDxFquotzqnajJLjBsVtEGOKTyR3mfE6vqo6/1C+mdI526t5VUp3r/8RO80kgSz2c6+Q56w==
X-Received: by 2002:a5d:64e4:0:b0:3df:58c5:efd1 with SMTP id
 ffacd0b85a97d-3e6427d6e15mr6188391f8f.25.1757335984032; 
 Mon, 08 Sep 2025 05:53:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:700:d846:15f3:6ca0:8029?
 (p200300d82f250700d84615f36ca08029.dip0.t-ipconnect.de.
 [2003:d8:2f25:700:d846:15f3:6ca0:8029])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d1007c0dc8sm40030772f8f.53.2025.09.08.05.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 05:53:03 -0700 (PDT)
Message-ID: <7ee0b58a-8fe4-46fe-bfef-f04f900f3040@redhat.com>
Date: Mon, 8 Sep 2025 14:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
 <016307ba-427d-4646-8e4d-1ffefd2c1968@nvidia.com>
 <85e760cf-b994-40db-8d13-221feee55c60@redhat.com>
 <727cabec-5ee8-4793-926b-8d78febcd623@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <727cabec-5ee8-4793-926b-8d78febcd623@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4dEuyIYCpjOmKq_c10nlC9lFKgbc0o0Ziop6OL9T_NY_1757335985
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

On 08.09.25 14:25, Lorenzo Stoakes wrote:
> On Sat, Sep 06, 2025 at 08:56:48AM +0200, David Hildenbrand wrote:
>> On 06.09.25 03:05, John Hubbard wrote:
>>>
>>> Probably a similar sentiment as Lorenzo here...the above diffs make the code
>>> *worse* to read. In fact, I recall adding record_subpages() here long ago,
>>> specifically to help clarify what was going on.
>>
>> Well, there is a lot I dislike about record_subpages() to go back there.
>> Starting with "as Willy keeps explaining, the concept of subpages do
>> not exist and ending with "why do we fill out the array even on failure".
> 
> Yes
> 
>>
>> :)
>>
>>>
>>> Now it's been returned to it's original, cryptic form.
>>>
>>
>> The code in the caller was so uncryptic that both me and Lorenzo missed
>> that magical addition. :P
> 
> :'(
> 
>>
>>> Just my take on it, for whatever that's worth. :)
>>
>> As always, appreciated.
>>
>> I could of course keep the simple loop in some "record_folio_pages"
>> function and clean up what I dislike about record_subpages().
>>
>> But I much rather want the call chain to be cleaned up instead, if possible.
>>
>>
>> Roughly, what I am thinking (limiting it to pte+pmd case) about is the following:
> 
> I cannot get the below to apply even with the original patch here applied + fix.
> 
> It looks like (in mm-new :) commit e73f43a66d5f ("mm/gup: remove dead pgmap
> refcounting code") by Alastair has conflicted here, but even then I can't make
> it apply, with/without your fix...!

To be clear: it was never intended to be applied, because it wouldn't 
even compile in the current form.

It was based on this nth_page submission + fix.


[...]

>>   }
>>   static int gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr,
> 
> OK I guess you intentionally left the rest as a TODO :)
> 
> So I'll wait for you to post it before reviewing in-depth.
> 
> This generally LGTM as an approach, getting rid of *nr is important that's
> really horrible.

Yes. Expect a cleanup in that direction soonish (again, either from me 
or someone else I poke)

> 
>> --
>> 2.50.1
>>
>>
>>
>> Oh, I might even have found a bug moving away from that questionable
>> "ret==1 means success" handling in gup_fast_pte_range()? Will
>> have to double-check, but likely the following is the right thing to do.
>>
>>
>>
>>  From 8f48b25ef93e7ef98611fd58ec89384ad5171782 Mon Sep 17 00:00:00 2001
>> From: David Hildenbrand <david@redhat.com>
>> Date: Sat, 6 Sep 2025 08:46:45 +0200
>> Subject: [PATCH] mm/gup: fix handling of errors from
>>   arch_make_folio_accessible() in follow_page_pte()
>>
>> In case we call arch_make_folio_accessible() and it fails, we would
>> incorrectly return a value that is "!= 0" to the caller, indicating that
>> we pinned all requested pages and that the caller can keep going.
>>
>> follow_page_pte() is not supposed to return error values, but instead
>> 0 on failure and 1 on success.
>>
>> That is of course wrong, because the caller will just keep going pinning
>> more pages. If we happen to pin a page afterwards, we're in trouble,
>> because we essentially skipped some pages.
>>
>> Fixes: f28d43636d6f ("mm/gup/writeback: add callbacks for inaccessible pages")
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/gup.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 22420f2069ee1..cff226ec0ee7d 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2908,8 +2908,7 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>>   		 * details.
>>   		 */
>>   		if (flags & FOLL_PIN) {
>> -			ret = arch_make_folio_accessible(folio);
>> -			if (ret) {
>> +			if (arch_make_folio_accessible(folio)) {
> 
> Oh Lord above. Lol. Yikes.
> 
> Yeah I think your fix is valid...

I sent it out earlier today. Fortunately that function shouldn't usually 
really fail IIUC.

-- 
Cheers

David / dhildenb

