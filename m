Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD143465E0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352346E914;
	Tue, 23 Mar 2021 17:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AC289D5B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:03:49 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id l18so16108942edc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=adFkLqzzHpthoblLKtQmNHFYR2SQC+gqQfVIf7/hOzs=;
 b=Wr44zJW1YNq8KBlKItM5vYj88wM4UiGf+odm3lzoOHCitoGF07XXTi1zU+u3btvLi5
 O68Ou11mLIG3+UXfAZYLCyefop3Jd9/r6/hYV8Qx9OQZHuRKhv8TmjyqFSPKpBjVSy81
 bcfLHVo1kKmS56KnZmqO/6zKGzEImTGXHGB3IthaU9BaZL+diT77UdycQTXUXb1GGppz
 twZxz4/Cem8JmO4Jz1VOHOpA9btoHTA7VbNqyS1TpciOfae7MtpuXzi1tiYf8Ftduo3d
 Jp8wgrbJmVqaeJ0mzlS81H+FQjD850FcGBZIL9iGXdnvX7W9X7KEzeHLppKroe4Bcz7p
 hWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=adFkLqzzHpthoblLKtQmNHFYR2SQC+gqQfVIf7/hOzs=;
 b=WX+HaFOnDHOjfI3PtrFjH+7mrP5Sam7UOxOInTfwXwTM/Kd3uV8Sr+JFlpHJht9Vgh
 VwdSR25FF0BKZzK9YD7EM9Kh5i/Mn14Hkspc/OnGi0HnmlJGVQhHIP9nGI1C57X4I6cf
 2ZRgc3k471s7QpeF53WaRV9Iz/x47G14F0+8A5Nkkq7U7nhvyRaOQBgVlJaVirSsmweF
 KAi0l+xvWwoy9RuIC5bWkcaRpLooaqICGewk9jAMFf8X5c0/HjHbgWiQitutFWcQgUqT
 nr8MoXdNYdqXcABHYER3ylYU4pDmaCpFO8EZcobnZu8o/4jB6N7/ASJivuY36/Yb9JCf
 6sxg==
X-Gm-Message-State: AOAM530P1aDqkYWAnY2eYGjNbX9Zh0U9ynC/mfTOVyxrmSYZTkJ0ZTl9
 peiUL2+ajJdn3aw1pi0wIFM=
X-Google-Smtp-Source: ABdhPJyiG0iHWG4fie6XPLD2RHQrk59UnVKpBX+6H0wjyxkoWDtjYwCeKfbs7LxliyllQAADzsWKCA==
X-Received: by 2002:a05:6402:888:: with SMTP id
 e8mr5427628edy.51.1616519028567; 
 Tue, 23 Mar 2021 10:03:48 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v22sm11424727ejj.103.2021.03.23.10.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 10:03:46 -0700 (PDT)
Date: Tue, 23 Mar 2021 18:04:07 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v5 20/21] drm/tegra: Implement job submission part of new
 UAPI
Message-ID: <YFofhwT8d6IMsk7U@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-21-mperttunen@nvidia.com>
 <YFnvQYvT7E/kCAuj@orome.fritz.box>
 <49820423-e3aa-6c99-b92f-3d3ece739ed7@kapsi.fi>
MIME-Version: 1.0
In-Reply-To: <49820423-e3aa-6c99-b92f-3d3ece739ed7@kapsi.fi>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1155917665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1155917665==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1ADNrECtd7zFEDrp"
Content-Disposition: inline


