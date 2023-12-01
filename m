Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003B1800687
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B774E10E0D0;
	Fri,  1 Dec 2023 09:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B58410E0D0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:06:29 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C41C660739A;
 Fri,  1 Dec 2023 09:06:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701421587;
 bh=rTJZzJCgLiIwcExEqYbSM1DrO64iWFfVeLwuztLPWMY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YK8Z4kJsctmCvtC34do7rBld3Q7LYUZl/0nv9aqDmV99WVGG7Rg1mq5NIKqD0RFCD
 rOY+hghc+077Ykui0ABFFZHaByhTaQHjmmBYaH0RV/0j0lrfyePcM+/uFj5U5RSJhw
 H39ez4s55uhOOTgE46zhbdqjDkitqvTH7OlKglu5MVRbyNtoJsI5qGT7wddWRj6zT1
 NgaBowSx1mD57TEa0xl8QvnETDjqJyVcPx99QvWXXW8hAhx/0dpZg/H7EY8mjFgXXh
 j4ssFHJ8UO821ShXUeVTtrBMCu9JITIcyJ6SaS55Gk0cMbwmEXQBawUXdCrQibipT6
 nv7wCSBBL4lHQ==
Date: Fri, 1 Dec 2023 11:06:16 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <20231201110616.30ad1468.pekka.paalanen@collabora.com>
In-Reply-To: <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
 <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ilb4Canwm_BXnib/16uRTnM";
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
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ilb4Canwm_BXnib/16uRTnM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Dec 2023 09:29:05 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
>=20
> On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=C3=A9 Almeida wrote:
> > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> >=20
> > Specify how the atomic state is maintained between userspace and
> > kernel, plus the special case for async flips.
> >=20
> > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > ---
> >=20
> > This is a standalone patch from the following serie, the other patches =
are
> > already merged:
> > https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@igalia=
.com/
> >=20
> >  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 370d820be248..d0693f902a5c 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -570,3 +570,50 @@ dma-buf interoperability
> > =20
> >  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
> >  information on how dma-buf is integrated and exposed within DRM.
> > +
> > +KMS atomic state
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +An atomic commit can change multiple KMS properties in an atomic fashi=
on,
> > +without ever applying intermediate or partial state changes.  Either t=
he whole
> > +commit succeeds or fails, and it will never be applied partially. This=
 is the
> > +fundamental improvement of the atomic API over the older non-atomic AP=
I which is
> > +referred to as the "legacy API".  Applying intermediate state could un=
expectedly
> > +fail, cause visible glitches, or delay reaching the final state.
> > +
> > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which =
means the
> > +complete state change is validated but not applied.  Userspace should =
use this
> > +flag to validate any state change before asking to apply it. If valida=
tion fails
> > +for any reason, userspace should attempt to fall back to another, perh=
aps
> > +simpler, final state.  This allows userspace to probe for various conf=
igurations
> > +without causing visible glitches on screen and without the need to und=
o a
> > +probing change.
> > +
> > +The changes recorded in an atomic commit apply on top the current KMS =
state in
> > +the kernel. Hence, the complete new KMS state is the complete old KMS =
state with
> > +the committed property settings done on top. The kernel will try to av=
oid =20
>=20
> That part is pretty confusing to me.
>=20
> What are you calling the current and old KMS state?

Current =3D old, if you read that "current" is the KMS state before
considering the atomic commit at hand.

> What's confusing to me is that, yes, what you're saying is true for a
> given object: if it was part of the commit, the new state is the old
> state + whatever the new state changed.
>=20
> However, if that object wasn't part of the commit at all, then it's
> completely out of the old or new global KMS state.

This is not talking about kernel data structures at all. This is
talking about how KMS looks from the userspace point of view.

All objects are always part of the device KMS state as referred to
in this doc, whether they were mentioned in the atomic commit state set
or not. That's the whole point: all state that was not explicitly
modified remains as it was, and is actively used state by the driver
and hardware. The practical end result state is the same as if all
objects were (redundantly) mentioned.

For example, if you change properties of CRTC 31, it has no effect on
the behaviour of CRTC 54. If CRTC 54 was active, it remains active. If
CRTC 54 had certain property values, it continues to have those
property values. This is opposed to something else; the UAPI could have
been designed to e.g. reset all unmentioned objects to defaults/off by
the atomic commit. Obviously that's not how it works today, so we need
to mention how things do work.

>=20
> So yeah, individual object KMS state are indeed complete, but
> drm_atomic_state definitely isn't. And it's the whole point of functions
> like drm_atomic_get_crtc_state() vs drm_atomic_get_old/new_crtc_state:
> the old/new variants only return a state if it was part of
> drm_atomic_state to begin with. drm_atomic_get_crtc_state() brings the
> crtc state into drm_atomic_state if it wasn't part of it.

At no point the text is referring to drm_atomic_state or any other
kernel data structure.


Thanks,
pq

--Sig_/Ilb4Canwm_BXnib/16uRTnM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVpoggACgkQI1/ltBGq
qqc6AxAAlBWeVudinBA3iet8KUI3heH4Rzpso1wX7XAnCiCN/FL949KDlWavHoao
oNJIeeWdQWl+1aaMd4Rh5cj49XknqYoFHWGiNitY7bWgOARhZ2QRuZq12P/EghkB
gwLb0suqe5SSPMqWxQy74R1vZezInMWnRSKVQCyXyMKdTqTg2h//P5X7I6BS5fR7
UnKrMChRwJR2fIdf0BbLGlyZfalxZZ2YTG2P0I3pycPUru6XmdY/SHn/81fezaw/
9+aUz8B77k2tp4w6/FtUaiKW34UG5QjJzar1GDZKCdf74H99MCjTROUlbde55yVq
r8E6m9VT931yu6SREN3vPynBUJvBrukkXO9Ymtum4fajcB0RFCu5NmFmbgm2nHWR
xRVkA11+VqRBuUrG+RbhLnSTh3dB1iKNbcjo490LyzqyifSSq8D3meyCmyY7fhc2
09XqRYtBVqNUZzaLf3JbfWVZ4INq2PA6Q8Yq+bEx7tXgE3uNyvM5kabxd8OXmT5S
WOmFPgiFrJTgh2K4CCrtpPdxUXEvPoLQu7mE3DmQeLyQsuGFdycekRzqsBUPWfc2
lS0ur8J9qNod02uP9fSKW/2UdKwBroSO5t2d+s/LAmAgwm/xc93hnhbYSjmivKpd
TFzMmDPNCkZC+2BHmy7WZhVTvoSoIQiHZsjoq9jtyYcNxnUO0G4=
=gKNe
-----END PGP SIGNATURE-----

--Sig_/Ilb4Canwm_BXnib/16uRTnM--
