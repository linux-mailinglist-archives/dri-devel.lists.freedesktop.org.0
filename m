Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42617C143
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 16:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8786ED39;
	Fri,  6 Mar 2020 15:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7A46ED39
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 15:08:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s17so1861278wrs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 07:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ysXldqv1Z0zsa1ON+x2Gn3coqEwcboUv57QwmmZBxdo=;
 b=Z0vGaFbynwScoEN+u5RTZCskWkbkRK+4scfdcW7b97beb7ABTZHWXyh6oREb9Mzly4
 SvBYd2AYn4+wQP3ZFPjEUPLlm66HVYFLMKfffwSKnFosALkZzmPGIrswikZTa+GTxCeo
 JNr/6AxAno2L/C5Mxjm0pHh5JzmtEKRbRtNfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ysXldqv1Z0zsa1ON+x2Gn3coqEwcboUv57QwmmZBxdo=;
 b=EpFNl+31EEYDq4czWpSwJvFqY6syi4Xcl0NqJ7uQunGYV5Uqbuz8Mx0hoofF7wVklm
 Gao6sEhVhyDrqyXVB0eoQyCwDFEnEvSEsiwsdkR/8vfWDZHbpV/nWq2DdWTBPw4vrS4t
 tqU29rj90zv7X5ZwWpZXVpH7zLs4p/LE6eU/MVwKisiFKpofZtd69zlL5BYlwDlV43UL
 5gfM/5ryOBjrn4n+/7+FGUjey21O9y9QdPVfSSUnFIxYkL58yCplN/HtfgaKTsrMN026
 Ov5miJQF92QYyWrG9YlTwMqgPkz3R1AHIsgn1v6IGne2Trcc5UhB0d7C0mMGww79RpnG
 7XJQ==
X-Gm-Message-State: ANhLgQ3tWN5S0yUBFwgo7dOaEKLGkIChysoY236A4REEwdcCW6pgARcL
 AtwrPxJplkNLSIKrIfZKSyOODZ5CWnE=
X-Google-Smtp-Source: ADFU+vtqc8Ks0xsU2q3mkTh9HeEiZ4EcN9tu/WEslIPdG9ceQwOkleB+8Pg8hc7N1MIi6e8YbgjYkQ==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr4659355wrw.313.1583507327400; 
 Fri, 06 Mar 2020 07:08:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 19sm15678269wma.3.2020.03.06.07.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 07:08:46 -0800 (PST)
Date: Fri, 6 Mar 2020 16:08:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/pci: Unexport drm_get_pci_dev
Message-ID: <20200306150844.GB2363188@phenom.ffwll.local>
References: <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
 <20200225165835.2394442-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225165835.2394442-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 05:58:35PM +0100, Daniel Vetter wrote:
> Only user left is the shadow attach for legacy drivers.
> 
> v2: Shift the #ifdef CONFIG_DRM_LEGACY to now also include
> drm_get_pci_dev() (Thomas)
> 
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Pushed to drm-misc-next now that the radeon/amdgpu patches have been
backmerged.
-Daniel

> ---
>  drivers/gpu/drm/drm_pci.c | 26 +++++---------------------
>  include/drm/drm_pci.h     | 11 -----------
>  2 files changed, 5 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index c6bb98729a26..5218475ad7e7 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -75,7 +75,6 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
>  
>  	return dmah;
>  }
> -
>  EXPORT_SYMBOL(drm_pci_alloc);
>  
>  /**
> @@ -191,23 +190,11 @@ void drm_pci_agp_destroy(struct drm_device *dev)
>  	}
>  }
>  
> -/**
> - * drm_get_pci_dev - Register a PCI device with the DRM subsystem
> - * @pdev: PCI device
> - * @ent: entry from the PCI ID table that matches @pdev
> - * @driver: DRM device driver
> - *
> - * Attempt to gets inter module "drm" information. If we are first
> - * then register the character device and inter module information.
> - * Try and register, if we fail to register, backout previous work.
> - *
> - * NOTE: This function is deprecated, please use drm_dev_alloc() and
> - * drm_dev_register() instead and remove your &drm_driver.load callback.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
> -		    struct drm_driver *driver)
> +#ifdef CONFIG_DRM_LEGACY
> +
> +static int drm_get_pci_dev(struct pci_dev *pdev,
> +			   const struct pci_device_id *ent,
> +			   struct drm_driver *driver)
>  {
>  	struct drm_device *dev;
>  	int ret;
> @@ -250,9 +237,6 @@ int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
>  	drm_dev_put(dev);
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_get_pci_dev);
> -
> -#ifdef CONFIG_DRM_LEGACY
>  
>  /**
>   * drm_legacy_pci_init - shadow-attach a legacy DRM PCI driver
> diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
> index 9031e217b506..3941b0255ecf 100644
> --- a/include/drm/drm_pci.h
> +++ b/include/drm/drm_pci.h
> @@ -45,10 +45,6 @@ struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
>  				     size_t align);
>  void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
>  
> -int drm_get_pci_dev(struct pci_dev *pdev,
> -		    const struct pci_device_id *ent,
> -		    struct drm_driver *driver);
> -
>  #else
>  
>  static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
> @@ -62,13 +58,6 @@ static inline void drm_pci_free(struct drm_device *dev,
>  {
>  }
>  
> -static inline int drm_get_pci_dev(struct pci_dev *pdev,
> -				  const struct pci_device_id *ent,
> -				  struct drm_driver *driver)
> -{
> -	return -ENOSYS;
> -}
> -
>  #endif
>  
>  #endif /* _DRM_PCI_H_ */
> -- 
> 2.24.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
