Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAF8455E5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 12:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1E110EDCB;
	Thu,  1 Feb 2024 11:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046110ED40
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706785284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JawMgEIiT/PEKUp7TUjhzkvosce44Bq1Iiwtt0fM7MA=;
 b=HK3WN9WMSL/0+8ZbzeLGxFteL5+9KcjXbxmQIty8bC0MwBKnyozYa3qhd6ZNdA+y2W36eQ
 XSnJRECHnqF6AKEPdWr3F3bfQ3A9fRtQzW1Ov50BG17iZpULDEuxsUHwQQD2z1dMsdJNyr
 O32EzW2Lgb3q73xkVqrpstyKW90tZCw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-tdqgvxbsO_-471St7TTRLQ-1; Thu, 01 Feb 2024 06:01:23 -0500
X-MC-Unique: tdqgvxbsO_-471St7TTRLQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33b1799e433so182200f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 03:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706785282; x=1707390082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JawMgEIiT/PEKUp7TUjhzkvosce44Bq1Iiwtt0fM7MA=;
 b=q9t13OzIHQl4i913l1rbh1LH7FuCeQSadGzN2qaaMpjskjdFfiPo/XI5rVapyhckmd
 uKLa+Zapbr6fTYxxaWAnfGRMzxpRDqTcq3heYamMsn9P5KBeLVnk9kDz9HOKG9O27M0X
 Y7uWT4HV8c6B39VtJPXlT6jAFCT7u0hujJ3YXTmx7lWAozeF6OpjrUlZQ9VG3sryD9h+
 E9muAGYYEGBIdeXoOAhiUKgxgvsxfwzCZy6hqe0Krd59q41znEkG0k1HW1XSGpVA93Uw
 rKp3ROGC1De7tR4jJmT+rkqJo+93mv/bij5JTGALD6wYfHEeL1y6wyBPrlokBvT+SfQ3
 ZP7w==
X-Gm-Message-State: AOJu0YyQd3CgMPtnn3PYKnlR5s0M8CfFHNSainlQHgZYQjdXddqWoAWr
 md957/xQlIek/aNfll5GcLtg+kD2du9Hd+mcHd6/dKKp8ndzd9NTkt2oCMYFpb2itumjHyXnZwC
 4fmV5GQkAus7rGU2+aZeZl/GKgxBQCGk0+2eY2Hj3EnPvHrB3ARez0GuqBAbLzgUNyg==
X-Received: by 2002:adf:f552:0:b0:339:58fc:4934 with SMTP id
 j18-20020adff552000000b0033958fc4934mr3683563wrp.2.1706785281985; 
 Thu, 01 Feb 2024 03:01:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrLHEgXRGEKhTk7MOaGsMC7MKo/52DXHHeCngHtHYX/FPvydC8sWhkUrbbVBeD56BUxbqsEg==
X-Received: by 2002:adf:f552:0:b0:339:58fc:4934 with SMTP id
 j18-20020adff552000000b0033958fc4934mr3683546wrp.2.1706785281659; 
 Thu, 01 Feb 2024 03:01:21 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXSA7TUND4L0iqLxkD7J0n6DFNk1WcaRGL4qoptu4S3mXeHZ46t+UUeaumgRECEJEn59SvxDakdaaQO2Dh2syG5//4=
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ci7-20020a5d5d87000000b0033b07f428b6sm3238461wrb.0.2024.02.01.03.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 03:01:21 -0800 (PST)
Message-ID: <f9dabb16-c56d-4d1b-8cf0-12ff902d4257@redhat.com>
Date: Thu, 1 Feb 2024 12:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] [RFC] drm/format-helper: Introduce drm_pixmap, font
 support and filling
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com
References: <20240130100714.12608-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for taking the time to write this series.

I find the drm_pixmap is a nice improvement, and simplifies a bit the code.

