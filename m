Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382A345F91
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CEF6E8D9;
	Tue, 23 Mar 2021 13:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238876E8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:25:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id h10so23392434edt.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xdW9egEC7LbaP2FIn5wWhdUohTLcgspuFAwQh5P5LSo=;
 b=IoEHteIqnR3M6qgnIkbEDo8x5lrP3vuko9bmh9Pfnpr9wsxW2vLBrGW7NUPTTO067O
 O4cnNhWVx7oTT3DXHibAxwedZFAExjnQestCxNNefAzMocTLptC21RVpaBazaQ0CaeC8
 rpuVhMqA7sNujVOOPKPbfGvdPPOw9MBbLcjsfxMnrC9VXE2nyMrQRrs7GXybforFmOSp
 nufLk7/z7jPe2owtPpK7SGcrAuhQp+LLAa32olHWT8JTmhQHcwSJcRJC56SVR8v/DaIB
 zoM0153Lp+erzFL0210Wrcfk9vprIN9fY4pNcbN5J3PpP420iNZfElSdhNVviWVPJsSn
 qWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xdW9egEC7LbaP2FIn5wWhdUohTLcgspuFAwQh5P5LSo=;
 b=Fn+R7UKk1KRxGFX6jmNv8yjTacfc9EWuXCoY0L22qWvG4DQ9KkwfJ/NtVDPvKWeVz6
 MjcLkvAx6BuXZCxUJJpaowIVmMzXcKlhg/++WpnbSSPbefpAZOgRo2Svaa3i5fGtLujR
 m+ZfB474J066tv8VKRT5fgTeKu5jlRarWQegO19L7HTcoOYg4hck8IIW7gAo+IxLvKsw
 bO2D/ZhcMxO5Iq1MEU/YInKnUj4wbonztuQaoCMI1QrZ9XKLpesN18uKiQPhyDf1bOZU
 auvYHkfnH9Gyvu4wGvMB1jYja8i5VeU+LmMIo4EzNJCUxrYCgpKHzJgpjPBKthA3p1TP
 P6ug==
X-Gm-Message-State: AOAM531CoaoqzHYkrNjeEpbmKk3zCwLGkoPM1IIls62a1ceX7PAC75se
 ysyEmhx/puq7CIBABf1thok=
X-Google-Smtp-Source: ABdhPJxBbhJMRspn1TgRIGNASEJzstZ8YQfkVEsU7RzCVJ86NB9c7credNcUb0s43PWEg6aEzhZXjQ==
X-Received: by 2002:a05:6402:447:: with SMTP id
 p7mr4586230edw.89.1616505901630; 
 Tue, 23 Mar 2021 06:25:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r17sm11368990ejz.109.2021.03.23.06.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:24:59 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:25:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 19/21] drm/tegra: Implement new UAPI
Message-ID: <YFnsQNiLg/5I/qKA@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-20-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-20-mperttunen@nvidia.com>
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
 digetx@gmail.com
Content-Type: multipart/mixed; boundary="===============2023680235=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2023680235==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QGN6VcZMooIqRWXI"
Content-Disposition: inline


--QGN6VcZMooIqRWXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:17PM +0200, Mikko Perttunen wrote:
> Implement the non-submission parts of the new UAPI, including
> channel management and memory mapping. The UAPI is under the
> CONFIG_DRM_TEGRA_STAGING config flag for now.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Set iova_end in both mapping paths
> v4:
> * New patch, split out from combined UAPI + submit patch.
> ---
>  drivers/gpu/drm/tegra/Makefile    |   1 +
>  drivers/gpu/drm/tegra/drm.c       |  41 ++--
>  drivers/gpu/drm/tegra/drm.h       |   5 +
>  drivers/gpu/drm/tegra/uapi.h      |  63 ++++++
>  drivers/gpu/drm/tegra/uapi/uapi.c | 307 ++++++++++++++++++++++++++++++

I'd prefer if we kept the directory structure flat. There's something
like 19 pairs of files in the top-level directory, which is reasonably
manageable. Also, it looks like there's going to be a couple more files
in this new subdirectory. I'd prefer if that was all merged into the
single uapi.c source file to keep things simpler. These are all really
small files, so there's no need to aggressively split things up. Helps
with compilation time, too.

FWIW, I would've been fine with stashing all of this into drm.c as well
since the rest of the UAPI is in that already. The churn in this patch
is reasonably small, but it would've been even less if this was just all
in drm.c.

