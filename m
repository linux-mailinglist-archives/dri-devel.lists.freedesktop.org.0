Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C4C878FCF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AE810F1C5;
	Tue, 12 Mar 2024 08:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a+nnY3MB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9FD10F1C5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=646dSER5GBOlaCQcJgVIMmkKzY1ewaNHORt1h/UvWF4=; b=a+nnY3MBzE2GDeEXowpkO9N2Cr
 /G+OUAMzuEZmE5iF6mJ2CFn4chkIqu8DktS7S4VQAlY5mswkJLio4XDYhfXW36ADsSDfw7m2NNzfc
 LD5ZpAJNfF5wo9unocqmJea13BA6fAI09I7wLAf2mbcU7x75wzEQOSI5/Dt5ldxkUKQ4EWAJ+tOJf
 QIvrJtifUn++Z+Vhg5z9x3znm5VE79BExBOJTyOzGbhJMllIczWfy0b/TDHh0NUcVkcs/Q6ygILYi
 IyP6kzD49FF5kkYSTCyd4tCgvPXH8FGaK3oRicJNGtj4Zzv51rlRPBG375zSL65KDgAQHhVgSH5Qr
 EmS7suUw==;
Received: from cm-81-9-209-58.telecable.es ([81.9.209.58] helo=[192.168.1.135])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rjxbx-009DcW-1Q; Tue, 12 Mar 2024 09:35:49 +0100
Message-ID: <bc2023918f0aeedad0bb7b8f236733841a18099b.camel@igalia.com>
Subject: Re: [PATCH 3/5] drm/v3d: Introduce gemfs
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Daniel Vetter
 <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 12 Mar 2024 09:35:48 +0100
In-Reply-To: <20240311100959.205545-4-mcanal@igalia.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-4-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is: Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago

El lun, 11-03-2024 a las 07:06 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Create a separate "tmpfs" kernel mount for V3D. This will allow us to
> move away from the shmemfs `shm_mnt` and gives the flexibility to do
> things like set our own mount options. Here, the interest is to use
> "huge=3D", which should allow us to enable the use of THP for our
> shmem-backed objects.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0 |=C2=A0 9 +++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0drivers/gpu/drm/v3d/v3d_gemfs.c | 46
> +++++++++++++++++++++++++++++++++
> =C2=A04 files changed, 60 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
>=20
> diff --git a/drivers/gpu/drm/v3d/Makefile
> b/drivers/gpu/drm/v3d/Makefile
> index b7d673f1153b..fcf710926057 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -13,7 +13,8 @@ v3d-y :=3D \
> =C2=A0	v3d_trace_points.o \
> =C2=A0	v3d_sched.o \
> =C2=A0	v3d_sysfs.o \
> -	v3d_submit.o
> +	v3d_submit.o \
> +	v3d_gemfs.o
>=20
> =C2=A0v3d-$(CONFIG_DEBUG_FS) +=3D v3d_debugfs.o
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index 1950c723dde1..d2ce8222771a 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -119,6 +119,11 @@ struct v3d_dev {
> =C2=A0	struct drm_mm mm;
> =C2=A0	spinlock_t mm_lock;
>=20
> +	/*
> +	 * tmpfs instance used for shmem backed objects
> +	 */
> +	struct vfsmount *gemfs;
> +
> =C2=A0	struct work_struct overflow_mem_work;
>=20
> =C2=A0	struct v3d_bin_job *bin_job;
> @@ -519,6 +524,10 @@ void v3d_reset(struct v3d_dev *v3d);
> =C2=A0void v3d_invalidate_caches(struct v3d_dev *v3d);
> =C2=A0void v3d_clean_caches(struct v3d_dev *v3d);
>=20
> +/* v3d_gemfs.c */
> +void v3d_gemfs_init(struct v3d_dev *v3d);
> +void v3d_gemfs_fini(struct v3d_dev *v3d);
> +
> =C2=A0/* v3d_submit.c */
> =C2=A0void v3d_job_cleanup(struct v3d_job *job);
> =C2=A0void v3d_job_put(struct v3d_job *job);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index 66f4b78a6b2e..faefbe497e8d 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -287,6 +287,8 @@ v3d_gem_init(struct drm_device *dev)
> =C2=A0	v3d_init_hw_state(v3d);
> =C2=A0	v3d_mmu_set_page_table(v3d);
>=20
> +	v3d_gemfs_init(v3d);
> +
> =C2=A0	ret =3D v3d_sched_init(v3d);
> =C2=A0	if (ret) {
> =C2=A0		drm_mm_takedown(&v3d->mm);
> @@ -304,6 +306,7 @@ v3d_gem_destroy(struct drm_device *dev)
> =C2=A0	struct v3d_dev *v3d =3D to_v3d_dev(dev);
>=20
> =C2=A0	v3d_sched_fini(v3d);
> +	v3d_gemfs_fini(v3d);
>=20
> =C2=A0	/* Waiting for jobs to finish would need to be done before
> =C2=A0	 * unregistering V3D.
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c
> b/drivers/gpu/drm/v3d/v3d_gemfs.c
> new file mode 100644
> index 000000000000..8518b7da6f73
> --- /dev/null
> +++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (C) 2024 Raspberry Pi */
> +
> +#include <linux/fs.h>
> +#include <linux/mount.h>
> +
> +#include "v3d_drv.h"
> +
> +void v3d_gemfs_init(struct v3d_dev *v3d)
> +{
> +	char huge_opt[] =3D "huge=3Dalways";
> +	struct file_system_type *type;
> +	struct vfsmount *gemfs;
> +
> +	/*
> +	 * By creating our own shmemfs mountpoint, we can pass in
> +	 * mount flags that better match our usecase. However, we
> +	 * only do so on platforms which benefit from it.
> +	 */
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		goto err;
> +
> +	type =3D get_fs_type("tmpfs");
> +	if (!type)
> +		goto err;
> +
> +	gemfs =3D vfs_kern_mount(type, SB_KERNMOUNT, type->name,
> huge_opt);
> +	if (IS_ERR(gemfs))
> +		goto err;
> +
> +	v3d->gemfs =3D gemfs;
> +	drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> +
> +	return;
> +
> +err:
> +	v3d->gemfs =3D NULL;
> +	drm_notice(&v3d->drm,
> +		=C2=A0=C2=A0 "Transparent Hugepage support is recommended for
> optimal performance on this platform!\n");
> +}
> +
> +void v3d_gemfs_fini(struct v3d_dev *v3d)
> +{
> +	if (v3d->gemfs)
> +		kern_unmount(v3d->gemfs);
> +}
> --
> 2.43.0
>=20
>=20

