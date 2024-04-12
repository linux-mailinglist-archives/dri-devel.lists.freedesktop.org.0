Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7972B8A2733
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 08:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEFE10E38E;
	Fri, 12 Apr 2024 06:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F0NQ07yx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A8810E38E;
 Fri, 12 Apr 2024 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1712905110;
 bh=qXSRgwoI/Lc9R2Wx9BxMG9QfSE0orexma7cEd5RYRAk=;
 h=Date:From:To:Cc:Subject:From;
 b=F0NQ07yxUDHk8ejDl6Hu4pSWsASLwOESvCqEbqHaeJg2AVACBchMQMMcOt+rrG+Y3
 vU1i+LfAvwYGr3lypr3AIjxIwlVH1gXXrcXcMQ/Pexf38EHf1mwd5zWUUPGFkopKnq
 kEqsxmyCCNi+z0SQjOZDaZZX5Yq6/+aggK6L8qm1fEK0PNa42kJTy7JZj5fC9YmZXy
 XVfDWGTRUFEfITY/xQ3WbmWNHNjKiImNTIa7RQHvbYtuBYwfQRUEcMYDI7qQbplV0S
 DKRjWGL+EuuqLQDHvH+nva3J+MnXQ7lAPdQtSpiXoHm1wuiJjblJ/OYYetfYtIFduU
 XAPPceEPGYbAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VG6ps5WJZz4wcq;
 Fri, 12 Apr 2024 16:58:29 +1000 (AEST)
Date: Fri, 12 Apr 2024 16:58:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20240412165826.18e8a5f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tY2.spB_SgTGSLvvWZ5aIrw";
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

--Sig_/tY2.spB_SgTGSLvvWZ5aIrw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_plane.c:1767: warning: expecting prototype for drm_plan=
e_add_size_hint_property(). Prototype was for drm_plane_add_size_hints_prop=
erty() instead

Introduced by commit

  9677547d8362 ("drm: Introduce plane SIZE_HINTS property")

--=20
Cheers,
Stephen Rothwell

--Sig_/tY2.spB_SgTGSLvvWZ5aIrw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYY25IACgkQAVBC80lX
0Gwd9Qf+LqI+LoYIwM7wXCo30NPlBxhqrTCnOoVXI8AG1EDedhQdCRns05uUJVjq
C0h94TCqjEahbCB5t1ea/brXblcFQYj7KCT/+WHNscJ+TW7sXav9pFpkkbGpZGpm
Wvgduf3Fo7MHqTTagqZmUnllaazVPBvrwkEapkD+0k5kBkAIIsDT5g4EdsZB10HN
FMJYCv5FaBjWpWkum44wxL5oOIWg4s9taeFTC4l8HVmCU009+HFlrEM2Aio8iPG6
xsg6FSGSf7PxuAkzrekjsORkWt8pMsYjrYLmXqWrjTGO5Bcm74uBxhxBlCw9lC0K
Gm5fraODpN/mcY5BczkNwyNj4HrPXA==
=H44g
-----END PGP SIGNATURE-----

--Sig_/tY2.spB_SgTGSLvvWZ5aIrw--