>  5 files changed, 401 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/uapi.h
>  create mode 100644 drivers/gpu/drm/tegra/uapi/uapi.c
>=20
> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makef=
ile
> index d6cf202414f0..0abdb21b38b9 100644
> --- a/drivers/gpu/drm/tegra/Makefile
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -3,6 +3,7 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) +=3D -DDEBUG
> =20
>  tegra-drm-y :=3D \
>  	drm.o \
> +	uapi/uapi.o \
>  	gem.o \
>  	fb.o \
>  	dp.o \
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index afd3f143c5e0..6a51035ce33f 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vblank.h>
> =20
> +#include "uapi.h"
>  #include "drm.h"
>  #include "gem.h"
> =20
> @@ -33,11 +34,6 @@
>  #define CARVEOUT_SZ SZ_64M
>  #define CDMA_GATHER_FETCHES_MAX_NB 16383
> =20
> -struct tegra_drm_file {
> -	struct idr contexts;
> -	struct mutex lock;
> -};
> -
>  static int tegra_atomic_check(struct drm_device *drm,
>  			      struct drm_atomic_state *state)
>  {
> @@ -90,7 +86,8 @@ static int tegra_drm_open(struct drm_device *drm, struc=
t drm_file *filp)
>  	if (!fpriv)
>  		return -ENOMEM;
> =20
> -	idr_init_base(&fpriv->contexts, 1);
> +	idr_init_base(&fpriv->legacy_contexts, 1);
> +	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
>  	mutex_init(&fpriv->lock);
>  	filp->driver_priv =3D fpriv;
> =20
> @@ -429,7 +426,7 @@ static int tegra_client_open(struct tegra_drm_file *f=
priv,
>  	if (err < 0)
>  		return err;
> =20
> -	err =3D idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
> +	err =3D idr_alloc(&fpriv->legacy_contexts, context, 1, 0, GFP_KERNEL);
>  	if (err < 0) {
>  		client->ops->close_channel(context);
>  		return err;
> @@ -484,13 +481,13 @@ static int tegra_close_channel(struct drm_device *d=
rm, void *data,
> =20
>  	mutex_lock(&fpriv->lock);
> =20
> -	context =3D idr_find(&fpriv->contexts, args->context);
> +	context =3D idr_find(&fpriv->legacy_contexts, args->context);
>  	if (!context) {
>  		err =3D -EINVAL;
>  		goto unlock;
>  	}
> =20
> -	idr_remove(&fpriv->contexts, context->id);
> +	idr_remove(&fpriv->legacy_contexts, context->id);
>  	tegra_drm_context_free(context);
> =20
>  unlock:
> @@ -509,7 +506,7 @@ static int tegra_get_syncpt(struct drm_device *drm, v=
oid *data,
> =20
>  	mutex_lock(&fpriv->lock);
> =20
> -	context =3D idr_find(&fpriv->contexts, args->context);
> +	context =3D idr_find(&fpriv->legacy_contexts, args->context);
>  	if (!context) {
>  		err =3D -ENODEV;
>  		goto unlock;
> @@ -538,7 +535,7 @@ static int tegra_submit(struct drm_device *drm, void =
*data,
> =20
>  	mutex_lock(&fpriv->lock);
> =20
> -	context =3D idr_find(&fpriv->contexts, args->context);
> +	context =3D idr_find(&fpriv->legacy_contexts, args->context);
>  	if (!context) {
>  		err =3D -ENODEV;
>  		goto unlock;
> @@ -563,7 +560,7 @@ static int tegra_get_syncpt_base(struct drm_device *d=
rm, void *data,
> =20
>  	mutex_lock(&fpriv->lock);
> =20
> -	context =3D idr_find(&fpriv->contexts, args->context);
> +	context =3D idr_find(&fpriv->legacy_contexts, args->context);
>  	if (!context) {
>  		err =3D -ENODEV;
>  		goto unlock;
> @@ -732,10 +729,21 @@ static int tegra_gem_get_flags(struct drm_device *d=
rm, void *data,
> =20
>  static const struct drm_ioctl_desc tegra_drm_ioctls[] =3D {
>  #ifdef CONFIG_DRM_TEGRA_STAGING
> -	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create,
> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_OPEN, tegra_drm_ioctl_channel_open,
> +			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_CLOSE, tegra_drm_ioctl_channel_close,
> +			  DRM_RENDER_ALLOW),

I'd prefer to keep call these TEGRA_OPEN_CHANNEL and TEGRA_CLOSE_CHANNEL
because I find that easier to think of. My reasoning goes: the TEGRA_
prefix means we're operating at a global context and then we perform the
OPEN_CHANNEL and CLOSE_CHANNEL operations. Whereas by the same reasoning
TEGRA_CHANNEL_OPEN and TEGRA_CHANNEL_CLOSE suggest we're operating at
the channel context and perform OPEN and CLOSE operations. For close you
could make the argument that it makes sense, but you can't open a
channel that you don't have yet.

And if that doesn't convince you, I think appending _LEGACY here like we
do for CREATE and MMAP would be more consistent. Who's going to remember
which one is new: TEGRA_CHANNEL_OPEN or TEGRA_OPEN_CHANNEL?

> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_MAP, tegra_drm_ioctl_channel_map,
>  			  DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap,
> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
> +			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
> +			  DRM_RENDER_ALLOW),
> +
> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE_LEGACY, tegra_gem_create, DRM_RENDER=
_ALLOW),
> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP_LEGACY, tegra_gem_mmap, DRM_RENDER_ALL=
OW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_READ, tegra_syncpt_read,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_INCR, tegra_syncpt_incr,
> @@ -789,10 +797,11 @@ static void tegra_drm_postclose(struct drm_device *=
drm, struct drm_file *file)
>  	struct tegra_drm_file *fpriv =3D file->driver_priv;
> =20
>  	mutex_lock(&fpriv->lock);
> -	idr_for_each(&fpriv->contexts, tegra_drm_context_cleanup, NULL);
> +	idr_for_each(&fpriv->legacy_contexts, tegra_drm_context_cleanup, NULL);
> +	tegra_drm_uapi_close_file(fpriv);
>  	mutex_unlock(&fpriv->lock);
> =20
> -	idr_destroy(&fpriv->contexts);
> +	idr_destroy(&fpriv->legacy_contexts);
>  	mutex_destroy(&fpriv->lock);
>  	kfree(fpriv);
>  }
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 0f38f159aa8e..1af57c2016eb 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -59,6 +59,11 @@ struct tegra_drm {
>  	struct tegra_display_hub *hub;
>  };
> =20
> +static inline struct host1x *tegra_drm_to_host1x(struct tegra_drm *tegra)
> +{
> +	return dev_get_drvdata(tegra->drm->dev->parent);
> +}
> +
>  struct tegra_drm_client;
> =20
>  struct tegra_drm_context {
> diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
> new file mode 100644
> index 000000000000..5c422607e8fa
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#ifndef _TEGRA_DRM_UAPI_H
> +#define _TEGRA_DRM_UAPI_H
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/idr.h>
> +#include <linux/kref.h>
> +#include <linux/xarray.h>
> +
> +#include <drm/drm.h>
> +
> +struct drm_file;
> +struct drm_device;
> +
> +struct tegra_drm_file {
> +	/* Legacy UAPI state */
> +	struct idr legacy_contexts;
> +	struct mutex lock;
> +
> +	/* New UAPI state */
> +	struct xarray contexts;
> +};
> +
> +struct tegra_drm_channel_ctx {
> +	struct tegra_drm_client *client;
> +	struct host1x_channel *channel;
> +	struct xarray mappings;
> +};

This is mostly the same as tegra_drm_context, so can't we just merge the
two? There's going to be slight overlap, but overall things are going to
be less confusing to follow.

Even more so because I think we should consider phasing out the old UAPI
eventually and then we can just remove the unneeded fields from this.

> +
> +struct tegra_drm_mapping {
> +	struct kref ref;
> +
> +	struct device *dev;
> +	struct host1x_bo *bo;
> +	struct sg_table *sgt;
> +	enum dma_data_direction direction;
> +	dma_addr_t iova;
> +	dma_addr_t iova_end;

iova_end seems to never be used. Do we need it?

> +};
> +
> +int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
> +				 struct drm_file *file);
> +int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
> +				  struct drm_file *file);
> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
> +				struct drm_file *file);
> +int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
> +				struct drm_file *file);
> +int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
> +				   struct drm_file *file);
> +int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
> +				struct drm_file *file);
> +int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
> +				struct drm_file *file);
> +
> +void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
> +void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
> +struct tegra_drm_channel_ctx *
> +tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id);
> +
> +#endif
> diff --git a/drivers/gpu/drm/tegra/uapi/uapi.c b/drivers/gpu/drm/tegra/ua=
pi/uapi.c
> new file mode 100644
> index 000000000000..d503b5e817c4
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi/uapi.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/host1x.h>
> +#include <linux/iommu.h>
> +#include <linux/list.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +
> +#include "../uapi.h"
> +#include "../drm.h"
> +
> +struct tegra_drm_channel_ctx *
> +tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id)
> +{
> +	struct tegra_drm_channel_ctx *ctx;
> +
> +	mutex_lock(&file->lock);
> +	ctx =3D xa_load(&file->contexts, id);
> +	if (!ctx)
> +		mutex_unlock(&file->lock);
> +
> +	return ctx;
> +}

