Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64CB06CA0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 06:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0226A10E664;
	Wed, 16 Jul 2025 04:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kI5NccFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6D710E656;
 Wed, 16 Jul 2025 04:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1752639691;
 bh=QXzOlzpMhuicZJm/uhmVqXSqoCfzCxwys9ceX9GeYnY=;
 h=Date:From:To:Cc:Subject:From;
 b=kI5NccFhPT01jPu2mDvgUh1v5hv013uCfSWqSDru98ABSARb/wiUaT/za/sBK/AZO
 uYcJepRANMgIOqN4Fhf2NDw1nc8/vEj4CaCu+3RLZQkZEHHVgJQD0niajaH4LNGfmN
 t2VdlsMazBiHlR5TDeIXo8+R6ZaMvoJKCiFx1Wmp8WxKqBze1lZ1to4QJqCjIfCtuQ
 COJN4MTz0uiCstf0OFCuF2ALdmF6i1MxVAdhI9eZ82/sjnUxhAZppcZCesx9Cdw8QG
 NU6icaAElp51jWy9m5NczUmZGPtlrBnXMvytqxO4mDYkfp7HgOmOPCFL2mBlyynt/o
 IBDcSyXKZL3PA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhjYN2vC0z4wbn;
 Wed, 16 Jul 2025 14:21:28 +1000 (AEST)
Date: Wed, 16 Jul 2025 14:23:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>
Subject: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <20250716142322.3a681368@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nIh5oueD7MGI6QtG1+F7k8g";
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

--Sig_/nIh5oueD7MGI6QtG1+F7k8g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/etnaviv/etnaviv_sched.c

between commit:

  61ee19dedb8d ("drm/etnaviv: Protect the scheduler's pending list with its=
 lock")

from the origin tree and commits:

  0a5dc1b67ef5 ("drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SC=
HED_STAT_RESET")
  8902c2b17a6e ("drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the re=
set")

from the drm-misc tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/nIh5oueD7MGI6QtG1+F7k8g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3KToACgkQAVBC80lX
0GxuWQf/YWf/c+mB410Q6KTkfTHbTTyv1OUX7kyvLpDv/qmHKQD5mQVSJUEd+uzA
ncNzKo7rrVJsy06lzgVnddr1bx8cj+j2jF7GKwiCY4Po7UWXH7ISVryV6XmY7jN0
Vy7OEqMhzCz6aP8QvkWz+6Q373L+cSqK9FgvsU+fqROGNBPlPHcbgDBYEA3ZbJM3
ZwFl1Ve7dLhYeZgZKwkX0rUIBUPJWm2Is1nSy6E+aUkepHwwYjENYdxSj+S0fbIN
foOoz1tolzWy+pLceDW33AyhdXSLGIkynpvcoZ5nmmB90IEo9vwpSBz2hWdWkRKz
043mvOVHKUL/BFCTE7lQxMYWXVE/mg==
=Pqeb
-----END PGP SIGNATURE-----

--Sig_/nIh5oueD7MGI6QtG1+F7k8g--
