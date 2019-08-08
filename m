Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6D386CC5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 23:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11B16ECCA;
	Thu,  8 Aug 2019 21:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045D66ECCA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 21:55:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 464Md14DG8z9sNF;
 Fri,  9 Aug 2019 07:55:49 +1000 (AEST)
Date: Fri, 9 Aug 2019 07:55:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu-fixes tree with the
 drm-fixes tree
Message-ID: <20190809075547.679c0713@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1565301351;
 bh=0Ou22NT90/zxAm29hlbGDucgM9byIb1KYwf2gwqPCLw=;
 h=Date:From:To:Cc:Subject:From;
 b=eELnzwxYuaaQaTqFFXzXFsHOcF4yd5L0ETzTOCSV5uw6wapbBnXBpT9YkIk1Xdia1
 Qnbfln+lgG7Rocsye2iU0v20LdeZLuyFiNYKwepW5m4/KuD447TQjCkmZog2hKPN4G
 CvSQt3Wt45E30EILN2A3pSbncGTfXomR5eNpvvDeNsvJBxS/V6UO6uDZOED/evk9uQ
 a29st3+I1BUXcX6K45gWI7NzZGa9gtoIGWr7EHYC+uRNFIst2wCZ3th2uq6vrB/jz8
 kQZl4AUGntZV1zGbUW7MW+vYWqm1ADazJSV5CPScrfmYoHdhnr71q90WUlcUy63vYh
 IO2RV/K0ehTVg==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joseph Greathouse <Joseph.Greathouse@amd.com>
Content-Type: multipart/mixed; boundary="===============1784207502=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1784207502==
Content-Type: multipart/signed; boundary="Sig_/0GEow4Lfw6PR50E2okImpXH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0GEow4Lfw6PR50E2okImpXH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu-fixes tree got conflicts in:

  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
  include/uapi/linux/kfd_ioctl.h

between commit:

  4b3e30ed3ec7 ("Revert "drm/amdkfd: New IOCTL to allocate queue GWS"")

from the drm-fixes tree and commit:

  7e51b56cd5b8 ("drm/amdkfd: Remove GPU ID in GWS queue creation")

from the amdgpu-fixes tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/0GEow4Lfw6PR50E2okImpXH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1MmmMACgkQAVBC80lX
0Gzm9Af/Tr4iPShzhGwvhE1Hflvd2O4Ad6Ivv7wYBf4kULwSx+n4LZAjYazP+526
B4NZ5y/8z1GPhE4ZbmcaLyi7PLCNOA8XmD2u3bd7jlGlwyGfTFzrIsihPEjPsofV
m///ZAZN6IrGfbekcr8+5divRQH4fHFLCR9vrIJn3KTMfSO7d4keqIpyFgdto/Z/
29o4oDO4LAMMULeMJfPZSLiI58piSW6euxKLIy9nqyADh5GSuyPcjvJcTKWv/9Na
Ct2VcrN1QAKKpJU62RSNG2ZgupY7yUoIbvD6I87g4GM6XZYfXXfvBFqjRu8eJrAL
TpwpFSFdxhgkCaNQFffHs/sTV7cPdA==
=c4nH
-----END PGP SIGNATURE-----

--Sig_/0GEow4Lfw6PR50E2okImpXH--

--===============1784207502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1784207502==--
