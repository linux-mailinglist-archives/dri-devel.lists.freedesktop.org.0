Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622681458D0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 16:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10206F58F;
	Wed, 22 Jan 2020 15:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034856F587;
 Wed, 22 Jan 2020 15:31:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 91F0FADAA;
 Wed, 22 Jan 2020 15:31:25 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] drm: support feature masks in
 drm_core_check_feature()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20200122140259.12086-1-jani.nikula@intel.com>
 <4eec4b04-23ab-9c48-d27c-9679974d1dbd@suse.de> <87pnfbefd5.fsf@intel.com>
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
Message-ID: <1e49d86f-4c3c-ef4d-8ac1-2d5d4f77cc30@suse.de>
Date: Wed, 22 Jan 2020 16:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87pnfbefd5.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1480195280=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1480195280==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3e1PibxBj9RrjjEoRYzXqAhp9Lu8ICtrp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3e1PibxBj9RrjjEoRYzXqAhp9Lu8ICtrp
Content-Type: multipart/mixed; boundary="Zpga9DnLM5LPJamv6jAmtJxgpgDWb0aHk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <1e49d86f-4c3c-ef4d-8ac1-2d5d4f77cc30@suse.de>
Subject: Re: [PATCH v2 1/2] drm: support feature masks in
 drm_core_check_feature()
References: <20200122140259.12086-1-jani.nikula@intel.com>
 <4eec4b04-23ab-9c48-d27c-9679974d1dbd@suse.de> <87pnfbefd5.fsf@intel.com>
In-Reply-To: <87pnfbefd5.fsf@intel.com>

--Zpga9DnLM5LPJamv6jAmtJxgpgDWb0aHk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.01.20 um 15:27 schrieb Jani Nikula:
> On Wed, 22 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi Jani
>>
>> Am 22.01.20 um 15:02 schrieb Jani Nikula:
>>> Allow a mask of features to be passed to drm_core_check_feature(). Al=
l
>>> features in the mask are required.
>>>
>>> v2:
>>> - fix kernel-doc (Ville)
>>> - add an extra variable for clarity (Ville)
>>>
>>> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>  include/drm/drm_drv.h | 12 ++++++++----
>>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index cf13470810a5..f18e19f3f2d0 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -826,16 +826,20 @@ static inline bool drm_dev_is_unplugged(struct =
drm_device *dev)
>>>  /**
>>>   * drm_core_check_feature - check driver feature flags
>>>   * @dev: DRM device to check
>>> - * @feature: feature flag
>>> + * @features: feature flag(s)
>>>   *
>>>   * This checks @dev for driver features, see &drm_driver.driver_feat=
ures,
>>>   * &drm_device.driver_features, and the various &enum drm_driver_fea=
ture flags.
>>>   *
>>> - * Returns true if the @feature is supported, false otherwise.
>>> + * Returns true if all features in the @features mask are supported,=
 false
>>> + * otherwise.
>>>   */
>>> -static inline bool drm_core_check_feature(const struct drm_device *d=
ev, u32 feature)
>>> +static inline bool drm_core_check_feature(const struct drm_device *d=
ev,
>>> +					  u32 features)
>>
>> It's misnamed now. I'd add a new function, say
>> drm_core_check_all_features(), which makes the purpose clear.
>=20
> We don't really need another function. We need this one to check all th=
e
> features. But I'd rather not do the mass rename of all call sites for n=
o
> real benefit.

My point is: does the function check for all of the given features or
any combination of them? The function's name doesn't tell you.

Best regards
Thomas

>=20
> BR,
> Jani.
>=20
>=20
>>
>> Best regards
>> Thomas
>>
>>>  {
>>> -	return dev->driver->driver_features & dev->driver_features & featur=
e;
>>> +	u32 supported =3D dev->driver->driver_features & dev->driver_featur=
es;
>>> +
>>> +	return features && (supported & features) =3D=3D features;
>>>  }
>>> =20
>>>  /**
>>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Zpga9DnLM5LPJamv6jAmtJxgpgDWb0aHk--

--3e1PibxBj9RrjjEoRYzXqAhp9Lu8ICtrp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4oaskACgkQaA3BHVML
eiMFgwgAwdYcJOVKITQ0VhCzMboujzDsQAPQPvtBAkZdWwjuygJ5L2tK+1OBlA8V
S65rFxeg0u+QRN9iVkWai9A5lNZEmJx1Zn7pKwhjsyliYK7c27ekvU4AAwKy2vZG
3mD7hZi4cCyLhqkPTTJmn5puOK1CgZRBP76ALU6QB4pvsiC6O6FlX+rOhjz1i7UM
GgKa3DWIkrqwfLaqcKTl0O9cn4L1uBV9L2eQ58E4LbQJ2k7HZXbZeHy6pYqUgJ3w
sqoZDVD6HwUnLCiQHOIKSUeTPX6HFKzXv3GnvcYZISDS/LJbOe831ntFLxJfz399
FU8HqzlvrucEpUR6pg7HnZdrvIT7+Q==
=JSQ/
-----END PGP SIGNATURE-----

--3e1PibxBj9RrjjEoRYzXqAhp9Lu8ICtrp--

--===============1480195280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1480195280==--
