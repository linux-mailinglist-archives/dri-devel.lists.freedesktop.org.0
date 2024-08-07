Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D294A4D0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 11:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C64710E047;
	Wed,  7 Aug 2024 09:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dnhgl1z2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0633210E047
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723024574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY6HqkkMNSlTc7h4SiafgfX8uDrgkykdReRiDhBEPX8=;
 b=dnhgl1z2kZ48XWG8QTAw56BvqxvGDbEosG0m5rBUJRkM9pKXgu+NrDaRNfBY0EN2JCXokK
 NMANf+sh7zYq0aejImjth9o/YV0L83KmgjG7SUBWME9ZayWnSb1rNJ/SFtnBmtTG9IUg/8
 YNSJCFT2nuEEq1Ua3wL3DC+YMkRTQpM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-xdaXBnm-NeWMhbKduMcpWA-1; Wed, 07 Aug 2024 05:56:13 -0400
X-MC-Unique: xdaXBnm-NeWMhbKduMcpWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4281310bf7aso11229845e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 02:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723024572; x=1723629372;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cY6HqkkMNSlTc7h4SiafgfX8uDrgkykdReRiDhBEPX8=;
 b=kICtZ2Kvwp4NL8QL4LVd/LlZe/qMQxpaFymaqVlVhHOPaKv45WLJOiBxd7ljQCMLJW
 tWfQmAoSn6n7iO+8a1FnxevhM1T3neLaH85YvpDYXLXgd05I/VfYIS3t6zVGw4iPpn+I
 8zwq+HnxQ2dQL9pMQ2WS/wAiKfpGjySfdk5U5k0GdVK5UQj9QSDh96zKTqfl8pMoqIPa
 bGStXDwsJOzP1biTAkPUzIJXUnKG2Rbih0t4dqIeVv5WsC9pXvXXaNFW5x9XW93VA/I1
 FXQuWokbicPOG7j30mHG79D9neaeYrSblm47TL596c2hC5FO9hs7mWMKy0Ag65u9dLi+
 17kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURZfKnq0eUmC8r9y1uqV+PUmWtf/bsP45c9MclJWBtXSIPx3kBOcQGJxBJj75Bd0Gu/KTjaiNUOvXqArri9I/h8FCZHmOD0G69f8da2Pgv
X-Gm-Message-State: AOJu0YypI1SNkBGc4xf1bz5/Kr8GalRJTDJCUW3f5pwtD21ejV08ULwX
 epIQDhnIP43KsYNfRn+Y5NREN7iFxY7fZONpt2/ekmC4CixT6inJZ0N+GdGxNLXXHqTtTrxZS5y
 BuerQgUIo/ulVvV4b9GZ6qdM2jVbbv3GZbHpQdPX9jcGVgctJdepyR8MLFn39SWWUpA==
X-Received: by 2002:a05:600c:524c:b0:426:5ef5:bcb1 with SMTP id
 5b1f17b1804b1-428e6af80aamr116578515e9.6.1723024571677; 
 Wed, 07 Aug 2024 02:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFfd3J00jKma04KXxsMEz4pmJFGyGERcmOrBE+gBq+Pj79chhaKkkQF3yJ+1bWRU898FRkew==
X-Received: by 2002:a05:600c:524c:b0:426:5ef5:bcb1 with SMTP id
 5b1f17b1804b1-428e6af80aamr116578345e9.6.1723024571150; 
 Wed, 07 Aug 2024 02:56:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905802023sm21273605e9.37.2024.08.07.02.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 02:56:10 -0700 (PDT)
Message-ID: <bc07b834-0c51-416e-be3c-3edb6bcaa301@redhat.com>
Date: Wed, 7 Aug 2024 11:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/panic: Add panic description
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20240723091553.286844-1-jfalempe@redhat.com>
 <20240723091553.286844-6-jfalempe@redhat.com>
 <ZrM8pT0TCCV-GpQU@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZrM8pT0TCCV-GpQU@phenom.ffwll.local>
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



