Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E7793929B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2230E10E1CA;
	Mon, 22 Jul 2024 16:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TvXvGPfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C65C10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721666076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSNEaNP8H5/eGVQlrv1O3IQGVc24IW6Ik8uTzGK8y9g=;
 b=TvXvGPfVcB0HOkTk9hNsDgrR6qcJwc83J34p+vlPwnx8PKC5iSY+dy6r7+hPetKAHEIOQV
 9SKMds2IUQDHoL0ACurUPKyl6e58kytaCSJNg5bHH7lRD77wy5tty9tt9eBBV6+cbT95Ux
 1r1JkCj8P1/JCSv6cFV3RUHY05qqrzY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-S8zyFAx5OZedWQeUzZ5heg-1; Mon, 22 Jul 2024 12:34:34 -0400
X-MC-Unique: S8zyFAx5OZedWQeUzZ5heg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42794cb8251so36853785e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721666073; x=1722270873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lSNEaNP8H5/eGVQlrv1O3IQGVc24IW6Ik8uTzGK8y9g=;
 b=L+sSTdm+9D9KbSY86g4CqUBB/2H8paWLkwom8BNOrOHAyFW2Tb20aCNPcLVbyJhYnK
 eMwLzaxXNRgt7tgM65sVKLO2suWXliN4i953McM/7gJRwEI+7BZhZNpdO/GJIkE2jbDP
 VmzuRrQBYI+bzJHqKbMQZPb4Z3oaB76NUc8c2jm4iO0OFgvQoQsz588Xs5ojwlkHiy3I
 tS8J/DKP4+97z5bmUPmK2DPOCFINtL6pR9BPYJUQ5ryn6ewoBGugLg9QC729jTQRxDp7
 3FCq6porJYFm8RZ4w23u6RtmtHDZm13FRHMM9YD5K2cCsUEA5QrnVX0TdRBaNHBMO+1V
 8dpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW02Vl6iDzD7nQSEYpp+KL5sQwJZnt/xVEThmNKMdEcp8hwHLAdIzODF0zalSnIoSUZZXRaYb/MCrMimrgDbauR39lOp2m/yROzehqI3X4d
X-Gm-Message-State: AOJu0YxpulWYODJYYrCYCULQyuE0NYHFhvdAyigM0raX57Ij4fCHt1j4
 uMT7zRd0D9O5GNdGsHwTiduaXAzQPbRbkUtpedv1QfkWBk2NnbCsL8OR95/EB8HtoSWvRK6Dysv
 DAYLXbEHrsEcP57l2iWMBMKinLRs6TKWMEaMw8iidyuYHW0OVMF5UjR0sWGDTRBz8rA==
X-Received: by 2002:a05:600c:4f0c:b0:426:5f8f:51a4 with SMTP id
 5b1f17b1804b1-427daa2815cmr43743015e9.12.1721666073746; 
 Mon, 22 Jul 2024 09:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+OrtOq9aqUKQAvqLUlUdGwmwjBvw3l7GhLZRB22QgBwpQRPohFHgOIA2Kt7hUWTLziSUvXQ==
X-Received: by 2002:a05:600c:4f0c:b0:426:5f8f:51a4 with SMTP id
 5b1f17b1804b1-427daa2815cmr43742815e9.12.1721666073319; 
 Mon, 22 Jul 2024 09:34:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6900caasm132996285e9.11.2024.07.22.09.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 09:34:32 -0700 (PDT)
Message-ID: <db3609fb-9ebc-42b2-a080-26462a8a491f@redhat.com>
Date: Mon, 22 Jul 2024 18:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Use oops_in_progress instead of panic_cpu
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: lkp@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
References: <202407210203.2ISiIC9m-lkp@intel.com>
 <20240722114800.174558-1-jfalempe@redhat.com>
 <Zp5pl4kcu9q6FWTP@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Zp5pl4kcu9q6FWTP@phenom.ffwll.local>
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



On 22/07/2024 16:15, Daniel Vetter wrote:
> On Mon, Jul 22, 2024 at 01:47:51PM +0200, Jocelyn Falempe wrote:
>> Panic_cpu is not exported, so it can't be used if fbcon is used as
>> a module. Use oops_in_progress in this case, but non-fatal oops won't
>> be printed.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202407210203.2ISiIC9m-lkp@intel.com/
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Yeah it's not great but gets the job done.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I pushed it to drm-misc-next.

Thanks a lot.

> 
> Cheers, Sima
> 
>> ---
>>   drivers/video/fbdev/core/fbcon.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index 498d9c07df80..2e093535884b 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -64,6 +64,8 @@
>>   #include <linux/console.h>
>>   #include <linux/string.h>
>>   #include <linux/kd.h>
>> +#include <linux/panic.h>
>> +#include <linux/printk.h>
>>   #include <linux/slab.h>
>>   #include <linux/fb.h>
>>   #include <linux/fbcon.h>
>> @@ -272,7 +274,14 @@ static int fbcon_get_rotate(struct fb_info *info)
>>   
>>   static bool fbcon_skip_panic(struct fb_info *info)
>>   {
>> +/* panic_cpu is not exported, and can't be used if built as module. Use
>> + * oops_in_progress instead, but non-fatal oops won't be printed.
>> + */
>> +#if defined(MODULE)
>> +	return (info->skip_panic && unlikely(oops_in_progress));
>> +#else
>>   	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
>> +#endif
>>   }
>>   
>>   static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)
>>
>> base-commit: 7e33fc2ff6754b5ff39b11297f713cd0841d9962
>> -- 
>> 2.45.2
>>
> 

