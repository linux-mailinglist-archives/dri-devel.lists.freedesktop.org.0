Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47B7EA7A6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 01:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365B710E43B;
	Tue, 14 Nov 2023 00:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923210E433;
 Tue, 14 Nov 2023 00:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1699922558;
 bh=oBBTsaXc9YeJpDqWn0wKz3EGpJ3XotJaUxbOqFIrCyM=;
 h=Date:From:To:Cc:Subject:From;
 b=ho1eu3c96EU53N7A4ZAkD4t9edVZ+ZUalrYspy4yo8Iqcm1uGgy6r4O+igbiVd/MR
 QJqandXkCNKC4G5Kjn3T3z5maiVKxoYzeSrK2ZWeerr2h3GoOOV+8NNn6A+4fLBxwg
 /b3nsgfzn2YsmGPQ/7gWEyX+lCTcDC/+BuHLrLBlM5UKOrswJm2tH0UTt8Zdhjlxus
 J3CyS/dpnHNKRC3WyHoCS3O6aJJBuelhth0crYyOYvENJM2SCjBY+glCteov44bSei
 TxrY5xowId1xP8sacleh/L7FDZnq1hcQTneuj6kNVkWkbP0vPxPXdULQBGmwYlevux
 LVGuMklckpl7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4STnZP0yg0z4wcg;
 Tue, 14 Nov 2023 11:42:37 +1100 (AEDT)
Date: Tue, 14 Nov 2023 11:42:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20231114114235.3686590c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9aF7._9zYBr6wC0X4q8Z8No";
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9aF7._9zYBr6wC0X4q8Z8No
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/tests/drm_mm_test.c

between commit:

  2ba157983974 ("drm/tests: Fix incorrect argument in drm_test_mm_insert_ra=
nge")

from Linus' tree and commit:

  078a5b498d6a ("drm/tests: Remove slow tests")

from the drm-misc tree.

I fixed it up (the latter removed the code updated by the former, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9aF7._9zYBr6wC0X4q8Z8No
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVSwnsACgkQAVBC80lX
0GyIxQgAlg5b9ZM2tn753oZAS+JpJq68jast32b8gpdw8EdIXJvEubsEwndyeqfK
Ff/9z9fB4SEYDaO4Tcl4QjYi+SZSoeFVSJpFv+14fvfHkomiSOJUHoHHkpXEfq0j
emaLFcsG9ls0LlRIMsnP9FYG66visrSE+wxu+ClI4sWwxgn12A6m2Q2C/kk9jClK
yQX7h9EYtRj/LxQDULMEMHiLmGE3QF4vK624w1IB8SxqShquBdMGtxS5lUEebemA
o7MblFFXgLO+F5DeU0ofYBKMUytt/3kb6g7G/ZQDiUk3exiqmbvCxCqtxs88XX76
PZyjpMFAixilGyVzLvVwJzIVsVY3DA==
=MRmX
-----END PGP SIGNATURE-----

--Sig_/9aF7._9zYBr6wC0X4q8Z8No--
