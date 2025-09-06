Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D440B469B0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 09:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1C110E2AC;
	Sat,  6 Sep 2025 07:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IlGUS0Kg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F96E10E2AC
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757142062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T2JJG+ZfsCIb5mNyWFksWhvinuGju8fueKzmBULEe5U=;
 b=IlGUS0KgviUdywWEmWlQIzofTch1UaixjCcG56aZddtUG/fk4UAAW+w/k7g7NYejNeKjFt
 q9immxUmTTV/umAuodg3Uzw9w/GPnhmYAUL/dtJgVyx7zgdVTmtohlz2rYICK/wLPyLpR1
 pQkAsLX9w+wRYWZegd+eHSenlR2WT9M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-jlHxgx9BMuuuDhJRvQDBXA-1; Sat, 06 Sep 2025 03:00:59 -0400
X-MC-Unique: jlHxgx9BMuuuDhJRvQDBXA-1
X-Mimecast-MFC-AGG-ID: jlHxgx9BMuuuDhJRvQDBXA_1757142058
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3e5190bcba1so797300f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 00:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757142058; x=1757746858;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2JJG+ZfsCIb5mNyWFksWhvinuGju8fueKzmBULEe5U=;
 b=umotVpz0VAoHVtoHG0/ehVBYy7v+A0WXWCvCI5n9MT5xmo7liuDNGJ+c/Rt+Qxb511
 Jl2+DoFCVZNgtias8COk0Efu/wmLydDJXBgmvr01Xs8j8URLT+7IjY80inScBtIl+pit
 oRMgfoCc/ExhNsw8wTTluIV9ZG6+8E49P9leIem6iRXS2bLzpF7wEyWm34HbJJdTJ9sp
 +gRGTk/k/yDsktZUNcKWyKyEEm+wdKSnMroFD1E6Awdc6FU99Y25bAlC80Pt+DwBBAdq
 KG/xToDIYzz7oEE6p0p81N4LeVC1lOI8ag0AwhmZ7BWxnokPitbX/9hwyqknx5wiQA5X
 nO3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA1+5jEWpklnIcSRDIruhyCLJfB7V4L/zhGjqfbvUPQv46qR6iDT6vvSRfOhPVwGcJrX92inRF92E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh5X0ums1Lj7VFWxAJNNP7KJYuc9b4/NHSCL6wkE8QoCsZy4cz
 O0UQ54HiXgyQPPaB9JU78UwfQLCkRlXs0ZL5NK/enOfMNcMiVpQIFOYB0obbNAx2d49s6rJjvJT
 sleTy36CKjDQfS5t0BkKFvUuFC84WBsfFCQCH2C/0+PbNXNWwnodN0wpxXTXae+kaKu6Ftg==
X-Gm-Gg: ASbGnctdfrppx2raiE1NvZn4XtBcCLtDJTgUOpOkMTZlHqNGQzVhhhEGflDpwYevuGA
 qlgTn4qrJ2INev/DOmYKCkAv81ocyzkQvFfhVirj0M0TsNBWYgKhErrllvf3yJqbU3MdN2BxB4V
 geGRgUd0VBImrGZjpp45Tk0vZ2Et/qi1VaAW5wdmRnfDevogTe/zePy9UmqKEsMG6s73nR/Pe2g
 X5hgb2CkzP84PQfAxpRn2fzBn4YKP/FQcsqBtvzsm/sRHohQ3XUmnBY9ZQdx0RQS9u+P/WpX1hQ
 W7BrjHfO+QNBEiEgQV4Lan3czksOU4qyHc3i1IgHpcVrHYiXSF3+AanOiVXjkSNJfEQ6qxSXj61
 wPxntwBrOL5yBXBrZWn7Yqd5qI/KhMdZoenc52ggo2C6EiyIsu6sRDBfgRa9MFgnu4UQ=
X-Received: by 2002:a5d:5f87:0:b0:3e2:804b:bfed with SMTP id
 ffacd0b85a97d-3e64c1c2183mr835272f8f.42.1757142058284; 
 Sat, 06 Sep 2025 00:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdr4VmZX14HWt6vWJrgVQl61309Yoz3EBz+B4BvfuTuYDfgHO59nfbR4v+s7YipRZZX7VN6g==
X-Received: by 2002:a5d:5f87:0:b0:3e2:804b:bfed with SMTP id
 ffacd0b85a97d-3e64c1c2183mr835230f8f.42.1757142057809; 
 Sat, 06 Sep 2025 00:00:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f30:de00:8132:f6dc:cba2:9134?
 (p200300d82f30de008132f6dccba29134.dip0.t-ipconnect.de.
 [2003:d8:2f30:de00:8132:f6dc:cba2:9134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf3458a67fsm6794555f8f.62.2025.09.06.00.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Sep 2025 00:00:56 -0700 (PDT)
Message-ID: <815cbde4-a56d-446d-b517-c63e12e473de@redhat.com>
Date: Sat, 6 Sep 2025 09:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
From: David Hildenbrand <david@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
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
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
 <016307ba-427d-4646-8e4d-1ffefd2c1968@nvidia.com>
 <85e760cf-b994-40db-8d13-221feee55c60@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <85e760cf-b994-40db-8d13-221feee55c60@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q1RbE3-b7lvstcp_aiZ0XVbIagz5slByu2sAzJgQWek_1757142058
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


>    	pmdp = pmd_offset_lockless(pudp, pud, addr);
> @@ -3046,23 +3041,21 @@ static int gup_fast_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr,
>    
>    		next = pmd_addr_end(addr, end);
>    		if (!pmd_present(pmd))
> -			return 0;
> +			break;
>    
> -		if (unlikely(pmd_leaf(pmd))) {
> -			/* See gup_fast_pte_range() */
> -			if (pmd_protnone(pmd))
> -				return 0;
> +		if (unlikely(pmd_leaf(pmd)))
> +			cur_nr_pages = gup_fast_pmd_leaf(pmd, pmdp, addr, next, flags, pages);
> +		else
> +			cur_nr_pages = gup_fast_pte_range(pmd, pmdp, addr, next, flags, pages);
>    
> -			if (!gup_fast_pmd_leaf(pmd, pmdp, addr, next, flags,
> -				pages, nr))
> -				return 0;
> +		nr_pages += cur_nr_pages;
> +		pages += cur_nr_pages;
>    
> -		} else if (!gup_fast_pte_range(pmd, pmdp, addr, next, flags,
> -					       pages, nr))
> -			return 0;
> +		if (nr_pages != (next - addr) >> PAGE_SIZE)
> +			break;

^ cur_nr_pages. Open for suggestions on how to make that thing here even 
better.

-- 
Cheers

David / dhildenb

