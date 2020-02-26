Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D716F772
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 06:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59A26E10C;
	Wed, 26 Feb 2020 05:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307C76E106;
 Wed, 26 Feb 2020 05:39:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C7D85AFB1;
 Wed, 26 Feb 2020 05:39:14 +0000 (UTC)
Subject: Re: [PATCH 0/3] Add separate non-KMS state; constify struct drm_driver
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225174400.GP2363188@phenom.ffwll.local>
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
Message-ID: <f042cfae-8f74-0bd5-bd5f-dfb962c0c3b4@suse.de>
Date: Wed, 26 Feb 2020 06:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225174400.GP2363188@phenom.ffwll.local>
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0426401179=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0426401179==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3
Content-Type: multipart/mixed; boundary="uwINkE9aUz1Amsuxs93ui3Lma6VXhBB9g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 bskeggs@redhat.com, emil.velikov@collabora.com, alexander.deucher@amd.com,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <f042cfae-8f74-0bd5-bd5f-dfb962c0c3b4@suse.de>
Subject: Re: [PATCH 0/3] Add separate non-KMS state; constify struct
 drm_driver
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225174400.GP2363188@phenom.ffwll.local>
In-Reply-To: <20200225174400.GP2363188@phenom.ffwll.local>

--uwINkE9aUz1Amsuxs93ui3Lma6VXhBB9g
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.02.20 um 18:44 schrieb Daniel Vetter:
> On Tue, Feb 25, 2020 at 04:58:59PM +0100, Thomas Zimmermann wrote:
>> This patchset moves legacy, non-KMS driver state from struct drm_drive=
r
>> into struct drm_legacy_state. Only non-KMS drivers provide an instance=

>> of the latter structure. One special case is nouveau, which supports
>> legacy interfaces. It also provides an instance of the legacy state if=

>> the legacy interfaces have been enabled (i.e., defines the config opti=
on
>> CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
>>
>> I reviewed all call sites of legacy state and functions to verify that=

>> DRIVER_LEGACY or DRIVER_KMS_LEGACY_CONTEXT is set on the device; or th=
at
>> DRIVER_MODESET is not set.
>>
>> With the mutable KMS state removed, instances of struct drm_driver can=

>> be declared as constant. The patchset modifies the DRM core accordingl=
y.
>> Individual drivers can follow later on.
>=20
> Bikeshed: We very much have modern non-KMS drivers (vgem, etnaviv, v3d,=

> panfrost, ...). non-KMS !=3D legacy, which is what you're talking about=

> here.

OK, probably needs to be more precise.

>=20
> Other thing, and it's a bit raining on your parade: I don't see the poi=
nt.
> Sprinkling a few more #ifdef CONFIG_DRM_LEGACY over the relevant parts
> sounds like a reasonable idea. But this is a lot of churn for drivers
> which are all pretty much dead, and just waiting for their eventual
> removal. And from a compile-testing pov of making sure modern drivers
> don't use any of the deprecated stuff wrapping it in CONFIG_DRM_LEGACY
> should be plenty enough.

It's not about these old drivers, it's about having constant driver
structures and maybe saving a few bytes in the modern drivers. If these
old drivers hold back improvements to the drivers we care about, I don't
see we they are not to be touched.

This cannot be solved with CONFIG_DRM_LEGACY, unless you want to wrap
any reference in core code to legacy data. I tried at first and it
turned out to be an unreadable mess.

And from a complexity POV the patchset is trivial. It adds a data
structure to each old driver and moves a few initializers around. The
worst thing that can happen is that code tried to dereference the legacy
pointer when it's not set. This bug will happen with modern drivers, so
we should see it easily.

Best regards
Thomas

>=20
> And from a "make stuff const" I think Laurent's much more minimal serie=
s
> also gets us there for all the drivers we care about.
> -Daniel
>=20
>>
>> Thomas Zimmermann (3):
>>   drm: Add separate state structure for legacy, non-KMS drivers
>>   drm: Move non-kms driver state into struct drm_legacy_state
>>   drm: Constify struct drm_driver in DRM core
>>
>>  drivers/gpu/drm/drm_bufs.c            | 10 +++++-----
>>  drivers/gpu/drm/drm_context.c         |  9 +++++----
>>  drivers/gpu/drm/drm_drv.c             | 12 ++++++++----
>>  drivers/gpu/drm/drm_file.c            |  4 ++--
>>  drivers/gpu/drm/drm_legacy_misc.c     |  6 +++---
>>  drivers/gpu/drm/drm_lock.c            |  7 ++++---
>>  drivers/gpu/drm/drm_pci.c             | 16 ++++++++++------
>>  drivers/gpu/drm/drm_vblank.c          | 11 ++++++-----
>>  drivers/gpu/drm/i810/i810_drv.c       | 10 +++++++---
>>  drivers/gpu/drm/mga/mga_drv.c         | 16 ++++++++++------
>>  drivers/gpu/drm/nouveau/nouveau_drm.c |  8 ++++++++
>>  drivers/gpu/drm/r128/r128_drv.c       | 16 ++++++++++------
>>  drivers/gpu/drm/savage/savage_drv.c   | 12 ++++++++----
>>  drivers/gpu/drm/sis/sis_drv.c         |  8 ++++++--
>>  drivers/gpu/drm/tdfx/tdfx_drv.c       |  6 +++++-
>>  drivers/gpu/drm/via/via_drv.c         | 16 ++++++++++------
>>  include/drm/drm_device.h              |  2 +-
>>  include/drm/drm_drv.h                 | 21 +++++----------------
>>  include/drm/drm_legacy.h              | 27 +++++++++++++++++++++++---=
-
>>  include/drm/drm_pci.h                 |  4 ++--
>>  20 files changed, 138 insertions(+), 83 deletions(-)
>>
>> --
>> 2.25.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--uwINkE9aUz1Amsuxs93ui3Lma6VXhBB9g--

--nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5WBHwACgkQaA3BHVML
eiPDxAf/eiIvploVeGdiACfKJPm6kAk2t4I2o1E9q91jJ4r9T4+p9VNpxZ4cjM3x
px7LWVyba99XA+oddmzCkOUyMA4hAEsKxGqV1lfnS3XAb6AX0ztSLPGGGAnIuoIm
i0+AlrFj1XFaEIhyfORVaLpO3SLmTZ7GOOxsZVZSeDcECkMXMaCAKsRfinCOYwTn
oB8/9prIoqMB/E3DNxMl4RWqB+8B/g1Uv+sHnmEQ0jD9Z+HMJaEbefzTWvkQ0V1R
Hjknl7bAytXDeaRTuNaBK3sNh0e0QrE1XbENWANQqV8A1efm1H4GXCrBT4Wol9rV
pz6X5w8dvSFEW2mmCb42Cqv43B7FYg==
=P47h
-----END PGP SIGNATURE-----

--nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3--

--===============0426401179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0426401179==--
