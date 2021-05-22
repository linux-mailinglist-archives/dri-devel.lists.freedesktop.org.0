Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB7538D737
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 21:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25D26E0E1;
	Sat, 22 May 2021 19:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A16E0B6;
 Sat, 22 May 2021 19:19:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621711179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=keihVSenLp7v0leI4nQBUxeT3Igrlvuen5b+ro8424E=;
 b=lSVb+AmfUJ9Uyo77QogFFToG0ADRBjkyd4qAk1B1Ls0tbzmfwt3vXqvPEmt+tw3eEgf6CF
 GKXkjSs205lCkaqAB+30pppbx95T9NOs/k59h2R17ARrLrqgh54DhKUMb8AzH0ufG6PWHw
 3L8Wa6KRPnw2XsCtjylT3hKqCr3Qarc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621711179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=keihVSenLp7v0leI4nQBUxeT3Igrlvuen5b+ro8424E=;
 b=uMgloJ5zCx6hrIThGhsz0cOCNxVFzVkBl/r11ixEXApArph60Dq802+cytm1BaunIeHXFF
 HGJ6XRzzLOmMvTDA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC56AAB5F;
 Sat, 22 May 2021 19:19:39 +0000 (UTC)
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com, jani.nikula@linux.intel.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: i915 gvt broke drm-tip; Fix ASAP
Message-ID: <58f039e1-225f-4542-8355-1ae91a225206@suse.de>
Date: Sat, 22 May 2021 21:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vktHgzuPprZbbfdW8mMu7QSWVidqVUTZa"
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
Cc: David Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vktHgzuPprZbbfdW8mMu7QSWVidqVUTZa
Content-Type: multipart/mixed; boundary="NrZUYYHDXvB3uN1P0o9PcgFMBnzL0ylXc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@redhat.com>
Message-ID: <58f039e1-225f-4542-8355-1ae91a225206@suse.de>
Subject: i915 gvt broke drm-tip; Fix ASAP

--NrZUYYHDXvB3uN1P0o9PcgFMBnzL0ylXc
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

after creating drm-tip today as part of [1], building drm-tip is now=20
broken with the error message shown below.

Some register constants appear to be missing from the GVT code. Please=20
fix ASAP.

Best regards
Thomas

tzimmermann@linux-uq9g:~/Projekte/linux> LANG=3D make -j8 W=3D1 O=3Dbuild=
-x86_64/

make[1]: Entering directory '/home/tzimmermann/Projekte/linux/build-x86_6=
4'

   GEN     Makefile

   DESCEND  objtool

   CALL    ../scripts/atomic/check-atomics.sh

   CALL    ../scripts/checksyscalls.sh

   CHK     include/generated/compile.h

   CC [M]  drivers/gpu/drm/via/via_irq.o

   CC [M]  drivers/gpu/drm/via/via_drv.o

   CC [M]  drivers/gpu/drm/i915/gvt/handlers.o

   CC [M]  drivers/gpu/drm/via/via_map.o

   CC [M]  drivers/gpu/drm/vgem/vgem_drv.o

=2E./drivers/gpu/drm/i915/gvt/handlers.c: In function 'init_skl_mmio_info=
':

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3345:9: error: 'CSR_SSP_BASE'=20
undeclared (first use in this function); did you mean 'MSR_FS_BASE'?

  3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);

       |         ^~~~~~~~~~~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of =

macro 'MMIO_F'

  2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \

       |                                                ^~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3345:2: note: in expansion of=20
macro 'MMIO_D'

  3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);

       |  ^~~~~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3345:9: note: each undeclared=20
identifier is reported only once for each function it appears in

  3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);

       |         ^~~~~~~~~~~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of =

macro 'MMIO_F'

  2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \

       |                                                ^~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3345:2: note: in expansion of=20
macro 'MMIO_D'

  3345 |  MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);

       |  ^~~~~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3346:9: error: 'CSR_HTP_SKL'=20
