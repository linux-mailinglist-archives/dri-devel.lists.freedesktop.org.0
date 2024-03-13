Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB9087A8D9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 14:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755DD10F128;
	Wed, 13 Mar 2024 13:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VCuai2AU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F12610F128
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710338320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGASyupiET/vA9Sec+GVM70obxDz5fsBTrJ/JikeNFE=;
 b=VCuai2AUYsSu86CLJTRtD4VTIPn38eEb2cte8JZVZJq2pLukhMUXj4uaBzyEsPydDqX2z4
 3Q8JoYMJLbQ3zL2nl3I+rejvKp1S/lbVJvsy18x/ygXjZSJjFvYqDNA3Mbm1tfmRmcqvma
 eJBJ+oJDhCArDgJn0IzwiSR4iHHPPHE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-p-CG_KHIOcKBQmdUQd7uXQ-1; Wed, 13 Mar 2024 09:58:36 -0400
X-MC-Unique: p-CG_KHIOcKBQmdUQd7uXQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-412de861228so28034075e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 06:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710338315; x=1710943115;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vGASyupiET/vA9Sec+GVM70obxDz5fsBTrJ/JikeNFE=;
 b=oo1eXkWDpVA0KHP2++kkUVYN4wDYym92FVC06tEHa+h/fNM76kxO9+KCvncuMWE4Hi
 uANlZZBGiN5f0OW94OROYwU2DFlUZYbK4EnDRUp5TR2QjtNj7KBHDm6S2H9mzM0PHW43
 q36VrZtYN1ZTaPkkIe7EJtzohskdY/WMpME3aCW+YROsXfB7Qn9g0zThC3CqR5HRcLBG
 RADA5iG+W/lY/BJMQSvjCR9Br8vISxlap9h674K3mYPPaurtKPXduEimCWa1I/xcuXxZ
 aGble3k9vlU8oOhLRSIrkocWoC2i4PNo3YRNLhrLQVNe9uW3vKiB3ShxyHaTeSy1uVw9
 8GQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNluccoureJj15J1tiJWawJFHnSwa9h/2Hhd/LJfl9ZBiGKWQmdlbFiIgX1c4ynxZvzGUR7o9jQeAXqX/pfaery6u6+JHqmvf3ebi++Ofk
X-Gm-Message-State: AOJu0Yy7Tb8saRyLZf4imxvOxqKim3OKX5f6gaYqGC2Kz9qcnyNDTic+
 kGnZ0VzhYw8UlPKFM5BmgDQBP4d7t9tI8LgOpF7bypc2RJTeisRvFwOva5NIhd7KftG+qTqAHey
 rbtBDIGcBFJKsFZx7Tv0YMpN82RsVMkqEvQxqRWBduxYa5znMHIq+0lkNuhl+CNt0VA==
X-Received: by 2002:a05:600c:3585:b0:413:2522:a9f5 with SMTP id
 p5-20020a05600c358500b004132522a9f5mr23598wmq.21.1710338315021; 
 Wed, 13 Mar 2024 06:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElgeBLMaDcD4B7Tb9c5LGonebWzCrlD5RMdFfJ5yggqFU3wl65gSY510av1eaMGUWFufSjvA==
X-Received: by 2002:a05:600c:3585:b0:413:2522:a9f5 with SMTP id
 p5-20020a05600c358500b004132522a9f5mr23584wmq.21.1710338314611; 
 Wed, 13 Mar 2024 06:58:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b00412706c3ddasm2396069wmo.18.2024.03.13.06.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:58:34 -0700 (PDT)
Message-ID: <c3b342ef-865a-46ca-92fe-c647b8eab2b0@redhat.com>
Date: Wed, 13 Mar 2024 14:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v9,5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-6-jfalempe@redhat.com>
 <5edd285f-5e23-411c-a39b-0e4f48e4ce17@linux.dev>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5edd285f-5e23-411c-a39b-0e4f48e4ce17@linux.dev>
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



On 12/03/2024 17:44, Sui Jingfeng wrote:
> Hi,
> 
> I'm get attracted by your patch, so I want to comment.
> Please correct or ignore me if I say something wrong.
> 
> On 2024/3/7 17:14, Jocelyn Falempe wrote:
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
>> +{
>> +    struct drm_gem_dma_object *dma_obj;
>> +    struct drm_framebuffer *fb;
>> +
>> +    fb = plane->state->fb;
>> +    /* Only support linear modifier */
>> +    if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
>> +        return -ENODEV;
> 
> 
> I think, the framebuffer format check clause here should be moved to the 
> core layer.
> For example, move this check into thedrm_panic_is_format_supported() 
> function. And update the drm_panic_is_format_supported() function  to 
> make it take 'struct drm_framebuffer *fb'
> as argument. Because this check is needed for all implement, not driver 
> specific or
> implement specific.

I'm unsure about this. I think for some drivers it might be easier to 
give a memory buffer different from the plane's drm_framebuffer, and do 
their own specific things to display it. So forcing the use of a 
drm_framebuffer will remove some flexibility.

> 
> I know that some display controller support TILE format, but then you 
> can try to trigger modeset
> to let the display controller using linear format to display. Or, you 
> can also convert local
> linear buffer(with content pained) to the device specific TILED 
> framebuffer, then feed TILED
> framebuffer to the display controller to scanout. This is something like 
> reverse the process of
> resolve, but the convert program is running on the CPU.  As panic is not 
> performance critical,
> so it's possible. This maybe a bit more difficult, but the idea behind 
> this is that the goal of
> this drm_panic_gem_get_scanout_buffer() function is just to get a buffer 
> scanout-able. Other
> things beyond that (like format checking) can be moved to upper 
> level(the caller of it). So you
> don't need to modify(update) the specific implement if one day you have 
> some fancy idea implemented.
> 
> 

Correct me if I'm wrong, but the tiled format are mostly hardware 
dependent, and I don't think we can have a generic implementation, that 
can cover multiple hardware.

I want to add support for multi-planar format like YUV for drm_panic 
later, but for tiled buffer, I think it should be easier to deactivate 
tiling on the hardware itself.

>> +    dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
>> +
>> +    /* Buffer should be accessible from the CPU */
>> +    if (dma_obj->base.import_attach)
>> +        return -ENODEV;
>> +
>> +    /* Buffer should be already mapped to CPU */
>> +    if (!dma_obj->vaddr)
>> +        return -ENODEV;
> 
> 
> How about to call drm_gem_vmap_unlocked(dma_obj, &sb->map); ?

It is not safe to call it from panic context, because it takes locks:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_gem.c#L1212

It may lockup the panic handler, and prevent other panic routine to run 
(like kdump).
So it's better to call drm_gem_vmap_unlocked() when the driver prepares 
the buffer for the primary plane, than doing it from the panic handler.


Best regards,

-- 

Jocelyn


> 
> 
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

