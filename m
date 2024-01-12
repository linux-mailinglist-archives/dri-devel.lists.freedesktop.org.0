Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FB82C140
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C1E10EB1B;
	Fri, 12 Jan 2024 14:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8501A10EB1B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:00:07 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5578cb9645bso1833246a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 06:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705068006; x=1705672806; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s081Z7uB4C4C/qsW1695P+3lZcW0PC0sd5TEVtIQoNE=;
 b=W4qXCngP74KaJpossZ2lcUfFt/9yJxuPeLVoRBuSWEdc5NJNY5DyUuBADXyNOUDvF9
 enLQ+zORV5zcyQn3nCpacyKwiScX0p3sZYN3XVuRiN5cYVQcrdgSu8VtILgvcS/+JYpU
 3m+HH7+vq42/zMM2Pj1L37Gw6apkbQH2AAp2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705068006; x=1705672806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s081Z7uB4C4C/qsW1695P+3lZcW0PC0sd5TEVtIQoNE=;
 b=P0tyUpH1e+RkB0tJClZP+XZgiElF5Hx/EhyQxutK1/xdT+OIn+uj1W3ylFvUfPS7Oz
 lP+9sY96bNqmdEBkr/RlKwiOF8E+Z+QcECTqkOXj0tDfJE5R9xxwL+r0h7hurJSRwwgy
 txfMTWJW6V9uvgOXw4QrnVLCQqa9PzwZCyioAVsY4prYnSjBnUnMcbOnfBaK9araj9mJ
 Sqjm/WjKWXjlhEC7dH9LXYPE5Bc0k9ImQe0mNLx/Iq1NM9mUqdMnwdts/SXEGzlDqHxN
 776J0z6mWAKmGRRqWa3R7IAXbDrgq1pSnhh88sG9m7429JI8iEV3eiCZoR/xSz4ij8IL
 lh5g==
X-Gm-Message-State: AOJu0Yz8NrFmODINjRfGlnoo51iTzSRJDkmo6A30uf6xsoxUKZHY14+x
 aAGkFD042OWyJIgdP+xfoLEC8uFqJxxl0Q==
X-Google-Smtp-Source: AGHT+IEuK327wSqql/aEsBP73IsakEcNkKafZeTJiY8RbCOFb3lrOjeM8CKBYjEDBIYI4moHeGD3ZA==
X-Received: by 2002:a05:6402:518:b0:558:8086:a384 with SMTP id
 m24-20020a056402051800b005588086a384mr1084631edv.4.1705068005877; 
 Fri, 12 Jan 2024 06:00:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a0564020f1000b00558d741d5dcsm556485eda.18.2024.01.12.06.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:00:05 -0800 (PST)
Date: Fri, 12 Jan 2024 15:00:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [RFC][PATCH v7 0/9] drm/panic: Add a drm panic handler
Message-ID: <ZaFF4lhL5dHmWtuh@phenom.ffwll.local>
References: <20240104160301.185915-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-1-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 mripard@kernel.org, gpiccoli@igalia.com, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 05:00:44PM +0100, Jocelyn Falempe wrote:
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
> 
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
> 
> This is a proof of concept, and works with simpledrm, mgag200, ast, and imx using a new get_scanout_buffer() api
> 
> To test it, make sure you're using the simpledrm driver, and trigger a panic:
> echo c > /proc/sysrq-trigger

Uh this is not great for testing in CI, we need something better. A
drm-specific solution would be a debugfs file that triggers the panic
dumping (which is the reason we should correctly unlock all locks we've
taken too).

Even better would be if the core code provides this infrastructure, so
that ideally we could exercise running from an nmi context. For the drm
testing the best we can probably do is disable local interrupts or maybe
run from a timer that immediately fires.

I think adding that test infrastructure plus an igt that exercises should
be done as part of merging the initial version. Otherwise there's just no
way we can make sure that this code doesn't immediately bitrot like all
the previous panic handlers.

Cheers, Sima

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
> 
> Best regards,
> 
> Jocelyn Falempe (9):
>   drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
>   drm/panic: Add a drm panic handler
>   drm/plane: Add drm_for_each_primary_visible_plane macro
>   drm/panic: Add drm_panic_is_format_supported()
>   drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
>   drm/simpledrm: Add drm_panic support
>   drm/mgag200: Add drm_panic support
>   drm/ast: Add drm_panic support
>   drm/imx: Add drm_panic support
> 
>  drivers/gpu/drm/Kconfig                  |  23 ++
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/ast/ast_drv.c            |  26 +-
>  drivers/gpu/drm/drm_drv.c                |   8 +
>  drivers/gpu/drm/drm_fb_dma_helper.c      |  55 +++
>  drivers/gpu/drm/drm_format_helper.c      | 432 ++++++++++++++++++-----
>  drivers/gpu/drm/drm_panic.c              | 382 ++++++++++++++++++++
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c |   2 +
>  drivers/gpu/drm/mgag200/mgag200_drv.c    |  22 ++
>  drivers/gpu/drm/tiny/simpledrm.c         |  15 +
>  include/drm/drm_drv.h                    |  21 ++
>  include/drm/drm_fb_dma_helper.h          |   4 +
>  include/drm/drm_format_helper.h          |   9 +
>  include/drm/drm_panic.h                  | 101 ++++++
>  include/drm/drm_plane.h                  |  15 +
>  15 files changed, 1033 insertions(+), 83 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_panic.c
>  create mode 100644 include/drm/drm_panic.h
> 
> 
> base-commit: 50a3c772bd927dd409c484832ddd9f6bf00b7389
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
