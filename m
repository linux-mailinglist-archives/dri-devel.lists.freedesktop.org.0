Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28472DC226
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E091B6E1BE;
	Wed, 16 Dec 2020 14:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259E06E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:29:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id x22so2529699wmc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ArE23KjbIKbC/nVDzRUay1pJjb0+C+SvHnhKxLPZ7C4=;
 b=aAZk7+AFkD5zIf7i2OrhUFT9IRAtPjkqMZpBLMTLX0eQ/jkGQ51xBdpLd8nTO5UVDb
 MsM0o2T8RxSsbnK3iPB4G75JENrNkz9tKB+vltvsLtlHl+bS8vjWvmOfouQ/fvwTtWwa
 iPSmNuWQ8aZfY9BYK7vy5AKev7jrUoYE80CAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ArE23KjbIKbC/nVDzRUay1pJjb0+C+SvHnhKxLPZ7C4=;
 b=rQ/xxdVjBAPM2HfvTMT0/9GMeuDuKv7hTrErtBY6ampH94YmJYkQ6kGxw9Q3dIF16J
 VUWnFddWyhrizta9W+9ntFuJjbefKimLGRGLhDrLjF2XMEVix44pXYkk1SBz9NDxkutM
 p0qxprwHI9UqVsv6tcu3OuMjFCpFrpVK1fLwMjghbnYdJMsWXi64RtU1uZsXOK9WpmbB
 RlQfP3V4nqZIM1GtfF9ALU42VzRGLkFL8b6wMKOHNmSfhnUbS+CCy+Y3s74Sk3mWO02F
 iTPuG8ZnJUehgM7WYxiXW9MYgGprPGCQ+hJy7wi13N0JqziUrAck4QVqwrlPqG8jN94I
 e4pw==
X-Gm-Message-State: AOAM5313440/RsXeRZztKvR8F5LkvP29l64RuVe1ri8YUoipFbJ/xDIK
 wdCjKUm6l9laboRxNMf8TUu1lA==
X-Google-Smtp-Source: ABdhPJwFfXIh//X7EHLNo+AnlbmzOfKACahzX4QD0E3Glw+DJG8CEO9chK+4dAIqaXdcYcOu6l2roQ==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr3622489wmr.162.1608128942773; 
 Wed, 16 Dec 2020 06:29:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3273367wrr.85.2020.12.16.06.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:29:02 -0800 (PST)
Date: Wed, 16 Dec 2020 15:29:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] drm: Use a const drm_driver for legacy PCI devices
Message-ID: <X9oZrB2Y+/eUrXwf@phenom.ffwll.local>
References: <20201215203126.10175-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201215203126.10175-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215203126.10175-3-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Edmund Dea <edmund.j.dea@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 10:31:25PM +0200, Laurent Pinchart wrote:
> Now that the legacy PCI support code doesn't need to write to the
> drm_driver structure, it can be treated as const through the whole DRM
> core, unconditionally. This allows declaring the structure as const in
> all drivers, removing one possible attack vector.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I didn't inquire the compiler whether you got all the combos right, but
looks complete.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_drv.c |  4 ----
>  drivers/gpu/drm/drm_pci.c |  8 +++++---
>  include/drm/drm_device.h  |  4 ----
>  include/drm/drm_legacy.h  | 10 ++++++----
>  4 files changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 734303802bc3..3f57e880685e 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -589,11 +589,7 @@ static int drm_dev_init(struct drm_device *dev,
>  
>  	kref_init(&dev->ref);
>  	dev->dev = get_device(parent);
> -#ifdef CONFIG_DRM_LEGACY
> -	dev->driver = (struct drm_driver *)driver;
> -#else
>  	dev->driver = driver;
> -#endif
>  
>  	INIT_LIST_HEAD(&dev->managed.resources);
>  	spin_lock_init(&dev->managed.lock);
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index dfb138aaccba..5370e6b492fd 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -201,7 +201,7 @@ static void drm_pci_agp_init(struct drm_device *dev)
>  
>  static int drm_get_pci_dev(struct pci_dev *pdev,
>  			   const struct pci_device_id *ent,
> -			   struct drm_driver *driver)
> +			   const struct drm_driver *driver)
>  {
>  	struct drm_device *dev;
>  	int ret;
> @@ -255,7 +255,8 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
> +int drm_legacy_pci_init(const struct drm_driver *driver,
> +			struct pci_driver *pdriver)
>  {
>  	struct pci_dev *pdev = NULL;
>  	const struct pci_device_id *pid;
> @@ -300,7 +301,8 @@ EXPORT_SYMBOL(drm_legacy_pci_init);
>   * Unregister a DRM driver shadow-attached through drm_legacy_pci_init(). This
>   * is deprecated and only used by dri1 drivers.
>   */
> -void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
> +void drm_legacy_pci_exit(const struct drm_driver *driver,
> +			 struct pci_driver *pdriver)
>  {
>  	struct drm_device *dev, *tmp;
>  
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bd5abe7cd48f..939904ae88fc 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -76,11 +76,7 @@ struct drm_device {
>  	} managed;
>  
>  	/** @driver: DRM driver managing the device */
> -#ifdef CONFIG_DRM_LEGACY
> -	struct drm_driver *driver;
> -#else
>  	const struct drm_driver *driver;
> -#endif
>  
>  	/**
>  	 * @dev_private:
> diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
> index 852d7451eeb1..8ed04e9be997 100644
> --- a/include/drm/drm_legacy.h
> +++ b/include/drm/drm_legacy.h
> @@ -198,8 +198,10 @@ struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
>  				     size_t align);
>  void drm_pci_free(struct drm_device *dev, struct drm_dma_handle *dmah);
>  
> -int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
> -void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
> +int drm_legacy_pci_init(const struct drm_driver *driver,
> +			struct pci_driver *pdriver);
> +void drm_legacy_pci_exit(const struct drm_driver *driver,
> +			 struct pci_driver *pdriver);
>  
>  #else
>  
> @@ -214,13 +216,13 @@ static inline void drm_pci_free(struct drm_device *dev,
>  {
>  }
>  
> -static inline int drm_legacy_pci_init(struct drm_driver *driver,
> +static inline int drm_legacy_pci_init(const struct drm_driver *driver,
>  				      struct pci_driver *pdriver)
>  {
>  	return -EINVAL;
>  }
>  
> -static inline void drm_legacy_pci_exit(struct drm_driver *driver,
> +static inline void drm_legacy_pci_exit(const struct drm_driver *driver,
>  				       struct pci_driver *pdriver)
>  {
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
