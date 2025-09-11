Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48439B532C9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6268010EB1D;
	Thu, 11 Sep 2025 12:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OCmoPs2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4C710EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757595134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Dd82WTzveLoEWc+SAxXeYWtWd+6Kkfvmohrbf94Y17w=;
 b=OCmoPs2AQtZNWBzRyVyqWxkE+VxK1pSkRoKpFQ8PUGKr7UBxUdbW/lvCYgbLZKOxlfjxrK
 X4RecBv1kqk7ueCoO4/IkJ46SDqcLFbmlv+pYRtJAtpRp87wdRUOqlWBGR69dUBSYEJkwI
 StZsNYiGutuQiwvIHs5WorPLCU72dKo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-1s73OlP4PVyz75Gwx-EElw-1; Thu, 11 Sep 2025 08:52:13 -0400
X-MC-Unique: 1s73OlP4PVyz75Gwx-EElw-1
X-Mimecast-MFC-AGG-ID: 1s73OlP4PVyz75Gwx-EElw_1757595132
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45e05ff0b36so2059535e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595131; x=1758199931;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dd82WTzveLoEWc+SAxXeYWtWd+6Kkfvmohrbf94Y17w=;
 b=bW0gatzwS+zI4FGbd6+fbFip7CNvxicJIp0ieqnKXxr7hXniz436BBwcfs/J4twbfP
 atFfo5HuavBMEu+8XzmrTLqBevqHCi6Ho2Vzio27TZyf9lBZeOluE/bIuDpkId5wreIs
 PcQ+A7hFBh7DALwbzz+dnKd8Mwkyq8Tb2IOS9TQqM8kOc615NI4yoH3qIUPGTVRym5Mf
 TQk5p8IhHZdAhvudHBJgVEz4+YE+xAkrARNRaRt25/TCM7pf+RGnpYRNXTPg7t19xah3
 nMcXAwEmbZbSLHI3GM/LIonp4Xx7uBCkZH8TWMhpZZxJvQhP5kwJYax9x74dm9D+aX4g
 6LDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLimQl6/jphTSNDzngkv/UhnlTgy2UDGEuYr6+5kv4BHSjI387X0bs4feGlKa8P9rLe5MxZSHegIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcldkx9G6+Rsp8PI9Go4F4AyubWJr0M6w4iUKTW5g9wd8AlShj
 1WCBks1wkLOwlUF0BWCzxEmN09XgWJiYle4jrpII8bc0+9x6dhRRd5XDFmm3B4iwlBIchIY+PNf
 bRROr58csvKpKXILVq6slwTesMiEcmqLn0OChVQj0wEReRoFmm+M6RafU+eziEj6qcsxmeg==
X-Gm-Gg: ASbGncuy3Sa8RqNIbiaKsZ36Z9pGGs7ij4T4hnLYst88gux23vBrod5kV0NcfgfAYPO
 H1q3WZyRsQxl/bS1mAuWzLoO69TDD5IwhgSRn02JvJiOCPqqvw27LUSKvoDF+hnObfE5bNfnmpN
 cExvMI/IioF9ii0cFtymlG4L8/R0BdtGKf0pkBR5z622fWzWYHtQPK5r5PQP6uX+81R1CvvEdU5
 OaHMj/MWIVLfGuNqNj0H1ekbDjzi04VQmKzIuyX67QPz4Se0niDnZdLNEKRZiuENmAdOGPa1gdW
 SU3jHqYhmq3iXcaooJdJm/2GRmWVe5lUyQZc1fQzCVhRcDtalLvG0eHxiAQxcO6kOfDya+5dZtn
 X6V9Bkhntq7j+TGF9gEB5n47G2LBs1vF39Myv5Oag8CeMb38++g/DZQlsCXN5OAV3GaM=
X-Received: by 2002:a05:600c:3550:b0:45d:dbf0:4831 with SMTP id
 5b1f17b1804b1-45ee515f6dfmr2286555e9.0.1757595131488; 
 Thu, 11 Sep 2025 05:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx8VqogepbdXoOFaeQQ7CwFkbIB9lrJS7DEFIQ07QSyngRrxep0pNw8V/awV6BxQp5xwRxZg==
X-Received: by 2002:a05:600c:3550:b0:45d:dbf0:4831 with SMTP id
 5b1f17b1804b1-45ee515f6dfmr2285965e9.0.1757595130906; 
 Thu, 11 Sep 2025 05:52:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:b000:db8b:7655:f60f:812b?
 (p200300d82f42b000db8b7655f60f812b.dip0.t-ipconnect.de.
 [2003:d8:2f42:b000:db8b:7655:f60f:812b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e032a0522sm22883275e9.0.2025.09.11.05.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:52:10 -0700 (PDT)
Message-ID: <244005a2-4796-4985-853e-f916bdfd096a@redhat.com>
Date: Thu, 11 Sep 2025 14:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 01/15] mm/zone_device: support large zone device private
 folios
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-2-balbirs@nvidia.com>
 <8c5267ec-cc85-4eff-b890-eb705472e2b2@redhat.com>
 <f98d3149-9cc1-4211-af8f-e49547134b8c@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <f98d3149-9cc1-4211-af8f-e49547134b8c@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6DVKTW4mbjzCw1FTfIp2c5M9DUXgOPOWzOdC-WlBd5s_1757595132
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11.09.25 14:49, Balbir Singh wrote:
> On 9/11/25 21:45, David Hildenbrand wrote:
>> On 08.09.25 02:04, Balbir Singh wrote:
>>> Add routines to support allocation of large order zone device folios
>>> and helper functions for zone device folios, to check if a folio is
>>> device private and helpers for setting zone device data.
>>>
>>> When large folios are used, the existing page_free() callback in
>>> pgmap is called when the folio is freed, this is true for both
>>> PAGE_SIZE and higher order pages.
>>>
>>> Zone device private large folios do not support deferred split and
>>> scan like normal THP folios.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> ---
>>
>> You missed my comments of this patch in v3.
>>
> 
> Hi, David
> 
> Looks I missed your comments, just checked those were largely about alignment and
> integrating the code for DEVICE_COHERENT and DEVICE_PRIVATE cases into similar looking
> bits for zone device folio free and code-alignment. I'll take a look and update as needed.

Yes, and the confusing folio->mapping = NULL that I cannot connect to 
THP support.

-- 
Cheers

David / dhildenb

