Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F73AD033E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56C310EAA2;
	Fri,  6 Jun 2025 13:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UMnKJVce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1876810EAA2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749216752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cv7olup2Kjz3zpnof3zOhh/VnpoR27wuIUY4op371hY=;
 b=UMnKJVce8YCVVdpqGXQs2eA0mACM5prvK1+HdV/+X0IciarX6HSLqEESonoTdXBlufmcnA
 uYJNUOrvnppqbsdUVxr0fWJ1xedjzwPBbGdFvP3Q3VAK8XbO5wGTQvboXI595y433xEhKD
 QSak2lY0NO9eBA+KWhGX5Hxk2oEdRS8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-O7WOOelSOXOT_64mDuk48A-1; Fri, 06 Jun 2025 09:32:31 -0400
X-MC-Unique: O7WOOelSOXOT_64mDuk48A-1
X-Mimecast-MFC-AGG-ID: O7WOOelSOXOT_64mDuk48A_1749216750
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43eed325461so12535315e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 06:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749216749; x=1749821549;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cv7olup2Kjz3zpnof3zOhh/VnpoR27wuIUY4op371hY=;
 b=Ak2Zo5ZbKSdE86wqi3mtqROIvUKRW258gZG5MyRjgOoMGdMCOtFWn0Q5kl0YW7/iol
 f3l6BW+Rh0pZ9O1hp4FNbfF/qubwcdBHnj7+2B3+Q6ig31PwZBpUek7+8Doyv0mpXd14
 lYEby/27KCzNLnq/ICM1EnXGRgfNxn/pqIhbm1EeBxWOCurAjLZhNW6h2s0YNtGm1edb
 ELz0MxdMxiFWnfMjdwSzMACW6Q9gWPMNryv/JqMuB4IZizYh7wr46UudpaUYbEJJ6wO0
 4UdwTHvS8sR8wWsf3Njoy6SnRrPlrjhFuTRcCV7I9ez8ryuU0CJdJrT70pfKZp+Mz2OL
 4qiQ==
X-Gm-Message-State: AOJu0YwAhMSCoE5uTLoRIkt25TjA10RFuHNS9L3FSPEx8V96J7Bwqv9x
 XgnnkXiQXhQxiVd56VawkSWW27PoNUx573BqET4T7ZN6KQpKOTY7P2PXcw6MaVH7Pud5jnRhSBN
 OXcqlZu5TsGB+Bfa7CgAgBcf+bNN9hdv9cM2CkfeRizL+5F3VX/MRRShaoHbqO7K2NQSYZDtqtS
 ozjM0ZvLbnthKs6UZXzMUra09z/ZJL5/iYiJC9fr58tJdgIpS72OSP1Q==
X-Gm-Gg: ASbGnctY2TvZaGfMnb8n2mjvTHpUXDdnnt4tobuVrw+uG/qOmvWv02rLlqUeGpAiE4v
 eqO/q+EatUgu3bcNiJAbJMXCgWqTrds130kOLEd3WgdrYtXspbxbFRMjrszHR+1j5R829mPrRrI
 SBiI6z4Rr7hx7oUsLNRIc3xOq89uX37/tgGuPF3fsaVxTbsWKe0lcszsqv7P+tho9dc/k5nlOjb
 R3i64gVRKKOMi+9one1eM1T5IArfw1Rht4Etb2T1g381QgZtZTHEGQiXRKV6jz3buJA+6diaFvT
 iE5Ryh5riuQldO1o/ZTGneUJ07zh2r193wGc/p8Vi3phRJfgucw=
X-Received: by 2002:a05:600c:3e83:b0:450:d5a5:e6c5 with SMTP id
 5b1f17b1804b1-4520140bcb7mr30072045e9.26.1749216748894; 
 Fri, 06 Jun 2025 06:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9CE6kQPmKViW2JfmVnRBRNZCNnsSqQCnaymqPc47Dq7YKKkLzpgCLyO9Dc7LBMGS4uu1GvA==
X-Received: by 2002:a05:600c:3e83:b0:450:d5a5:e6c5 with SMTP id
 5b1f17b1804b1-4520140bcb7mr30071575e9.26.1749216748357; 
 Fri, 06 Jun 2025 06:32:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm1947020f8f.69.2025.06.06.06.32.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 06:32:27 -0700 (PDT)
Message-ID: <11c3dd92-29dc-4dbc-b7f9-53f3b5ae2f74@redhat.com>
Date: Fri, 6 Jun 2025 15:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/9] drm/i915: Add intel_bo_panic_setup and
 intel_bo_panic_finish
To: dri-devel@lists.freedesktop.org
References: <20250606120519.753928-1-jfalempe@redhat.com>
 <20250606120519.753928-6-jfalempe@redhat.com>
 <5e5014e3f1cbc9c91d2d6e4a3258c775a468bf46@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5e5014e3f1cbc9c91d2d6e4a3258c775a468bf46@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LDdGQMCwrDYA9AEBjumwnH0ED7Gbwd8NCL-zGava2Dk_1749216750
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

