Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9F2A7131D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D324910E67C;
	Wed, 26 Mar 2025 08:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OB1/30Bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7719D10E67C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+o5I0UccpJXaVeSS/sQ2caHakEHVQfwT34ao8RP7+E=;
 b=OB1/30BniwkrrlFqmbp0k0iJ69hl6rtLv7fq6Mv6cZ4/WUsrsRMS8+DsEUgDPr09P0uKPv
 Ro7mNxh0pDdONkEhhiB3RUW6CKJ1Hefl608gtkNvkfzwnj2hXlqMhWfMvawBzVq6V0kbZM
 soqH5DPJgT7yMQzemWbW0O1xbOJ5mfI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-2sq4d_VYMCW5V-qKKY9Uxw-1; Wed, 26 Mar 2025 04:54:01 -0400
X-MC-Unique: 2sq4d_VYMCW5V-qKKY9Uxw-1
X-Mimecast-MFC-AGG-ID: 2sq4d_VYMCW5V-qKKY9Uxw_1742979240
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4394c489babso30265685e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979239; x=1743584039;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T+o5I0UccpJXaVeSS/sQ2caHakEHVQfwT34ao8RP7+E=;
 b=WC7cHNUHNiNsVzhEqkRNrhmeET0Gw0xCA7T/ZkfDPD6u8txNmkk39hR7l1S4x3tLCX
 ycmc1qVUYKrNkpPjB7tQFwOh+h+dNHbJWz3n5VfMDVi8x7Dwxm5smbueCkwZHzUk3Zre
 bmB6C/R7N6NYW/rUOXnN1PdRUOnGgZ1xhj8GvCYdxU6Z4tNwStp1RneS3ll5ZwbTHNMF
 ZU6FZin10LVFlvID636yZFz20LonTjgxI4hthHdDpH5cKbSV7KMSKnvD23+GNEH31UOz
 5rbAe8yjjMRbf3zQYpGiffQRzYgw8ItNhvCiDCzjupfkzlBJZAXa/6sBh1B5G8tADhC/
 VPXg==
X-Gm-Message-State: AOJu0Yz+82gPCtaS+1E7zijHb/Er+d9ga9wuLQbHmJkumt7BTbuHzA/V
 CattrYW93Yq1KO6QMs7PohMGZj1Qb0ziqw1WBxM9qgiIIV2CYNdT3Yl/qWtuEcjRfG+WdXpls18
 +Bz+YoXx15muOpIZXSSab+0ayvbUGjsqW/aCr47RVMhE9Os6MbneQzI2lS508fcjdH+dDg2kluA
 ==
X-Gm-Gg: ASbGncvBuhnF+AVG5uwRDwzG4gy7IssqQAMHjQGJwoZIHU47qXzQ8MxYvoxZ5qjYN7G
 d7BC/O9UZTosHSVYHappxMiiU2/KDhgU1+LHWSXWQyjvD/0uPm59SWQgo4d8flS66u+hMWqG+jD
 MTQPzXFGBm+8PGYQiW3S0Mt1SkAEoeeaRSedMpFNHUmD3D6+nkxeizEXF45BbmtwUHSllpadbWk
 Ds47i098M/s65m3l657v3aIGInhrZyS5268C4QIlRu8nwjqNBnpAWjBt0pbSqg9iefSc3JbAwUz
 N/BOiA6rcXxGTfrIVDf5LZ0ZJPdzF9xANnLtWZHZFuptu8Bwm6OM5aA=
X-Received: by 2002:a5d:47a2:0:b0:391:23de:b1b4 with SMTP id
 ffacd0b85a97d-3997f9371e5mr19882190f8f.45.1742979239154; 
 Wed, 26 Mar 2025 01:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHixDskNz2Fs9M82EjfBqJVOPv5zIRAHSJwZZ/MkXXJsiY7a6M/X6GQpit8gX71aGZ0tpmyWg==
