Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19A2FBF66
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 06:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11686E10A;
	Thu, 14 Nov 2019 05:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1F56E116
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 05:23:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47D8yM28wwz9s7T;
 Thu, 14 Nov 2019 16:23:07 +1100 (AEDT)
Date: Thu, 14 Nov 2019 16:23:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20191114162306.6d66211b@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1573708989;
 bh=kVIA/Cvj5N5Onr6PfKTRRp26lzLZ0YxhUn1dPy3BKlY=;
 h=Date:From:To:Cc:Subject:From;
 b=nMldFydGhuVjvGJGKU6txsB3yxCB+oekEoTQPGaG8onaylLfdxyBULpH9RK+GWqgf
 NPtn6IUmZ4KoqJebJJUmINF8iRjQnDW+em2wlSChhJaf5llQSjN8L7SvtyNwWzs5hE
 su6T+GhuMLaXhQo9HBkUxsY1LLc4Ruauo+pf+RaZLIQ/GQZ2mFn/IUjo6mt6X6B8RX
 5/JCyyi6TFTAf/t70iryAdxMzQmsNqHPdTOzWmywJ/OLCkt6wKTXT07e2q5bTc9ihR
 9G8WN0Ur1+SMtEvK7G83ASGhe8c77yY6/HzbZwjTbll9AkF7lf0if1a5CQK4kvnnzu
 pX2XGhdYzwJmw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0954738713=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0954738713==
Content-Type: multipart/signed; boundary="Sig_/FWnSSU+bu4ka/a7xyuFdAf3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FWnSSU+bu4ka/a7xyuFdAf3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hmm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c

between commit:

  4d8e54d2b9d3 ("drm/amdgpu/mn: fix documentation for amdgpu_mn_read_lock")

from the drm tree and commit:

  a2849b5dcc9e ("drm/amdgpu: Use mmu_interval_insert instead of hmm_mirror")

from the hmm tree.

I fixed it up (the latter removed the code updated by the former, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/FWnSSU+bu4ka/a7xyuFdAf3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3M5LoACgkQAVBC80lX
0GxjAgf8CgzHIOinx88yr2qPH9/zJRciNOlKcHtNcS186Q9JD1D1fxIaS+OqS4R3
dGLrhg++Gpt3MDh2iJ9g7mEN1Fb4OR16HZXBvlxITtEe9ll6uFJhRWbKLTf1lmdF
xgtgwvZzhed5WlH8/C2z+WiK+RDOf49brkAoJn6aUDCx6oRHGWERDP2wqgwWkIHP
znQ/xzVQLpXzy251vLCe9EwvaJstVQctc83YWCAG2uPlTl/eyACn+MSVJVk8hBWI
pbg24L55a3GvQutrPvHmFjS9Mnf3ciIv3MF/V9tDUo0wH0IgPvHM0leTDS5pp4MP
xFNm97dTSx/viOEfg3rUZb7Wm04K4w==
=Bxwk
-----END PGP SIGNATURE-----

--Sig_/FWnSSU+bu4ka/a7xyuFdAf3--

--===============0954738713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0954738713==--
