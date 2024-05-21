Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABE8CA935
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969E910E37F;
	Tue, 21 May 2024 07:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IhZ0SrkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A194510E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716277458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwFqJtJUXSCHxBWiKxXppUa/vqVLObUiAN0E0dFGxo0=;
 b=IhZ0SrkNT0X9cvIJrIwwxL88axvNDjxqKeo4y2Sub7LegcGu4ND1qb8K9hJZtjZcc5U8NW
 562GtKJCwNugfoTOZvNocaP+v470YwGFrB1hVsxQ5VIGjt9xcC8QRvzJv5KSchvS+kUs2L
 akGfQvFhPDZOY2dCY8RLE21eiu9+skc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-5EcSmHH9PKei3s4eZ_ULAQ-1; Tue, 21 May 2024 03:44:17 -0400
X-MC-Unique: 5EcSmHH9PKei3s4eZ_ULAQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42015260835so43722275e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 00:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716277456; x=1716882256;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uwFqJtJUXSCHxBWiKxXppUa/vqVLObUiAN0E0dFGxo0=;
 b=S5QlZHg/TYT6olN7qCcpTqdOTe/qIhjRoM+6vy6qHJFSzYWP8vEDIPRyGuHbCUIGkI
 A7ZUbFNGALJ+oFGHOSQrOjr0IxiLMUJ7pgwJgbIDLQ/uC4F0XPJfwgiJWbIKb16bywbs
 r2Zg2nJCRSiWSu0HFG3nRnQ//yiFjMDDqgHkGDie6UeY78IZ7VcLEWbqL4lsZ6eliDY6
 pLP51bYGZbV0hxmgv9HyQ8aIYqgBLN4gQtw5J6pzixbrdu4nTyiHzuj9TvN1jf4J3yJC
 tWlSC525dAlkOV8wtI/GY9x0Ct20nkYjzjGPVoLnfErNSk276wRsaiRKs2zuE64lIrUH
 7/xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1bikjNzIOHxDfINyui2JAG9Lk9sG9f4IEs4Zx+w6G+z5seppQOOYqOoXIk817VfDJKmlLyVvFM6c5OPhTASJ2QQ8k5WJCyzRegM6AmW1R
X-Gm-Message-State: AOJu0YwswibHGN+mfb245IN3mZVMa511sOIiKAf958SkxnuEgPbw5VPN
 sF03TZaeRyjSIG4lVlXiVSjQVKZyYBiTK/lPNaHFDKxlexQOLonJ5qnRVkhIfNyqXBagE7aZ9Qa
 f2pwH1ce1sPs76JPTs9cB6o3O8xB1GktWQA7HQeCcYDJSQgAwxHvnCaEfiyZ/fA6OBQ==
X-Received: by 2002:a05:600c:2d53:b0:41b:dabe:8633 with SMTP id
 5b1f17b1804b1-41feab40bc9mr222710475e9.21.1716277456297; 
 Tue, 21 May 2024 00:44:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG17D1mr3KiBg4b/6YqwMLtg30s0aeRAkG2VJMZtV5vJuHvrwL27RPE81Cm5EONRm5rCa4GTA==
X-Received: by 2002:a05:600c:2d53:b0:41b:dabe:8633 with SMTP id
 5b1f17b1804b1-41feab40bc9mr222710345e9.21.1716277455875; 
 Tue, 21 May 2024 00:44:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41ff063d8cesm418948055e9.46.2024.05.21.00.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 00:44:15 -0700 (PDT)
Message-ID: <a59c24db-1987-4a18-803c-4b4ea7b70458@redhat.com>
Date: Tue, 21 May 2024 09:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/mgag200: Add an option to disable Write-Combine
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240517151050.624797-1-jfalempe@redhat.com>
 <20240517151050.624797-3-jfalempe@redhat.com>
 <e6edbe57-16d9-4dae-b73e-95236922c669@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <e6edbe57-16d9-4dae-b73e-95236922c669@suse.de>
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



On 17/05/2024 17:16, Thomas Zimmermann wrote:
> Hi
> 
> Am 17.05.24 um 17:09 schrieb Jocelyn Falempe:
>> Unfortunately, the G200 ioburst workaround doesn't work on some
>> servers like Dell poweredge XR11, XR5610, or HPE XL260. In this case
>> completely disabling WC is the only option to achieve low-latency.
>> So this adds a new Kconfig option to disable WC mapping of the G200.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks a lot for the fix.

Thanks for the review, I just merged it to drm-misc-next.

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/mgag200/Kconfig       | 10 ++++++++++
>>   drivers/gpu/drm/mgag200/mgag200_drv.c |  6 ++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/Kconfig 
>> b/drivers/gpu/drm/mgag200/Kconfig
>> index b28c5e4828f47..3096944a8f0ab 100644
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
>> +      The VRAM of the G200 is mapped with Write-Combine to improve
>> +      performances. This can interfere with real-time tasks; even if 
>> they
>> +      are running on other CPU cores than the graphics output.
>> +      Enable this option only if you run realtime tasks on a server 
>> with a
>> +      Matrox G200.
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index 3883f25ca4d8b..62080cf0f2da4 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -146,12 +146,18 @@ int mgag200_device_preinit(struct mga_device *mdev)
>>       }
>>       mdev->vram_res = res;
>> +#if defined(CONFIG_DRM_MGAG200_DISABLE_WRITECOMBINE)
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

