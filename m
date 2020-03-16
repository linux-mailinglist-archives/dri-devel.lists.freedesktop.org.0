Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFEF1866D4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 09:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF2B6E375;
	Mon, 16 Mar 2020 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9AC6E375
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 08:45:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a141so16978351wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2OfSlIezwLNAuKrefbHCz6jIGElf3RXHF2L0c3p+a/c=;
 b=FDXsnd23AIwZHCDs465CB+huBRGLmXHB2erDfty/lAlbeeiG3dEHopfk3NgzJAhAmC
 eszH0WkEYsgGUPXEEAUioz38F+9PfaUNOoztA94yazq9Mf8/ldvwBjKRNiVtqs4drsUu
 m0+kwIcaYcIqUROj/5DbNTki+1Eua5Du0QHSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2OfSlIezwLNAuKrefbHCz6jIGElf3RXHF2L0c3p+a/c=;
 b=sYi97lDcTFAzJ75dOqjA92s3NK+mUzXMHgpQx+bNsP2Zz8SoCgstYL2Nm4tw7Z435S
 9nN7M423kGtIkxq2QT3Ej1JBOs7+hVUKkf0bZAj43SSMl44di2rIoQVfN9K6NAdYtuEv
 0YjtdsmCkE2MZm5lf4EXyg+S+SNbD61hLdctfkh7iAJhtyII69bQaVaLYS2G7Qd5ycgP
 D+vvFIk7m0CS03oBZDaVx/ZhBKY2bcnjOLmDLW5PdYPnnRkk/Wdk1n6zBDOHmAB4HkTe
 SKyTx8HyXF9ciX/HYUZwPIfmFtYQd+GZ67dST+wWIpWlP6a2VzGHNyLalGsNaQbYON4G
 CWqg==
X-Gm-Message-State: ANhLgQ1LR6AUsX4zZdgbFPrS5KAb6y7FSHBrVh45jip1FRHyz/gVr7yN
 RFc9kw2nIUFq05lIphsLOPkpng==
X-Google-Smtp-Source: ADFU+vv+kCYJrICWBlbmJThfzm0l2n7UC0FgAbBYk3A9XRO6mizeMkTJ0OX7jFxYpGPH7mmGK0U61g==
X-Received: by 2002:a1c:b642:: with SMTP id g63mr24594012wmf.108.1584348335330; 
 Mon, 16 Mar 2020 01:45:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p15sm12185815wro.68.2020.03.16.01.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 01:45:34 -0700 (PDT)
Date: Mon, 16 Mar 2020 09:45:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200316084532.GE2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
 <72e4842d-6657-bea2-12dc-28128308fdbc@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72e4842d-6657-bea2-12dc-28128308fdbc@suse.de>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 10:07:13AM +0100, Thomas Zimmermann wrote:
> Hi Daniel
> =

