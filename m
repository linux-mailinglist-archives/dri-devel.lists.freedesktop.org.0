Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D684AB56
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 02:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BBC10FDDD;
	Tue,  6 Feb 2024 01:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MF8CPSuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6163E10FDDB;
 Tue,  6 Feb 2024 01:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707181198;
 bh=mcAAzoOAVGZzLS4NHfKVIUOk1ulVMJKUzquzS0Sq5Ck=;
 h=Date:From:To:Cc:Subject:From;
 b=MF8CPSuCd68GJjC8r+H8/Bmx9jzNzZwz7Hx15htJt5eohVABMsur7DU+1pWb1Ls92
 J7Yun2ixb7rQTOqsXnglA/kJgVZQMykfaB5PFwt5pMMNLMrzvcDqkLjRqAL4x3Qcz6
 J0jofEtekEB5U/k9DOnQUcHXnESaT6hjjweQnsKp0l4Ub4tPk5I4zLmGj8xIAa55Aw
 TXtImetwMyvp5+geBN6Q49MsHCCwjupJXL45ZFkuiU+ZY/QdkW0ZcqxqW4NiyIEkQ4
 3z/QkFM7wEeaGQMY9hQ6yXEVnZF5LHRbHVLyjjhELCEGmKwr4jLHCCAKpARx9bzrLS
 vZg+uVlA7KFzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TTPzd3NNVz4wp3;
 Tue,  6 Feb 2024 11:59:57 +1100 (AEDT)
Date: Tue, 6 Feb 2024 11:59:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Trimarchi
 <michael@amarulasolutions.com>, Michael Walle <mwalle@kernel.org>, Robert
 Foss <rfoss@kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20240206115956.4570e9b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tPTwWSbcHW7JIIhlh82ZBYM";
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

--Sig_/tPTwWSbcHW7JIIhlh82ZBYM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/bridge/samsung-dsim.c

between commit:

  ff3d5d04db07 ("drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE")

from Linus' tree and commit:

  b2fe2292624a ("drm: bridge: samsung-dsim: enter display mode in the enabl=
e() callback")

from the drm-misc tree.

I fixed it up (see below, please check) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/bridge/samsung-dsim.c
index 6a10aa5c85f5,f9d85fe1df7e..000000000000
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@@ -1498,6 -1526,11 +1503,8 @@@ static void samsung_dsim_atomic_disable
  	if (!(dsi->state & DSIM_STATE_ENABLED))
  		return;
 =20
 -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
 -		samsung_dsim_set_stop_state(dsi, true);
 -
+ 	samsung_dsim_set_display_enable(dsi, false);
+=20
  	dsi->state &=3D ~DSIM_STATE_VIDOUT_AVAILABLE;
  }
 =20

--Sig_/tPTwWSbcHW7JIIhlh82ZBYM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXBhIwACgkQAVBC80lX
0GzXoAgAjOU5PMyBhdNjxCGyusGWHf/88xGF2bb6y76E2cLHxWZmxOv/ayFBxgL9
2Sbbt44esyXM5DqMjeVXV8BxlOHKgXho2e4IwjQWSYqRL5sgv/ht2p3/4mD19KMM
jZ44WmMPe+j9O1AYhrgqVLspl/81Jw+WvvEbuAHdNO4BrFTqrl3Ukwep6d1Vqc4v
Ea6lci6qf+daL2U+ESCA6nHhNHM6Yn7kE0xliG7rQSX81u2MEAJVzdZou4RYhqzI
xYP/mU1oIVFiZkz4P1xUK/2uggpbt6F0a1OHzxyDEPQwCveaPAmwsbh1P21IJB0u
Ykh4PJBWNwddUdEtUwy1sncIOnausw==
=gUMH
-----END PGP SIGNATURE-----

--Sig_/tPTwWSbcHW7JIIhlh82ZBYM--
