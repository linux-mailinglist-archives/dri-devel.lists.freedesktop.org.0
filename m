Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13016BA8A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 08:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F686E9EF;
	Tue, 25 Feb 2020 07:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A398E6E9EF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 07:21:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB620AE3C;
 Tue, 25 Feb 2020 07:21:48 +0000 (UTC)
Subject: Re: [PATCH v2] drm/hisilicon: Fixed pcie resource conflict between
 drm and firmware
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1582524112-5628-1-git-send-email-tiantao6@hisilicon.com>
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
Message-ID: <a56bb7dd-a038-a219-54af-5f829b00f936@suse.de>
Date: Tue, 25 Feb 2020 08:21:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582524112-5628-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0686568480=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0686568480==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sNTCz6iMWuEeEnKXWwJKxAq1gE0lp69ta"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sNTCz6iMWuEeEnKXWwJKxAq1gE0lp69ta
Content-Type: multipart/mixed; boundary="29zXd6nu4MuRQxn3qbpBzJvLTMPqc18M6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <a56bb7dd-a038-a219-54af-5f829b00f936@suse.de>
Subject: Re: [PATCH v2] drm/hisilicon: Fixed pcie resource conflict between
 drm and firmware
References: <1582524112-5628-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1582524112-5628-1-git-send-email-tiantao6@hisilicon.com>

--29zXd6nu4MuRQxn3qbpBzJvLTMPqc18M6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.02.20 um 07:01 schrieb Tian Tao:
> use the drm_fb_helper_remove_conflicting_pci_framebuffer to remove
> the framebuffer initialized by fireware/bootloader to avoid resource
> conflict.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>=20
> ---
> v2: 	use the general API to remove the conflict resource instead of rol=
ling
> 	our own.

Nit: the patch's version info is usually a part of the commit messages.
It goes between the description and the Signed-off-by line.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 4a8a4cf..7518980 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -327,6 +327,11 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  	struct drm_device *dev;
>  	int ret;
> =20
> +	ret =3D drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
> +							"hibmcdrmfb");
> +	if (ret)
> +		return ret;
> +
>  	dev =3D drm_dev_alloc(&hibmc_driver, &pdev->dev);
>  	if (IS_ERR(dev)) {
>  		DRM_ERROR("failed to allocate drm_device\n");
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--29zXd6nu4MuRQxn3qbpBzJvLTMPqc18M6--

--sNTCz6iMWuEeEnKXWwJKxAq1gE0lp69ta
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5UywsACgkQaA3BHVML
eiPSEQgAh3FK+NW6XRP0xd2a35Hfj9hACFnZt2G1nYWFrMuNey3qg+4mw+0vVfLD
2q9Ji9D+nPtU4axZgnUHewB1r3fbmiyoiTI6x2MCrIhTBd5j/xXGNv4I1v3lO3df
+Y439tdI+nDVzjdIAJFsxuuXeJHWqc/VTnDkhvlzWdGvDp8Qfyb3J7euJKiczHPY
m5g4Kk3a5muHo559A7aWxD+HdNxmVPdoKt0OHI/VXca7jFugbW7A8v5DffVlcvc6
igwyrL4++uRt6u7efVCtO3hPZo7b4byo3arn6Q+hLgD/rNOD55py2/P3+nI3bh4F
jeNPQBWWSGRXfdWB2adPEpCGl4QkNw==
=q7D9
-----END PGP SIGNATURE-----

--sNTCz6iMWuEeEnKXWwJKxAq1gE0lp69ta--

--===============0686568480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0686568480==--
