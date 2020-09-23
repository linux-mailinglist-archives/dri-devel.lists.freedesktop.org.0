Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C67275C06
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE696E9D4;
	Wed, 23 Sep 2020 15:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612C86E9D5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:37:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x23so470742wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yJrxyrCYTSAaySpzFcKGOiTCkrC8Qj+gA/jwrVsz0KY=;
 b=BXXSr8GmYDsMU6LFltZYqLrnVC43HZ8reSmLD5Oh8RDgk5uSyDGv0QsS9eIMexXXHs
 K07Wf5y5hGwrfOt2Hnr1i21SHv6Xl9Prl6+Xes52ZMKIzFD+U3SmZduvH3N50kmTfg9K
 TfVUe75KKRLeDJbaBLWzKl9t3qsefyRYQd9dQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yJrxyrCYTSAaySpzFcKGOiTCkrC8Qj+gA/jwrVsz0KY=;
 b=pRVR+jtYsE9aXS/xUwDzhHlJ3qRSE2euC4bcn9a6C/rfpjgUCL6hacpQtdCxEwt7+j
 6eZ0bNhNxLOgW6MSGP6u4gP16UtQAWd5L01qh7yHIvAdjYQYhI/Ndgsy56lgwa1VaBT2
 YiC9S+gS3TILhgPXnJ7JIwlMLZ5b3sxd/4Any529VQKnov+s4LtmAXpDSisPLEyxVacJ
 dW/J2bv5bqqElx1df0Q3B2t69CkiqRNOammZgN3CrXsAEUsO1N5gSpMWuCacw1+odNgU
 PeFU7R4E7hrSVjUZJgenDgJVkNm9jg1dslM4dPVBm+O9yUbV9ukpRQthJo80LVylimjM
 JvmA==
X-Gm-Message-State: AOAM530fqg+iOQ/hblTY7fDxkZCMUWXQgoN8VjqgqlHD5Zsibrc+zF1V
 D70Jphi85U/OEaw8us1vEmMRSw==
X-Google-Smtp-Source: ABdhPJySlshqZ2Ilfkolhu3fme87XBbxHSNa2wxSn6e7yoWWkOCiYEFAD7wOGl1CjNLrhmwDGRCwww==
X-Received: by 2002:a1c:e087:: with SMTP id x129mr158673wmg.160.1600875460911; 
 Wed, 23 Sep 2020 08:37:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t16sm168344wrm.57.2020.09.23.08.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:37:39 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:37:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 1/3] dma-buf: Add struct dma-buf-map for storing
 struct dma_buf.vaddr_ptr
Message-ID: <20200923153737.GS438822@phenom.ffwll.local>
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-2-tzimmermann@suse.de>
 <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 tfiga@chromium.org, sam@ravnborg.org, m.szyprowski@samsung.com, corbet@lwn.net,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 lmark@codeaurora.org, afd@ti.com, kyungmin.park@samsung.com,
 Thomas Zimmermann <tzimmermann@suse.de>, robin.murphy@arm.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 04:27:04PM +0200, Christian K=F6nig wrote:
> Am 23.09.20 um 14:32 schrieb Thomas Zimmermann:
> > The new type struct dma_buf_map represents a mapping of dma-buf memory
> > into kernel space. It contains a flag, is_iomem, that signals users to
> > access the mapped memory with I/O operations instead of regular loads
> > and stores.
> > =

> > It was assumed that DMA buffer memory can be accessed with regular load
> > and store operations. Some architectures, such as sparc64, require the
> > use of I/O operations to access dma-map buffers that are located in I/O
> > memory. Providing struct dma_buf_map allows drivers to implement this.
> > This was specifically a problem when refreshing the graphics framebuffer
> > on such systems. [1]
> > =

> > As the first step, struct dma_buf stores an instance of struct dma_buf_=
map
> > internally. Afterwards, dma-buf's vmap and vunmap interfaces are be
> > converted. Finally, affected drivers can be fixed.
> > =

