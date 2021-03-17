Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E433E731
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 03:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E476E075;
	Wed, 17 Mar 2021 02:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AC46E075
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 02:54:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0ZVc2WL8z9sVm;
 Wed, 17 Mar 2021 13:53:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1615949642;
 bh=ghKS5MERBp1teKODr+s9Nv78WJJQk4wDT73OQ9B+8eM=;
 h=Date:From:To:Cc:Subject:From;
 b=efaqHqilylwa0Ut1qgLsiI3O/5Es5dvFIAgcpnJLVHZ+toKC0MEVcy3wdHpN9r4mT
 nGbrwg4pQVYEUHSph3138LxXKgOO2AxW29XiSFOjHwoNk0IKPaF1wiGEuBs79wxMvf
 8zGrd3nA4qDShSAPBGvNWK0dfORAz8U8Hzoz4Z7TZB2aVBUpVsFrCmjXhwJfRp9XO8
 wfAnzfAUZuyO7J8hs835EuICjOOUQyob7CakGnzm99KncnUCyWAntHpCUrCENNaVOB
 DQMAPl7ujoui1SxQDhoYuYZHnn83pSljPuOBeqJSH0a0xVdHhgga9Pi649oUdWmzg3
 chpO0pYREQu/A==
Date: Wed, 17 Mar 2021 13:53:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210317135355.1f9b0139@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1500801390=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1500801390==
Content-Type: multipart/signed; boundary="Sig_/XHUXYh.QD6qLrCLx4v06Kb+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XHUXYh.QD6qLrCLx4v06Kb+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/rockchip/rockchip_drm_vop.c: In function 'vop_plane_atomic_=
update':
drivers/gpu/drm/rockchip/rockchip_drm_vop.c:882:26: warning: unused variabl=
e 'old_state' [-Wunused-variable]
  882 |  struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_sta=
te(state,
      |                          ^~~~~~~~~

Introduced by commit

  977697e20b3d ("drm/atomic: Pass the full state to planes atomic disable a=
nd update")

--=20
Cheers,
Stephen Rothwell

--Sig_/XHUXYh.QD6qLrCLx4v06Kb+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRb0MACgkQAVBC80lX
0Gxibwf+Mkd+hq1Kqd0VM6tihIymwBFOaSOuEdTZh4fCXPuB7Av6HD4+L+td0mjr
c4uoTF5evRfswYpkiZva8y7Uph+sF1UFyWIBcZPitAubpG7XBpz8N5y2CrNquJk+
SJnqheBYk1jYjGMUkewIpe9L59sVoinqXNgUPDXzhN+IWCmJPvik4cEW/44jgI7z
H0oHKqjqbgZszU4t6peoHvyjpLCZ73BhHU3A56Oj9FAQBuPuS/kevdYY+UjzcWte
b5/rv72dZE3GpDxxjf9fjOVyCUd/dK21oJ7LHKnxbafwrr1X4UhI9+L78pRQCAeo
p4Opo4X2HwEjum8ZK1KRAK3Ni4VEWw==
=nu8v
-----END PGP SIGNATURE-----

--Sig_/XHUXYh.QD6qLrCLx4v06Kb+--

--===============1500801390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1500801390==--
