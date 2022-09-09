Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4995B390B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 15:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB8D10ED58;
	Fri,  9 Sep 2022 13:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6482D10ED58
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 13:32:48 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so1054457oti.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fAZyWvk9aIg6HNZZ2qBZvOJO5tyWSXJY6s5pUv95Q0o=;
 b=ftxAh0gsbgkhrMX8rdkibCcKLrQX3RBh0B+cT1gdD3220HnP0VETXI7zIF5k5CN5Vj
 IjxTa8QuYmbtyaLxc6q76DDucWSA0RYEbncJESudDEV1D/HtcEmIhSvxJ4kze5Ws8zk7
 3sne/+dhsQxi54RnakQe3QCflN4019s/aq5PxxRjmQrQA88BX7/3rIjgw4XFeIma/oK1
 xrVObDYyvf4LoOKTTXDOu4yAM9nnGwGDiZ1f81ocOV3LMAhD/pz+v26g6RnC7UG/b0dF
 SSgbXJnSq3OUGqmwQVvapztkJ8m4C38Z/7wBXbwkb+d70vh6NY0ZI6Z3gcxx3d+Ol3u8
 NR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fAZyWvk9aIg6HNZZ2qBZvOJO5tyWSXJY6s5pUv95Q0o=;
 b=O7MB2lJyqqCUypR2tr0XDxdHuBjy9vUwjey1BT0ziX9SanANq4US/aalwDL6i8t3d2
 GppZ7ZaaZKdvsc3SJSUc07r6i2R7mehhqCx1t2kora8EvFIOmvYSBrlnzjnEwVETGXiY
 //tG5pCjKagf0nDEzyiFMRwx49CW7OP4OfNZ5467NyYe4muPLa2jaGChXpYt7mmFfRHZ
 RNuTKmGudhHXgHGn+d2ICLX+Hv5R5k5xgGUJq+mzZPNsjEaHscafcyksPcWMhNw5nfqq
 iijwhecXbRud+mkja2y1qWLRHnFeLLObU3h5Wqj4h70+3zFhEwQkE61dmi7yk1VhmWRr
 VUhg==
X-Gm-Message-State: ACgBeo3DY1SpnmCtsZTjFb2ZlZmz9YI0kgUTvKgMr50kbSBwlrIOFd1z
 nFs0+Yy8DhlG/6hUIFlTdtPzH6eGA7Vimz1DIXg=
X-Google-Smtp-Source: AA6agR60is4ZKlehqzgH5AzaBmaZWtiJzhV8cR+SiPOLEK6lelCHPk7QCiFG75dGkQ36jQBbu7pD5ykSdsyyBvkF/wE=
X-Received: by 2002:a9d:12ce:0:b0:654:9bf:94ee with SMTP id
 g72-20020a9d12ce000000b0065409bf94eemr2655489otg.123.1662730367545; Fri, 09
 Sep 2022 06:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220909114133.267689-1-mwen@igalia.com>
In-Reply-To: <20220909114133.267689-1-mwen@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 09:32:36 -0400
Message-ID: <CADnq5_O8uJT7_LBCEQTVX=p_3Eo1yVQFDSei_rumSbSn7_gGew@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: fix 32bit compilation error by replacing macros
To: Melissa Wen <mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 9, 2022 at 7:42 AM Melissa Wen <mwen@igalia.com> wrote:
>
> Replace vkms_formats macros for fixed-point operations with functions
> from drm/drm_fixed.h to do the same job and fix 32-bit compilation
> errors.
>
> Fixes: a19c2ac9858 ("drm: vkms: Add support to the RGB565 format")
> Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 53 +++++++++++------------------
>  1 file changed, 19 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 300abb4d1dfe..ddcd3cfeeaac 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -1,27 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0+
>
> -#include <drm/drm_rect.h>
> +#include <linux/kernel.h>
>  #include <linux/minmax.h>
> +#include <drm/drm_rect.h>
> +#include <drm/drm_fixed.h>
>
>  #include "vkms_formats.h"
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
>  static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>  {
>         return frame_info->offset + (y * frame_info->pitch)
> @@ -137,19 +122,19 @@ static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
>         int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>                                stage_buffer->n_pixels);
>
> -       s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
> -       s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
> +       s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), 31);
> +       s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), 63);
>
>         for (size_t x = 0; x < x_limit; x++, src_pixels++) {
>                 u16 rgb_565 = le16_to_cpu(*src_pixels);
> -               s32 fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
> -               s32 fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
> -               s32 fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
> +               s32 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> +               s32 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> +               s32 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>
>                 out_pixels[x].a = (u16)0xffff;
> -               out_pixels[x].r = FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
> -               out_pixels[x].g = FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
> -               out_pixels[x].b = FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
> +               out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> +               out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> +               out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
>         }
>  }
>
> @@ -248,17 +233,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>         int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>                             src_buffer->n_pixels);
>
> -       s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
> -       s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
> +       s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), 31);
> +       s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), 63);
>
>         for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
> -               s32 fp_r = INT_TO_FIXED(in_pixels[x].r);
> -               s32 fp_g = INT_TO_FIXED(in_pixels[x].g);
> -               s32 fp_b = INT_TO_FIXED(in_pixels[x].b);
> +               s32 fp_r = drm_int2fixp(in_pixels[x].r);
> +               s32 fp_g = drm_int2fixp(in_pixels[x].g);
> +               s32 fp_b = drm_int2fixp(in_pixels[x].b);
>
> -               u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
> -               u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
> -               u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
> +               u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
> +               u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> +               u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
>
>                 *dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
>         }
> --
> 2.35.1
>
