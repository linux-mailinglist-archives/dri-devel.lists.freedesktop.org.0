Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45711CF19DF
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 03:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251B610E183;
	Mon,  5 Jan 2026 02:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bxbzuZiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA0310E183
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 02:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1767579369;
 bh=9RzXzUvt8/QuFi+IRhSWlUXRQrQLYf71/r0RyEr+KcU=;
 h=Date:From:To:Cc:Subject:From;
 b=bxbzuZiFEPDJvbADVOGfdeUMWlQiAu3gZgTFUD+nB2wguI6xjW2jShOTYD7eKMhn4
 QIHEydmji2sarKmQRwdDuf8ZvJ5bucRg3J+dI97+2y00KrSzG0ZgW299sMcWcsVPRh
 1yyXRvYvNBkbPT3tfgCpIkOZEFLboujAv816cPxnZ2e/220CJilizXACvO48TC4SHK
 P5XlV6z5ZWYx5hu5O1sxUXRNpov2ch/wSA9jKOuPY+xSgzpu09th96+tcoCIObyahb
 MIIIGx+XVjzhmbCqEN55qQciBaVHmwZmGk2/g/ct7P3rmDQf4O1QDhNk0H1AXKzm1Z
 RFtXPdQuqwSbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkyZw2hbwz4w9T;
 Mon, 05 Jan 2026 13:16:08 +1100 (AEDT)
Date: Mon, 5 Jan 2026 13:16:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20260105131607.718d22cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/spBOp=R_D0r.2JHT056REcV";
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

--Sig_/spBOp=R_D0r.2JHT056REcV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_gem_shmem_helper.c

between commit:

  8f05e411aee3 ("drm/gem-shmem: Fix typos in documentation")

from Linus' tree and commit:

  b440baf35591 ("drm/gem: Fix kerneldoc warnings")

from the drm tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/spBOp=R_D0r.2JHT056REcV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbHucACgkQAVBC80lX
0Gzg/wf/fosau1ItNUPRa9Dabe9bg73+WF+vMUUw7I53wWqRskCtVeBGPcIk/gXd
twoLgeNBuQ6nBFRR2mqdl/K2lkiI0M9xVlIe1M7GPEQNUImYn5d++S9HeGx3wOIC
N4PBL8/xtoF99kobOeUeU2txANfWDpNztToweO4bV1orlqIL0HevKwEYdtINySR0
bZstxvNusDkxHF4PRb4W/Z+ulooCdigShHm4MfwuFKCOf9/RIVfnnW1ctKIpzGAp
Jtu2up+ekg/wAQVgRh7VyZ4lJZMbtVjSQGJ3Xxg9EcA8NzRGZo6Pnm/bEYgD0vuZ
khupYZc1qvD9Y3MPULZiv+R3yaiqSQ==
=s4D6
-----END PGP SIGNATURE-----

--Sig_/spBOp=R_D0r.2JHT056REcV--
