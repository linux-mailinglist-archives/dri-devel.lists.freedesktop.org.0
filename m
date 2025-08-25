Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D9B34AD5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 21:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52BB10E08D;
	Mon, 25 Aug 2025 19:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RK7h5QkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C6210E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 19:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756149625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=z5OgTRxAaRTLrRHg2C4YU4ZWEhwhgTv8g6QHnboZ39Y=;
 b=RK7h5QkTQvFS9sL2tbhzUTXn2GLY3KD9zTpiol4377uO8p3LuH+SCISMOh8FX60+FdZ0ko
 p8jL2gkN4NqWpesPmDdr4q6GRDwyzfKF9xgwYjYf5PFM0ubl8WNwNdxnwvlpvrE5hHU+KX
 GP+bEnKmNME/fMnWm8idKBNZFQRAxfw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-i6PDAqV7N-SmP2YEOGPCuA-1; Mon, 25 Aug 2025 15:20:24 -0400
X-MC-Unique: i6PDAqV7N-SmP2YEOGPCuA-1
X-Mimecast-MFC-AGG-ID: i6PDAqV7N-SmP2YEOGPCuA_1756149623
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3c79f0a5bd5so1657173f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 12:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756149623; x=1756754423;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5OgTRxAaRTLrRHg2C4YU4ZWEhwhgTv8g6QHnboZ39Y=;
 b=wtz6masN4Nn44R9Neh7BpnU4EffMRwR/c7HU3LgSLm4RU+VlbJrrobZxKLvcKosn/v
 1gluEH7/L2rYThX4q1zKvki8fnueJirzqH0YoGtSNzlMuhGxrTDt0mKL9Ld8BJX04+HN
 aAQyA+7vAlV6dF0mZcmnkxZ/iXSRWcMb8RRlvTsGPFiWiGuZVr4FpsNswx0sINEDxZgy
 0guDQF9ZbOhU31uYWCxX/iqcFsXyrFj73Dk/phaHj61u3RmY2Dzk2IDoTMkIKbl1++IL
 Jel12NiWKAjqRKs1+07Z2jBR5grDTXBXV7i0s7xiQReOa7Ep00xW30QAtyc5m/IeO7fK
 JQ+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPW1nmgKg+NfBJx5rYKLtkE1clv7Z2GK0X8QzcXr6brTNAHxSSdT27FgjwcgqdmJMSyD658m+0RMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaaavCfAsog/b9gzIFFvjC5Cm3F/wvedW6FQjWlKeTXHhC9JlJ
 GuEIEee2t14VV2kuvq2Drvkh6oJoKmo6bBZZybyN+3shYQ6lrzyIoq2b7/vGDDgbaShEFgkq1W1
 VHCuCHIk7dppxNP6+uHuWLuae2WAB11aN10cYGUrpPzl2aCRk+Y/u0x8Lr9m0LMH1//Xgkw==
X-Gm-Gg: ASbGncv0+CYS6IfuZnecc7oxKz++NJ5mJfNfk4F9Ht0Y1R4VoqQbBXAJXK/rLymzu2F
 WHjmDzfGkOd7X3LsIu7J/vVSCVT9THauOaa7hoGRxxQJeKRCdfdU6Vwk+tWvpGsvU9qMOU69+MX
 U0HB6ZvTFo6Ta6vIMx2FkgH6bb4aSINeBZSHzm/Wbt5tGW2PkYeNuC28HXT4arKDtqDIC+XG2rm
 bsT/3acG8PLLquZNmgwlqQwbWLIKK8hmqSScBs2yUnXizOkgdMSR7+Fp5AscBmiTIOddmNBIX8a
 bv1Zt3dKzxPHwjM0Tx0A5wLyGDGsYifhetT6A3Aok6ZnYts9J1pPyuOhGU8H7m72MhUlEUrn9ci
 KXtiHRu4h7JSK8/tFV3qEP3Jqnw5TIff/WGwWtmDpLSMX5c574duQpbjlT5vtr4c8hBw=
