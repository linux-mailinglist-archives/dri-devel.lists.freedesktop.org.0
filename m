Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFD17318F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322886EDFB;
	Fri, 28 Feb 2020 07:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC0D6EDFA;
 Fri, 28 Feb 2020 07:08:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67479B004;
 Fri, 28 Feb 2020 07:08:20 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] drm/qxl: Use simple encoder
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200225131055.27550-1-tzimmermann@suse.de>
 <20200225131055.27550-5-tzimmermann@suse.de>
 <20200227204536.GF27592@ravnborg.org>
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
Message-ID: <f5f81e06-edda-16c6-82fb-f74f1c99ea22@suse.de>
Date: Fri, 28 Feb 2020 08:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227204536.GF27592@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1469319421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1469319421==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XM2oQaHof9k2M6exApwAQnSqigP4LQMrR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XM2oQaHof9k2M6exApwAQnSqigP4LQMrR
Content-Type: multipart/mixed; boundary="lMK05n7UFNCj751Z8nE6GTcI3v8AWzFOW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org,
 emil.velikov@collabora.com
Message-ID: <f5f81e06-edda-16c6-82fb-f74f1c99ea22@suse.de>
Subject: Re: [PATCH v3 4/4] drm/qxl: Use simple encoder
References: <20200225131055.27550-1-tzimmermann@suse.de>
 <20200225131055.27550-5-tzimmermann@suse.de>
 <20200227204536.GF27592@ravnborg.org>
In-Reply-To: <20200227204536.GF27592@ravnborg.org>

--lMK05n7UFNCj751Z8nE6GTcI3v8AWzFOW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 27.02.20 um 21:45 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, Feb 25, 2020 at 02:10:55PM +0100, Thomas Zimmermann wrote:
>> The qxl driver uses an empty implementation for its encoder. Replace
>> the code with the generic simple encoder.
>>
>> v2:
>> 	* rebase onto new simple-encoder interface
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  drivers/gpu/drm/qxl/qxl_display.c | 18 +++---------------
>>  1 file changed, 3 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/q=
xl_display.c
>> index ab4f8dd00400..9c0e1add59fb 100644
>> --- a/drivers/gpu/drm/qxl/qxl_display.c
>> +++ b/drivers/gpu/drm/qxl/qxl_display.c
>> @@ -31,6 +31,7 @@
>>  #include <drm/drm_gem_framebuffer_helper.h>
>>  #include <drm/drm_plane_helper.h>
>>  #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  #include "qxl_drv.h"
>>  #include "qxl_object.h"
>> @@ -1007,9 +1008,6 @@ static struct drm_encoder *qxl_best_encoder(stru=
ct drm_connector *connector)
>>  	return &qxl_output->enc;
>>  }
>> =20
>> -static const struct drm_encoder_helper_funcs qxl_enc_helper_funcs =3D=
 {
>> -};
>> -
>>  static const struct drm_connector_helper_funcs qxl_connector_helper_f=
uncs =3D {
>>  	.get_modes =3D qxl_conn_get_modes,
>>  	.mode_valid =3D qxl_conn_mode_valid,
>> @@ -1059,15 +1057,6 @@ static const struct drm_connector_funcs qxl_con=
nector_funcs =3D {
>>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,=

>>  };
>> =20
>> -static void qxl_enc_destroy(struct drm_encoder *encoder)
>> -{
>> -	drm_encoder_cleanup(encoder);
>> -}
>> -
>> -static const struct drm_encoder_funcs qxl_enc_funcs =3D {
>> -	.destroy =3D qxl_enc_destroy,
>> -};
>> -
>>  static int qxl_mode_create_hotplug_mode_update_property(struct qxl_de=
vice *qdev)
>>  {
>>  	if (qdev->hotplug_mode_update_property)
>> @@ -1098,15 +1087,14 @@ static int qdev_output_init(struct drm_device =
*dev, int num_output)
>>  	drm_connector_init(dev, &qxl_output->base,
>>  			   &qxl_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL);
>> =20
>> -	drm_encoder_init(dev, &qxl_output->enc, &qxl_enc_funcs,
>> -			 DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +	drm_simple_encoder_init(dev, &qxl_output->enc,
>> +				DRM_MODE_ENCODER_VIRTUAL);
> return value is ignored - as it was before.
> A quick grep told that it is 50/50 if return value is checked.
> So OK.

Well, now that you bring it up, I rather test for the returned value.
Continuing without an initialized encoder doesn't seem to make much sense=
=2E

Thanks for reviewing the patchset. I'll address the comments you had and
post another update before merging.

Best regards
Thomas

>=20
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> =20
>>  	/* we get HPD via client monitors config */
>>  	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>>  	encoder->possible_crtcs =3D 1 << num_output;
>>  	drm_connector_attach_encoder(&qxl_output->base,
>>  					  &qxl_output->enc);
>> -	drm_encoder_helper_add(encoder, &qxl_enc_helper_funcs);
>>  	drm_connector_helper_add(connector, &qxl_connector_helper_funcs);
>> =20
>>  	drm_object_attach_property(&connector->base,
>> --=20
>> 2.25.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lMK05n7UFNCj751Z8nE6GTcI3v8AWzFOW--

--XM2oQaHof9k2M6exApwAQnSqigP4LQMrR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5YvGEACgkQaA3BHVML
eiP1Hgf9Fwq4pHaXFCK0/GJAC5J6hu19bTlurzmrhKFzz1DL2TA3fl9xNZ0DYUYw
7QFKU88Dmtb4NVjW8yXFcrmMstYmAG+KB1JVDAUTNi4i6p7KK99wovSc+1Rb1q/y
siHk+UHOriHk+Qy+J3z21OzR5E7TUNoVCnVO+OxvZdAEXwUfTISuhrMqTJJ2S3MN
zdfqoTNLoo+SO/WhaGNgd7DYJcdEOaknGvl9FuHqPPKqRxQuxSJc6rlUWJlgKDNT
U8vFjx7RD2X1ODzqaDHxPRB4EL/k5FHizyAnevoh5m5DwGZ3/r6JxQa1zLYHEvLT
KaiQj7E/NbOrGaCNQLdC0WGdyxXEwA==
=QBcS
-----END PGP SIGNATURE-----

--XM2oQaHof9k2M6exApwAQnSqigP4LQMrR--

--===============1469319421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1469319421==--
