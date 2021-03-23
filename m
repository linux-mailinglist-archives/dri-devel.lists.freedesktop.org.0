Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1B345FCC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F976E0CE;
	Tue, 23 Mar 2021 13:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08866E134
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:37:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b7so27163287ejv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=p9bSVVzekojjatQS+g6a7TVAbjRfZNZ7xJRUuEXyXVw=;
 b=BoL5KlbmUWAirwSWbevPqJkqoeNmFpdaxciOeTrIKpyzW+EkDW/Ni2jaQ+dHlFetYk
 PqTMOG2qzlStwY2BjzyPv0LgKlWwHswYqBAsgf4nbRTrJ9FwZNU/alqR7MBJxSEYc7Sz
 AWUWtV0JQ/LWNbpatho62529Ln17QZqqNa8susD3Aj3yv8kkJhrwRPFgr1MwolPh1uOU
 0UxAyS8c+ii9O6Rz15vqL9mSX5bPCiNI9A7zC9gPelwa09pDEXtzyJ3FLsJjlLCNX61O
 EF39IN3ugPdoLCrlRvIWIL4zS9tfB39ozJhg8PTcU0SGhMnSTR/C8GB9TutZR9iPJM5K
 WjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p9bSVVzekojjatQS+g6a7TVAbjRfZNZ7xJRUuEXyXVw=;
 b=SL8hLQRc3mxXAobpnWn/TNhPY2QixkjrUh2tat0gr3pBlkDiUeHAZ7ElexRxKijsY7
 ehntXbM8aZsN8MGFHcElbiBMud3HNcwrzDOadrJxplVwHZIlYsPb/97EsFnIz2yuMBJj
 c4SPonZrskRMrJsRRCauzlUrgg+078wR6sHj1dr/NdceO0YWNywNh1ayM5ob/iAVpS2H
 TY5sWxf5b4qaksKXMEAbhhjRw6f/nhwVluS+gOKny8Ezx2MJsV/CNBz+OJo6LKfwnxYE
 YgO0vQmMepH1hHFzDmzU3eEep8qf/2A62qKmWCRNOzpuawLNbZqbZKbokVDUib0qBQBD
 KFlw==
X-Gm-Message-State: AOAM5316xMhTmTtkTeqMoPAK6InllMZIvaxu+6dt0WQiZEQIZTrAAuZG
 LUPzUlEXss5XE/vNXQe0wMw=
X-Google-Smtp-Source: ABdhPJx8nNVxKkN4pX6KACd4NZ87KR+0WS9u+TnbEk9KXlcvcEq9XNN1KWLYAttJwyGtVyTOUqhMWg==
X-Received: by 2002:a17:906:f1c8:: with SMTP id
 gx8mr5074346ejb.385.1616506671460; 
 Tue, 23 Mar 2021 06:37:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f19sm13065818edu.12.2021.03.23.06.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:37:49 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:38:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 20/21] drm/tegra: Implement job submission part of new
 UAPI
Message-ID: <YFnvQYvT7E/kCAuj@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-21-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-21-mperttunen@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============1272077015=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1272077015==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jc4GjS8xwUd/3Cp7"
Content-Disposition: inline


