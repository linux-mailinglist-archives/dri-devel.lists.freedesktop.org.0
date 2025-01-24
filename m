Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA12A1BBC7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 18:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4686D10E9F7;
	Fri, 24 Jan 2025 17:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NDz8YqIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1469810E135
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737741247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xXQ7dANw+aXD8Z/3pfZjrBjGgQVABdk/UizC4Pow++E=;
 b=NDz8YqIO9UzfV+1TU+5md8Jwn1ijQUR2PTtlM0v5FUSISYtYBhqKqtWrDTojoyPuFHFNED
 //Nzky1cxGeOi3wDbWjklQrELySwZYqAKEW1bGnnv8Z8+5xpt3+gvshJ0M0Jn10aVWaC8H
 FK4+s73kk3qNch7RrY00iS0UFjgKDEE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-oiSCnbW6PEGRzoBD9JQQUw-1; Fri, 24 Jan 2025 12:54:05 -0500
X-MC-Unique: oiSCnbW6PEGRzoBD9JQQUw-1
X-Mimecast-MFC-AGG-ID: oiSCnbW6PEGRzoBD9JQQUw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43621907030so17506105e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737741245; x=1738346045;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXQ7dANw+aXD8Z/3pfZjrBjGgQVABdk/UizC4Pow++E=;
 b=r9QB64c+sLjniDfXtYaEjym9WXc6pwbfgYDz+GgIowhYX4MTNsaku0ADJ3Eahu0ic/
 qO4KCV0EiV+svoQrVPWZZpekE16YKzujNaJLzmEtEYzCV7R9HxvIxgcyN5fv4JpJKdB4
 Q8Uvhp/CMc5TmRRyhrWLJgD5uUFxqf9f50DMLOLhrewAC7TqNn7TmJS4XNrmooHGleQu
 2/wjhtHXkewT+pCdVLgcdfcilAjhS6n42n+stPRMVLz3rOG9JzsCDCOLPTIn/wKOnQSi
 7ILOQAggUjXgJwlpO0Ulc9u9qKtt9t81ZJEPIAJl4vnb2bwQoyVLhidfhRB4dNqn+SqV
 +ajg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvFTtesczIvvxsTMpfQA/9qDzwvbZAXPXm/4sSdX1IRpxapDSdY1t3zoPCJ6SnvBSOwF3dyCD25yQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYPkZToKEPdNLO6UMv73GFDn7+Ho6U8TbRvqj9sdyy9vy2Coqv
 rBnf5nJqh1moCLzukNs4uf5BgD+F8NGNCiOuKgBJksO7C9OjiW7MPFEMbOhLP0TXPXxpI6Je3g7
 v5Yyv/rpA6EJiFPf2dYnycitWuHENgpvYTVtiNh4bF9bMNQv47ig8xWoTRxj5UQSdZg==
X-Gm-Gg: ASbGnct4UmfzzwRPP2WuprXS99Yl8/Xwem/I3OvI9Mi+T90kcdQIHnojbJNRs8rgmRM
 SIwvA5SBsAAmOrgewRNzwvrXFqys7Wwg0ocUzzVZK1zjvkb3VEi8Qn4xVDaCPoAJz5+xonEtx2r
 NjUDhXIXiHduvTnmcr3GcDBB9MG1uAt3N2MrFU8iB50Bc2DKsGvNwyonU2BFU/+ZWVk9HR4Q/lp
 vNWEmFkB6Jr2DW5Ba3N11ieLDBvl2kpYSTp+z77VxotJNreSGRM8W4yEgpWGjKIL6pn6Rt/Lbv6
 hTypoQTRwl9TmjQlXPd9yIU=
X-Received: by 2002:a05:600c:3495:b0:431:5c3d:1700 with SMTP id
 5b1f17b1804b1-4389143b450mr254508225e9.21.1737741244634; 
 Fri, 24 Jan 2025 09:54:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsUUZXZcu35hKI8nL/0bwMoEgyUei6dQJrQY1Atd50NPrlYq9dLLihNiR4OkNeQLP/cStOeg==
