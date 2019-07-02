Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A55CA64
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 10:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2104289B30;
	Tue,  2 Jul 2019 08:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291B589B30
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 08:03:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8D10B112;
 Tue,  2 Jul 2019 08:03:38 +0000 (UTC)
Subject: Re: [PATCH 3/4] drm/hibmc: Leave struct
 drm_driver.gem_free_object_unlocked to NULL
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-4-tzimmermann@suse.de>
 <20190628165529.GU12905@phenom.ffwll.local>
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
Message-ID: <3871c161-6e9c-ccae-1e7a-59aa1b55da70@suse.de>
Date: Tue, 2 Jul 2019 10:03:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190628165529.GU12905@phenom.ffwll.local>
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
Cc: sean@poorly.run, maxime.ripard@bootlin.com, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 airlied@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0517442899=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0517442899==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="choG5ZYnGg65hzFTVBNjsTKmpSMVouDBx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--choG5ZYnGg65hzFTVBNjsTKmpSMVouDBx
Content-Type: multipart/mixed; boundary="T22uqTdlWsF0bOmTIsGbkjbfh00EMfbCW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, puck.chen@hisilicon.com,
 zourongrong@gmail.com, airlied@redhat.com, sean@poorly.run
Message-ID: <3871c161-6e9c-ccae-1e7a-59aa1b55da70@suse.de>
Subject: Re: [PATCH 3/4] drm/hibmc: Leave struct
 drm_driver.gem_free_object_unlocked to NULL
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-4-tzimmermann@suse.de>
 <20190628165529.GU12905@phenom.ffwll.local>
In-Reply-To: <20190628165529.GU12905@phenom.ffwll.local>

--T22uqTdlWsF0bOmTIsGbkjbfh00EMfbCW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.06.19 um 18:55 schrieb Daniel Vetter:
> On Fri, Jun 28, 2019 at 02:26:58PM +0200, Thomas Zimmermann wrote:
>> The GEM object's free function is now called through
>> struct drm_gem_object_funcs.free.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index ce89e56937b0..0efccf365101 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -51,8 +51,6 @@ static struct drm_driver hibmc_driver =3D {
>>  	.desc			=3D "hibmc drm driver",
>>  	.major			=3D 1,
>>  	.minor			=3D 0,
>> -	.gem_free_object_unlocked =3D
>> -		drm_gem_vram_driver_gem_free_object_unlocked,
>>  	.dumb_create            =3D hibmc_dumb_create,
>>  	.dumb_map_offset        =3D drm_gem_vram_driver_dumb_mmap_offset,
>=20
> This one looks like it could removed too?

Removing it requires a bit more work on the related fop's mmap function.
Probably something for a separate patch.

Best regards
Thomas

> And then you can ditch the
> EXPORT_SYMBOL and kerneldoc for that one too I think. Anyway good
> follow-up. On the series:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> But it's too hot here, so maybe only count that as an ack :-)
>=20
> Cheers, Daniel
>=20
>>  	.irq_handler		=3D hibmc_drm_interrupt,
>> --=20
>> 2.21.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--T22uqTdlWsF0bOmTIsGbkjbfh00EMfbCW--

--choG5ZYnGg65hzFTVBNjsTKmpSMVouDBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0bD9kACgkQaA3BHVML
eiOG3gf/UrxXxqkLLXEkv1LI0aqmHkUfEzoL4p9iE9JQ9zFFO9gD90vFaaT4ATUv
cLDsTz6F9Vjkkn68NDjxW/+QBZ4sfJZscWwTMvgE2P1PIhoys8x2cFvLcmmZ1QPw
ibS5G/ogaXW44VZE1J+45r67i8bq+psi/7SXPMls+3wt0/AhO/X4yWKkW5fOrfYa
2JUbTzSQ36H2IvG+VJcdNQO7EH1yq+YrQpreiOQu+BLHQQnpD4PUyJG0pik74Txe
XsMXaOM0hAH3tUC3D2G/oRS7Tqu0/ELQPuxe6Mb9nK2XdDs8m80Sy9nwGKez5Qmq
C+cENiAg8XGKiTpRFgHJQ2mSP+oCjA==
=bTQl
-----END PGP SIGNATURE-----

--choG5ZYnGg65hzFTVBNjsTKmpSMVouDBx--

--===============0517442899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0517442899==--
