Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8491AB571
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 03:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B37D6E05D;
	Thu, 16 Apr 2020 01:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 85139 seconds by postgrey-1.36 at gabe;
 Thu, 16 Apr 2020 01:25:29 UTC
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C806E05D;
 Thu, 16 Apr 2020 01:25:28 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 492hNz2ng9z9sR4;
 Thu, 16 Apr 2020 11:25:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1587000326;
 bh=x3lpdVUepnNgZQf7tZXXTh4P8pqMEPhXHfvV9QGBu1U=;
 h=Date:From:To:Cc:Subject:From;
 b=adEKi4mPSl/DAn2aUbOCZMdSE75cWBVRHEAU51KWKVgEG1SUS72HmOhiZC3QTreNL
 qmrRl+1bzt/zWkI8XD9bawy4JMtDEl0t5FaQhRszwGe2oljGGJuX38qLJJpa8uY00f
 H6lv8aUrKkKCmEFUIigNqU3V9shsiPxFoKKbWMD+/B0aYtAdsTPK7taD0gcGEnHtLH
 i9GTQAPJzzoiLSJNxNCv1Z+wQpKNGpvFalFbQqQNl2LlcZkJFj9LChegocfuaFalDo
 81g40isLTiPIu/idFHaXeZv4Dk3xmPacjtt3/+s2GrTWkbOP8Aa3yDmk1MBcgqb1KA
 xHRKx9ZKXBizw==
Date: Thu, 16 Apr 2020 11:25:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20200416112519.7a1fdd8b@canb.auug.org.au>
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
Cc: Joe Perches <joe@perches.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0112056403=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0112056403==
Content-Type: multipart/signed; boundary="Sig_/9prFsjk7hua=0QSd8qYIwww";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9prFsjk7hua=0QSd8qYIwww
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  MAINTAINERS

between commits:

  4400b7d68f6e ("MAINTAINERS: sort entries by entry name")
  3b50142d8528 ("MAINTAINERS: sort field names for all entries")

