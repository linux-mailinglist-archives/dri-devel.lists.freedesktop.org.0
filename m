Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019721BF2A1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 10:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AC26E23B;
	Thu, 30 Apr 2020 08:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DA86E23B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:23:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4752FABB2;
 Thu, 30 Apr 2020 08:23:06 +0000 (UTC)
Subject: Re: [PATCH 05/17] drm/mgag200: Clean up mga_set_start_address()
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-6-tzimmermann@suse.de>
 <20200429182023.GE31071@ravnborg.org>
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
Message-ID: <6785948e-e72b-5f93-d0dd-bcef4d382bac@suse.de>
Date: Thu, 30 Apr 2020 10:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200429182023.GE31071@ravnborg.org>
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============2104821841=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2104821841==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="c7jdHUGJoMSBhO3woVnvVINY5WfvBuWvj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c7jdHUGJoMSBhO3woVnvVINY5WfvBuWvj
Content-Type: multipart/mixed; boundary="2Kyyk7Sfqpo6VnzVYHC1u9mZa79CHSUAd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 noralf@tronnes.org, john.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <6785948e-e72b-5f93-d0dd-bcef4d382bac@suse.de>
Subject: Re: [PATCH 05/17] drm/mgag200: Clean up mga_set_start_address()
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-6-tzimmermann@suse.de>
 <20200429182023.GE31071@ravnborg.org>
In-Reply-To: <20200429182023.GE31071@ravnborg.org>

