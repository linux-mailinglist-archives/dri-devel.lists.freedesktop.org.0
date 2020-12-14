Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC362D91E2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 03:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2887C8915A;
	Mon, 14 Dec 2020 02:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7C8915A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 02:55:00 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvQwb3PhQz9sRR;
 Mon, 14 Dec 2020 13:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1607914498;
 bh=lCODkhvBcMAzJ2JraOyKtROTbpTLOwTpUeDgzVZ/WRM=;
 h=Date:From:To:Cc:Subject:From;
 b=Lq0kS14Z9K5kg/7Ulx/AT1LTd8ZyCMaty5dD+SUh4y74I2umSRDhCHP5liqXOFyY8
 0U/U4151W4P1mj2EL+3ywuuJSijuyvj5rjyXdf+thNGWoxyfncmnfXadOs0OX3yjSm
 aiotfihN/PqbwNseEQo6tpxBFEYHoJFFXIBTTd/oWDGMlJZxVLhyoOLpFkqDdNJ19K
 +CJh+KLTivNH8vJp2V10IBnn6jxT0THTJoIiid/C3LGsdrdymKuk2wevrKhmY9jYmu
 YvGclKVB+KcVPJq99ukGSW/Sb0wTZw3/3tYvMhhn7wORlMAHahoDxPPLYp7cRc/cf9
 Gai4LPLahKYBg==
Date: Mon, 14 Dec 2020 13:54:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the crypto tree
Message-ID: <20201214135453.16e76e9d@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Mike Healy <mikex.healy@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Content-Type: multipart/mixed; boundary="===============1191622179=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1191622179==
Content-Type: multipart/signed; boundary="Sig_/8qi0JHtIjRjh.eFSKzZUn+z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8qi0JHtIjRjh.eFSKzZUn+z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  MAINTAINERS

between commit:

  885743324513 ("crypto: keembay - Add support for Keem Bay OCS AES/SM4")

from the crypto tree and commit:

  ed794057b052 ("drm/kmb: Build files for KeemBay Display driver")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 3b358262de8f,eb18459c1d16..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -6932,11 -6913,16 +6941,10 @@@ S:	Maintaine
  W:	http://floatingpoint.sourceforge.net/emulator/index.html
  F:	arch/x86/math-emu/
 =20
 -FRAME RELAY DLCI/FRAD (Sangoma drivers too)
 -L:	netdev@vger.kernel.org
 -S:	Orphan
 -F:	drivers/net/wan/dlci.c
 -F:	drivers/net/wan/sdla.c
 -
  FRAMEBUFFER LAYER
- M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  L:	dri-devel@lists.freedesktop.org
  L:	linux-fbdev@vger.kernel.org
- S:	Maintained
+ S:	Orphan
  Q:	http://patchwork.kernel.org/project/linux-fbdev/list/
  T:	git git://anongit.freedesktop.org/drm/drm-misc
  F:	Documentation/fb/
@@@ -8985,16 -8962,13 +8993,23 @@@ M:	Deepak Saxena <dsaxena@plexity.net
  S:	Maintained
  F:	drivers/char/hw_random/ixp4xx-rng.c
 =20
+ INTEL KEEMBAY DRM DRIVER
+ M:	Anitha Chrisanthus <anitha.chrisanthus@intel.com>
+ M:	Edmund Dea <edmund.j.dea@intel.com>
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/display/intel,kmb_display.yaml
+ F:	drivers/gpu/drm/kmb/
+=20
 +INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER
 +M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-aes.yaml
 +F:	drivers/crypto/keembay/Kconfig
 +F:	drivers/crypto/keembay/Makefile
 +F:	drivers/crypto/keembay/keembay-ocs-aes-core.c
 +F:	drivers/crypto/keembay/ocs-aes.c
 +F:	drivers/crypto/keembay/ocs-aes.h
 +
  INTEL MANAGEMENT ENGINE (mei)
  M:	Tomas Winkler <tomas.winkler@intel.com>
  L:	linux-kernel@vger.kernel.org

--Sig_/8qi0JHtIjRjh.eFSKzZUn+z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/W0/0ACgkQAVBC80lX
0GyRRQf+JhtIB4eEMtaUN1EiCWo8HsYmi9p1zRP+Q5EYizSxggmTQZ8uR/ySfD0w
YIrgTLwACjuq7xLQddaZNEW9X2sV8r0D61ax1d7hvYftYwQWF5zYHuqdTj99sfgm
xCpxvpWdTG/AIXUG8EqzRYPWFLYaD/FgiMiNxp5EvVHqCty4DrxOQ47AdRJXTduF
06C65eJ+RU2jKjtraoWLB6wQh22wzeQ2cUGYObP4AJdfannoDEz4Kw8CWHvFq/1P
wkmnJt8eX0xSkXOx2is/Vem5ckLyfvnUsWu3yG60syYlTF/FE1NXofsZw3SPlLn5
RIZKggHKvxU0LKkhfnWcZ0C5wPrsSg==
=PC48
-----END PGP SIGNATURE-----

--Sig_/8qi0JHtIjRjh.eFSKzZUn+z--

--===============1191622179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1191622179==--
