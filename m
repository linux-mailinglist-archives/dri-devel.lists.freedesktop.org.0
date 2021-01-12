Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB192F2A8B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 10:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745EA6E160;
	Tue, 12 Jan 2021 09:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226116E15E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 09:04:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id i63so1187084wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 01:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YPvEj8J2/AslYNyHN3mUqMeHRZQHi9j7tCjihlYckRM=;
 b=kqlQ0F50yaVF1QjoyzH1nLZ1RvUKNdASbt+dRn+QYxmbgboBcQBylWvlu8wehh3QJa
 jLjI9XRSPrGLOtU0yz/WxKTODD9wKwP6Ju+fCR1HQXx866ne6tlzV1TOg1PXtQ8ScC/I
 yKonG0HjT3ajx4Wqhz8ItAJ/ESWGMY3fVl6VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YPvEj8J2/AslYNyHN3mUqMeHRZQHi9j7tCjihlYckRM=;
 b=jKoQ5NV7i9Tk75a3xR+nARLImrfex54LAehtUYi9ysPGdk3BndoLyvaHdHWMGjXXUy
 KYL2Kbpp0Yo+45rlc5MNLXBjNm+ZAqQ24z5Vdh8ws2oWgwkWzkQtT0nGg+FwtfICeVER
 JON7vMQYgoP4hQwJgZSdfEcZuhU5GsBIZWR5aygfJTb0SzwLXxEYSIh2SVCjISZVqWJO
 qoTZGvp5xxj41h0GOS9XIVSmu1xa7U/jCfVJtNInQNk8SsHwxdtbukZ6J1gMOUTdC8bh
 RcWaaNw096/ttQiaZu9Upg2exGncISWZBVCuOwaajK8+rOXqOE1jeWqBHNtbTu1UCA1A
 C+MQ==
X-Gm-Message-State: AOAM531DygoSJ/txFX1Ew2S5mJJWnbckmucki/ZZ1UsnbPTRdvuzNwfu
 tqWroj3YzFfa1TqRutPVY4Mo8w==
X-Google-Smtp-Source: ABdhPJzkb1P4k4zFnpfFRe7VCbwFDMbAMSjrsW/QYpuyu0Au8MnkNUbWZhCZBH0ZyxAqo8ZwJcFGhA==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr2489027wmg.109.1610442266894; 
 Tue, 12 Jan 2021 01:04:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm3034255wme.11.2021.01.12.01.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:04:26 -0800 (PST)
Date: Tue, 12 Jan 2021 10:04:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/6] drm: Merge CONFIG_DRM_VM into CONFIG_DRM_LEGACY
Message-ID: <X/1mGNKVqmXOT8u4@phenom.ffwll.local>
References: <20210112081035.6882-1-tzimmermann@suse.de>
 <20210112081035.6882-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112081035.6882-5-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 09:10:33AM +0100, Thomas Zimmermann wrote:
> CONFIG_DRM_VM gets selected by CONFIG_DRM_LEGACY, but nothing else. So
> remove it and build drm_vm.o as part of CONFIG_DRM_LEGACY.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/Kconfig      | 5 -----
>  drivers/gpu/drm/Makefile     | 3 +--
>  drivers/gpu/drm/drm_legacy.h | 2 +-
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0973f408d75f..8bf103de1594 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -214,10 +214,6 @@ config DRM_GEM_SHMEM_HELPER
>  	help
>  	  Choose this if you need the GEM shmem helper functions
>  
> -config DRM_VM
> -	bool
> -	depends on DRM && MMU
> -
>  config DRM_SCHED
>  	tristate
>  	depends on DRM
> @@ -391,7 +387,6 @@ source "drivers/gpu/drm/xlnx/Kconfig"
>  menuconfig DRM_LEGACY
>  	bool "Enable legacy drivers (DANGEROUS)"
>  	depends on DRM && MMU

Ah we already depend upon MMU here, so should be all good.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -	select DRM_VM
>  	help
>  	  Enable legacy DRI1 drivers. Those drivers expose unsafe and dangerous
>  	  APIs to user-space, which can be used to circumvent access
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ba0ecb7756c6..926adef289db 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -21,9 +21,8 @@ drm-y       :=	drm_auth.o drm_cache.o \
>  		drm_managed.o drm_vblank_work.o
>  
>  drm-$(CONFIG_DRM_LEGACY) += drm_bufs.o drm_context.o drm_dma.o drm_legacy_misc.o drm_lock.o \
> -		drm_memory.o drm_scatter.o
> +		drm_memory.o drm_scatter.o drm_vm.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
> -drm-$(CONFIG_DRM_VM) += drm_vm.o
>  drm-$(CONFIG_COMPAT) += drm_ioc32.o
>  drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
>  drm-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_gem_shmem_helper.o
> diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
> index 1be3ea320474..f71358f9eac9 100644
> --- a/drivers/gpu/drm/drm_legacy.h
> +++ b/drivers/gpu/drm/drm_legacy.h
> @@ -127,7 +127,7 @@ static inline void drm_legacy_master_rmmaps(struct drm_device *dev,
>  static inline void drm_legacy_rmmaps(struct drm_device *dev) {}
>  #endif
>  
> -#if IS_ENABLED(CONFIG_DRM_VM) && IS_ENABLED(CONFIG_DRM_LEGACY)
> +#if IS_ENABLED(CONFIG_DRM_LEGACY)
>  void drm_legacy_vma_flush(struct drm_device *d);
>  #else
>  static inline void drm_legacy_vma_flush(struct drm_device *d)
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
