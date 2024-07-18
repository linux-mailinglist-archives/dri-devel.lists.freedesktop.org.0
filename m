Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4126934890
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 09:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF5C10E57F;
	Thu, 18 Jul 2024 07:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JW9XMahH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F6210E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 07:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721286366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZ1lU4s3MEl0eqBrDrKpVc0POkcvbrGUvI/MYSaxt9I=;
 b=JW9XMahHpN9JlXItgjKirIQ2J7fVIUqpwRNQJqJ33LLNJo1XiyAYv4U+PB76JJrMFG4ZlI
 cIW3tBTFdsdN7pf4I9ovUcSWoDwtiwkrH5/asx0b7ooH3hDMlBD9NkS6uEl8HuOG4qis2M
 9fVbe3VNeTgIznaRJURJMyfuWPR28RQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-cuU44aXtNRuFasqlMXIl0A-1; Thu, 18 Jul 2024 03:06:04 -0400
X-MC-Unique: cuU44aXtNRuFasqlMXIl0A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4265464ddc9so2012125e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 00:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721286363; x=1721891163;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LZ1lU4s3MEl0eqBrDrKpVc0POkcvbrGUvI/MYSaxt9I=;
 b=lp/s1CxmLssuirdcY+KfNrKmyQf1z+iO8xAECmlhZQunyCKtJguWGHlFMPeN6LdV2N
 hQ9NybfEgxXMX0Cy0yAn0KACalYzJXXiLdM7PuWJhCCuk0uFS2F8Wi8MO23DXMQnHDdF
 1C7RWvrahDnQf/138ggU1v8wbS978dhCczD+l/tr4AOcKMkJBPq3uL5Vf6qfdbyR+lra
 z+k8Vd3oqXyQ+jofYjqaznlQIsYDgTmLabU/aV8FsFq+Z2t1VO0xSC4Oniij35m4aJNh
 lFeV2TXDdphRpWFjkCYrhohru6735VyofbmH6o1fU78uuITyfCKrJFFpv0aQmJ8LoTCO
 gpTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5ftNQkdEQXR+DIrcGxwbJ0+c+7jMLtTIsis9LMjaYaQEYU+5xN9XMpCdT6d2lmP45htYvhh3JFN1YD3uH4pbZi3KyETvDPPljbXfgDWpI
X-Gm-Message-State: AOJu0YzqJSfffWshYWQU8mauiRleI27kPSUA65HIfAgXwEz5nPU6mjt2
 htELRKjkAt9llRZnRO54glHBhGXWRunQ1kYgpqp9dKss5hnl4/3Z7FUJp0mqyvW1Ik3nNMsQOQ5
 sXLmdAdmDJe2SlYPHbyRnm8t/0Xr/+jGDinMsjcwoCOb/zqEQ0EiMc/jCnuOOejjOMQ==
X-Received: by 2002:a05:600c:a41:b0:424:a7f1:ba2 with SMTP id
 5b1f17b1804b1-427c83abaacmr11056365e9.17.1721286363345; 
 Thu, 18 Jul 2024 00:06:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa7qUlOIVPtRLS94vJ5+kzoefqLguJcUGf7zXA8087LONGESX8WhOSNJuoCKzvG05hbn781w==
X-Received: by 2002:a05:600c:a41:b0:424:a7f1:ba2 with SMTP id
 5b1f17b1804b1-427c83abaacmr11056155e9.17.1721286362999; 
 Thu, 18 Jul 2024 00:06:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c77f21bdsm23840755e9.29.2024.07.18.00.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 00:06:02 -0700 (PDT)
Message-ID: <93589af2-dcfc-437b-85ca-b0029f4d6401@redhat.com>
Date: Thu, 18 Jul 2024 09:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] fbcon: Add an option to disable fbcon in panic.
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
 <20240717090102.968152-3-jfalempe@redhat.com>
 <ZpfdcC2Es9rweHW_@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZpfdcC2Es9rweHW_@phenom.ffwll.local>
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



On 17/07/2024 17:04, Daniel Vetter wrote:
> On Wed, Jul 17, 2024 at 10:48:40AM +0200, Jocelyn Falempe wrote:
>> This is required to avoid conflict between DRM_PANIC, and fbcon. If
>> a drm device already handle panic with drm_panic, it should set
>> the skip_panic field in fb_info, so that fbcon will stay quiet, and
>> not overwrite the panic_screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_fb_helper.c  | 2 ++
>>   drivers/video/fbdev/core/fbcon.c | 7 ++++++-
>>   include/linux/fb.h               | 1 +
>>   3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index e2e19f49342e..3662d664d8f9 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -40,6 +40,7 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_vblank.h>
>>   
>> @@ -524,6 +525,7 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>>   	fb_helper->info = info;
>>   	info->skip_vt_switch = true;
>>   
>> +	info->skip_panic = drm_panic_is_enabled(fb_helper->dev);
>>   	return info;
>>   
>>   err_release:
> 
> Bit a bikeshed, but I'd split this patch out since it's for drm's fbdev
> emulation, not the fbcon core code. With that:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Agreed, I considered doing that when writing the patch, but as it was 1 
line, I kept it with the fbcon change.

Thanks,

-- 

Jocelyn

> 

