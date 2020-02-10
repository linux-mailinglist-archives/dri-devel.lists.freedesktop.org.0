Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E293F157DEC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 15:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D9A6EC6F;
	Mon, 10 Feb 2020 14:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0ED6EC6F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 14:55:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c84so671507wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=e6DHkRv/RjVLMoJccwFow7vvIDkBmRxpatiW9uqHzAA=;
 b=T3AIPwpHb40S1bpKetV7hO985S/I88xVqo8fkgncaFoZN33BL4HETEu++2ciOa8uFG
 4+msmny/lboaWn7mnopixrx1reZqDzIkhoAEflSmF/Rk01KUe7jk8RKOIWrN8RM8u+7m
 XKvVhnzIo54T6UE9cYaSQnZGDIP/Ql6gl7VIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=e6DHkRv/RjVLMoJccwFow7vvIDkBmRxpatiW9uqHzAA=;
 b=TLuU7jACaKIxw71u4u285z0+9gwjlLX6XPTqfG0Cdgwxt2TWhRWHOoYa9Im3GUH8JR
 iUwkDh23DzlzOA0gX7pEFwMAnz09PnGwKTuninknd2rt02uIjPkj3UpFxb/zqOOroNDD
 BQz1zA319laokONDeZCsXE3S3+2KL2zvvdiNWvUqXHDhCoNkIkcMRp328gHImx13rxKv
 LphG4ovvrwJWpM85ZX6fgS6gvq9lHzHaDkjoKm00D2oKrOFnyqe5XCSOPLIs63RLb+7l
 49sl+x9sRWAkKDmmnvxDiYIMtY3pjh09AQJ7iQ9BpCPD9GkQHVp2FWn+Lw9vrU3VaKSE
 aYIQ==
X-Gm-Message-State: APjAAAW03uBNj7ppXBLEzI6uDeGrCloYyf1tqs99932OFfrgusCAZs2z
 RW3KRn0EXu7ujUW7nFAhnZDBjA==
X-Google-Smtp-Source: APXvYqwyb3cBhEKTprq13qfJXLglASZPW0m/htnQi0Lz1UZwEiKsNxIUIoHqj1hTCGDthl5O4Ffi8A==
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr16308048wmb.33.1581346539278; 
 Mon, 10 Feb 2020 06:55:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n13sm887530wmd.21.2020.02.10.06.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 06:55:38 -0800 (PST)
Date: Mon, 10 Feb 2020 15:55:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/bochs: add drm_driver.release callback.
Message-ID: <20200210145536.GR43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200210093801.4773-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210093801.4773-1-kraxel@redhat.com>
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

On Mon, Feb 10, 2020 at 10:38:01AM +0100, Gerd Hoffmann wrote:
> Call drm_dev_unregister() first in bochs_pci_remove().  Hook
> bochs_unload() into the new .release callback, to make sure cleanup
> is done when all users are gone.
> 
> Add ready bool to state struct and move bochs_hw_fini() call from
> bochs_unload() to bochs_pci_remove() to make sure hardware is not
> touched after bochs_pci_remove returns.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs.h     |  1 +
>  drivers/gpu/drm/bochs/bochs_drv.c |  6 +++---
>  drivers/gpu/drm/bochs/bochs_hw.c  | 14 ++++++++++++++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
> index 917767173ee6..f6bce8669274 100644
> --- a/drivers/gpu/drm/bochs/bochs.h
> +++ b/drivers/gpu/drm/bochs/bochs.h
> @@ -57,6 +57,7 @@ struct bochs_device {
>  	unsigned long  fb_base;
>  	unsigned long  fb_size;
>  	unsigned long  qext_size;
> +	bool           ready;
>  
>  	/* mode */
>  	u16 xres;
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index 10460878414e..60b5492739ef 100644
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
> -	drm_atomic_helper_shutdown(dev);
>  	drm_dev_unregister(dev);
> -	bochs_unload(dev);
> +	drm_atomic_helper_shutdown(dev);
> +	bochs_hw_fini(dev);
>  	drm_dev_put(dev);
>  }
>  
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index b615b7dfdd9d..48c1a6a8b026 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -168,6 +168,7 @@ int bochs_hw_init(struct drm_device *dev)
>  	}
>  	bochs->fb_base = addr;
>  	bochs->fb_size = size;
> +	bochs->ready = true;
>  
>  	DRM_INFO("Found bochs VGA, ID 0x%x.\n", id);
>  	DRM_INFO("Framebuffer size %ld kB @ 0x%lx, %s @ 0x%lx.\n",
> @@ -194,6 +195,10 @@ void bochs_hw_fini(struct drm_device *dev)
>  {
>  	struct bochs_device *bochs = dev->dev_private;
>  
> +	bochs->ready = false;
> +
> +	/* TODO: shot down existing vram mappings */

Aside: I'm mildly hopefull that we could do this with a generic helper,
both punching out all current ptes and replacing them with something
dummy. Since replacing them with nothing and refusing to fault stuff is
probably not going to work out well - userspace will crash&burn too much.

> +
>  	if (bochs->mmio)
>  		iounmap(bochs->mmio);
>  	if (bochs->ioports)
> @@ -207,6 +212,9 @@ void bochs_hw_fini(struct drm_device *dev)
>  void bochs_hw_setmode(struct bochs_device *bochs,
>  		      struct drm_display_mode *mode)
>  {
> +	if (!bochs->ready)
> +		return;

drm_dev_enter/exit is the primitive you're looking for I think. Don't hand
roll your own racy version of this. btw changelog in the patch missing.
Personally I'd split out the drm_dev_enter/exit in a 2nd patch, but up to
you.

The remove/release split looks correct to me now.
-Daniel


> +
>  	bochs->xres = mode->hdisplay;
>  	bochs->yres = mode->vdisplay;
>  	bochs->bpp = 32;
> @@ -237,6 +245,9 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>  void bochs_hw_setformat(struct bochs_device *bochs,
>  			const struct drm_format_info *format)
>  {
> +	if (!bochs->ready)
> +		return;
> +
>  	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
>  			 (format->format >>  0) & 0xff,
>  			 (format->format >>  8) & 0xff,
> @@ -264,6 +275,9 @@ void bochs_hw_setbase(struct bochs_device *bochs,
>  	unsigned long offset;
>  	unsigned int vx, vy, vwidth;
>  
> +	if (!bochs->ready)
> +		return;
> +
>  	bochs->stride = stride;
>  	offset = (unsigned long)addr +
>  		y * bochs->stride +
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
