Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4163240D9BF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 14:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869126ED7E;
	Thu, 16 Sep 2021 12:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61E06ED7E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:19:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so4347617wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=df4FaUkkR4Z0SatHxCizb+T6yCsmtzifSPMU61+pk30=;
 b=gINa8m86WRh9Ey1qXv9mw87G5MSZ6KaRxLblmbW5HfZaY88vRkjIsk4rd95WwF8F/C
 A5nyb2bMuMw5Lc/mqYtEPjTZ4sVe86/3DVWTyZnrQcF2iNbcnjdkm7XicrOqO2gaKoJx
 gHcU6cSf2i+25TMjuBi1Uh8u1BioFmTRLRYlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=df4FaUkkR4Z0SatHxCizb+T6yCsmtzifSPMU61+pk30=;
 b=ONYJo24v+8g7EDec8d5Mkt/O4fsfXMSKXRxXzpHiNcgTr57VTIl1yzoYQ+hlANtiZx
 kTvZbdwGYZovn6tc/KtwBbg4q0fOiovNdrlQcTsLcQEx4Lj1JnrthmPpYBS/OH9CKKaY
 1AknagUfEtVEbW80M8G9MUXRKBbxEvpI6x7uT3gwUcRe7OH6Mqmqdf6vr6DGqiU/6tyt
 lPZn+TKG++OXZPq8AwFxOYIbnMD34WVPzRpvpUYn9UVrsaJp6CL7259DfX6ftBr8ap2H
 zBa2gvYmbNhkwIVNSk/oX4qWA9VXn0xkof5x5PQiW2EkIWRytmGsDog2+B8uDCgRk4Fg
 F8/Q==
X-Gm-Message-State: AOAM531uGm5tgWQK5wiROGDOqkkpdNHr6Jepjg89qJBdL7F21Plzjk5r
 7tgJkhKv/+sp6IjpCu3cYlrmQFvhSq9mgQ==
X-Google-Smtp-Source: ABdhPJzdzzT+jguceos5v2aXqhJg6mFswXOczgSjPLYM9fwFpFu3eVjP5EbrqWQiCVU66gB+7PL5Ew==
X-Received: by 2002:a7b:c4c2:: with SMTP id g2mr4809565wmk.134.1631794791377; 
 Thu, 16 Sep 2021 05:19:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l21sm2997042wmh.31.2021.09.16.05.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 05:19:50 -0700 (PDT)
Date: Thu, 16 Sep 2021 14:19:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] drm/v3d: add generic ioctl extension
Message-ID: <YUM2ZQ/c5H2As58X@phenom.ffwll.local>
References: <cover.1629307160.git.mwen@igalia.com>
 <d5647f22567a71e5ecd3f86f0110aa14f8c6006d.1629307160.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5647f22567a71e5ecd3f86f0110aa14f8c6006d.1629307160.git.mwen@igalia.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Wed, Aug 18, 2021 at 06:56:41PM +0100, Melissa Wen wrote:
