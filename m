Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BC366055
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE9C6E8BF;
	Tue, 20 Apr 2021 19:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C56E8BF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:38:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u17so60072100ejk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMkfPDMRdyyJ+LeflfeuMfIbnpp3+QEBfrxfVMuJb0A=;
 b=qZPHzQyQCMCRF4gnmXoaOoci4QFkqPYegKngEamsno86xzSbDAOI3BvF2E+9VBiPVf
 uHWUt6F0Lyy4FD4NuAQbhsxH4geIIZSjPTRQlOydIjQkrV4UjgCBRfqz/8f09o8Frkux
 CnZMkXaY6YYOo7umM8eXFkzU1c4Ygi/LN/BVeefP6P3Y3QDplgKBTG1AIX16c/rt9Jbj
 0O6ihhKGeMPBGJX9jfQ5LRXX2h9nOIZKAXOWLtqxfCPPzQ4sHKjNJ97j6O1GvxbTGDv+
 zBA5cz4NssrmuZAIMoGIQEwn9FdMXMOTlDq9NjTshWtERlrW/Knl830tdYa0x8GD8eYq
 Jkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMkfPDMRdyyJ+LeflfeuMfIbnpp3+QEBfrxfVMuJb0A=;
 b=NxskuYjTKtDRjvz391/Fs4mYcP/BYN1WVMeP9/bQcHzoRfRw5KQFHH+SUvLFkvBx+S
 vRj2rBwmDI4dc8yuK1PuwN26FHWszc+JkU4r3j6ehaz4MegQp5bvip2v5wk3aheQVh8D
 rSRGWgXi7LGE+9pFfy1A73TMBZ30DIZ+AcuD1lwbbBJIODAzmohCPGl0HEesDgbkrK4y
 GPUt++FMpbbBAM3Y0asCOot+PQGQcBIUo3RZfA1tpsn9EsgPE8iDW5yEvEPJETZFskKU
 L2qXJKvE+y06sVa0QCgNDBz8F1hEg0ZZDSIm9t3eqrWmSNd1gpEBe0+9DDJmDuZ4oeKP
 0SxA==
X-Gm-Message-State: AOAM531npBCkvinYFWdawGxRBSJpc4xtOIo17qYUpvYm54vmo7n/TOSI
 rd6Sz3hKQpOKkdMcoNI7jjs=
X-Google-Smtp-Source: ABdhPJyVvga0+uyHrWJ07f3xjduHwTAmkbSK+WpqSXAmc9c69cySFZjMIdxOTvRMhQUxWJC/VN8m4g==
X-Received: by 2002:a17:906:c419:: with SMTP id
 u25mr29857701ejz.332.1618947538214; 
 Tue, 20 Apr 2021 12:38:58 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id f20sm10363057ejw.36.2021.04.20.12.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:38:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/2] drm/amd/amdgpu/amdgpu_device.c: Replace
 drm_modeset_*_all with DRM_MODESET_LOCK_ALL_*
Date: Tue, 20 Apr 2021 21:38:56 +0200
Message-ID: <179886319.If19VHCz4f@linux.local>
In-Reply-To: <YH8UL76DQZUrN0Jc@phenom.ffwll.local>
References: <20210419150341.24959-1-fmdefrancesco@gmail.com>
 <20210419150341.24959-2-fmdefrancesco@gmail.com>
 <YH8UL76DQZUrN0Jc@phenom.ffwll.local>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 20, 2021 7:49:35 PM CEST Daniel Vetter wrote:
> On Mon, Apr 19, 2021 at 05:03:40PM +0200, Fabio M. De Francesco wrote:
> > Replace the deprecated API with new helpers, according to the TODO list
> > of the DRM subsystem. The new API has been introduced with commit
> > b7ea04d299c7: DRM_MODESET_LOCK_ALL_BEGIN() simplifies grabbing all modeset
> > locks using a local context and has the advantage of reducing boilerplate.
> 
> So this is only half of the story, because the boilerplate only exists
> when you're using drm_modeset_lock_all_ctx. Which should be used for
> modern atomic display drivers everywhere.
> 
> But drm_modeset_lock_all_ctx isn't exactly the same as
> drm_modeset_lock_all, so this needs to be explained.
> 
> Now the problem with drm_modeset_lock_all is that it hides a memory
> allocation, and if that allocation fails then we just die. Which isn't
> great really, but in practice the kernel tries really hard to never fail
> this allocation. That's why we move the drm_modeset_acquire_ctx onto the
> stack.
> 
> I think for understanding what's going on here you'd first need to convert
> the code to the full open-code boilerplate using drm_modeset_lock_all_ctx,
> with explanations of why the changes are ok. Then replace it with the
> convenient macro. Once it's clear what's going on under the hood it should
> then be easier to explain the situation in subsequent conversions with
> just one patch.
> -Daniel
>
Thanks for the clarification. I'll go through this code again using the path 
you showed. Eventually I will send out another patch.

Fabio
>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > Changes from v1: Added further information in the commit message.
> > 
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c index 
6447cd6ca5a8..e1a71579f8e6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -32,6 +32,7 @@
> > 
> >  #include <linux/slab.h>
> >  
> >  #include <drm/drm_atomic_helper.h>
> > 
> > +#include <drm/drm_drv.h>
> > 
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/amdgpu_drm.h>
> >  #include <linux/vgaarb.h>
> > 
> > @@ -3694,14 +3695,17 @@ int amdgpu_device_suspend(struct drm_device *dev, 
bool fbcon)
> > 
> >  	if (!amdgpu_device_has_dc_support(adev)) {
> >  	
> >  		/* turn off display hw */
> > 
> > -		drm_modeset_lock_all(dev);
> > +		struct drm_modeset_acquire_ctx ctx;
> > +		int ret;
> > +
> > +		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> > 
> >  		drm_connector_list_iter_begin(dev, &iter);
> >  		drm_for_each_connector_iter(connector, &iter)
> >  		
> >  			drm_helper_connector_dpms(connector,
> >  			
> >  						  
DRM_MODE_DPMS_OFF);
> >  		
> >  		drm_connector_list_iter_end(&iter);
> > 
> > -		drm_modeset_unlock_all(dev);
> > -			/* unpin the front buffers and cursors */
> > +		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> > +		/* unpin the front buffers and cursors */
> > 
> >  		list_for_each_entry(crtc, &dev->mode_config.crtc_list, 
head) {
> >  		
> >  			struct amdgpu_crtc *amdgpu_crtc = 
to_amdgpu_crtc(crtc);
> >  			struct drm_framebuffer *fb = crtc->primary-
>fb;
> > 
> > @@ -3830,19 +3834,21 @@ int amdgpu_device_resume(struct drm_device *dev, 
bool fbcon)
> > 
> >  	/* blat the mode back in */
> >  	if (fbcon) {
> >  	
> >  		if (!amdgpu_device_has_dc_support(adev)) {
> > 
> > +			struct drm_modeset_acquire_ctx ctx;
> > +			int ret;
> > +
> > 
> >  			/* pre DCE11 */
> >  			drm_helper_resume_force_mode(dev);
> >  			
> >  			/* turn on display hw */
> > 
> > -			drm_modeset_lock_all(dev);
> > +			DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, 
ret);
> > 
> >  			drm_connector_list_iter_begin(dev, &iter);
> >  			drm_for_each_connector_iter(connector, 
&iter)
> >  			
> >  				
drm_helper_connector_dpms(connector,
> >  				
> >  							  
DRM_MODE_DPMS_ON);
> >  			
> >  			drm_connector_list_iter_end(&iter);
> > 
> > -
> > -			drm_modeset_unlock_all(dev);
> > +			DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> > 
> >  		}
> >  		amdgpu_fbdev_set_suspend(adev, 0);
> >  	
> >  	}




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