This interface seems slightly odd. Looking at how this is used I see how
doing it this way saves a couple of lines. However, it also make this
difficult to understand, so I wonder if it wouldn't be better to just
open-code this in the three callsites to make the code flow a bit more
idiomatic.

> +
> +static void tegra_drm_mapping_release(struct kref *ref)
> +{
> +	struct tegra_drm_mapping *mapping =3D
> +		container_of(ref, struct tegra_drm_mapping, ref);
> +
> +	if (mapping->sgt)
> +		dma_unmap_sgtable(mapping->dev, mapping->sgt,
> +				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
> +
> +	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
> +	host1x_bo_put(mapping->bo);
> +
> +	kfree(mapping);
> +}
> +
> +void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping)
> +{
> +	kref_put(&mapping->ref, tegra_drm_mapping_release);
> +}
> +
> +static void tegra_drm_channel_ctx_close(struct tegra_drm_channel_ctx *ct=
x)

Yeah, the more often I read it, the more I'm in favour of just
collapsing tegra_drm_channel_ctx into tegra_drm_channel if for nothing
else but to get rid of that annoying _ctx suffix that's there for no
other reason than to differentiate it from "legacy" contexts.

> +{
> +	unsigned long mapping_id;

It's clear from the context that this is a mapping ID, so I think you
can just leave out the "mapping_" prefix to save a bit on screen space.

> +	struct tegra_drm_mapping *mapping;
> +
> +	xa_for_each(&ctx->mappings, mapping_id, mapping)
> +		tegra_drm_mapping_put(mapping);
> +
> +	xa_destroy(&ctx->mappings);
> +
> +	host1x_channel_put(ctx->channel);
> +
> +	kfree(ctx);
> +}
> +
> +int close_channel_ctx(int id, void *p, void *data)
> +{
> +	struct tegra_drm_channel_ctx *ctx =3D p;
> +
> +	tegra_drm_channel_ctx_close(ctx);
> +
> +	return 0;
> +}

