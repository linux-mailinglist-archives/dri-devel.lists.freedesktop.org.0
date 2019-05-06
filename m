Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4514A8C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C0189209;
	Mon,  6 May 2019 13:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478DA89209
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:05:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6DA6AE18;
 Mon,  6 May 2019 13:05:46 +0000 (UTC)
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506124344.hltulw6e3kkcg4w3@sirius.home.kraxel.org>
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
Message-ID: <a0b3f173-5ea0-eb5f-f34c-e637b7f818f6@suse.de>
Date: Mon, 6 May 2019 15:05:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190506124344.hltulw6e3kkcg4w3@sirius.home.kraxel.org>
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
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0578982252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0578982252==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MIpqIrpQ0zrJ8hecbEz6MqUQizfrA1n5D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MIpqIrpQ0zrJ8hecbEz6MqUQizfrA1n5D
Content-Type: multipart/mixed; boundary="OzOtIt5nCzzuHZsYwtuWC0oFJN1cbRR7R";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, ray.huang@amd.com, zourongrong@gmail.com,
 sam@ravnborg.org, christian.koenig@amd.com
Message-ID: <a0b3f173-5ea0-eb5f-f34c-e637b7f818f6@suse.de>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506124344.hltulw6e3kkcg4w3@sirius.home.kraxel.org>
In-Reply-To: <20190506124344.hltulw6e3kkcg4w3@sirius.home.kraxel.org>

--OzOtIt5nCzzuHZsYwtuWC0oFJN1cbRR7R
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.05.19 um 14:43 schrieb Gerd Hoffmann:
> On Mon, May 06, 2019 at 10:26:30AM +0200, Thomas Zimmermann wrote:
>> Several simple framebuffer drivers copy most of the TTM code from each=

>> other. The implementation is always the same; except for the name of
>> some data structures.
>>
>> As recently discussed, this patch set provides generic memory-manageme=
nt
>> code for simple framebuffers with dedicated video memory. It further
>> converts the respective drivers to the generic code. The shared code
>> is basically the same implementation as the one copied among individua=
l
>> drivers.
>>
>> The patch set contains two major changes: first, it introduces
>> |struct drm_gem_vram_object| and helpers (GEM VRAM). It's a GEM object=

>> that is backed by VRAM. The type's purpose is somewhat similar to
>> |struct drm_gem_{cma, shmem}_object|: it provides an commom implementa=
tion
>> that handles all the basic cases. Second, the patch set introduces
>> |struct drm_vram_mm| and helpers (VRAM MM). It's an implementation of =
a
>> basic memory manager for VRAM.
>>
>> Both, GEM VRAM and VRAM MM, support buffer placement in VRAM and syste=
m
>> memory. Both can be used independedly from each other if desired by th=
e
>> DRM driver.
>=20
> Looks good to me overall, some small nits in replies to patches.
>=20
>> Currently ast, bochs, mgag200, vboxvideo and hisilicon/hibmc can use
>> these helpers.
>=20
> I've tested bochs on qemu, works fine.

Thank you!

> What is the testing status of the other drivers?

I've tested ast and mgag200 on hardware. I only compiled the others,
including bochs. I did verify that the code I replaced is basically the
same as in the new helpers.

Best regards
Thomas

> cheers,
>   Gerd
>=20
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


--OzOtIt5nCzzuHZsYwtuWC0oFJN1cbRR7R--

--MIpqIrpQ0zrJ8hecbEz6MqUQizfrA1n5D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzQMSYACgkQaA3BHVML
eiNLewgAgc5Jbpd7qDr01e3bGhlRDe9vra/rHKk9s7XvWgGelqlP+Orgkh5t8gfZ
OFgzUPfU/7xTQfKoxTY7mt933BS1lCLnBsQmfBNbLWRLKmKFaVdd7VXLQi1YDkGu
mItR+IGt1LtbJjyZsgJgBhsuwwcaEawFRPOWInf/mK+BCu/WSIHoGu6hASjon4GP
e+qNiv24Wm/TbchUY61/KXfnQD5Lqrssm1V3eNWVn5korjXULrrEYf3U7tt10/Uv
QdE9AYLieTM+I+YaGaRN6FWUxfi59dggaI1XOBXJsLn9+24mMT0ni43/pkREsw0i
ufv4m/heWlGK+Q5H5h6XcgWcJWC8mQ==
=oJGA
-----END PGP SIGNATURE-----

--MIpqIrpQ0zrJ8hecbEz6MqUQizfrA1n5D--

--===============0578982252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0578982252==--
