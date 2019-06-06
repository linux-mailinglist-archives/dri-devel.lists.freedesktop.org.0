Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331B36E0D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 10:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7912A8932A;
	Thu,  6 Jun 2019 08:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489438932A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:03:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0632AFD1;
 Thu,  6 Jun 2019 08:03:27 +0000 (UTC)
Subject: Re: [PATCH] drm: Ignore drm_gem_vram_mm_funcs in generated
 documentation
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
References: <20190604111330.25324-1-tzimmermann@suse.de>
 <20190605090308.efdkhxqnaydorubm@sirius.home.kraxel.org>
 <fe2df569-da1f-a54c-8a8e-e921a979278f@suse.de>
 <20190605155847.gabpvcoc6zf3twfv@sirius.home.kraxel.org>
 <3b574a1c-8dee-962f-e2ad-4959e75321d7@suse.de>
 <20190606074515.wlyzzlqdv7r2urum@sirius.home.kraxel.org>
 <CAKMK7uFdge88oqrm0X5p1VmDKk3bbRs9O8ToOy3VwSFEp7LuNA@mail.gmail.com>
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
Message-ID: <26d3e769-d995-1683-2382-e28f97239286@suse.de>
Date: Thu, 6 Jun 2019 10:03:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFdge88oqrm0X5p1VmDKk3bbRs9O8ToOy3VwSFEp7LuNA@mail.gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0575228061=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0575228061==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0FKGBk8Dsn7R4rKGVfTOCMPY4DTpuFrkf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0FKGBk8Dsn7R4rKGVfTOCMPY4DTpuFrkf
Content-Type: multipart/mixed; boundary="E6SGxB8hdbnobH4WMBiEpsnTQBrm8RSs7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <26d3e769-d995-1683-2382-e28f97239286@suse.de>
Subject: Re: [PATCH] drm: Ignore drm_gem_vram_mm_funcs in generated
 documentation
References: <20190604111330.25324-1-tzimmermann@suse.de>
 <20190605090308.efdkhxqnaydorubm@sirius.home.kraxel.org>
 <fe2df569-da1f-a54c-8a8e-e921a979278f@suse.de>
 <20190605155847.gabpvcoc6zf3twfv@sirius.home.kraxel.org>
 <3b574a1c-8dee-962f-e2ad-4959e75321d7@suse.de>
 <20190606074515.wlyzzlqdv7r2urum@sirius.home.kraxel.org>
 <CAKMK7uFdge88oqrm0X5p1VmDKk3bbRs9O8ToOy3VwSFEp7LuNA@mail.gmail.com>
In-Reply-To: <CAKMK7uFdge88oqrm0X5p1VmDKk3bbRs9O8ToOy3VwSFEp7LuNA@mail.gmail.com>

--E6SGxB8hdbnobH4WMBiEpsnTQBrm8RSs7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.06.19 um 09:49 schrieb Daniel Vetter:
> On Thu, Jun 6, 2019 at 9:45 AM Gerd Hoffmann <kraxel@redhat.com> wrote:=

>>
>> On Thu, Jun 06, 2019 at 08:39:12AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 05.06.19 um 17:58 schrieb Gerd Hoffmann:
>>>> On Wed, Jun 05, 2019 at 11:59:04AM +0200, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 05.06.19 um 11:03 schrieb Gerd Hoffmann:
>>>>>> On Tue, Jun 04, 2019 at 01:13:30PM +0200, Thomas Zimmermann wrote:=

>>>>>>> The documentation tools interpret drm_gem_vram_mm_funcs as functi=
on and
>>>>>>> there appears to be no way of inline-documenting constants.
>>>>>>
>>>>>>> -/**
>>>>>>> +/*
>>>>>>>   * drm_gem_vram_mm_funcs - Functions for &struct drm_vram_mm
>>>>>>
>>>>>> "struct drm_gem_vram_mm_funcs" ?
>>>>>>
>>>>>> (see include/drm/drm_gem.h where struct drm_gem_object_funcs is
>>>>>> documented that way).
>>>>>
>>>>> The documented source line is
>>>>>
>>>>>   const struct drm_vram_mm_funcs drm_gem_vram_mm_funcs =3D {
>>>>>
>>>>> and I tried to document the purpose of the constant 'drm_gem_vram_m=
m_funcs'.
>>>>
>>>> Ah.  Missed that detail.
>>>>
>>>>> Documenting global constants is not described in the kernel guide a=
nd I
>>>>> could not find a source-code example either. Function and struct st=
yle
>>>>> with '-' didn't work; member-field style with '@' neither. The only=
 way
>>>>> seems to be adding it to an .rst file in Documentation. But then it=
's
>>>>> not part of the API documentation, but somewhere in the text.
>>>>
>>>> Ok, patch is fine then.
>>>>
>>>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>>>
>>> Thanks.
>>>
>>>> (can you commit & push yourself meanwhile?)
>>>
>>> Not yet. The respective bug report is still open.
>>
>> Ok, I'll push it then.
>=20
> You should have commit rights for drm-misc, I just checked. At least
> there's a tzimmermann account in the drm-misc group.

Thanks for the update.

Gerd, if you haven't pushed it yet I'm going to add this patch to the tre=
e.

Best regards
Thomas

> https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html=

>=20
> ... to get you going. If things don't work pls ping on #dri-devel on fr=
eenode.
> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--E6SGxB8hdbnobH4WMBiEpsnTQBrm8RSs7--

--0FKGBk8Dsn7R4rKGVfTOCMPY4DTpuFrkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz4yMsACgkQaA3BHVML
eiMAXAf/S6oFLlC3M3ccbJRyE+s3+kczMJLuZzRtLPbEkTk+6j8g2TXmc/Fdh1P5
jcXhgbUeF1K1LmGpbCO6Eb+C4lrU1koYA99jxhI0mIX+mtj7G6mROE7XbN51ZZ0A
2Db0M3gmDUjjeAUbU0GFxmRsewhNibE/tufbV83yaZotVkYPugCsfm08R32LfphH
VxoqQ86ryzYMPWjGpr+JyQMq/yHAAKW7RGEbnSIYIqxycQA9IFTCc/yemklW8tLo
xVFfAcUeyqfdoM0cxJf7Bg34ClOVadSptrvGDaA42VkR04u6Ohif9kI4BGNegJX5
FGu7BwiDf+PfRjqA26HVtwJkdHiO5w==
=m9Hd
-----END PGP SIGNATURE-----

--0FKGBk8Dsn7R4rKGVfTOCMPY4DTpuFrkf--

--===============0575228061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0575228061==--
