Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569F89ED4D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C74E11310F;
	Wed, 10 Apr 2024 08:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PNl35vW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD8A11310F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:12:06 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-516ced2f94cso2137345e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1712736725; x=1713341525; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q3oYOBRKQBHkkcYVh41TfES5BRiyGp7S6ZklzJS1yGE=;
 b=PNl35vW9h8X1lr5yv4mWJmJn1E9hbUkCoN20w5AE2ChorC0TyJjoHdYpvj936T+0bb
 On1WIF5qbe3q9EtPUJh7tfNiySJfXMyy71Aso4LlBDzlJype2SwNB7nNuGsg7D1tJ38A
 bJ8TbG9MVKyviF1fa7uF0XeFxvNPH3ODNxdq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712736725; x=1713341525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3oYOBRKQBHkkcYVh41TfES5BRiyGp7S6ZklzJS1yGE=;
 b=BsN9QR9Ie0lqU+GaSgVB94xNUXNMqzja/SrmzTnjgdFvtM48KhsnCl5WErfBcVcNNo
 nF4gTX+tlLDEnmTI0/fFuJ9Dimb4dwYh8VjL7bOlcQ7yyzgaGXElBAYWScUEWDtgTTM6
 ms8lWvHx1Co8/G4naKADAsNjuxM9XT0LLvJwR0rJiXvn9cRn8y6EuUQf5ibzLGwMRxWM
 nGZcY+pKid9eTm1KeN6NtPvYFrZtw0E6lTZTHmHRg1JSaK7G0xWJyBCGcFSDxFh8yuMl
 169Gk4GbXj/7KPG42FmtLVwygF0Iz2gdX3LvRvPPaDLOmsGKAGhgWhN2XM2gyMWBV368
 HA5A==
X-Gm-Message-State: AOJu0YxnwH8FMNkqZg7iCwFigLCWNZ5lw8EsvoE9MfNoxHLTNr2wmDS4
 SKo9978nz1B+s0p6y8qHvceAX1uIiqqZCDtLsXaRTjlXpNOAwKjBQySXiS+4S/o=
X-Google-Smtp-Source: AGHT+IECOk0/ih3sjZLuSrxj6Z4wK+s/cX/6+TzCKCBVV7ouHjXFHo4TiUe0ScvH5JMHwyf7uqPN7w==
X-Received: by 2002:a19:9153:0:b0:513:cfb8:8cb3 with SMTP id
 y19-20020a199153000000b00513cfb88cb3mr1238424lfj.1.1712736724756; 
 Wed, 10 Apr 2024 01:12:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c349500b0041680911b0fsm1499409wmq.30.2024.04.10.01.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:12:04 -0700 (PDT)
