Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34401558F3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B88A6FCB5;
	Fri,  7 Feb 2020 14:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD2F6FCB2;
 Fri,  7 Feb 2020 14:02:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E72C9AD9F;
 Fri,  7 Feb 2020 14:02:04 +0000 (UTC)
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207133720.GZ43062@phenom.ffwll.local>
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
Message-ID: <86073cfa-496d-53d7-e4c4-9736128109fa@suse.de>
Date: Fri, 7 Feb 2020 15:02:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207133720.GZ43062@phenom.ffwll.local>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1496827826=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1496827826==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="D9yXtwD7gGzdg2h5hIuwn2r8uxzLi9QfJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D9yXtwD7gGzdg2h5hIuwn2r8uxzLi9QfJ
Content-Type: multipart/mixed; boundary="V29EbvTwsuwyC9VZXdBdBOTohQtHfHr12";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org,
 sam@ravnborg.org, emil.velikov@collabora.com
Message-ID: <86073cfa-496d-53d7-e4c4-9736128109fa@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207133720.GZ43062@phenom.ffwll.local>
In-Reply-To: <20200207133720.GZ43062@phenom.ffwll.local>

--V29EbvTwsuwyC9VZXdBdBOTohQtHfHr12
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.02.20 um 14:37 schrieb Daniel Vetter:
> On Fri, Feb 07, 2020 at 09:41:31AM +0100, Thomas Zimmermann wrote:
>> The simple-encoder helpers initialize an encoder with an empty
>> implementation. This covers the requirements of most of the existing
>> DRM drivers. A call to drm_simple_encoder_create() allocates and
>> initializes an encoder instance, a call to drm_simple_encoder_init()
>> initializes a pre-allocated instance.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> This has quick a bit midlayer taste to it ... I think having this as a
> helper would be cleaner ...

How would such a helper roughly look like?

Best regards
Thomas

