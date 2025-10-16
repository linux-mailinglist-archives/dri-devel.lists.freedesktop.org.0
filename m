Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9ABBE21A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242A010E02B;
	Thu, 16 Oct 2025 08:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cO3rhnix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8DB10E02B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D0EA6039C;
 Thu, 16 Oct 2025 08:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F01C113D0;
 Thu, 16 Oct 2025 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760602408;
 bh=WAuNsz3Lr0goBMr8G5gDj7PGfMOd6vPheePoqSC6UwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cO3rhnix1iauYg8C4tUAGwTOGpuFo1iLSN+gr9R6vB3aUnCEZgvVOPoEYP7GLyvjY
 q3yHQFIqXNSCKBI9yCbVArj1oHoJbBh26pKP53jSrs/JCYQUCJRcZ20Jx2UEXBcmyO
 2nqtJQUzNvApPQIxTCOX93NKJEnePivU5WriQdAvEe/Ghv1IvZg8Czlw5W/dDErcjc
 QY8fGJnjVEzyAaGzDTAs9gu+BIkbVDaTpqtYYdCqJypF3fBn0HuIzv1c4uL8U32l0h
 Kfbx9IWAr/iwvdE0KVqUpvy0FhLViFKHVieio3Mri7Iv7QF6Jx7I4DvbhYlu+dI/qf
 E5q7jyiGDwhYg==
Date: Thu, 16 Oct 2025 10:13:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
Message-ID: <k4qq6mcgil6ubyrarr6ptib7qckrgg6eh5y747ckycvnoyu7tf@d5aoylyi5nvz>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kw7g67ynzgrerwoj"
Content-Disposition: inline
In-Reply-To: <20251015160326.3657287-3-boris.brezillon@collabora.com>
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


--kw7g67ynzgrerwoj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
MIME-Version: 1.0

Hi,

On Wed, Oct 15, 2025 at 06:03:14PM +0200, Boris Brezillon wrote:
> Prepare things for standardizing synchronization around CPU accesses
> of GEM buffers. This will be used to provide default
> drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
> a way for drivers to add their own ioctls to synchronize CPU
> writes/reads when they can't do it directly from userland.
>=20
> v2:
> - New commit
>=20
> v3:
> - No changes
>=20
> v4:
> - Add Steve's R-b
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 10 +++++++++
>  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index a1a9c828938b..a1431e4f2404 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *obj, st=
ruct iosys_map *map)
>  }
>  EXPORT_SYMBOL(drm_gem_vunmap);
> =20
> +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
> +		 enum drm_gem_object_access_flags access)
> +{
> +	if (obj->funcs->sync)
> +		return obj->funcs->sync(obj, offset, size, access);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_sync);
> +
>  /**
>   * drm_gem_lock_reservations - Sets up the ww context and acquires
>   * the lock on an array of GEM objects.
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 8d48d2af2649..1c33e59ab305 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -66,6 +66,33 @@ enum drm_gem_object_status {
>  	DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
>  };
> =20
> +/**
> + * enum drm_gem_object_status - bitmask describing GEM access types to p=
repare for

Treating an enum as a bitmask is a bit weird to me. I'd say either have
a bitmask with BIT(enum values), or no enum at all.

> + */
> +enum drm_gem_object_access_flags {
> +	/** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
> +	DRM_GEM_OBJECT_CPU_ACCESS =3D 0,
> +
> +	/** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. */
> +	DRM_GEM_OBJECT_DEV_ACCESS =3D BIT(0),
> +
> +	/** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the entity doing =
the access. */
> +	DRM_GEM_OBJECT_ACCESSOR_MASK =3D BIT(0),

Do we really want to have to variants with the same discriminant? If so,
we should document why it's something we want.

> +	/** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only accesses. */
> +	DRM_GEM_OBJECT_READ_ACCESS =3D BIT(1),
> +
> +	/** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only accesses. */
> +	DRM_GEM_OBJECT_WRITE_ACCESS =3D BIT(2),
> +
> +	/** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write accesses. */
> +	DRM_GEM_OBJECT_RW_ACCESS =3D DRM_GEM_OBJECT_READ_ACCESS |
> +				   DRM_GEM_OBJECT_WRITE_ACCESS,
> +
> +	/** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the access typ=
e. */
> +	DRM_GEM_OBJECT_ACCESS_TYPE_MASK =3D DRM_GEM_OBJECT_RW_ACCESS,

Same thing.

Or is it that you encode both the direction and access type, and have a
mask to isolate each?

If so, we should really move it out from an enum into defines, or treat each
separately like dma_sync_does.

Maxime

--kw7g67ynzgrerwoj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaPCpIQAKCRAnX84Zoj2+
dj+bAYDejYdrMHgYJELiPlTcx/aGa+mEoSRxRo4mbH5EYy5m40gVeLaFbxIhyfhJ
loi9TeMBgLcuwHDKpu2077uycxWDApD05qaY4XBHo9bBuSOFL8keNfFgVVsaEPGA
RymLLE1+Ew==
=ZnLC
-----END PGP SIGNATURE-----

--kw7g67ynzgrerwoj--
