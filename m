Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03BEA45203
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 02:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0773510E81E;
	Wed, 26 Feb 2025 01:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kKAVD3Oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BA310E1F9;
 Wed, 26 Feb 2025 01:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1740532369;
 bh=8+YF4WFZgfiQeCGthkw8NzPmGBGE8t9U5bXWZoc+C7U=;
 h=Date:From:To:Cc:Subject:From;
 b=kKAVD3OhFHtQ8oFLbHcD73XfYGgflGP/aKxegtq0e76Kuf1zKXZGaS/Ua7athnf1R
 9pXfkgXY08K9Qu8lfgZ4j1BfiQHmW9hvW8rA/y7EVbc3a+GHdJsGf8Ve2ms0tmauwO
 n5u5UKg6FXAdLrTZoQw5+NJXRqOZKytzLgAzeBid5eBD36Ttw2vzea18OqF53CV7Vi
 UZAIAZbNAxZ7zrxNbickkrnqs+RX/vyRIHS+qDJZlrMERWJ7tABbFjrfZj3chmNbAm
 YmpXqVIUQQhU8oBIWZH1WRfR5Hh2B+FOOpW0qIaus5e1mGyXGd7oeu5IepB+jPlhnY
 98mPA0E759ZNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2c0J3p1Tz4wby;
 Wed, 26 Feb 2025 12:12:48 +1100 (AEDT)
Date: Wed, 26 Feb 2025 12:12:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20250226121247.5d4d43ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5dYl3dOer8ymvTSJleQOLRX";
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

--Sig_/5dYl3dOer8ymvTSJleQOLRX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  1b242ceec536 ("drm/i915/audio: convert to struct intel_display")

from the drm-intel tree and commit:

  d41d048043c4 ("drm/xe/display: Drop xe_display_driver_remove()")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index 96ba9595bf2a,279b786d64dc..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -175,13 -167,13 +167,13 @@@ static void xe_display_fini(void *arg
  	struct xe_device *xe =3D arg;
  	struct intel_display *display =3D &xe->display;
 =20
- 	if (!xe->info.probe_display)
- 		return;
-=20
- 	intel_display_driver_remove_nogem(display);
+ 	intel_hpd_poll_fini(xe);
+ 	intel_hdcp_component_fini(display);
 -	intel_audio_deinit(xe);
++	intel_audio_deinit(display);
+ 	intel_display_driver_remove(display);
  }
 =20
- int xe_display_init_noaccel(struct xe_device *xe)
+ int xe_display_init(struct xe_device *xe)
  {
  	struct intel_display *display =3D &xe->display;
  	int err;

--Sig_/5dYl3dOer8ymvTSJleQOLRX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+ao8ACgkQAVBC80lX
0GyzjAgAhMsX12+KJ9Pz5WUx3MZjo03zVhsxWhEdZhiV/mKvcujnV1x4uqK2yDAj
q2wofMf/8RRM1Q9BFQyOLR372ub2HYPQo2iilFEs3oz4Tjxi2PQh+WOQFh2z+U5P
Lcnf77BTtBVotegeVab/S4O+sN/Fi1GyUK+bZwrVhNzOkF0FVlnnFE2vcjAFVf9N
t2BEjYO5SW4zh6Xyumkdbwj82CBzzes7hLvM4uPaHHU9r4mT8Xlpc0qXrsXAI65f
ybIaWNegoxKEdi8shzlGIt2n0HRq1y6nz3vGwByc05faRceq5eZDP6+m7EpX6c+X
ik6l6dspLndWee1A22W+w+ggbjCgIg==
=XG4Q
-----END PGP SIGNATURE-----

--Sig_/5dYl3dOer8ymvTSJleQOLRX--