X-Received: by 2002:a05:6000:40cb:b0:3c7:4062:5ba9 with SMTP id
 ffacd0b85a97d-3c740625e73mr6433953f8f.32.1756149623102; 
 Mon, 25 Aug 2025 12:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5fLvW6GBrzoj0rwn7v+5ING7miK2XnhPDMAtGWy5ft9okjD6BcqLa6oMnevLNewMSeBM26A==
X-Received: by 2002:a05:6000:40cb:b0:3c7:4062:5ba9 with SMTP id
 ffacd0b85a97d-3c740625e73mr6433929f8f.32.1756149622598; 
 Mon, 25 Aug 2025 12:20:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76?
 (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de.
 [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7116e1397sm12704676f8f.49.2025.08.25.12.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 12:20:22 -0700 (PDT)
Message-ID: <a0888295-5f3a-48cc-9ca4-d7ba4d73f307@redhat.com>
Date: Mon, 25 Aug 2025 21:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: your mail
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org, airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Liam Howlett <liam.howlett@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <7db27720-8cfd-457c-8133-5a7a1094004c@lucifer.local>
 <82e5e566-87e9-43a8-a0e9-00656572d65c@redhat.com>
 <f6f85c73-2a1e-438a-82c9-f3392d91020c@lucifer.local>
 <d51c2e8f-70cb-4211-9196-be9021a33070@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <d51c2e8f-70cb-4211-9196-be9021a33070@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N4Npth3XDgp_v28yV2GyWIhUBQo9Bi3HVU_OAraZ3iI_1756149623
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

On 25.08.25 20:35, Christian König wrote:
> On 21.08.25 12:05, Lorenzo Stoakes wrote:
>> On Thu, Aug 21, 2025 at 11:30:43AM +0200, David Hildenbrand wrote:
>>>> I will add this xen/apply_to_page_range() thing to my TODOs, which atm
>>>> would invovle changing these drivers to use vmf_insert_pfn_prot() instead.
>>>>
>>>
>>> Busy today (want to reply to Christian) but
>>>
>>> a) Re: performance, we would want something like
>>>     vmf_insert_pfns_prot(), similar to vm_insert_pages(), to bulk-insert
>>>     multiple PFNs.
> 
> Yes, exactly that. Ideally something like an iterator/callback like interface.
> 
> I've seen at least four or five different representations of the PFNs in drivers.
> 
>>> b) Re: PAT, we'll have to figure out why PAT information is wrong here
>>>     (was there no previous PAT reservation from the driver?), but IF we
>>>     really have to override, we'd want a way to tell
>>>     vmf_insert_pfn_prot() to force the selected caching mode.
>>>
> 
> Well the difference between vmf_insert_pfn() and vmf_insert_pfn_prot() is that the driver actually want to specify the caching modes.

Yes, it's all a mess. x86/PAT doesn't want inconsistencies, so it 
expects that a previous reservation would make sure that that caching 
mode is actually valid.

> 
> That this is overridden by the PAT even for pages which are not part of the linear mapping is really surprising.

Yes, IIUC, it expects an earlier reservation on PAT systems.

> 
> As far as I can see there is no technical necessity for that. Even for pages in the linear mapping only a handful of x86 CPUs actually need that. See Intels i915 GPU driver for reference.
> 
> Intel has used that approach for ages and for AMD CPUs the only reference I could find where the kernel needs it are Athlons produced between 1996 and 2004.
> 
> Maybe we should disable the PAT on CPUs which actually don't need it?

Not sure if that will solve our problems on systems that need it because 
of some devices.

I guess the problem of pfnmap_setup_cachemode_pfn() is that there is no 
interface to undo it: pfnmap_track() is pared with pfnmap_untrack() such 
that it can simply do/undo the reservation itself.

That's why pfnmap_setup_cachemode_pfn() leaves it up to the caller that 
a reservation was trigger earlier differently -- which can properly be 
undone.

-- 
Cheers

David / dhildenb

