Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F18510D72
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 02:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1F289F2E;
	Wed, 27 Apr 2022 00:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBDD89DC7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 00:53:24 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 e15-20020a9d63cf000000b006054e65aaecso145365otl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AkHUokfeTuQKfF06t8SlHP5Kddf67tm2yi9QYwqi+nU=;
 b=Uz+dQ9nsZs0dKpP9rNzVEHeKZKpxF5mU4q66Dsr3hhib/E5M45dAe7jNz48cPfjRxH
 UkMU93kOlqZ/Y/IFDkcpVTcTuZ6qRipP65pN0D3xHd75iTKS+AiwFr9YeQf4RSLNwaxM
 lg7TYEKqFwZMyGzw+f1/AMsvpzp4QhUCu+HMEll5T0Ov6oRTv8TbqjLPHbejjy7sMiwC
 PX22n535YPU7drEQ4i+ypxZg0LN4xos5lIth7tVkGS/jh6kzmRokCGZF5oI0oLHMUpzh
 lM3JbVMWda/U/DiiTNnhWXbYEJqJ4XqN51tm+JvPgKueyEa0fuPl7b0IRpIa6RdeZbHg
 dIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AkHUokfeTuQKfF06t8SlHP5Kddf67tm2yi9QYwqi+nU=;
 b=VepCpd0PWNMUj65HH+eUyFmSc5U4EdgB8tBX/xjxYeiOja10ZAX7hojQvJM+D+Clwr
 sQpG2V7MSIrtyPnRjyJWx6ZFHSjVUAOsE308Sq/QzW5MsYcS/9q+rpRB7lGvwlaTp9D3
 5tmwGy5IjITC/sb6qAV7oXy5Mm9olCexKohQ+ne84SewcBJ9xUfY4m6FtgQQh35RX0bx
 AI7HgSnVAkiPUZ1b6i3NmhhwoYivi/FP+eYNNBwei12d233OaG00rptVd073MfBtp+BH
 2G5Bgm7xe3vrJuzgFXVu91BzBj1A/x0pB2M85Ce82TJjbmBUZXZdrsZKBQP0GZFbyRKs
 du9A==
X-Gm-Message-State: AOAM5322KaqEaYW83FWRpSziFCklWWgHY88omiuGqrzF8pV5Ki7ss5/8
 A2SjWja1hZkmElwZiR/6l58=