from Linus' tree and commits:

  5304058b1526 ("dt-bindings: display: convert arm,versatile-tft-panel to D=
T Schema")
  c1eb28405d3a ("dt-bindings: display: convert boe,himax8279d to DT Schema")
  1aa3bf853cb4 ("dt-bindings: display: convert raydium,rm67191 to DT Schema=
")
  8b9e7ace123d ("dt-bindings: display: convert olimex,lcd-olinuxino to DT S=
chema")

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
index a7f3c96eb61e,ccd0ccfce4eb..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -5037,14 -5019,32 +5037,14 @@@ M:	Sumit Semwal <sumit.semwal@linaro.or
  L:	linux-media@vger.kernel.org
  L:	dri-devel@lists.freedesktop.org
  L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 +S:	Maintained
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
 +F:	Documentation/driver-api/dma-buf.rst
  F:	drivers/dma-buf/
 +F:	include/linux/*fence.h
  F:	include/linux/dma-buf*
  F:	include/linux/dma-resv.h
- K:	dma_(buf|fence|resv)
 -F:	include/linux/*fence.h
 -F:	Documentation/driver-api/dma-buf.rst
+ K:	\bdma_(?:buf|fence|resv)\b
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
 -
 -DMA-BUF HEAPS FRAMEWORK
 -M:	Sumit Semwal <sumit.semwal@linaro.org>
 -R:	Andrew F. Davis <afd@ti.com>
 -R:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 -R:	Liam Mark <lmark@codeaurora.org>
 -R:	Laura Abbott <labbott@redhat.com>
 -R:	Brian Starkey <Brian.Starkey@arm.com>
 -R:	John Stultz <john.stultz@linaro.org>
 -S:	Maintained
 -L:	linux-media@vger.kernel.org
 -L:	dri-devel@lists.freedesktop.org
 -L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 -F:	include/uapi/linux/dma-heap.h
 -F:	include/linux/dma-heap.h
 -F:	drivers/dma-buf/dma-heap.c
 -F:	drivers/dma-buf/heaps/*
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
 =20
  DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
  M:	Vinod Koul <vkoul@kernel.org>
@@@ -5255,10 -5226,15 +5255,10 @@@ F:	drivers/gpu/drm/pl111
 =20
  DRM DRIVER FOR ARM VERSATILE TFT PANELS
  M:	Linus Walleij <linus.walleij@linaro.org>
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
  S:	Maintained
 -F:	drivers/gpu/drm/panel/panel-arm-versatile.c
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
- F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-pane=
l.txt
+ F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-pane=
l.yaml
 -
 -DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
 -M:	Dave Airlie <airlied@redhat.com>
 -S:	Odd Fixes
 -F:	drivers/gpu/drm/ast/
 +F:	drivers/gpu/drm/panel/panel-arm-versatile.c
 =20
  DRM DRIVER FOR ASPEED BMC GFX
  M:	Joel Stanley <joel@jms.id.au>
@@@ -5283,8 -5254,8 +5283,8 @@@ F:	drivers/gpu/drm/bochs
  DRM DRIVER FOR BOE HIMAX8279D PANELS
  M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
  S:	Maintained
- F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
 -F:	drivers/gpu/drm/panel/panel-boe-himax8279d.c
+ F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
 +F:	drivers/gpu/drm/panel/panel-boe-himax8279d.c
 =20
  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
  M:	Linus Walleij <linus.walleij@linaro.org>
@@@ -5301,8 -5272,8 +5301,8 @@@ F:	drivers/gpu/drm/panel/panel-feixin-k
  DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
  M:	Jagan Teki <jagan@amarulasolutions.com>
  S:	Maintained
- F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30=
d.txt
 -F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+ F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30=
d.yaml
 +F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
 =20
  DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
  M:	Hans de Goede <hdegoede@redhat.com>
@@@ -5384,8 -5355,8 +5384,8 @@@ F:	include/uapi/drm/nouveau_drm.
  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
  M:	Stefan Mavrodiev <stefan@olimex.com>
  S:	Maintained
- F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.t=
xt
 -F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+ F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.y=
aml
 +F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
 =20
  DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
  M:	Noralf Tr=C3=B8nnes <noralf@tronnes.org>
@@@ -5418,12 -5395,6 +5418,12 @@@ S:	Orphan / Obsolet
  F:	drivers/gpu/drm/r128/
  F:	include/uapi/drm/r128_drm.h
 =20
 +DRM DRIVER FOR RAYDIUM RM67191 PANELS
 +M:	Robert Chiras <robert.chiras@nxp.com>
 +S:	Maintained
- F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
++F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 +F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 +
  DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
  M:	Guido G=C3=BCnther <agx@sigxcpu.org>
  R:	Purism Kernel Team <kernel@puri.sm>
@@@ -5441,18 -5412,18 +5441,18 @@@ S:	Orphan / Obsolet
  F:	drivers/gpu/drm/sis/
  F:	include/uapi/drm/sis_drm.h
 =20
 -DRM DRIVER FOR SITRONIX ST7701 PANELS
 -M:	Jagan Teki <jagan@amarulasolutions.com>
 -S:	Maintained
 -F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
 -F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 -
  DRM DRIVER FOR SITRONIX ST7586 PANELS
  M:	David Lechner <david@lechnology.com>
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
  S:	Maintained
 -F:	drivers/gpu/drm/tiny/st7586.c
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
  F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 +F:	drivers/gpu/drm/tiny/st7586.c
 +
 +DRM DRIVER FOR SITRONIX ST7701 PANELS
 +M:	Jagan Teki <jagan@amarulasolutions.com>
 +S:	Maintained
- F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
++F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 +F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
 =20
  DRM DRIVER FOR SITRONIX ST7735R PANELS
  M:	David Lechner <david@lechnology.com>

--Sig_/9prFsjk7hua=0QSd8qYIwww
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Xs/8ACgkQAVBC80lX
0Gwacwf/W45yTeyMp54HAyhilFqoLAVJta3sJ7yPhY0ihcAiZaB9wOwmjPuLG4bW
yum5ONzupXmrY8InFS+OLYZ7ScnW09guLLcBzfvyeDGK9+EglZ1XQEzWsCAH7PsH
hFYt9/A/2enl49aZywuNscOkcvLAH1Mcxq1kGHyT1yq6rj9q9pDfUU4T6Le7dDgH
Y9jMf4GBjQ0sVGyvKA4yVs4sOOJBi0as3lXdHR2sNkgURw1sG2XkK2YQhOx6yi1o
Yj4WYZP8QAWNcqLiSzb5klM79fcZFXEoBzjwMo6nXN7GYNLs9O1gNC4ip6LKnpUz
pp1qy98NsmihCl7rJmWiU1YBhA2Ufg==
=aNN5
-----END PGP SIGNATURE-----

--Sig_/9prFsjk7hua=0QSd8qYIwww--

--===============0112056403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0112056403==--
