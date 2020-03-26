Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665A193DDD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 12:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF4089241;
	Thu, 26 Mar 2020 11:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3974E89241
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 11:30:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j17so7226428wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SH22KWe1hT6c0thd/+qCFAA217uZva8JGmRsF7nMdrA=;
 b=Udzcw45qPPv5A25jk54OFhj4fJwPHOulVPqhrWDFHVr7egVfXw1/rrCOFyiXC9/5Bp
 v/WLaUaIbebAQRjSvqpEPj4tK9OytkaOuGtNkEAudOoSpyHwDtBfqDwnneFLkLXEc/rt
 c1qapb5G/wcuTC+RV9F5OhQpkQRnaZiASAjvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SH22KWe1hT6c0thd/+qCFAA217uZva8JGmRsF7nMdrA=;
 b=XxRWl1lYZqCBqCIgnxQDDAJPGa2OHvd1XBr4kyCDHJuSl8BPFGI3R+beu1ouyw+S0S
 zc6KlTDvmg5sMJwzs3GWyCS7nmWUEZ7hSex9rl+a82k8uHya3GQXlPoH/e0DOBCLgt2O
 Y7XVYgu3NQBs/Mpux1d1R7j+XRgGwTn8WGQdkhlyH/6xMP6zD8vDtNda/0ZvMFxuvijL
 icQt6Q25AgPeh2/puJEmlJILv4gOWddmvXaK6bWE3pYnIYknIIEeAnX82h3QvDyLCw3B
 bOotNFFnTxPjTPDF7bQbikEaxflFjctraU9nDq5n7KosX9ZHOQNnWa16c3TE3ucPKYhQ
 xEqw==
X-Gm-Message-State: ANhLgQ0IjjAXQEXX5zGsyyEWAw5zq/x0tc7IOtIoWmbawRG/xWX5axjB
 YFFGip6OmlbWlbb9WrWXxeUKQA==
X-Google-Smtp-Source: ADFU+vtXp3l+t9NAurWabAT9joFdTO4RnwXRXgDGk4vJs2NLHapAKQS6g3wo+eJTwAhIGXmdalQRlw==
X-Received: by 2002:adf:b60d:: with SMTP id f13mr9335271wre.12.1585222203361; 
 Thu, 26 Mar 2020 04:30:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c5sm10817838wma.3.2020.03.26.04.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 04:30:01 -0700 (PDT)
Date: Thu, 26 Mar 2020 12:29:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/vboxvideo: Add missing
 remove_conflicting_pci_framebuffers call
Message-ID: <20200326112959.GZ2363188@phenom.ffwll.local>
References: <20200325144310.36779-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325144310.36779-1-hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 25, 2020 at 03:43:10PM +0100, Hans de Goede wrote:
> The vboxvideo driver is missing a call to remove conflicting framebuffers.
> 
> Surprisingly, when using legacy BIOS booting this does not really cause
> any issues. But when using UEFI to boot the VM then plymouth will draw
> on both the efifb /dev/fb0 and /dev/drm/card0 (which has registered
> /dev/fb1 as fbdev emulation).
> 
> VirtualBox will actual display the output of both devices (I guess it is
> showing whatever was drawn last), this causes weird artifacts because of
> pitch issues in the efifb when the VM window is not sized at 1024x768
> (the window will resize to its last size once the vboxvideo driver loads,
> changing the pitch).
> 
> Adding the missing drm_fb_helper_remove_conflicting_pci_framebuffers()
> call fixes this.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2695eae1f6d3 ("drm/vboxvideo: Switch to generic fbdev emulation")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index 8512d970a09f..261255085918 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -76,6 +76,10 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto err_mode_fini;
>  
> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
> +	if (ret)
> +		goto err_irq_fini;

To avoid transient issues this should be done as early as possible,
definitely before the drm driver starts to touch the "hw". With that

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I do wonder though why the automatic removal of conflicting framebuffers
doesn't work, fbdev should already do that from register_framebuffer(),
which is called somewhere in drm_fbdev_generic_setup (after a few layers).

Did you check why the two framebuffers don't conflict, and why the uefi
one doesn't get thrown out?
-Daniel

> +
>  	ret = drm_fbdev_generic_setup(&vbox->ddev, 32);
>  	if (ret)
>  		goto err_irq_fini;
> -- 
> 2.26.0.rc2
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