undeclared (first use in this function); did you mean 'DMC_HTP_SKL'?

  3346 |  MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);

       |         ^~~~~~~~~~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of =

macro 'MMIO_F'

  2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \

       |                                                ^~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3346:2: note: in expansion of=20
macro 'MMIO_D'

  3346 |  MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);

       |  ^~~~~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3347:9: error: 'CSR_LAST_WRITE' =

undeclared (first use in this function); did you mean 'DMC_LAST_WRITE'?

  3347 |  MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);

       |         ^~~~~~~~~~~~~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:2120:48: note: in definition of =

macro 'MMIO_F'

  2120 |  ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \

       |                                                ^~~

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3347:2: note: in expansion of=20
macro 'MMIO_D'

  3347 |  MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);

       |  ^~~~~~

   CC [M]  drivers/gpu/drm/via/via_mm.o

   CC [M]  drivers/gpu/drm/via/via_dma.o

In file included from ../drivers/gpu/drm/i915/i915_drv.h:64,

                  from ../drivers/gpu/drm/i915/gvt/handlers.c:39:

=2E./drivers/gpu/drm/i915/gvt/handlers.c: At top level:

=2E./drivers/gpu/drm/i915/gvt/handlers.c:3658:21: error:=20
'CSR_MMIO_START_RANGE' undeclared here (not in a function); did you mean =

'DMC_MMIO_START_RANGE'?

  3658 |  {D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},

       |                     ^~~~~~~~~~~~~~~~~~~~

=2E./drivers/gpu/drm/i915/i915_reg.h:185:47: note: in definition of macro=20

'_MMIO'

   185 | #define _MMIO(r) ((const i915_reg_t){ .reg =3D (r) })

       |                                               ^

make[5]: *** [../scripts/Makefile.build:272:=20
drivers/gpu/drm/i915/gvt/handlers.o] Error 1


[1]=20
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D304ba5dca49a21e6f4=
040494c669134787145118

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NrZUYYHDXvB3uN1P0o9PcgFMBnzL0ylXc--

--vktHgzuPprZbbfdW8mMu7QSWVidqVUTZa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCpWUoFAwAAAAAACgkQlh/E3EQov+Cu
7Q//bMsxVLlpBKuDu+yV7CNlJfYHb/sW2OIsuTH2cPYgmPwvL6SsaesKKQxJqcnisZnE30/pXEjY
rUrhb8GoOl5v+yVoUEV5AWCe62+pjaoEQHhji6MRoWuBMObOwD3EDdLECxhGovB9P4STSenZNUZ3
RJCfxsVr9j4AFHwDC5AQaLgC27cS6fEXNhpnfYNQVEmN74lHM2WaUSbJp7iKbtXStnHKZCC81nO/
VT9Opy6hpSi6kxPN5eBYdGzjcHRQl1vmEyRLXRNywq+WtWtph13UGeuuGjnrlx+FFd4EiqYz6a7e
d2oWGBRmvVtwHmJa7T/auyX08h37auyWdiSPr/BXjI1HlDuf0LgBsEyCdQw5uEd+7UBZOkcflVmL
CSeA72sgOr1B7aZc/V8USyTJDzhlF6IEZmDI0Tw1zS3aAOuvRISXIC+sS+XrBhvdxfaGcseB95Dt
LmKzbjcYdIyyxCCGpgmuK0MCJxjB8aaUZmQzwPnjqwWWGof+HT1V+51YJQDHfSKV79GFD0G2/mCB
Wxp3Y+H8YouowPrRzs10cnnP2Uq4nax8yC43DA0aF+eK2Ae6qqvxB0kD59t8SdJMRhzD88FwIyuJ
rs+t+iwbhTtGHnpC6IQ9KGlwo/Jb28RMyflS1PrI/qTkYcgAWCyhaOah5PwvBfVFCUmxxF6cIeMp
C2k=
=mtOy
-----END PGP SIGNATURE-----

--vktHgzuPprZbbfdW8mMu7QSWVidqVUTZa--
