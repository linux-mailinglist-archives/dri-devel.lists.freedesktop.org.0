Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5F1572F1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 11:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D8B6EBEC;
	Mon, 10 Feb 2020 10:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA126EBEB;
 Mon, 10 Feb 2020 10:39:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BD66ADC2;
 Mon, 10 Feb 2020 10:39:42 +0000 (UTC)
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
Message-ID: <b6a5bb5a-6f30-26ad-96a6-47d09e180fc6@suse.de>
Date: Mon, 10 Feb 2020 11:39:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
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
Content-Type: multipart/mixed; boundary="===============0023209868=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0023209868==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OKWCXP73uvEzlfYaMLVnVGqwyosOoFvDN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OKWCXP73uvEzlfYaMLVnVGqwyosOoFvDN
Content-Type: multipart/mixed; boundary="XHj68sJyb9J9rPKEwu24KX5oRdBfYDOWE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Message-ID: <b6a5bb5a-6f30-26ad-96a6-47d09e180fc6@suse.de>
Subject: Re: [PATCH 00/15] amdgpu: remove load and unload callbacks (v3)
References: <20200207195058.2354-1-alexander.deucher@amd.com>
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>

--XHj68sJyb9J9rPKEwu24KX5oRdBfYDOWE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.02.20 um 20:50 schrieb Alex Deucher:
> These are deprecated and the drm will soon start warning when drivers s=
till
> use them.  It was a long and twisty road, but seems to work.
>=20
> v2: Add additional patch (13/15) which should fix the crash reported by=

> Thomas Zimmermann.
> v3: Fix dp aux registration harder, add missing kconfig guard

No more stacktraces.

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

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


--XHj68sJyb9J9rPKEwu24KX5oRdBfYDOWE--

--OKWCXP73uvEzlfYaMLVnVGqwyosOoFvDN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5BMuUACgkQaA3BHVML
eiO9Lwf8CWo0RnbzV7OuuG9lm1IDFvLYQmWDuEhSL0hIj9BZaL5s9KJ4+Gx5bCTm
AIbidRkq0Ag7Y/FYTZZ1DSI6XpnJq7KirRiDGIue2laPwNSiPIktFEU/xOglpzSH
Fiiuk23Z30/bS2gCcS1p7mOnFwJkMhQBeXCjbh4JvlX3FlRpDrB44U9Gx67zttUL
aoSgTB+qki4vfZbBWgIwsXkfr9IWiZ/57oRgOX68fYThUHhtIL8/bKor76DPXa1F
s46ZpvVbX6PMtoh2askHUOYugJMzlj7D/7W6yw/Z1B8BJxvK6riyTEq4wGyw4AJl
aIdhYe01c3uH4/qb/x/fi3MvsxXprA==
=I4Ck
-----END PGP SIGNATURE-----

--OKWCXP73uvEzlfYaMLVnVGqwyosOoFvDN--

--===============0023209868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0023209868==--
