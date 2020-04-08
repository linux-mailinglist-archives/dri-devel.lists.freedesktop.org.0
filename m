Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5A1A1CC1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAFD6E987;
	Wed,  8 Apr 2020 07:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CA66E985;
 Wed,  8 Apr 2020 07:38:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1B907AC92;
 Wed,  8 Apr 2020 07:38:24 +0000 (UTC)
Subject: Re: [PATCH 00/15] amdgpu: remove load and unload callbacks (v3)
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200207195058.2354-1-alexander.deucher@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <76de444d-529d-cce7-8c1a-97053686029c@suse.de>
Date: Wed, 8 Apr 2020 09:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1376166657=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1376166657==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2Hw7BZdPJTZd4IbpOUWWvhglowajcKms3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2Hw7BZdPJTZd4IbpOUWWvhglowajcKms3
Content-Type: multipart/mixed; boundary="Vpi5XvpQjLrmadTFODaU4ScWgJC1LYuEm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Message-ID: <76de444d-529d-cce7-8c1a-97053686029c@suse.de>
Subject: Re: [PATCH 00/15] amdgpu: remove load and unload callbacks (v3)
References: <20200207195058.2354-1-alexander.deucher@amd.com>
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>

--Vpi5XvpQjLrmadTFODaU4ScWgJC1LYuEm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alex

Am 07.02.20 um 20:50 schrieb Alex Deucher:
> These are deprecated and the drm will soon start warning when drivers s=
till
> use them.  It was a long and twisty road, but seems to work.

Are you going to convert radeon as well? It's the only remaining KMS
driver that uses load.

Best regards
Thomas

>=20
> v2: Add additional patch (13/15) which should fix the crash reported by=

> Thomas Zimmermann.
> v3: Fix dp aux registration harder, add missing kconfig guard
>=20
> Alex Deucher (15):
>   drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
>   drm/amdgpu/ttm: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/pm: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/sa: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/fence: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/gem: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/regs: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/firmware: move debugfs init into core amdgpu debugfs
>   drm/amdgpu: don't call drm_connector_register for non-MST ports
>   drm/amdgpu/display: move debugfs init into core amdgpu debugfs (v2)
>   drm/amd/display: move dpcd debugfs members setup
>   drm/amdgpu/display: add a late register connector callback
>   drm/amdgpu/display: split dp connector registration (v2)
>   drm/amdgpu/ring: move debugfs init into core amdgpu debugfs
>   drm/amdgpu: drop legacy drm load and unload callbacks
>=20
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 17 ++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 69 ++++++++++++++++++-=

>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 17 -----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  3 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |  7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c        |  9 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h        |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 15 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 14 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c      | 10 +--
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  1 -
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 +
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 13 ++--
>  19 files changed, 140 insertions(+), 89 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Vpi5XvpQjLrmadTFODaU4ScWgJC1LYuEm--

--2Hw7BZdPJTZd4IbpOUWWvhglowajcKms3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6Nf2wACgkQaA3BHVML
eiMLCwf+PH5FE852QyaPDcVnR5QP7n6XKnT8LI6jCVXa8pJr4vpCiSFAttsJeLbr
tdM2NGJjwDIhOHdL1Wy7WpEEAgaqTxzpPaOpRtL6CP5M80MNmGNrweHZHlC+LvAo
B01HjaS/uDsskeUC+lgBMLhwtaipLOHgTvaGFf/2iuq37tlaPDzt4IzVyUhNzLV1
yidxupVqU4diIX8mdWxJwvag1J/LU2Yw0G+lhsBUWjPKe8Bkz6EbLP5czZvgxGkv
V/2YMj44y+eefKFPat+OHkXT4n6DDTeP7iI+4vnxnJKhqod6O6pgWV1AdGVghesJ
wx5KCVcl0WmYefPfW2zYJgb0KWEooQ==
=yHNS
-----END PGP SIGNATURE-----

--2Hw7BZdPJTZd4IbpOUWWvhglowajcKms3--

--===============1376166657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1376166657==--
