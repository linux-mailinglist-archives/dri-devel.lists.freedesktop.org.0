Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8BD8D5EEF
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CD10E796;
	Fri, 31 May 2024 09:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dT3r7d0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F5B10E796
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717149218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AI1G9ESxpW+ZuPiOhPgNR3k329eGi0PpaUXh7/ItK8=;
 b=dT3r7d0rnNB0wQtY8faKkV9+XgBzcs+QP6tu6mQlMLFxfSUik5ZL4ot2UxyLN/s/9CZA0K
 nR+aYiI/yF2OSO6Yn8bA2TDrxHkxssdGP/c369HxZEar2b0CekOoS+3vEQFUIVdw59kOh2
 tiYEHqnUNnMaweEPqbQGGFT5Fv+1rZY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-5fMBkm08MnmvM-ZbMQ1-BQ-1; Fri, 31 May 2024 05:53:36 -0400
X-MC-Unique: 5fMBkm08MnmvM-ZbMQ1-BQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4212a921370so8954765e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717149215; x=1717754015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5AI1G9ESxpW+ZuPiOhPgNR3k329eGi0PpaUXh7/ItK8=;
 b=pT14yIASEpKU/GdsaOsiExtxp6JP4oBD0vkxBYRcWmHz8S3R8kHygo85lZ8PhfuKvM
 QpjkW0OuDSd/QReFsY/5i81UsnqFW88w4RlGyHklM3Wzom5Dldof647n1cz6b09Kv3vm
 OP+f9MJCwBqYMiYF3FTk0Q1EbeLhKZvNKQMbB8bvLZFcHPOUrEd5wC4hTBvfqojo7KhO
 lkLl//cIu5NECRShlTbA8bKs9CprGzeVzPJKr9i8RCr84O04OfXe4BP++CrLkfVdYlf7
 gAvR2WwqDm+8H6dryYxpeOv64Wo+KPhyKKVLtYCXbjskUq6lf24zI+k1qss1EOsRVXaP
 YQng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnrmVK54yUvQnftP+X0lkWmSrhsyKDVC+fh6u2GithYE3glNw5pDLBS9uvHCpIATK+4uy8JWB3Esyx6b+EXDFx7+z0bORE+x2ef2KdbE7+
X-Gm-Message-State: AOJu0YwaGh/E35XzNwVmaw3cqhF+1zTr6J6f7R2ud2j/MaXqihcFpVZa
 N0158M9uV+MENwl109nK3lSuoDhKHD7CnBB6ZiIbmdivjsLtPMQkYb9+qH4HNprEDd2drQE+1IJ
 exO9ufVQnvm6xKmi0l1RC2NGYq0aKbC6Cmn8zw/J7f7/gLf5Ho+Wh5unIfaQK/hB8aA==
X-Received: by 2002:a05:600c:4704:b0:41b:eaf2:f7e6 with SMTP id
 5b1f17b1804b1-4212e046c83mr14148365e9.2.1717149215242; 
 Fri, 31 May 2024 02:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRH1YF649pCTFQeDt63Sx0q3Okz+LIWNrmqzn/HXdi7REtbHfb46BZwzVGHyEBkR95BEikIA==
X-Received: by 2002:a05:600c:4704:b0:41b:eaf2:f7e6 with SMTP id
 5b1f17b1804b1-4212e046c83mr14148135e9.2.1717149214785; 
 Fri, 31 May 2024 02:53:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b?
 ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42127056366sm50006975e9.3.2024.05.31.02.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:53:34 -0700 (PDT)
Message-ID: <d934e0ca-0ae1-4e89-843f-95921c7b3ffa@redhat.com>
Date: Fri, 31 May 2024 11:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panic: Add a kmsg dump screen
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240531080750.765982-1-jfalempe@redhat.com>
 <20240531080750.765982-4-jfalempe@redhat.com>
 <87a5k61g3l.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87a5k61g3l.fsf@minerva.mail-host-address-is-not-set>
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



On 31/05/2024 11:32, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
>> Add a kmsg dump option, which will display the last lines of kmsg,
>> and should be similar to fbcon.
>> Add a Kconfig choice for the panic screen, so that the user can
>> choose between this new kmsg dump, or the userfriendly option.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig     |  21 +++++
>>   drivers/gpu/drm/drm_panic.c | 151 +++++++++++++++++++++++++++---------
>>   2 files changed, 136 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 9703429de6b9..78d401b55102 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -137,6 +137,27 @@ config DRM_PANIC_DEBUG
>>   	  This is unsafe and should not be enabled on a production build.
>>   	  If in doubt, say "N".
>>   
>> +choice
>> +	prompt "Panic screen formater"
>> +	default DRM_PANIC_SCREEN_USERFRIENDLY
>> +	depends on DRM_PANIC
>> +	help
>> +	  This option enable to choose what will be displayed when a kernel
>> +	  panic occurs.
>> +
>> +	config DRM_PANIC_SCREEN_USERFRIENDLY
>> +		bool "Default user friendly message"
>> +		help
>> +		  Only a short message telling the user to reboot the system.
>> +
>> +	config DRM_PANIC_SCREEN_KMSG
>> +		bool "Display the last lines of kmsg"
>> +		help
>> +		  Display kmsg last lines on panic.
>> +		  Enable if you are a kernel developer, and want to debug a
>> +		  kernel panic.
>> +endchoice
> 
> Why having it as a compile time option and not a runtime option ? AFAICT
> this could be a drm.panic_format= kernel command line parameter instead.

Yes, I didn't think about it. That would allow to get more debug 
information from a user without rebuilding the kernel.

I'll prepare a v2 with that.

I prefer to use a drm.panic_screen=, as "format" might be confusing with 
the color format ?

> 
> [...]
>    
>> -/*
>> - * Draw the panic message at the center of the screen
>> - */
>> +#if defined(CONFIG_DRM_PANIC_SCREEN_USERFRIENDLY)
>> +
> 
> And that could avoid ifdefery in the C file.
> 
> [...]
> 
>> +#elif defined(CONFIG_DRM_PANIC_SCREEN_KMSG)
>> +
>> +#include <linux/kmsg_dump.h>
>> +#include <linux/printk.h>
>> +
> 
> I would add these even if guarded by DRM_PANIC_SCREEN_KMSG, to the
> start of the C file where are the other headers include directives.
> 
> The patch looks good to me though, so if you prefer to keep it as a
> build time option:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

