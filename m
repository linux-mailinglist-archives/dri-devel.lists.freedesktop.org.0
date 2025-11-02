Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D444C299EC
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4235310E128;
	Sun,  2 Nov 2025 23:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rbKZQ6rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C9110E125;
 Sun,  2 Nov 2025 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762125522;
 bh=xaU4rrErMEvuq9+RliP/7svNzdrCSMaDrdk5mZvdito=;
 h=Date:From:To:Cc:Subject:From;
 b=rbKZQ6rzBvDb9N5EeEPtT5qSKhA8Qc5vgil6auxdE0Av/rjn9HZR2PXNjQKuVnNWq
 d2Jur7Ya0HNLogjiFqU0NMwYlJ8W9CSycmGhg2qQa0S1+EAh20TWwNMjDj80T2cei3
 jB4+MsRTo7WffBLrrGhd6r1sdMmvkDLNSVTIkFp2rp8p4Q/yG4/qREPrS6Kk2on0m9
 Ywpk7MLihc0gA1L/Q5oq/rWqGovq1zIr8SnUyXIAwQ+yAYWg+0QzA0SqpUcgN/lSS/
 bkkYzSJSdvm8/XGUJonzBCny7Lj+8972nrcB3+ISzN9TXFiqmsf7Wi+On5LLxzSR0G
 cCMopMY2GWj7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d09dG3jf3z4w9R;
 Mon, 03 Nov 2025 10:18:42 +1100 (AEDT)
Date: Mon, 3 Nov 2025 10:18:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20251103101841.537c87dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y9dSf5_k+qC6k1QYFAE.jCC";
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

--Sig_/Y9dSf5_k+qC6k1QYFAE.jCC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commits:

  c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
  5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")

from the drm tree and commit:

  32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")

from the drm-intel tree.

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
index 6e59642e7820,67c808bb22a8..000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -440,8 -375,7 +440,9 @@@ static const struct pci_device_id pciid
  	INTEL_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
  	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
  	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 +	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
 +	INTEL_CRI_IDS(INTEL_PCI_DEVICE, &cri_desc),
+ 	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
  	{ }
  };
  MODULE_DEVICE_TABLE(pci, pciidlist);

--Sig_/Y9dSf5_k+qC6k1QYFAE.jCC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH5tEACgkQAVBC80lX
0GzAIQf/VXtLy2V2td1WeYdKCBZ+qe7GU3Z8yZyrQwJ7ZSQ/nT0xga432I16p44M
3Nm5dtc58Ba/ignPJjvpjuaphB53OZbJNVRgnYFmJTSZD+PKWha+CvJ0ViSted98
33ABLrWqvIs2D8+A4jLUp+SFx1hMIQv/S5+VoJL+/z72dLOjA/1q3lSg1mrYxn83
FEdScUYt/+vGVv+4Oq1qpOQUPROiC5S3Wlwy/7JODXdnsQXNwmyY3yPY+UHAzW+e
ruARCMEIOm6M14gQUxU2QgqNSlr3XprkDFHdg+tIV7lRDmL+rLk1IHIARSmlvGJ4
EWH3jUmOqqexeaWiKsG5/OsiJgFx9w==
=OMTU
-----END PGP SIGNATURE-----

--Sig_/Y9dSf5_k+qC6k1QYFAE.jCC--
