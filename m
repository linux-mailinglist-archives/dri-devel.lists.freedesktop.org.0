Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C997A3D1F14
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85EB6E9F6;
	Thu, 22 Jul 2021 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14226E869
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:34:32 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y25so5395602ljy.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 00:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ntwLw/pvmNhByaH8acN8/n/x3HsjAT+5ZjYrKVyc+34=;
 b=ButI5mIKqkSCY5guizoHAmDaRxkwngJjTZu6RW7nluA8tW7w4g6efwMwjbMzAZ54LY
 rZMWoyzmgeWrKV24/IZfwJkUxQ88xnQ+mbciDdrBFwXq9ooDw8wRRfyfxDTatytL3J8G
 Mo0LZBU39jjMYIt7fRLmkU9K3tto9WqzkQhU03QseNCu3HngSYyg5JvqG2d1K/eWz7aH
 yuBUYv7TDrN39TGACvas55tSQnX3e4jZSISaxoE/rvftDupgcGrZXAL1veDMyrHozVkb
 QvrRpUPSJrxDAeQacv6Qtv8u7KmbGCqplC8Vu8HCg7R1epNvkTADOhX2aXEVFI/OCYu/
 iDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ntwLw/pvmNhByaH8acN8/n/x3HsjAT+5ZjYrKVyc+34=;
 b=nP5MXmwlpXoGxXn9+2Xgc7C0+px5EOWSZNyITdhDljad/y3jz2htxU/k+ss+XEWItW
 KbOXL43ZqlfRbVYDsp81Dxo0hM+I82460t1yk+9d1l4YWQVxoopiFKijtYzRDOIkp+sd
 42ama20F0VebsmkvAo6arroYBh/VyUGIUcfWTl8sQHokLzkGGkFCQSe5M9hFfFna1d0y
 Pn0Es7H3F4cqIeMuqcFH7pvn3knQmfhtcBcRshYSMNAu9sIqb6sX2R5BuI6wvkaBzXt1
 IWw8ebJv3pMa5g8hwyaY4BXipwlL4199b7zktEfVMUqT5IqGA5daa6aw5wLSEQsXvyZf
 BiKQ==
X-Gm-Message-State: AOAM533Mqaul9fKUeCp+JWIBSAxY5k5x6h9JKhTbrf5KPavfJjF3pT7H
 Of5YgAwtfw3dnhai6+WHJus=
X-Google-Smtp-Source: ABdhPJxuVvtWYt/Np1EhaS6O7DmEZ/rNiWbjhiOwdXQ4ZsBCgrvw5eilIFLI8gd4uHsHxqVtCtBlmw==
X-Received: by 2002:a2e:a710:: with SMTP id s16mr34441617lje.459.1626939271138; 
 Thu, 22 Jul 2021 00:34:31 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k11sm1912540lfu.27.2021.07.22.00.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:34:30 -0700 (PDT)
Date: Thu, 22 Jul 2021 10:34:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_property_enum.value for bitfields
Message-ID: <20210722103427.1a75add8@eldfell>
In-Reply-To: <YPgISaTbkBxYaBHX@phenom.ffwll.local>
References: <NUZTPTKKZtAlDhxIXFB1qrUqWBYKapkBxCnb1S1bc3g@cp3-web-033.plabs.ch>
 <YPgISaTbkBxYaBHX@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AawntBGoBNEZ1kY7Y1Empvz";
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
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/AawntBGoBNEZ1kY7Y1Empvz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jul 2021 13:43:05 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jul 21, 2021 at 06:51:30AM +0000, Simon Ser wrote:
> > When a property has the type DRM_MODE_PROP_BITMASK, the value field
> > stores a bitshift, not a bitmask, which can be surprising.
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> > ---
> >  include/drm/drm_property.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> > index bbf5c1fdd7b0..f3ea7f97f372 100644
> > --- a/include/drm/drm_property.h
> > +++ b/include/drm/drm_property.h
> > @@ -37,6 +37,11 @@
> >   *
> >   * For enumeration and bitmask properties this structure stores the sy=
mbolic
> >   * decoding for each value. This is used for example for the rotation =
property.
> > + *
> > + * If the property has the type &DRM_MODE_PROP_BITMASK, @value stores a
> > + * bitshift, not a bitmask. In other words, the enum entry is enabled =
if the
> > + * bit number @value is set in the property's value. This enum entry h=
as the
> > + * bitmask ``1 << value``. =20
>=20
> Please move this into an inline comment to make it clear that this is
> specifically about @value. With that:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20

With that

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> I was also pondering whether we have a nice place to link to for
> "property's value" but really they're just uint64_t all over the place,
> and only stored in the drm_mode_object for non-atomic properties. So
> wording sounds like the best option we have.
>=20
> >   */
> >  struct drm_property_enum {
> >  	uint64_t value;
> > --=20
> > 2.32.0
> >=20
> >  =20
>=20


--Sig_/AawntBGoBNEZ1kY7Y1Empvz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmD5H4MACgkQI1/ltBGq
qqeRWBAAo2Hk7d9xdv+GXFfldRs2fiVUwe7v/6sqYUJgEfLDEmwZP0w0TNNxNhWZ
AmyiYkp693uVUhxOa0h26rRFY4HHjD9PsMdfcXYppsvB7QBJP2Ik7cQ91n0ye9ih
uUrYQ7jVJxVva/aB0NR1699sR+ae7hEnXEFpHsq9giwEuZzAs7sOPk8NkZsH1Mo5
6mBZy52vBY5GZYihrtbZEEDyO+DoyULmn8OIPzq5h7gOR/coDfbodAv+tdNn9Imr
w/iIHP/RgepBztmPDH3xtlp1KH5cEgEiscDyZhQOousXlpLrstjaGoohgBlYg511
YC3pUH9HNtuson/2eo9kLmST20bQhBkWuhsdoxZdLhJs6KjOisAE+YKAAsqwD8VP
6GW+6Wvn8iVrJlAbedZaYCuyqgMH/H7dsRXh+LdQ6dMigLD6VpNAuAUbaZvA6gb+
0bp4IL5arUT5leuxpKjhkUeX3AyS0Z3p9JBmxbyMM50d69avAW8lDSzrFP5vb564
dWdvDfa4gb4aFCvxuPnY+RpHByhMCL6Jbx2uOrG2z1fJzgNO3ltrvsNeHhqL6Zbo
E8cYdxU92GJS7LtOlTOVv/0izrxgFt3cYGUciE9tHqeydbaEw1Y2O0DGAsReSXGm
bW6sj93igVl3pXp+WkWrBb16hThpvaGEvZ8CbjGGddSGyP3XpKo=
=DXRV
-----END PGP SIGNATURE-----

--Sig_/AawntBGoBNEZ1kY7Y1Empvz--