> > [1] https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fdri-devel%2F20200725191012.GA434957%40ravnborg.org%2F&am=
p;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C54486b9682654f3950b808d85fb=
cb1d3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637364611338153209&amp;s=
data=3D%2BZm7t8OcgkIxnY%2FdZSLhSbKC7t1y4VW5lINFKwCQv3A%3D&amp;reserved=3D0
> =

> Only two nit picks below, apart from that Reviewed-by: Christian K=F6nig
> <christian.koenig@amd.com>
> =

> > =

> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > ---
> >   Documentation/driver-api/dma-buf.rst |  3 +
> >   drivers/dma-buf/dma-buf.c            | 14 ++---
> >   include/linux/dma-buf-map.h          | 87 ++++++++++++++++++++++++++++
> >   include/linux/dma-buf.h              |  3 +-
> >   4 files changed, 99 insertions(+), 8 deletions(-)
> >   create mode 100644 include/linux/dma-buf-map.h
> > =

> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index 13ea0cc0a3fa..3244c600a9a1 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -115,6 +115,9 @@ Kernel Functions and Structures Reference
> >   .. kernel-doc:: include/linux/dma-buf.h
> >      :internal:

Please add a heading here, maybe "Buffer mapping helpers" or somethig like
that.

> > +.. kernel-doc:: include/linux/dma-buf-map.h
> > +   :internal:
> > +
> >   Reservation Objects
> >   -------------------
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 58564d82a3a2..5e849ca241a0 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1207,12 +1207,12 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
> >   	mutex_lock(&dmabuf->lock);
> >   	if (dmabuf->vmapping_counter) {
> >   		dmabuf->vmapping_counter++;
> > -		BUG_ON(!dmabuf->vmap_ptr);
> > -		ptr =3D dmabuf->vmap_ptr;
> > +		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> > +		ptr =3D dmabuf->vmap_ptr.vaddr;
> >   		goto out_unlock;
> >   	}
> > -	BUG_ON(dmabuf->vmap_ptr);
> > +	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
> >   	ptr =3D dmabuf->ops->vmap(dmabuf);
> >   	if (WARN_ON_ONCE(IS_ERR(ptr)))
> > @@ -1220,7 +1220,7 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
> >   	if (!ptr)
> >   		goto out_unlock;
> > -	dmabuf->vmap_ptr =3D ptr;
> > +	dmabuf->vmap_ptr.vaddr =3D ptr;
> >   	dmabuf->vmapping_counter =3D 1;
> >   out_unlock:
> > @@ -1239,15 +1239,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, voi=
d *vaddr)
> >   	if (WARN_ON(!dmabuf))
> >   		return;
> > -	BUG_ON(!dmabuf->vmap_ptr);
> > +	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> >   	BUG_ON(dmabuf->vmapping_counter =3D=3D 0);
> > -	BUG_ON(dmabuf->vmap_ptr !=3D vaddr);
> > +	BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, vaddr));
> >   	mutex_lock(&dmabuf->lock);
> >   	if (--dmabuf->vmapping_counter =3D=3D 0) {
> >   		if (dmabuf->ops->vunmap)
> >   			dmabuf->ops->vunmap(dmabuf, vaddr);
> > -		dmabuf->vmap_ptr =3D NULL;
> > +		dma_buf_map_clear(&dmabuf->vmap_ptr);
> >   	}
> >   	mutex_unlock(&dmabuf->lock);
> >   }
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > new file mode 100644
> > index 000000000000..d4b1bb3cc4b0
> > --- /dev/null
> > +++ b/include/linux/dma-buf-map.h
> > @@ -0,0 +1,87 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Pointer to dma-buf-mapped memory, plus helpers.
> > + */
> > +
> > +#ifndef __DMA_BUF_MAP_H__
> > +#define __DMA_BUF_MAP_H__
> > +
> > +#include <linux/io.h>
> > +
> > +/**
> > + * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
> > + * @vaddr_iomem:	The buffer's address if in I/O memory
> > + * @vaddr:		The buffer's address if in system memory
> > + * @is_iomem:		True if the dma-buf memory is located in I/O
> > + *			memory, or false otherwise.
> > + *
> > + * Calling dma-buf's vmap operation returns a pointer to the buffer.
> > + * Depending on the location of the buffer, users may have to access it
> > + * with I/O operations or memory load/store operations. struct dma_buf=
_map
> > + * stores the buffer address and a flag that signals the required acce=
ss.

Maybe explain that this can be used in general for abstracting away the
difference between system memory and __iomem for buffer mappings. Or
something like that - it's not exlusively tied to dma-buf, just a
convenient place.

> > + */
> > +struct dma_buf_map {
> > +	union {
> > +		void __iomem *vaddr_iomem;
> > +		void *vaddr;
> > +	};
> > +	bool is_iomem;
> > +};
> > +
> > +/* API transition helper */
> > +static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map,=
 const void *vaddr)
