Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94DE5224B2
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 21:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F3F10E395;
	Tue, 10 May 2022 19:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3F210E395
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 19:24:23 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id y63so161934oia.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KELOSad6+GkbPo/kKfuYcFwGg5ODeKN40VnZZ1OCAv0=;
 b=VW4BnfQzW3kJqONK4Adu0iBKP8HUc6KzTOzJYCc3VoztoZp07c3v4Jyzmvb4Gu2ikU
 kjyZNP6L/CXiBzboi/3VXwXAsLdo0+EyWdpHCxd5sqTAL7QOluB9t3wSUJn13VPd+Reu
 ZSX5fB/fjQwyoNq4KIwm/JNFhJSb29x16F5sYvoWt8JmWu6Szwu5GnA1wAgaGsGK5La2
 StJdkLYd3mOOHUsRJPImbgNqJn7DQip5Wl/738Ci6IFaLWYLoSlIAf/XYx8m3GV7jIvK
 TiD6S8EYcbdTRHQvhZZEZM2iXWftsjBXjuCHq15Iwopl/hc4Td7TEMWatW9EtgkwCa9m
 ys0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KELOSad6+GkbPo/kKfuYcFwGg5ODeKN40VnZZ1OCAv0=;
 b=ZH6sRRPDwvRDCF+VToK0PQtglW0eknvbo9aGH8rKzY3cXQ40ZeYn28l8n8i/PubXQm
 sT8wkBI87PaJB0edz+iWiFtrfa5tIug0WeMLPmQTMmuE8FoNXDnZo7NCBL2jtCh9sbcW
 th5hgnicD+NRRxFXZQUGj76LPexUDyKyZipR82e24wxrLVsW7ivlzm63Ri5vZ+Bu20u6
 b1ZbYNFn/4ljSBr3r0YELHOMvsXoyLtfc1LYsT9dwf/Qvu5yEYyJ4++WqZv/D6qZ4ziL
 3cDOSit1xOMhqOMCLAo5M5Qx9qY5hZ6yOIZ8Tn4xiQLxZy3HVImRSBH73IuuTRxoqkX9
 DG9Q==
X-Gm-Message-State: AOAM533o7Aili0KsV5QJGRasZCMWQe87TCgDaLxl0s/ikZJFVn+u2n/Y
 jksYUbXAiWIT4EDINKOnrUmEEH0Iv+E=
X-Google-Smtp-Source: ABdhPJz9Yxd3gnxx2opFmCqO2lrtzdaik/vjVfOXy/ykOUur5XHM3q7x7z4xQb2Rzscz08peeAPXYw==
X-Received: by 2002:a05:6808:2395:b0:326:a02e:2c3a with SMTP id
 bp21-20020a056808239500b00326a02e2c3amr805542oib.169.1652210662375; 
 Tue, 10 May 2022 12:24:22 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f4:aab9:b7bd:28e5:7243:5093?
 ([2804:431:c7f4:aab9:b7bd:28e5:7243:5093])
 by smtp.gmail.com with ESMTPSA id
 102-20020a9d016f000000b0060603221272sm1415otu.66.2022.05.10.12.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 12:24:21 -0700 (PDT)
Message-ID: <b72729ea-6e4f-0c5e-1895-55aad648a0b3@gmail.com>
Date: Tue, 10 May 2022 16:24:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 9/9] drm: vkms: Add support to the RGB565 format
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-10-igormtorrente@gmail.com>
 <20220421135859.3403f0ce@eldfell>
 <5143c749-55bc-c6d8-59af-55ee931d8639@gmail.com>
 <20220427105521.73faead3@eldfell>
 <239e2329-197e-099b-ecce-4d640493077e@gmail.com>
 <20220509105324.5ede4d90@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220509105324.5ede4d90@eldfell>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 04:53, Pekka Paalanen wrote:
