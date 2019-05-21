Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D453251ED
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781E98908B;
	Tue, 21 May 2019 14:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6357E8908B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:26:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD8B6AEBB;
 Tue, 21 May 2019 14:26:05 +0000 (UTC)
Subject: Re: [PATCH 0/3] Various clean-up patches for GEM VRAM
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190521110831.20200-1-tzimmermann@suse.de>
 <20190521124022.GL21222@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <a67d158b-e9bd-6b0e-71f6-6762527735fc@suse.de>
Date: Tue, 21 May 2019 16:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521124022.GL21222@phenom.ffwll.local>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1650383291=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1650383291==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1wI7gvrc6UKgCCk6kRGmdNKaJD2NQdlRb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1wI7gvrc6UKgCCk6kRGmdNKaJD2NQdlRb
Content-Type: multipart/mixed; boundary="xUOujExXyi71Y4YYbTDyBVcGltPTVjG4G";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, christian.koenig@amd.com
Message-ID: <a67d158b-e9bd-6b0e-71f6-6762527735fc@suse.de>
Subject: Re: [PATCH 0/3] Various clean-up patches for GEM VRAM
References: <20190521110831.20200-1-tzimmermann@suse.de>
 <20190521124022.GL21222@phenom.ffwll.local>
In-Reply-To: <20190521124022.GL21222@phenom.ffwll.local>

--xUOujExXyi71Y4YYbTDyBVcGltPTVjG4G
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.05.19 um 14:40 schrieb Daniel Vetter:
> On Tue, May 21, 2019 at 01:08:28PM +0200, Thomas Zimmermann wrote:
>> Replacing drm_gem_vram_push_to_system() moves policy from drivers back=

>> to the memory manager. Now, unused BOs are only evicted when the space=

>> is required.
>>
>> The lock/unlock-renaming patch aligns the interface with other names
>> in DRM. No functional changes are done.
>>
>> Finally, there's now a lockdep assert that ensures we don't call the
>> GEM VRAM _locked() functions with an unlocked BO.
>>
>> Patches are against a recent drm-tip and tested on mgag200 and ast HW.=

>>
>> Thomas Zimmermann (3):
>>   drm: Replace drm_gem_vram_push_to_system() with kunmap + unpin
>>   drm: Rename reserve/unreserve to lock/unlock in GEM VRAM helpers
>>   drm: Assert that BO is locked in drm_gem_vram_{pin,unpin}_locked()
>=20
> Awesome, thanks a lot for quickly working on this. On the series:
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> But definitely get someone with more knowledge of the details to check
> this all again.
>=20
> Aside: Do you plan to continue working on drm drivers,

Yes, that's my job at SUSE.

> i.e. any need for
> drm-misc commit rights?

Sure. Thank you for your trust. From what I could found online, I guess
[1] and [2] applies?

Best regards
Thomas

[1]
https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.htm=
l
[2] https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html=


> Cheers, Daniel
>=20
>>
>>  drivers/gpu/drm/ast/ast_fb.c             | 11 ++-
>>  drivers/gpu/drm/ast/ast_mode.c           | 26 ++++---
>>  drivers/gpu/drm/drm_gem_vram_helper.c    | 86 ++++++-----------------=
-
>>  drivers/gpu/drm/drm_vram_helper_common.c |  2 -
>>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 40 +++++------
>>  drivers/gpu/drm/mgag200/mgag200_fb.c     | 11 ++-
>>  drivers/gpu/drm/mgag200/mgag200_mode.c   | 15 +++--
>>  include/drm/drm_gem_vram_helper.h        |  9 ++-
>>  8 files changed, 80 insertions(+), 120 deletions(-)
>>
>> --
>> 2.21.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--xUOujExXyi71Y4YYbTDyBVcGltPTVjG4G--

--1wI7gvrc6UKgCCk6kRGmdNKaJD2NQdlRb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzkCncACgkQaA3BHVML
eiOS4Qf+PqT9m8udJX8FSAZVN4ifFaKKHyBBPJewMvzxAr3e+DlbzJy62ACtKPTh
+S0JAq47knVH/LPhyrTicV/5sYZA3GGeYKRYyOkncDjs0ufkCfvMkdl49Ep1IjwP
mGqsKjlP2ZyZ3mlW5x1f8Ruz0j2zIopKyPSdzQOZ6T4Zp0KFLz12vQ/kzwQZbyug
1ZaOEMDUi4sWs/ON7IBqUBoHWsvUYtSNXwRJEGIujZOHRmv4jhr9k+L/vaHWqHdc
pgxKcYBLAoenGayU6KM3xxyZdvKMldfNiH1yTCrUfItuS0MVOtkjEITJETFps6Is
CeWl53/Pk8gHZNPYcWBaC73mxyKubw==
=Vzj4
-----END PGP SIGNATURE-----

--1wI7gvrc6UKgCCk6kRGmdNKaJD2NQdlRb--

--===============1650383291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1650383291==--
