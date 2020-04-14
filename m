Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F24A1A84ED
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 18:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F28689CF9;
	Tue, 14 Apr 2020 16:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA41089C9D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:30:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o81so8086283wmo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j6iT+4OltUOabgOBVLnkXdCNEsUQWouuz2jP5vYgELc=;
 b=NIMIF8ZncM3RCZl4gwuajK430pMg4bISfQ7uqeMPuWe/H3hEkwCX2yLw1gxOuLgy0G
 WFB2gv+1wAVr1zpbKbm071xcyqxH4P/Jo/9uk0KP6iI+pCjqrEs+qH2EbbBmWRRQRMLN
 1wQCkUbOQx7Nb2JjANEwz4DPPDLIws1F7HPCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j6iT+4OltUOabgOBVLnkXdCNEsUQWouuz2jP5vYgELc=;
 b=U9h5wi1q+gAPZJFXryMxi9DEe1uuU+uyumzfWRCJsJgxgbuxIzf77HWVQtOtaKiEl5
 R2xWW9BaaczMhVKxo/hkwXvwx/Zoyu/z1S9rVyz1hSAk7uYBzeQA8rOTHuezhN8CySF5
 lKRHjeNc+q69BTCr9zyrwmKwHB6TttIDZ8PQsHvPDwSbPJnTo6bZ84umqO/VZlt2+Cgp
 dsnW/cHWNhKBZ/KlFTDODNBtFlq9UO8SsXmFglU3lJzMFhccyn1q+I9nRB/dF4pZ2Mrd
 bdZYeWgNV3PT/T8e7jDP3o5qn17qOq98vB5h8d4kX7xkwcqkb6nCIY0VzfVzGZEqn2F6
 6rRQ==
X-Gm-Message-State: AGi0Pua3BKJIeUrZtHi6QsRsw5WOH4Y3B9jKIbOFOdTveKARzgXqppU6
 dKojQ7DNxEulBFspsrgW6tAULQ==
X-Google-Smtp-Source: APiQypKFuZ1Tyi6JAmlIPQve6oVDWVGmIA2J3XrIqZx88WDewk4OErRHjXy4QoM6xzgWk8uwpbaZRA==
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr596718wmh.157.1586881818446; 
 Tue, 14 Apr 2020 09:30:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g186sm20519838wmg.36.2020.04.14.09.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:30:17 -0700 (PDT)
Date: Tue, 14 Apr 2020 18:30:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 09/44] drm/vboxvidoe: use managed pci functions
Message-ID: <20200414163015.GX3456981@phenom.ffwll.local>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-10-daniel.vetter@ffwll.ch>
 <20200408072146.GG14965@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408072146.GG14965@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 09:21:46AM +0200, Sam Ravnborg wrote:
> On Fri, Apr 03, 2020 at 03:57:53PM +0200, Daniel Vetter wrote:
> > Allows us to drop the cleanup code on the floor.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> 
> With this change we avoid calling pci_disable_device()
> twise in case vbox_mm_init() fails.
> Once in vbox_hw_fini() and once in the error path.

Yup, I forgot to mention this in the commit message. I've added your
remark here as a quote, thanks for checking stuff in detail.
-Daniel

> 
> Which is just a small extra bonus.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > ---
> >  drivers/gpu/drm/vboxvideo/vbox_drv.c  | 6 ++----
> >  drivers/gpu/drm/vboxvideo/vbox_main.c | 7 +------
> >  2 files changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> > index d34cddd809fd..c80695c2f6c0 100644
> > --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> > +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> > @@ -55,13 +55,13 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	pci_set_drvdata(pdev, vbox);
> >  	mutex_init(&vbox->hw_mutex);
> >  
> > -	ret = pci_enable_device(pdev);
> > +	ret = pcim_enable_device(pdev);
> >  	if (ret)
> >  		return ret;
> >  
> >  	ret = vbox_hw_init(vbox);
> >  	if (ret)
> > -		goto err_pci_disable;
> > +		return ret;
> >  
> >  	ret = vbox_mm_init(vbox);
> >  	if (ret)
> > @@ -93,8 +93,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	vbox_mm_fini(vbox);
> >  err_hw_fini:
> >  	vbox_hw_fini(vbox);
> > -err_pci_disable:
> > -	pci_disable_device(pdev);
> >  	return ret;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> > index 9dcab115a261..1336ab9795fc 100644
> > --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> > +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> > @@ -71,8 +71,6 @@ static void vbox_accel_fini(struct vbox_private *vbox)
> >  
> >  	for (i = 0; i < vbox->num_crtcs; ++i)
> >  		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
> > -
> > -	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
> >  }
> >  
> >  /* Do we support the 4.3 plus mode hint reporting interface? */
> > @@ -125,7 +123,7 @@ int vbox_hw_init(struct vbox_private *vbox)
> >  	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
> >  	vbox->guest_pool = gen_pool_create(4, -1);
> >  	if (!vbox->guest_pool)
> > -		goto err_unmap_guest_heap;
> > +		return -ENOMEM;
> >  
> >  	ret = gen_pool_add_virt(vbox->guest_pool,
> >  				(unsigned long)vbox->guest_heap,
> > @@ -168,8 +166,6 @@ int vbox_hw_init(struct vbox_private *vbox)
> >  
> >  err_destroy_guest_pool:
> >  	gen_pool_destroy(vbox->guest_pool);
> > -err_unmap_guest_heap:
> > -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
> >  	return ret;
> >  }
> >  
> > @@ -177,5 +173,4 @@ void vbox_hw_fini(struct vbox_private *vbox)
> >  {
> >  	vbox_accel_fini(vbox);
> >  	gen_pool_destroy(vbox->guest_pool);
> > -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
> >  }
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
