Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE90A71315
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E399110E3B0;
	Wed, 26 Mar 2025 08:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="apLn8nI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD2E10E3B0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdXwiBfQ1PcJmHsNfMq0MZGMKchEXme5GlgmTznxHAw=;
 b=apLn8nI8DYHzsHQl10RIGcAY+A+qepVylQWa7MldjCOAZG8py+xO88ON/xBLq/+UB44zCF
 It6KRS9V6Mc3nibtPN8GIUxE3SyDOssYphEF2Xa99A1Yb59IFAY/88qXktzuwvUrEkeROQ
 UqK2yxZcP2sZuz2Mfd04FDgb1i2GuDE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-1JNQOc7MMNKI8jBf3QFS4g-1; Wed, 26 Mar 2025 04:52:52 -0400
X-MC-Unique: 1JNQOc7MMNKI8jBf3QFS4g-1
X-Mimecast-MFC-AGG-ID: 1JNQOc7MMNKI8jBf3QFS4g_1742979172
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so3655765e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979171; x=1743583971;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdXwiBfQ1PcJmHsNfMq0MZGMKchEXme5GlgmTznxHAw=;
 b=vZFMi/01U0etUAPQzwy4mD9leDIIa0ssTF2OEkSonnYtHuiPfKgGCOBuc5xOkmD2bh
 vCXh3W1A8exk7BdEGL8JGtE2Lfw2ouYCzMqzbYFE+ui3PxoW9ClszH5CUXEDL+a3FuRF
 XK8RzwYXLfuLj6JPvSp6OHmRQwyTK//3ILVD8f8pYcvrjIvrDfdjzdRAJ1kbME3GwAYL
 Zj0NQeiP0CFR1jYXHIqfS43ekAiP4Ky7cadHMDD0FK7ZD7tF8BPeiqizhqs2ZLwSpLgY
 kfPTlwd+egGQoTIqhbIf4MevUJ3LkqMtLBhuiSuOUBwf3iAo4P/dBONXNzh+8G6lKYwH
 colg==
X-Gm-Message-State: AOJu0YzRR7M3SK0KfccoOdynSk4umGOGE21RSMtNF1f/Tas0zxL0F3mU
 z84qhTVwM6ff/9U0yaz5aw//tgJSp6tPyLl7SbfH3CwwtmXOAHVvuDLu3MmpgL3IgO2EVJNnbq3
 Z0vBi6ZveZ7lx+rv/388KxUmIkbiH3tAiF21ubQgjhbWZ8H76RKBxU/7EfUIpQUUsug==
X-Gm-Gg: ASbGncv441w1Zoj56i389Oroz/ChsieoIQn0AuttCdh7xS7aST8/o5PAg9mCJmSMNah
 SDYrdxO1dbbo8EcBCYJJxp565PpWBJoTa9dsGxvxw7Rwqi+DzEL7iwDSlruvGPSo0TEZpd55O6U
 gfbiGGnU5bDepC04nn3pKH2ZfaSDixmRrqu6M0t0f7MU8nXhNDQno4WneugwValXvOsuKyTQwxR
 vdbQ3XQ4QaJPt9wfOpK/qK5kf04Oyjtq+/HDWu2fnE7ZNtbB8tZx5K3b49HdIMsCh3dEjIlGj2C
 B0L7LMiKhJL5T0zFuU9bmTOHSH4CSi/FNAyPZPvVLswU+qo54j2yRC4=
X-Received: by 2002:a05:600c:2254:b0:439:5f04:4f8d with SMTP id
 5b1f17b1804b1-43d7760f526mr16518015e9.12.1742979171504; 
 Wed, 26 Mar 2025 01:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs7QBdNLgoUNIkguREMs/B6N15A+H8d8H9l6Nkl+9Ljee4t3x4UxIeHrzURgMf9wixTu07ZA==
X-Received: by 2002:a05:600c:2254:b0:439:5f04:4f8d with SMTP id
 5b1f17b1804b1-43d7760f526mr16517775e9.12.1742979170924; 
 Wed, 26 Mar 2025 01:52:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9ef098sm15871799f8f.84.2025.03.26.01.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:52:50 -0700 (PDT)
