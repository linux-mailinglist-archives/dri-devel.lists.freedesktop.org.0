Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56584DCF6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 10:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305FC10E137;
	Thu,  8 Feb 2024 09:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SzGwP6l6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497D710E137
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707384675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qr+dTNieJpvb4mWkyVyHPmxg9dsmKbUD5sRkEC84t5M=;
 b=SzGwP6l6i8APT5zSuSN6YfHs3cE8dF5mDgli7n5652CglPnRPPxGXF5SgVltkxtA5moYsl
 mQ6e4cVOBbsmYmYFa58nj+ouMjSQHmFM3TeyjZVfaWjpQhCKC/YzBcQflKqNNFc87DaoAw
 Q7yxvbXKNWRRypnr34ma+01/l1t5LRs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-O1bbYE07OdOYswiePEg9jQ-1; Thu, 08 Feb 2024 04:31:13 -0500
X-MC-Unique: O1bbYE07OdOYswiePEg9jQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40fb03d8a39so9425715e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 01:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707384672; x=1707989472;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qr+dTNieJpvb4mWkyVyHPmxg9dsmKbUD5sRkEC84t5M=;
 b=nqT/jjEvsLmNNtK53ZvWK2lQX2ht9cuoh28ahdtHtGTPuk58HiRvkYcyc1c6V1I2LT
 zbPI7OTC3vHMU3dAR/GMkkNSj8K6FBk/1IcHE6kx9Kse7x58kOomBPaO+pdI5wjMrS+c
 JKPE0j6pWW1tTAedARcFZRfVxPGzXarOs9q46UG6lKhq1jjMq1vGpP4I12bNZ5QiDUz+
 C73IMTCK/W1yXmqYrNqMkGZ/Uw5krIy8cKNGuvAnpBYhWaYRqReq0tl0wdNYxtYnSYTl
 BtpZKSqXdNsEatYoTF4irqqrIrYDnib3Y7EGYQ3WfTfSOn3QLgX7/Py/IubGyBsDwWWs
 l1BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+kFc/Z2HqKIBfUtiRy9uFSe3+aj+QdsTLambLQPxCrL3XenCrzwGcYUZ2bTj4ACihZAF8L/R+31b/OtKADTfpn/8AR6y37GFNnmgCipkt
X-Gm-Message-State: AOJu0YzN2dUf6Z+vHMm2L6CGhi9VG8RXpolOZZd1Fuu3JL2scN0+Zpyf
 mX5gFpz7Vi4ULCD93X3igap17BkWczGSTMoAYW+Y5BU2yX2QuYva22AE5di57QZ/+mtk/Z8y7XR
 3WzqJtsnbg5xDf2rGnzVsn1fY/ZJv1gdpR5MzYXeN2t29gi6GNCyxPRt9TXTBH6wmZg==
X-Received: by 2002:a05:6000:1754:b0:33b:366f:f816 with SMTP id
 m20-20020a056000175400b0033b366ff816mr5673096wrf.67.1707384672305; 
 Thu, 08 Feb 2024 01:31:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXK/Hqj1/+aPvr6u5w7oOJFPIX2iQjeqrmXIn/GbAQwdhUS4EuPsxD4JckNa3iqamX45lN4Q==
X-Received: by 2002:a05:6000:1754:b0:33b:366f:f816 with SMTP id
 m20-20020a056000175400b0033b366ff816mr5673078wrf.67.1707384671837; 
 Thu, 08 Feb 2024 01:31:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWumZ55yAMfMSTJQ/14QgXhJs2owVz8s3Rckk6gvIg0eBT1hoU0kPR4GR1mgSF6I3Gippa/7nLxUuxgVIR0BCcpHje72ny2YUJUZU2Dka3X2IJUwJBwjhMsPQ9VLL2W4uT2xj3bhatlV3Iwxw0X0RAlTGM3FQ==
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 z14-20020adff1ce000000b0033905a60689sm3218608wro.45.2024.02.08.01.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 01:31:11 -0800 (PST)
Message-ID: <3c46b96a-5cb8-489b-bb56-abe44f95bc41@redhat.com>
Date: Thu, 8 Feb 2024 10:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Add a workaround for low-latency
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch
References: <20240206222203.347626-1-jfalempe@redhat.com>
 <7e74ac7c-d0c2-47d4-81ba-483d31624975@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <7e74ac7c-d0c2-47d4-81ba-483d31624975@suse.de>
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



