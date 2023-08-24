Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD8C7877F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BA210E5AF;
	Thu, 24 Aug 2023 18:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648BB10E5AF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PDJgntjNtom4UkeOI+0fKcznGD9dSt4b/PLLXGNYzE=;
 b=HwMe7SkC/gEs3ObBbGGheuVa0GRj050XZ8+ZwuwIzy/ZLn2N1UuwNfvMCxnhTr75iZEKbu
 6CkzpSekECR6x6WLiDpWDTW8EC1LXeWh9jB4ND6Q2/HvYUbxXLd1unWwLH7Pg4uwJ22udR
 9WSz4kz/zUBlAI9eLoUysI/uCdCRpXo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-h1OclEtpOmS2cqQL9uXEYg-1; Thu, 24 Aug 2023 14:33:12 -0400
X-MC-Unique: h1OclEtpOmS2cqQL9uXEYg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso58172f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901991; x=1693506791;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3PDJgntjNtom4UkeOI+0fKcznGD9dSt4b/PLLXGNYzE=;
 b=E6LCTPa/r/s+6R4d/TCSZ9nGhOoPAketaVpkYlBHMFxIIYd/M2JZ1EqHEdu0t8U8qF
 R9RzyKARzzFkgu4RQIkHW0z7GjXAkHQha9/XVsJ76+0zp/YFW3zpTI/bXzmI1ITAaIWA
 4isC/KYPSShptVOzI0AMDOEUIWRIy4bBIRxaqfZx5ZdGiwPyR5rd549wp411a7JSNCfx
 +oJNwuoE4NNDMVqhVXkQaQrVGUqT0nx9Cb2LuQn/XosqhfjeuGmGf31Bxb/8ke18X5Rf
 0H3jXonKkV1c377YkN2NGJSYMtXx49f2b/Oen0a4Frt4WE0zJYHCbOrs0zy0R38GJVw9
 AUcA==
X-Gm-Message-State: AOJu0YwWc6PHf1NMhG0BppOXSZ1hhoLFA0+HAcFtob83Z6BgWQmcdJdl
 ybKpzfRVK0fpHBDidqbcrtSpzFtfSmV0D+HUMyJmcQWjxDVlDPnaTBvYgqmNT0IFPfdHHTw4HZk
 uhFM8jyRR6zsDGlKHGca0mS6end2b
X-Received: by 2002:adf:f9c4:0:b0:317:690e:7b39 with SMTP id
 w4-20020adff9c4000000b00317690e7b39mr12626556wrr.12.1692901990868; 
 Thu, 24 Aug 2023 11:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuOI8mcSH5GhM8pvMUrLbdx2ZNCB4pllc0AeHd90pNO0qMhlCcLZpgeeNSBIlWz/L/OKig3w==
X-Received: by 2002:adf:f9c4:0:b0:317:690e:7b39 with SMTP id
 w4-20020adff9c4000000b00317690e7b39mr12626541wrr.12.1692901990521; 
 Thu, 24 Aug 2023 11:33:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:6200:16ba:af70:999d:6a1a?
 (p200300cbc709620016baaf70999d6a1a.dip0.t-ipconnect.de.
 [2003:cb:c709:6200:16ba:af70:999d:6a1a])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a5d4d48000000b0031c5b380291sm12417507wru.110.2023.08.24.11.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 11:33:10 -0700 (PDT)
Message-ID: <20e38c1d-24e0-4705-6acb-87921962ccee@redhat.com>
Date: Thu, 24 Aug 2023 20:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
 <ZOeh4x58eGel7WwI@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZOeh4x58eGel7WwI@nvidia.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.08.23 20:30, Jason Gunthorpe wrote:
> On Thu, Aug 24, 2023 at 08:30:17PM +0200, David Hildenbrand wrote:
>> On 24.08.23 08:31, Kasireddy, Vivek wrote:
>>> Hi David,
>>>
>>>>
>>>>>> - Add a new API to the backing store/allocator to longterm-pin the page.
>>>>>>      For example, something along the lines of
>>>> shmem_pin_mapping_page_longterm()
>>>>>>      for shmem as suggested by Daniel. A similar one needs to be added for
>>>>>>      hugetlbfs as well.
>>>>>
>>>>> This may also be reasonable.
>>>>
>>>> Sounds reasonable to keep the old API (that we unfortunately have) working.
>>> I agree; I'd like to avoid adding new APIs unless absolutely necessary. Given this,
>>> and considering the options I have mentioned earlier, what would be your
>>> recommendation for how page migration needs to be done in udmabuf driver?
>>
>> I guess using proper APIs for shmem and hugetlb. So, turning roughly what
>> you have in patch#1 for now into common code, and only calling into that
>> from udmabug.
> 
> This is a lot of work for an obscure uapi :\

Well, what can we otherwise to to *not* break existing users? I'm not 
happy about this either.

Of course, we can come up with a new uapi, but we have to handle the old 
uapi somehow.

Sure, we can simply always fail when we detect ZONE_MOVABLE or 
MIGRATE_CMA. Maybe that keeps at least some use cases working.

-- 
Cheers,

David / dhildenb

