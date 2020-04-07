Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDBA1A0E0F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 15:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56456E86B;
	Tue,  7 Apr 2020 13:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81A36E86B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 13:01:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44F43AD81;
 Tue,  7 Apr 2020 13:01:00 +0000 (UTC)
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>
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
Message-ID: <eedb5061-56b5-d8c8-6cfa-0ead5e65aaff@suse.de>
Date: Tue, 7 Apr 2020 15:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0440046582=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0440046582==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tghXWcAwnLpmawJjqh4sw5FmS3zah6XSR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tghXWcAwnLpmawJjqh4sw5FmS3zah6XSR
Content-Type: multipart/mixed; boundary="dFAxpnjEN2gClbIjvXwfrVFTxFqsJP6YG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <eedb5061-56b5-d8c8-6cfa-0ead5e65aaff@suse.de>
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>
In-Reply-To: <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>

--dFAxpnjEN2gClbIjvXwfrVFTxFqsJP6YG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Noralf

Am 07.04.20 um 13:02 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 06.04.2020 15.43, skrev Thomas Zimmermann:
>> Generic fbdev emulation is a DRM client. If possible, it should behave=

>> like userspace clients. Therefore it should not run before the driver
>> registered the new DRM device. If the setup function fails, the driver=

>> should not report an error.
>>
>> This is a follow-up patchset to the discussion at [1].  I went
>> through all calls to drm_fbdev_generic_setup(), moved them to the
>> final operation of their driver's probe function, and removed the
>> return value.
>>
>> Built-tested on x86-64, aarch64 and arm.
>>
>> [1] https://lore.kernel.org/dri-devel/20200403135828.2542770-1-daniel.=
vetter@ffwll.ch/T/#m216b5b37aeeb7b28d55ad73b7a702b3d1d7bf867
>>
>=20
> Thanks for doing this, series is:
>=20
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>=20
> With so many drivers using generic fbdev I wondered if we could make it=

> the default and let DRM core handle it (would pull drm_fb_helper into
> drm.ko).
>=20
> Something like this at the end of drm_dev_register():
>=20
> if (!dev->fb_helper)
> 	drm_fbdev_generic_setup(dev, 0);
>=20
> AFAICS all drivers that don't use generic fbdev, do fbdev setup before
> calling drm_dev_register() except msm so that would need some
> adjustment, calling drm_fb_helper_init() before drm_dev_register() woul=
d do.
>=20
> One missing piece is for drivers (like vc4) that uses 16 bpp on fbdev t=
o
> save on memory, not sure how that should be handled, an optional
> drm_mode_config->fbdev_bpp maybe.
>=20
> Having DRM core take care of fbdev emulation was an idea Laurent had
> which was the spark that set me off making the generic fbdev emulation.=

>=20
> Maybe it's still too early to make this move, I don't know.

I think we should wait a bit. As you mentioned, there are drivers that
have an fbdev bpp that differs from the preferred one. There might also
be a chicken-and-egg problem with core and fb-helper modules.

Additionally, we should think about possible other in-kernel clients
(e.g., the bootsplash) and how they would interact with such defaults.

At some later point, we could introduce an interface that sets up all
available in-kernel clients.

Best regards
Thomas

>=20
> Noralf.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dFAxpnjEN2gClbIjvXwfrVFTxFqsJP6YG--

--tghXWcAwnLpmawJjqh4sw5FmS3zah6XSR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6MeYcACgkQaA3BHVML
eiPRAgf9E3rFr+awD0Y3BvBbCHBe2DKyObxAKEMgKm48bzZxRZWQgEKbPzwszybg
C3i69aPzwWyqN876V1g6oXiMO4QcITmfqoZzwVC4PzFlV808b6tisXZR1JCEmvnL
23RVcbcTAZUW5q+XXia9KOed3ihJv+NmLx+/8E789orzRjZ//LSuUqKM/P2cY/2e
i0vnoplfQNt01o/xvWl+besV7aicvtrO1akk/+GdzZa5EXcfYisLWbOXslCaEqgH
BpfC+YbrFKK10iadltgKRIB7iKxoEL+yJD3iZ0MuSFmJYbZdv74yxEJr/HYIOd8U
OYys7NXfplvCh35+h6LIO6Qbzmh8Aw==
=lrKH
-----END PGP SIGNATURE-----

--tghXWcAwnLpmawJjqh4sw5FmS3zah6XSR--

--===============0440046582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0440046582==--
