Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E72808A7F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB6E10E8B4;
	Thu,  7 Dec 2023 14:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D5D10E8C1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:27:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23D3962118;
 Thu,  7 Dec 2023 14:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94971C433C8;
 Thu,  7 Dec 2023 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701959255;
 bh=+8dIwM5OE8Cl9sfdIrhi1KoVYzadFQnB3l0XlBddOk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gr0R3x7kUF6mCNSf37LqgZ3F56bsmNIXV65UZ4qI6GeEk9UZGFi7GbbKfq3tAe++h
 KKUtTaO/r9uUuMn3EbI5pfPJ616OxlZ9+UOzyJIDaa2XbD2jiOdz7bHoqfD/eflCEn
 AyH1tDG9EGOlF9rvkJ3Qk4qZ7JgqGotvvlWmDE6UtNReOBDvK57uknrk8mMHcM5sDr
 cX9i3XifxWIM5XJw2zp2/14u30GEmZ7m9NWBt4VvlJF27fvfPDdVGFGw7u8RIqnQNx
 lzdbHm9hv7vkYxWXtPuOPS9ka/Df+Yx7iVb5foRlPl1Yrczx38+rfBu42BDG1RXWy8
 0wJQUdvsbitmg==
Date: Thu, 7 Dec 2023 15:27:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <ifwxqdd5rwn33kkxzhwfwbvrsvh53h3cc3un26r5eoluho6e7t@bje7nzxfqvzo>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ukmxrxzgqo3bdcpo"
Content-Disposition: inline
In-Reply-To: <20231205105106.06a34b81.pekka.paalanen@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ukmxrxzgqo3bdcpo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 10:51:06AM +0200, Pekka Paalanen wrote:
> On Mon,  4 Dec 2023 13:17:06 +0100
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
> >  include/drm/drm_atomic.h | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index 914574b58ae7..81ad7369b90d 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -346,11 +346,19 @@ struct __drm_private_objs_state {
> >  };
> > =20
> >  /**
> > - * struct drm_atomic_state - the global state object for atomic updates
> > + * struct drm_atomic_state - Atomic Update structure
> > + *
> > + * This structure is the kernel counterpart of @drm_mode_atomic and co=
ntains
> > + * all the objects affected by an atomic modeset update and their stat=
es.
>=20
> Drop "modeset"? An update can be without a modeset.

Yeah, good point

> >   *
> >   * States are added to an atomic update by calling drm_atomic_get_crtc=
_state(),
> >   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or =
for
> >   * private state structures, drm_atomic_get_private_obj_state().
> > + *
> > + * NOTE: While this structure looks to be global and affecting the who=
le DRM
> > + * device, it only contains the objects affected by the atomic commit.
>=20
> This new phrasing is much more clear to me than the old one.

Great

> > + * Unaffected objects will not be part of that update, unless they hav=
e been
> > + * explicitly added by either the framework or the driver.
>=20
> If the framework or a driver adds an object, then it's no longer
> unaffected, is it?

I guess what I meant to say is that it's affected as a side effect that
the userspace cannot anticipate.

The typical example being that changing a property on a connector would
need to pull the CRTC into the update to disable / enable the CRTC,
encoder and connector.

As far as userspace is concerned, only the connector will be affected,
and only the connector will initially be part of the drm_atomic_state.

But then some part of the atomic_check logic will pull the CRTC into the
update.

It's still invisible to userspace, so I guess
"unaffected-but-turns-out-to-be-affected" would be the right term :)

Would something like:

Unaffected objects will not be part of the initial update, but might be
added explicitly by either the framework or the driver during
atomic_check.

be better?

> Should there be some discussion how this struct starts with only what
> userspace mentioned, and more affected objects may be added by the
> framework or a driver? And adding more objects can surprise the
> userspace and cause even failures (e.g. random, hard-to-diagnose EBUSY
> errors from atomic commit when a driver added a CRTC that was not
> supposed to be affected)? Even unexpected failures on *future* atomic
> commits, as in the CRTC example.
>=20
> Was there actually a rule of when the kernel can add unmentioned
> objects, like needing ALLOW_MODESET from userspace?

Sima (iirc?) recently made that explicit, yeah, but there's plenty of
commits that need at the very least the encoder and connector to be
disabled and enabled again to handle them.

Maxime

--ukmxrxzgqo3bdcpo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXHWVAAKCRDj7w1vZxhR
xapsAP4r4bVp9pjUG3TADpd2ArfIpQAYu4vbYvDd53Sw+gIELAEAyUcu4r7/37Qb
eNNJGoZYkk2Y7yijRxNfPmCkhg2+bQc=
=TmdG
-----END PGP SIGNATURE-----

--ukmxrxzgqo3bdcpo--
