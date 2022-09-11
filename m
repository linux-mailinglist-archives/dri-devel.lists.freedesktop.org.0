Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DCA5B4F75
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 16:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF7F10E48F;
	Sun, 11 Sep 2022 14:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8CC10E48E
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 14:44:36 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so17051907fac.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+QbBBQ6vXh/jN8AiRMD0EN8OQm6rohb3gtaPePWgvvs=;
 b=cY4w5okYPvGlxF8rGm7JyVdKOoARQdMMV6L/qGxKWG8ToKq5UhWWVrtuJMvQJdcPia
 IVCGnQndFQntsAJ3qRmfH78IHe47YKRuukKe71yNUwiYo+SYbwiwEI5lWskjjNEEremj
 msHqz3MS1Kp+i6dBJ5O0j7dU04G7cBOmqyJW4qJ8C/sC4vD9MTb1KkbyBzqEKFPWr3p8
 m2sUsqW/to+JMo7ZK9z2v04jdDPcfNBV5NrJp/gjmTDzAPs7KUKW5ZOJvm0/Z9q4v7+a
 isFAJf3c9Zn0jAuSHIb7bB+e9DEzcYcErKiX9PhF61RkB2dKyRdWNgfvIXsgPFK6myr8
 MiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+QbBBQ6vXh/jN8AiRMD0EN8OQm6rohb3gtaPePWgvvs=;
 b=x7UuIznpEoNdrC20FwmLeewSMxKkkCb67zM4GEDI77fCPOr+tp8kjCNSEgGa2CyoS0
 jYye6kbdHdPyD6zyS5qZ/LVEydyawsUtnNGZYou7GxpPMxzfC/MLuKzw1ZfaVDqchoya
 nQjpUO8lamIJFVWv16W9bF1CHFnDGWuaGBsCqz+W/0OUTD8O/9beaouVugKt0ekp15jw
 pyS6n73kd3etqFiPhSel2U8pAUV9F3SnnbVMmFDSYL09GZRmOCD4z5KuHTcHUtflBrO1
 rkGhehcb31vL6joT7cMZXUEdRHLFnRtnLMkznIsCypRB4Ll0be23CKzIEbBVsleITi5v
 YQ5A==
X-Gm-Message-State: ACgBeo0oPUen/crh1dN9PEj8/Rh5B99RfBIu7MFjmC5Y0CDXdgvrc7YH
 EEd9LJyZmF/I5jzbEJyO3LQ=
X-Google-Smtp-Source: AA6agR4svIUKQnhOltWCZTiQfQNimrwOrAo/aKwZwsk16zI+8nNlCNoxzGxqaXW2zTik2P5B27/2ow==
X-Received: by 2002:a05:6870:c18a:b0:101:fe5b:bd4e with SMTP id
 h10-20020a056870c18a00b00101fe5bbd4emr9348351oad.275.1662907475589; 
 Sun, 11 Sep 2022 07:44:35 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:f684:ee06:25a5:3122:5cd3?
 ([2804:431:c7f5:f684:ee06:25a5:3122:5cd3])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056870b28800b001275f056133sm3927439oao.51.2022.09.11.07.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 07:44:35 -0700 (PDT)
