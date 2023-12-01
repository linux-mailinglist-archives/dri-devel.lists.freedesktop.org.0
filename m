Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C139800590
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744710E08C;
	Fri,  1 Dec 2023 08:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D8210E08C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:29:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8D4C6201A;
 Fri,  1 Dec 2023 08:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BEAC433C7;
 Fri,  1 Dec 2023 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419348;
 bh=PnBJTUzXr7trutbP5JjWc1usFAZdvAOna/UdT9PCGkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q6qm3KCURWENxNbXN6B1mbytWuCWGTQyQhrJ67zFwzeYnJd6hEV5h0Od3bvRQ7ZOa
 dcuyzKQ8qwRGv4lPZPy5YeFuP5n08bn8nGmmhK5hO0C0vsL2zezxWq3Zu8vn/NKOz2
 fl+P6EG1r9jkVEEY+KDdULI9BSQj6v6XSMX0g0pbru0tQiDQKHzFqoDL8+JZpDYURa
 hoi0ljEiDQ5MsncIicG1ELRVunjp26/ahPh5J20TbMxibtbV7iq/nK7SoLB333UDrF
 T/XGGMDQOA+aBGdmiPppWsnBmhPo7eUPdDsU0734BU98CDaUhSoaWhEn7VlX4Pyn0O
 KphjgnoKiV40Q==
Date: Fri, 1 Dec 2023 09:29:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rfhua6m3ln4gsubv"
Content-Disposition: inline
In-Reply-To: <20231130200740.53454-1-andrealmeid@igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rfhua6m3ln4gsubv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=E9 Almeida wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>=20
> Specify how the atomic state is maintained between userspace and
> kernel, plus the special case for async flips.
>=20
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Andr=E9 Almeida <andrealmeid@igalia.com>
> ---
>=20
> This is a standalone patch from the following serie, the other patches are
> already merged:
> https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@igalia.c=
om/
>=20
>  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 370d820be248..d0693f902a5c 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -570,3 +570,50 @@ dma-buf interoperability
> =20
>  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>  information on how dma-buf is integrated and exposed within DRM.
> +
> +KMS atomic state
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion,
> +without ever applying intermediate or partial state changes.  Either the=
 whole
> +commit succeeds or fails, and it will never be applied partially. This i=
s the
> +fundamental improvement of the atomic API over the older non-atomic API =
which is
> +referred to as the "legacy API".  Applying intermediate state could unex=
pectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which me=
ans the
> +complete state change is validated but not applied.  Userspace should us=
e this
> +flag to validate any state change before asking to apply it. If validati=
on fails
> +for any reason, userspace should attempt to fall back to another, perhaps
> +simpler, final state.  This allows userspace to probe for various config=
urations
> +without causing visible glitches on screen and without the need to undo a
> +probing change.
> +
> +The changes recorded in an atomic commit apply on top the current KMS st=
ate in
> +the kernel. Hence, the complete new KMS state is the complete old KMS st=
ate with
> +the committed property settings done on top. The kernel will try to avoid

That part is pretty confusing to me.

What are you calling the current and old KMS state?

What's confusing to me is that, yes, what you're saying is true for a
given object: if it was part of the commit, the new state is the old
state + whatever the new state changed.

However, if that object wasn't part of the commit at all, then it's
completely out of the old or new global KMS state.

So yeah, individual object KMS state are indeed complete, but
drm_atomic_state definitely isn't. And it's the whole point of functions
like drm_atomic_get_crtc_state() vs drm_atomic_get_old/new_crtc_state:
the old/new variants only return a state if it was part of
drm_atomic_state to begin with. drm_atomic_get_crtc_state() brings the
crtc state into drm_atomic_state if it wasn't part of it.

Maxime

--rfhua6m3ln4gsubv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWmZUQAKCRDj7w1vZxhR
xS0HAP90i/BOMmRuVrjPxnOxAXZYyqDfs9rubl1YOTWN6l7MnQD3eKv6YT4StIim
5Q/WsvPjodwnqiSTSEiN57YWIo13Dg==
=rh3S
-----END PGP SIGNATURE-----

--rfhua6m3ln4gsubv--
