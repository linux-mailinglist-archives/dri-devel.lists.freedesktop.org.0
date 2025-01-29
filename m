Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB326A21C4F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04F210E7B7;
	Wed, 29 Jan 2025 11:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c+aN7FcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1742710E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738150280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JXxKEWFa0kyjHsvEo16sNj1w52gUXHl7Gu/3LaFydsM=;
 b=c+aN7FcBTH8d4C5NdIR5/OgGPgsM2zOsUq0a4FfcIrVM5wc7YntPLWN2nIRHNwMQFSYXsU
 +AoWJ35lQjUUOSAFY5gir+hf0PIR57qRQOrkcV2XX8TOXdZ1cd3kNEbl5nNZFIGi8hT2UL
 gxMnnvmWm222j3qahCMZKnFDr53/hWI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-XuFuTOlnNXCiS2pjDRHgfg-1; Wed, 29 Jan 2025 06:31:19 -0500
X-MC-Unique: XuFuTOlnNXCiS2pjDRHgfg-1
X-Mimecast-MFC-AGG-ID: XuFuTOlnNXCiS2pjDRHgfg
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38a35a65575so4667014f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738150278; x=1738755078;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXxKEWFa0kyjHsvEo16sNj1w52gUXHl7Gu/3LaFydsM=;
 b=J2R1+x5WjIM0OdLyITPPnyr7wslOrxr1TeW66eV+UME0nXVKHwkkDx8HGIcwy3ECic
 kZW5oLZ3mOkTSYh6dtODR8Nw6Re3ym/QOx9lyHWcEXERY6oXz6nDZBbDQBdkTWLv0GtG
 oMDPex5+P8AM62f0YxGcBgMrC09UvQmBJxedtGgA/yluuYoqZB4r2fyLn0xNLpvFuwvL
 zp0mqqreQ1/aGlH/YuR58+hncajsnti3tgJs9QfC7arM9/UuPrP5L+Yp32j0CaXL14xr
 nOqQUJ0zRk7oWxufwcbdQRr2g2aOvMyQp3NnECHCCuFwk41U9+gqrYTlIrgwa1ZXMjRW
 emWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBUhkPDjJAO6Asl3qi3RLe1o8HXJSZF/lw7O1/9FaZx+Sh/R0Iy7iHmPcTXMcfraSjYa5k4qp20lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz98LLfU0dFmxHVIYl1TETclz7E2bAq/EWPR7JuMW7QrE8EHH3s
 p1VFdaCmm76AiyH1AUYaV1i/cOaYv86plOes+QmYAG4hXzHW+e51STsyUco6nktmTP2IIUpLpi/
 UVfKUM1dw5onwO6Q7D6LRjyj/jvbBGWfQTqo3EYMMWIU+dfTid1dNQQuuiiWX6JFkMQ==
X-Gm-Gg: ASbGncsiLGGF/JPmIoVuYKwCzwIzsD29EKIh2qJ2EIxXtBfh7F5zF7rlv+lhBSlE8Vj
 wNTrZ2ondI02OxJDJ6nPllj5ZlIhCRqmsl32V4ZK5U5XLyySCikeLiXeYrX9ff9Rzyxcj85l1ns
 UEh4nai8Azj6/Vmlqgt+iG5FcgBj5s2NbS47UhvNloUovpF8aEEqLWBrkBcal99SBbseCHGhsDQ
 9WF+8QiZ+uAcGmGWRhjNeFLaHzTkWPEAWFsGkhk1hXJBfzz9h3E1QYulydfy4NrYJ1LkFRKyBC0
 bzw+hT5p+zMV6bDerUjql7MfcI/iV/7mVPSbYQOLQxKmsLVRNPtmtsFMxR1UKrrWs8iSgG8wzSk
 YTWnNOMN1SrGSi6kqZYO+VOzKQdjMDMRT
