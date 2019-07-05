Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B06860143
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 09:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D316E411;
	Fri,  5 Jul 2019 07:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF59D6E411
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 07:09:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 425AAAFA9;
 Fri,  5 Jul 2019 07:09:48 +0000 (UTC)
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
 <aa1b7431-21c5-4c99-bfb6-6c5e4946bec3@suse.de>
 <18d573b4-3cb8-dc4a-bee3-a8b9b0a18a28@tronnes.org>
 <5f9c7df7-3805-0e23-4201-be08d41da791@suse.de>
 <02821de5-8a43-53c4-d8f0-70a7f041f896@tronnes.org>
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
Message-ID: <b9684edb-5f77-2ea1-5fba-8f905db9bfed@suse.de>
Date: Fri, 5 Jul 2019 09:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <02821de5-8a43-53c4-d8f0-70a7f041f896@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============0912465495=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0912465495==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="D3ut2bhG6hEZRlg3RROQmjwblJorlxPn5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D3ut2bhG6hEZRlg3RROQmjwblJorlxPn5
Content-Type: multipart/mixed; boundary="u55emh8XsGlQdHlGixPqx0JjvdsuSok90";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <b9684edb-5f77-2ea1-5fba-8f905db9bfed@suse.de>
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
 <aa1b7431-21c5-4c99-bfb6-6c5e4946bec3@suse.de>
 <18d573b4-3cb8-dc4a-bee3-a8b9b0a18a28@tronnes.org>
 <5f9c7df7-3805-0e23-4201-be08d41da791@suse.de>
 <02821de5-8a43-53c4-d8f0-70a7f041f896@tronnes.org>
In-Reply-To: <02821de5-8a43-53c4-d8f0-70a7f041f896@tronnes.org>

--u55emh8XsGlQdHlGixPqx0JjvdsuSok90
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.07.19 um 16:15 schrieb Noralf Tr=C3=B8nnes:
>>> Hm, why do you think that?
>>
>> Drivers may already come with their own shadow buffer. Cirrus is an
>> example of that. It uses shmem buffer objects as shadow fbs and
>> internally updates the device frame buffer in its dirty callback. Usin=
g
>> dirty() to select the shadow fbdev adds another buffer (and another
>> memcpy) for no reason.
>=20
> Cirruc uses shmem buffers and they won't work with fbdev defio (both us=
e
> page->lru). shmem is the reason I added shadow buffering to generic
> fbdev in the first place. It will now work with whatever backing buffer=

> the driver uses, as long as it can provide a virtual address on the dum=
b
> buffer (not the case with rockchip for instance, due to limited virtual=

> address space).

OK, I see. Thanks or clarifying.

Best regards
Thomas

> Noralf.
>=20
>>
>> Best regards
>> Thomas
>>
>>> The thing with fbdev defio is that it only supports kmalloc and vmall=
oc
>>> allocated memory (page->lru is avail.). This means that only the CMA
>>> drivers can use defio without shadow memory. To keep things simple
>>> everyone with a dirty() callback gets a shadow buffer.
>>>
>>> Noralf.
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> Really nice diffstat by the way :-)
>>>>>
>>>>> Noralf.
>>>>>
>>>>>> [1] https://lists.freedesktop.org/archives/dri-devel/2019-June/224=
423.html
>>>>>>
>>>>>> Thomas Zimmermann (5):
>>>>>>   drm/client: Support unmapping of DRM client buffers
>>>>>>   drm/fb-helper: Unmap BO for shadow-buffered framebuffer console
>>>>>>   drm/ast: Replace struct ast_fbdev with generic framebuffer emula=
tion
>>>>>>   drm/bochs: Use shadow buffer for bochs framebuffer console
>>>>>>   drm/mgag200: Replace struct mga_fbdev with generic framebuffer
>>>>>>     emulation
>>>>>>
>>>>>>  drivers/gpu/drm/ast/Makefile           |   2 +-
>>>>>>  drivers/gpu/drm/ast/ast_drv.c          |  22 +-
>>>>>>  drivers/gpu/drm/ast/ast_drv.h          |  17 --
>>>>>>  drivers/gpu/drm/ast/ast_fb.c           | 341 --------------------=
-----
>>>>>>  drivers/gpu/drm/ast/ast_main.c         |  30 ++-
>>>>>>  drivers/gpu/drm/ast/ast_mode.c         |  21 --
>>>>>>  drivers/gpu/drm/bochs/bochs_kms.c      |   2 +-
>>>>>>  drivers/gpu/drm/drm_client.c           |  71 ++++-
>>>>>>  drivers/gpu/drm/drm_fb_helper.c        |  14 +-
>>>>>>  drivers/gpu/drm/mgag200/Makefile       |   2 +-
>>>>>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 --
>>>>>>  drivers/gpu/drm/mgag200/mgag200_fb.c   | 309 --------------------=
--
>>>>>>  drivers/gpu/drm/mgag200/mgag200_main.c |  61 +++--
>>>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c |  27 --
>>>>>>  include/drm/drm_client.h               |   3 +
>>>>>>  15 files changed, 154 insertions(+), 787 deletions(-)
>>>>>>  delete mode 100644 drivers/gpu/drm/ast/ast_fb.c
>>>>>>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c
>>>>>>
>>>>>> --
>>>>>> 2.21.0
>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>>
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--u55emh8XsGlQdHlGixPqx0JjvdsuSok90--

--D3ut2bhG6hEZRlg3RROQmjwblJorlxPn5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0e97kACgkQaA3BHVML
eiPnaAf/VlglQ6sGaP/FrHEAxMHbK0k+lo6fAXLyFeetgNeBCHBi1uMzh0v3Rpg8
bE2/LNKXUre7uB8uozhAKIBdWw4veio19zp6/KJ3AsV2HOhST8kDy+8sptEZYJBV
zHbreZKym1DUNKb9d0X8umwo8CteLPt/vBWHSRcBLQFygc6Mf/nFw7cvk00guB4N
cXGA4/bFcLFTFHpW2ulfGnz8vZ23yFoYBOz/la8gg4lQHcTRznTd2aQkJhpyXY0L
yrHhNpbfmsXHH3i7aJvu4PFSvmDLzxC0PcWSPEaIJ8XfrFs8yAWyMN1gDa0Q7Tqk
/q4hrLx0aqBxq1MfFgV+mLUPWlBQ3g==
=gi5u
-----END PGP SIGNATURE-----

--D3ut2bhG6hEZRlg3RROQmjwblJorlxPn5--

--===============0912465495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0912465495==--
