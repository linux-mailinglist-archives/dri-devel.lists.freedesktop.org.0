Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161931558A6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 14:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303456E04B;
	Fri,  7 Feb 2020 13:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E346D6E04B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 13:42:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c84so2814308wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=TyPPRLKeipDPd+u8tqRuMDYkhQE0y3JFQkWBFGYN/N8=;
 b=Q6ayxrGsTc4a7zvF4JrnE8pm2eVELARdVSK6Pfhkt5GjlpNQouAG/N05fastzNDYtV
 0s/3GOaVVtss8j7chaZqG7vGZQRceoD5tg/UC5OVWooSkOcqvpqBBdeYlbu8DDxfb+oM
 BOI3HVjzmrTIXfiK6zcpxNhHPSzQPSjhdF8vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=TyPPRLKeipDPd+u8tqRuMDYkhQE0y3JFQkWBFGYN/N8=;
 b=KyfriaEfo5T2zc8KT51e3fbSiNtStl+t14I8QzYkT3IRdPjexNziwxyiyvK1CzNGOQ
 FGvpfXXOEUY3TTK6QhoDKhiCm0oye/K22jYuVG3swfN5X0L01m7KgK7RNfxuQwLZAa7g
 AHMsuwEY5l7McbxJq5dzDcgq1Fc+CxZRXi1Ix6hqEs4u0oWK7LrLDi/IaupLv8cLGUnN
 5sPdGcFtjBSqvIBxJBfAPljWGyn5g52EDO/cwMiwXa31DP4h5+7AXRgLsz8YgKDuL148
 X7CWkUGy3W1KZoSzqT1f89hVKJJ5uakJwuzwRSHKjnbpm3hDnXW1TqqEc+iX5Xba/5bg
 Kw3A==
X-Gm-Message-State: APjAAAXU1EHTBXlFhIzftUuDebRC+5QuuYTp/38M4mzfWpSutMU5Lkcz
 h0KioQwl4LOmVVTYLwGjgVtHaw==
X-Google-Smtp-Source: APXvYqxhatD4Js1NKtiy3XyO7Te5rVWuR1uUeZlh84mCoY9NL3oeMACk2iagMiLuPOki+LjjhnCnBA==
X-Received: by 2002:a1c:9a84:: with SMTP id c126mr4594084wme.111.1581082948462; 
 Fri, 07 Feb 2020 05:42:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i16sm3175338wrr.71.2020.02.07.05.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:42:27 -0800 (PST)
Date: Fri, 7 Feb 2020 14:42:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/bochs: add drm_driver.release callback.
Message-ID: <20200207134225.GA43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200207121312.25296-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207121312.25296-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 01:13:12PM +0100, Gerd Hoffmann wrote:
> From: Gurchetan Singh <gurchetansingh@chromium.org>
> 
> Move bochs_unload call from bochs_remove() to the new bochs_release()
> callback.  Also call drm_dev_unregister() first in bochs_remove().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs_drv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index 10460878414e..87ee1eb21a4d 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -60,6 +60,11 @@ static int bochs_load(struct drm_device *dev)
>  
>  DEFINE_DRM_GEM_FOPS(bochs_fops);
>  
> +static void bochs_release(struct drm_device *dev)
> +{
> +	bochs_unload(dev);

Hm I think this needs to be split, and bochs_hw_fini needs to stay in
bochs_pci_remove. Otherwise we again release the iommu mappings too late
(there was just a discussion about that on the fbdev side of things
getting this wrong). Good to fix the lifetime fun here, but let's not move
too far :-)

Ideally we'd move the iomapping to devm_, that would remove it at the
right time I think.

Slight annoyance might be that we then need to shoot down the varios
mmaps, which I frankly don't know how to do. But keeping them pointing at
wrong stuff also isn't that great :-/

Cheers, Daniel

> +}
> +
>  static struct drm_driver bochs_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			= &bochs_fops,
> @@ -69,6 +74,7 @@ static struct drm_driver bochs_driver = {
>  	.major			= 1,
>  	.minor			= 0,
>  	DRM_GEM_VRAM_DRIVER,
> +	.release                = bochs_release,
>  };
>  
>  /* ---------------------------------------------------------------------- */
> @@ -148,9 +154,8 @@ static void bochs_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  
> -	drm_atomic_helper_shutdown(dev);
>  	drm_dev_unregister(dev);
> -	bochs_unload(dev);
> +	drm_atomic_helper_shutdown(dev);
>  	drm_dev_put(dev);
>  }
>  
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
