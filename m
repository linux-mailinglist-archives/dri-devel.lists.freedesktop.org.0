Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8E325DF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 03:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4BF898E1;
	Mon,  3 Jun 2019 01:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8E898E1;
 Mon,  3 Jun 2019 01:04:08 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45HGz84XVMz9s00;
 Mon,  3 Jun 2019 11:04:04 +1000 (AEST)
Date: Mon, 3 Jun 2019 11:04:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: unable to fetch the drm-intel-fixes tree
Message-ID: <20190603110403.0412ed22@canb.auug.org.au>
In-Reply-To: <20190603082051.273a014c@canb.auug.org.au>
References: <20190603082051.273a014c@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1559523846;
 bh=TPUMH0+wLPyFeMbCnZDcWd+CdbDwN49mLsSsJ+5Nsqc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ibPX6ToNA5xRBHs7E5Ee7kVh9KcxyznYQUbWROJ2FH1pcm9nMLXvGlAhMp1NDRVzM
 lPeUHqO6ts6DZ897NjnIC2Z+v7FUiOFMmtOjuTyOEnaDJrqGg7XzCxVnVamt5FWdg0
 auNUkeCTzT0KgsUfEXJ+smW3FqyG7lY5CQJjwicCkbHRk/8hhM90RmIn2ZGckbMTCE
 hOZPBkI34bx6ptVNzC87Ai7oM8E8f4qSZrNT+NWpTnhtyjOCFZD8bRQ3vd+hu0nO9q
 IitXF+objgZqs+u/7cepHWtmLKRe5xRHdU0nZm7k7T2EKyMHtNZ+3cYFlnIwyGDYby
 CmnJrzU1Xk8TA==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0307283589=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0307283589==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5W7rw6vAer0=o7AaXUmcNmr"; protocol="application/pgp-signature"

--Sig_/5W7rw6vAer0=o7AaXUmcNmr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, 3 Jun 2019 08:20:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Trying to fetch the drm-intel-fixes tree today gives me this error:
>=20
> -----------------------------------------------------------------
> fatal: Could not read from remote repository.
>=20
> Please make sure you have the correct access rights
> and the repository exists.
> -----------------------------------------------------------------
>=20
> The same for drm-misc-fixes, drm-intel and drm-misc.  These are all
> hosted on git://anongit.freedesktop.org/ .

Also the drm-tegra tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5W7rw6vAer0=o7AaXUmcNmr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz0cgMACgkQAVBC80lX
0GyutggAkt963tpYucPsS7tkFsqUNexKruuFUV3lneI2aaDDOXLIv0H1j9lR9Rze
SJADEGvKHTn4tKSScsBSo0R+h67eTpaTg7TEvKwX6Le1zHWPRWpScsYh1pXCQpSu
uf8OSZ48VRyFpxYR8+HGupbAEi6bXURdkxLfxpH3sqBrCzHxMHaKixBX4VxORsKX
JprO+cTlKokWFlRgKIo2UXvTOJjrFsT89uvcwC4zh26vBPcoAueAh23rrZdS79mA
wu0+TrGsgX31O2YMnDCfwvePWvV+LG7u7KTPyAoQ5etpt9plvc+HN3oRbDbTq+NF
jL5PqgH4emtjWvX/IbKbjgXEMWq58g==
=95C5
-----END PGP SIGNATURE-----

--Sig_/5W7rw6vAer0=o7AaXUmcNmr--

--===============0307283589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0307283589==--
