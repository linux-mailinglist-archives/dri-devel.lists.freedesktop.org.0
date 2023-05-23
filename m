Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8A270CFB2
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 02:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221E110E08C;
	Tue, 23 May 2023 00:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDD610E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:43:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QQFt63zXKz4x48;
 Tue, 23 May 2023 10:43:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1684802607;
 bh=wR7JFpABtkHvbbbYe13yOqB8fGX0TUQ0Yg/dvCpATgQ=;
 h=Date:From:To:Cc:Subject:From;
 b=aiVkLfrqtzR/YRF1FRXNPa5R0Wo+GriJRGMXbmjmcDt4w8A8idVfKqd2K2hL4Ufn0
 GtazcmuCp0h5Kq12941imoEtNR2zvBO7VE0xuOxUfI+6KJhcJueSWCCcC/zMk4sd5V
 fcJy5xl/IIMLeEE1uKUxz5v7Sxnl0gpipGAIYznJsuvNaQfbsDX7HuUeNWJIIIkq0m
 ify3NYx7rOR1wzdIR7UeCoEbdj00ebmPaJsMWaR/yw6BogXIAOvVU7ZKJCRki7fakb
 w22uOVC8LM+Nm236sidFl7vfUCcNITaCvNaCAiYmQqnUFUhMKSWRLuHkq7exBHesF8
 Eo/f67ksSTPjA==
Date: Tue, 23 May 2023 10:43:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230523104324.602c426a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VanIubOJiW/o7W59wYZSUZ=";
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Artur Weber <aweber.kernel@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VanIubOJiW/o7W59wYZSUZ=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  MAINTAINERS

between commit:

  80e62bc8487b ("MAINTAINERS: re-sort all entries and fields")

from Linus' tree and commit:

  0dd53308f74f ("MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel contr=
oller driver")

from the drm-misc tree.

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
index 8e18bbafa740,7cc2bfa4af6f..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -6700,6 -6663,35 +6700,12 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
  F:	drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 =20
+ DRM DRIVER FOR SAMSUNG S6D7AA0 PANELS
+ M:	Artur Weber <aweber.kernel@gmail.com>
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
+ F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+=20
 -DRM DRIVER FOR SITRONIX ST7703 PANELS
 -M:	Guido G=C3=BCnther <agx@sigxcpu.org>
 -R:	Purism Kernel Team <kernel@puri.sm>
 -R:	Ondrej Jirman <megous@megous.com>
 -S:	Maintained
 -F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.y=
aml
 -F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
 -
 -DRM DRIVER FOR FIRMWARE FRAMEBUFFERS
 -M:	Thomas Zimmermann <tzimmermann@suse.de>
 -M:	Javier Martinez Canillas <javierm@redhat.com>
 -L:	dri-devel@lists.freedesktop.org
 -S:	Maintained
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
 -F:	drivers/gpu/drm/drm_aperture.c
 -F:	drivers/gpu/drm/tiny/ofdrm.c
 -F:	drivers/gpu/drm/tiny/simpledrm.c
 -F:	drivers/video/aperture.c
 -F:	drivers/video/nomodeset.c
 -F:	include/drm/drm_aperture.h
 -F:	include/linux/aperture.h
 -F:	include/video/nomodeset.h
 -
  DRM DRIVER FOR SITRONIX ST7586 PANELS
  M:	David Lechner <david@lechnology.com>
  S:	Maintained

--Sig_/VanIubOJiW/o7W59wYZSUZ=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRsDCwACgkQAVBC80lX
0GxlHwgAoqNefHg17EErrEPKdWYkBzpCztwGe7VJBOBwNT43gcHifK71DiEv10dL
E0xKvMv3324zlcv6kCaj4dDuPUoQ7KoPVdD7zNNfKepJuFyXNVh1JGbX6fJnkRza
R32DacwEkHG+ol+yK/2hJA8JjtY/Yz6JghiZBkRiAFj9bOjomDLTUiSz1Kkk+yLG
mGUvy7o2KFsMISj40q/y5hAW9cyAg2riv7bUvD+Kdk6+HCIm4n2C08Gad1GheEJ4
MWYFs6P8frtxZpMfmVh7YtuH3ZjPcOU6H0vipIvZWfqVbQ5wJqAJOIwS+SwaVbzJ
XIv2eodeuJoZgZ5TEz2IIFQS0mpC0Q==
=HmDe
-----END PGP SIGNATURE-----

--Sig_/VanIubOJiW/o7W59wYZSUZ=--
