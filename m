Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98019B2325
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CD310E320;
	Mon, 28 Oct 2024 02:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r2ibeKvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3525310E320
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1730083775;
 bh=mRYf9ZVWENutyeZOw1NtAF39x5//TNGDCafQQZFRw/g=;
 h=Date:From:To:Cc:Subject:From;
 b=r2ibeKvG1WMKLsFQddoMtpcwhIl7dY8pLV7luCEEeegIHsKndLIIX7HI3ESKbT8cn
 V2CCOJ1VNkacGdM0sP48+jHUq+w0uKMOZMa7DEqqw9Q2ULZ+5VOwRl9vuLwa+o21uZ
 PiHwQaOjUuX5X3m0kmzEldXIFZElAKnKGcmCyRuPahZ+8czsA0ddkJM31ZT8TeV2hE
 qTMNL6tu28UEUiKuzqbZEaIdhaDEK3k6fU3AKwZPc4IURfM+LEclEL5LqWI2vTaBmI
 Ee3/0WerCr661hg8SlVhV0K3UPxcf+DYpUYQyFE+Hlbhr8w7e57u8R709zn99mUokG
 nul9K0Imvx1iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHsp6BVJz4x6k;
 Mon, 28 Oct 2024 13:49:34 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:49:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Badal Nilawar
 <badal.nilawar@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20241028134935.48828a6d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z_6=.=V7=hBop7w1tE+Ht2Q";
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

--Sig_/z_6=.=V7=hBop7w1tE+Ht2Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_ct.c

between commits:

  db7f92af6261 ("drm/xe/ct: prevent UAF in send_recv()")
  22ef43c78647 ("drm/xe/guc/ct: Flush g2h worker in case of g2h response ti=
meout")

from Linus' tree and commits:

  52789ce35c55 ("drm/xe/ct: prevent UAF in send_recv()")
  11bfc4a2cfea ("drm/xe/ct: drop irq usage of xa_erase()")

from the drm tree.

I fixed it up (if it wasn't for db7f92af6261 and 52789ce35c55 there
would be no confict) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/z_6=.=V7=hBop7w1tE+Ht2Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce+78ACgkQAVBC80lX
0Gw6uwf+Prp+wtXTzKLVefrHz5qr0H27/IXiB+umUkmZqG4FfIe3FsCFjtqeEN0s
ybBASn4Ra0R94YfPJqt+k3OwdjCyJktG7Mqy71KACyVBJhkwXKHKxAofdJA0RH+J
fKH+mnoRAUaH5qD2RqC0cVWdFMehKMvR/nkxzET/mFTPwuU3Tbus7B//UOL1EISi
Fk29ndeu/cjJWzN0AKtPP9GnE5ETDWzG73+Ll3ndC6ml48fLLzN1PS8KMSFhfldi
D5IuBcEgnGxHxV+dssHzU7S1NQ1z0Xb8FEShoh3hgcJ8M1RJR4YNQzOAkRTLF7LZ
pVZV8Z8GQBEBNQMaVSu4BGiumKFc6w==
=o1nE
-----END PGP SIGNATURE-----

--Sig_/z_6=.=V7=hBop7w1tE+Ht2Q--
