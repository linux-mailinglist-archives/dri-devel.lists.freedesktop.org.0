Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD349C5A29
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 15:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF8C10E5F5;
	Tue, 12 Nov 2024 14:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PD0m4FY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95110E600
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731421371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ih3h7sj3/PrQh5CHmukyEc1uZxk8P4jeW0tJ5ye/2l4=;
 b=PD0m4FY0+QGgEMjExCm9TLZLFZJaCuvg/uNROI0xXnr5NJUQPB52kWz7OquCfZR/Jmhyq/
 uxTU7asSNxUKazKqqpiO8QOaINGwSJh/Vt1IKasfOaWFemmHm0akTic87S1jhz4ibAFbEE
 8L+ZGbWxFqK8CyY1Nl6TfYyo1CK5idA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-vP8l4CiCM2632nl8Z0iNOA-1; Tue, 12 Nov 2024 09:22:50 -0500
X-MC-Unique: vP8l4CiCM2632nl8Z0iNOA-1
X-Mimecast-MFC-AGG-ID: vP8l4CiCM2632nl8Z0iNOA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4316655b2f1so40741765e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 06:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731421369; x=1732026169;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ih3h7sj3/PrQh5CHmukyEc1uZxk8P4jeW0tJ5ye/2l4=;
 b=X/9ktiGROYeN47ogpYxBk++uC89zdwUjwA0iDIChY/lYz4yJ4ce/GtEFZnkNRJNaBD
 6nwQsnheIQSyKeWUSpf6WtWqB43XnNYCJ3P6hUEZkWaXK7nySzoDAbjPuITWQsa+PiLP
 RRFud/NwOz9d6dY0JQlPzVbH4l1Fw99OqYMybP0zESz3wYOyhJyuN00pri4JgEkbDBWJ
 DsIrOm6HIC3M2QJZSX5rZ78gHM0h1NGHw3isO2WIElFTdncsgPBpd/DeC5/LXUxQjXlJ
 Ta6BrQYXYK/GKTP+zIjTEvP1KZZxi1n908QIS9yVTGyjm20Qsqo53hMk5/V57vLm2D+U
 XNMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVybqokgTFZagnXC6hzeQkQqAIu6cBMkfPOK/L9NdAExknLMqYkQaGu59C0W1ROE90pd6r0M3jzuC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdNHyqN2vvn8I3SgkvBcWjJ94R/l11BpgxFsth0WnHg35Ffw36
 ceWzLmlurvegIC+Yslun3izHHOtja5vz/MEjPzAlA59GPdKEqhX5Z1lmB4i8eP6i2/MWiO6fK3R
 soMpk1c62ifvaZCk0WEG0/ryTZssrImCkwiOqUZUQ9phFoil4zN+aJpM/wZWzHeBkyg==
X-Received: by 2002:a05:600c:3ca0:b0:42c:b037:5f9d with SMTP id
 5b1f17b1804b1-432b74fd71emr143890025e9.3.1731421369194; 
 Tue, 12 Nov 2024 06:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH59gtj5JuaEfqGVlrZNoO+nuZRVjGPGhZoZcwaXvNihYJ1LG3ikeJRXAg5sAwoquW2Wr0J6g==
