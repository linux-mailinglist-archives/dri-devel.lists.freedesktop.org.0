Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83D79C5C41
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 16:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD8B10E60D;
	Tue, 12 Nov 2024 15:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="adIix8lN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0915F10E60A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731426535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NBzWljeInLaYVlceeq4uS83CUx9RaqrCT0JduSM/3es=;
 b=adIix8lNBvJPsgL4p3xtO2p99YE3F7oTsxz3l8DHgSaaZcE06YYi54P7m+pZaQUmBPyNCA
 UUaPtV9ykQxVns5jUbusSxRnzCDdzC7h4zKIksRI+lWu5MVQWVR8Dr8+u1393r3WiyQnqc
 uWI5dQn4ZfdUt8zFbh5CwkyKGZfhBdc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-I2CDFt3gPsiWffLV7HY4lg-1; Tue, 12 Nov 2024 10:48:53 -0500
X-MC-Unique: I2CDFt3gPsiWffLV7HY4lg-1
X-Mimecast-MFC-AGG-ID: I2CDFt3gPsiWffLV7HY4lg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43151e4ef43so41272515e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 07:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731426529; x=1732031329;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NBzWljeInLaYVlceeq4uS83CUx9RaqrCT0JduSM/3es=;
 b=wxY4SvNBj9ZUEpQRl4juGNE+VHcBSskb4orQAbhjNYDKw1UocjlTXkF3zvp9qea3aK
 FiHlxbfpxWJXTEo7nm769gCABDJjCVPOA0JVyawYw/+YDF7rYJViqoiNHG+TjbsCAXjg
 XPSTK50o94bRtvzPlnuvu41YUc0q/+EvczGGzmZQkT15yrx/Ux9RhjxaL3qOUXHZbCgw
 CREQmDUHfa6ftY3BIqvVUWBU+Bs8L5t7X8z1egm2uCHEcnEO/8wFJ3nj84Nh13SNeBrJ
 zRk8HiJpg8+ozPAg4hzT/QYLiWPieLtu+R1G3V9rI05R37DEEFGauKj6LSXRqdOMHD7B
 S9GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW136Y174qKEfgjy/CKvqILA63ArC+CMTT9wBsI6Av9FJexmD/JOwUVm8suPi4pDt+P8/hvROFA8QA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMPQlIAwBx5QIQ5j0hkG5Q250xssJA4oHittOqv6QxfALVjftC
 Ha7tbpwH95IWfv4qAQS2YbApODcFkd4kZyP4F18oaF/EC9CMPv8bVu64SyGAV+VAAnh6SClbqkO
 DEz+eAdEh99tGwrcpofi4xTQz6R3Juq3RHX8WLBxB3p/A54Rygx94IvfwIZrDfFsuqA==
X-Received: by 2002:a05:600c:510a:b0:431:4e3f:9dee with SMTP id
 5b1f17b1804b1-432b74fd7edmr149845415e9.4.1731426529687; 
 Tue, 12 Nov 2024 07:48:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiPlR/rYHL3ApkGE6Xy5PVD9KX3s3Wo+vNqUEbyrZ9AhAQ6ENWfeeHRjP2S1TjOJdxKPfR6g==
X-Received: by 2002:a05:600c:510a:b0:431:4e3f:9dee with SMTP id
 5b1f17b1804b1-432b74fd7edmr149844975e9.4.1731426529244; 
 Tue, 12 Nov 2024 07:48:49 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:8e00:7a46:1b8c:8b13:d3d?
 (p200300cbc7398e007a461b8c8b130d3d.dip0.t-ipconnect.de.
 [2003:cb:c739:8e00:7a46:1b8c:8b13:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053069fsm218177955e9.4.2024.11.12.07.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 07:48:47 -0800 (PST)
Message-ID: <2a6c1377-c76b-4b75-b4be-6896c860896b@redhat.com>
Date: Tue, 12 Nov 2024 16:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 06/10] mm/hugetlb: use separate
 folio->_hugetlb_list for hugetlb-internals
To: wang wei <a929244872@163.com>, tabba@google.com
Cc: ackerleytng@google.com, airlied@gmail.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jglisse@redhat.com,
 jhubbard@nvidia.com, keirf@google.com, kirill.shutemov@linux.intel.com,
 linux-mm@kvack.org, mail@maciej.szmigiero.name, maz@kernel.org,
 muchun.song@linux.dev, nouveau@lists.freedesktop.org, pbonzini@redhat.com,
 qperret@google.com, quic_eberman@quicinc.com, roypat@amazon.co.uk,
 rppt@kernel.org, seanjc@google.com, simona@ffwll.ch, vannapurve@google.com,
 will@kernel.org, willy@infradead.org
References: <20241108162040.159038-7-tabba@google.com>
 <20241112152849.10369-1-a929244872@163.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241112152849.10369-1-a929244872@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y55AKv2iaKPjNpmM3MMNVRNyKIvjJH1qDbhLbxViu7Y_1731426530
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

On 12.11.24 16:28, wang wei wrote:
> Signed-off-by: wang wei <a929244872@163.com>
> ---
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 80fef38d9d64..365c73be0bb4 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -310,6 +310,7 @@ typedef struct {
>>   * @_hugetlb_cgroup: Do not use directly, use accessor in hugetlb_cgroup.h.
>>   * @_hugetlb_cgroup_rsvd: Do not use directly, use accessor in hugetlb_cgroup.h.
>>   * @_hugetlb_hwpoison: Do not use directly, call raw_hwp_list_head().
>> + * @_hugetlb_list: To be used in hugetlb core code only.
>>   * @_deferred_list: Folios to be split under memory pressure.
>>   * @_unused_slab_obj_exts: Placeholder to match obj_exts in struct slab.
>>   *
>> @@ -397,6 +398,17 @@ struct folio {
>> 		};
>> 		struct page __page_2;
>> 	};
>> +	union {
>> +		struct {
>> +			unsigned long _flags_3;
>> +			unsigned long _head_3;
>> +	/* public: */
>> +			struct list_head _hugetlb_list;
>> +	/* private: the union with struct page is transitional */
>> +		};
>> +		struct page __page_3;
>> +	};
>> +
>> };
>>
> As far as I know, increasing the size of folio maybe decrease
> the revenue of HVO, do you measure it?

We should always have a writable page2, even with HVO. So nothing should 
change at this point. Thanks!

-- 
Cheers,

David / dhildenb

