Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FC164492
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 13:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCFE6E5CF;
	Wed, 19 Feb 2020 12:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032B56E5CF;
 Wed, 19 Feb 2020 12:46:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E7C2B1E4;
 Wed, 19 Feb 2020 12:45:58 +0000 (UTC)
Subject: Re: [PATCH 05/52] drm/mipi_dbi: Use drmm_add_final_kfree in all
 drivers
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-6-daniel.vetter@ffwll.ch>
 <afebd4b0-686d-0912-17e7-fd442ec5c3ab@suse.de>
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
Message-ID: <2f9ac775-bc88-c805-85da-41be3e07789c@suse.de>
Date: Wed, 19 Feb 2020 13:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <afebd4b0-686d-0912-17e7-fd442ec5c3ab@suse.de>
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
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1596649332=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1596649332==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cFO68nJCpMNQP38gtaamNrhlilM3KNeRD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cFO68nJCpMNQP38gtaamNrhlilM3KNeRD
Content-Type: multipart/mixed; boundary="qW2Dy9AVefryHHJFZtj84pQjWswVUZTKO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <2f9ac775-bc88-c805-85da-41be3e07789c@suse.de>
Subject: Re: [PATCH 05/52] drm/mipi_dbi: Use drmm_add_final_kfree in all
 drivers
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-6-daniel.vetter@ffwll.ch>
 <afebd4b0-686d-0912-17e7-fd442ec5c3ab@suse.de>
In-Reply-To: <afebd4b0-686d-0912-17e7-fd442ec5c3ab@suse.de>

--qW2Dy9AVefryHHJFZtj84pQjWswVUZTKO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 19.02.20 um 12:47 schrieb Thomas Zimmermann:
> Hi Daniel,
>=20
> good idea. I guess it's the simple encoder's fault. :) I only read
> briefly over the whole thing.
>=20
> Am 19.02.20 um 11:20 schrieb Daniel Vetter:
>> They all share mipi_dbi_release so we need to switch them all
>> together. With this we can drop the final kfree from the release
>> function.
>>
>> Aside, I think we could perhaps have a tiny additional helper for
>> these mipi_dbi drivers, the first few lines around devm_drm_dev_init
>> are all the same (except for the drm_driver pointer).
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Eric Anholt <eric@anholt.net>
>> Cc: David Lechner <david@lechnology.com>
>> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
>> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> ---
>>  drivers/gpu/drm/drm_mipi_dbi.c  | 3 ---
>>  drivers/gpu/drm/tiny/hx8357d.c  | 2 ++
>>  drivers/gpu/drm/tiny/ili9225.c  | 2 ++
>>  drivers/gpu/drm/tiny/ili9341.c  | 2 ++
>>  drivers/gpu/drm/tiny/ili9486.c  | 2 ++
>>  drivers/gpu/drm/tiny/mi0283qt.c | 2 ++
>>  drivers/gpu/drm/tiny/st7586.c   | 2 ++
>>  drivers/gpu/drm/tiny/st7735r.c  | 2 ++
>>  8 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi=
_dbi.c
>> index 558baf989f5a..069603dfcd10 100644
>> --- a/drivers/gpu/drm/drm_mipi_dbi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
>> @@ -588,13 +588,10 @@ EXPORT_SYMBOL(mipi_dbi_dev_init);
>>   */
>>  void mipi_dbi_release(struct drm_device *drm)
>>  {
>> -	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(drm);
>> -
>>  	DRM_DEBUG_DRIVER("\n");
>> =20
>>  	drm_mode_config_cleanup(drm);
>>  	drm_dev_fini(drm);
>> -	kfree(dbidev);
>>  }
>>  EXPORT_SYMBOL(mipi_dbi_release);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8=
357d.c
>> index 9af8ff84974f..42bc5dadcb1c 100644
>> --- a/drivers/gpu/drm/tiny/hx8357d.c
>> +++ b/drivers/gpu/drm/tiny/hx8357d.c
>> @@ -21,6 +21,7 @@
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mipi_dbi.h>
>>  #include <drm/drm_modeset_helper.h>
>>  #include <video/mipi_display.h>
>> @@ -236,6 +237,7 @@ static int hx8357d_probe(struct spi_device *spi)
>>  		kfree(dbidev);
>>  		return ret;
>>  	}
>> +	drmm_add_final_kfree(drm, dbidev);
>=20
> I'd prefer something else than drmm_add_final_kfree().
>=20
> From what I understand, drmmadd_add_final_kfree() is required so that
> the device instance itself gets free. But wiring up garbage collection
> manually is easy to forget and a somewhat odd design. If we have to do
> that, there's little benefit over calling kfree in the release callback=
=2E
>=20
> Instead, could drivers rather be converted to drm_dev_alloc() where
> possible?
>=20
> For the other cases, could there be a dedicated allocator function that=

> invokes drmm_add_final_kfree()? Like that
>=20
>   void*
>   __drmm_kzalloc_dev(size_t size, size_t dev_off)
>   {
>       void *parent =3D kzalloc(size)
>=20
>       drm_device *dev =3D (parent + dev_off)
>=20
>       __drmm_add_final_kfree(dev, parent);
>=20
>       return parent;
>   }
>=20
>   /*
>    * takes the name of driver's device structure and the
>    * name of the drm device structure embedded within
>    */
>   drmm_kzalloc(parent_type, base)
>     (parent_type*)__drm_kzalloc_dev(sizeof(parent_type),
> 			offsetof(parent_type, base));

