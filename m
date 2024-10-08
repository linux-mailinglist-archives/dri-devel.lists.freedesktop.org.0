Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77739993EAE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 08:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EDC10E463;
	Tue,  8 Oct 2024 06:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Utx4v5Da";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752F10E462;
 Tue,  8 Oct 2024 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728368781;
 bh=sG/byCiHjgnFQwYunXfvNYFt3ZlgN1Siml+c6vJoNRU=;
 h=Date:From:To:Cc:Subject:From;
 b=Utx4v5DaYXtAAL1+0dvP/b6oSqCVtOuQlM1pKZiY+jPMg6GPez/UEXNlABlGAmCq2
 slCkI8R1FHVIJ/ogkkCgGqjJkG4+WxJQRIvTieYYewZ42E7x9CXeQSn+Y366jcrMRy
 7Awy150+UeBwwdBeGSx3O8FXqf5UIXC4whwGKYc/i6rQQR9WZRb2Ndq1HwT3uvYmX5
 tM5540nA9Dls06U8bpurt6paaTsIH6VaqRVQN32juZE4fbqaZxBSo8yCuEtItNQy3F
 vKo7HRajHWS+6G4zGxmz65zYIgLOzy7Q2RPh4cIgWSXbIczs4ECJX8lGFXqx37/d7O
 zXCS4zP6RQ/jA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN5d83hBwz4wb0;
 Tue,  8 Oct 2024 17:26:20 +1100 (AEDT)
Date: Tue, 8 Oct 2024 17:26:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241008172620.6fbd5569@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kKyl1Fx/nkDa0.LzYNSkGpE";
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

--Sig_/kKyl1Fx/nkDa0.LzYNSkGpE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/panthor.rst:10: WARNING: duplicate label panfrost-usage-s=
tats, other instance in Documentation/gpu/panfrost.rst

Introduced by commit

  6a797bdfde77 ("drm/panthor: add sysfs knob for enabling job profiling")

--=20
Cheers,
Stephen Rothwell

--Sig_/kKyl1Fx/nkDa0.LzYNSkGpE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcE0IwACgkQAVBC80lX
0Gz8uwf8Dm7UEpyJb2LcJkH2HvBkj5OvJQ8dxAzCeWkmBFvtQ0nPE3TMlzBlHuW4
bmIcWmWbgKMDxeK0SVvqUvhz6I43Tyo1if6RoDt+pYcf/xKMFgBCuTqlYwzPSlSB
M739DDj27lYfQRu7s3kZbfDON6OyFeHn1goqYC2UBN74dehLPvE0Zv71p/C61pxU
pT50xsVi9DCosUDCX1RGB2Y79EUhsQc/ZrLk4vvho7MI0ThW4lpg39ApN3nSm8Kc
M4x/FDoI9biPF42TP5j9vYupvtQbORPEUuXSJS6Cn098bDQGttEODGHycz7t4VVY
mkpGTudO5k3e5OlcG8j1XYMjvCqDrg==
=kq3B
-----END PGP SIGNATURE-----

--Sig_/kKyl1Fx/nkDa0.LzYNSkGpE--
