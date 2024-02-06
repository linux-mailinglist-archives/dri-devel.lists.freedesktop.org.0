Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8EB84AB5F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 02:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64375112730;
	Tue,  6 Feb 2024 01:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D45K9hca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F71E11272F;
 Tue,  6 Feb 2024 01:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707181605;
 bh=2vDOcQqrXnD/DT/s1m9g+ZZ/YWdvacfHhw9HRCRbVXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D45K9hcao5cQV0oSsPK8wHRiIIN1VEH1Vy6r1G22jOBIiFG8j14AeQLoRPnaMagYc
 0SMrxahnPfIBmZXMjGv5ywu33YKjAFAiKSaz5heHi0cn6uO3W4aLBdjcKyqVPkAXdF
 2iWOpDu+Go+rGX7CnsIQwlFaiuG8A7Sw9pTqjaTZE9cOsU4vBhrfzaPtdmD/iL06K+
 z0+oHHjdOgLhov4jO1GQnuvhToeM4hNYs1+ANrJ5WaM31cJnzVCsSeMgDYkhjraP6w
 ve7vBAgjS9lhNPpAAUYvWDCHzmcu7lO15cwvAQECUVK5mWwAziIt+jaII+LUnKOxpk
 QNI4XQxnIsXpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TTQ7S3np1z4wxx;
 Tue,  6 Feb 2024 12:06:44 +1100 (AEDT)
Date: Tue, 6 Feb 2024 12:06:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Trimarchi
 <michael@amarulasolutions.com>, Michael Walle <mwalle@kernel.org>, Robert
 Foss <rfoss@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20240206120643.1d30764c@canb.auug.org.au>
In-Reply-To: <20240206115956.4570e9b1@canb.auug.org.au>
References: <20240206115956.4570e9b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R5MrDFgjJgkcfwl1oGYogXX";
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

--Sig_/R5MrDFgjJgkcfwl1oGYogXX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Feb 2024 11:59:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/bridge/samsung-dsim.c
>=20
> between commit:
>=20
>   ff3d5d04db07 ("drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE")
>=20
> from Linus' tree and commit:
>=20
>   b2fe2292624a ("drm: bridge: samsung-dsim: enter display mode in the ena=
ble() callback")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below, please check) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

I changed my mind and just used the latter version of this file.
--=20
Cheers,
Stephen Rothwell

--Sig_/R5MrDFgjJgkcfwl1oGYogXX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXBhiMACgkQAVBC80lX
0GxeKAgAkwQiFzWc9h4CfzDkViFqu8H/3j8jQCOL2MrI0BRFd//8tfIgFyEx7a3Y
NM6ij5nZP/7LrEELmOe7J/L8xBjhJel34x+aoKXlRFVtgUpauNQLYf8f4vL7CE1F
hP09q3GOWEMo9q+FyhmlZBBE7NDYFXtSPYm2pedIKe0VxrJtnMREtnn4nZ+vsaQn
wxdaWppYiN7eSLHc8dKE85tjr3sn6ILBDMLoRWgDX9EENec2Tnhc+HD7+cmt/OhF
yUiyenHVxTZwjeyUd0SPgT0jZHtklj5tRvO2/kT2xp3NC7yAgptFunRdtVBGbMoz
tSZeRFmfZOsf1V45x4vkJrSD+fgeCg==
=L2LP
-----END PGP SIGNATURE-----

--Sig_/R5MrDFgjJgkcfwl1oGYogXX--
