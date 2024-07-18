Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C308893487E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 09:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C51C10E579;
	Thu, 18 Jul 2024 07:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CM8GYjKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8953010E584
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721286250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzJwnsiZ2ke6MzC/8F3MYwH+Ub1DtGJI2z59uDcufYU=;
 b=CM8GYjKI9iKBEsiWBOuHZLz1M8n1L7jcxGPA7GcXwoOJX5ZY1Yzv/4h+o2w+DVHTlU3eVI
 +EY9gYdEZohlIahqZNhsw/IzqnVUwkZDHacUNxA8l6MwOSzEgvQlSY+NJBVbu7JhZ37jQ8
 C/4UDt2nimCX8RgbGU5JrJDEs8nuMhc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-uaArnfxyPKeKD55vt_yswg-1; Thu, 18 Jul 2024 03:04:08 -0400
X-MC-Unique: uaArnfxyPKeKD55vt_yswg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42490ae735dso4444685e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 00:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721286247; x=1721891047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzJwnsiZ2ke6MzC/8F3MYwH+Ub1DtGJI2z59uDcufYU=;
 b=NArvxJkQvOkukA79y1/cuDCrDY7YTATe1LZYEseHAHDctz6jFyLAgR/tAl4n7WT68O
 z5cmbrGuxrRqg6+TwAmq9+ENVYTbc4AaW2m7NRgmzb+V1aHX5Zdidmy883uze9kT8lUW
 KZzJGsDecrBp7NUv5/TohSTgJ9bZE7ExjixWT1gQ1rokwai4KVhs4xOULxTqux/u22Q8
 CHq1zWKIsrN9dXHTZekSAlzsMAhn12HXX6bUD3IbyzY4pAuWuZtzmirYJKRbzKMpiyQU
 FUsIoMf0uTGIccTCMoqAQSsKPg6M4kFovLr2jXZ8fd1TMKyL96rpkEoJD945tdmPYY4K
 lUqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHbCikAF1grBe5u70Qn1siAtQ9oXzfEO/lWSxrgtU0uItNr8rv8Irl0eXzU1KKPB6gRo0ulaSg3GmGPdXcE6JhzRwIwpA0YrowtsOU4dke
X-Gm-Message-State: AOJu0Yw5Li/WusoN3NRbpN2fY2sJqzbsXWoM09xjPrK87NbiVjmvuBOl
 pzrfflcgXH+I84x1x14vN50sXGnj/oIj6gudkOQ0hcN5WB6WPGyM51Zf1h3qlvYD1my/BeyUOKr
 gxA+/QGk4YGp/nauo0v0Y4D+RXiYrHfdMOrA1efgOR/LW/NeKs83Q8Kq0uaLiMCBmeA==
X-Received: by 2002:a05:600c:1f89:b0:425:64c5:5780 with SMTP id
 5b1f17b1804b1-427c2cad7d5mr36509565e9.1.1721286247227; 
 Thu, 18 Jul 2024 00:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/KUVPhRm2HpDoAZJMxonN2aOgQWPFNeB5yzFSNwGye7MxC3l02lsOkLZOMlNf7V+jEkpGEg==
X-Received: by 2002:a05:600c:1f89:b0:425:64c5:5780 with SMTP id
 5b1f17b1804b1-427c2cad7d5mr36509225e9.1.1721286246782; 
 Thu, 18 Jul 2024 00:04:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c77d810dsm23762885e9.26.2024.07.18.00.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 00:04:06 -0700 (PDT)
Message-ID: <34305c58-38a6-4b5a-9777-69833aefa003@redhat.com>
Date: Thu, 18 Jul 2024 09:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-2-jfalempe@redhat.com>
 <ZpfeiMj48JQTQcOE@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZpfeiMj48JQTQcOE@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 17/07/2024 17:08, Daniel Vetter wrote:
> On Wed, Jul 17, 2024 at 10:48:39AM +0200, Jocelyn Falempe wrote:
>> It allows to check if the drm device supports drm_panic.
>> Prepare the work to have better integration with fbcon and vtconsole.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
>>   include/drm/drm_panic.h     |  2 ++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 948aed00595e..d9a25c2d0a65 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -703,6 +703,26 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
>>   static void debugfs_register_plane(struct drm_plane *plane, int index) {}
>>   #endif /* CONFIG_DRM_PANIC_DEBUG */
>>   
>> +/**
>> + * drm_panic_is_enabled
>> + * @dev: the drm device that may supports drm_panic
>> + *
>> + * returns true if the drm device supports drm_panic
>> + */
>> +bool drm_panic_is_enabled(struct drm_device *dev)
>> +{
>> +	struct drm_plane *plane;
>> +
>> +	if (!dev->mode_config.num_total_plane)
>> +		return false;
>> +
>> +	drm_for_each_plane(plane, dev)
>> +		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
>> +			return true;
>> +	return false;
>> +}
>> +EXPORT_SYMBOL(drm_panic_is_enabled);
> 
> This feels like overkill since you currently only have one user in the
> fbdev emulation code, but maybe useful in some other places ...
> 
>> +
>>   /**
>>    * drm_panic_register() - Initialize DRM panic for a device
>>    * @dev: the drm device on which the panic screen will be displayed.
>> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
>> index 73bb3f3d9ed9..c3a358dc3e27 100644
>> --- a/include/drm/drm_panic.h
>> +++ b/include/drm/drm_panic.h
>> @@ -148,11 +148,13 @@ struct drm_scanout_buffer {
>>   
>>   #ifdef CONFIG_DRM_PANIC
>>   
>> +bool drm_panic_is_enabled(struct drm_device *dev);
> 
> Since it's internal only, this should be in
> drivers/gpu/drm/drm_crtc_internal.h and not int he include for drivers.

Yes, that makes sense, drivers won't need that API.

> With that:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>>   void drm_panic_register(struct drm_device *dev);
>>   void drm_panic_unregister(struct drm_device *dev);
> 
> These two are only used in drm.ko. Can you please move them to
> drm_crtc_internal.h too and drop the EXPORT_SYMBOL in a follow-up patch?
> We're trying to limit the exported interface and official headers to
> really only the pieces drivers actually need.

Sure, I'll add this to my next drm_panic series.

> 
> Thanks, Sima
> 
>>   
>>   #else
>>   
>> +bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>>   static inline void drm_panic_register(struct drm_device *dev) {}
>>   static inline void drm_panic_unregister(struct drm_device *dev) {}
>>   
>> -- 
>> 2.45.2
>>
> 

Best regards,

-- 

Jocelyn

