Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C36BF3613
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691F910E4FC;
	Mon, 20 Oct 2025 20:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="byZuqLCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85D610E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:22:54 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-93bccd4901aso414413239f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1760991774; x=1761596574;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mg4rdzF03I9VKfQ6A0u6ZEt7ExfErvnSo3bCDGro3gQ=;
 b=byZuqLCqcu0Zo3lN3L+L0VsBmMgn4ERUKC3uvYRFXPBFIGQZ5mi4rIgWWCw4KKCwlf
 gKpaxhr+fi+w79TGWTRuLE+Cy9w+ZH0AJoYzhU/ffvKsMDqq6Rt2/0CipYoJR6seJ2JH
 3W4lpYQT8d1+gicvmfNwqQ5cVZDbYXIfGVrH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760991774; x=1761596574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mg4rdzF03I9VKfQ6A0u6ZEt7ExfErvnSo3bCDGro3gQ=;
 b=gwUzWh8kMeaYwM+6TRjCf9Q/HwtPPlMl+YKQfBiC3SNP5xwFh8vWBnKqrNJvCrqr5j
 ws+PeIY26bk7fBDrJAleioGkYOdB983tOWkPuNG3ctLmnMxPVgHOQCGEruTafP1oWWz2
 c8feM6aqpkAqeJyN317/He9qHW2M5ZQ7Eoi75Csv/ogQ5HX4FWxibdULW8jtDooirfH8
 YBNnKyPrTOgyBG3/BDmR4FJ0nbbTigbzuD8HvlG3ZpOItbyCoKgt4pd5ncu+qaoYo66d
 cXp42hFtzqjnHyahMg7fnkxxSl8lrwvOtR6ozNpD3bkWIKNidyvY1vl/ot2szbV12MsX
 v+3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNGQNchLqd6K4/mRVkbnae5tbV0qkyMOtpstQmAgbBzif9QauPpDEwe+lOsxmcrLW46dN9SUlO3Bg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTmtU4VrVfZLHGjc93pkPHL+fz2cjJxiEGGEcIWdVgX+zE0rWC
 ZYmrMCIl8g2PA3xEMbrLD9nbNnYHtthldjE7ec5r8TtnEiUHsZp+zXwdvHYUI9lcawg=
X-Gm-Gg: ASbGncu7XUlPSQyOPzXi+fkYUi17wwXP8fLdVHsIyQth44mGWAvkjizgmLoCoKG9vCi
 d3/VWfJ6u6cVSHXepDp81wzNVP9PZ706u/GM28r1wPye//YIHU5Aip2m8F6VgHCfBl8VntkhpO3
 NtrUvDDQS5NjB4pbe2J7wqR09PNp3tZgSIvTu0RYfNp1sNyNVdF+gN5/6kMTq/nPMaAJbCBGt76
 1e4ODGYZ1ueaD3TD3eSbo7H4FoqkwbgkCJ2VC9Vg0aumXWcho4FyG/Wx6ANJ4kvXeQQ+MLOPQnm
 yoMMdfApD8t5mLDLSJcGaT+F3SwiMm/NnblzuuCyDf4gJvsG6PHp6r1qK6DJuB2V6nge44S2ilH
 VcilIS6wXrZjim53H1/rpDl6socgQr1ThoY20GEcpPYKaffslU20hbPfksWoCvtOpEkiiTrgpg6
 4AdnIqOxKvqy0eOZluaAZI7bU=
X-Google-Smtp-Source: AGHT+IH3lraseKHKDfkvaNbqZdA/pDcJuk3ieKtNJ64spgnZ1oKvXWo8ZrnWbAQWu1y8fgRUWB7mKQ==
X-Received: by 2002:a05:6602:3f91:b0:887:6ce4:8e07 with SMTP id
 ca18e2360f4ac-93e763ccef2mr2303274739f.9.1760991773699; 
 Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-93e8661d228sm327198839f.1.2025.10.20.13.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
Message-ID: <21415b1d-17c0-42a0-961c-a4aee16d20d1@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:22:52 -0600
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