Date: Wed, 10 Apr 2024 10:12:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev, gpiccoli@igalia.com
Subject: Re: [PATCH v12 0/9] drm/panic: Add a drm panic handler
Message-ID: <ZhZJ0p5R4jUqrP9f@phenom.ffwll.local>
References: <20240409163432.352518-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409163432.352518-1-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Apr 09, 2024 at 06:30:39PM +0200, Jocelyn Falempe wrote:
> drm/panic: Add a drm panic handler
> 
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
> 
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
> 
> It works with simpledrm, mgag200, ast, and imx.
> 
> To test it, make sure you're using one of the supported driver, and trigger a panic:
> echo c > /proc/sysrq-trigger
> 
> or you can enable CONFIG_DRM_PANIC_DEBUG and echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0
> 
> Even if this is not yet useful, it will allows to work on more driver support, and better debug information to be added.
> 
> v2:
>  * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
>  * Add the panic reason to the panic message (Nerdopolis)
>  * Add an exclamation mark (Nerdopolis)
>  
> v3:
>  * Rework the drawing functions, to write the pixels line by line and
>  to use the drm conversion helper to support other formats.
>  (Thomas Zimmermann)
>  
> v4:
>  * Fully support all simpledrm formats using drm conversion helpers
>  * Rename dpanic_* to drm_panic_*, and have more coherent function name.
>    (Thomas Zimmermann)
>  * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>  * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>  * Add foreground/background color config option
>  * Fix the bottom lines not painted if the framebuffer height
>    is not a multiple of the font height.
>  * Automatically register the driver to drm_panic, if the function
>    get_scanout_buffer() exists. (Thomas Zimmermann)
>  * Add mgag200 support.
>  
> v5:
>  * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>    (Thomas Zimmermann)
>  * Also add drm_fb_fill() to fill area with background color.
>  * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
>  * Add a flush() callback for drivers that needs to synchronize the buffer.
>  * Add a void *private field, so drivers can pass private data to
>    draw_pixel_xy() and flush(). 
>  * Add ast support.
>  * Add experimental imx/ipuv3 support, to test on an ARM hw. (Maxime Ripard)
> 
> v6:
>  * Fix sparse and __le32 warnings
>  * Drop the IMX/IPUV3 experiment, it was just to show that it works also on
>    ARM devices.
> 
> v7:
>  * Add a check to see if the 4cc format is supported by drm_panic.
>  * Add a drm/plane helper to loop over all visible primary buffer,
>    simplifying the get_scanout_buffer implementations
>  * Add a generic implementation for drivers that uses drm_fb_dma. (Maxime Ripard)
>  * Add back the IMX/IPUV3 support, and use the generic implementation. (Maxime Ripard)
> 
> v8:
>  * Directly register each plane to the panic notifier (Sima)
>  * Replace get_scanout_buffer() with set_scanout_buffer() to simplify
>    the locking. (Thomas Zimmermann)
>  * Add a debugfs entry, to trigger the drm_panic without a real panic (Sima)
>  * Fix the drm_panic Documentation, and include it in drm-kms.rst
> 
> v9:
>  * Revert to using get_scanout_buffer() (Sima)
>  * Move get_scanout_buffer() and panic_flush() to the plane helper
>    functions (Thomas Zimmermann)
>  * Register all planes with get_scanout_buffer() to the panic notifier
>  * Use drm_panic_lock() to protect against race (Sima)
>  * Create a debugfs file for each plane in the device's debugfs
>    directory. This allows to test for each plane of each GPU
>    independently.
> v10:
>  * Move blit and fill functions back in drm_panic (Thomas Zimmermann).
>  * Simplify the text drawing functions.
>  * Use kmsg_dumper instead of panic_notifier (Sima).
>  * Use spinlock_irqsave/restore (John Ogness)
> 
> v11:
>  * Use macro instead of inline functions for drm_panic_lock/unlock (John Ogness)
> 
> v12:
>  * Use array for map and pitch in struct drm_scanout_buffer
>    to support multi-planar format later. (Thomas Zimmermann)
>  * Rename drm_panic_gem_get_scanout_buffer to drm_fb_dma_get_scanout_buffer
>    and build it unconditionally (Thomas Zimmermann)
>  * Better indent struct drm_scanout_buffer declaration. (Thomas Zimmermann)

On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

And apologies for the detours this patch set took and my part in the (too
many) revisions. I think we should land this and do anything more once
it's merged and we extend the panic support to more drivers.

Thanks a lot to you for seeing this through!

Cheers, Sima
> 
> 
> Best regards,
> 
> 
> Daniel Vetter (1):
>   drm/panic: Add drm panic locking
> 
> Jocelyn Falempe (8):
>   drm/panic: Add a drm panic handler
>   drm/panic: Add support for color format conversion
>   drm/panic: Add debugfs entry to test without triggering panic.
>   drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
>   drm/simpledrm: Add drm_panic support
>   drm/mgag200: Add drm_panic support
>   drm/imx: Add drm_panic support
>   drm/ast: Add drm_panic support
> 
>  Documentation/gpu/drm-kms.rst            |  12 +
>  drivers/gpu/drm/Kconfig                  |  32 ++
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/ast/ast_mode.c           |  18 +
>  drivers/gpu/drm/drm_atomic_helper.c      |   4 +
>  drivers/gpu/drm/drm_drv.c                |   5 +
>  drivers/gpu/drm/drm_fb_dma_helper.c      |  42 ++
>  drivers/gpu/drm/drm_panic.c              | 583 +++++++++++++++++++++++
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c  |  11 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.h    |   7 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c   |  18 +
>  drivers/gpu/drm/tiny/simpledrm.c         |  16 +
>  include/drm/drm_fb_dma_helper.h          |   4 +
>  include/drm/drm_mode_config.h            |  10 +
>  include/drm/drm_modeset_helper_vtables.h |  37 ++
>  include/drm/drm_panic.h                  | 157 ++++++
>  include/drm/drm_plane.h                  |   6 +
>  17 files changed, 961 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_panic.c
>  create mode 100644 include/drm/drm_panic.h
> 
> 
> base-commit: 935a92a1c400285545198ca2800a4c6c519c650a
> -- 
> 2.44.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