X-Received: by 2002:a05:6000:1788:b0:386:459f:67e0 with SMTP id
 ffacd0b85a97d-38c5194d438mr2694283f8f.21.1738150277615; 
 Wed, 29 Jan 2025 03:31:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+uB1GWH3/Vq0ObSfPbVqQL8MPtlhNJW3rwbsNG1FaGxyQH/zDRIQvN9QYr/JlswhT6uug5g==
X-Received: by 2002:a05:6000:1788:b0:386:459f:67e0 with SMTP id
 ffacd0b85a97d-38c5194d438mr2694238f8f.21.1738150277083; 
 Wed, 29 Jan 2025 03:31:17 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:3b00:64b8:6719:5794:bf13?
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bbc8dsm16907601f8f.72.2025.01.29.03.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:31:15 -0800 (PST)
Message-ID: <c7891b99-3001-4d70-8673-8a76357db0bf@redhat.com>
Date: Wed, 29 Jan 2025 12:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM atomics
 in Nouveau" still getting used in practice?
To: Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, John Hubbard
 <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
 <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
 <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
 <fbwjse2zexcsxuro5w3a5vs2rq4eabpccfkbd3buc4qmkgoo7z@xpdtyukllzvo>
 <Z5k6w1OZ1ttgTGRo@phenom.ffwll.local>
 <ded68896-d682-4fb3-8693-4657aa90b313@redhat.com>
 <Z5oHY1pjjwBfRN1g@phenom.ffwll.local> <Z5oQ2YV1cRUc0KnD@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5oQ2YV1cRUc0KnD@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WG7CYyIYg7WsQ9MhTkU8oNL9EWYGcNguXYaGZdZYQV0_1738150278
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

On 29.01.25 12:28, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 11:48:03AM +0100, Simona Vetter wrote:
>> On Tue, Jan 28, 2025 at 09:24:33PM +0100, David Hildenbrand wrote:
>>> On 28.01.25 21:14, Simona Vetter wrote:
>>>> On Tue, Jan 28, 2025 at 11:09:24AM +1100, Alistair Popple wrote:
>>>>> On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
>>>>>>>>> On integrated the gpu is tied into the coherency
>>>>>>>>> fabric, so there it's not needed.
>>>>>>>>>
>>>>>>>>> I think the more fundamental question with both this function here and
>>>>>>>>> with forced migration to device memory is that there's no guarantee it
>>>>>>>>> will work out.
>>>>>>>>
>>>>>>>> Yes, in particular with device-exclusive, it doesn't really work with THP
>>>>>>>> and is only limited to anonymous memory. I have patches to at least make it
>>>>>>>> work reliably with THP.
>>>>>>>
>>>>>>> I should have crawled through the implementation first before replying.
>>>>>>> Since it only looks at folio_mapcount() make_device_exclusive() should at
>>>>>>> least in theory work reliably on anon memory, and not be impacted by
>>>>>>> elevated refcounts due to migration/ksm/thp/whatever.
>>>>>>
>>>>>> Yes, there is -- in theory -- nothing blocking the conversion except the
>>>>>> folio lock. That's different than page migration.
>>>>>
>>>>> Indeed - this was the entire motivation for make_device_exclusive() - that we
>>>>> needed a way to reliably exclude CPU access that couldn't be blocked in the same
>>>>> way page migration can (otherwise we could have just migrated to a device page,
>>>>> even if that may have added unwanted overhead).
>>>>
>>>> The folio_trylock worries me a bit. I guess this is to avoid deadlocks
>>>> when locking multiple folios, but I think at least on the first one we
>>>> need an unconditional folio_lock to guarantee forward progress.
>>>
>>> At least on the hmm path I was able to trigger the EBUSY a couple of times
>>> due to concurrent swapout. But the hmm-tests selftest fails immediately
>>> instead of retrying.
>>
>> My worries with just retrying is that it's very hard to assess whether
>> there's a livelock or whether the retry has a good chance of success. As
>> an example the ->migrate_to_ram path has some trylocks, and the window
>> where all other threads got halfway and then fail the trylock is big
>> enough that once you pile up enough threads that spin through there,
>> you're stuck forever. Which isn't great.
>>
>> So if we could convert at least the first folio_trylock into a plain lock
>> then forward progress is obviously assured and there's no need to crawl
>> through large chunks of mm/ code to hunt for corner cases where we could
>> be too unlucky to ever win the race.
>>
>>>> Since
>>>> atomics can't cross 4k boundaries (or the hw is just really broken) this
>>>> should be enough to avoid being stuck in a livelock. I'm also not seeing
>>>> any other reason why a folio_lock shouldn't work here, but then my
>>>> understanding of mm/ stuff is really just scratching the surface.
>>>>
>>>> I did crawl through all the other code and it looks like everything else
>>>> is unconditional locks. So looks all good and I didn't spot anything else
>>>> that seemed problematic.
>>>>
>>>> Somewhat aside, I do wonder whether we really want to require callers to
>>>> hold the mmap lock, or whether with all the work towards lockless fastpath
>>>> that shouldn't instead just be an implementation detail.
>>>
>>> We might be able to use the VMA lock in the future, but that will require
>>> GUP support and a bunch more. Until then, the mm_lock in read mode is
>>> required.
>>
>> Yup. I also don't think we should try to improve before benchmarks show an
>> actual need. It's more about future proofing and making sure mmap_lock
>> doesn't leak into driver data structures that I'm worried about. Because
>> I've seen some hmm/gpu rfc patches that heavily relied on mmap_lock to
>> keep everything correct on the driver side, which is not a clean design.
>>
>>> I was not able to convince myself that we'll really need the folio lock, but
>>> that's also a separate discussion.
>>
>> This is way above my pay understanding of mm/ unfortunately.
> 
> I pondered this some more, and I think it's to make sure we get a stable
> reading of folio_mapcount() and are not racing with new rmaps being
> established. But I also got lost a few times in the maze ...

