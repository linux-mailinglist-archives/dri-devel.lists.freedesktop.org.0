Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DD4789C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 05:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD6C890D5;
	Mon, 17 Jun 2019 03:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386B88FDD;
 Mon, 17 Jun 2019 03:20:33 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45RxL44gKHz9sBp;
 Mon, 17 Jun 2019 13:20:28 +1000 (AEST)
Date: Mon, 17 Jun 2019 13:20:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: linux-next: manual merge of the drm-intel tree with the pci tree
Message-ID: <20190617132027.3e34597d@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1560741630;
 bh=E/UjMzzNWzIgmLLzo+hdSHFAPtSWXV8GhaxPEJkzphk=;
 h=Date:From:To:Cc:Subject:From;
 b=fu4WLvm4Mw5YKmAtHV/Y3TXcMt8Pl/ZTQPTUWZRRDLQkh032RrbvwH76tKvs66agi
 SzIcbze6nzd3Z7a5Yi2YQmCwZjUFxqjugGbiItQpJ824VMdJqK761e5iO0D51ojyHh
 D0sgy/pPop3ZpjvpsBT1DmFRWoBqbBj3H8dSmvneicfGlKlBo6yM2qU2wKwODxT5zi
 jIy8PhVQ80ZQekLqKmrWX7hohMRGQkngSPVgZPGvgAyjKoTBMcpJOH5Mk52cc9f/Tc
 BU0KIA0b/jama+2c8BD5lAVPvq137q2WOj2bw/8fOWEndYYia4HqaP22pcjr6jgzgG
 /04RExVHDmCzg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1366520316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1366520316==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9kndnzh67+Mx8fK+8VeLJRh"; protocol="application/pgp-signature"

--Sig_/9kndnzh67+Mx8fK+8VeLJRh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  151f4e2bdc7a ("docs: power: convert docs to ReST and rename to *.rst")

from the pci tree and commit:

  1bf676cc2dba ("drm/i915: move and rename i915_runtime_pm")

from the drm-intel tree.

I fixed it up (I just removed the struct definition form this files as
the latter did - its comment will need to be fixed up in its new file)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9kndnzh67+Mx8fK+8VeLJRh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0HBvsACgkQAVBC80lX
0Gyk1ggAiwbMletwQoXyZZsEPGev6xTTFAiXKTVhxWibzPjsgFPeDzPPU8avptjH
vfQrvA5n+D1cxIhUBFZ9GtDqg3/tb1/pbwFinOqrCM5kmprNl4UjzeGbi705YWm1
OKY2GphAh/lhAB8cSIvjKcEOy54QBOgfkzoSgRNnhRUbgUSEDs5PYEaehocqpxxK
Z91kCr2QuH4ehARKWcPOog9rMNp2R/XzZy00C1vjboK4W3BPtpsIZR/R4Y9Rb3sF
QyCnyuhr+YpZKQxZwLwIqZn2raxkNe03UG/eKKQHhov+VLA5KgasT3hIbWHaCVTk
XFQC3TTTn1XvFV2jRXIIJkN+yoM8qA==
=hw7+
-----END PGP SIGNATURE-----

--Sig_/9kndnzh67+Mx8fK+8VeLJRh--

--===============1366520316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1366520316==--
