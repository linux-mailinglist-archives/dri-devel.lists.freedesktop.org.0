Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8DCF1D40
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 05:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D13410E134;
	Mon,  5 Jan 2026 04:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oCFTD19T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2A410E07D;
 Mon,  5 Jan 2026 04:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1767589056;
 bh=92VY6OEmaTZZIFAl4VC6nS4a/om3Rxq94YffNwRAQo8=;
 h=Date:From:To:Cc:Subject:From;
 b=oCFTD19TmMuKgXIaF+nRUZXsK9H/4SLNgDnk8JjTQZrIMm0WwT5BYCXMcZaOyqid0
 ouXJ5hSXl61tg6TDKl5k1ONSzCCmBBEv3LFdiGt+tPlfgFMDS97ntBS6mGNxV3U6EH
 Cf/fH0VmVyM8HxNzXetOg7pzAWRzrvchHOYtQ1nIcjzDjFYHnqyTknsS2Pb9bXT8W3
 QJiJv/NKunY6uNZKJQRcuxYFETAGgIgIdGY1+Z07wixvCiZ2jcQ0L2yjNqNSHWI1MW
 WadwZPw3oWNo+rGvGB3DCmRr+n5R3CoBEENckbqyp01xBA1R2Ix/YRkOfsTwxZmArn
 vdEp0e9uKm2UQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl29C5NnBz4wCx;
 Mon, 05 Jan 2026 15:57:35 +1100 (AEDT)
Date: Mon, 5 Jan 2026 15:57:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20260105155735.3b4012b6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mQg3VFDK4CcorqkjrtTadez";
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

--Sig_/mQg3VFDK4CcorqkjrtTadez
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1521: E=
RROR: Unexpected indentation. [docutils]
Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1523: W=
ARNING: Block quote ends without a blank line; unexpected unindent. [docuti=
ls]

Introduced by commit

  9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")

--=20
Cheers,
Stephen Rothwell

--Sig_/mQg3VFDK4CcorqkjrtTadez
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbRL8ACgkQAVBC80lX
0GyEuAf/T0+PXVWEAkBFuCVUBXiA1pl6OPWL+FdWThgz+5DP24PFdJNMOsaDhfYf
y11ZPc98EI0yFuQCmxfI2FQq6te2/TZO3FPCIXysJXKYiG9AZz6EUyzIpgQNE8kq
JnveUlv1mUr+iobiU5dBfeuN4xKDmdMP07V3GRc5TMBgIKVskmMbjwuDjpAVvtbK
Apudp/QcXoS+eJWy1PFWGxgei+Zo7njQdnTAhOxggIVH1SRUL2hYpu6v9abRY1jP
7Q6WeJ5jdNdeEOlf8K90fhGpvy4mbpOpjiPp/ybSwmQsD4GqNrGH1SOXYCXfRpgK
LtOW+RqRXpqScJaadtJbvb+1Qeg4MA==
=IQUf
-----END PGP SIGNATURE-----

--Sig_/mQg3VFDK4CcorqkjrtTadez--
