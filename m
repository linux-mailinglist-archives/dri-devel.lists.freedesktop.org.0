Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD7E34F8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADCB6E419;
	Thu, 24 Oct 2019 14:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3FB6E419
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:05:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E11A9AD7B;
 Thu, 24 Oct 2019 14:05:05 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] drm/vram: Provide helpers for prepare_fb() and
 cleanup_fb()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191024081404.6978-1-tzimmermann@suse.de>
 <20191024123714.GG11828@phenom.ffwll.local>
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
Message-ID: <446b39b1-f1c0-af51-1863-2365678d79ed@suse.de>
Date: Thu, 24 Oct 2019 16:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024123714.GG11828@phenom.ffwll.local>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1373842199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1373842199==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6aaQtp4270PN5qgUEjAHmtLJpqAdFDuh7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6aaQtp4270PN5qgUEjAHmtLJpqAdFDuh7
Content-Type: multipart/mixed; boundary="l6I12H5nZDUiiemWfhtG1NP458IR1CeYm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: kraxel@redhat.com, airlied@linux.ie, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Message-ID: <446b39b1-f1c0-af51-1863-2365678d79ed@suse.de>
Subject: Re: [PATCH v2 0/4] drm/vram: Provide helpers for prepare_fb() and
 cleanup_fb()
References: <20191024081404.6978-1-tzimmermann@suse.de>
 <20191024123714.GG11828@phenom.ffwll.local>
In-Reply-To: <20191024123714.GG11828@phenom.ffwll.local>

--l6I12H5nZDUiiemWfhtG1NP458IR1CeYm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.10.19 um 14:37 schrieb Daniel Vetter:
> On Thu, Oct 24, 2019 at 10:14:00AM +0200, Thomas Zimmermann wrote:
>> The implementation of the plane's call-back functions prepare_fb() and=

>> cleanup_fb() for GEM VRAM helpers are sharable among drivers.
>>
>> Patch #3 also fixes two bugs that have been present in hibmc since it =
was
>> first added. The primary plane's atomic_update() is not responsible fo=
r
>> pinning BOs. And it never unpinned unused BOs. VRAM is being exausted
>> over time.
>>
>> The new helpers have been tested to work.
>>
>> v2:
>> 	* provide helpers for struct drm_simple_display_pipe_funcs, and...
>> 	* ...use them in bochs
>=20
> Oh I thought we agreed on changing the simple_pipe type for
> prepare/cleanup_fb ... But this works too ofc. On the series:

Well, I'm still no fan of the current simple pipe helpers. But after you
changed the signature of mode_valid() and explained the reasons, I
thought it was more important to have consistent interfaces.

>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks!

Best regards
Thomas

>=20
>>
>> Thomas Zimmermann (4):
>>   drm/vram-helpers: Add helpers for prepare_fb() and cleanup_fb()
>>   drm/bochs: Replace prepare_fb()/cleanup_fb() with GEM VRAM helpers
>>   drm/hisilicon/hibmc: Use GEM VRAM's prepare_fb() and cleanup_fb()
>>     helpers
>>   drm/vboxvideo: Replace prepare_fb()/cleanup_fb() with GEM VRAM helpe=
rs
>>
>>  drivers/gpu/drm/bochs/bochs_kms.c             |  26 +---
>>  drivers/gpu/drm/drm_gem_vram_helper.c         | 126 +++++++++++++++++=
+
>>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  14 +-
>>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |  61 +--------
>>  include/drm/drm_gem_vram_helper.h             |  25 ++++
>>  5 files changed, 161 insertions(+), 91 deletions(-)
>>
>> --
>> 2.23.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--l6I12H5nZDUiiemWfhtG1NP458IR1CeYm--

--6aaQtp4270PN5qgUEjAHmtLJpqAdFDuh7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2xr5AACgkQaA3BHVML
eiMCdAf/debH4k/of7LCOugoN0/Q+0vSgZCQZfZGGBYk9Tsmng3Qe8+vkQLiCCSt
VmAE+tn4Q67PQ6Fpwg3+A2swxnqUrd7qn6JSOLaMOOWi39eyckUmIYMNFw2mfDRz
xlkh1/KEOBu1wc+dHvPOIbTWd8H1VVCiUYGaAMTWTL3nfPccuoXgCMoMO3hy4y6a
0yQRx+KDFgDDVIY3LwP9hI4QjSW2JwOxMw1ugWtNOWF8FjRbh+ZUyvWzZ96dV3Ne
VIbYURqZqvE8E6N2YiZLjhZZHeKDrGPzhrenDd32ww477HMc7EFuzuMYl2w7xQmr
J8nAARcEbHb2zhLG80V4DKjyd5WkWw==
=/Sd4
-----END PGP SIGNATURE-----

--6aaQtp4270PN5qgUEjAHmtLJpqAdFDuh7--

--===============1373842199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1373842199==--
