Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486EF20EB11
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 03:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BEF89C51;
	Tue, 30 Jun 2020 01:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90A89C28;
 Tue, 30 Jun 2020 01:52:13 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wnR86K8Nz9sDX;
 Tue, 30 Jun 2020 11:52:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1593481930;
 bh=haJsUCTl3HXOuqQW+RwIUPwO3u5ZbxUOYuPPlYz2MkY=;
 h=Date:From:To:Cc:Subject:From;
 b=Fm8s6BH4ANPG1t7ms3hWULh21qdZu2xbZ5RHbUmbonZe7c+S7kuPYBBpGuqW3E9de
 R2RvxspH7pqkmVwAFrplgYuAoFaFZKHbWFA7uahGEOtTCi9glUvC6vpGd1Ks5WdtMO
 8Z1QiikuaOjAO3sQFailjKePovZSpgOIv5NKM/A1kt0F9mTBOXHwQTKe963wNOPMxR
 wxY7zLp5W5T3Kx/XCzayaNuwURIvAynjPpOQWfNot42qJqZ+7Di2QwZTmhgqF9f3z8
 PEXxdEyfWUaNc8MvDlylYM2GAV0psJrFz0KpWLzdJ4cpY7Ast7dvNJKexm58kCIwHm
 urNbzzKGheFgw==
Date: Tue, 30 Jun 2020 11:52:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <20200630115202.04c39f9b@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Colin Xu <colin.xu@intel.com>
Content-Type: multipart/mixed; boundary="===============1174332799=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1174332799==
Content-Type: multipart/signed; boundary="Sig_/4fPofAu7Md8T4NHp79C0oXC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4fPofAu7Md8T4NHp79C0oXC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/gvt/handlers.c

between commit:

  fc1e3aa0337c ("drm/i915/gvt: Fix incorrect check of enabled bits in mask =
registers")

from the drm-intel-fixes tree and commit:

  5f4ae2704d59 ("drm/i915: Identify Cometlake platform")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gvt/handlers.c
index fadd2adb8030,26cae4846c82..000000000000
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@@ -1731,8 -1734,9 +1734,9 @@@ static int ring_mode_mmio_write(struct=20
  		return 0;
  	}
 =20
- 	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) &&
+ 	if ((IS_COFFEELAKE(vgpu->gvt->gt->i915) ||
+ 	     IS_COMETLAKE(vgpu->gvt->gt->i915)) &&
 -	    data & _MASKED_BIT_ENABLE(2)) {
 +	    IS_MASKED_BITS_ENABLED(data, 2)) {
  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
  		return 0;
  	}

--Sig_/4fPofAu7Md8T4NHp79C0oXC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl76msIACgkQAVBC80lX
0GxjXAf+PDgs9BZ4I0/T1J1Jwnp4cQHq+tdnzow+RsWfWh57G8b6de2+iWwGoOZ5
AtAIEWvlxl8NLPqpislhRpx9hBk3Aob/SLYAuQL94xD3stAqm5HnpprFxtKNLC6X
30oiw0K12JvOfTZ7KqzCCh1LrbERmhgx4+DJBqv/hy3L3Okg6MPfoMEX3p0kHn01
udqw1vlTf9ruOwMVIX69mLAr3E2Q3iMXbbwhXPiQPxby1ZkmGfGtGUfLesYxKp13
umLi0qe7AQxO27lAtDLxL0yvWEP94iH1VuhQtWG9XhMO1gU7+hvrBmjRmzxJF0Xq
GxkdgTRtqBENst7A35lvATu1OzdhmA==
=GyE7
-----END PGP SIGNATURE-----

--Sig_/4fPofAu7Md8T4NHp79C0oXC--

--===============1174332799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1174332799==--
