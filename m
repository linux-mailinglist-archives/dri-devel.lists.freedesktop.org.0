Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A56C195F2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A690210E1B4;
	Wed, 29 Oct 2025 09:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FPm0/iho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06EC10E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:31:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 08E146045A;
 Wed, 29 Oct 2025 09:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C19C4CEF7;
 Wed, 29 Oct 2025 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761730259;
 bh=OnuzIss5wX2fRUo/q10utI0J8ms/Z29hJm2vjtZTHEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FPm0/ihoLtsl78ml/8eo/k+WK3xm6nm00lnXlUTXT/wYuJFXv+cOpoK1jUbAPSz+b
 Ixx/NXK2jLPmV4VOYF5VhgktWbBVI8cyWr083m7cDx+4P8uAosDLUVatwdcAkjSeiJ
 QrvatyCYI9cBIokCwqKbYQeTFLq3br33CM6bwWcZ5A+FiWtUOz0vEjUH6RSzSmhggI
 lf+IDvTobrrYdMxHv4S35hZAfIBZF/q7YmnvBwaH0VP/4GMfLEdS5DAuuaHR69bOpl
 HEEQnq5Oi54fGxFvJ2YJPTufpOAHWaaoP6xiQsVf8Toi5kbEXGojbOVyvp4z1LB1pi
 Dn5jueBBMFC1A==
Date: Wed, 29 Oct 2025 10:30:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
Message-ID: <aw3upkfkzcrpgqpsipo63fstekq2f5trskg2d7xiyh2l6pgxu4@mj4yhxixtoqz>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <k4qq6mcgil6ubyrarr6ptib7qckrgg6eh5y747ckycvnoyu7tf@d5aoylyi5nvz>
 <20251016145708.5721c43a@fedora> <20251016150704.405524b9@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zwbjt7t543jc4pil"
Content-Disposition: inline
In-Reply-To: <20251016150704.405524b9@fedora>
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


--zwbjt7t543jc4pil
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
MIME-Version: 1.0

On Thu, Oct 16, 2025 at 03:07:04PM +0200, Boris Brezillon wrote:
> On Thu, 16 Oct 2025 14:57:08 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>=20
> > On Thu, 16 Oct 2025 10:13:25 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >=20
> > > Hi,
> > >=20
> > > On Wed, Oct 15, 2025 at 06:03:14PM +0200, Boris Brezillon wrote: =20
> > > > Prepare things for standardizing synchronization around CPU accesses
> > > > of GEM buffers. This will be used to provide default
> > > > drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
> > > > a way for drivers to add their own ioctls to synchronize CPU
> > > > writes/reads when they can't do it directly from userland.
> > > >=20
> > > > v2:
> > > > - New commit
> > > >=20
> > > > v3:
> > > > - No changes
> > > >=20
> > > > v4:
> > > > - Add Steve's R-b
> > > >=20
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Reviewed-by: Steven Price <steven.price@arm.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_gem.c | 10 +++++++++
> > > >  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++=
++++
> > > >  2 files changed, 55 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > index a1a9c828938b..a1431e4f2404 100644
> > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *o=
bj, struct iosys_map *map)
> > > >  }
> > > >  EXPORT_SYMBOL(drm_gem_vunmap);
> > > > =20
> > > > +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t=
 size,
> > > > +		 enum drm_gem_object_access_flags access)
> > > > +{
> > > > +	if (obj->funcs->sync)
> > > > +		return obj->funcs->sync(obj, offset, size, access);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_gem_sync);
> > > > +
> > > >  /**
> > > >   * drm_gem_lock_reservations - Sets up the ww context and acquires
> > > >   * the lock on an array of GEM objects.
> > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > index 8d48d2af2649..1c33e59ab305 100644
> > > > --- a/include/drm/drm_gem.h
> > > > +++ b/include/drm/drm_gem.h
> > > > @@ -66,6 +66,33 @@ enum drm_gem_object_status {
> > > >  	DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
> > > >  };
> > > > =20
> > > > +/**
> > > > + * enum drm_gem_object_status - bitmask describing GEM access type=
s to prepare for   =20
> > >=20
> > > Treating an enum as a bitmask is a bit weird to me. I'd say either ha=
ve
> > > a bitmask with BIT(enum values), or no enum at all. =20
> >=20
> > I'll drop the enum and make it pure defines.
> >=20
> > >  =20
> > > > + */
> > > > +enum drm_gem_object_access_flags {
> > > > +	/** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
> > > > +	DRM_GEM_OBJECT_CPU_ACCESS =3D 0,
> > > > +
> > > > +	/** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. */
> > > > +	DRM_GEM_OBJECT_DEV_ACCESS =3D BIT(0),
> > > > +
> > > > +	/** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the entity =
doing the access. */
> > > > +	DRM_GEM_OBJECT_ACCESSOR_MASK =3D BIT(0),   =20
> > >=20
> > > Do we really want to have to variants with the same discriminant? If =
so,
> > > we should document why it's something we want.
> > >  =20
> > > > +	/** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only accesses. =
*/
> > > > +	DRM_GEM_OBJECT_READ_ACCESS =3D BIT(1),
> > > > +
> > > > +	/** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only accesses=
=2E */
> > > > +	DRM_GEM_OBJECT_WRITE_ACCESS =3D BIT(2),
> > > > +
> > > > +	/** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write accesses.=
 */
> > > > +	DRM_GEM_OBJECT_RW_ACCESS =3D DRM_GEM_OBJECT_READ_ACCESS |
> > > > +				   DRM_GEM_OBJECT_WRITE_ACCESS,
> > > > +
> > > > +	/** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the acce=
ss type. */
> > > > +	DRM_GEM_OBJECT_ACCESS_TYPE_MASK =3D DRM_GEM_OBJECT_RW_ACCESS,   =
=20
> > >=20
> > > Same thing.
> > >=20
> > > Or is it that you encode both the direction and access type, and have=
 a
> > > mask to isolate each? =20
> >=20
> > This ^.
> >=20
> > >=20
> > > If so, we should really move it out from an enum into defines, or tre=
at each
> > > separately like dma_sync_does. =20
> >=20
> > Sure, I can do that.
>=20
> Actually, looking at the enum just above the one added in this patch
> (drm_gem_object_status), it seems that it has the same flaws, and I
> think it was the reason I went for this enum-based approach, because I
> tend to be consistent with the code base I'm modifying.
>=20
> Now, I get that defining flags with an enum and then composing those to
> then pass the composition to some helper pretending it's still an enum
> only works in C (because with C you can do anything you want :D), and
> probably not if you're in pedantic mode. But if we want to enforce
> that, we should probably fix the existing code base, otherwise this
> will keep happening ;-). And no, before you ask, I'm not volunteering
> for this :P.

I'm fine with it not being totally consistent with the other enums
around, if anything because those aren't consistent with the typical way
we use enums in C.

And I don't expect to fix everything else, especially if you don't have
the time. It's still not worth creating more work down the line when
you'll volunteer ;)

Maxime

--zwbjt7t543jc4pil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaQHezwAKCRAnX84Zoj2+
dtxWAYCdtvscQgOspH2kHF3Au/NP3XqHjU1fPnA6y1Y2Y2DyazvziGKJiGf6H2qE
igPJBoABgN60eYQZcOjQuCZPOidQOAZ1LahhoA436lwbqYKvEjIlxhrr4c6ten0s
2LWjX6aC8Q==
=vLR5
-----END PGP SIGNATURE-----

--zwbjt7t543jc4pil--