--jc4GjS8xwUd/3Cp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:18PM +0200, Mikko Perttunen wrote:
> Implement the job submission IOCTL with a minimum feature set.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Add 16K size limit to copies from userspace.
> * Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
>   to prevent oversized shift on 32-bit platforms.
> v4:
> * Remove all features that are not strictly necessary.
> * Split into two patches.
> v3:
> * Remove WRITE_RELOC. Relocations are now patched implicitly
>   when patching is needed.
> * Directly call PM runtime APIs on devices instead of using
>   power_on/power_off callbacks.
> * Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
> * Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
> * Accommodate for removal of timeout field and inlining of
>   syncpt_incrs array.
> * Copy entire user arrays at a time instead of going through
>   elements one-by-one.
> * Implement waiting of DMA reservations.
> * Split out gather_bo implementation into a separate file.
> * Fix length parameter passed to sg_init_one in gather_bo
> * Cosmetic cleanup.
> ---
>  drivers/gpu/drm/tegra/Makefile         |   2 +
>  drivers/gpu/drm/tegra/drm.c            |   2 +
>  drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 +++++
>  drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 ++
>  drivers/gpu/drm/tegra/uapi/submit.c    | 428 +++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/uapi/submit.h    |  17 +
>  6 files changed, 557 insertions(+)
>  create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
>  create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
>  create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
>  create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h
>=20
> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makef=
ile
> index 0abdb21b38b9..059322e88943 100644
> --- a/drivers/gpu/drm/tegra/Makefile
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -4,6 +4,8 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) +=3D -DDEBUG
>  tegra-drm-y :=3D \
>  	drm.o \
>  	uapi/uapi.o \
> +	uapi/submit.o \
> +	uapi/gather_bo.o \
>  	gem.o \
>  	fb.o \
>  	dp.o \
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 6a51035ce33f..60eab403ae9b 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -737,6 +737,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[]=
 =3D {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_SUBMIT, tegra_drm_ioctl_channel_submit,
> +			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
> diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.c b/drivers/gpu/drm/teg=
ra/uapi/gather_bo.c
> new file mode 100644
> index 000000000000..b487a0d44648
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +
> +#include "gather_bo.h"
> +
> +static struct host1x_bo *gather_bo_get(struct host1x_bo *host_bo)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +
> +	kref_get(&bo->ref);
> +
> +	return host_bo;
> +}
> +
> +static void gather_bo_release(struct kref *ref)
> +{
> +	struct gather_bo *bo =3D container_of(ref, struct gather_bo, ref);
> +
> +	kfree(bo->gather_data);
> +	kfree(bo);
> +}
> +
> +void gather_bo_put(struct host1x_bo *host_bo)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +
> +	kref_put(&bo->ref, gather_bo_release);
> +}
> +
> +static struct sg_table *
> +gather_bo_pin(struct device *dev, struct host1x_bo *host_bo, dma_addr_t =
*phys)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +	struct sg_table *sgt;
> +	int err;
> +
> +	if (phys) {
> +		*phys =3D virt_to_phys(bo->gather_data);
> +		return NULL;
> +	}
> +
> +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	err =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	if (err) {
> +		kfree(sgt);
> +		return ERR_PTR(err);
> +	}
> +
> +	sg_init_one(sgt->sgl, bo->gather_data, bo->gather_data_words*4);
> +
> +	return sgt;
> +}
> +
> +static void gather_bo_unpin(struct device *dev, struct sg_table *sgt)
> +{
> +	if (sgt) {
> +		sg_free_table(sgt);
> +		kfree(sgt);
> +	}
> +}
> +
> +static void *gather_bo_mmap(struct host1x_bo *host_bo)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +
> +	return bo->gather_data;
> +}
> +
> +static void gather_bo_munmap(struct host1x_bo *host_bo, void *addr)
> +{
> +}
> +
> +const struct host1x_bo_ops gather_bo_ops =3D {
> +	.get =3D gather_bo_get,
> +	.put =3D gather_bo_put,
> +	.pin =3D gather_bo_pin,
> +	.unpin =3D gather_bo_unpin,
> +	.mmap =3D gather_bo_mmap,
> +	.munmap =3D gather_bo_munmap,
> +};
> diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.h b/drivers/gpu/drm/teg=
ra/uapi/gather_bo.h
> new file mode 100644
> index 000000000000..6b4c9d83ac91
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#ifndef _TEGRA_DRM_SUBMIT_GATHER_BO_H
> +#define _TEGRA_DRM_SUBMIT_GATHER_BO_H
> +
> +#include <linux/host1x.h>
> +#include <linux/kref.h>
> +
> +struct gather_bo {
> +	struct host1x_bo base;
> +
> +	struct kref ref;
> +
> +	u32 *gather_data;
> +	size_t gather_data_words;
> +};
> +
> +extern const struct host1x_bo_ops gather_bo_ops;
> +void gather_bo_put(struct host1x_bo *host_bo);
> +
> +#endif
> diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/tegra/=
uapi/submit.c
> new file mode 100644
> index 000000000000..398be3065e21
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi/submit.c
> @@ -0,0 +1,428 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/dma-fence-array.h>
> +#include <linux/file.h>
> +#include <linux/host1x.h>
> +#include <linux/iommu.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/nospec.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sync_file.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +
> +#include "../uapi.h"
> +#include "../drm.h"
> +#include "../gem.h"
> +
> +#include "gather_bo.h"
> +#include "submit.h"
> +
> +static struct tegra_drm_mapping *
> +tegra_drm_mapping_get(struct tegra_drm_channel_ctx *ctx, u32 id)
> +{
> +	struct tegra_drm_mapping *mapping;
> +
> +	xa_lock(&ctx->mappings);
> +	mapping =3D xa_load(&ctx->mappings, id);
> +	if (mapping)
> +		kref_get(&mapping->ref);
> +	xa_unlock(&ctx->mappings);
> +
> +	return mapping;
> +}
> +
> +static void *alloc_copy_user_array(void __user *from, size_t count, size=
_t size)
> +{
> +	unsigned long copy_err;
> +	size_t copy_len;
> +	void *data;
> +
> +	if (check_mul_overflow(count, size, &copy_len))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (copy_len > 0x4000)
> +		return ERR_PTR(-E2BIG);
> +
> +	data =3D kvmalloc(copy_len, GFP_KERNEL);
> +	if (!data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	copy_err =3D copy_from_user(data, from, copy_len);
> +	if (copy_err) {
> +		kvfree(data);
> +		return ERR_PTR(-EFAULT);
> +	}
> +
> +	return data;
> +}
> +
> +static int submit_copy_gather_data(struct drm_device *drm,
> +				   struct gather_bo **pbo,
> +				   struct drm_tegra_channel_submit *args)
> +{
> +	unsigned long copy_err;
> +	struct gather_bo *bo;
> +	size_t copy_len;
> +
> +	if (args->gather_data_words =3D=3D 0) {
> +		drm_info(drm, "gather_data_words can't be 0");
> +		return -EINVAL;
> +	}
> +
> +	if (check_mul_overflow((size_t)args->gather_data_words, (size_t)4, &cop=
y_len))
> +		return -EINVAL;
> +
> +	bo =3D kzalloc(sizeof(*bo), GFP_KERNEL);
> +	if (!bo)
> +		return -ENOMEM;
> +
> +	kref_init(&bo->ref);
> +	host1x_bo_init(&bo->base, &gather_bo_ops);
> +
> +	bo->gather_data =3D kmalloc(copy_len, GFP_KERNEL | __GFP_NOWARN);
> +	if (!bo->gather_data) {
> +		kfree(bo);
> +		return -ENOMEM;
> +	}
> +
> +	copy_err =3D copy_from_user(bo->gather_data,
> +				  u64_to_user_ptr(args->gather_data_ptr),
> +				  copy_len);
> +	if (copy_err) {
> +		kfree(bo->gather_data);
> +		kfree(bo);
> +		return -EFAULT;
> +	}
> +
> +	bo->gather_data_words =3D args->gather_data_words;
> +
> +	*pbo =3D bo;
> +
> +	return 0;
> +}
> +
> +static int submit_write_reloc(struct gather_bo *bo,
> +			      struct drm_tegra_submit_buf *buf,
> +			      struct tegra_drm_mapping *mapping)
> +{
> +	/* TODO check that target_offset is within bounds */
> +	dma_addr_t iova =3D mapping->iova + buf->reloc.target_offset;
> +	u32 written_ptr =3D (u32)(iova >> buf->reloc.shift);
> +
> +#ifdef CONFIG_ARM64
> +	if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
> +		written_ptr |=3D BIT(39);
> +#endif

Sorry, but this still isn't correct. written_ptr is still only 32-bits
wide, so your BIT(39) is going to get discarded even on 64-bit ARM. The
idiomatic way to do this is to make written_ptr dma_addr_t and use a
CONFIG_ARCH_DMA_ADDR_T_64BIT guard.

But even with that this looks wrong because you're OR'ing this in after
shifting by buf->reloc.shift. Doesn't that OR it in at the wrong offset?
Should you perhaps be doing this instead:

	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
		if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
			iova |=3D BIT(39);
	#endif

	written_ptr =3D (u32)(iova >> buf->reloc_shift);

?

Also, on a side-note: BLOCKLINEAR really isn't the right term here. I
recently dealt with this for display (though I haven't sent out that
patch yet) and this is actually a bit that selects which sector layout
swizzling is being applied. That's independent of block linear format
and I think you can have different sector layouts irrespective of the
block linear format (though I don't think that's usually done).

That said, I wonder if a better interface here would be to reuse format
modifiers here. That would allow us to more fully describe the format of
a surface in case we ever need it, and it already includes the sector
layout information as well.

Thierry

--jc4GjS8xwUd/3Cp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ7z8ACgkQ3SOs138+
s6F9AA//ZfIRC8cao4sgMiQwX+4X4FgrysoBHa7rAaQiFxK4nuJnqnp82hxadUEQ
UZoVMrAnCAvi5598IkITUa1qfQNVGi/7KiIatqbcO+C7Dws/cHEG4lVbxx4F4PxJ
LkkjvWVNN4MEy1pjc1dwUjuS2FuM564JA8DszcMKTB2M2yNmTEaz8dRXJNDY1apc
mz7XB++L2uCa6jtkP/ePnuG0vGXd+KP+H7BSHBs1oNCbEizXGcEQ1QCHWByOGvv9
n3/jqeaDl1un0ieD8F9Xl+8m+GTwvrdbDgwPWTJD4pFFmlaDMMcwhvcXm7fF/7ds
04TJHmEN9r2zXv7nGpBwHHrXvJptleAYhplbM7TR7KGwwj4IaJQ7qn5x0ASoI8Vx
FD7vxSjwnPDf0XhG0aRSuYVBSk/2U8uG3Qk25t886dw5C8V/M7lrJrp2yiIJsJoK
DBEkuLt2XQzqFsPINnI426pbtcMDI7++uk79KT2oHTAU8L+Mnx1UWh42e3vkNFhn
eeHkb1Q8NWiPX45yDmNLawy1HMVkqplJ32NDLbbVHP/f1XuZruvGt1Da6s9aLTXz
Mnyl3OyZxIBklDkp9/Ix15QEmN5FL5lPWNxDqwk81XHnbmip4ZMYHSoBh1IrMISn
ebgZn5QW7AGajmUXBzTks5XYDS/eTLdKsFMKYz50JT18Uh+TaAI=
=ITMn
-----END PGP SIGNATURE-----

--jc4GjS8xwUd/3Cp7--

--===============1272077015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1272077015==--