This is supposed to be a #define statement

>=20
> Best regards
> Thomas
>=20
>> =20
>>  	drm_mode_config_init(drm);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili=
9225.c
>> index 802fb8dde1b6..aae88dc5b3f7 100644
>> --- a/drivers/gpu/drm/tiny/ili9225.c
>> +++ b/drivers/gpu/drm/tiny/ili9225.c
>> @@ -24,6 +24,7 @@
>>  #include <drm/drm_fourcc.h>
>>  #include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mipi_dbi.h>
>>  #include <drm/drm_rect.h>
>> =20
>> @@ -387,6 +388,7 @@ static int ili9225_probe(struct spi_device *spi)
>>  		kfree(dbidev);
>>  		return ret;
>>  	}
>> +	drmm_add_final_kfree(drm, dbidev);
>> =20
>>  	drm_mode_config_init(drm);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili=
9341.c
>> index 33b51dc7faa8..7d40cb4ff72b 100644
>> --- a/drivers/gpu/drm/tiny/ili9341.c
>> +++ b/drivers/gpu/drm/tiny/ili9341.c
>> @@ -20,6 +20,7 @@
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mipi_dbi.h>
>>  #include <drm/drm_modeset_helper.h>
>>  #include <video/mipi_display.h>
>> @@ -194,6 +195,7 @@ static int ili9341_probe(struct spi_device *spi)
>>  		kfree(dbidev);
>>  		return ret;
>>  	}
>> +	drmm_add_final_kfree(drm, dbidev);
>> =20
>>  	drm_mode_config_init(drm);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili=
9486.c
>> index 5084b38c1a71..7d735fc67498 100644
>> --- a/drivers/gpu/drm/tiny/ili9486.c
>> +++ b/drivers/gpu/drm/tiny/ili9486.c
>> @@ -19,6 +19,7 @@
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mipi_dbi.h>
>>  #include <drm/drm_modeset_helper.h>
>> =20
>> @@ -208,6 +209,7 @@ static int ili9486_probe(struct spi_device *spi)
>>  		kfree(dbidev);
>>  		return ret;
>>  	}
>> +	drmm_add_final_kfree(drm, dbidev);
>> =20
>>  	drm_mode_config_init(drm);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi=
0283qt.c
>> index e2cfd9a17143..8555a56bce8c 100644
>> --- a/drivers/gpu/drm/tiny/mi0283qt.c
>> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
>> @@ -18,6 +18,7 @@
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mipi_dbi.h>
>>  #include <drm/drm_modeset_helper.h>
>>  #include <video/mipi_display.h>
>> @@ -198,6 +199,7 @@ static int mi0283qt_probe(struct spi_device *spi)
>>  		kfree(dbidev);
>>  		return ret;
>>  	}
>> +	drmm_add_final_kfree(drm, dbidev);
>> =20
>>  	drm_mode_config_init(drm);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st75=
86.c
>> index 9ef559dd3191..427c2561f5f4 100644
>> --- a/drivers/gpu/drm/tiny/st7586.c
>> +++ b/drivers/gpu/drm/tiny/st7586.c
>> @@ -21,6 +21,7 @@
>>  #include <drm/drm_format_helper.h>
>>  #include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mipi_dbi.h>
>>  #include <drm/drm_rect.h>
>> =20
>> @@ -328,6 +329,7 @@ static int st7586_probe(struct spi_device *spi)
>>  		kfree(dbidev);
>>  		return ret;
>>  	}
>> +	drmm_add_final_kfree(drm, dbidev);
>> =20
>>  	drm_mode_config_init(drm);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7=
735r.c
>> index 18b925df6e51..b447235c3d47 100644
>> --- a/drivers/gpu/drm/tiny/st7735r.c
>> +++ b/drivers/gpu/drm/tiny/st7735r.c
>> @@ -21,6 +21,7 @@
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mipi_dbi.h>
>> =20
>>  #define ST7735R_FRMCTR1		0xb1
>> @@ -209,6 +210,7 @@ static int st7735r_probe(struct spi_device *spi)
>>  		kfree(dbidev);
>>  		return ret;
>>  	}
>> +	drmm_add_final_kfree(drm, dbidev);
>> =20
>>  	drm_mode_config_init(drm);
>> =20
>>
>=20
>=20
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


--qW2Dy9AVefryHHJFZtj84pQjWswVUZTKO--

--cFO68nJCpMNQP38gtaamNrhlilM3KNeRD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5NLgIACgkQaA3BHVML
eiOgCAgAtF0Shc+AktyNgGbjjCwxzdT3BwIzSN1y98+5ggT1lsDp4jlKwr+RCXsz
nkyRqytsfU8quOzZxdG9XesZOjah2+lIhA02gDqCmf/dqtfXKV7WKfd7sqoRw6CD
A6YKe1E4vUSmKM51tJ5Hwxi/RuWkhtoH0I9mPBMMnO48X76Tx47X+Fy4YAp0uXda
9zCxNyZHguz1Rgcwjx0bVRE+Bq9m9HHyV2lZxwNU3hmd5mivh3uv17opMUrTA4Q8
LaV4tfUMbTBLvHyrwCqWANgAk2qmWOJvik0JKXKs3H7SeonbjkmkBv6YnAbuVGra
AtqGW4n25FLIffDDReMAF9xEIYxuzg==
=YWEI
-----END PGP SIGNATURE-----

--cFO68nJCpMNQP38gtaamNrhlilM3KNeRD--

--===============1596649332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1596649332==--