On 06/06/2025 15:24, Jani Nikula wrote:
> On Fri, 06 Jun 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Implement both functions for i915 and xe, they prepare the work for
>> drm_panic support.
>> They both use kmap_try_from_panic(), and map one page at a time, to
>> write the panic screen on the framebuffer.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>>
>> v5:
>>   * Use iosys_map for intel_bo_panic_map().
>>
>> v7:
>>   * Return int for i915_gem_object_panic_map() (Ville Syrjälä)
>>
>> v8:
>>   * Complete rewrite, to use kmap_try_from_panic() which is safe
>>     to call from a panic handler
>>
>>   drivers/gpu/drm/i915/display/intel_bo.c    | 11 +++
>>   drivers/gpu/drm/i915/display/intel_bo.h    |  3 +
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 +
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 92 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/display/intel_bo.c      | 55 +++++++++++++
>>   5 files changed, 165 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
>> index fbd16d7b58d9..83dbd8ae16fe 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bo.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bo.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: MIT
>>   /* Copyright © 2024 Intel Corporation */
>>   
>> +#include <drm/drm_panic.h>
>>   #include "gem/i915_gem_mman.h"
>>   #include "gem/i915_gem_object.h"
>>   #include "gem/i915_gem_object_frontbuffer.h"
>> @@ -57,3 +58,13 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
>>   {
>>   	i915_debugfs_describe_obj(m, to_intel_bo(obj));
>>   }
>> +
>> +int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb)
>> +{
>> +	return i915_gem_object_panic_setup(to_intel_bo(obj), sb);
>> +}
>> +
>> +void intel_bo_panic_finish(struct drm_gem_object *obj)
>> +{
>> +	return i915_gem_object_panic_finish(to_intel_bo(obj));
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
>> index ea7a2253aaa5..9ac087ea275d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bo.h
>> +++ b/drivers/gpu/drm/i915/display/intel_bo.h
>> @@ -4,6 +4,7 @@
>>   #ifndef __INTEL_BO__
>>   #define __INTEL_BO__
>>   
>> +#include <drm/drm_panic.h>
>>   #include <linux/types.h>
>>   
>>   struct drm_gem_object;
>> @@ -23,5 +24,7 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
>>   						   struct intel_frontbuffer *front);
>>   
>>   void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
>> +int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb);
>> +void intel_bo_panic_finish(struct drm_gem_object *obj);
>>   
>>   #endif /* __INTEL_BO__ */
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index c34f41605b46..9a0c1019dcad 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -9,6 +9,7 @@
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_panic.h>
>>   
>>   #include "intel_memory_region.h"
>>   #include "i915_gem_object_types.h"
>> @@ -691,6 +692,9 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
>>   int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
>>   int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
>>   
>> +int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct drm_scanout_buffer *sb);
>> +void i915_gem_object_panic_finish(struct drm_i915_gem_object *obj);
>> +
>>   /**
>>    * i915_gem_object_pin_map - return a contiguous mapping of the entire object
>>    * @obj: the object to map into kernel address space
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 7f83f8bdc8fb..9bdbac3d9433 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2014-2016 Intel Corporation
>>    */
>>   
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_cache.h>
>>   #include <linux/vmalloc.h>
>>   
>> @@ -354,6 +355,97 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
>>   	return vaddr ?: ERR_PTR(-ENOMEM);
>>   }
>>   
>> +static struct page **i915_panic_pages;
>> +static int i915_panic_page = -1;
>> +static void *i915_panic_vaddr;
> 
> How do the per module variables work when you have multiple devices?

The panic handler is mono-threaded, and call each plane of each driver 
in turn. So even if those variables are shared by multiple devices, it 
won't be a problem.

i915_gem_object_panic_setup() is called first to init the variables.
then i915_gem_object_panic_page_set_pixel() is called for each pixel
and finally i915_gem_object_panic_finish() to free the resources.

Then i915_gem_object_panic_setup() can be called for another plane or 
another device.

hum, while writing this, I'm probably missing a kfree(i915_panic_pages) 
in i915_gem_object_panic_finish(), I will add that in next version.

Best regards,

-- 

