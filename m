Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B4131257
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 13:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2F6E297;
	Mon,  6 Jan 2020 12:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCC06E297
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 12:55:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9BEBAF36;
 Mon,  6 Jan 2020 12:54:58 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon/hibmc: set obj[0] field when creating fb
To: Zhihui Chen <chenzhihui4@huawei.com>, xinliang.liu@linaro.org,
 zourongrong@gmail.com, dri-devel@lists.freedesktop.org
References: <20191223030846.967-1-chenzhihui4@huawei.com>
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
Message-ID: <0f133f3a-f778-9b67-9df7-92486b2ab462@suse.de>
Date: Mon, 6 Jan 2020 13:54:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191223030846.967-1-chenzhihui4@huawei.com>
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
Cc: puck.chen@hisilicon.com, kong.kongxinwei@hisilicon.com, baowenyi@huawei.com,
 allan.wang@siliconmotion.com
Content-Type: multipart/mixed; boundary="===============2043283453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2043283453==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IbD4iDvMYYRk2HsYg2tor8sifiWcJBlJi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IbD4iDvMYYRk2HsYg2tor8sifiWcJBlJi
Content-Type: multipart/mixed; boundary="FPD9k3D43AJ1nmStFuDZeNzBpxLWTsBuB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zhihui Chen <chenzhihui4@huawei.com>, xinliang.liu@linaro.org,
 zourongrong@gmail.com, dri-devel@lists.freedesktop.org
Cc: puck.chen@hisilicon.com, baowenyi@huawei.com,
 kong.kongxinwei@hisilicon.com, allan.wang@siliconmotion.com
Message-ID: <0f133f3a-f778-9b67-9df7-92486b2ab462@suse.de>
Subject: Re: [PATCH] drm/hisilicon/hibmc: set obj[0] field when creating fb
References: <20191223030846.967-1-chenzhihui4@huawei.com>
In-Reply-To: <20191223030846.967-1-chenzhihui4@huawei.com>

--FPD9k3D43AJ1nmStFuDZeNzBpxLWTsBuB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.12.19 um 04:08 schrieb Zhihui Chen:
> without the obj[0] set, we can see the following panic:
>=20
> [   29.236764] pstate: 20400009 (nzCv daif +PAN -UAO)
> [   29.241532] pc : drm_gem_vram_offset+0x10/0x28 [drm_vram_helper]
> [   29.247511] lr : hibmc_plane_atomic_update+0x30/0xe0 [hibmc_drm]
> [   29.253490] sp : ffff003fab713a50
> [   29.256789] x29: ffff003fab713a50 x28: 0000000000000028
> [   29.262077] x27: 0000000000000018 x26: 0000aaaaced52780
> [   29.267363] x25: ffff203f98dcde00 x24: 0000000000000001
> [   29.272650] x23: 0000000000000001 x22: 0000000000000000
> [   29.277937] x21: 0000000000000000 x20: ffff002fb4899580
> [   29.283224] x19: ffff003fb8767c00 x18: 0000000000000000
> [   29.288510] x17: 0000000000000000 x16: 0000000000000000
> [   29.293797] x15: 0000000000000010 x14: 332d4341443a3433
> [   29.299084] x13: 3a5245444f434e45 x12: 5b206e6f20746573
> [   29.304371] x11: 65646f6d205d7365 x10: 6c62617369645f74
> [   29.309657] x9 : ffff800008e4d650 x8 : ffff8000107241d0
> [   29.314944] x7 : 0000000000000000 x6 : ffff003fb8766400
> [   29.320231] x5 : ffff003fb8767c00 x4 : ffff800008e4f320
> [   29.325517] x3 : ffff002fb3ae5080 x2 : ffff002fb3ae0000
> [   29.330804] x1 : 0000000000000000 x0 : ffff002fb07f5c00
> [   29.336090] Call trace:
> [   29.338528]  drm_gem_vram_offset+0x10/0x28 [drm_vram_helper]
> [   29.344160]  drm_atomic_helper_commit_planes+0x144/0x228
> [   29.349447]  drm_atomic_helper_commit_tail+0x38/0x78
> [   29.354389]  commit_tail+0xb4/0x160
> [   29.357861]  drm_atomic_helper_commit+0x134/0x168
> [   29.362543]  drm_atomic_commit+0x50/0x60
> [   29.366448]  drm_mode_atomic_ioctl+0x724/0xb00
> [   29.370871]  drm_ioctl_kernel+0x98/0xe8
> [   29.374690]  drm_ioctl+0x26c/0x3d0
> [   29.378077]  do_vfs_ioctl+0xafc/0xbb0
> [   29.381722]  ksys_ioctl+0x64/0x98
> [   29.385022]  __arm64_sys_ioctl+0x24/0x50
> [   29.388929]  el0_svc_common.constprop.3+0xf0/0x158
> [   29.393697]  el0_svc_handler+0x68/0x80
> [   29.397429]  el0_sync_handler+0xa8/0x198
> [   29.401333]  el0_sync+0x140/0x180
> [   29.404632] ---[ end trace 4ba9406972d937dd ]---
> [   29.409245] Unexpected kernel BRK exception at EL1
>=20
> Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_ttm.c
> index 21b684eab5c9..19dc525a73b0 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -126,6 +126,7 @@ hibmc_framebuffer_init(struct drm_device *dev,
> =20
>  	drm_helper_mode_fill_fb_struct(dev, &hibmc_fb->fb, mode_cmd);
>  	hibmc_fb->obj =3D obj;
> +	hibmc_fb->fb.obj[0] =3D obj;
>  	ret =3D drm_framebuffer_init(dev, &hibmc_fb->fb, &hibmc_fb_funcs);
>  	if (ret) {
>  		DRM_ERROR("drm_framebuffer_init failed: %d\n", ret);
>=20

Thanks for the patch. I have meanwhile merged

	commit 3e10d2ffd245f996c36f87b0a8027a719e6135c3
	Author: Thomas Zimmermann <tzimmermann@suse.de>
	Date:   Tue Dec 3 09:38:16 2019 +0100

	    drm/hisilicon/hibmc: Replace struct hibmc_framebuffer with
		generic code

which replaces the code entirely.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--FPD9k3D43AJ1nmStFuDZeNzBpxLWTsBuB--

--IbD4iDvMYYRk2HsYg2tor8sifiWcJBlJi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4TLhgACgkQaA3BHVML
eiOLTQgAopk95NYrcZRxmjX63ci1Z7RwtoMxv+ltcqe3qJg9AdHF2Hx6LNrQ5bIz
bNtmkUlwvHUIfZijNZgSTUjLAAjUI0erx97cqe5T5y112upRuPg4MIaGda4ZBt1c
9LH3QojmlvcS9WRlfSBKO7t5N5QiXe4Hasg7stq7scsCHeWNwPV1yJT6W7yZS2tJ
KEHKTSeqsYmiZjZusAfiB06KUy6pnHz72WMf5XmLc/qH5gHFVmlHHuHh1ETuZeuo
5mybnqe23ZccbdpNW4mWAKjGSGoW95/GoMO9nKcLdzQWwg5rn6/5SXZsAYa+208x
hNZE/n2Qd1g9+gwJmyAiVa86yHPlbw==
=+2OR
-----END PGP SIGNATURE-----

--IbD4iDvMYYRk2HsYg2tor8sifiWcJBlJi--

--===============2043283453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2043283453==--
