Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F6B35AA2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 13:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079BB10E2F0;
	Tue, 26 Aug 2025 11:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="canFekNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B55510E2F1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756206281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jhHf33zPn8FMTc4V2Pm10xsHI1Kc6Z2Rv/ZWcei/RDk=;
 b=canFekNUPR0xC+PH5766rAfjaS0A7rpG1sWfH1J24eV5gKUCCWPn2aUpkG4g9qA1q3pFUO
 iIoqLx8q4zCIO3X3IjKKbYuFGh6tMbuPP1kyOrXOH7KsOHmYV19I8wZA535Sa1ICe7jDJk
 Jc2rsDjPQJVQqkYZSG4eDlCUiNq9oe8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-19SYX80zMzWR3GS8N_eF0Q-1; Tue, 26 Aug 2025 07:04:39 -0400
X-MC-Unique: 19SYX80zMzWR3GS8N_eF0Q-1
X-Mimecast-MFC-AGG-ID: 19SYX80zMzWR3GS8N_eF0Q_1756206278
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-61c6d735f15so1813796a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 04:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756206278; x=1756811078;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jhHf33zPn8FMTc4V2Pm10xsHI1Kc6Z2Rv/ZWcei/RDk=;
 b=C1YkXEuHinK8ViC7HGI38MhFvMDd1hnifkQANuUJliy4kLBKbgSxexra6zUznhx8i8
 bLMQOwB98qMqWkNP0V0H0c4An3tsJIgr6CUffMQ0Co2txFMQl6uplTozau5KSaQvgKPO
 al/hrtcDI7TLDeA0aqt0+72WHG/LXvd/v+apSx/Y3tcK6f6t+V6vs/e9U7caCtLXlSwe
 wqZBP1u7fTmL5fMaG4b8UHbtAGWd7kNINs87HlEgDLGEJODWlmwzqy24kLld3eGMftGA
 NyG4l8SGijQui9JdXbcLj4p4/KDCCSP+YyXYZTS0wyx9REEpUkom9TP4H3aNuqC44DNv
 GMqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmagCuszqCQSpa+DPWqsPZw0H8QXWyhn1L8f0ICzcDs40ULsZ0Cz9cLAYYWXoaDJknfY5hSM1K/GU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2ym2hoLkenfJEfr7SIm/a55o4/3jBQ92asyu3geSH3TNy57kK
 t0+Aedn6dlA8yRUXn/63ZiKrIuVrH6dmRXCFsHuIxlqCTqPM/Icx56L32WwgaNedd4neeeJ1LvU
 ozsEpboH6PIth2VoM0V2JIp/e6Kzlpf/J8WeBPJNnPON8dwD3jBJgveCG9ZSLsRHJtXh0ww==
X-Gm-Gg: ASbGnctN9eDj/kGsPtwSfFA3VUnRqVrMM/eXFdfXWCADl04M7rcMzAw6UnOghp/PL64
 tFiiOCSUcj5XVDMvWbttcMN0liSil1oo6ycCVcy8oSaEXQsFwoKP6hNeCkM+zmiXWRbDf/i3PMR
 ahgEbFIPCzixeQQb4S84nE0g4WpDDl2+/LHRdWYyZejPOc7HUGfcN1m8blrmOBxxVYH0MBKBLIH
 WdzCrxr/zTYTXlVpDM5G4aMhYNb/n1K5RbAY27E9rW4EFmUXQWabszmYS3v0qSbwOM9H5jZJowx
 1kZmWURsidqLQ/+AMWfjY0+rQ2ZaNsetMZHEjQTL0KoPgyO7s2cNAOcgsxSU7+j4Di4ryokYgA=
 =
X-Received: by 2002:a05:6402:510e:b0:61c:a1a6:52a2 with SMTP id
 4fb4d7f45d1cf-61ca1a65d0amr110486a12.28.1756206278242; 
 Tue, 26 Aug 2025 04:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJfWOpyeYnJbaHVglB9KfY+PTnQ4jI93qRAexOTMKIRVofYBVmmLclF7ZKvry/r0B75eD1FQ==
X-Received: by 2002:a05:6402:510e:b0:61c:a1a6:52a2 with SMTP id
 4fb4d7f45d1cf-61ca1a65d0amr110409a12.28.1756206276561; 
 Tue, 26 Aug 2025 04:04:36 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3172bf4csm6850118a12.38.2025.08.26.04.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 04:04:36 -0700 (PDT)
Message-ID: <ad521f4f-47aa-4728-916f-3704bf01f770@redhat.com>
Date: Tue, 26 Aug 2025 13:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 21/35] mm/cma: refuse handing out non-contiguous page
 ranges
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-22-david@redhat.com> <aK2QZnzS1ErHK5tP@raptor>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aK2QZnzS1ErHK5tP@raptor>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7dxQiDiXSbVeoV2NQ2mZ0lW_g0Ywp0jU1y-tumWRXqU_1756206278
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

>>   
>>   		pr_debug("%s(): memory range at pfn 0x%lx %p is busy, retrying\n",
>> -			 __func__, pfn, pfn_to_page(pfn));
>> +			 __func__, pfn, page);
>>   
>>   		trace_cma_alloc_busy_retry(cma->name, pfn, pfn_to_page(pfn),
> 
> Nitpick: I think you already have the page here.

Indeed, forgot to clean that up as well.

> 
>>   					   count, align);
>> -		/* try again with a bit different memory target */
>> -		start = bitmap_no + mask + 1;
>>   	}
>>   out:
>> -	*pagep = page;
>> +	if (!ret)
>> +		*pagep = page;
>>   	return ret;
>>   }
>>   
>> @@ -882,7 +892,7 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
>>   	 */
>>   	if (page) {
>>   		for (i = 0; i < count; i++)
>> -			page_kasan_tag_reset(nth_page(page, i));
>> +			page_kasan_tag_reset(page + i);
> 
> Had a look at it, not very familiar with CMA, but the changes look equivalent to
> what was before. Not sure that's worth a Reviewed-by tag, but here it in case
> you want to add it:
> 
> Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>

Thanks!

> 
> Just so I can better understand the problem being fixed, I guess you can have
> two consecutive pfns with non-consecutive associated struct page if you have two
> adjacent memory sections spanning the same physical memory region, is that
> correct?

Exactly. Essentially on SPARSEMEM without SPARSEMEM_VMEMMAP it is not 
guaranteed that

	pfn_to_page(pfn + 1) == pfn_to_page(pfn) + 1

when we cross memory section boundaries.

It can be the case for early boot memory if we allocated consecutive 
areas from memblock when allocating the memmap (struct pages) per memory 
section, but it's not guaranteed.

So we rule out that case.

-- 
Cheers

David / dhildenb

