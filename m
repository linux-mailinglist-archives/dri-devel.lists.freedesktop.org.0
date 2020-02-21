Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FD1670C4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 08:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0A96EEAF;
	Fri, 21 Feb 2020 07:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9016EEAF;
 Fri, 21 Feb 2020 07:48:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 342C7AD5C;
 Fri, 21 Feb 2020 07:48:54 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] drm/mgag200: Use simple encoder
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-4-tzimmermann@suse.de>
 <20200220185642.GA20011@ravnborg.org>
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
Message-ID: <3044661c-7552-e685-37b3-88865f97a991@suse.de>
Date: Fri, 21 Feb 2020 08:48:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220185642.GA20011@ravnborg.org>
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
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1378906466=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1378906466==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DUBWN9ElGP8OsLUD5XE3WCTOucgrt5Zs9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DUBWN9ElGP8OsLUD5XE3WCTOucgrt5Zs9
Content-Type: multipart/mixed; boundary="Z9QfqVzg1HcrcJJFQy30vOtUHaPfVRzvn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 alexander.deucher@amd.com, emil.velikov@collabora.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Message-ID: <3044661c-7552-e685-37b3-88865f97a991@suse.de>
Subject: Re: [PATCH v2 3/4] drm/mgag200: Use simple encoder
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-4-tzimmermann@suse.de>
 <20200220185642.GA20011@ravnborg.org>
In-Reply-To: <20200220185642.GA20011@ravnborg.org>

--Z9QfqVzg1HcrcJJFQy30vOtUHaPfVRzvn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

thanks for reviewing the patch set.

