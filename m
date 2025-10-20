Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27574BF356A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6A110E4B8;
	Mon, 20 Oct 2025 20:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PBNlUJVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AD810E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:11:39 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b47a5a17303so77084266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760991098; x=1761595898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4pYR5fc+13GPBMaNnLf78tmb9Ja2klUsIxWce12udek=;
 b=PBNlUJVJ2i1SBqY8WUM5C/joZtZv6yEwH7egbTj3N7/rsga7ur3v2g8M6m9OJvN4Gs
 M6H86aZIlDEnV4CbrFzLftYFYF80DOXXVSlWqK4wqHBx/rBaprMZDmbkXgwqx9/Pq9/A
 v4gYCkNEhXuidSImSe0vcuKtJ9JI6gDhlgY/GUJ63cwzrjhsU2daQ/rYz7mbNkScHWc2
 6HWybYJNA6Xw7i6BD48uRIYEpJvSYcoSmMvNl4Y0Gqv2ek6No/JgKCB9YGs9TNsPiUlp
 1poT8nD2+TuTggbAj98R01w6kCRkz6djYIBeXHKhhLuZrROxyK6LGAYdkAWkun2i6t/D
 POOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760991098; x=1761595898;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4pYR5fc+13GPBMaNnLf78tmb9Ja2klUsIxWce12udek=;
 b=FBsiWq6rtYfXK/7+/YUYad4+ge95lBUc+KL2x/8lJdww9AgoBbb9ZeQC0XJrr+0QkQ
 QFr2Tsu4AHvGots3bsV0PSbMdgp0wSNb5Xn7bdXczBZmlgsb+2N9J69BpUzwsM+eMcKC
 LIB229v0Atd2NaxfjZrNxOAhvhKuNs3/Y9qmNzL0fz+sRdHRLndY32Z/XHNOs40kF+mP
 o/sg7nGSjgONGmXTfd7r1OCdVZjLczNY/WDxvLfrH774f8O4Y/1mcY+sQENxApacZ2jO
 A9tOQK8r5ULAbBS98hzbtzWylxIcUwdYu5kvnNcsnvmDT+OftxZzFrroEUgoAv2argp7
 AiOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7o0TPvqsC/kkRt0dryiVTzErIQDFkcISspdDS2XZkhTPUckgkknCdsDZeYarXkUh9/GgjUhZo98E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVuPEiceExY7pIJr8O4yY9f8Yin56t4bgBjn1pQ3gXKwWYoVhd
 lHMfYZB2HkOFwnN35hX4pyAbeG8K9vl8psLh6u2XPbvcUnFQ2wbNzhWS
X-Gm-Gg: ASbGncuo538AXnbl8ysk1frT47kwYMoAndTC5bSZKiPyzwWm5Wr2yDVnMMpTNdi7d+8
 YPq8/OR00BILrxoQpc8ZPTo6BSGzBGr3quHPYZxLvugG7+X7FpOW6U/y4Tqoa4z5fRHPBbgYDet
 ZsToQyhWCSi4UMzCZVgFVyoxH6jt2SzISgT/OA/adQtD6aiA/9H+WK/qQ0PiuKsapkrZ+z2t44H
 kwm0JdxImExt3iHEPhKt0G3anxOTYRiJi8O4kgDN43gN8YFYenNUpTukvW6+YkzBaDMkAkP3w/I
 Bk0kBuxoT6wLzudK8BsmYY3R9w1rAYumFWYFkzgpPzCnt4jshdj+vh11I8MMM52g71+BoBeoXrV
 nEtf37fPI9E2LeVtRP4oSByipSS3HpFKXkZV6gy1AedC8FwVTw50FV8kwhCPNxuGrrlPVdO0UA8
 iORUfDzZqgjGj68kq8CXJdTcDiinRE
X-Google-Smtp-Source: AGHT+IGfP+vFkv8zioVQynwazhbvBh6MaoC6q2IrSLhmWZgtPgsGhhqQc2LuymVoNGeawx228yiFQQ==
X-Received: by 2002:a17:907:72cb:b0:b3e:c7d5:4cb9 with SMTP id
 a640c23a62f3a-b6c7758d3fdmr67446066b.5.1760991097698; 
 Mon, 20 Oct 2025 13:11:37 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb725f3fsm873186966b.68.2025.10.20.13.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:11:37 -0700 (PDT)
Message-ID: <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
Date: Mon, 20 Oct 2025 22:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
 <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
 <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
 <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
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

On 10/20/25 9:06 PM, Shuah Khan wrote:
> On 10/20/25 03:50, Jani Nikula wrote:
>> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa 
>> <mehdi.benhadjkhelifa@gmail.com> wrote:
>>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa 
>>>>> wrote:
>>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>>> handle array allocations and benefit from built-in overflow 
>>>>>> checking[1].
>>>>>>
>>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>>
>>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa 
>>>>>> <mehdi.benhadjkhelifa@gmail.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>>> repaper.c
>>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>>              epd->factored_stage_time);
>>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>>
>> Also worth emphasizing that this is wildly wrong for any height that is
>> not a multiple of 8.
>>
>> And I thought I shot down a similar patch not long ago.
>>
>> Is there some tool that suggests doing this? Fix the tool instead
>> please.
>>
> 
> They are documented in https://docs.kernel.org/process/deprecated.html
> Mu understanding is that this document lists deprecates APIs so people
> don't keep adding new ones.
> 
> I didn't get the impression that we are supposed to go delete them from
> the kernel and cause a churn.
> 
I have sent an appropriate v2 specifically to suit the case that we have 
here. But the document[1] specifically quotes the following:"
Dynamic size calculations (especially multiplication) should not be 
performed in memory allocator (or similar) function arguments due to the 
risk of them overflowing. This could lead to values wrapping around and 
a smaller allocation being made than the caller was expecting. Using 
those allocations could lead to linear overflows of heap memory and 
other misbehaviors. (One exception to this is literal values where the 
compiler can warn if they might overflow. However, the preferred way in 
these cases is to refactor the code as suggested below to avoid the 
open-coded arithmetic.)"
Specifically mentionned the refactor of the code base in such cases 
which is why i'm doing the patches in the first place.Also i'm trying 
the best to send patches related to the issue where such issues of 
overflow are present or to be consistent with the same API used within 
the same subsystem.
[1]:https://docs.kernel.org/process/deprecated.html

Best Regards,
Mehdi Ben Hadj Khelifa> thanks,
> -- Shuah

