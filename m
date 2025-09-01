Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518BDB3E1AC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 13:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFE010E08B;
	Mon,  1 Sep 2025 11:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Oi4kPtKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E7D10E08B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 11:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756726511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=89QceRiDVJR9qzpuoMtjZ42nHjE3zxx93/plzyge73k=;
 b=Oi4kPtKW6msMclc99VeFrwikaUAGGqFo1qJnSWm3pfX32GugEguMEBTt/RA9KGrQE3tb4j
 YtiYW6OJ1Nf+URcS2bvEOvL21+u3d0ZwUU+NiPfSgFJGlqRVG2YtLvYkpcs3/KyhMvLVUd
 76BrqD6X7mJLnFX2+Ua8oSR8rNiVpn4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-8xJ-wHcLMIWRuSB9cddYTA-1; Mon, 01 Sep 2025 07:35:10 -0400
X-MC-Unique: 8xJ-wHcLMIWRuSB9cddYTA-1
X-Mimecast-MFC-AGG-ID: 8xJ-wHcLMIWRuSB9cddYTA_1756726509
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a15f10f31so40239745e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 04:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756726509; x=1757331309;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=89QceRiDVJR9qzpuoMtjZ42nHjE3zxx93/plzyge73k=;
 b=LBr7jPct3IsSswCMypMEN5kSchtjmjE9lg7Kv/ic9q/BP2U6UDFOXuXWBLLVDjlEnl
 QQisAQQ8TI7gcASG57f4NTR2HvbFE3wFFgUKwvX3YEhSFvlluqLK+iEG87BeET71MBp8
 v2M7LOf3wHJIXdD5ZAslHAmkUg3FjeqJx4m/YkXd7b78MKYhR1+bltQ+PSF2uwZOZ2Ig
 8Ad0XQvMUbu0UquxTMxXTOdd3qCt5WWI2GfXIJLWEa8UDKOlYTR1Sfv1RrNmC7j1f9ia
 0qTyNXZryA7UOvYqvT/kldw1ljLXxTsUBtY2k/0yhUXIVA8rDIOnKzUpiCNu3qUWfe2i
 9IeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNLRd7s0fRtnzg9v3G21bSABrAwZ3cFQCcVs1zHuLJFErbhCL2r+OLwbat+70f47QWaRDfmh/J8NM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxuam1Uwa8roWAMm++N1mx8GZJbkWcOWi6U05hEMv9q8lHm3H6k
 vT7poEFAwfwKPOI8rpG5zXnV+lY7+3+nYpP0F/Uc3ZkRyFJe6/x+9UIAqSlNvKNVgYo2rcIFuKZ
 Q6gdu8fLcRrwmTK2pwwLsnehGV2VWcYpz4uvJMgavXubxLzjXPmJbdpK3D5KDBCCn6DUTQQ==
X-Gm-Gg: ASbGncu703CLS7PIy3ef9pX5fYN7yUwOXKokWgKaH1RfivfmOWMZZJK6LbMIoFo8oPf
 26H7i+rjT4xdiYUMPzfob+VQAEvCQlfSx7Dfz7jTavcA7uUw7BFI43/YugD1NZEybgcPq6kOvg7
 bRrHEpRyEb6PcWqemoRWjXFSyie/ykh7xIUynQ7o+bo8vI4zN5UvMq8p+Zgftr3LRN0Z2VwjIEU
 KaQrSo3C8PF7jaZufF8BpgEl1XSNekcKVQIb82JZEuVXO0h6T7yAF9OtTpvQ7VYsrxzkQ3mCZFx
 B0RvQiFlXPrcreETTve44Rcd94/fAM6oa6hjDZZt9mAEkUp6LOqj/VZ4Y869K4dKrdtKpJqAi9f
 yS7BYB5eblvOKJot4aW4zxLZE3PGUIvLSDcPeSL9BKXdD9QD7gBX+97U9NfLBfv70pLA=
