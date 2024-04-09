Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0189DBE2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 16:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E798A10E5FB;
	Tue,  9 Apr 2024 14:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P0DxC2N1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D809310E5FB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712672012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViaG/nHLsjZCz0HnG/wPWLVF1POQ+ej7ZPpNr1WZViw=;
 b=P0DxC2N1ciWk844aFQzYSbaxbrbFHu3sH247FMeCtyEwiCeRCqVMit69uYfpLmpe0oivM1
 SYEnPHeBasX9IMEUIwYiqwtxrThaTQzpp1IguU86yXoFQaOz5c/nCHBHe6Q/d04uVI1YXB
 M0rGLR+lvajKJarXGBzmhijFBnoIoFA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-pIvBCp8yMe6QQWWqiNTBvw-1; Tue, 09 Apr 2024 10:13:28 -0400
X-MC-Unique: pIvBCp8yMe6QQWWqiNTBvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41401f598cfso33223235e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 07:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712672008; x=1713276808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ViaG/nHLsjZCz0HnG/wPWLVF1POQ+ej7ZPpNr1WZViw=;
 b=CyHPrWOtnk8IpLwfKuMvmBKV876SD01gBtPynhxqoOB9i0ovYEg7QgQ/wx27eFjOOY
 OC4r5dffdrlf28j9wgKDbPG2TG9S0UbinXgrucu/Pg0sIP8TZTr7N/5Wx68Z+RysINmh
 5q8SX0MDmyMYtFCBn7Ihj5VeUKL/g/0pI1Z8xIQBJaTkE3iWQlMOn7bvNDoXbxpNzJYB
 rYhnc/FlcComjYwWOhMRi5RRHJWX4TXkfKuJuM6Sa8QKMt2WIk8sug+54rIBia+AamEw
 IcrS2pHAlf4GCB6sKz4AVkDvauCBWx8p9L1FreA+GV4YySIdQYMdGaDu3dg6kOlMTcbe
 gjAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbiz0LOKanhi88Nzqv9BXP6ve1DppG54Dos+paR3OP1ZHfZD0WUjRS2Nv+P6AfwNA1UzWAABcUVN+DJ4c9hdi58WMi6/l7YAuLmdiw+0he
X-Gm-Message-State: AOJu0YwLcWfYyuwUFJbxHchvl8Jy2/8KYbfuF0MU5DizgeFzOGmf/MLy
 Ss/MuMHUkJrZMTElJAjfXOUCFRTYbK5nWLoHaFEbwgyMPHetI8ea8WlXx/NdHyIOGBAfTfTDzvp
 Ub2yHifsvRY7cMzKFrX4ADIWL1tD/i2PFGLdHITWNFifHNER3WT3buRsJV7NfSxjLJg==
X-Received: by 2002:a05:600c:444d:b0:416:ba8f:d980 with SMTP id
 v13-20020a05600c444d00b00416ba8fd980mr461492wmn.7.1712672007831; 
 Tue, 09 Apr 2024 07:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6BsN/nOaF5U/ZcL6rd2h3LzlKDMt38DExdnbD/npLq2aQpsIPy7Q2H34sDAXBZIen5Sv0AQ==
X-Received: by 2002:a05:600c:444d:b0:416:ba8f:d980 with SMTP id
 v13-20020a05600c444d00b00416ba8fd980mr461471wmn.7.1712672007425; 
 Tue, 09 Apr 2024 07:13:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:f101:edd0:5929:7a40?
 ([2a01:e0a:d5:a000:f101:edd0:5929:7a40])
 by smtp.gmail.com with ESMTPSA id
 bi17-20020a05600c3d9100b00416bf7b68f6sm70196wmb.31.2024.04.09.07.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 07:13:27 -0700 (PDT)
