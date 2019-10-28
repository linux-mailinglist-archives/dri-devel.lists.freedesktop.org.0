Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB6DE6E79
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93116E4DD;
	Mon, 28 Oct 2019 08:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED006E4DD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 08:49:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9763EB2A3;
 Mon, 28 Oct 2019 08:49:02 +0000 (UTC)
Subject: Re: [PATCH 0/3] drm/udl: Convert to SHMEM
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org, 
 sam@ravnborg.org, emil.velikov@collabora.com
References: <20191028084549.30243-1-tzimmermann@suse.de>
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
Message-ID: <7332d2e6-790f-aa53-e257-210652111b5b@suse.de>
Date: Mon, 28 Oct 2019 09:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028084549.30243-1-tzimmermann@suse.de>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2023428052=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2023428052==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iX55OGB6V5AUUgC4H1zbezkqXArplTg9u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iX55OGB6V5AUUgC4H1zbezkqXArplTg9u
Content-Type: multipart/mixed; boundary="H2F3cwpPFWesbyfQdnt3r7p7o61Y3xXDc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <7332d2e6-790f-aa53-e257-210652111b5b@suse.de>
Subject: Re: [PATCH 0/3] drm/udl: Convert to SHMEM
References: <20191028084549.30243-1-tzimmermann@suse.de>
In-Reply-To: <20191028084549.30243-1-tzimmermann@suse.de>

--H2F3cwpPFWesbyfQdnt3r7p7o61Y3xXDc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc: Gerd)

Am 28.10.19 um 09:45 schrieb Thomas Zimmermann:
> Udl's GEM implementation is mostly SHMEM and we should attempt to
> replace it with the latter.
>=20
> Patches #1 and #2 update udl to simplify the conversion. In patch #3
> the udl code is being replaced by SHMEM. The GEM object's mmap() and
> free_object() functions are wrappers around their SHMEM counterparts.
> For mmap() we fix-up the page-caching flags to distinguish between
> write-combined and cached access. For free(), we have to unmap the
> buffer's mapping that has been established by udl's fbdev code.
>=20
> The patchset has been tested by running the fbdev console, X11 and
> Weston on a DisplayLink adapter.
>=20
> Thomas Zimmermann (3):
>   drm/udl: Remove flags field from struct udl_gem_object
>   drm/udl: Allocate GEM object via struct drm_driver.gem_create_object
>   drm/udl: Switch to SHMEM
>=20
>  drivers/gpu/drm/udl/Kconfig      |   1 +
>  drivers/gpu/drm/udl/Makefile     |   2 +-
>  drivers/gpu/drm/udl/udl_dmabuf.c | 255 -------------------------------=

>  drivers/gpu/drm/udl/udl_drv.c    |  30 +---
>  drivers/gpu/drm/udl/udl_drv.h    |  36 +----
>  drivers/gpu/drm/udl/udl_fb.c     |  65 ++++----
>  drivers/gpu/drm/udl/udl_gem.c    | 245 ++++++-----------------------
>  7 files changed, 93 insertions(+), 541 deletions(-)
>  delete mode 100644 drivers/gpu/drm/udl/udl_dmabuf.c
>=20
> --
> 2.23.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--H2F3cwpPFWesbyfQdnt3r7p7o61Y3xXDc--

--iX55OGB6V5AUUgC4H1zbezkqXArplTg9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl22q3kACgkQaA3BHVML
eiPE0Qf/ect6N0itRYVh3crneFfQM6td8v2cMcmholX1bVZdhDCY8N0+9Rgor+6D
1CdVKfr32ZbDOTORPsfcFefnmYSuqFwJTkewDaiXsrxUKElCIyriQ4rDVkJkCO0+
lm7raV270+FcEqLLnkNaEItYVZ4yKJ588lQEQbPsZI7LR32Cyxwngt8YPam1Qgd7
5E23zg9yT8WxOkf6sQvw4Z+fJn3Cl/Tzu1kEXHdFKkvw4oBQBDT8w/UY4O/Zw62H
8fIa5E0QQPA97t0RGmeN2xe/uzHp2qpIcztYcngSz7QId5zHKIz0vBTyguM35i3n
xQjnEASDQhwaXjjRqdLEyA0b1dJ8mw==
=t9xI
-----END PGP SIGNATURE-----

--iX55OGB6V5AUUgC4H1zbezkqXArplTg9u--

--===============2023428052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2023428052==--