The signature looked strange, so I went looking for where this is called
=66rom and turns out I can't find any place where this is used. Do we need
it?

> +
> +void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
> +{
> +	unsigned long ctx_id;

Just like for mappings above, I think it's fine to leave out the ctx_
prefix here.

> +	struct tegra_drm_channel_ctx *ctx;
> +
> +	xa_for_each(&file->contexts, ctx_id, ctx)
> +		tegra_drm_channel_ctx_close(ctx);
> +
> +	xa_destroy(&file->contexts);
> +}
> +
> +int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
> +				 struct drm_file *file)
> +{
> +	struct tegra_drm_file *fpriv =3D file->driver_priv;
> +	struct tegra_drm *tegra =3D drm->dev_private;
> +	struct drm_tegra_channel_open *args =3D data;
> +	struct tegra_drm_client *client =3D NULL;
> +	struct tegra_drm_channel_ctx *ctx;
> +	int err;
> +
> +	if (args->flags)
> +		return -EINVAL;
> +
> +	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	err =3D -ENODEV;
> +	list_for_each_entry(client, &tegra->clients, list) {
> +		if (client->base.class =3D=3D args->host1x_class) {
> +			err =3D 0;
> +			break;
> +		}
> +	}
> +	if (err)
> +		goto free_ctx;

This type of construct looks weird. I found that a good way around this
is to split this off into a separate function that does the lookup and
just returns NULL when it doesn't find one, which is very elegant:

	struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra, u3=
2 class)
	{
		struct tegra_drm_client *client;

		list_for_each_entry(client, &tegra->clients, list)
			if (client->base.class =3D=3D class)
				return client;

		return NULL;
	}

and then all of a sudden, the very cumbersome construct above becomes
this pretty piece of code:

	client =3D tegra_drm_find_client(tegra, args->host1x_class);
	if (!client) {
		err =3D -ENODEV;
		goto free_ctx;
	}

No need for initializing client to NULL or preventatively setting err =3D
-ENODEV or anything.

