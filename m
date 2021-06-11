Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC73A3F6C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B64A6EE60;
	Fri, 11 Jun 2021 09:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8FB6EE60
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:47:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a11so5349421wrt.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f3EEfBDwO74pD//iqbkUqrqqAdw7wtdJok2SknjltMg=;
 b=jCY5ZxTazoFq7ITJFX8Beh5mlD8auglfOM5OKgYUm9d9vhjXzZPQF++jG3HPnSRrB5
 ZMazZNrqFEdLRfYp/BNaXK3QLj425NEebCv2QOiuXMofpbBEG6Gj3xogD3KEwepHQ9vO
 W5hunUPcZbzXFap6F4PxvTjHbVnIOHKXojHoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f3EEfBDwO74pD//iqbkUqrqqAdw7wtdJok2SknjltMg=;
 b=KgB98yDnT/kMCXq99E/wMNCxtQ25Xf3hBiph3x02j80pRm5BICZbmjZKMNWRrwFad5
 4rwWMEK7A7EAwst272q2ixiA3NELRue7F07v8HJi8zp+zAY0G4PdhH8KDYSnRO2Gc3dg
 vFTsNl2fy3PUwVYZs7VyiwhWDxy/FEshYtFkoWfjkuxQ7M4D0AJw65tMz5xO0VLTkkAF
 OD2fQX9GC/P0aVjVVhcxXqHH9/0aqRvJzso0EMnP1hoDD3+firKdaPvAe7IRn3igaw/8
 e763CwYLuNpYTAiE/FqXArR89o+hdAwxDWdBbP+ixw94gtOulTuQOguZJSCrA20egwo/
 6gEw==
X-Gm-Message-State: AOAM5316tcn6aQNoKSD9GX8VGB0F4oOdw06kS/BgeqGNHDDySCmKjeuo
 PbRT07PDJvKRWUBaU9Vnu2YrTQ==
X-Google-Smtp-Source: ABdhPJxG1QD3Pp3F5rcTGkwfG53/yOadtsCXMNutTGXbZbt/Tgqd6Vr4BmnZv+b7N/4LqosihK/kog==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr3126764wrc.122.1623404823005; 
 Fri, 11 Jun 2021 02:47:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v18sm7024156wrb.10.2021.06.11.02.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 02:47:02 -0700 (PDT)
Date: Fri, 11 Jun 2021 11:47:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH] drm: set DRM_RENDER_ALLOW flag on
 DRM_IOCTL_MODE_CREATE/DESTROY_DUMB ioctls
Message-ID: <YMMxFHvRCp+u5GvX@phenom.ffwll.local>
References: <20210610213659.22728-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610213659.22728-1-dongwon.kim@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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

On Thu, Jun 10, 2021 at 02:36:59PM -0700, Dongwon Kim wrote:
> Render clients should be able to create/destroy dumb object to import
> and use it as render buffer in case the default DRM device is different
> from the render device (i.e. kmsro).
> 
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>

Uh no.

Well I know everyone just hacks around this, but the idea behind dumb
buffer objects is that they're for kms scanout only. Furthermore on many
drivers they allocate a limited resource like CMA memory. Handing that out
like candy isn't a great idea.

And it's exactly those drivers that kmsro currently is used for where the
display driver needs special memory.
-Daniel

> ---
>  drivers/gpu/drm/drm_ioctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 98ae00661656..f2f72e132741 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -685,9 +685,9 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_RMFB, drm_mode_rmfb_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_PAGE_FLIP, drm_mode_page_flip_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DIRTYFB, drm_mode_dirtyfb_ioctl, DRM_MASTER),
> -	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_DUMB, drm_mode_create_dumb_ioctl, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_DUMB, drm_mode_create_dumb_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_MAP_DUMB, drm_mode_mmap_dumb_ioctl, 0),
> -	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DESTROY_DUMB, drm_mode_destroy_dumb_ioctl, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DESTROY_DUMB, drm_mode_destroy_dumb_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_OBJ_GETPROPERTIES, drm_mode_obj_get_properties_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_OBJ_SETPROPERTY, drm_mode_obj_set_property_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CURSOR2, drm_mode_cursor2_ioctl, DRM_MASTER),
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
