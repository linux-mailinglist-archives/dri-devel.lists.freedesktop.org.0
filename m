Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1679B997A3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E93F10E6F5;
	Wed, 24 Sep 2025 10:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bWV9XGoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1150210E6EE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758710780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qgD8ucCUUYFMmg2u8cfnHO93saNGNzb3fowMQ2xbAZs=;
 b=bWV9XGoLA/8vUohZFpmmMaD4/WBcddCZ+rJDuJE0JLzqDGvYPiANk54XveHdfX+stqWfB1
 GNJlpuA0dEd29KLyT7DVuJhzUHcy/6w8MRKR1q0mxogZuBvZhLcvyxtT4/QgTh3D5/h1bh
 XHtLw59W71KbFe3oNySFxOCxblbUxjU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-ZafRtPyDPZ-vfOw3oEqrMQ-1; Wed, 24 Sep 2025 06:46:19 -0400
X-MC-Unique: ZafRtPyDPZ-vfOw3oEqrMQ-1
X-Mimecast-MFC-AGG-ID: ZafRtPyDPZ-vfOw3oEqrMQ_1758710778
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3f3c118cbb3so4336026f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 03:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758710778; x=1759315578;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgD8ucCUUYFMmg2u8cfnHO93saNGNzb3fowMQ2xbAZs=;
 b=TgpNT43HOFJ97ivOoVNcnLq6b6WX1Bx5QSIajPPedQPnZQRRaJhljZM1LD6bQ2+tfg
 2W26iqKYOBvXjWM6cErGe0IDyIITI6xiIzZMZwHVECltoK9LFfBArQfbokEUNW+Gj6/f
 Dz/cywEmCnfc0IkR2NIDqtohfOOVlDXnEoHIZEuBOov0I8Mml1tsxNr3KVdMgZzVJvMH
 eFkGEOxEikOfrCyR9gL/6hpevcnPKmZznN/1uy4nObmaBbd3r07K1k/n99UI/CT0298s
 CjMO0Sp/l9ireqtCnfVmy23E3jLyc02EAZzdINR0KFXWWW0hy3IeuotYDJ9oROx0MiU6
 78rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyhIq9G30ZW28l4RIgkVX5ISPeOQmM8YdYzvJezLf6W0sgdNoLvPn/XyCCNHi2VhXXpZ2JIfZnZYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi3NpaFIz1oUCISaHD8I9KRlR3B40xW0YubJZJ057zpSlgzCAC
 89OzWoDtSK9jno9OBXMzg6hogl1bA9phHsa5PsKGiNEl+u2Axg7pyS3EAf6Qc6suOg5can61GyI
 j5OONB7AA4L7bc/buhhzF2Sz2r6R9rioqTLZCM6+NX3Qnnbax7E7upqOf7usjuwPOyQjlyA==
X-Gm-Gg: ASbGncvLl2lcn9i2VCgQugP6wueMTfEaavXNYPUT90wHFIfStU5F3G7DNidSbHq818e
 b19gvZt8gPP5GTMHRMopyleaK45x9NSuFkSKUoK8kJbI5qD85VWI/VuLWXzkufucNadwnyE2t+x
 6TAyFqBgBUWZm1LoDj43mO/OeghrnWm7S2hmulQPT43hvELI5XQyYZ7id8TaPN9O2wytpAHt8zM
 ULm2isYW92SIHKtxC87w5dvMqYUWQCElyF8Lc7h+Qjy7recDpfNZ2UUdFs/oTGzWunFKdb8ZL7l
 jzVYCDqGhsYFnh68WDguRknpZDQADZ+pxnyRh5DIPATjA3ro353MEsM5e2FPg1sd0qRR5YVBwu/
 jcfB80WnZOmVKRPF4Z+T3765HG5kNk2oF1tl+dUrMtLjpVa5twMCn5eZSOdRe0bO/Rg==
X-Received: by 2002:a5d:40ce:0:b0:40d:86c9:5c9e with SMTP id
 ffacd0b85a97d-40d86c95d49mr287813f8f.40.1758710778102; 
 Wed, 24 Sep 2025 03:46:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1z5A9gGfOB4BPaBPx10lxb0eBipD/XjTy7i8GSxVaO2FgZTrlGe/MwQC8lJQLa3HUOJX0sQ==
X-Received: by 2002:a5d:40ce:0:b0:40d:86c9:5c9e with SMTP id
 ffacd0b85a97d-40d86c95d49mr287774f8f.40.1758710777676; 
 Wed, 24 Sep 2025 03:46:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f14:2400:afc:9797:137c:a25b?
 (p200300d82f1424000afc9797137ca25b.dip0.t-ipconnect.de.
 [2003:d8:2f14:2400:afc:9797:137c:a25b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f0e28c83d6sm22849574f8f.56.2025.09.24.03.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 03:46:17 -0700 (PDT)
Message-ID: <5844893c-66dc-4cfc-9a23-12bf24b55ee4@redhat.com>
Date: Wed, 24 Sep 2025 12:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 03/15] mm/rmap: extend rmap and migration support
 device-private entries
To: Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, SeongJae Park <sj@kernel.org>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-4-balbirs@nvidia.com>
 <D4440A30-118E-40DF-99BD-6F58B708E597@nvidia.com>
 <1b896491-d9c0-4c8d-bc60-47579c773dce@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <1b896491-d9c0-4c8d-bc60-47579c773dce@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6JvEplqjXv4ViQEZMfzIwbjqStum7sx7yGrjb9oyOgw_1758710778
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


>>> +			if (!pmd_present(entry))
>>> +				continue;
>>> +			if (!pmd_dirty(entry) && !pmd_write(entry))
>>>   				continue;
>>>
>>>   			flush_cache_range(vma, address,
>>> @@ -2330,6 +2332,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>>   	while (page_vma_mapped_walk(&pvmw)) {
>>>   		/* PMD-mapped THP migration entry */
>>>   		if (!pvmw.pte) {
>>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>> +			unsigned long pfn;
>>> +			pmd_t pmdval;
>>> +#endif
>>> +
>>
>> This looks ugly. IIRC, we now can put variable definition in the middle.
>> Maybe for this case, these two can be moved to the below ifdef region.
>>
> 
> I can't find any examples of mixing declarations and could not find any clear
> guidance in the coding style

Rather not do it :)

__maybe_unsed might help avoiding the ifdef.

-- 
Cheers

David / dhildenb

