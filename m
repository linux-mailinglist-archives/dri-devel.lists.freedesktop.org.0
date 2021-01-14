Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D222F5DFC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E1B6E15C;
	Thu, 14 Jan 2021 09:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE77989EEB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:45:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id y17so5036099wrr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 01:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lsxoCmLlwSOdzC0lr7PN3HIFXvx76ScTkLwtZD62IYo=;
 b=I0y07geo5aXGujGOhoJk0FpYPCF9Em/rj3ZW9R9shUeaiVOKUpiL/dctsT2EzMiCcP
 C/FrkDxkdBUB50MNJM8/IaLkchTf2w2vCcYmehwALLl9lsrnSABoo8i+KDScK92iCtGh
 yHbWsQDz50vLBUSUdlvEzEt1edMOWK+7vIY7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lsxoCmLlwSOdzC0lr7PN3HIFXvx76ScTkLwtZD62IYo=;
 b=Bk2U62GZgVPbnovsVGppRuCeR6KSv1FW4peyr6bdRoFKUcD4opBKtiu0vDn92XsqDX
 86eRnmkGbXeD+wFEDJ6rG4iLLOagkciSQyTkS0aPhPXBI7vZCW9AJO55X3KD4RyqdIHr
 hhqvOP3+/vVhWMJCCJZvDdfaDKbJzblB3XrgwjImER3tSz/lcfDSFshNf+CG/m/CpwOj
 vF0cPjhNCI0EI38KG8HBrokzEKcRQkH8uVgaQRJeMqlVXGe3ri4hrK5h1VXtD1nl3Yal
 cP/4ThVZ5hEwWBgoO4FIeF5HNwYdIwCmkGZcnYNOU78GTnAPRBnc9GxFK1tvC2D44DZb
 yiGA==
X-Gm-Message-State: AOAM533jrg6lgndrxSpn/eOT+w4sf8cezBd9aopuruUjitbuZsZvcYPh
 ClL2Nz4SF3dd/GYSAt2OpPfz2g==
X-Google-Smtp-Source: ABdhPJzUiOJTa9rH1+y9i1vsJ2oBwBhlCaGCvCw7diDcSZMRQj5f27+Y40Sd+iEz7GiZcegiqpnlxg==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr7016317wre.408.1610617525269; 
 Thu, 14 Jan 2021 01:45:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v11sm8430023wrt.25.2021.01.14.01.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 01:45:24 -0800 (PST)
Date: Thu, 14 Jan 2021 10:45:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vc4: Initialize vc4_drm_driver with CMA helper
 defaults
Message-ID: <YAASsq2vmHZ5XnIi@phenom.ffwll.local>
References: <20210114084949.29014-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114084949.29014-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 09:49:49AM +0100, Thomas Zimmermann wrote:
> The function vc4_prime_import_sg_table() is an otherwise empty wrapper
> around CMA's drm_gem_cma_prime_import_sg_table(). Removing it in favor
> of the latter allows to initialize vc4_drm_driver with CMA's initializer
> macro.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vc4/vc4_bo.c  | 14 --------------
>  drivers/gpu/drm/vc4/vc4_drv.c |  7 +------
>  drivers/gpu/drm/vc4/vc4_drv.h |  3 ---
>  3 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 28e48ef2d295..fddaeb0b09c1 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -738,20 +738,6 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
>  	.vm_ops = &vc4_vm_ops,
>  };
>  
> -struct drm_gem_object *
> -vc4_prime_import_sg_table(struct drm_device *dev,
> -			  struct dma_buf_attachment *attach,
> -			  struct sg_table *sgt)
> -{
> -	struct drm_gem_object *obj;
> -
> -	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
> -	if (IS_ERR(obj))
> -		return obj;
> -
> -	return obj;
> -}
> -
>  static int vc4_grab_bin_bo(struct vc4_dev *vc4, struct vc4_file *vc4file)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index d9b3bba7f2b7..556ad0f02a0d 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -180,12 +180,7 @@ static struct drm_driver vc4_drm_driver = {
>  
>  	.gem_create_object = vc4_create_object,
>  
> -	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_import_sg_table = vc4_prime_import_sg_table,
> -	.gem_prime_mmap = drm_gem_prime_mmap,
> -
> -	.dumb_create = vc4_dumb_create,
> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(vc4_dumb_create),
>  
>  	.ioctls = vc4_drm_ioctls,
>  	.num_ioctls = ARRAY_SIZE(vc4_drm_ioctls),
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 0d9c0ecc4769..a7500716cf3f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -801,9 +801,6 @@ int vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file_priv);
>  int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv);
> -struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
> -						 struct dma_buf_attachment *attach,
> -						 struct sg_table *sgt);
>  int vc4_bo_cache_init(struct drm_device *dev);
>  int vc4_bo_inc_usecnt(struct vc4_bo *bo);
>  void vc4_bo_dec_usecnt(struct vc4_bo *bo);
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