> Am 02.03.20 um 23:25 schrieb Daniel Vetter:
> > We have lots of these. And the cleanup code tends to be of dubious
> > quality. The biggest wrong pattern is that developers use devm_, which
> > ties the release action to the underlying struct device, whereas
> > all the userspace visible stuff attached to a drm_device can long
> > outlive that one (e.g. after a hotunplug while userspace has open
> > files and mmap'ed buffers). Give people what they want, but with more
> > correctness.
> > =

> > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > a few simplifications - I didn't (yet) copy over everything. Since
> > the types don't match code sharing looked like a hopeless endeavour.
> > =

> > For now it's only super simplified, no groups, you can't remove
> > actions (but kfree exists, we'll need that soon). Plus all specific to
> > drm_device ofc, including the logging. Which I didn't bother to make
> > compile-time optional, since none of the other drm logging is compile
> > time optional either.
> > =

> > One tricky bit here is the chicken&egg between allocating your
> > drm_device structure and initiliazing it with drm_dev_init. For
> > perfect onion unwinding we'd need to have the action to kfree the
> > allocation registered before drm_dev_init registers any of its own
> > release handlers. But drm_dev_init doesn't know where exactly the
> > drm_device is emebedded into the overall structure, and by the time it
> > returns it'll all be too late. And forcing drivers to be able clean up
> > everything except the one kzalloc is silly.
> > =

> > Work around this by having a very special final_kfree pointer. This
> > also avoids troubles with the list head possibly disappearing from
> > underneath us when we release all resources attached to the
> > drm_device.
> > =

> > v2: Do all the kerneldoc at the end, to avoid lots of fairly pointless
> > shuffling while getting everything into shape.
> > =

> > v3: Add static to add/del_dr (Neil)
> > Move typo fix to the right patch (Neil)
> > =

> > v4: Enforce contract for drmm_add_final_kfree:
> > =

> > Use ksize() to check that the drm_device is indeed contained somewhere
> > in the final kfree(). Because we need that or the entire managed
> > release logic blows up in a pile of use-after-frees. Motivated by a
> > discussion with Laurent.
> > =

> > v5: Review from Laurent:
> > - %zu instead of casting size_t
> > - header guards
> > - sorting of includes
> > - guarding of data assignment if we didn't allocate it for a NULL
> >   pointer
> > - delete spurious newline
> > - cast void* data parameter correctly in ->release call, no idea how
> >   this even worked before
> > =

> > v3: Review from Sam
> > - Add the kerneldoc for the managed sub-struct back in, even if it
> >   doesn't show up in the generated html somehow.
> > - Explain why __always_inline.
> > - Fix bisectability around the final kfree() in drm_dev_relase(). This
> >   is just interim code which will disappear again.
> > - Some whitespace polish.
> > - Add debug output when drmm_add_action or drmm_kmalloc fail.
> > =

> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/drm-internals.rst |   6 +
> >  drivers/gpu/drm/Makefile            |   3 +-
> >  drivers/gpu/drm/drm_drv.c           |  12 ++
> >  drivers/gpu/drm/drm_internal.h      |   3 +
> >  drivers/gpu/drm/drm_managed.c       | 186 ++++++++++++++++++++++++++++
> >  include/drm/drm_device.h            |  15 +++
> >  include/drm/drm_managed.h           |  30 +++++
> >  include/drm/drm_print.h             |   6 +
> >  8 files changed, 260 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/drm_managed.c
> >  create mode 100644 include/drm/drm_managed.h
> > =

> > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/dr=
m-internals.rst
> > index a73320576ca9..a6b6145fda78 100644
> > --- a/Documentation/gpu/drm-internals.rst
> > +++ b/Documentation/gpu/drm-internals.rst
> > @@ -132,6 +132,12 @@ be unmapped; on many devices, the ROM address deco=
der is shared with
> >  other BARs, so leaving it mapped could cause undesired behaviour like
> >  hangs or memory corruption.
> >  =

> > +Managed Resources
> > +-----------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_managed.c
> > +   :doc: managed resources
> > +
> >  Bus-specific Device Registration and PCI Support
> >  ------------------------------------------------
> >  =

> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 7f72ef5e7811..183c60048307 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -17,7 +17,8 @@ drm-y       :=3D	drm_auth.o drm_cache.o \
> >  		drm_plane.o drm_color_mgmt.o drm_print.o \
> >  		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
> >  		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> > -		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
> > +		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> > +		drm_managed.o
> >  =

> >  drm-$(CONFIG_DRM_LEGACY) +=3D drm_legacy_misc.o drm_bufs.o drm_context=
.o drm_dma.o drm_scatter.o drm_lock.o
> >  drm-$(CONFIG_DRM_LIB_RANDOM) +=3D lib/drm_random.o
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 9fcd6ab3c154..153050fc926c 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -629,6 +629,9 @@ int drm_dev_init(struct drm_device *dev,
> >  	dev->dev =3D get_device(parent);
> >  	dev->driver =3D driver;
> >  =

> > +	INIT_LIST_HEAD(&dev->managed.resources);
> > +	spin_lock_init(&dev->managed.lock);
> > +
> >  	/* no per-device feature limits by default */
> >  	dev->driver_features =3D ~0u;
> >  =

> > @@ -828,8 +831,17 @@ static void drm_dev_release(struct kref *ref)
> >  		dev->driver->release(dev);
> >  	} else {
> >  		drm_dev_fini(dev);
> > +	}
> > +
> > +	drm_managed_release(dev);
> > +
> > +	if (!dev->driver->release && !dev->managed.final_kfree) {
> > +		WARN_ON(!list_empty(&dev->managed.resources));
> >  		kfree(dev);
> >  	}
> > +
> > +	if (dev->managed.final_kfree)
> > +		kfree(dev->managed.final_kfree);
> >  }
> >  =

> >  /**
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inter=
nal.h
> > index aeec2e68d772..8c2628dfc6c7 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -89,6 +89,9 @@ void drm_prime_remove_buf_handle_locked(struct drm_pr=
ime_file_private *prime_fpr
> >  struct drm_minor *drm_minor_acquire(unsigned int minor_id);
> >  void drm_minor_release(struct drm_minor *minor);
> >  =

> > +/* drm_managed.c */
> > +void drm_managed_release(struct drm_device *dev);
> > +
> >  /* drm_vblank.c */
> >  void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int =
pipe);
> >  void drm_vblank_cleanup(struct drm_device *dev);
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_manage=
d.c
> > new file mode 100644
> > index 000000000000..57dc79fa90af
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Intel
> > + *
> > + * Based on drivers/base/devres.c
> > + */
> > +
> > +#include <drm/drm_managed.h>
> > +
> > +#include <linux/list.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_print.h>
> > +
> > +/**
> > + * DOC: managed resources
> > + *
> > + * Inspired by struct &device managed resources, but tied to the lifet=
ime of
> > + * struct &drm_device, which can outlive the underlying physical devic=
e, usually
> > + * when userspace has some open files and other handles to resources s=
till open.
> > + */
> > +struct drmres_node {
> > +	struct list_head	entry;
> > +	drmres_release_t	release;
> > +	const char		*name;
> > +	size_t			size;
> > +};
> =

