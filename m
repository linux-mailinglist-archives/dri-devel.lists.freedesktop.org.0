Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE5F50051
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 05:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4A6897DC;
	Mon, 24 Jun 2019 03:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67437897DC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 03:41:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45XFTT53Ppz9s4Y;
 Mon, 24 Jun 2019 13:41:48 +1000 (AEST)
Date: Mon, 24 Jun 2019 13:41:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: linux-next: manual merge of the drm tree with the jc_docs tree
Message-ID: <20190624134147.4950d388@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1561347711;
 bh=cgZrHxNz9vn4rcX8WT5IEz3w+4jbHRYMfWBxIvIlDjM=;
 h=Date:From:To:Cc:Subject:From;
 b=l5hKRq1c5WEyAM3WF2Ec5V02VUf4077RvAXNlWq/5W9ywXUIHsoYOOfTjdT4W+2NA
 T4L8UCev1xw2dZdv9xPo6DBIqZMLrgc0G/qboeKWm9Sh02OIkETpNfbvUVFz2yfX1z
 BUiMmdfhEwOVqHUEJFrNnc3sYY3s1RmWC65qF5IZf23yc35m2iXwZ2paNuYWAwzRK5
 7kBQmPLae7gzGK+Rw1j4KUWZgFU9L6UAnDpu96xcua26ZcOSZ8IeKGV8xMd9h5KXgr
 etJF/N4H8ZcSbqIKtwB66xDVy9j5yZheITsVHyt0mKVQ/dVcyZ9ZeC10DDRmG1+56b
 51fj4squ4n6Vw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0849149081=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0849149081==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/E6I3n5WWx4soXp1+CCk8fqA"; protocol="application/pgp-signature"

--Sig_/E6I3n5WWx4soXp1+CCk8fqA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/fb/modedb.rst

between commit:

  ab42b818954c ("docs: fb: convert docs to ReST and rename to *.rst")

from the jc_docs tree and commit:

  1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflection on the=
 commandline")

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

diff --cc Documentation/fb/modedb.rst
index 3c2397293977,1dd5a52f9390..000000000000
--- a/Documentation/fb/modedb.rst
+++ b/Documentation/fb/modedb.rst
@@@ -45,18 -45,29 +45,32 @@@ signals (e.g. HDMI and DVI-I). For othe
  is specified the output is disabled.
 =20
  You can additionally specify which output the options matches to.
 -To force the VGA output to be enabled and drive a specific mode say:
 +To force the VGA output to be enabled and drive a specific mode say::
 +
      video=3DVGA-1:1280x1024@60me
 =20
 -Specifying the option multiple times for different ports is possible, e.g=
.:
 +Specifying the option multiple times for different ports is possible, e.g=
.::
 +
      video=3DLVDS-1:d video=3DHDMI-1:D
 =20
+ Options can also be passed after the mode, using commas as separator.
+=20
+        Sample usage: 720x480,rotate=3D180 - 720x480 mode, rotated by 180 =
degrees
+=20
+ Valid options are:
+=20
+   - margin_top, margin_bottom, margin_left, margin_right (integer):
+     Number of pixels in the margins, typically to deal with overscan on T=
Vs
+   - reflect_x (boolean): Perform an axial symmetry on the X axis
+   - reflect_y (boolean): Perform an axial symmetry on the Y axis
+   - rotate (integer): Rotate the initial framebuffer by x
+     degrees. Valid values are 0, 90, 180 and 270.
+=20
+=20
 -***** oOo ***** oOo ***** oOo ***** oOo ***** oOo ***** oOo ***** oOo ***=
**
 +-------------------------------------------------------------------------=
----
 =20
  What is the VESA(TM) Coordinated Video Timings (CVT)?
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
 =20
  From the VESA(TM) Website:
 =20

--Sig_/E6I3n5WWx4soXp1+CCk8fqA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0QRnsACgkQAVBC80lX
0Gx0cwf3fCk0CQmL2h2Rgzc6JZL2t9sBQDJbkWLPJVPZGyxnZ0D+TcCPlTWftKvI
2peumOz0dWq8p7TQxyfqIPCNwTQoCWRTV73N2EpIpq5auz6TVD5b6joRj1e7avqi
Dqt9bc7SImm0yzq/LI+/5+lNV4vmKi4ZWeadx4R1xzKj1el1T9tMEyHCAf8kKmTt
gU0GTgyrNfiHtxqpmRazNkqC6eMZWiZJjs9I6AD3tauwWOxEP5JVrPo8MtK3o0N0
lQrhzlZM/GVCweKT3qnf7qs0kP2o9wffUyb7DNQzRH1p02wKNLrhONcx6wH76kGo
yOOuwXims8FCK7AkbT/Sj56I90U1
=1y4c
-----END PGP SIGNATURE-----

--Sig_/E6I3n5WWx4soXp1+CCk8fqA--

--===============0849149081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0849149081==--
