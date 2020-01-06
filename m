Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73F130F42
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 10:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8FA6E204;
	Mon,  6 Jan 2020 09:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C196E204
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 09:11:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4DF7FAD00;
 Mon,  6 Jan 2020 09:11:53 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Checked the resolution is valid before
 connector
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
References: <1577494764-28381-1-git-send-email-tiantao6@hisilicon.com>
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
Message-ID: <c5772f0d-2741-131f-4086-67206c66c994@suse.de>
Date: Mon, 6 Jan 2020 10:11:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1577494764-28381-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============0954441501=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0954441501==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jcwaaVT5gt1ZiPVhb62b5F7SKMqJQ48K1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jcwaaVT5gt1ZiPVhb62b5F7SKMqJQ48K1
Content-Type: multipart/mixed; boundary="WYY8RS4swH90C5mD4WJWKllPPGwD1EoC1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
Cc: linuxarm@huawei.com
Message-ID: <c5772f0d-2741-131f-4086-67206c66c994@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Checked the resolution is valid before
 connector
References: <1577494764-28381-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1577494764-28381-1-git-send-email-tiantao6@hisilicon.com>

--WYY8RS4swH90C5mD4WJWKllPPGwD1EoC1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.12.19 um 01:59 schrieb Tian Tao:
> In the previous version, the callback function mode_valid of
> drm_connector_helper_funcs directly returned MODE_OK. Now we will
> ensure that the resolution is correct and return MODE_OK, otherwise
> return MODE_NOMODE.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 41 ++++++++++++++++=
++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 6d98fdc..3d08210 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -11,22 +11,59 @@
>   *	Jianhua Li <lijianhua@huawei.com>
>   */
> =20
> +#include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_print.h>
> =20
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
> =20
> +static const struct hibmc_resolution {
> +	int w;
> +	int h;
> +} hibmc_modetables[] =3D {
> +	{640, 480}, {800, 600}, {1024, 768}, {1152, 864}, {1280, 768},
> +	{1280, 720}, {1280, 960}, {1280, 1024}, {1440, 900}, {1600, 900},
> +	{1600, 1200}, {1920, 1080}, {1920, 1200}
> +};

There's already a mode table for PLL programming in hibmc_drm_de.c.
Rather than duplicating the information, maybe make the existing table
available for the mode-checking code.

> +
> +static int hibmc_valid_mode(int w, int h)
> +{
> +	int size =3D sizeof(hibmc_modetables) / sizeof(struct hibmc_resolutio=
n);
> +	int i;
> +
> +	for (i =3D 0; i < size; i++) {
> +		if (hibmc_modetables[i].w =3D=3D w && hibmc_modetables[i].h =3D=3D h=
)
> +			return 0;
> +	}
> +
> +	return -1;
> +}
> +
>  static int hibmc_connector_get_modes(struct drm_connector *connector)
>  {
> -	return drm_add_modes_noedid(connector, 800, 600);
> +	int count;
> +
> +	drm_connector_update_edid_property(connector, NULL);
> +	count =3D drm_add_modes_noedid(connector, 1920, 1200);
> +	drm_set_preferred_mode(connector, 1024, 768);
> +
> +	return count;
>  }
> =20
>  static enum drm_mode_status hibmc_connector_mode_valid(struct drm_conn=
ector *connector,
>  				      struct drm_display_mode *mode)
>  {
> -	return MODE_OK;
> +	int vrefresh =3D drm_mode_vrefresh(mode);
> +
> +	if (vrefresh < 59 || vrefresh > 61)
> +		return MODE_NOMODE;
> +	else if (hibmc_valid_mode(mode->hdisplay, mode->vdisplay) !=3D 0)

I'd rather drop hibmc_valid_mode() from the patch and do its tests right
here.

More generally speaking, are these tests really related to the
connector? Both, refresh and resolution are limits of the CRTC. I think
they should be validated in the CRTC code.

Best regards
Thomas

> +		return MODE_NOMODE;
> +	else
> +		return MODE_OK;
>  }
> =20
>  static const struct drm_connector_helper_funcs
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WYY8RS4swH90C5mD4WJWKllPPGwD1EoC1--

--jcwaaVT5gt1ZiPVhb62b5F7SKMqJQ48K1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4S+dYACgkQaA3BHVML
eiP69Af/eoV45cNF3lUHsmrQD7zkILe02SuE6szgoyV0TMEGs5FHWdjmlqneu6Hn
0eN+rQ02j75sOOcGgwRwBnd0EkEoR/nwmolfd7T5wgBUBP2jqyB3easkUx7/wmbF
Anla/JdAUk57vWymH0vTrrLXQV/91htaQane/t+e7xuYf3EoOE7khDVH4NYYT7Xs
jg/6JOQYdHVHpooC5tfR6cfVj7J8Ff9uxK1bxQdpoxtOUJz5IJscrTly5SOTlTx9
CR7UW1ENj3PZxll4s1hofc/Ovz166G7BvNG8JWnS+ZtMzbgyC4LViJu4DFp3ntY1
D29tCR2KSU0gIubNhSHpB5PrOZd0ZA==
=2Tvv
-----END PGP SIGNATURE-----

--jcwaaVT5gt1ZiPVhb62b5F7SKMqJQ48K1--

--===============0954441501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0954441501==--
