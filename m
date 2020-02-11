Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9C1591B6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 15:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65396EA77;
	Tue, 11 Feb 2020 14:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C426EA77
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 14:20:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so3779643wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 06:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wnr+//oGH4uXMO6GDB7TwubX/nxe1+x76Hvs2NVGFuc=;
 b=GIQ8GjOqJrhLYKdgtLRlfIIfitARQxNz4LODBM0XdoUf+DS+VdY2Y9sLMV4cFvXUqg
 eDscMY7wgT8H5Jsa2+kdwu0cfcTeX/rUVrc8rw4U8dyqHg7XynQ7Bo4W4Qi0yNelAk05
 JPspZp/zNtqJX4ZkZieNqJdpzqmVjUwIPtOfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Wnr+//oGH4uXMO6GDB7TwubX/nxe1+x76Hvs2NVGFuc=;
 b=pKnMwnNKp/3+Q9tCgh/ejQRewx6vbvyfglGDbVKMkkP8Fzvg1ibCJVPy1RTHQkXHXQ
 UtS/fN1QD31OhNLe06eIkgZq2SRVO4vbqg6Mjh2VxuBY51mK2PaxiaHIn0PZ+8Q8C0kr
 cLYRW6C3R6O6sG2rQn9ZtOOWBLzV2IcGT2Y+Vy61Hkgdx3yTGdgEpNQtkKS9DV4Zm7Bz
 yGReapF1efRuIqgjJ5bmJ3tWY4q+WBwKcyZ8zkSpjw7b2AxgteMkdtt5gNL7BPPHq8an
 Gvd8NsNIKICy2i9dIsfNUbeDhy3meg4vD9x6ffuezvw75L36jRfz2ZRc9RZZiKBhbOS/
 L4Kg==
X-Gm-Message-State: APjAAAVZMY0xXn928Hl4qFthu51D5MhExexLMYlYvdbUXlgvhItoPoNT
 /tiWIUuZwAP2rtgW5f+BzDDm4A==
X-Google-Smtp-Source: APXvYqy6L5KPAi1i0sPrc30Ft7+bqgWt2Wm5wPwnLY5tKsWvuzgkp0nY4PgfSjs3STKYXkE0grFKJA==
X-Received: by 2002:a05:600c:34b:: with SMTP id
 u11mr5830687wmd.69.1581430799258; 
 Tue, 11 Feb 2020 06:19:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q14sm5394758wrj.81.2020.02.11.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:19:58 -0800 (PST)
Date: Tue, 11 Feb 2020 15:19:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4] drm/bochs: add drm_driver.release callback.
Message-ID: <20200211141956.GC2363188@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200211135218.22871-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211135218.22871-1-kraxel@redhat.com>
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
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 02:52:18PM +0100, Gerd Hoffmann wrote:
> Call bochs_unload via drm_driver.release to make sure we release stuff
> when it is safe to do so.  Use drm_dev_{enter,exit,unplug} to avoid
> touching hardware after device removal.  Tidy up here and there.
> 
> v4: add changelog.
> v3: use drm_dev_*().
> v2: move hardware deinit to pci_remove().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Btw I checked around whether there's anything else that obviously needs a
drm_dev_enter/exit, and I spotted the !bochs->mmio check in
bochs_hw_load_edid. That one looks like cargo-cult, there's a single
caller in the init path, so either mmio works at that point or this is
dead code ... slightly confusing.
-Daniel

> ---
>  drivers/gpu/drm/bochs/bochs_drv.c |  6 +++---
>  drivers/gpu/drm/bochs/bochs_hw.c  | 24 +++++++++++++++++++++++-
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index 10460878414e..addb0568c1af 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -23,7 +23,6 @@ static void bochs_unload(struct drm_device *dev)
>  
>  	bochs_kms_fini(bochs);
>  	bochs_mm_fini(bochs);
> -	bochs_hw_fini(dev);
>  	kfree(bochs);
>  	dev->dev_private = NULL;
>  }
> @@ -69,6 +68,7 @@ static struct drm_driver bochs_driver = {
>  	.major			= 1,
>  	.minor			= 0,
>  	DRM_GEM_VRAM_DRIVER,
> +	.release                = bochs_unload,
>  };
>  
>  /* ---------------------------------------------------------------------- */
> @@ -148,9 +148,9 @@ static void bochs_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  
> +	drm_dev_unplug(dev);
>  	drm_atomic_helper_shutdown(dev);
> -	drm_dev_unregister(dev);
> -	bochs_unload(dev);
> +	bochs_hw_fini(dev);
>  	drm_dev_put(dev);
>  }
>  
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index b615b7dfdd9d..952199cc0462 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -4,6 +4,7 @@
>  
>  #include <linux/pci.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fourcc.h>
>  
>  #include "bochs.h"
> @@ -194,6 +195,8 @@ void bochs_hw_fini(struct drm_device *dev)
>  {
>  	struct bochs_device *bochs = dev->dev_private;
>  
> +	/* TODO: shot down existing vram mappings */
> +
>  	if (bochs->mmio)
>  		iounmap(bochs->mmio);
>  	if (bochs->ioports)
> @@ -207,6 +210,11 @@ void bochs_hw_fini(struct drm_device *dev)
>  void bochs_hw_setmode(struct bochs_device *bochs,
>  		      struct drm_display_mode *mode)
>  {
> +	int idx;
> +
> +	if (!drm_dev_enter(bochs->dev, &idx))
> +		return;
> +
>  	bochs->xres = mode->hdisplay;
>  	bochs->yres = mode->vdisplay;
>  	bochs->bpp = 32;
> @@ -232,11 +240,18 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>  
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,
>  			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
> +
> +	drm_dev_exit(idx);
>  }
>  
>  void bochs_hw_setformat(struct bochs_device *bochs,
>  			const struct drm_format_info *format)
>  {
> +	int idx;
> +
> +	if (!drm_dev_enter(bochs->dev, &idx))
> +		return;
> +
>  	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
>  			 (format->format >>  0) & 0xff,
>  			 (format->format >>  8) & 0xff,
> @@ -256,13 +271,18 @@ void bochs_hw_setformat(struct bochs_device *bochs,
>  			  __func__, format->format);
>  		break;
>  	}
> +
> +	drm_dev_exit(idx);
>  }
>  
>  void bochs_hw_setbase(struct bochs_device *bochs,
>  		      int x, int y, int stride, u64 addr)
>  {
>  	unsigned long offset;
> -	unsigned int vx, vy, vwidth;
> +	unsigned int vx, vy, vwidth, idx;
> +
> +	if (!drm_dev_enter(bochs->dev, &idx))
> +		return;
>  
>  	bochs->stride = stride;
>  	offset = (unsigned long)addr +
> @@ -277,4 +297,6 @@ void bochs_hw_setbase(struct bochs_device *bochs,
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vwidth);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
> +
> +	drm_dev_exit(idx);
>  }
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
