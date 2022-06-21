Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DEA5530E7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 13:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2210F6E4;
	Tue, 21 Jun 2022 11:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A70B10F6E4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655811126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1o/jnMsU4IPX6HlOfyZ4A2cxwPbVUo4lnU9g11rsaY=;
 b=AVky9HMFWva5LKXy4jWF5FrYA9uKcD45QmNzYbZV/SIOCFt62PzWnrr85Aigt28LvQxY5S
 VtTVrx4YLLNjA6LjdkbQb1JrtztcJ78Ujoo2WLv6Qug5SDNAPq4lH86uq4fGd6frmHHRnZ
 EVAC7H8HJrLImAWVYbSck1kb0IP6RzQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-6XwOpMg_MeOHSDZwnZdb5Q-1; Tue, 21 Jun 2022 07:32:05 -0400
X-MC-Unique: 6XwOpMg_MeOHSDZwnZdb5Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 n5-20020adf8b05000000b00219ece7272bso3142875wra.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 04:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y1o/jnMsU4IPX6HlOfyZ4A2cxwPbVUo4lnU9g11rsaY=;
 b=tWj1/ZiozLKsTQM68EB8JzUdxfBeOvNdqFVFVYwwI8ozcphRI4kl8o2E0pqp3pOW64
 pYdkrQfJDVxh0rDDXsN8O+GW5GnzehoR5wdvHufxRZI6f7tJrCM5SwLEaHBKOXT4RAwS
 B9em7BMiOPdXZ0QfE23TPE3ZMJLBNKL0VH6zPu1u01tcSyFIeAq76kklVbFhZ1UKRHW5
 4XaR6M3/C0alpRoMgGbdmP3wSncrSvvbPFdAKbP5Druq76OYCIjsYsvJoTMXIMQPn7rv
 RTo5nNQDPqWzAib8VfxNDht9Wo+zM9Cy1APuAAzmGGpjg+HPR5vgJPJgk7CKYSnM492M
 ICfA==
X-Gm-Message-State: AJIora9OdXJW203jQx5q8D5eeafKFpps3iD/M3iznFcFfIzKqOVaSeOA
 /AfwTYPkkh3R24EPsuj4jcM8DHJVS4+E1N4j93BNkPdNSx7D3rBWfUeepFsv35vWo76PlcB+TmG
 moxZjAJ+1UKPANfUBKUrjFJBsA6EX
X-Received: by 2002:adf:fb0b:0:b0:21a:b15:6013 with SMTP id
 c11-20020adffb0b000000b0021a0b156013mr27217781wrr.268.1655811123765; 
 Tue, 21 Jun 2022 04:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vID2DBhF1VSe6FJYOzJsuR+237Ihfn2g9rXPagZ5JJL2QI2dXrP9uXmyixWi9QK60Zpdz4lA==
X-Received: by 2002:adf:fb0b:0:b0:21a:b15:6013 with SMTP id
 c11-20020adffb0b000000b0021a0b156013mr27217746wrr.268.1655811123386; 
 Tue, 21 Jun 2022 04:32:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:2500:cdb0:9b78:d423:43f?
 (p200300d82f042500cdb09b78d423043f.dip0.t-ipconnect.de.
 [2003:d8:2f04:2500:cdb0:9b78:d423:43f])
 by smtp.gmail.com with ESMTPSA id
 o1-20020adfeac1000000b0021b8c554196sm7228854wrn.29.2022.06.21.04.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 04:32:02 -0700 (PDT)
Message-ID: <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
Date: Tue, 21 Jun 2022 13:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
To: Felix Kuehling <felix.kuehling@amd.com>,
 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
 <65987ab8-426d-e533-0295-069312b4f751@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <65987ab8-426d-e533-0295-069312b4f751@amd.com>
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
Cc: rcampbell@nvidia.com, willy@infradead.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.06.22 13:25, Felix Kuehling wrote:
> 
> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>> evicted.
>>>>>>>
>>>>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>>>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>          removed is_dev_private_or_coherent_page]
>>>>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>>>>> ---
>>>>>>>     include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>     mm/memcontrol.c          |  7 ++++---
>>>>>>>     mm/memory-failure.c      |  8 ++++++--
>>>>>>>     mm/memremap.c            | 10 ++++++++++
>>>>>>>     mm/migrate_device.c      | 16 +++++++---------
>>>>>>>     mm/rmap.c                |  5 +++--
>>>>>>>     6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>
>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>> --- a/include/linux/memremap.h
>>>>>>> +++ b/include/linux/memremap.h
>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>      * A more complete discussion of unaddressable memory may be found in
>>>>>>>      * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>      *
>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>
>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>> + *
>>>>>>>      * MEMORY_DEVICE_FS_DAX:
>>>>>>>      * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>      * coherent and supports page pinning. In support of coordinating page
>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>     enum memory_type {
>>>>>>>     	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>     	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>     	MEMORY_DEVICE_FS_DAX,
>>>>>>>     	MEMORY_DEVICE_GENERIC,
>>>>>>>     	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>
>>>>>>
>>>>>> However, where exactly is pinning forbidden?
>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>> memory manager owning the
>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>> is allowed on this device type.
>>>> I don't see updates to folio_is_pinnable() in this patch.
>>> Device coherent type pages should return true here, as they are pinnable
>>> pages.
>> That function is only called for long-term pinnings in try_grab_folio().
>>
>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>> As far as I understand this return NULL for long term pin pages.
>>> Otherwise they get refcount incremented.
>> I don't follow.
>>
>> You're saying
>>
>> a) folio_is_pinnable() returns true for device coherent pages
>>
>> and that
>>
>> b) device coherent pages don't get long-term pinned
>>
>>
>> Yet, the code says
>>
>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>> {
>> 	if (flags & FOLL_GET)
>> 		return try_get_folio(page, refs);
>> 	else if (flags & FOLL_PIN) {
>> 		struct folio *folio;
>>
>> 		/*
>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>> 		 * right zone, so fail and let the caller fall back to the slow
>> 		 * path.
>> 		 */
>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>> 			     !is_pinnable_page(page)))
>> 			return NULL;
>> 		...
>> 		return folio;
>> 	}
>> }
>>
>>
>> What prevents these pages from getting long-term pinned as stated in this patch?
> 
> Long-term pinning is handled by __gup_longterm_locked, which migrates 
> pages returned by __get_user_pages_locked that cannot be long-term 
> pinned. try_grab_folio is OK to grab the pages. Anything that can't be 
> long-term pinned will be migrated afterwards, and 
> __get_user_pages_locked will be retried. The migration of 
> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13 
> ("mm/gup: migrate device coherent pages when pinning instead of failing").

Thanks.

__gup_longterm_locked()->check_and_migrate_movable_pages()

Which checks folio_is_pinnable() and doesn't do anything if set.

Sorry to be dense here, but I don't see how what's stated in this patch
works without adjusting folio_is_pinnable().

-- 
Thanks,

David / dhildenb