> On Fri, 6 May 2022 20:05:39 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> Hi Pekka,
>>
>> On 4/27/22 04:55, Pekka Paalanen wrote:
>>> On Tue, 26 Apr 2022 21:53:19 -0300
>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>    
>>>> Hi Pekka,
>>>>
>>>> On 4/21/22 07:58, Pekka Paalanen wrote:
>>>>> On Mon,  4 Apr 2022 17:45:15 -0300
>>>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>>>       
>>>>>> Adds this common format to vkms.
>>>>>>
>>>>>> This commit also adds new helper macros to deal with fixed-point
>>>>>> arithmetic.
>>>>>>
>>>>>> It was done to improve the precision of the conversion to ARGB16161616
>>>>>> since the "conversion ratio" is not an integer.
>>>>>>
>>>>>> V3: Adapt the handlers to the new format introduced in patch 7 V3.
>>>>>> V5: Minor improvements
>>>>>>
>>>>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++++
>>>>>>     drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
>>>>>>     drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
>>>>>>     3 files changed, 76 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>>>>> index 8d913fa7dbde..4af8b295f31e 100644
>>>>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>>>>> @@ -5,6 +5,23 @@
>>>>>>     
>>>>>>     #include "vkms_formats.h"
>>>>>>     
>>>>>> +/* The following macros help doing fixed point arithmetic. */
>>>>>> +/*
>>>>>> + * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
>>>>>> + * parts respectively.
>>>>>> + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
>>>>>> + * 31                                          0
>>>>>> + */
>>>>>> +#define FIXED_SCALE 15
>>>>>
>>>>> I think this would usually be called a "shift" since it's used in
>>>>> bit-shifts.
>>>>
>>>> Ok, I will rename this.
>>>>   
>>>>>       
>>>>>> +
>>>>>> +#define INT_TO_FIXED(a) ((a) << FIXED_SCALE)
>>>>>> +#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FIXED_SCALE))
>>>>>> +#define FIXED_DIV(a, b) ((s32)(((s64)(a) << FIXED_SCALE) / (b)))
>>>>>
>>>>> A truncating div, ok.
>>>>>       
>>>>>> +/* This macro converts a fixed point number to int, and round half up it */
>>>>>> +#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (FIXED_SCALE - 1))) >> FIXED_SCALE)
>>>>>
>>>>> Yes.
>>>>>       
>>>>>> +/* Convert divisor and dividend to Fixed-Point and performs the division */
>>>>>> +#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
>>>>>
>>>>> Ok, this is obvious to read, even though it's the same as FIXED_DIV()
>>>>> alone. Not sure the compiler would optimize that extra bit-shift away...
>>>>>
>>>>> If one wanted to, it would be possible to write type-safe functions for
>>>>> these so that fixed and integer could not be mixed up.
>>>>
>>>> Ok, I will move to a function.
>>>
>>> That's not all.
>>>
>>> If you want it type-safe, then you need something like
>>>
>>> struct vkms_fixed_point {
>>> 	s32 value;
>>> };
>>>
>>> And use `struct vkms_fixed_point` (by value) everywhere where you pass
>>> a fixed point value, and never as a plain s32 type. Then it will be
>>> impossible to do incorrect arithmetic or conversions by accident on
>>> fixed point values.
>>>
>>> Is it worth it? I don't know, since it's limited into this one file.
>>>
>>> A simple 'typedef s32 vkms_fixed_point' does not work, because it does
>>> not prevent computing with vkms_fixed_point as if it was just a normal
>>> s32. Using a struct prevents that.
>>
>> ohhh. Got it!
>>
>>>
>>> I wonder if the kernel doesn't already have something like this
>>> available in general...
>>
>> After some time searching I found `include/drm/drm_fixed.h`[1].
>>
>> It seems fine. There are minor things to consider:
>>
>> 1. It doesn't have a `FIXED_TO_INT_ROUND` equivalent.
>> 2. We can use `fixed20_12` for rgb565 but We have to use s64 for YUV
>> formats or add a `sfixed20_12` with s32.
>>
>> In terms of consistency, do you think worth using this "library" given
>> that we may need to use two distinct ways to represent the fixed point
>> soonish? Or it's better to implement `sfixed20_12`? Or just continue
>> with the
>> current macros?
>>
>> [1] - https://elixir.bootlin.com/linux/latest/source/include/drm/drm_fixed.h
> 
> I think that is something the kernel people should weigh in on.
> 
> The one thing I would definitely avoid is ending up using multiple
> fixed point formats in VKMS.
> 
> In the mean time, your current macros seem good enough, if there is no
> community interest in better type safety nor sharing the fixed point
> code.

OK. Thanks!

> 
> 
> Thanks,
> pq
