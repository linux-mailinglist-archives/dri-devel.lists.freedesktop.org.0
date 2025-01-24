Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50798A1B7F9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 15:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FAC10E98E;
	Fri, 24 Jan 2025 14:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ahO3J0r4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C341C10E98E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737729575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JXjIelSfZzKQdcaM/jvKrJm9ctIdFXiuVvcs+iWziAM=;
 b=ahO3J0r4Hwvhpb72/51UPBiTyEyEh5avXn0FlXRWMVMgTTOYoUoBABFkkzPb67hiD7et3z
 l9npbxsv5onuZOX9c1bndUJxAnbJMm25PhwUmXCNJ868Mx8Y232C3rFrBWO7zFcNzyGDTp
 rsJzYK+zW3XFTpnf+BkhhnHnUAbJfHs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-MUKUJeIXPu6OqMgf6lt8XQ-1; Fri, 24 Jan 2025 09:39:26 -0500
X-MC-Unique: MUKUJeIXPu6OqMgf6lt8XQ-1
X-Mimecast-MFC-AGG-ID: MUKUJeIXPu6OqMgf6lt8XQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361ac8b25fso12099335e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 06:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737729561; x=1738334361;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JXjIelSfZzKQdcaM/jvKrJm9ctIdFXiuVvcs+iWziAM=;
 b=wXCmtq2OZPnMcbh1NgCEHVY/mJ+jWZTQHP4O/SfwUF+rqAsxrsEd7EQrkrJiXdPhm6
 /nYsa1TP+sdjLJmPe9szr9uuuaiCfeMiWh97O8gPJTWuJPhiQNamafK0ciXBwsQ12PV2
 Q+Wrf60r0v4q46m78K2OU3PCaw+SO2lqOQEBwNVrrxQXY4UPjslshORDJ8nyOiLaGvlo
 r+PHJ1qJu09rKSEs3EooPUgknA2nXaXQ8DLXyXiSD1Ri+xw1yk2nQhQXfzKJFvRJ3VOF
 8mlCryxjYt6bM/2TBuYgcOcCaq2WUOoog1otf4vZuh4M9LM9juDiFAJ6puDpcw00Wr9s
 h6Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgzXgBjafGbY/2CQsonSEl2wvkgxHypy0bjv3/mAlHlgKfWg6yU0tp84I7iRqnPTAZXKz80Bcxr2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw78JsD/zq/4XMK8LNh50IUanPe8qG2bPgYY0X1YV8xq9H92W94
 Cpma4OMR8i7xLPF4pacu3cVAvgMk+ZQerS/h1lsORHoy8oUwgjW3P/5tM2yjrn++ehWuUE9d6TA
 SqDTc4VfCimbmhB/uI12SQKQcOKBIyxAgrsgRXNvXPY+JAEM6q3JOlqdVpdSaOl3IgQ==
X-Gm-Gg: ASbGncvFnplxZSxz8OjCkwVfiAp8QjlrTFul1UH13V0dn89iuTKCekIRH4/vpQ7XRit
 KbR4Qz9NQbiHzGB62sLVvElGrB6Y34gve7GsjaXSwT3Wb2vjkI8vC40B9D7GSA/XMcMGjavfpjh
 zG2D/F/HgWQL8JLV1d3pDS57eWwwEHgaZ9VOtNaazIJUZVwBgJupQxfCgFMhzOEnVmTl59XY7oH
 qcaMf4gUqZgh62UrS8JHIORs1s4ORIZl+tyFUj9GMdqLmMayn9aHuEOYJsJ7oISYFTzdB4Rz2Ti
 Y4qjVEI9weCkp22eXsDJw9KPNikHHK/8bsg=
X-Received: by 2002:a05:600c:1f0d:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-4389143923bmr258333855e9.24.1737729561054; 
 Fri, 24 Jan 2025 06:39:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeLyI0tyajaShR1GLt5oyhwZhAl4H7mI/frvs0Ecdcv9h2bmHBE2LWQaYOJbhpUYv/tplSMQ==
X-Received: by 2002:a05:600c:1f0d:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-4389143923bmr258333605e9.24.1737729560727; 
 Fri, 24 Jan 2025 06:39:20 -0800 (PST)
Received: from ?IPV6:2a01:599:922:1046:67aa:7b35:f780:c8fc?
 ([2a01:599:922:1046:67aa:7b35:f780:c8fc])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb101sm2947300f8f.66.2025.01.24.06.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 06:39:19 -0800 (PST)
Message-ID: <d4e234c1-d200-42ec-8667-031f6e4953f1@redhat.com>
Date: Fri, 24 Jan 2025 15:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM atomics
 in Nouveau" still getting used in practice?
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
 <20250124141121.GY5556@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250124141121.GY5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LxVtH2Td_Wh5xHZuDdhbbb6Pel34iyJ_pHuYBbaa7cw_1737729561
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

On 24.01.25 15:11, Jason Gunthorpe wrote:
> On Fri, Jan 24, 2025 at 11:44:28AM +0100, David Hildenbrand wrote:
> 
>> There are other concerns I have (what if the page is pinned and access
>> outside of the user space page tables?). Maybe there was not need to handle
>> these cases so far.
> 
> I think alot of this depends on userspace following some restrictions
> so that the pages are always convertible. Presumably if the userspace
> breaks things then their atomic using GPU kernels will fault.
> 
> So, from a kernel perspective, I'd suggest that creating a reasonable
> set of conditions that userspace can follow to have it work reliably
> is a reasonable goal.

Yes, that's my assumption as well. If you register a page using io_uring 
as a fixed buffer and then trigger "device_exclusive" access, the page 
can still be read/written using io_uring and atomics might not work as 
expected. "Not supported".

-- 
Cheers,

David / dhildenb