>=20
> The other bit is drm_encoder->possible_crtcs. If we do create a helper =
for
> these, lets at least try to make them not suck too badly :-) Otherwise =
I
> guess it would be time to officially document what exactly possible_crt=
cs
> =3D=3D 0 means from an uabi pov.
> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/drm_encoder.c | 116 +++++++++++++++++++++++++++++++++=
+
>>  include/drm/drm_encoder.h     |  10 +++
>>  2 files changed, 126 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encod=
er.c
>> index ffe691a1bf34..1a65cab1f310 100644
>> --- a/drivers/gpu/drm/drm_encoder.c
>> +++ b/drivers/gpu/drm/drm_encoder.c
>> @@ -178,6 +178,122 @@ int drm_encoder_init(struct drm_device *dev,
>>  }
>>  EXPORT_SYMBOL(drm_encoder_init);
>> =20
>> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanu=
p =3D {
>> +	.destroy =3D drm_encoder_cleanup,
>> +};
>> +
>> +/**
>> + * drm_simple_encoder_init - Init a preallocated encoder
>> + * @dev: drm device
>> + * @funcs: callbacks for this encoder
>> + * @encoder_type: user visible type of the encoder
>> + * @name: printf style format string for the encoder name, or NULL
>> + *        for default name
>> + *
>> + * Initialises a preallocated encoder that has no further functionali=
ty. The
>> + * encoder will be released automatically.
>> + *
>> + * Returns:
>> + * Zero on success, error code on failure.
>> + */
>> +int drm_simple_encoder_init(struct drm_device *dev,
>> +			    struct drm_encoder *encoder,
>> +			    int encoder_type, const char *name, ...)
>> +{
>> +	char *namestr =3D NULL;
>> +	int ret;
>> +
>> +	if (name) {
>> +		va_list ap;
>> +
>> +		va_start(ap, name);
>> +		namestr =3D kvasprintf(GFP_KERNEL, name, ap);
>> +		va_end(ap);
>> +		if (!namestr)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	ret =3D __drm_encoder_init(dev, encoder,
>> +				 &drm_simple_encoder_funcs_cleanup,
>> +				 encoder_type, namestr);
>> +	if (ret)
>> +		goto err_kfree;
>> +
>> +	return 0;
>> +
>> +err_kfree:
>> +	if (name)
>> +		kfree(namestr);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_simple_encoder_init);
>> +
>> +static void drm_encoder_destroy(struct drm_encoder *encoder)
>> +{
>> +	struct drm_device *dev =3D encoder->dev;
>> +
>> +	drm_encoder_cleanup(encoder);
>> +	devm_kfree(dev->dev, encoder);
>> +}
>> +
>> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_destro=
y =3D {
>> +	.destroy =3D drm_encoder_destroy,
>> +};
>> +
>> +/**
>> + * drm_simple_encoder_create - Allocate and initialize an encoder
>> + * @dev: drm device
>> + * @encoder_type: user visible type of the encoder
>> + * @name: printf style format string for the encoder name, or NULL fo=
r
>> + *        default name
>> + *
>> + * Allocates and initialises an encoder that has no further functiona=
lity. The
>> + * encoder will be released automatically.
>> + *
>> + * Returns:
>> + * The encoder on success, a pointer-encoder error code on failure.
>> + */
>> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,=

>> +					      int encoder_type,
>> +					      const char *name, ...)
>> +{
>> +	char *namestr =3D NULL;
>> +	struct drm_encoder *encoder;
>> +	int ret;
>> +
>> +	encoder =3D devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
>> +	if (!encoder)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	if (name) {
>> +		va_list ap;
>> +
>> +		va_start(ap, name);
>> +		namestr =3D kvasprintf(GFP_KERNEL, name, ap);
>> +		va_end(ap);
>> +		if (!namestr) {
>> +			ret =3D -ENOMEM;
>> +			goto err_devm_kfree;
>> +		}
>> +	}
>> +
>> +	ret =3D __drm_encoder_init(dev, encoder,
>> +				 &drm_simple_encoder_funcs_destroy,
>> +				 encoder_type, namestr);
>> +	if (ret)
>> +		goto err_kfree;
>> +
>> +	return encoder;
>> +
>> +err_kfree:
>> +	if (name)
>> +		kfree(namestr);
>> +err_devm_kfree:
>> +	devm_kfree(dev->dev, encoder);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL(drm_simple_encoder_create);
>> +
>>  /**
>>   * drm_encoder_cleanup - cleans up an initialised encoder
>>   * @encoder: encoder to cleanup
>> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
>> index 5623994b6e9e..0214f6cf9de6 100644
>> --- a/include/drm/drm_encoder.h
>> +++ b/include/drm/drm_encoder.h
>> @@ -190,6 +190,16 @@ int drm_encoder_init(struct drm_device *dev,
>>  		     const struct drm_encoder_funcs *funcs,
>>  		     int encoder_type, const char *name, ...);
>> =20
>> +__printf(4, 5)
>> +int drm_simple_encoder_init(struct drm_device *dev,
>> +			    struct drm_encoder *encoder,
>> +			    int encoder_type, const char *name, ...);
>> +
>> +__printf(3, 4)
>> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,=

>> +					      int encoder_type,
>> +					      const char *name, ...);
>> +
>>  /**
>>   * drm_encoder_index - find the index of a registered encoder
>>   * @encoder: encoder to find index for
>> --=20
>> 2.25.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--V29EbvTwsuwyC9VZXdBdBOTohQtHfHr12--

--D9yXtwD7gGzdg2h5hIuwn2r8uxzLi9QfJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl49bdgACgkQaA3BHVML
eiMkRgf/bJVyraD20+VdzFSjY+qyJIFr2Z88P38vlnV3xIAqh3bgaEJDIqlbNDlh
vIIx99JRoC9KLh9vHd7Q5FGQjHt03TQyyRzCBd4cMBsdU4pDzrT5NMbiFF0B3xcl
J5EC71XHbNidgUVfqbhNQaRYYWPlOwMOiP0k7Ta+fHFv1HOiLGtFzxADUB+i4sP4
EP0mU+SX+SDbDARH5gPF1XBWeFmhO3t/moYYPYtK9QGtSVfy3xbIvxwDPGNfl3FE
CzQ+zcQDTC+TBXfrmFS/gjLiLqnQ7sSu5J1qro775rNapNhoIH2CoiUgDk4HHCbz
uGEPvP+MgtOAHZZt5BCOeKFffOaNQA==
=LwHY
-----END PGP SIGNATURE-----

--D9yXtwD7gGzdg2h5hIuwn2r8uxzLi9QfJ--

--===============1496827826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1496827826==--