Jocelyn
> 
> BR,
> Jani.
> 
>> +
>> +static void i915_panic_kunmap(void)
>> +{
>> +	if (i915_panic_vaddr) {
>> +		drm_clflush_virt_range(i915_panic_vaddr, PAGE_SIZE);
>> +		kunmap_local(i915_panic_vaddr);
>> +		i915_panic_vaddr = NULL;
>> +	}
>> +}
>> +
>> +static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj)
>> +{
>> +	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
>> +	struct page *page;
>> +	struct page **pages;
>> +	struct sgt_iter iter;
>> +
>> +	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_ATOMIC);
>> +	if (!pages)
>> +		return NULL;
>> +
>> +	i = 0;
>> +	for_each_sgt_page(page, iter, obj->mm.pages)
>> +		pages[i++] = page;
>> +	return pages;
>> +}
>> +
>> +/*
>> + * The scanout buffer pages are not mapped, so for each pixel,
>> + * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
>> + * Try to keep the map from the previous pixel, to avoid too much map/unmap.
>> + */
>> +static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
>> +						 unsigned int y, u32 color)
>> +{
>> +	unsigned int new_page;
>> +	unsigned int offset;
>> +
>> +	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
>> +
>> +	new_page = offset >> PAGE_SHIFT;
>> +	offset = offset % PAGE_SIZE;
>> +	if (new_page != i915_panic_page) {
>> +		i915_panic_kunmap();
>> +		i915_panic_page = new_page;
>> +		i915_panic_vaddr = kmap_local_page_try_from_panic(
>> +				   i915_panic_pages[i915_panic_page]);
>> +	}
>> +	if (i915_panic_vaddr) {
>> +		u32 *pix = i915_panic_vaddr + offset;
>> +		*pix = color;
>> +	}
>> +}
>> +
>> +/*
>> + * Setup the gem framebuffer for drm_panic access.
>> + * Use current vaddr if it exists, or setup a list of pages.
>> + * pfn is not supported yet.
>> + */
>> +int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct drm_scanout_buffer *sb)
>> +{
>> +	enum i915_map_type has_type;
>> +	void *ptr;
>> +
>> +	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
>> +	if (ptr) {
>> +		if (i915_gem_object_has_iomem(obj))
>> +			iosys_map_set_vaddr_iomem(&sb->map[0], (void __iomem *)ptr);
>> +		else
>> +			iosys_map_set_vaddr(&sb->map[0], ptr);
>> +
>> +		return 0;
>> +	}
>> +	if (i915_gem_object_has_struct_page(obj)) {
>> +		i915_panic_pages = i915_gem_object_panic_pages(obj);
>> +		sb->set_pixel = i915_gem_object_panic_page_set_pixel;
>> +		i915_panic_page = -1;
>> +		return 0;
>> +	}
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +void i915_gem_object_panic_finish(struct drm_i915_gem_object *obj)
>> +{
>> +	i915_panic_kunmap();
>> +	i915_panic_page = -1;
>> +}
>> +
>>   /* get, pin, and map the pages of the object into kernel space */
>>   void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>>   			      enum i915_map_type type)
>> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
>> index 27437c22bd70..eb9a3400c110 100644
>> --- a/drivers/gpu/drm/xe/display/intel_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: MIT
>>   /* Copyright © 2024 Intel Corporation */
>>   
>> +#include <drm/drm_cache.h>
>>   #include <drm/drm_gem.h>
>>   
>>   #include "xe_bo.h"
>> @@ -59,3 +60,57 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
>>   {
>>   	/* FIXME */
>>   }
>> +
>> +static int xe_panic_page = -1;
>> +static void *xe_panic_vaddr;
>> +static struct xe_bo *xe_panic_bo;
>> +
>> +static void xe_panic_kunmap(void)
>> +{
>> +	if (xe_panic_vaddr) {
>> +		drm_clflush_virt_range(xe_panic_vaddr, PAGE_SIZE);
>> +		kunmap_local(xe_panic_vaddr);
>> +		xe_panic_vaddr = NULL;
>> +	}
>> +}
>> +/*
>> + * The scanout buffer pages are not mapped, so for each pixel,
>> + * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
>> + * Try to keep the map from the previous pixel, to avoid too much map/unmap.
>> + */
>> +static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
>> +				    unsigned int y, u32 color)
>> +{
>> +	unsigned int new_page;
>> +	unsigned int offset;
>> +
>> +	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
>> +
>> +	new_page = offset >> PAGE_SHIFT;
>> +	offset = offset % PAGE_SIZE;
>> +	if (new_page != xe_panic_page) {
>> +		xe_panic_kunmap();
>> +		xe_panic_page = new_page;
>> +		xe_panic_vaddr = ttm_bo_kmap_try_from_panic(&xe_panic_bo->ttm,
>> +							    xe_panic_page);
>> +	}
>> +	if (xe_panic_vaddr) {
>> +		u32 *pix = xe_panic_vaddr + offset;
>> +		*pix = color;
>> +	}
>> +}
>> +
>> +int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb)
>> +{
>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +
>> +	xe_panic_bo = bo;
>> +	sb->set_pixel = xe_panic_page_set_pixel;
>> +	return 0;
>> +}
>> +
>> +void intel_bo_panic_finish(struct drm_gem_object *obj)
>> +{
>> +	xe_panic_kunmap();
>> +	xe_panic_page = -1;
>> +}
> 