Message-ID: <17957593-33fb-a63d-181e-daee2e4689fc@gmail.com>
Date: Sun, 11 Sep 2022 11:44:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] drm/vkms: fix 32bit compilation error by replacing macros
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220909114133.267689-1-mwen@igalia.com>
 <29f87796-b288-7cdc-86dd-050cf7f0b5dd@gmail.com>
 <20220910191035.ukxhlhbc3mscbqis@mail.igalia.com>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220910191035.ukxhlhbc3mscbqis@mail.igalia.com>
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
Cc: rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/10/22 16:10, Melissa Wen wrote:
> On 09/09, Igor Matheus Andrade Torrente wrote:
>> Hi Mellisa,
>>
>> Thanks for the patch fixing my mistakes.
>>
>> On 9/9/22 08:41, Melissa Wen wrote:
>>> Replace vkms_formats macros for fixed-point operations with functions
>>> from drm/drm_fixed.h to do the same job and fix 32-bit compilation
>>> errors.
>>>
>>> Fixes: a19c2ac9858 ("drm: vkms: Add support to the RGB565 format")
>>> Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>>> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>    drivers/gpu/drm/vkms/vkms_formats.c | 53 +++++++++++------------------
>>>    1 file changed, 19 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>> index 300abb4d1dfe..ddcd3cfeeaac 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>> @@ -1,27 +1,12 @@
>>>    // SPDX-License-Identifier: GPL-2.0+
>>> -#include <drm/drm_rect.h>
>>> +#include <linux/kernel.h>
>>>    #include <linux/minmax.h>
>>> +#include <drm/drm_rect.h>
>>> +#include <drm/drm_fixed.h>
>>>    #include "vkms_formats.h"
>>> -/* The following macros help doing fixed point arithmetic. */
>>> -/*
>>> - * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
>>> - * parts respectively.
>>> - *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
>>> - * 31                                          0
>>> - */
>>> -#define SHIFT 15
>>> -
>>> -#define INT_TO_FIXED(a) ((a) << SHIFT)
>>> -#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> SHIFT))
>>> -#define FIXED_DIV(a, b) ((s32)(((s64)(a) << SHIFT) / (b)))
>>> -/* This macro converts a fixed point number to int, and round half up it */
>>> -#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (SHIFT - 1))) >> SHIFT)
>>> -#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
>>> -#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
>>> -
>>>    static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>>>    {
>>>    	return frame_info->offset + (y * frame_info->pitch)
>>> @@ -137,19 +122,19 @@ static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
>>>    	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>>>    			       stage_buffer->n_pixels);
>>> -	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
>>> -	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
>>> +	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), 31);
>>> +	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), 63);
>>
>> I think you need to add `drm_int2fixp` to 31 and 63.
>>
>>>    	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
>>>    		u16 rgb_565 = le16_to_cpu(*src_pixels);
>>> -		s32 fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
>>> -		s32 fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
>>> -		s32 fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
>>> +		s32 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
>>> +		s32 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
>>> +		s32 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>>
>> And we are cast implicitly from 64 bits int to 32 bits which is
>> implementation-defined AFAIK. So, probably we should be using `s64` for all
>> of these variables.
>>
>> I tested the patch. And I'm seeing some differences in the intermediate
>> results. From my testing, these changes solve those differences.
> 
> Hi Igor,
> 
> Thanks for checking the calc results and all inputs provided.  I just
> sent a second version, can you take a look? I replicated your
> suggestions for RGB565_to_argb_u16() in argb_u16_to_RGB565() and
> double-checked for i386 and arm. Let me know what yexiuou think.

I tested it here and everything seem to be working :).

> 
>>
>> Another thing that may have an impact on the final output is the lack of
>> rounding in drm_fixed.h. This can potentially produce the wrong result.
> 
> Yeah, I see... I can include a comment about the rounding issue for
> further improvements, or do you plan to work on it?

A comment would be good. Maybe add to the VKMS TODO list?

I'm busy with other stuffs, and can't work on this any time soon. But 
It's pretty simple thing to implement.

> 
> Thanks,
> 
> Melissa
>>
>> Thanks,
>> ---
>> Igor Torrente
>>
>>>    		out_pixels[x].a = (u16)0xffff;
>>> -		out_pixels[x].r = FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
>>> -		out_pixels[x].g = FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
>>> -		out_pixels[x].b = FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
>>> +		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
>>> +		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
>>> +		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
>>>    	}
>>>    }
>>> @@ -248,17 +233,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>>>    	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>>>    			    src_buffer->n_pixels);
>>> -	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
>>> -	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
>>> +	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), 31);
>>> +	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), 63);
>>>    	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
>>> -		s32 fp_r = INT_TO_FIXED(in_pixels[x].r);
>>> -		s32 fp_g = INT_TO_FIXED(in_pixels[x].g);
>>> -		s32 fp_b = INT_TO_FIXED(in_pixels[x].b);
>>> +		s32 fp_r = drm_int2fixp(in_pixels[x].r);
>>> +		s32 fp_g = drm_int2fixp(in_pixels[x].g);
>>> +		s32 fp_b = drm_int2fixp(in_pixels[x].b);
>>> -		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
>>> -		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
>>> -		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
>>> +		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
>>> +		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
>>> +		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
>>>    		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
>>>    	}
>>

