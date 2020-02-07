Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7097155608
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 11:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD926FC31;
	Fri,  7 Feb 2020 10:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755CF6FC2F;
 Fri,  7 Feb 2020 10:50:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79345AB7F;
 Fri,  7 Feb 2020 10:50:30 +0000 (UTC)
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>
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
Message-ID: <cd78b79f-ff4e-9c8e-4d87-ce717a717559@suse.de>
Date: Fri, 7 Feb 2020 11:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1900887909=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1900887909==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="T0w1ckiulGikfr0Xhr6obHC3UuCzv4Cvb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T0w1ckiulGikfr0Xhr6obHC3UuCzv4Cvb
Content-Type: multipart/mixed; boundary="X5V3QFNtNcX9iXkOwABge6p9MixeZf7V0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, noralf@tronnes.org, sam@ravnborg.org,
 alexander.deucher@amd.com, emil.velikov@collabora.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Message-ID: <cd78b79f-ff4e-9c8e-4d87-ce717a717559@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>
In-Reply-To: <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>

--X5V3QFNtNcX9iXkOwABge6p9MixeZf7V0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gerd

Am 07.02.20 um 11:33 schrieb Gerd Hoffmann:
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
>=20
> How about using
>=20
> #define drm_simple_encoder_init(dev, type, name, ...) \
>         drm_encoder_init(dev, drm_simple_encoder_funcs_cleanup, type, n=
ame, __VA_ARGS__)
>=20
> instead ?

I'd prefer a function call for aesthetic reasons and for not having to
export the drm_simple_encoder_funcs_cleanup. drm_simple_encoder_create()
is also a function and probably cannot be turned into a macro. So having
a function for drm_simple_encoder_init seems consequent.

I guess you want to save a few lines in the implementation of
drm_simple_encoder_init() (?) If so, I'd rather try to share more
internal code among the various init and create functions.

Best regards
Thomas

>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--X5V3QFNtNcX9iXkOwABge6p9MixeZf7V0--

--T0w1ckiulGikfr0Xhr6obHC3UuCzv4Cvb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl49QPMACgkQaA3BHVML
eiPcOgf7Bi+fIF8jY2zA0Xv7Qud52dM7kca2Q2x3OHLeUyBs0vUUpB9AFONibBwx
jqhQIo6mQvyqw2rDUTXCpznw2qV5IrCJW+Rc31hQb+p9g1+BPZsf8oJjQlXam7Th
QV2nyw5SisqXgLP3XfUNWuKLE8zC6htCDHj0h/bnp0Ov7EWFt1PZ3Ymi/8NzdhxS
KupkfqeUuXD1lxNPH6x4fJh8KzC26BnvSItJGAyM2kK+Q8porJCbyJNfd2x3gDNX
csEODfagrVw2/m8f+eqyh6t33Z9dlvReB1jehSdSND2Af49j6aJd5D+ZT8alrrG2
bXN+qXJ6RRTYcVbr8yldee3jSlFNnQ==
=cFhv
-----END PGP SIGNATURE-----

--T0w1ckiulGikfr0Xhr6obHC3UuCzv4Cvb--

--===============1900887909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1900887909==--
