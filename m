Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90294862D3F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 22:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69EF10E401;
	Sun, 25 Feb 2024 21:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iQAV4WGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D447C10E400;
 Sun, 25 Feb 2024 21:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708897278;
 bh=5+ZKEJt2lEuyeGEsKA+q6VLLnaKfdfonhOD+op5DBFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQAV4WGHDyVkBbDLR31KKV9X/vZb+b0VGWmVbJX7XPo7rwLJ5ETdF3aoU/e4jMXjG
 Jo4P9qTtu5cXqNW/SWU+DOmxyyxvh8d5UYFgfZEZRJP5evBAmdcrLohHoAMLKFj7zF
 nin2V18GwMgm9kZC/Z16EHLS7uhDb9B+II5boLuOrgYOUpfcwxcwQCMYd7R12Wqa45
 38NWSCSlsg7Z5yqLmHscFsoO8TiZwAkzaMgoafbFAVpHSD+g6AO2F/oRq2FxjB/Zw4
 eWCbFyly0dnsh4GQCnqJqcFoWJEfD+HYzxqWlWXKLSfAH063MVj5nTDpKSakqG7kft
 217ihrmUMP9RA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tjcd907Xjz4wcD;
 Mon, 26 Feb 2024 08:41:16 +1100 (AEDT)
Date: Mon, 26 Feb 2024 08:41:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, zack.rusin@broadcom.com,
 tzimmermann@suse.de, thomas.hellstrom@linux.intel.com, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240226084116.4a41527d@canb.auug.org.au>
In-Reply-To: <20240220084821.1c852736@canb.auug.org.au>
References: <20240206152850.333f620d@canb.auug.org.au>
 <87y1bp962d.fsf@intel.com>
 <20240220084821.1c852736@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.dDX5vFifkGrhZOnmdXK3G+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/.dDX5vFifkGrhZOnmdXK3G+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 20 Feb 2024 08:48:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 12 Feb 2024 15:15:54 +0200 Jani Nikula <jani.nikula@linux.intel.c=
om> wrote:
> >
> > On Tue, 06 Feb 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote: =20
> > >
> > > After merging the drm-misc tree, today's linux-next build (i386 defco=
nfig)
> > > failed like this:
> > >
> > > In function 'i915_ttm_placement_from_obj',
> > >     inlined from 'i915_ttm_get_pages' at drivers/gpu/drm/i915/gem/i91=
5_gem_ttm.c:847:2:
> > > drivers/gpu/drm/i915/gem/i915_gem_ttm.c:165:18: error: 'places[0].fla=
gs' is used uninitialized [-Werror=3Duninitialized]
> > >   165 |         places[0].flags |=3D TTM_PL_FLAG_DESIRED;
> > >       |         ~~~~~~~~~^~~~~~
> > > drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_get_pa=
ges':
> > > drivers/gpu/drm/i915/gem/i915_gem_ttm.c:837:26: note: 'places' declar=
ed here
> > >   837 |         struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
> > >       |                          ^~~~~~
> > >
> > > Caused by commit
> > >
> > >   a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")   =20
> >=20
> > Cc: more people.
> >  =20
> > >
> > > I applied the following hack for today:
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Tue, 6 Feb 2024 15:17:54 +1100
> > > Subject: [PATCH] drm/ttm: initialise places
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_ttm.c
> > > index 80c6cafc8887..34e699e67c25 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > @@ -834,7 +834,7 @@ static int __i915_ttm_get_pages(struct drm_i915_g=
em_object *obj,
> > > =20
> > >  static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
> > >  {
> > > -	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
> > > +	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1] =3D {};
> > >  	struct ttm_placement placement;
> > > =20
> > >  	/* restricted by sg_alloc_table */
> > > --=20
> > > 2.43.0   =20
>=20
> I am still applying the above patch ...

Any progress?

--=20
Cheers,
Stephen Rothwell

--Sig_/.dDX5vFifkGrhZOnmdXK3G+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXbs/wACgkQAVBC80lX
0GzVNAf+NA5dVgLq87RWtvqT6p13nZ1XBU+lhzY1TyrQ6HnAk4MxDUyrgsuG1x9S
isf4VzgO4JJ82ryYBxBOeEpWqZjCRJm0rFJ/Bopbc+9nO9oaxMF/2QuXM7fheOQU
FkmZjf9k3fqrkhzO7EpnERgPYPaEODOwLHq0tbl9sqagNW3xN0vwq7QgSJ/quN43
z3xEJ/2sGJz3F73adPCnYUhWMUHH477OjWB8Mqgjguov5scDu77zS0gEr/PTnOYA
pNDGC/sh0jJAeVh5Yt6w+mbGSCjWRKKy25Yszh/yKGsaeZE5sP7gy9cH/QrfL8Ig
GYpWdXwnhA7Hk0DlVVNaDvWnibdhjQ==
=FX83
-----END PGP SIGNATURE-----

--Sig_/.dDX5vFifkGrhZOnmdXK3G+--
