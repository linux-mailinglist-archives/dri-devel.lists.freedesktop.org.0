Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC80119921B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 11:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1596E313;
	Tue, 31 Mar 2020 09:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5AD6E313
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1999AAFC3;
 Tue, 31 Mar 2020 09:23:31 +0000 (UTC)
Subject: Re: [PATCH] drm/vram-helpers: Set plane fence for display update
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200331081130.24600-1-tzimmermann@suse.de>
 <20200331085054.GK2363188@phenom.ffwll.local>
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
Message-ID: <b9043d4e-a608-bdd6-729c-5a91a68cdb40@suse.de>
Date: Tue, 31 Mar 2020 11:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331085054.GK2363188@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sam@ravnborg.org, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0191704318=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0191704318==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MP9oWKsECXLN5hOlramtOlCZoOK6dMV2I"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MP9oWKsECXLN5hOlramtOlCZoOK6dMV2I
Content-Type: multipart/mixed; boundary="beUZfVIwpeeKPFgPuU4XQNfWkQos2Qowg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 sam@ravnborg.org
Message-ID: <b9043d4e-a608-bdd6-729c-5a91a68cdb40@suse.de>
Subject: Re: [PATCH] drm/vram-helpers: Set plane fence for display update
References: <20200331081130.24600-1-tzimmermann@suse.de>
 <20200331085054.GK2363188@phenom.ffwll.local>
In-Reply-To: <20200331085054.GK2363188@phenom.ffwll.local>

--beUZfVIwpeeKPFgPuU4XQNfWkQos2Qowg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 31.03.20 um 10:50 schrieb Daniel Vetter:
> On Tue, Mar 31, 2020 at 10:11:30AM +0200, Thomas Zimmermann wrote:
>> Calling the VRAM helper's prepare_fb() helper now sets the plane's
>> fence object. The helper still has to synchronize with other users
>> of the GEM object. Leave a related TODO comment in the code.
>>
>> This will be useful for PRIME support. VRAM helpers don't support
>> buffer sharing ATM, so there are no drivers requiring this change.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index b3201a70cbfcb..d4e4f80d3a6c1 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -5,6 +5,7 @@
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>  #include <drm/drm_gem_ttm_helper.h>
>>  #include <drm/drm_gem_vram_helper.h>
>>  #include <drm/drm_mode.h>
>> @@ -670,9 +671,9 @@ EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset=
);
>>   * @plane:	a DRM plane
>>   * @new_state:	the plane's new state
>>   *
>> - * During plane updates, this function pins the GEM VRAM
>> - * objects of the plane's new framebuffer to VRAM. Call
>> - * drm_gem_vram_plane_helper_cleanup_fb() to unpin them.
>> + * During plane updates, this function sets the plane's fence and
>> + * pins the GEM VRAM objects of the plane's new framebuffer to VRAM.
>> + * Call drm_gem_vram_plane_helper_cleanup_fb() to unpin them.
>>   *
>>   * Returns:
>>   *	0 on success, or
>> @@ -689,6 +690,13 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_p=
lane *plane,
>>  	if (!new_state->fb)
>>  		return 0;
>> =20
>> +	/*
>> +	 * TODO: Synchronize with other users of the buffer. Buffers
>> +	 *       cannot be pinned to VRAM while they are in use by other
>> +	 *       drivers for DMA. We should probably wait for each GEM
>> +	 *       object's fence before attempting to pin the buffer.
>> +	 *       There are currently no users of this functionality.
>> +	 */
>=20
> Not sure this is warranted, we have lots of drivers with these kind of
> restrictions ... It's a big can of worms, I'd just leave this all out.

Well, OK. Adding PRIME support would require a rework of these helpers
anyway.

Best regards
Thomas

>=20
>>  	for (i =3D 0; i < ARRAY_SIZE(new_state->fb->obj); ++i) {
>>  		if (!new_state->fb->obj[i])
>>  			continue;
>> @@ -698,6 +706,10 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_p=
lane *plane,
>>  			goto err_drm_gem_vram_unpin;
>>  	}
>> =20
>> +	ret =3D drm_gem_fb_prepare_fb(plane, new_state);
>> +	if (ret)
>> +		goto err_drm_gem_vram_unpin;
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>> +
>>  	return 0;
>> =20
>>  err_drm_gem_vram_unpin:
>> --=20
>> 2.26.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--beUZfVIwpeeKPFgPuU4XQNfWkQos2Qowg--

--MP9oWKsECXLN5hOlramtOlCZoOK6dMV2I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6DDBIACgkQaA3BHVML
eiPSiggAqapzWByayjz4qW0CfriP2Ah0QoXH7dcgDIwFQfS2DeTCxZOQgPAgIalC
MUzZyXi7Rs6pknMblAJL4B3Y+aD232UZDh/t8A1P85CZqoHkz8h4hib6kU4RtkrK
5KtG3Dyo8XBzsT7oreaj27ujF10TrRgH9THi1JLEZI+T15fZJT/oVgBPeRzL4ydg
z0Ho7hgCn4VzfGe1YLyBaUQuKeH7zZe4fpY1lYXnqFxIrGAtbJSdsasJiwHt4RUg
Cv4E9BY6XO3SwcPiEMNo9PJWvYOFxKTkdKVxS58M/hOL7non49XCLstNWs78W4sR
gy7L5n4ZHRIWmA4mtZIR4UoqbMjE7g==
=eHXB
-----END PGP SIGNATURE-----

--MP9oWKsECXLN5hOlramtOlCZoOK6dMV2I--

--===============0191704318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0191704318==--
