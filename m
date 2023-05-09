Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6AE6FCC3C
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 19:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6D010E3A9;
	Tue,  9 May 2023 17:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3C410E3A9;
 Tue,  9 May 2023 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O649WF8U7qy/q5LcikMb8b+x1YEUnHbV0L4lv8wSS34=; b=Tj16M1lVETEfqnOoNLq5EDDNHA
 nQg/YCMepo9Z42+fe+wpuroXqS2oOIL62ahJAPXHjVSXyQ5wGfpvRFevQuW6/8TO0jOtkUwOfoJTb
 Li4csxXr1q9DxmsCv+EMRfQuki08Vh96c+AS/aAjcK8vlY8m6OmNb3+tzFFhUkz7WDBFRGghTGXPH
 1tkCTYuFSVlMZelZ6krmgnvAV+6ujqA4ZdV5sZGVaAsX67nY5sRU8dxAE9al3YzFxH1e+fb16by9Q
 HRZHesI1M/kv5lDeTGjeBf0zVZmcXJmHftDECH7ivIzSIZj+rZcOp8AymF6lLTLffmUrRPP36BD35
 Gc2yjruA==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwQi3-0053Y8-Hx; Tue, 09 May 2023 19:01:07 +0200
Date: Tue, 9 May 2023 16:01:02 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230509170102.d2iec32gxn5lur72@mail.igalia.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <20230505144150.741a90e1@eldfell>
 <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
 <20230509112349.ognmkrjkjuorl25x@mail.igalia.com>
 <20230509144717.7c85443d@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lnun2apnpye55nq7"
Content-Disposition: inline
In-Reply-To: <20230509144717.7c85443d@eldfell>
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
Cc: "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Victoria Brekenfeld <victoria@system76.com>,
 Jonas =?utf-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lnun2apnpye55nq7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/09, Pekka Paalanen wrote:
> On Tue, 9 May 2023 10:23:49 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>=20
> > On 05/05, Joshua Ashton wrote:
> > > Some corrections and replies inline.
> > >=20
> > > On Fri, 5 May 2023 at 12:42, Pekka Paalanen <ppaalanen@gmail.com> wro=
te: =20
> > > >
> > > > On Thu, 04 May 2023 15:22:59 +0000
> > > > Simon Ser <contact@emersion.fr> wrote:
> > > > =20
>=20
> ...
>=20
> > > > >     Color operation 47 (3D LUT RAM)
> > > > >     =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mappin=
g + night mode
> > > > >     Color operation 48 (blend gamma)
> > > > >     =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ =20
> > >=20
> > > ^
> > > This is wrong, this should be Display Native -> Linearized Display Re=
ferred =20
> >=20
> > This is a good point to discuss. I understand for the HDR10 case that we
> > are just setting an enumerated TF (that is PQ for this case - correct me
> > if I got it wrong) but, unlike when we use a user-LUT, we don't know
> > from the API that this enumerated TF value with an empty LUT is used for
> > linearizing/degamma. Perhaps this could come as a pair? Any idea?
>=20
> PQ curve is an EOTF, so it's always from electrical to optical.
>=20
> Are you asking for something like
>=20
> "1d_curve_type" =3D "PQ EOTF"
>=20
> vs.
>=20
> "1d_curve_type" =3D "inverse PQ EOTF"?
>=20
> I think that's how it should work. It's not a given that if a
> hardware block can do a curve, it can also do its inverse. They need to
> be advertised explicitly.

Sounds good and clear to me.

Thanks!

Melissa

>=20
>=20
> Thanks,
> pq
>=20
> ps. I picked my nick in the 90s. Any resemblance to Perceptual
> Quantizer is unintended. ;-)

:D

>=20
>=20
> > > >
> > > > You cannot do a TF with a matrix, and a gamut remap with a matrix on
> > > > electrical values is certainly surprising, so the example here is a
> > > > bit odd, but I don't think that hurts the intention of demonstratio=
n. =20
> > >=20
> > > I have done some corrections inline.
> > >=20
> > > You can see our fully correct color pipeline here:
> > > https://raw.githubusercontent.com/ValveSoftware/gamescope/master/src/=
docs/Steam%20Deck%20Display%20Pipeline.png
> > >=20
> > > Please let me know if you have any more questions about our color pip=
eline.



--lnun2apnpye55nq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRafE4ACgkQwqF3j0dL
ehzNkBAAmeV+UaKJnyWNeNau9xstyxHAdZOo56z3prKwWps2ma1qCI6HlngiZmTg
WC/fQfGBHVnoE9yrbOJHmKyTMRIDXbwlo3BzJbh6+fUO1vIMen3+KOwwbmvlUxGV
XbMNRV37sHNdcNqWbaOtRLXXEJeM2yEEqioibt/DC/Das8UF4I68WZ1A0Wqo2nt0
bd5MidzguCaJiQhKUXRreI5BqsckVWb7iwsB2p5g3NBsn5LYG6RXMkKdTEr+AVj4
l6YAU2jRJQAHVvSo3e2Zb1oU9XyDH7KjujWAqIl3Wgk8RHVK3qv+0WvzDc/B1zkq
Ow8Pvarz7vxuDJf2wQieFtGRYrfkzi5OMgGxaX5X3jSfObaMBqlHVafDXfc2Jbvn
KYt0QQKrvyl6JS7621Rh2JLpvZkAuohhvCRrnj+eFY1mNR5EVXnkuuuDj2kIkhQm
KKGygzqzGQ1EKdVnYg5QUzsv++3N4a5KsbQ/QLQEjRpVFoWWA5zxpHv10ImP9LuU
s/4XGBK6lisqe9jKMlcRR3+kLa69zLCgWYdm+NUnW6qT+9dtfei2Onxdo+56lT/+
OJL9Wo8woncnBCTrapPu05DJmC436YKWfMjl0ub08FEeYEkj/HjvvGgWt3wEz5Q/
BcizDXa2uEg2Ef5PV3AZwFvUZxmGLDE3nNn3hmCLk+vC8gHmcDI=
=fDKV
-----END PGP SIGNATURE-----

--lnun2apnpye55nq7--
