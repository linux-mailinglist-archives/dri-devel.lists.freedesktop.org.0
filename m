Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB60CEB9C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 20:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6876E11F;
	Mon,  7 Oct 2019 18:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from elaine.keithp.com (home.keithp.com [63.227.221.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A9D6E11F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 18:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 6799C3F29596;
 Mon,  7 Oct 2019 11:16:33 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id YENfxiy2KoPi; Mon,  7 Oct 2019 11:16:33 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 17DB13F29594;
 Mon,  7 Oct 2019 11:16:33 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
 id EB61C15822F0; Mon,  7 Oct 2019 14:16:32 -0400 (EDT)
From: "Keith Packard" <keithp@keithp.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
In-Reply-To: <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
References: <87y2xzqimw.fsf@keithp.com>
 <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
Date: Mon, 07 Oct 2019 14:16:32 -0400
Message-ID: <871rvopgjj.fsf@keithp.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0978314376=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0978314376==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Stone <daniel@fooishbar.org> writes:

> I think there would be a load of value in starting with simple helpers
> which can be used independently of any larger scheme, tackling that
> list above.

Yeah, a helper library that didn't enforce at tonne of policy and just
let the user glue things together on their own is probably going to be
more generally usable by existing and new systems.

I definitely like the idea of stealing the best parts of all existing
systems and trying to make them work together.

How many libraries we end up with isn't nearly as important to me as
making sure they work well together; common data types, similar style,
etc.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl2bgQAACgkQ2yIaaQAA
ABGIXA/8Do65wOQ3eYks7Fsq6ipjMWEFHDD/oepEqSA9EkfMnPXyoTfVEa7m1RF+
Fay5Znyjb1fy7h7Ch6bwjB/uhk0BBWhwa2RoE4rteUAmumNUn7/Ynu5UMt/ocG+R
Nw83X37sXFDcftNdWaWqmGaju8AaAx9w1rYbVGhDYGJ5XJTkFuEAH9RfHod6v9/a
RapF8jFsw4nqYqqtFkjeHsPeea/xw0L95cUqyIr+w8eBhPe3OstNsqlxDhz7qYdj
iGrIGWfMzNOJxEtoBXqHD0EJ2St06tH9XRvVIuNtCGGdUVdinQmjP6YT/kI9heYd
QJZUt565zqtfhJ9Uf1ZL5YTF1bEG8qDT2gTDizyksHVSqaL2+etMeEzzOdypyurN
Xr4NxZR5UGXdyTnE90kNR2oHeLgEIjLK4A8JA3JdpxYHbH1IS3Pvq4P6yTeGzm1z
MfxENnIZZdI2T57DfdEc19ksSvX3TfBUDsRS7G+mLNzMvm0JNsA92T56xvfIXwk9
PCPv2aWl6/9TmKIbpfi2z3nJarwF92uZi4keScYlVquKSNM+qFHYO04lLCttjc37
pufSND7XEQmwdBdbtaYvPXYDCqjBuMM7ZnYe5iqPaUrojvVc9zswxkMFByqzSEgN
q4DYzcaU+Pc63y9k6K3bm5xs+9xXGxPbeZCBNwyHUameJmVNFmc=
=tjyC
-----END PGP SIGNATURE-----
--=-=-=--

--===============0978314376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0978314376==--