Am 20.02.20 um 19:56 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, Feb 18, 2020 at 09:48:14AM +0100, Thomas Zimmermann wrote:
>> The mgag200 driver uses an empty implementation for its encoder. Repla=
ce
>> the code with the generic simple encoder.
>>
>> v2:
>> 	* rebase onto new simple-encoder interface
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  7 ---
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 61 ++-----------------------=
-
>>  2 files changed, 3 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index aa32aad222c2..9bb9e8e14539 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -95,7 +95,6 @@
>>  #define MATROX_DPMS_CLEARED (-1)
>> =20
>>  #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
>> -#define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
>>  #define to_mga_connector(x) container_of(x, struct mga_connector, bas=
e)
>> =20
>>  struct mga_crtc {
>> @@ -110,12 +109,6 @@ struct mga_mode_info {
>>  	struct mga_crtc *crtc;
>>  };
>> =20
>> -struct mga_encoder {
>> -	struct drm_encoder base;
>> -	int last_dpms;
>> -};
>> -
>> -
>>  struct mga_i2c_chan {
>>  	struct i2c_adapter adapter;
>>  	struct drm_device *dev;
>=20
> Any particular reason why the drm_encoder is not embedded in struct
> mga_device?
>=20
> I found it more elegant - like you did it for ast in the previous patch=
=2E

I think I wanted something that uses drm_simple_encoder_create(). But I
can change that. The embedded variant is indeed better.

Best regards
Thomas

>=20
> I also noted there is one more unused "last_dpms" - but it is outside
> the scope of this patch to remove it.
>=20
> 	Sam
>=20
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 62a8e9ccb16d..957ea1057b6c 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -15,6 +15,7 @@
>>  #include <drm/drm_fourcc.h>
>>  #include <drm/drm_plane_helper.h>
>>  #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  #include "mgag200_drv.h"
>> =20
>> @@ -1449,72 +1450,16 @@ static void mga_crtc_init(struct mga_device *m=
dev)
>>  	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
>>  }
>> =20
>> -/*
>> - * The encoder comes after the CRTC in the output pipeline, but befor=
e
>> - * the connector. It's responsible for ensuring that the digital
>> - * stream is appropriately converted into the output format. Setup is=

>> - * very simple in this case - all we have to do is inform qemu of the=

>> - * colour depth in order to ensure that it displays appropriately
>> - */
>> -
>> -/*
>> - * These functions are analagous to those in the CRTC code, but are i=
ntended
>> - * to handle any encoder-specific limitations
>> - */
>> -static void mga_encoder_mode_set(struct drm_encoder *encoder,
>> -				struct drm_display_mode *mode,
>> -				struct drm_display_mode *adjusted_mode)
>> -{
>> -
>> -}
>> -
>> -static void mga_encoder_dpms(struct drm_encoder *encoder, int state)
>> -{
>> -	return;
>> -}
>> -
>> -static void mga_encoder_prepare(struct drm_encoder *encoder)
>> -{
>> -}
>> -
>> -static void mga_encoder_commit(struct drm_encoder *encoder)
>> -{
>> -}
>> -
>> -static void mga_encoder_destroy(struct drm_encoder *encoder)
>> -{
>> -	struct mga_encoder *mga_encoder =3D to_mga_encoder(encoder);
>> -	drm_encoder_cleanup(encoder);
>> -	kfree(mga_encoder);
>> -}
>> -
>> -static const struct drm_encoder_helper_funcs mga_encoder_helper_funcs=
 =3D {
>> -	.dpms =3D mga_encoder_dpms,
>> -	.mode_set =3D mga_encoder_mode_set,
>> -	.prepare =3D mga_encoder_prepare,
>> -	.commit =3D mga_encoder_commit,
>> -};
>> -
>> -static const struct drm_encoder_funcs mga_encoder_encoder_funcs =3D {=

>> -	.destroy =3D mga_encoder_destroy,
>> -};
>> -
>>  static struct drm_encoder *mga_encoder_init(struct drm_device *dev)
>>  {
>>  	struct drm_encoder *encoder;
>> -	struct mga_encoder *mga_encoder;
>> =20
>> -	mga_encoder =3D kzalloc(sizeof(struct mga_encoder), GFP_KERNEL);
>> -	if (!mga_encoder)
>> +	encoder =3D drm_simple_encoder_create(dev, DRM_MODE_ENCODER_DAC);
>> +	if (IS_ERR(encoder))
>>  		return NULL;
>> =20
>> -	encoder =3D &mga_encoder->base;
>>  	encoder->possible_crtcs =3D 0x1;
>> =20
>> -	drm_encoder_init(dev, encoder, &mga_encoder_encoder_funcs,
>> -			 DRM_MODE_ENCODER_DAC, NULL);
>> -	drm_encoder_helper_add(encoder, &mga_encoder_helper_funcs);
>> -
>>  	return encoder;
>>  }
>> =20
>> --=20
>> 2.25.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Z9QfqVzg1HcrcJJFQy30vOtUHaPfVRzvn--

--DUBWN9ElGP8OsLUD5XE3WCTOucgrt5Zs9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5Pi2MACgkQaA3BHVML
eiMSbggAkKW4IPwzooc5SmxndNtmXeGJBR7GSbpTrkC93svgAJek8UbcW8W1L2fT
xhwoCFC3AqyDHX85Bvw4FVOXQW7jeozq0TeOrMZ8L2rIZMXgXJSOqU+9fILF7hfN
nTRQnh26fPvM+gf30BK7OxIEU29+xP3Qgk6YtybUkxZ085ye9WNdDwolSOUaCU+m
Jo+gsNnaGESGyznHsDI+AFA6BqFoSVon6YtI0Gh0h4dKRW8jdIKJnGvGiaAY2eqn
iZJoOb2X6ViMHwTDTkV6DCwZbtiNSLpWqjtcfLAEtmuCtQqJd14CAS2Grkq0nmi/
+EzQZc6CBEzUofFnXoi+FJ+njNaI0A==
=Pd8i
-----END PGP SIGNATURE-----

--DUBWN9ElGP8OsLUD5XE3WCTOucgrt5Zs9--

--===============1378906466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1378906466==--