That mapcount handling is all messed up and I'll remove that along with
the rmap walk. Also, the folio lock does not stabilize the mapcount at all ...

Here is my understanding:

commit e2dca6db09186534c7e6082b77be6e17d8920f10
Author: David Hildenbrand <david@redhat.com>
Date:   Tue Jan 28 15:25:37 2025 +0100

     mm/memory: document restore_exclusive_pte()
     
     Let's document how this function is to be used, and why the requirement
     for the folio lock might maybe be dropped in the future.
     
     Signed-off-by: David Hildenbrand <david@redhat.com>

diff --git a/mm/memory.c b/mm/memory.c
index 46956994aaff..caaae8df11a9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
  }
  #endif
  
+/**
+ * restore_exclusive_pte - Restore a device-exclusive entry
+ * @vma: VMA covering @address
+ * @folio: the mapped folio
+ * @page: the mapped folio page
+ * @address: the virtual address
+ * @ptep: PTE pointer into the locked page table mapping the folio page
+ * @orig_pte: PTE value at @ptep
+ *
+ * Restore a device-exclusive non-swap entry to an ordinary present PTE.
+ *
+ * The folio and the page table must be locked, and MMU notifiers must have
+ * been called to invalidate any (exclusive) device mappings. In case of
+ * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
+ * fault MMU_NOTIFY_EXCLUSIVE is triggered.
+ *
+ * Locking the folio makes sure that anybody who just converted the PTE to
+ * a device-private entry can map it into the device, before unlocking it; so
+ * the folio lock prevents concurrent conversion to device-exclusive.
+ *
+ * TODO: the folio lock does not protect against all cases of concurrent
+ * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
+ * must already use MMU notifiers to sync against any concurrent changes
+ * Maybe the requirement for the folio lock can be dropped in the future.
+ */


-- 
Cheers,

David / dhildenb

