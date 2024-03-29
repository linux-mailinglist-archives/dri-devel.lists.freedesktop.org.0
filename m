Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6DF8917FA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 12:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F606897C8;
	Fri, 29 Mar 2024 11:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XSjEVV/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37C810FDDB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711712536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=73ecLZmfGuX6pbQdv6D7yKbAHH5MRpiV1L7jMEDGazc=;
 b=XSjEVV/bZCFirYr7EmX/aIDyW0/e9lftySJcduxZCZo9Cm7zI90Hqo0jBkVhwVjB5W9hwa
 m2F1Yka0QLwooRo676XHEhaMNpVi9KZsn/+wg7O/LnSl+yKIuYDfSyTpNN/jEVUyXdrBXr
 3hW486jIBfuEN0iWIY5Kyp/XMNrL6o4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-z_UVELIyPei1hcZru1HT4w-1; Fri, 29 Mar 2024 07:42:12 -0400
X-MC-Unique: z_UVELIyPei1hcZru1HT4w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4147e733d20so9307545e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 04:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711712531; x=1712317331;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73ecLZmfGuX6pbQdv6D7yKbAHH5MRpiV1L7jMEDGazc=;
 b=YXTNlH/j1P0Iw1pUXhvL+RCt/QJjtb6QaCeEUFz4D0xxblAQ4mm3XygunkOSjmmZIx
 NcdcfxlL4KseLaf+xFHFA7bUsK4q5GLEOrEqCtbWU+iIZAf5+wuvNxDp7+nkiT60IwIM
 ocJ659wQY8QTMGRLK8cj+rqdbb9cvaOiEfhYYD9NG0Xt4++PMgTzW/+xarqnyZqe+Y22
 XTWv6kR4MXLM3q4tqlH7hP8nGvzmgIwo6qcN8IjbmWIT6Z8Wa0BgNAVNfpxTJ6RDMWHC
 Ph68kW0MD1vKIlMmrjTqxbN+hxRbAZlJ43OGCQ1WAaKouk144ehcRhdlYDnWEIfzUuib
 n7sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0iwvotwFOb/S9S5f/+whuHw0Deg7D1lyFOW1nZnrT6MKLAYXUiN/PoEFEQ1Stbuf/PjxskBLPgw5VYZGl0c24o46JWwD0dj3iA2EnbE6I
X-Gm-Message-State: AOJu0Ywts1ik+ht+Jc78O0vxja4XjVvzcUGORqt9/p+CxTe1YluBFjCb
 uZm4SV4ycQWRBt26enNCUT9LrrlKJIKMiULUKu0aMi5h86ms+kI+whnxL9RRhO817P3SZSDJHK8
 Ey9cIlNXIE180AFYEUrhB67q3f7VVPXlyQOVpnbUPCPL+FVaVebcznOpCrvQk5kAn6w==
X-Received: by 2002:a05:600c:188d:b0:415:4b4b:1e28 with SMTP id
 x13-20020a05600c188d00b004154b4b1e28mr1788744wmp.20.1711712531162; 
 Fri, 29 Mar 2024 04:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP9v08ibwBBNxzhqYOhP1rj3jTDI0E/qY7b/+wp2Cax//fpvLXmHJyYqOPRT+lG7F+sU7NdA==
X-Received: by 2002:a05:600c:188d:b0:415:4b4b:1e28 with SMTP id
 x13-20020a05600c188d00b004154b4b1e28mr1788730wmp.20.1711712530766; 
 Fri, 29 Mar 2024 04:42:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f49:7300:e2b8:a1d2:18a4:4f49?
 (p200300d82f497300e2b8a1d218a44f49.dip0.t-ipconnect.de.
 [2003:d8:2f49:7300:e2b8:a1d2:18a4:4f49])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b004154f05f023sm1550523wmq.11.2024.03.29.04.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Mar 2024 04:42:10 -0700 (PDT)
Message-ID: <766cc37d-5115-43e3-95fe-4e193b631084@redhat.com>
Date: Fri, 29 Mar 2024 12:42:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>
References: <20240225080008.1019653-1-vivek.kasireddy@intel.com>
 <205e0755-5dc8-45f7-8d9f-59dde9951307@redhat.com>
 <IA0PR11MB718598D9C3E7AB0F9B5E21F3F83A2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <IA0PR11MB718598D9C3E7AB0F9B5E21F3F83A2@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
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

On 29.03.24 06:38, Kasireddy, Vivek wrote:
> Hi David,
> 
>>
>> On 25.02.24 08:56, Vivek Kasireddy wrote:
>>> Currently, some drivers (e.g, Udmabuf) that want to longterm-pin
>>> the pages/folios associated with a memfd, do so by simply taking a
>>> reference on them. This is not desirable because the pages/folios
>>> may reside in Movable zone or CMA block.
>>>
>>> Therefore, having drivers use memfd_pin_folios() API ensures that
>>> the folios are appropriately pinned via FOLL_PIN for longterm DMA.
>>>
>>> This patchset also introduces a few helpers and converts the Udmabuf
>>> driver to use folios and memfd_pin_folios() API to longterm-pin
>>> the folios for DMA. Two new Udmabuf selftests are also included to
>>> test the driver and the new API.
>>>
>>> ---
>>
>> Sorry Vivek, I got distracted. What's the state of this? I assume it's
>> not in an mm tree yet.
> No problem. Right, they are not in any tree yet. The first two mm patches that
> add the unpin_folios() and check_and_migrate_movable_folios() helpers still
> need to be reviewed.
> 
>>
>> I try to get this reviewed this week. If I fail to do that, please ping me.
> Ok, sounds good!

.. as it's already Friday (and even a public Holiday today+Monday here), 
let me prioritize this for next week!

-- 
Cheers,

David / dhildenb

