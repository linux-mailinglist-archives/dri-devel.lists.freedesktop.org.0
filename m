Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E257E35
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 10:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193D36E82A;
	Thu, 27 Jun 2019 08:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF1D6E4E8;
 Thu, 27 Jun 2019 08:27:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E35D7B077;
 Thu, 27 Jun 2019 08:27:38 +0000 (UTC)
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
 <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
 <20190617135912.GB12905@phenom.ffwll.local>
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
Message-ID: <e51754b0-542c-b1bb-9d5b-e53daf6d92eb@suse.de>
Date: Thu, 27 Jun 2019 10:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617135912.GB12905@phenom.ffwll.local>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1798994089=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1798994089==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wMydacYR0DTQCWxiVGYgvSXJgc07WuHFA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wMydacYR0DTQCWxiVGYgvSXJgc07WuHFA
Content-Type: multipart/mixed; boundary="Z0SImBY5s1zzeVZowdbaaQby8g0UAEa7n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Message-ID: <e51754b0-542c-b1bb-9d5b-e53daf6d92eb@suse.de>
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
 <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
 <20190617135912.GB12905@phenom.ffwll.local>
In-Reply-To: <20190617135912.GB12905@phenom.ffwll.local>

--Z0SImBY5s1zzeVZowdbaaQby8g0UAEa7n
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.06.19 um 15:59 schrieb Daniel Vetter:
> On Mon, Jun 17, 2019 at 10:24:38AM +0200, Gerd Hoffmann wrote:
>>   Hi,
>>
>>> Aside: Would be really nice to switch the others over to
>>> drm_gem_object_funcs.
>>
>> While most callbacks are pretty straight forward (just hook the same
>> callbacks into the drm_gem_object_funcs. struct) the mmap bits are a
>> bit more obscure.
>>
>> First, there seem to be two ways to mmap a gem buffer:
>>
>>   (1) drm_driver->fops->mmap, and
>>   (2) drm_driver->gem_prime_mmap.
>>
>> drm_gem_object_funcs has just a single vm_ops ...
>>
>> Also it is not obvious how one would convert something which basically=

>> calls ttm_bo_mmap() in drm_driver->fops->mmap to the new interface.
>=20
> Yeah the mmap side is still a mess, but my series here was getting a bi=
t
> too long already. There's a bunch of problems here:
>=20
> drm_driver->gem_prime_mmap could be nuked and instead we use
> drm_gem_prime_mmap everywhere. Especially the various versions in helpe=
rs
> really don't add much.
>=20
> The trouble is that removing the hook outright isn't quite right, becau=
se
> it also signals "is mmap allowed on this dma-buf". I'm kinda tempted to=

> just make that a hard requirement, and force people who can't support m=
map
> on the dma-buf (or who need begin/end_cpu_access hooks) to supply their=

> own set of dma_buf_ops.
>=20
> Second one is drm_driver->fops->mmap. That one we need to keep, but thi=
s
> isn't mmap on a buffer, but mmap on the entire drm_device. The one whic=
h
> should be replaced by drm_gem_object_funcs.vm_ops is
> drm_driver->gem_vm_ops.

=46rom what I've seen in fbdev drivers, it's an mmap of the framebuffer
memory, which typically is the same as the device's memory but doesn't
have to. And it's only valid for/while the current display mode (e.g.,
mgafb doesn't set fixes.smem_length until you configure a mode).

I guess it should be legal to just mmap the shadow FB from the fbcon
emulation.

Best regards
Thomas

> Hope that explains a bit better what's going on here. Step one here for=

> mmap is definitely to roll out drm_gem_prime_mmap as far as possible, s=
o
> it's easier to understand where the exceptions are.
>=20
> Cheers, Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--Z0SImBY5s1zzeVZowdbaaQby8g0UAEa7n--

--wMydacYR0DTQCWxiVGYgvSXJgc07WuHFA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0UffQACgkQaA3BHVML
eiNbewf7BwzOgKKoTeMAagNJnmeGtX1Is2UMCJZKkDH8tg2onQusCJBMiZGdskDt
kK58CrnznuFthJl2amFWXvqKh5iuBJ/30AinPuAGW0MJeuUgYPenGX9kIvLIeruV
kOpKYC8EiHKUtcqSWF6ay8f5ooYcEibL6ucm01MlBo4v4WiWGdkMIvqdlRig7D7I
4dNsTiMNsOdHoJHswrg/rcoN8YegcY6WqFUistZfRUrIto4XSx6iUwBbI493StuB
G9+oskgAzIDP1N7Yvi59///RLUWt16uyecRV56bkzgOWqqH5uBQ0EFjZ6VqIR+Bm
+7rqLZr7ftCCEAXR5z+AeoioAI4QgQ==
=izsP
-----END PGP SIGNATURE-----

--wMydacYR0DTQCWxiVGYgvSXJgc07WuHFA--

--===============1798994089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1798994089==--
