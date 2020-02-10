Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05631570AF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851506E918;
	Mon, 10 Feb 2020 08:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7F6E918;
 Mon, 10 Feb 2020 08:16:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A7CFAD7B;
 Mon, 10 Feb 2020 08:16:27 +0000 (UTC)
Subject: Re: [Intel-gfx] [PATCH v2 1/6] drm: Include the encoder itself in
 possible_clones
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-2-ville.syrjala@linux.intel.com>
 <d58f13cf-6c9e-9a1c-5cbd-e51e1ad04e80@suse.de>
 <20200207145001.GI13686@intel.com>
 <20200207162751.GJ43062@phenom.ffwll.local>
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
Message-ID: <085027c4-da51-0148-7eee-e9db94d00ad3@suse.de>
Date: Mon, 10 Feb 2020 09:16:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207162751.GJ43062@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1354347497=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1354347497==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yAEAAXLw7Pi8qwADx504aR5TTEW9KY8KE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yAEAAXLw7Pi8qwADx504aR5TTEW9KY8KE
Content-Type: multipart/mixed; boundary="zzxhnjqOjiEyhwU47VbSDAK35npUgy75X";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <085027c4-da51-0148-7eee-e9db94d00ad3@suse.de>
Subject: Re: [Intel-gfx] [PATCH v2 1/6] drm: Include the encoder itself in
 possible_clones
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-2-ville.syrjala@linux.intel.com>
 <d58f13cf-6c9e-9a1c-5cbd-e51e1ad04e80@suse.de>
 <20200207145001.GI13686@intel.com>
 <20200207162751.GJ43062@phenom.ffwll.local>
In-Reply-To: <20200207162751.GJ43062@phenom.ffwll.local>

--zzxhnjqOjiEyhwU47VbSDAK35npUgy75X
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.02.20 um 17:27 schrieb Daniel Vetter:
> On Fri, Feb 07, 2020 at 04:50:01PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote=
:
>> On Fri, Feb 07, 2020 at 03:28:35PM +0100, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 07.02.20 um 14:59 schrieb Ville Syrjala:
>>>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>>>
>>>> The docs say possible_clones should always include the encoder itsel=
f.
>>>> Since most drivers don't want to deal with the complexities of cloni=
ng
>>>> let's allow them to set possible_clones=3D0 and instead we'll fix th=
at
>>>> up in the core.
>>>>
>>>> We can't put this special case into drm_encoder_init() because drive=
rs
>>>> will have to fill up possible_clones after adding all the relevant
>>>> encoders. Otherwise they wouldn't know the proper encoder indexes to=

>>>> use. So we'll just do it just before registering the encoders.
>>>>
>>>> TODO: Should we do something similar for possible_crtcs=3D=3D0?
>>>>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.co=
m>
>>>
>>> May this fixup function should warn iff possible_clones was set to no=
n-0
>>> by the driver, but the encoder itself is missing.
>>
>> Yeah, I guess we could do that.
>=20
> +1 on that, should catch some bugs at least.
>=20
> Also can you pls fix up the kerneldoc for drm_encoder.possible_clones,
> defacto this now means that 0 is a totally fine setting.

Just a thought: we should encourage, or maybe even require, the use of
such defaults (i.e., 0); unless a driver has a good reason to override
them. So we don't have to fix drivers if the defaults ever change.

Best regards
Thomas

> -Daniel
>=20
>>
>>> In any case
>>>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>>> ---
>>>>  drivers/gpu/drm/drm_encoder.c | 15 +++++++++++++++
>>>>  1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_enc=
oder.c
>>>> index e555281f43d4..f761d9306028 100644
>>>> --- a/drivers/gpu/drm/drm_encoder.c
>>>> +++ b/drivers/gpu/drm/drm_encoder.c
>>>> @@ -66,11 +66,26 @@ static const struct drm_prop_enum_list drm_encod=
er_enum_list[] =3D {
>>>>  	{ DRM_MODE_ENCODER_DPI, "DPI" },
>>>>  };
>>>> =20
>>>> +/*
>>>> + * For some reason we want the encoder itself included in
>>>> + * possible_clones. Make life easy for drivers by allowing them
>>>> + * to leave possible_clones unset if no cloning is possible.
>>>> + */
>>>> +static void fixup_possible_clones(struct drm_device *dev)
>>>> +{
>>>> +	struct drm_encoder *encoder;
>>>> +
>>>> +	drm_for_each_encoder(encoder, dev)
>>>> +		encoder->possible_clones |=3D drm_encoder_mask(encoder);
>>>> +}
>>>> +
>>>>  int drm_encoder_register_all(struct drm_device *dev)
>>>>  {
>>>>  	struct drm_encoder *encoder;
>>>>  	int ret =3D 0;
>>>> =20
>>>> +	fixup_possible_clones(dev);
>>>> +
>>>>  	drm_for_each_encoder(encoder, dev) {
>>>>  		if (encoder->funcs->late_register)
>>>>  			ret =3D encoder->funcs->late_register(encoder);
>>>>
>>>
>>> --=20
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>> (HRB 36809, AG N=C3=BCrnberg)
>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>
>>
>>
>>
>>
>> --=20
>> Ville Syrj=C3=A4l=C3=A4
>> Intel
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zzxhnjqOjiEyhwU47VbSDAK35npUgy75X--

--yAEAAXLw7Pi8qwADx504aR5TTEW9KY8KE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5BEVcACgkQaA3BHVML
eiNKoAf8DMkFQeK1dmhopvZYU5IhAVuIOs/iM20wyPN9bnwd79jCXPcpGbWeA/tv
aNqDJjjT0gIgbk/o8SxOxHCrYTkRbqN4PNFTTCP+ZBLMUcpeEZhKEf373GgU2Mpk
xTVdoFip1Qdf4z7xGX93l58wdjOnsqII0av8QpfyVaw1yeQKGExsbIZt/+va2IpW
tVk/7DHj76qSRbgivyRyt42Gnk+89XkQwrFuuZPCozrc62fwpdKJB5uwQAfo9zZl
VXoc+4FO7/7fMulPbmfrEoScxl4pvRc1c9zdKT81J2VD17GldnO8ldnX8VRwjA/1
IJy71IQ9uK5eYMPL2AK7vhkiUPtvVg==
=vdbW
-----END PGP SIGNATURE-----

--yAEAAXLw7Pi8qwADx504aR5TTEW9KY8KE--

--===============1354347497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1354347497==--
