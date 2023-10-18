Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A237CD1F8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 03:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132710E063;
	Wed, 18 Oct 2023 01:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A5E10E063;
 Wed, 18 Oct 2023 01:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1697593598;
 bh=sK387LiYhZZbkHvAzGKdwmMCDSjgPgBjg6FV5LLzqpI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zt2G0UiaO/1mn+X0nXtIwgkgTNsiZBffL3n0N05NwIK5isp1EjNvo3c76MQ/neNtB
 hc6VP5VVpeoeVkRTyy/UyH/bbfC3vHMeExB349w263/PeTAn3EIpIhz9y2k1XdwGCm
 vJuUykPIY9VV2fMvjvJYC3/1l6uMjNGB/9v1rAJBeYA/6VmHVgMXa5roiATUiek365
 fjWy5Sc6+FIGzDhpaTjzwyne/u7U8nIoA9aEedmF4XvTCNtcXUZ0Ckqu59kmw74HFC
 OIXDrZs/uJ3gKjhUecSC8yIz1/PGyfY/BxdE4SESAmcQI+xGXEqbjHDEDe4qNZIFoQ
 sK2Yzr4q8c4Zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9DGj1v2pz4xNq;
 Wed, 18 Oct 2023 12:46:36 +1100 (AEDT)
Date: Wed, 18 Oct 2023 12:46:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 asm-generic tree
Message-ID: <20231018124636.4a973762@canb.auug.org.au>
In-Reply-To: <20231013114602.4cea19d1@canb.auug.org.au>
References: <20231013114602.4cea19d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IaZJTkHQNzxrMSOcD/.Bq6C";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/IaZJTkHQNzxrMSOcD/.Bq6C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 13 Oct 2023 11:46:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   arch/ia64/include/asm/fb.h
>=20
> between commit:
>=20
>   cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
>=20
> from the asm-generic tree and commit:
>=20
>   052ddf7b86d2 ("fbdev: Replace fb_pgprotect() with pgprot_framebuffer()")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the asm-generic tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IaZJTkHQNzxrMSOcD/.Bq6C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUvOPwACgkQAVBC80lX
0GyvuwgAhp29SLuWA6DctRnsz791475JBOZwVFWtpwyBBs03kxF/2WpuKEKnUwNI
+NzfxlCwLtWwn6JE/Ef68oAO14GEVTZ2HFBtjTsxuUPaDdZmyPlq44569hMUPPmC
UXzXoeA1fFExegOG4xVHptitX7Jcm/+d1I/N1wrlHoFLoLUzll0WI9qKmlETH7sQ
oEwmcfSWCJAz67IQ8HlQoCALtXrpXgPHVcbq3+bocBJUecxqhSPdwRHhPdrSKp2G
0cOAjznwgJWPuP9JEbbpmDrMJhi5n6CNuemBO+6U+QqhPbQ7Vsn5ZM6v2fDdnKVq
9SeNy9GSuaMT2pbLFr2Tn0VqTa/NSw==
=cjeL
-----END PGP SIGNATURE-----

--Sig_/IaZJTkHQNzxrMSOcD/.Bq6C--
