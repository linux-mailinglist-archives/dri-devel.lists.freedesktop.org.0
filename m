Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C4B8007E4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 11:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DB210E0AC;
	Fri,  1 Dec 2023 10:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4D10E0AC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 10:06:54 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A9EC966003B9;
 Fri,  1 Dec 2023 10:06:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701425212;
 bh=6WWOVpafYoUXOtbV/gIxloanlnjCVTDsutvvOB5R06k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eSqNbW/vcMm8gefKx26+RTZNe45vOqDDJId4LeIpzjizuRblOupMr56FPiyAO8cJI
 HoP3M/JHDlWCJtUXAkO9E+3pvapouu4f9kzZrZS1ByBVvLObKNuVz/EjsXdJng/Iqe
 pEUMP+ukzHGOoiK0MjyHaQPqmBtkuSxYys47iZKWV2sZn9ubB1OX7Ybr3kZeFM7mxC
 E552xNCRvIvEqR/05QqkYVsmNBAOC+kh6K2dK2fvoI0mpUjx/8FCZXN+RtkOFLYkhM
 l03l4l3YoAD317l4jwxcmhJYkwDd07Qh6HBrBn5h/pKyIWilKC/9DL/UTzK6ioqOhQ
 OP98HRBqNdR1A==
Date: Fri, 1 Dec 2023 12:06:48 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <20231201120648.2ba706e1.pekka.paalanen@collabora.com>
In-Reply-To: <bry3w6w32uy2jlmbkcmbtthw6w6nwux7dwlcju5iuxac2wphku@md6njxjtsbvm>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
 <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
 <20231201110616.30ad1468.pekka.paalanen@collabora.com>
 <bry3w6w32uy2jlmbkcmbtthw6w6nwux7dwlcju5iuxac2wphku@md6njxjtsbvm>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=bSmbDZcOhdjv3iZ1XwQta1";
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/=bSmbDZcOhdjv3iZ1XwQta1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Dec 2023 10:25:09 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Dec 01, 2023 at 11:06:16AM +0200, Pekka Paalanen wrote:
> > On Fri, 1 Dec 2023 09:29:05 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> > > Hi,
> > >=20
> > > On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=C3=A9 Almeida wrote: =
=20
> > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > >=20
> > > > Specify how the atomic state is maintained between userspace and
> > > > kernel, plus the special case for async flips.
> > > >=20
> > > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > > > ---
> > > >=20
> > > > This is a standalone patch from the following serie, the other patc=
hes are
> > > > already merged:
> > > > https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@ig=
alia.com/
> > > >=20
> > > >  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 47 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm=
-uapi.rst
> > > > index 370d820be248..d0693f902a5c 100644
> > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > @@ -570,3 +570,50 @@ dma-buf interoperability
> > > > =20
> > > >  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst =
for
> > > >  information on how dma-buf is integrated and exposed within DRM.
> > > > +
> > > > +KMS atomic state
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +An atomic commit can change multiple KMS properties in an atomic f=
ashion,
> > > > +without ever applying intermediate or partial state changes.  Eith=
er the whole
> > > > +commit succeeds or fails, and it will never be applied partially. =
This is the
> > > > +fundamental improvement of the atomic API over the older non-atomi=
c API which is
> > > > +referred to as the "legacy API".  Applying intermediate state coul=
d unexpectedly
> > > > +fail, cause visible glitches, or delay reaching the final state.
> > > > +
> > > > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, wh=
ich means the
> > > > +complete state change is validated but not applied.  Userspace sho=
uld use this
> > > > +flag to validate any state change before asking to apply it. If va=
lidation fails
> > > > +for any reason, userspace should attempt to fall back to another, =
perhaps
> > > > +simpler, final state.  This allows userspace to probe for various =
configurations
> > > > +without causing visible glitches on screen and without the need to=
 undo a
> > > > +probing change.
> > > > +
> > > > +The changes recorded in an atomic commit apply on top the current =
KMS state in
> > > > +the kernel. Hence, the complete new KMS state is the complete old =
KMS state with
> > > > +the committed property settings done on top. The kernel will try t=
o avoid   =20
> > >=20
> > > That part is pretty confusing to me.
> > >=20
> > > What are you calling the current and old KMS state? =20
> >=20
> > Current =3D old, if you read that "current" is the KMS state before
> > considering the atomic commit at hand.
> >  =20
> > > What's confusing to me is that, yes, what you're saying is true for a
> > > given object: if it was part of the commit, the new state is the old
> > > state + whatever the new state changed.
> > >=20
> > > However, if that object wasn't part of the commit at all, then it's
> > > completely out of the old or new global KMS state. =20
> >=20
> > This is not talking about kernel data structures at all. This is
> > talking about how KMS looks from the userspace point of view. =20
>=20
> I mean, that's also true from the userspace point of view. You can very
> well commit only a single property on a single object, and only that
> object will be part of the "global KMS state".