Regarding the font blit, I'm not convinced by this approach.
I don't see the benefit of using the same function between fonts and 
framebuffer copy, as it's unlikely to have 16bit or 32bit fonts in the 
kernel, or to have monochrome buffer from userspace. And the big format 
switch will dispatch to different functions, so there is almost no code 
sharing between both paths.

Also for each format supported, you now need 2 functions for 
xrgb8888_to_yyyyy blit, 2 functions for c1_to_yyyyy blit, and 2 
functions for fill_yyyyyy. That doesn't scale well, and there is a lot 
of duplication between those functions.

I prefer the way Noralf Thronnes has done it in [1] and only consider 
the pixel width.

[1] 
https://lore.kernel.org/dri-devel/20190311174218.51899-2-noralf@tronnes.org/

Best regards,

-- 

Jocelyn

On 30/01/2024 10:53, Thomas Zimmermann wrote:
> This RFC patchset implements various features required for DRM panic
> handling [1] and should (for now) be seen in that context.
> 
> Most of all, the patchset replaces struct drm_framebuffer with struct
> drm_pixmap in the format-conversion helpers. DRM pixmap represents a
> source of pixel data for the blitting operations. Patches 1 to 19
> update the interface, implementation and all of the callers. These
> patches could be useful even without DRM panic handling.
> 
> With struct drm_pixmap in place, patches 20 to 22 implement rudimentary
> support for blitting font data. The pixmap refers to a character's glyph,
> which the blit routines write to the destination memory. An example on
> blitting strings is given in patch 20's commit description.
> 
> Patch 23 adds rudimentary support for fill operations. The design is
> based on blitting, but blits the same color into each pixel.
> 
> [1] https://patchwork.freedesktop.org/series/122244/
> 
> Thomas Zimmermann (23):
>    drm/format-helper: Add struct drm_pixmap
>    drm/format-helper: Use struct drm_pixmap for drm_fb_memcpy()
>    drm/format-helper: Streamline drm_fb_xfrm() implementations
>    drm/format-helper: Use struct drm_pixmap internally
>    drm/format-helper: Use struct drm_pixmap for drm_fb_swab()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_rgb332()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_rgb565()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_xrgb1555()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_argb1555()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_rgba5551()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_rgb888()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_argb8888()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_abgr8888()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_xbgr8888()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_xrgb2101010()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_argb2101010()
>    drm/format-helper: Use struct drm_pixmap for
>      drm_fb_xrgb8888_to_gray8()
>    drm/format-helper: Use struct drm_pixmap for drm_fb_xrgb8888_to_mono()
>    drm/format-helper: Use struct drm_pixmap for drm_fb_blit()
>    [DO NOT MERGE] drm/format-helper: Add font-support for DRM pixmap
>    [DO NOT MERGE] drm/format-helper: Add color palette
>    [DO NOT MERGE] drm/format-helper: Support blitting from C1 to XRGB8888
>    [DO NOT MERGE] drm/format-helper: Add drm_fb_fill() to fill screen
>      with color
> 
>   drivers/gpu/drm/ast/ast_mode.c                |   4 +-
>   drivers/gpu/drm/drm_format_helper.c           | 678 ++++++++++++------
>   drivers/gpu/drm/drm_mipi_dbi.c                |   9 +-
>   drivers/gpu/drm/gud/gud_pipe.c                |  24 +-
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
>   drivers/gpu/drm/solomon/ssd130x.c             |  12 +-
>   .../gpu/drm/tests/drm_format_helper_test.c    | 106 ++-
>   drivers/gpu/drm/tiny/cirrus.c                 |   6 +-
>   drivers/gpu/drm/tiny/ofdrm.c                  |   6 +-
>   drivers/gpu/drm/tiny/repaper.c                |   4 +-
>   drivers/gpu/drm/tiny/simpledrm.c              |   6 +-
>   drivers/gpu/drm/tiny/st7586.c                 |   4 +-
>   include/drm/drm_format_helper.h               | 116 ++-
>   14 files changed, 678 insertions(+), 305 deletions(-)
> 

