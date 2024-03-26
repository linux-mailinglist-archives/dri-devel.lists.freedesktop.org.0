Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E988B998
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 06:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E41010EC6F;
	Tue, 26 Mar 2024 05:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pofAQ7wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D6F10EC6E;
 Tue, 26 Mar 2024 05:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1711429275;
 bh=BZS8B38UoxEfsrQsv+4f+CeflI2wtNmGcp7UflMWLiY=;
 h=Date:From:To:Cc:Subject:From;
 b=pofAQ7wgNwf+39TQ4cr7h/IUZSZ4abkEwYZqJ2ZL6xDuH7bTa2REz0Ll7ZTUpwYEl
 OBTq+CMad/d1AeFJ0AIoEzKbkXX9zNpOkcCLVtI+7ydog6UpdJPxrzm/MgruPWEfM3
 RnX087soBHbHIxldlkVgyQ2XqGxxsmVTJTvV0gVtV4SYOaUYSzy1QAPyTasgQcmrHc
 gFTx+LElI3vreWbEXcjazK9gZYUhGriNCys5G7AnED217ZRMzXNsVf2Nq8mq9gqH7T
 BeL2L8/d1TlcMRKuWMqpstpNjLq0A9GH+YNgOHRbSP2vCMCQCOPNSTzHPT2UdTIGQE
 vsXuz9Vyp1l7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V3d1Q0sMGz4wqN;
 Tue, 26 Mar 2024 16:01:13 +1100 (AEDT)
Date: Tue, 26 Mar 2024 16:01:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20240326160110.4c00e1e5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NHVutHcftGYyKXZT7QaPzsB";
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

--Sig_/NHVutHcftGYyKXZT7QaPzsB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/sysfs-driver-panfrost-profiling:2: ERROR: Unexpec=
ted indentation.

Introduced by commit

  b12f3ea7c188 ("drm/panfrost: Replace fdinfo's profiling debugfs knob with=
 sysfs")

Also, that file does not have a newline at the end of its last line.

--=20
Cheers,
Stephen Rothwell

--Sig_/NHVutHcftGYyKXZT7QaPzsB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYCVpYACgkQAVBC80lX
0GyfEgf/eRSy/oMHGhm+gbLCZD/n8bfQbAGEGhaHDa83QS4uJWVjamtrjKtI444Y
qZn6cfJ7J9dAOBTiht/rgBoAhDKxhiPNeFJj0zsryAytLsfEWRnkjTG5CUvbP9bM
lC4Fi/+ciYmdwnSY/uq2kzryO//bZc9o2EYJiVBz6NTlc3jHNqy0DyNkdgq7+AE2
7kdB0bbanRuxzdNA0aD6JAKpKeQr8UoI7OAnltMwRuKRucYwknYye+V94nzZV673
NDEI8IX9/A/FJMk860TUhGyzGIEcJ67+8mThCgGxKypVqNNbZdX6xBSy9K/A5cDS
KU/qHS6ENO8vaagIBidJf9ORyzd/4g==
=zB0h
-----END PGP SIGNATURE-----

--Sig_/NHVutHcftGYyKXZT7QaPzsB--