What is "global KMS state"?

As a userspace developer, the global KMS state is the complete, total,
hardware and driver instance state. It's not any kind of data
structure, but it is all the condition and all the programming of the
whole device (hardware + driver instance) at any specific time instant.
It is not related to any atomic commit or UAPI call, it is how the
hardware is currently programmed.

How can we make that clear?

Should "KMS state" be replaced with "complete device state" or
something similar?

> > All objects are always part of the device KMS state as referred to
> > in this doc, whether they were mentioned in the atomic commit state set
> > or not. That's the whole point: all state that was not explicitly
> > modified remains as it was, and is actively used state by the driver
> > and hardware. The practical end result state is the same as if all
> > objects were (redundantly) mentioned.
> >=20
> > For example, if you change properties of CRTC 31, it has no effect on
> > the behaviour of CRTC 54. If CRTC 54 was active, it remains active. If
> > CRTC 54 had certain property values, it continues to have those
> > property values. =20
>=20
> I'm not quite sure I followed your previous paragraph, sorry, but we
> agree here and it's kind of my point really: CRTC-54 would not be part
> of the new KMS state, so claiming that it is complete is confusing.
>=20
> It's not complete to me precisely because it doesn't contain the state
> of all objects.

Did my explanation of what "KMS state" means from userspace perspective
above help?

> > This is opposed to something else; the UAPI could have
> > been designed to e.g. reset all unmentioned objects to defaults/off by
> > the atomic commit. Obviously that's not how it works today, so we need
> > to mention how things do work. =20
>=20
> Sure, I'm not claiming we should change anything but the wording of that
> doc.
>=20
> > >=20
> > > So yeah, individual object KMS state are indeed complete, but
> > > drm_atomic_state definitely isn't. And it's the whole point of functi=
ons
> > > like drm_atomic_get_crtc_state() vs drm_atomic_get_old/new_crtc_state:
> > > the old/new variants only return a state if it was part of
> > > drm_atomic_state to begin with. drm_atomic_get_crtc_state() brings the
> > > crtc state into drm_atomic_state if it wasn't part of it. =20
> >=20
> > At no point the text is referring to drm_atomic_state or any other
> > kernel data structure. =20
>=20
> Then it's even more confusing, because the sentence I was quoting was
> "The changes recorded in an atomic commit apply on top the current KMS
> state *in the kernel*", which is ambiguous then.

It's perhaps a misguided attempt to say that the kernel maintains the
complete device state, and that the complete device state is modified
in the kernel. If it helps, the "in the kernel" can be dropped.


Thanks,
pq

--Sig_/=bSmbDZcOhdjv3iZ1XwQta1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVpsDgACgkQI1/ltBGq
qqeTfQ//Tx1aj3ET5ljpFzO8+v0bqwcdE10/JnjR54V/GWhcVEFfyL40b7MLpX4K
AcPjb2BWg3F6DiGMIIM+yl2QAPudYPCXn6pyGFWugEyu+H5MeMSQe3TpwyXKrvse
lq5mBtN8gxjPz/4hq1U13g4Qrr3ogeuSchDdL8GkvaDadsRBaveQ/vjxHh/XRoVx
wDdZQQ/ukV1xzstILk64XxSJIXUWFqzwFIAxMNHNjdBhc3h1g/6ccvRbsTLG9k9w
tumPW0TENqBzTUcKdyknpPrs6pM5GILrNLOBrByrpIL1EOMH8M5tMB4qmqNVsuTg
TLJ1uANUjgBPvSKJhHrgllY/5KVMWfzR37uDLfXZTAGLgWekTLqvtEkWSb+8dANW
8LDkNu8kEWYimCk1EoC4lTYoxa/Gv238wzd/QKWAqLqqGyTyzOf1AFnpk2it6Xce
iIQFTI+g3PYxeQIxHI9tc+523pVqwtVLEXh73Cr8l7fO6NTgOpog/uR7KO2TEVIc
75G/ho7GxIpyJjnVLeijU/5bL46C5kXNAqE1Nvm4S5BKOt4I7NGSWGSRHlABrMyC
HLx/0/U3Is5x0JlrR9VUN4BB3/RVKyKyVdfvbRROKYPdHRb4WSaBxMPG2TwtGYNH
29o1yD9N5yiVM0+7a6/7h/pGM2G4lBppk/KZ9133JgtvOUi71kM=
=u5wp
-----END PGP SIGNATURE-----

--Sig_/=bSmbDZcOhdjv3iZ1XwQta1--
