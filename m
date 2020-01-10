Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54AA1368F1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 09:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B026E0C1;
	Fri, 10 Jan 2020 08:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4596E0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 08:28:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 337F7AFA7;
 Fri, 10 Jan 2020 08:28:12 +0000 (UTC)
Subject: Re: [PATCH -next] drm/mgag200: Fix typo in parameter description
To: Wei Yongjun <weiyongjun1@huawei.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kate Stewart <kstewart@linuxfoundation.org>
References: <20200110012523.33053-1-weiyongjun1@huawei.com>
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
Message-ID: <ce1a17c8-2af9-a449-16d5-36ddfd7a976e@suse.de>
Date: Fri, 10 Jan 2020 09:28:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110012523.33053-1-weiyongjun1@huawei.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1060382968=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1060382968==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr
Content-Type: multipart/mixed; boundary="pTTiHLHFEWOhHClrPak37aP8iw00UOEbU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wei Yongjun <weiyongjun1@huawei.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kate Stewart <kstewart@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-ID: <ce1a17c8-2af9-a449-16d5-36ddfd7a976e@suse.de>
Subject: Re: [PATCH -next] drm/mgag200: Fix typo in parameter description
References: <20200110012523.33053-1-weiyongjun1@huawei.com>
In-Reply-To: <20200110012523.33053-1-weiyongjun1@huawei.com>

--pTTiHLHFEWOhHClrPak37aP8iw00UOEbU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.01.20 um 02:25 schrieb Wei Yongjun:
> Fix typo in parameter description.

As Dan said, please mention that it's about a module parameter. The
current commit message appears to refer to a function's parameter.

With the commit message fixed, you can add

Reviewed-by: Thomas Zimemrmann <tzimmermann@suse.de>

Thanks for fixing this bug.

Best regards
Thomas

>=20
> Fixes: 3cacb2086e41 ("drm/mgag200: Add module parameter to pin all buff=
ers at offset 0")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mg=
ag200/mgag200_drv.c
> index 7a5bad2f57d7..2236f8ef20a4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -28,7 +28,7 @@ MODULE_PARM_DESC(modeset, "Disable/Enable modesetting=
");
>  module_param_named(modeset, mgag200_modeset, int, 0400);
> =20
>  int mgag200_hw_bug_no_startadd =3D -1;
> -MODULE_PARM_DESC(modeset, "HW does not interpret scanout-buffer start =
address correctly");
> +MODULE_PARM_DESC(hw_bug_no_startadd, "HW does not interpret scanout-bu=
ffer start address correctly");
>  module_param_named(hw_bug_no_startadd, mgag200_hw_bug_no_startadd, int=
, 0400);
> =20
>  static struct drm_driver driver;
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--pTTiHLHFEWOhHClrPak37aP8iw00UOEbU--

--iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4YNZsACgkQaA3BHVML
eiM+UQf+J92/hICo707Qje0Q7uVRT1riV5XCPhxBuOUCzDNPRDH15zvvJdL9HbJ0
KG4QGNjuVTGJbndQiglQZXl2pNPOA+zoG7JZAq5x1E7ICGmussuxx3UtLIYY6dak
kyosKHWwu5rzgT2iCPvxbuk1+RNrTrAhj3w+ZfGzD1AX08dJr8Ks2jVgPf55lGzc
u7Of3a6qfJ5OGjYRf4CCMKG8yEKTa/oXQGdSCECmZhlBw1KJQppFt9ME0oj5v7r3
eS3SFcK7TRrD3dAOBizkSZMGpVlmlJscSRmlqy1j3uwfkaPcAEBczStm6ajqSNBO
XMhUrIhoiDfRiKgtaZufX598XDFXIA==
=Gnga
-----END PGP SIGNATURE-----

--iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr--

--===============1060382968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1060382968==--
