Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11F598E8C7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 05:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B535810E1B3;
	Thu,  3 Oct 2024 03:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Iq7hVYZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E4E10E1B3;
 Thu,  3 Oct 2024 03:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727925705;
 bh=3But7r1sXT2u7SMOsDvX9wPfXK/1mGmcZcspAumOfBQ=;
 h=Date:From:To:Cc:Subject:From;
 b=Iq7hVYZf9ZuTlmjJfVhpYI+uxuFjtbqi2lDnk5amJsTPyYCwXEW6agWWC1pBfZN7g
 2M9FVAxI5FGmhGU4HpsudjODm9w19nVacGq/sETDZijjTlIhHxVXR8pV23lz81KZke
 +MIl8ZXFs/pVDVVJ7Oip9y0ENTXwoRLDbGcWqsnSUGcaYm0TjbYsp76+7dGayDpFTn
 wLcrPKl4mu9rleF83PRubTuYjKhR2qLZl7MNM37U1koi5p9ekiI9BMb2kQ7Qu2sD/D
 R7o2YO4Per+HcdkO0YgyUhgHUWjrxmrvCZZRolw9gH6JyPFgxfbINqG+rIWyjvG82z
 wbP8o3Rnfea1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJxmS4JNhz4wcy;
 Thu,  3 Oct 2024 13:21:43 +1000 (AEST)
Date: Thu, 3 Oct 2024 13:21:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241003132143.71749ee6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wZKGET+VsnB9B5ixS4gG6Cu";
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

--Sig_/wZKGET+VsnB9B5ixS4gG6Cu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/panthor.rst: WARNING: document isn't included in any toct=
ree

Introduced by commit

  6a797bdfde77 ("drm/panthor: add sysfs knob for enabling job profiling")

--=20
Cheers,
Stephen Rothwell

--Sig_/wZKGET+VsnB9B5ixS4gG6Cu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb+DccACgkQAVBC80lX
0Gw70gf8Do5sdWCHaf4ie3YV7y8ihS4QaTHdVnwPvQRjCM/GKlG8dbTa9ueiXgzL
7975AtFRSric+D+bHy6e7zb56ZlXr61EUW2ohrQ6t+A37/3Noju9mRMbKqtuE0+z
hjUVZTfwdvFxPGk8hT/PgY0Qyz65j/PPhWSAJekWi7U4YWrL295oW+wjjOmD4pVs
i5tkDVi7A8+J9FhTMpIx3omXq/codd/z3il1lOOm5wFyZkTi1Z+8gsiTECA7g1Jp
4SW2PPpDHNCGSro7/vVyqtrjWOPsUBpUYftV2KtpCw3GQ9ruhh34oH58dkXa2Ehn
D0S6NjkWQ/sZ60xtYy9ZI37+3ZuvFg==
=bEez
-----END PGP SIGNATURE-----

--Sig_/wZKGET+VsnB9B5ixS4gG6Cu--
