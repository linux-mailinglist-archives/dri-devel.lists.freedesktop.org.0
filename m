Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D0C5B1CB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818C610E996;
	Fri, 14 Nov 2025 03:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QtOWv80J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1834D10E996
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:25:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b7291af7190so225376466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763090748; x=1763695548; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BOAaIJj5XwJhKO1WBdjW9luvIK9JXdag1HuhMw79QE=;
 b=QtOWv80J6DzVgZqRRE7XFzKVDGI1txZgO5EHveA6/JT6RULtGaf+c8NQYRHv/4+MAu
 mz+uXGOtli4v1beso9FVQycHmWECXBrnguvM6Xpj5KG5ULdyI2sfeUnAz9CTwOuVC1Cs
 gjWFNOwO5QzQcv1SOiVPxGzffg/V4j/DPN5H/I7/yraDpZPmQ+nW5GvWxeYy4UBG8l01
 B6c7ukiWIN7GNLFbziLgWw+iSGRlHgRb6AI2j93nr7ZQnRafZ/fzoqo5QD3rmflK7CVf
 1opPHfH4ykS4COgJsqxaoV5odwKP1zpJ4Q3p/IuV018TXIcQ+13BGJICr75JpMqHwEil
 wVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763090748; x=1763695548;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8BOAaIJj5XwJhKO1WBdjW9luvIK9JXdag1HuhMw79QE=;
 b=UGOVoVEToO5YOhQMga6gSkXMw+BW8W0xCs3N2HLPR2gz2XMPa6APcnqFudG5GWG+J8
 Me/8/Ih0JTU1CJ81JTWbQTEgEmf7u3WAYzPRuTAdUJ2oI1QyCC9R+ybRfkO79CCD7R5R
 rkb3vl0B2+OG2c+XGhMLTzAdJ7PP2rL5pLw0XCD0eRiQhOlqL6oDG7SE0ISHSjQ6SJCB
 0HJMIKtaAdNeQXSbImjAHWcvdgpdlvugGQZBqYUMZw1lAYdWecIm1AIl1lMeghZ3Mcu2
 vFNQM5JAFNJGkxBz6v3R4vP1dmFSnm1npVC10pD6ZVwq6NOuiJ7BxVdBnarlKqzgNN9E
 pckA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRm/QRzHsSDvHc1lkXWltEJzKOgURYzolApFSC68Kt8e/LDSg7qEpixpEDwX7TPKJm20NhiEcyIz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/VQys7hsKW/FH6FKf9NAXntK4BqHvShg4xDr4nex8+N6oWP61
 NL7wcTZJ1SgB/4itOWxWmAQSpmPPVDmqyQdKhMdsLqFTux9+1ZYLtPcdzMh0kA==
X-Gm-Gg: ASbGncu1sg6V2R8GXxBeX+kiBJzQ7WIuSXuMsoCSMC1/Y0CRKZySuX77LROY2WC0TNz
 rkKAaDy7909/NN+S1WM1jEXUQWPZmQwUmUFltqK3YGiO5FOmR+mEa6VzeJfUS3S32KxqhNxMyPd
 BhlL3u4QSb83fzCxokuzv8tCn//vAlWH+UGxE7C7j+YgWEgfKeT9fvjbv98vkQ46zSebJxyJUKj
 dzyeuqSSWF3Fx11hVRpylXgeEoWEds/nhbQRuPdJook34/zfcU2Tsi9e2LnfVEN+RXbAQsCGkLJ
 OLq/Frig1M0+/1jz0IbbiWDZvOL7NJfLjaBNF47BNd8XTnzltR7az0K3XZz/aybqAaItdAKL7OD
 gmeu8t2xUhCDYcUL0OJHhx+RDpSDZUG1qifimsP5CKVRKUXCJcTiOZUHbTNRmW6Bw9BQ/484As5
 4ip4+rzdUtVgcocg==
X-Google-Smtp-Source: AGHT+IEjsfUWKv0dMN7iEw++28D290GN2raAylUVWloG8c1aNiR9QCg2B1VyrKJNEtRpL0OsqHQ6aQ==
X-Received: by 2002:a17:907:3f1a:b0:b73:2fe3:db09 with SMTP id
 a640c23a62f3a-b73678f4722mr150819766b.34.1763090748488; 
 Thu, 13 Nov 2025 19:25:48 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb11f80sm291996866b.32.2025.11.13.19.25.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Nov 2025 19:25:48 -0800 (PST)
Date: Fri, 14 Nov 2025 03:25:47 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Message-ID: <20251114032547.bxw4koznsoqlov5d@master>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
 <20251114032105.sdkjaoiwpdmpynew@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114032105.sdkjaoiwpdmpynew@master>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 14, 2025 at 03:21:05AM +0000, Wei Yang wrote:
>On Fri, Nov 14, 2025 at 12:22:28PM +1100, Balbir Singh wrote:
>[...]
>>@@ -4079,6 +4091,36 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>> 	return ret;
>> }
>> 
>>+/*
>>+ * This function is a helper for splitting folios that have already been unmapped.
>>+ * The use case is that the device or the CPU can refuse to migrate THP pages in
>>+ * the middle of migration, due to allocation issues on either side
>>+ *
>>+ * The high level code is copied from __folio_split, since the pages are anonymous
>>+ * and are already isolated from the LRU, the code has been simplified to not
>>+ * burden __folio_split with unmapped sprinkled into the code.
>>+ *
>>+ * None of the split folios are unlocked
>>+ */
>>+int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>>+{
>>+	int extra_pins, ret = 0;
>>+
>>+	VM_WARN_ON_FOLIO(folio_mapped(folio), folio);
>>+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>>+	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>>+
>
>Compared with original logic, we did check folio_split_supported() and
>check whether new_order is supported for the file system.
>
>Currently folio_split_unmapped() only pass 0 as new_order, which looks good.
>But for a generic helper, it looks reasonable to do the check, IMHO.
>

BTW, I proposed to do the min_order/new_order check in folio_split_supported()
in [1], which may help to make the code looks cleaner.

[1]: lkml.kernel.org/r/20251107072944.zvqvr4kyibyofhuw@master

>>+	if (!can_split_folio(folio, 1, &extra_pins))
>>+		return -EAGAIN;
>>+
>>+	local_irq_disable();
>>+	ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
>>+						NULL, false, NULL, SPLIT_TYPE_UNIFORM,
>>+						0, extra_pins);
>>+	local_irq_enable();
>>+	return ret;
>>+}
>>+
>> /*
>>  * This function splits a large folio into smaller folios of order @new_order.
>>  * @page can point to any page of the large folio to split. The split operation
>
>
>-- 
>Wei Yang
>Help you, Help me

-- 
Wei Yang
Help you, Help me
