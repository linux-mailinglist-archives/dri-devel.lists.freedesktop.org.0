Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A8809DE9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3FA10E9D6;
	Fri,  8 Dec 2023 08:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06E010E9D6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 08:09:05 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 821BF66073A6;
 Fri,  8 Dec 2023 08:08:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702022944;
 bh=GqipcxQ2QtlFSZEz/kCIzNeOiRdWnz1Oan0qde9+/w8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ilwGwiZCTXU6yQkB2XvulSSs/G3ICxFFDgCKVftAigOLetNYLybMcKsMu3jek6I1i
 xaTCFAbtZadFUYo26pvMAlNZCqaUJsAcQbf+ez7LfjDvnUr42gzqh8GM8et8reOc5K
 VtM2FdhMvsZw7m86SiePHDnPkgm5iSsoHx32rZitWg5MHDa5D4J3yTbuj92D5sC+D2
 Hgrt09gIXiYC/GdifpOnUozFiNG7Wu2FvRp3ax6wKjIWQ6+z1dWbhli9qlCufesajs
 BGdevy+p4farzslxvaOTQ5NXQCBm2ia87ak2NRmq2GQqnxdW2S40OcbOq+c6wHPmou
 RXf6kN0GsILPA==
Date: Fri, 8 Dec 2023 10:08:28 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <20231208100828.2155d1bd.pekka.paalanen@collabora.com>
In-Reply-To: <ifwxqdd5rwn33kkxzhwfwbvrsvh53h3cc3un26r5eoluho6e7t@bje7nzxfqvzo>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
 <ifwxqdd5rwn33kkxzhwfwbvrsvh53h3cc3un26r5eoluho6e7t@bje7nzxfqvzo>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fR4ee1HPdGgnAvYR0teWRV2";
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/fR4ee1HPdGgnAvYR0teWRV2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Dec 2023 15:27:33 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Tue, Dec 05, 2023 at 10:51:06AM +0200, Pekka Paalanen wrote:
> > On Mon,  4 Dec 2023 13:17:06 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> > > The current documentation of drm_atomic_state says that it's the "glo=
bal
> > > state object". This is confusing since, while it does contain all the
> > > objects affected by an update and their respective states, if an obje=
ct
> > > isn't affected by this update it won't be part of it.
> > >=20
> > > Thus, it's not truly a "global state", unlike object state structures
> > > that do contain the entire state of a given object.
> > >=20
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  include/drm/drm_atomic.h | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > index 914574b58ae7..81ad7369b90d 100644
> > > --- a/include/drm/drm_atomic.h
> > > +++ b/include/drm/drm_atomic.h
> > > @@ -346,11 +346,19 @@ struct __drm_private_objs_state {
> > >  };
> > > =20
> > >  /**
> > > - * struct drm_atomic_state - the global state object for atomic upda=
tes
> > > + * struct drm_atomic_state - Atomic Update structure
> > > + *
> > > + * This structure is the kernel counterpart of @drm_mode_atomic and =
contains
> > > + * all the objects affected by an atomic modeset update and their st=
ates. =20
> >=20
> > Drop "modeset"? An update can be without a modeset. =20
>=20
> Yeah, good point
>=20
> > >   *
> > >   * States are added to an atomic update by calling drm_atomic_get_cr=
tc_state(),
> > >   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), o=
r for
> > >   * private state structures, drm_atomic_get_private_obj_state().
> > > + *
> > > + * NOTE: While this structure looks to be global and affecting the w=
hole DRM
> > > + * device, it only contains the objects affected by the atomic commi=
t. =20
> >=20
> > This new phrasing is much more clear to me than the old one. =20
>=20
> Great
>=20
> > > + * Unaffected objects will not be part of that update, unless they h=
ave been
> > > + * explicitly added by either the framework or the driver. =20
> >=20
> > If the framework or a driver adds an object, then it's no longer
> > unaffected, is it? =20
>=20
> I guess what I meant to say is that it's affected as a side effect that
> the userspace cannot anticipate.
>=20
> The typical example being that changing a property on a connector would
> need to pull the CRTC into the update to disable / enable the CRTC,
> encoder and connector.

Right, that's the easy case. This can even be documented and therefore
become expected by userspace. The associations between CRTC and
connector are published, e.g. the current routing.

What I was thinking of was much more hidden:

Userspace explicitly programs CRTC A and the connector connected to it.
None of the mentioned KMS objects in that atomic commit refer to CRTC B
in any way, not in old nor in new device state. Still, the driver
decides to pull CRTC B in, because it needs to adjust something there
(ISTR hearing "watermarks" in some conversation) in order to
accommodate changes in CRTC A.

So there are two categories of pulling in extra KMS objects: knowable
and unknowable. Or expected and unexpected.

If userspace changes things on a connector connected to CRTC A, you can
expect to pull in CRTC A. That's knowable. If the driver unexpectedly
also pulls in CRTC B while userspace made absolutely no explicit nor
implicit reference to it, that's unknowable.

The unknowable/unexpected additions are very hardware and driver
specific and not reliably determinable from an atomic commit UAPI
structure.

> As far as userspace is concerned, only the connector will be affected,
> and only the connector will initially be part of the drm_atomic_state.
>=20
> But then some part of the atomic_check logic will pull the CRTC into the
> update.

Is this a rule that happens always? If so, it can be documented to make
it expected.

> It's still invisible to userspace, so I guess
> "unaffected-but-turns-out-to-be-affected" would be the right term :)
>=20
> Would something like:
>=20
> Unaffected objects will not be part of the initial update, but might be
> added explicitly by either the framework or the driver during
> atomic_check.
>=20
> be better?

I'm not comfortable with the use of "unaffected" here. I'd be more in
the direction of: More objects can be affected than explicitly
mentioned.


Thanks,
pq

> > Should there be some discussion how this struct starts with only what
> > userspace mentioned, and more affected objects may be added by the
> > framework or a driver? And adding more objects can surprise the
> > userspace and cause even failures (e.g. random, hard-to-diagnose EBUSY
> > errors from atomic commit when a driver added a CRTC that was not
> > supposed to be affected)? Even unexpected failures on *future* atomic
> > commits, as in the CRTC example.
> >=20
> > Was there actually a rule of when the kernel can add unmentioned
> > objects, like needing ALLOW_MODESET from userspace? =20
>=20
> Sima (iirc?) recently made that explicit, yeah, but there's plenty of
> commits that need at the very least the encoder and connector to be
> disabled and enabled again to handle them.
>=20
> Maxime


--Sig_/fR4ee1HPdGgnAvYR0teWRV2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVyzvwACgkQI1/ltBGq
qqdMcg/+NFOYuNDZfiDdtsa8T0I/DZHoslFtqFGu8hZmeFB30GcQTp5o9a6YxsIa
hUxDgOPH9rgctTHASA2b2Fiy5upbd9oNmW2V53l+S4UhLGT7KVnLBsa/sCjNHbym
uKiSwx6CUXZ+Aue5sWPa8CmHVTV1H2jkaz9G284JkgaEmBGvqiB4heND28GxvJOi
09rjbzh4jyNa9a1w23WzjmqmQy35BkkNRsemD4TMVXrfoGD6DgnTitakGKNs4ACI
0hGoLbq7Va3PcKGOgUct0raM782Gd6rNMQdViv2ZVyKhPrDcPLtPkB3fNwOqm/AP
EFd6rw/Af4Pk34wlG4U00F/feGMl1GJqDTT8eqlRJcbXxTY/dr+8/ZldHzSzJfR/
w3uAd4+EbOOLvNpKEkOeaMnanqtHzxcSDWAHvBtziKWDyrVJIevBKfYbrtuL6ppU
AioMFZmte043fyUzNXVn4gVzqJOAXKgA4n0JaFqD3dTONQ6pQe+iJZoQ46sjg1PD
UJU1etCFqe0oHEVFH61qtRgLgnLjR07c9/EYIdqLDZ6SUxYTltAaDIHdab6bLCOh
dehFDVsvbrgTdy71rPk5GJxjnm8nxA8JhiiuoD86MOtHbQbooGimniAyzzQAIMvs
kJllgvrJCRxTnL9sD0ETUONYZxFv4caPVY5HdD2XSR4igC/SUto=
=yXS3
-----END PGP SIGNATURE-----

--Sig_/fR4ee1HPdGgnAvYR0teWRV2--
