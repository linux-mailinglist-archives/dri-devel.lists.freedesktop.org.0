Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D451E1AE
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 01:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6780510E612;
	Fri,  6 May 2022 23:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8010E612
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 23:05:45 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 i25-20020a9d6259000000b00605df9afea7so5903865otk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xnHVuJNEFRsbiTGQVGfhwPzp5k2+64AgdyyeRBv7gJM=;
 b=Nd6DS8PFOAxvT/JTIcnio6MEi2+7Le95NyfSEivUc+7xVGiu1b713i+Bir2QFB2Mk1
 czdSjItzNr0q+2l/YOHypP0k/K9z41AKw3i+nW0SSoa4XdN4gnX2qBmuwXQsYrzzBJOD
 gHtCZgcy7zL8S14AvECgQ3HiypD1cvKMlzCy//cXtrKELTXGL2K5szJQ8swcGh8yU6/Z
 /O2/jVS3NozTJPQPirQ+r35ZkdiD5tLh7Uz3JUF7kqh5MS4jvv0IE9e90a4v6HQGnbV8
 9xs1BZMqh320jI+wnzRle8cmh3vmEKezeGiKCFSSHCwMZn0VSDUAfolrUX+Emo7tBM1l
 YP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xnHVuJNEFRsbiTGQVGfhwPzp5k2+64AgdyyeRBv7gJM=;
 b=0eOi7/dgZY29G3Gi3+BwWidph5cnwj6VC5U7cg76XoVttxWNjqOrt12baQCujCHuIH
 Xyfh4tyffS39xl7z9OEl0W87JvsVgkT5/vAwUHtQMs3REdQ2ZOEd+Rqj3MydR4GA6Hp8
 tX4N9Vl2we4CWOwhkNC5fnd6Y2WrUJObSnIeG6JObO5wryMoF+TwydunEqryOFcYkkDv
 FmH2vRcfOJBvG3prrzWTM4/xpKhCMs8e1CxkYKCFRMPhT7ti+kXimHl/F09DtyiMBXDU
 C0hGD6fVIMA6wWcb0orWXmdWenomTJB3I5nmBTzR3dZOZ0eUutZLEc665Xns3nHjDwcT
 +hSg==
X-Gm-Message-State: AOAM5300wErKw5yg7Y8ewXna0vWEiWmo3Z6tBFbwjAPmX7D59C33sgLt
 ht3cTAWLNDzf6JwL2q8bEeo=
X-Google-Smtp-Source: ABdhPJy5/nSaQmJmss6JIjjRkiTEoDQXQI920nhw0uxLBSYDTw7ukuEM9sRr77GP51O1Bt5N2D3Blg==
X-Received: by 2002:a9d:6a7:0:b0:606:2a7a:236a with SMTP id
 36-20020a9d06a7000000b006062a7a236amr1833733otx.243.1651878344638; 
 Fri, 06 May 2022 16:05:44 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f4:6ce2:465d:82e0:739e:955d?
 ([2804:431:c7f4:6ce2:465d:82e0:739e:955d])
 by smtp.gmail.com with ESMTPSA id
 l84-20020acabb57000000b00326a7d33635sm95477oif.27.2022.05.06.16.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 16:05:44 -0700 (PDT)
Message-ID: <239e2329-197e-099b-ecce-4d640493077e@gmail.com>
Date: Fri, 6 May 2022 20:05:39 -0300
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
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220427105521.73faead3@eldfell>
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

Hi Pekka,

