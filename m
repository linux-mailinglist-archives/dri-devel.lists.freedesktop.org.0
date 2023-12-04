Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59242802E6E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F68310E064;
	Mon,  4 Dec 2023 09:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8911C10E064
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:21:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D76FB60F6E;
 Mon,  4 Dec 2023 09:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10923C433C7;
 Mon,  4 Dec 2023 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701681666;
 bh=yXpkcjxGbH43Y6FCHbcxZVd2NuXjmzJqebGcXpkFse0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFFom18cUH0M1doQnz0oAWJZFu1VIBEQNEG7NFnWO95h6h0R2oJ+A29dvAFa2vTHw
 2ncfjyxQeUmYudoAMd1kHfTaGNzwV1iloC15leqUDl2AbGlv9lHfhNW9Jju8ciKF42
 hhSIxZQtttswqKyv0umz0i8k6AH71cXONhfFSYEkrkfLbaxvZELo38mVwhDQguwi9L
 I+6xYZFpWSWu+J3Ph2i4Z916kfKsW76Kq1wFVNckusUL1jcfeYb9gJBFejR+mXVmEw
 6PX9bkt9RKBUiqLlUwcrm6ztCEOb9ohYC3Ufo9GlfLkTl2XQhZYIH0KT2bFGyvYKKf
 ShbO4SwT5sJFw==
Date: Mon, 4 Dec 2023 10:21:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <dybgeyjqoh2rjjrvbb5nrnallx63tano2drmxgsgde6n5w6wza@23cfserg7mui>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
 <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
 <20231201110616.30ad1468.pekka.paalanen@collabora.com>
 <bry3w6w32uy2jlmbkcmbtthw6w6nwux7dwlcju5iuxac2wphku@md6njxjtsbvm>
 <20231201120648.2ba706e1.pekka.paalanen@collabora.com>
 <bgd5xuszaujdjg7lt24dpofvhx2v6gyxfjxnqfo7nmaecmn6om@fejhsggdlffo>
 <20231201180348.4a42025b.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7b7zgi2rychuppe7"
Content-Disposition: inline
In-Reply-To: <20231201180348.4a42025b.pekka.paalanen@collabora.com>
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
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7b7zgi2rychuppe7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 01, 2023 at 06:03:48PM +0200, Pekka Paalanen wrote:
> On Fri, 1 Dec 2023 14:20:55 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Fri, Dec 01, 2023 at 12:06:48PM +0200, Pekka Paalanen wrote:
> > > On Fri, 1 Dec 2023 10:25:09 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > On Fri, Dec 01, 2023 at 11:06:16AM +0200, Pekka Paalanen wrote: =20
> > > > > On Fri, 1 Dec 2023 09:29:05 +0100
> > > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > >    =20
> > > > > > Hi,
> > > > > >=20
> > > > > > On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=E9 Almeida wrote=
:   =20
> > > > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > >=20
> > > > > > > Specify how the atomic state is maintained between userspace =
and
> > > > > > > kernel, plus the special case for async flips.
> > > > > > >=20
> > > > > > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > Signed-off-by: Andr=E9 Almeida <andrealmeid@igalia.com>
> > > > > > > ---
> > > > > > >=20
> > > > > > > This is a standalone patch from the following serie, the othe=
r patches are
> > > > > > > already merged:
> > > > > > > https://lore.kernel.org/lkml/20231122161941.320564-1-andrealm=
eid@igalia.com/
> > > > > > >=20
> > > > > > >  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++=
++++++++++
> > > > > > >  1 file changed, 47 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/g=
pu/drm-uapi.rst
> > > > > > > index 370d820be248..d0693f902a5c 100644
> > > > > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > > > > @@ -570,3 +570,50 @@ dma-buf interoperability
> > > > > > > =20
> > > > > > >  Please see Documentation/userspace-api/dma-buf-alloc-exchang=
e.rst for
> > > > > > >  information on how dma-buf is integrated and exposed within =
DRM.
> > > > > > > +
> > > > > > > +KMS atomic state
> > > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > +
> > > > > > > +An atomic commit can change multiple KMS properties in an at=
omic fashion,
> > > > > > > +without ever applying intermediate or partial state changes.=
  Either the whole
> > > > > > > +commit succeeds or fails, and it will never be applied parti=
ally. This is the
> > > > > > > +fundamental improvement of the atomic API over the older non=
-atomic API which is
> > > > > > > +referred to as the "legacy API".  Applying intermediate stat=
e could unexpectedly
> > > > > > > +fail, cause visible glitches, or delay reaching the final st=
ate.
> > > > > > > +
> > > > > > > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ON=
LY, which means the
> > > > > > > +complete state change is validated but not applied.  Userspa=
ce should use this
> > > > > > > +flag to validate any state change before asking to apply it.=
 If validation fails