> Add support to attach generic extensions on job submission.
> This patch is a second prep work to enable multiple syncobjs on job
> submission. With this work, when the job submission interface needs
> to be extended to accomodate a new feature, we will use a generic
> extension struct where an id determines the data type to be pointed.
> The first application is to enable multiples in/out syncobj (next
> patch), but the base is already done for future features.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c |  4 +-
>  drivers/gpu/drm/v3d/v3d_gem.c | 80 ++++++++++++++++++++++++++++++++---
>  include/uapi/drm/v3d_drm.h    | 38 ++++++++++++++++-
>  3 files changed, 113 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 9403c3b36aca..6a0516160bb2 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -83,7 +83,6 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
>  		return 0;
>  	}
>  
> -
>  	switch (args->param) {
>  	case DRM_V3D_PARAM_SUPPORTS_TFU:
>  		args->value = 1;
> @@ -147,7 +146,7 @@ v3d_postclose(struct drm_device *dev, struct drm_file *file)
>  DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
>  
>  /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
> - * protection between clients.  Note that render nodes would be be
> + * protection between clients.  Note that render nodes would be
>   * able to submit CLs that could access BOs from clients authenticated
>   * with the master node.  The TFU doesn't use the GMP, so it would
>   * need to stay DRM_AUTH until we do buffer size/offset validation.
> @@ -222,7 +221,6 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>  	u32 mmu_debug;
>  	u32 ident1;
>  
> -
>  	v3d = devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev, drm);
>  	if (IS_ERR(v3d))
>  		return PTR_ERR(v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 593ed2206d74..e254919b6c5e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -521,6 +521,38 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
>  	}
>  }
>  
> +static int
> +v3d_get_extensions(struct drm_file *file_priv,
> +		   u32 ext_count, u64 ext_handles)
> +{
> +	int i;
> +	struct drm_v3d_extension __user *handles;
> +
> +	if (!ext_count)
> +		return 0;
> +
> +	handles	= u64_to_user_ptr(ext_handles);
> +	for (i = 0; i < ext_count; i++) {
> +		struct drm_v3d_extension ext;
> +
> +		if (copy_from_user(&ext, handles, sizeof(ext))) {
> +			DRM_DEBUG("Failed to copy submit extension\n");
> +			return -EFAULT;
> +		}
> +
> +		switch (ext.id) {
> +		case 0:
> +		default:
> +			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
> +			return -EINVAL;
> +		}
> +
> +		handles = u64_to_user_ptr(ext.next);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * v3d_submit_cl_ioctl() - Submits a job (frame) to the V3D.
>   * @dev: DRM device
> @@ -549,15 +581,23 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
>  
>  	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
>  
> -	if (args->pad != 0)
> -		return -EINVAL;
> -
> -	if (args->flags != 0 &&
> -	    args->flags != DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
> +	if (args->flags &&
> +	    args->flags & ~(DRM_V3D_SUBMIT_CL_FLUSH_CACHE |
> +			    DRM_V3D_SUBMIT_EXTENSION)) {
>  		DRM_INFO("invalid flags: %d\n", args->flags);
>  		return -EINVAL;
>  	}
>  
> +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> +		ret = v3d_get_extensions(file_priv,
> +					 args->extension_count,
> +					 args->extensions);
> +		if (ret) {
> +			DRM_DEBUG("Failed to get extensions.\n");
> +			return ret;
> +		}
> +	}
> +
>  	render = kcalloc(1, sizeof(*render), GFP_KERNEL);
>  	if (!render)
>  		return -ENOMEM;
> @@ -711,6 +751,21 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
>  
>  	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
>  
> +	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
> +		DRM_DEBUG("invalid flags: %d\n", args->flags);
> +		return -EINVAL;
> +	}
> +
> +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> +		ret = v3d_get_extensions(file_priv,
> +					 args->extension_count,
> +					 args->extensions);
> +		if (ret) {
> +			DRM_DEBUG("Failed to get extensions.\n");
> +			return ret;
> +		}
> +	}
> +
>  	job = kcalloc(1, sizeof(*job), GFP_KERNEL);
>  	if (!job)
>  		return -ENOMEM;
> @@ -806,6 +861,21 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  	}
>  
> +	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
> +		DRM_DEBUG("Invalid flags: %d\n", args->flags);
> +		return -EINVAL;
> +	}
> +
> +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> +		ret = v3d_get_extensions(file_priv,
> +					 args->extension_count,
> +					 args->extensions);
> +		if (ret) {
> +			DRM_DEBUG("Failed to get extensions.\n");
> +			return ret;
> +		}
> +	}
> +
>  	job = kcalloc(1, sizeof(*job), GFP_KERNEL);
>  	if (!job)
>  		return -ENOMEM;
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 4104f22fb3d3..1f4706010eb5 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -58,6 +58,19 @@ extern "C" {
>  						   struct drm_v3d_perfmon_get_values)
>  
>  #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
> +#define DRM_V3D_SUBMIT_EXTENSION		  0x02
> +
> +/* struct drm_v3d_extension - ioctl extensions
> + *
> + * Linked-list of generic extensions where the id identify which struct is
> + * pointed by ext_data. Therefore, DRM_V3D_EXT_ID_* is used on id to identify
> + * the extension type.
> + */
> +struct drm_v3d_extension {
> +	__u64 next;

Why do you both need a next pointer here and extension_count everywhere?
That seems one too much.

> +	__u64 ext_data;

This isn't needed if you link them. Instead each extension can subclass
this struct here, and add whatever parameter they need there. Some
extensions could be just a flag which only needs to be the extension
present. Maybe what you want here is a __u32 for flags? Solves also the
aligning.

> +	__u32 id;

Align to 64bit just to be save.

One thing I wondered is whether we shouldn't lift this to be a drm thing.
i915 has something similar with i915_user_extension.

That way we could share some helpers for parsing these, and people would
do extensible drm ioctls all the same way?
-Daniel



> +};
>  
>  /**
>   * struct drm_v3d_submit_cl - ioctl argument for submitting commands to the 3D
> @@ -135,12 +148,17 @@ struct drm_v3d_submit_cl {
>  	/* Number of BO handles passed in (size is that times 4). */
>  	__u32 bo_handle_count;
>  
> +	/* DRM_V3D_SUBMIT_* properties */
>  	__u32 flags;
>  
>  	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
>  	__u32 perfmon_id;
>  
> -	__u32 pad;
> +	/* Number of extensions*/
> +	__u32 extension_count;
> +
> +	/* Pointer to a list of ioctl extensions*/
> +	__u64 extensions;
>  };
>  
>  /**
> @@ -248,6 +266,15 @@ struct drm_v3d_submit_tfu {
>  	__u32 in_sync;
>  	/* Sync object to signal when the TFU job is done. */
>  	__u32 out_sync;
> +
> +	/* Number of extensions*/
> +	__u32 extension_count;
> +
> +	/* Pointer to an array of ioctl extensions*/
> +	__u64 extensions;
> +
> +	/* DRM_V3D_SUBMIT_* properties */
> +	__u32 flags;
>  };
>  
>  /* Submits a compute shader for dispatch.  This job will block on any
> @@ -276,6 +303,15 @@ struct drm_v3d_submit_csd {
>  
>  	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
>  	__u32 perfmon_id;
> +
> +	/* DRM_V3D_SUBMIT_* properties */
> +	__u32 flags;
> +
> +	/* Number of extensions*/
> +	__u32 extension_count;
> +
> +	/* Pointer to a list of ioctl extensions*/
> +	__u64 extensions;
>  };
>  
>  enum {
> -- 
> 2.30.2
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
