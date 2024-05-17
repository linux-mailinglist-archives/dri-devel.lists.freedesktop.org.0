Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160208C88FA
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 17:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433E10E23B;
	Fri, 17 May 2024 15:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XhgzLzqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA7D10E23B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715958252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1mEmhhdAIsfLNxlwoQ/A80QtVfZzlnu/Moyca9bPIM=;
 b=XhgzLzqXQhpwRzXtd5/s6cTdDPbyHo259g3V6UaSWTmpOjUXwXJeKAD4jsNQxKwJfW6lg+
 kIh73aQmYbPlSRurCsWP3zMGQixHLHobmGK/2gQYvFtRwiGca5k+e1tFSkZwkeqzJpLxhN
 YbBuCtNgXHq7gi19r7utCGA9Yy04s3M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-fg1C5-waOlqI2QLZ5KJU8A-1; Fri, 17 May 2024 11:04:10 -0400
X-MC-Unique: fg1C5-waOlqI2QLZ5KJU8A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-34db1830d7cso4103024f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 08:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715958249; x=1716563049;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1mEmhhdAIsfLNxlwoQ/A80QtVfZzlnu/Moyca9bPIM=;
 b=B9edpstct0Uy8iz/xxB0R2n5Mexa7dNymzHZIvZ77pr4xbVIJsB5OcDhLtFMaDgZaR
 BT6VC9rbo7v71Hv7r2JgRx91ejRZNYtJARLRt6W+z4ZthtkSgeYguggoXW4nBzAlB0Da
 K8FjrcF2/aJfsV7JAP7FN1GXt1SZesWv2+5dsWy7MKDuAsudy+N1XAYC8c47DTL24ovK
 dBfsF/ZVTVMrW7M/E/n1SdAJPM1TkvoIyhJpmAIoBtpdGijgowqm+ellGeRaYCSant3U
 oZBg+NMSjzCLI+NV6qedYmjSPERaNflT1Alc1nDI8XVOngeRm9Z8pgAqKE1EK+FYKTTl
 XN7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk3zO1arB/xv4XE4tTyYodniYsPHQKMVLLINz/Au0Ce3c7n2/RJlJ9wOUBVQsSIMwgSSfj3utX8LX+tNmhAXuQbjUX6NKewLd7os8KHh7P
X-Gm-Message-State: AOJu0YxNYZXonnhWcbqPLjgPTpkZ/Dd5TjF84UFyV/QsAPfk0mAVqJ1u
 emwZoKixJhbVfFFtktphKVBPcW6YJFZn9KgTEhKH5Fo6jFAoL3wE8vyPa+AlZ5VutXcC4GIGISy
 9azGb68n2FGSQRGKmmK2AgR8ZE7AcJJPFqt70XXqxNkxFsk+J8ZPjcs+CEI/d/G43yQ==
X-Received: by 2002:a05:6000:4ed:b0:34d:ae34:1c14 with SMTP id
 ffacd0b85a97d-35018285324mr23069314f8f.18.1715958249176; 
 Fri, 17 May 2024 08:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqpWMnw7Ba6b3+BHM+U6cc8ki9wGZzqMyCMnbakGltnDfJM/Ssth3RFuWqCltpmB7CsN8g2Q==
X-Received: by 2002:a05:6000:4ed:b0:34d:ae34:1c14 with SMTP id
 ffacd0b85a97d-35018285324mr23069277f8f.18.1715958248723; 
 Fri, 17 May 2024 08:04:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896aa5sm21775092f8f.34.2024.05.17.08.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 08:04:07 -0700 (PDT)
Message-ID: <e7363dc3-22e0-40d6-aef8-09149ba18e9b@redhat.com>
Date: Fri, 17 May 2024 17:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mgag200: Add an option to disable Write-Combine
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240516161751.479558-1-jfalempe@redhat.com>
 <20240516161751.479558-3-jfalempe@redhat.com>
 <b71a2cc2-fed2-427e-bd98-f9c67917a30e@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <b71a2cc2-fed2-427e-bd98-f9c67917a30e@suse.de>
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



On 17/05/2024 11:39, Thomas Zimmermann wrote:
> Hi,
> 
> just nits below.
> 
> Am 16.05.24 um 18:17 schrieb Jocelyn Falempe:
>> Unfortunately, the G200 ioburst workaround doesn't work on some servers
>> like Dell poweredge XR11, XR5610, or HPE XL260
>> In this case completely disabling WC is the only option to achieve
>> low-latency.
>> So this adds a new Kconfig option, to disable WC mapping of the G200
> 
> The formatting look off. Maybe make this one single paragraph.

Ok,
> 
> No comma after 'option'.
Ok,
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/Kconfig       | 10 ++++++++++
>>   drivers/gpu/drm/mgag200/mgag200_drv.c |  7 +++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/Kconfig 
>> b/drivers/gpu/drm/mgag200/Kconfig
>> index b28c5e4828f47..73ab5730b74d9 100644
>> --- a/drivers/gpu/drm/mgag200/Kconfig
>> +++ b/drivers/gpu/drm/mgag200/Kconfig
>> @@ -11,3 +11,13 @@ config DRM_MGAG200
>>        MGA G200 desktop chips and the server variants. It requires 0.3.0
>>        of the modesetting userspace driver, and a version of mga driver
>>        that will fail on KMS enabled devices.
>> +
>> +config DRM_MGAG200_DISABLE_WRITECOMBINE
>> +    bool "Disable Write Combine mapping of VRAM"
>> +    depends on DRM_MGAG200 && PREEMPT_RT
>> +    help
>> +      The VRAM of the G200 is mapped with Write-Combine, to improve
> No comma after Write-Combine

Ok
>> +      performances. However this increases the system latency a lot, 
>> even
> Just say "This can interfere with real-time tasks; even if they are 
> running on other CPU cores then the graphics output."

Ok
> 
>> +      for realtime tasks running on other CPU cores. Typically 40us-80us
>> +      latencies are measured with hwlat when Write Combine is enabled.
> 
> Leave out the next sentence: "Typically ..." The measureed numbers 
> depend on the hardware and everyone is encouraged to test on their own 
> system. You could mention  the numbers in the commit description, as you 
> already mention the affected systems there.

Ok
> 
>> +      Recommended if you run realtime tasks on a server with a Matrox 
>> G200.
> 
> I still think that we should not encourage anyone to use this option. 
> Maybe say "Enable this option only if you run..."

Agreed, I will change this.
> 
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index 3883f25ca4d8b..7461e3f984eff 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -146,12 +146,19 @@ int mgag200_device_preinit(struct mga_device *mdev)
>>       }
>>       mdev->vram_res = res;
>> +#if defined(CONFIG_DRM_MGAG200_DISABLE_WRITECOMBINE)
>> +    drm_info(dev, "Disable Write Combine\n");
> 
> I would not print this drm_info() here. The user has selected the config 
> option, so they should know what happens. It's also listed in /proc/mtrr 
> IIRC.

Sure, I can remove the drm_info().

Thanks for the review, I will send a v2 shortly.
> 
> Best regards
> Thomas
> 
>> +    mdev->vram = devm_ioremap(dev->dev, res->start, resource_size(res));
>> +    if (!mdev->vram)
>> +        return -ENOMEM;
>> +#else
>>       mdev->vram = devm_ioremap_wc(dev->dev, res->start, 
>> resource_size(res));
>>       if (!mdev->vram)
>>           return -ENOMEM;
>>       /* Don't fail on errors, but performance might be reduced. */
>>       devm_arch_phys_wc_add(dev->dev, res->start, resource_size(res));
>> +#endif
>>       return 0;
>>   }
> 

