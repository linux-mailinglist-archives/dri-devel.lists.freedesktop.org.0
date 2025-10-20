Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC964BF35F5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B4410E4FA;
	Mon, 20 Oct 2025 20:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CxaiV6k+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C3710E4FA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:22:03 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-430d7638d27so18859745ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1760991722; x=1761596522;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mg4rdzF03I9VKfQ6A0u6ZEt7ExfErvnSo3bCDGro3gQ=;
 b=CxaiV6k+Dm79TfuvFBFjh2UgVlprsIMddPIEkJbUzLogsyGlDWqx5VkqK3RZOkwCpG
 H/YAtNq29S6aCog1jr073Q5fASNWH/n+N1lzVbDgbuTIUZYFcMmJBdurezlmB6ZSiB2p
 VbD67GCMvslmpcZeOXRRHvMWGrlQXGgChsc+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760991722; x=1761596522;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mg4rdzF03I9VKfQ6A0u6ZEt7ExfErvnSo3bCDGro3gQ=;
 b=ChTjD12nyPsdxLjR6aULmbMUEF4ejTSZhecaloqEBxJXLfo4B2V43+eHKWpzu6d2dY
 MjMZQ+LF0/ePcWU5XHcyTx7+cVESpVsTk3Lx115veXK4BgRqOMRKaRYrFiX7FYtSSP97
 JWTrrsQrDvRSmf3LV6OWUsOu58w7z3GINPmV62lydqcqjZrLHZ0R3+YYl6HdOCdcryZH
 RiUADcnrFHh6J+d9mAuJalgcDd+yvIaQavlgt5HrrftMZNtLUthACa8aUw9L3TgLJh4L
 SYcKoQD3N4wewJoDQYBFNWQuTRn6uCFVBCa2K80AmgUGwOJ+txe913iMJFnGV6N9GZcB
 D1Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX86AaIgjSCFmi+R57e1vXKFHw/thsE1x+jmI6D4NtfLSd5TdO1ei/EekT6ExydvjjNKqAl1jp9FOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkStYmUUs0SfqFhIqY0fOxkIOTIiJO1dOeQatqyOdFcjlRC+Wv
 dj63VW0ittUL0wHOdFBkafY6dt7EC4o8Pd8fFdQlR7G0NYXJBmEYzD9bHitmIlJQhaA=
X-Gm-Gg: ASbGncuhcKCMf9O2OHVFlC2Mqh/Zxpj12tmSzKe9K7M8jglhmIFIYiXiIogB7fpD+mT
 o8mwqDhX9OsyClqpn/G+9DYtUL7tnmjQQfpDBaa4KWN7cJrowhiZXrMtxhw3Dx0Ey+LUcUj6Q1h
 8BEssOAmjr46cvSSQ1c3RBOPWsDL6S388IAnXgjmgMJnHqRrPofDiuGxr+otQFhceNnokXy/tDo
 kVG9nu/znoIGtKGip4L9KCMwJPhW8Y3HncwhAiB+FZOBDA3dcFS4DvCyIlHe23Lo94rldpQaJ/l
 IBZ1yNEm9y459aeAdw8Ez26bF97wpxZ/WRp4u4sHXeiPqZQl2oISnZA3OxpAUoTmZxZv6Hgf9zb
 lmfC/2cZt2pda29eZEqg3131i9qW9ICBofNa6KLii/sT5tbkUYoSj1FF9niF0VF9mchSy5P4uYx
 LPaxCh2elwodRr
X-Google-Smtp-Source: AGHT+IEx/5ik37vP/1BDBpbyZ9iaSfWbLzs622j+5vpvMwxWidniwm4iTR3/qfu+5Q474PGa8wVHGQ==
X-Received: by 2002:a05:6e02:1d9d:b0:430:a538:25e7 with SMTP id
 e9e14a558f8ab-430c52cae26mr231351515ab.29.1760991722165; 
 Mon, 20 Oct 2025 13:22:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5a8a973ec13sm3238979173.38.2025.10.20.13.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:22:01 -0700 (PDT)
Message-ID: <dbe75986-348a-4835-ad18-b7545694dfba@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:22:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
 <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
 <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
 <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
 <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
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

On 10/20/25 15:11, Mehdi Ben Hadj Khelifa wrote:
> On 10/20/25 9:06 PM, Shuah Khan wrote:
>> On 10/20/25 03:50, Jani Nikula wrote:
>>> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
>>>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>>>> handle array allocations and benefit from built-in overflow checking[1].
>>>>>>>
>>>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>>>
>>>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>>>> repaper.c
>>>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>>>              epd->factored_stage_time);
>>>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>>>
>>> Also worth emphasizing that this is wildly wrong for any height that is
>>> not a multiple of 8.
>>>
>>> And I thought I shot down a similar patch not long ago.
>>>
>>> Is there some tool that suggests doing this? Fix the tool instead
>>> please.
>>>
>>
>> They are documented in https://docs.kernel.org/process/deprecated.html
>> Mu understanding is that this document lists deprecates APIs so people
>> don't keep adding new ones.
>>
>> I didn't get the impression that we are supposed to go delete them from
>> the kernel and cause a churn.
>>
> I have sent an appropriate v2 specifically to suit the case that we have here. But the document[1] specifically quotes the following:"
> Dynamic size calculations (especially multiplication) should not be performed in memory allocator (or similar) function arguments due to the risk of them overflowing. This could lead to values wrapping around and a smaller allocation being made than the caller was expecting. Using those allocations could lead to linear overflows of heap memory and other misbehaviors. (One exception to this is literal values where the compiler can warn if they might overflow. However, the preferred way in these cases is to refactor the code as suggested below to avoid the open-coded arithmetic.)"
> Specifically mentionned the refactor of the code base in such cases which is why i'm doing the patches in the first place.Also i'm trying the best to send patches related to the issue where such issues of overflow are present or to be consistent with the same API used within the same subsystem.
> [1]:https://docs.kernel.org/process/deprecated.html
> 

How are you testing these changes? Next time give more details on the
where you found the problem - it is easy to miss the link unless you
state that it is coming from the deprecated document.

Even so you have to explain why the change is applicable to the code
you are changing. How are you testing these changes. I have seen more
patches from you in drm drivers and lib code.

thanks,
-- Shuah
