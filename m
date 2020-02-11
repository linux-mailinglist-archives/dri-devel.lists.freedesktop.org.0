Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46488158B46
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 09:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB666E47E;
	Tue, 11 Feb 2020 08:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C9A6E47E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 08:34:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so2349035wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=12qw/RFELavELZKsOq1yzoNyYhq/Ux+p6kyJPJeCcqc=;
 b=QI4VOXf3saIUDZus86WXKl/5G4HwG/Y1akgMO5N+Zghil5vjsjTK+Flc9x/BBjmGtf
 VbYX62Zkk1RcDpfJlb5YwCRepv0UavNrhSZsp7c+wuwoHBcbvfkUeRiuEGe6d2Hs2zx+
 HAz7E7DC78LgnltTfwXg24XFBDY5JYWfGFWBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=12qw/RFELavELZKsOq1yzoNyYhq/Ux+p6kyJPJeCcqc=;
 b=EzvWc7gIcz0GBVsfLm6IDFkbPJCpLlpg5DzfXJN8zQsHk1DYwJkqMds4DQ/AqtYO0p
 xlEdOmuLBE/8EDfmYG3MOuoj0HDq8psdw0Llkm0BSDwFYx4o5yrgJtM+4NxMxZsTNyq+
 Xh9efDSUlGmvcSC3e3hpwKJmSxjURaGbXYIox6cq0o20CYfP1tkqZpsrDalSu3qT41z4
 00CodiBiFU5cM6EtGBXSlH2zRvIF9xYbnbooJ0o+L8WgiOfLxRSCl9RLhFaaPQ5iUoYr
 Hvf8RnWI44qVyRVxWZyam6VGCPzf2dUdTzPmYBKvYSaP4P/0Bz07HzIc/FdmSqVRHc/g
 MpaQ==
X-Gm-Message-State: APjAAAUoS/MKoTL5/Zuxw3mx30cy9W2+Qwi9NjpjvWApzP/jhqbhI9yW
 sl5avcmbOOesrZgsIqxqGwASIw==
X-Google-Smtp-Source: APXvYqyEaWqr2XnROAuhm5FRvC1dX2wrJbzfmgnLMEqqjLALysv8sqHunmyirob+p+K0RO4wYl3V2w==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr4157625wmk.131.1581410057135; 
 Tue, 11 Feb 2020 00:34:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t81sm2857643wmg.6.2020.02.11.00.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 00:34:16 -0800 (PST)
Date: Tue, 11 Feb 2020 09:34:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/cirrus: add drm_driver.release callback.
Message-ID: <20200211083414.GT43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200210095310.22082-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210095310.22082-1-kraxel@redhat.com>
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
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 10:53:10AM +0100, Gerd Hoffmann wrote:
> Move final cleanups from cirrus_pci_remove() to the new callback.
> Add drm_atomic_helper_shutdown() call to cirrus_pci_remove().
> 
> Set pointers to NULL after iounmap() and check them before using
> them to make sure we don't touch released hardware.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
> index a91fb0d7282c..128db11ed4d3 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -154,6 +154,9 @@ static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
>  	u32 addr;
>  	u8 tmp;
>  
> +	if (!cirrus->mmio)
> +		return;

Same as with the previous one, I think you're looking for
drm_dev_enter/exit. And missing patch changelog. remove/release split
looks good otherwise.
-Daniel

> +
>  	addr = offset >> 2;
>  	wreg_crt(cirrus, 0x0c, (u8)((addr >> 8) & 0xff));
>  	wreg_crt(cirrus, 0x0d, (u8)(addr & 0xff));
> @@ -179,6 +182,9 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
>  	int tmp;
>  	int sr07 = 0, hdr = 0;
>  
> +	if (!cirrus->mmio)
> +		return -1;
> +
>  	htotal = mode->htotal / 8;
>  	hsyncend = mode->hsync_end / 8;
>  	hsyncstart = mode->hsync_start / 8;
> @@ -301,6 +307,9 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	struct cirrus_device *cirrus = fb->dev->dev_private;
>  	void *vmap;
>  
> +	if (!cirrus->vram)
> +		return -ENODEV;
> +
>  	vmap = drm_gem_shmem_vmap(fb->obj[0]);
>  	if (!vmap)
>  		return -ENOMEM;
> @@ -502,6 +511,14 @@ static void cirrus_mode_config_init(struct cirrus_device *cirrus)
>  
>  /* ------------------------------------------------------------------ */
>  
> +static void cirrus_release(struct drm_device *dev)
> +{
> +	struct cirrus_device *cirrus = dev->dev_private;
> +
> +	drm_mode_config_cleanup(dev);
> +	kfree(cirrus);
> +}
> +
>  DEFINE_DRM_GEM_FOPS(cirrus_fops);
>  
>  static struct drm_driver cirrus_driver = {
> @@ -515,6 +532,7 @@ static struct drm_driver cirrus_driver = {
>  
>  	.fops		 = &cirrus_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.release         = cirrus_release,
>  };
>  
>  static int cirrus_pci_probe(struct pci_dev *pdev,
> @@ -599,11 +617,12 @@ static void cirrus_pci_remove(struct pci_dev *pdev)
>  	struct cirrus_device *cirrus = dev->dev_private;
>  
>  	drm_dev_unregister(dev);
> -	drm_mode_config_cleanup(dev);
> +	drm_atomic_helper_shutdown(dev);
>  	iounmap(cirrus->mmio);
> +	cirrus->mmio = NULL;
>  	iounmap(cirrus->vram);
> +	cirrus->vram = NULL;
>  	drm_dev_put(dev);
> -	kfree(cirrus);
>  	pci_release_regions(pdev);
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