On 4/27/22 04:55, Pekka Paalanen wrote:
> On Tue, 26 Apr 2022 21:53:19 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> Hi Pekka,
>>
>> On 4/21/22 07:58, Pekka Paalanen wrote:
>>> On Mon,  4 Apr 2022 17:45:15 -0300
>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>    
>>>> Adds this common format to vkms.
>>>>
>>>> This commit also adds new helper macros to deal with fixed-point
>>>> arithmetic.
>>>>
>>>> It was done to improve the precision of the conversion to ARGB16161616
>>>> since the "conversion ratio" is not an integer.
>>>>
>>>> V3: Adapt the handlers to the new format introduced in patch 7 V3.
>>>> V5: Minor improvements
>>>>
>>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
>>>>    drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
>>>>    3 files changed, 76 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> index 8d913fa7dbde..4af8b295f31e 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> @@ -5,6 +5,23 @@
>>>>    
>>>>    #include "vkms_formats.h"
>>>>    
>>>> +/* The following macros help doing fixed point arithmetic. */
>>>> +/*
>>>> + * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
>>>> + * parts respectively.
>>>> + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
>>>> + * 31                                          0
>>>> + */
>>>> +#define FIXED_SCALE 15
>>>
>>> I think this would usually be called a "shift" since it's used in
>>> bit-shifts.
>>
>> Ok, I will rename this.
>>
>>>    
>>>> +
>>>> +#define INT_TO_FIXED(a) ((a) << FIXED_SCALE)
>>>> +#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FIXED_SCALE))
>>>> +#define FIXED_DIV(a, b) ((s32)(((s64)(a) << FIXED_SCALE) / (b)))
>>>
>>> A truncating div, ok.
>>>    
>>>> +/* This macro converts a fixed point number to int, and round half up it */
>>>> +#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (FIXED_SCALE - 1))) >> FIXED_SCALE)
>>>
>>> Yes.
>>>    
>>>> +/* Convert divisor and dividend to Fixed-Point and performs the division */
>>>> +#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
>>>
>>> Ok, this is obvious to read, even though it's the same as FIXED_DIV()
>>> alone. Not sure the compiler would optimize that extra bit-shift away...
>>>
>>> If one wanted to, it would be possible to write type-safe functions for
>>> these so that fixed and integer could not be mixed up.
>>
>> Ok, I will move to a function.
> 
> That's not all.
> 
> If you want it type-safe, then you need something like
> 
> struct vkms_fixed_point {
> 	s32 value;
> };
> 
> And use `struct vkms_fixed_point` (by value) everywhere where you pass
> a fixed point value, and never as a plain s32 type. Then it will be
> impossible to do incorrect arithmetic or conversions by accident on
> fixed point values.
> 
> Is it worth it? I don't know, since it's limited into this one file.
> 
> A simple 'typedef s32 vkms_fixed_point' does not work, because it does
> not prevent computing with vkms_fixed_point as if it was just a normal
> s32. Using a struct prevents that.

ohhh. Got it!

> 
> I wonder if the kernel doesn't already have something like this
> available in general...

After some time searching I found `include/drm/drm_fixed.h`[1].

It seems fine. There are minor things to consider:

1. It doesn't have a `FIXED_TO_INT_ROUND` equivalent.
2. We can use `fixed20_12` for rgb565 but We have to use s64 for YUV
formats or add a `sfixed20_12` with s32.

In terms of consistency, do you think worth using this "library" given
that we may need to use two distinct ways to represent the fixed point
soonish? Or it's better to implement `sfixed20_12`? Or just continue 
with the
current macros?

[1] - https://elixir.bootlin.com/linux/latest/source/include/drm/drm_fixed.h

> 
>>>> +		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
>>>> +		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
>>>> +		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
>>>> +
>>>> +		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
>>>
>>> Looks good.
>>>
>>> You are using signed variables (int, s64, s32) when negative values
>>> should never occur. It doesn't seem wrong, just unexpected.
>>
>> I left the signal so I can reuse them in the YUV formats.
> 
> Good point.
> 
>>
>>>
>>> The use of int in code vs. s32 in the macros is a bit inconsistent as
>>> well.
>>
>> Right. I think I will stick with s32 and s64 then.
> 
> ...
> 
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>>>> index cb63a5da9af1..98da7bee0f4b 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>>>> @@ -16,7 +16,8 @@
>>>>    static const u32 vkms_wb_formats[] = {
>>>>    	DRM_FORMAT_XRGB8888,
>>>>    	DRM_FORMAT_XRGB16161616,
>>>> -	DRM_FORMAT_ARGB16161616
>>>> +	DRM_FORMAT_ARGB16161616,
>>>> +	DRM_FORMAT_RGB565
>>>>    };
>>>>    
>>>>    static const struct drm_connector_funcs vkms_wb_connector_funcs = {
>>>
>>> I wonder, would it be possible to add a unit test to make sure that
>>> get_plane_fmt_transform_function() or get_wb_fmt_transform_function()
>>> does not return NULL for any of the listed formats, respectively?
>>> Or is that too paranoid?
>>
>> I'm not opposed to it. But I also don't think it needs to be in this
>> series of patches either.
>>
>> A new todo maybe?
> 
> If it's a good thing, then it belongs in this series, because those
> function getters are introduced in this series, opening the door for
> the mistakes that the tests would prevent. I don't mean IGT tests but
> kernel internal tests. I think there is a unit test framework?

Yeah, kernel have kunit and kselftest. Idk what are the differences
between them or how to use them, but I know they exist.

> 
> You really should get a kernel maintainer's opinion on these questions,
> as I am not a kernel developer.

Ok.

> 
> 
> Thanks,
> pq
