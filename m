Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBE16FC060
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85E710E33D;
	Tue,  9 May 2023 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3ED10E33D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683617162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ru5h5N3Ca/ukJPEd5AXhZHdO8j5UoilOqEA44yg9EA=;
 b=SyT/p5mfR5CuOL8BE6xADiE/cG700YjaWTuIvJsmvub6nYJD+LGK+hs9Kyvi4yzDpF5PGd
 ys4+yD15H1p2lCLmLc+wvJUfWgIY+stUeft23V/+QrGB3xJfnyMz5mbTr7NfkduK/fxuF8
 08a1cGlcDIxUzYW3v9EKGq0cIUdNyqA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-kDtCZ0JxMIGMeoKzonBJhA-1; Tue, 09 May 2023 03:26:01 -0400
X-MC-Unique: kDtCZ0JxMIGMeoKzonBJhA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30479b764f9so1866530f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 00:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683617160; x=1686209160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ru5h5N3Ca/ukJPEd5AXhZHdO8j5UoilOqEA44yg9EA=;
 b=WlAZ2om44/+zYT3Sq6v1tHvI3hwjBYLIZHywASWHzzKt09eHBEMoapLhN3gL1KqzNP
 Dxz9llT1auprbO7a8EConNiYJaYmyUpjKnWgTsMgtB+MICyfmymV1XSP9yGe1i1GZCZy
 62rQ7fj03C3WaMaWkIZEkFt2N+oSrslkL24nkrhAqqztKo3pFvGf4lfwGxqkRQ4qvGo4
 TAs80R+FkZcn6CstzCO3+Lm4VZHaOQm3ypyW+IKUc8/DK7eTMr66hmwuuJ5sYJmrhpX9
 RhkxOvou8TbP1wYcUIxj96XhZlu8MOwexszWiEvFCz3KMSmbUA8KbA8uEa4L2fPJy+Oj
 CKXg==
X-Gm-Message-State: AC+VfDyYAhsBlfDWCFcr+i6J1OsHg0rN723pvhy5e26iM86vRdqCFoxG
 wLX519XTC2yo11IX/HJfU898iRtk17uGXbP9WhPixgNfFvDV+XZ2+fobOuNxbBa77PIFl2dSyBk
 xjwZn1a6EPImhEyr8aORsEcwI2BZr
X-Received: by 2002:a5d:6d49:0:b0:2f7:8779:3bc3 with SMTP id
 k9-20020a5d6d49000000b002f787793bc3mr8760944wri.11.1683617160106; 
 Tue, 09 May 2023 00:26:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YuoqccWgXbC/pQ8VVSHCFmUdNVa5jOZE7eqCxNNVbOnd9HSOta/qeYZ3riORukIq0sj7eLg==
X-Received: by 2002:a5d:6d49:0:b0:2f7:8779:3bc3 with SMTP id
 k9-20020a5d6d49000000b002f787793bc3mr8760934wri.11.1683617159778; 
 Tue, 09 May 2023 00:25:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a5d6803000000b00307a83ea722sm257630wru.58.2023.05.09.00.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 00:25:59 -0700 (PDT)
Message-ID: <c52ceacb-af9a-ad19-efe8-2cc42466dcdb@redhat.com>
Date: Tue, 9 May 2023 09:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/4] drm/mgag200: Simplify offset and scale computation.
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230505124337.854845-1-jfalempe@redhat.com>
 <20230505124337.854845-3-jfalempe@redhat.com>
 <1554caa0-f279-e54f-ffba-2ae2367411b8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1554caa0-f279-e54f-ffba-2ae2367411b8@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 08/05/2023 09:44, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.05.23 um 14:43 schrieb Jocelyn Falempe:
>> Now that the driver handles only 16, 24 and 32-bit framebuffer,
>> it can be simplified.
> 
> I think it should say that the driver never really handled 8-bit colors. 
> Or at least I'm not aware of.