On 07/08/2024 11:21, Daniel Vetter wrote:
> On Tue, Jul 23, 2024 at 11:11:34AM +0200, Jocelyn Falempe wrote:
>> Now that kmsg dump callback has the description parameter, use it in
>> the user panic screen.
>> This is the string passed to panic(), like "VFS: Unable to mount root
>> fs on xxx" or "Attempted to kill init! exitcode=0xxxx".
>> It gives a hint on why the panic occurred, without being too cryptic.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 2efede7fa23a..fb283695f50e 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -81,6 +81,8 @@ static struct drm_panic_line panic_msg[] = {
>>   	PANIC_LINE("KERNEL PANIC!"),
>>   	PANIC_LINE(""),
>>   	PANIC_LINE("Please reboot your computer."),
>> +	PANIC_LINE(""),
>> +	PANIC_LINE(""), /* will be replaced by the panic description */
>>   };
>>   
>>   static const struct drm_panic_line logo_ascii[] = {
>> @@ -633,7 +635,20 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>>   	}
>>   }
>>   
>> -static void draw_panic_plane(struct drm_plane *plane)
>> +static void drm_panic_set_description(const char *description)
>> +{
>> +	u32 len;
>> +	if (description) {
> 
> #define PANIC_REASON_LINE ARRAY_SIZE(panic_msg)
> 
> instead of open coding a magic for.

Agreed
> 
>> +		panic_msg[4].txt = description;
>> +		len = strlen(description);
>> +		/* ignore the last newline character */
>> +		if (len && description[len - 1] == '\n')
>> +			len -= 1;
>> +		panic_msg[4].len = len;
>> +	}
>> +}
>> +
>> +static void draw_panic_plane(struct drm_plane *plane, const char *description)
>>   {
>>   	struct drm_scanout_buffer sb = { };
>>   	int ret;
>> @@ -642,6 +657,8 @@ static void draw_panic_plane(struct drm_plane *plane)
>>   	if (!drm_panic_trylock(plane->dev, flags))
>>   		return;
>>   
>> +	drm_panic_set_description(description);
> 
> I think a drm_panic_clear_description at the end of this function would be
> good, so we don't leve dangling pointers around (the passed-in line might
> be dynamically generated and stack allocated).

Yes it is stack allocated. Currently it works because you only use the 
panic_msg from this draw_panic_plane() function.
But I agree clearing the description at the end is better.
> 
>> +
>>   	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
>>   
>>   	if (!ret && drm_panic_is_format_supported(sb.format)) {
>> @@ -662,7 +679,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
>>   	struct drm_plane *plane = to_drm_plane(dumper);
>>   
>>   	if (detail->reason == KMSG_DUMP_PANIC)
>> -		draw_panic_plane(plane);
>> +		draw_panic_plane(plane, detail->description);
>>   }
>>   
>>   
>> @@ -682,7 +699,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
>>   	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
>>   		struct drm_plane *plane = file->private_data;
>>   
>> -		draw_panic_plane(plane);
>> +		draw_panic_plane(plane, "Test from debugfs");
> 
> Hm, should we make this line intentionally very long, to make sure we
> exercise the overflow logic for too long lines? Like so long that even on
> a 4k panel with a small font it will overflow. I worry otherwise that
> there will be a bug in that logic, taking down the machine at the worst
> possible moment ...

longer lines are truncated, so that the code stays simple, and ensure it 
won't draw out of the screen.

> 
> Reminds me, I think a bunch of kunit testcases to make sure the drm panic
> code is absolutely solid (there's a bunch of math in there after all)
> would be really good to add.

Yes, I need to add some kunit testcases.
When writing the drawing code, I used a small C program and write the 
result to a png, so I was able to check for different resolutions, and 
it's easier to debug than in the kernel.

I will send a v2.


> 
> Cheers, Sima
> 
>>   	}
>>   	return count;
>>   }
>> -- 
>> 2.45.2
>>
> 

