Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1D01A0E40
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 15:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A866E875;
	Tue,  7 Apr 2020 13:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD17D6E871
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 13:19:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E4CEACF0;
 Tue,  7 Apr 2020 13:19:16 +0000 (UTC)
Subject: Re: [PATCH 03/10] drm/kirin: Set up fbdev after fully registering
 device
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406134405.6232-4-tzimmermann@suse.de>
 <20200407080426.GG3456981@phenom.ffwll.local>
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
Message-ID: <14093183-ee1b-ffc4-31d2-c302abd69585@suse.de>
Date: Tue, 7 Apr 2020 15:19:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407080426.GG3456981@phenom.ffwll.local>
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
Cc: sean@poorly.run, chunkuang.hu@kernel.org, hdegoede@redhat.com,
 airlied@linux.ie, puck.chen@hisilicon.com, jsarha@ti.com,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, kraxel@redhat.com,
 zourongrong@gmail.com, matthias.bgg@gmail.com, tiantao6@hisilicon.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0035876534=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0035876534==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mlBTdnhqTfyeCvjrm3SPncy1mHOGcfMZd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mlBTdnhqTfyeCvjrm3SPncy1mHOGcfMZd
Content-Type: multipart/mixed; boundary="o8AJX80QHVtdsC7AXDwSwTRmTSUg6RZou";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 tomi.valkeinen@ti.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 hdegoede@redhat.com, jsarha@ti.com, matthias.bgg@gmail.com, sean@poorly.run,
 zourongrong@gmail.com, tiantao6@hisilicon.com
Message-ID: <14093183-ee1b-ffc4-31d2-c302abd69585@suse.de>
Subject: Re: [PATCH 03/10] drm/kirin: Set up fbdev after fully registering
 device
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406134405.6232-4-tzimmermann@suse.de>
 <20200407080426.GG3456981@phenom.ffwll.local>
In-Reply-To: <20200407080426.GG3456981@phenom.ffwll.local>

--o8AJX80QHVtdsC7AXDwSwTRmTSUg6RZou
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.04.20 um 10:04 schrieb Daniel Vetter:
> On Mon, Apr 06, 2020 at 03:43:58PM +0200, Thomas Zimmermann wrote:
>> Generic fbdev support is a DRM client. Set it up after fully registeri=
ng
>> the new DRM device.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers=
/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
>> index d3145ae877d74..981858cc8d2b5 100644
>> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
>> @@ -277,8 +277,6 @@ static int kirin_drm_bind(struct device *dev)
>>  	if (ret)
>>  		goto err_kms_cleanup;
>> =20
>> -	drm_fbdev_generic_setup(drm_dev, 32);
>> -
>>  	/* connectors should be registered after drm device register */
>>  	if (driver_data->register_connects) {
>>  		ret =3D kirin_drm_connectors_register(drm_dev);
>> @@ -286,6 +284,8 @@ static int kirin_drm_bind(struct device *dev)
>>  			goto err_drm_dev_unregister;
>>  	}
>> =20
>> +	drm_fbdev_generic_setup(drm_dev, 32);
>=20
> The code you jump over is nonsense and should be reverted. I replied to=

> the patch that landed this.

What did they respond?

When I read this code, I wondered why it might be there.

Best regards
Thomas

> -Daniel
>=20
>> +
>>  	return 0;
>> =20
>>  err_drm_dev_unregister:
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


--o8AJX80QHVtdsC7AXDwSwTRmTSUg6RZou--

--mlBTdnhqTfyeCvjrm3SPncy1mHOGcfMZd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6MfdAACgkQaA3BHVML
eiNc7gf/dvalnvInh/zZwjPtDHqZ6uZDtayp/v878NrFhsquOR8Pcu/UV9j3ACVX
QaZZNcWWD7enva8GD+Z65Q0AcjC/K+5M+pCPDTl8JHb/gT4GYIY7Tffx++KHEl93
+aon+nRLYPcgnZYkeKdZTjpwNGeDNGI8hlRh0gPH/vJXMTd/Qd+kXUJBrQf04Vq+
8bfdurv+yoQm7uLwf2gh/gT6YyoKJYzA07xlFdF2Tr34K6UsbS/+K0ODOkEgAOYD
ZLT2nAUATR2P8Zn9tg3TR/uTOekmoh9SbIBZoWGOAItBsWmQdnleI9LSVeXygSbw
g3hMkeZgfw9kDS0Je2BdTvnMmPvC5Q==
=S8jY
-----END PGP SIGNATURE-----

--mlBTdnhqTfyeCvjrm3SPncy1mHOGcfMZd--

--===============0035876534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0035876534==--
