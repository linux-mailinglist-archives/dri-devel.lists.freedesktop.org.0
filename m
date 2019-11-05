Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A0EF6BE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 09:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B506E922;
	Tue,  5 Nov 2019 08:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533F46E91A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 08:00:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 476hsg2ghJz9sNT;
 Tue,  5 Nov 2019 19:00:07 +1100 (AEDT)
Date: Tue, 5 Nov 2019 19:00:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20191105190004.325da6dd@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1572940809;
 bh=1+1tOa8Z+fF6E/+rJ1OEH3MVH5YElQTwrOuIE5/KjGw=;
 h=Date:From:To:Cc:Subject:From;
 b=SN0ZWKtrxovtQb1ZBrDmYwzFgRrVG6HkuUb6/CyJXfrE2FhSSb5VOfcJm01cvAhYS
 X7TaDV9LpSyNSTqXcP56mSCLXGvA590akI1aTwc2FEIPtU3fj1kkuIJcSGQ6VH43De
 JDXVQRJXRy1uuLaE4G1NWaotmawZ3fjOcPdNdZWf3XktSNY1N3A26scGxNgRjF/6tP
 w6IZhjzgPJDmiDH9IfI/Z+32Il95UfAGWrxN3GaA8WW6rNLD9+q2sj1T9hRTS/ldKG
 LSs4HcSdP4PTPDDHTvoRhh8MFxhWJkFxof8DD3P+mg+cqMiB3q6MiPJfZ7YCLXVGPE
 3Tka7AyHdbVlA==
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
Content-Type: multipart/mixed; boundary="===============0752941632=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0752941632==
Content-Type: multipart/signed; boundary="Sig_//d.vAgZGcJLHrx3QMhBEqo1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//d.vAgZGcJLHrx3QMhBEqo1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hmm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c

between commit:

  4d8e54d2b9d3 ("drm/amdgpu/mn: fix documentation for amdgpu_mn_read_lock")

from the drm tree and commit:

  cb0d3d608a1a ("drm/amdgpu: Use mmu_range_insert instead of hmm_mirror")

from the hmm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_//d.vAgZGcJLHrx3QMhBEqo1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BLAQACgkQAVBC80lX
0Gx+Hwf9Ho7HnuYW4EzPx83acbUIunPzZn171YQEvf+Vt/6qGx+HyyfLFjQRfS9c
idSQL9Lsi7Cs80/qpmrtVrHSN+BfJhMxuOw1Tm9z5XeO/cKf3Anl8jIVF74DMhzp
U9TRzrNj2LE4fllTZw+9TVyTytlUUzW8MBxKjBMoHE+mFuFz4gXwKV7wB2VDV+hB
x34gLaOGC7CpTCuFBvhgaVJzdTTFx598XZ5sLdkV7EofW5QPEaGu37owrOrqwJ1f
yWlgPm9dqWeJ1betxvB4zvrvw+AkONNTkY0uAUVbo4WmWssQFStXxGjyBEQS/Lp7
/QL30AkYdNidnaLYtLgSQQxdfA8q3g==
=CgAf
-----END PGP SIGNATURE-----

--Sig_//d.vAgZGcJLHrx3QMhBEqo1--

--===============0752941632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0752941632==--
