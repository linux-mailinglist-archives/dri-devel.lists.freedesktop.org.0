Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED779A81B3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01CD8918D;
	Wed,  4 Sep 2019 12:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4268918D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:01:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 01C29B64E;
 Wed,  4 Sep 2019 12:01:43 +0000 (UTC)
Subject: Re: potential regression in drm/mgag200
To: Davidlohr Bueso <dave@stgolabs.net>
References: <20190904064907.fxzpknmqhfozkkwj@linux-r8p5>
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
Message-ID: <a8a0caeb-3f85-5a6c-5ee5-ceddebac2db5@suse.de>
Date: Wed, 4 Sep 2019 14:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904064907.fxzpknmqhfozkkwj@linux-r8p5>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1947490863=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1947490863==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jSO8uOUuxq4Yr0B9w3k2KPAtgM89BK23F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jSO8uOUuxq4Yr0B9w3k2KPAtgM89BK23F
Content-Type: multipart/mixed; boundary="r5zIdMQr7SvyHsWq3vgxyhZBZ5dOfICqJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <a8a0caeb-3f85-5a6c-5ee5-ceddebac2db5@suse.de>
Subject: Re: potential regression in drm/mgag200
References: <20190904064907.fxzpknmqhfozkkwj@linux-r8p5>
In-Reply-To: <20190904064907.fxzpknmqhfozkkwj@linux-r8p5>

--r5zIdMQr7SvyHsWq3vgxyhZBZ5dOfICqJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.09.19 um 08:49 schrieb Davidlohr Bueso:
> Hi,
>=20
> While doing some changes to x86's pat code and thus having 'debugpat', =
I
> noticed
> some weird behavior in a server running linux-next as of -- yes,
> reverting does 'fix'
> the issue:
>=20
> 90f479ae51a (drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation)
>=20
> Where the following splat is seen over and over endlessly for the same
> range:
>=20
> x86/PAT: Overlap at 0xd0000000-0xd1000000
> x86/PAT: reserve_memtype added [mem 0xd0000000-0xd02fffff], track
> write-combining, req write-combining, ret write-combining
> x86/PAT: free_memtype request [mem 0xd0000000-0xd02fffff]
>=20
> And all these are doing ioremap from drm_fb_helper_dirty_work():
>=20
> [=C2=A0 114.330825]=C2=A0 reserve_memtype+0x1b0/0x410
> [=C2=A0 114.330829]=C2=A0 ? ttm_bo_kmap+0x1d7/0x270 [ttm]
> [=C2=A0 114.330830]=C2=A0 __ioremap_caller.constprop.14+0xf6/0x300
> [=C2=A0 114.330832]=C2=A0 ? soft_cursor+0x1f9/0x220
> [=C2=A0 114.330835]=C2=A0 ttm_bo_kmap+0x1d7/0x270 [ttm]
> [=C2=A0 114.330838]=C2=A0 ? ttm_bo_del_sub_from_lru+0x29/0x40 [ttm]
> [=C2=A0 114.330841]=C2=A0 drm_gem_vram_kmap+0x54/0x70 [drm_vram_helper]=

> [=C2=A0 114.330842]=C2=A0 drm_gem_vram_object_vmap+0x23/0x40 [drm_vram_=
helper]
> [=C2=A0 114.330853]=C2=A0 drm_gem_vmap+0x1f/0x60 [drm]
> [=C2=A0 114.477697]=C2=A0 drm_client_buffer_vmap+0x1d/0x30 [drm]
> [=C2=A0 114.477703]=C2=A0 drm_fb_helper_dirty_work+0x92/0x180 [drm_kms_=
helper]
> [=C2=A0 114.477706]=C2=A0 process_one_work+0x1f4/0x3e0
> [=C2=A0 114.477707]=C2=A0 worker_thread+0x2d/0x3e0
>=20
> Before, the same range was also added, but only once, and fwiw it was
> the same either
> with 24 or 32 bpp.
>=20
> Any thoughts?

Thanks for reporting. The original code kept around memory mappings for
a longer time, while the new code remapped frequently. I've just
submitted a patch set that restores the old behavior. [1] Fixes the
problem on my test machine.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/series/66210/

>=20
> Thanks,
> Davidlohr

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--r5zIdMQr7SvyHsWq3vgxyhZBZ5dOfICqJ--

--jSO8uOUuxq4Yr0B9w3k2KPAtgM89BK23F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1vp6IACgkQaA3BHVML
eiOv4wf/aVidfnLf+LIWnZ3J/vV0nyLf1KmcY+8N9orJOloO1N+GoT9RhMw15Caw
M0uCuFRT9g+p8S5GJAYQSpvjGnlU0PxK9uyX5ShoQ/BIx0Gzy0ZDXPkG9Ssc8W8f
/YdsWrrTgrgBvgXBg4MohMoAZLRVIAl/4TgxyKzmgjLeSoAjqCZ5LVGvSMKclxoy
gfsHFJ/KQMMEu22oEqxtnYcXeAxmQRN5SwZqBEl3uE0FQaKyXFk7vyMTULaA+wEU
Ry+62oXoyjtyOBcxCfF7O/X5qwKlMD8niFuRaO2//dS58Jlh2BsECh7BJzfjBjnl
mp9bsMnfoegRAh9utc3okYfs68wcEg==
=zN5/
-----END PGP SIGNATURE-----

--jSO8uOUuxq4Yr0B9w3k2KPAtgM89BK23F--

--===============1947490863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1947490863==--
