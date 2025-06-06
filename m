Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1060AD02E7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AC510E366;
	Fri,  6 Jun 2025 13:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tcy7IIp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDEF10E351
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749215651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPcQkvm2yO9gaDxIY/WqB5o2C00Jo+psdQDe9Iafs6c=;
 b=Tcy7IIp+jU7oSLTOi7Gay3bdw0Boba6vRCnzvzbP+WG4mD4HM7Cg9Pb+cMTAr+88xCMSy8
 n3HqDHqv1WqmNDXsyHD9mSn+U0v+X6O98cBe7gqZjWmWWV63aElzy1JPbnoPr5TaLu1kDS
 ra/zc9ivFPGWA2QGCNgrLcj2SVxhKdE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-EDCIOVzRNvCnunvpaRUoNA-1; Fri, 06 Jun 2025 09:14:10 -0400
X-MC-Unique: EDCIOVzRNvCnunvpaRUoNA-1
X-Mimecast-MFC-AGG-ID: EDCIOVzRNvCnunvpaRUoNA_1749215649
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451d5600a54so16654225e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 06:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749215648; x=1749820448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OPcQkvm2yO9gaDxIY/WqB5o2C00Jo+psdQDe9Iafs6c=;
 b=WvVpxmW5FxZLykKUp2JSljOduhG9Kw7kMmluzKIJchHnGFe0rNAIp6bTsfz0T2wZda
 YoHj1EGHYB4GUYbSrbLQ4czNGh7HB/NQEGoU2uaZlrVseErHRhhisozOdISbKmMj75Vn
 vUJMtkeK/1ns5pKkwaFg+T8Lo6U1Fy1g0xs0J8O5k2LKxLIJv0LVvdvVsmEGxJ31kKR5
 6UITEjXtKE/I1kQSv6hxDQB7oX/xlZHIcCCY1BRWko0rh7wgQx//XtXpLCJfSqsBgt4U
 OUj+BhMy8TZb0RlLYd3WgTZYknTXMR/PqvmMNx3+qnRaNCtpL1w9Sdi2eDw6388OoCiX
 3GzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/qc7blHfDFA1hk3VWkpzjoWACUufUrmBPInB12BXfq1fO8+1eHuVGLX/0TR64FdDgXVXbqMhSXFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ7Y79pNBZgZowNKRuHQ9T2sP6etNmBCDopG9SuLryh99E4H0x
 ejAoPpqYTofL0J56Cs+ij2mupcOwzfsPzSBEMkkVDTjrKfiLvu6iNrMnbx48on5RJFLL3ItyrxY
 PkzBqLJHmklDPHMYBTUSXcT43l0Rfvxf3bB7SaW5Fz4nqpRv6crdgtsyZciDQEkrEsZQsE5fRb4
 fJwQ==
X-Gm-Gg: ASbGncugXzsCqgooOl+pG3ixc1aaiztHwU9LkxRWNCJnb9mMDi/cHh5CudOITCMgB8R
 iB6wJXydVCqhYA6CSSeJYH/oT2o/JGRWp506l58qWVqqGF+4ZsWx5BhC9uITQxxcCtaod5oVIKK
 p/X/EoW1ggHNo/JRG/MJ3NNn1TaM7DhjAQ+ceQIgncyzErMiczv8d85a9vZfiUNkut1/DhU8dOT
 /dWWbVCmpUzE2iNTn2NmRGpzTqCvDmJfUsQ32eB8oF4w/U+R1Q+4W7qM3v7Trl3ykiZ9JXMkTqy
 BMb1IC6QJSe/emgH+pV8k7vSmcn3kTNhTTgJ74T2EFaU3QGYpr8=
X-Received: by 2002:a05:600c:a08e:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-45201391375mr37179135e9.13.1749215648361; 
 Fri, 06 Jun 2025 06:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgw0C5j9K+kUpLKu17QtwP444HtAeVPH30PrMVtLgOGG/Lf58xq+FjEIaE8XuzPGYKNjMZEQ==
X-Received: by 2002:a05:600c:a08e:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-45201391375mr37178795e9.13.1749215647873; 
 Fri, 06 Jun 2025 06:14:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452137277basm24098065e9.32.2025.06.06.06.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 06:14:07 -0700 (PDT)
Message-ID: <8ed62378-269f-4385-bf05-eda28098fc1f@redhat.com>
Date: Fri, 6 Jun 2025 15:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] drm/ttm: Add ttm_bo_kmap_try_from_panic()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250606120519.753928-1-jfalempe@redhat.com>
 <20250606120519.753928-5-jfalempe@redhat.com>
 <dd0532a2-4011-41ec-896d-ec066dc23cbc@amd.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <dd0532a2-4011-41ec-896d-ec066dc23cbc@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3kQo6iWQ99DV5OPb7Z6By3Zm_PCI7WngnD0RhT_Ckms_1749215649
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 06/06/2025 14:28, Christian König wrote:
> On 6/6/25 13:48, Jocelyn Falempe wrote:
>> If the ttm bo is backed by pages, then it's possible to safely kmap
>> one page at a time, using kmap_try_from_panic().
> 
> I strongly assume that we don't care about locking anything in this case, don't we?

Yes, normally it's called for the current framebuffer, so I assume it's 
properly allocated, and isn't growing/shrinking while being displayed.

> 
>> Unfortunately there is no way to do the same with ioremap, so it
>> only supports the kmap case.
> 
> Oh, there actually is on most modern systems.
> 
> At least on 64bit systems amdgpu maps the whole VRAM BAR into kernel address space on driver load.
> 
> So as long as you have a large BAR system you can trivially have access to the MMIO memory.

For amdgpu, I used the indirect MMIO access, so I didn't need to ioremap
https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c#L1800

For the xe driver, I only tested on integrated GPU, using system RAM, so 
this first approach is good enough.
But I'm still interested to find a solution, is there a way to get the 
current io-mapping if it exists?


> 
>> This is needed for proper drm_panic support with xe driver.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v8:
>>   * Added in v8
>>
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
>>   include/drm/ttm/ttm_bo.h          |  1 +
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 15cab9bda17f..9c3f3b379c2a 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -377,6 +377,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>>   	return (!map->virtual) ? -ENOMEM : 0;
>>   }
>>   
>> +/**
>> + *
>> + * ttm_bo_kmap_try_from_panic
>> + *
>> + * @bo: The buffer object
>> + * @page: The page to map
>> + *
>> + * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
>> + * This can safely be called from the panic handler, if you make sure the bo
> 
> "This can *only* be called from the panic handler..."

Yes, I will fix that, it shouldn't be called for normal operations.

> 
> Apart from those open questions, looks sane to me.
> 
> Regards,
> Christian.
> 
>> + * is the one being displayed, so is properly allocated, and won't be modified.
>> + *
>> + * Returns the vaddr, that you can use to write to the bo, and that you should
>> + * pass to kunmap_local() when you're done with this page, or NULL if the bo
>> + * is in iomem.
>> + */
>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
>> +{
>> +	if (page + 1 > PFN_UP(bo->resource->size))
>> +		return NULL;
>> +
>> +	if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
>> +		return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
>> +
>>   /**
>>    * ttm_bo_kmap
>>    *
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index cf027558b6db..8c0ce3fa077f 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -429,6 +429,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>>   int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>>   		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>>   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
>>   int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
> 

