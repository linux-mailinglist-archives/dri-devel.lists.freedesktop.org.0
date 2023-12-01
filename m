Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CC8006CF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5660510E0A5;
	Fri,  1 Dec 2023 09:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804DB10E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:25:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D115E620D4;
 Fri,  1 Dec 2023 09:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B11C433C7;
 Fri,  1 Dec 2023 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701422711;
 bh=pap0dJ7Aexs0KGqqAq0I3SAp6oVPIn/53vGN/L16G3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jo++edaPYGu5OZ3NsMc3O5H4BNhyyZ9oJWhGoph0k8VwwbGjUrW9s+S3aWmGKv3TK
 tfmjJOXp+s2tOMRp0+i5zNc2qKUo6nR/8WlTHdIY9GQgD8Xo0x8K7hDcrhV7XNJyIF
 VhdoK7wcxtifKlWhm7zF6cOYvqC+Sg1lMZZ/ymyaksY8fWl4p06Ec5cKcJSgmbhZuH
 bDpwONi70lo4fRUn615W0ON2hrV2ANvFhJ6gRYfPEWWXl7tixuBiqWVmZgbV6skciq
 vM+D+rrq4EFPxbs4WePG6eXoPiSshuvlniyhdU7aAufwkBAD+tZgS+3D2QeMp4MEn/
 28RjKeylLLpeg==
Date: Fri, 1 Dec 2023 10:25:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <bry3w6w32uy2jlmbkcmbtthw6w6nwux7dwlcju5iuxac2wphku@md6njxjtsbvm>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
 <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
 <20231201110616.30ad1468.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3qxpsltzimgkb2dd"
Content-Disposition: inline
In-Reply-To: <20231201110616.30ad1468.pekka.paalanen@collabora.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3qxpsltzimgkb2dd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 11:06:16AM +0200, Pekka Paalanen wrote:
> On Fri, 1 Dec 2023 09:29:05 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Hi,
> >=20
> > On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=E9 Almeida wrote:
> > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > >=20
> > > Specify how the atomic state is maintained between userspace and
> > > kernel, plus the special case for async flips.
> > >=20
> > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Signed-off-by: Andr=E9 Almeida <andrealmeid@igalia.com>
> > > ---
> > >=20
> > > This is a standalone patch from the following serie, the other patche=
s are
> > > already merged:
> > > https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@igal=
ia.com/
> > >=20
> > >  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 47 insertions(+)
> > >=20
> > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-u=
api.rst
> > > index 370d820be248..d0693f902a5c 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -570,3 +570,50 @@ dma-buf interoperability
> > > =20
> > >  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
> > >  information on how dma-buf is integrated and exposed within DRM.
> > > +
> > > +KMS atomic state
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +An atomic commit can change multiple KMS properties in an atomic fas=
hion,
> > > +without ever applying intermediate or partial state changes.  Either=
 the whole
> > > +commit succeeds or fails, and it will never be applied partially. Th=
is is the
> > > +fundamental improvement of the atomic API over the older non-atomic =
API which is
> > > +referred to as the "legacy API".  Applying intermediate state could =
unexpectedly
> > > +fail, cause visible glitches, or delay reaching the final state.
> > > +
> > > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, whic=
h means the
> > > +complete state change is validated but not applied.  Userspace shoul=
d use this
> > > +flag to validate any state change before asking to apply it. If vali=
dation fails
> > > +for any reason, userspace should attempt to fall back to another, pe=
rhaps
> > > +simpler, final state.  This allows userspace to probe for various co=
nfigurations
> > > +without causing visible glitches on screen and without the need to u=
ndo a
> > > +probing change.
> > > +
> > > +The changes recorded in an atomic commit apply on top the current KM=
S state in
> > > +the kernel. Hence, the complete new KMS state is the complete old KM=
S state with
> > > +the committed property settings done on top. The kernel will try to =
avoid =20
> >=20
> > That part is pretty confusing to me.
> >=20
> > What are you calling the current and old KMS state?
>=20
> Current =3D old, if you read that "current" is the KMS state before
> considering the atomic commit at hand.
>=20
> > What's confusing to me is that, yes, what you're saying is true for a
> > given object: if it was part of the commit, the new state is the old
> > state + whatever the new state changed.
> >=20
> > However, if that object wasn't part of the commit at all, then it's
> > completely out of the old or new global KMS state.
>=20
> This is not talking about kernel data structures at all. This is
> talking about how KMS looks from the userspace point of view.

I mean, that's also true from the userspace point of view. You can very
well commit only a single property on a single object, and only that
object will be part of the "global KMS state".

> All objects are always part of the device KMS state as referred to
> in this doc, whether they were mentioned in the atomic commit state set
> or not. That's the whole point: all state that was not explicitly
> modified remains as it was, and is actively used state by the driver
> and hardware. The practical end result state is the same as if all
> objects were (redundantly) mentioned.
>=20
> For example, if you change properties of CRTC 31, it has no effect on
> the behaviour of CRTC 54. If CRTC 54 was active, it remains active. If
> CRTC 54 had certain property values, it continues to have those
> property values.

I'm not quite sure I followed your previous paragraph, sorry, but we
agree here and it's kind of my point really: CRTC-54 would not be part
of the new KMS state, so claiming that it is complete is confusing.

It's not complete to me precisely because it doesn't contain the state
of all objects.

> This is opposed to something else; the UAPI could have
> been designed to e.g. reset all unmentioned objects to defaults/off by
> the atomic commit. Obviously that's not how it works today, so we need
> to mention how things do work.

Sure, I'm not claiming we should change anything but the wording of that
doc.

> >=20
> > So yeah, individual object KMS state are indeed complete, but
> > drm_atomic_state definitely isn't. And it's the whole point of functions
> > like drm_atomic_get_crtc_state() vs drm_atomic_get_old/new_crtc_state:
> > the old/new variants only return a state if it was part of
> > drm_atomic_state to begin with. drm_atomic_get_crtc_state() brings the
> > crtc state into drm_atomic_state if it wasn't part of it.
>=20
> At no point the text is referring to drm_atomic_state or any other
> kernel data structure.

Then it's even more confusing, because the sentence I was quoting was
"The changes recorded in an atomic commit apply on top the current KMS
state *in the kernel*", which is ambiguous then.

Maxime

--3qxpsltzimgkb2dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWmmdAAKCRDj7w1vZxhR
xb0MAQChGpVdOkDehNkhy/zPifFcMHagclQcoMKLY4C8FwZgeQEAgnPy7SCG7WNB
JIf40ACZLG5Jj13QUwGmz10Ul888HQQ=
=0SXM
-----END PGP SIGNATURE-----

--3qxpsltzimgkb2dd--
