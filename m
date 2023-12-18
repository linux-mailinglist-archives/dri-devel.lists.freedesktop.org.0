Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12232817A83
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D438010E299;
	Mon, 18 Dec 2023 19:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA0F10E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:02:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2E56FCE0F51;
 Mon, 18 Dec 2023 14:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715AAC433C9;
 Mon, 18 Dec 2023 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702910856;
 bh=lgPOT+hEBAVqzA0Lmv8bAyaZO1uKN5qBvex3BAgzTSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKSf7cYu/361v323pAECqO3VgDwqp9GSfyzhGzI3yNy5ic27JI8MV36rLgtclgwxu
 WIhb2KZF/lqNKBr/j3uTR6Xhe/oAXVFFTPxR4oeVos2TFeTkJhuMrlJHIFK4jG5qHg
 re9jSAX3vJDTpfvqbxCwDxHg/LLl+b+/dgwqTyYlqLWvWW2nPq7aFjFKWjoncgtEmX
 aquRJ0gyTB/CAQF73C+7IaJu+mUD0VVbsL8mqXPJkHi+PdaR1d0UuVexvcFBl2GWmj
 TdLMcd4RYSgECDujmg3OL+Kzs94oEin0I5z5tKdmAjb0J2u7hpJ5TtpDd/Urm6TPiA
 3/OUfyUTipeyA==
Date: Mon, 18 Dec 2023 15:47:34 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 4/5] drm/atomic: Make the drm_atomic_state
 documentation less ambiguous
Message-ID: <rcfyb4ctelc63cwdfouluyud5zsyokxqtqy4ehgwutztvbfj6d@uex5wdu7amgu>
References: <20231214100917.277842-1-mripard@kernel.org>
 <20231214100917.277842-4-mripard@kernel.org>
 <20231215165428.65dabd45.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nckp7zotmsht6cpw"
Content-Disposition: inline
In-Reply-To: <20231215165428.65dabd45.pekka.paalanen@collabora.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nckp7zotmsht6cpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 15, 2023 at 04:54:28PM +0200, Pekka Paalanen wrote:
> On Thu, 14 Dec 2023 11:09:15 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > The current documentation of drm_atomic_state says that it's the "global
> > state object". This is confusing since, while it does contain all the
> > objects affected by an update and their respective states, if an object
> > isn't affected by this update it won't be part of it.
> >=20
> > Thus, it's not truly a "global state", unlike object state structures
> > that do contain the entire state of a given object.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  include/drm/drm_atomic.h | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index 914574b58ae7..5df67e587816 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -346,7 +346,13 @@ struct __drm_private_objs_state {
> >  };
> > =20
> >  /**
> > - * struct drm_atomic_state - the global state object for atomic updates
> > + * struct drm_atomic_state - Atomic commit structure
> > + *
> > + * This structure is the kernel counterpart of @drm_mode_atomic and re=
presents
> > + * an atomic commit that transitions from an old to a new display stat=
e. It
> > + * contains all the objects affected by an atomic commits and both the=
 new
>=20
> *by the atomic commit and
>=20
> > + * state structures and pointers to the old state structures for
> > + * these.
> >   *
> >   * States are added to an atomic update by calling drm_atomic_get_crtc=
_state(),
> >   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or =
for
>=20
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

I've applied the series with the typos changes you asked for

Maxime

--nckp7zotmsht6cpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZYBbhgAKCRDj7w1vZxhR
xQhuAP9K/e53A4bPItB03EARnCSNlI+O1c8lESGaXPG07Ay7pwD+INQMusp45n3+
VnW9wCucA9xC++yDx5IQpagWFaHZ8wk=
=IpSo
-----END PGP SIGNATURE-----

--nckp7zotmsht6cpw--
