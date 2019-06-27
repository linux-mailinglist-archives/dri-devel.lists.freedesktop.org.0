Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457058672
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EBA6E077;
	Thu, 27 Jun 2019 15:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6D66E077
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:54:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CAD7AD12;
 Thu, 27 Jun 2019 15:54:55 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] gem/vram: pin to vram in vmap
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190627122348.5833-1-kraxel@redhat.com>
 <20190627122348.5833-2-kraxel@redhat.com>
 <8a52b578-b255-3e11-3a0c-0b68f0cb649e@suse.de>
 <20190627151633.j3xf3lkihklb2wzh@sirius.home.kraxel.org>
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
Message-ID: <bd472b0a-faec-c97f-39a6-ffd0bd8fdd78@suse.de>
Date: Thu, 27 Jun 2019 17:54:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627151633.j3xf3lkihklb2wzh@sirius.home.kraxel.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1677419065=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1677419065==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tBTTJRDtS7CMLIYpOYJXPvr7feH33XgYO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tBTTJRDtS7CMLIYpOYJXPvr7feH33XgYO
Content-Type: multipart/mixed; boundary="5aKuOwci0HBAv9zVXFDlQwFppkudXPOMv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard
 <maxime.ripard@bootlin.com>, open list <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Message-ID: <bd472b0a-faec-c97f-39a6-ffd0bd8fdd78@suse.de>
Subject: Re: [PATCH v3 1/5] gem/vram: pin to vram in vmap
References: <20190627122348.5833-1-kraxel@redhat.com>
 <20190627122348.5833-2-kraxel@redhat.com>
 <8a52b578-b255-3e11-3a0c-0b68f0cb649e@suse.de>
 <20190627151633.j3xf3lkihklb2wzh@sirius.home.kraxel.org>
In-Reply-To: <20190627151633.j3xf3lkihklb2wzh@sirius.home.kraxel.org>

--5aKuOwci0HBAv9zVXFDlQwFppkudXPOMv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.06.19 um 17:16 schrieb Gerd Hoffmann:
>   Hi,
>=20
>>  1) Introduce a default_placement field in struct drm_gem_vram_helper
>> where this flag can be configured. I'd favor this option.
>=20
>>  2) Introduce a separate callback function for pinning to vram. The
>> driver would have to set the correct function pointers.
>=20
>>  3) Pin the fb console buffer manually from within the bochs driver.
>=20
> Hmm.  Before calling drm_fbdev_generic_setup() the bo doesn't exist yet=

> and when the function returns it is already vmapped and pinned I think.=

>=20
> So (3) isn't easily doable.  (1) looks best to me.

For my patches, it's OK to have to BO pinned to VRAM by default. As the
BO will be unmapped most of the time, I can change this flag at any time.=


Best regards
Thomas

> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--5aKuOwci0HBAv9zVXFDlQwFppkudXPOMv--

--tBTTJRDtS7CMLIYpOYJXPvr7feH33XgYO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0U5soACgkQaA3BHVML
eiNQeAf+NnjuxqrjNx6kGfqn9NwnbfJLfP67MLbaMk5zgiP57zfMw/CAdHENVBtT
fVlNbTQ2Y5894tk+TgvZUmtAbql242FJ8nPLTYoWoipUN5IgZ6m+dt/kCSZ80ci7
jffxxMeosDdXc8RGLIntkKJn/axK0S+L3h3dt8Jd6LyOhd7pUu4JM76IknYY6pUr
TEJpYUzwiUW7OD7+eXBNxfK5fshT/gGmWUIItkWwCVMNQegPIHAfvqkpv4BHK+A2
3U38OZLODh64Z+Xnzz01mm+QM7jlXizRtVPAz6LzqUJtApf3OrnSSvMxhC+e1Ela
A2NOCN5NpkxMCmsfPnmS3C1Sdux9yg==
=USKJ
-----END PGP SIGNATURE-----

--tBTTJRDtS7CMLIYpOYJXPvr7feH33XgYO--

--===============1677419065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1677419065==--