X-Google-Smtp-Source: ABdhPJyDiu+jqFB7kw5YgcQk2I286MNgEWov46vQDoDx1cx5jkgMigWCg0cRrOAKGK9T4Vd/Gp13LQ==
X-Received: by 2002:a9d:6648:0:b0:605:4e84:c0b with SMTP id
 q8-20020a9d6648000000b006054e840c0bmr9084569otm.3.1651020803408; 
 Tue, 26 Apr 2022 17:53:23 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48?
 ([2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056870a58400b000e686d13870sm73459oam.10.2022.04.26.17.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:53:23 -0700 (PDT)
Message-ID: <5143c749-55bc-c6d8-59af-55ee931d8639@gmail.com>
Date: Tue, 26 Apr 2022 21:53:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 9/9] drm: vkms: Add support to the RGB565 format
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-10-igormtorrente@gmail.com>
 <20220421135859.3403f0ce@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220421135859.3403f0ce@eldfell>
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

On 4/21/22 07:58, Pekka Paalanen wrote:
> On Mon,  4 Apr 2022 17:45:15 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> Adds this common format to vkms.
>>
>> This commit also adds new helper macros to deal with fixed-point
>> arithmetic.
>>
>> It was done to improve the precision of the conversion to ARGB16161616
>> since the "conversion ratio" is not an integer.
>>
>> V3: Adapt the handlers to the new format introduced in patch 7 V3.
>> V5: Minor improvements
>>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
>>   drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
>>   3 files changed, 76 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>> index 8d913fa7dbde..4af8b295f31e 100644
>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>> @@ -5,6 +5,23 @@
>>   
>>   #include "vkms_formats.h"
>>   
>> +/* The following macros help doing fixed point arithmetic. */
>> +/*
>> + * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
>> + * parts respectively.
>> + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
>> + * 31                                          0
>> + */
>> +#define FIXED_SCALE 15
> 
> I think this would usually be called a "shift" since it's used in
> bit-shifts.

Ok, I will rename this.

> 
>> +
>> +#define INT_TO_FIXED(a) ((a) << FIXED_SCALE)
>> +#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FIXED_SCALE))
>> +#define FIXED_DIV(a, b) ((s32)(((s64)(a) << FIXED_SCALE) / (b)))
> 
> A truncating div, ok.
> 
>> +/* This macro converts a fixed point number to int, and round half up it */
>> +#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (FIXED_SCALE - 1))) >> FIXED_SCALE)
> 
> Yes.
> 
>> +/* Convert divisor and dividend to Fixed-Point and performs the division */
>> +#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
> 
> Ok, this is obvious to read, even though it's the same as FIXED_DIV()
> alone. Not sure the compiler would optimize that extra bit-shift away...
> 
> If one wanted to, it would be possible to write type-safe functions for
> these so that fixed and integer could not be mixed up.

Ok, I will move to a function.

> 
>> +
>>   static int pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>>   {
>>   	return frame_info->offset + (y * frame_info->pitch)
>> @@ -112,6 +129,30 @@ static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
>>   	}
>>   }
>>   
>> +static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
>> +			       const struct vkms_frame_info *frame_info, int y)
>> +{
>> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>> +	u16 *src_pixels = get_packed_src_addr(frame_info, y);
>> +	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			       stage_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, src_pixels++) {
>> +		u16 rgb_565 = le16_to_cpu(*src_pixels);
>> +		int fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
>> +		int fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
>> +		int fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
>> +
>> +		int fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
>> +		int fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
> 
> These two should be outside of the loop since they are constants.
> Likely no difference for performance because the compiler is probably
> doing that already, but I think it would read better.

I will move it.

> 
>> +
>> +		out_pixels[x].a = (u16)0xffff;
>> +		out_pixels[x].r = FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
>> +		out_pixels[x].g = FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
>> +		out_pixels[x].b = FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
> 
> Looks good.
> 
>> +	}
>> +}
>> +
>>   
>>   /*
>>    * The following  functions take an line of argb_u16 pixels from the
>> @@ -199,6 +240,31 @@ static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
>>   	}
>>   }
>>   
>> +static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>> +			       const struct line_buffer *src_buffer, int y)
>> +{
>> +	int x, x_dst = frame_info->dst.x1;
>> +	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    src_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, dst_pixels++) {
>> +		int fp_r = INT_TO_FIXED(in_pixels[x].r);
>> +		int fp_g = INT_TO_FIXED(in_pixels[x].g);
>> +		int fp_b = INT_TO_FIXED(in_pixels[x].b);
>> +
>> +		int fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
>> +		int fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
> 
> Move these out of the loop.
> 
>> +
>> +		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
>> +		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
>> +		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
>> +
>> +		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
> 
> Looks good.
> 
> You are using signed variables (int, s64, s32) when negative values
> should never occur. It doesn't seem wrong, just unexpected.

I left the signal so I can reuse them in the YUV formats.

> 
> The use of int in code vs. s32 in the macros is a bit inconsistent as
> well.

Right. I think I will stick with s32 and s64 then.

> 
>> +	}
>> +}
>> +
>>   plane_format_transform_func get_plane_fmt_transform_function(u32 format)
>>   {
>>   	if (format == DRM_FORMAT_ARGB8888)
>> @@ -209,6 +275,8 @@ plane_format_transform_func get_plane_fmt_transform_function(u32 format)
>>   		return &ARGB16161616_to_argb_u16;
>>   	else if (format == DRM_FORMAT_XRGB16161616)
>>   		return &XRGB16161616_to_argb_u16;
>> +	else if (format == DRM_FORMAT_RGB565)
>> +		return &RGB565_to_argb_u16;
>>   	else
>>   		return NULL;
>>   }
>> @@ -223,6 +291,8 @@ wb_format_transform_func get_wb_fmt_transform_function(u32 format)
>>   		return &argb_u16_to_ARGB16161616;
>>   	else if (format == DRM_FORMAT_XRGB16161616)
>>   		return &argb_u16_to_XRGB16161616;
>> +	else if (format == DRM_FORMAT_RGB565)
>> +		return &argb_u16_to_RGB565;
> 
> Now it's starting to become clear that a switch statement would be nice.
> 
>>   	else
>>   		return NULL;
>>   }
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index 60054a85204a..94a8e412886f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -14,14 +14,16 @@
>>   
>>   static const u32 vkms_formats[] = {
>>   	DRM_FORMAT_XRGB8888,
>> -	DRM_FORMAT_XRGB16161616
>> +	DRM_FORMAT_XRGB16161616,
>> +	DRM_FORMAT_RGB565
>>   };
>>   
>>   static const u32 vkms_plane_formats[] = {
>>   	DRM_FORMAT_ARGB8888,
>>   	DRM_FORMAT_XRGB8888,
>>   	DRM_FORMAT_XRGB16161616,
>> -	DRM_FORMAT_ARGB16161616
>> +	DRM_FORMAT_ARGB16161616,
>> +	DRM_FORMAT_RGB565
>>   };
>>   
>>   static struct drm_plane_state *
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index cb63a5da9af1..98da7bee0f4b 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -16,7 +16,8 @@
>>   static const u32 vkms_wb_formats[] = {
>>   	DRM_FORMAT_XRGB8888,
>>   	DRM_FORMAT_XRGB16161616,
>> -	DRM_FORMAT_ARGB16161616
>> +	DRM_FORMAT_ARGB16161616,
>> +	DRM_FORMAT_RGB565
>>   };
>>   
>>   static const struct drm_connector_funcs vkms_wb_connector_funcs = {
> 
> I wonder, would it be possible to add a unit test to make sure that
> get_plane_fmt_transform_function() or get_wb_fmt_transform_function()
> does not return NULL for any of the listed formats, respectively?
> Or is that too paranoid?

I'm not opposed to it. But I also don't think it needs to be in this 
series of patches either.

A new todo maybe?

> 
> 
> Thanks,
> pq