> > > > > > > +for any reason, userspace should attempt to fall back to ano=
ther, perhaps
> > > > > > > +simpler, final state.  This allows userspace to probe for va=
rious configurations
> > > > > > > +without causing visible glitches on screen and without the n=
eed to undo a
> > > > > > > +probing change.
> > > > > > > +
> > > > > > > +The changes recorded in an atomic commit apply on top the cu=
rrent KMS state in
> > > > > > > +the kernel. Hence, the complete new KMS state is the complet=
e old KMS state with
> > > > > > > +the committed property settings done on top. The kernel will=
 try to avoid     =20
> > > > > >=20
> > > > > > That part is pretty confusing to me.
> > > > > >=20
> > > > > > What are you calling the current and old KMS state?   =20
> > > > >=20
> > > > > Current =3D old, if you read that "current" is the KMS state befo=
re
> > > > > considering the atomic commit at hand.
> > > > >    =20
> > > > > > What's confusing to me is that, yes, what you're saying is true=
 for a
> > > > > > given object: if it was part of the commit, the new state is th=
e old
> > > > > > state + whatever the new state changed.
> > > > > >=20
> > > > > > However, if that object wasn't part of the commit at all, then =
it's
> > > > > > completely out of the old or new global KMS state.   =20
> > > > >=20
> > > > > This is not talking about kernel data structures at all. This is
> > > > > talking about how KMS looks from the userspace point of view.   =
=20
> > > >=20
> > > > I mean, that's also true from the userspace point of view. You can =
very
> > > > well commit only a single property on a single object, and only that
> > > > object will be part of the "global KMS state". =20
> > >=20
> > > What is "global KMS state"? =20
> >=20
> > struct drm_atomic_state, ie. the object holding the entire new commit c=
ontent.
> >=20
> > > As a userspace developer, the global KMS state is the complete, total,
> > > hardware and driver instance state. It's not any kind of data
> > > structure, but it is all the condition and all the programming of the
> > > whole device (hardware + driver instance) at any specific time instan=
t. =20
> >=20
> > That was my understanding, and assumption, too.
> >=20
> > I think part of the issue is that drm_atomic_state is documented as "the
> > global state object for atomic updates" which kind of implies that it
> > holds *everything*, except that an atomic update can be partial.
>=20
> I haven't read such doc, and I never intended to refer to struct
> drm_atomic_state. It very much sounds like it's not what I mean. I
> avoid reading kernel internals docs, they are uninteresting to
> userspace developers.

Sure, but I'd assume (and kind of hope) that kernel devs will read the
UAPI docs at some point too :)

> Is it really "global" too? Or is it device-wide? Or is it just the bits
> that userspace bothered to mention in an atomic commit?

As far as I'm concerned, global =3D=3D "device-wide", so I'm not entirely
sure what is the distinction you want to raise here, so I might be off.

But to answer the latter part of your question, drm_atomic_state
contains the changes of all the objects affected by the commit userspace
mentioned to bother. Which is is why I found the "global" to be
confusing, because it's not a device-wide-global state, it's a
commit-global state.

> > So maybe we need to rewrite some other parts of the documentation too
> > then?
>=20
> I guess.
>=20
> > Or s/drm_atomic_state/drm_atomic_update/ so we don't have two slightly
> > different definitions of what a state is?
> >=20
> > Because, yeah, at the moment we have our object state that is the
> > actual, entire, state of the device but the global atomic state is a
> > collection of object state but isn't the entire state of the device in
> > most cases.
> >=20
> > If we get rid of the latter, then there's no ambiguity anymore and your
> > sentence makes total sense.
>=20
> I have no idea of kernel internals. Userspace should not care about
> kernel internals as that would mean the kernel internals become UABI.
> Some internals leak into UABI anyway as observable behaviour, but it
> could be worse.
>=20
> The complete device state is a vague, abstract concept. I do not expect
> it to be an actual C struct. It is hardware-specific, too.
>=20
> > > It is not related to any atomic commit or UAPI call, it is how the
> > > hardware is currently programmed.
> > >=20
> > > How can we make that clear?
> > >=20
> > > Should "KMS state" be replaced with "complete device state" or
> > > something similar? =20
> >=20
> > I know I've been bitten by that ambiguity, and the part of the doc I've
> > replied too mentions the "KMS state in the kernel" and an atomic commit,
> > so it's easy to make the parallel with drm_atomic_state here.
> >=20
> > I guess we can make it clearer that it's from the userspace then?
>=20
> It's not from userspace. It is a concept from the userspace
> perspective. I'm not sure how to make that more clear.
>=20
> From userspace perspective it looks like the kernel maintains all of a
> device's state. What would you call this "all of a device's state as
> maintained by the kernel"?

Like I said, I think most of the confusion comes from the kernel doc,
not your patch.

I'll send a patch to s/drm_atomic_state/drm_atomic_update/, we'll see
how it goes.

Maxime

--7b7zgi2rychuppe7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2Z/wAKCRDj7w1vZxhR
xeNaAP9QUgLNyEKndg7DfUpbY579H60NViHRaq5loz77Xipj8wEA1+Bh7n0qkpkY
SXPxSCULHzhaZ4LbAAaos1OwXWtZSwM=
=H5DF
-----END PGP SIGNATURE-----

--7b7zgi2rychuppe7--
