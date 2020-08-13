Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91C2435AE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 10:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6A56E51C;
	Thu, 13 Aug 2020 08:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A06E51C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 08:03:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85F89AF82;
 Thu, 13 Aug 2020 08:03:44 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Fix build error of no type of module_init
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1597289955-27381-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5e7ed4d6-8961-bdd0-6698-47571066357a@suse.de>
Date: Thu, 13 Aug 2020 10:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597289955-27381-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1896444246=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1896444246==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PViowPfbaTjNTU6mKv6gbP9xhigU5xjHJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PViowPfbaTjNTU6mKv6gbP9xhigU5xjHJ
Content-Type: multipart/mixed; boundary="DZf0ynl3KQRcR4aueZHBhokv6F5d3B8Fx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <5e7ed4d6-8961-bdd0-6698-47571066357a@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fix build error of no type of module_init
References: <1597289955-27381-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1597289955-27381-1-git-send-email-tiantao6@hisilicon.com>

--DZf0ynl3KQRcR4aueZHBhokv6F5d3B8Fx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 05:39 schrieb Tian Tao:
> Add missing include to fix build error:
> hibmc_drm_drv.c:385:1: warning: data definition has no type or storage
> class [enabled by default]
> hibmc_drm_drv.c:385:1: error: type defaults to =E2=80=98int=E2=80=99 in=
 declaration
> of =E2=80=98module_init=E2=80=99 [-Werror=3Dimplicit-int]
> hibmc_drm_drv.c:385:1: warning: parameter names (without types) in func=
tion
> of =E2=80=98module_exit=E2=80=99 [-Werror=3Dimplicit-int]
> hibmc_drm_drv.c:385:292:1: warning: parameter names (without types) in
> function declaration [enabled by default]
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I pushed the patch to drm-misc-next, but forgot to add my R-b tag. If
anyone complains, it's my fault.

Best regards
Thomas

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 1ae360d..2b4f821 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -11,6 +11,7 @@
>   *	Jianhua Li <lijianhua@huawei.com>
>   */
> =20
> +#include <linux/module.h>
>  #include <linux/pci.h>
> =20
>  #include <drm/drm_atomic_helper.h>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--DZf0ynl3KQRcR4aueZHBhokv6F5d3B8Fx--

--PViowPfbaTjNTU6mKv6gbP9xhigU5xjHJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8088kUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNqzAgArHim/VrpwqUX42uX6B5W6rBex4/V
RoHBJMg8n9IEPDN5Bc8jtambx64LixZjCGPMIudkUCpcCuXr7NMPMAEz4/00btSu
b4MLSv6k0pZM1BoIsvaAqzetDYS3J/JFY4a53gEgWA3vMj18490rXuyqpt/wcr7N
lFiQfx0Qaf2uCI5/xBe0y0HIvRj/JXlTUeIAlsvKvDnnNq2ElSIqpe94BrR4qQEV
tpf2QLovX7emOFlPho0TVsQvVTlvbxykVnNIZxWSPwUy+os85gUJOxIH/YvI5mg4
QagqAlBDsIiZd5PcdEiF+O0VSvz2JRSjq4oaxWEh7YScArmvovGaeR6XAQ==
=7zSe
-----END PGP SIGNATURE-----

--PViowPfbaTjNTU6mKv6gbP9xhigU5xjHJ--

--===============1896444246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1896444246==--
