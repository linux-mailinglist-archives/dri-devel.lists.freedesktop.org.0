Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD33832D3
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E946E9B7;
	Mon, 17 May 2021 14:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637486E9B7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:54:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so3815807wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TDVRm6lYWxshAWJHvIDIMbZJDaxgU745kLB/VK2hKsw=;
 b=hQwmzt/S7dnAn80Nu2osJpBt9OLuN5Vw+4BMOM+kPjzl3/0e3sC/c2venuAgYfRaQA
 RLJuNDPFPcGmVaLSWOuSHx8pa0JrN5E83IX/EzZ0DruzkWS/WuVTLvDMywwx8vIl66PE
 sNB7l6wnOreB8UzurFqucyAwb9e+rRr0TIPKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TDVRm6lYWxshAWJHvIDIMbZJDaxgU745kLB/VK2hKsw=;
 b=ljtlzW5j8CWOzJrOuiD0YXaMvBZ8NdkxLwaliRrqhBD3oVDxzhQpYL1RQ71hJd2un2
 iSNvBTPmz1XmnVp1bdugUsugcXGut9t++Xx5zpObR3bbIiDXirJWOx2x4Mo+8vEP7I74
 7bE0cG+I7iiwo/DffymMFHEuQe/p5+XQZuBF/6go+jcV5JyBFst7mRTsgmJMNkTFWU9O
 6Ojgq8BtnRgnpcW2g26GsD9szaQrItRa1dMgrsUuq8DXIMaGY6DYhme14Q6dCiPgS/D3
 +zoFxu+D59NJC0JcD4d4/pHmjEcWZDFvoOL/q77zGr4aalpcyK2uSzdvW/T84I+RYLjz
 COhA==
X-Gm-Message-State: AOAM532zJOXqNQa5UoPx6dEg+QhQzS9G+jfWhMxCLmItFmEwQNlN34v/
 yfji6WiDFm8dOxwk9YyskFjrdA==
X-Google-Smtp-Source: ABdhPJwYtj4kG42JAC+MRZZG4W/PmyZYqdnzJIoQUVUrb3uHN0kmBuE4p7rpcMI9F3LkUawdjmdj9Q==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr64665wmj.77.1621263266151;
 Mon, 17 May 2021 07:54:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u9sm15287091wmc.38.2021.05.17.07.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:54:25 -0700 (PDT)
Date: Mon, 17 May 2021 16:54:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Mark IRQ_BUSID ioctl as legacy
Message-ID: <YKKDn1NauuatnKRC@phenom.ffwll.local>
References: <20210516195135.3755-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516195135.3755-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 16, 2021 at 09:51:35PM +0200, Thomas Zimmermann wrote:
> The functionality is only implemented for legacy drivers. Mark the ioctl
> as legacy and move the code behind CONFIG_DRM_LEGACY. If legacy drivers
> are disabled, the ioctl call now returns -EINVAL instead of -EOPNOTSUPP.

I think that's fine.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_internal.h | 8 --------
>  drivers/gpu/drm/drm_ioctl.c    | 3 ++-
>  drivers/gpu/drm/drm_legacy.h   | 8 ++++++++
>  drivers/gpu/drm/drm_pci.c      | 8 ++++----
>  4 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 1dcb5797a3bb..17f3548c8ed2 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -54,18 +54,10 @@ void drm_lastclose(struct drm_device *dev);
>  #ifdef CONFIG_PCI
>  
>  /* drm_pci.c */
> -int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> -			    struct drm_file *file_priv);
>  int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master);
>  
>  #else
>  
> -static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> -					  struct drm_file *file_priv)
> -{
> -	return -EINVAL;
> -}
> -
>  static inline int drm_pci_set_busid(struct drm_device *dev,
>  				    struct drm_master *master)
>  {
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index b0856c139693..53d314103a37 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -577,7 +577,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, drm_getmagic, 0),
> -	DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
> +	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid,
> +			     DRM_MASTER|DRM_ROOT_ONLY),
>  
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_legacy_getmap_ioctl, 0),
>  
> diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
> index 7080d2538421..c9206840c87f 100644
> --- a/drivers/gpu/drm/drm_legacy.h
> +++ b/drivers/gpu/drm/drm_legacy.h
> @@ -235,9 +235,17 @@ void drm_master_legacy_init(struct drm_master *master);
>  static inline void drm_master_legacy_init(struct drm_master *master) {}
>  #endif
>  
> +/* drm_pci.c */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_PCI)
> +int drm_legacy_irq_by_busid(struct drm_device *dev, void *data, struct drm_file *file_priv);
>  void drm_legacy_pci_agp_destroy(struct drm_device *dev);
>  #else
> +static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> +					  struct drm_file *file_priv)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void drm_legacy_pci_agp_destroy(struct drm_device *dev) {}
>  #endif
>  
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index f508f70e7a3f..39d35fc3a43b 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -72,7 +72,9 @@ int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)
>  	return 0;
>  }
>  
> -static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
> +#ifdef CONFIG_DRM_LEGACY
> +
> +static int drm_legacy_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  
> @@ -115,11 +117,9 @@ int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
>  		return -EOPNOTSUPP;
>  
> -	return drm_pci_irq_by_busid(dev, p);
> +	return drm_legacy_pci_irq_by_busid(dev, p);
>  }
>  
> -#ifdef CONFIG_DRM_LEGACY
> -
>  void drm_legacy_pci_agp_destroy(struct drm_device *dev)
>  {
>  	if (dev->agp) {
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