> +
> +	if (client->shared_channel) {
> +		ctx->channel =3D host1x_channel_get(client->shared_channel);
> +	} else {
> +		ctx->channel =3D host1x_channel_request(&client->base);
> +		if (!ctx->channel) {
> +			err =3D -EBUSY;

I -EBUSY really appropriate here? Can host1x_channel_request() fail for
other reasons?

> +			goto free_ctx;
> +		}
> +	}
> +
> +	err =3D xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
> +		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
> +	if (err < 0)
> +		goto put_channel;
> +
> +	ctx->client =3D client;
> +	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC1);
> +
> +	args->hardware_version =3D client->version;
> +
> +	return 0;
> +
> +put_channel:
> +	host1x_channel_put(ctx->channel);
> +free_ctx:
> +	kfree(ctx);
> +
> +	return err;
> +}
> +
> +int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
> +				  struct drm_file *file)
> +{
> +	struct tegra_drm_file *fpriv =3D file->driver_priv;
> +	struct drm_tegra_channel_close *args =3D data;
> +	struct tegra_drm_channel_ctx *ctx;
> +
> +	ctx =3D tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	xa_erase(&fpriv->contexts, args->channel_ctx);
> +
> +	mutex_unlock(&fpriv->lock);
> +
> +	tegra_drm_channel_ctx_close(ctx);
> +
> +	return 0;
> +}
> +
> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
> +				struct drm_file *file)
> +{
> +	struct tegra_drm_file *fpriv =3D file->driver_priv;
> +	struct drm_tegra_channel_map *args =3D data;
> +	struct tegra_drm_channel_ctx *ctx;
> +	struct tegra_drm_mapping *mapping;
> +	struct drm_gem_object *gem;
> +	u32 mapping_id;
> +	int err =3D 0;
> +
> +	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READWRITE)
> +		return -EINVAL;
> +
> +	ctx =3D tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	mapping =3D kzalloc(sizeof(*mapping), GFP_KERNEL);
> +	if (!mapping) {
> +		err =3D -ENOMEM;
> +		goto unlock;
> +	}
> +
> +	kref_init(&mapping->ref);
> +
> +	gem =3D drm_gem_object_lookup(file, args->handle);
> +	if (!gem) {
> +		err =3D -EINVAL;
> +		goto unlock;
> +	}
> +
> +	mapping->dev =3D ctx->client->base.dev;
> +	mapping->bo =3D &container_of(gem, struct tegra_bo, gem)->base;

We already have host1x_bo_lookup() in drm.c that you can use to avoid
this strange cast.

