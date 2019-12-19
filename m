Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB7B1260D5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 12:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E016EB4F;
	Thu, 19 Dec 2019 11:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F3A6EB4C;
 Thu, 19 Dec 2019 11:30:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47dqS80dMlz9sPJ;
 Thu, 19 Dec 2019 22:30:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1576755033;
 bh=6lBsCkHyaN0GoUoK5YulVgcI4GDTGjPtr5Z7BZ10PVA=;
 h=Date:From:To:Cc:Subject:From;
 b=TS12gv9GC0kxPJAMxsqZrOVOVNgj39/e/bSIOmXMqC+lDLVUK/qR91R/n7P+9r1T8
 Bj9OZvyeEVAnWGaKYGCVIabn4YsK7nCJ1GBwZ2kEq41hQaiP5AKw3gT7QR6NFE4wa6
 sdUZx8An50ewUOpOFjmtsfglzGdwv6yU60QlCno2OdPFT9zyTAwTdkCb2gqzxMU/jQ
 lWtvLnPiz06dph5B6g09oJJrgoXLb2g+ijzBGZFybpFRSZvnK/tAqiTuCYVRcxqjbx
 ulXDUgvtVaA95aOVpld9JqtT7vUv5fMGOh6m8Hg+2hJ/LpMZyAby8MCiapzx8i2zgC
 0PUlgcTVC3j8w==
Date: Thu, 19 Dec 2019 22:30:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: Signed-off-by missing for commits in the
 drm-intel-fixes tree
Message-ID: <20191219223030.1747f04b@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1375305256=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1375305256==
Content-Type: multipart/signed; boundary="Sig_/PVy.JeA=7gTRi=texyQFMjh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PVy.JeA=7gTRi=texyQFMjh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  987e379d7500 ("Revert "devtmpfs: use do_mount() instead of ksys_mount()"")
  9bd5ba4fe25a ("Revert "initrd: use do_mount() instead of ksys_mount()"")
  fa31001c96ad ("Revert "init: use do_mount() instead of ksys_mount()"")

are missing a Signed-off-by from their author and committer.

Reverts are commits too and should have reasonable commit messages.

--=20
Cheers,
Stephen Rothwell

--Sig_/PVy.JeA=7gTRi=texyQFMjh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl37X1YACgkQAVBC80lX
0GxWlgf/bAhMqppXRsR38Gc3y9hw0JI708FL964r+7yrzRrkj7VqrGPnXQDnUyZY
jCWlrmN1n/FFcQ5WLN56Ly0ZRIx7naaVYKNN2Yg9fAP4fcPX36WnvYOd/lF+XORZ
yF5LwD72vMISD07Vq4s8C+oqryZQESJzQPjb4hwS0Bd6/vzv+lnis8ECPO/pSMrE
5x58r4NcN/YcB83+NxxdakBI1Q1hxRX9b2vRwXFmHWzuD4OtxfcnFb0AiFV903G9
dCRVEAAy0Mx14hQq7cOEB9yzJka0YJYoLUwld/u9WIB1t6wWGRgkinz90OOrWL2e
iRUhZtFzNOBNJdbe9XJDxIfYlBY5XA==
=96zL
-----END PGP SIGNATURE-----

--Sig_/PVy.JeA=7gTRi=texyQFMjh--

--===============1375305256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1375305256==--
