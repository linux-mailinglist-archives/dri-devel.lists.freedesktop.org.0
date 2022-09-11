Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A855B51BF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 01:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A49D10E349;
	Sun, 11 Sep 2022 23:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3F210E349
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 23:02:41 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MQlcW1zDSz4x7X;
 Mon, 12 Sep 2022 09:02:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1662937356;
 bh=XcD02g+2VLrIcmv2y3xbpr4sIDsh8ybI5yjoIVEUoZU=;
 h=Date:From:To:Cc:Subject:From;
 b=XT2XZrip8S7PxrVN2h93XW2eMwYI8le7JNAzNQJO0dUbDXAcv6/SLtzrCb/3+4YG8
 sCpEUnGaouB4p0CTvBlTnTxo4g0f99u6owEYuVKqywzGEgyItJ3ZzWd5mIjDA+Cq1w
 JDEup/M4OIOqJmVKEekRNq14uXQzYxNAJBOWV6+BxpwxIsnW7bczVnLc/NE7qi1AzV
 dHT5jSFmbDySHBFr5ojOLoAduwZtbGQLKaojyCraaAfIEZCLsZTs0eyUoCKlZc3i13
 TUrpVvXIobMLG7EdEAO1QiQvBuyNjOkrbVdPN/JDdnSY3XUYgUZkdl53Cwdi9/U70f
 ZwIvjaRaGmIAA==
Date: Mon, 12 Sep 2022 08:54:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Fixes tag needs some work in the drm tree
Message-ID: <20220912085206.569a3360@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yoIvGX76KBPMiG01tM=YNPt";
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
Cc: Melissa Wen <mwen@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yoIvGX76KBPMiG01tM=YNPt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  89b03aeaef16 ("drm/vkms: fix 32bit compilation error by replacing macros")

Fixes tag

  Fixes: a19c2ac9858 ("drm: vkms: Add support to the RGB565 format")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 396369d67549 ("drm: vkms: Add support to the RGB565 format")

--=20
Cheers,
Stephen Rothwell

--Sig_/yoIvGX76KBPMiG01tM=YNPt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMeZy8ACgkQAVBC80lX
0Gw1/gf+LNKi7N7Ozr/Igt5ji+dhmr8YCSahNPRK4gEJEG6dukc6famYWQN+EFud
Fr6nOViWfH9zOfv+qWg7yiW6F8zcuP7KUiK7V3sM8bgyv+zjj5UOtBZQJ8HjY7Ao
Q2KtTNM4fkha8aMwRE5AdP4ry7VwTehDgC0eDVXffT4DydHsebQYQJF6ft0ZaUZ+
3Eup5WDUARFPQoco2IDrAmwjLUwVpz95oIsyPDgiKFRndDoYmhbuCNcemJrBFdTq
MfNBMl2kca62brCUvxMK+FsevzqDDnretJY71xUcDMwUOeqDsIsisLUmlAYdXyqv
8SAGxHBuzVHKpJAqw8nWUtOr7sfzhQ==
=oaAm
-----END PGP SIGNATURE-----

--Sig_/yoIvGX76KBPMiG01tM=YNPt--