Ok I can change that. This patch is just a cleanup, and is not really 
necessary for DMA.
> 
>>
>> No functional changes.
>>
>> offset:
>> 16bit: (bppshift = 1)
>> offset = width >> (4 - bppshift) => width / 8 => pitch / 16
>>
>> 24bit:  (bppshift = 0)
>> offset = (width * 3) >> (4 - bppshift)  => width * 3 / 16 => pitch / 16
>>
>> 32bit:  (bppshift = 2)
>> offset = width >> (4 - bppshift) => width / 4 => pitch / 16
>>
>> scale:
>> 16bit:
>> scale = (1 << bppshift) - 1 => 1
>> 24bit:
>> scale = ((1 << bppshift) * 3) - 1 => 2
>> 32bit:
>> scale = (1 << bppshift) - 1 => 3
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 63 +++++++-------------------
>>   1 file changed, 16 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index 9a24b9c00745..7d8c65372ac4 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -280,30 +280,16 @@ void mgag200_set_mode_regs(struct mga_device 
>> *mdev, const struct drm_display_mod
>>       WREG8(MGA_MISC_OUT, misc);
>>   }
>> -static u8 mgag200_get_bpp_shift(const struct drm_format_info *format)
>> -{
>> -    static const u8 bpp_shift[] = {0, 1, 0, 2};
>> -
>> -    return bpp_shift[format->cpp[0] - 1];
>> -}
>> -
>>   /*
>>    * Calculates the HW offset value from the framebuffer's pitch. The
>>    * offset is a multiple of the pixel size and depends on the display
>> - * format.
>> + * format. With width in pixels and pitch in bytes, the formula is:
>> + * offset = width * bpp / 128 = pitch / 16
>>    */
>>   static u32 mgag200_calculate_offset(struct mga_device *mdev,
>>                       const struct drm_framebuffer *fb)
>>   {
>> -    u32 offset = fb->pitches[0] / fb->format->cpp[0];
>> -    u8 bppshift = mgag200_get_bpp_shift(fb->format);
>> -
>> -    if (fb->format->cpp[0] * 8 == 24)
>> -        offset = (offset * 3) >> (4 - bppshift);
>> -    else
>> -        offset = offset >> (4 - bppshift);
>> -
>> -    return offset;
>> +    return fb->pitches[0] >> 4;
> 
> 24-bit is different from the rest. I don't understand how you simplified 
> this code.

This code was overly complex, but this special case is compensated by 
the "bpp_shift" thing. The formula width * bpp / 128 is in the G200 
documentation 4.6.5

u32 offset = fb->pitches[0] / fb->format->cpp[0];

so offset is now the width in pixels. (pitches[0] is the width in bytes)
bppshift is 0 for 24 bits, 1 for 16 bits and 2 for 32 bits

offset:
16bit: (bppshift = 1) ; pitch = width * 2
offset = width >> (4 - bppshift) => width / 8 => pitch / 16

24bit:  (bppshift = 0) ; pitch = width * 3
offset = (width * 3) >> (4 - bppshift)  => width * 3 / 16 => pitch / 16

32bit:  (bppshift = 2) ; pith = width * 4
offset = width >> (4 - bppshift) => width / 4 => pitch / 16

> 
> Best regards
> Thomas
> 
>>   }
>>   static void mgag200_set_offset(struct mga_device *mdev,
>> @@ -326,48 +312,25 @@ static void mgag200_set_offset(struct mga_device 
>> *mdev,
>>   void mgag200_set_format_regs(struct mga_device *mdev, const struct 
>> drm_format_info *format)
>>   {
>>       struct drm_device *dev = &mdev->base;
>> -    unsigned int bpp, bppshift, scale;
>> +    unsigned int scale;
>>       u8 crtcext3, xmulctrl;
>> -    bpp = format->cpp[0] * 8;
>> -
>> -    bppshift = mgag200_get_bpp_shift(format);
>> -    switch (bpp) {
>> -    case 24:
>> -        scale = ((1 << bppshift) * 3) - 1;
>> -        break;
>> -    default:
>> -        scale = (1 << bppshift) - 1;
>> -        break;
>> -    }
>> -
>> -    RREG_ECRT(3, crtcext3);
>> -
>> -    switch (bpp) {
>> -    case 8:
>> -        xmulctrl = MGA1064_MUL_CTL_8bits;
>> -        break;
>> -    case 16:
>> -        if (format->depth == 15)
>> -            xmulctrl = MGA1064_MUL_CTL_15bits;
>> -        else
>> -            xmulctrl = MGA1064_MUL_CTL_16bits;
>> +    switch (format->format) {
>> +    case DRM_FORMAT_RGB565:
>> +        xmulctrl = MGA1064_MUL_CTL_16bits;
>>           break;
>> -    case 24:
>> +    case DRM_FORMAT_RGB888:
>>           xmulctrl = MGA1064_MUL_CTL_24bits;
>>           break;
>> -    case 32:
>> +    case DRM_FORMAT_XRGB8888:
>>           xmulctrl = MGA1064_MUL_CTL_32_24bits;
>>           break;
>>       default:
>>           /* BUG: We should have caught this problem already. */
>> -        drm_WARN_ON(dev, "invalid format depth\n");
>> +        drm_WARN_ON(dev, "invalid drm format\n");
>>           return;
>>       }
>> -    crtcext3 &= ~GENMASK(2, 0);
>> -    crtcext3 |= scale;
>> -
>>       WREG_DAC(MGA1064_MUL_CTL, xmulctrl);
>>       WREG_GFX(0, 0x00);
>> @@ -383,6 +346,12 @@ void mgag200_set_format_regs(struct mga_device 
>> *mdev, const struct drm_format_in
>>       WREG_GFX(7, 0x0f);
>>       WREG_GFX(8, 0x0f);
>> +    /* scale is the number of bytes per pixels - 1 */
>> +    scale = format->cpp[0] - 1;
>> +
>> +    RREG_ECRT(3, crtcext3);
>> +    crtcext3 &= ~GENMASK(2, 0);
>> +    crtcext3 |= scale;
>>       WREG_ECRT(3, crtcext3);
>>   }
> 


-- 

Jocelyn