Message-ID: <d3fa0d6c-17a2-4c2c-b971-c2a79d32e4da@redhat.com>
Date: Wed, 26 Mar 2025 09:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/format-helper: Add generic conversion to 24-bit
 formats
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Oqibih1XEXrQ3ZJLTCub2tOXguAD28b2nTSwzR9JKBY_1742979172
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2025 11:31, Thomas Zimmermann wrote:
> Add drm_fb_xfrm_line_32to24() to implement conversion from 32-bit
> pixels to 24-bit pixels. The pixel-conversion is specified by the
> given callback parameter. Mark the helper as always_inline to avoid
> overhead from function calls.
> 
> Then implement all existing line-conversion functions with the new
> generic call and the respective pixel-conversion helper.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_format_helper.c   | 43 ++++++++++++---------------
>   drivers/gpu/drm/drm_format_internal.h | 12 ++++++++
>   2 files changed, 31 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index abd18c23cfbb..5a2fe3d685a2 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -246,6 +246,23 @@ static int drm_fb_xfrm(struct iosys_map *dst,
>   				     xfrm_line);
>   }
>   
> +static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf,
> +						    unsigned int pixels,
> +						    u32 (*xfrm_pixel)(u32))
> +{
> +	u8 *dbuf8 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	const __le32 *send32 = sbuf32 + pixels;
> +
> +	while (sbuf32 < send32) {
> +		u32 val24 = xfrm_pixel(le32_to_cpup(sbuf32++));
> +		/* write output in reverse order for little endianness */
> +		*dbuf8++ = (val24 & 0x000000ff);
> +		*dbuf8++ = (val24 & 0x0000ff00) >>  8;
> +		*dbuf8++ = (val24 & 0x00ff0000) >> 16;
> +	}
> +}
> +
>   static __always_inline void drm_fb_xfrm_line_32to32(void *dbuf, const void *sbuf,
>   						    unsigned int pixels,
>   						    u32 (*xfrm_pixel)(u32))
> @@ -667,18 +684,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
>   
>   static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	u8 *dbuf8 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		/* write blue-green-red to output in little endianness */
> -		*dbuf8++ = (pix & 0x000000FF) >>  0;
> -		*dbuf8++ = (pix & 0x0000FF00) >>  8;
> -		*dbuf8++ = (pix & 0x00FF0000) >> 16;
> -	}
> +	drm_fb_xfrm_line_32to24(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb888);
>   }
>   
>   /**
> @@ -718,18 +724,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
>   
>   static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	u8 *dbuf8 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		/* write red-green-blue to output in little endianness */
> -		*dbuf8++ = (pix & 0x00ff0000) >> 16;
> -		*dbuf8++ = (pix & 0x0000ff00) >> 8;
> -		*dbuf8++ = (pix & 0x000000ff) >> 0;
> -	}
> +	drm_fb_xfrm_line_32to24(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_bgr888);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
> index 5f82f0b9c8e8..e7fcf260a914 100644
> --- a/drivers/gpu/drm/drm_format_internal.h
> +++ b/drivers/gpu/drm/drm_format_internal.h
> @@ -68,6 +68,18 @@ static inline u32 drm_pixel_xrgb8888_to_argb1555(u32 pix)
>   	       drm_pixel_xrgb8888_to_xrgb1555(pix);
>   }
>   
> +static inline u32 drm_pixel_xrgb8888_to_rgb888(u32 pix)
> +{
> +	return pix & GENMASK(23, 0);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_bgr888(u32 pix)
> +{
> +	return ((pix & 0x00ff0000) >> 16) |
> +	       ((pix & 0x0000ff00)) |
> +	       ((pix & 0x000000ff) << 16);
> +}
> +
>   static inline u32 drm_pixel_xrgb8888_to_argb8888(u32 pix)
>   {
>   	return GENMASK(31, 24) | /* fill alpha bits */

