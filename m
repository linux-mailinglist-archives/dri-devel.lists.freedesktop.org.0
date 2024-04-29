Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B6D8B4FAF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 05:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDAC10EE69;
	Mon, 29 Apr 2024 03:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OFvPKKzx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A02310E099;
 Mon, 29 Apr 2024 03:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1714360368;
 bh=2FzFPUX3bLG3faCR0xhttaBk0b99Aw0RFjXJ8hQd4cE=;
 h=Date:From:To:Cc:Subject:From;
 b=OFvPKKzx+stCGjTBRA6T6BVN2JBAFtMIHeJ2LrLdz24W3pcCvyT+NhtlM2+fp2ovp
 R/n8rCWQjTO+AZMIo+xgVyvs6YoH4/SEc/sIV2jQwvEQt30XEMvxfJahRUHAGKw2GM
 tOXnaR2DVaeQuayNfDIfGnK14X0KbsMZxDCkdoKEhQhlCHJiQ6jpTWndc2E8GrhWp+
 D0YFgPlc6T2EFgYopHh4mUiKTYCpwl3T7Er+1417aD/aPUJaU3rWgSQavcXBVz96zJ
 nfpCl8V+vSpA2ohTfNfmEdoADJ8ePER4zeqeXrAUJ86Gq+ru/zMn33buuCyT4TXGwW
 lUuvDcyrVpkEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VST0b4VLWz4wyp;
 Mon, 29 Apr 2024 13:12:47 +1000 (AEST)
Date: Mon, 29 Apr 2024 13:12:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm tree
Message-ID: <20240429131245.5d4fcc37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O.2GsTH7sUrY0rG9nG7feeQ";
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

--Sig_/O.2GsTH7sUrY0rG9nG7feeQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h

between commit:

  cb4046d289bd ("drm/i915: Drop dead code for xehpsdv")

from the drm tree and commit:

  6a2a90cba12b ("drm/xe/display: Fix ADL-N detection")

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

diff --cc drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index ffaa4d2f1eed,9ee694bf331f..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@@ -78,8 -84,11 +78,9 @@@ static inline struct drm_i915_private *
  #define IS_ROCKETLAKE(dev_priv)	IS_PLATFORM(dev_priv, XE_ROCKETLAKE)
  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
  #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
- #define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
+ #define IS_ALDERLAKE_P(dev_priv) (IS_PLATFORM(dev_priv, XE_ALDERLAKE_P) |=
| \
+ 				  IS_PLATFORM(dev_priv, XE_ALDERLAKE_N))
 -#define IS_XEHPSDV(dev_priv) (dev_priv && 0)
  #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
 -#define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
  #define IS_METEORLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_METEORLAKE)
  #define IS_LUNARLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_LUNARLAKE)
  #define IS_BATTLEMAGE(dev_priv)  IS_PLATFORM(dev_priv, XE_BATTLEMAGE)

--Sig_/O.2GsTH7sUrY0rG9nG7feeQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYvEC0ACgkQAVBC80lX
0GxeEwf+JyDY0T+hn6eCyOuA9aEMlFHOEU4DvYaWY8f0W/5gqxkXzIHajzcPIFJ7
U66qycz4Jubk+RmfA4MEwHzAZjE2p51RKiE/UuastXFQppA6rAwvyCOZkStTl79N
PdU0/lTq/N4OKdLyVm7W09FdN7y6PZxX/gH1ykqAWaJLEoUBsNPu9Hh4jOTVdGmO
dVcZcS8/xwgbXBdYQzuVb776ty0tNnRVSTDJyTbMlh5ioEynjbHbMjYGtSSA6fYM
JYGH7NZzpc1t+UG1kWrhdSfiWIb04GfWU03vw0t1U9F+Eo6Cf70cbZMiYbdUaSbU
LD0KSF1hvIBhpTRS+PJh0GziFSC9ug==
=SlGa
-----END PGP SIGNATURE-----

--Sig_/O.2GsTH7sUrY0rG9nG7feeQ--
