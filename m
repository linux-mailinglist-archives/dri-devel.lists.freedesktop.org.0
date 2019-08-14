Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB138C9C2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 04:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59956E22D;
	Wed, 14 Aug 2019 02:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D5B6E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 02:59:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467Z6X47RPz9sNC;
 Wed, 14 Aug 2019 12:59:00 +1000 (AEST)
Date: Wed, 14 Aug 2019 12:58:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, Dave
 Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20190814125859.35c1a2ca@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1565751540;
 bh=SgzxPbunzDlk0vpfnIGzHSvRfrYFy7BKMOSoNt6hY78=;
 h=Date:From:To:Cc:Subject:From;
 b=nSnndy//cBGZP8jBVBSIFbwmV7Gn1HN5JL5PypAOzNCHid8U+VnIA//omsbPx1DQS
 l3F/pGEqtNjeEEG578TqPF/OsRfpiuYY9HAHFNpvJ5+0XVJs9lWJHicyhF/sNJ37g5
 g7+kWbJ2YqCTUa/QtvHKR9dnjgKrZGMvUegHdDh/NYJ193o7RYGtXORwAmlc/50rqs
 dDkgQMll4hcAZyTp4tOC6XtNp3J8o2enpkvlEeDAyGqBMJb5HW1I6GEtLxmvQXxpXE
 GR4k4aexxTjsriMwqOnFjoMBFbNdxvmqpN7eKyFIMzCFdHXQPD6HeBFjSabZesdDWu
 NdRBOSGP1nTew==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1832742998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1832742998==
Content-Type: multipart/signed; boundary="Sig_/1g9vI2EL2+98FYn_39ozApq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1g9vI2EL2+98FYn_39ozApq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

between commit:

  e78ad7654179 ("drm/msm: Use drm_gem_fb_prepare_fb")

from the drm tree and commit:

  ddc73f32ba95 ("drm/msm: drop use of drmP.h")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8cf0b8a4ed03,cd6e9bb1fedf..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@@ -10,9 -21,9 +10,10 @@@
  #include <linux/debugfs.h>
  #include <linux/dma-buf.h>
 =20
- #include <drm/drm_damage_helper.h>
  #include <drm/drm_atomic_uapi.h>
 +#include <drm/drm_gem_framebuffer_helper.h>
+ #include <drm/drm_damage_helper.h>
+ #include <drm/drm_file.h>
 =20
  #include "msm_drv.h"
  #include "dpu_kms.h"

--Sig_/1g9vI2EL2+98FYn_39ozApq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1TePQACgkQAVBC80lX
0Gy6ugf/SAOlPu3E26OGnU9rpI4HyT3h0z1VyDFxQ5P5iN/PMZGNkAfq69NdN7aw
cuGSakzv3jRC3SLZsXGYZh2pCKhXSdejXKrlhbS6sHzY3TCyDXbP/6oTU6zEp/F6
xysxVbbL8CzW0SHvL68v6uOn0rf26xDI5/WbCSomAZHrL+uGADBGXqsiHIQ4BOlQ
uKo2GBpzbILrPralQvn5EXAJMqe22XgssjuT3cs9OpVdn+fR9/JzSbhlU/LRxAeE
r0XvwwkCCj+NymuejiDpy27mmfvodQYEw+CHBHfKol70nYYo4aDl0rK6Uo5Uv18/
qIsGtQ26Ngb9bMUPWibdYoT8ZgzUsA==
=F8Pt
-----END PGP SIGNATURE-----

--Sig_/1g9vI2EL2+98FYn_39ozApq--

--===============1832742998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1832742998==--
