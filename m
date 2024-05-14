Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F528C4B9A
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 06:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800D510E029;
	Tue, 14 May 2024 04:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="toZTLfXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903D10E029
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 04:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1715659950;
 bh=O2Wi0l4W7XBeWEz7+/LJud3VO/YTi+yE6nhAkyVPKfY=;
 h=Date:From:To:Cc:Subject:From;
 b=toZTLfXA9GzuHJ64Yi9O/lmMUEzo2j0nI3wsXay64JIx/05hYZVnET4Vd6oAlYVxQ
 6b6fO/hkb8p8dMZTOmxdgwEjPPJMjBJ7pXyXAt+vAQBnQkS6FcsnrMFm73I+Bpqh1B
 3oQFfeZ4aF/tMwUU3wsqlxQaEpvKUgfRYUFK78MmjAF9zAewBJ6F2eit9mosorzM9k
 i3r/twHVFmp0TzLfY9tWfYgQOzuOmRoVZ//a6LZYvB90n7R1WZA+ET+Y0wNbavEjKv
 5SqkN8DlzXhwF94wTGFsjnQ0aBC8g1iYwYkxpblENLHJJZW4yly+1nZGHrOhP2tYLz
 Qf4ztZ1o8sqpg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdjcZ0Fhdz4wc1;
 Tue, 14 May 2024 14:12:30 +1000 (AEST)
Date: Tue, 14 May 2024 14:12:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: linux-next: manual merge of the devicetree tree with the drm tree
Message-ID: <20240514141229.5553dc13@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Vg_FtOuGI05fZTwkGy3VsR";
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

--Sig_/+Vg_FtOuGI05fZTwkGy3VsR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml

between commit:

  90ed42ceda76 ("dt-bindings: display: novatek, nt36523: define ports")

from the drm tree and commit:

  9fa6bcf23e44 ("dt-bindings: display: panel: constrain 'reg' in DSI panels=
")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/display/panel/novatek,nt36523.y=
aml
index bbeea8cfa5fb,0447ee724947..000000000000
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@@ -34,7 -40,7 +37,6 @@@ properties
    vddio-supply:
      description: regulator that supplies the I/O voltage
 =20
-   reg: true
 -  ports: true
    rotation: true
    backlight: true
 =20

--Sig_/+Vg_FtOuGI05fZTwkGy3VsR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZC5K0ACgkQAVBC80lX
0Gx/vQf+PTRLh2MO6zTQJ0J7Q6T+fQrXS+4yZPrVmkvktXL2Hxfl8tBSANSzezrR
wvGkAY/HEhRxB8UrZ8B02Yc4BhTbY3OPH2HroGi4cvb0gyDK1mGKKJyaVj8nDYqU
Vw8eJdA0GtUKWH6ljmjORY7EkPvIycjnRvoqi8tZzPj4wQYG63/AOcWZx0r3vGPG
U+rFPZB32/DorRQKKlqG4wnL7t82UDJ95761OPB6lCquDh9Nb7//Kp/GuvLIXrv0
ks3JIzk/qwrIjef5FBnPTOoo1isV6Q5Y2cG3QV1bHTzLzMUIrJNicdgzvMOnDwrz
SiOrdA+2j1MQX2Iwihrkrbmkk5oJIg==
=zFgC
-----END PGP SIGNATURE-----

--Sig_/+Vg_FtOuGI05fZTwkGy3VsR--
