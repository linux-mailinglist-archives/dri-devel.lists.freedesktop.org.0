Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E221A21317
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 21:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D140910E0CF;
	Tue, 28 Jan 2025 20:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="THJ3+sZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B5810E158
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738095881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iNDpudIY0bPli5LGjMVKpmXgCO8o2Ymuyxua8dIBZCM=;
 b=THJ3+sZVAZ22Abr6sXos47EWOoAF6Pv+2vS71gvetdwTfcD1vj4E6HNIAAHHsmgLE44jUb
 jqVLUtHWT2ZoncG4+zyQvfOTTR2XOYI7QFZd7FBHLXLRN3Wi3zsQzFRkmXXNWaNKrjXr0d
 P+wHi/WIRkZfJXLu7d0o9V5mDGDPu7A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-xSnrdJxjPpezXCR9yXt8Mg-1; Tue, 28 Jan 2025 15:24:37 -0500
X-MC-Unique: xSnrdJxjPpezXCR9yXt8Mg-1
X-Mimecast-MFC-AGG-ID: xSnrdJxjPpezXCR9yXt8Mg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43626224274so34795205e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 12:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738095876; x=1738700676;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNDpudIY0bPli5LGjMVKpmXgCO8o2Ymuyxua8dIBZCM=;
 b=DQEG43EnBP4NwKqC9IshQVysNLBui5g1gn2VmKp/Dc1AnEKvZoPt8P8hgK+PL24kBw
 aZfLvaZHijh/sKqQA7a119CeC0Of0f7ItYqoNN+N5FvvBd8sdxeubskAODtTAKB/82bO
 SRacnpmOmIQNggVtMAKoq3mK+rnogevNyWrBMMuZzAMaZLs+XtrZ5ppcEbhO91PPnskI
 x8PNndTDMqgv+k6uEjoc1XPFFdME4cvPu53MsNi/W5aWqkYnU3hCIC0P4aVLuGPmvkX3
 JtGfWjJ7UP5nc80FqY5PCk+htbp6qhzHACch4eNnkKxI+ghkc4Z+m/00HzHO4sNVstwx
 5ayw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/nbX2yoQVQISD3qMh7JB1UI4pLhvkL+9ttKfZDMdiF+GeRPgWUub7fUi/llLv3Q11KhBO7KXcAe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv8cHEpy/R3aKbxItWoZ87VmZk1I7L5DxbnVz8GXotIJkLrR8+
 DFLo7Wpxxn9Gujm2326xpn856TZhV7YftBp1CN755oWV5+/LylcIBZvcPtkTkp6mixYc1EXU7RT
 STV8Bb8xvMnNByIgIrpK7wWwr0cd/WZgYyASZ6rpnfBwKzPcR2qBJdNsQ7DFz4ylxgw==
X-Gm-Gg: ASbGncvpUSyicwp6pOimkDk7Wv1Cp7zB4sf7JogpnE0IKPtp5k1U9x814uPSecZw6IO
 QzkNPamgewFb7Nc9WWb42rQhhzOYnKXIPAXuhpje6uvjC/3dnU+lI0Mtj/+4fepirvYE/yWSFaf
 Jo9UYihLLN7n43ZAIC78v35pg1RfMirbpWGXdOtPW9oVFMJDi1E+mdJIfQBUP8wQJpc6rUVCto9
 bhMSRtjUmFU7gDFcm8+yRu5VnNkVQF03qtS7+REmXfdqzuV0nkPuiXINq5g/YSKk/nC57fbeY1Y
 ZKQjLFom0GulsoQ5CxHdacQA81N8xeNocGIyRpLdB3UEQX/52lEp7jrQGxgK3HXQ8CrcBpFLUUu
 rjsgqF+ucjg5M5IA7Kd4fyFb6V4XS1sF2
X-Received: by 2002:a05:600c:4e14:b0:438:a214:52f4 with SMTP id
 5b1f17b1804b1-438dc428c0amr1999835e9.25.1738095876558; 
 Tue, 28 Jan 2025 12:24:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG549CWXnWLeL/X/VL8ixFtav9qhAQqZxiT84vSQDru6hmKepAblMtW6jxTH/r0SRrryd1/A==
