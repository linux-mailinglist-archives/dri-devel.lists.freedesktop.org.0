Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622728A6F46
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22A3112D06;
	Tue, 16 Apr 2024 15:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GN9ryUfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C69112D06
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713279827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFCaHUQAAko0RRVSDJc61hDaFS6t6T6owwvQCc5GkIo=;
 b=GN9ryUfoPwpdMQbjevWNbWZI6R3mP0yBu5Zffn2AFsi/VYrXzLJ/JublWCzuiwjVmfonwu
 7iiDJYH98S8kAFn4H+TcUO7h1gQt5dlWHKUww/sTB5T0faNzqt4gODEAgFH8w+/swEMS1g
 ViHn8qiJL1yHkikcjcLGqLJy5KWNgmI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-onBgHfLjOIy9Ma5fMzNp7A-1; Tue, 16 Apr 2024 11:03:45 -0400
X-MC-Unique: onBgHfLjOIy9Ma5fMzNp7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41634d6c008so15410175e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713279824; x=1713884624;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GFCaHUQAAko0RRVSDJc61hDaFS6t6T6owwvQCc5GkIo=;
 b=T2rrmCLp8nTb0IawkbiUpK3cu5VsvyOuJIwOGErYf/zy9f90sj5jZdul1b23O9wErl
 umJCVpShlUPotGSuKjsxV48Bj4lla8ksQaREz3Ez1QoKl4CittjnFaO+NEvgzz7f8yQ3
 0XY8owpDHxcqbj3sQzPn0qFFTcy8jYol/OmWVUsSw2RUBTOpf6+UOB+8YHUJ3YlQK+VX
 gdBv4va2/U2clARPSxL+qCRE4a0WlL8BotJX4LEPdcFOYUEVZMwqXR4USfn6deqK9sT7
 g6YbKNjgvIbwT+TNI5C/F0gk9n7vEYA9p9GuOh4B6XK1gH0Y56lAKw0xI7pmjp7cT30h
 JuNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJu9mvD7xGRhxZ9b+0H9KZsirLTlpdEJHz7zhr/zjvoagwsYq8BtgcrJVn6SHE85wKQXekEDiy65bNBBJvRa3yphM19dkyQ6dumX7GR2lO
X-Gm-Message-State: AOJu0YxOrZI+KDyZms6HmEgoNfyJ7nHWEKFccPsVpeMTrdGsCRX/2+Fp
 0Cm6l+g3A/Xn93lCKTeR3w69vbwCJbGSO1ZMof/Mi42A13lQa22sEdvh1R1uhHpGai0e4g/2W0u
 bV0xix+skq55MfBsXXe0XOvd4q3tPJjBQLvY4YKnXAhYyH9yHGfaFsIiRAOhEglbKUQ==
X-Received: by 2002:a05:600c:35c8:b0:416:34c0:de9 with SMTP id
 r8-20020a05600c35c800b0041634c00de9mr13518357wmq.29.1713279824365; 
 Tue, 16 Apr 2024 08:03:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWIus5XfPAgYELw2OkMF+lbgol/KXXcD+0uXxwz1+sxLT35QetyVVtVycmvsy9n0zLsBm9gw==
X-Received: by 2002:a05:600c:35c8:b0:416:34c0:de9 with SMTP id
 r8-20020a05600c35c800b0041634c00de9mr13518336wmq.29.1713279823961; 
 Tue, 16 Apr 2024 08:03:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 fm15-20020a05600c0c0f00b004186f979543sm6702324wmb.33.2024.04.16.08.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 08:03:43 -0700 (PDT)
Message-ID: <4fb5088a-11da-426e-86a7-f53d964e2e7f@redhat.com>
Date: Tue, 16 Apr 2024 17:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fb_dma: Fix parameter name in htmldocs
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20240416090601.237286-1-jfalempe@redhat.com>
 <50a08e1c-094c-4735-a176-fd2f6694c01e@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <50a08e1c-094c-4735-a176-fd2f6694c01e@suse.de>
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



On 16/04/2024 14:12, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.04.24 um 11:05 schrieb Jocelyn Falempe:
>> The parameter name is 'sb' and not 'drm_scanout_buffer'.
>> It fixes the following warnings:
>>
>> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function 
>> parameter 'drm_scanout_buffer' description in 
>> 'drm_fb_dma_get_scanout_buffer'
>> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Function parameter 
>> or struct member 'sb' not described in 'drm_fb_dma_get_scanout_buffer'
>> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function 
>> parameter 'drm_scanout_buffer' description in 
>> 'drm_fb_dma_get_scanout_buffer'
>>
>> Fixes: 879b3b6511fe ("drm/fb_dma: Add generic get_scanout_buffer() for 
>> drm_panic")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

pushed to drm-misc-next

Thanks,

-- 

Jocelyn
> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/drm_fb_dma_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c 
>> b/drivers/gpu/drm/drm_fb_dma_helper.c
>> index c79b5078303f..96e5ab960f12 100644
>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
>> @@ -153,7 +153,7 @@ EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
>>   /**
>>    * drm_fb_dma_get_scanout_buffer - Provide a scanout buffer in case 
>> of panic
>>    * @plane: DRM primary plane
>> - * @drm_scanout_buffer: scanout buffer for the panic handler
>> + * @sb: scanout buffer for the panic handler
>>    * Returns: 0 or negative error code
>>    *
>>    * Generic get_scanout_buffer() implementation, for drivers that 
>> uses the
>>
>> base-commit: 7b0062036c3b71b4a69e244ecf0502c06c4cf5f0
> 