--1ADNrECtd7zFEDrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 04:16:00PM +0200, Mikko Perttunen wrote:
> On 3/23/21 3:38 PM, Thierry Reding wrote:
> > On Mon, Jan 11, 2021 at 03:00:18PM +0200, Mikko Perttunen wrote:
> > > Implement the job submission IOCTL with a minimum feature set.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > > v5:
> > > * Add 16K size limit to copies from userspace.
> > > * Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
> > >    to prevent oversized shift on 32-bit platforms.
> > > v4:
> > > * Remove all features that are not strictly necessary.
> > > * Split into two patches.
> > > v3:
> > > * Remove WRITE_RELOC. Relocations are now patched implicitly
> > >    when patching is needed.
> > > * Directly call PM runtime APIs on devices instead of using
> > >    power_on/power_off callbacks.
> > > * Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
> > > * Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
> > > * Accommodate for removal of timeout field and inlining of
> > >    syncpt_incrs array.
> > > * Copy entire user arrays at a time instead of going through
> > >    elements one-by-one.
> > > * Implement waiting of DMA reservations.
> > > * Split out gather_bo implementation into a separate file.
> > > * Fix length parameter passed to sg_init_one in gather_bo
> > > * Cosmetic cleanup.
> > > ---
> > >   drivers/gpu/drm/tegra/Makefile         |   2 +
> > >   drivers/gpu/drm/tegra/drm.c            |   2 +
> > >   drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 +++++
> > >   drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 ++
> > >   drivers/gpu/drm/tegra/uapi/submit.c    | 428 ++++++++++++++++++++++=
+++
> > >   drivers/gpu/drm/tegra/uapi/submit.h    |  17 +
> > >   6 files changed, 557 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
> > >   create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
> > >   create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
> > >   create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/M=
akefile
> > > index 0abdb21b38b9..059322e88943 100644
> > > --- a/drivers/gpu/drm/tegra/Makefile
> > > +++ b/drivers/gpu/drm/tegra/Makefile
> > > @@ -4,6 +4,8 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) +=3D -DDEBUG
> > >   tegra-drm-y :=3D \
> > >   	drm.o \
> > >   	uapi/uapi.o \
> > > +	uapi/submit.o \
> > > +	uapi/gather_bo.o \
> > >   	gem.o \
> > >   	fb.o \
> > >   	dp.o \
> > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > > index 6a51035ce33f..60eab403ae9b 100644
> > > --- a/drivers/gpu/drm/tegra/drm.c
> > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > @@ -737,6 +737,8 @@ static const struct drm_ioctl_desc tegra_drm_ioct=
ls[] =3D {
> > >   			  DRM_RENDER_ALLOW),
> > >   	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unm=
ap,
> > >   			  DRM_RENDER_ALLOW),
> > > +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_SUBMIT, tegra_drm_ioctl_channel_sub=
mit,
> > > +			  DRM_RENDER_ALLOW),
> > >   	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
> > >   			  DRM_RENDER_ALLOW),
> > >   	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
> > > diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.c b/drivers/gpu/drm=
/tegra/uapi/gather_bo.c
> > > new file mode 100644
> > > index 000000000000..b487a0d44648
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.c
> > > @@ -0,0 +1,86 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/* Copyright (c) 2020 NVIDIA Corporation */
> > > +
> > > +#include <linux/scatterlist.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "gather_bo.h"
> > > +
> > > +static struct host1x_bo *gather_bo_get(struct host1x_bo *host_bo)
> > > +{
> > > +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, ba=
se);
> > > +
> > > +	kref_get(&bo->ref);
> > > +
> > > +	return host_bo;
> > > +}
> > > +
> > > +static void gather_bo_release(struct kref *ref)
> > > +{
> > > +	struct gather_bo *bo =3D container_of(ref, struct gather_bo, ref);
> > > +
> > > +	kfree(bo->gather_data);
> > > +	kfree(bo);
> > > +}
> > > +
> > > +void gather_bo_put(struct host1x_bo *host_bo)
> > > +{
> > > +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, ba=
se);
> > > +
> > > +	kref_put(&bo->ref, gather_bo_release);
> > > +}
> > > +
> > > +static struct sg_table *
> > > +gather_bo_pin(struct device *dev, struct host1x_bo *host_bo, dma_add=
r_t *phys)
> > > +{
> > > +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, ba=
se);
> > > +	struct sg_table *sgt;
> > > +	int err;
> > > +
> > > +	if (phys) {
> > > +		*phys =3D virt_to_phys(bo->gather_data);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> > > +	if (!sgt)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	err =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > > +	if (err) {
> > > +		kfree(sgt);
> > > +		return ERR_PTR(err);
> > > +	}
> > > +
> > > +	sg_init_one(sgt->sgl, bo->gather_data, bo->gather_data_words*4);
> > > +
> > > +	return sgt;
> > > +}
> > > +
> > > +static void gather_bo_unpin(struct device *dev, struct sg_table *sgt)
> > > +{
> > > +	if (sgt) {
> > > +		sg_free_table(sgt);
> > > +		kfree(sgt);
> > > +	}
> > > +}
> > > +
> > > +static void *gather_bo_mmap(struct host1x_bo *host_bo)
> > > +{
> > > +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, ba=
se);
> > > +
> > > +	return bo->gather_data;
> > > +}
> > > +
> > > +static void gather_bo_munmap(struct host1x_bo *host_bo, void *addr)
> > > +{
> > > +}
> > > +
> > > +const struct host1x_bo_ops gather_bo_ops =3D {
> > > +	.get =3D gather_bo_get,
> > > +	.put =3D gather_bo_put,
> > > +	.pin =3D gather_bo_pin,
> > > +	.unpin =3D gather_bo_unpin,
> > > +	.mmap =3D gather_bo_mmap,
> > > +	.munmap =3D gather_bo_munmap,
> > > +};
> > > diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.h b/drivers/gpu/drm=
/tegra/uapi/gather_bo.h
> > > new file mode 100644
> > > index 000000000000..6b4c9d83ac91
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.h
> > > @@ -0,0 +1,22 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/* Copyright (c) 2020 NVIDIA Corporation */
> > > +
> > > +#ifndef _TEGRA_DRM_SUBMIT_GATHER_BO_H
> > > +#define _TEGRA_DRM_SUBMIT_GATHER_BO_H
> > > +
> > > +#include <linux/host1x.h>
> > > +#include <linux/kref.h>
> > > +
> > > +struct gather_bo {
> > > +	struct host1x_bo base;
> > > +
> > > +	struct kref ref;
> > > +
> > > +	u32 *gather_data;
> > > +	size_t gather_data_words;
> > > +};
> > > +
> > > +extern const struct host1x_bo_ops gather_bo_ops;
> > > +void gather_bo_put(struct host1x_bo *host_bo);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/te=
gra/uapi/submit.c
> > > new file mode 100644
> > > index 000000000000..398be3065e21
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/tegra/uapi/submit.c
> > > @@ -0,0 +1,428 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/* Copyright (c) 2020 NVIDIA Corporation */
> > > +
> > > +#include <linux/dma-fence-array.h>
> > > +#include <linux/file.h>
> > > +#include <linux/host1x.h>
> > > +#include <linux/iommu.h>
> > > +#include <linux/kref.h>
> > > +#include <linux/list.h>
> > > +#include <linux/nospec.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/sync_file.h>
> > > +
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_file.h>
> > > +
> > > +#include "../uapi.h"
> > > +#include "../drm.h"
> > > +#include "../gem.h"
> > > +
> > > +#include "gather_bo.h"
> > > +#include "submit.h"
> > > +
> > > +static struct tegra_drm_mapping *
> > > +tegra_drm_mapping_get(struct tegra_drm_channel_ctx *ctx, u32 id)
> > > +{
> > > +	struct tegra_drm_mapping *mapping;
> > > +
> > > +	xa_lock(&ctx->mappings);
> > > +	mapping =3D xa_load(&ctx->mappings, id);
> > > +	if (mapping)
> > > +		kref_get(&mapping->ref);
> > > +	xa_unlock(&ctx->mappings);
> > > +
> > > +	return mapping;
> > > +}
> > > +
> > > +static void *alloc_copy_user_array(void __user *from, size_t count, =
size_t size)
> > > +{
> > > +	unsigned long copy_err;
> > > +	size_t copy_len;
> > > +	void *data;
> > > +
> > > +	if (check_mul_overflow(count, size, &copy_len))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	if (copy_len > 0x4000)
> > > +		return ERR_PTR(-E2BIG);
> > > +
> > > +	data =3D kvmalloc(copy_len, GFP_KERNEL);
> > > +	if (!data)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	copy_err =3D copy_from_user(data, from, copy_len);
> > > +	if (copy_err) {
> > > +		kvfree(data);
> > > +		return ERR_PTR(-EFAULT);
> > > +	}
> > > +
> > > +	return data;
> > > +}
> > > +
> > > +static int submit_copy_gather_data(struct drm_device *drm,
> > > +				   struct gather_bo **pbo,
> > > +				   struct drm_tegra_channel_submit *args)
> > > +{
> > > +	unsigned long copy_err;
> > > +	struct gather_bo *bo;
> > > +	size_t copy_len;
> > > +
> > > +	if (args->gather_data_words =3D=3D 0) {
> > > +		drm_info(drm, "gather_data_words can't be 0");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (check_mul_overflow((size_t)args->gather_data_words, (size_t)4, =
&copy_len))
> > > +		return -EINVAL;
> > > +
> > > +	bo =3D kzalloc(sizeof(*bo), GFP_KERNEL);
> > > +	if (!bo)
> > > +		return -ENOMEM;
> > > +
> > > +	kref_init(&bo->ref);
> > > +	host1x_bo_init(&bo->base, &gather_bo_ops);
> > > +
> > > +	bo->gather_data =3D kmalloc(copy_len, GFP_KERNEL | __GFP_NOWARN);
> > > +	if (!bo->gather_data) {
> > > +		kfree(bo);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	copy_err =3D copy_from_user(bo->gather_data,
> > > +				  u64_to_user_ptr(args->gather_data_ptr),
> > > +				  copy_len);
> > > +	if (copy_err) {
> > > +		kfree(bo->gather_data);
> > > +		kfree(bo);
> > > +		return -EFAULT;
> > > +	}
> > > +
> > > +	bo->gather_data_words =3D args->gather_data_words;
> > > +
> > > +	*pbo =3D bo;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int submit_write_reloc(struct gather_bo *bo,
> > > +			      struct drm_tegra_submit_buf *buf,
> > > +			      struct tegra_drm_mapping *mapping)
> > > +{
> > > +	/* TODO check that target_offset is within bounds */
> > > +	dma_addr_t iova =3D mapping->iova + buf->reloc.target_offset;
> > > +	u32 written_ptr =3D (u32)(iova >> buf->reloc.shift);
> > > +
> > > +#ifdef CONFIG_ARM64
> > > +	if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
> > > +		written_ptr |=3D BIT(39);
> > > +#endif
> >=20
> > Sorry, but this still isn't correct. written_ptr is still only 32-bits
> > wide, so your BIT(39) is going to get discarded even on 64-bit ARM. The
> > idiomatic way to do this is to make written_ptr dma_addr_t and use a
> > CONFIG_ARCH_DMA_ADDR_T_64BIT guard. >
> > But even with that this looks wrong because you're OR'ing this in after
> > shifting by buf->reloc.shift. Doesn't that OR it in at the wrong offset?
> > Should you perhaps be doing this instead:
> >=20
> > 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> > 		if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
> > 			iova |=3D BIT(39);
> > 	#endif
> >=20
> > 	written_ptr =3D (u32)(iova >> buf->reloc_shift);
> >=20
> > ?
>=20
> Yes, you are of course right.. will fix this. That might explain some of =
the
> VIC test failures I've seen.
>=20
> >=20
> > Also, on a side-note: BLOCKLINEAR really isn't the right term here. I
> > recently dealt with this for display (though I haven't sent out that
> > patch yet) and this is actually a bit that selects which sector layout
> > swizzling is being applied. That's independent of block linear format
> > and I think you can have different sector layouts irrespective of the
> > block linear format (though I don't think that's usually done).
> >=20
> > That said, I wonder if a better interface here would be to reuse format
> > modifiers here. That would allow us to more fully describe the format of
> > a surface in case we ever need it, and it already includes the sector
> > layout information as well.
>=20
> I think having just a flag that enables or disables the swizzling is bett=
er
> -- that way it is the responsibility of the userspace, which is where all
> the engine knowledge is as well, to know for each buffer whether it wants
> swizzling or not. Now, in practice at the moment the kernel can just look=
up
> the format and set the bit based on that, but e.g. if there was an engine
> that could do the swizzling natively, and we had the format modifier here,
> we'd need to have the knowledge in the kernel to decide for each chip/eng=
ine
> whether to apply the bit.

Fine, let's try it this way. I'm just slightly worried that we'll end up
duplicating a lot of the same information that we already have in the
framebuffer modifiers. We made the same mistake a long time ago with
those odd flags in the CREATE IOCTL and that turned out not to be usable
at all, and also completely insufficient.

Thierry

--1ADNrECtd7zFEDrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaH4cACgkQ3SOs138+
s6GEeg/9GLAnJbpXImko4Bh12lixFOFUPpsNQKmNfeTYUYZCXlRPwiJmiMDESo6l
01f9pOpyhrJDsHC8GfT1rYB/4kd8DiIJ0zkUfDGnLIj1/d512eT2m2hhvjAKlwci
ZvdWMH4c2nRo4u3fY93LreXeZF0Xb6CmNEXKJ+S4chXJMvo00SGSeCEw1wcYkKZN
GmcUy5y02HawT6UuU2u2EOjlQHchM5UdLXhPuTxcy+Dr62ozY2gjUYRsAKlI/yom
JajLJwb27TF+xuHWU0/JPpsPj/eC5B0XKsPs9sSY5h3+UVkTzYD4bu1Qwv5rcZYj
DJOjyWHfOKO31vohbI8/bKofDMFnn4A3SYwikUSzyIXM22Bvkw+OjcV1whda6rz4
0tzr5GGsjI8pnwCirDdgppfcPn/kUb4dZo7iU+eXnmyYJGtHajzo/nMeuu5aGZxd
B6rHfLvz5hpUU1I8jlBES0Cr96SZIWTdVT/ju9cIcz2/mTLLIx9+qfTLFDQOs42j
RqfcNkIpseipTuJJH0GbvpAmZ0U/hYk2Din3fsZzMHNZzhw3HtUzwIykMFtgfIv0
oe2csZyKR6DzaRDAKwETbbcx74P7v5vGQGsiSxYfRCHPz10Yqw1iLaTBD4Uapnz4
0cPeGzZJW6AzWuz2lqEHWxV9XGj+xyIkmOTXVQPUWMRiCn2iu1w=
=Dmku
-----END PGP SIGNATURE-----

--1ADNrECtd7zFEDrp--

--===============1155917665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1155917665==--
