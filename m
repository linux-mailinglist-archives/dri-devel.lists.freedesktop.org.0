Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77DCC0651
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 01:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895BF10E613;
	Tue, 16 Dec 2025 00:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MCauIm77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EBF10E095;
 Tue, 16 Dec 2025 00:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1765846566;
 bh=Av1sDNl6J22CoMWUcRKF2c9hCGb98iZLSBM4m7fDUPk=;
 h=Date:From:To:Cc:Subject:From;
 b=MCauIm77Jo9W+mPwyTJcSEfyw1xKbHupyWHNPsduxr1WFY4htLgTXpW5+qXcCiJQb
 XXB/tZ2GNbxG4pIti625t/rDUAlZW10i7TUTtMvvU3Hmz2MGHt/a6bl13MFMXHDJ76
 vsxX475aoIY/hVbnRSKv7c3nqlE0gcCM3Q2xgjdHsPNbYbYJmNfGQ3hGyJyNScIyHA
 Gv7QTwbQn6jOhN0ZCqjdrbfw37uojmz2SfN5VUsJzZpsTlTNWegj6NDWPFfxJsy67n
 q+zXLbAAwoCeZsD3NQyDVr2biwYIBhF/Rqg1rdaG8pDQE3rCOhfBZAVUAQeDnJWBF5
 tuCvytUZijxFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdlp0tN2z4wGs;
 Tue, 16 Dec 2025 11:56:05 +1100 (AEDT)
Date: Tue, 16 Dec 2025 11:56:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?B?TG/Dr2M=?=
 Molinari <loic.molinari@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20251216115605.4babbce0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aP9/UOHhZ+JPpr8SbsozNf7";
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

--Sig_/aP9/UOHhZ+JPpr8SbsozNf7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: include/drm/drm_gem.h:510 bad line:=20
WARNING: include/drm/drm_gem.h:514 bad line:=20
WARNING: include/drm/drm_gem.h:510 bad line:=20
WARNING: include/drm/drm_gem.h:514 bad line:=20

Introduced by commit

  6e0b1b82017b ("drm/gem: Add huge tmpfs mountpoint helpers")

--=20
Cheers,
Stephen Rothwell

--Sig_/aP9/UOHhZ+JPpr8SbsozNf7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAriUACgkQAVBC80lX
0Gzeegf+NR3IO1MKa7Sz7GywGnG0Tu5B8TrQvuXvmbqFKiZUikx47x4VeyeKgOWn
tUi4ZFQ8o8cqap9k0/4fK/Cs9PLnoqfeCMhoRQlaZTkGJOAPYVDk/gibdtUkA9Rq
QQ11maAkDbObklMJ8GkljOeQphkX3crR4HGw9KNjLUBpZ6PJejq8ygbSPtzQD5KU
eT5TNMkfW4Q/PhOeQouWVDdhKiulnx67av8YrTHR9HhLtpWz/85Ofli+/Q9UnvjZ
/IEyF8f+MbyKLCUOkQGghs4YSSfl6ofctZ1RCXFDxZgtCS5Sixy5S/v8t4JiyUS7
1ELffnwdKOXSbfXuOJgwUIam6UqT7g==
=NtY3
-----END PGP SIGNATURE-----

--Sig_/aP9/UOHhZ+JPpr8SbsozNf7--
