Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86BE94CCB1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 10:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D2110E87A;
	Fri,  9 Aug 2024 08:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UnPmbTi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF0D10E87F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 08:50:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5a4d5b2c295so164803a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193451; x=1723798251; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lQRObQqCFZFZYE2PihhMktYKpOnSYLhGhrUknpNXXAI=;
 b=UnPmbTi/T6qh3cqfZ1RCeV+afFtyMSR0UNKFW0LI/2NaKzKs5ZRmjUUFi8DQnp4Ro7
 86BtIGknpkp/SnplOIacdBqJLB62yVfg6BZ+2Oyok/+NSDcf2WdbqhOlue+YaR7NNFb6
 0cHjeuRTkEfnvgInrXR18ZMGJr416Dgg/wyAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193451; x=1723798251;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lQRObQqCFZFZYE2PihhMktYKpOnSYLhGhrUknpNXXAI=;
 b=Ilg1HiTH4/szfuDdDy/wLXP/zRPSKWjcQ/qIk8xUGV8yd96jIioUZ5KBX4NGEnbo04
 yFCVJb81UYKk9Pp7fLGLCnFFcKnFKPbEwS28P175B5WyrrKJQhD+5Uz6aOn/Nbftyjs7
 XJ/IGgBjzsWRAS4xFDWPHMu3Ah5Rc/L+q8MYiRq8y6WBIXEFvhlI25N0mz1b2G+ikhFE
 K3mrcqsynN2hMx5227iSfRbpKh1VJnlEb6Cjf6h6wRUugUF8E/52dDsGIkyhZsBOQ0jI
 UasY0zuXmUcmMFwdu8l054UG+3TUt6GAgRKXRlHfUVQLK6bqzLqPUyuH06lGd3ZmQtu4
 Xx5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpiqR/ikZaBkf4umE2CFHm6D+XPrOBAO68AfDtTnchlcv2JwUdvO5ghfGgDWMBFyHKYORANw652bRSxgyAXe6QyR69zq69+n085ehP6xQP
X-Gm-Message-State: AOJu0Yzijkv8SXpu7SArM+NVBo8c2wbopiVYR702UpOKv3+VcRQsL2bV
 ygR8ULzY+bdHUo4NAOeZuvCfJK/KHWTrJHWp85Q0jMekB1I5lVEzmB7ZRzxqa7M=
X-Google-Smtp-Source: AGHT+IHRygqvDnnywjWcgRJH7u2cR+TWxwLzqYu/6B0OD8g3Hvi3p2zslutluZFIgpQTKdZKkV92Bg==
X-Received: by 2002:a17:907:3e21:b0:a80:a1b0:12ec with SMTP id
 a640c23a62f3a-a80aa5a3e45mr40641366b.3.1723193450825; 
 Fri, 09 Aug 2024 01:50:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d45418sm820836066b.113.2024.08.09.01.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:50:50 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:50:48 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 6/8] drm/fbdev-helper: Remove
 drm_fb_helper_output_poll_changed()
Message-ID: <ZrXYaFi60qEdNE4p@phenom.ffwll.local>
References: <20240807084539.304014-1-tzimmermann@suse.de>
 <20240807084539.304014-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807084539.304014-7-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Wed, Aug 07, 2024 at 10:41:38AM +0200, Thomas Zimmermann wrote:
> The function is unused. Remove it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Without the next patch to remove ->lastclose there's some confusion text
left in the DOC: section in drm_fb_helper.c, but no point to split that up
perfectly imo. Was just trying to find it and didn't find it only looking
at the poll_changed patches ...
-Sima

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 15 ---------------
>  include/drm/drm_fb_helper.h     |  6 ------
>  2 files changed, 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index f6667dfba8a2..3cafb28236f7 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2015,18 +2015,3 @@ void drm_fb_helper_lastclose(struct drm_device *dev)
>  
>  }
>  EXPORT_SYMBOL(drm_fb_helper_lastclose);
> -
> -/**
> - * drm_fb_helper_output_poll_changed - DRM mode config \.output_poll_changed
> - *                                     helper for fbdev emulation
> - * @dev: DRM device
> - *
> - * This function can be used as the
> - * &drm_mode_config_funcs.output_poll_changed callback for drivers that only
> - * need to call drm_fbdev.hotplug_event().
> - */
> -void drm_fb_helper_output_poll_changed(struct drm_device *dev)
> -{
> -	drm_fb_helper_hotplug_event(dev->fb_helper);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_output_poll_changed);
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 375737fd6c36..699f2790b9ac 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -271,9 +271,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
>  int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
>  int drm_fb_helper_debug_enter(struct fb_info *info);
>  int drm_fb_helper_debug_leave(struct fb_info *info);
> -
>  void drm_fb_helper_lastclose(struct drm_device *dev);
> -void drm_fb_helper_output_poll_changed(struct drm_device *dev);
>  #else
>  static inline void drm_fb_helper_prepare(struct drm_device *dev,
>  					 struct drm_fb_helper *helper,
> @@ -401,10 +399,6 @@ static inline int drm_fb_helper_debug_leave(struct fb_info *info)
>  static inline void drm_fb_helper_lastclose(struct drm_device *dev)
>  {
>  }
> -
> -static inline void drm_fb_helper_output_poll_changed(struct drm_device *dev)
> -{
> -}
>  #endif
>  
>  #endif
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
