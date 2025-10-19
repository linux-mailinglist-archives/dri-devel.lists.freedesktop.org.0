Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32BBEE831
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 17:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC8810E210;
	Sun, 19 Oct 2025 15:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wipd3Owz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A0E10E210
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 15:03:52 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b3df81b1486so60174066b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760886231; x=1761491031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/9udsA3BE7foY00QqPjtJbwYeXlQDHSIpbrDLCZLLAM=;
 b=Wipd3OwzUKlxSxqerSrURfo5h72Vgc1NHj0+ctecVrQeaAziFKgNVOPUTzKsbAX53J
 rX1jLiOX6R1ETYheLUMIhX1pzXqFuGCMFJU6mjuAa5tXZ90P9B1/zlUWHlb1wYr2Q5Bw
 uCyup8v6FA2BFZi2Wx7CmOaJPK8AAFqDeadqVMy8QXyCKHcFtUFtZ5ZcJwnPGDxCYWQN
 iyFPRmryFEVgKUxEYAp/dfIC0lghAudhhtJNdS7VtZahlPTq5oL1VPrqzxAbQs1Ep/Mf
 A/WPZCqOJQHLte5P6KSB4qmCQCzRpi0r4JMJGyKUDz+90JA3BFBONvHq52i9Z/RU9jzj
 MrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760886231; x=1761491031;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/9udsA3BE7foY00QqPjtJbwYeXlQDHSIpbrDLCZLLAM=;
 b=Bmg4ZtESS0IPkRnMmbX5PIl/D+174Hp2Cged4hNzGuc4CHcQOAR/Bq9wS6BJU7nNPS
 OcSemPN4dvw0RM/eOXeOKWddXHc8bi6cxyZ3stcYGqZ+WvtFXm71Ji0/1G1FViSUM0rj
 EmN0yCort05Zm/0FFdTJYG7MriTy8GlLmBTxgMCxGrPfRf4MKlGcEZPpRbKL2bOVn0hC
 GVOg3LVj8RmZm0yMghtqxzj1FcEUKqfmMiWDpvg7Y5aq/kN+5iP/Mpzo4l3e+2QThSjD
 lyNfbU27EHDRO3u4jjmr3Kj3LvHre+kB8X5eU9Xpu4B90IqUZTH//gYqfV0RTmqij9Op
 oddw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtrwwBHD2JSavBz7RBbyrdo0bT7PplJuvVcU8nKdqpdbkIrDQIclpQ12xXRY+zrvhUBzvdSqmgCXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy345yWldPrCtYiZqDRbYi5v2kLNqH28dyRHZ0THTTzwhcIPm5G
 J7rqP3I/tlWK2cpHqU+23rjzYdIkV45zGoj3HvO0+0YxflBOqBcJo6Vf
X-Gm-Gg: ASbGncsk+GXMlDC7SbzXW/i6motyIRu9QcuxKMjEyNupDGLwYtir8kT3ru4MOUZRwD5
 4zflXP8rPdxC4B86iRrBE6a7fjhELQNawjtXinm2/ztma2nE0oFoXv2DFCoZU9sfPLPBUq4PeRm
 kWMorzx3H5Ub/XEUHvhlDT9Q1Ja0bPdDgzP0GZrleK4xlQqsImT5+rFvZwTtPCULbtrdLOQkaZs
 fuM2SE83DrGnya7vMIcpQV+n5MKL3RALD0wTNTOAU7r9grcogtQ7V9P3oPLH5Sro39rdHnEMNjE
 g6bnBRJ3lUkkLguvqyPGmP6AlqUTBRa+ulrfZbYL6UnBS6gQUgY7DSolGgTiR3nkYs8b2GluLNa
 cGFNQyE7bOHkQPkQN+kcZ/KQ2zxS+X0PLKC3pi3g0LW11drUIT2uxZcQAKI4XcaqFhzwcreq+P+
 nVQ2025/6iP0YAZIdzVxcM
X-Google-Smtp-Source: AGHT+IH6TluHuNvwOnAVvgBjwGA0zfWFt6b5AZGTbaDmowoHujtKj2lEr/TiFV0djG0kgxyb8b/vig==
X-Received: by 2002:a05:6402:2751:b0:634:4e0:8377 with SMTP id
 4fb4d7f45d1cf-63c1f634390mr5314959a12.2.1760886230847; 
 Sun, 19 Oct 2025 08:03:50 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.121.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48a92961sm4345576a12.8.2025.10.19.08.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 08:03:50 -0700 (PDT)
Message-ID: <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
Date: Sun, 19 Oct 2025 17:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
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

On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 19.10.25 um 16:34 schrieb Greg KH:
>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
>>> Replace kmalloc() with kmalloc_array() to correctly
>>> handle array allocations and benefit from built-in overflow checking[1].
>>>
>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>
>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>> ---
>>>   drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>>> repaper.c
>>> index 4824f863fdba..290132c24ff9 100644
>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct 
>>> drm_framebuffer *fb, const struct iosys_map *
>>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>             epd->factored_stage_time);
>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>> This isn't an array, so this function change doesn't seem to make much
>> sense, right?  The size should have already been checked earlier in the
>> call change to be correct.
Yes,I was intending to say framebuffer but I was working on another 
similar patch simultaneously so I reused same words by mistake. Thanks 
for clarifying that.>
> Yes, we've recently received plenty of these pointless changes. The 
> correct code would compute the number of bytes per pixel using 
> drm_format_info_min_pitch() and multiply with fb->height. The latter 
> could (maybe) use kmalloc_array(). It would still not be an array in the 
> common sense.
> 
Thanks for the review and suggestion.I will be sending a v2 patch with 
the recommended code change.

Best Regards,
Mehdi Ben Hadj Khelifa> Best regards
> Thomas
> 
>>
>> thanks,
>>
>> greg k-h
> 
> -- 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

