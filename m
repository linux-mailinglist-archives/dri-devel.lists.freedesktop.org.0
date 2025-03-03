Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B5A4B5FD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 03:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D82710E082;
	Mon,  3 Mar 2025 02:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oZ67D71J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C8A10E082
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 02:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1740967950;
 bh=P6pWr0vI1wgeuCv27TqPbjo0Csg0SDZmUev1mSW46Vo=;
 h=Date:From:To:Cc:Subject:From;
 b=oZ67D71JXzCZ/I4ateJ66LRwUzHnou62dAcU5/IuscIAdBzBCvPxxgnFzgXnuX8wA
 wWnomDh/sOvtc6WXVzWHCd+Ulv5HGqcOZPWKqJD9BSlANPrkYVXkCIHQuX4aBVZISm
 tJLK6ysyW8bQf2Uf9lirMSOkuIakhSqqlh7T8/cmju/6znYoAGY9H2ZZDyIKwHEdwR
 rHb0/gO4n/17Glk4MFBh/Tq3Ofkph/dh4Y8EOl4g7Nh09v8OmywwiR9pVFGF57XBQ/
 EjMF5+x3Zf+XfcnKdCB1+Erffw2CKZ04p952VZZIhqujfk8CntM00WDBefrSjNYPoK
 2EGdRLTNiD5Wg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5j4t1lhxz4wcy;
 Mon,  3 Mar 2025 13:12:30 +1100 (AEDT)
Date: Mon, 3 Mar 2025 13:12:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250303131229.4ebeae00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=TQbOEJSUTTs+u_8zOlQmB.";
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

--Sig_/=TQbOEJSUTTs+u_8zOlQmB.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

between commits:

  e7ea88207cef ("drm/amdgpu/gfx: only call mes for enforce isolation if sup=
ported")
  748a1f51bb74 ("drm/amdgpu/mes: keep enforce isolation up to date")

from Linus' tree and commit:

  80513e389765 ("drm/amdgpu/gfx: only call mes for enforce isolation if sup=
ported")

from the drm tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=TQbOEJSUTTs+u_8zOlQmB.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFEA0ACgkQAVBC80lX
0Gyz5Qf+OK1bM2hrrhPa7Rqansukt1vIT4ZJHvLvfiXgL7W89B3EVaOkAOu9bhYy
EFW6GRQaIem1M/Sn8Q1LNGEivtp6y7ZjWHWACk4XVxFtPUNJs5Ftf8IJyNcroke8
qL41M8+pGbT61AkGpafranzm6ejvYeQzVwWwaB/Z9RpCCzF8Z2Rd/NjFuT1XbFuO
NTQP2216M4veQ80e4qSX1FGUbimNeNCVtL/ZaP17FERgPxMOHnoQ/qsyW7Jfkq1b
vWioA5qTc3w7sF/lVvJZvKiupDmBK5o7ie0AR4bveqeiSreraUpmU8AtBh7Hj/sX
bpRdFhVbj8fzQmogDaXUs0GQa2E3fg==
=BmVQ
-----END PGP SIGNATURE-----

--Sig_/=TQbOEJSUTTs+u_8zOlQmB.--
