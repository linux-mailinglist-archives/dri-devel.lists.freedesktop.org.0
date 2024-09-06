Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328EE96E80D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 05:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2B510E95D;
	Fri,  6 Sep 2024 03:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="u7gtWNH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC9010E95D;
 Fri,  6 Sep 2024 03:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1725592504;
 bh=QMIlXfEUeKgJL/ulsag1T3e133MiIVGIWcDrY3RH+Ws=;
 h=Date:From:To:Cc:Subject:From;
 b=u7gtWNH6Jk/fXt/kPTWPmYn46m36/+XWV5rXDbFhpEhMbFV0KzSPxHuNXkwpUUwhu
 un11fJcv6HW/eeVsCxbhZ9nw4Z5P5ACPKqLRUtGl5nlEl/gIPR49l59sy2Y5qfPwaz
 CCyru6g3w7liA+94R9AIYqK2tJt/FJSZXCJKfExkQc/NcA+Kur5BNxABhizveFlQMC
 rBbMj2YqU1jUNXXsAvuIT2xOLYjsruzVbDYDpaPWbdemFPYsqpPI+GdgjrKYPphmdE
 eG0oj0befUe6EnzQ3zImoe5e3eyJOH4kdUMAhM5wrEGH5wPszCelbv0J0+w+e9dYJf
 TD1ksuAsByKtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0LvC2zVXz4wxx;
 Fri,  6 Sep 2024 13:15:03 +1000 (AEST)
Date: Fri, 6 Sep 2024 13:15:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20240906131502.7a7d1962@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F3S_2xZpz8_i.Yz3/rhYYC2";
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

--Sig_/F3S_2xZpz8_i.Yz3/rhYYC2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  11d0613af7c5 ("drm/i915/display: include drm/drm_probe_helper.h where nee=
ded")

from the drm-intel tree and commit:

  87d8ecf01544 ("drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_=
drm.h>")

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
index 303d00b99a68,75736faf2a80..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -10,8 -10,7 +10,8 @@@
 =20
  #include <drm/drm_drv.h>
  #include <drm/drm_managed.h>
 +#include <drm/drm_probe_helper.h>
- #include <drm/xe_drm.h>
+ #include <uapi/drm/xe_drm.h>
 =20
  #include "soc/intel_dram.h"
  #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */

--Sig_/F3S_2xZpz8_i.Yz3/rhYYC2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbac7YACgkQAVBC80lX
0GyngggAk/um0PJ+wiMnG/0T4jvmtqTKfZ8/LO4Yws+D4nTJ09Qnh7nUyH/3Dt0p
hfEjzoHhIakOQH7iPgzfwdPxEzszv8WfgSygAunI1g6QZJT6HHnrbZKGdkzGG3ma
TVBQpTMdDJuT4yBfflM5NCStSonCjDak2SL9lVbSi9Q0mlWTyOSF134tmcxoYZmc
OMblFMcIOt/g95Tx/1EVzli+iT2hqNc+DT7B7pVHVyqrukVUV9eXovagTF4FejDa
fUnKx0fS+Ng8h6FUKcILE/i4heCSQ7ziygsLUZ8nWzyHsjsBi4QCIYxjMz+ELZAZ
eBqeUbREtvf5vAXhIveJqeCNI1anag==
=x7jU
-----END PGP SIGNATURE-----

--Sig_/F3S_2xZpz8_i.Yz3/rhYYC2--
