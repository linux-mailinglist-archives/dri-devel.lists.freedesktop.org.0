Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F269EFE84
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 22:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498B710E5EB;
	Thu, 12 Dec 2024 21:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dOrHtcwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEBC10E5EB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 21:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734039669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tR7wzsXXxQ4eqiScyh3B9fZhywf3LiZTde7cxkKtp08=;
 b=dOrHtcwD0+HxSVvq+t5K0Wndn5wcnPBrETcr/BzTkeThricMKzrHHOQa8wapVG3Xl6/QrY
 SqDjCDZEPJBBhC/7eLWKdzIs4M6LlEJ6zTdE/EsutcXVNPNePxP6RjuZ0oesvu8YEFxXzQ
 mpR/tZlH72aPzxWBYJVSL/sJ0p6+0lo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-Q6B-1yssN6y96OqwfKZPqg-1; Thu, 12 Dec 2024 16:41:08 -0500
X-MC-Unique: Q6B-1yssN6y96OqwfKZPqg-1
X-Mimecast-MFC-AGG-ID: Q6B-1yssN6y96OqwfKZPqg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43625ceae52so6277215e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 13:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734039667; x=1734644467;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tR7wzsXXxQ4eqiScyh3B9fZhywf3LiZTde7cxkKtp08=;
 b=PlCyWkFLq2Pqt11HKKcBTE/iYf7ZZGEVcH87uEG3gua7cqkXtwj44HxKzn4zJGfma8
 pRTQHZd0aFriGdkzhyjV5U7N4hRkfbmLiPFAfWJX25l+1zAh1ngd9z+gD6xGS0RWAOyh
 7IrbXS+DhibC5v4Azoi+QnO/y2jzdj9rcJDuSrxejoT7HNwmL8gjV+0xA6eIhfvxn1W7
 Vj335TqkxAIMFetiA8gjJEL6mYKeSfbbL4P/4LfZ9xQGaE2SGKRsT548VwcfUwNBwOGm
 eH1vnagIZb8ROWz0FAYMzQ9++oVNtBTs2mFRb5jTgWHZpu/v48BjrZtfO7T6FRWEtpXK
 qLOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnuOks+60/wCoqK54Td13XkajLt8+Dz+Q4H+tR65+WR8DvVLctDeXQ/NWl3ih7nDnpSBDO86Wj0to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5nYtWxYYq9mhO5vDb7+pHl4NnmNFU5zMzMVyY1gIUWA1uh/nr
 /3VTd5NYDlafNxdPeALj79XrdBbzCZli2Djo6UJXq/dLg0bk9V9QHmEzDI4fFCWqJdOQAbRYpk+
 Tqw0vr7L3LJGUvi9FMXP5C+TIw8gnA9xByEwwMo3lbt+fE+wnpriUryYeP/t/0VxQKg==
X-Gm-Gg: ASbGnctGDJg+eSoY2ggSHnYvKfo75978PC0Ytuk/isq3cA4AUvljImSoNmM5JfniQF9
 3rUNiKWO87zLUTXrVztB5cwv6rWWrOD9GYoZoQZJP12YkhZi2rKcdc/8AlFmQTV2gUR9+F549I3
 odqOL37+VR8zu028g6QXvV0ePDa6yRF+gOJfwTFjvzYooQlo+KO0l5grH9gV9D3M/QUMTLF6mac
 zwRgg3GOrQUCHgwVZHsScQVDYFlOmJT6xntg9cWyC62V4F8qHDDQG0oOJe4t4gfw3KcmifM/TZA
 RR/daE9D4KCmEEfrTPHW
X-Received: by 2002:a05:600c:3d0f:b0:434:f609:1afa with SMTP id
 5b1f17b1804b1-4362aa34d42mr1254675e9.4.1734039667083; 
 Thu, 12 Dec 2024 13:41:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBEIjlQk7gBoLaQJcKagFV7fcub94Ft/J5oueYwjSMFuuqAh1fVbjgbwpxvCN3dRBCSH43Ng==
X-Received: by 2002:a05:600c:3d0f:b0:434:f609:1afa with SMTP id
 5b1f17b1804b1-4362aa34d42mr1254445e9.4.1734039666732; 
 Thu, 12 Dec 2024 13:41:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec87bc3sm41655335e9.1.2024.12.12.13.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 13:41:05 -0800 (PST)
Message-ID: <24e1c00a-b988-4b8b-bdf9-b30248070f40@redhat.com>
Date: Thu, 12 Dec 2024 22:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/log: select CONFIG_FONT_SUPPORT
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Larsson <andreas@gaisler.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241212154003.1313437-1-arnd@kernel.org>
 <eaffbf5e-ecb0-4aa3-8d05-da090494f8c3@redhat.com>
In-Reply-To: <eaffbf5e-ecb0-4aa3-8d05-da090494f8c3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zkCxAHQAFYh37dhRdrsHUt8xZTmF11z-FwN9ZtLmQ88_1734039667
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

On 12/12/2024 17:37, Jocelyn Falempe wrote:
> On 12/12/2024 16:39, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Without fonts, this fails to link:
>>
>> drivers/gpu/drm/clients/drm_log.o: in function `drm_log_init_client':
>> drm_log.c:(.text+0x3d4): undefined reference to `get_default_font'
>>
>> Select this, like the other users do.
> 
> Thanks for the fix, I'm sorry I missed that dependency.
> 
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

I just pushed it to drm-misc-next, as it can break the build.

Best regards,

-- 

Jocelyn

> 
>>
>> Fixes: f7b42442c4ac ("drm/log: Introduce a new boot logger to draw the 
>> kmsg on the screen")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/gpu/drm/clients/Kconfig | 1 +
>>   lib/fonts/Kconfig               | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/ 
>> clients/Kconfig
>> index c18decc90200..7b81fd0f4cae 100644
>> --- a/drivers/gpu/drm/clients/Kconfig
>> +++ b/drivers/gpu/drm/clients/Kconfig
>> @@ -77,6 +77,7 @@ config DRM_CLIENT_LOG
>>       select DRM_CLIENT
>>       select DRM_CLIENT_SETUP
>>       select DRM_DRAW
>> +    select FONT_SUPPORT
>>       help
>>         This enable a drm logger, that will print the kernel messages 
>> to the
>>         screen until the userspace is ready to take over.
>> diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
>> index 3ac26bdbc3ff..ae59b5b4e225 100644
>> --- a/lib/fonts/Kconfig
>> +++ b/lib/fonts/Kconfig
>> @@ -10,7 +10,7 @@ if FONT_SUPPORT
>>   config FONTS
>>       bool "Select compiled-in fonts"
>> -    depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
>> +    depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC || 
>> DRM_CLIENT_LOG
>>       help
>>         Say Y here if you would like to use fonts other than the default
>>         your frame buffer console usually use.
> 

