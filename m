Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5F364548
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 15:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C676E32F;
	Mon, 19 Apr 2021 13:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125296E328
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 13:51:47 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h10so40767035edt.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cof3fQ+FS9F0riGAc/xnWt+MmWs7z47fFubv8E2ON9o=;
 b=U2GDjV1wTpVMCh3GsuQkl47kI8hqgdlDJ8E+4V3v0IOnLCoWqhOLVQ3Zwet08XZWfh
 ARAkgzY0eTOdssl8koF+4XvDstxJk1TeFe2OW1aWYuXc+39aeuIhgLvGF4it/Mhc+n53
 8mFXmAqJd+B9HZAc+nd5qkBmM0gnEi5HmWQ2veym/KfcY5yTZgEsH1SBsgWhCwEo5BfY
 3hMfqNPMizPKDUb/W3zC3mQnCFuSQimbJozWKmI5ybiQ+EHYSD+5LQ7xe9/xUEoPxfLF
 4UPhgueHGgsYo0Y3QIMK0cxhp6KEiW2CQE0mittXpXnrdJj3viQqLFWlT0+1fw65WDcB
 5sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cof3fQ+FS9F0riGAc/xnWt+MmWs7z47fFubv8E2ON9o=;
 b=SDPsl1sSHwHSE3MDXT1lgtvdsAVfzhAXVdnYP6jIO5CRcKi126hYrE3n4B5qOk6ztm
 6WqMFCprLEuKobs7Gu382P9svsI4YkTbgd0XHGDfSiejmWwdG6CWZH39oqnyYqPAXsAG
 WTp9vQQOtNy08wMhPtdLVmdcpnf3Kp3DfRl515va72GFRFLI0PEFJGLHRV6F0RCg+AH9
 XvQ+5szUxBilvNKLwLnJgcBc8gKyOKRK1/PJ4GFOQqodmj34hRXjUuSI9tXrXtQFjX6t
 QmNVPxgOftdEGRUxBl+7XDtRmD0Df6oIT1fD/LVEipzEQqAGdNlILxLRo+aSU891mUq7
 E6Qw==
X-Gm-Message-State: AOAM531ZxIxG1FXnY9DiDCoStDMiZK2+xj8j/Rsmf7H2/pIR6ugrwY7R
 tSIOEIJK2P8xMMwmnBmoFRE=
X-Google-Smtp-Source: ABdhPJwZ9ktXUJXUp27Afa/8JTsIUAyIgjJ+MmqR1zfKcSBiIAVozVms+eMIlRY/KDGcZprlK2xusQ==
X-Received: by 2002:a05:6402:35c9:: with SMTP id
 z9mr25882757edc.94.1618840305671; 
 Mon, 19 Apr 2021 06:51:45 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id q2sm10444900eje.24.2021.04.19.06.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 06:51:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [Outreachy kernel] [PATCH 1/2] drm/amd/amdgpu/amdgpu_device.c:
 Replace drm_modeset_*_all with DRM_MODESET_LOCK_ALL_*
Date: Mon, 19 Apr 2021 15:51:43 +0200
Message-ID: <4883020.1eLjRNAHnk@linux.local>
In-Reply-To: <alpine.DEB.2.22.394.2104191506110.16374@hadrien>
References: <20210419122059.738-1-fmdefrancesco@gmail.com>
 <20210419122059.738-2-fmdefrancesco@gmail.com>
 <alpine.DEB.2.22.394.2104191506110.16374@hadrien>
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

On Monday, April 19, 2021 3:08:51 PM CEST Julia Lawall wrote:
> On Mon, 19 Apr 2021, Fabio M. De Francesco wrote:
> > Replace the deprecated API with new helpers, according to the TODO list
> > of the DRM subsystem.
> 
> The commit message will perhaps not be very meaningful one year from now.
> You could say for example DRM_MODESET_LOCK_ALL_BEGIN was introduced in
> commit XXX (there is a proper format for referring to other commits) for
> what purpose.  And then say that you are making the replacement.
> 
> Actually, I'm a little surprised to see something that looks like a
> function call be replaced by something that looks like a macro.  Maybe it
> was a macro all along, and this is just making that more clear.  In any
> case, if I were to look at this commit, I would appreciate a little more
> context information.
> 
> julia
>
I have made that message in line with an old commit (9bcaa3fe58ab) that had 
been taken by D. Vetter (the DRM maintainer). That message didn't explain more 
than referring to the TODO list. I try to stick with each subsystem's  
conventions.

However, I agree with you: referring to a TODO list, which some day  will 
surely change, is not the best means to provide context information.

From that macro documentation (https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#c.DRM_MODESET_LOCK_ALL_BEGIN):

"DRM_MODESET_LOCK_ALL_BEGIN  simplifies grabbing all modeset locks using a 
local context. This has the advantage of reducing boilerplate, [...]". 
(Please, note that I haven't copied the last part of the paragraph because it 
talks about checking the return value but I think it's useless because the 
only possible return value is 0).

If more context information is needed, I would add the above-mentioned note to 
my commit message and submit a v2 patch.

Is it the right way to solve the issue that you pointed out?

Thanks in advance,

Fabio
> 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c index
> > 6447cd6ca5a8..e1a71579f8e6 100644
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
> > bool fbcon)> 
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
> > bool fbcon)> 
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
> > 
> > --
> > 2.31.1
> > 
> > --
> > You received this message because you are subscribed to the Google Groups
> > "outreachy-kernel" group. To unsubscribe from this group and stop 
receiving
> > emails from it, send an email to
> > outreachy-kernel+unsubscribe@googlegroups.com. To view this discussion on
> > the web visit
> > https://groups.google.com/d/msgid/outreachy-kernel/20210419122059.738-2-fmd
> > efrancesco%40gmail.com.




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
