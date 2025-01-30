Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D7DA23141
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 16:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A6810E9A5;
	Thu, 30 Jan 2025 15:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gxMLZj4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8115C10E9A5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738252624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qM4w+1es2FaHKiaH8UoDw9Cy8vwIlmWEd0tDR6y0hSI=;
 b=gxMLZj4mXtcBFDQEETK3jDv6f9HWHf4bsuWb1mRIXJ/tP2fYjYbLjKCMN91ooYmHFlEZMC
 LxF6KtJkMEzatqgavuuW7cHWIJtnFXp2Rf7NPWX45Xr28o3N/YlLnxwPW+aE+QqAb1/P48
 ZA4GynQW/Q3VJXlvYd6kdrqDjpXHGyY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-i4gwsas7OKyJuDwNz_vQkg-1; Thu, 30 Jan 2025 10:56:58 -0500
X-MC-Unique: i4gwsas7OKyJuDwNz_vQkg-1
X-Mimecast-MFC-AGG-ID: i4gwsas7OKyJuDwNz_vQkg
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4362b9c15d8so4629685e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 07:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738252617; x=1738857417;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qM4w+1es2FaHKiaH8UoDw9Cy8vwIlmWEd0tDR6y0hSI=;
 b=TGlIVPdKBtmiToY015Vvhy4/Ac1t1wEIAKe+X7MMlfUnwRHLBmmkcv5zIHgzkj30ny
 rzRJzZSnhxzzyISMvICu/AzRl1AEu8xtCPya1y8uc0GJEUeto+HLxBrJVFCnQmvkcdgK
 XIhbSKx0m5E9mYmeVkIJdI9iyfgqm0O+nsAY5hW1pHf/eEvdzEl+mazPrA5yDKevjT+0
 AT354b+moN/nJNHX4AGypnXnq6/slHT3GMtL5L2bcmdK5VMaWwsY4TcZ6jNXAlePNzM2
 ExWhzcfTFOh5qWA6Uck3BXz67pS1+oB/CdM8nvU50TWHfN3D3pLOcOw1hLv1UhTE7mI+
 0sTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbNhD2ciebWIRBVQZYQNoLJEpkGmAcNQgx59/FAkErxjpXxp/4RfWsH18xSa/QgC0KWD9wPBfr/o8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfkO8+Y158/xkMlXlnmFYqfuZv3kYeg3cYD2jLkbF8JVZYVXbg
 2cdx31wbJDAWqCK1T5z5BDxt6vBleoVyiFmVm/cEDThuxJvv3KtYe2UkQZCH+qC73nbr7FNikeW
 jKr9da8N+t8yltcluODmY1hY0FfeNZgS9i0KiJKCmySDMpftC1Lx3ORdEQvfQ0oSCHg==
X-Gm-Gg: ASbGnctQeZoPzoMvoRWZeEGBa/hTFZzZ71WhWpMeZIw5vYUVDYXP36xgf1jAClKfq7k
 UPsZ02C4sUpWsNXv1q9xvKwZQf5w6U1gkWOVuP57I9Adofe+wedahJHTPfrwEoisXKfyP7rnjen
 moN3rPWcUodfJEBr6NZDcwRxcdI7C7GCOX1Z5dqFT4D1QZjai4wZSWn2Y7/LvSyzfBKMskuN4Pt
 EZ9Sk7thtncQdWWzMAUnwAIjSKLvTlSAOrJC3ODo8oZElDuxUC1FJ6+hYCg5zqBk1lg9bF2bITD
 BwNV0m1U8srMAhjHNGbayLMutyIPJsmUgDAjiw4Sw0mDWnDgzNfnwnFsgyTsIQYS3NnVZtuP1XK
 87ZUmgdqeWlkQiWN9ikS57Lt67iFagHre
X-Received: by 2002:a05:600c:154f:b0:434:a367:2bd9 with SMTP id
 5b1f17b1804b1-438dc3ca79fmr78295355e9.14.1738252616874; 
 Thu, 30 Jan 2025 07:56:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLqpKxoaB1vnd8r+/yn1qDNliwYunVoFg0sF0T9rGcNmbMw4yKk/QmEFTvnqEpMXpqQwFnhg==
X-Received: by 2002:a05:600c:154f:b0:434:a367:2bd9 with SMTP id
 5b1f17b1804b1-438dc3ca79fmr78295145e9.14.1738252616483; 
 Thu, 30 Jan 2025 07:56:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb?
 (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de.
 [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6dfb5sm64700345e9.31.2025.01.30.07.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 07:56:55 -0800 (PST)
Message-ID: <84bc05e7-f47a-4941-a151-a3b2ab18ad62@redhat.com>
Date: Thu, 30 Jan 2025 16:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/12] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-4-david@redhat.com>
 <Z5uCw9nzN81B4N8Z@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5uCw9nzN81B4N8Z@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wzREFhuenxbFMW6DnP7GpKILImg3q6AbH9--2ut5yI0_1738252617
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

On 30.01.25 14:46, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 12:54:01PM +0100, David Hildenbrand wrote:
>> The single "real" user in the tree of make_device_exclusive_range() always
>> requests making only a single address exclusive. The current implementation
>> is hard to fix for properly supporting anonymous THP / large folios and
>> for avoiding messing with rmap walks in weird ways.
>>
>> So let's always process a single address/page and return folio + page to
>> minimize page -> folio lookups. This is a preparation for further
>> changes.
>>
>> Reject any non-anonymous or hugetlb folios early, directly after GUP.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Yeah this makes sense. Even for pmd entries I think we want to make this
> very explicit with an explicit hugetlb opt-in I think.
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Thanks, I'll fold in the following:

diff --git a/mm/rmap.c b/mm/rmap.c
index 676df4fba5b0..94256925682d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2525,6 +2525,10 @@ static bool folio_make_device_exclusive(struct folio *folio,
   * programming is complete it should drop the page lock and reference after
   * which point CPU access to the page will revoke the exclusive access.
   *
+ * Note: This function always operates on individual PTEs mapping individual
+ * pages. PMD-sized THPs are first remapped to be mapped by PTEs before the
+ * conversion happens on a single PTE corresponding to @addr.
+ *
   * Returns: pointer to mapped page on success, otherwise a negative error.
   */
  struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,


-- 
Cheers,

David / dhildenb

