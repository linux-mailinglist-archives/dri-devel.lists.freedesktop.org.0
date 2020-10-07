Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD6285C67
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 12:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3B86E23F;
	Wed,  7 Oct 2020 10:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4FF6E23F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 10:06:45 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id m11so1611317otk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 03:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FXyl0UgurwxyLuUIkQMCFeSWyFvGgXaLaSwzkPaBkpk=;
 b=R9tD3DdCMSZDZ5WwC/5gIKKZndNXWY6OZjNWoxwCaCIa3UbGwGd4/OR5cFtRIV+Hf4
 G47QhxXTI/FiaUusw2qLpB5eQAKol2Yo2E/Xn9o9NDt+7+zpeB1c9SrSq8Ad4I0G3wDg
 8Lekzp2kNtZlRHFaqOYDIsP385qmpf6cMsfqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FXyl0UgurwxyLuUIkQMCFeSWyFvGgXaLaSwzkPaBkpk=;
 b=V25m61e5+ek+FyLobv4RMlhJ7+hz9RvYoz3+VmyFxc2riU4RkD9FPbNBu+0wKk/y6I
 9CWUxvxd5M3YBtZ2GZ9dau4RTEfCWM4J5M0sgqecUP9BQOcRGzdYIt0+QPXk/Bh34gmB
 kJQOJUbDypPYawVXchTY+dvgRzmQefhNVG9cDmAKFNE1ZeAug+fByskOCvpfWCw9Tdyw
 sbwiY0sMSw47huyCZhxGoyTLkfwL/SToJUbEY7LVBSgyYgjzaeumczeJDl/rwFzGXAWt
 qCCT+gT7n7xBDhoelrexYeGFPYT81M8Qp1e9pkrVzyRRX7BXQPbi0krDaGDtsQc4LydO
 9jWw==
X-Gm-Message-State: AOAM532cOCeW+3HG3t65mVg21rm+GnYO+5fIQlEzRa1QsJduPnxdy4L0
 i6zfptLXjt4VSMJFYbE9D2zCsGvGf4+DpYmyPQSczg==
X-Google-Smtp-Source: ABdhPJyTcsoFNvuCh/cejrXxOixaiBBuesPOk0gqUkmdbG5dVwok3f70fWkkCBRI3SLyoPEuoAzRGQ9NuOx+3m2aKn8=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr1314124otj.303.1602065205130; 
 Wed, 07 Oct 2020 03:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201007092725.13300-1-matteo.franchin@arm.com>
In-Reply-To: <20201007092725.13300-1-matteo.franchin@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 7 Oct 2020 12:06:34 +0200
Message-ID: <CAKMK7uHZs7uKMbbQhn43-u7Y3_KANA6tU25jnOZkzj3h_7dmgg@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add AXBXGXRX106106106106 format
To: Matteo Franchin <matteo.franchin@arm.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 11:29 AM Matteo Franchin <matteo.franchin@arm.com> wrote:
>
> Add ABGR format with 10-bit components packed in 64-bit per pixel.
> This format can be used to handle
> VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 on little-endian
> architectures.
>
> Signed-off-by: Matteo Franchin <matteo.franchin@arm.com>

So is this essentially 16 bit, with the lowest 6 bits in each channel
ignored? What exactly is this used for where the full 16bit format
doesn't work?
-Daniel

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 1 +
>  include/uapi/drm/drm_fourcc.h | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 722c7ebe4e88..bba03fcb016d 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -202,6 +202,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>                 { .format = DRM_FORMAT_XBGR16161616F,   .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
>                 { .format = DRM_FORMAT_ARGB16161616F,   .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_ABGR16161616F,   .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> +               { .format = DRM_FORMAT_AXBXGXRX106106106106,    .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_RGB888_A8,       .depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_BGR888_A8,       .depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_XRGB8888_A8,     .depth = 32, .num_planes = 2, .cpp = { 4, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f327801267..76eedba52b77 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -155,6 +155,13 @@ extern "C" {
>  #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
>  #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
>
> +/*
> + * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
> + * of unused padding per component:
> + * [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian
> + */
> +#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0')
> +
>  /* packed YCbCr */
>  #define DRM_FORMAT_YUYV                fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
>  #define DRM_FORMAT_YVYU                fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
> --
> 2.17.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
