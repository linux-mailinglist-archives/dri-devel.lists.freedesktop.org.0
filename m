Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623019FB7A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 19:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390A96E456;
	Mon,  6 Apr 2020 17:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3316E455;
 Mon,  6 Apr 2020 17:27:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A0DC8BED5;
 Mon,  6 Apr 2020 17:27:48 +0000 (UTC)
Subject: Re: [PATCH 15/44] drm/udl: Use demv_drm_dev_alloc
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-16-daniel.vetter@ffwll.ch>
 <3e3f7726-f1d2-c29f-4fc8-c42002e7da13@tronnes.org>
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
Message-ID: <e9a9e984-c541-eddf-8ef6-e9575120b6ca@suse.de>
Date: Mon, 6 Apr 2020 14:05:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3e3f7726-f1d2-c29f-4fc8-c42002e7da13@tronnes.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1083458970=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1083458970==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oMowpIf7WANBBkFomtHQEL57xeCDQGgOT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oMowpIf7WANBBkFomtHQEL57xeCDQGgOT
Content-Type: multipart/mixed; boundary="9pWDUWAxuExrVDH1thoo98bb9arbCcMGr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <e9a9e984-c541-eddf-8ef6-e9575120b6ca@suse.de>
Subject: Re: [PATCH 15/44] drm/udl: Use demv_drm_dev_alloc
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-16-daniel.vetter@ffwll.ch>
 <3e3f7726-f1d2-c29f-4fc8-c42002e7da13@tronnes.org>
In-Reply-To: <3e3f7726-f1d2-c29f-4fc8-c42002e7da13@tronnes.org>

--9pWDUWAxuExrVDH1thoo98bb9arbCcMGr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 05.04.20 um 12:18 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 03.04.2020 15.57, skrev Daniel Vetter:
>> Also init the fbdev emulation before we register the device, that way
>> we can rely on the auto-cleanup and simplify the probe error code even=

>> more.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> ---
>>  drivers/gpu/drm/udl/udl_drv.c | 36 +++++++++++-----------------------=
-
>>  1 file changed, 11 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_d=
rv.c
>> index 1ce2d865c36d..4ba5149fdd57 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.c
>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>> @@ -57,27 +57,20 @@ static struct udl_device *udl_driver_create(struct=
 usb_interface *interface)
>>  	struct udl_device *udl;
>>  	int r;
>> =20
>> -	udl =3D kzalloc(sizeof(*udl), GFP_KERNEL);
>> -	if (!udl)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	r =3D drm_dev_init(&udl->drm, &driver, &interface->dev);
>> -	if (r) {
>> -		kfree(udl);
>> -		return ERR_PTR(r);
>> -	}
>> +	udl =3D devm_drm_dev_alloc(&interface->dev, &driver,
>> +				 struct udl_device, drm);
>> +	if (IS_ERR(udl))
>> +		return udl;
>> =20
>>  	udl->udev =3D udev;
>>  	udl->drm.dev_private =3D udl;
>> -	drmm_add_final_kfree(&udl->drm, udl);
>> =20
>>  	r =3D udl_init(udl);
>> -	if (r) {
>> -		drm_dev_put(&udl->drm);
>> +	if (r)
>>  		return ERR_PTR(r);
>> -	}
>> =20
>>  	usb_set_intfdata(interface, udl);
>> +
>>  	return udl;
>>  }
>> =20
>> @@ -91,23 +84,17 @@ static int udl_usb_probe(struct usb_interface *int=
erface,
>>  	if (IS_ERR(udl))
>>  		return PTR_ERR(udl);
>> =20
>> +	r =3D drm_fbdev_generic_setup(&udl->drm, 0);
>=20
> It doesn't feel right to have a client open the device before the DRM
> device itself is registered. I would prefer to keep it where it is but

Agreed. IMHO we should also go through drivers and make the fbdev setup
the final step everywhere.

Best regards
Thomas

> ignore any errors. A failing client shouldn't prevent the driver from
> probing. drm_fbdev_generic_setup() do print errors if it fails. So yeah=
,
> in hindsight I should have made drm_fbdev_generic_setup() return void.
>=20
> Noralf.
>=20
>> +	if (r)
>> +		return r;
>> +
>>  	r =3D drm_dev_register(&udl->drm, 0);
>>  	if (r)
>> -		goto err_free;
>> +		return r;
>> =20
>>  	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
>> =20
>> -	r =3D drm_fbdev_generic_setup(&udl->drm, 0);
>> -	if (r)
>> -		goto err_drm_dev_unregister;
>> -
>>  	return 0;
>> -
>> -err_drm_dev_unregister:
>> -	drm_dev_unregister(&udl->drm);
>> -err_free:
>> -	drm_dev_put(&udl->drm);
>> -	return r;
>>  }
>> =20
>>  static void udl_usb_disconnect(struct usb_interface *interface)
>> @@ -117,7 +104,6 @@ static void udl_usb_disconnect(struct usb_interfac=
e *interface)
>>  	drm_kms_helper_poll_fini(dev);
>>  	udl_drop_usb(dev);
>>  	drm_dev_unplug(dev);
>> -	drm_dev_put(dev);
>>  }
>> =20
>>  /*
>>
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


--9pWDUWAxuExrVDH1thoo98bb9arbCcMGr--

--oMowpIf7WANBBkFomtHQEL57xeCDQGgOT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6LGxYACgkQaA3BHVML
eiN3LAgAhPSGBUF1WcrgNbxcYtA7Nn0d/FPQoEI4JJhk6z1v8hzLntGJOzLrRiBs
aTV5lFUg+tuzRBQCCGbv611M3TeFKdZAqziMAi/kcQxSvLD+7yzc0f7PR78J4puY
fxL3brjMoCeMQLG4SM0scolgtS4aB/TZTBLdTJNoPyf8rjekQvGJDgRSntIq03/7
xXepIpAq9N+SDf7m2vlM82tiXeK9zeeLbpzS17OA5+wvjN5djMsV5F9cVp48v4jU
YVWfLlvKDm/b+yCooK1S/ghEDE0FjGUdnUPlZFFf9y72rZs+yc+fiuK/MATCg6oA
cYozV/P5oveWRmaQKeoAos0MsrBN4g==
=DSyX
-----END PGP SIGNATURE-----

--oMowpIf7WANBBkFomtHQEL57xeCDQGgOT--

--===============1083458970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1083458970==--
