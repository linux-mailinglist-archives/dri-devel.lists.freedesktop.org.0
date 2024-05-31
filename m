Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816EC8D5F42
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 12:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3FC10E207;
	Fri, 31 May 2024 10:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CdMoGET8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE43610E207
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717150138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JPM4IojDxmSWXS732IpCkDK/lUzIYCXaPo9B8FGe3z0=;
 b=CdMoGET82jeihm5pXTF6ku2xgmyFfqIzY+dQE4PiGhuQZbAZ/6e+7MCxqLLBPIgC1cmEZL
 fvAKevQwT1Q4W/Ro/Inr0CTw/rhcQ+XyzeK0gSCKhB85Lz8XhqHMBMoYXLqdkBQYHcAIea
 r4ikJ/LxRBs7rzqBWg60tO45uL8yCKE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-ZWgXglBlPna8ELNl1GKkkw-1; Fri, 31 May 2024 06:08:56 -0400
X-MC-Unique: ZWgXglBlPna8ELNl1GKkkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4212976bcd2so9780005e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 03:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717150136; x=1717754936;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JPM4IojDxmSWXS732IpCkDK/lUzIYCXaPo9B8FGe3z0=;
 b=lqDN7rDCZ0BD3ccYZIMMXP099vkOjVBYhJB4dUI+WsfNObPbam4Kj0Naj0p+3PPavY
 H6FcV7ZTkjXBjJsXH35mBxvG6LFIGTpcL5j8S5aJuuhMbS4l6stUjoEdSkFJUXXQMQYS
 2BB3hTa+E34ZRcOsC0GZhdJ1tXuQQy0RH1jQ52Vxe5IqCyahsGyTFdCYtYWwJxNMnio5
 mx3kES+t0hCCXiSgXuMwVw63cHjkDkPGafd50fZBKdwHUkJdxwCXlYown/hIP61GoWGf
 kqsJ6HEl85tkIkdQwyQNKD60ELs15kFWMaom5Xwgy8WI1nBnVX8qTYE/AhL5ife26LJD
 70OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmsH0XM95gsQeGCgpHB/DcO2XqNpLeNNWBWqqfHov07DX+q9XkZyKqpcoP8I5n6uJ2BWonb4DOyq0q1x/kHezJPnIXigOIYRF4+3ySSvgc
X-Gm-Message-State: AOJu0Yy+1CXTrKQgKaiha/8F7Xr5Etgb4BkQolhhBpsvFQ2WsRxTxwwI
 6sPzO6dkPw71lQKkhtO2e+cv6cph2CXfhBIDU0gZYR3Sgz3lD+UL9bdEGALVLlGxvLQV+HX5CU0
 7YnB/z0ITdjPmoE3pPriBUhdOCjMWoLFHlnxBQkX7G2GP4gKPvaXzfqPT3nOtTmDcEA==
X-Received: by 2002:a05:600c:4fc9:b0:41b:f788:8ca6 with SMTP id
 5b1f17b1804b1-4212e0454a7mr10485825e9.8.1717150135555; 
 Fri, 31 May 2024 03:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPuw3MEXeTlp7YZCtLGuKn4NnaeG/ebkpjiQ3SHjtMTXBUH5tursVGtKUGlhAk2FE8hkhHFQ==
X-Received: by 2002:a05:600c:4fc9:b0:41b:f788:8ca6 with SMTP id
 5b1f17b1804b1-4212e0454a7mr10485585e9.8.1717150134954; 
 Fri, 31 May 2024 03:08:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42127061fd3sm50300055e9.12.2024.05.31.03.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 03:08:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/panic: Add a kmsg dump screen
In-Reply-To: <d934e0ca-0ae1-4e89-843f-95921c7b3ffa@redhat.com>
References: <20240531080750.765982-1-jfalempe@redhat.com>
 <20240531080750.765982-4-jfalempe@redhat.com>
 <87a5k61g3l.fsf@minerva.mail-host-address-is-not-set>
 <d934e0ca-0ae1-4e89-843f-95921c7b3ffa@redhat.com>
Date: Fri, 31 May 2024 12:08:53 +0200
Message-ID: <874jae1efe.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> On 31/05/2024 11:32, Javier Martinez Canillas wrote:
>> Jocelyn Falempe <jfalempe@redhat.com> writes:
>> 
>>> Add a kmsg dump option, which will display the last lines of kmsg,
>>> and should be similar to fbcon.
>>> Add a Kconfig choice for the panic screen, so that the user can
>>> choose between this new kmsg dump, or the userfriendly option.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/Kconfig     |  21 +++++
>>>   drivers/gpu/drm/drm_panic.c | 151 +++++++++++++++++++++++++++---------
>>>   2 files changed, 136 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 9703429de6b9..78d401b55102 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -137,6 +137,27 @@ config DRM_PANIC_DEBUG
>>>   	  This is unsafe and should not be enabled on a production build.
>>>   	  If in doubt, say "N".
>>>   
>>> +choice
>>> +	prompt "Panic screen formater"
>>> +	default DRM_PANIC_SCREEN_USERFRIENDLY
>>> +	depends on DRM_PANIC
>>> +	help
>>> +	  This option enable to choose what will be displayed when a kernel
>>> +	  panic occurs.
>>> +
>>> +	config DRM_PANIC_SCREEN_USERFRIENDLY
>>> +		bool "Default user friendly message"
>>> +		help
>>> +		  Only a short message telling the user to reboot the system.
>>> +
>>> +	config DRM_PANIC_SCREEN_KMSG
>>> +		bool "Display the last lines of kmsg"
>>> +		help
>>> +		  Display kmsg last lines on panic.
>>> +		  Enable if you are a kernel developer, and want to debug a
>>> +		  kernel panic.
>>> +endchoice
>> 
>> Why having it as a compile time option and not a runtime option ? AFAICT
>> this could be a drm.panic_format= kernel command line parameter instead.
>
> Yes, I didn't think about it. That would allow to get more debug 
> information from a user without rebuilding the kernel.
>
> I'll prepare a v2 with that.
>

Awesome, thanks!

> I prefer to use a drm.panic_screen=, as "format" might be confusing with 
> the color format ?
>

Indeed. I named _format because your prompt had "formater" in it, but
agree that _screen makes more sense and is easier to understand.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

