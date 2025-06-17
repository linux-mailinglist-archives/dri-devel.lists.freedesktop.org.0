Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFAAADC6F8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 11:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE2910E5B5;
	Tue, 17 Jun 2025 09:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HmKjjMs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04F310E590
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750153767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
 b=HmKjjMs/VIYl3mPRFW5JOVuhfBBOmt63R/T8ygMLbzWxk8lZNFxM3Zy34kgYZjF4Yd4KNk
 LgMuDo79a6JMHxkNdgBp3eFFhAIu1NCWm25E5hc8ZAO39RK8qPIMdVgvD7/7aB30lwkeLj
 SuVHGNaIrKI6qr7fDU9M94Lty1VeB44=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-U8VGCtPPNDq9_03Sqg5XOg-1; Tue, 17 Jun 2025 05:49:24 -0400
X-MC-Unique: U8VGCtPPNDq9_03Sqg5XOg-1
X-Mimecast-MFC-AGG-ID: U8VGCtPPNDq9_03Sqg5XOg_1750153763
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-450df53d461so45170775e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 02:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750153763; x=1750758563;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
 b=lR9ZlagtvndpIhMBDRE2SAO3CYoBS6u7dvwjQ+LS9UgLpc/4MjwHJl1Pq+IEoUq6EU
 hmBwy8b1yb1D/MueUWIzPw0WX0N+aVGbTXZmcNBmJMYCDdwtcj54hJPehZRhIMCBPlT1
 ecrUTVcmySYboe1txh6nuXHhv6yrNE/bAn/402V7wQ4uqhH45EGG4n61Jgsh3MeqJtEV
 r1cvc29JsP55/f6oIS6q508ivy2riB7yKOJf7rZ2E6tTET9QU717KnAw0qE4oF8LGi4H
 NCdO6ntECv0kr5TckH62jh5hv4o0DXB4bh5J9xSJpwuFEcRUwGhWSh6lLyxslCy0WGaF
 wdsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlJfJHAYhUpdch3fuwXCJM/Gs5AaPspOMYS9ATf6QxRAjICW01ZY1nB8IHZfQqK2pREH06L+SFaJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9jywKdvwxu05Ez4N4qx+9t/p2MCPNR3Elggr0HYBMx42nE9HL
 OpfzcW0tALeNjKqXoqeaZAg1DUcsGOZEWZvhfu9pl/QhbQ8hpOXE+sycuA9DrOrXJkht1YQeNgz
 jk4WZ876t+rqaqqyU5bw+eT1javI1OseUYV67l6EZYo2pPFm/6sTUu/A8Knsa0iYOd2+gOA==
X-Gm-Gg: ASbGncvc3Lfk5G4p0gr4saQmAwh+2bCM1/D6hacw6Kuxtu5MdVUpURTvuThroU76fD9
 drs9EIxqGXcdFSwc5B/C827OkX9/cTrMmxlGWzaXv16XCQ5+ck5504PQECqrvGV3nKEVuOGzDWI
 9VPckmj+02kVEpaCM1gNeCLnOBGwp2+J1qWLf8GooL/O9oqOyVxFoqtevStGtySCZpq/Nu9BmF/
 IhGsJ2GiymzVEURWs+pNEl0ARVhGQ0yCfqe2FyZ4Nf+3UMI8PKd8uCO2YAAa1tuif8GzosGRfsa
 cxI9kYrksk4YxRkvYC22cDE3HvEA69tsZOmfTlT0WcnRKIZzsbTeCkpxOCQjvLOvA8QPnvAkidx
 XAI+mQZDi8t1O486pxGZ0sFrCtALOAHzXcazujYfky8ftYV4=
X-Received: by 2002:a05:600c:8b66:b0:43d:1b74:e89a with SMTP id
 5b1f17b1804b1-4533ca71c4cmr120176455e9.9.1750153763458; 
 Tue, 17 Jun 2025 02:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXZNQ8PD9qufR5L3UGiEianFrRGislf+YnSmpb1KcTqInns51iN3qzkWWM7hMwKXRBlIkEGg==
X-Received: by 2002:a05:600c:8b66:b0:43d:1b74:e89a with SMTP id
 5b1f17b1804b1-4533ca71c4cmr120175955e9.9.1750153763021; 
 Tue, 17 Jun 2025 02:49:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490?
 (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de.
 [2003:d8:2f31:700:3851:c66a:b6b9:3490])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a578510edcsm9430995f8f.8.2025.06.17.02.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:49:22 -0700 (PDT)
Message-ID: <6bb233ef-5e56-4546-b571-6a5f052d8b45@redhat.com>
Date: Tue, 17 Jun 2025 11:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] mm/huge_memory: Remove pXd_devmap usage from
 insert_pXd_pfn()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <67bc382c49ed8b165cfbd927886372272c35f508.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <67bc382c49ed8b165cfbd927886372272c35f508.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tAhxPWvIDIUgiIvS2hUAseNG3JGrV9gxBX8NWoC_TBA_1750153763
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

On 16.06.25 13:58, Alistair Popple wrote:
> Nothing uses PFN_DEV anymore so no need to create devmap pXd's when
> mapping a PFN. Instead special mappings will be created which ensures
> vm_normal_page_pXd() will not return pages which don't have an
> associated page. This could change behaviour slightly on architectures
> where pXd_devmap() does not imply pXd_special() as the normal page
> checks would have fallen through to checking VM_PFNMAP/MIXEDMAP instead,
> which in theory at least could have returned a page.
> 
> However vm_normal_page_pXd() should never have been returning pages for
> pXd_devmap() entries anyway, so anything relying on that would have been
> a bug.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes since v1:
> 
>   - New for v2
> ---
>   mm/huge_memory.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index b096240..6514e25 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1415,11 +1415,7 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>   	} else {
>   		entry = pmd_mkhuge(pfn_t_pmd(fop.pfn, prot));
> -
> -		if (pfn_t_devmap(fop.pfn))
> -			entry = pmd_mkdevmap(entry);
> -		else
> -			entry = pmd_mkspecial(entry);
> +		entry = pmd_mkspecial(entry);
>   	}
>   	if (write) {
>   		entry = pmd_mkyoung(pmd_mkdirty(entry));
> @@ -1565,11 +1561,7 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
>   		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
>   	} else {
>   		entry = pud_mkhuge(pfn_t_pud(fop.pfn, prot));
> -
> -		if (pfn_t_devmap(fop.pfn))
> -			entry = pud_mkdevmap(entry);
> -		else
> -			entry = pud_mkspecial(entry);
> +		entry = pud_mkspecial(entry);
>   	}
>   	if (write) {
>   		entry = pud_mkyoung(pud_mkdirty(entry));


Why not squash this patch into #3, and remove the pmd_special() check 
from vm_normal_page_pmd() in the same go? Seems wrong to handle the 
PMD/PUD case separately.

But now I am confused why some pte_devmap() checks are removed in patch 
#3, while others are removed in #7.

Why not split it up into (a) stop setting p*_devmap() and (b) remove 
p*_devmap().

Logically makes more sense to me ... :)

-- 
Cheers,

David / dhildenb