X-Received: by 2002:a05:600c:3495:b0:431:5c3d:1700 with SMTP id
 5b1f17b1804b1-4389143b450mr254508065e9.21.1737741244202; 
 Fri, 24 Jan 2025 09:54:04 -0800 (PST)
Received: from [192.168.3.141] (p4ff2332e.dip0.t-ipconnect.de. [79.242.51.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bad92sm3327090f8f.61.2025.01.24.09.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:54:03 -0800 (PST)
Message-ID: <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
Date: Fri, 24 Jan 2025 18:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM atomics
 in Nouveau" still getting used in practice?
To: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
 <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e4FOguOrfEa6aGpwOJjYW5UyOI37puyjVGAssrOTu4A_1737741245
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

>>> On integrated the gpu is tied into the coherency
>>> fabric, so there it's not needed.
>>>
>>> I think the more fundamental question with both this function here and
>>> with forced migration to device memory is that there's no guarantee it
>>> will work out.
>>
>> Yes, in particular with device-exclusive, it doesn't really work with THP
>> and is only limited to anonymous memory. I have patches to at least make it
>> work reliably with THP.
> 
> I should have crawled through the implementation first before replying.
> Since it only looks at folio_mapcount() make_device_exclusive() should at
> least in theory work reliably on anon memory, and not be impacted by
> elevated refcounts due to migration/ksm/thp/whatever.

Yes, there is -- in theory -- nothing blocking the conversion except the 
folio lock. That's different than page migration.

[...]

> 
>> Then, we seem to give up too easily if we cannot lock the folio when wanting
>> to convert to device-exclusive, which also looks rather odd. But well, maybe
>> it just works good enough in the common case, or there is some other retry
>> logic that makes it fly.
> 
> I've crawled through the path to migrate pages from device memory back to
> system memory a few months ago, and found some livelock issues in there.
> Wouldn't be surprised if m_d_e has some of the same, but I didn't dig
> through it (least because intel can't use it because not-so-great hw
> design).

Yes, that might be possible. Maybe something keeps spinning while the 
folio is locked instead of properly waiting for the lock.

... or someone is trying to convert a tail page of a THP, in which case 
we will also keep failing the conversion right now.

>> There are other concerns I have (what if the page is pinned and access
>> outside of the user space page tables?). Maybe there was not need to handle
>> these cases so far.
> 
> I think that's also ok, but might be good to document this clearly that
> concurrent direct i/o or rdma registered buffer or whatever will mess with
> this. The promise is only between the gpu and the cpu, not anything else,
> in current apis. At least to my knowledge.

Well, the issue is that e.g., iouring fixed buffers can be accessed from 
the CPU using the direct map from the CPU, not necessarily using DMA 
from a device.

In any case, I'm planning on adding some code-level documentation for 
that and look into extending the high-level doc while at it.

> 
>> So best I can do is make anonymous memory more reliable with
>> device-exclusive and fixup some of the problematic parts that I see (e.g.,
>> broken page reclaim, page migration, ...).
>>
>> But before starting to cleanup+improve the existing handling of anonymous
>> memory, I was wondering if this whole thing is getting used at all.
> 
> Yeah if this can be made reliable (under the limitation of only anon
> memory and only excluding userspace access) then I expect we'll need this
> for a very long time. I just had no idea whether even that is possible.
> 
> What isn't good is if it's only mostly reliable, like the current
> pgmap->ops->migrate_to_ram() path in do_swap_page() still is.

I'll cc you on patches once I figure out some details on how to fix some 
page table walkers that really don't expect these non-swap entries.

Fortunately, the hmm test device is in place to trigger some shaky 
scenarios.

-- 
Cheers,

David / dhildenb

