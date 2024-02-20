Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAB585CA92
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 23:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D3810E1AA;
	Tue, 20 Feb 2024 22:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VXpgYBhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7091B10E049;
 Tue, 20 Feb 2024 22:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708467418;
 bh=MSV4s90BpjRSKLoKbRaEbAIXDqzjjF4XClQSmwPKAR8=;
 h=Date:From:To:Cc:Subject:From;
 b=VXpgYBhex2o2FnruV5bneTXRDInXqsX0RLCJuVpDR9YO67fmd7AKV90HiL/og5cKU
 FCo4HACr4asFYWJVplLipquo1iAClskjE3fRx/NxUB5M4nnJxvOKSn8XnXQRXqZMFh
 vDVWzsyUK3MP2a0uLNWiwWS63N6g8tb/7cjud11rm5XvxyLYoL6CjxEp6UHxsy+O/c
 izSGW3+GjjkY+3f0h/E7dZTZKv5NsU3FRSKpDP/c2HcgRaOLeOIc8vg6OwOZ7ib7X7
 9JJRvJAtzXrRB1pD7ikpLd0pdLFRXNqcziqFpkWp5FK/d1KNlBnsHOvEM98tKrh6tI
 K3oCDWEcEYbag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfYfd74Bsz4wcC;
 Wed, 21 Feb 2024 09:16:57 +1100 (AEDT)
Date: Wed, 21 Feb 2024 09:16:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Auld <matthew.auld@intel.com>
Subject: linux-next: manual merge of the drm-misc-fixes tree with Linus' tree
Message-ID: <20240221091655.2937adbd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F8R60ml85Z6nr7dU8JqHvdy";
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

--Sig_/F8R60ml85Z6nr7dU8JqHvdy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc-fixes tree got a conflict in:

  drivers/gpu/drm/tests/drm_buddy_test.c

between commit:

  fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")

from Linus' tree and commit:

  335126937753 ("drm/tests/drm_buddy: fix 32b build")

from the drm-misc-fixes tree.

I fixed it up (I just used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/F8R60ml85Z6nr7dU8JqHvdy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXVJNcACgkQAVBC80lX
0Gysqwf/ef0qLJRLq8wnSElTxLDdQIYFArrCQI+ln5O8MTFlwqGAjuoxb1t8o0Zr
E9WcMGK5hNHzyhTt5cshF0sjU3MlV9FkPosxitExE6qOT8IwlIsBykFP/7KgjX+Q
GPp/vqWBGLbm2R4w0LvwTGWfKZFZ3Ht84bsND4w1CMr69TW3ors5sMBDcT7MIYQZ
7V8rr4dScDRI3m7Dyv4za7dRBBnd4DxWzIZ5Mt3YEMVYiKVh34JJMW5fqQfF+UAf
BzX1IY90r9EPyiHB6kD66KYAILOPQ3o0j4V10d0LE0UuViowWfNJqPtgqJeTRCiy
ik3IwvL2ymLi9/rwVfUu6thvlobtEA==
=VuOE
-----END PGP SIGNATURE-----

--Sig_/F8R60ml85Z6nr7dU8JqHvdy--