X-Received: by 2002:a05:600c:4e14:b0:438:a214:52f4 with SMTP id
 5b1f17b1804b1-438dc428c0amr1999615e9.25.1738095876187; 
 Tue, 28 Jan 2025 12:24:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c73f:ce00:1be7:6d7f:3cc3:563d?
 (p200300cbc73fce001be76d7f3cc3563d.dip0.t-ipconnect.de.
 [2003:cb:c73f:ce00:1be7:6d7f:3cc3:563d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9984sm179722225e9.28.2025.01.28.12.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 12:24:34 -0800 (PST)
Message-ID: <ded68896-d682-4fb3-8693-4657aa90b313@redhat.com>
Date: Tue, 28 Jan 2025 21:24:33 +0100
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5k6w1OZ1ttgTGRo@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hpYeMSC_joNMFG3kPcpO-vmlP19iMp3X6AXJGIbBaP0_1738095877
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

On 28.01.25 21:14, Simona Vetter wrote:
> On Tue, Jan 28, 2025 at 11:09:24AM +1100, Alistair Popple wrote:
>> On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
>>>>>> On integrated the gpu is tied into the coherency
>>>>>> fabric, so there it's not needed.
>>>>>>
>>>>>> I think the more fundamental question with both this function here and
>>>>>> with forced migration to device memory is that there's no guarantee it
>>>>>> will work out.
>>>>>
>>>>> Yes, in particular with device-exclusive, it doesn't really work with THP
>>>>> and is only limited to anonymous memory. I have patches to at least make it
>>>>> work reliably with THP.
>>>>
>>>> I should have crawled through the implementation first before replying.
>>>> Since it only looks at folio_mapcount() make_device_exclusive() should at
>>>> least in theory work reliably on anon memory, and not be impacted by
>>>> elevated refcounts due to migration/ksm/thp/whatever.
>>>
>>> Yes, there is -- in theory -- nothing blocking the conversion except the
>>> folio lock. That's different than page migration.
>>
>> Indeed - this was the entire motivation for make_device_exclusive() - that we
>> needed a way to reliably exclude CPU access that couldn't be blocked in the same
>> way page migration can (otherwise we could have just migrated to a device page,
>> even if that may have added unwanted overhead).
> 
> The folio_trylock worries me a bit. I guess this is to avoid deadlocks
> when locking multiple folios, but I think at least on the first one we
> need an unconditional folio_lock to guarantee forward progress.

At least on the hmm path I was able to trigger the EBUSY a couple of 
times due to concurrent swapout. But the hmm-tests selftest fails 
immediately instead of retrying.

> Since
> atomics can't cross 4k boundaries (or the hw is just really broken) this
> should be enough to avoid being stuck in a livelock. I'm also not seeing
> any other reason why a folio_lock shouldn't work here, but then my
> understanding of mm/ stuff is really just scratching the surface.
> 
> I did crawl through all the other code and it looks like everything else
> is unconditional locks. So looks all good and I didn't spot anything else
> that seemed problematic.
> 
> Somewhat aside, I do wonder whether we really want to require callers to
> hold the mmap lock, or whether with all the work towards lockless fastpath
> that shouldn't instead just be an implementation detail.

We might be able to use the VMA lock in the future, but that will 
require GUP support and a bunch more. Until then, the mm_lock in read 
mode is required.

I was not able to convince myself that we'll really need the folio lock, 
but that's also a separate discussion.

> At least for the
> gpu hmm code I've seen I've tried to push hard towards a world were the
> gpu side does not rely on mmap_read_lock being held at all, to future
> proof this all. And currently we only have one caller of
> make_device_exclusive_range() so would be simple to do.

We could likely move the mmap_lock into that function, but avoiding it 
is more effort.

In any case, I'll send something out probably tomorrow to fix page 
migration/swapout of pages with device-exclusive entries and a bunch of 
other things (THP, interaction with hugetlb, ...).

-- 
Cheers,

David / dhildenb