On 07/02/2024 10:47, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.02.24 um 23:21 schrieb Jocelyn Falempe:
>> We found a regression in v5.10 on real-time server, using the
>> rt-kernel and the mgag200 driver. It's some really specialized
>> workload, with <10us latency expectation on isolated core.
>> After the v5.10, the real time tasks missed their <10us latency
>> when something prints on the screen (fbcon or printk)
>>
>> The regression has been bisected to 2 commits:
>> commit 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
>> commit 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>>
>> The first one changed the system memory framebuffer from Write-Combine
>> to the default caching.
>> Before the second commit, the mgag200 driver used to unmap the
>> framebuffer after each frame, which implicitly does a cache flush.
>> Both regressions are fixed by this commit, which restore WC mapping
>> for the framebuffer in system memory, and add a cache flush.
>> This is only needed on x86_64, for low-latency workload,
>> so the new kconfig DRM_MGAG200_LATENCY_WORKAROUND depends on
>> PREEMPT_RT and X86.
>>
>> For more context, the whole thread can be found here:
>> https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/
> 
> This URL should be in a Link tag below the SoB line, like this:
> 
> Link: 
> https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/ # 1 You can refer to it from within the text with [1].
ok

>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/Kconfig        | 10 ++++++++++
>>   drivers/gpu/drm/mgag200/mgag200_drv.c  | 17 +++++++++++++++++
>>   drivers/gpu/drm/mgag200/mgag200_mode.c |  8 ++++++++
>>   3 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/Kconfig 
>> b/drivers/gpu/drm/mgag200/Kconfig
>> index b28c5e4828f4..73e4feba743a 100644
>> --- a/drivers/gpu/drm/mgag200/Kconfig
>> +++ b/drivers/gpu/drm/mgag200/Kconfig
>> @@ -11,3 +11,13 @@ config DRM_MGAG200
>>        MGA G200 desktop chips and the server variants. It requires 0.3.0
>>        of the modesetting userspace driver, and a version of mga driver
>>        that will fail on KMS enabled devices.
>> +
>> +config DRM_MGAG200_LATENCY_WORKAROUND
> 
> Can we call this DRM_MGAG200_IOBURST_WORKAROUND? I know what you mean by 
> latency, but that's not what is happening in the driver. The latency you 
> refer to is the deterministic response time of your process, but the 
> response time of the driver actually goes up (because of the disabled 
> caching).
> 
>> +    bool "Enable workaround for low latency server"
> 
> This is a 'low-latency server'. But I'd just say "Disabled buffer 
> caching", so that users know what they are getting into.
> 
>> +    depends on DRM_MGAG200 && PREEMPT_RT && X86
>> +    help
>> +      Enable a workaround to have better latency with mgag200 driver.
> 
> Here I'd say "Enable a workaround to avoid I/O bursts within the mgag200 
> driver at the expense of overall display performance."
> 
>> +      It restores the <v5.10 behavior, by mapping the framebuffer in 
>> system
>> +      RAM as Write-Combining, and flushing the cache after each write.
>> +      This is only needed on x86_64 and if you want low-latency.
> 
> Maybe "This is only useful on x86_64 if you want to run processes with 
> deterministic latency."
> 
> The code itself looks good to me.

Thanks, I will send a v2 with all these changes.

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>> +      If unsure, say N.
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index 54fce00e2136..3fdef8b580cc 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -84,6 +84,20 @@ resource_size_t mgag200_probe_vram(void __iomem 
>> *mem, resource_size_t size)
>>       return offset - 65536;
>>   }
>> +#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
>> +static struct drm_gem_object *mgag200_create_object(struct drm_device 
>> *dev, size_t size)
>> +{
>> +    struct drm_gem_shmem_object *shmem;
>> +
>> +    shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
>> +    if (!shmem)
>> +        return NULL;
>> +
>> +    shmem->map_wc = true;
>> +    return &shmem->base;
>> +}
>> +#endif
>> +
>>   /*
>>    * DRM driver
>>    */
>> @@ -99,6 +113,9 @@ static const struct drm_driver mgag200_driver = {
>>       .major = DRIVER_MAJOR,
>>       .minor = DRIVER_MINOR,
>>       .patchlevel = DRIVER_PATCHLEVEL,
>> +#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
>> +    .gem_create_object = mgag200_create_object,
>> +#endif
>>       DRM_GEM_SHMEM_DRIVER_OPS,
>>   };
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index 0eb769dd76ce..34ef9fb6e96c 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -13,6 +13,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_cache.h>
>>   #include <drm/drm_damage_helper.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_format_helper.h>
>> @@ -436,6 +437,13 @@ static void mgag200_handle_damage(struct 
>> mga_device *mdev, const struct iosys_ma
>>       iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], 
>> fb->format, clip));
>>       drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
>> +
>> +    /* Flushing the cache greatly improves latency on x86_64 */
>> +#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
>> +    if (!vmap->is_iomem)
>> +        drm_clflush_virt_range(vmap->vaddr + clip->y1 * fb->pitches[0],
>> +                       drm_rect_height(clip) * fb->pitches[0]);
>> +#endif
>>   }
>>   /*
>>
>> base-commit: 1f36d634670d8001a45fe2f2dcae546819f9c7d8
> 