Message-ID: <724545ed-4aab-49c6-8a32-f34a2ca15e75@redhat.com>
Date: Tue, 9 Apr 2024 16:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org, sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com
References: <20240328120638.468738-1-jfalempe@redhat.com>
 <20240328120638.468738-6-jfalempe@redhat.com>
 <b57f3a3a-68e1-4069-83de-2b3aca6cafb7@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <b57f3a3a-68e1-4069-83de-2b3aca6cafb7@suse.de>
X-Mimecast-Spam-Score: 0
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



On 09/04/2024 10:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.03.24 um 13:03 schrieb Jocelyn Falempe:
>> This was initialy done for imx6, but should work on most drivers
>> using drm_fb_dma_helper.
>>
>> v8:
>>   * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
>>     (Thomas Zimmermann)
>>
>> v9:
>>   * go back to get_scanout_buffer()
>>   * move get_scanout_buffer() to plane helper functions
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_fb_dma_helper.c | 47 +++++++++++++++++++++++++++++
>>   include/drm/drm_fb_dma_helper.h     |  4 +++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c 
>> b/drivers/gpu/drm/drm_fb_dma_helper.c
>> index 3b535ad1b07c..010327069ad4 100644
>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
>> @@ -15,6 +15,7 @@
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_plane.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/module.h>
>> @@ -148,3 +149,49 @@ void drm_fb_dma_sync_non_coherent(struct 
>> drm_device *drm,
>>       }
>>   }
>>   EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
>> +
>> +#if defined(CONFIG_DRM_PANIC)
> 
> I would not bother with CONFIG_DRM_PANIC for now and make the helper 
> generally available.

yes, that's a small function, let's keep it simple.
Done in v12
> 
>> +/**
>> + * @plane: DRM primary plane
>> + * @drm_scanout_buffer: scanout buffer for the panic handler
>> + * Returns: 0 or negative error code
>> + *
>> + * Generic get_scanout_buffer() implementation, for drivers that uses 
>> the
>> + * drm_fb_dma_helper.
>> + */
>> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
>> +                     struct drm_scanout_buffer *sb)
> 
> It's neither really a function for panic handling nor a GEM function. 
> This helper needs to be called drm_fb_dma_get_scanout_buffer() IMHO.
> 
I agree, it matches the other functions prefixes in this file.
Done in v12

>> +{
>> +    struct drm_gem_dma_object *dma_obj;
>> +    struct drm_framebuffer *fb;
>> +
>> +    fb = plane->state->fb;
>> +    /* Only support linear modifier */
>> +    if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
>> +        return -ENODEV;
>> +
>> +    dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
>> +
>> +    /* Buffer should be accessible from the CPU */
>> +    if (dma_obj->base.import_attach)
>> +        return -ENODEV;
>> +
>> +    /* Buffer should be already mapped to CPU */
>> +    if (!dma_obj->vaddr)
>> +        return -ENODEV;
>> +
>> +    iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
>> +    sb->format = fb->format;
>> +    sb->height = fb->height;
>> +    sb->width = fb->width;
>> +    sb->pitch = fb->pitches[0];
>> +    return 0;
>> +}
>> +#else
>> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
>> +                     struct drm_scanout_buffer *sb)
>> +{
>> +    return -ENODEV;
>> +}
>> +#endif
>> +EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);
>> diff --git a/include/drm/drm_fb_dma_helper.h 
>> b/include/drm/drm_fb_dma_helper.h
>> index d5e036c57801..61f24c2aba2f 100644
>> --- a/include/drm/drm_fb_dma_helper.h
>> +++ b/include/drm/drm_fb_dma_helper.h
>> @@ -7,6 +7,7 @@
>>   struct drm_device;
>>   struct drm_framebuffer;
>>   struct drm_plane_state;
>> +struct drm_scanout_buffer;
>>   struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct 
>> drm_framebuffer *fb,
>>       unsigned int plane);
>> @@ -19,5 +20,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device 
>> *drm,
>>                     struct drm_plane_state *old_state,
>>                     struct drm_plane_state *state);
>> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
>> +                     struct drm_scanout_buffer *sb);
>> +
>>   #endif
> 

Thanks for the reviews,

-- 

Jocelyn