X-Received: by 2002:a5d:47a2:0:b0:391:23de:b1b4 with SMTP id
 ffacd0b85a97d-3997f9371e5mr19882167f8f.45.1742979238726; 
 Wed, 26 Mar 2025 01:53:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b260fsm15940735f8f.43.2025.03.26.01.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:53:58 -0700 (PDT)
Message-ID: <8c92248a-c433-4842-a1a5-768a4ad315b0@redhat.com>
Date: Wed, 26 Mar 2025 09:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/format-helper: Add generic conversion to 8-bit
 formats
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bYMCGTiNfT3iEs9gL9b9xGmUw1wsarUmigQ6n2Qc7A4_1742979240
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
> Add drm_fb_xfrm_line_32to8() to implement conversion from 32-bit
> pixels to 8-bit pixels. The pixel-conversion is specified by the
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
>   drivers/gpu/drm/drm_format_helper.c   | 38 ++++++++++-----------------
>   drivers/gpu/drm/drm_format_internal.h | 17 ++++++++++++
>   2 files changed, 31 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index aecf55c1fc6b..a926aa6671fc 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -246,6 +246,18 @@ static int drm_fb_xfrm(struct iosys_map *dst,
>   				     xfrm_line);
>   }
>   
> +static __always_inline void drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
> +						   unsigned int pixels,
> +						   u32 (*xfrm_pixel)(u32))
> +{
> +	u8 *dbuf8 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	const __le32 *send32 = sbuf32 + pixels;
> +
> +	while (sbuf32 < send32)
> +		*dbuf8++ = xfrm_pixel(le32_to_cpup(sbuf32++));
> +}
> +
>   static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf,
>   						    unsigned int pixels,
>   						    u32 (*xfrm_pixel)(u32))
> @@ -411,17 +423,7 @@ EXPORT_SYMBOL(drm_fb_swab);
>   
>   static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	u8 *dbuf8 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		dbuf8[x] = ((pix & 0x00e00000) >> 16) |
> -			   ((pix & 0x0000e000) >> 11) |
> -			   ((pix & 0x000000c0) >> 6);
> -	}
> +	drm_fb_xfrm_line_32to8(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb332);
>   }
>   
>   /**
> @@ -879,19 +881,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010);
>   
>   static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	u8 *dbuf8 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -
> -	for (x = 0; x < pixels; x++) {
> -		u32 pix = le32_to_cpu(sbuf32[x]);
> -		u8 r = (pix & 0x00ff0000) >> 16;
> -		u8 g = (pix & 0x0000ff00) >> 8;
> -		u8 b =  pix & 0x000000ff;
> -
> -		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> -		*dbuf8++ = (3 * r + 6 * g + b) / 10;
> -	}
> +	drm_fb_xfrm_line_32to8(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_r8_bt601);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
> index 4f20b63cb6f6..9f857bfa368d 100644
> --- a/drivers/gpu/drm/drm_format_internal.h
> +++ b/drivers/gpu/drm/drm_format_internal.h
> @@ -35,6 +35,23 @@
>    * Conversions from XRGB8888
>    */
>   
> +static inline u32 drm_pixel_xrgb8888_to_r8_bt601(u32 pix)
> +{
> +	u32 r = (pix & 0x00ff0000) >> 16;
> +	u32 g = (pix & 0x0000ff00) >> 8;
> +	u32 b =  pix & 0x000000ff;
> +
> +	/* ITU-R BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> +	return (3 * r + 6 * g + b) / 10;
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_rgb332(u32 pix)
> +{
> +	return ((pix & 0x00e00000) >> 16) |
> +	       ((pix & 0x0000e000) >> 11) |
> +	       ((pix & 0x000000c0) >> 6);
> +}
> +
>   static inline u32 drm_pixel_xrgb8888_to_rgb565(u32 pix)
>   {
>   	return ((pix & 0x00f80000) >> 8) |

