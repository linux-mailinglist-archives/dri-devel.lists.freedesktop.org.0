Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DCAAB3B7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 10:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1525A6E1AA;
	Fri,  6 Sep 2019 08:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE116E1AA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 08:10:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C3F2EADBF;
 Fri,  6 Sep 2019 08:10:32 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being
 displayed
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
 <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
 <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>
 <b3a103fc-dc91-9a4a-4e64-d654b8d0611a@suse.de>
 <20190905092940.pi2u5755rys6tkgz@sirius.home.kraxel.org>
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
Message-ID: <7501a018-b550-6d17-457a-753a1b9c71c9@suse.de>
Date: Fri, 6 Sep 2019 10:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905092940.pi2u5755rys6tkgz@sirius.home.kraxel.org>
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
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============2059416871=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2059416871==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RISYdHNWehoEEo8WmNzJK6GZzse9LMC87"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RISYdHNWehoEEo8WmNzJK6GZzse9LMC87
Content-Type: multipart/mixed; boundary="KezhWFpNE9vJqcZGKAyrcZetgzKH2h1Dw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Ying
 <ying.huang@intel.com>, Sean Paul <sean@poorly.run>
Message-ID: <7501a018-b550-6d17-457a-753a1b9c71c9@suse.de>
Subject: Re: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being
 displayed
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
 <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
 <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>
 <b3a103fc-dc91-9a4a-4e64-d654b8d0611a@suse.de>
 <20190905092940.pi2u5755rys6tkgz@sirius.home.kraxel.org>
In-Reply-To: <20190905092940.pi2u5755rys6tkgz@sirius.home.kraxel.org>

--KezhWFpNE9vJqcZGKAyrcZetgzKH2h1Dw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.09.19 um 11:29 schrieb Gerd Hoffmann:
> On Thu, Sep 05, 2019 at 10:19:40AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 05.09.19 um 09:56 schrieb Daniel Vetter:
>>> On Thu, Sep 5, 2019 at 9:01 AM Gerd Hoffmann <kraxel@redhat.com> wrot=
e:
>>>>
>>>>   Hi,
>>>>
>>>>> - imo we should fix this by using the io_mapping stuff, that avoids=

>>>>> the overhead of repeated pat checks for map/unmap.
>>>>
>>>> Another idea:  IIRC ttm has a move_notify callback.  So we could sim=
ply
>>>> keep mappings active even when the refcount goes down to zero.  Then=
 do
>>>> the actual unmap either in the move_notify or in the destroy callbac=
k.
>>>
>>> Yeah that should be a really clean solution, and only needs changes i=
n
>>> the vram helpers. Which is nice, more common code!
>>
>> But the console's BO is special wrt to mapping. Putting special code f=
or
>>  console handling into vram helpers doesn't seem right.
>=20
> I have no special handling in mind.  I think we can simply do that for
> all gem objects, no matter whenever they are created by fbcon or
> userspace (wayland/xorg/whatever).  vmap will create a mapping (or
> increase the reference count).  vunmap decreases the reference count,
> when it goes down to zero unpin it but keep the mapping.  The actual
> unmap happens when ttm wants move the object from VRAM to SYSTEM due to=

> VRAM being full.  In case vram has room for all our objects we simply
> never unmap.

That's pretty cool. Thanks for clarifying. I think it's the solution I
was looking for.

Best regards
Thomas

>=20
> hope this clarifies,
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


--KezhWFpNE9vJqcZGKAyrcZetgzKH2h1Dw--

--RISYdHNWehoEEo8WmNzJK6GZzse9LMC87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1yFHQACgkQaA3BHVML
eiOHNAgAhN3dPgKW3VWioS0EyyWPzpp+uyNWP4Jop8xPnMZA8hCvPPGLS40fjBgJ
9mzwglptactpsAHogGMuz7dEXep7rxLJz9abSLRG2ClT0CWQx9kDfwSiSPMLR1wb
u4QDiloA9zT/H/n//WWr5vitpPlEaoQOudoWuo/tB5Ubu1z32z0pUzNhyBUwtcUD
wPZegv3kAhhvsPi1FheEwpP4iTDp5PTbOirdQiebeRcp2vD1eMl4uCEysDY2vjE3
Sku00RFHUhrPu+WvXlyrpmVyoObxvfUvdZ4Fim1Ri2aWoLA9IiWwn2n4qpwgF6lj
Us5023BH7fgh9VsptS/tOhWBJk6UNA==
=uwjL
-----END PGP SIGNATURE-----

--RISYdHNWehoEEo8WmNzJK6GZzse9LMC87--

--===============2059416871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2059416871==--
