Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A4A814B00
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CEA10EA48;
	Fri, 15 Dec 2023 14:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9AA10EA48
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702652078;
 bh=pnzxGNC6fFMnfFXJ+v7IX7uUTnp9PRg/FtZqhlHV38g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R9/hRO8eMxipRKVIn6FsMG6KJH/BvPtOWGTHGzCEF+6Ytl9BLCgWSQIiE2EDwGY8q
 nsXbD6cfGSxvTSOiEtXf3KI304qo9NM71o0sovY7RB9Mub6+4za+4agiPpz5yrthL0
 Ym8JJnKp4VQ2RuE4MpulC3m9Cj6MxE+OCXW7SWQlrl0g0Ut9TFIV82i3w9jkPyMuqY
 5YfxXZmFhxn8lAu95bfjNgrI9E6OM/TStBS5vXvKU6slwbbRLCVcNS8x1og+5NyHPL
 dDu8ZZsnVBzHEZWuWmx6i+44J5tz+duA+m2l8l1E2dzZYuwJHA5YO5/hzjEZtaVbh1
 aLCHIht7uxMSg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC0AA3781FC7;
 Fri, 15 Dec 2023 14:54:37 +0000 (UTC)
Date: Fri, 15 Dec 2023 16:54:28 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 4/5] drm/atomic: Make the drm_atomic_state
 documentation less ambiguous
Message-ID: <20231215165428.65dabd45.pekka.paalanen@collabora.com>
In-Reply-To: <20231214100917.277842-4-mripard@kernel.org>
References: <20231214100917.277842-1-mripard@kernel.org>
 <20231214100917.277842-4-mripard@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uqzgoAI8TpgroVC=yOUN+3v";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uqzgoAI8TpgroVC=yOUN+3v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Dec 2023 11:09:15 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> The current documentation of drm_atomic_state says that it's the "global
> state object". This is confusing since, while it does contain all the
> objects affected by an update and their respective states, if an object
> isn't affected by this update it won't be part of it.
>=20
> Thus, it's not truly a "global state", unlike object state structures
> that do contain the entire state of a given object.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 914574b58ae7..5df67e587816 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -346,7 +346,13 @@ struct __drm_private_objs_state {
>  };
> =20
>  /**
> - * struct drm_atomic_state - the global state object for atomic updates
> + * struct drm_atomic_state - Atomic commit structure
> + *
> + * This structure is the kernel counterpart of @drm_mode_atomic and repr=
esents
> + * an atomic commit that transitions from an old to a new display state.=
 It
> + * contains all the objects affected by an atomic commits and both the n=
ew

*by the atomic commit and

> + * state structures and pointers to the old state structures for
> + * these.
>   *
>   * States are added to an atomic update by calling drm_atomic_get_crtc_s=
tate(),
>   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/uqzgoAI8TpgroVC=yOUN+3v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV8aKUACgkQI1/ltBGq
qqfSOg//bHkATiCUtP/fyrALvmm1DY7ssZoa51ZZyXtEEQ/datEDrGjW0gj+xFQw
bGAz2z/E+B4J7VuiOflP0HyaQ3D+Li/puRF0rqX/JmhZa2pO0ib8Hn/Ml5ZksDKl
egEZ9CtFu8jwXn8hwU3NNA926cvI4LhWvK1xeMYud8/uaWAKP3W+G338cqT9KGGU
YEDQGBSTzAaCBuizW3x0XJzhkJoeD73gGaC7YS/z88LoRJnCg2KQHXV9I+HDVGOI
qx48rJI2IUdK698Y4cbFAkKopl9ZjbthSIHa3mkirgu5Lnad6llW3aL8KW84+S5S
nj25ZW7gE/pmPB3xu92NmLcHyIEgrP4Y4x1FeLxzIFePwWpxvPWu2DvjH3Zr6oeH
kOg3+pUbbWyuoJo7l/A7gAzg+75BMM9RYWjmrtCwM8rXLQTfMrhOoR1DSQAQdgcp
GtvExitti3p1gcutgW05tqGONtq2i+RHvimxz1Mkki+Rg5RKQnPbf3jp6wFBxBru
BIc9FyInEn4cdPjp6MTATBjXK3I2430ZLmdpMAcrUMohyF+Cvifow7MIqC+BbnZ/
TWdS8PAOcsuhlfQRH7DK4p6+tXScBG3ydCMwYGDNLgvKV2+7j9qm7GHpFbtK6NsL
8TsoyjO37AgSbaBX7g65RXVER6Fygta3UPwaLJLtY7neHe8497w=
=MUUz
-----END PGP SIGNATURE-----

--Sig_/uqzgoAI8TpgroVC=yOUN+3v--
