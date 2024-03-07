Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E08754F0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F2E1137C5;
	Thu,  7 Mar 2024 17:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SXsJI7E1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7151137C5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709831580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJq+q4w+Fhz+NwgT2LenKhYkhIkQp3iH+Ak6Qx3tLaQ=;
 b=SXsJI7E1IBIx98K9Qv1/mZKZ1xZ5ZrTaJNYpFpBbPgymW+TRVrBZtU96DhCKVKenSEsqTU
 E4xyHwwVi7a+AUGXaI5gFNAPIjrhMYVAUfS3J4DR7M4zKXJq7CXIY3DeL377U/x92vu44m
 QdG92rV8vMYIqFSmrjZ3+BMDRAg2KUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-pkHGsTp_NvugWO56VbhBUg-1; Thu, 07 Mar 2024 12:12:58 -0500
X-MC-Unique: pkHGsTp_NvugWO56VbhBUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-412e99244dbso6186265e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 09:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709831578; x=1710436378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QJq+q4w+Fhz+NwgT2LenKhYkhIkQp3iH+Ak6Qx3tLaQ=;
 b=etQMmNIMfmw0KOSXEVlAl/68Mq8xxB1G04R4PeSahK3VlBbVOzggtKnE29UJnF9tWY
 pVFzO/BnBGDOm46jvK3lGV7R68YLhaNYgWrorRu5uw9SPkegr2mJPCB4sFpFb9VA6BxD
 3u7yGUXJP7mkOIb+tV14AXWtNUKfP/bh/sFjRN9epclURO/+AvezeN5n4aJl8DFleYDk
 HHme4AJaI66tsK5/LuqiBwZYNLF4SLneyMd8F+UxQ8/DKhA7duSS8YCusMxr3/ggSDuh
 F/IMZ9DX/6sH6Ywz3T2bceENQlSNBetdCoobeVzXJCR6vtD9WdQveb1veac+it3KF8so
 ebvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1B+tbrIQ0glSA/6UsSdDAM50GIeg1blnsdUpPYMr6HNaUz4Mkx27xSrcymh0GMgTzy+er+hdnJOpX+uk5NHG3L3ev5Iu2TgKYz5kOgr+L
X-Gm-Message-State: AOJu0YwhEIFeGvRCtL1+pOqIOukwrLKqXaYhmYZUunFYdXbC/+WhDQgy
 f7KdY107nUaqiZJ4kYDi0/PXlMc8oRlJCMUB6jwcxKAJqcIByYrwvF4xWDpj25so2JlPvVHw6jE
 0eEf+Hz3TC1g8r2f+4RkTMfOP6LTBecJmm1sGPHorr1lDbc84g7fbgwas9Uca/9TrNQ==
X-Received: by 2002:a05:600c:4e91:b0:412:b489:14f9 with SMTP id
 f17-20020a05600c4e9100b00412b48914f9mr15511076wmq.15.1709831577672; 
 Thu, 07 Mar 2024 09:12:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJLe8k4qYOh7CiXedBNrMebyT/CyRt7hGPVw0hwq/4nT66F2Sqih4idombl3jNnv+IIpUtWA==
X-Received: by 2002:a05:600c:4e91:b0:412:b489:14f9 with SMTP id
 f17-20020a05600c4e9100b00412b48914f9mr15511055wmq.15.1709831577238; 
 Thu, 07 Mar 2024 09:12:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 fs20-20020a05600c3f9400b00412b0e51ef9sm3244208wmb.31.2024.03.07.09.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 09:12:56 -0800 (PST)
Message-ID: <9f1798a8-8e2c-46e9-bc2f-fe2d325ba557@redhat.com>
Date: Thu, 7 Mar 2024 18:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-1-jfalempe@redhat.com>
 <20240307091936.576689-3-jfalempe@redhat.com>
 <4c2def7e-88c0-44e4-8aec-8107c2b502c7@suse.de>
 <cf7f311c-645c-4c5f-a595-8325a7ecc2f2@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cf7f311c-645c-4c5f-a595-8325a7ecc2f2@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

