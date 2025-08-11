Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E9B21801
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 00:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF8710E31B;
	Mon, 11 Aug 2025 22:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nvCVpMSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5823710E18F;
 Mon, 11 Aug 2025 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1754950456;
 bh=7aY/L4tXa2/G6c9SE43BwcRSx5vEreZf6e2DUj95vdQ=;
 h=Date:From:To:Cc:Subject:From;
 b=nvCVpMSYjfN4yENR5TuzTZ5Yk2uc1cbWQ7+ZLNznJJybkpHNavKtbULKFilB2EQJp
 sulRwEqUJvMLa+nUQOEqp+fkice7SZMj+iDl7HDTCYPfNVj5Tk5mXN4zJEfqdpRl/c
 X5JDxot9t0efjPPVnkLzGmhilbQoMSlgg4UN9Va8wzzw1yOuuLmj1OPfb4/tezE13d
 Vuzslo/+GnqJBDQK88sruJMQ/OfK718Lzsb8RyBOEWBxUzCvlgNkjykj7c/4l69YxD
 D/+xKDSHH5jMQ2m4EhluUi1p5z1zpKY5yxxjnzoYxjYZYZCmK611cMkULRoqjfMfL/
 hLKqjq++XrkxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4c187D0MPbz4x3d;
 Tue, 12 Aug 2025 08:14:15 +1000 (AEST)
Date: Tue, 12 Aug 2025 08:14:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <20250812081415.7afe541e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tiSypBZkbj40cTkR4dplYCD";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/tiSypBZkbj40cTkR4dplYCD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  216d6d913861 ("drm/panfrost: Print RSS for tiler heap BO's in debugfs GEM=
S file")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/tiSypBZkbj40cTkR4dplYCD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaazcACgkQAVBC80lX
0GwUKQf7BSOQHJtMMsw+EuxvA/iEgdY2Hm8QBQycMz1okKcXAvwaQ2PH2njHKgSC
LRlLnBgWx83SIOK8FgoWKoRw8SbGDlX1+fBkeeVJQBrpfsxI1VcEpKchoqGFiQ7L
H4KaQQJSZQKOklTYTYTtlvRK96xrZ8mAn0A71mIzh/0coY0KodhMeDnoZuwZBnU6
bfzS1zMF7DmD/ZOnyUt1ky7NUc6QM+WJjbq6M7Jm4AcKGcjr0K6suNZew1TQqd3N
dcnoodSH9KbI/iovuLmNlmglk34jLFnb53O4oKsJASR8js+ZpN8uuwy+V6ifWDaV
Dl+rVTR/6SYmFbW++QOEpAp+5wZ63g==
=jSrb
-----END PGP SIGNATURE-----

--Sig_/tiSypBZkbj40cTkR4dplYCD--
