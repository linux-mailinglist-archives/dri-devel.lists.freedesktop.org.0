Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F138BC1D
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 03:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDCA89AA7;
	Fri, 21 May 2021 01:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85798916F;
 Fri, 21 May 2021 01:58:16 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmVBF1pGXz9sVt;
 Fri, 21 May 2021 11:58:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1621562294;
 bh=YKiJJ5vfpxMNe5T8vLLSeZo6uiKw1uqUqAKy5C3g0rg=;
 h=Date:From:To:Cc:Subject:From;
 b=u/6hc///Ob7Uue0j64OZ0pz1rKWyMZ/ilIbQI/7eYU4yX8+6+fJNbECEoGOsV8o5D
 betMX8bOEhu9gGAr+UNy1wGDW765hIUDKHbtOPMKnyF+zJsEbemD9BuoA48ZBmKgvL
 wxobz9VZC+v8i6ZdtFpqRC7krAoPnv/mtjB2QAz5ornitKBdLyZ2qSeFwHyPLt+APf
 TcyW7rcOcD15Yo5dBojNGBtAZKtt3efz2uYCKqBSZz3v41ro/SdoYCR7B9vwxAiLas
 bwyuv04/t/C/Ej+zZyJIg96jeQWN5Aim4hkb5eCNLzTZtONjsb9KaD/2GZErwrttWv
 ZDRLlrQ4NX5gA==
Date: Fri, 21 May 2021 11:58:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20210521115812.1f8680bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X_1rq9i10KBI.rsWyD/3wED";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/X_1rq9i10KBI.rsWyD/3wED
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/gvt/handlers.c: In function 'init_skl_mmio_info':
drivers/gpu/drm/i915/gvt/handlers.c:3345:9: error: 'CSR_SSP_BASE' undeclare=
d (first use in this function); did you mean 'DMC_SSP_BASE'?
 3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
      |         ^~~~~~~~~~~~
drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of macro '=
MMIO_F'
 2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
      |                                                ^~~
drivers/gpu/drm/i915/gvt/handlers.c:3345:2: note: in expansion of macro 'MM=
IO_D'
 3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
      |  ^~~~~~
drivers/gpu/drm/i915/gvt/handlers.c:3345:9: note: each undeclared identifie=
r is reported only once for each function it appears in
 3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
      |         ^~~~~~~~~~~~
drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of macro '=
MMIO_F'
 2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
      |                                                ^~~
drivers/gpu/drm/i915/gvt/handlers.c:3345:2: note: in expansion of macro 'MM=
IO_D'
 3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
      |  ^~~~~~
drivers/gpu/drm/i915/gvt/handlers.c:3346:9: error: 'CSR_HTP_SKL' undeclared=
 (first use in this function); did you mean 'DMC_HTP_SKL'?
 3346 |  MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
      |         ^~~~~~~~~~~
drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of macro '=
MMIO_F'
 2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
      |                                                ^~~
drivers/gpu/drm/i915/gvt/handlers.c:3346:2: note: in expansion of macro 'MM=
IO_D'
 3346 |  MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
      |  ^~~~~~
drivers/gpu/drm/i915/gvt/handlers.c:3347:9: error: 'CSR_LAST_WRITE' undecla=
red (first use in this function); did you mean 'DMC_LAST_WRITE'?
 3347 |  MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
      |         ^~~~~~~~~~~~~~
drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of macro '=
MMIO_F'
 2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
      |                                                ^~~
drivers/gpu/drm/i915/gvt/handlers.c:3347:2: note: in expansion of macro 'MM=
IO_D'
 3347 |  MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
      |  ^~~~~~
In file included from drivers/gpu/drm/i915/i915_drv.h:64,
                 from drivers/gpu/drm/i915/gvt/handlers.c:39:
drivers/gpu/drm/i915/gvt/handlers.c: At top level:
drivers/gpu/drm/i915/gvt/handlers.c:3658:21: error: 'CSR_MMIO_START_RANGE' =
undeclared here (not in a function); did you mean 'DMC_MMIO_START_RANGE'?
 3658 |  {D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
      |                     ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/i915_reg.h:185:47: note: in definition of macro '_MMIO'
  185 | #define _MMIO(r) ((const i915_reg_t){ .reg =3D (r) })
      |                                               ^

Caused by commit

  0633cdcbaa77 ("drm/i915/dmc: Rename macro names containing csr")

I have used the drm-intel tree from next-20210520 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/X_1rq9i10KBI.rsWyD/3wED
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnE7QACgkQAVBC80lX
0GyWKgf9FhTLYXrDxj5B3cqWCYudB70j1lqfCiwVHuma5A/C3D+owuO1kDRVHau4
8Anq+qZIxU+Po1kIXSCi4HTSfn4sZRRDtbrVIpJZ/nR1T2bDgZVdpSQWsGJKnetw
BRuZRHyu2S/PT27P7PnSs0ye6s9KxcdZm4MKb0PQRAVaTsBojgcSEKIyAqwks3ux
SPpcUqyVtfnDUExXKU4SaCNHVLNFvtdnDtjXJzNvmG6xTgI4vieePaC8LCMYtEYb
CpcHIIOYCdwETcUPdvYB2wrvg81l95qoam1UBS2zK/6egxNn7FfkRop3ENXQ4lPO
gEwy3peESSNX1u8x2wzrVMctVsKy/g==
=+Gw7
-----END PGP SIGNATURE-----

--Sig_/X_1rq9i10KBI.rsWyD/3wED--
