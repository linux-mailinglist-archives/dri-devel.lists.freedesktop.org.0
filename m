Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25552257C
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A710E544;
	Tue, 10 May 2022 20:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DE410E544
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 20:32:42 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e5e433d66dso406483fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jyvQ/1myiBGH00xov93Mx0jNEIvHYhkrfPYmn6tdYzo=;
 b=N59u0sen+TWMhN6bjD4aiblSbcVDc8laX7ZQNuKuVEEF8Yjdcr5xueJ2qOxZZmQx+0
 Tggj6IK3TvsbM1V4g9Fz6FeBZJT3k6TNRUnJHpjzCoEiqdvfMh6YmBsQYJjDF/R+dw9v
 zaJfuOX7O0uFHGKzltSYr//xOvjWQLDUp+rLc06gMKinR6KY5X1bE4m3dDCzeZKP1NPy
 K+i28LS24iTqqoy+X43P3uDn/qnpy5MGk7t8hvhTQFWqhUbc2tdR7t+0gwbqptz5+71e
 bne31qX1WFF56jKGRRfa4OjlpdlNSJ6mitAxJY1UrEsRI363EVjZ7zwSifrFomNZi6hy
 djtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jyvQ/1myiBGH00xov93Mx0jNEIvHYhkrfPYmn6tdYzo=;
 b=wrxB9bs4NUuIo20i3fCbW7Clp3muy48wxe1B/Cb+Z8eKI93t6PIvaf9vLn2ecy+ESg
 geSkSS/q7+clMWzwbfY1JcoEAEEvB+vOvX+ASkz0PHwWwqf1yyaZyNVBZ1Quu7Nq4bty
 hKso5pvxhzjIc/bS7LWB0R/ZACKqV3ib/7bwW8brbhTvyqKeHRSFb6tDSR0Hz66Fd7l/
 /4vD9kjJAKjj1nxn4vSdDFxZ3YFV5hC+IqxPHy3Xsi0vU5fQP0asJBtdRB+GL/p8srHF
 LYAH5bGnuJCaxmqx7rCQbRZUDWQg1vMntUtmmj1ELatqxJhKjJpBJxEKhvlVo0jX1ED9
 AUkg==
X-Gm-Message-State: AOAM531Hmi+5/aIwHtxw69aNa1kBxW66E+1rmu8bzJx89hEdRbsmdgww
 rQwRqptQIwm+8S32qDycH8A=
X-Google-Smtp-Source: ABdhPJzWESk2gIgTwL2fpBSxcZRYhJGeNULyVzA9glJTMCRT9eu9rVPdVGRuJR0BCnTg5injelMTnw==
X-Received: by 2002:a05:6870:9729:b0:ec:6f64:1e5e with SMTP id
 n41-20020a056870972900b000ec6f641e5emr1088716oaq.99.1652214761226; 
 Tue, 10 May 2022 13:32:41 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f4:aab9:b7bd:28e5:7243:5093?
 ([2804:431:c7f4:aab9:b7bd:28e5:7243:5093])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a056808030b00b00325cda1ffb5sm13354oie.52.2022.05.10.13.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 13:32:39 -0700 (PDT)
Message-ID: <1328f047-205f-114e-e387-8b9697639096@gmail.com>
Date: Tue, 10 May 2022 17:32:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 8/9] drm: vkms: Adds XRGB_16161616 and ARGB_1616161616
 formats
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-9-igormtorrente@gmail.com>
 <9ad6a743-5009-9fa4-b738-d664ec71a8da@suse.de>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <9ad6a743-5009-9fa4-b738-d664ec71a8da@suse.de>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, tales.aparecida@gmail.com,
 dri-devel@lists.freedesktop.org, leandro.ribeiro@collabora.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas

On 5/7/22 04:32, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.04.22 um 22:45 schrieb Igor Torrente:
>> This will be useful to write tests that depends on these formats.
>>
>> ARGB and XRGB follows the a similar implementation of the former formats.
>> Just adjusting for 16 bits per channel.
>>
>> V3: Adapt the handlers to the new format introduced in patch 7 V3.
>> V5: Minor improvements
>>       Added le16_to_cpu/cpu_to_le16 to the 16 bits color read/writes.
> 
> Is there something we could add to the DRM's format-conversion helpers?

I don't believe there's anything reusable.

Correct if I'm wrong, but from what I understood, these 
format-conversion functions don't seem compatible. The Vkms functions 
are converting to/from an internal format (struct pixel_argb_u16) while 
the functions from `drm_format_helper.c` are converting between two DRM 
formats.