X-Received: by 2002:a05:600c:3ca0:b0:42c:b037:5f9d with SMTP id
 5b1f17b1804b1-432b74fd71emr143889835e9.3.1731421368855; 
 Tue, 12 Nov 2024 06:22:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:8e00:7a46:1b8c:8b13:d3d?
 (p200300cbc7398e007a461b8c8b130d3d.dip0.t-ipconnect.de.
 [2003:cb:c739:8e00:7a46:1b8c:8b13:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b054a3ebsm209649235e9.12.2024.11.12.06.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 06:22:48 -0800 (PST)
Message-ID: <430b6a38-facf-4127-b1ef-5cfe7c495d63@redhat.com>
Date: Tue, 12 Nov 2024 15:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Fuad Tabba <tabba@google.com>,
 linux-mm@kvack.org, kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rppt@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, muchun.song@linux.dev, simona@ffwll.ch,
 airlied@gmail.com, pbonzini@redhat.com, seanjc@google.com,
 jhubbard@nvidia.com, ackerleytng@google.com, vannapurve@google.com,
 mail@maciej.szmigiero.name, kirill.shutemov@linux.intel.com,
 quic_eberman@quicinc.com, maz@kernel.org, will@kernel.org,
 qperret@google.com, keirf@google.com, roypat@amazon.co.uk
References: <20241108162040.159038-1-tabba@google.com>
 <20241108170501.GI539304@nvidia.com>
 <9dc212ac-c4c3-40f2-9feb-a8bcf71a1246@redhat.com>
 <CA+EHjTy3kNdg7pfN9HufgibE7qY1S+WdMZfRFRiF5sHtMzo64w@mail.gmail.com>
 <ZzLnFh1_4yYao_Yz@casper.infradead.org>
 <e82d7a46-8749-429c-82fa-0c996c858f4a@redhat.com>
 <20241112135348.GA28228@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241112135348.GA28228@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Imb8Y-42Tz7Bdz9o5BYpx434P0yUrtQRAuQDpY88IOM_1731421369
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

On 12.11.24 14:53, Jason Gunthorpe wrote:
> On Tue, Nov 12, 2024 at 10:10:06AM +0100, David Hildenbrand wrote:
>> On 12.11.24 06:26, Matthew Wilcox wrote:
>>> On Mon, Nov 11, 2024 at 08:26:54AM +0000, Fuad Tabba wrote:
>>>> Thanks for your comments Jason, and for clarifying my cover letter
>>>> David. I think David has covered everything, and I'll make sure to
>>>> clarify this in the cover letter when I respin.
>>>
>>> I don't want you to respin.  I think this is a bad idea.
>>
>> I'm hoping you'll find some more time to explain what exactly you don't
>> like, because this series only refactors what we already have.
>>
>> I enjoy seeing the special casing (especially hugetlb) gone from mm/swap.c.
>>
>> I don't particularly enjoy overlaying folio->lru, primarily because we have
>> to temporarily "evacuate" it when someone wants to make use of folio->lru
>> (e.g., hugetlb isolation). So it's not completely "sticky", at least for
>> hugetlb.
> 
> This is really the worst part of it though

Yes.

> 
> And, IMHO, seems like overkill. We have only a handful of cases -
> maybe we shouldn't be trying to get to full generality but just handle
> a couple of cases directly? I don't really think it is such a bad
> thing to have an if ladder on the free path if we have only a couple
> things. Certainly it looks good instead of doing overlaying tricks.

I'd really like to abstract hugetlb handling if possible. The way it 
stands it's just very odd.

We'll need some reliable way to identify these folios that need care. 
guest_memfd will be using folio->mapcount for now, so for now we 
couldn't set a page type like hugetlb does.


> Also how does this translate to Matthew's memdesc world?

guest_memfd and hugetlb would be operating on folios (at least for now), 
which contain the refcount,lru,private, ... so nothing special there.

Once we actually decoupled "struct folio" from "struct page", we *might* 
have to play less tricks, because we could just have a callback pointer 
there. But well, maybe we also want to save some space in there.

Do we want dedicated memdescs for hugetlb/guest_memfd that extend folios 
in the future? I don't know, maybe.


I'm currently wondering if we can use folio->private for the time being. 
Either

(a) If folio->private is still set once the refcount drops to 0, it 
indicates that there is a freeing callback/owner_ops. We'll have to make 
hugetlb not use folio->private and convert others to clear 
folio->private before freeing.

(b) Use bitX of folio->private to indicate that this has "owner_ops" 
meaning. We'll have to make hugetlb not use folio->private and make 
others not use bitX. Might be harder and overkill, because right now we 
only really need the callback when refcount==0.

(c) Use some other indication that folio->private contains folio_ops.

-- 
Cheers,

David / dhildenb

