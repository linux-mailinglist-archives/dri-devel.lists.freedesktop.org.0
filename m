Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3C90A83F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693CD10E1D0;
	Mon, 17 Jun 2024 08:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xpg2VfgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4410E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718612194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0yA49gJGmNRGcXuv5QhrJG8CFiFtMDdkgT0dX3mskI=;
 b=Xpg2VfgTXK9gUlp0oPmRXzJndGnQhaf0jOI2PzLkWp88RoWHzSJBufIH+lRR7dp6ovDhZz
 71zbd5zFpDw4Ii4MHjPteoAl6Xld608oA0PoS7mQLTo4qWdp6EnDSmti9F/IqsnkjK8MWB
 Ad2tEuwVFbdpYO6xnG1ZPrjT2DUZ0AM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-7BTafqaVPAu5KLsc5jaSnw-1; Mon, 17 Jun 2024 04:16:32 -0400
X-MC-Unique: 7BTafqaVPAu5KLsc5jaSnw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35f1797e575so2499310f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718612191; x=1719216991;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K0yA49gJGmNRGcXuv5QhrJG8CFiFtMDdkgT0dX3mskI=;
 b=AjSvUl+CGW1uUYObkpBzOHmqg0UnVKwFB7CR8AzvNs0sY2iM30jwAkMDaanmu1koCX
 DkvPs44I+tJtybQ7CZQnYMkSzk3dFo8jf1QjozNYsgWA9h4YupKl6zPtAvRBljWPcqL/
 Ax27t8R0r5Udb+gSxf6rRc8hr0Cjo1pigJ8pWh/7/rxNtNWMaoklhqI4EA371TSAEuPi
 hFziwEREi3seZcbWYUNgaDfYBt9bzuo4S/lq9YxzddaB5ICBZcpDFc8BlZPikofP2uGB
 uNLGxMaRgELpIhpWsvMzZAFxZmBzVTRHNklI1q1KgG5haJV9Ou4nVzoanNBjOb6/tMkq
 2VwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6jgpGxQKOfP6DVQdjfwNIvFBz+IAh6Dql4uB2vOfe4xXsG3VeI3AILVyW2ubO+36j8k+PAZqXg4qRMLPrlcbmDSjrpz8sVYW6LyEJLnrz
X-Gm-Message-State: AOJu0YxQ1cNcsTBx5BSQG+XnV1bOvpzN4JzRmsfSTR5Te8EAVR1gXtcO
 WQv+A2141otOmzpH2FmRey2xgoFtFJoXVacBcpzYlbd9IOp0cBx+Jqk9WHABSqRxhyEs62GDGad
 QIs1m+JWCHHQe/g4pzNlWHlcjdkKHmvPu6HKQHxY796PrXDJZ9nh5HlmqKyix085cUw==
X-Received: by 2002:a05:6000:1785:b0:360:82a9:410f with SMTP id
 ffacd0b85a97d-36082a9419amr8805670f8f.47.1718612191247; 
 Mon, 17 Jun 2024 01:16:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/XzupvzNdtLSUaqvWCqOSFLfE8rJeqJhfbEmM1+7yWtldU1QBkPVAhknZr1zcuhyn+uw/8g==
X-Received: by 2002:a05:6000:1785:b0:360:82a9:410f with SMTP id
 ffacd0b85a97d-36082a9419amr8805648f8f.47.1718612190849; 
 Mon, 17 Jun 2024 01:16:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104a32sm11349691f8f.95.2024.06.17.01.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 01:16:30 -0700 (PDT)
Message-ID: <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
Date: Mon, 17 Jun 2024 10:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240613154041.325964-1-jfalempe@redhat.com>
 <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
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



On 16/06/2024 14:43, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
> Hello Jocelyn,
> 
>> The race condition between fbcon and drm_panic can only occurs if
>> VT_CONSOLE is set. So update drm_panic dependency accordingly.
>> This will make it easier for Linux distributions to enable drm_panic
>> by disabling VT_CONSOLE, and keeping fbcon terminal.
>> The only drawback is that fbcon won't display the boot kmsg, so it
>> should rely on userspace to do that.
>> At least plymouth already handle this case with
>> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index a9df94291622..f5c989aed7e9 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>>   
>>   config DRM_PANIC
>>   	bool "Display a user-friendly message when a kernel panic occurs"
>> -	depends on DRM && !FRAMEBUFFER_CONSOLE
>> +	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
> 
> I thought the idea was to only make it depend on !VT_CONSOLE, so that
> distros could also enable fbcon / VT but prevent the race condition to
> happen due the VT not being a system console for the kernel to print
> messages ?

Yes, but when writing the patch, I thought that if you have VT_CONSOLE=y 
and FRAMEBUFFER_CONSOLE=n, then there won't be any race condition, and 
drm_panic can be enabled safely.
I don't know if that really matters, and if VT_CONSOLE has any usage 
apart from fbcon.

> 
> In other words, my understanding from the discussion with Sima was that
> this should be instead:
> 
>   +	depends on DRM && !VT_CONSOLE
> 
> I've tested that and at least I see that a framebuffer console is present
> and `echo c > /proc/sysrq-trigger` triggers the DRM panic handler message
> (but don't know if the race exists and is just that I was not hitting it).
> 
> If my understanding is correct and should only be a depends on !VT_CONSOLE
> then feel free to add my:
> 
> Tested-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Best regards,

-- 

Jocelyn

