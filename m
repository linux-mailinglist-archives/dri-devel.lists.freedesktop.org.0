Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3DA229E3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 09:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1981010E2C3;
	Thu, 30 Jan 2025 08:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZLbJtHOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696C910E2C3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738227386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pnLOL5siwR5BxEAjycoT3uYFK6h+TWN9CY8uLMr9KK4=;
 b=ZLbJtHOoqadsrg54CwC5whaS3T3Csg9lchz7zFnnhIoOCLxgWfSDz4Kq2TmgGYQPI/VaCu
 tr4pHlNkOO1iNDo9C+E3rEPcC0daMcpJ1MvacK0cRvQ2h43mXiUTEpdh9k5DpT9RUhuSW1
 eY1swrysH8zFeKzeAgjuSNpAHkUQulI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-ZFTpjs6oOOmYlQQdPxPsWQ-1; Thu, 30 Jan 2025 03:56:25 -0500
X-MC-Unique: ZFTpjs6oOOmYlQQdPxPsWQ-1
X-Mimecast-MFC-AGG-ID: ZFTpjs6oOOmYlQQdPxPsWQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4362b9c1641so2227465e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 00:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738227384; x=1738832184;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pnLOL5siwR5BxEAjycoT3uYFK6h+TWN9CY8uLMr9KK4=;
 b=B05orcrqV+j5O6CF8lEzHqj8Mnw7POFiSmUIoeY9WOgJRSvPIENOZWB5qbHvWTIPH8
 xxmAAYghdKacaEPx+I+qsxXzyocM1EGsd8jypKGua/HTBhUjVLtbNs7VNpjei4HmQCuM
 J4aUxPqWSOXw7/5pnukgf1H4F340d5YM5Gcsy93llWGYto4NZaptAPvCRIf0BtD5ol0u
 05MXx21ZLOBIY8QQQLesxk3laV2hge07325eJqrgKUn/xW1WmeFe8AZlGSbLMLq+VTTa
 Ssh85O36+bbOZGQpGJkwsAz3YdgVPOeP3H5j1H0RwDfVL5Efi+e538Q2bn63TcneC6++
 +GIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUBnTBeGRy2XsLWwCiZclBjwZzP7gAOPRInBxiucm8RBlmQabFVgd9ZVrjnzAynYj6XIZVz+c9PWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWDCwqOuDucaOVVDhL8WTk04RUFYuuD+Ju04gJE3G+SLw7ikZV
 9g04wjwAPT3ZdoRwhugKCOU9Kk1MRQE9D3Q9EkW37eACqOiQHFS/NANruqYHrlgQWTSRfTuZAeO
 r9gy+CIpFoKQjE7Na4ExhqfSY+h460N9ecHSF+bWDnGwizZnlOLJQRd8lTTo9spnXLA==
X-Gm-Gg: ASbGncvF2Qx5VGYEcHsEZZzQ0zRFBvUsi+PbRc2DkzlSBlB47wttY32LrfHv7Lc83Xn
 HJ5KJ0rEWbl7XT7u8Vz0fe5sX/Enan9v2Fvm54QZk99YPIkcraxshbrrZi8sX/AqkmDHP03a16J
 +sXedsEE/WdDFB4Pahp7P4/ZlsGAaxzbIzKuFpaiz0U8CjRMWqrmd1jM4O0GIYBxfE1XNHiHXJf
 ghCa1j11JbpCPJBWTnOf1d1M7vJj6oy2OCJbEg98+ylsegD+0BXpQ7gEUj1FqXhr+KSD4sB5fxg
 nnxkGx4Ag60rRytvCFA0Ypj1x2xUeqq/juVnnsuB/g/q
X-Received: by 2002:a05:600c:212:b0:434:f270:a4f0 with SMTP id
 5b1f17b1804b1-438e07cd591mr27629315e9.21.1738227383870; 
 Thu, 30 Jan 2025 00:56:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0itvGVCZG4RumRuf7h8v/horjGNz+EfGmPAGziGyVncpeWB3PI5aSg4IcsH6VSUET2T0htg==
X-Received: by 2002:a05:600c:212:b0:434:f270:a4f0 with SMTP id
 5b1f17b1804b1-438e07cd591mr27628995e9.21.1738227383450; 
 Thu, 30 Jan 2025 00:56:23 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41?
 ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6df36sm53447555e9.25.2025.01.30.00.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 00:56:22 -0800 (PST)
Message-ID: <b363847b-a1d6-41f0-9f81-d97923382bb3@redhat.com>
Date: Thu, 30 Jan 2025 09:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/12] mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 stable@vger.kernel.org
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-2-david@redhat.com>
 <24e88fec-65b5-47ad-8833-67257f86fde5@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <24e88fec-65b5-47ad-8833-67257f86fde5@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 49JB90kV0PlpuOV0x2T-bS2b-XMpHJDZei8eMwllGXU_1738227384
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

