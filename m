Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF930EBA7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 05:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27F6EC7A;
	Thu,  4 Feb 2021 04:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5D66EC7A;
 Thu,  4 Feb 2021 04:58:56 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWRCZ069Nz9sxS;
 Thu,  4 Feb 2021 15:58:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1612414733;
 bh=o8GSPtJAR94fDp96R4qjjwurgzky4QNCyNbf1MHRNUo=;
 h=Date:From:To:Cc:Subject:From;
 b=kGBJSCMAXBwtRdGIxCxVpmvWVNrtd4tvYkaz3A11UfhcllC25yfZv2eoELUGg9pcl
 G4spDJ3RXSxcDBBKxbM/988UYnJaG5y+Nr18pZFeBbrVF/aAR8l4br8HY9XsVwZ+BC
 vbT+zJyuTbZ87c1n1HOhoBshKl9/vWrkWugXwFXyUxF6d97oiPs7fTz0mpWaJwzHGk
 LeFiOL7emIUZ7ChVOrREVdFE5oVfyxjp8hnaedusjYX/MnyseCGBhm3+QFgxnpKiUJ
 jSTCOULWkGD+Eu3it5IK+uDluKs4SosZ+OCKLd4VKN0npJCsZk46JRkKTMiyYk4NNv
 YTpjQ58HNKp8w==
Date: Thu, 4 Feb 2021 15:58:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <mark.gross@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drivers-x86 tree with the drm-misc
 tree
Message-ID: <20210204155846.5aef94a8@canb.auug.org.au>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0000162545=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0000162545==
Content-Type: multipart/signed; boundary="Sig_/vXMANa1gQE/6.UO58AyQ+3L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vXMANa1gQE/6.UO58AyQ+3L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/gpu/drm/gma500/Kconfig
  drivers/gpu/drm/gma500/mdfld_device.c
  drivers/gpu/drm/gma500/mdfld_dsi_output.c
  drivers/gpu/drm/gma500/mdfld_output.c
  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c

between commits:

  b51035c200bd ("drm/gma500: Remove Medfield support")
  837f23bb4b60 ("drm/gma500: Drop DRM_GMA3600 config option")

from the drm-misc tree and commit:

  bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
  25ded39ad064 ("drm/gma500: Get rid of duplicate NULL checks")

from the drivers-x86 tree.

I fixed it up (the former removed the text that was updated by the
latter and removed the last 4 files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vXMANa1gQE/6.UO58AyQ+3L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAbfwYACgkQAVBC80lX
0GwxMwf/QawMM9sngMztt4iWCkh2mZAwbY53aT65k+mzk/du8vDr+MMA8NGnYAFY
UUp0zhhDvmdrClHEIOl4R3QnXabIzWcBiURnrcKiSJXbTVapYGXXJ26hkgJDGuRO
sOdwtCS+rzTKZqk+fMwgqU9vPokz21UMjCgCFC9ZBrzoAHyWa5KhyZMTqy+hE+15
vmajV32ryu9tP+al4lwKyfGRKia6vNA8YTfiV4+8uGg+nk1r0vJDnAFXsrwk+yzF
SWse70ZbtRCvShFb/d3+z/hT4aEzm+PPaW88nwO8LL9tsc3AtoFs3zD/DbH151V+
EDRLDV/a5YdWb0vMM9U0xCNxoJQBrQ==
=/Zsb
-----END PGP SIGNATURE-----

--Sig_/vXMANa1gQE/6.UO58AyQ+3L--

--===============0000162545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0000162545==--
