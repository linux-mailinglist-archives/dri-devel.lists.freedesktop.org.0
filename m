Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EADB546D9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 11:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D5610E18C;
	Fri, 12 Sep 2025 09:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JIgFH+24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644010E18C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757668811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+MzP8ZtzjuFzx7no/Z95bzESB3nOqylto37d5k77ugs=;
 b=JIgFH+24Jj9eHdrh2r65d4whFVGZufAQ+j/FAkutV92PVhRkzAHJ/yOY9JZlTRpjm/wZP+
 iI0RcanYPQB1SnWjvfJyidjhtEzVKNdvgvttpHrxhp2+8sgwGefP2R0jmvx5SAgyJ8SQpi
 bp6NwxNeonrlymbSvAQc+16C0KSL26Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-axX2bRFgM_OQIBXqMawpGw-1; Fri, 12 Sep 2025 05:20:09 -0400
X-MC-Unique: axX2bRFgM_OQIBXqMawpGw-1
X-Mimecast-MFC-AGG-ID: axX2bRFgM_OQIBXqMawpGw_1757668808
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45deddf34b9so15921885e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 02:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757668808; x=1758273608;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+MzP8ZtzjuFzx7no/Z95bzESB3nOqylto37d5k77ugs=;
 b=QodSiPwwTu8A5rB3kT3Zy8c4QkRWY9DONXqaAr/kA7C6HjBJIFUlTl4mUdqdYTyc0e
 q+Vdus5eIgsVtYXzW00rcwx5HgcPx7CBktkodteEAACWtNb4E78J2vp7ijzwUt4zBRea
 WO8406wDYJokBS6+7vjFfCCl71SjNMDq7H9daYFJ7GGCKwmWAkWT6yVZj3daDvlc2FTn
 3lOxXujW4f0IbSR/8K3LhYOglVX7f9GC4fspQkV2oiwGDBZkOz099/t3gXQeEIv42IIn
 CVOCpa6FCo5Yn50PvLTsrZr6pEKkCl75B4oWUVFOk0iJiJc5mwnI/gigkFpMMu9DuSTP
 14PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw+IUilztuPFSVsjd1AN7zObZ2CpeJKVZAlrVc8CIUpV+YtmD1EJWZ5KHZA5+XJ4V0rLnI9zLyEjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWFzty4olyx2/kbm1Jdp9YKV35ukrZBsm7vG2kr2KM+bG7pJR6
 4ul99Y3y6kGRzipBKVmfebsqs1JPdGRj2AO0Lbkt5qEcW3xI0U3ZOlPD36zUp/aCcRgHVqhTwE/
 2HhjUOA4+OBcj6WtgJ2cOrNYyM0CI4u5hvqHwdt92Z9pitCG1WPmIVxcKPzAFY6nFmXLHnA==
X-Gm-Gg: ASbGncvhQOMjw7JfD3bYhO19N/X5nZHFnWmsTT13X9NZENnHnsoKretFCmSwUlYf0+X
 s8aixteB/5qjTNJWd6UbekG/U6QIMj73cclu8woONlpsp7jx8GOxNeKf3Sy4CEYRLq3tWq7YuWU
 bPNXx37OO1JLaZEG4aV2Lf9ACOBFrGUmlIMcLG3i0Q27l8Mzx0RJVRweEwPfVi+Tntn0howIA5j
 +oJwGWjVXrSjA96wH0QVWOMjUWkSQusDpXBpCl1GJ1vibdK1H/teHSQlRsJ/9UUaAhHyqjviISs
 MfxhuCBHGcWLsZIfrmIsZ9M6L/mzklLo3sp5/yQ2JPF7RrJTcem+Aaav+NuvZfIcANTuiys0nEi
 dbOCFbO/b6IZ//z2BRrjDnmPd4uHuHMsXFUL08Q3El1etP/mYPBgmxovd4bzU5O6WRoM=
X-Received: by 2002:a05:600c:c112:b0:45b:9b9f:88cb with SMTP id
 5b1f17b1804b1-45dfd5fa22amr49779875e9.16.1757668808481; 
 Fri, 12 Sep 2025 02:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXkEspv+20MlFbesTl37GXWHbZfquxB4ih7Dl0E1NZ+jD5GQeintUf727ez0VnQ0g0eWxksw==
X-Received: by 2002:a05:600c:c112:b0:45b:9b9f:88cb with SMTP id
 5b1f17b1804b1-45dfd5fa22amr49779515e9.16.1757668808019; 
 Fri, 12 Sep 2025 02:20:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d?
 (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de.
 [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0156c64bsm58222385e9.2.2025.09.12.02.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 02:20:06 -0700 (PDT)
Message-ID: <3674bdb2-0e59-4f0d-8adf-4794a6db546c@redhat.com>
Date: Fri, 12 Sep 2025 11:20:03 +0200
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
 <244005a2-4796-4985-853e-f916bdfd096a@redhat.com>
 <ce40579b-4ded-473b-8fdb-a41d5b5021d5@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <ce40579b-4ded-473b-8fdb-a41d5b5021d5@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lP-JnwP0OdJBsHg-IcNFCPbSMndUYnUsiAE0lkkGMqA_1757668808
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

On 12.09.25 06:49, Balbir Singh wrote:
> On 9/11/25 22:52, David Hildenbrand wrote:
>> On 11.09.25 14:49, Balbir Singh wrote:
>>> On 9/11/25 21:45, David Hildenbrand wrote:
>>>> On 08.09.25 02:04, Balbir Singh wrote:
>>>>> Add routines to support allocation of large order zone device folios
>>>>> and helper functions for zone device folios, to check if a folio is
>>>>> device private and helpers for setting zone device data.
>>>>>
>>>>> When large folios are used, the existing page_free() callback in
>>>>> pgmap is called when the folio is freed, this is true for both
>>>>> PAGE_SIZE and higher order pages.
>>>>>
>>>>> Zone device private large folios do not support deferred split and
>>>>> scan like normal THP folios.
>>>>>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>
>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>> ---
>>>>
>>>> You missed my comments of this patch in v3.
>>>>
>>>
>>> Hi, David
>>>
>>> Looks I missed your comments, just checked those were largely about alignment and
>>> integrating the code for DEVICE_COHERENT and DEVICE_PRIVATE cases into similar looking
>>> bits for zone device folio free and code-alignment. I'll take a look and update as needed.
>>
>> Yes, and the confusing folio->mapping = NULL that I cannot connect to THP support.
>>
> 
> I can remove that, let me reunify those bits, seems relatively straight forward

BTW, I was wondering when we invalidate folio_test_anon() by clearing 
folio->mapping int he current code flow?

I mean, this must happen at some point when freeing device folios.

-- 
Cheers

David / dhildenb

