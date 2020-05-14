Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D361D3E6E
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 22:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF146EBBE;
	Thu, 14 May 2020 20:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875E46EBBE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 20:06:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so259700wrt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hu/RdgI33YXRJfDmSbHxeL7l4HXDUqJS/cFvL6dS94c=;
 b=bAaEVxqMLrAmEI3zx17EA0Kr/End6iz7Bc5nSVpKn6cd/ZqrWs6Scy2Ohjg+zx1YR5
 3VQpZQWleDiTsn3tEysUKPVuPtnaPAPUoGg4BNE/prjw4IR8jVZOxtKDmem8kBpVCx6z
 xpNeEkbnp87pc8fj4TzigrBzetDAtmYUazrS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hu/RdgI33YXRJfDmSbHxeL7l4HXDUqJS/cFvL6dS94c=;
 b=atmCBhHIVJ90RDMx7ckV3Q3fAlhpK/5oxoDUegtqN4k1f8wHKESKHbN3qPvFw+cg7Q
 /zhKL3RRZo7UbDoFzBwesLC/0nhQF/FBuInlmwDUA0Lm/Lr3BGPM6KRtiT1zQO5494Cn
 Vv5f/1vvDfTS5F+fgJPOAIoWIGkt8tC2FTTRHrzcxFWWYpbEGGSz+Nt6AH9WhtC85INF
 7IkNpGcJ2PyGuOvSVw2Yatw75x3GVJrvJ+gwRy3PlQ+yNs2z14cbanEwXRBn33EwE5VJ
 Cl6qv6/Q7t6ofY3OON+vtREooMjnP3oMXQtj25aw+xx4a8VueNEA6JV31eQWHFV2a7Ps
 TF/A==
X-Gm-Message-State: AOAM532u2N21MdRDyX9fR5Qp7PYy1SrEZBshfIdAUg0gsEhMZRxlBFU4
 iL3pOS5IfNOYuCMCMBAIA5p2hqw4uzA=
X-Google-Smtp-Source: ABdhPJxlBa7sCaUKwBgQyLPPqdwCXDgMuGBtRlQSEcjGZ4Viz4V1HUTTIvBlT5sDJIKiAfzaUzftJg==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr116614wro.255.1589486762103;
 Thu, 14 May 2020 13:06:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r14sm17565044wmb.2.2020.05.14.13.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 13:06:01 -0700 (PDT)
Date: Thu, 14 May 2020 22:05:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/9] drm/doc: Some polish for shmem helpers
Message-ID: <20200514200559.GE206103@phenom.ffwll.local>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-4-daniel.vetter@ffwll.ch>
 <d4088d21-8351-6afb-ae90-cab3e30f83e8@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4088d21-8351-6afb-ae90-cab3e30f83e8@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 01:12:49PM +0200, Thomas Zimmermann wrote:
> =

> =

> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> > - Move the shmem helper section to the drm-mm.rst file, next to the
> >   vram helpers. Makes a lot more sense there with the now wider scope.
> >   Also, that's where the all the other backing storage stuff resides.
> >   It's just the framebuffer helpers that should be in the kms helper
> >   section.
> > =

> > - Try to clarify which functiosn are for implementing
> >   drm_gem_object_funcs, and which for drivers to call directly. At
> >   least one driver screwed that up a bit.
> > =

> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> =

> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> See below for a suggestion on the help text.
> =

> > ---
> >  Documentation/gpu/drm-kms-helpers.rst  | 12 --------
> >  Documentation/gpu/drm-mm.rst           | 12 ++++++++
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 39 +++++++++++++++++++++-----
> >  3 files changed, 44 insertions(+), 19 deletions(-)
> > =

> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/=
drm-kms-helpers.rst
> > index ee730457bf4e..b89ddd06dabb 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -411,15 +411,3 @@ Legacy CRTC/Modeset Helper Functions Reference
> >  =

> >  .. kernel-doc:: drivers/gpu/drm/drm_crtc_helper.c
> >     :export:
> > -
> > -SHMEM GEM Helper Reference
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > -
> > -.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
> > -   :doc: overview
> > -
> > -.. kernel-doc:: include/drm/drm_gem_shmem_helper.h
> > -   :internal:
> > -
> > -.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
> > -   :export:
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > index 1839762044be..c01757b0ac25 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -373,6 +373,18 @@ GEM CMA Helper Functions Reference
> >  .. kernel-doc:: drivers/gpu/drm/drm_gem_cma_helper.c
> >     :export:
> >  =

> > +GEM SHMEM Helper Function Reference
> > +-----------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
> > +   :doc: overview
> > +
> > +.. kernel-doc:: include/drm/drm_gem_shmem_helper.h
> > +   :internal:
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
> > +   :export:
> > +
> >  GEM VRAM Helper Functions Reference
> >  -----------------------------------
> >  =

> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index df31e5782eed..2a70159d50ef 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -103,7 +103,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> >   * @obj: GEM object to free
> >   *
> >   * This function cleans up the GEM object state and frees the memory u=
sed to
> > - * store the object itself.
> > + * store the object itself. It should be used to implement
> > + * &drm_gem_object_funcs.free.
> =

> It should 'only' be used? Or maybe you can say that it should be used by
> drivers that don't implement struct drm_driver.gem_create_object.

Just looked at this, and I'm not clear what you're aiming for. There
doesn't seem to be any misuse for this for other places than the free
hook. And I can't really come up with ideas where that would even work.

What kind of confusion are you trying to clarify with your suggestion?
Maybe I can then reword that into something that also makes sense for me.

Thanks, Daniel

> =

> >   */
> >  void drm_gem_shmem_free_object(struct drm_gem_object *obj)
> >  {
> > @@ -214,7 +215,8 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
> >   * @obj: GEM object
> >   *
> >   * This function makes sure the backing pages are pinned in memory whi=
le the
> > - * buffer is exported.
> > + * buffer is exported. It should only be used to implement
> > + * &drm_gem_object_funcs.pin.
> >   *
> >   * Returns:
> >   * 0 on success or a negative error code on failure.
> > @@ -232,7 +234,7 @@ EXPORT_SYMBOL(drm_gem_shmem_pin);
> >   * @obj: GEM object
> >   *
> >   * This function removes the requirement that the backing pages are pi=
nned in
> > - * memory.
> > + * memory. It should only be used to implement &drm_gem_object_funcs.u=
npin.
> >   */
> >  void drm_gem_shmem_unpin(struct drm_gem_object *obj)
> >  {
> > @@ -285,8 +287,14 @@ static void *drm_gem_shmem_vmap_locked(struct drm_=
gem_shmem_object *shmem)
> >   * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
> >   * @shmem: shmem GEM object
> >   *
> > - * This function makes sure that a virtual address exists for the buff=
er backing
> > - * the shmem GEM object.
> > + * This function makes sure that a contiguous kernel virtual address m=
apping
> > + * exists for the buffer backing the shmem GEM object.
> > + *
> > + * This function can be used to implement &drm_gem_object_funcs.vmap. =
But it can
> > + * also be called by drivers directly, in which case it will hide the
> > + * differences between dma-buf imported and natively allocated objects.
> > + *
> > + * Acquired mappings should be cleaned up by calling drm_gem_shmem_vun=
map().
> >   *
> >   * Returns:
> >   * 0 on success or a negative error code on failure.
> > @@ -330,7 +338,13 @@ static void drm_gem_shmem_vunmap_locked(struct drm=
_gem_shmem_object *shmem)
> >   * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
> >   * @shmem: shmem GEM object
> >   *
> > - * This function removes the virtual address when use count drops to z=
ero.
> > + * This function cleans up a kernel virtual address mapping acquired by
> > + * drm_gem_shmem_vmap(). The mapping is only removed when the use coun=
t drops to
> > + * zero.
> > + *
> > + * This function can be used to implement &drm_gem_object_funcs.vmap. =
But it can
> > + * also be called by drivers directly, in which case it will hide the
> > + * differences between dma-buf imported and natively allocated objects.
> >   */
> >  void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr)
> >  {
> > @@ -559,6 +573,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
> >   * @p: DRM printer
> >   * @indent: Tab indentation level
> >   * @obj: GEM object
> > + *
> > + * This implements the &drm_gem_object_funcs.info callback.
> >   */
> >  void drm_gem_shmem_print_info(struct drm_printer *p, unsigned int inde=
nt,
> >  			      const struct drm_gem_object *obj)
> > @@ -577,7 +593,12 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
> >   * @obj: GEM object
> >   *
> >   * This function exports a scatter/gather table suitable for PRIME usa=
ge by
> > - * calling the standard DMA mapping API.
> > + * calling the standard DMA mapping API. Drivers should not call this =
function
> > + * directly, instead it should only be used as an implementation for
> > + * &drm_gem_object_funcs.get_sg_table.
> > + *
> > + * Drivers who need to acquire an scatter/gather table for objects nee=
d to call
> > + * drm_gem_shmem_get_pages_sgt() instead.
> >   *
> >   * Returns:
> >   * A pointer to the scatter/gather table of pinned pages or NULL on fa=
ilure.
> > @@ -599,6 +620,10 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
> >   * the sg table doesn't exist, the pages are pinned, dma-mapped, and a=
 sg
> >   * table created.
> >   *
> > + * This is the main function for drivers to get at backing storage, an=
d it hides
> > + * and difference between dma-buf imported and natively allocated obje=
cts.
> > + * drm_gem_shmem_get_sg_table() should not be directly called by drive=
rs.
> > + *
> >   * Returns:
> >   * A pointer to the scatter/gather table of pinned pages or errno on f=
ailure.
> >   */
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
