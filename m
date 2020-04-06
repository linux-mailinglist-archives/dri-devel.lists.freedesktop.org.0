Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C419F5B6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 14:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3650A6E395;
	Mon,  6 Apr 2020 12:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155A76E395
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 12:18:32 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r19so15032959otn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 05:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YjxaXowJ/bOAfCu1lJtQ2FROrqjb9Vwq/99atWSwEIA=;
 b=FbXBFjASanq2/TC30a5GANvrDTBXRnf6lTL2cx32XurrjbQ16+Tsbqvrvyd3Xockzy
 xFF+lYH14+XQ/E3pm+vjZ/SsOY7F2l0J749kXD9JvJ/DIlivg1stcIO3k4u9D+VPOuuU
 YSPemnQxonLlMVp3f9ve+0WG4VnzNxZywv2gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YjxaXowJ/bOAfCu1lJtQ2FROrqjb9Vwq/99atWSwEIA=;
 b=DWjUwwuQrwwSiZPLoch1N4XwSQqcayt25kTK0t5Z8QjQCwTtUaG/Xy/JanMV057PsS
 6OzDguaeOQSnut4AYSdm6Ktt2IwSFyiZqcoESMO0mDS+EGL7GFrwVl66NDusm21c0tYQ
 BTJ2Q4Hkoy421bNzyYn5CqBPD7tk7pDblyELgx4Uqd99/W/zk+bFkvAkMkoOk2GoZZRy
 uwG6+XJ2rCXnggLwjnsYXHVfNHPhh/n3Ca06O/ddmdeWHomNoNZiBJHRq4W3hzui52S5
 gh7Bk7g5bLXARoznbLBgjid7TqI5BK/qpn2Oc2C/9oUm/Au5kSgPfQ0T+LZt+PLcLFFm
 Ri3Q==
X-Gm-Message-State: AGi0Pub+5SYo3VxKbCzN33L0rh78c0veMSfOIqS/kfSR97+1JOp0CySv
 3g+DAft3ZOEwXhRFfVHfGjedjxjsEdU3j4oJ2bPGZg==
X-Google-Smtp-Source: APiQypLqMqPZakYn3TZSTWX0Jb2FEiG99l1+8NCFP+ahJYJmMEMO5sZirMqF9ZzfEqGdY5vgASYG5lRhTc9QfQHqCMw=
X-Received: by 2002:a05:6830:15d4:: with SMTP id
 j20mr17021369otr.303.1586175511204; 
 Mon, 06 Apr 2020 05:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
 <20200406120049.GI4757@pendragon.ideasonboard.com>
In-Reply-To: <20200406120049.GI4757@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 6 Apr 2020 14:18:19 +0200
Message-ID: <CAKMK7uFO+uB-1TWBJuyv_5wi48b0b8UqfJYiBJCayUYc_yOOuQ@mail.gmail.com>
Subject: Re: [PATCH 02/44] drm: Add devm_drm_dev_alloc macro
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 2:01 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
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
> How about drivers that expose another interface towards userspace ? If
> the other related subsystem also required allocation of the driver
> private structure through its corresponding API, we'd be stuck. As
> stated before, I want this API to be optional.

So maybe we need to import a little bit more of our epic irc
discussion here, because this is leaving out all the context. There's
a few more things:

- Since the merging of the previous patch series this is already
mandatory, because the kfree(drm_device.managed.final_kfree) is the
last thing that will run. So I already killed your use-case (and it
seems to work just fine for all the drivers in-tree, and we have a
lot).

- As part of doing all these patches here and in the previous series
and in a next one I've seen that drivers just get this wrong. I'm
extremely hesitant to give that rope back to drivers, so I really
don't want to merge anything until we're ready to merge a driver that
needs it. I've set myself a goal to fix up all 40 odd drivers still
using drm_dev_alloc(), and that's itself already pretty stupid idea.
It's definitely not going to work if new drivers keep adding bad usage
patterns.

- Now I'm not opposed to allowing this, if/when we actually need it. I
think a very clean long-term solution would be to have a struct
kref_res, which augments a kref with automatic resource cleanup. We'd
probably need to fully demidlayer that, i.e. if you supply your own
->release hook then it's your job to call kref_release_all() at the
right point in there. With that we could then do a devm_drm_dev_init()
again, which would take that kref_res structure and the drm_device,
both embedded somewhere in your overall driver struture, and use your
drivers kref_res to attach all drm related auto-cleanup. In that case
it would then also be that kref_res' responsibility to do the final
kfree, hence drm wouldn't insist on doing that either. Prototype would
be something like:

devm_drm_dev_init(struct device *dev, struct drm_device *drm,
    struct drm_driver *driver, struct kref_res *kref);

The trouble with the above idea is that it assumes I have endless
amounts of time and that I can convince Greg KH that I understand
driver unload lifetime issues. The former is atm the more realistic
looking one of these two, so interim solution would be to add some
hack or another meanwhile to do this within drm only. Or as an
alternative solution, easy to convert over to an eventual kref_res
world:

#define kref_res_get() drm_dev_get()
#define kref_res_put() drm_dev_put()

With suitable amounts of casting to make this work out correctly like
the real kref_res solution.

Until we do have such drivers though I really don't want to open the
barn door again to all the bugs that'll bring, while I'm trying to get
the other barn doors closed down and fixed meanwhile.
-Daniel

>
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
> > +                        size_t size, size_t offset)
> > +{
> > +     void *container;
> > +     struct drm_device *drm;
> > +     int ret;
> > +
> > +     container = kzalloc(size, GFP_KERNEL);
> > +     if (!container)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     drm = container + offset;
> > +     ret = devm_drm_dev_init(parent, drm, driver);
> > +     if (ret) {
> > +             kfree(container);
> > +             return ERR_PTR(ret);
> > +     }
> > +     drmm_add_final_kfree(drm, container);
> > +
> > +     return container;
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
> >                     struct drm_device *dev,
> >                     struct drm_driver *driver);
> >
> > +void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> > +                        size_t size, size_t offset);
> > +
> > +/**
> > + * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
> > + * @parent: Parent device object
> > + * @driver: DRM driver
> > + * @type: the type of the struct which contains struct &drm_device
> > + * @member: the name of the &drm_device within @type.
> > + *
> > + * This allocates and initialize a new DRM device. No device registration is done.
> > + * Call drm_dev_register() to advertice the device to user space and register it
> > + * with other core subsystems. This should be done last in the device
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
> > + * automatically using devres. The DRM device initialized with this function is
> > + * automatically put on driver detach using drm_dev_put().
> > + *
> > + * RETURNS:
> > + * Pointer to new DRM device, or ERR_PTR on failure.
> > + */
> > +#define devm_drm_dev_alloc(parent, driver, type, member) \
> > +     ((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
> > +                                    offsetof(type, member)))
> > +
> >  struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> >                                struct device *parent);
> >  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
