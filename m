Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649C51A2170
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 14:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CA96EA4A;
	Wed,  8 Apr 2020 12:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650FB6E98F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 12:11:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d202so5191637wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c9O6GiNLs3PI/XZFUUoTTQcDWfGeIenpn7JnnRpynQc=;
 b=IHeZbWoowvudckfoYIkOgm9/9idlMHsseEK0ctU/ploefniStmcjhulX6lWr+3Ib5Q
 Pl+7BPD3dWpZ5Y9T7Yz/OitSfWQu//lh8pcBlgAWomNAFPY2XjL3U7NizxpI/XOvvn59
 ORGo3tsv1NMtgxV3BM3t8OdQr8pnHlYnLojfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c9O6GiNLs3PI/XZFUUoTTQcDWfGeIenpn7JnnRpynQc=;
 b=m8hzDL3YH0f1M2vokVr72n6EtoYiGb1tN/53mrXI4kHCBDJ52N/qb/MOpPHoctiAFK
 ATMo0emzq6e+ARvAE9ZTAUDtDDIHcY9S2gbsaW4S3Zv/F2/ZDxi929IfqxHarBEb1TWF
 GuE+duiKVVYlD882swznkSljVVFw/BRChBZB5cO7drLjHMuDx2mbXBPJn2JKaiWD9rar
 UVre7zYhJcFSI2Sej/0rTf3SWN3F/JC/6iHM9s0tJmvweZCBSdXjZyOMeTbh0NiKksuI
 J1vJdg8hNGk6u+3FpjdtD+bc1Z8Dexja6XO4hC2aml+XgjrMcbsvZWTzZSzPo3L5bKBV
 93ZQ==
X-Gm-Message-State: AGi0PuZOkrGm4CzgVXalFzND8OzQtazrxTfzHGEI2u2VH/cueigzIS/i
 DxZMf28VmReivkeCj6Pj0xxwJA==
X-Google-Smtp-Source: APiQypKo1EQGF2d683Z+B0ImWNijJ1q0faOY3oyfUiQ0jYLIkU65wc0Tdj/zuANgzumbwyNTgohoXg==
X-Received: by 2002:a1c:ba82:: with SMTP id k124mr4613404wmf.66.1586347909913; 
 Wed, 08 Apr 2020 05:11:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y22sm7071911wma.18.2020.04.08.05.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 05:11:49 -0700 (PDT)
Date: Wed, 8 Apr 2020 14:11:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 02/44] drm: Add devm_drm_dev_alloc macro
Message-ID: <20200408121147.GL3456981@phenom.ffwll.local>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
 <20200408065714.GC14965@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408065714.GC14965@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 08:57:14AM +0200, Sam Ravnborg wrote:
> Hi Daniel.
> 
> Finally managed to dive into this..
> 
> Maybe I need more coffee, it is still morning here.
> But alas this patch triggered a few comments.
> 
> 	Sam
> 
> On Fri, Apr 03, 2020 at 03:57:46PM +0200, Daniel Vetter wrote:
> > The kerneldoc is only added for this new function. Existing kerneldoc
> > and examples will be udated at the very end, since once all drivers
> > are converted over to devm_drm_dev_alloc we can unexport a lot of
> > interim functions and make the documentation for driver authors a lot
> > cleaner and less confusing. There will be only one true way to
> > initialize a drm_device at the end of this, which is going to be
> > devm_drm_dev_alloc.
> 
> This changelog entry does a poor job describing what the purpose of this
> change is.
> Try to read it outside context.

Something like:

Add a new macro helper to combine the usual init sequence in drivers,
consisting of a kzalloc + devm_drm_dev_init + drmm_add_final_kfree
triplet. This allows us to remove the rather unsightly
drmm_add_final_kfree from all currently merged drivers.

This good enough, as an intro paragraph?

> 
> 
> > 
> > Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
> >  include/drm/drm_drv.h     | 33 +++++++++++++++++++++++++++++++++
> >  2 files changed, 56 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 1bb4f636b83c..9e60b784b3ac 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -739,6 +739,29 @@ int devm_drm_dev_init(struct device *parent,
> >  }
> >  EXPORT_SYMBOL(devm_drm_dev_init);
> >  
> > +void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> > +			   size_t size, size_t offset)
> > +{
> > +	void *container;
> > +	struct drm_device *drm;
> > +	int ret;
> > +
> > +	container = kzalloc(size, GFP_KERNEL);
> > +	if (!container)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	drm = container + offset;
> > +	ret = devm_drm_dev_init(parent, drm, driver);
> > +	if (ret) {
> > +		kfree(container);
> > +		return ERR_PTR(ret);
> > +	}
> > +	drmm_add_final_kfree(drm, container);
> > +
> > +	return container;
> > +}
> > +EXPORT_SYMBOL(__devm_drm_dev_alloc);
> > +
> >  /**
> >   * drm_dev_alloc - Allocate new DRM device
> >   * @driver: DRM driver to allocate device for
> > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > index e7c6ea261ed1..26776be5a21e 100644
> > --- a/include/drm/drm_drv.h
> > +++ b/include/drm/drm_drv.h
> > @@ -626,6 +626,39 @@ int devm_drm_dev_init(struct device *parent,
> >  		      struct drm_device *dev,
> >  		      struct drm_driver *driver);
> >  
> > +void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> > +			   size_t size, size_t offset);
> > +
> > +/**
> > + * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
> > + * @parent: Parent device object
> > + * @driver: DRM driver
> > + * @type: the type of the struct which contains struct &drm_device
> > + * @member: the name of the &drm_device within @type.
> I am confused about the naming here.
> devm_ implies we allocate something with a lifetime equal that of a
> driver. So when the driver are gone what we allocate is also gone.
> Like everythign else devm_ prefixed.
> 
> But the lifetime of a drm_device is until the last userspace reference
> is gone (final drm_dev_put() is called).

The kerneldoc for this is largely copied from the existing
devm_drm_dev_init. And yes the lifetime is bound to the device, we do the
drm_dev_put() when that disappears. Now other users of drm_device might
still hold references and delay cleanup, but "cleanup is done as a devres
action" is very much what devm_ signifies.
"
> > + *
> > + * This allocates and initialize a new DRM device. No device registration is done.
> > + * Call drm_dev_register() to advertice the device to user space and register it
> > + * with other core subsystems. This should be done last in the device
> s/This/Calling drm_dev_register()/ will make this sentence a bit more
> explicit.
> 
> > + * initialization sequence to make sure userspace can't access an inconsistent
> > + * state.
> > + *
> > + * The initial ref-count of the object is 1. Use drm_dev_get() and
> > + * drm_dev_put() to take and drop further ref-counts.
> > + *
> > + * It is recommended that drivers embed &struct drm_device into their own device
> > + * structure.
> > + *
> > + * Note that this manages the lifetime of the resulting &drm_device
> > + * automatically using devres.
> Hmm, no this is managed by drmres???

Yup, the next sentence explains how. And note that we're already using
this in the form of devm_drm_dev_init. So not clear what's unclear here
...

Thanks for your comments.
-Daniel


> 
> 
> > + * The DRM device initialized with this function is
> > + * automatically put on driver detach using drm_dev_put().
> > + *
> > + * RETURNS:
> > + * Pointer to new DRM device, or ERR_PTR on failure.
> > + */
> > +#define devm_drm_dev_alloc(parent, driver, type, member) \
> > +	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
> > +				       offsetof(type, member)))
> > +
> >  struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> >  				 struct device *parent);
> >  int drm_dev_register(struct drm_device *dev, unsigned long flags);
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
