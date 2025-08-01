Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF734B1860A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 18:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50B810E294;
	Fri,  1 Aug 2025 16:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J5G5ckkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFCB10E294
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754067024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SYsDt9m5yC5GNXC3mMT2zgYZ8KAanzc8ZMb75eA5bZA=;
 b=J5G5ckkMxIkdLD8S8KtiYTEuq9urFHrRx+GY8HTUxweTJ+TxahQgnhZcV3LXN67s6FdZ20
 S55NIYTp0sUDxi40ff6NxnZ8tGcRevEbmhBnGeHZDQSBWmFtMvnnnhEfmUBb6UMtk6ROwc
 IvDvmWLSl1auMK9jhUTPITJLJaedAa8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-6q2aqI1JP4yyno-My-NDpg-1; Fri, 01 Aug 2025 12:50:23 -0400
X-MC-Unique: 6q2aqI1JP4yyno-My-NDpg-1
X-Mimecast-MFC-AGG-ID: 6q2aqI1JP4yyno-My-NDpg_1754067022
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45624f0be48so11460255e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 09:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754067022; x=1754671822;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SYsDt9m5yC5GNXC3mMT2zgYZ8KAanzc8ZMb75eA5bZA=;
 b=lzsYBzBD2vx4g6kFyxO5JUI8JlUXqesY4gRXjBaX6qAYJVK1/TCm1ve2jMBx/W39NR
 h7BWNwmgMgr98fUR8a9XEUTNcPV9Wf9WN/xyqBC1MUU03K4B7GcqB2o3kUE/YuW+LF5s
 Ejnnrp+useSd8W/pHVdo2H4nbifPu/TI7ELcECfmk4wYhMwLHB4Yj3xYiQxqazHp6dbD
 4/xeLVtEM3FL/x+0kobhzJDiNcxZvJ6c5gsJNh4yfX8hBSGIuR+CRvjKwInJ6sCRRGa5
 nOrxI/8yb2RVlvA8V/aZQbVkwE3vmN4K5aT/Q1ZthmkdQ1yhca6+m/XZoninBSjdZyI5
 vKKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXunoTU/dr5F2tXwKEDcHMF02OVr0LofGEalIOJv+BYbRQu1w68nw/yiiNvohZTGKq2VOK6/QUJ9hM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0VXDG+02HgnzB5871lYQaLTFLw75XBPOozzWVG+RLl5llxbRS
 qnJ7tbvUr9UBh6Orz8wTlgDRwviRGFPDPeBFDXxXNZIB3wKYDKosFYQaRUQ1PThnsVeTmlJIgd1
 6CrasDyTPsSncPgRBqx2zT/Na5vPafdGhvOn4A/OaTl/XjPZz4ioArTnKUCW5PWg9rXonOw==
X-Gm-Gg: ASbGncuSqwTMuByPEU6V3f9R8Bj+R9IwDEQ1jjL+E2nwVxjCT8dutaOBYkBVR+k416W
 5PdcBKkArxmr68iVARDLJdZxPtUPjsTDLlBFp71XY2jID+fKfIT3VXNz8Rq2cDW0nxbnLTnQ3wp
 fekM0k9gj6ixdgRy65o5YmlWh2ZopsCuQP4CxKhxCVPCxq43yX4BX1jG/PSduBFSXBO+iqg+b1e
 r5dhspjxDHYEBBiReuhAe2c8t2y5RSvykrNtws2PTfKzmn7aiflT5v4ue/HzsrMDLfRWi52H2ZU
 UBQ+HyHo6kiSKBSSrsFSix9W4uh6CJHjxmsfNmmEkksBT6pK5szf1swCZ9oFYgGYzzvGt5akot9
 Z4Grz1Oqq4pPWHZXoDL0Ih/MrGEudNdI4EXkrm8diCjnV6vggbYohG5TLlub9+Dv6
X-Received: by 2002:a05:600c:4703:b0:456:1560:7c5f with SMTP id
 5b1f17b1804b1-458b69dd754mr45145e9.14.1754067021758; 
 Fri, 01 Aug 2025 09:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUJvJDfGtRlezSck1ccdAzkOu3spyth3+j0p67V1PzuOsPCcnJLkOSxAdJi2jdJrgCyEaJaA==
X-Received: by 2002:a05:600c:4703:b0:456:1560:7c5f with SMTP id
 5b1f17b1804b1-458b69dd754mr44755e9.14.1754067021341; 
 Fri, 01 Aug 2025 09:50:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:7500:5f99:9633:990e:138?
 (p200300d82f2075005f999633990e0138.dip0.t-ipconnect.de.
 [2003:d8:2f20:7500:5f99:9633:990e:138])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c467994sm6378420f8f.50.2025.08.01.09.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 09:50:20 -0700 (PDT)
Message-ID: <b8009500-8b0b-4bb9-ae5e-6d2135adbfdd@redhat.com>
Date: Fri, 1 Aug 2025 18:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
To: Jason Gunthorpe <jgg@ziepe.ca>, Alistair Popple <apopple@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Yonatan Maman <ymaman@nvidia.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky
 <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org> <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
 <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
 <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
 <20250801164058.GD26511@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250801164058.GD26511@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: itXMzOwl9UPlUwFgkImodNxY6xE6rTw2lHYyJ-KmQTs_1754067022
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

On 01.08.25 18:40, Jason Gunthorpe wrote:
> On Fri, Jul 25, 2025 at 10:31:25AM +1000, Alistair Popple wrote:
> 
>> The only issue would be if there were generic code paths that somehow have a
>> raw pfn obtained from neither a page-table walk or struct page. My assumption
>> (yet to be proven/tested) is that these paths don't exist.
> 
> hmm does it, it encodes the device private into a pfn and expects the
> caller to do pfn to page.
> 
> This isn't set in stone and could be changed..
> 
> But broadly, you'd want to entirely eliminate the ability to go from
> pfn to device private or from device private to pfn.
> 
> Instead you'd want to work on some (space #, space index) tuple, maybe
> encoded in a pfn_t, but absolutely and typesafely distinct. Each
> driver gets its own 0 based space for device private information, the
> space is effectively the pgmap.
> 
> And if you do this, maybe we don't need struct page (I mean the type!)
> backing device memory at all.... Which would be a very worthwhile
> project.
> 
> Do we ever even use anything in the device private struct page? Do we
> refcount it?

ref-counted and map-counted ...

-- 
Cheers,

David / dhildenb

