Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60374A5DC85
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B671E10E108;
	Wed, 12 Mar 2025 12:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lW6Cn2cp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DB610E108;
 Wed, 12 Mar 2025 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1741782308;
 bh=Rvygff/7y7TC8a5d6eV+N2DAMKcBgZ3O37xQ0uRTr08=;
 h=Date:From:To:Cc:Subject:From;
 b=lW6Cn2cp1sf13uTHW6mKMq8nMZtFTwDMkoLiwr5YJ7PrfoRzzdZzQRS1joSn1gW+E
 G/V2SdfuX0h22ym4G5/QA7l7iruzL2wZQxAviyEftPoPLoJc/9S87ZvrogpdeQvECA
 cKAwK0zaQQ87+3MNuMTDqZG/eiHnwalEGTP0n2xZaN521elI2YBBCiKciPeA87vhxq
 voMoVEcCMb7ejp+2pRrx8fClPeYt1xfPh4Op5LnnmDTK9to1dSbEuQ8zk9Z61rMc8m
 n8q3BjwIk7GX8S+YeFw1hBLT2ZpxtPhbHxvfCu+vLpFyE7kE1LTRNTaL0pqsdo1i4a
 u8pR0BGEnMAUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCVFb5cWWz4wb0;
 Wed, 12 Mar 2025 23:25:07 +1100 (AEDT)
Date: Wed, 12 Mar 2025 23:25:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-intel tree
Message-ID: <20250312232506.47451f83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IW.toj2BZOadnOUu8oh_Duw";
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

--Sig_/IW.toj2BZOadnOUu8oh_Duw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/gpu/i915:141: drivers/gpu/drm/i915/display/intel_hotplug.c:10=
68: ERROR: Unexpected indentation. [docutils]
Documentation/gpu/i915:141: drivers/gpu/drm/i915/display/intel_hotplug.c:10=
69: WARNING: Block quote ends without a blank line; unexpected unindent. [d=
ocutils]

Introduced by commit

  0d77a3e0ea90 ("drm/i915/hpd: Add support for blocking the IRQ handling on=
 an HPD pin")

--=20
Cheers,
Stephen Rothwell

--Sig_/IW.toj2BZOadnOUu8oh_Duw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfRfSIACgkQAVBC80lX
0Gy9Lgf/SPNdcR2k5QeP2FgY7I7bJh6T9o3IfBIzjSdfvXddSZKQ8q3EXBkquwtT
XlSrPHraYozYM+iBEa9Y4NcoYoBlOcWOlEgnm/r52U95ORhdph0IAG0Xk3OKTEgY
EIPNSrJvHBpvSkobJD2svXThW65vy4qQfJydKrGW24zE2MHZdA1GOJOznN8VK/uk
70qgj77/UBCyT/QkmoBrcpOQCLFT70sE9rBmN1dmki97qw2p79tR5HkqpMZhgpYv
R+fUsjXnqxjYsRHNSLTEG/b5KjCeKWeGbcHbCcH9CVeJKwge/uoqMsJplbp5bK98
WUyi0q40kVrgsdrgKGzSOhrpJNrdLQ==
=lWRH
-----END PGP SIGNATURE-----

--Sig_/IW.toj2BZOadnOUu8oh_Duw--
