Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C05B4F76
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 16:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6694E10E48E;
	Sun, 11 Sep 2022 14:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F363610E48E
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 14:45:09 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 c17-20020a4a8ed1000000b004452faec26dso1043831ool.5
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0vIafAUmfHKEkRBn1BJs65Ura+eUXhwSJOGqHqTk/x4=;
 b=NJS4McPgY7YVVhIfIV57csmvoqjvrU55j9D6Wc9iSqTEgRFy8j3qEAE1UjmXRz1U79
 4Htu424fqVQ7e9nJFgPrjdvwIRvzDt18q56G+QHX3nOlCO8JvI/Od8GOYQOIslX4yv5B
 A78rCHbCUulyAHTjhUZE1pqtbLRoxRdAeL26HmfT1WPX7bzaHTMqCNlLBsIOtfPP15hC
 uakI/GSkfR32eNOJOdjotsE2h3knKfnewnV6Yae/BSug5LUVoHMWkEpR0LCCBCVbnxk+
 NCX6uUAlnYzvhpOoOdp3HuPBUZY1DS22UOUG+J+oka0wiwItja82WIKmvLUZt96wRNY/
 3j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0vIafAUmfHKEkRBn1BJs65Ura+eUXhwSJOGqHqTk/x4=;
 b=WSG5rcTy5CtEP0DtlzAYN6UzcBY2hUpdPWBUIkNV2+E73TOY6JeH6BfPxPDBvs/cXa
 bJ6LGfoLd3YK9MXPJcTgr9w1hwnTwm3SMhFT0oNyDa1b8B9uPkgwNLUjD6gbu9VyKacH
 wpYSPS9FGBbTA6L1ryQ5+LmJz15awy6hsiNbPtJOYQgR2GVypmSAOMMWfpFy3w4RoGh1
 fhwPMGwbHbgwXs0BtEi/JR8eUYlXjE9KBMtrCbuNx/xQwnhwi9fU0iGJHuAYUNfwwwXT
 8TtTO942O0i9kBNOvdtQZMRbH0xGy1ZOQwur76hB9WWT3wTMWIj/06tEToCexYBvVyZ4
 qyOA==
X-Gm-Message-State: ACgBeo183Ey9xDHCnFgewBP7hhmfyUFOgbL5k6+vMThsxTEzUAWUUfcX
 v9LrvQ4jALNBqYzmTJE0t2k=
X-Google-Smtp-Source: AA6agR5eNz/JoNngMq46UrG0IzKQVetXwwpQIejkcORgK5yAtkWs02KET+QkcF3ofAoLDN9tHD6+zQ==
X-Received: by 2002:a05:6820:1a0d:b0:44b:f59:8354 with SMTP id
 bq13-20020a0568201a0d00b0044b0f598354mr7856325oob.92.1662907508924; 
 Sun, 11 Sep 2022 07:45:08 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:f684:ee06:25a5:3122:5cd3?
 ([2804:431:c7f5:f684:ee06:25a5:3122:5cd3])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a4a8246000000b0044b491ccf97sm2750663oog.25.2022.09.11.07.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 07:45:08 -0700 (PDT)
Message-ID: <5f6089e5-146a-78c7-6590-4ef0ec1ea043@gmail.com>
Date: Sun, 11 Sep 2022 11:45:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] drm/vkms: fix 32bit compilation error by replacing
 macros
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220910190303.682897-1-mwen@igalia.com>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220910190303.682897-1-mwen@igalia.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Igor Torrente <igormtorrente@gmail.com>

On 9/10/22 16:03, Melissa Wen wrote:
> Replace vkms_formats macro for fixed-point operations with functions
> from drm/drm_fixed.h to do the same job and fix 32-bit compilation
> errors.
> 
> v2:
> - don't cast results to s32 (Igor)
> - add missing drm_fixp2int conversion (Igor)
> 
> Fixes: a19c2ac9858 ("drm: vkms: Add support to the RGB565 format")
> Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com> (v1)
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com> (v1)
> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 53 +++++++++++------------------
>   1 file changed, 19 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 300abb4d1dfe..d4950688b3f1 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -1,27 +1,12 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   
> -#include <drm/drm_rect.h>
> +#include <linux/kernel.h>
>   #include <linux/minmax.h>
> +#include <drm/drm_rect.h>
> +#include <drm/drm_fixed.h>
>   
>   #include "vkms_formats.h"
>   
> -/* The following macros help doing fixed point arithmetic. */
> -/*
> - * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
> - * parts respectively.
> - *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
> - * 31                                          0
> - */
> -#define SHIFT 15
> -
> -#define INT_TO_FIXED(a) ((a) << SHIFT)
> -#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> SHIFT))
> -#define FIXED_DIV(a, b) ((s32)(((s64)(a) << SHIFT) / (b)))
> -/* This macro converts a fixed point number to int, and round half up it */
> -#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (SHIFT - 1))) >> SHIFT)
> -#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
> -#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
> -
>   static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>   {
>   	return frame_info->offset + (y * frame_info->pitch)
> @@ -137,19 +122,19 @@ static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
>   	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>   			       stage_buffer->n_pixels);
>   
> -	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
> -	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
> +	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> +	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
>   
>   	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
>   		u16 rgb_565 = le16_to_cpu(*src_pixels);
> -		s32 fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
> -		s32 fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
> -		s32 fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
> +		s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> +		s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> +		s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>   
>   		out_pixels[x].a = (u16)0xffff;
> -		out_pixels[x].r = FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
> -		out_pixels[x].g = FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
> -		out_pixels[x].b = FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
> +		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> +		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> +		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
>   	}
>   }
>   
> @@ -248,17 +233,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>   	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>   			    src_buffer->n_pixels);
>   
> -	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
> -	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
> +	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> +	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
>   
>   	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
> -		s32 fp_r = INT_TO_FIXED(in_pixels[x].r);
> -		s32 fp_g = INT_TO_FIXED(in_pixels[x].g);
> -		s32 fp_b = INT_TO_FIXED(in_pixels[x].b);
> +		s64 fp_r = drm_int2fixp(in_pixels[x].r);
> +		s64 fp_g = drm_int2fixp(in_pixels[x].g);
> +		s64 fp_b = drm_int2fixp(in_pixels[x].b);
>   
> -		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
> -		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
> -		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
> +		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
> +		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> +		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
>   
>   		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
>   	}