I don't think these vkms format functions are useful to other drivers.

> 
> Best regards
> Thomas
> 	
>>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>>    drivers/gpu/drm/vkms/vkms_formats.c   | 77 +++++++++++++++++++++++++++
>>    drivers/gpu/drm/vkms/vkms_plane.c     |  5 +-
>>    drivers/gpu/drm/vkms/vkms_writeback.c |  2 +
>>    3 files changed, 83 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>> index 931a61405d6a..8d913fa7dbde 100644
>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>> @@ -78,6 +78,41 @@ static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
>>    	}
>>    }
>>    
>> +static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
>> +				     const struct vkms_frame_info *frame_info,
>> +				     int y)
>> +{
>> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>> +	u16 *src_pixels = get_packed_src_addr(frame_info, y);
>> +	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			       stage_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, src_pixels += 4) {
>> +		out_pixels[x].a = le16_to_cpu(src_pixels[3]);
>> +		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
>> +		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
>> +		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
>> +	}
>> +}
>> +
>> +static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
>> +				     const struct vkms_frame_info *frame_info,
>> +				     int y)
>> +{
>> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>> +	u16 *src_pixels = get_packed_src_addr(frame_info, y);
>> +	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			       stage_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, src_pixels += 4) {
>> +		out_pixels[x].a = (u16)0xffff;
>> +		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
>> +		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
>> +		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
>> +	}
>> +}
>> +
>> +
>>    /*
>>     * The following  functions take an line of argb_u16 pixels from the
>>     * src_buffer, convert them to a specific format, and store them in the
>> @@ -130,12 +165,50 @@ static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
>>    	}
>>    }
>>    
>> +static void argb_u16_to_ARGB16161616(struct vkms_frame_info *frame_info,
>> +				     const struct line_buffer *src_buffer, int y)
>> +{
>> +	int x, x_dst = frame_info->dst.x1;
>> +	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    src_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>> +		dst_pixels[3] = cpu_to_le16(in_pixels[x].a);
>> +		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
>> +		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
>> +		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
>> +	}
>> +}
>> +
>> +static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
>> +				     const struct line_buffer *src_buffer, int y)
>> +{
>> +	int x, x_dst = frame_info->dst.x1;
>> +	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    src_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>> +		dst_pixels[3] = (u8)0xffff;
>> +		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
>> +		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
>> +		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
>> +	}
>> +}
>> +
>>    plane_format_transform_func get_plane_fmt_transform_function(u32 format)
>>    {
>>    	if (format == DRM_FORMAT_ARGB8888)
>>    		return &ARGB8888_to_argb_u16;
>>    	else if (format == DRM_FORMAT_XRGB8888)
>>    		return &XRGB8888_to_argb_u16;
>> +	else if (format == DRM_FORMAT_ARGB16161616)
>> +		return &ARGB16161616_to_argb_u16;
>> +	else if (format == DRM_FORMAT_XRGB16161616)
>> +		return &XRGB16161616_to_argb_u16;
>>    	else
>>    		return NULL;
>>    }
>> @@ -146,6 +219,10 @@ wb_format_transform_func get_wb_fmt_transform_function(u32 format)
>>    		return &argb_u16_to_ARGB8888;
>>    	else if (format == DRM_FORMAT_XRGB8888)
>>    		return &argb_u16_to_XRGB8888;
>> +	else if (format == DRM_FORMAT_ARGB16161616)
>> +		return &argb_u16_to_ARGB16161616;
>> +	else if (format == DRM_FORMAT_XRGB16161616)
>> +		return &argb_u16_to_XRGB16161616;
>>    	else
>>    		return NULL;
>>    }
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index 798243837fd0..60054a85204a 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -14,11 +14,14 @@
>>    
>>    static const u32 vkms_formats[] = {
>>    	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_XRGB16161616
>>    };
>>    
>>    static const u32 vkms_plane_formats[] = {
>>    	DRM_FORMAT_ARGB8888,
>> -	DRM_FORMAT_XRGB8888
>> +	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_XRGB16161616,
>> +	DRM_FORMAT_ARGB16161616
>>    };
>>    
>>    static struct drm_plane_state *
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index 97f71e784bbf..cb63a5da9af1 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -15,6 +15,8 @@
>>    
>>    static const u32 vkms_wb_formats[] = {
>>    	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_XRGB16161616,
>> +	DRM_FORMAT_ARGB16161616
>>    };
>>    
>>    static const struct drm_connector_funcs vkms_wb_connector_funcs = {
> 