--2Kyyk7Sfqpo6VnzVYHC1u9mZa79CHSUAd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.04.20 um 20:20 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Wed, Apr 29, 2020 at 04:32:26PM +0200, Thomas Zimmermann wrote:
>> All register names and fields are now named according to the
>> MGA programming manuals. The function doesn't need the CRTC, so
>> callers pass in the device structure directly. The logging now
>> uses device-specific macros.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 82 +++++++++++++++----------=
-
>>  2 files changed, 53 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index 4403145e3593c..9b957d9fc7e04 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -61,6 +61,11 @@
>>  		WREG8(MGAREG_CRTC_DATA, v);			\
>>  	} while (0)						\
>> =20
>> +#define RREG_ECRT(reg, v)					\
>> +	do {							\
>> +		WREG8(MGAREG_CRTCEXT_INDEX, reg);		\
>> +		v =3D RREG8(MGAREG_CRTCEXT_DATA);			\
>> +	} while (0)						\
>> =20
>>  #define WREG_ECRT(reg, v)					\
>>  	do {							\
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 3d894b37a0812..b16a73c8617d6 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -819,49 +819,53 @@ static void mga_g200wb_commit(struct drm_crtc *c=
rtc)
>>  }
>> =20
>>  /*
>> -   This is how the framebuffer base address is stored in g200 cards:
>> -   * Assume @offset is the gpu_addr variable of the framebuffer objec=
t
>> -   * Then addr is the number of _pixels_ (not bytes) from the start o=
f
>> -     VRAM to the first pixel we want to display. (divided by 2 for 32=
bit
>> -     framebuffers)
>> -   * addr is stored in the CRTCEXT0, CRTCC and CRTCD registers
>> -   addr<20> -> CRTCEXT0<6>
>> -   addr<19-16> -> CRTCEXT0<3-0>
>> -   addr<15-8> -> CRTCC<7-0>
>> -   addr<7-0> -> CRTCD<7-0>
>> -   CRTCEXT0 has to be programmed last to trigger an update and make t=
he
>> -   new addr variable take effect.
>> + * This is how the framebuffer base address is stored in g200 cards:
>> + *   * Assume @offset is the gpu_addr variable of the framebuffer obj=
ect
>> + *   * Then addr is the number of _pixels_ (not bytes) from the start=
 of
>> + *     VRAM to the first pixel we want to display. (divided by 2 for =
32bit
>> + *     framebuffers)
>> + *   * addr is stored in the CRTCEXT0, CRTCC and CRTCD registers
>> + *      addr<20> -> CRTCEXT0<6>
>> + *      addr<19-16> -> CRTCEXT0<3-0>
>> + *      addr<15-8> -> CRTCC<7-0>
>> + *      addr<7-0> -> CRTCD<7-0>
>> + *
>> + *  CRTCEXT0 has to be programmed last to trigger an update and make =
the
>> + *  new addr variable take effect.
>>   */
>> -static void mga_set_start_address(struct drm_crtc *crtc, unsigned off=
set)
>> +static void mgag200_set_startadd(struct mga_device *mdev,
>> +				 unsigned long offset)
>>  {
>> -	struct mga_device *mdev =3D crtc->dev->dev_private;
>> -	u32 addr;
>> -	int count;
>> -	u8 crtcext0;
>> +	struct drm_device *dev =3D mdev->dev;
>> +	uint32_t startadd;
>> +	uint8_t crtcc, crtcd, crtcext0;
>> =20
>> -	while (RREG8(0x1fda) & 0x08);
>> -	while (!(RREG8(0x1fda) & 0x08));
>> +	startadd =3D offset / 8;
>> =20
>> -	count =3D RREG8(MGAREG_VCOUNT) + 2;
>> -	while (RREG8(MGAREG_VCOUNT) < count);
>> -
>> -	WREG8(MGAREG_CRTCEXT_INDEX, 0);
>> -	crtcext0 =3D RREG8(MGAREG_CRTCEXT_DATA);
>> -	crtcext0 &=3D 0xB0;
>> -	addr =3D offset / 8;
>> -	/* Can't store addresses any higher than that...
>> -	   but we also don't have more than 16MB of memory, so it should be =
fine. */
>> -	WARN_ON(addr > 0x1fffff);
>> -	crtcext0 |=3D (!!(addr & (1<<20)))<<6;
>> -	WREG_CRT(0x0d, (u8)(addr & 0xff));
>> -	WREG_CRT(0x0c, (u8)(addr >> 8) & 0xff);
>> -	WREG_ECRT(0x0, ((u8)(addr >> 16) & 0xf) | crtcext0);
>> +	/*
>> +	 * Can't store addresses any higher than that, but we also
>> +	 * don't have more than 16MB of memory, so it should be fine.
>> +	 */
>> +	drm_WARN_ON(dev, startadd > 0x1fffff);
>> +
>> +	RREG_ECRT(0x00, crtcext0);
>> +
>> +	crtcc =3D (startadd >> 8) & 0xff;
>> +	crtcd =3D startadd & 0xff;
>> +	crtcext0 &=3D 0xb0;
>=20
>> +	crtcext0 |=3D ((startadd >> 14) & BIT(6)) |
> It is not so obvious that the value of bit 20 is stored in bit 6 here.
>=20
> Maybe:
> 	crtcext0 |=3D ((startadd & BIT(20) >> 14) |
>=20
> I would find the above easier to parse.

Ok. I can change that.

>=20
>> +		    ((startadd >> 16) & 0x0f);
>=20
>> +
>> +	WREG_CRT(0x0c, crtcc);
>> +	WREG_CRT(0x0d, crtcd);
>> +	WREG_ECRT(0x00, crtcext0);
>>  }
>> =20
>>  static int mga_crtc_do_set_base(struct drm_crtc *crtc,
>>  				struct drm_framebuffer *fb,
>>  				int x, int y, int atomic)
>>  {
>> +	struct mga_device *mdev =3D crtc->dev->dev_private;
> Could you use a crtc_to_mdev() macro here.
> So we avoid adding new users of dev_private?

I introduce such a macro in a later patch. I guess I'll add a separate
patch for the macro and the conversion of all these dev_private reference=
s.


>=20
>>  	struct drm_gem_vram_object *gbo;
>>  	int ret;
>>  	s64 gpu_addr;
> Make this unsigned long and..

The function that returns gpu_addr can fail (but shouldn't) with a
negative error. That's why it's signed.

>=20
>> @@ -882,7 +886,7 @@ static int mga_crtc_do_set_base(struct drm_crtc *c=
rtc,
>>  		goto err_drm_gem_vram_unpin;
>>  	}
>> =20
>> -	mga_set_start_address(crtc, (u32)gpu_addr);
>> +	mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
> drop this cast.
>=20
>=20
>> =20
>>  	return 0;
>> =20
>> @@ -894,6 +898,16 @@ static int mga_crtc_do_set_base(struct drm_crtc *=
crtc,
>>  static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y=
,
>>  				  struct drm_framebuffer *old_fb)
>>  {
>> +	struct drm_device *dev =3D crtc->dev;
>> +	struct mga_device *mdev =3D dev->dev_private;
>> +	unsigned int count;
>> +
>> +	while (RREG8(0x1fda) & 0x08) { }
>> +	while (!(RREG8(0x1fda) & 0x08)) { }
>> +
>> +	count =3D RREG8(MGAREG_VCOUNT) + 2;
>> +	while (RREG8(MGAREG_VCOUNT) < count) { }
>> +
>>  	return mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
>>  }
> I do not really see why this code was lifter two functions up.
> Before is was deep in mga_set_start_address(), now it is in
> mga_crtc_mode_set_base().
> Puzzeled?

Ah, that should have probably been explained in the commit message. The
above code waits for the vsync flag to go up plus two scanlines. That
way the pageflip happens during a vblank period.

It's fairly inefficient AFAICT. I don't want this code in atomic
modesetting, but didn't want to throw it away yet. So it's now in the
non-atomic callback. Later when the atomic code calls
mgag200_set_startadd(), it shouldn't busy-wait for vblanks.

I still have a patch that adds vblank irq support to mgag200. I'd rather
merge that instead of keeping this busy waiting in the driver.

Best regards
Thomas


>=20
> 	Sam
>=20
>=20
>=20
>> =20
>> --=20
>> 2.26.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--2Kyyk7Sfqpo6VnzVYHC1u9mZa79CHSUAd--

--c7jdHUGJoMSBhO3woVnvVINY5WfvBuWvj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6qiucACgkQaA3BHVML
eiO03QgAl55JzRWl0AelIF8UePGRSBXG+HHaxGW2V7fMwA4wkcNLv3t4A72/HWhX
jBEcc/zKRx+2xPFvhHEn86Sb/Fjf1tGdyflTTDKNwxDM5vvBJkGQTwGe7MCTe4Ad
mIWIbA2cKKaxV1KmZiZr3LwQA7g/E4F6N9BaXUkkchm+2Ac80Pi4eMkdKYrFE6Um
gF4Adv2WxgxzCw0DA/1Kda9fWmyzMkkOJbFz9avB3byNnPG3IogMl6jrmUCCKTOU
B0O6wv40x1HcoyoK4+iv2m3582iNOUF97Vygg3iMm3ek1BF2C9XHF2UKledS/xmd
GgKCotaVCvWzYfjiPXjW7D+1RAV+/Q==
=27FN
-----END PGP SIGNATURE-----

--c7jdHUGJoMSBhO3woVnvVINY5WfvBuWvj--

--===============2104821841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2104821841==--