> > +{
> > +	return !map->is_iomem && (map->vaddr =3D=3D vaddr);
> > +}
> > +
> > +/**
> > + * dma_buf_map_is_null - Tests for a dma-buf mapping to be NULL
> > + * @map:	The dma-buf mapping structure
> > + *
> > + * Depending on the state of struct dma_buf_map.is_iomem, tests if the
> > + * mapping is NULL.
> > + *
> > + * Returns:
> > + * True if the mapping is NULL, or false otherwise.
> > + */
> > +static inline bool dma_buf_map_is_null(const struct dma_buf_map *map)
> > +{
> > +	if (map->is_iomem)
> > +		return map->vaddr_iomem =3D=3D NULL;
> > +	return map->vaddr =3D=3D NULL;
> =

> This looks like overkill since both pointers are part of the same union.
> =

> I suggest to test only one and add a comment.
> =

> > +}
> > +
> > +/**
> > + * dma_buf_map_is_set - Tests is the dma-buf mapping has been set
> > + * @map:	The dma-buf mapping structure
> > + *
> > + * Depending on the state of struct dma_buf_map.is_iomem, tests if the
> > + * mapping has been set.
> > + *
> > + * Returns:
> > + * True if the mapping is been set, or false otherwise.
> > + */
> > +static inline bool dma_buf_map_is_set(const struct dma_buf_map *map)
> > +{
> > +	return !dma_buf_map_is_null(map);
> > +}
> > +
> > +/**
> > + * dma_buf_map_clear - Clears a dma-buf mapping structure
> > + * @map:	The dma-buf mapping structure
> > + *
> > + * Clears all fields to zero; including struct dma_buf_map.is_iomem. So
> > + * mapping structures that were set to point to I/O memory are reset f=
or
> > + * system memory. Pointers are cleared to NULL. This is the default.
> > + */
> > +static inline void dma_buf_map_clear(struct dma_buf_map *map)
> > +{
> > +	if (map->is_iomem) {
> > +		map->vaddr_iomem =3D NULL;
> > +		map->is_iomem =3D false;
> > +	} else {
> > +		map->vaddr =3D NULL;
> > +	}
> =

> Maybe just use memset() on the structure.

gcc should be able to see through this, and I think the clever code is
maybe a bit too clever. I'd leave it as-is.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> =

> Christian.
> =

> > +}
> > +
> > +#endif /* __DMA_BUF_MAP_H__ */
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 957b398d30e5..fcc2ddfb6d18 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -13,6 +13,7 @@
> >   #ifndef __DMA_BUF_H__
> >   #define __DMA_BUF_H__
> > +#include <linux/dma-buf-map.h>
> >   #include <linux/file.h>
> >   #include <linux/err.h>
> >   #include <linux/scatterlist.h>
> > @@ -309,7 +310,7 @@ struct dma_buf {
> >   	const struct dma_buf_ops *ops;
> >   	struct mutex lock;
> >   	unsigned vmapping_counter;
> > -	void *vmap_ptr;
> > +	struct dma_buf_map vmap_ptr;
> >   	const char *exp_name;
> >   	const char *name;
> >   	spinlock_t name_lock;
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