> At a later point, we could have debugfs for instances of this data
> structure. There's already a name field.
> =

> > +
> > +struct drmres {
> > +	struct drmres_node		node;
> > +	/*
> > +	 * Some archs want to perform DMA into kmalloc caches
> > +	 * and need a guaranteed alignment larger than
> > +	 * the alignment of a 64-bit integer.
> > +	 * Thus we use ARCH_KMALLOC_MINALIGN here and get exactly the same
> > +	 * buffer alignment as if it was allocated by plain kmalloc().
> > +	 */
> > +	u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
> > +};
> > +
> > +void drm_managed_release(struct drm_device *dev)
> > +{
> > +	struct drmres *dr, *tmp;
> > +
> > +	drm_dbg_drmres(dev, "drmres release begin\n");
> > +	list_for_each_entry_safe(dr, tmp, &dev->managed.resources, node.entry=
) {
> > +		drm_dbg_drmres(dev, "REL %p %s (%zu bytes)\n",
> > +			       dr, dr->node.name, dr->node.size);
> > +
> > +		if (dr->node.release)
> > +			dr->node.release(dev, dr->node.size ? *(void **)&dr->data : NULL);
> > +
> > +		list_del(&dr->node.entry);
> > +		kfree(dr);
> > +	}
> > +	drm_dbg_drmres(dev, "drmres release end\n");
> > +}
> > +
> > +/*
> > + * Always inline so that kmallc_track_caller tracks the actual interes=
ting
> =

> 'kmalloc_node_track_caller'

Yeah I dropped the _node for shortern naming, most people don't use
kmalloc_node, but just plain kmalloc. But I just spotted that I have a
spelling issue in that too :-)

> > + * caller outside of drm_managed.c.
> > + */
> > +static __always_inline struct drmres * alloc_dr(drmres_release_t relea=
se,
> > +						size_t size, gfp_t gfp, int nid)
> > +{
> > +	size_t tot_size;
> > +	struct drmres *dr;
> > +
> > +	/* We must catch any near-SIZE_MAX cases that could overflow. */
> > +	if (unlikely(check_add_overflow(sizeof(*dr), size, &tot_size)))
> > +		return NULL;
> > +
> > +	dr =3D kmalloc_node_track_caller(tot_size, gfp, nid);
> > +	if (unlikely(!dr))
> > +		return NULL;
> > +
> > +	memset(dr, 0, offsetof(struct drmres, data));
> > +
> > +	INIT_LIST_HEAD(&dr->node.entry);
> > +	dr->node.release =3D release;
> > +	dr->node.size =3D size;
> > +
> > +	return dr;
> > +}
> > +
> > +static void del_dr(struct drm_device *dev, struct drmres *dr)
> > +{
> > +	list_del_init(&dr->node.entry);
> > +
> > +	drm_dbg_drmres(dev, "DEL %p %s (%lu bytes)\n",
> > +		       dr, dr->node.name, (unsigned long) dr->node.size);
> > +}
> > +
> > +static void add_dr(struct drm_device *dev, struct drmres *dr)
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&dev->managed.lock, flags);
> > +	list_add(&dr->node.entry, &dev->managed.resources);
> > +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> > +
> > +	drm_dbg_drmres(dev, "ADD %p %s (%lu bytes)\n",
> > +		       dr, dr->node.name, (unsigned long) dr->node.size);
> =

