Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1761C3183
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 05:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E0489F63;
	Mon,  4 May 2020 03:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E7689F63
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 03:52:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fppq0Lzgz9sSm;
 Mon,  4 May 2020 13:52:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1588564373;
 bh=6O/gTKsKfyQgDitWq0l6CCrgWrqbk/bSQq70qnnSe3E=;
 h=Date:From:To:Cc:Subject:From;
 b=S7jBsOJWmznqSx1FAqVyzn88QdxQmSP+VBwGijonT5xHux/1CM+6LgjfeTcyjs4Gx
 ucPBtPjf7QA+eBv1QxLjNOVGGKA+V1Mmv7Ch3azEOQ8X9gM+vsTC+2FE3HgiWRGLHQ
 9yPrd+QTWw1jyTvELf1ebdia5rwKPha6paRcZbJvrfDlCfqE46a7lrvk4GNtgER+su
 7zd3Jm/VWxwRFY6BhSt+WM2YfB/HZ4W74tE1NsI6GqiXogksLJFBbV8yMvNhb8cIJS
 92poDUyaKDlYBaGMKWGgSDPdtzt9zz9DLJROdubmG8Aku4WvcjcH2KXDVSUVMvDWOx
 WYNefqynvcG6g==
Date: Mon, 4 May 2020 13:52:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robherring2@gmail.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the devicetree tree with the drm tree
Message-ID: <20200504135250.51966c49@canb.auug.org.au>
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
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0777780258=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0777780258==
Content-Type: multipart/signed; boundary="Sig_/IU7RdpOOufZBs8ITHvKaWMh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IU7RdpOOufZBs8ITHvKaWMh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/display/panel/panel-common.yaml

between commit:

  92e513fb0798 ("dt-bindings: display: grammar fixes in panel/")

from the drm tree and commit:

  3d21a4609335 ("dt-bindings: Remove cases of 'allOf' containing a '$ref'")

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

diff --cc Documentation/devicetree/bindings/display/panel/panel-common.yaml
index 17b8367f12dd,db3d270a33c6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@@ -63,11 -61,10 +61,10 @@@ properties
 =20
    display-timings:
      description:
 -      Some display panels supports several resolutions with different tim=
ing.
 +      Some display panels support several resolutions with different timi=
ngs.
        The display-timings bindings supports specifying several timings and
 -      optional specify which is the native mode.
 +      optionally specifying which is the native mode.
-     allOf:
-       - $ref: display-timings.yaml#
+     $ref: display-timings.yaml#
 =20
    # Connectivity
    port:

--Sig_/IU7RdpOOufZBs8ITHvKaWMh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6vkZIACgkQAVBC80lX
0GzgGAf6AnkTS9RySIb8lS8RUC4ksAylmyKYPffMLVU8BUG8Ao7cRfSaPsALfaNf
W9yr1VA1+jcFqj8CjG0Tjm+O5Gz+Rc/L1GC0Og/7cls5bUkXvYNaNx3Do4ovS+ZM
5jIf8q2JxhpJod14CX/MskBzqlBVTElg9kAlzzpOkHnInmvbTzXZ2WcSXcPp/M73
R5+c7zwW4ba3GzUcj6MmnxCxP51mdvB+6uYNlUU7thZ5qeQHt6FucdSNzxH8KdJU
s4x4lFpIGOE0NHgxWJvmjpZyK/3Do5kQRsVd6GJLGbIFw0eS0UxIHLlGOUVboCcB
NbPR89aw5DtXdvXpEbimJ6VUyp5crQ==
=cs8Y
-----END PGP SIGNATURE-----

--Sig_/IU7RdpOOufZBs8ITHvKaWMh--

--===============0777780258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0777780258==--