> +
> +	if (!iommu_get_domain_for_dev(mapping->dev) ||
> +	    ctx->client->base.group) {

This expression is now used in at least two places, so I wonder if we
should have a helper for it along with some documentation about why this
is the right thing to do. I have a local patch that adds a comment to
the other instance of this because I had forgotten why this was correct,
so I can pick that up and refactor later on.

> +		host1x_bo_pin(mapping->dev, mapping->bo,
> +			      &mapping->iova);
> +	} else {
> +		mapping->direction =3D DMA_TO_DEVICE;
> +		if (args->flags & DRM_TEGRA_CHANNEL_MAP_READWRITE)
> +			mapping->direction =3D DMA_BIDIRECTIONAL;
> +
> +		mapping->sgt =3D
> +			host1x_bo_pin(mapping->dev, mapping->bo, NULL);
> +		if (IS_ERR(mapping->sgt)) {
> +			err =3D PTR_ERR(mapping->sgt);
> +			goto put_gem;
> +		}
> +
> +		err =3D dma_map_sgtable(mapping->dev, mapping->sgt,
> +				      mapping->direction,
> +				      DMA_ATTR_SKIP_CPU_SYNC);
> +		if (err)
> +			goto unpin;
> +
> +		/* TODO only map the requested part */
> +		mapping->iova =3D sg_dma_address(mapping->sgt->sgl);

That comment seems misplaced here since the mapping already happens
above. Also, wouldn't the same TODO apply to the host1x_bo_pin() path in
the if block? Maybe the TODO should be at the top of the function?

Alternatively, if this isn't implemented in this patch anyway, maybe
just drop the comment altogether. In order to implement this, wouldn't
the UAPI have to change as well? In that case it might be better to add
the TODO somewhere in the UAPI header, or in a separate TODO file in the
driver's directory.

> +	}
> +
> +	mapping->iova_end =3D mapping->iova + gem->size;
> +
> +	mutex_unlock(&fpriv->lock);
> +
> +	err =3D xa_alloc(&ctx->mappings, &mapping_id, mapping,
> +		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
> +	if (err < 0)
> +		goto unmap;
> +
> +	args->mapping_id =3D mapping_id;
> +
> +	return 0;
> +
> +unmap:
> +	if (mapping->sgt) {
> +		dma_unmap_sgtable(mapping->dev, mapping->sgt,
> +				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
> +	}
> +unpin:
> +	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
> +put_gem:
> +	drm_gem_object_put(gem);
> +	kfree(mapping);
> +unlock:
> +	mutex_unlock(&fpriv->lock);
> +	return err;
> +}
> +
> +int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
> +				  struct drm_file *file)
> +{
> +	struct tegra_drm_file *fpriv =3D file->driver_priv;
> +	struct drm_tegra_channel_unmap *args =3D data;
> +	struct tegra_drm_channel_ctx *ctx;
> +	struct tegra_drm_mapping *mapping;
> +
> +	ctx =3D tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	mapping =3D xa_erase(&ctx->mappings, args->mapping_id);
> +
> +	mutex_unlock(&fpriv->lock);
> +
> +	if (mapping) {
> +		tegra_drm_mapping_put(mapping);
> +		return 0;
> +	} else {
> +		return -EINVAL;
> +	}
> +}
> +
> +int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
> +			       struct drm_file *file)
> +{
> +	struct drm_tegra_gem_create *args =3D data;
> +	struct tegra_bo *bo;
> +
> +	if (args->flags)
> +		return -EINVAL;

I'm not sure it's worth doing this, especially because this is now a new
IOCTL that's actually a subset of the original. I think we should just
keep the original and if we want to deprecate the flags, or replace them
with new ones, let's just try and phase out the deprecated ones.

Thierry

> +
> +	bo =3D tegra_bo_create_with_handle(file, drm, args->size, args->flags,
> +					 &args->handle);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	return 0;
> +}
> +
> +int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct drm_tegra_gem_mmap *args =3D data;
> +	struct drm_gem_object *gem;
> +	struct tegra_bo *bo;
> +
> +	gem =3D drm_gem_object_lookup(file, args->handle);
> +	if (!gem)
> +		return -EINVAL;
> +
> +	bo =3D to_tegra_bo(gem);
> +
> +	args->offset =3D drm_vma_node_offset_addr(&bo->gem.vma_node);
> +
> +	drm_gem_object_put(gem);
> +
> +	return 0;
> +}
> --=20
> 2.30.0
>=20

--QGN6VcZMooIqRWXI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ7D0ACgkQ3SOs138+
s6GRtQ/9EUcCkAabf/JIMmrBQ4GVI4y/rPAvf0s+aIzS1fNM6ipscnANrsYXbfkz
+3wdKHXPxMJVcje5AH2S1gKZfYOD6cm53OrkY0k094VIpYKsMREYoXo48C3Ws7ny
8+4hOe2CqSY6loSx5eD1O1agHLJ9opba/ZbOppsr2BIHIU7K/pvIoM9YFHPiMcdE
uvCaCxvkpkduQtaKUJEZdGFpHNMj4PLinCe1Dbd+CIugncv6hXs+hlJ3tOe4dafR
+jM3exGOQua+Q7bBmTKzFIWXnSuv9sOab6MOpT6cVrvBd5jQ6/9hKW72B3b6C/Ij
haZ/8rzyrDCQIBmXM7qq/Yl147DExmBKrATTwQfb9vWqRQwBC8Ybbox1r9oHSdWd
T0XjAy2QfVCZMneTuadL+vIEnNg35IoT4M/DiRTICDxsl69LEjzSUbSvYi79F3DH
5Nu78bXi+YqL8ufijmmTrFCTnLlque4gqiXczg2OCRAnVF5zzqiOR54cwfn8+QMT
kqZ68+TOEMUC544sC3RNTkjclIrgF3/slE/2ypClMIUDE85V43T57Su4lpikMM2k
apc9i3Z0auRvbGSjLlGQ+PKjMzj8P4RGiaP1Z2fHZ22mX76oHC4wNIxI5KGjgPzK
Sil+UUJGDpzuBR2kzAlMfxnxecEhAUt8of9X8wijZMMp/VPI6YA=
=Ue8R
-----END PGP SIGNATURE-----

--QGN6VcZMooIqRWXI--

--===============2023680235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2023680235==--
