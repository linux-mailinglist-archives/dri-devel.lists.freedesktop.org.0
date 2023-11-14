Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BAE7EA908
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 04:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B3510E1AE;
	Tue, 14 Nov 2023 03:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DDD10E1AE;
 Tue, 14 Nov 2023 03:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1699931839;
 bh=Z0EFS3hnmG2u27TK88LgVU7Edo6fdgtR3YECgUWG064=;
 h=Date:From:To:Cc:Subject:From;
 b=RgSCwePXHTNU/Ja1e1K92cQQu/P0cUdn0V6VA6HBhcBlGMXUcidPemNKrCdRwm+p0
 ff5nk+xG7AGPZXeZBl/JORc/kzb96/gWuiidAOHArtb7y/EMEic/tLfwls1yWNRWEE
 MaED0H0lJjptvzW579cUY1UR9dHefnAqs5f3aAnwPEuNJF7Wa3Blff/gbOyaeWeJ6u
 YwXzzLmzGTWK+Xmbu1J0N6zoSIQHQ0F8YKkg6DlI210EBsqXYGvkg4rAEqFYRts9vW
 EdJDN6Nub4mrH141sD7epULlo8kHjK3X1qy0O+GZh5UykGL8t2i88PGMKw31A1cSZH
 gIiNrXKrHOLgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4STs0t4GpKz4wbh;
 Tue, 14 Nov 2023 14:17:18 +1100 (AEDT)
Date: Tue, 14 Nov 2023 14:17:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20231114141715.6f435118@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aSbjbRycQtx0rC7XYfscAHz";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/aSbjbRycQtx0rC7XYfscAHz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_t=
opology.c:5484: ERROR: Unexpected indentation.
Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_t=
opology.c:5488: WARNING: Block quote ends without a blank line; unexpected =
unindent.

Introduced by commit

  1cd0a5ea4279 ("drm/dp_mst: Factor out a helper to check the atomic state =
of a topology manager")

--=20
Cheers,
Stephen Rothwell

--Sig_/aSbjbRycQtx0rC7XYfscAHz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVS5rsACgkQAVBC80lX
0Gwj/Af+JJWE7uObLo6eNjrcqLLBmvpt16xn+O585rpOtjCALkxnb9lRyF+oK1PD
mjX202RJ1Pxu+1wuBv9MMnxQRueVg4dSmmBK4echFrXwaRePrsVbJWUOxsm5JOxV
1iMXM9dBFiXbfQoszTMGVtgSOeGe21z/xVkI2ZqWxhYWzV4NqIYtBwqNHPaZezRE
cROHQwDrKumPTiQ3+iYPpD66JoCZf8Yf3RhI6I8apJ+8QFyNqmctx155Yga4ejk/
iMsypUVCkrTmGFPC0PMA2GPnuzkqq6cO1EvNehITmp2gs23mKmnfMFHFFnsPehIE
yXf81OVj1lC9W7pSqdZBWJCo9xwQOw==
=2Zys
-----END PGP SIGNATURE-----

--Sig_/aSbjbRycQtx0rC7XYfscAHz--