X-Received: by 2002:a5d:5f8c:0:b0:3cf:5f17:f350 with SMTP id
 ffacd0b85a97d-3d1b16f0165mr6056409f8f.18.1756726508830; 
 Mon, 01 Sep 2025 04:35:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0RKJ8MgbrMGxtF+aataA+fh1iSiigcyDX0AK/3/6NRoLPIE0BwSmxJshAaTyrpOEmePBJCw==
X-Received: by 2002:a5d:5f8c:0:b0:3cf:5f17:f350 with SMTP id
 ffacd0b85a97d-3d1b16f0165mr6056350f8f.18.1756726508320; 
 Mon, 01 Sep 2025 04:35:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4?
 (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de.
 [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm233831875e9.5.2025.09.01.04.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:35:07 -0700 (PDT)
Message-ID: <44072455-fc68-430d-ad38-0b9ce6a10b8d@redhat.com>
Date: Mon, 1 Sep 2025 13:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/36] mm/gup: drop nth_page() usage within folio when
 recording subpages
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-19-david@redhat.com>
 <c0dadc4f-6415-4818-a319-e3e15ff47a24@lucifer.local>
 <632fea32-28aa-4993-9eff-99fc291c64f2@redhat.com>
 <8a26ae97-9a78-4db5-be98-9c1f6e4fb403@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <8a26ae97-9a78-4db5-be98-9c1f6e4fb403@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zyZ8TORb68l0oHK-Hg8ubhWGcVmcDwmxoDAddKsYum0_1756726509
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
>>
>> The nice thing is that we only record pages in the array if they actually passed our tests.
> 
> Yeah that's nice actually.
> 
> This is fine (not the meme :P)

:D

> 
> So yes let's do this!

That leaves us with the following on top of this patch:

 From 4533c6e3590cab0c53e81045624d5949e0ad9015 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Fri, 29 Aug 2025 15:41:45 +0200
Subject: [PATCH] mm/gup: remove record_subpages()

We can just cleanup the code by calculating the #refs earlier,
so we can just inline what remains of record_subpages().

Calculate the number of references/pages ahead of times, and record them
only once all our tests passed.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/gup.c | 25 ++++++++-----------------
  1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 89ca0813791ab..5a72a135ec70b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -484,19 +484,6 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
  #ifdef CONFIG_MMU
  
  #ifdef CONFIG_HAVE_GUP_FAST
-static int record_subpages(struct page *page, unsigned long sz,
-			   unsigned long addr, unsigned long end,
-			   struct page **pages)
-{
-	int nr;
-
-	page += (addr & (sz - 1)) >> PAGE_SHIFT;
-	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = page++;
-
-	return nr;
-}
-
  /**
   * try_grab_folio_fast() - Attempt to get or pin a folio in fast path.
   * @page:  pointer to page to be grabbed
@@ -2963,8 +2950,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
  	if (pmd_special(orig))
  		return 0;
  
-	page = pmd_page(orig);
-	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
+	refs = (end - addr) >> PAGE_SHIFT;
+	page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
  
  	folio = try_grab_folio_fast(page, refs, flags);
  	if (!folio)
@@ -2985,6 +2972,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
  	}
  
  	*nr += refs;
+	for (; refs; refs--)
+		*(pages++) = page++;
  	folio_set_referenced(folio);
  	return 1;
  }
@@ -3003,8 +2992,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
  	if (pud_special(orig))
  		return 0;
  
-	page = pud_page(orig);
-	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
+	refs = (end - addr) >> PAGE_SHIFT;
+	page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
  
  	folio = try_grab_folio_fast(page, refs, flags);
  	if (!folio)
@@ -3026,6 +3015,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
  	}
  
  	*nr += refs;
+	for (; refs; refs--)
+		*(pages++) = page++;
  	folio_set_referenced(folio);
  	return 1;
  }
-- 
2.50.1


-- 
Cheers

David / dhildenb

