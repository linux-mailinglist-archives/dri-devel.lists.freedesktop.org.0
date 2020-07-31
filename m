Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85928234031
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044E66EA0E;
	Fri, 31 Jul 2020 07:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762BE6E094
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 07:36:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13C23AE17;
 Fri, 31 Jul 2020 07:37:05 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon 1/2] drm/hisilicon: Remove the unnecessary
 header files
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1596157521-49996-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <af9ed180-21dc-711b-1beb-04b35e4c7fb1@suse.de>
Date: Fri, 31 Jul 2020 09:36:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596157521-49996-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============2088362795=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2088362795==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bf8SP8wvhyZN5O7n5iD4Fce1VpPUABDzH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bf8SP8wvhyZN5O7n5iD4Fce1VpPUABDzH
Content-Type: multipart/mixed; boundary="H8T87kdNyTcGFKUjmSu9DpZsyLlEv4YgN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <af9ed180-21dc-711b-1beb-04b35e4c7fb1@suse.de>
Subject: Re: [PATCH drm/hisilicon 1/2] drm/hisilicon: Remove the unnecessary
 header files
References: <1596157521-49996-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1596157521-49996-1-git-send-email-tiantao6@hisilicon.com>

--H8T87kdNyTcGFKUjmSu9DpZsyLlEv4YgN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Am 31.07.20 um 03:05 schrieb Tian Tao:
> Remove some unused header files.

maybe say that you're removing the include statements. Because you're
not removing the actual header files. :)

Best regards
Thomas

>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 3 ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 5 -----
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 2 --
>  3 files changed, 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index cc70e83..66132eb 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -17,9 +17,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_vram_helper.h>
> -#include <drm/drm_plane_helper.h>
> -#include <drm/drm_print.h>
> -#include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> =20
>  #include "hibmc_drm_drv.h"
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index b8d839a..54f6144 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -11,18 +11,13 @@
>   *	Jianhua Li <lijianhua@huawei.com>
>   */
> =20
> -#include <linux/console.h>
> -#include <linux/module.h>
>  #include <linux/pci.h>
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
> -#include <drm/drm_print.h>
> -#include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> =20
>  #include "hibmc_drm_drv.h"
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 2ca69c3..ed12f61 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -11,10 +11,8 @@
>   *	Jianhua Li <lijianhua@huawei.com>
>   */
> =20
> -#include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_print.h>
> =20
>  #include "hibmc_drm_drv.h"
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--H8T87kdNyTcGFKUjmSu9DpZsyLlEv4YgN--

--bf8SP8wvhyZN5O7n5iD4Fce1VpPUABDzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8jyhAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM4Ggf6AvJtVsPiB5V81l1cAPicNVHxa5br
MEPOdArInz4RX3R3kLjESKq3zM3d9nBjPK9CwhGj1Ec5W8yBZBL062E7fnIENVkW
itwtN7Uq6lSM8BfvFskzu2hXskF/E7KJ9KfgClMxsjxbMMIauWzY2x3Z3Iv0tCwf
9/xBBXT0nfT40OzYqcJp2tZjyH4G/+rU5mTihIsudZ24yMcbExBiF13IaVjW6wpK
VtlV3DdsTD086/XxQ9hhJ7jLC2RVRien5zEArTwyCrujpE6OKz8bacnchVF2s6ho
vxHRM5xGnZG/Ys9SwUDJcbl77La8Uy1NlFsNhkL/oj36vsrmDU8A+TSzJw==
=4y/9
-----END PGP SIGNATURE-----

--bf8SP8wvhyZN5O7n5iD4Fce1VpPUABDzH--

--===============2088362795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2088362795==--
