Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4CD0435
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462DF6E8B5;
	Tue,  8 Oct 2019 23:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from elaine.keithp.com (home.keithp.com [63.227.221.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454A6E8B5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 23:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id C706C3F2960D;
 Tue,  8 Oct 2019 16:38:23 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id zHeyEpz58WxQ; Tue,  8 Oct 2019 16:38:23 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 3ACEB3F2960C;
 Tue,  8 Oct 2019 16:38:23 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
 id B52D815822F0; Tue,  8 Oct 2019 19:38:22 -0400 (EDT)
From: "Keith Packard" <keithp@keithp.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
In-Reply-To: <62e06d9c-64ec-17c5-d89c-70ef6ac8debc@baylibre.com>
References: <87y2xzqimw.fsf@keithp.com>
 <62e06d9c-64ec-17c5-d89c-70ef6ac8debc@baylibre.com>
Date: Tue, 08 Oct 2019 19:38:22 -0400
Message-ID: <87zhian6z5.fsf@keithp.com>
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
Content-Type: multipart/mixed; boundary="===============1687255717=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1687255717==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Neil Armstrong <narmstrong@baylibre.com> writes:

> Seeing the description, it seems to be a libdrm with steroids,
> why libdrm doesn't handle all this already ?

That'd be a lot of steroids; we're talking about creating helper
functions all the way up to rendering images into scanout buffers
(presumably using Vulkan?) for format conversion or flattening.

> Is there a plan to maybe use it as a foundation for projects like
> wlroots or drm_hwcomposer for example ?

Yes, the goal is to start to share code across a wide range of DRM
users, instead of having everyone roll their own.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl2dHe4ACgkQ2yIaaQAA
ABGoVhAAkakBHIh5AgUi5QQpapEDVD9kDsEiVXWwgBeZXpd+6RwE91ONQxcsbkNr
FI4stQR+cLMKRk8RJKjWvaQ3WtY4Kx3PrIrnHgn8YePW9g5BPE+sRly2PPUHVfF1
3EtuQN2/kbdP/SHnnz63EmdYXMQikAMNcS7hIOnxeplWLyy8k3qZ0Y4QrBuN4Oha
wfZiDfciy2HB9gtr0+P+IWIjOyoxLfQIeR374ZzbjgEjaw6vm/Pa2VKcxNCduDsQ
oZoiL/eNB0yRQtOpUGiE2lap2i8N3G+YJC+MSH3lfUr/odhw3c6gLWX+zSRc/puj
Gor9pCpZ9CfsoTcPNWnMkHLebJX7rWk9q+kPyUxw0yo16ugYST3wtOazxWniS4YA
uSvR2Iqi9q+fcmM/S3lOPMA1nMKLQZoyHzfpBq3YyAcp+zf/T0I+dxifgdWsTpcW
CZwDioHjr8+ksfQJWiTCprYFiXXmuIQe26UkcUjpqUu8Al+/C8DOJ/f+bOc4y2Np
gYGhIkaZUQ3qdWGVOWnZIh/czUUkcZnEKRbpuocSlMnVhhYsqFfC+GVjMVmfKUPa
cgkFkCv9Vras7hnaZWb9toERN7kO2WWcc6oB2rq0MDrDb2wSVgd7UJAsf1n4/ePC
8QgN20YD9+6gqFmwiRoKDR+ClTc8WWKMdICMt8md5GPUWc8XQdw=
=BpUy
-----END PGP SIGNATURE-----
--=-=-=--

--===============1687255717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1687255717==--
