Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F498CC0E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 06:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E8110E671;
	Wed,  2 Oct 2024 04:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hARbMrV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7528210E671;
 Wed,  2 Oct 2024 04:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727843511;
 bh=jfRgLzoGzMEd9UHs94vk7uEPZjCwnEji6sh7OEzSbE4=;
 h=Date:From:To:Cc:Subject:From;
 b=hARbMrV52CqOXx3ZVKmCEQLqIr9A8I4knRsreRcksFJaRjVWk4sbXrA74lUxt68z8
 A3EiJUZjVLjaZL6Ke4wJX1LRWsbagY5J63Zz3+68gh2pdo3Wxc3Fow1bcAR5JL7pW4
 Rziz7c+KrvPwXQYHKKB77znjq9gfpoevevF0IHQdnZ1POmPJ8IbEmzawrMO0kTr31W
 N6Icqywv5g7B6eJyyGFPk3n2laO7IK4bfpEQ6p1qtHFBP/KG9NlRao1rTS6FLGXmX+
 rbqNZBI2NwwpL2F874UR31w1JdiGKpLRgq4/aVibdIIJJ5/IkeYOetvlWfFWT4Rat1
 JqkGKR6AIoYTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJMMq3Sfbz4wcj;
 Wed,  2 Oct 2024 14:31:50 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:31:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002143150.4349be48@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SlskxYWXGL+HkRXwGfGWHLP";
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

--Sig_/SlskxYWXGL+HkRXwGfGWHLP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:    =
      * @fbdev_probe
include/drm/drm_drv.h:435: warning: Function parameter or struct member 'fb=
dev_probe' not described in 'drm_driver'

Introduced by commit

  5d08c44e47b9 ("drm/fbdev: Add memory-agnostic fbdev client")

--=20
Cheers,
Stephen Rothwell

--Sig_/SlskxYWXGL+HkRXwGfGWHLP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8zLYACgkQAVBC80lX
0GwG8Qf/fzKZo0zZNycOsMAZSnkTDrZQESBPOX6pf3oJpM0I8DH+XUHG38ZBsgZc
00tUBOFLiD5HyvOktDYW4PLNAasOtZ53g9EyX+Xk3yHkQHU114ID4H7VbhoP8JOs
1hGnsZUx/+OpqDqaqeKIhqPg0hmrxQUUGUnp5GxmLhDiI8Lg28znnwIWnzUOuy5V
4Xl3WelmuH4Ts0uP0zxdh9IO35PXOha5zyUgP+ITx/jK/UKF/d73wm/PqeW2qwEz
eU1SsKO5q+z3iU4PGr9wkPoac4WYAt6IDCj9DTXnBLx9cM3dj8VGdj6ZflYQIQdT
IxLQrBIGU/jszz+/X33QCXNHh6gOiA==
=VCeC
-----END PGP SIGNATURE-----

--Sig_/SlskxYWXGL+HkRXwGfGWHLP--
