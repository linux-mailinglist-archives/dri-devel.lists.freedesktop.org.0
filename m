Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705098CC00
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 06:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356510E077;
	Wed,  2 Oct 2024 04:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gIJIk0bq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B689510E077;
 Wed,  2 Oct 2024 04:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727843173;
 bh=XreBBvYmR+1f68rr88+alfR05GRP1Yk0OyQkCRNnLHE=;
 h=Date:From:To:Cc:Subject:From;
 b=gIJIk0bqA3GsWLJdjIpotDDmw24mN4kev165yiB0yPqGFYoIDSCo4wX4aCPoKWogr
 nPV7FRADNMssRmUmovhrFIRIROWjuanNjnJYTs1HzjzlOhkpR5TqBecir7JO5qafEH
 SxkhTBlDtqrzOtblrqjNptohlf2EoWDlMWPfEouS7bKdCNu0RgsDdAz7h5iXsqWNJF
 MIcVgg74Vw2YNF44hFjn3SgS/g6XkuGaFcoVV/yLPxLw4tE5bbP7Ic3T/fOdUT39ED
 GeVHHvuAmSfGpSoTrfdAUsi1SMv1CBmJBVSC3PfrYuCUbee+LJp4mkd7LD0cApKuXS
 JzP0iPk6pvB7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJMFK4fVtz4wb5;
 Wed,  2 Oct 2024 14:26:13 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:26:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002142613.62008f4c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fkwnoMc0F+721SRhUp08h1v";
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

--Sig_/fkwnoMc0F+721SRhUp08h1v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_fbdev_shmem.c:1: warning: no structured comments found

Introduced by commit

  bf0978203a74 ("drm/fbdev-shmem: Remove obsolete setup function")

--=20
Cheers,
Stephen Rothwell

--Sig_/fkwnoMc0F+721SRhUp08h1v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8y2UACgkQAVBC80lX
0GyZtQf/SKe/UJTN4DqdP7ROGhDelpLaKN1/YL9BIDNuz4lJOAwgkUWnPf3Bjlvs
f1dcvJyVcfjPEuXO+ZfKbuhyL0KUnBan4jh6UKSjtquOOAtfBSFd/OijnMT7TyMl
NfzFbNDYyE0e7VrGEbmh7YdamiFs28K14peJQY/8wHU/62ci8yh7vw92Jzc1I6/J
fhMPzBijrhXcOFyUrBGlU7kvgY7GpVYAyMOWglItrB2ghnq7ZroRGiS64lb8OgCb
ngC21WOp9TizYdx3yvIkfzc9siAg4xW1or/oajOdC1H2aJXpPZyO6QxAz9OzEGOC
JSKErFxxeirsbQKqwLCSvxDVa3CsdA==
=/9Ya
-----END PGP SIGNATURE-----

--Sig_/fkwnoMc0F+721SRhUp08h1v--
