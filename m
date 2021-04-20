Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35732365ECF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 19:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A6D6E888;
	Tue, 20 Apr 2021 17:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A396E888
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:49:38 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r9so59561063ejj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 10:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rJ0gTNSpHXyaSJ6lYKxNkMmiaYgClxAfusRxRmTvzf8=;
 b=frBLSHSjABUg1Ld2ApWU02R9mHl5H3e6G9LOpBZyLDHpCLtBRXMcttRaYofBnJBbiq
 HK2DEbhnFptOZSS79/wXunrj4h0PAODv/zzV/cL2lBw/bDHdMOB4Ngz17YR5YULEplry
 XoLMAwpd9EkFQy5JQFpbkAdZXyhpifShLrhMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rJ0gTNSpHXyaSJ6lYKxNkMmiaYgClxAfusRxRmTvzf8=;
 b=JyPavkOYjAbEpOKIIjoYxPXkSvtufS1+0XLTPVSSCphVmvmmeNVdr6fjKMgdYJ7gzS
 N2pwYAZPCxGi1oB6A90CdIWN2VaDsUBEgesFrBtKOKx+5D2UwV5NgWgU9N6knZHZwIuJ
 WdvCiLXPqk1FToxFOs1n7v6VOWQ5R1buq4XTx/ktABPD1Aqg2H27uF2EW1RoHpEtG6X4
 cXxHx01eC/1/MQ3lJ1LV9ngF0CBJfd9r3kVzO7EIdX6x3kdW5TnH1o+igYqc97kppXly
 SGnGI2iJEw4cH7SZQ2Zy7twXV2I4+AnH6w/Ws8c+8Y6qi9EG/hY00WRvCToB8BNdsEKn
 20qA==
X-Gm-Message-State: AOAM533Twr7GSdQJz+kw8QewXhsnPqjeET9Lncp0Bs3CZd6VNXthd2vO
 PVRYbGqPWOOoiIk3e5y2xlfjVw==
X-Google-Smtp-Source: ABdhPJzHsJdCVG/27GaCpNOO9GaGna4Mmto/s6duOeX9oI8WDBiLlGiYSnAmjfh8v4Vwp8ItnqJeqA==
X-Received: by 2002:a17:906:cc8e:: with SMTP id
 oq14mr28674546ejb.15.1618940977513; 
 Tue, 20 Apr 2021 10:49:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p2sm13494718ejo.108.2021.04.20.10.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 10:49:36 -0700 (PDT)
Date: Tue, 20 Apr 2021 19:49:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/amd/amdgpu/amdgpu_device.c: Replace
 drm_modeset_*_all with DRM_MODESET_LOCK_ALL_*
Message-ID: <YH8UL76DQZUrN0Jc@phenom.ffwll.local>
References: <20210419150341.24959-1-fmdefrancesco@gmail.com>
 <20210419150341.24959-2-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419150341.24959-2-fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 05:03:40PM +0200, Fabio M. De Francesco wrote:
> Replace the deprecated API with new helpers, according to the TODO list
> of the DRM subsystem. The new API has been introduced with commit
> b7ea04d299c7: DRM_MODESET_LOCK_ALL_BEGIN() simplifies grabbing all modeset
> locks using a local context and has the advantage of reducing boilerplate.

So this is only half of the story, because the boilerplate only exists
when you're using drm_modeset_lock_all_ctx. Which should be used for
modern atomic display drivers everywhere.

But drm_modeset_lock_all_ctx isn't exactly the same as
drm_modeset_lock_all, so this needs to be explained.

Now the problem with drm_modeset_lock_all is that it hides a memory
allocation, and if that allocation fails then we just die. Which isn't
great really, but in practice the kernel tries really hard to never fail
this allocation. That's why we move the drm_modeset_acquire_ctx onto the
stack.

I think for understanding what's going on here you'd first need to convert
the code to the full open-code boilerplate using drm_modeset_lock_all_ctx,
with explanations of why the changes are ok. Then replace it with the
convenient macro. Once it's clear what's going on under the hood it should
then be easier to explain the situation in subsequent conversions with
just one patch.
-Daniel


> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Changes from v1: Added further information in the commit message.
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 6447cd6ca5a8..e1a71579f8e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -32,6 +32,7 @@
>  #include <linux/slab.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include <linux/vgaarb.h>
> @@ -3694,14 +3695,17 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>  
>  	if (!amdgpu_device_has_dc_support(adev)) {
>  		/* turn off display hw */
> -		drm_modeset_lock_all(dev);
> +		struct drm_modeset_acquire_ctx ctx;
> +		int ret;
> +
> +		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  		drm_connector_list_iter_begin(dev, &iter);
>  		drm_for_each_connector_iter(connector, &iter)
>  			drm_helper_connector_dpms(connector,
>  						  DRM_MODE_DPMS_OFF);
>  		drm_connector_list_iter_end(&iter);
> -		drm_modeset_unlock_all(dev);
> -			/* unpin the front buffers and cursors */
> +		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> +		/* unpin the front buffers and cursors */
>  		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  			struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
>  			struct drm_framebuffer *fb = crtc->primary->fb;
> @@ -3830,19 +3834,21 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
>  	/* blat the mode back in */
>  	if (fbcon) {
>  		if (!amdgpu_device_has_dc_support(adev)) {
> +			struct drm_modeset_acquire_ctx ctx;
> +			int ret;
> +
>  			/* pre DCE11 */
>  			drm_helper_resume_force_mode(dev);
>  
>  			/* turn on display hw */
> -			drm_modeset_lock_all(dev);
> +			DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  			drm_connector_list_iter_begin(dev, &iter);
>  			drm_for_each_connector_iter(connector, &iter)
>  				drm_helper_connector_dpms(connector,
>  							  DRM_MODE_DPMS_ON);
>  			drm_connector_list_iter_end(&iter);
> -
> -			drm_modeset_unlock_all(dev);
> +			DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  		}
>  		amdgpu_fbdev_set_suspend(adev, 0);
>  	}
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
