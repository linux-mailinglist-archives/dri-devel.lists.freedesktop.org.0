Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B174DC0C1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D373B10EFF4;
	Thu, 17 Mar 2022 08:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15EC10EFEF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647504836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxA0Pce6UnOZWW6gsq8il76yFsehAiTQ6twP7i/3/GQ=;
 b=EhmOsdEdpAowyzL2NM8FZwnP/IZKpjeIU8idwBakox2YLIjXmVkOP507KK1QXZIEL10sOr
 KDRZoHls4NVOLNeRibz9jqP9KFKaH8+ANL1zELZIQkWaY2fTkWLk97Ww3dLiN3/RtEZZ+Z
 K/S/fxKnjWFMroDTW+UDm23VC37qCsY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-7gLd8RypN3y1nAjU5xPEww-1; Thu, 17 Mar 2022 04:13:53 -0400
X-MC-Unique: 7gLd8RypN3y1nAjU5xPEww-1
Received: by mail-wm1-f71.google.com with SMTP id
 o19-20020a05600c379300b0038c7117460dso1296989wmr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 01:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xxA0Pce6UnOZWW6gsq8il76yFsehAiTQ6twP7i/3/GQ=;
 b=ecrJKom6UGcS7shcZVk5oiHrre574r6PPOVCjys5beEbtgTbii8fj0TgI4ikDFim1x
 nyUzBIUsZl1cd1cvwREZ/6b/TepqQYlyPkPUi/hLAX2aeiV0jq3Cq9M9y7tWa/tizx/2
 QTOmk3OXEhaKYa/XIvz+/i+1jtaBJVZ5SjWZzy6gV4gzUB4XhXsMZ+G20RggNpD6ykRi
 wsk02MMN7289FMv4PbJpm52Z5qpUCvwHnoUB25IYMWeSbejocZetB0ncDwHiPC1ylxhf
 yzkUBc35ee4RpsYC0TkJ2l0p8t1b4IxIXV/9rDYiMR3ZqfK7baaOuzb70WtakV4Okt/e
 gbZw==
X-Gm-Message-State: AOAM533t2TgIWtxNJ6TXrogfZLL87d5D5SP9IwS1PsS1/FFMRFL4zT6O
 G6XLGKS9U90JjEuCFH7X84v+oasG5YcWBLZueZj5w4cv54rHmYTCdPYyV0gV7TJHuUpp6BNYiRF
 BNmrUmyS7DS5DyVWu2L0o4GYhdL0C
X-Received: by 2002:a05:6000:144a:b0:203:8688:35d with SMTP id
 v10-20020a056000144a00b002038688035dmr2896888wrx.399.1647504832457; 
 Thu, 17 Mar 2022 01:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkIygRnwahr8xhyLvIiK8lTpLSYuqqmv1avWZ31V4hbmg8hvmgWPIvr5DZvtTFDGtJ3e2QVw==
X-Received: by 2002:a05:6000:144a:b0:203:8688:35d with SMTP id
 v10-20020a056000144a00b002038688035dmr2896866wrx.399.1647504832168; 
 Thu, 17 Mar 2022 01:13:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:d000:22e9:afb1:c890:7468?
 (p200300cbc707d00022e9afb1c8907468.dip0.t-ipconnect.de.
 [2003:cb:c707:d000:22e9:afb1:c890:7468])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c410700b0038c72ef3f15sm2542317wmi.38.2022.03.17.01.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 01:13:51 -0700 (PDT)
Message-ID: <ab26f7a0-728e-9627-796b-e8e850402aae@redhat.com>
Date: Thu, 17 Mar 2022 09:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU
 handling
To: Alistair Popple <apopple@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20220310172633.9151-1-alex.sierra@amd.com>
 <20220310172633.9151-2-alex.sierra@amd.com>
 <07401a0a-6878-6af2-f663-9f0c3c1d88e5@redhat.com>
 <1747447c-202d-9195-9d44-57f299be48c4@amd.com>
 <87lex98dtg.fsf@nvdebian.thelocal>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87lex98dtg.fsf@nvdebian.thelocal>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.03.22 03:54, Alistair Popple wrote:
> Felix Kuehling <felix.kuehling@amd.com> writes:
> 
>> On 2022-03-11 04:16, David Hildenbrand wrote:
>>> On 10.03.22 18:26, Alex Sierra wrote:
>>>> DEVICE_COHERENT pages introduce a subtle distinction in the way
>>>> "normal" pages can be used by various callers throughout the kernel.
>>>> They behave like normal pages for purposes of mapping in CPU page
>>>> tables, and for COW. But they do not support LRU lists, NUMA
>>>> migration or THP. Therefore we split vm_normal_page into two
>>>> functions vm_normal_any_page and vm_normal_lru_page. The latter will
>>>> only return pages that can be put on an LRU list and that support
>>>> NUMA migration, KSM and THP.
>>>>
>>>> We also introduced a FOLL_LRU flag that adds the same behaviour to
>>>> follow_page and related APIs, to allow callers to specify that they
>>>> expect to put pages on an LRU list.
>>>>
>>> I still don't see the need for s/vm_normal_page/vm_normal_any_page/. And
>>> as this patch is dominated by that change, I'd suggest (again) to just
>>> drop it as I don't see any value of that renaming. No specifier implies any.
>>
>> OK. If nobody objects, we can adopts that naming convention.
> 
> I'd prefer we avoid the churn too, but I don't think we should make
> vm_normal_page() the equivalent of vm_normal_any_page(). It would mean
> vm_normal_page() would return non-LRU device coherent pages, but to me at least
> device coherent pages seem special and not what I'd expect from a function with
> "normal" in the name.
> 
> So I think it would be better to s/vm_normal_lru_page/vm_normal_page/ and keep
> vm_normal_any_page() (or perhaps call it vm_any_page?). This is basically what
> the previous incarnation of this feature did:
> 
> struct page *_vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>                             pte_t pte, bool with_public_device);
> #define vm_normal_page(vma, addr, pte) _vm_normal_page(vma, addr, pte, false)
> 
> Except we should add:
> 
> #define vm_normal_any_page(vma, addr, pte) _vm_normal_page(vma, addr, pte, true)
> 

"normal" simply tells us that this is not a special mapping -- IOW, we
want the VM to take a look at the memmap and not treat it like a PFN
map. What we're changing is that we're now also returning non-lru pages.
Fair enough, that's why we introduce vm_normal_lru_page() as a
replacement where we really can only deal with lru pages.

vm_normal_page vs vm_normal_lru_page is good enough. "lru" further
limits what we get via vm_normal_page, that's even how it's implemented.

vm_normal_page vs vm_normal_any_page is confusing IMHO.


-- 
Thanks,

David / dhildenb