On 29.01.25 22:42, John Hubbard wrote:
> On 1/29/25 3:53 AM, David Hildenbrand wrote:
>> We only have two FOLL_SPLIT_PMD users. While uprobe refuses hugetlb
>> early, make_device_exclusive_range() can end up getting called on
>> hugetlb VMAs.
>>
>> Right now, this means that with a PMD-sized hugetlb page, we can end
>> up calling split_huge_pmd(), because pmd_trans_huge() also succeeds
>> with hugetlb PMDs.
>>
>> For example, using a modified hmm-test selftest one can trigger:
>>
>> [  207.017134][T14945] ------------[ cut here ]------------
>> [  207.018614][T14945] kernel BUG at mm/page_table_check.c:87!
>> [  207.019716][T14945] Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
>> [  207.021072][T14945] CPU: 3 UID: 0 PID: ...
>> [  207.023036][T14945] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
>> [  207.024834][T14945] RIP: 0010:page_table_check_clear.part.0+0x488/0x510
>> [  207.026128][T14945] Code: ...
>> [  207.029965][T14945] RSP: 0018:ffffc9000cb8f348 EFLAGS: 00010293
>> [  207.031139][T14945] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: ffffffff8249a0cd
>> [  207.032649][T14945] RDX: ffff88811e883c80 RSI: ffffffff8249a357 RDI: ffff88811e883c80
>> [  207.034183][T14945] RBP: ffff888105c0a050 R08: 0000000000000005 R09: 0000000000000000
>> [  207.035688][T14945] R10: 00000000ffffffff R11: 0000000000000003 R12: 0000000000000001
>> [  207.037203][T14945] R13: 0000000000000200 R14: 0000000000000001 R15: dffffc0000000000
>> [  207.038711][T14945] FS:  00007f2783275740(0000) GS:ffff8881f4980000(0000) knlGS:0000000000000000
>> [  207.040407][T14945] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  207.041660][T14945] CR2: 00007f2782c00000 CR3: 0000000132356000 CR4: 0000000000750ef0
>> [  207.043196][T14945] PKRU: 55555554
>> [  207.043880][T14945] Call Trace:
>> [  207.044506][T14945]  <TASK>
>> [  207.045086][T14945]  ? __die+0x51/0x92
>> [  207.045864][T14945]  ? die+0x29/0x50
>> [  207.046596][T14945]  ? do_trap+0x250/0x320
>> [  207.047430][T14945]  ? do_error_trap+0xe7/0x220
>> [  207.048346][T14945]  ? page_table_check_clear.part.0+0x488/0x510
>> [  207.049535][T14945]  ? handle_invalid_op+0x34/0x40
>> [  207.050494][T14945]  ? page_table_check_clear.part.0+0x488/0x510
>> [  207.051681][T14945]  ? exc_invalid_op+0x2e/0x50
>> [  207.052589][T14945]  ? asm_exc_invalid_op+0x1a/0x20
>> [  207.053596][T14945]  ? page_table_check_clear.part.0+0x1fd/0x510
>> [  207.054790][T14945]  ? page_table_check_clear.part.0+0x487/0x510
>> [  207.055993][T14945]  ? page_table_check_clear.part.0+0x488/0x510
>> [  207.057195][T14945]  ? page_table_check_clear.part.0+0x487/0x510
>> [  207.058384][T14945]  __page_table_check_pmd_clear+0x34b/0x5a0
>> [  207.059524][T14945]  ? __pfx___page_table_check_pmd_clear+0x10/0x10
>> [  207.060775][T14945]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
>> [  207.061940][T14945]  ? __pfx___lock_acquire+0x10/0x10
>> [  207.062967][T14945]  pmdp_huge_clear_flush+0x279/0x360
>> [  207.064024][T14945]  split_huge_pmd_locked+0x82b/0x3750
>> ...
>>
>> Before commit 9cb28da54643 ("mm/gup: handle hugetlb in the generic
>> follow_page_mask code"), we would have ignored the flag; instead, let's
> 
> ...and so after that commit (which doesn't touch FOLL_SPLIT_PMD, we no
> longer ignore the flag? At a first look at that commit, I don't quite
> understand the connection, can you clarify just a bit for me?

Sure! Before that commit we always went via hugetlb_follow_page_mask(), 
so we never ended up in follow_pmd_mask().

hugetlb_follow_page_mask() didn't check for the flag ("ignored it"), so 
we would not have crashed in GUP.

Thanks!

-- 
Cheers,

David / dhildenb

