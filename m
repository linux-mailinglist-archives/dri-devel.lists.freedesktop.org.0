Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA3FAEF084
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D3510E0B8;
	Tue,  1 Jul 2025 08:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gsBT7M9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9D710E0B8;
 Tue,  1 Jul 2025 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1751357388;
 bh=i0dwdcktRYAFch2TqkjcggkBLvEQlkeisToFt/av8Uw=;
 h=Date:From:To:Cc:Subject:From;
 b=gsBT7M9DAw7OaCOKuqQ+ldVrAJJktCAigvoccSg4bKcLRiJU6lnNdaUeSiiuOx3pn
 xMFoLuA2HvxvsuL4CW0o2kqXWvpMmIXRasF/kGL3IT1okwPe4ii7i9lAwwmx6CxSgS
 DsiOj5eOqu8QsuqXuxqvUtaZCSM8UIEnvnqMCc+UlPutfwFINerMmXAEVGCDHs73Rw
 0gHCz2WNy0zvJ7scprxMRY92BhRSI935bfdX+CzrUSfUTQdsageoo5pDdEK/fq76v+
 XpkbvNrcX0iuk1FJUW+euLij8jZg5W0vEazsDMj8OUf3dTek1YDa3BnkTGE1uUR9Us
 mH938tVkZ/BQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWbKm475Nz4wbn;
 Tue,  1 Jul 2025 18:09:48 +1000 (AEST)
Date: Tue, 1 Jul 2025 18:09:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250701180955.0859f046@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kP_8zd2dCpMVyLt4jEq8i7P";
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

--Sig_/kP_8zd2dCpMVyLt4jEq8i7P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/display/drm_dp_helper.h:859: warning: Function parameter or str=
uct member 'luminance_set' not described in 'drm_edp_backlight_info'

Introduced by commit

  2af612ad4290 ("drm/dp: Introduce new member in drm_backlight_info")

--=20
Cheers,
Stephen Rothwell

--Sig_/kP_8zd2dCpMVyLt4jEq8i7P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjl9MACgkQAVBC80lX
0GxHYQgAisibYw342qyFhbPHuF4SrxsthEXu+Sen60LXzr5R0XmnvtGOlG1o2Q8G
kXlnGtZl8UYhx6GOYyXhKW163JgjFCrmp8OFdoP/J2ap0x96+Wp4LSTqrthm1hxf
SZbVWw560E+E9g7MUGLzbnpSpTWCn4Tc4ev5QUSwahb1xtFTMWqaSHeZ2LdcjGzD
mt6/6b9hHr9bVMk26KWDsNx0moukBGyaUQe8n6x1lLejtHSbW/c3T83bEI67Y4mI
2pv9HGCa6SRqQ7rCVK0l47QJA561vFZPzsHh5G9L+oiVfcB8za9Zn97jWQnsESih
IHXTCpsE9wu5Cgt8+kXrsp5UyE9xeQ==
=CD2k
-----END PGP SIGNATURE-----

--Sig_/kP_8zd2dCpMVyLt4jEq8i7P--
