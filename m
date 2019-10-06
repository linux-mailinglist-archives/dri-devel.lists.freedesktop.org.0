Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B527ACCDAB
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 03:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739796E3F3;
	Sun,  6 Oct 2019 01:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from elaine.keithp.com (home.keithp.com [63.227.221.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1A86E3F3
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 01:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id D464A3F29595;
 Sat,  5 Oct 2019 18:12:27 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 8-LBQ9bMI92b; Sat,  5 Oct 2019 18:12:27 -0700 (PDT)
Received: from keithp.com (unknown [65.158.186.218])
 by elaine.keithp.com (Postfix) with ESMTPSA id 4C2E83F29542;
 Sat,  5 Oct 2019 18:12:27 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
 id 4758515822F0; Sat,  5 Oct 2019 21:12:26 -0400 (EDT)
From: "Keith Packard" <keithp@keithp.com>
To: Robert Foss <robert.foss@collabora.com>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 simon.ser@intel.com
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
In-Reply-To: <cf4e90c3-3bdf-cbfd-58ed-19dc111f4c63@collabora.com>
References: <87y2xzqimw.fsf@keithp.com>
 <cf4e90c3-3bdf-cbfd-58ed-19dc111f4c63@collabora.com>
Date: Sat, 05 Oct 2019 21:12:25 -0400
Message-ID: <87v9t2r81y.fsf@keithp.com>
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
Content-Type: multipart/mixed; boundary="===============1455769316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1455769316==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Robert Foss <robert.foss@collabora.com> writes:

> Hey Keith,
>
> Thanks for setting this up, and picking a descriptive project name :)
>
> How is liboutput going to relate to the libliftoff[1] project?

We heard about libliftoff at XDC. It sounds like it does the plane
selection stuff, including searching for configurations that support
'most' of what the user asked for while passing back a list of 'uh,
these didn't fit'. That sounds like a good foundation for liboutput.

I think we want a bit more, including things like render-based
operations for compositing fallback, format conversion, transforms,
PRIME support etc. I think we might also want to be able to create
pseudo outputs (to memory only) for things like virtualization and
testing.

Mostly, I heard lots of ideas at XDC about more we might do to share
code between DRM/KMS users, especially compositors.

I'd love to keep the conversation going and see if we can generate a
solid set of shared goals, then put together some kind of architecture
and bits of code to see what might work.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl2ZP3oACgkQ2yIaaQAA
ABHCeRAAoqT7AbvlZdmkhNFA+ExkxdTNU0q3ZHFbZGh0HbrUr0OtCsAk1wNAfHGR
beP376o5DLr/O4zLeTP7Zyl8tWj2vgtscB8GfSbxiqdRJRhuXd6DLIQywp0IrXZ5
1aLMmVnw6YkJK3KkV0v6wMgPWKmFuWnJW/hxxh23djJuV3fzFftzAd35IgK4/SBj
ZoXhu2id480MUystggk9dMyg9iJgZwVb0BFVl8qDrdEGK01QpxesNsvtDOIGPaFD
wpRfvMFM8xFwe+tvhsRrYxebXH7a+7HpPDTTBJ8ZQBgHDeMFf48bALUFNcAeJu5B
r6XfV1D4x30t+8Mbn8WuytjuixEk10tDpIokdgQGYj6Ht8/8NcImWQ7vMppnblb4
3e9tZXvLyYVhDtxpVy2+UWHUfUCEDR/V1OPgzNUiHzYAy4mW+0awPJpJ56zQfusC
cAxp0abpoT+8WFf3wLWfAEx3sEiBgilTLHBPpSfXpEykDz6LBol5c+TN1cWle9au
Xn3P5lvaLY6BQBk5v4Qwgzs/wvI/nfVhvybb2JtFu9Ur0LoPJnoDG1tpen8/NTSa
lu8mXr272WN8xAJ3xnoXqWGb9eDzmNoVXIu8QtTYPzH4FfoCktj2L8V3HqONvxqW
SUyoGb8NjEL12S4rpxyRKdaSSCdVNPm2nnnMRtEaTpykRmXSN+s=
=3q3U
-----END PGP SIGNATURE-----
--=-=-=--

--===============1455769316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1455769316==--
