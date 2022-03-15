Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2734D9AF4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A7110E56E;
	Tue, 15 Mar 2022 12:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89D010E566
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647346684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F93YLhlX3AHa6LrSoPs7cMDPZOP3lxJ4Kq/W7/cDMnE=;
 b=dNIFe/+K1mjVdmrJ9QfvtJbkwUrx/4xXnQuRp7b9G0HXes6v+OFXXtFSUkqLt66rHmkH/a
 OlyYV/xJIC0NLsiVpJMfG7d4LNmdJi16tYL+2/+03vR2l7VOD1cAP5JyhcbCshnFWxa3hl
 V/yLNnhTSGwyppsuXxj4EY4Q3qwSsrI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-TWORXbmYM0GbiYJye8WMHA-1; Tue, 15 Mar 2022 08:18:03 -0400
X-MC-Unique: TWORXbmYM0GbiYJye8WMHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l10-20020a05600c27ca00b0038b85cf8a20so850100wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F93YLhlX3AHa6LrSoPs7cMDPZOP3lxJ4Kq/W7/cDMnE=;
 b=UnGbnGygJX602BXjd2hPxLbAl19UyCy46hz5zaBDjh9wU18Nfte/P7pFLiPZANpkW+
 b59r9sbui8tDa2+h6ebAihkqg9p1hiOHD6QLJ2jBs0gbnGC27fDb/61y90ftY+JtIou4
 Eql0OI7v9qHwyLKTrOS9weDd9dXOqtZTr/uZqbeeH6hc8eZUEB2tjD/gpFt+X5kqcMq9
 ceq5y/S5BT9D45N4Ehs2pFUJjekVpc7e+nAvpi/F1DbXyzHukvJrbuwD7+Vgyq/FsScZ
 NLvVKIKHRxYMlQBR1kujPFghZBgjZN06XnbB4wuVmLnFQKhQ+B5Kvb/OEmfdq7Krdv6h
 X6yQ==
X-Gm-Message-State: AOAM531nMOEHAKgl2oIBsLCjHXazI8NC2oeCGPDXmGZl78wxQizrHXJm
 aXPgRL31KbSOrXXO2GgZjD3Ci80mkFXcpbOTFNYF1FB3m0+XkcYO8YsWIAXaAZIItSzkmnhYW6u
 HGNwpdJrxUY+mmCQxiTMyDJ+scz6N
X-Received: by 2002:a05:6000:15c2:b0:203:8348:8cbf with SMTP id
 y2-20020a05600015c200b0020383488cbfmr20070392wry.309.1647346682012; 
 Tue, 15 Mar 2022 05:18:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxb1OO0YySdqz4VaKmR8uVDHQT2dklpCo8aAEnlZM/tpPNZJbwPeYR5fg/PrR+/u+YS9VXUw==
X-Received: by 2002:a05:6000:15c2:b0:203:8348:8cbf with SMTP id
 y2-20020a05600015c200b0020383488cbfmr20070373wry.309.1647346681724; 
 Tue, 15 Mar 2022 05:18:01 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c35d100b00389f368cf1esm2270351wmq.40.2022.03.15.05.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:18:01 -0700 (PDT)
Message-ID: <27e1c911-798a-c14b-e5a0-622a7c5d8755@redhat.com>
Date: Tue, 15 Mar 2022 13:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] drm/format-helper: Fix XRGB888 to monochrome
 conversion
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-3-geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220315110707.628166-3-geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/15/22 12:07, Geert Uytterhoeven wrote:
> The conversion functions drm_fb_xrgb8888_to_mono() and
> drm_fb_gray8_to_mono_line() do not behave correctly when the
> horizontal boundaries of the clip rectangle are not multiples of 8:
>   a. When x1 % 8 != 0, the calculated pitch is not correct,
>   b. When x2 % 8 != 0, the pixel data for the last byte is wrong.
>

Thanks a lot for tracking down and fixing these issues.

> Simplify the code and fix (a) by:
>   1. Removing start_offset, and always storing the first pixel in the
>      first bit of the monochrome destination buffer.
>      Drivers that require the first pixel in a byte to be located at an
>      x-coordinate that is a multiple of 8 can always align the clip
>      rectangle before calling drm_fb_xrgb8888_to_mono().
>      Note that:
>        - The ssd130x driver does not need the alignment, as the
> 	 monochrome buffer is a temporary format,
>        - The repaper driver always updates the full screen, so the clip
> 	 rectangle is always aligned.
>   2. Passing the number of pixels to drm_fb_gray8_to_mono_line(),
>      instead of the number of bytes, and the number of pixels in the
>      last byte.
> 
> Fix (b) by explicitly setting the target bit, instead of always setting
> bit 7 and shifting the value in each loop iteration.
> 
> Remove the bogus pitch check, which operates on bytes instead of pixels,
> and triggers when e.g. flashing the cursor on a text console with a font
> that is 8 pixels wide.
> 
> Drop the confusing comment about scanlines, as a pitch in bytes always
> contains a multiple of 8 pixels.
> 
> While at it, use the drm_rect_height() helper instead of open-coding the
> same operation.
> 
> Update the comments accordingly.
> 
> Fixes: bcf8b616deb87941 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

I just have a small comment below.

[snip]

> +static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels)
> +{
> +	while (pixels) {
> +		unsigned int i, bits = min(pixels, 8U);
> +		u8 byte = 0;
>  
> -			byte >>= 1;
> -			if (src[x] >> 7)
> -				byte |= BIT(7);
> +		for (i = 0; i < bits; i++, pixels--) {

I think is worth to add a comment here explaining that the pixel is set to
1 for brightness > 127 and to 0 for brightness < 128. Or as kernel-doc for
this helper function.

> +			if (*src++ & BIT(7))

Pekka also mentioned that if (*src++ > 127) would make this easier to read.

> +				byte |= BIT(i);
>  		}
>  		*dst++ = byte;
>  	}

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