Hi,

On 07/03/2024 16:41, Thomas Zimmermann wrote:
> 
> 
> Am 07.03.24 um 15:08 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 07.03.24 um 10:14 schrieb Jocelyn Falempe:
>>> This is needed for drm_panic, to draw the font, and fill
>>> the background color, in multiple color format.
>>
>> As you know, I'm not happy about this patch and the the changes do not 
>> reflect my easier
> 
> s/easier/earlier
> 
>> review. These format helpers are supposed to serve all of DRM and not 
>> just the panic handler. I know that the current code isn't perfect, 
>> but the R1 support is a step backwards IMHO.
>>
>> I suggest to the drawing routines entirely within the panic-handler 
>> code and maybe try to sort out things later. IIRC that's how it was in 
>> earlier revisions of the patchset.

Sorry I didn't change this patch in v8 and v9, I was focusing on locking 
and the overall design.
I agree to move this back to drm_panic.c, so we can merge a first 
version of drm_panic. And when a generic format converter will be ready, 
I will do the patch to use it.

Best regards,

-- 

Jocelyn



>>
>> Best regards
>> Thomas
>>
>>>
>>> v5:
>>>   * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>>>   * Also add drm_fb_fill() to fill area with background color.
>>> v6:
>>>   * fix __le32 conversion warning found by the kernel test bot
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_format_helper.c | 432 ++++++++++++++++++++++------
>>>   include/drm/drm_format_helper.h     |   9 +
>>>   2 files changed, 360 insertions(+), 81 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_format_helper.c 
>>> b/drivers/gpu/drm/drm_format_helper.c
>>> index b1be458ed4dd..2d9646cefc4f 100644
>>> --- a/drivers/gpu/drm/drm_format_helper.c
>>> +++ b/drivers/gpu/drm/drm_format_helper.c
>>> @@ -111,6 +111,153 @@ void drm_format_conv_state_release(struct 
>>> drm_format_conv_state *state)
>>>   }
>>>   EXPORT_SYMBOL(drm_format_conv_state_release);
>>>   +static __le16 drm_format_xrgb8888_to_rgb565(__le32 val32)
>>> +{
>>> +    u16 val16;
>>> +    u32 pix;
>>> +
>>> +    pix = le32_to_cpu(val32);
>>> +    val16 = ((pix & 0x00F80000) >> 8) |
>>> +        ((pix & 0x0000FC00) >> 5) |
>>> +        ((pix & 0x000000F8) >> 3);
>>> +    return cpu_to_le16(val16);
>>> +}
>>> +
>>> +static __le16 drm_format_xrgb8888_to_rgba5551(__le32 val32)
>>> +{
>>> +    u16 val16;
>>> +    u32 pix;
>>> +
>>> +    pix = le32_to_cpu(val32);
>>> +    val16 = ((pix & 0x00f80000) >> 8) |
>>> +        ((pix & 0x0000f800) >> 5) |
>>> +        ((pix & 0x000000f8) >> 2) |
>>> +        BIT(0); /* set alpha bit */
>>> +    return cpu_to_le16(val16);
>>> +}
>>> +
>>> +static __le16 drm_format_xrgb8888_to_xrgb1555(__le32 val32)
>>> +{
>>> +    u16 val16;
>>> +    u32 pix;
>>> +
>>> +    pix = le32_to_cpu(val32);
>>> +    val16 = ((pix & 0x00f80000) >> 9) |
>>> +        ((pix & 0x0000f800) >> 6) |
>>> +        ((pix & 0x000000f8) >> 3);
>>> +    return cpu_to_le16(val16);
>>> +}
>>> +
>>> +static __le16 drm_format_xrgb8888_to_argb1555(__le32 val32)
>>> +{
>>> +    u16 val16;
>>> +    u32 pix;
>>> +
>>> +    pix = le32_to_cpu(val32);
>>> +    val16 = BIT(15) | /* set alpha bit */
>>> +        ((pix & 0x00f80000) >> 9) |
>>> +        ((pix & 0x0000f800) >> 6) |
>>> +        ((pix & 0x000000f8) >> 3);
>>> +    return cpu_to_le16(val16);
>>> +}
>>> +
>>> +static __le32 drm_format_xrgb8888_to_argb8888(__le32 pix)
>>> +{
>>> +    u32 val32;
>>> +
>>> +    val32 = le32_to_cpu(pix);
>>> +    val32 |= GENMASK(31, 24); /* fill alpha bits */
>>> +    return cpu_to_le32(val32);
>>> +}
>>> +
>>> +static __le32 drm_format_xrgb8888_to_xbgr8888(__le32 pix)
>>> +{
>>> +    u32 val32;
>>> +
>>> +    val32 = le32_to_cpu(pix);
>>> +    val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
>>> +        ((val32 & 0x0000ff00) >>  8) <<  8 |
>>> +        ((val32 & 0x000000ff) >>  0) << 16 |
>>> +        ((val32 & 0xff000000) >> 24) << 24;
>>> +    return cpu_to_le32(val32);
>>> +}
>>> +
>>> +static __le32 drm_format_xrgb8888_to_abgr8888(__le32 pix)
>>> +{
>>> +    u32 val32;
>>> +
>>> +    val32 = le32_to_cpu(pix);
>>> +    val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
>>> +        ((val32 & 0x0000ff00) >>  8) <<  8 |
>>> +        ((val32 & 0x000000ff) >>  0) << 16 |
>>> +        GENMASK(31, 24); /* fill alpha bits */
>>> +    return cpu_to_le32(val32);
>>> +}
>>> +
>>> +static __le32 drm_format_xrgb8888_to_xrgb2101010(__le32 pix)
>>> +{
>>> +    u32 val32;
>>> +
>>> +    val32 = le32_to_cpu(pix);
>>> +    val32 = ((val32 & 0x000000FF) << 2) |
>>> +        ((val32 & 0x0000FF00) << 4) |
>>> +        ((val32 & 0x00FF0000) << 6);
>>> +    return cpu_to_le32(val32 | ((val32 >> 8) & 0x00300C03));
>>> +}
>>> +
>>> +static __le32 drm_format_xrgb8888_to_argb2101010(__le32 pix)
>>> +{
>>> +    u32 val32;
>>> +
>>> +    val32 = le32_to_cpu(pix);
>>> +    val32 = ((val32 & 0x000000FF) << 2) |
>>> +        ((val32 & 0x0000FF00) << 4) |
>>> +        ((val32 & 0x00FF0000) << 6);
>>> +    val32 = GENMASK(31, 30) | /* set alpha bits */
>>> +          val32 | ((val32 >> 8) & 0x00300c03);
>>> +    return cpu_to_le32(val32);
>>> +}
>>> +
>>> +/**
>>> + * drm_fb_convert_from_xrgb8888 - convert one pixel from xrgb8888 to 
>>> the desired format
>>> + * @color: input color, in xrgb8888 format
>>> + * @format: output format
>>> + *
>>> + * Returns:
>>> + * Color in the format specified, casted to u32.
>>> + * Or 0 if the format is unknown.
>>> + */
>>> +u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format)
>>> +{
>>> +    __le32 pix = cpu_to_le32(color);
>>> +
>>> +    switch (format) {
>>> +    case DRM_FORMAT_RGB565:
>>> +        return le16_to_cpu(drm_format_xrgb8888_to_rgb565(pix));
>>> +    case DRM_FORMAT_RGBA5551:
>>> +        return le16_to_cpu(drm_format_xrgb8888_to_rgba5551(pix));
>>> +    case DRM_FORMAT_XRGB1555:
>>> +        return le16_to_cpu(drm_format_xrgb8888_to_xrgb1555(pix));
>>> +    case DRM_FORMAT_ARGB1555:
>>> +        return le16_to_cpu(drm_format_xrgb8888_to_argb1555(pix));
>>> +    case DRM_FORMAT_RGB888:
>>> +    case DRM_FORMAT_XRGB8888:
>>> +        return le32_to_cpu(pix);
>>> +    case DRM_FORMAT_ARGB8888:
>>> +        return le32_to_cpu(drm_format_xrgb8888_to_argb8888(pix));
>>> +    case DRM_FORMAT_XBGR8888:
>>> +        return le32_to_cpu(drm_format_xrgb8888_to_xbgr8888(pix));
>>> +    case DRM_FORMAT_XRGB2101010:
>>> +        return le32_to_cpu(drm_format_xrgb8888_to_xrgb2101010(pix));
>>> +    case DRM_FORMAT_ARGB2101010:
>>> +        return le32_to_cpu(drm_format_xrgb8888_to_argb2101010(pix));
>>> +    default:
>>> +        WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>>> +        return 0;
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL(drm_fb_convert_from_xrgb8888);
>>> +
>>>   static unsigned int clip_offset(const struct drm_rect *clip, 
>>> unsigned int pitch, unsigned int cpp)
>>>   {
>>>       return clip->y1 * pitch + clip->x1 * cpp;
>>> @@ -366,6 +513,193 @@ void drm_fb_swab(struct iosys_map *dst, const 
>>> unsigned int *dst_pitch,
>>>   }
>>>   EXPORT_SYMBOL(drm_fb_swab);
>>>   +static void drm_fb_r1_to_16bit(struct iosys_map *dmap, unsigned 
>>> int dpitch,
>>> +                   const u8 *sbuf8, unsigned int spitch,
>>> +                   unsigned int height, unsigned int width,
>>> +                   __le16 fg16, __le16 bg16)
>>> +{
>>> +    unsigned int l, x;
>>> +    __le16 val16;
>>> +
>>> +    for (l = 0; l < height; l++) {
>>> +        for (x = 0; x < width; x++) {
>>> +            val16 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 
>>> 8))) ? fg16 : bg16;
>>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, 
>>> le16_to_cpu(val16));
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static void drm_fb_r1_to_24bit(struct iosys_map *dmap, unsigned int 
>>> dpitch,
>>> +                   const u8 *sbuf8, unsigned int spitch,
>>> +                   unsigned int height, unsigned int width,
>>> +                   __le32 fg32, __le32 bg32)
>>> +{
>>> +    unsigned int l, x;
>>> +    __le32 color;
>>> +    u32 val32;
>>> +
>>> +    for (l = 0; l < height; l++) {
>>> +        for (x = 0; x < width; x++) {
>>> +            u32 off = l * dpitch + x * 3;
>>> +
>>> +            color = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 
>>> 8))) ? fg32 : bg32;
>>> +            val32 = le32_to_cpu(color);
>>> +
>>> +            /* write blue-green-red to output in little endianness */
>>> +            iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
>>> +            iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
>>> +            iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 
>>> 16);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static void drm_fb_r1_to_32bit(struct iosys_map *dmap, unsigned int 
>>> dpitch,
>>> +                   const u8 *sbuf8, unsigned int spitch,
>>> +                   unsigned int height, unsigned int width,
>>> +                   __le32 fg32, __le32 bg32)
>>> +{
>>> +    unsigned int l, x;
>>> +    __le32 val32;
>>> +
>>> +    for (l = 0; l < height; l++) {
>>> +        for (x = 0; x < width; x++) {
>>> +            val32 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 
>>> 8))) ? fg32 : bg32;
>>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, 
>>> le32_to_cpu(val32));
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/**
>>> + * drm_fb_blit_from_r1 - convert a monochrome image to a linear 
>>> framebuffer
>>> + * @dmap: destination iosys_map
>>> + * @dpitch: destination pitch in bytes
>>> + * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
>>> + * @spitch: source pitch in bytes
>>> + * @height: height of the image to copy, in pixels
>>> + * @width: width of the image to copy, in pixels
>>> + * @fg_color: foreground color, in destination format
>>> + * @bg_color: background color, in destination format
>>> + * @pixel_width: pixel width in bytes.
>>> + *
>>> + * This can be used to draw font which are monochrome images, to a 
>>> framebuffer
>>> + * in other supported format.
>>> + */
>>> +void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
>>> +             const u8 *sbuf8, unsigned int spitch,
>>> +             unsigned int height, unsigned int width,
>>> +             u32 fg_color, u32 bg_color,
>>> +             unsigned int pixel_width)
>>> +{
>>> +    switch (pixel_width) {
>>> +    case 2:
>>> +        drm_fb_r1_to_16bit(dmap, dpitch, sbuf8, spitch,
>>> +                   height, width,
>>> +                   cpu_to_le16(fg_color),
>>> +                   cpu_to_le16(bg_color));
>>> +    break;
>>> +    case 3:
>>> +        drm_fb_r1_to_24bit(dmap, dpitch, sbuf8, spitch,
>>> +                   height, width,
>>> +                   cpu_to_le32(fg_color),
>>> +                   cpu_to_le32(bg_color));
>>> +    break;
>>> +    case 4:
>>> +        drm_fb_r1_to_32bit(dmap, dpitch, sbuf8, spitch,
>>> +                   height, width,
>>> +                   cpu_to_le32(fg_color),
>>> +                   cpu_to_le32(bg_color));
>>> +    break;
>>> +    default:
>>> +        WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL(drm_fb_blit_from_r1);
>>> +
>>> +static void drm_fb_fill8(struct iosys_map *dmap, unsigned int dpitch,
>>> +             unsigned int height, unsigned int width,
>>> +             u8 color)
>>> +{
>>> +    unsigned int l, x;
>>> +
>>> +    for (l = 0; l < height; l++)
>>> +        for (x = 0; x < width; x++)
>>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u8), u8, color);
>>> +}
>>> +
>>> +static void drm_fb_fill16(struct iosys_map *dmap, unsigned int dpitch,
>>> +              unsigned int height, unsigned int width,
>>> +              u16 color)
>>> +{
>>> +    unsigned int l, x;
>>> +
>>> +    for (l = 0; l < height; l++)
>>> +        for (x = 0; x < width; x++)
>>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, 
>>> color);
>>> +}
>>> +
>>> +static void drm_fb_fill24(struct iosys_map *dmap, unsigned int dpitch,
>>> +              unsigned int height, unsigned int width,
>>> +              u32 color)
>>> +{
>>> +    unsigned int l, x;
>>> +
>>> +    for (l = 0; l < height; l++) {
>>> +        for (x = 0; x < width; x++) {
>>> +            unsigned int off = l * dpitch + x * 3;
>>> +
>>> +            /* write blue-green-red to output in little endianness */
>>> +            iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
>>> +            iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
>>> +            iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 
>>> 16);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static void drm_fb_fill32(struct iosys_map *dmap, unsigned int dpitch,
>>> +              unsigned int height, unsigned int width,
>>> +              u32 color)
>>> +{
>>> +    unsigned int l, x;
>>> +
>>> +    for (l = 0; l < height; l++)
>>> +        for (x = 0; x < width; x++)
>>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, 
>>> color);
>>> +}
>>> +
>>> +/**
>>> + * drm_fb_fill - Fill a rectangle with a color
>>> + * @dmap: destination iosys_map, pointing to the top left corner of 
>>> the rectangle
>>> + * @dpitch: destination pitch in bytes
>>> + * @height: height of the rectangle, in pixels
>>> + * @width: width of the rectangle, in pixels
>>> + * @color: color to fill the rectangle.
>>> + * @pixel_width: pixel width in bytes
>>> + *
>>> + * Fill a rectangle with a color, in a linear framebuffer.
>>> + */
>>> +void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
>>> +             unsigned int height, unsigned int width,
>>> +             u32 color, unsigned int pixel_width)
>>> +{
>>> +    switch (pixel_width) {
>>> +    case 1:
>>> +        drm_fb_fill8(dmap, dpitch, height, width, color);
>>> +    break;
>>> +    case 2:
>>> +        drm_fb_fill16(dmap, dpitch, height, width, color);
>>> +    break;
>>> +    case 3:
>>> +        drm_fb_fill24(dmap, dpitch, height, width, color);
>>> +    break;
>>> +    case 4:
>>> +        drm_fb_fill32(dmap, dpitch, height, width, color);
>>> +    break;
>>> +    default:
>>> +        WARN_ONCE(1, "Can't fill with pixel width %d\n", pixel_width);
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL(drm_fb_fill);
>>> +
>>>   static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void 
>>> *sbuf, unsigned int pixels)
>>>   {
>>>       u8 *dbuf8 = dbuf;
>>> @@ -420,15 +754,9 @@ static void drm_fb_xrgb8888_to_rgb565_line(void 
>>> *dbuf, const void *sbuf, unsigne
>>>       __le16 *dbuf16 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u16 val16;
>>> -    u32 pix;
>>>         for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        val16 = ((pix & 0x00F80000) >> 8) |
>>> -            ((pix & 0x0000FC00) >> 5) |
>>> -            ((pix & 0x000000F8) >> 3);
>>> -        dbuf16[x] = cpu_to_le16(val16);
>>> +        dbuf16[x] = drm_format_xrgb8888_to_rgb565(sbuf32[x]);
>>>       }
>>>   }
>>>   @@ -498,16 +826,9 @@ static void 
>>> drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
>>>       __le16 *dbuf16 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u16 val16;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        val16 = ((pix & 0x00f80000) >> 9) |
>>> -            ((pix & 0x0000f800) >> 6) |
>>> -            ((pix & 0x000000f8) >> 3);
>>> -        dbuf16[x] = cpu_to_le16(val16);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        dbuf16[x] = drm_format_xrgb8888_to_xrgb1555(sbuf32[x]);
>>>   }
>>>     /**
>>> @@ -550,17 +871,9 @@ static void 
>>> drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
>>>       __le16 *dbuf16 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u16 val16;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        val16 = BIT(15) | /* set alpha bit */
>>> -            ((pix & 0x00f80000) >> 9) |
>>> -            ((pix & 0x0000f800) >> 6) |
>>> -            ((pix & 0x000000f8) >> 3);
>>> -        dbuf16[x] = cpu_to_le16(val16);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        dbuf16[x] = drm_format_xrgb8888_to_argb1555(sbuf32[x]);
>>>   }
>>>     /**
>>> @@ -603,17 +916,9 @@ static void 
>>> drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
>>>       __le16 *dbuf16 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u16 val16;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        val16 = ((pix & 0x00f80000) >> 8) |
>>> -            ((pix & 0x0000f800) >> 5) |
>>> -            ((pix & 0x000000f8) >> 2) |
>>> -            BIT(0); /* set alpha bit */
>>> -        dbuf16[x] = cpu_to_le16(val16);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        dbuf16[x] = drm_format_xrgb8888_to_rgba5551(sbuf32[x]);
>>>   }
>>>     /**
>>> @@ -707,13 +1012,9 @@ static void 
>>> drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
>>>       __le32 *dbuf32 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        pix |= GENMASK(31, 24); /* fill alpha bits */
>>> -        dbuf32[x] = cpu_to_le32(pix);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        dbuf32[x] = drm_format_xrgb8888_to_argb8888(sbuf32[x]);
>>>   }
>>>     /**
>>> @@ -756,16 +1057,9 @@ static void 
>>> drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsig
>>>       __le32 *dbuf32 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        pix = ((pix & 0x00ff0000) >> 16) <<  0 |
>>> -              ((pix & 0x0000ff00) >>  8) <<  8 |
>>> -              ((pix & 0x000000ff) >>  0) << 16 |
>>> -              GENMASK(31, 24); /* fill alpha bits */
>>> -        *dbuf32++ = cpu_to_le32(pix);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        *dbuf32++ = drm_format_xrgb8888_to_abgr8888(sbuf32[x]);
>>>   }
>>>     static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, 
>>> const unsigned int *dst_pitch,
>>> @@ -787,16 +1081,9 @@ static void 
>>> drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsig
>>>       __le32 *dbuf32 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        pix = ((pix & 0x00ff0000) >> 16) <<  0 |
>>> -              ((pix & 0x0000ff00) >>  8) <<  8 |
>>> -              ((pix & 0x000000ff) >>  0) << 16 |
>>> -              ((pix & 0xff000000) >> 24) << 24;
>>> -        *dbuf32++ = cpu_to_le32(pix);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        *dbuf32++ = drm_format_xrgb8888_to_xbgr8888(sbuf32[x]);
>>>   }
>>>     static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, 
>>> const unsigned int *dst_pitch,
>>> @@ -818,17 +1105,9 @@ static void 
>>> drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
>>>       __le32 *dbuf32 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u32 val32;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        val32 = ((pix & 0x000000FF) << 2) |
>>> -            ((pix & 0x0000FF00) << 4) |
>>> -            ((pix & 0x00FF0000) << 6);
>>> -        pix = val32 | ((val32 >> 8) & 0x00300C03);
>>> -        *dbuf32++ = cpu_to_le32(pix);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        *dbuf32++ = drm_format_xrgb8888_to_xrgb2101010(sbuf32[x]);
>>>   }
>>>     /**
>>> @@ -872,18 +1151,9 @@ static void 
>>> drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
>>>       __le32 *dbuf32 = dbuf;
>>>       const __le32 *sbuf32 = sbuf;
>>>       unsigned int x;
>>> -    u32 val32;
>>> -    u32 pix;
>>>   -    for (x = 0; x < pixels; x++) {
>>> -        pix = le32_to_cpu(sbuf32[x]);
>>> -        val32 = ((pix & 0x000000ff) << 2) |
>>> -            ((pix & 0x0000ff00) << 4) |
>>> -            ((pix & 0x00ff0000) << 6);
>>> -        pix = GENMASK(31, 30) | /* set alpha bits */
>>> -              val32 | ((val32 >> 8) & 0x00300c03);
>>> -        *dbuf32++ = cpu_to_le32(pix);
>>> -    }
>>> +    for (x = 0; x < pixels; x++)
>>> +        *dbuf32++ = drm_format_xrgb8888_to_argb2101010(sbuf32[x]);
>>>   }
>>>     /**
>>> diff --git a/include/drm/drm_format_helper.h 
>>> b/include/drm/drm_format_helper.h
>>> index f13b34e0b752..f416f0bef52d 100644
>>> --- a/include/drm/drm_format_helper.h
>>> +++ b/include/drm/drm_format_helper.h
>>> @@ -66,6 +66,7 @@ void *drm_format_conv_state_reserve(struct 
>>> drm_format_conv_state *state,
>>>                       size_t new_size, gfp_t flags);
>>>   void drm_format_conv_state_release(struct drm_format_conv_state 
>>> *state);
>>>   +u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format);
>>>   unsigned int drm_fb_clip_offset(unsigned int pitch, const struct 
>>> drm_format_info *format,
>>>                   const struct drm_rect *clip);
>>>   @@ -76,6 +77,14 @@ void drm_fb_swab(struct iosys_map *dst, const 
>>> unsigned int *dst_pitch,
>>>            const struct iosys_map *src, const struct drm_framebuffer 
>>> *fb,
>>>            const struct drm_rect *clip, bool cached,
>>>            struct drm_format_conv_state *state);
>>> +void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
>>> +             const u8 *sbuf8, unsigned int spitch,
>>> +             unsigned int height, unsigned int width,
>>> +             u32 fg_color, u32 bg_color,
>>> +             unsigned int pixel_width);
>>> +void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
>>> +         unsigned int height, unsigned int width,
>>> +         u32 color, unsigned int pixel_width);
>>>   void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const 
>>> unsigned int *dst_pitch,
>>>                      const struct iosys_map *src, const struct 
>>> drm_framebuffer *fb,
>>>                      const struct drm_rect *clip, struct 
>>> drm_format_conv_state *state);
>>
> 

