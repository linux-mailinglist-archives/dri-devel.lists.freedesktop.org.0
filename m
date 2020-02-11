Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E401591C1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 15:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6386EA88;
	Tue, 11 Feb 2020 14:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A8F6EA88
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 14:22:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s144so2382717wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbCpoEzMkXhuds3sawE1UyW9vC3Fj6dPXq0u004qUn4=;
 b=KzUjILm1iSPNky6CD9uanf3G3iyYl/J28iOaqMo/AmK22/0X3/LFIPTbBn0ydkCkiQ
 N3TUyrOKjzvrCTmwbRapoiQDmjvHM/cdxSkI7kAxwhN3rhvuh51eMXEvhkDwIyxgMbLr
 MmDPzcI626frvOBJR1qfCVefDQp0ipbGYci1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=zbCpoEzMkXhuds3sawE1UyW9vC3Fj6dPXq0u004qUn4=;
 b=F/HXrBstDMWxlHPZCOb9ApxNidSFbEXHDe1lt1uf7YXhFsadT38u+qpvdh2fTQeeQ1
 GgjIbkisGLbUWJdpOtn7xB+LjnVQIKXVv3wDwUJMPJ4x0p7eS6CVAi0rQ1z7V2CkACAg
 o+oUaQri8VR10Ayyx8EokE4QaZ6ap9Q7YEZyqnn9LeTq6WRdJGnoJl/khIwSDci505Z6
 NW1toDZj5tHBHYo4vLJgcw+MGcx9SfxPmdWk/9iOi3eS3EHEjBlH0vff2O2oPTB6woeB
 IZlTn8oSYiOGCoBZd4ycKLJVIV3rB7GF4WD6VokVjEeMcuLEKWdgX4aBDW9DdUD+DFRk
 FPZw==
X-Gm-Message-State: APjAAAXHtlvz2WUxzPHn/7mcw9YbihrNRCCVp1quvp+dAo0OfWy59xVo
 ATl7K/7EfyPlr6rXXo4gw6/LRQ==
X-Google-Smtp-Source: APXvYqzYF5XCaXVSaa4gHRNv6N8Qaghaww1USAbGGjBeOKDuCJVmSMfWpAroKmZNMq/swNcVY7dXLQ==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr5621995wmi.37.1581430964656; 
 Tue, 11 Feb 2020 06:22:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c4sm3869494wml.7.2020.02.11.06.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:22:44 -0800 (PST)
Date: Tue, 11 Feb 2020 15:22:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4] drm/cirrus: add drm_driver.release callback.
Message-ID: <20200211142242.GD2363188@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200211135522.23654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211135522.23654-1-kraxel@redhat.com>
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

On Tue, Feb 11, 2020 at 02:55:22PM +0100, Gerd Hoffmann wrote:
> Move final cleanups from cirrus_pci_remove() to the new callback.
> Add drm_atomic_helper_shutdown() call to cirrus_pci_remove().
> 
> Use drm_dev_{enter,exit,unplug} to avoid touching hardware after
> device removal.
> 
> v4: add changelog.
> v3: use drm_dev*.
> v2: stop touching hardware after pci_remove().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

I think you got them all with drm_dev_enter/exit.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Aside: everyone ignores the return value of cirrus_fb_blit_rect and
cirrus_mode_set (with atomic those shouldn't be able to fail anymore),
could ditch those.
-Daniel

> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 43 ++++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
> index a91fb0d7282c..d2ff63ce8eaf 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -151,9 +151,13 @@ static int cirrus_pitch(struct drm_framebuffer *fb)
>  
>  static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
>  {
> +	int idx;
>  	u32 addr;
>  	u8 tmp;
>  
> +	if (!drm_dev_enter(&cirrus->dev, &idx))
> +		return;
> +
>  	addr = offset >> 2;
>  	wreg_crt(cirrus, 0x0c, (u8)((addr >> 8) & 0xff));
>  	wreg_crt(cirrus, 0x0d, (u8)(addr & 0xff));
> @@ -168,6 +172,8 @@ static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
>  	tmp &= 0x7f;
>  	tmp |= (addr >> 12) & 0x80;
>  	wreg_crt(cirrus, 0x1d, tmp);
> +
> +	drm_dev_exit(idx);
>  }
>  
>  static int cirrus_mode_set(struct cirrus_device *cirrus,
> @@ -176,9 +182,12 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
>  {
>  	int hsyncstart, hsyncend, htotal, hdispend;
>  	int vtotal, vdispend;
> -	int tmp;
> +	int tmp, idx;
>  	int sr07 = 0, hdr = 0;
>  
> +	if (!drm_dev_enter(&cirrus->dev, &idx))
> +		return -1;
> +
>  	htotal = mode->htotal / 8;
>  	hsyncend = mode->hsync_end / 8;
>  	hsyncstart = mode->hsync_start / 8;
> @@ -264,6 +273,7 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
>  		hdr = 0xc5;
>  		break;
>  	default:
> +		drm_dev_exit(idx);
>  		return -1;
>  	}
>  
> @@ -292,6 +302,8 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
>  
>  	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
>  	outb(0x20, 0x3c0);
> +
> +	drm_dev_exit(idx);
>  	return 0;
>  }
>  
> @@ -300,10 +312,16 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  {
>  	struct cirrus_device *cirrus = fb->dev->dev_private;
>  	void *vmap;
> +	int idx, ret;
>  
> +	ret = -ENODEV;
> +	if (!drm_dev_enter(&cirrus->dev, &idx))
> +		goto out;
> +
> +	ret = -ENOMEM;
>  	vmap = drm_gem_shmem_vmap(fb->obj[0]);
>  	if (!vmap)
> -		return -ENOMEM;
> +		goto out_dev_exit;
>  
>  	if (cirrus->cpp == fb->format->cpp[0])
>  		drm_fb_memcpy_dstclip(cirrus->vram,
> @@ -323,7 +341,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  		WARN_ON_ONCE("cpp mismatch");
>  
>  	drm_gem_shmem_vunmap(fb->obj[0], vmap);
> -	return 0;
> +	ret = 0;
> +
> +out_dev_exit:
> +	drm_dev_exit(idx);
> +out:
> +	return ret;
>  }
>  
>  static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb)
> @@ -502,6 +525,14 @@ static void cirrus_mode_config_init(struct cirrus_device *cirrus)
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
> @@ -515,6 +546,7 @@ static struct drm_driver cirrus_driver = {
>  
>  	.fops		 = &cirrus_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.release         = cirrus_release,
>  };
>  
>  static int cirrus_pci_probe(struct pci_dev *pdev,
> @@ -598,12 +630,11 @@ static void cirrus_pci_remove(struct pci_dev *pdev)
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  	struct cirrus_device *cirrus = dev->dev_private;
>  
> -	drm_dev_unregister(dev);
> -	drm_mode_config_cleanup(dev);
> +	drm_dev_unplug(dev);
> +	drm_atomic_helper_shutdown(dev);
>  	iounmap(cirrus->mmio);
>  	iounmap(cirrus->vram);
>  	drm_dev_put(dev);
> -	kfree(cirrus);
>  	pci_release_regions(pdev);
>  }
>  
> -- 
> 2.18.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
