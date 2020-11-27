Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E72C6880
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 16:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1419F6EE2D;
	Fri, 27 Nov 2020 15:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285AE6EE2D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:13:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u12so5949386wrt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 07:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jdic1AcrtNbfCiOP1a193foU7ToP7PxTGmucyyLllzY=;
 b=eFkd8QxSc1ZwnhEaZi3HO0lu4NUyuYVEKihdUegxYkQ76EDIVKbAU6Bz62Y0Twd/D9
 WkS/7z1edRNON6EjPBTY2oz0UK+fNJn9Pyyyy59BYkkszr1NG808l4n5I5/i4XFiGKGC
 MOjfFf3mv5H8mY0U13jMLH9zHk5TEpaTJimLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Jdic1AcrtNbfCiOP1a193foU7ToP7PxTGmucyyLllzY=;
 b=bkdeMPGY89/KkEJ8twDX9CL1cO8kvkq1AxsgmhlrmkHdpnxF/bGD4ZTfFmJNc2moyt
 WWjkDQyMC2FE0nYNJwFtfZF0dmThAfUHxDIfEZm0KRL1obagqyCyUZ3XNl+Pd2Ri9+2L
 5NIAxXZM1uGn4xtaggDtDjrPFjUx9gevY6WMjxtwZg+BZV4Syv3v7SYZiwHpKpS87OW6
 LLghQQKHf0W37rmgTz/zw00stp5yAiBOX5osTNJOYcxVmIT3AW94M66UPff6ydyQ+ANU
 kFoz8VrUWnyuFSG59W5/bJoLKCcCNxtCqkdRJAtaKv5OAHZE8sTDbFtyWnavRn6zITFJ
 HkDQ==
X-Gm-Message-State: AOAM533ElZUZzeNJCfH8NY3ySSs0zJeNffDpOIMJdkrTh2+EUg+XgdEG
 yl9eLxsPuv+cCW5ThwdJCBGPZg==
X-Google-Smtp-Source: ABdhPJxS76ox3RylPH7RNmHVGlgnXkh2eKF8FznVgSxfvwW00r3yeMyg8znwZMIDlZzB206zrP/Pkw==
X-Received: by 2002:a5d:4c4a:: with SMTP id n10mr11257523wrt.54.1606489989868; 
 Fri, 27 Nov 2020 07:13:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f16sm13178895wmh.7.2020.11.27.07.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:13:09 -0800 (PST)
Date: Fri, 27 Nov 2020 16:13:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/vboxvideo: Used the vram helper
Message-ID: <20201127151307.GG401619@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, hdegoede@redhat.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1606446882-36335-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606446882-36335-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 11:14:42AM +0800, Tian Tao wrote:
> if the driver uses drmm_vram_helper_init, there is no need to
> call drm_vram_helper_release_mm when the drm module get unloaded,
> as this will done automagically.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_ttm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> index f5a0667..e1909a8 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> @@ -16,8 +16,8 @@ int vbox_mm_init(struct vbox_private *vbox)
>  	int ret;
>  	struct drm_device *dev = &vbox->ddev;
>  
> -	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
> -				       vbox->available_vram_size);
> +	vmm = drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
> +				    vbox->available_vram_size);

Pretty sure this doesn't compile without warnings, since the return value
changes. With that fixed lgtm.

Btw if you're bored, a devm_ version of arch_phys_wc_add is very much on
the wishlist, and would allow us to complete remove vbox_mm_fini.

Cheers, Daniel

>  	if (IS_ERR(vmm)) {
>  		ret = PTR_ERR(vmm);
>  		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
> @@ -32,5 +32,4 @@ int vbox_mm_init(struct vbox_private *vbox)
>  void vbox_mm_fini(struct vbox_private *vbox)
>  {
>  	arch_phys_wc_del(vbox->fb_mtrr);
> -	drm_vram_helper_release_mm(&vbox->ddev);
>  }
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
