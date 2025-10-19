Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D1BEEEB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 01:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F087210E22C;
	Sun, 19 Oct 2025 23:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kxv3o1fo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 604 seconds by postgrey-1.36 at gabe;
 Sun, 19 Oct 2025 23:41:28 UTC
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881D110E068;
 Sun, 19 Oct 2025 23:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1760916681;
 bh=UoGToMhmBvEkGtFCZAK2Hfm8FjJbcOJcRKBGQzSH3uk=;
 h=Date:From:To:Cc:Subject:From;
 b=Kxv3o1forkHd7Kw9IxA6kAr7BphZdpSx4oj/w9NqLMQXh15veMVaN37hr18BZkidr
 oKVtEL/8Rp9K/Z3kUQ6loa8g0e7aD/GtuQpTfWs27JA+zmS1s3rmB07TeK1hKaJZUG
 8kT1mVj+IOhplw+PPoJ6ZAlPWorg1UIRXSkkrgTx4DivJ/waafhJhWIQLKF2qLWY5p
 3ticRZ8Ul9i3+c9CLl+QOK0UQfrdepO3lBN3mmhTR1267iCc9JmFnPidFuzGwbQew4
 0GDlnBKt3EjZQxjd/2G+U7QdXIm+7tuhLS+ccsjKtRZA7rzXprO8u0Jn60rag/J+LO
 MBj6L70PkItCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqZZJ1QW7z4w9Q;
 Mon, 20 Oct 2025 10:31:19 +1100 (AEDT)
Date: Mon, 20 Oct 2025 10:31:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20251020103119.3215fa25@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zoF=3JrYD9.aAWKh3I7OTaC";
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

--Sig_/zoF=3JrYD9.aAWKh3I7OTaC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commit:

  32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")

from the drm-intel tree and commit:

  c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_pci.c
index 89cc6d32f041,c326430e75b5..000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -375,7 -422,7 +422,8 @@@ static const struct pci_device_id pciid
  	INTEL_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
  	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
  	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 +	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
+ 	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
  	{ }
  };
  MODULE_DEVICE_TABLE(pci, pciidlist);

--Sig_/zoF=3JrYD9.aAWKh3I7OTaC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1dMcACgkQAVBC80lX
0GyPMQf/ToOBFxvQNw2oteVkjpM/0z+8iG8ISnM1FvDa21g72UesBZhT4EX04u6/
wOYpD1n3q4MTzjViVsfRE0Y2v457Z7897w+szt4y2tV67EJrIhVeDouhIVwFLsbM
UqR2NQnVImkMFvcz6MraNxohiduykQx1CH91F2BMJ+4wl7kpSV7zE8hfJTM5OQhK
byDBmHn1VY8ZSLse5pLmfGvdZmivDv2BWFyjL0a48GloJR0nj6+Stq3+n0rb0eSf
0Aypbhz0qTuxtPvPhWMWv2uhMXqnc6e3Ku9nY9mHvakDWjQWttZK7lB12UwIFZkC
TlnzJBchDkPZn3iL6UyqNOCHvJDKiw==
=m7WL
-----END PGP SIGNATURE-----

--Sig_/zoF=3JrYD9.aAWKh3I7OTaC--