> If the insert code blows up, it might be helpful to have this message in
> the log already. So should this message be located before the code for
> inserting the entry?

If list_add blows up we have bigger problems imo :-) I think I'll just
leave this wherever it is.

> =

> > +}
> > +
> > +void drmm_add_final_kfree(struct drm_device *dev, void *parent)
> =

> Can you come up with better names? 'final_kfree' sounds like a function
> pointer to an implementation of kfree() and 'parent' sounds like the
> parent device in a device hierarchy.
> =

> I suggest to rename 'parent' to 'container' and 'final_kfree'
> 'drmm_container'. The function's name could be drmm_dev_set_container().

s/parent/container is really good. For the other I want more votes since
it's going to be a pile of churn, and I'm not massively sold on your
naming ...

> > +{
> > +	WARN_ON(dev->managed.final_kfree);
> > +	WARN_ON(dev < (struct drm_device *) parent);
> > +	WARN_ON(dev + 1 >=3D (struct drm_device *) (parent + ksize(parent)));
> > +	dev->managed.final_kfree =3D parent;
> > +}
> > +EXPORT_SYMBOL(drmm_add_final_kfree);
> > +
> > +int __drmm_add_action(struct drm_device *dev,
> > +		      drmres_release_t action,
> > +		      void *data, const char *name)
> =

> Is there a reason to pass in 'void* data' instead of 'void** datap'? The
> latter would communicate what this parameter is for and not need void_ptr.

I don't get why you'd want to convert this into void**. The argument for
the release function is a void*, not a void**. That's also what external
callers pass in here. void** would be utterly confusing and actually hide
the void_ptr trickery we need I think (since it then happens automatically
as part of argument conversion hidden in the function call).

> In any case, there seems to be no interface to remove an added action
> (e.g., __drmm_remove_action()). Please see my comment on drmm_kfree() bel=
ow.

Not yet needed, I'm building this up as we go. A later patch actually adds
it, plus the even neater add_action_or_reset.

> And more generally, do we really need __drmm_add_action() in it's
> current form? I'd change it to __drmm_kmalloc(), which is drmm_kmalloc()
> plus optional release-action and name parameters. And drm_kmalloc()
> would be a simple wrapper in the header file, just like drmm_kcalloc().

Uh we kinda have that, with the lower-level alloc_dr/add_dr functions.
__drmm_add_action _is_ the wrapper (and definitely too big for header
file static include stuff). We could go overboard with forced code
sharing, but I think the current code is actually a bit easier to read.

