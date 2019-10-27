Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C6E6557
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2019 21:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0446E063;
	Sun, 27 Oct 2019 20:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322AF6E063
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 20:23:30 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 471TnT4zj4z9sNw;
 Mon, 28 Oct 2019 07:23:25 +1100 (AEDT)
Date: Mon, 28 Oct 2019 07:23:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Fixes tag needs some work in the drm tree
Message-ID: <20191028072324.5b2b2d4b@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1572207806;
 bh=4/py1Sd0H8mU1OiXiJqYGQKU7rWZZ0TdE/i2StPIxqc=;
 h=Date:From:To:Cc:Subject:From;
 b=JXte50snjzIqCmNX0WIZ4R6Edj1TCJ+hujkIurjkpsRZP1yNxH20VVwAynOnLkTkT
 DtuuHB7LUevnmpkkwvo2QNugvq89LpcM/oh9GIZp9DkpMXpC21NX/9WWrH5LdiLi0J
 QJi7UagrZGK07c2vzyA7/gjO0IM0V/BTX0yycdjEey7ckcUcLXO3EK4qaJMGvcgx9n
 Al4hS1TsNTaCPK05yH7sBXPm2bnIVHVPWc46zwgmRZZma+zZDcFMPuRpsXRKFz7Oko
 SB2Fn/5KgauPOuEt/EesebGV+v40eRn1IV6M6Xu3pjjZ5oSvGaFsNkpPla6WNQxegJ
 rMEu6QMnDHFqg==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shirish S <shirish.s@amd.com>
Content-Type: multipart/mixed; boundary="===============0093607233=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0093607233==
Content-Type: multipart/signed; boundary="Sig_/lIZJRsiyGFmin4iX41DG0rM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lIZJRsiyGFmin4iX41DG0rM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8c9f69bc5cc4 ("drm/amdgpu: fix build error without CONFIG_HSA_AMD")

Fixes tag

  Fixes: 1abb680ad371 ("drm/amdgpu: disable gfxoff while use no H/W schedul=
ing policy")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

Fixes: aa978594cf7f ("drm/amdgpu: disable gfxoff while use no H/W schedulin=
g policy")

--=20
Cheers,
Stephen Rothwell

--Sig_/lIZJRsiyGFmin4iX41DG0rM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl21/LwACgkQAVBC80lX
0GzQsggAl+LQ8kBupvYoiXexYXskkvbY29zpeVHRSytPk5Owot5vsF4MmcypFXjf
cypgC6HCD2kJuIx9ZzSpNZdWsUHGpn4j/FstXgPXbmpx08PjXWtef444fe8X4gEZ
WXdQe0QNSWm0KDX6v76Llyq+q0xwPScTt+IOmR/hLapRzXMFXDsWu8JIYj53TPvz
hPpHIbZqQfz4umNFLX8NMU64SnanWmxF9Wl1LYpSRMqJCiUpdLfiGkLlVp9uRkzQ
A3OguWYplgXdS/jhYX54hinJj/wIp/Pwvhq4CkYhGfxlI4Ypu/GrfZNqCmZGsW4R
zJCq89cjnvuHUJRErD7QGnWiqI82iQ==
=MY5H
-----END PGP SIGNATURE-----

--Sig_/lIZJRsiyGFmin4iX41DG0rM--

--===============0093607233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0093607233==--
