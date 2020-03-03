Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B117725D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84B06EA59;
	Tue,  3 Mar 2020 09:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949C06EA59
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 09:29:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB67CACC3;
 Tue,  3 Mar 2020 09:29:01 +0000 (UTC)
Subject: Re: [PATCH] drm/simple-kms: Fix documentation for
 drm_simple_encoder_init()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200303071807.9288-1-tzimmermann@suse.de>
 <20200303083329.GN2363188@phenom.ffwll.local>
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
Message-ID: <afd2774e-706c-9563-c637-3a5677cfda2c@suse.de>
Date: Tue, 3 Mar 2020 10:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303083329.GN2363188@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0488279252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0488279252==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PbacI8M65rYta5l1Wx1yjYEAIOgiVnkjT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PbacI8M65rYta5l1Wx1yjYEAIOgiVnkjT
Content-Type: multipart/mixed; boundary="agYyzuWlC8YknaqExg8VJx4hGdJ1XGTuK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Message-ID: <afd2774e-706c-9563-c637-3a5677cfda2c@suse.de>
Subject: Re: [PATCH] drm/simple-kms: Fix documentation for
 drm_simple_encoder_init()
References: <20200303071807.9288-1-tzimmermann@suse.de>
 <20200303083329.GN2363188@phenom.ffwll.local>
In-Reply-To: <20200303083329.GN2363188@phenom.ffwll.local>

--agYyzuWlC8YknaqExg8VJx4hGdJ1XGTuK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.03.20 um 09:33 schrieb Daniel Vetter:
> On Tue, Mar 03, 2020 at 08:18:07AM +0100, Thomas Zimmermann wrote:
>> Brings the documentation of drm_simple_encoder_init() in sync with the=

>> function's signature.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 63170ac6f2e8 ("drm/simple-kms: Add drm_simple_encoder_{init,cre=
ate}()")
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>  drivers/gpu/drm/drm_simple_kms_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm=
/drm_simple_kms_helper.c
>> index 5a2abe2dea3e..2fab80aaf52e 100644
>> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
>> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
>> @@ -40,7 +40,7 @@ static const struct drm_encoder_funcs drm_simple_enc=
oder_funcs_cleanup =3D {
>>  /**
>>   * drm_simple_encoder_init - Initialize a preallocated encoder
>>   * @dev: drm device
>> - * @funcs: callbacks for this encoder
>> + * @encoder: the encoder to initialize
>>   * @encoder_type: user visible type of the encoder
>>   *
>>   * Initialises a preallocated encoder that has no further functionali=
ty.
>=20
> btw reading this I just realized ... who does the kfree on the memory
> containing the encoder? The ->destroy hook doesn't do that, and without=

> that the only other option thus far is devm_kzalloc, which is wrong.
> drmm_kzalloc would fix this, but we don't have that yet.
>=20
> How does this work? Maybe add a FIXME note that right now this can only=

> really be used if the encoder is embedded into something else that's
> getting freed ...

Good point. The function expects the driver to kfree the memory as part
of the final release. The drivers I saw did this, but adding an
additional note here is probably a good idea.

Best regards
Thomas

> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--agYyzuWlC8YknaqExg8VJx4hGdJ1XGTuK--

--PbacI8M65rYta5l1Wx1yjYEAIOgiVnkjT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5eI1kACgkQaA3BHVML
eiN6bAf/V4x1ulQ1kjYI/wip9wNXBsOM4FfHc0GZJHY1DG74MYbY2CF91XSEwb6m
f9oX+J4zCOllciowaHaO1QRkBfnwadB74q3pVS0oWkeUOj0ezPEXM6Ig4JPjSgeK
hMws8MHulUayNyPi9Qvsf6iOZfETIzbYzqZub7/iA/0Yf7oU1LYNvL/1JHijSWul
ODo+YjciBOqUvxqSruRNQKEEBH5mMfUCXygi98sLWHbcG6cGPo0dEYUysk5dV1IN
icR80FLYFoPxn2s9+Xc+3jKz1mZyUFosevwghmgGbbRxldwv4498eJ+YN0kMIH2L
Ss8q9xcnHBbDWLejGHNo16ZAbxt3rQ==
=OjGJ
-----END PGP SIGNATURE-----

--PbacI8M65rYta5l1Wx1yjYEAIOgiVnkjT--

--===============0488279252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0488279252==--