> > +{
> > +	struct drmres *dr;
> > +	void **void_ptr;
> > +
> > +	dr =3D alloc_dr(action, data ? sizeof(void*) : 0,
> > +		      GFP_KERNEL | __GFP_ZERO,
> > +		      dev_to_node(dev->dev));
> > +	if (!dr) {
> > +		drm_dbg_drmres(dev, "failed to add action %s for %p\n",
> > +			       name, data);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	dr->node.name =3D name;
> > +	if (data) {
> > +		void_ptr =3D (void **)&dr->data;
> > +		*void_ptr =3D data;
> > +	}
> > +
> > +	add_dr(dev, dr);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(__drmm_add_action);
> > +
> > +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> > +{
> > +	struct drmres *dr;
> > +
> > +	dr =3D alloc_dr(NULL, size, gfp, dev_to_node(dev->dev));
> > +	if (!dr) {
> > +		drm_dbg_drmres(dev, "failed to allocate %zu bytes, %u flags\n",
> > +			       size, gfp);
> > +		return NULL;
> > +	}
> > +	dr->node.name =3D "kmalloc";
> > +
> > +	add_dr(dev, dr);
> > +
> > +	return dr->data;
> > +}
> > +EXPORT_SYMBOL(drmm_kmalloc);
> > +
> > +void drmm_kfree(struct drm_device *dev, void *data)
> =

> I suggest to wrap this function around an implementatian that calls the
> optional release action. drmm_kfree() would become a trivial wrapper in
> the header file.

C isn't that good at meta-programing. You'd need to pass in a special
match function, with opaque match parameters, and then you can do generic
removal. It's real ugly, imo 2 copies of a simple loop to find what you
need and delete it is much better.
-Daniel


> Best regards
> Thomas
> =

> > +{
> > +	struct drmres *dr_match =3D NULL, *dr;
> > +	unsigned long flags;
> > +
> > +	if (!data)
> > +		return;
> > +
> > +	spin_lock_irqsave(&dev->managed.lock, flags);
> > +	list_for_each_entry(dr, &dev->managed.resources, node.entry) {
> > +		if (dr->data =3D=3D data) {
> > +			dr_match =3D dr;
> > +			del_dr(dev, dr_match);
> > +			break;
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> > +
> > +	if (WARN_ON(!dr_match))
> > +		return;
> > +
> > +	kfree(dr_match);
> > +}
> > +EXPORT_SYMBOL(drmm_kfree);
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index bb60a949f416..d39132b477dd 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -67,6 +67,21 @@ struct drm_device {
> >  	/** @dev: Device structure of bus-device */
> >  	struct device *dev;
> >  =

> > +	/**
> > +	 * @managed:
> > +	 *
> > +	 * Managed resources linked to the lifetime of this &drm_device as
> > +	 * tracked by @ref.
> > +	 */
> > +	struct {
> > +		/** @managed.resources: managed resources list */
> > +		struct list_head resources;
> > +		/** @managed.final_kfree: pointer for final kfree() call */
> > +		void *final_kfree;
> > +		/** @managed.lock: protects @managed.resources */
> > +		spinlock_t lock;
> > +	} managed;
> > +
> >  	/** @driver: DRM driver managing the device */
> >  	struct drm_driver *driver;
> >  =

> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > new file mode 100644
> > index 000000000000..7b5df7d09b19
> > --- /dev/null
> > +++ b/include/drm/drm_managed.h
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#ifndef _DRM_MANAGED_H_
> > +#define _DRM_MANAGED_H_
> > +
> > +#include <linux/gfp.h>
> > +#include <linux/types.h>
> > +
> > +struct drm_device;
> > +
> > +typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
> > +
> > +#define drmm_add_action(dev, action, data) \
> > +	__drmm_add_action(dev, action, data, #action)
> > +
> > +int __must_check __drmm_add_action(struct drm_device *dev,
> > +				   drmres_release_t action,
> > +				   void *data, const char *name);
> > +
> > +void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> > +
> > +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __m=
alloc;
> > +static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, =
gfp_t gfp)
> > +{
> > +	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
> > +}
> > +
> > +void drmm_kfree(struct drm_device *dev, void *data);
> > +
> > +#endif
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index ca7cee8e728a..1c9417430d08 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -313,6 +313,10 @@ enum drm_debug_category {
> >  	 * @DRM_UT_DP: Used in the DP code.
> >  	 */
> >  	DRM_UT_DP		=3D 0x100,
> > +	/**
> > +	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
> > +	 */
> > +	DRM_UT_DRMRES		=3D 0x200,
> >  };
> >  =

> >  static inline bool drm_debug_enabled(enum drm_debug_category category)
> > @@ -442,6 +446,8 @@ void drm_dev_dbg(const struct device *dev, enum drm=
_debug_category category,
> >  	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_dp(drm, fmt, ...)					\
> >  	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
> > +#define drm_dbg_drmres(drm, fmt, ...)					\
> > +	drm_dev_dbg((drm)->dev, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> >  =

> >  =

> >  /*
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
