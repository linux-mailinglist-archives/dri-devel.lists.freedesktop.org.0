Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36F86F80C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 01:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC1B10E90C;
	Mon,  4 Mar 2024 00:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nDJfXvcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4E510E90C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 00:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1709513253;
 bh=DS/jTDwm9Vvsxj9zq2HF+dBDM7EgVAj4XGKKoV3Zs+k=;
 h=Date:From:To:Cc:Subject:From;
 b=nDJfXvcT0ES/+CPQqzygTDUniOJ3iNO1JCYPmk4y1d/3VwGLnf5+0/S9HvQVDHaMV
 +hloDixiJsnolFw5m0J9KNl7o79+PIgeV1W2oCMs1Zn4BYHund3wyVU/GExsdEtP69
 PwNja+Y/julEa0KlaCiUq4NY367ipufUhhtFVH3AdE+D8MzvvyNmNleV15TM6SAifZ
 iGTNGXztjd7RKDPqxrcb8ViihqK2a+UkiUfDAoO14X85YT6f1s/ehQ5luRqaUkI4bS
 DWrqHtC3ntt6oVuvkYWdXDXYX31hk28CeuhVFAnOWKXcTY7uXrBHj0wL1mwIHUX+2u
 XUfrXU+tlChyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tp0Qr2bTwz4wb2;
 Mon,  4 Mar 2024 11:47:32 +1100 (AEDT)
Date: Mon, 4 Mar 2024 11:47:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20240304114730.3528c81b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N5eGvFHdYYH7dLGf=gmeDcx";
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

--Sig_/N5eGvFHdYYH7dLGf=gmeDcx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/xe/xe_bo.c
  drivers/gpu/drm/xe/xe_bo.h

between commits:

  a09946a9a903 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
  8188cae3cc3d ("drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_mov=
e trace")

from Linus' tree and commit:

  a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")

from the drm tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/N5eGvFHdYYH7dLGf=gmeDcx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXlGiIACgkQAVBC80lX
0GwVMgf/XqcU3aYatR4evVWoZ45xAYneva/SjBkNA9cODTqjZ5zdjdhIO6TB4f2q
7ElS821lCqqhnIAlfoI2Q+StNTDvrPhbrocmGpsxpAu0mW5zvZm0eIfQyRWsWdNu
9+YccjrPm4ntoinjhBZicFlp3L88EqoPi69pHmiij+ahODHIR1a/P4RNDtiH8WUr
6i7DOK1nuZfeCCwZyPKoMURfyG20Rf/q+9MYzUh5TLWoKzl0Cf67b0snDfgqPS1/
liu0mQtGIdQP0jpX9g+ycNGDA2huq2ubRZg5BHU0SKxOJJWZyA2fXy8FxnoSK8Tm
587c2ubpi0QQZn0rRmo5NEKXVXwfMA==
=i13G
-----END PGP SIGNATURE-----

--Sig_/N5eGvFHdYYH7dLGf=gmeDcx--
