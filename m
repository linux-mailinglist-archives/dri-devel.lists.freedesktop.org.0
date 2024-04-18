Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891B8A9337
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 08:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059EB10F61B;
	Thu, 18 Apr 2024 06:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qG4tXOz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0FA10F426;
 Thu, 18 Apr 2024 06:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1713422326;
 bh=BHyU+uYXr2C2f4ARedjQ04T+FYE4a+tBYG1eM6Frwpg=;
 h=Date:From:To:Cc:Subject:From;
 b=qG4tXOz1fW/cS7vlieBq86Wpnbb+3F2iL1TvYwf3jgY1dtzO8xsDdSwzNdfplk/Pe
 oAUC46Rt2EW/D/JnskwXwV2U4FaG289ukFOX/cO6nnS1nQ5Jpy8Hqo7ya/jP9Y+JCU
 Q3evxdRbEatDyhJT3NB+Io9FU7WojDnmxjBs3Utn03hmWVMBc+iuJN8vBz1QahMGtB
 GG/4xzkji6MArP0Xj91mCDfEt9qAgQ8Pf+d6MjscmtHGUnaI3n0TJ16vqXUD3QiSVM
 iYrbbD6c8u0jTb2riNQeVo/vlqg9NGEwF9/aaTJ2iyQCwEINlqJqz6I/OfofT4ToeK
 o+ylYl7vYU/tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VKp5J2Q84z4wyf;
 Thu, 18 Apr 2024 16:38:44 +1000 (AEST)
Date: Thu, 18 Apr 2024 16:38:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Luca Coelho <luciano.coelho@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20240418163841.3e9afb94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j726xbuXFUq5Ng.BccLOo7W";
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

--Sig_/j726xbuXFUq5Ng.BccLOo7W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/i915/display/intel_dmc_wl.c:1: warning: no structured comme=
nts found

Introduced by commit

  765425f598c2 ("drm/i915/display: add support for DMC wakelocks")

--=20
Cheers,
Stephen Rothwell

--Sig_/j726xbuXFUq5Ng.BccLOo7W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYgv/EACgkQAVBC80lX
0GyEUgf7BziEcbp49SKj1TRqssoS2tLgh0tyioBmhaIkyrdd7pCBOaF4Vmr1jdNO
dHBNbxpWo8wG7+fzbguk/ApIfJy3c0YJxI/IG0PxxiGCgucxGtr324KzW28RSdfO
SGD3e1DRg3zo5RbkPyhlggCmRgiCc0dc1VVqvTYc2Do+qfWcf+BBU9eeg1B/Pcb4
HfkWHZDY+6FsLNjWG/FIcfFd8HWtwDqGufSU2mqaaTlCAQDJYgmPLaF916LZMZDH
GQLJ5xNGNATrvEQzQHK81lOFZdGeoqy4RRj9FneFek9DkoohJGmF+aygDSSnR9GN
wEZ4amvIaqmVAetYNSBjOLBMRhjpSA==
=ya9W
-----END PGP SIGNATURE-----

--Sig_/j726xbuXFUq5Ng.BccLOo7W--
